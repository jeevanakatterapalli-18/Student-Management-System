# 🎓 Student Management System & Course Enrollment Analysis

A MySQL project that models a simple student management system (students, courses, enrollments, exams and results) and answers common analytical questions using SQL joins, aggregations and filters.

---

## 📌 Project Overview

This project has two parts:

1. **Database design & data loading** – creates a relational schema and populates it with sample data.
2. **Analysis queries** – 12 SQL questions covering enrollments, exam performance and course statistics.

---

## 📂 Repository Structure

```
.
├── Student_Management_System.sql           # Schema creation + sample data
├── Student-Course-Enrollment-Analysis.sql  # Analysis queries (Q1 – Q12)
└── README.md
```

---

## 🗄️ Database Schema

**Database name:** `Student_management_system`

| Table        | Description                              | Key Columns                                                     |
|--------------|------------------------------------------|-----------------------------------------------------------------|
| `student`    | Student details                          | `student_id` (PK), `name`, `age`, `gender`                      |
| `course`     | Course catalogue                         | `course_id` (PK), `course_name`, `credits`                      |
| `enrollment` | Which student is enrolled in which course| `enroll_id` (PK), `student_id` (FK), `course_id` (FK), `enroll_date` |
| `exams`      | Exams taken by students                  | `exam_id` (PK), `student_id` (FK), `course_id` (FK), `exam_date`|
| `results`    | Marks and grade for each exam            | `result_id` (PK), `exam_id` (FK, unique), `marks`, `grade`      |

### Relationships

```
student ──< enrollment >── course
   │                          │
   └────────< exams >─────────┘
                │
                └── results (1 : 1)
```

- A student can enroll in many courses; a course can have many students (`UNIQUE(student_id, course_id)` prevents duplicate enrollments).
- Each exam belongs to one student and one course.
- Each exam has at most one result (`exam_id` is `UNIQUE` in `results`).

---

## 🧪 Sample Data

- **4 students:** Arjun, Amrutha, Ravi, Divya
- **4 courses:** Database System, Python Programming, Statistics, Machine Learning
- **4 enrollments, 4 exams, 4 results**

---

## 🚀 Getting Started

### Prerequisites
- MySQL 8.0+ (or MariaDB)
- MySQL Workbench, DBeaver, or the MySQL command-line client

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/<your-repo-name>.git
   cd <your-repo-name>
   ```

2. Create the database, tables and sample data:
   ```bash
   mysql -u root -p < Student_Management_System.sql
   ```

3. Run the analysis queries:
   ```bash
   mysql -u root -p < Student-Course-Enrollment-Analysis.sql
   ```

> ⚠️ `Student_Management_System.sql` drops and recreates all tables, so running it again resets the data.

---

## 🔍 Analysis Questions

| #  | Question                                          | SQL Concepts Used                  |
|----|---------------------------------------------------|------------------------------------|
| 1  | List all students                                 | `SELECT`                           |
| 2  | Show all courses                                  | `SELECT`                           |
| 3  | Students enrolled in "Database System"            | `JOIN`, `WHERE`                    |
| 4  | Total students enrolled in each course            | `LEFT JOIN`, `COUNT`, `GROUP BY`   |
| 5  | Exam marks with student & course                  | Multi-table `JOIN`                 |
| 6  | Highest scoring student                           | `ORDER BY`, `LIMIT`                |
| 7  | Students not enrolled in any course               | `LEFT JOIN`, `IS NULL`             |
| 8  | Courses with no exams conducted                   | Exam / result joins                |
| 9  | Average marks per course                          | `AVG`, `GROUP BY`                  |
| 10 | Exams conducted in February                       | `MONTH()`                          |
| 11 | Convert marks → auto grade                        | Grade logic on marks               |
| 12 | Student with the most enrollments                 | `COUNT`, `GROUP BY`, `LIMIT`       |

### Example Query – Average Marks per Course

```sql
SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM course c
JOIN exams ex
    ON c.course_id = ex.course_id
JOIN results r
    ON ex.exam_id = r.exam_id
GROUP BY c.course_id, c.course_name;
```

**Output**

| course_name        | average_marks |
|--------------------|---------------|
| Database System    | 88.5          |
| Python Programming | 78.0          |
| Machine Learning   | 65.0          |

### Example Query – Highest Scoring Student

```sql
SELECT s.name, c.course_name, r.marks
FROM student s
JOIN exams ex ON s.student_id = ex.student_id
JOIN course c ON ex.course_id = c.course_id
JOIN results r ON ex.exam_id = r.exam_id
ORDER BY r.marks DESC
LIMIT 1;
```

**Output:** Amrutha – Database System – 92

---

## 🛠️ Skills Demonstrated

- Relational database design (primary keys, foreign keys, unique constraints)
- `INNER JOIN` and `LEFT JOIN` across multiple tables
- Aggregate functions (`COUNT`, `AVG`) with `GROUP BY`
- Sorting and limiting results
- Date functions (`MONTH()`)
- Handling missing relationships with `IS NULL`

---

## 🔮 Possible Improvements

- Add more sample data for richer analysis
- Use window functions (`RANK()`, `DENSE_RANK()`) for rankings
- Add `CASE WHEN` logic to derive grades automatically from marks
- Create views for frequently used reports
- Add indexes for faster joins on larger datasets

---

## 👤 Author

**Jeevana Jyothi Katterapalli**
GitHub: https://github.com/jeevanakatterapalli-18

