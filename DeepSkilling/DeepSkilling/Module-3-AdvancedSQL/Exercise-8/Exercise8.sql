-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 8 - Exception Handling
-- =====================================================

USE Cognizant_SQL_Exception;
GO

---------------------------------------------------------
-- Drop Existing Procedure
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_AddNewEmployee;
GO

---------------------------------------------------------
-- Exercise 1
-- TRY...CATCH with Error Logging
---------------------------------------------------------

CREATE PROCEDURE sp_AddNewEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        Email,
        Salary,
        DepartmentID
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Email,
        @Salary,
        @DepartmentID
    );

    PRINT 'Employee record inserted successfully.';

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    (
        Action,
        ErrorMessage
    )
    VALUES
    (
        'Insert Employee',
        ERROR_MESSAGE()
    );

    PRINT 'Error information stored.';

END CATCH

END;
GO

EXEC sp_AddNewEmployee
201,
'Rahul',
'Sharma',
'rahul@gmail.com',
42000,
2;
GO

---------------------------------------------------------
-- Exercise 2
-- THROW Statement
---------------------------------------------------------

ALTER PROCEDURE sp_AddNewEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    INSERT INTO Employees
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Email,
        @Salary,
        @DepartmentID
    );

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    VALUES
    (
        'THROW Example',
        ERROR_MESSAGE()
    );

    THROW;

END CATCH

END;
GO

EXEC sp_AddNewEmployee
201,
'Rahul',
'Sharma',
'rahul@gmail.com',
42000,
2;
GO

---------------------------------------------------------
-- Exercise 3
-- RAISERROR
---------------------------------------------------------

ALTER PROCEDURE sp_AddNewEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

IF @Salary <= 0
BEGIN

    RAISERROR
    (
        'Salary should be greater than zero.',
        16,
        1
    );

    RETURN;

END

BEGIN TRY

    INSERT INTO Employees
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Email,
        @Salary,
        @DepartmentID
    );

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    VALUES
    (
        'Salary Validation',
        ERROR_MESSAGE()
    );

END CATCH

END;
GO

EXEC sp_AddNewEmployee
202,
'Ajay',
'Kumar',
'ajay@gmail.com',
-500,
2;
GO

---------------------------------------------------------
-- Exercise 4
-- Nested TRY...CATCH
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ChangeDepartment;
GO

CREATE PROCEDURE sp_ChangeDepartment
(
    @EmployeeID INT,
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    BEGIN TRY

        IF NOT EXISTS
        (
            SELECT 1
            FROM Departments
            WHERE DepartmentID=@DepartmentID
        )
        BEGIN
            RAISERROR
            (
                'Invalid Department.',
                16,
                1
            );
        END

        UPDATE Employees
        SET DepartmentID=@DepartmentID
        WHERE EmployeeID=@EmployeeID;

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog
        VALUES
        (
            'Department Transfer',
            ERROR_MESSAGE()
        );

        THROW;

    END CATCH

END TRY

BEGIN CATCH

    PRINT ERROR_MESSAGE();

END CATCH

END;
GO

EXEC sp_ChangeDepartment
201,
99;
GO

---------------------------------------------------------
-- Exercise 5
-- Transaction Handling
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_InsertEmployeesBatch;
GO

CREATE PROCEDURE sp_InsertEmployeesBatch
AS
BEGIN

BEGIN TRY

    BEGIN TRANSACTION;

    INSERT INTO Employees
    VALUES
    (
        203,
        'Ravi',
        'Patel',
        'ravi@gmail.com',
        48000,
        1
    );

    INSERT INTO Employees
    VALUES
    (
        204,
        'Priya',
        'Singh',
        'ravi@gmail.com',
        50000,
        2
    );

    COMMIT TRANSACTION;

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    INSERT INTO AuditLog
    VALUES
    (
        'Batch Insert',
        ERROR_MESSAGE()
    );

    PRINT 'Transaction rolled back.';

END CATCH

END;
GO

EXEC sp_InsertEmployeesBatch;
GO

---------------------------------------------------------
-- Exercise 6
-- Severity Levels
---------------------------------------------------------

ALTER PROCEDURE sp_AddNewEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

IF @Salary < 0
BEGIN

    RAISERROR
    (
        'Salary cannot be negative.',
        16,
        1
    );

    RETURN;

END

IF @Salary < 1000
BEGIN

    RAISERROR
    (
        'Entered salary is very low.',
        10,
        1
    );

END

BEGIN TRY

    INSERT INTO Employees
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Email,
        @Salary,
        @DepartmentID
    );

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    VALUES
    (
        'Severity Example',
        ERROR_MESSAGE()
    );

END CATCH

END;
GO

EXEC sp_AddNewEmployee
205,
'Test',
'User',
'test@gmail.com',
800,
1;
GO

EXEC sp_AddNewEmployee
206,
'Demo',
'User',
'demo@gmail.com',
-200,
1;
GO

---------------------------------------------------------
-- Display Audit Log
---------------------------------------------------------

SELECT *
FROM AuditLog;
GO