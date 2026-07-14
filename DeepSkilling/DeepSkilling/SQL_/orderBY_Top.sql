-- =====================================
--   ORDER BY & TOP
-- =====================================

-- Display all books sorted by Title (Ascending)
SELECT *
FROM Books
ORDER BY Title ASC;

--------------------------------------------------

-- Display all books sorted by Title (Descending)
SELECT *
FROM Books
ORDER BY Title DESC;

--------------------------------------------------

-- Display books sorted by Price (Highest to Lowest)
SELECT *
FROM Books
ORDER BY Price DESC;

--------------------------------------------------

-- Display books sorted by Price (Lowest to Highest)
SELECT *
FROM Books
ORDER BY Price ASC;

--------------------------------------------------

-- Display books sorted by Rating (Highest to Lowest)
SELECT *
FROM Books
ORDER BY Rating DESC;

--------------------------------------------------

-- Display books sorted by Published Year (Newest to Oldest)
SELECT *
FROM Books
ORDER BY PublishedYear DESC;

--------------------------------------------------

-- Display books sorted by Published Year (Oldest to Newest)
SELECT *
FROM Books
ORDER BY PublishedYear ASC;

--------------------------------------------------

-- Display books sorted by Quantity (Highest to Lowest)
SELECT *
FROM Books
ORDER BY Quantity DESC;

--------------------------------------------------

-- Display Top 5 most expensive books
SELECT TOP 5 *
FROM Books
ORDER BY Price DESC;

--------------------------------------------------

-- Display Top 5 cheapest books
SELECT TOP 5 *
FROM Books
ORDER BY Price ASC;

--------------------------------------------------

-- Display Top 5 highest-rated books
SELECT TOP 5 *
FROM Books
ORDER BY Rating DESC;

--------------------------------------------------

-- Display Top 5 newest books
SELECT TOP 5 *
FROM Books
ORDER BY PublishedYear DESC;

--------------------------------------------------

-- Display Top 5 oldest books
SELECT TOP 5 *
FROM Books
ORDER BY PublishedYear ASC;

--------------------------------------------------

-- Sort by Category and then by Price
SELECT *
FROM Books
ORDER BY Category ASC, Price DESC;

--------------------------------------------------

-- Sort by Publisher and then by Title
SELECT *
FROM Books
ORDER BY Publisher ASC, Title ASC;

--------------------------------------------------

-- Sort by Rating and then by Price
SELECT *
FROM Books
ORDER BY Rating DESC, Price DESC;