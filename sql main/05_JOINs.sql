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

/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

-- No Join
/* Retrieve all data from customers and orders as separate results */


-- INNER JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */


-- LEFT JOIN
/* Get all customers along with their orders, 
   including those without orders */


-- RIGHT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */


-- Alternative to RIGHT JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */


-- FULL JOIN
/* Get all customers and all orders, even if there’s no match */


/* ============================================================================== 
   ADVANCED JOINS
=============================================================================== */

-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */


-- RIGHT ANTI JOIN
/* Get all orders without matching customers */


-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching customers */


-- Alternative to INNER JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */


-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */


-- CROSS JOIN
/* Generate all possible combinations of customers and orders */


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

