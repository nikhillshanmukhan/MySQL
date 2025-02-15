-- Assignment 10
-- Create the Database
CREATE DATABASE Collegee;
USE Collegee ;

-- : Create the teachers Table and Insert Sample Data

-- Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Insert 8 rows into the teachers table
INSERT INTO teachers (name, subject, experience, salary)
VALUES
('Alice', 'Math', 5, 50000),
('Bob', 'Science', 8, 60000),
('Charlie', 'History', 3, 45000),
('David', 'English', 10, 70000),
('Eva', 'Physics', 12, 80000),
('Frank', 'Chemistry', 7, 55000),
('Grace', 'Biology', 9, 65000),
('Henry', 'Geography', 4, 48000);

-- : Create the teacher_log Table
CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

-- Create Triggers

-- before_insert_teacher Trigger:
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

-- after_insert_teacher Trigger:
DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END //

DELIMITER ;

-- before_delete_teacher Trigger:
DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with experience greater than 10 years';
    END IF;
END //

DELIMITER ;

-- after_delete_teacher Trigger:
DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END //

DELIMITER ;


 -- Test the Triggers
 
-- Test before_insert_teacher:
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Invalid', 'Test', 2, -1000);

-- Test after_insert_teacher:
-- Insert a new teacher
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Ivy', 'Art', 6, 52000);

-- Check the teacher_log table
SELECT * FROM teacher_log;

-- Test before_delete_teacher:
-- Attempt to delete a teacher with experience > 10 years
DELETE FROM teachers WHERE id = 5; -- Eva has 12 years of experience


-- Test after_delete_teacher:
-- Delete a teacher with experience <= 10 years
DELETE FROM teachers WHERE id = 1; -- Alice has 5 years of experience

-- Check the teacher_log table
SELECT * FROM teacher_log;


-- Final State of Tables
SELECT * FROM teachers;

-- teacher_log Table:
SELECT * FROM teacher_log;



-- Database: School

-- Tables:

-- 1 teachers: Stores teacher details.

-- 2 teacher_log: Logs insert and delete actions.

-- Triggers:

-- 1 before_insert_teacher: Prevents negative salaries.

-- 2 after_insert_teacher: Logs insertions.

-- 3 before_delete_teacher: Prevents deletion of experienced teachers.

-- 4 after_delete_teacher: Logs deletions.