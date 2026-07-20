-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 8 - Exception Handling
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Create Audit Log Table
---------------------------------------------------------

DROP TABLE IF EXISTS AuditLog;
GO

CREATE TABLE AuditLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Action VARCHAR(100),
    ErrorMessage VARCHAR(500),
    LogDate DATETIME DEFAULT GETDATE()
);
GO

---------------------------------------------------------
-- Drop Existing Procedure
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_AddNewBook;
GO

---------------------------------------------------------
-- Exercise 1
-- TRY...CATCH with Error Logging
---------------------------------------------------------

CREATE PROCEDURE sp_AddNewBook
(
    @BookID INT,
    @BookTitle VARCHAR(100),
    @AuthorID INT,
    @Category VARCHAR(50),
    @Price DECIMAL(10,2)
)
AS
BEGIN
    BEGIN TRY

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

        PRINT 'Book inserted successfully.';

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog(Action, ErrorMessage)
        VALUES
        (
            'Add Book',
            ERROR_MESSAGE()
        );

        PRINT 'Error logged successfully.';

    END CATCH
END;
GO

EXEC sp_AddNewBook
105,
'Clean Code',
1,
'Programming',
950;
GO

---------------------------------------------------------
-- Exercise 2
-- THROW
---------------------------------------------------------

ALTER PROCEDURE sp_AddNewBook
(
    @BookID INT,
    @BookTitle VARCHAR(100),
    @AuthorID INT,
    @Category VARCHAR(50),
    @Price DECIMAL(10,2)
)
AS
BEGIN
    BEGIN TRY

        INSERT INTO Books
        VALUES
        (
            @BookID,
            @BookTitle,
            @AuthorID,
            @Category,
            @Price
        );

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog(Action, ErrorMessage)
        VALUES
        (
            'THROW Example',
            ERROR_MESSAGE()
        );

        THROW;

    END CATCH
END;
GO

EXEC sp_AddNewBook
105,
'Clean Code',
1,
'Programming',
950;
GO

---------------------------------------------------------
-- Exercise 3
-- RAISERROR
---------------------------------------------------------

ALTER PROCEDURE sp_AddNewBook
(
    @BookID INT,
    @BookTitle VARCHAR(100),
    @AuthorID INT,
    @Category VARCHAR(50),
    @Price DECIMAL(10,2)
)
AS
BEGIN

    IF @Price <= 0
    BEGIN
        RAISERROR
        (
            'Book price must be greater than zero.',
            16,
            1
        );
        RETURN;
    END

    BEGIN TRY

        INSERT INTO Books
        VALUES
        (
            @BookID,
            @BookTitle,
            @AuthorID,
            @Category,
            @Price
        );

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog(Action, ErrorMessage)
        VALUES
        (
            'Price Validation',
            ERROR_MESSAGE()
        );

    END CATCH

END;
GO

EXEC sp_AddNewBook
106,
'SQL Basics',
2,
'Programming',
-100;
GO

---------------------------------------------------------
-- Exercise 4
-- Nested TRY...CATCH
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateBookAuthor;
GO

CREATE PROCEDURE sp_UpdateBookAuthor
(
    @BookID INT,
    @AuthorID INT
)
AS
BEGIN

    BEGIN TRY

        BEGIN TRY

            IF NOT EXISTS
            (
                SELECT *
                FROM Authors
                WHERE AuthorID=@AuthorID
            )
            BEGIN
                RAISERROR
                (
                    'Invalid Author.',
                    16,
                    1
                );
            END

            UPDATE Books
            SET AuthorID=@AuthorID
            WHERE BookID=@BookID;

        END TRY

        BEGIN CATCH

            INSERT INTO AuditLog(Action, ErrorMessage)
            VALUES
            (
                'Update Author',
                ERROR_MESSAGE()
            );

            THROW;

        END CATCH

    END TRY

    BEGIN CATCH

        PRINT ERROR_MESSAGE();

    END CATCH

END;
GO

EXEC sp_UpdateBookAuthor
101,
99;
GO

---------------------------------------------------------
-- Exercise 5
-- Transaction Handling
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_InsertBooksBatch;
GO

CREATE PROCEDURE sp_InsertBooksBatch
AS
BEGIN

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO Books
        VALUES
        (
            107,
            'AI Basics',
            1,
            'Technology',
            700
        );

        INSERT INTO Books
        VALUES
        (
            108,
            'Machine Learning',
            2,
            'Technology',
            900
        );

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        INSERT INTO AuditLog(Action, ErrorMessage)
        VALUES
        (
            'Batch Insert',
            ERROR_MESSAGE()
        );

        PRINT 'Transaction Rolled Back';

    END CATCH

END;
GO

EXEC sp_InsertBooksBatch;
GO

---------------------------------------------------------
-- Exercise 6
-- Severity Levels
---------------------------------------------------------

ALTER PROCEDURE sp_AddNewBook
(
    @BookID INT,
    @BookTitle VARCHAR(100),
    @AuthorID INT,
    @Category VARCHAR(50),
    @Price DECIMAL(10,2)
)
AS
BEGIN

    IF @Price < 0
    BEGIN
        RAISERROR
        (
            'Negative price is not allowed.',
            16,
            1
        );
        RETURN;
    END

    IF @Price < 100
    BEGIN
        RAISERROR
        (
            'Book price is very low.',
            10,
            1
        );
    END

    BEGIN TRY

        INSERT INTO Books
        VALUES
        (
            @BookID,
            @BookTitle,
            @AuthorID,
            @Category,
            @Price
        );

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog(Action, ErrorMessage)
        VALUES
        (
            'Severity Test',
            ERROR_MESSAGE()
        );

    END CATCH

END;
GO

EXEC sp_AddNewBook
109,
'Cheap Book',
1,
'Programming',
50;
GO

EXEC sp_AddNewBook
110,
'Invalid Book',
1,
'Programming',
-200;
GO

---------------------------------------------------------
-- Display Audit Log
---------------------------------------------------------

SELECT *
FROM AuditLog;
GO