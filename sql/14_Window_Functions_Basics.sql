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

/* TASK 1: 
   Calculate the Total Sales Across All Orders 
*/


/* TASK 2: 
   Calculate the Total Sales for Each Product 
*/


/* ==============================================================================
   SQL WINDOW FUNCTIONS | OVER CLAUSE
===============================================================================*/

/* TASK 3: 
   Find the total sales across all orders,
   additionally providing details such as OrderID and OrderDate 
*/


/* ==============================================================================
   SQL WINDOW FUNCTIONS | PARTITION CLAUSE
===============================================================================*/

/* TASK 4: 
   Find the total sales across all orders and for each product,
   additionally providing details such as OrderID and OrderDate 
*/


/* TASK 5: 
   Find the total sales across all orders, for each product,
   and for each combination of product and order status,
   additionally providing details such as OrderID and OrderDate 
*/

/* ==============================================================================
   SQL WINDOW FUNCTIONS | ORDER CLAUSE
===============================================================================*/

/* TASK 6: 
   Rank each order by Sales from highest to lowest */


/* ==============================================================================
   SQL WINDOW FUNCTIONS | FRAME CLAUSE
===============================================================================*/

/* TASK 7: 
   Calculate Total Sales by Order Status for current and next two orders 
*/


/* TASK 8: 
   Calculate Total Sales by Order Status for current and previous two orders 
*/


/* TASK 9: 
   Calculate Total Sales by Order Status from previous two orders only 
*/

/* TASK 10: 
   Calculate cumulative Total Sales by Order Status up to the current order 
*/


/* TASK 11: 
   Calculate cumulative Total Sales by Order Status from the start to the current row 
*/


/* ==============================================================================
   SQL WINDOW FUNCTIONS | RULES
===============================================================================*/

/* RULE 1: 
   Window functions can only be used in SELECT or ORDER BY clauses 
*/
 -- Invalid: window function in WHERE clause

/* RULE 2: 
   Window functions cannot be nested 
*/


/* ==============================================================================
   SQL WINDOW FUNCTIONS | GROUP BY
===============================================================================*/

/* TASK 12: 
   Rank customers by their total sales 
*/
