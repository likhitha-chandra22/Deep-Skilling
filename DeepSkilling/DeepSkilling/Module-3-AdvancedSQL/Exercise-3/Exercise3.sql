-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 3 - Views
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Views (if already exist)
---------------------------------------------------------

DROP VIEW IF EXISTS vw_BookReport;
DROP VIEW IF EXISTS vw_BookPriceDetails;
DROP VIEW IF EXISTS vw_BookTitleAuthor;
DROP VIEW IF EXISTS vw_BookBasicInfo;
GO

---------------------------------------------------------
-- Drop Tables (if already exist)
---------------------------------------------------------

DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
GO

---------------------------------------------------------
-- Create Authors Table
---------------------------------------------------------

CREATE TABLE Authors
(
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
);
GO

---------------------------------------------------------
-- Create Books Table
---------------------------------------------------------

CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    AuthorID INT,
    Category VARCHAR(50),
    Price DECIMAL(10,2),

    CONSTRAINT FK_Author
    FOREIGN KEY (AuthorID)
    REFERENCES Authors(AuthorID)
);
GO

---------------------------------------------------------
-- Insert Authors
---------------------------------------------------------

INSERT INTO Authors
VALUES
(1,'R.K. Narayan'),
(2,'Chetan Bhagat'),
(3,'Paulo Coelho'),
(4,'J.K. Rowling');
GO

---------------------------------------------------------
-- Insert Books
---------------------------------------------------------

INSERT INTO Books
VALUES
(101,'Malgudi Days',1,'Fiction',450),
(102,'Five Point Someone',2,'Novel',350),
(103,'The Alchemist',3,'Fiction',550),
(104,'Harry Potter',4,'Fantasy',700);
GO

---------------------------------------------------------
-- Display Tables
---------------------------------------------------------

SELECT * FROM Authors;
SELECT * FROM Books;
GO

---------------------------------------------------------
-- Exercise 1
-- Create Simple View
---------------------------------------------------------

CREATE VIEW vw_BookBasicInfo
AS
SELECT
    B.BookID,
    B.BookTitle,
    A.AuthorName,
    B.Category
FROM Books B
INNER JOIN Authors A
ON B.AuthorID = A.AuthorID;
GO

SELECT * FROM vw_BookBasicInfo;
GO

---------------------------------------------------------
-- Exercise 2
-- Book Title and Author View
---------------------------------------------------------

CREATE VIEW vw_BookTitleAuthor
AS
SELECT
    BookID,
    BookTitle + ' - ' + Category AS BookDetails,
    Price
FROM Books;
GO

SELECT * FROM vw_BookTitleAuthor;
GO

---------------------------------------------------------
-- Exercise 3
-- Book Price Details View
---------------------------------------------------------

CREATE VIEW vw_BookPriceDetails
AS
SELECT
    BookID,
    BookTitle,
    Category,
    Price,
    Price * 0.10 AS Discount
FROM Books;
GO

SELECT * FROM vw_BookPriceDetails;
GO

---------------------------------------------------------
-- Exercise 4
-- Book Report View
---------------------------------------------------------

CREATE VIEW vw_BookReport
AS
SELECT
    B.BookID,
    B.BookTitle,
    A.AuthorName,
    B.Category,
    B.Price,
    B.Price * 0.10 AS Discount,
    B.Price - (B.Price * 0.10) AS FinalPrice
FROM Books B
INNER JOIN Authors A
ON B.AuthorID = A.AuthorID;
GO

SELECT * FROM vw_BookReport;
GO