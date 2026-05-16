
-- Table Schema defines the structure of my DB.

-- We are going to define 
-- * Tables for our Database 
-- * what columns they CONTAINS
-- * what Datatype Each column should USE
-- * How rows are uniquely identified


-- Let us create our First Table (Customers)

--USE UrbanKart

CREATE TABLE Customers(
    
    
    CustomerID 
        INT
        PRIMARY KEY
        IDENTITY(1,1),   -- (start_value, increment_value)

    FirstName
        VARCHAR(50)
        NOT NULL
        CHECK(LEN(FirstName)>=3 AND FirstName NOT LIKE '%[0-9]%' )
        --Prevents useless 2-letter names
        DEFAULT 'Unknown',


    LastName
        VARCHAR(50)
        NOT NULL
        CHECK(
            LEN(LastName)>=3 
            AND LastName NOT LIKE '%[0-9]%'
             )
        --Prevents useless 2-letter names 
        DEFAULT 'Unknown',

    
    Email
        VARCHAR(50)
        NOT NULL
        UNIQUE
        CHECK (Email LIKE '%@%.%'),

    Phone 
        VARCHAR(15)
        UNIQUE
        NOT NULL
        CHECK(
            LEN(Phone) >= 10 
            AND Phone NOT LIKE '%[a-z]%'
            ),

    City
        VARCHAR(50)
        NOT NULL
        DEFAULT 'Unknown'
        CHECK(
            LEN(City)>=5
            AND City NOT LIKE '%[0-9]%'
        ),
)


---- Let's Create our Second Table PRODUCTS

CREATE TABLE Products (

    ProductID 
        INT
        PRIMARY KEY
        IDENTITY(1,1),

    ProductName
        VARCHAR(50)
        NOT NULL


        











)























