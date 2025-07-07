/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
   This guide covers various SELECT query techniques used for retrieving, 
   filtering, sorting, and aggregating data efficiently.

   Table of Contents:
     1. SELECT ALL COLUMNS
     2. SELECT SPECIFIC COLUMNS
     3. WHERE CLAUSE
     4. ORDER BY
     5. GROUP BY
     6. HAVING
     7. DISTINCT
     8. TOP
     9. Combining Queries
	 10. COOL STUFF - Additional SQL Features
=================================================================================
*/

/* ==============================================================================
   COMMENTS
=============================================================================== */

-- This is a single-line comment.

/* This
   is
   a multiple-line
   comment
*/

/* ==============================================================================
   SELECT ALL COLUMNS
=============================================================================== */

-- Retrieve All Customer Data


-- Retrieve All Order Data


/* ==============================================================================
   SELECT FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score.


/* ==============================================================================
   WHERE
=============================================================================== */

-- Retrieve customers with a score not equal to 0


-- Retrieve customers from Germany


-- Retrieve the name and country of customers from Germany


/* ==============================================================================
   ORDER BY
=============================================================================== */

/* Retrieve all customers and 
   sort the results by the highest score first. */


/* Retrieve all customers and 
   sort the results by the lowest score first. */


/* Retrieve all customers and 
   sort the results by the country. */


/* Retrieve all customers and 
   sort the results by the country and then by the highest score. */


/* Retrieve the name, country, and score of customers 
   whose score is not equal to 0
   and sort the results by the highest score first. */


/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Find the total score for each country


/* This will not work because 'first_name' is neither part of the GROUP BY 
   nor wrapped in an aggregate function. SQL doesn't know how to handle this column. */


-- Find the total score and total number of customers for each country


/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score for each country
   and return only those countries with an average score greater than 430 */


/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */


/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Return Unique list of all countries


/* ==============================================================================
   TOP
=============================================================================== */

-- Retrieve only 3 Customers


-- Retrieve the Top 3 Customers with the Highest Scores


-- Retrieve the Lowest 2 Customers based on the score


-- Get the Two Most Recent Orders


/* ==============================================================================
   All Together
=============================================================================== */

/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */


/* ============================================================================== 
   COOL STUFF - Additional SQL Features
=============================================================================== */

-- Execute multiple queries at once


/* Selecting Static Data */
-- Select a static or constant value without accessing any table


-- Assign a constant value to a column in a query
