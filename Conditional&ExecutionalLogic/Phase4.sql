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
        






















