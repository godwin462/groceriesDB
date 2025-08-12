-- Create the database
CREATE DATABASE groceries_store;

-- Switch to the new database
USE groceries_store;

-- Create the 'Stores' table
CREATE TABLE Stores (
    storeID INT AUTO_INCREMENT PRIMARY KEY,
    nameOfOwnerOfTheStore VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create the 'Products' table with a foreign key
CREATE TABLE Products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    nameOfProduct VARCHAR(255) NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    totalPrice DECIMAL(10, 2) AS (unitPrice * quantity),
    isAvailable BOOLEAN NOT NULL,
    storeID INT,
    FOREIGN KEY (storeID) REFERENCES Stores(storeID) ON DELETE CASCADE
);

-- Insert a new store
INSERT INTO Stores (nameOfOwnerOfTheStore, email, phoneNumber, Location)
VALUES ('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St');

-- Insert products for the store
INSERT INTO Products (nameOfProduct, unitPrice, quantity, isAvailable, storeID)
VALUES ('Apple', 1.50, 100, TRUE, 1),
       ('Banana', 0.75, 200, TRUE, 1);
       
       -- Select all stores
SELECT * FROM Stores;

-- Select all products for a specific store (e.g., storeID = 1)
SELECT * FROM Products WHERE storeID = 1;

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
    Products AS P ON S.storeID = P.storeID;
    
    -- Update the location of a store
UPDATE Stores
SET Location = '456 Oak Ave'
WHERE storeID = 1;

-- Update the price and quantity of a product
UPDATE Products
SET unitPrice = 1.75, quantity = 150
WHERE productID = 1;

-- Delete a specific product
DELETE FROM Products WHERE productID = 2;

-- Delete a store (this will also delete its products due to CASCADE)
DELETE FROM Stores 
WHERE
    storeID = 1;