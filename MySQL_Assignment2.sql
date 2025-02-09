-- Assignment 2 DDL Constraints

--  Create a Database Named Sales
CREATE DATABASE Sales;
USE Sales;

-- Create a Table Named Orders with Constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,          -- Primary Key constraint
    Customer_name VARCHAR(50) NOT NULL, -- Not Null constraint
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(50) NOT NULL, -- Not Null constraint
    Contact_No VARCHAR(15) UNIQUE      -- Unique constraint
);

-- Add a New Column Named order_quantity to the Orders Table
ALTER TABLE Orders ADD COLUMN order_quantity INT;

--  Rename the Orders Table to sales_orders
RENAME TABLE Orders TO sales_orders;

-- Insert 10 Rows into the sales_orders Table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice', 'Electronics', 'Laptop', '1234567890', 1),
(2, 'Bob', 'Clothing', 'T-Shirt', '2345678901', 2),
(3, 'Charlie', 'Home Appliances', 'Microwave', '3456789012', 1),
(4, 'David', 'Books', 'Novel', '4567890123', 3),
(5, 'Eva', 'Electronics', 'Smartphone', '5678901234', 1),
(6, 'Frank', 'Clothing', 'Jeans', '6789012345', 2),
(7, 'Grace', 'Home Appliances', 'Blender', '7890123456', 1),
(8, 'Henry', 'Books', 'Textbook', '8901234567', 1),
(9, 'Ivy', 'Electronics', 'Headphones', '9012345678', 2),
(10, 'Jack', 'Clothing', 'Jacket', '0123456789', 1);

--  Retrieve customer_name and Ordered_Item from the sales_orders Table
SELECT Customer_name, Ordered_item FROM sales_orders;

-- Update the Name of the Product for a Specific Row
-- For example, change the Ordered_item for Order_Id = 3 to "Oven":
UPDATE sales_orders
SET Ordered_item = 'Oven'
WHERE Order_Id = 3;

-- Delete the sales_orders Table from the Database
DROP TABLE sales_orders;

-- Verify the Table is Dropped
SHOW TABLES;



