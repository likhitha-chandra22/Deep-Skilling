-- =====================================
--   GROUP BY & HAVING
-- =====================================

-- 1. Count books in each category
SELECT Category,
COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 2. Count books by publisher
SELECT Publisher,
COUNT(*) AS TotalBooks
FROM Books
GROUP BY Publisher;

--------------------------------------------------

-- 3. Average price of books in each category
SELECT Category,
AVG(Price) AS AveragePrice
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 4. Average rating by category
SELECT Category,
AVG(Rating) AS AverageRating
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 5. Total quantity available in each category
SELECT Category,
SUM(Quantity) AS TotalQuantity
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 6. Total price of books by publisher
SELECT Publisher,
SUM(Price) AS TotalPrice
FROM Books
GROUP BY Publisher;

--------------------------------------------------

-- 7. Highest priced book in each category
SELECT Category,
MAX(Price) AS HighestPrice
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 8. Lowest priced book in each category
SELECT Category,
MIN(Price) AS LowestPrice
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 9. Latest published year in each category
SELECT Category,
MAX(PublishedYear) AS LatestPublished
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 10. Highest rating in each category
SELECT Category,
MAX(Rating) AS HighestRating
FROM Books
GROUP BY Category;

--------------------------------------------------

-- 11. Categories having more than 2 books
SELECT Category,
COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category
HAVING COUNT(*) > 2;

--------------------------------------------------

-- 12. Categories with average price greater than 600
SELECT Category,
AVG(Price) AS AveragePrice
FROM Books
GROUP BY Category
HAVING AVG(Price) > 600;

--------------------------------------------------

-- 13. Publishers having more than 1 book
SELECT Publisher,
COUNT(*) AS TotalBooks
FROM Books
GROUP BY Publisher
HAVING COUNT(*) > 1;

--------------------------------------------------

-- 14. Categories with total quantity greater than 30
SELECT Category,
SUM(Quantity) AS TotalQuantity
FROM Books
GROUP BY Category
HAVING SUM(Quantity) > 30;

--------------------------------------------------

-- 15. Categories with average rating greater than 4.8
SELECT Category,
AVG(Rating) AS AverageRating
FROM Books
GROUP BY Category
HAVING AVG(Rating) > 4.8;

--------------------------------------------------

-- 16. Publishers whose average price is less than 600
SELECT Publisher,
AVG(Price) AS AveragePrice
FROM Books
GROUP BY Publisher
HAVING AVG(Price) < 600;

--------------------------------------------------

-- 17. Categories whose highest price is greater than 900
SELECT Category,
MAX(Price) AS HighestPrice
FROM Books
GROUP BY Category
HAVING MAX(Price) > 900;

--------------------------------------------------

-- 18. Categories whose minimum price is less than 400
SELECT Category,
MIN(Price) AS LowestPrice
FROM Books
GROUP BY Category
HAVING MIN(Price) < 400;

--------------------------------------------------

-- 19. Count books by Category and Publisher
SELECT Category,
Publisher,
COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category, Publisher;

--------------------------------------------------

-- 20. Publishers having exactly 2 books
SELECT Publisher,
COUNT(*) AS TotalBooks
FROM Books
GROUP BY Publisher
HAVING COUNT(*) = 2;