
--use UrbanKart

--------------------------------------------------------------------------

-- increase price of ProductID = 1
-- inside #TempProducts

-- SELECT
--     TOP 5 *
-- INTO
--     ##TempPr
-- FROM 
--     Products


UPDATE ##TempPr
SET Price = 85000
WHERE ProductId = 1


-- UPDATE  Table_Name
-- SET   
-- WHERE 


















