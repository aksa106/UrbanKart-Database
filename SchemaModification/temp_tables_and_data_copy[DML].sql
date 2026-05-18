-------------------------------------------------------------------
--use UrbanKart
-------------------------------------------------------------------


-- temp_tables_and_data_copy[DML]

-- understanding:
-- - temp tables
-- - SELECT INTO
-- - INSERT INTO SELECT
-- - copying rows
-- - copying structure
-- - temporary practice environments


------------------------------------------------------------------------
------------------------------------------------------------------------

/* 
COPYING DATA [Insert into]

    move/copy rows from one table to another


    SELECT INTO = creates NEW table + copies data
        * structure copied
        * rows copied
        * for new temp or general tables

            [CREATE + COPY]
    ----------------------------------------------------

    INSERT INTO SELECT = copies data into ALREADY EXISTING table
        * No new table is created
        * only rows copied

            [COPY ONLY]

   
--------------------------------------------------------------------
*/
-----------------------------------------------------------------------

SELECT Top 5 *
INTO #TempProducts
FROM Products;

select * from #TempProducts

----------------------------------------------------------------

SELECT Top 5 *
INTO #TempCustomers
FROM Customers;

SELECT * 
FROM #TempCustomers
--------------------------------------------------------------

SELECT Top 5 *
INTO #TempOrders
FROM Orders;

SELECT * 
FROM #TempOrders


-----------------------------------------------------------

-- I performed SELECT INTO opeartion and created 3 temp tables
-- * Created NEW Temp 
-- * Copied first 5 ROWS
-- * COPIED FULL STRUCTURE AUTOMATICALLY

-- Temp table creation + data copying [Select into]

--------------------------------------------------------------



-- Write a query that:
-- copies all rows from Customers
-- → into already existing #TempCustomers

INSERT INTO #TempCustomers
SELECT * 
FROM Customers;
---------------------------------------------------------------------------
-- --ERROR
-- --Started executing query at  Line 63
-- Msg 8101, Level 16, State 1, Line 1
-- An explicit value for the identity column in table '#TempCustomers' can only be specified when a column list is used and IDENTITY_INSERT is ON.
-- Total execution time: 00:00:00


--This error teaches an imp SQL concept as we can see, n explicit value in table #tempcustomer can only be specified when a column lisr is used an identiy insert is on

--what happened???
-- select * 
-- also tried to copy the customerID but #temp customers already has its own identity column behavior
--SO,
--“You cannot manually insert identity values like 1,2,3 unless explicitly allowed.”
--so we must USE specific col insertion

----------------------------------------------------------------------------

INSERT INTO #TempCustomers(

    FirstName,
    LastName,
    Email,
    Phone,
    CreatedAt
)
SELECT  TOP 5

    FirstName,
    LastName,
    Email,
    Phone,
    CreatedAt

FROM Customers
ORDER BY CustomerID DESC;
    

select * from #TempCustomers

------------------------------------------------------------------------
--SCHEMA -- Products(ProductID, ProductName, Category, Price, StockQty)

INSERT INTO #TempProducts(
    ProductName,
    Category,
    Price,
    StockQty

)
SELECT  TOP 5
    ProductName,
    Category,
    Price,
    StockQty

FROM Products
ORDER BY ProductID DESC;

select * from #TempProducts


---------------------------------------------------------------------
-----------------------------------------------------
--SCHEMA -- Orders (OrderID, CustomerID, ProductID, Quantity, TotalAmount, OrderDate)

--Skip only IDENTITY columns during INSERT INTO SELECT, but still copy foreign key reference columns like CustomerID and ProductID.

INSERT INTO #TempOrders(

    CustomerID,
    ProductID,
    Quantity,
    TotalAmount,
    OrderDate
)

SELECT  TOP 5

    CustomerID,
    ProductID,
    Quantity,
    TotalAmount,
    OrderDate

    
FROM Orders
ORDER BY OrderID DESC;


--------------------------------------------------------------------------

/*

CONCLUSION
1. Created new tables(temp) for practices by using the concept of copying data from SQL commands like [SELECT INTO , INSERT INTO SELECT]
2. Practiced creating temp tables safely using SELECT INTO.
3. Understood why IDENTITY columns should usually be skipped during data copying.
4. Copied business and Foreign keys data into an existing temp tables using specific column insertion.
*/

----------------------------------------------------------------------------





