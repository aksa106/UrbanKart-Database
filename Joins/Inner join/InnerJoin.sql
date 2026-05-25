
--USE UrbanKart

/*

INNER JOIN RETURNS MATCHING ROWS FROM BOTH THE TABLES 

    * It usually returns the intersection of Tables.
    * It shows only Rows where the defined relationship exists and extract meaningful information.






*/



---------------------------------------------------------------------------

/*

Orders Tables has IDs, Customers table has actual names.
INNER JOIN connects them

*/



-- First practical:
-- Show:

-- OrderID
-- FirstName
-- ProductID
-- TotalAmount

-- by joining:
-- Orders + Customers
-- using: CustomerID


SELECT * from Customers

SELECT * from Orders
 -- OrderID,ProductID, FirstName, total amount

 -- ig orderId and prodcutid must match


Select 
   
    OrderID ,
    FirstName, 
    ProductID,
    TotalAmount,
    CustomerID  -- becomes ambiguos now because both tables contains it
from 
    Customers c INNER JOIN Orders o

ON c.CustomerID = o.CustomerID


-- CORRECT CODE + SAFER 

Select 
    
    c.CustomerID ,
    OrderID ,
    FirstName, 
    ProductID,
    TotalAmount
    
from 
    Customers c INNER JOIN Orders o

ON c.CustomerID = o.CustomerID




Select 
    
    o.CustomerID,  
    OrderID ,
    FirstName, 
    ProductID,
    TotalAmount
    
from 
    Customers c INNER JOIN Orders o

ON c.CustomerID = o.CustomerID


-----------------------------------------------------------------------------

-- Show:
-- OrderID
-- FirstName
-- TotalAmount

-- using:

-- Customers + Orders

/*

We wanted to understand : Which Customer placed order and how much amt they paid for their particualr orders

    * SO the common thing in both the tables was customerID
    * we connected both thr tables with customertIds
        * we found out which customer placed orders 


*/

select 
    c.CustomerID,
    OrderId,
    FirstName,
    TotalAmount

From 
    customers c inner join Orders o
    On c.CustomerID = o.CustomerID

-----------------------------------------------------------------------------

-- Show:
-- ProductName
-- Quantity
-- TotalAmount

-- using:

-- Orders + Products

/*

We wanted to find out what products were ordered and thier combined price.

    * since products table has only the products info and stock qty etc.
    * Orders table contains the info which products are really ordered 

        * the only common thing in both the tables were ProductID.
        * we joined both the tables with productID 
            And Extracted info about what products were ordered and how much they cost (total amount)


*/

Select 
  
    OrderID,
    ProductName,
    Quantity,
    TotalAmount

From 
    Products p inner join Orders o
    On p.ProductID = o.ProductID

/*



*/
--------------------------------------------------------------------

-- Show:
-- FirstName
-- OrderID
-- Quantity
-- TotalAmount

-- where:

-- TotalAmount > 5000


select 
    c.CustomerID,
    FirstName,
    OrderID,
    Quantity,
    TotalAmount

From customers c inner join Orders o  
On c.CustomerID = o.CustomerID

Where 
    TotalAmount > 5000
























