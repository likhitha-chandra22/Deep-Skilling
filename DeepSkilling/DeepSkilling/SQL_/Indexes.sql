-- =====================================
--  Indexes
-- =====================================

--------------------------------------------------
-- 1. Create a Non-Clustered Index on Title
--------------------------------------------------

CREATE INDEX IX_Books_Title
ON Books(Title);

--------------------------------------------------
-- 2. Create a Non-Clustered Index on Author
--------------------------------------------------

CREATE INDEX IX_Books_Author
ON Books(Author);

--------------------------------------------------
-- 3. Create a Non-Clustered Index on Category
--------------------------------------------------

CREATE INDEX IX_Books_Category
ON Books(Category);

--------------------------------------------------
-- 4. Create a Non-Clustered Index on Price
--------------------------------------------------

CREATE INDEX IX_Books_Price
ON Books(Price);

--------------------------------------------------
-- 5. Create a Non-Clustered Index on Publisher
--------------------------------------------------

CREATE INDEX IX_Books_Publisher
ON Books(Publisher);

--------------------------------------------------
-- 6. Create a Composite Index
--------------------------------------------------

CREATE INDEX IX_Category_Publisher
ON Books(Category, Publisher);

--------------------------------------------------
-- 7. Create a Unique Index
--------------------------------------------------

CREATE UNIQUE INDEX IX_Books_Title
ON Books(Title);

--------------------------------------------------
-- 8. View All Indexes
--------------------------------------------------

SELECT
    name AS IndexName,
    type_desc AS IndexType
FROM sys.indexes
WHERE object_id = OBJECT_ID('Books');

--------------------------------------------------
-- 9. Drop an Index
--------------------------------------------------

DROP INDEX IX_Books_Category
ON Books;

--------------------------------------------------
-- 10. Recreate the Dropped Index
--------------------------------------------------

CREATE INDEX IX_Books_Category
ON Books(Category);

-- Create Index on PublishedYear
CREATE INDEX IX_Books_PublishedYear
ON Books(PublishedYear);

-- Create Index on Rating
CREATE INDEX IX_Books_Rating
ON Books(Rating);

-- Create Composite Index on Category and Price
CREATE INDEX IX_Category_Price
ON Books(Category, Price);