
--use UrbanKart

----------------------------------------------------------------------------

--                        LEFT JOIN 

/*

Left join keeps ALL rows from left table,
    even if no matching rows exist in right table.

all left rows + mathcing right rows
    missing matches in right table becomes NULL

    “Show all customers,
even customers who never ordered.”

*/


------------------------------------------------------------------------


-- FirstName
-- OrderID
-- TotalAmount

-- using:

-- Customers LEFT JOIN Orders

/*

We want to see all customers, including those who never placed any order 
So:

Customers table is the main focus
Orders data is optional/extra

If no matching order exists:

*/

select 
    c.CustomerID,
     o.CustomerID,
    FirstName,
    OrderID,
    TotalAmount

From 
    Customers c left join Orders o   
    On c.CustomerID = o.CustomerID

-------------------------------------------------------------------
-- Show:
-- all customers
-- and their order details if available

-- Columns:

-- FirstName
-- OrderID
-- TotalAmount

-- where:

-- TotalAmount > 5000

-- using LEFT JOIN.


select 
    
    FirstName,
    LastName,
    OrderID,
    Quantity,
    TotalAmount,
    OrderDate

From 
    Customers c left join Orders o   
    on c.CustomerID = o.CustomerID 

Where  
    TotalAmount > 5000


---------------------------------------------------------------------
-- Show:
-- all products
-- and matching order information if available

select 
    p.ProductID [PrID],
    o.ProductID [O_PrID],
    ProductName,
    StockQty,
    price,
    OrderID,
    OrderDate,
    Quantity,
    TotalAmount

From 
    Products p left join Orders o  
    On p.ProductID = o.ProductID


-----------------------------------
select 
    Productname, 
    Quantity,
    TotalAmount

from 
    Products p left join Orders o
    On p.ProductID = o.ProductID

----------------------------------------------------------------------

-- for customers who never placed any order.

select 
    FirstName,
    OrderID,
    ProductID

from Customers c left join Orders o  
On  c.CustomerID = o.CustomerID 

where 
    OrderID is NULL 

---------------------------

select 
    c.CustomerID [CusID],
    FirstName,
    o.CustomerID [O_CusID],
    OrderID,
    ProductID
    

from Customers c left join Orders o  
On  c.CustomerID = o.CustomerID 

where 
    OrderID is NULL 

------------------------------------------------------






