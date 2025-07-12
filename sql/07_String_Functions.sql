/* ============================================================================== 
   SQL String Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL string functions, which allow 
   manipulation, transformation, and extraction of text data efficiently.

   Table of Contents:
     1. Manipulations
        - CONCAT
        - LOWER
        - UPPER
	- TRIM
	- REPLACE
     2. Calculation
        - LEN
     3. Substring Extraction
        - LEFT
        - RIGHT
        - SUBSTRING
=================================================================================
*/
use mydatabase;
/* ============================================================================== 
   CONCAT() - String Concatenation
=============================================================================== */

-- Concatenate first name and country into one column
SELECT 
first_name,
country,
CONCAT(first_name,'-',country) as fullInfo
FROM customers ;

/* ============================================================================== 
   LOWER() & UPPER() - Case Transformation
=============================================================================== */

-- Convert the first name to lowercase
SELECT 
LOWER(first_name) as lower
FROM customers ;

-- Convert the first name to uppercase
SELECT 
UPPER(first_name) as upper
FROM customers ;
	
/* ============================================================================== 
   TRIM() - Remove White Spaces
=============================================================================== */

-- Find customers whose first name contains leading or trailing spaces
select 
TRIM(first_name) as firstName
FROM customers
WHERE first_name!=TRIM(first_name)



/* ============================================================================== 
   REPLACE() - Replace or Remove old value with new one
=============================================================================== */
-- Remove dashes (-) from a phone number
select '77-95-27-47-67' as originalPhone,
REPLACE('77-95-27-47-67','-','/') as phone

-- Replace File Extence from txt to csv
select 'report.txt' as originalPhone,
REPLACE('report.txt','.txt','.csv') as phone
	
/* ============================================================================== 
   LEN() - String Length & Trimming
=============================================================================== */

-- Calculate the length of each customer's first name
SELECT 
first_name,
LEN(first_name) as lenght
FROM customers ;
	
/* ============================================================================== 
   LEFT() & RIGHT() - Substring Extraction
=============================================================================== */

-- Retrieve the first two characters of each first name
SELECT 
    first_name,
    LEFT(TRIM(first_name), 2) AS first_2_chars
FROM customers

-- Retrieve the last two characters of each first name
SELECT 
first_name,
RIGHT(first_name,2) as last_2_char
FROM customers ;
	
/* ============================================================================== 
   SUBSTRING() - Extracting Substrings
=============================================================================== */

-- Retrieve a list of customers' first names after removing the first character
SELECT 
first_name,
SUBSTRING(TRIM(first_name), 2, len(first_name)) as substring
FROM customers ;

/* ==============================================================================
   NESTING FUNCTIONS
===============================================================================*/

-- Nesting
SELECT 
LOWER(UPPER(TRIM(first_name))) as lower
FROM customers ;
