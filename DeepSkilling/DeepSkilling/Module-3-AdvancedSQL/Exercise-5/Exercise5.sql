-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 5 - User Defined Functions
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Functions
---------------------------------------------------------

DROP FUNCTION IF EXISTS fn_CalculateDiscount;
DROP FUNCTION IF EXISTS fn_GetBooksByCategory;
DROP FUNCTION IF EXISTS fn_CalculateFinalPrice;
DROP FUNCTION IF EXISTS fn_TotalBookPrice;
GO

---------------------------------------------------------
-- Exercise 1
-- Scalar Function
---------------------------------------------------------

CREATE FUNCTION fn_CalculateDiscount
(
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    RETURN @Price * 0.10;

END;
GO

---------------------------------------------------------
-- Test Scalar Function
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    Price,
    dbo.fn_CalculateDiscount(Price) AS Discount
FROM Books;
GO

---------------------------------------------------------
-- Exercise 2
-- Table Valued Function
---------------------------------------------------------

CREATE FUNCTION fn_GetBooksByCategory
(
    @Category VARCHAR(50)
)

RETURNS TABLE

AS

RETURN
(
    SELECT
        BookID,
        BookTitle,
        Category,
        Price

    FROM Books

    WHERE Category=@Category
);
GO

---------------------------------------------------------
-- Test Table Valued Function
---------------------------------------------------------

SELECT *
FROM dbo.fn_GetBooksByCategory('Fiction');
GO

---------------------------------------------------------
-- Exercise 3
-- Final Price Function
---------------------------------------------------------

CREATE FUNCTION fn_CalculateFinalPrice
(
    @Price DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

AS
BEGIN

    RETURN @Price - dbo.fn_CalculateDiscount(@Price);

END;
GO

---------------------------------------------------------
-- Test Final Price Function
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    Price,
    dbo.fn_CalculateFinalPrice(Price) AS FinalPrice
FROM Books;
GO

---------------------------------------------------------
-- Exercise 4
-- Modify Discount Function
---------------------------------------------------------

ALTER FUNCTION fn_CalculateDiscount
(
    @Price DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

AS
BEGIN

    RETURN @Price * 0.15;

END;
GO

---------------------------------------------------------
-- Test Modified Function
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    Price,
    dbo.fn_CalculateDiscount(Price) AS Discount
FROM Books;
GO

---------------------------------------------------------
-- Exercise 5
-- Delete Function
---------------------------------------------------------

DROP FUNCTION fn_CalculateFinalPrice;
GO

---------------------------------------------------------
-- Verify Function Deleted
---------------------------------------------------------

SELECT name
FROM sys.objects
WHERE type='FN'
AND name='fn_CalculateFinalPrice';
GO

---------------------------------------------------------
-- Exercise 6
-- Recreate Final Price Function
---------------------------------------------------------

CREATE FUNCTION fn_CalculateFinalPrice
(
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    RETURN @Price - dbo.fn_CalculateDiscount(@Price);

END;
GO

---------------------------------------------------------
-- Test Function
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    dbo.fn_CalculateFinalPrice(Price) AS FinalPrice
FROM Books;
GO

---------------------------------------------------------
-- Exercise 7
-- Final Price for BookID = 101
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    Price,
    dbo.fn_CalculateFinalPrice(Price) AS FinalPrice
FROM Books
WHERE BookID = 101;
GO

---------------------------------------------------------
-- Exercise 8
-- Books in Fiction Category
---------------------------------------------------------

SELECT *
FROM dbo.fn_GetBooksByCategory('Fiction');
GO

---------------------------------------------------------
-- Exercise 9
-- Nested Function
---------------------------------------------------------

CREATE FUNCTION fn_TotalBookPrice
(
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    RETURN @Price + dbo.fn_CalculateDiscount(@Price);

END;
GO

---------------------------------------------------------
-- Test Nested Function
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    Price,
    dbo.fn_TotalBookPrice(Price) AS TotalPrice
FROM Books;
GO

---------------------------------------------------------
-- Exercise 10
-- Modify Nested Function
---------------------------------------------------------

ALTER FUNCTION fn_TotalBookPrice
(
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    RETURN @Price + (@Price * 0.20);

END;
GO

---------------------------------------------------------
-- Test Modified Function
---------------------------------------------------------

SELECT
    BookID,
    BookTitle,
    Price,
    dbo.fn_TotalBookPrice(Price) AS TotalPrice
FROM Books;
GO