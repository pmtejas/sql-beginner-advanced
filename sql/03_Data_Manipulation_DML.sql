/* ==============================================================================
   SQL Data Manipulation Language (DML)
-------------------------------------------------------------------------------
   This guide covers the essential DML commands used for inserting, updating, 
   and deleting data in database tables.

   Table of Contents:
     1. INSERT - Adding Data to Tables
     2. UPDATE - Modifying Existing Data
     3. DELETE - Removing Data from Tables
=================================================================================
*/
use mydatabase;
/* ============================================================================== 
   INSERT
=============================================================================== */
/* #1 Method: Manual INSERT using VALUES */
-- Insert new records into the customers table
INSERT INTO customers (id,first_name,country,score)
VALUES(6,'megha','india',800) ,
      (7,'nitya','uk',780)

-- Incorrect column order 
INSERT INTO customers (country,id,first_name,score)
VALUES(8,'megha','india',800) ;
    
-- Incorrect data type in values
INSERT INTO customers (id,first_name,country,score)
VALUES('megha',8,'india',800) ;

-- Insert a new record with full column values
INSERT INTO customers (id,first_name,country,score)
VALUES(8,'praveen','india',700) ;

-- Insert a new record without specifying column names (not recommended)
INSERT INTO customers 
VALUES(9,'kavana','india',700) ;
    
-- Insert a record with only id and first_name (other columns will be NULL or default values)
INSERT INTO customers (id,first_name)  
VALUES(10,'sara') ;

/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */
-- Copy data from the 'customers' table into 'persons'
INSERT INTO persons (id,persons_name,birth_date,phone)
SELECT 
 id,
 first_name,
 NUll,
 'unknown'
FROM customers ;

/* ============================================================================== 
   UPDATE
=============================================================================== */

-- Change the score of customer with ID 6 to 0
UPDATE customers 
SET score = 0
WHERE id=6 ;

-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
UPDATE customers 
SET score = 0,country='Uk'
WHERE id=10 ;

-- Update all customers with a NULL score by setting their score to 0
UPDATE customers 
SET score = 0
WHERE score is NULL ;

-- Verify the update
SELECT * 
FROM customers ;

/* ============================================================================== 
   DELETE
=============================================================================== */

-- Select customers with an ID greater than 5 before deleting
SELECT * 
FROM customers 
WHERE id>5

-- Delete all customers with an ID greater than 5
DELETE FROM customers
WHERE id>5 ;

-- Delete all data from the persons table
DELETE FROM persons


-- Faster method to delete all rows, especially useful for large tables
TRUNCATE TABLE persons
