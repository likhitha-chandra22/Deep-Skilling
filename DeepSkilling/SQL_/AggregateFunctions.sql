-- =====================================
--   Aggregate Functions
-- =====================================

-- Total number of books
SELECT COUNT(*) AS TotalBooks
FROM Books;

--------------------------------------------------

-- Count Programming books
SELECT COUNT(*) AS ProgrammingBooks
FROM Books
WHERE Category = 'Programming';

--------------------------------------------------

-- Count Self Help books
SELECT COUNT(*) AS SelfHelpBooks
FROM Books
WHERE Category = 'Self Help';

--------------------------------------------------

-- Count Finance books
SELECT COUNT(*) AS FinanceBooks
FROM Books
WHERE Category = 'Finance';

--------------------------------------------------

-- Total quantity of all books
SELECT SUM(Quantity) AS TotalQuantity
FROM Books;

--------------------------------------------------

-- Total price of all books
SELECT SUM(Price) AS TotalPrice
FROM Books;

--------------------------------------------------

-- Average book price
SELECT AVG(Price) AS AveragePrice
FROM Books;

--------------------------------------------------

-- Average quantity available
SELECT AVG(Quantity) AS AverageQuantity
FROM Books;

--------------------------------------------------

-- Average rating
SELECT AVG(Rating) AS AverageRating
FROM Books;

--------------------------------------------------

-- Costliest book
SELECT MAX(Price) AS HighestPrice
FROM Books;

--------------------------------------------------

-- Cheapest book
SELECT MIN(Price) AS LowestPrice
FROM Books;

--------------------------------------------------

-- Highest rating
SELECT MAX(Rating) AS HighestRating
FROM Books;

--------------------------------------------------

-- Lowest rating
SELECT MIN(Rating) AS LowestRating
FROM Books;

--------------------------------------------------

-- Latest published year
SELECT MAX(PublishedYear) AS LatestBook
FROM Books;

--------------------------------------------------

-- Oldest published year
SELECT MIN(PublishedYear) AS OldestBook
FROM Books;

--------------------------------------------------

-- Difference between highest and lowest book price
SELECT
MAX(Price) - MIN(Price) AS PriceDifference
FROM Books;

--------------------------------------------------

-- Total quantity of Programming books
SELECT SUM(Quantity) AS ProgrammingQuantity
FROM Books
WHERE Category = 'Programming';

--------------------------------------------------

-- Average price of Programming books
SELECT AVG(Price) AS AverageProgrammingPrice
FROM Books
WHERE Category = 'Programming';

--------------------------------------------------

-- Total quantity of Self Help books
SELECT SUM(Quantity) AS SelfHelpQuantity
FROM Books
WHERE Category = 'Self Help';

--------------------------------------------------

-- Count books with rating greater than 4.8
SELECT COUNT(*) AS HighlyRatedBooks
FROM Books
WHERE Rating > 4.8;

--------------------------------------------------

-- Average price of books published after 2015
SELECT AVG(Price) AS AverageRecentBookPrice
FROM Books
WHERE PublishedYear > 2015;