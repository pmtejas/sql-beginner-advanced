/* ==============================================================================
   SQL Partitioning
-------------------------------------------------------------------------------
   This script demonstrates SQL Server partitioning features. It covers the
   creation of partition functions, filegroups, data files, partition schemes,
   partitioned tables, and verification queries. It also shows how to compare
   execution plans between partitioned and non-partitioned tables.

   Table of Contents:
     1. Create a Partition Function
     2. Create Filegroups
     3. Create Data Files
     4. Create Partition Scheme
     5. Create the Partitioned Table
     6. Insert Data Into the Partitioned Table
     7. Verify Partitioning and Compare Execution Plans
=================================================================================
*/

/* ==============================================================================
   Step 1: Create a Partition Function
============================================================================== */

-- Create Left Range Partition Functions based on Years


-- Query lists all existing Partition Function


/* ==============================================================================
   Step 2: Create Filegroups
============================================================================== */

-- Create Filegroups in SalesDB


-- Optional: Remove a Filegroup if needed


-- Query: List All Existing Filegroups (filter by name pattern if needed)

    
/* ==============================================================================
   Step 3: Create Data Files
============================================================================== */

-- Create Files and map them to Filegroups




/* ==============================================================================
   Step 4: Create Partition Scheme
============================================================================== */


/* ==============================================================================
   Step 5: Create the Partitioned Table
============================================================================== */


/* ==============================================================================
   Step 6: Insert Data Into the Partitioned Table
============================================================================== */


/* ==============================================================================
   Step 7: Verify Partitioning and Compare Execution Plans
============================================================================== */

-- Query: Verify that data is correctly partitioned and assigned to the appropriate filegroups 


-- Compare Execution Plans by creating a non-partitioned copy
-- Create a table without partitions using SELECT INTO

  
-- Query on Partitioned Table

  
-- Query on Non-Partitioned Table
