--USE UrbanKart

---                         CASE WHEN WITH ORDER BY 

----------------------------------------------------------------------------
/*
CASE inside ORDER BY
→ custom sorting instead of normal ASC/DESC
*/


-----------------------------------------------------------------------

-- Show:

-- ProductName
-- Price, CREATE
-- PriceCategory
-- using:

-- price > 50000 → Premium
-- price between 10000 and 50000 → Mid Range
-- else Budget

-- Then:
-- sort results in this order:
-- Premium → Mid Range → Budget


Select 
    ProductName,
    Price,

    Case 
        When price > 50000 
            then 'Premium'
                when price between 10000 and 50000 
                    then 'Mid Range'
    Else 
        'Budget'
    END 
        [PriceCategory]
    From 
        Products 

    ORDER BY 

        Case 
            When price > 50000 
            then 1
                when price between 10000 and 50000 
                    then 2
        Else 
            3
        End 
        
----------------------------------------------------------------

-- Show:

-- ProductName
-- StockQty

-- Create:

-- StockStatus

-- Rules:

-- StockQty > 50 → 'Very High'
-- StockQty between 20 and 50 → 'Medium'
-- else → 'Low'

-- Then sort results in this business order:

-- Very High → Medium → Low


select 
    ProductName,
    StockQty,

Case 
    When StockQty > 50 
        Then 'Very High'
            When StockQty between 20 and 50
                Then 'Medium'

Else 
    'Low'
End   
    [StockStatus]

From 
    PRODUCTS

ORDER BY 

Case 
    When StockQty > 50
        Then 1
            When StockQty between 20 and 50
                Then 2
Else 
    3

End 

-------------------------------------------------------------------

-- Show:

-- ProductName
-- Category
-- Price

-- Create:

-- ProductPriority

-- Rules:

-- Electronics with price > 50000 → 'Top Priority'
-- Electronics with price <= 50000 → 'Medium Priority'
-- all remaining products → 'Low Priority'

-- Then sort results in this order:

-- Top Priority → Medium Priority → Low Priority


Select 
    ProductName,
    Category,
    Price,

Case 
    When Category = 'Electronics' AND price > 50000
        Then 'Top Priority'
            When Category = 'Electronics' AND price <= 50000
                Then 'Medium Priority'
Else 
    'Low'

End  
    [ProductPriority]

from 
    Products 

Order By 

Case 
    When Category = 'Electronics' AND price > 50000
        Then 1
            When Category = 'Electronics' AND price <= 50000
                Then 2 
    
Else 
    3
End  
    