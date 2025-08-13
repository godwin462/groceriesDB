-- Create the database
CREATE DATABASE groceries_store;
DROP DATABASE groceries_store;
-- Switch to the new database
USE groceries_store;

-- Create the 'Stores' table
CREATE TABLE Stores (
    id VARCHAR(225) PRIMARY KEY,
    nameOfOwnerOfTheStore VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create the 'Products' table with a foreign key
CREATE TABLE Products (
    id VARCHAR(225) PRIMARY KEY,
    nameOfProduct VARCHAR(255) NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    totalPrice DECIMAL(10, 2) AS (unitPrice * quantity),
    isAvailable BOOLEAN NOT NULL,
    id VARCHAR(225) ,
    FOREIGN KEY (id) REFERENCES Stores(id) ON DELETE CASCADE
);

-- DROP TABLE  Store;

-- Insert a new store
INSERT INTO Stores (id, nameOfOwnerOfTheStore, email, phoneNumber, Location)
VALUES (UUID(), 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St');

SELECT * FROM Stores;

-- Insert products for the store
INSERT INTO Products (id, nameOfProduct, unitPrice, quantity, isAvailable, id)
VALUES (UUID(), 'Apple', 1.50, 100, TRUE, '51117f9f-781b-11f0-8bd4-b0acfaf2c5f3'),
       (UUID(), 'Banana', 0.75, 200, TRUE, '51117f9f-781b-11f0-8bd4-b0acfaf2c5f3');
       
       -- Select all stores
SELECT * FROM Products;

-- Select all products for a specific store (e.g., id = 1)
SELECT * FROM Products WHERE id = '51117f9f-781b-11f0-8bd4-b0acfaf2c5f3';

-- Join both tables to get store and product information
SELECT
    S.nameOfOwnerOfTheStore,
    S.Location,
    P.nameOfProduct,
    P.unitPrice,
    P.quantity,
    P.totalPrice
FROM
    Stores AS S
JOIN
    Products AS P ON S.id = P.id;
    
    -- Update the location of a store
UPDATE Stores
SET Location = '456 Oak Ave'
WHERE id = '51117f9f-781b-11f0-8bd4-b0acfaf2c5f3';

-- Update the price and quantity of a product
UPDATE Products
SET unitPrice = 1.75, quantity = 150
WHERE id = '51117f9f-781b-11f0-8bd4-b0acfaf2c5f3';

SELECT * FROM Products;

-- Delete a specific product
DELETE FROM Products WHERE id = '670f7fdd-781b-11f0-8bd4-b0acfaf2c5f3';

-- Delete a store (this will also delete its products due to CASCADE)
DELETE FROM Stores 
WHERE
    id = '670f7fdd-781b-11f0-8bd4-b0acfaf2c5f3';