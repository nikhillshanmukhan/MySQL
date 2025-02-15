-- Set Up the Database and Table
-- 1 Create a Database
CREATE DATABASE Company;
USE Company;

-- 2 Create the Worker Table:
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

-- 3 Insert Sample Data :
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'John', 'Doe', 5000, '2023-10-01 09:00:00', 'HR'),
(2, 'Jane', 'Smith', 6000, '2023-09-15 10:00:00', 'IT'),
(3, 'Alice', 'Johnson', 5500, '2023-08-20 08:30:00', 'HR');

-- 4 Create Stored Procedures:

-- a. Procedure to Add a New Worker:

DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

-- b. Procedure to Retrieve Salary by Worker ID:
DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- c. Procedure to Update Department by Worker ID:
DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- d.Procedure to Count Workers in a Department:
DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

-- e.Procedure to Calculate Average Salary by Department:
DELIMITER //

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;



-- Execute the Stored Procedures
-- Add a New Worker:

CALL AddWorker(4, 'Bob', 'Brown', 7000, '2023-10-05 11:00:00', 'IT');

-- Retrieve Salary by Worker ID:
SET @salary = 0;
CALL GetWorkerSalary(1, @salary);
SELECT @salary AS WorkerSalary;

-- Update Department by Worker ID:
CALL UpdateWorkerDepartment(1, 'Finance');

-- Count Workers in a Department:
SET @workerCount = 0;
CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount AS WorkerCount;

-- Calculate Average Salary by Department:
SET @avgSalary = 0;
CALL GetAverageSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;

-- Verify Results
-- Check the Worker Table:

SELECT * FROM Worker;

