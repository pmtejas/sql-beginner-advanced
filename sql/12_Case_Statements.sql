/* ==============================================================================
   SQL CASE Statement
-------------------------------------------------------------------------------
   This script demonstrates various use cases of the SQL CASE statement, including
   data categorization, mapping, quick form syntax, handling nulls, and conditional 
   aggregation.
   
   Table of Contents:
     1. Categorize Data
     2. Mapping
     3. Quick Form of Case Statement
     4. Handling Nulls
     5. Conditional Aggregation
=================================================================================
*/

/* ==============================================================================
   USE CASE: CATEGORIZE DATA
===============================================================================*/
use SalesDB
/* TASK 1: 
   Create a report showing total sales for each category:
	   - High: Sales over 50
	   - Medium: Sales between 20 and 50
	   - Low: Sales 20 or less
   The results are sorted from highest to lowest total sales.
*/
SELECT 
cateegory,
sum(sales) as Total_sales
FROM (
   SELECT 
Sales,
CASE 
   WHEN Sales>50 THEN 'High'  
   WHEN Sales>20 THEN 'Medium' 
ELSE 'Low'
END  cateegory
FROM Sales.Orders 
) as t
GROUP BY cateegory


/* ==============================================================================
   USE CASE: MAPPING
===============================================================================*/

/* TASK 2: 
   Retrieve customer details with abbreviated country codes 
*/
SELECT 
*,
CASE 
   WHEN Country='Germany' THEN 'GE'  
   WHEN Country='USA' THEN 'US' 
ELSE 'N/A'
END abrevatedCountryCodes
FROM Sales.Customers ;

/* ==============================================================================
   QUICK FORM SYNTAX
===============================================================================*/

/* TASK 3: 
   Retrieve customer details with abbreviated country codes using quick form 
*/
SELECT * ,
CASE country
   WHEN 'Germany' THEN 'GE'  
   WHEN 'USA' THEN 'Us' 
ELSE 'N/a'
END abrevatedCountryCodes
FROM Sales.Customers ;

/* ==============================================================================
   HANDLING NULLS
===============================================================================*/

/* TASK 4: 
   Calculate the average score of customers, treating NULL as 0,
   and provide CustomerID and LastName details.
*/
SELECT 
CustomerID,
FirstName,
LastName,
AVG(score) OVER() as average,
AVG(
   CASE 
      WHEN Score is NULL THEN 0  
   ELSE Score
   END
)  over() as averageScore
FROM Sales.Customers ;

/* ==============================================================================
   CONDITIONAL AGGREGATION
===============================================================================*/

/* TASK 5: 
   Count how many orders each customer made with sales greater than 30 
*/
SELECT
    CustomerID,
    SUM(
        CASE
            WHEN Sales > 30 THEN 1
            ELSE 0
        END
    ) AS TotalOrdersHighSales,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID;