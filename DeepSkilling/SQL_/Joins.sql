-- =====================================
--  JOINS
-- =====================================

--------------------------------------------------
-- Create Publishers Table
--------------------------------------------------

CREATE TABLE Publishers
(
    PublisherId INT PRIMARY KEY,
    PublisherName VARCHAR(50),
    Country VARCHAR(30),
    EstablishedYear INT
);

--------------------------------------------------
-- Insert Data
--------------------------------------------------

INSERT INTO Publishers
VALUES
(1,'HarperCollins','USA',1989),
(2,'Penguin','UK',1935),
(3,'Plata Publishing','USA',1997),
(4,'Prentice Hall','USA',1913),
(5,'Addison-Wesley','USA',1942),
(6,'MIT Press','USA',1962),
(7,'Simon & Schuster','USA',1924),
(8,'Bloomsbury','UK',1986),
(9,'Allen & Unwin','Australia',1914),
(10,'Universities Press','India',1970),
(11,'No Starch Press','USA',1994),
(12,'Grand Central','USA',2006),
(13,'Harriman House','UK',1993),
(14,'Crown Business','USA',2008);


-------INNER JOIN-----
SELECT b.Title,
       b.Author,
       p.Country
FROM Books b
INNER JOIN Publishers p
ON b.Publisher = p.PublisherName;


SELECT b.Title,
       b.Category,
       p.EstablishedYear
FROM Books b
INNER JOIN Publishers p
ON b.Publisher = p.PublisherName;

-------LEFT JOIN------
SELECT b.Title,
       b.Publisher,
       p.Country
FROM Books b
LEFT JOIN Publishers p
ON b.Publisher = p.PublisherName;


-----RIGHT JOIN------
SELECT b.Title,
       b.Publisher,
       p.PublisherName
FROM Books b
RIGHT JOIN Publishers p
ON b.Publisher = p.PublisherName;

--------FULL OUTER JOIN------------
SELECT b.Title,
       b.Publisher,
       p.PublisherName
FROM Books b
FULL OUTER JOIN Publishers p
ON b.Publisher = p.PublisherName;



-------------CROSS JOIN------------
SELECT b.Title,
       p.PublisherName
FROM Books b
CROSS JOIN Publishers p;



-------------Books with Publisher Country----------
SELECT b.Title,
       p.Country
FROM Books b
INNER JOIN Publishers p
ON b.Publisher = p.PublisherName;

----------Books with Rating Greater Than 4.8------------
SELECT b.Title,
       b.Rating,
       p.Country
FROM Books b
INNER JOIN Publishers p
ON b.Publisher = p.PublisherName
WHERE b.Rating > 4.8;


-----------------Count Books by Publisher-------------
SELECT p.PublisherName,
       COUNT(b.BookId) AS TotalBooks
FROM Publishers p
LEFT JOIN Books b
ON p.PublisherName = b.Publisher
GROUP BY p.PublisherName;