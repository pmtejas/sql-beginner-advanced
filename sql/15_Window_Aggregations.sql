/* ==============================================================================
   SQL Window Aggregate Functions
-------------------------------------------------------------------------------
   These functions allow you to perform aggregate calculations over a set 
   of rows without the need for complex subqueries. They enable you to compute 
   counts, sums, averages, minimums, and maximums while still retaining access 
   to individual row details.

   Table of Contents:
    1. COUNT
    2. SUM
    3. AVG
    4. MAX / MIN
    5. ROLLING SUM & AVERAGE Use Case
===============================================================================
*/
use salesdb
/* ============================================================
   SQL WINDOW AGGREGATION | COUNT
   ============================================================ */

/* TASK 1:
   Find the Total Number of Orders and the Total Number of Orders for Each Customer
*/
SELECT 
customerId,
COUNT(*) OVER() as totalOrders,
COUNT(*) OVER(PARTITION by customerId) as totalOrdersperCustomer
FROM Sales.Orders ;

/* TASK 2:
   - Find the Total Number of Customers
   - Find the Total Number of Scores for Customers
   - Find the Total Number of Countries
*/
SELECT * ,
COUNT(*) OVER()as totalcustomer,
COUNT(Score) over() as totalScore,
COUNT(Country) over()as totalCountry
FROM Sales.Customers ;


/* TASK 3:
   Check whether the table 'OrdersArchive' contains any duplicate rows
*/
SELECT 
*
FROM (
   SELECT 
   *,
COUNT(*) OVER(PARTITION BY OrderID) as checkDuplicates 
FROM Sales.OrdersArchive 
) as t
WHERE checkDuplicates>1

/* ============================================================
   SQL WINDOW AGGREGATION | SUM
   ============================================================ */

/* TASK 4:
   - Find the Total Sales Across All Orders 
   - Find the Total Sales for Each Product
*/
SELECT 
OrderID,
OrderDate,
Sales,
sum(Sales) over() as totalSales
FROM Sales.Orders ;

/* TASK 5:
   Find the Percentage Contribution of Each Product's Sales to the Total Sales
*/
SELECT
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER () AS TotalSales,
    ROUND(CAST(Sales AS FLOAT) / SUM(Sales) OVER () * 100, 2) AS PercentageOfTotal
FROM Sales.Orders


/* ============================================================
   SQL WINDOW AGGREGATION | AVG
   ============================================================ */

/* TASK 6:
   - Find the Average Sales Across All Orders 
   - Find the Average Sales for Each Product
*/
SELECT 
OrderID,
OrderDate,
AVG(Sales) OVER() as averageSales,
Avg(Sales) over(PARTITION by productId) as averageSalesperproduct
FROM Sales.Orders ;

/* TASK 7:
   Find the Average Scores of Customers
*/
SELECT 
avg(coalesce(score,0)) over() as averageScore
FROM Sales.Customers ;

/* TASK 8:
   Find all orders where Sales exceed the average Sales across all orders
*/
SELECT * from 
(SELECT *,
avg(coalesce(Sales,0)) Over() as averageScore
FROM Sales.Orders ) as t 
WHERE Sales>averageScore

/* ============================================================
   SQL WINDOW AGGREGATION | MAX / MIN
   ============================================================ */

/* TASK 9:
   Find the Highest and Lowest Sales across all orders
*/
SELECT *,
Max(Sales) OVER() as maxSales,
Min(Sales) OVER() as minSales
FROM Sales.Orders ;

/* TASK 10:
   Find the Lowest Sales across all orders and by Product
*/
SELECT *,
MAX(Sales) OVER(PARTITION BY productId) as maxSales,
MIN(Sales) Over(PARTITION BY ProductID) as MinSales
FROM Sales.Orders ;

/* TASK 11:
   Show the employees who have the highest salaries
*/
SELECT *
FROM (
	SELECT *,
		   MAX(Salary) OVER() AS HighestSalary
	FROM Sales.Employees
) t
WHERE Salary = HighestSalary

/* TASK 12:
   Find the deviation of each Sale from the minimum and maximum Sales
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
    MAX(Sales) OVER () AS HighestSales,
    MIN(Sales) OVER () AS LowestSales,
    Sales - MIN(Sales) OVER () AS DeviationFromMin,
    MAX(Sales) OVER () - Sales AS DeviationFromMax
FROM Sales.Orders

/* ============================================================
   Use Case | ROLLING SUM & AVERAGE
   ============================================================ */

/* TASK 13:
   Calculate the moving average of Sales for each Product over time
*/
SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER (PARTITION BY ProductID) AS AvgByProduct,
    AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS MovingAvg
FROM Sales.Orders

/* TASK 14:
   Calculate the moving average of Sales for each Product over time,
   including only the next order
*/
SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,
    AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS RollingAvg
FROM Sales.Orders