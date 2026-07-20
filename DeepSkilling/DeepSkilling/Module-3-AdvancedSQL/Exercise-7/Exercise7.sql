-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 7 - Cursors
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Exercise 1
-- Book Cursor
---------------------------------------------------------

DECLARE
    @BookID INT,
    @BookTitle VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10,2);

DECLARE BookCursor CURSOR
FOR
SELECT
    BookID,
    BookTitle,
    Category,
    Price
FROM Books;

OPEN BookCursor;

FETCH NEXT FROM BookCursor
INTO
    @BookID,
    @BookTitle,
    @Category,
    @Price;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT
    'Book ID: ' + CAST(@BookID AS VARCHAR)
    + ' | Title: ' + @BookTitle
    + ' | Category: ' + @Category
    + ' | Price: ' + CAST(@Price AS VARCHAR);

    FETCH NEXT FROM BookCursor
    INTO
        @BookID,
        @BookTitle,
        @Category,
        @Price;

END;

CLOSE BookCursor;
DEALLOCATE BookCursor;
GO

---------------------------------------------------------
-- Exercise 2
-- Static Cursor
---------------------------------------------------------

DECLARE BookStatic CURSOR STATIC
FOR
SELECT BookID, BookTitle
FROM Books;

OPEN BookStatic;

PRINT 'Static Cursor Opened';

CLOSE BookStatic;
DEALLOCATE BookStatic;
GO

---------------------------------------------------------
-- Exercise 3
-- Dynamic Cursor
---------------------------------------------------------

DECLARE BookDynamic CURSOR DYNAMIC
FOR
SELECT BookID, BookTitle
FROM Books;

OPEN BookDynamic;

PRINT 'Dynamic Cursor Opened';

CLOSE BookDynamic;
DEALLOCATE BookDynamic;
GO

---------------------------------------------------------
-- Exercise 4
-- Forward Only Cursor
---------------------------------------------------------

DECLARE BookForward CURSOR FORWARD_ONLY
FOR
SELECT BookID, BookTitle
FROM Books;

OPEN BookForward;

PRINT 'Forward Only Cursor Opened';

CLOSE BookForward;
DEALLOCATE BookForward;
GO

---------------------------------------------------------
-- Exercise 5
-- Keyset Cursor
---------------------------------------------------------

DECLARE BookKeyset CURSOR KEYSET
FOR
SELECT BookID, BookTitle
FROM Books;

OPEN BookKeyset;

PRINT 'Keyset Cursor Opened';

CLOSE BookKeyset;
DEALLOCATE BookKeyset;
GO

---------------------------------------------------------
-- Cursor Types Summary
---------------------------------------------------------

PRINT 'Cursor Types';

PRINT 'STATIC       - Uses a snapshot of the data';
PRINT 'DYNAMIC      - Reflects all changes';
PRINT 'FORWARD ONLY - Allows only forward movement';
PRINT 'KEYSET       - Fixed keys with updated values';
GO