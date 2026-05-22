
--use UrbanKart

-- Show all customers whose first name starts with A
select * from customers 
where FirstName LIKE 'A%'

-- Show all products whose category ends with s.
select * from products 
where Category LIKE '%s'

-- Show all products whose product name contains Phone.
select * from Products 
where ProductName LIKE '%Phone%'


-- Show all customers whose first name does NOT start with A
select * from Customers 
where FirstName NOT LIKE 'A%'


-- Show all products whose product name contains Watch or Phone
select * from products 
where ProductName LIKE '%Watch%' OR ProductName LIKE '%Phone%'

-- Show all categories that do NOT end with s.
select * from Products 
where Category NOT LIKE '%s'


-- Show all products whose product name starts with S and category is not Electronics

select * from products 
where ProductName LIKE 'S%' 
AND Category NOT IN('Electronics')


-- Show all customers whose email contains gmail but first name does not start with A
select * from Customers 
where FirstName NOT LIKE 'A%' 
AND Email LIKE '%gmail%'


-- Show all products where:
-- price is between 1000 and 10000
-- category is not Home
-- and product name contains either Watch or Keyboard
select * 
from products 
where Price BETWEEN 1000 AND 10000
AND Category NOT IN('Home')
AND (
    ProductName LIKE '%Watch%' 
    OR ProductName LIKE '%Keyboard%'
)


-- Show all customers whose first name starts with any letter from A to M
select * from Customers 
where FirstName LIKE '[A-M]%'


-- Show all products whose product name contains at least one number
select * from products 
where ProductName LIKE '%[0-9]%'

-- Show all products whose category contains only alphabets and spaces
select * from products 
where Category  NOT LIKE '%[^a-zA-Z ]%'

-- Show all customers whose phone number starts with 98
select * from Customers 
where Phone LIKE '98%'

-- Show all products whose product name does not contain any numbers
select * from products 
where ProductName NOT LIKE '%[0-9]%'

-- Show all customers whose first name ends with the letter a.
select * from Customers 
where FirstName LIKE '%a'

--