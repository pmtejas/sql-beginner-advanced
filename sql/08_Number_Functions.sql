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
use mydatabase
-- Demonstrate rounding a number to different decimal places
SELECT 3.516 as originalNumber ,
ROUND(3.516,2) as Round_2,
ROUND(3.516,1) as Round_1,
Round(3.516,0) as Round_0

/* ============================================================================== 
   ABS() - Absolute Value
=============================================================================== */

-- Demonstrate absolute value function
SELECT -10 as originalNumber ,
ABS(-10) as absoluteNegativeNumer,
ABS(10) as absolutepositivenumber