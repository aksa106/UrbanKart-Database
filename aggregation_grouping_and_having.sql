
--use UrbanKart
-- Show total number of products in Products table

/*

1. Count(*) -- Allrows including Null values 

2. Count(Column_Name) -- Only Non Null Values

3.Count(Distinct Column_name) Unique Non Null Values


*/


------------------------------------------------------------------------

select Count(ProductID) AS [TotalProducts]
from products


-- Show average product price for each category.

select Category, AVG(price) AS [Average]
from products
group by Category

-- Show categories whose total stock quantity is greater than 40.

select
    Category,
    SUM(StockQty) AS [TotalStockQty]
from 
    products

Group by 
    Category

having 
    SUM(StockQty) > 40


-- Show total number of orders placed by each customer

select 
    CustomerID,
    COUNT(OrderID) [Total Orders]
from Orders 
group by CustomerID


-- Show average product price for categories whose average price is greater than 5000.

select 
    Category,
    AVG(price) AS [AveragePrice]

from products
group by Category

having AVG(price)  > 5000

-- Show maximum and minimum product price for each category.

select 
    Category,
    MAX(price) [MaximumPrice],
    MIN(price) [MinimumPrice]
from 
    Products
group by Category


-- Show categories where total stock quantity is between 20 and 60.

select 
    Category,
    SUM(StockQty) [Total StockQty]
from 
    products 
group by 
    Category
having 
    SUM(StockQty) between 20 AND 60


-- Show total revenue generated for each ProductID where total revenue is greater than 10000.

--Revenue : total money earned from the sales 
-- 5 products sold for 1000 each
-- revenue = 5000
----------------------------------------------------


select
    ProductID,
    SUM(TotalAmount) [Total Revnue]
from 
    Orders 
Group by 
    ProductID 
having 
    SUM(TotalAmount) > 10000
    



-- Show categories whose category name does not start with H, average product price is greater than 2000, and total stock quantity is between 20 and 100.


select 
    Category,
    AVG(price) [Average price],
    SUM(StockQty) [Total StockQty]
from 
    products
where 
    Category NOT LIKE 'H%'
group by 
    Category 
having 
    AVG(price)>2000 AND SUM(StockQty) between 20 AND 100



-- Show ProductIDs whose total revenue is greater than 5000, ProductID is not in (1,2), and total revenue comes from orders where quantity is not equal to 1.

select 
    ProductID,
    
    SUM(TotalAmount) [TotalRevenue]
  
from 
    Orders 
where 
    ProductID NOT IN(1,2)
    AND Quantity != 1
group by 
    ProductID
having 
    SUM(TotalAmount) > 5000



-- Show categories where:

-- average product price is greater than 3000
-- total stock quantity is greater than 20
-- category name does not start with H
-- and maximum product price is less than 80000.

select 
    Category,
    SUM(StockQty) [TotalStockQty],
    MAX(price) [MaximumPrice],
    AVG(price) [AveragePrice]

from 
    products

where 
    Category NOT LIKE 'H%'

group by 
    Category

having 
    AVG(price) > 3000
    AND SUM(StockQty) >20
    AND MAX(price) < 80000

























