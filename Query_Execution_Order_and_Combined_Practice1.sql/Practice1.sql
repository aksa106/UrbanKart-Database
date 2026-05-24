
--          SQL EXECUTION AND LOGICAL ORDER + PRACTICE_1

------------------------------------------------------------------

/*

1. FROM  -- Chooses table

2. WHERE -- Filter Rows

3. GROUP BY -- Create Groups

4. HAVING -- Filter those groups

5. SELECT  -- Creates the final output

6. TOP    --  Chooses Top(n) Rows from final output

7. ORDER BY  -- Sorts Final result

---------------------------------------------------------------

* Where cannot use aggregates, as it filter rows, before grouping & aggregation happens, so it works on simple conditional logic.

* Where filter existing rows but HAVING FILTERS GROUPS AFTER AGGREATIONS AND GROUPING   

* 4. Why grouped queries behave differently

    * Before Grouping, every row is separate,
    * TableX -- (Product, Category, Price)
    
        * If we do Group By category
        * SQL combines rows into -- one group / category.
        * Now one Category (Electronics) can contains many prices
            * 80000, 30000, 50000, etc
            * That’s why after grouping:
            * either aggregate values
            * or group by that column too.

                    * non-grouped columns become invalid.
*/

-----------------------------------------------------------------

-- Show:

-- CategoryType
-- total products
-- total stock quantity
-- average price
-- total premium products only

-- Rules:

-- Electronics → Tech
-- Fashion/Home → Lifestyle
-- otherwise Other

-- Premium product:

-- Price > 50000

-- Then:

-- group by CategoryType
-- show only groups where average price > 3000
-- sort results:
-- Tech → Lifestyle → Other



SELECT  

--[CategoryType column]
    CASE 
        WHEN Category = 'Electronics'
            THEN 'Tech'
                WHEN Category = 'Fashion' OR Category = 'Home'
                    THEN 'Lifestyle'
    ELSE
        'Other' 
    END 
        [CategoryType],

-- TotalProducts Column 

    COUNT(ProductID) [TotalProducts],

--Total StockQty Column

    SUM(StockQty) [Total StockQty],

--Average Price Column
    
    AVG(price) [Average Price],

-- Total Premium Products only

    SUM(CASE 
        WHEN Price > 50000
            THEN 1
    ELSE
        0

    END) 
        [Total Premium products]

FROM 
    Products

GROUP BY    
    CASE 
        WHEN Category = 'Electronics'
            THEN 'Tech'
                WHEN Category = 'Fashion' OR Category = 'Home'
                    THEN 'Lifestyle'
    ELSE
        'Other' 
    END 


HAVING 
    AVG(price) > 3000


ORDER BY 

    CASE 
        WHEN 
            CASE 
                WHEN Category = 'Electronics' 
                    THEN 'Tech'
                        WHEN Category = 'Fashion' OR Category = 'Home'
                            THEN 'Lifestyle'

                ELSE 
                    'Other'
            End = 'Tech'
            THEN 1

                WHEN 
                    CASE 
                WHEN Category = 'Electronics' THEN 'Tech'
                WHEN Category = 'Fashion' OR Category = 'Home' THEN 'Lifestyle'
                ELSE 'Other'
            END = 'Lifestyle'
            THEN 2

        ELSE 3

    END

----------------------------------------------------------------


-- Show:

-- CustomerType
-- total customers
-- total orders
-- total revenue

-- Rules:

-- customers with revenue > 50000 → VIP
-- revenue between 10000 and 50000 → Regular
-- otherwise Low Value

-- Hints:

-- use Orders table
-- first aggregate customer revenue
-- then create CustomerType using CASE
-- group by CustomerType
-- show only groups where total customers > 1
-- sort:
-- VIP → Regular → Low Value

select 

    Case 
        When SUM(TotalAmount) > 50000 
            Then 'VIP'
                When SUM(TotalAmount) between 10000 AND 50000 
                    Then 'Regular'
        Else 
            'Low'
    End [Customer Type],
        

    Count(CustomerID) [Total Customers],

    Count(OrderID) [Total Orders],

    Sum(TotalAmount) [Total Revenue]


From 
    Orders


Group By CustomerID


-- Having 
--     Count(CustomerID) > 1



































