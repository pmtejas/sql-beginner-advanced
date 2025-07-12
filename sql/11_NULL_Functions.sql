/* ==============================================================================
   SQL NULL Functions
-------------------------------------------------------------------------------
   This script highlights essential SQL functions for managing NULL values.
   It demonstrates how to handle NULLs in data aggregation, mathematical operations,
   sorting, and comparisons. These techniques help maintain data integrity 
   and ensure accurate query results.

   Table of Contents:
     1. Handle NULL - Data Aggregation
     2. Handle NULL - Mathematical Operators
     3. Handle NULL - Sorting Data
     4. NULLIF - Division by Zero
     5. IS NULL - IS NOT NULL
     6. LEFT ANTI JOIN
     7. NULLs vs Empty String vs Blank Spaces
===============================================================================
*/
use salesdb
/* ==============================================================================
   HANDLE NULL - DATA AGGREGATION
===============================================================================*/

/* TASK 1: 
   Find the average scores of the customers.
   Uses COALESCE to replace NULL Score with 0.
*/
SELECT 
AVG(score) as averagescore,
AVG(coalesce(score,0)) as averageScore2
FROM Sales.Customers ;

/* ==============================================================================
   HANDLE NULL - MATHEMATICAL OPERATORS
===============================================================================*/

/* TASK 2: 
   Display the full name of customers in a single field by merging their
   first and last names, and add 10 bonus points to each customer's score.
*/
SELECT 
CONCAT(TRIM(FirstName),' ',TRIM(coalesce(LastName,''))) as fullName,
score,
coalesce(score,0) +10 as scoreWithBonus
FROM Sales.Customers ;

/* ==============================================================================
   HANDLE NULL - SORTING DATA
===============================================================================*/

/* TASK 3: 
   Sort the customers from lowest to highest scores,
   with NULL values appearing last.
*/
SELECT 
*
FROM Sales.Customers 
ORDER BY CASE WHEN score IS NULL THEN 1 ELSE 0 END, score ;

/* ==============================================================================
   NULLIF - DIVISION BY ZERO
===============================================================================*/

/* TASK 4: 
   Find the sales price for each order by dividing sales by quantity.
   Uses NULLIF to avoid division by zero.
*/
SELECT 
Sales,
Quantity,
(CAST(Sales as FLOAT)/nullif(Quantity,0)) as salesPrice
FROM Sales.Orders ;

/* ==============================================================================
   IS NULL - IS NOT NULL
===============================================================================*/

/* TASK 5: 
   Identify the customers who have no scores 
*/
SELECT * 
FROM Sales.Customers 
WHERE Score is NULL

/* TASK 6: 
   Identify the customers who have scores 
*/
SELECT * 
FROM Sales.Customers 
WHERE Score is NOT NULL

/* ==============================================================================
   LEFT ANTI JOIN
===============================================================================*/
use MyDatabase
/* TASK 7: 
   List all details for customers who have not placed any orders 
*/
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM  customers as c LEFT join orders as o on c.id=o.customer_id
WHERE o.customer_id is NULL

/* ==============================================================================
   NULLs vs EMPTY STRING vs BLANK SPACES
===============================================================================*/

/* TASK 8: 
   Demonstrate differences between NULL, empty strings, and blank spaces 
*/
WITH Orders AS (
    SELECT 1 AS Id, 'A' AS Category UNION
    SELECT 2, NULL UNION
    SELECT 3, '' UNION
    SELECT 4, '  '
)
SELECT 
    *,
    DATALENGTH(Category) AS LenCategory,
    TRIM(Category) AS Policy1,
    NULLIF(TRIM(Category), '') AS Policy2,
    COALESCE(NULLIF(TRIM(Category), ''), 'unknown') AS Policy3
FROM Orders;