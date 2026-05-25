import express from 'express';
import dotenv from 'dotenv';
import mysql from 'mysql2/promise';
import crypto from 'crypto';

dotenv.config();

const app = express();
const port = Number(process.env.API_PORT || 8787);

const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'wku_biolab',
  waitForConnections: true,
  connectionLimit: 10
});

app.use(express.json());

const sha256 = (value: string) => crypto.createHash('sha256').update(value).digest('hex');

app.get('/api/health', async (_req, res) => {
  try {
    await pool.query('SELECT 1');
    res.json({ ok: true });
  } catch (error) {
    res.status(500).json({ ok: false, message: 'Database unavailable' });
  }
});

app.post('/api/register', async (req, res) => {
  const { studentNumber, name, password } = req.body ?? {};

  if (!studentNumber || !name || !password) {
    return res.status(400).json({ message: 'Student number, name, and password are required.' });
  }

  if (String(password).length < 6) {
    return res.status(400).json({ message: 'Password must be at least 6 characters.' });
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

    const [result] = await pool.query(
      'INSERT INTO students (student_number, name, password_hash) VALUES (?, ?, ?)',
      [studentNumber, name, sha256(password)]
    );

    const studentId = (result as mysql.ResultSetHeader).insertId;

    res.status(201).json({
      student: {
        id: studentId,
        studentNumber,
        name
      }
    });
  } catch (error) {
  console.error('Register error:', error);
  res.status(500).json({
    message: 'Unable to register student.',
    error: error instanceof Error ? error.message : String(error)
  });
}
});

app.post('/api/login', async (req, res) => {
  const { studentNumber, password } = req.body ?? {};

  if (!studentNumber || !password) {
    return res.status(400).json({ message: 'Student number and password are required.' });
  }

  const [rows] = await pool.query(
    'SELECT id, student_number AS studentNumber, name, password_hash AS passwordHash FROM students WHERE student_number = ? LIMIT 1',
    [studentNumber]
  );

  const student = Array.isArray(rows) ? rows[0] as any : undefined;
  if (!student || student.passwordHash !== sha256(password)) {
    return res.status(401).json({ message: 'Invalid credentials.' });
  }

  res.json({
    student: {
      id: student.id,
      studentNumber: student.studentNumber,
      name: student.name
    }
  });
});

app.get('/api/students/:studentId/attempts', async (req, res) => {
  const studentId = Number(req.params.studentId);

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

app.post('/api/quiz-attempts', async (req, res) => {
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

  const connection = await pool.getConnection();

  try {
    await connection.beginTransaction();

    const [attemptResult] = await connection.query(
      'INSERT INTO quiz_attempts (student_id, quiz_type, score, total_questions) VALUES (?, ?, ?, ?)',
      [studentId, quizType, score, totalQuestions]
    );

    const attemptId = (attemptResult as mysql.ResultSetHeader).insertId;

    for (const answer of answers) {
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
