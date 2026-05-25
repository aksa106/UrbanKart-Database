
----------------------------------------------------------------------
--USE UrbanKart
-----------------------------------------------------------------------


-- INSERTING RECORDS INTO CUSTOMERS TABLE

--CustomerID - Manually generated
--CreatedAT - Default date

--CUTOMER TABLE HAS 6 COLS - IN WHICH ABOVE TWO COLUMNS AUTOMATICALLY GETS AUTO GENERTAED VALUES 
-- SO I MUST USE SPECIFIC COL INSERTION INSTEAD OF ALL COL INSERTION
-------------------------
-- CustomerID
-- FirstName
-- LastName
-- Email
-- Phone
-- CreatedAt
--------------------------
INSERT INTO Customers(FirstName,LastName,Email,Phone)
VALUES
-- ('Aarav','Sharma','aarav.sharma@gmail.com','9876543210'),
-- ('Priya','Mehta','priya.mehta@gmail.com','9123456780'),
-- ('Rohan','Verma','rohan.verma@gmail.com','9988776655'),
-- ('Ananya','Kapoor','ananya.kapoor@gmail.com','9090909090'),
-- ('Kabir', 'Singh', 'kabir.singh@gmail.com','9765432101')
-- ('Ishaan','Malhotra','ishaan.malhotra@gmail.com','9812345670'),
-- ('Sneha','Patel','sneha.patel@gmail.com','9823456781'),
-- ('Arjun','Nair','arjun.nair@gmail.com','9834567892'),
-- ('Meera','Joshi','meera.joshi@gmail.com','9845678903'),
-- ('Vivaan','Reddy','vivaan.reddy@gmail.com','9856789014'),
-- ('Diya','Chopra','diya.chopra@gmail.com','9867890125'),
-- ('Aditya','Kulkarni','aditya.kulkarni@gmail.com','9878901236'),
-- ('Kavya','Iyer','kavya.iyer@gmail.com','9889012347'),
-- ('Rahul','Bansal','rahul.bansal@gmail.com','9890123458'),
-- ('Neha','Saxena','neha.saxena@gmail.com','9901234569'),
-- ('Manav','Agarwal','manav.agarwal@gmail.com','9912345671'),
-- ('Pooja','Deshmukh','pooja.deshmukh@gmail.com','9923456782'),
-- ('Yash','Khanna','yash.khanna@gmail.com','9934567893'),
-- ('Tanvi','Arora','tanvi.arora@gmail.com','9945678904'),
-- ('Harsh','Mishra','harsh.mishra@gmail.com','9956789015');


('Amit', 'Roy', 'amit.roy@gmail.com', '9991112221'),

('Sara', 'Khan', 'sara.khan@gmail.com', '9991112222'),

('Dev', 'Malik', 'dev.malik@gmail.com', '9991112223');
--Inserted 20 realistic customer records into the UrbanKart Customers table using multi-row specific-column DML insertion while auto-generating CustomerID and CreatedAt values.




----------------------------------------------------------------------------------------------------------------------------------------------------


--INSERTING RECORDS INTO Product TABLE


--Products(ProductID, ProductName, Category, Price, StockQty)

--ProductID auto-generates through IDENTITY, so while inserting products we only provide actual business data like name, category, price, and stock quantity.



INSERT INTO Products(ProductName, Category, Price, StockQty)
VALUES
-- ('iPhone15', 'Electronics', 79999.99, 15),
-- ('Gaming Mouse','Accessories',1499.50,40),
-- ('Nike Running Shoes','Footwear',4999.00,25),
-- ('Bluetooth Speaker','Electronics',2999.99,18),
-- ('Office Chair','Furniture',8999.00,10),
-- ('Laptop Stand','Accessories',1299.00,35),
-- ('Samsung Galaxy S24','Electronics',74999.00,12),
-- ('Wireless Keyboard','Accessories',2499.00,28),
-- ('Study Table','Furniture',6499.00,8),
-- ('Puma Hoodie','Fashion',2199.00,20),
-- ('Smart Watch','Electronics',5999.00,22),
-- ('Water Bottle','Home',499.00,60),
-- ('LED Monitor','Electronics',15999.00,14),
-- ('Backpack','Fashion',1799.00,30),
-- ('Air Fryer','Home Appliances',8499.00,9),
-- ('USB-C Cable','Accessories',299.00,75),
-- ('Mechanical Keyboard','Accessories',5499.00,16),
-- ('Dining Chair','Furniture',3499.00,11),
-- ('Hair Dryer','Home Appliances',1999.00,24),
-- ('Coffee Mug','Home',399.00,50);

-- Products never ordered

('Gaming Desk', 'Furniture', 12000, 5),

('Yoga Mat', 'Fitness', 999, 20),

('DSLR Camera', 'Electronics', 65000, 4);

--Inserted 20 realistic ecommerce product records into Products table using multi-row specific-column DML insertion while auto-generating ProductID values.

--CATEGORIES USED
-- Electronics
-- Accessories
-- Footwear
-- Furniture
-- Fashion
-- Home
-- Home Appliances


--------------------------------------------------------------------------
--------------------------------------------------------------------------

--INSERTING RECORDS INTO Orders TABLE

--Orders (OrderID, CustomerID, ProductID, Quantity, TotalAmount, OrderDate)

-- Orders table connects customers and products together, so while inserting orders we must use existing CustomerID and ProductID values that already exist in their respective tables.

-- Records we will reference using existing values from related tables
-- CustomerID
-- ProductID

-- Records that will automatically generate and we wont manually insert
-- OrderDate
-- OrderID 

INSERT INTO Orders(
    CustomerID,
    ProductID,
    Quantity,
    TotalAmount)

VALUES
-- (1,3,2,9998.00),
-- (2,5,1,8999.00),
-- (3,2,2,2999.00),
-- (4,1,1,79999.99),
-- (5,10,3,6597.00),
-- (6,7,1,74999.00),
-- (7,4,2,5999.98),
-- (8,8,1,2499.00),
-- (9,12,4,1996.00),
-- (10,6,1,1299.00),
-- (11,14,2,3598.00),
-- (12,15,1,8499.00),
-- (13,3,1,4999.00),
-- (14,17,1,5499.00),
-- (15,9,1,6499.00),
-- (16,18,2,6998.00),
-- (17,11,1,5999.00),
-- (18,13,1,15999.00),
-- (19,16,5,1495.00),
-- (20,20,3,1197.00);


(1, 2, 1, 1499.50),

(5, 4, 2, 5999.98),

(10, 11, 1, 5999.00);
-----------------------------------------------------------------