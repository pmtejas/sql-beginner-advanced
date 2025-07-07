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

/* ============================================================================== 
   INSERT
=============================================================================== */
/* #1 Method: Manual INSERT using VALUES */
-- Insert new records into the customers table


-- Incorrect column order 

    
-- Incorrect data type in values


-- Insert a new record with full column values


-- Insert a new record without specifying column names (not recommended)

    
-- Insert a record with only id and first_name (other columns will be NULL or default values)


/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */
-- Copy data from the 'customers' table into 'persons'


/* ============================================================================== 
   UPDATE
=============================================================================== */

-- Change the score of customer with ID 6 to 0


-- Change the score of customer with ID 10 to 0 and update the country to 'UK'


-- Update all customers with a NULL score by setting their score to 0


-- Verify the update


/* ============================================================================== 
   DELETE
=============================================================================== */

-- Select customers with an ID greater than 5 before deleting


-- Delete all customers with an ID greater than 5


-- Delete all data from the persons table


-- Faster method to delete all rows, especially useful for large tables

