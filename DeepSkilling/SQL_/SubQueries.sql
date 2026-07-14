-- =====================================
--  Sub Queries
-- =====================================

--------------------------------------------------
-- 1. Costliest Book
--------------------------------------------------

SELECT *
FROM Books
WHERE Price =
(
    SELECT MAX(Price)
    FROM Books
);

--------------------------------------------------
-- 2. Cheapest Book
--------------------------------------------------

SELECT *
FROM Books
WHERE Price =
(
    SELECT MIN(Price)
    FROM Books
);

--------------------------------------------------
-- 3. Books Costing More Than Average Price
--------------------------------------------------

SELECT *
FROM Books
WHERE Price >
(
    SELECT AVG(Price)
    FROM Books
);

--------------------------------------------------
-- 4. Books With Rating Above Average
--------------------------------------------------

SELECT *
FROM Books
WHERE Rating >
(
    SELECT AVG(Rating)
    FROM Books
);

--------------------------------------------------
-- 5. Books Published After Average Published Year
--------------------------------------------------

SELECT *
FROM Books
WHERE PublishedYear >
(
    SELECT AVG(PublishedYear)
    FROM Books
);

--------------------------------------------------
-- 6. Books Published Before Average Published Year
--------------------------------------------------

SELECT *
FROM Books
WHERE PublishedYear <
(
    SELECT AVG(PublishedYear)
    FROM Books
);

--------------------------------------------------
-- 7. Books in the Same Category as 'Atomic Habits'
--------------------------------------------------

SELECT *
FROM Books
WHERE Category =
(
    SELECT Category
    FROM Books
    WHERE Title = 'Atomic Habits'
);

--------------------------------------------------
-- 8. Books Costing More Than 'Rich Dad Poor Dad'
--------------------------------------------------

SELECT *
FROM Books
WHERE Price >
(
    SELECT Price
    FROM Books
    WHERE Title = 'Rich Dad Poor Dad'
);

--------------------------------------------------
-- 9. Books With Higher Rating Than 'The Alchemist'
--------------------------------------------------

SELECT *
FROM Books
WHERE Rating >
(
    SELECT Rating
    FROM Books
    WHERE Title = 'The Alchemist'
);

--------------------------------------------------
-- 10. Highest Priced Book(s)
--------------------------------------------------

SELECT Title, Price
FROM Books
WHERE Price =
(
    SELECT MAX(Price)
    FROM Books
);

--------------------------------------------------
-- 11. Lowest Rated Book
--------------------------------------------------

SELECT *
FROM Books
WHERE Rating =
(
    SELECT MIN(Rating)
    FROM Books
);

--------------------------------------------------
-- 12. Publishers Having Books Costing More Than 900
--------------------------------------------------

SELECT DISTINCT Publisher
FROM Books
WHERE Publisher IN
(
    SELECT Publisher
    FROM Books
    WHERE Price > 900
);

--------------------------------------------------
-- 13. Books From Categories Having More Than 2 Books
--------------------------------------------------

SELECT *
FROM Books
WHERE Category IN
(
    SELECT Category
    FROM Books
    GROUP BY Category
    HAVING COUNT(*) > 2
);

--------------------------------------------------
-- 14. EXISTS Example
--------------------------------------------------

SELECT Title
FROM Books b
WHERE EXISTS
(
    SELECT *
    FROM Publishers p
    WHERE b.Publisher = p.PublisherName
);

--------------------------------------------------
-- 15. NOT EXISTS Example
--------------------------------------------------

SELECT PublisherName
FROM Publishers p
WHERE NOT EXISTS
(
    SELECT *
    FROM Books b
    WHERE b.Publisher = p.PublisherName
);

--------------------------------------------------
-- 16. ANY Example
--------------------------------------------------

SELECT *
FROM Books
WHERE Price > ANY
(
    SELECT Price
    FROM Books
    WHERE Category = 'Programming'
);

--------------------------------------------------
-- 17. ALL Example
--------------------------------------------------

SELECT *
FROM Books
WHERE Price > ALL
(
    SELECT Price
    FROM Books
    WHERE Category = 'Programming'
);

--------------------------------------------------
-- 18. Correlated Subquery
--------------------------------------------------

SELECT Title,
       Category,
       Price
FROM Books b1
WHERE Price >
(
    SELECT AVG(Price)
    FROM Books b2
    WHERE b1.Category = b2.Category
);

--------------------------------------------------
-- 19. Category Having Maximum Average Price
--------------------------------------------------

SELECT TOP 1 Category,
AVG(Price) AS AvgPrice
FROM Books
GROUP BY Category
ORDER BY AvgPrice DESC;

--------------------------------------------------
-- 20. Second Highest Book Price
--------------------------------------------------

SELECT MAX(Price) AS SecondHighestPrice
FROM Books
WHERE Price <
(
    SELECT MAX(Price)
    FROM Books
);