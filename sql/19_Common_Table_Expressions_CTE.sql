/* ==============================================================================
   SQL Common Table Expressions (CTEs)
-------------------------------------------------------------------------------
   This script demonstrates the use of Common Table Expressions (CTEs) in SQL Server.
   It includes examples of non-recursive CTEs for data aggregation and segmentation,
   as well as recursive CTEs for generating sequences and building hierarchical data.

   Table of Contents:
     1. NON-RECURSIVE CTE
     2. RECURSIVE CTE | GENERATE SEQUENCE
     3. RECURSIVE CTE | BUILD HIERARCHY
===============================================================================

/* ==============================================================================
   NON-RECURSIVE CTE
===============================================================================*/


-- Step1: Find the total Sales Per Customer (Standalone CTE)


-- Step2: Find the last order date for each customer (Standalone CTE)


-- Step3: Rank Customers based on Total Sales Per Customer (Nested CTE)

-- Step4: segment customers based on their total sales (Nested CTE)

-- Main Query

/* ==============================================================================
   RECURSIVE CTE | GENERATE SEQUENCE
===============================================================================*/

/* TASK 2:
   Generate a sequence of numbers from 1 to 20.
*/

-- Main Query


/* TASK 3:
   Generate a sequence of numbers from 1 to 1000.
*/


/* ==============================================================================
   RECURSIVE CTE | BUILD HIERARCHY
===============================================================================*/

/* TASK 4:
   Build the employee hierarchy by displaying each employee's level within the organization.
   - Anchor Query: Select employees with no manager.
   - Recursive Query: Select subordinates and increment the level.
*/

    -- Recursive Query: Get subordinate employees and increment level

-- Main Query
