/* ==============================================================================
   SQL SET Operations
-------------------------------------------------------------------------------
   SQL set operations enable you to combine results from multiple queries
   into a single result set. This script demonstrates the rules and usage of
   set operations, including UNION, UNION ALL, EXCEPT, and INTERSECT.
   
   Table of Contents:
     1. SQL Operation Rules
     2. UNION
     3. UNION ALL
     4. EXCEPT
     5. INTERSECT
=================================================================================
*/

/* ==============================================================================
   RULES OF SET OPERATIONS
===============================================================================*/
use SalesDB
/* RULE: Data Types
   The data types of columns in each query should match.
*/
SELECT 
CustomerID,
FirstName,
LastName
FROM Sales.Customers 
UNION
SELECT 
FirstName,
LastName,
EmployeeID
FROM Sales.Employees ;

/* RULE: Data Types (Example)
   The data types of columns in each query should match.
*/
SELECT 
CustomerID,
FirstName,
LastName
FROM Sales.Customers 
UNION
SELECT 
FirstName,
LastName,
EmployeeID
FROM Sales.Employees ;

/* RULE: Column Order
   The order of the columns in each query must be the same.
*/
SELECT 
CustomerID,
FirstName,
LastName
FROM Sales.Customers 
UNION
SELECT 
LastName,
EmployeeID
FROM Sales.Employees ;

/* RULE: Column Aliases
   The column names in the result set are determined by the column names
   specified in the first SELECT statement.
*/
SELECT 
CustomerID as Id,
FirstName ,
LastName
FROM Sales.Customers 
UNION
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees ;

/* RULE: Correct Columns
   Ensure that the correct columns are used to maintain data consistency.
*/
SELECT 
CustomerID as Id,
FirstName ,
LastName
FROM Sales.Customers 
UNION
SELECT 
EmployeeID,
LastName,
FirstName
FROM Sales.Employees ;

/* ==============================================================================
   SETS: UNION, UNION ALL, EXCEPT, INTERSECT
===============================================================================*/

/* TASK 1: 
   Combine the data from Employees and Customers into one table using UNION 
*/
SELECT 
CustomerID as Id,
FirstName ,
LastName
FROM Sales.Customers 
UNION
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees ;

/* TASK 2: 
   Combine the data from Employees and Customers into one table, including duplicates, using UNION ALL 
*/
SELECT 
CustomerID as Id,
FirstName ,
LastName
FROM Sales.Customers 
UNION ALL
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees ;

/* TASK 3: 
   Find employees who are NOT customers using EXCEPT 
*/
SELECT 
EmployeeID as id,
FirstName,
LastName
FROM Sales.Employees 
EXCEPT
SELECT 
CustomerID,
FirstName ,
LastName
FROM Sales.Customers 

/* TASK 4: 
   Find employees who are also customers using INTERSECT 
*/
SELECT 
EmployeeID as id,
FirstName,
LastName
FROM Sales.Employees 
INTERSECT
SELECT 
CustomerID,
FirstName ,
LastName
FROM Sales.Customers 

/* TASK 5: 
   Combine order data from Orders and OrdersArchive into one report without duplicates 
*/
SELECT 
'order' AS sourcetable,
OrderID,
ProductID,
CustomerID,
SalesPersonID,
OrderDate,
ShipDate,
OrderStatus,
ShipAddress,
BillAddress,
Quantity,
Sales,
CreationTime
FROM Sales.Orders 
UNION
SELECT 
'order archive',
OrderID,
ProductID,
CustomerID,
SalesPersonID,
OrderDate,
ShipDate,
OrderStatus,
ShipAddress,
BillAddress,
Quantity,
Sales,
CreationTime
FROM Sales.OrdersArchive 
ORDER BY OrderID