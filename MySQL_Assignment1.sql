-- MySQL ASSIGNMENT 1

-- Create a Database Named School
CREATE DATABASE School;
USE School;

-- Create a Table Named STUDENT
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

--  Insert Data into the STUDENT Table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Alice', 85, 'A'),
(2, 'Bob', 72, 'B'),
(3, 'Charlie', 90, 'A'),
(4, 'David', 65, 'C'),
(5, 'Eva', 88, 'A');

-- Use the DESC Command
desc STUDENT;


-- Use the SELECT Command to Display the Table
SELECT * FROM STUDENT;

-- Add a Column Named Contact to the STUDENT Table
ALTER TABLE STUDENT ADD COLUMN Contact VARCHAR(15);

-- Remove the Grade Column from the STUDENT Table
ALTER TABLE STUDENT DROP COLUMN Grade;

-- Rename the Table to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

-- Delete All Rows from the Table
TRUNCATE TABLE CLASSTEN;

-- Remove the Table from the Database
DROP TABLE CLASSTEN;

-- Verify the Table is Dropped
SHOW TABLES;



