
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;


CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);


INSERT INTO students (id, name) VALUES
(1, 'Alice'),
(2, 'Tono'),
(3, 'Toni');

INSERT INTO courses (id, course_name) VALUES
(101, 'Math'),
(102, 'History'),
(103, 'Biology');

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 101),  
(1, 103),  
(2, 102),  
(3, 101);  


CREATE INDEX idx_students_name ON students(name);
CREATE INDEX idx_enrollments_sid ON enrollments(student_id);
CREATE INDEX idx_enrollments_cid ON enrollments(course_id);


SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON c.id = e.course_id
WHERE s.name = 'Alice';
