
# Lab 1 – Understanding ORM with EF Core

## Objective

Understand Object Relational Mapping (ORM) and how Entity Framework Core simplifies database operations for a Library Management System.

## Concepts Covered

* ORM
* Entity Framework Core
* EF Core vs EF Framework
* EF Core 8 Features
* SQL Server Integration

## Project

LibraryManagement

## Technologies Used

* C#
* .NET 8
* Entity Framework Core 8
* SQL Server

## Outcome

Created the LibraryManagement console application and installed the required EF Core packages for database operations.

---

# Lab 2 – Setting Up DbContext

## Objective

Create entity classes and configure Entity Framework Core with SQL Server.

## Concepts Covered

* Entity Classes
* DbContext
* DbSet
* SQL Server Connection
* Navigation Properties

## Files Created

* Models/Category.cs
* Models/Book.cs
* Data/LibraryDbContext.cs

## Outcome

Successfully created book models and configured the EF Core database context.

---

# Lab 3 – EF Core Migrations

## Objective

Create the initial migration and generate the SQL Server database.

## Concepts Covered

* EF Core CLI
* Initial Migration
* Database Update
* Schema Generation

## Commands Used

```powershell
dotnet ef migrations add InitialCreate
dotnet ef database update
```

## Outcome

Successfully generated the migration and created the LibraryManagement database.

---

# Lab 4 – Insert Initial Data

## Objective

Insert initial categories and books into the database using Entity Framework Core.

## Concepts Covered

* AddAsync()
* AddRangeAsync()
* SaveChangesAsync()

## Records Inserted

### Categories

* Programming
* Fiction

### Books

* Clean Code
* The Alchemist

## Outcome

Successfully inserted initial records into the LibraryManagement database.

---

# Lab 5 – Retrieving Data

## Objective

Retrieve book information from the database using Entity Framework Core.

## Concepts Covered

* ToListAsync()
* FindAsync()
* FirstOrDefaultAsync()

## Operations Performed

* Retrieve all books
* Find book by ID
* Retrieve first book with price greater than ₹500

## Outcome

Successfully queried book data using asynchronous EF Core methods.

---

# Lab 6 – Update and Delete Records

## Objective

Perform update and delete operations using Entity Framework Core.

## Concepts Covered

* FindAsync()
* Entity Tracking
* SaveChangesAsync()
* Remove()

## Operations Performed

* Updated Clean Code price from ₹550 to ₹650
* Deleted The Alchemist book

## Outcome

Successfully performed Update and Delete operations using EF Core.

---

# Lab 7 – Writing LINQ Queries

## Objective

Learn how to query book data using LINQ in Entity Framework Core.

## Topics Covered

* Where()
* OrderByDescending()
* Select()
* DTO Projection

## Files Added

* DTOs/BookDTO.cs

## Outcome

Successfully filtered, sorted, and projected book data using LINQ.

---

# Lab 8 – Managing Migrations and Schema Changes

## Objective

Modify the existing Book entity by adding a new property (`AvailableCopies`) and update the SQL Server database schema.

## Concepts Covered

* Entity Modification
* Schema Changes
* EF Core Migrations
* Database Update
* Code-First Approach

## Changes Made

* Added `AvailableCopies` property to the Book entity.
* Created migration:

```
AddAvailableCopies
```

* Updated database schema.

## Commands Used

```powershell
dotnet build

dotnet ef migrations add AddAvailableCopies

dotnet ef database update
```

## Outcome

Successfully added the AvailableCopies column to the Books table.

---

# Lab 9 – Seeding Data During Migrations

## Objective

Seed initial data into the database using EF Core `HasData()`.

## Topics Covered

* ModelBuilder
* HasData()
* Data Seeding
* EF Core Migrations

## Seeded Data

### Categories

* Programming
* Fiction

### Books

* Clean Code
* The Alchemist

## Commands Used

```powershell
dotnet build

dotnet ef migrations add SeedInitialBooks

dotnet ef database update
```

## Outcome

Successfully configured initial book data seeding using EF Core migrations.

---

# Lab 10 – Data Loading

## Objective

Understand different techniques used to load related data.

## Concepts Covered

* Eager Loading
* Explicit Loading
* Lazy Loading

## Methods Used

* Include()
* Entry()
* Collection()
* LoadAsync()

## Outcome

Successfully demonstrated Eager Loading and Explicit Loading for Books and Categories.

---

# Lab 11 – Configuring Relationships

## Objective

Configure One-to-One and Many-to-Many relationships using Entity Framework Core.

## Concepts Covered

* One-to-One Relationship
* Many-to-Many Relationship
* Navigation Properties
* Fluent API

## Files Added

* Models/Publisher.cs
* Models/GenreTag.cs

## Files Modified

* Models/Book.cs
* Data/LibraryDbContext.cs
* Program.cs

## Outcome

Successfully configured relationships using EF Core Fluent API.

---

# Lab 12 – Handling Circular References

## Objective

Avoid circular references while retrieving related book entities using DTO Projection.

## Concepts Covered

* Circular References
* DTO Projection
* Select()
* Include()

## Files Added

* DTOs/BookSummaryDTO.cs

## Files Modified

* Program.cs

## Outcome

Successfully prevented circular reference issues using DTO projection.

---

# Lab 13 – Performance Optimization

## Objective

Improve EF Core query performance using AsNoTracking.

## Concepts Covered

* AsNoTracking()
* Read-only Queries
* Query Performance
* Tracking vs Non-Tracking

## Files Modified

* Program.cs

## Outcome

Successfully optimized book retrieval operations using AsNoTracking.

---

# Lab 14 – Batch Processing and Bulk Operations

## Objective

Perform batch operations using Entity Framework Core.

## Concepts Covered

* AddRangeAsync()
* SaveChangesAsync()
* RemoveRange()
* Batch Processing

## Files Modified

* Program.cs

## Operations Performed

* Bulk Insert Books
* Bulk Update Book Prices
* Bulk Delete Books

## Outcome

Successfully demonstrated batch operations using EF Core.

---

# Lab 15 – Optimistic Concurrency

## Objective

Implement optimistic concurrency control using RowVersion.

## Concepts Covered

* Optimistic Concurrency
* RowVersion
* Timestamp Attribute
* DbUpdateConcurrencyException

## Files Modified

* Models/Book.cs
* Program.cs

## Outcome

Successfully implemented optimistic concurrency handling using the RowVersion concurrency token for book records.


