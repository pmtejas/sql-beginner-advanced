/* ==============================================================================
   SQL Joins 
-------------------------------------------------------------------------------
   This document provides an overview of SQL joins, which allow combining data
   from multiple tables to retrieve meaningful insights.

   Table of Contents:
     1. Basic Joins
        - INNER JOIN
        - LEFT JOIN
        - RIGHT JOIN
        - FULL JOIN
     2. Advanced Joins
        - LEFT ANTI JOIN
        - RIGHT ANTI JOIN
        - ALTERNATIVE INNER JOIN
        - FULL ANTI JOIN
        - CROSS JOIN
     3. Multiple Table Joins (4 Tables)
=================================================================================
*/
use mydatabase;
/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

-- No Join
/* Retrieve all data from customers and orders as separate results */
SELECT * 
FROM customers ;
SELECT * 
FROM orders ;

-- INNER JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c INNER JOIN orders as o ON c.id=o.customer_id

-- LEFT JOIN
/* Get all customers along with their orders, 
   including those without orders */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c LEFT JOIN orders as o ON c.id=o.customer_id

-- RIGHT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c RIGHT JOIN orders as o ON c.id=o.customer_id

-- Alternative to RIGHT JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM orders as o LEFT JOIN customers as c ON c.id=o.customer_id

-- FULL JOIN
/* Get all customers and all orders, even if there’s no match */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c FULL JOIN orders as o ON c.id =o.customer_id

/* ============================================================================== 
   ADVANCED JOINS
=============================================================================== */

-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c LEFT JOIN orders as o ON c.id=o.customer_id
WHERE o.customer_id IS NULL

-- RIGHT ANTI JOIN
/* Get all orders without matching customers */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c RIGHT JOIN orders as o on c.id=o.customer_id
WHERE c.id IS NULL

-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching customers */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM orders as o LEFT JOIN customers as c on c.id=o.customer_id
WHERE c.id IS NULL

-- Alternative to INNER JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c left JOIN orders as o on c.id=o.customer_id
WHERE c.id IS NOt null and o.customer_id is not NULL

-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */
SELECT 
c.id,
c.first_name,
o.order_id,
o.sales
FROM customers as c FULL JOIN orders as o on c.id=o.customer_id
WHERE c.id is NULL or o.customer_id is NULL

-- CROSS JOIN
/* Generate all possible combinations of customers and orders */
SELECT * 
FROM customers as c  CROSS JOIN orders 

/* ============================================================================== 
   MULTIPLE TABLE JOINS (4 Tables)
=============================================================================== */

/* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */
use SalesDB
SELECT 
o.OrderID as OrderId,
c.FirstName as customerName,
p.Product as productName,
o.Sales as Sales,
p.Price as productPrice,
e.FirstName as SalesPersons_name
FROM Sales.Orders  as o
LEFT JOIn Sales.Customers as c 
on o.CustomerID=c.CustomerID
left JOIN Sales.Products as p
on o.ProductID=p.ProductID
LEFT JOIN Sales.Employees as e 
on o.SalesPersonID=e.EmployeeID