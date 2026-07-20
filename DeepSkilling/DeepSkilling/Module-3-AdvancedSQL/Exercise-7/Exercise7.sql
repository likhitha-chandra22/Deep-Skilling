-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 7 - Cursors
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Exercise 1
-- Employee Cursor
---------------------------------------------------------

DECLARE
    @EmpID INT,
    @EmpName VARCHAR(100),
    @DeptID INT,
    @EmpSalary DECIMAL(10,2);

DECLARE EmployeeDetails CURSOR
FOR
SELECT
    EmployeeID,
    FirstName + ' ' + LastName,
    DepartmentID,
    Salary
FROM Employees;

OPEN EmployeeDetails;

FETCH NEXT FROM EmployeeDetails
INTO
    @EmpID,
    @EmpName,
    @DeptID,
    @EmpSalary;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT
    'ID: ' + CAST(@EmpID AS VARCHAR)
    + ' | Employee: ' + @EmpName
    + ' | Dept: ' + CAST(@DeptID AS VARCHAR)
    + ' | Salary: ' + CAST(@EmpSalary AS VARCHAR);

    FETCH NEXT FROM EmployeeDetails
    INTO
        @EmpID,
        @EmpName,
        @DeptID,
        @EmpSalary;

END;

CLOSE EmployeeDetails;
DEALLOCATE EmployeeDetails;
GO

---------------------------------------------------------
-- Exercise 2
-- Static Cursor
---------------------------------------------------------

DECLARE EmployeeStatic CURSOR STATIC
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN EmployeeStatic;

PRINT 'Static Cursor Opened';

CLOSE EmployeeStatic;
DEALLOCATE EmployeeStatic;
GO

---------------------------------------------------------
-- Exercise 3
-- Dynamic Cursor
---------------------------------------------------------

DECLARE EmployeeDynamic CURSOR DYNAMIC
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN EmployeeDynamic;

PRINT 'Dynamic Cursor Opened';

CLOSE EmployeeDynamic;
DEALLOCATE EmployeeDynamic;
GO

---------------------------------------------------------
-- Exercise 4
-- Forward Only Cursor
---------------------------------------------------------

DECLARE EmployeeForward CURSOR FORWARD_ONLY
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN EmployeeForward;

PRINT 'Forward Only Cursor Opened';

CLOSE EmployeeForward;
DEALLOCATE EmployeeForward;
GO

---------------------------------------------------------
-- Exercise 5
-- Keyset Cursor
---------------------------------------------------------

DECLARE EmployeeKeyset CURSOR KEYSET
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN EmployeeKeyset;

PRINT 'Keyset Cursor Opened';

CLOSE EmployeeKeyset;
DEALLOCATE EmployeeKeyset;
GO

---------------------------------------------------------
-- Cursor Types Summary
---------------------------------------------------------

PRINT 'Cursor Types';

PRINT 'STATIC      - Uses a snapshot of the data';
PRINT 'DYNAMIC     - Reflects all changes';
PRINT 'FORWARD ONLY- Allows only forward movement';
PRINT 'KEYSET      - Fixed keys with updated values';
GO