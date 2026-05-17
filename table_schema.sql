
-- Table Schema defines the structure of my DB.

-- We are going to define 
-- * Tables for our Database 
-- * what columns they CONTAINS
-- * what Datatype Each column should USE
-- * How rows are uniquely identified

----------------------------------------------------------------------------

--USE UrbanKart

-----------------------------------------------------------------------------


-- Let us create our First Table (Customers)

--SCHEMA -- Customers(CustomerID, FirstName, LastName, Email, Phone, CreatedAt)

CREATE TABLE Customers(

    CustomerID  --uniquely identify every customer in the system
        INT
        PRIMARY KEY  --two customers cannot get the sameID PK[notNull,unique]
        IDENTITY(1,1),

    FirstName
        NVARCHAR(50) 
        NOT NULL
        CHECK(
            LEN(FirstName)>=2
            AND FirstName NOT LIKE '%[0-9]%'

        ),

    LastName 
        NVARCHAR(50) 
        NOT NULL
        CHECK(
            LEN(LastName)>=2
            AND LastName NOT LIKE '%[0-9]%'

        ),

    Email
        NVARCHAR(100)
        NOT NULL -- email must be present for account verification
        UNIQUE   -- every email must be unique, and be enforced at DB level
        CHECK(
            Email  LIKE '%@%.%'
            AND Email NOT LIKE '% %'   --Emails shouldn't have spaces between them
        ),

    Phone
        NVARCHAR(15)
        NOT NULL
        UNIQUE
        CHECK(
            LEN(Phone)>=10
            AND Phone NOT LIKE '%[^0-9]%'
        ),

    CreatedAt
        DATETIME -- stores both date and time 
        NOT NULL
        DEFAULT GETDATE()  -- automatically inserts current system date&time

)


--------------------------------------------------------------------------

-- PRODUCT TABLE
-- Products(ProductID, ProductName, Category, Price, StockQty)

CREATE TABLE PRODUCT(

    ProductID  --ID exists purely so DB can reliably track products
        INT
        PRIMARY KEY  -- IDs are a system identity, not a business meaning 
        IDENTITY(1,1),
    
    ProductName  --stores actual names of customers while browsing producst
        NVARCHAR(100)
        NOT NULL
        CHECK(
            LEN(ProductName) >=3
            AND ProductName NOT LIKE '%[^a-zA-Z0-9]%'
        ),

    Category
        NVARCHAR(50)
        NOT NULL
        CHECK(
            LEN(Category) >= 3
            AND Category NOT LIKE '%[^a-zA-Z]%'
        ),

    
    Price 
    








);


































