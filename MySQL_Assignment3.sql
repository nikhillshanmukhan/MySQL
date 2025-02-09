-- Assignment 3 DML Commands

-- Create a Table Named Managers with Constraints
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18), -- Check constraint to ensure age is 18 or above
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL -- NOT NULL constraint
);

--  Insert 10 Rows into the Managers Table
INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Doe', '1980-05-15', 43, 'M', 'IT', 30000.00),
(2, 'Jane', 'Smith', '1985-08-22', 38, 'F', 'HR', 28000.00),
(3, 'Aaliya', 'Khan', '1990-03-10', 33, 'F', 'Finance', 32000.00),
(4, 'Mike', 'Johnson', '1975-11-30', 48, 'M', 'IT', 35000.00),
(5, 'Emily', 'Brown', '1988-07-25', 35, 'F', 'Marketing', 27000.00),
(6, 'David', 'Wilson', '1982-09-12', 41, 'M', 'IT', 31000.00),
(7, 'Sophia', 'Davis', '1992-04-18', 31, 'F', 'HR', 29000.00),
(8, 'James', 'Miller', '1978-12-05', 45, 'M', 'Finance', 33000.00),
(9, 'Olivia', 'Martinez', '1987-06-20', 36, 'F', 'IT', 34000.00),
(10, 'Daniel', 'Garcia', '1983-02-14', 40, 'M', 'Marketing', 26000.00);

--  Retrieve the Name and Date of Birth of the Manager with Manager_Id = 1
SELECT First_name, Last_name, DOB
FROM Managers
WHERE Manager_Id = 1;

-- Display the Annual Income of All Managers
SELECT First_name, Last_name, Salary * 12 AS Annual_Income
FROM Managers;

-- Display Records of All Managers Except ‘Aaliya
SELECT *
FROM Managers
WHERE First_name != 'Aaliya';

-- Display Details of Managers Whose Department is IT and Earn More Than 25000 per Month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

--  Display Details of Managers Whose Salary is Between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;


