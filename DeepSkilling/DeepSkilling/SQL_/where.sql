-- =====================================
--  WHERE Clause
-- =====================================

-- Books with price greater than 700
SELECT *
FROM Books
WHERE Price > 700;

--------------------------------------------------

-- Books with rating greater than 4.8
SELECT *
FROM Books
WHERE Rating > 4.8;

--------------------------------------------------

-- Books published before 2000
SELECT *
FROM Books
WHERE PublishedYear < 2000;

--------------------------------------------------

-- Books published in or after 2018
SELECT *
FROM Books
WHERE PublishedYear >= 2018;

--------------------------------------------------

-- Books in the Programming category
SELECT *
FROM Books
WHERE Category = 'Programming';

--------------------------------------------------

-- Books not in the Programming category
SELECT *
FROM Books
WHERE Category <> 'Programming';

--------------------------------------------------

-- Programming books costing more than 800
SELECT *
FROM Books
WHERE Category = 'Programming'
AND Price > 800;

--------------------------------------------------

-- Books in Programming or Finance category
SELECT *
FROM Books
WHERE Category = 'Programming'
OR Category = 'Finance';

--------------------------------------------------

-- Books that are NOT Self Help
SELECT *
FROM Books
WHERE NOT Category = 'Self Help';

--------------------------------------------------

-- Books with price greater than 500 and rating above 4.8
SELECT *
FROM Books
WHERE Price > 500
AND Rating > 4.8;

--------------------------------------------------

-- Self Help books costing more than 500
SELECT *
FROM Books
WHERE Category = 'Self Help'
AND Price > 500;

--------------------------------------------------

-- Programming books published after 2015
SELECT *
FROM Books
WHERE Category = 'Programming'
AND PublishedYear > 2015;

--------------------------------------------------

-- Books published by Penguin with price above 500
SELECT *
FROM Books
WHERE Publisher = 'Penguin'
AND Price > 500;

--------------------------------------------------

-- Books in Fantasy or Biography category
SELECT *
FROM Books
WHERE Category = 'Fantasy'
OR Category = 'Biography';

--------------------------------------------------

-- Books with quantity equal to 10
SELECT *
FROM Books
WHERE Quantity = 10;