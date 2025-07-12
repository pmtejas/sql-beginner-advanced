/* ==============================================================================
   SQL Window Ranking Functions
-------------------------------------------------------------------------------
   These functions allow you to rank and order rows within a result set 
   without the need for complex joins or subqueries. They enable you to assign 
   unique or non-unique rankings, group rows into buckets, and analyze data 
   distributions on ordered data.

   Table of Contents:
     1. ROW_NUMBER
     2. RANK
     3. DENSE_RANK
     4. NTILE
     5. CUME_DIST
=================================================================================
*/

/* ============================================================
   SQL WINDOW RANKING | ROW_NUMBER, RANK, DENSE_RANK
   ============================================================ */
use salesdb
/* TASK 1:
   Rank Orders Based on Sales from Highest to Lowest
*/
SELECT 
*,
ROW_NUMBER() Over(order by sales DESc) as ROW_NUMBER,
Rank() OVER(order by sales DESc) as Rank,
DENSE_RANK() OVER(order by sales desc) as denseRank
FROM Sales.Orders ;

/* TASK 2:
   Use Case | Top-N Analysis: Find the Highest Sale for Each Product
*/
SELECT Sales,top_n
FROM (
   SELECT *,
ROW_NUMBER() OVER(PARTITION BY ProductId ORDER BY sales DESC) as top_n
FROM Sales.Orders 
) as t WHERE top_n=1

/* TASK 3:
   Use Case | Bottom-N Analysis: Find the Lowest 2 Customers Based on Their Total Sales
*/
SELECT ProductID,Sales,top_n
FROM (
   SELECT *,
ROW_NUMBER() OVER(PARTITION BY ProductId ORDER BY sales ) as top_n
FROM Sales.Orders 
) as t WHERE top_n<=2

/* TASK 4:
   Use Case | Assign Unique IDs to the Rows of the 'Order Archive'
*/
SELECT
    ROW_NUMBER() OVER (ORDER BY OrderID, OrderDate) AS UniqueID,
    *
FROM Sales.OrdersArchive;

/* TASK 5:
   Use Case | Identify Duplicates:
   Identify Duplicate Rows in 'Order Archive' and return a clean result without any duplicates
*/
SELECT *
FROM (
    SELECT
        ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) AS rn,
        *
    FROM Sales.OrdersArchive
) AS UniqueOrdersArchive
WHERE rn = 1;


/* ============================================================
   SQL WINDOW RANKING | NTILE
   ============================================================ */

/* TASK 6:
   Divide Orders into Groups Based on Sales
*/
SELECT 
    OrderID,
    Sales,
    NTILE(1) OVER (ORDER BY Sales) AS OneBucket,
    NTILE(2) OVER (ORDER BY Sales) AS TwoBuckets,
    NTILE(3) OVER (ORDER BY Sales) AS ThreeBuckets,
    NTILE(4) OVER (ORDER BY Sales) AS FourBuckets,
    NTILE(2) OVER (PARTITION BY ProductID ORDER BY Sales) AS TwoBucketByProducts
FROM Sales.Orders;

/* TASK 7:
   Segment all Orders into 3 Categories: High, Medium, and Low Sales.
*/

SELECT 
OrderID,
Sales,
CASE Buckets
   WHEN 1 THEN 'high'  
   WHEN 2 THEN 'medium' 
ELSE 'low'
END category
FROM (
   SELECT 
NTILE(3) OVER (ORDER BY sales desc) as Buckets,
OrderID,
Sales
FROM Sales.Orders 
) as segmentation


/* TASK 8:
   Divide Orders into Groups for Processing
*/
SELECT 
    NTILE(5) OVER (ORDER BY OrderID) AS Buckets,
    *
FROM Sales.Orders;

/* ============================================================
   SQL WINDOW RANKING | CUME_DIST
   ============================================================ */

/* TASK 9:
   Find Products that Fall Within the Highest 40% of the Prices
*/
SELECT 
product,
price,
CONCAT(DistRank * 100, '%') as percen
FROM (    SELECT
        Product,
        Price,
        CUME_DIST() OVER (ORDER BY Price DESC) AS DistRank
    FROM Sales.Products) as t
WHERE DistRank <= 0.4;