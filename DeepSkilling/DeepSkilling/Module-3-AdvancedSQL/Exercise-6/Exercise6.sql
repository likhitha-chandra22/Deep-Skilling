-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 6 - Triggers
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Triggers
---------------------------------------------------------

DROP TRIGGER IF EXISTS trg_SalaryAudit;
DROP TRIGGER IF EXISTS trg_BlockDeleteEmployee;
DROP TRIGGER IF EXISTS trg_UpdateYearlySalary;
GO

---------------------------------------------------------
-- Create Audit Table
---------------------------------------------------------

DROP TABLE IF EXISTS SalaryAudit;
GO

CREATE TABLE SalaryAudit
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    PreviousSalary DECIMAL(10,2),
    UpdatedSalary DECIMAL(10,2),
    UpdatedOn DATETIME DEFAULT GETDATE()
);
GO

---------------------------------------------------------
-- Exercise 1
-- AFTER UPDATE Trigger
---------------------------------------------------------

CREATE TRIGGER trg_SalaryAudit
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO SalaryAudit
    (
        EmployeeID,
        PreviousSalary,
        UpdatedSalary
    )
    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary
    FROM deleted d
    INNER JOIN inserted i
        ON d.EmployeeID = i.EmployeeID
    WHERE d.Salary <> i.Salary;

END;
GO

---------------------------------------------------------
-- Test Trigger
---------------------------------------------------------

UPDATE Employees
SET Salary = 58000
WHERE EmployeeID = 101;
GO

SELECT * FROM SalaryAudit;
GO

---------------------------------------------------------
-- Exercise 2
-- INSTEAD OF DELETE Trigger
---------------------------------------------------------

CREATE TRIGGER trg_BlockDeleteEmployee
ON Employees
INSTEAD OF DELETE
AS
BEGIN

    RAISERROR
    (
        'Deleting employee records is not allowed.',
        16,
        1
    );

END;
GO

---------------------------------------------------------
-- Test Delete Trigger
---------------------------------------------------------

BEGIN TRY

    DELETE FROM Employees
    WHERE EmployeeID = 102;

END TRY

BEGIN CATCH

    PRINT ERROR_MESSAGE();

END CATCH;
GO

---------------------------------------------------------
-- Exercise 3
-- LOGON Trigger
---------------------------------------------------------

/*

CREATE TRIGGER trg_LoginRestriction
ON ALL SERVER
FOR LOGON
AS
BEGIN

    IF DATEPART(HOUR,GETDATE()) BETWEEN 1 AND 2
        ROLLBACK;

END;
GO

*/

---------------------------------------------------------
-- Exercise 4
-- Modify Trigger
---------------------------------------------------------

ALTER TRIGGER trg_SalaryAudit
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO SalaryAudit
    (
        EmployeeID,
        PreviousSalary,
        UpdatedSalary
    )
    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary
    FROM deleted d
    INNER JOIN inserted i
        ON d.EmployeeID = i.EmployeeID;

END;
GO

---------------------------------------------------------
-- Exercise 5
-- Delete Trigger
---------------------------------------------------------

DROP TRIGGER trg_BlockDeleteEmployee;
GO

---------------------------------------------------------
-- Verify Trigger Deleted
---------------------------------------------------------

SELECT name
FROM sys.triggers
WHERE name = 'trg_BlockDeleteEmployee';
GO

---------------------------------------------------------
-- Exercise 6
-- Maintain Yearly Salary
---------------------------------------------------------

IF COL_LENGTH('Employees','YearlySalary') IS NULL
BEGIN

    ALTER TABLE Employees
    ADD YearlySalary DECIMAL(12,2);

END;
GO

DROP TRIGGER IF EXISTS trg_UpdateYearlySalary;
GO

CREATE TRIGGER trg_UpdateYearlySalary
ON Employees
AFTER UPDATE
AS
BEGIN

    UPDATE E
    SET YearlySalary = E.Salary * 12
    FROM Employees E
    INNER JOIN inserted I
        ON E.EmployeeID = I.EmployeeID;

END;
GO

---------------------------------------------------------
-- Test Trigger
---------------------------------------------------------

UPDATE Employees
SET Salary = 62000
WHERE EmployeeID = 103;
GO

SELECT
    EmployeeID,
    FirstName,
    Salary,
    YearlySalary
FROM Employees
WHERE EmployeeID = 103;
GO