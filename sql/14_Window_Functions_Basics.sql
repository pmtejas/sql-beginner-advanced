/* ==============================================================================
   SQL Window Functions
-------------------------------------------------------------------------------
   SQL window functions enable advanced calculations across sets of rows 
   related to the current row without resorting to complex subqueries or joins.
   This script demonstrates the fundamentals and key clauses of window functions,
   including the OVER, PARTITION, ORDER, and FRAME clauses, as well as common rules 
   and a GROUP BY use case.

   Table of Contents:
     1. SQL Window Basics
     2. SQL Window OVER Clause
     3. SQL Window PARTITION Clause
     4. SQL Window ORDER Clause
     5. SQL Window FRAME Clause
     6. SQL Window Rules
     7. SQL Window with GROUP BY
=================================================================================
*/

/* ==============================================================================
   SQL WINDOW FUNCTIONS | BASICS
===============================================================================*/
use salesdb
/* TASK 1: 
   Calculate the Total Sales Across All Orders 
*/
SELECT 
sum(sales) as total_sales
FROM Sales.Orders ;

/* TASK 2: 
   Calculate the Total Sales for Each Product 
*/
SELECT 
ProductID,
SUM(Sales) as total_sales
FROM Sales.Orders 
GROUP BY ProductID

/* ==============================================================================
   SQL WINDOW FUNCTIONS | OVER CLAUSE
===============================================================================*/

/* TASK 3: 
   Find the total sales across all orders,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT 
OrderID,
OrderDate,
sum(Sales) OVER() as totalSales
FROM Sales.Orders ;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | PARTITION CLAUSE
===============================================================================*/

/* TASK 4: 
   Find the total sales across all orders and for each product,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT 
OrderID,
OrderDate,
productId,
sum(Sales) OVER(PARTITION by ProductID) as totalsalesPerProduct
FROM Sales.Orders ;

/* TASK 5: 
   Find the total sales across all orders, for each product,
   and for each combination of product and order status,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT 
OrderID,
OrderDate,
ProductID,
OrderStatus,
sales,
sum(Sales) over() as totalSales,
Sum(Sales) OVER(PARTITION by productId) as totalsalesPerProduct,
sum(Sales) OVER(PARTITION by productId,OrderStatus) as combination
FROM Sales.Orders ;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | ORDER CLAUSE
===============================================================================*/

/* TASK 6: 
   Rank each order by Sales from highest to lowest */
SELECT 
sales,
RANK() OVER(order by sales DESc) as Rank
FROM Sales.Orders ;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | FRAME CLAUSE
===============================================================================*/

/* TASK 7: 
   Calculate Total Sales by Order Status for current and next two orders 
*/
SELECT 
OrderID,
OrderDate,
OrderStatus,
sales,
sum(Sales) OVER(PARTITION by OrderStatus order by OrderDate ROWS between current row AND 2 following) as totalSales
FROM Sales.Orders ;

/* TASK 8: 
   Calculate Total Sales by Order Status for current and previous two orders 
*/
SELECT 
OrderID,
OrderDate,
OrderStatus,
Sales,
sum(Sales) OVER(PARTITION by OrderStatus order by OrderDate rows between 2 preceding and current row) as totalSales
FROM Sales.Orders ;

/* TASK 9: 
   Calculate Total Sales by Order Status from previous two orders only 
*/
SELECT 
OrderID,
OrderDate,
OrderStatus,
Sales,
sum(Sales) OVER(PARTITION by OrderStatus order by OrderDate Rows 2 preceding) as totalSales
FROM Sales.Orders ;

/* TASK 10: 
   Calculate cumulative Total Sales by Order Status up to the current order 
*/
SELECT 
OrderID,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) OVER(PARTITION by OrderStatus order by OrderDate Rows between unbounded preceding and current row) as totalSales
FROM Sales.Orders ;

/* TASK 11: 
   Calculate cumulative Total Sales by Order Status from the start to the current row 
*/
SELECT 
OrderID,
OrderDate,
OrderStatus,
Sales,
sum(Sales) OVER(PARTITION by OrderStatus order by OrderDate Rows unbounded preceding) as totalSales
FROM Sales.Orders ;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | RULES
===============================================================================*/

/* RULE 1: 
   Window functions can only be used in SELECT or ORDER BY clauses 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (PARTITION BY OrderStatus) AS Total_Sales
FROM Sales.Orders
WHERE SUM(Sales) OVER (PARTITION BY OrderStatus) > 100;

 -- Invalid: window function in WHERE clause

/* RULE 2: 
   Window functions cannot be nested 
*/
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(SUM(Sales) OVER (PARTITION BY OrderStatus)) OVER (PARTITION BY OrderStatus) AS Total_Sales  -- Invalid nesting
FROM Sales.Orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | GROUP BY
===============================================================================*/

/* TASK 12: 
   Rank customers by their total sales 
*/
SELECT 
customerid,
sum(Sales) as totalSales,
RANK() Over(ORDER by sum(sales) DESC ) as Rank
FROM Sales.Orders 
GROUP By CustomerID