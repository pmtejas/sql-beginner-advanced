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
use mydatabase;
-- Retrieve All Customer Data
SELECT * 
FROM customers ;

-- Retrieve All Order Data
SELECT * 
FROM orders ;

/* ==============================================================================
   SELECT FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score.
SELECT 
   first_name,
   country,
   score
FROM customers ;

/* ==============================================================================
   WHERE
=============================================================================== */

-- Retrieve customers with a score not equal to 0
SELECT * 
FROM customers 
WHERE score!=0

-- Retrieve customers from Germany
SELECT * 
FROM customers 
WHERE country='Germany'

-- Retrieve the name and country of customers from Germany
SELECT 
   first_name,
   country
FROM customers 
   WHERE country='Germany'

/* ==============================================================================
   ORDER BY
=============================================================================== */

/* Retrieve all customers and 
   sort the results by the highest score first. */
SELECT * 
FROM customers 
   ORDER BY score DESC

/* Retrieve all customers and 
   sort the results by the lowest score first. */
SELECT * 
FROM customers 
   ORDER BY score

/* Retrieve all customers and 
   sort the results by the country. */
SELECT * 
FROM customers 
   ORDER BY country

/* Retrieve all customers and 
   sort the results by the country and then by the highest score. */
SELECT * 
FROM customers 
   ORDER BY country,score DESC

/* Retrieve the name, country, and score of customers 
   whose score is not equal to 0
   and sort the results by the highest score first. */
SELECT 
   first_name,
   country,
   score 
FROM customers 
   WHERE score!=0
   ORDER BY score DESC


/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Find the total score for each country
SELECT 
   country,
   sum(score) as total_score
FROM customers 
   GROUP BY country

/* This will not work because 'first_name' is neither part of the GROUP BY 
   nor wrapped in an aggregate function. SQL doesn't know how to handle this column. */
SELECT 
   country,
   first_name,
   sum(score) as total_score
FROM customers 
   GROUP BY country
-- Find the total score and total number of customers for each country
SELECT 
   country,
   sum(score) as total_score,
   COUNT(*) as total_cusomers
FROM customers 
   GROUP BY country


/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score for each country
   and return only those countries with an average score greater than 430 */
SELECT 
   country,
   AVG(score) as Average_score
FROM customers 
   GROUP BY country
   HAVING AVG(score)>430

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT 
country,
AVG(score) as Average_score
FROM customers 
WHERE score!=0
GROUP BY country
Having Avg(score)>430

/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Return Unique list of all countries
SELECT Distinct 
country
FROM customers ;

/* ==============================================================================
   TOP
=============================================================================== */

-- Retrieve only 3 Customers
SELECT Top 3* 
FROM customers ;

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT Top 3*
FROM customers 
ORDER BY score DESC

-- Retrieve the Lowest 2 Customers based on the score
SELECT TOP 2 * 
FROM customers 
ORDER BY score

-- Get the Two Most Recent Orders
SELECT TOP 2*
FROM orders 
ORDER BY order_date DESC

/* ==============================================================================
   All Together
=============================================================================== */

/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */
SELECT 
country,
AVG(score) As Average_score
FROM customers 
WHERE score!=0
GROUP BY country
HAVING Avg(score)>430
ORDER By AVG(score) DESC

/* ============================================================================== 
   COOL STUFF - Additional SQL Features
=============================================================================== */

-- Execute multiple queries at once
SELECT * 
FROM customers ;
SELECT * 
FROM orders ;

/* Selecting Static Data */
-- Select a static or constant value without accessing any table
SELECT 123 as staticNumber;
SELECT 'hello' as staticString ;

-- Assign a constant value to a column in a query
SELECT 
first_name,
country,
score,
'New customer' as CustomerType
FROM customers ;