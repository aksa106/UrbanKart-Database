--USE UrbanKart

--                   CONDIITONAL AGGREGATION                         

--aggregate only selected rows based on conditions

------------------------------------------------------------------

-- Show:

-- total number of premium products
-- total number of budget products

-- Rules:

-- Premium → Price > 50000
-- Budget → otherwise
------------------------------------------------------------------------
/*
Out of all products, 
how many are premium
and how many are in budget

    Price Column has:
        * some prices above 50k
        * some below 50k

            So we want SQL to:

                * check every row
                * classify it
                * then count totals.

                    ----------------------
                    if price > 50000
                        → count as Premium

                    else
                        → count as Budget
                    -----------------------


    CASE DOES - classification
        CASE decides 1 or 0

    SUM DOES -counting
        Sum add all 1s together



*/
-------------------------------------------------------------------------
Select 

    SUM(
        Case 
            When Price > 50000 
                Then 1 
        Else 
            0
        End
    ) [Premium Products],

    SUM(
        Case 
            When Price <= 5000 
                Then 1 
        Else 
            0
        End
    ) [Budget Products]

From products


---------------------------------------------------------------------------

-- Show:

-- total number of high value orders
-- total number of normal orders
-- total revenue from high value orders only

-- Rules:

-- High Value Order → TotalAmount > 10000
-- otherwise Normal Order.

SELECT

    SUM(
        Case 
            when TotalAmount > 10000
                then 1
        Else
            0
        END
    ) [High Value Order],

    SUM(
        Case 
            When TotalAmount <= 10000
                Then 1 
        Else 
            0
        End
    ) [Normal Order],

    SUM(
        Case 
            When TotalAmount > 10000
                then TotalAmount
        Else 
            0
        end
    ) [HighValueRevenue]


FROM 
    Orders

---------------------------------------------------------------------------


-- Show:
-- total premium products
-- total affordable products
-- total stock quantity of premium products only

-- Rules:

-- Premium → Price > 50000
-- otherwise Affordable.

SELECT
    SUM(
        CASE 
            When price > 50000
            Then 1
        Else 
            0
        End  
    ) [Premium Products],

    SUM(
        CASE 
            When price <= 50000
            Then 1
        Else 
            0
        End  
    ) [Affordable Products],

        SUM(
        CASE 
            When price > 50000
            Then StockQty
        Else 
            0
        End  
    ) [Premium Products]

From 
    products 

-----------------------------------------------------------------------------    
-- Show:
-- total large orders
-- total medium orders
-- revenue generated only from large orders

-- Rules:

-- Large Order → TotalAmount > 20000
-- Medium Order → otherwise.
-- Show:
-- total electronics products
-- total non-electronics products
-- total stock quantity for electronics only.


SELECT 
    SUM(
        Case 
            When  TotalAmount > 20000
                Then 1
        Else 
            0
        End  
    ) [Total Large Orders],

    SUM(
        Case 
            When  TotalAmount <= 20000
                Then 1
        Else 
            0
        End  
    ) [Total Medium Orders],

    SUM(
        Case 
            When  TotalAmount > 20000
                Then TotalAmount
        Else 
            0
        End  
    ) [ Large Orders Revenue]

From 
    Orders 
---------------------------------------------------------------------------