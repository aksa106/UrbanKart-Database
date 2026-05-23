--use UrbanKart

-- PHASE 1


-------------------------------------------------------------------

/*
NOTES

CASE WHEN creates a conditional labels/output inside queries

    Very common in:
    * dashboards
    * reports
    * business categorization
    * KPI Logic


        Example: 
            “If price > 5000 → Expensive
            Else → Affordable”


*/

---------------------------------------------------------------------

-- Show ProductName Price and create a new derived column
-- PriceCategory
-- Rules:
-- if price > 5000 → 'Expensive'
-- else → 'Affordable'


select
    ProductName,
    Price,
CASE 
    WHEN price > 5000 THEN 'Expensive'
    ELSE 'Affordable'
END AS PriceCategory

from products

/*

* CASE WHEN is used to create conditonal/dynamic output INSIDE THE QUERY.
* It comes into the SELECT COLUMN because it behaves as OUTPUT derived column
* WHEN checks condition, THEN returns output, ELSE handles remaining cases
* END closes the conditional block, and aliases are commonly used to name the derived output column
*/


-- Show:
-- ProductName
-- Price
-- and create:
-- StockStatus
-- Rules:
-- if StockQty > 20 → 'High Stock'
-- else → 'Low Stock'

select 
    productName,
    price,

Case 
    When StockQty > 20 Then 'High Stock'
else 
    'Low Stock'
End [StockStatus]

from 
    products 


-- Show ProductName, Price, and create a column that shows:
-- 'Premium' if price > 50000
-- otherwise 'Regular'

select 
    productName,
    price,
case 
    when price > 50000 then 'Premium'
else 
    'regular'
end [ProductType]

from 
    products




-- Show ProductName, StockQty, and create:
-- 'Out of Stock' if StockQty = 0
-- otherwise 'Available'

select 
    ProductName,
    StockQty,

case 
    when StockQty = 0 then 'Out of Stock'
else 
    'Available'
end
    [StockStatus]
from 
    products


-- Show CustomerID, TotalAmount, and create:
-- 'High Value Order' if TotalAmount > 10000
-- otherwise 'Normal Order'

select 
    CustomerID,
    TotalAmount,
case 
    when TotalAmount > 10000 then 'High Value Order'
else 
    'Normal Order'
end    
    [TypeOrder]
from 
    Orders



-- Show ProductName, Category, and create:
-- 'Tech Product' if category is Electronics
-- otherwise 'Non-Tech Product'

select 
   ProductName, 
   Category, 
case 
    when Category ='Electronics' then 'TechProduct'
else 
    'Non-Tech Product'
END 
    [ProductType]
from 
    products

----------------------------------------------------