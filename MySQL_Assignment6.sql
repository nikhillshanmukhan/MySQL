-- Assignment 6 Joins and Union

--  Create the Country Table
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

-- Queries
----------------------------
-- 1. Perform Inner Join, Left Join, and Right Join on the Tables

-- (a) Inner Join
SELECT *
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

-- (b) Left Join
SELECT *
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

-- (c) Right Join
SELECT *
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

-- 2. List All Distinct Country Names from Both the Country and Persons Tables
SELECT DISTINCT Country_name
FROM Country
UNION
SELECT DISTINCT Country_name
FROM Persons;

-- 3. List All Country Names from Both the Country and Persons Tables, Including Duplicates
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;

-- 4. Round the Ratings of All Persons to the Nearest Integer in the Persons Table
SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;




