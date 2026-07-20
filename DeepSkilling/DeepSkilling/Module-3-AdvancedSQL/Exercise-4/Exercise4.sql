-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 4 - Stored Procedures
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Procedures
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GetBooksByCategory;
DROP PROCEDURE IF EXISTS sp_InsertBook;
GO

---------------------------------------------------------
-- Exercise 1
-- Create Stored Procedure
---------------------------------------------------------

CREATE PROCEDURE sp_GetBooksByCategory
    @Category VARCHAR(50)
AS
BEGIN
    SELECT
        BookID,
        BookTitle,
        Price
    FROM Books
    WHERE Category = @Category;
END;
GO

EXEC sp_GetBooksByCategory 'Fiction';
GO

---------------------------------------------------------
-- Exercise 2
-- Insert Book
---------------------------------------------------------

CREATE PROCEDURE sp_InsertBook
    @BookID INT,
    @BookTitle VARCHAR(100),
    @AuthorID INT,
    @Category VARCHAR(50),
    @Price DECIMAL(10,2)
AS
BEGIN

    INSERT INTO Books
    (
        BookID,
        BookTitle,
        AuthorID,
        Category,
        Price
    )

    VALUES
    (
        @BookID,
        @BookTitle,
        @AuthorID,
        @Category,
        @Price
    );

END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM Books
    WHERE BookID = 105
)
BEGIN

EXEC sp_InsertBook
    105,
    'Clean Code',
    1,
    'Fiction',
    950;

END;
GO

SELECT * FROM Books;
GO

---------------------------------------------------------
-- Exercise 3
-- Modify Stored Procedure
---------------------------------------------------------

ALTER PROCEDURE sp_GetBooksByCategory
    @Category VARCHAR(50)
AS
BEGIN

    SELECT
        BookID,
        BookTitle,
        Price

    FROM Books

    WHERE Category=@Category;

END;
GO

EXEC sp_GetBooksByCategory 'Fiction';
GO

---------------------------------------------------------
-- Exercise 4
-- Delete Procedure
---------------------------------------------------------

DROP PROCEDURE sp_InsertBook;
GO

SELECT name
FROM sys.procedures
WHERE name='sp_InsertBook';
GO

---------------------------------------------------------
-- Exercise 5
-- Count Books by Category
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GetBookCount;
GO

CREATE PROCEDURE sp_GetBookCount
    @Category VARCHAR(50)
AS
BEGIN

    SELECT COUNT(*) AS TotalBooks
    FROM Books
    WHERE Category=@Category;

END;
GO

EXEC sp_GetBookCount 'Fiction';
GO

---------------------------------------------------------
-- Exercise 6
-- Output Parameter
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GetTotalBookPrice;
GO

CREATE PROCEDURE sp_GetTotalBookPrice
    @Category VARCHAR(50),
    @TotalPrice DECIMAL(12,2) OUTPUT
AS
BEGIN

    SELECT
        @TotalPrice = SUM(Price)

    FROM Books

    WHERE Category=@Category;

END;
GO

DECLARE @Price DECIMAL(12,2);

EXEC sp_GetTotalBookPrice
    'Fiction',
    @Price OUTPUT;

SELECT @Price AS TotalPrice;
GO

---------------------------------------------------------
-- Exercise 7
-- Update Book Price
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateBookPrice;
GO

CREATE PROCEDURE sp_UpdateBookPrice
    @BookID INT,
    @NewPrice DECIMAL(10,2)
AS
BEGIN

    UPDATE Books
    SET Price=@NewPrice
    WHERE BookID=@BookID;

END;
GO

EXEC sp_UpdateBookPrice
    101,
    700;
GO

SELECT *
FROM Books
WHERE BookID=101;
GO

---------------------------------------------------------
-- Exercise 8
-- Increase Price by Category
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_IncreaseBookPrice;
GO

CREATE PROCEDURE sp_IncreaseBookPrice
    @Category VARCHAR(50),
    @IncreaseAmount DECIMAL(10,2)
AS
BEGIN

    UPDATE Books
    SET Price = Price + @IncreaseAmount
    WHERE Category=@Category;

END;
GO

EXEC sp_IncreaseBookPrice
    'Fiction',
    100;
GO

SELECT *
FROM Books
WHERE Category='Fiction';
GO

---------------------------------------------------------
-- Exercise 9
-- Transaction
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateBookPriceTransaction;
GO

CREATE PROCEDURE sp_UpdateBookPriceTransaction
    @BookID INT,
    @NewPrice DECIMAL(10,2)
AS
BEGIN

    BEGIN TRY

        BEGIN TRANSACTION;

        UPDATE Books
        SET Price=@NewPrice
        WHERE BookID=@BookID;

        COMMIT TRANSACTION;

        PRINT 'Book Price Updated Successfully';

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        PRINT 'Transaction Failed';

    END CATCH

END;
GO

EXEC sp_UpdateBookPriceTransaction
    102,
    850;
GO

SELECT *
FROM Books
WHERE BookID=102;
GO

---------------------------------------------------------
-- Exercise 10
-- Dynamic SQL
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_SearchBook;
GO

CREATE PROCEDURE sp_SearchBook
    @ColumnName VARCHAR(50),
    @Value VARCHAR(100)
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    'SELECT * FROM Books
     WHERE ' + QUOTENAME(@ColumnName) + ' = @Value';

    EXEC sp_executesql
        @SQL,
        N'@Value VARCHAR(100)',
        @Value;

END;
GO

EXEC sp_SearchBook
    'BookTitle',
    'Malgudi Days';
GO

---------------------------------------------------------
-- Exercise 11
-- TRY...CATCH
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateBookPriceSafe;
GO

CREATE PROCEDURE sp_UpdateBookPriceSafe
    @BookID INT,
    @Price DECIMAL(10,2)
AS
BEGIN

    BEGIN TRY

        UPDATE Books
        SET Price=@Price
        WHERE BookID=@BookID;

        PRINT 'Book Price Updated Successfully';

    END TRY

    BEGIN CATCH

        PRINT 'Error Occurred';

        PRINT ERROR_MESSAGE();

    END CATCH

END;
GO

EXEC sp_UpdateBookPriceSafe
    103,
    600;
GO

SELECT *
FROM Books
WHERE BookID=103;
GO