--USE UrbanKart
-------------------------------------------------------
/*
PHASE2

[multiple WHEN conditions]

*/

-- Show
-- ProductName
-- Price

-- and create:
-- PriceCategory

-- Rules:

-- if price > 50000 → 'Premium'
-- if price between 10000 and 50000 → 'Mid Range'
-- else → 'Budget'


select 
    ProductName,
    Price,
case 
    when price > 50000 
        then 'Premium'
            when price between 10000 and 50000
                then 'Mid Range'
else 
    'Budget'
end  
    [PriceCategory]
from 
    Products


-- Show ProductName, Price, and create:
-- 'Luxury'
-- 'Premium'
-- 'Affordable'

-- using:

-- price > 70000
-- price between 20000 and 70000
-- otherwise affordable.

select 
    ProductName,
    price,
case 
    when price > 70000
        then 'Luxury'
            when price between 20000 and 70000
                then 'Premium'
else 
    'Affordable'
end   
    [ProductType]
from 
    products
    

-- Show ProductName, StockQty, and create:
-- 'Out of Stock'
-- 'Limited Stock'
-- 'In Stock'

-- using:

-- StockQty = 0
-- StockQty between 1 and 20
-- otherwise in stock.

select 
    ProductName, 
    StockQty,
case 
    when StockQty = 0
        then 'Out of Stock'
            when StockQty between 1 and 20
                then 'Limited Stock'
else 
    'In Stock'
END 
    [StockStatus]
from 
    products


    
-- Show CustomerID, TotalTotalAmount, and create:
-- 'Small Order'
-- 'Medium Order'
-- 'Large Order'

-- using:

-- TotalAmount < 5000
-- TotalAmount between 5000 and 20000
-- otherwise large.

select 
    CustomerID,
    TotalAmount,
case 
    when TotalAmount < 5000
        then 'Small Order'
            when TotalAmount between 5000 and 20000
                then 'Medium Order'
else 
    'Large Order'
end
    [OrderType]

from 
    Orders



-- Show ProductName, Category, and create:
-- 'Technology'
-- 'Lifestyle'
-- 'Other'

-- using:

-- Electronics → Technology
-- Fashion/Home → Lifestyle
-- otherwise Other.


select 
    ProductName,
    Category,
case 
    when Category = 'Electronics'
        then 'Technology'
            when Category = 'Fashion'
                OR Category = 'Home'
                    then 'Lifestyle'
else
    'Other'
end 
    [CategoryType]
from 
    Products
--------------------------------------------------------------------