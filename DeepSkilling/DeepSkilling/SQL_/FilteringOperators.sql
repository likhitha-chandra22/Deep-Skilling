-- =====================================
--   LIKE, BETWEEN, IN
-- =====================================

-- Books whose title starts with 'T'
SELECT *
FROM Books
WHERE Title LIKE 'T%';

--------------------------------------------------

-- Books whose title ends with 'e'
SELECT *
FROM Books
WHERE Title LIKE '%e';

--------------------------------------------------

-- Books whose title contains 'Code'
SELECT *
FROM Books
WHERE Title LIKE '%Code%';

--------------------------------------------------

-- Books whose second letter is 'h'
SELECT *
FROM Books
WHERE Title LIKE '_h%';

--------------------------------------------------

-- Authors whose name starts with 'J'
SELECT *
FROM Books
WHERE Author LIKE 'J%';

--------------------------------------------------

-- Publishers ending with 'Press'
SELECT *
FROM Books
WHERE Publisher LIKE '%Press';

--------------------------------------------------

-- Books priced between 500 and 800
SELECT *
FROM Books
WHERE Price BETWEEN 500 AND 800;

--------------------------------------------------

-- Books published between 2015 and 2020
SELECT *
FROM Books
WHERE PublishedYear BETWEEN 2015 AND 2020;

--------------------------------------------------

-- Books with rating between 4.7 and 4.9
SELECT *
FROM Books
WHERE Rating BETWEEN 4.7 AND 4.9;

--------------------------------------------------

-- Programming or Finance books
SELECT *
FROM Books
WHERE Category IN ('Programming','Finance');

--------------------------------------------------

-- Books published by Penguin or MIT Press
SELECT *
FROM Books
WHERE Publisher IN ('Penguin','MIT Press');

--------------------------------------------------

-- Books NOT in Programming or Self Help category
SELECT *
FROM Books
WHERE Category NOT IN ('Programming','Self Help');

--------------------------------------------------

-- Books NOT published by Penguin or HarperCollins
SELECT *
FROM Books
WHERE Publisher NOT IN ('Penguin','HarperCollins');

--------------------------------------------------

-- Books with NULL Rating
SELECT *
FROM Books
WHERE Rating IS NULL;

--------------------------------------------------

-- Books with NOT NULL Rating
SELECT *
FROM Books
WHERE Rating IS NOT NULL;