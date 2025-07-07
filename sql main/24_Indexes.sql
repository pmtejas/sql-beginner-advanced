/* ==============================================================================
   SQL Indexing
-------------------------------------------------------------------------------
   This script demonstrates various index types in SQL Server including clustered,
   non-clustered, columnstore, unique, and filtered indexes. It provides examples 
   of creating a heap table, applying different index types, and testing their 
   usage with sample queries.

   Table of Contents:
	   Index Types:
			 - Clustered and Non-Clustered Indexes
			 - Leftmost Prefix Rule Explanation
			 - Columnstore Indexes
			 - Unique Indexes
			 - Filtered Indexes
		Index Monitoring:
			 - Monitor Index Usage
			 - Monitor Missing Indexes
			 - Monitor Duplicate Indexes
			 - Update Statistics
			 - Fragmentations
=================================================================================
*/

/* ==============================================================================
   Clustered and Non-Clustered Indexes
============================================================================== */

-- Create a Heap Table as a copy of Sales.Customers 


-- Test Query: Select Data and Check the Execution Plan


-- Create a Clustered Index on Sales.DBCustomers using CustomerID


-- Attempt to create a second Clustered Index on the same table (will fail) 

-- Drop the Clustered Index 

-- Test Query: Select Data with a Filter on LastName


-- Create a Non-Clustered Index on LastName


-- Create an additional Non-Clustered Index on FirstName


-- Create a Composite (Composed) Index on Country and Score 


-- Query that uses the Composite Index


-- Query that likely won't use the Composite Index due to column order


/* ==============================================================================
   Leftmost Prefix Rule Explanation
-------------------------------------------------------------------------------
   For a composite index defined on columns (A, B, C, D), the index can be
   utilized by queries that filter on:
     - Column A only,
     - Columns A and B,
     - Columns A, B, and C.
   However, queries that filter on:
     - Column B only,
     - Columns A and C,
     - Columns A, B, and D,
   will not be able to fully utilize the index due to the leftmost prefix rule.
=================================================================================
*/

/* ==============================================================================
   Columnstore Indexes
============================================================================== */

-- Create a Clustered Columnstore Index on Sales.DBCustomers


-- Create a Non-Clustered Columnstore Index on the FirstName column


-- Switch context to AdventureWorksDW2022 for FactInternetSales examples */


-- Create a Heap Table from FactInternetSales


-- Create a RowStore Table from FactInternetSales


-- Create a Clustered Index (RowStore) on FactInternetSales_RS


-- Create a Columnstore Table from FactInternetSales


-- Create a Clustered Columnstore Index on FactInternetSales_CS

/* ==============================================================================
   Unique Indexes
============================================================================== */

-- Attempt to create a Unique Index on the Category column in Sales.Products.



  
-- Create a Unique Index on the Product column in Sales.Products

  
-- Test Insert: Attempt to insert a duplicate value (should fail if the constraint is enforced)

/* ==============================================================================
   Filtered Indexes
============================================================================== */

-- Test Query: Select Customers where Country is 'USA' 

  
-- Create a Non-Clustered Filtered Index on the Country column for rows where Country = 'USA'


/* ==============================================================================
   Index Monitoring
-------------------------------------------------------------------------------
     - List indexes and monitor their usage.
     - Report missing and duplicate indexes.
     - Retrieve and update statistics.
     - Check index fragmentation and perform index maintenance (reorganize/rebuild).
=================================================================================
*/

/* ==============================================================================
   Monitor Index Usage
============================================================================== */

-- List all indexes on a specific table


-- Monitor Index Usage


/* ==============================================================================
   Monitor Missing Indexes
============================================================================== */



/* ==============================================================================
   Monitor Duplicate Indexes
============================================================================== */


/* ==============================================================================
   Update Statistics
============================================================================== */



-- Update statistics for a specific automatically created system statistic

-- Update all statistics for the Sales.DBCustomers table


-- Update statistics for all tables in the database


/* ==============================================================================
   Fragementations
============================================================================== */

-- Retrieve index fragmentation statistics for the current database


-- Reorganize the index (lightweight defragmentation)


-- Rebuild the index (full rebuild, more resource-intensive)





