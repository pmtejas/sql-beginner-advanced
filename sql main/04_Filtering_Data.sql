/* ============================================================================== 
   SQL Filtering Data
-------------------------------------------------------------------------------
   This document provides an overview of SQL filtering techniques using WHERE 
   and various operators for precise data retrieval.

   Table of Contents:
     1. Comparison Operators
        - =, <>, >, >=, <, <=
     2. Logical Operators
        - AND, OR, NOT
     3. Range Filtering
        - BETWEEN
     4. Set Filtering
        - IN
     5. Pattern Matching
        - LIKE
=================================================================================
*/

/* ============================================================================== 
   COMPARISON OPERATORS
=============================================================================== */

-- Retrieve all customers from Germany.


-- Retrieve all customers who are not from Germany.


-- Retrieve all customers with a score greater than 500.


-- Retrieve all customers with a score of 500 or more.


-- Retrieve all customers with a score less than 500.


-- Retrieve all customers with a score of 500 or less.

/* ============================================================================== 
   LOGICAL OPERATORS
=============================================================================== */

/* Combining conditions using AND, OR, and NOT */

-- Retrieve all customers who are from the USA and have a score greater than 500.


-- Retrieve all customers who are either from the USA or have a score greater than 500.


-- Retrieve all customers with a score not less than 500.


/* ============================================================================== 
   RANGE FILTERING - BETWEEN
=============================================================================== */

-- Retrieve all customers whose score falls in the range between 100 and 500.


-- Alternative method (Equivalent to BETWEEN)


/* ============================================================================== 
   SET FILTERING - IN
=============================================================================== */

-- Retrieve all customers from either Germany or the USA.


/* ============================================================================== 
   PATTERN MATCHING - LIKE
=============================================================================== */

-- Find all customers whose first name starts with 'M'.


-- Find all customers whose first name ends with 'n'.


-- Find all customers whose first name contains 'r'.


-- Find all customers whose first name has 'r' in the third position.
