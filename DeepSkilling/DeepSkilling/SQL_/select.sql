-- =====================================
-- SELECT Queries
-- =====================================

-- Display all records
SELECT * FROM Books;

--------------------------------------------------

-- Display only Title and Author
SELECT Title, Author
FROM Books;

--------------------------------------------------

-- Display Title, Category and Price
SELECT Title, Category, Price
FROM Books;

--------------------------------------------------

-- Display distinct categories
SELECT DISTINCT Category
FROM Books;

--------------------------------------------------

-- Display distinct publishers
SELECT DISTINCT Publisher
FROM Books;

--------------------------------------------------

-- Display Top 5 most expensive books
SELECT TOP 5 Title, Price
FROM Books
ORDER BY Price DESC;

--------------------------------------------------

-- Display Top 3 highest-rated books
SELECT TOP 3 Title, Rating
FROM Books
ORDER BY Rating DESC;

--------------------------------------------------

-- Display all Programming books
SELECT *
FROM Books
WHERE Category = 'Programming';

--------------------------------------------------

-- Display all Self Help books
SELECT *
FROM Books
WHERE Category = 'Self Help';

--------------------------------------------------

-- Display all Finance books
SELECT *
FROM Books
WHERE Category = 'Finance';

--------------------------------------------------

-- Display all Fantasy books
SELECT *
FROM Books
WHERE Category = 'Fantasy';

--------------------------------------------------

-- Display Title and Price
SELECT Title, Price
FROM Books;

--------------------------------------------------

-- Display books published after 2015
SELECT *
FROM Books
WHERE PublishedYear > 2015;

--------------------------------------------------

-- Display books with price greater than 600
SELECT *
FROM Books
WHERE Price > 600;

--------------------------------------------------

-- Display books with rating greater than 4.8
SELECT *
FROM Books
WHERE Rating > 4.8;

--------------------------------------------------

-- Display books with quantity greater than 20
SELECT *
FROM Books
WHERE Quantity > 20;

--------------------------------------------------

-- Display books published by Penguin
SELECT *
FROM Books
WHERE Publisher = 'Penguin';

--------------------------------------------------

-- Display books written by Robert C. Martin
SELECT *
FROM Books
WHERE Author = 'Robert C. Martin';

--------------------------------------------------

-- Display books costing less than 500
SELECT *
FROM Books
WHERE Price < 500;

--------------------------------------------------

-- Display books sorted by price
SELECT *
FROM Books
ORDER BY Price DESC;