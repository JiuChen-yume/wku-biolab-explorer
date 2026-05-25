-- Run this once if the database was created before the security update.
-- It keeps existing students and quiz attempts, but expands password storage
-- for bcrypt hashes and adds the quiz_type column used by the API.

ALTER TABLE students
  MODIFY password_hash VARCHAR(255) NOT NULL;

ALTER TABLE quiz_attempts
  ADD COLUMN quiz_type VARCHAR(50) NOT NULL DEFAULT 'general' AFTER student_id;
