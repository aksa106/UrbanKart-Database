
--use UrbanKart

/*

Data Retrival helps us to extracting and viewing data from the DB using queries.
It helps us analyze, filter, sort and insepect business info stored inside the tables.

[SELECT, TOP, DISTINCT, AS  ]
*/
------------------------------------------------------------------


-- Show all records from customers table 
SELECT * FROM Customers 


--show only First name and Email 
SELECT
    FirstName,
    Email 
FROM 
    Customers

-- Show Top 5 Products from Products
SELECT 
    TOP 5 *
FROM 
    Products

-- Show unique categories from Products 
SELECT 
    DISTINCT Category  
FROM  
    Products
