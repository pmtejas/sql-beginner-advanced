/* ==============================================================================
   SQL Data Definition Language (DDL)
-------------------------------------------------------------------------------
   This guide covers the essential DDL commands used for defining and managing
   database structures, including creating, modifying, and deleting tables.

   Table of Contents:
     1. CREATE - Creating Tables
     2. ALTER - Modifying Table Structure
     3. DROP - Removing Tables
=================================================================================
*/

/* ============================================================================== 
   CREATE
=============================================================================== */
use mydatabase
/* Create a new table called persons 
   with columns: id, person_name, birth_date, and phone */
drop TABLE if EXISTS persons
create TABLE persons(
   id INT NOT NULL,
   persons_name VARCHAR(50) NOT NULL,
   birth_date Date,
   phone VARCHAR(50) NOT NULL,
   CONSTRAINT pk_persons PRIMARY KEY(id)
)

/* ============================================================================== 
   ALTER
=============================================================================== */

-- Add a new column called email to the persons table
ALTER TABLE persons
Add email VARCHAR(50) NOT NULL


-- Remove the column phone from the persons table
ALTER TABLE persons
Drop COLUMN email

/* ============================================================================== 
   DROP
=============================================================================== */

-- Delete the table persons from the database
drop TABLE persons