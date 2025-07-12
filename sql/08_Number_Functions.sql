/* ============================================================================== 
   SQL Number Functions Guide
-------------------------------------------------------------------------------
   This document provides an overview of SQL number functions, which allow 
   performing mathematical operations and formatting numerical values.

   Table of Contents:
     1. Rounding Functions
        - ROUND
     2. Absolute Value Function
        - ABS
=================================================================================
*/

/* ============================================================================== 
   ROUND() - Rounding Numbers
=============================================================================== */
use mydatabase;
-- Demonstrate rounding a number to different decimal places
SELECT 3.516 as orginalNumber,
ROUND(3.516, 2) as round_2,
ROUND(3.516, 1) as round_1,
ROUND(3.516, 0) as round_0

/* ============================================================================== 
   ABS() - Absolute Value
=============================================================================== */

-- Demonstrate absolute value function
SELECT -10 as orginalNumber,
ABS(-10) as absoluteNegative,
ABS(10) as absolutePositive