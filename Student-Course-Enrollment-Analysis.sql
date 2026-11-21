-- Questions
-- 1.List all students
show Databases;
use student_management_system;
select  name from student;
-- 2.Show all courses
select course_name from Course;
-- 3.Students enrolled in "Database Systems"
SELECT
    s.student_id,
    s.name,
    c.course_name
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id
WHERE c.course_name = 'Database System';
-- 4. Count total students enrolled in each course
SELECT
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM course c
LEFT JOIN enrollment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
-- 5 . Display exam marks with student & course
SELECT
    s.name,
    c.course_name,
    r.marks,
    r.grade
FROM student s
JOIN exams ex
    ON s.student_id = ex.student_id
JOIN course c
    ON ex.course_id = c.course_id
JOIN results r
    ON ex.exam_id = r.exam_id;
-- 6. Highest scoring student
SELECT
    s.name,
    c.course_name,
    r.marks
FROM student s
JOIN exams ex
    ON s.student_id = ex.student_id
JOIN course c
    ON ex.course_id = c.course_id
JOIN results r
    ON ex.exam_id = r.exam_id
ORDER BY r.marks DESC
LIMIT 1;
-- 7 . Students not enrolled in any course
SELECT
    s.student_id,
    s.name
FROM student s
LEFT JOIN enrollment e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
-- 8.Courses with no exams conducted
SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM course c
JOIN exams ex
    ON c.course_id = ex.course_id
JOIN results r
    ON ex.exam_id = r.exam_id
GROUP BY c.course_id, c.course_name;
-- 9.Average marks per course
SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM course c
JOIN exams ex
    ON c.course_id = ex.course_id
JOIN results r
    ON ex.exam_id = r.exam_id
GROUP BY c.course_id, c.course_name;
-- 10.List exams conducted in February
SELECT
    exam_id,
    student_id,
    course_id,
    exam_date
FROM exams
WHERE MONTH(exam_date) = 2;
-- 11.Convert marks → auto grade
SELECT
    exam_id,
    student_id,
    course_id,
    exam_date
FROM exams
WHERE MONTH(exam_date) = 2;
-- 12 Show student with most enrollments
SELECT
    s.student_id,
    s.name,
    COUNT(e.course_id) AS total_enrollments
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
ORDER BY total_enrollments DESC
LIMIT 1;


