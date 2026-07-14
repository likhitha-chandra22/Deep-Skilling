CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

CREATE TABLE Books
(
    BookId INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Category VARCHAR(30),
    Publisher VARCHAR(50),
    Price DECIMAL(8,2),
    Quantity INT,
    PublishedYear INT,
    Rating DECIMAL(2,1)
);

INSERT INTO Books
VALUES
(101,'The Alchemist','Paulo Coelho','Fiction','HarperCollins',399.00,25,1988,4.8),
(102,'Atomic Habits','James Clear','Self Help','Penguin',550.00,18,2018,4.9),
(103,'Rich Dad Poor Dad','Robert Kiyosaki','Finance','Plata Publishing',450.00,20,1997,4.7),
(104,'Clean Code','Robert C. Martin','Programming','Prentice Hall',799.00,12,2008,4.9),
(105,'The Pragmatic Programmer','Andrew Hunt','Programming','Addison-Wesley',899.00,10,1999,4.8),
(106,'Introduction to Algorithms','Thomas H. Cormen','Programming','MIT Press',1200.00,8,2009,4.9),
(107,'Think Like a Monk','Jay Shetty','Self Help','Simon & Schuster',499.00,15,2020,4.6),
(108,'Harry Potter','J.K. Rowling','Fantasy','Bloomsbury',699.00,30,1997,4.9),
(109,'The Hobbit','J.R.R. Tolkien','Fantasy','Allen & Unwin',599.00,22,1937,4.8),
(110,'Wings of Fire','A.P.J. Abdul Kalam','Biography','Universities Press',350.00,35,1999,4.9),
(111,'Ikigai','Hector Garcia','Self Help','Penguin',499.00,16,2016,4.7),
(112,'Python Crash Course','Eric Matthes','Programming','No Starch Press',950.00,9,2019,4.8),
(113,'Deep Work','Cal Newport','Productivity','Grand Central',620.00,14,2016,4.7),
(114,'The Psychology of Money','Morgan Housel','Finance','Harriman House',540.00,17,2020,4.8),
(115,'Zero to One','Peter Thiel','Business','Crown Business',580.00,13,2014,4.6);