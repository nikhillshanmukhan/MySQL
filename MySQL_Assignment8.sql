-- Assignment 8 Subqueries and Views

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
-- 1. Find the number of persons in each country:
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low:
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

-- 3. Find the average rating for persons in respective countries if the average is greater than 3.0:
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA (using subqueries):
SELECT Country_name
FROM Persons
WHERE Rating = (
    SELECT Rating
    FROM Persons
    WHERE Country_name = 'USA'
    LIMIT 1
);

-- 5. Select all countries whose population is greater than the average population of all nations:
SELECT Country_name, Population
FROM Country
WHERE Population > (
    SELECT AVG(Population)
    FROM Country
);


-- NEW DATABASE
---------------------------------------------------------
-- Create the Product Database and Customer Table:
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Mike', 'Johnson', 'mike.johnson@example.com', '345-678-9012', '789 Oak St', 'Chicago', 'IL', '60601', 'USA'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '456-789-0123', '101 Pine St', 'Houston', 'TX', '77001', 'USA'),
(5, 'David', 'Wilson', 'david.wilson@example.com', '567-890-1234', '202 Maple St', 'Phoenix', 'AZ', '85001', 'USA'),
(6, 'Sophia', 'Davis', 'sophia.davis@example.com', '678-901-2345', '303 Birch St', 'Philadelphia', 'PA', '19019', 'USA'),
(7, 'James', 'Miller', 'james.miller@example.com', '789-012-3456', '404 Cedar St', 'San Antonio', 'TX', '78201', 'USA'),
(8, 'Olivia', 'Martinez', 'olivia.martinez@example.com', '890-123-4567', '505 Walnut St', 'San Diego', 'CA', '92101', 'USA'),
(9, 'Daniel', 'Garcia', 'daniel.garcia@example.com', '901-234-5678', '606 Cherry St', 'Dallas', 'TX', '75201', 'USA'),
(10, 'Aaliya', 'Khan', 'aaliya.khan@example.com', '012-345-6789', '707 Spruce St', 'San Jose', 'CA', '95101', 'USA');

-- 1. Create a view named customer_info for the Customer table that displays the customer’s full name and email address:
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

-- Perform SELECT operation on the view:
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US:
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

-- Perform SELECT operation on the view:
SELECT * FROM US_Customers;

-- 3. Create another view named Customer_details with columns full name, email, phone_no, and state:
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

-- Perform SELECT operation on the view:
SELECT * FROM Customer_details;

-- 4. Update phone numbers of customers who live in California for the Customer_details view:
UPDATE Customer
SET Phone_no = '123-456-7890'
WHERE State = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers:
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6. Query that will return the number of customers in each state, based on the "state" column in the "customer_details" view:
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order:
SELECT *
FROM Customer_details
ORDER BY State ASC;