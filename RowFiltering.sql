--USE  UrbanKart

/*

Retrieve only the rows you actually want

[WHERE, AND, OR, NOT, BETWEEN, IN, IS NULL]

*/


--Show all products where Price > 5000
select * from products 
where price > 5000


--Show all customers whose Firstname = "Aarav"
select * from Customers 
where FirstName = 'Aarav'


--Show all products where Category = 'Electronics'
select * from Products 
where Category = 'Electronics'



--Show all orders where Quantity >= 2
select * from Orders 
where Quantity >= 2




-- Show all electronics products with price greater than 2000
select * from products 
where price > 2000 AND Category = 'Electronics'


-- Show customers whose first name is Aarav or Priya
select * from Customers
where FirstName = 'Aarav' OR FirstName = 'Priya'


-- Show all orders where quantity is not equal to 1.
select * from Orders 
where Quantity != 1 

-- Show products priced between 1000 and 10000.
select * from products 
where Price Between 1000 AND 10000


-- Show products whose category is either Electronics or Accessories.
select * from products
where Category = 'Electronics' OR Category= 'Accessories'


-- Show products whose category is NOT Electronics.
select * from Products 
where Category NOT IN ('Electronics')

-- Show customers whose first name is NOT Aarav
select * from Customers 
where FirstName != 'Aarav'

-- Show products whose category is IN ('Fashion', 'Furniture', 'Home')
select * from products 
where Category IN('Fashion', 'Furniture', 'Home')


-- Show orders whose ProductID is NOT IN (1,2,3)
select * from Products 
where ProductID NOT IN (1,2,3)


-- Show customers where Email IS NULL
select * from Customers 
where Email IS NULL


-- Show all products where:

-- Category is NOT Home
-- AND Price BETWEEN 1000 AND 10000
-- AND StockQty IN (10,15,20,25)
-- AND ProductName IS NOT NULL

select * from products 
where Category NOT IN('Home')
AND price Between 1000 AND 10000
AND StockQty IN (10,15,20,25)
AND ProductName IS NOT NULL 