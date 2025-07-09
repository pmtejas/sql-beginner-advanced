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

/* ============================================================================== 
   CONCAT() - String Concatenation
=============================================================================== */
use mydatabase
-- Concatenate first name and country into one column
SELECT 
CONCAT(first_name ,'-',country) as full_info
FROM customers ;

/* ============================================================================== 
   LOWER() & UPPER() - Case Transformation
=============================================================================== */

-- Convert the first name to lowercase
SELECT 
LOWER(first_name) as lowerFirstName
FROM customers ;

-- Convert the first name to uppercase
SELECT 
UPPER(first_name) as UpperFirstName
FROM customers ;
	
/* ============================================================================== 
   TRIM() - Remove White Spaces
=============================================================================== */

-- Find customers whose first name contains leading or trailing spaces
SELECT 
first_name,
TRIM(first_name) as TrimmedFirstName,
LEN(first_name) as lengthOfFirstName,
LEN(TRIM(first_name)) as LenghtOFTrimmedFirstname,
LEN(first_name)-LEN(TRIM(first_name)) as Flag
FROM customers 
WHERE LEN(first_name)-LEN(TRIM(first_name))>0


/* ============================================================================== 
   REPLACE() - Replace or Remove old value with new one
=============================================================================== */
-- Remove dashes (-) from a phone number
SELECT '77-95-27-47-67' as orginalPhoneNumber,
REPLACE('77-95-27-47-67','-','/') as cleanPhoneNumber

-- Replace File Extence from txt to csv
SELECT 'report.txt'  as file_text,
REPLACE('report.txt','.txt','.csv') as csv_text
	
/* ============================================================================== 
   LEN() - String Length & Trimming
=============================================================================== */

-- Calculate the length of each customer's first name
SELECT 
first_name,
LEN(first_name) as lenghtOfFirstName,
LEN(TRIM(first_name)) as LenghtOFTrimmedFirstname
FROM customers ;
	
/* ============================================================================== 
   LEFT() & RIGHT() - Substring Extraction
=============================================================================== */

-- Retrieve the first two characters of each first name
SELECT 
first_name,
left(TRIM(first_name),2) as firstTwoChar
FROM customers ;

-- Retrieve the last two characters of each first name
SELECT 
first_name,
RIGHT(TRIM(first_name),2) as RighttwoChar
FROM customers ;
	
/* ============================================================================== 
   SUBSTRING() - Extracting Substrings
=============================================================================== */

-- Retrieve a list of customers' first names after removing the first character
SELECT 
first_name,
SUBSTRING(TRIM(first_name), 2, LEN(first_name)) as TrimmedFirstName
FROM customers ;

/* ==============================================================================
   NESTING FUNCTIONS
===============================================================================*/

-- Nesting
SELECT 
first_name,
UPPER(LOWER(TRIM(first_name)))as uppertrimFirstName
FROM customers ;
