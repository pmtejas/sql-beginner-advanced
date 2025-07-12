/* ============================================================================== 
   SQL Aggregate Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL aggregate functions, which allow 
   performing calculations on multiple rows of data to generate summary results.

   Table of Contents:
     1. Basic Aggregate Functions
        - COUNT
        - SUM
        - AVG
        - MAX
        - MIN
     2. Grouped Aggregations
        - GROUP BY
=================================================================================
*/
use salesdb
/* ============================================================================== 
   BASIC AGGREGATE FUNCTIONS
=============================================================================== */

-- Find the total number of customers
SELECT 
COUNT(*) as totalCustomers
FROM Sales.Customers ;

-- Find the total sales of all orders
SELECT 
sum(Sales) as totalSales
FROM Sales.Orders ;

-- Find the average sales of all orders
SELECT 
avg(coalesce(Sales,0)) as averageSales
FROM Sales.Orders ;

-- Find the highest score among customers
SELECT 
MAX(score) as MaxScore
FROM Sales.Customers ;

-- Find the lowest score among customers
SELECT 
MIN(Score) as Minscore
FROM Sales.Customers ;

/* ============================================================================== 
   GROUPED AGGREGATIONS - GROUP BY
=============================================================================== */

-- Find the number of orders, total sales, average sales, highest sales, and lowest sales per customer
use MyDatabase
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales,
    MAX(sales) AS highest_sales,
    MIN(sales) AS lowest_sales
FROM orders
GROUP BY customer_id