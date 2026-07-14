-- =====================================
--  Views
-- =====================================

--------------------------------------------------
-- 1. Create a View to Display All Books
--------------------------------------------------

CREATE VIEW AllBooks
AS
SELECT *
FROM Books;

SELECT * FROM AllBooks;

--------------------------------------------------
-- 2. Create a View for Programming Books
--------------------------------------------------

CREATE VIEW ProgrammingBooksView
AS
SELECT Title, Author, Price
FROM Books
WHERE Category = 'Programming';

SELECT * FROM ProgrammingBooksView;

--------------------------------------------------
-- 3. Create a View for Self Help Books
--------------------------------------------------

CREATE VIEW SelfHelpBooksView
AS
SELECT Title, Author, Price
FROM Books
WHERE Category = 'Self Help';

SELECT * FROM SelfHelpBooksView;

--------------------------------------------------
-- 4. Create a View for Highly Rated Books
--------------------------------------------------

CREATE VIEW HighlyRatedBooksView
AS
SELECT Title, Author, Rating
FROM Books
WHERE Rating >= 4.8;

SELECT * FROM HighlyRatedBooksView;

--------------------------------------------------
-- 5. Create a View for Expensive Books
--------------------------------------------------

CREATE VIEW ExpensiveBooks
AS
SELECT Title, Author, Price
FROM Books
WHERE Price > 700;

SELECT * FROM ExpensiveBooks;

--------------------------------------------------
-- 6. Create a View for Books Above Average Price
--------------------------------------------------

CREATE VIEW AboveAveragePrice
AS
SELECT Title, Author, Price
FROM Books
WHERE Price >
(
    SELECT AVG(Price)
    FROM Books
);

SELECT * FROM AboveAveragePrice;

--------------------------------------------------
-- 7. Alter an Existing View
--------------------------------------------------

ALTER VIEW ExpensiveBooks
AS
SELECT Title, Author, Category, Price
FROM Books
WHERE Price > 700;

SELECT * FROM ExpensiveBooks;

--------------------------------------------------
-- 8. Update Data Using a View
--------------------------------------------------

UPDATE ExpensiveBooks
SET Price = 750
WHERE Title = 'Clean Code';

--------------------------------------------------
-- 9. Create a View Using JOIN
--------------------------------------------------

CREATE VIEW BookPublisherView
AS
SELECT b.Title,
       b.Author,
       p.PublisherName,
       p.Country
FROM Books b
INNER JOIN Publishers p
ON b.Publisher = p.PublisherName;

SELECT * FROM BookPublisherView;

--------------------------------------------------
-- 10. Drop a View
--------------------------------------------------

DROP VIEW AboveAveragePrice;