-- STUDENT MANAGEMENT SYSTEM
-- 1. Create Database
CREATE DATABASE IF NOT EXISTS Student_management_system;
USE Student_management_system;
-- 2. Remove Existing Tables
-- Drop child tables before parent tables
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS exams;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;
-- 3. Create Student Table
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10)
);
-- 4. Create Course Table
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);
-- 5. Create Enrollment Table
CREATE TABLE enrollment (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    UNIQUE(student_id, course_id),
    FOREIGN KEY(student_id)
    REFERENCES student(student_id),
    FOREIGN KEY(course_id)
    REFERENCES course(course_id)
);
-- 6. Create Exams Table
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    exam_date DATE,
    FOREIGN KEY(student_id)
    REFERENCES student(student_id),
    FOREIGN KEY(course_id)
    REFERENCES course(course_id)
);
-- 7. Create Results Table
CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT UNIQUE,
    marks INT,
    grade CHAR(2),
    FOREIGN KEY(exam_id)
    REFERENCES exams(exam_id)
);
-- INSERT VALUES
-- 8. Insert Student Records
INSERT INTO student (name, age, gender)
VALUES
('Arjun', 20, 'Male'),
('Amrutha', 21, 'Female'),
('Ravi', 22, 'Male'),
('Divya', 20, 'Female');
-- 9. Insert Course Records
INSERT INTO course (course_name, credits)
VALUES
('Database System', 4),
('Python Programming', 3),
('Statistics', 4),
('Machine Learning', 5);
-- 10. Insert Enrollment Records
INSERT INTO enrollment
(student_id, course_id, enroll_date)
VALUES
(1, 1, '2026-02-02'),
(2, 2, '2025-11-13'),
(3, 3, '2024-12-06'),
(4, 4, '2025-08-18');
-- 11. Insert Exam Records
INSERT INTO exams
(student_id, course_id, exam_date)
VALUES
(1, 1, '2026-02-20'),
(1, 2, '2026-02-21'),
(2, 1, '2026-02-20'),
(4, 4, '2026-02-25');
-- 12. Insert Result Records
INSERT INTO results (exam_id, marks, grade)
VALUES
(1, 85, 'A'),
(2, 78, 'B'),
(3, 92, 'A'),
(4, 65, 'C');
-- DISPLAY ALL TABLES
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM exams;
SELECT * FROM results;
-- CHECK TOTAL RECORDS
SELECT COUNT(*) AS total_students FROM student;
SELECT COUNT(*) AS total_courses FROM course;
SELECT COUNT(*) AS total_enrollments FROM enrollment;
SELECT COUNT(*) AS total_exams FROM exams;
SELECT COUNT(*) AS total_results FROM results;

