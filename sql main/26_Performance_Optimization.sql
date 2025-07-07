/* ==============================================================================
   30x SQL Performance Tips
-------------------------------------------------------------------------------
   This section demonstrates best practices for fetching data, filtering,
   joins, UNION, aggregations, subqueries/CTE, DDL, and indexing.
   It covers techniques such as selecting only necessary columns,
   proper filtering methods, explicit joins, avoiding redundant logic,
   and efficient indexing strategies.
   
   Table of Contents:
     1. FETCHING DATA
     2. FILTERING
     3. JOINS
     4. UNION
     5. AGGREGATIONS
     6. SUBQUERIES, CTE
     7. DDL
     8. INDEXING
===============================================================================
*/

-- ###############################################################
-- #                        FETCHING DATA                        #
-- ###############################################################

-- ============================================
-- Tip 1: Select Only What You Need
-- ============================================

-- Bad Practice


-- Good Practice


-- ============================================
-- Tip 2: Avoid unnecessary DISTINCT & ORDER BY
-- ============================================

-- Bad Practice


-- Good Practice

-- ============================================
-- Tip 3: For Exploration Purpose, Limit Rows!
-- ============================================

-- Bad Practice


-- Good Practice


-- ###########################################################
-- #                        FILTERING                        #
-- ###########################################################

/* ==============================================================================
   Tip 4: Create nonclustered Index on frequently used Columns in WHERE clause
===============================================================================*/



/* ==============================================================================
   Tip 5: Avoid applying functions to columns in WHERE clauses
===============================================================================*/

-- Bad Practice


-- Good Practice

---------------------------------------------------------
-- Bad Practice


-- Good Practice

---------------------------------------------------------
-- Bad Practice

-- Good Practice


/* ==============================================================================
   Tip 6: Avoid leading wildcards as they prevent index usage
===============================================================================*/

-- Bad Practice


-- Good Practice


/* ==============================================================================
   Tip 7: Use IN instead of Multiple OR
===============================================================================*/

-- Bad Practice


-- Good Practice


-- #######################################################
-- #                        JOINS                        #
-- #######################################################

/* ==============================================================================
   Tip 8: Understand The Speed of Joins & Use INNER JOIN when possible
===============================================================================*/

-- Best Performance


-- Slightly Slower Performance


-- Worst Performance
/* ==============================================================================
   Tip 9: Use Explicit Join (ANSI Join) Instead of Implicit Join (non-ANSI Join)
===============================================================================*/

-- Bad Practice


-- Good Practice

--For simple queries: There is no measurable performance difference if both ANSI and non-ANSI queries are correctly written.
--For complex queries: ANSI joins are usually easier to optimize and debug because their structure makes the intent of the query clearer.

/* ==============================================================================
   Tip 10: Make sure to Index the columns used in the ON clause
===============================================================================*/



/* ==============================================================================
   Tip 11: Filter Before Joining (Big Tables)
===============================================================================*/

-- Best Practice For Small-Medium Tables
-- Filter After Join (WHERE)


-- Filter During Join (ON)

-- Best Practice For Big Tables
-- Filter Before Join (SUBQUERY)

/* ==============================================================================
   Tip 12: Aggregate Before Joining (Big Tables)
===============================================================================*/

-- Best Practice For Small-Medium Tables
-- Grouping and Joining


-- Best Practice For Big Tables
-- Pre-aggregated Subquery


-- Bad Practice
-- Correlated Subquery


/* ==============================================================================
   Tip 13: Use Union Instead of OR in Joins
===============================================================================*/

-- Bad Practice


-- Best Practice


/* ==============================================================================
   Tip 14: Check for Nested Loops and Use SQL HINTS
===============================================================================*/



-- Good Practice for Having Big Table & Small Table


-- ################################################################
-- #                           UNION                              #
-- ################################################################

/* ==============================================================================
   Tip 15: Use UNION ALL instead of using UNION | duplicates are acceptable
===============================================================================*/

-- Bad Practice


-- Best Practice


/* =======================================================================================
   Tip 16: Use UNION ALL + Distinct instead of using UNION | duplicates are not acceptable
========================================================================================*/

-- Bad Practice


-- Best Practice



-- ##########################################################
-- #                     AGGREGATIONS                       #
-- ##########################################################

/* ==============================================================================
   Tip 17: Use Columnstore Index for Aggregations on Large Table
===============================================================================*/



/* ==============================================================================
   Tip 18: Pre-Aggregate Data and store it in new Table for Reporting
===============================================================================*/




-- ##############################################################
-- #                       SUBQUERIES, CTE                      #
-- ##############################################################

/* ==============================================================================
   Tip 19: JOIN vs EXISTS vs IN (Avoid using IN)
===============================================================================*/

-- JOIN (Best Practice: If the Performance equals to EXISTS)


-- EXISTS (Best Practice: Use it for Large Tables)


-- IN (Bad Practice)


/* ==============================================================================
   Tip 20: Avoid Redundant Logic in Your Query
===============================================================================*/

-- Bad Practice


-- Good Practice


-- ##############################################################
-- #                             DDL                            #
-- ##############################################################
/*
=============================================================================
Tip 21: Avoid VARCHAR Data Type If Possible
=============================================================================
Tip 22: Avoid Using MAX or Overly Large Lengths
=============================================================================
Tip 23: Use NOT NULL If possible 
=============================================================================
Tip 24: Make sure all tables have a CLUSTERED PRIMARY KEY
=============================================================================
Tip 25: Creeate Nonclustered Index on Foreign Key if they are frequently used
=============================================================================
*/
-- Bad Practice 

-- Good Practice Practice 


-- ##############################################################
-- #                        INDEXING                            #
-- ##############################################################
/*
=================================================================================================================================
Tip 26: Avoid Over Indexing, as it can slow down insert, update, and delete operations
=================================================================================================================================
Tip 27: Regularly review and drop unused indexes to save space and improve write performance
=================================================================================================================================
Tip 28: Update table statistics weekly to ensure the query optimizer has the most up-to-date information
=================================================================================================================================
Tip 29: Reorganize and rebuild fragmented indexes weekly to maintain query performance.
=================================================================================================================================
Tip 30: For large tables (e.g., fact tables), partition the data and then apply a columnstore index for best performance results
=================================================================================================================================
*/

