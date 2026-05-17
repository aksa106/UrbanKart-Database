
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

CREATE TABLE PRODUCTS(

    ProductID  --ID exists purely so DB can reliably track products
        INT
        PRIMARY KEY  -- IDs are a system identity, not a business meaning 
        IDENTITY(1,1),
    
    ProductName  --stores actual names of customers while browsing producst
        NVARCHAR(100)
        NOT NULL
        CHECK(
            LEN(ProductName) >=3
            AND ProductName NOT LIKE '%[^a-zA-Z0-9 .''&()+/-]%'
        ),

    Category  -- groups products into logical business sections
        NVARCHAR(50)
        NOT NULL  --no category can be NULL
        CHECK(
            LEN(Category) >= 3  --prevent extremely long category names
            AND Category NOT LIKE '%[^a-zA-Z ]%' --prevent having random symbols
        ),

    
    Price
        DECIMAL(10,2) --money should store precise values
        NOT NULL      --every product must have a price 
        CHECK(
            Price>0   --no product can have zero price 
        ),

    StockQty
        INT
        NOT NULL
        CHECK(
            StockQty >=0
        )

);

------------------------------------------------------------------------
--ORDERS TABLE

-- Tells which customer (CustomerID) bought --
-- which product (ProductID)
-- how much       (total amount)
-- and when       (date)

-- Now tables will start to relate to each other using (foregin key)
-- customer places ORDERS -- CustomerID
-- product gets ordered   -- ProductID

------------------------------------


--SCHEMA -- Orders (OrderID, CustomerID, ProductID, Quantity, TotalAmount, OrderDate)


CREATE TABLE ORDERS (

    OrderID  --Every order placed on UrbanKart gets a unique Order Identity
        INT
        PRIMARY KEY
        IDENTITY(1,1),

    CustomerID --identifies which customer placed orders
        INT 
        NOT NULL,

        FOREIGN KEY(CustomerID)
        REFERENCES Customers(CustomerID),

    ProductID
        INT
        NOT NULL,

        FOREIGN KEY(ProductID)
        REFERENCES Products(ProductID),

    -- CustomersID & ProductID in Orders are foreign key references to existing records, if we give auto generation of default ID here to both SQL will generate new random ID for them here in Orders table which will later wont match the ID generated in both respective table customers and products and will pollute data.



    Quantity --Stores how much units of a product customer ordered

        INT
        NOT NULL
        CHECK(
            Quantity > 0
        ),

     TotalAmount  -- Price x Quantity
        DECIMAL(10,2)
        NOT NULL
        CHECK(           --can never be negative and zero
            TotalAmount > 0
        ),


    OrderDate
        DATETIME  -- helps to analyze peak sales hours, revenue, trends etc
        NOT NULL
        DEFAULT GETDATE()

)











































