-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 6 - Triggers
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Triggers
---------------------------------------------------------

DROP TRIGGER IF EXISTS trg_BookPriceAudit;
DROP TRIGGER IF EXISTS trg_BlockDeleteBook;
DROP TRIGGER IF EXISTS trg_UpdateDiscountPrice;
GO

---------------------------------------------------------
-- Create Audit Table
---------------------------------------------------------

DROP TABLE IF EXISTS BookPriceAudit;
GO

CREATE TABLE BookPriceAudit
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    OldPrice DECIMAL(10,2),
    NewPrice DECIMAL(10,2),
    UpdatedOn DATETIME DEFAULT GETDATE()
);
GO

---------------------------------------------------------
-- Exercise 1
-- AFTER UPDATE Trigger
---------------------------------------------------------

CREATE TRIGGER trg_BookPriceAudit
ON Books
AFTER UPDATE
AS
BEGIN

    INSERT INTO BookPriceAudit
    (
        BookID,
        OldPrice,
        NewPrice
    )

    SELECT
        d.BookID,
        d.Price,
        i.Price

    FROM deleted d
    INNER JOIN inserted i
        ON d.BookID = i.BookID

    WHERE d.Price <> i.Price;

END;
GO

---------------------------------------------------------
-- Test Trigger
---------------------------------------------------------

UPDATE Books
SET Price = 650
WHERE BookID = 101;
GO

SELECT * FROM BookPriceAudit;
GO

---------------------------------------------------------
-- Exercise 2
-- INSTEAD OF DELETE Trigger
---------------------------------------------------------

CREATE TRIGGER trg_BlockDeleteBook
ON Books
INSTEAD OF DELETE
AS
BEGIN

    RAISERROR
    (
        'Deleting book records is not allowed.',
        16,
        1
    );

END;
GO

---------------------------------------------------------
-- Test Delete Trigger
---------------------------------------------------------

BEGIN TRY

    DELETE FROM Books
    WHERE BookID = 102;

END TRY

BEGIN CATCH

    PRINT ERROR_MESSAGE();

END CATCH;
GO

---------------------------------------------------------
-- Exercise 3
-- LOGON Trigger
---------------------------------------------------------

/*

CREATE TRIGGER trg_LoginRestriction
ON ALL SERVER
FOR LOGON
AS
BEGIN

    IF DATEPART(HOUR,GETDATE()) BETWEEN 1 AND 2
        ROLLBACK;

END;
GO

*/

---------------------------------------------------------
-- Exercise 4
-- Modify Trigger
---------------------------------------------------------

ALTER TRIGGER trg_BookPriceAudit
ON Books
AFTER UPDATE
AS
BEGIN

    INSERT INTO BookPriceAudit
    (
        BookID,
        OldPrice,
        NewPrice
    )

    SELECT
        d.BookID,
        d.Price,
        i.Price

    FROM deleted d
    INNER JOIN inserted i
        ON d.BookID = i.BookID;

END;
GO

---------------------------------------------------------
-- Exercise 5
-- Delete Trigger
---------------------------------------------------------

DROP TRIGGER trg_BlockDeleteBook;
GO

---------------------------------------------------------
-- Verify Trigger Deleted
---------------------------------------------------------

SELECT name
FROM sys.triggers
WHERE name = 'trg_BlockDeleteBook';
GO

---------------------------------------------------------
-- Exercise 6
-- Maintain Discount Price
---------------------------------------------------------

IF COL_LENGTH('Books','DiscountPrice') IS NULL
BEGIN

    ALTER TABLE Books
    ADD DiscountPrice DECIMAL(10,2);

END;
GO

DROP TRIGGER IF EXISTS trg_UpdateDiscountPrice;
GO

CREATE TRIGGER trg_UpdateDiscountPrice
ON Books
AFTER UPDATE
AS
BEGIN

    UPDATE B

    SET DiscountPrice = B.Price - (B.Price * 0.10)

    FROM Books B
    INNER JOIN inserted I
        ON B.BookID = I.BookID;

END;
GO

---------------------------------------------------------
-- Test Trigger
---------------------------------------------------------

UPDATE Books
SET Price = 750
WHERE BookID = 103;
GO

SELECT
    BookID,
    BookTitle,
    Price,
    DiscountPrice
FROM Books
WHERE BookID = 103;
GO