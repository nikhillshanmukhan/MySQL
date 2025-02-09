-- Assignment 7 Functions

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
-- 1. Add a New Column Called DOB in the Persons Table with Data Type as Date
ALTER TABLE Persons
ADD COLUMN DOB DATE;

-- 2. Update the DOB Column with Sample Data
UPDATE Persons
SET DOB = CASE
    WHEN Id = 1 THEN '1980-05-15'
    WHEN Id = 2 THEN '1985-08-22'
    WHEN Id = 3 THEN '1990-03-10'
    WHEN Id = 4 THEN '1975-11-30'
    WHEN Id = 5 THEN '1988-07-25'
    WHEN Id = 6 THEN '1982-09-12'
    WHEN Id = 7 THEN '1992-04-18'
    WHEN Id = 8 THEN '1978-12-05'
    WHEN Id = 9 THEN '1987-06-20'
    WHEN Id = 10 THEN '1983-02-14'
END
WHERE Id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);


-- 3. Write a User-Defined Function to Calculate Age Using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

-- 4. Write a Select Query to Fetch the Age of All Persons Using the Function
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

-- 5. Find the Length of Each Country Name in the Country Table
SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;

-- 6. Extract the First Three Characters of Each Country's Name in the Country Table
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

-- 7. Convert All Country Names to Uppercase and Lowercase in the Country Table
SELECT Country_name,
       UPPER(Country_name) AS Uppercase_Name,
       LOWER(Country_name) AS Lowercase_Name
FROM Country;




