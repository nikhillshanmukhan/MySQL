-- Assignment 5 Sorting and Grouping data

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

-- QUERIES
----------------------------

-- (1) Print the First Three Characters of Country_name from the Country Table
SELECT SUBSTRING(Country_name, 1, 3) AS Short_Name
FROM Country;

-- (2) Concatenate First Name and Last Name from the Persons Table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- (3) Count the Number of Unique Country Names from the Persons Table
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries
FROM Persons;

-- (4) Print the Maximum Population from the Country Table
SELECT MAX(Population) AS Max_Population
FROM Country;

-- (5) Print the Minimum Population from the Persons Table
SELECT MIN(Population) AS Min_Population
FROM Persons;

-- (6) Insert 2 New Rows to the Persons Table with Lname as NULL
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Alice', NULL, 50000000, 4.3, 1, 'USA'),
(12, 'Bob', NULL, 60000000, 4.4, 2, 'India');

-- Count Lname from the Persons Table
SELECT COUNT(Lname) AS Lname_Count
FROM Persons;

-- (7) Find the Number of Rows in the Persons Table
SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- (8) Show the Population of the Country Table for the First 3 Rows
SELECT Population
FROM Country
LIMIT 3;

-- (9) Print 3 Random Rows of Countries
SELECT *
FROM Country
ORDER BY RAND()
LIMIT 3;

-- (10) List All Persons Ordered by Their Rating in Descending Order
SELECT *
FROM Persons
ORDER BY Rating DESC;

-- (11) Find the Total Population for Each Country in the Persons Table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

-- (12) Find Countries in the Persons Table with a Total Population Greater Than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- (13) List the Total Number of Persons and Average Rating for Each Country, but Only for Countries with More Than 2 Persons, Ordered by the Average Rating in Ascending Order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;




