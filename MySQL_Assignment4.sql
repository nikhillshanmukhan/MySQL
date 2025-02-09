-- Assignment 4 Querying Data
 
-- Create the Country Table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population BIGINT,
    Area DECIMAL(10, 2)
);

-- Insert 10 Rows into the Country Table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'Canada', 37742154, 9984670),
(4, 'UK', 67886011, 242495),
(5, 'Australia', 25499884, 7692024),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'Brazil', 212559417, 8515767),
(9, 'China', 1439323776, 9596961),
(10, 'Japan', 126476461, 377975);

-- Create the Persons Table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(50)
);

-- Insert 10 Rows into the Persons Table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331002651, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 1380004385, 3.8, 2, 'India'),
(3, 'Mike', 'Johnson', 37742154, 4.2, 3, 'Canada'),
(4, 'Emily', 'Brown', 67886011, 4.7, 4, 'UK'),
(5, 'David', 'Wilson', 25499884, 4.0, 5, 'Australia'),
(6, 'Sophia', 'Davis', 83783942, 4.9, 6, 'Germany'),
(7, 'James', 'Miller', 65273511, 3.5, 7, 'France'),
(8, 'Olivia', 'Martinez', 212559417, 4.6, 8, 'Brazil'),
(9, 'Daniel', 'Garcia', 1439323776, 4.1, 9, 'China'),
(10, 'Aaliya', 'Khan', 126476461, 4.8, 10, 'Japan');

 -- QUERIES
 ------------------------
 -- (1) List the Distinct Country Names from the Persons Table
 SELECT DISTINCT Country_name
FROM Persons;

-- Select First Names and Last Names from the Persons Table with Aliases
SELECT Fname AS First_Name, Lname AS Last_Name
FROM Persons;

-- (3) Find All Persons with a Rating Greater Than 4.0
SELECT *
FROM Persons
WHERE Rating > 4.0;

 -- (4) Find Countries with a Population Greater Than 10 Lakhs
 SELECT *
FROM Country
WHERE Population > 1000000;

-- (5) Find Persons Who Are from 'USA' or Have a Rating Greater Than 4.5
SELECT *
FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;

-- (6) Find All Persons Where the Country Name is NULL
SELECT *
FROM Persons
WHERE Country_name IS NULL;

-- (7) Find All Persons from the Countries 'USA', 'Canada', and 'UK'
SELECT *
FROM Persons
WHERE Country_name IN ('USA', 'Canada', 'UK');

-- (8) Find All Persons Not from the Countries 'India' and 'Australia'
SELECT *
FROM Persons
WHERE Country_name NOT IN ('India', 'Australia');

-- (9) Find All Countries with a Population Between 5 Lakhs and 20 Lakhs
SELECT *
FROM Country
WHERE Population BETWEEN 500000 AND 20000000;

-- (10) Find All Countries Whose Names Do Not Start with 'C'
SELECT *
FROM Country
WHERE Country_name NOT LIKE 'C%';






 
