
--             CASE + GROUP BY + HAVING             

-- CASE CAN CREATE DYNAMIC GEOUPS/CATEGORIES 



-----------------------------------------------------------------------

-- Show:

-- PriceCategory
-- total products
-- average price

-- Rules:

-- price > 50000 → Premium
-- otherwise Budget

-- Then:

-- group by PriceCategory
-- show only groups where average price > 10000

/*

Products(ProductID, ProductName, Category, Price, StockQty)

1. I have to find, The Category of Price based on these conditions(Price>50000-Premium) (otherwise-Budget)
    -- uses a case when condition cuz , checks rows and returns the result dynamically


2. i have to also find based on firest condition how many premium or budget products are there 
    -- Uses aggregated function (count)

3. i have to simply find 
    -- uses the aggregated fucniton (avg)


4. then i have to group by Price Category 
    -- if price > 50000 - premium
    -- if price < 50000 - budget

5. for Each group (premium & Budget) -- AVG price will be calculated
    -- and only those group will be showm which will have avg(price) > 10000


*/

Select 
    
    Case 
        When Price > 50000 
            Then 'Premium'
    Else 
        'Budget'
    End  
        [Price Category],

    COUNT(ProductID) [TotalProducts],
    AVG(price) [Average Price]

From 
    Products 

Group By 

    Case  
        When price > 50000 
            Then 'Premium'
    Else 
        'Budget'
    END 

HAVING 
    AVG(price) > 3000

-------------------------------------------------------------------------

-- Show:

-- OrderType
-- total orders
-- total revenue
-- average order amount

-- Rules:

-- TotalAmount > 20000 → Large Order
-- TotalAmount between 5000 and 20000 → Medium Order
-- otherwise Small Order

-- Then:

-- group by OrderType
-- show only groups where total revenue > 10000
-- sort results:
-- Large → Medium → Small



--ORders(OrderID, CustomerID, ProductID, Quantity, TotalAmount)

select 
--  [Order Type Column]
    Case 
        When TotalAmount > 20000
            Then 'Large Order'
                When TotalAmount between 5000 and 20000 
                    Then 'Medium Order'
    Else 
        'Small Order'
    End  
        [OrderType],

-- [Total Orders Column]

    COUNT(OrderID) [Total Orders],

-- [Average Order Column]

    AVG(TotalAmount) [Avergae Order Amount],

    SUM(TotalAmount) [Total Revenue]

From 
    Orders 


Group by 
    Case 
        When TotalAmount > 20000
            Then 'Large Order'
                When TotalAmount between 5000 and 20000 
                    Then 'Medium Order'
    Else 
        'Small Order'
    End  
        
HAVING 
    SUM(TotalAmount) > 10000

----------------------------------------------------------