import express from 'express';
import dotenv from 'dotenv';
import mysql from 'mysql2/promise';
import crypto from 'crypto';
import bcrypt from 'bcryptjs';
import helmet from 'helmet';
import jwt from 'jsonwebtoken';
import rateLimit from 'express-rate-limit';

dotenv.config();

const app = express();
const port = Number(process.env.API_PORT || 8787);
const jwtSecret = process.env.JWT_SECRET || 'dev-only-change-this-secret';
const isProduction = process.env.NODE_ENV === 'production';

const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'wku_biolab',
  waitForConnections: true,
  connectionLimit: 10
});

app.disable('x-powered-by');
app.use(helmet());
app.use(express.json({ limit: '20kb' }));

const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  limit: 20,
  standardHeaders: true,
  legacyHeaders: false,
  message: { message: 'Too many login attempts. Please try again later.' }
});

const apiLimiter = rateLimit({
  windowMs: 60 * 1000,
  limit: 120,
  standardHeaders: true,
  legacyHeaders: false
});

app.use('/api', apiLimiter);

type AuthenticatedRequest = express.Request & {
  user?: {
    studentId: number;
    studentNumber: string;
  };
};

const sha256 = (value: string) => crypto.createHash('sha256').update(value).digest('hex');
const isLegacySha256Hash = (value: string) => /^[a-f0-9]{64}$/i.test(value);
const normalizeInput = (value: unknown) => String(value ?? '').trim();
const isValidStudentNumber = (value: string) => /^[A-Za-z0-9_-]{3,30}$/.test(value);

const signToken = (student: { id: number; studentNumber: string }) =>
  jwt.sign(
    { studentId: student.id, studentNumber: student.studentNumber },
    jwtSecret,
    { expiresIn: '2h' }
  );

const requireAuth = (req: AuthenticatedRequest, res: express.Response, next: express.NextFunction) => {
  const authHeader = req.header('Authorization') || '';
  const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : '';

  if (!token) {
    return res.status(401).json({ message: 'Authentication required.' });
  }

  try {
    const payload = jwt.verify(token, jwtSecret) as { studentId: number; studentNumber: string };
    req.user = {
      studentId: Number(payload.studentId),
      studentNumber: payload.studentNumber
    };
    next();
  } catch {
    res.status(401).json({ message: 'Invalid or expired token.' });
  }
};

if (isProduction && jwtSecret === 'dev-only-change-this-secret') {
  throw new Error('JWT_SECRET must be set in production.');
}

app.get('/api/health', async (_req, res) => {
  try {
    await pool.query('SELECT 1');
    res.json({ ok: true });
  } catch (error) {
    res.status(500).json({ ok: false, message: 'Database unavailable' });
  }
});

app.post('/api/register', authLimiter, async (req, res) => {
  const studentNumber = normalizeInput(req.body?.studentNumber);
  const name = normalizeInput(req.body?.name);
  const password = String(req.body?.password ?? '');

  if (!studentNumber || !name || !password) {
    return res.status(400).json({ message: 'Student number, name, and password are required.' });
  }

  if (!isValidStudentNumber(studentNumber)) {
    return res.status(400).json({ message: 'Student number can only contain letters, numbers, underscores, and hyphens.' });
  }

  if (name.length > 100) {
    return res.status(400).json({ message: 'Name is too long.' });
  }

  if (password.length < 8 || password.length > 128) {
    return res.status(400).json({ message: 'Password must be 8 to 128 characters.' });
  }

  try {
    const [existingRows] = await pool.query(
      'SELECT id FROM students WHERE student_number = ? LIMIT 1',
      [studentNumber]
    );

    const existingStudent = Array.isArray(existingRows) ? existingRows[0] : undefined;

    if (existingStudent) {
      return res.status(409).json({ message: 'This student number is already registered.' });
    }

    const passwordHash = await bcrypt.hash(password, 12);

    const [result] = await pool.query(
      'INSERT INTO students (student_number, name, password_hash) VALUES (?, ?, ?)',
      [studentNumber, name, passwordHash]
    );

    const studentId = (result as mysql.ResultSetHeader).insertId;
    const student = {
      id: studentId,
      studentNumber,
      name
    };

    res.status(201).json({
      student,
      token: signToken(student)
    });
  } catch (error) {
  console.error('Register error:', error);
  res.status(500).json({
    message: 'Unable to register student.',
    error: error instanceof Error ? error.message : String(error)
  });
}
});

app.post('/api/login', authLimiter, async (req, res) => {
  const studentNumber = normalizeInput(req.body?.studentNumber);
  const password = String(req.body?.password ?? '');

  if (!studentNumber || !password) {
    return res.status(400).json({ message: 'Student number and password are required.' });
  }

  if (!isValidStudentNumber(studentNumber)) {
    return res.status(400).json({ message: 'Invalid student number format.' });
  }

  const [rows] = await pool.query(
    'SELECT id, student_number AS studentNumber, name, password_hash AS passwordHash FROM students WHERE student_number = ? LIMIT 1',
    [studentNumber]
  );

  const student = Array.isArray(rows) ? rows[0] as any : undefined;
  const passwordMatches = student
    ? isLegacySha256Hash(student.passwordHash)
      ? student.passwordHash === sha256(password)
      : await bcrypt.compare(password, student.passwordHash)
    : false;

  if (!student || !passwordMatches) {
    return res.status(401).json({ message: 'Invalid credentials.' });
  }

  if (isLegacySha256Hash(student.passwordHash)) {
    await pool.query(
      'UPDATE students SET password_hash = ? WHERE id = ?',
      [await bcrypt.hash(password, 12), student.id]
    );
  }

  const safeStudent = {
    id: student.id,
    studentNumber: student.studentNumber,
    name: student.name
  };

  res.json({
    student: safeStudent,
    token: signToken(safeStudent)
  });
});

app.get('/api/students/:studentId/attempts', requireAuth, async (req: AuthenticatedRequest, res) => {
  const studentId = Number(req.params.studentId);

  if (!req.user || studentId !== req.user.studentId) {
    return res.status(403).json({ message: 'You can only access your own quiz attempts.' });
  }

  const [rows] = await pool.query(
    `SELECT 
       id,
       quiz_type AS quizType,
       score,
       total_questions AS totalQuestions,
       submitted_at AS submittedAt
     FROM quiz_attempts
     WHERE student_id = ?
     ORDER BY submitted_at DESC
     LIMIT 20`,
    [studentId]
  );

  res.json({ attempts: rows });
});

app.post('/api/quiz-attempts', requireAuth, async (req: AuthenticatedRequest, res) => {
  const { studentId, quizType, score, totalQuestions, answers } = req.body ?? {};

  if (
    !studentId ||
    !quizType ||
    typeof score !== 'number' ||
    typeof totalQuestions !== 'number' ||
    !Array.isArray(answers)
  ) {
    return res.status(400).json({ message: 'Invalid quiz attempt payload.' });
  }

  if (!req.user || Number(studentId) !== req.user.studentId) {
    return res.status(403).json({ message: 'You can only save quiz attempts for your own account.' });
  }

  if (score < 0 || score > totalQuestions || totalQuestions < 1 || totalQuestions > 100) {
    return res.status(400).json({ message: 'Invalid score.' });
  }

  const connection = await pool.getConnection();

  try {
    await connection.beginTransaction();

    const [attemptResult] = await connection.query(
      'INSERT INTO quiz_attempts (student_id, quiz_type, score, total_questions) VALUES (?, ?, ?, ?)',
      [studentId, quizType, score, totalQuestions]
    );

    const attemptId = (attemptResult as mysql.ResultSetHeader).insertId;

    for (const answer of answers) {
      if (
        !answer?.questionId ||
        typeof answer.selectedAnswer !== 'number' ||
        typeof answer.isCorrect !== 'boolean'
      ) {
        throw new Error('Invalid answer payload.');
      }

      await connection.query(
        `INSERT INTO quiz_answers
         (attempt_id, question_id, selected_answer, is_correct)
         VALUES (?, ?, ?, ?)`,
        [attemptId, answer.questionId, answer.selectedAnswer, answer.isCorrect]
      );
    }

    await connection.commit();
    res.status(201).json({ attemptId });
  } catch (error) {
    await connection.rollback();
    console.error('Quiz save error:', error);
    res.status(500).json({ message: 'Unable to save quiz attempt.' });
  } finally {
    connection.release();
  }
});

app.listen(port, () => {
  console.log(`Quiz API listening on http://localhost:${port}`);
});
