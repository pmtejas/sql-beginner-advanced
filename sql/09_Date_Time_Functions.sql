/* ==============================================================================
   SQL Date & Time Functions
-------------------------------------------------------------------------------
   This script demonstrates various date and time functions in SQL.
   It covers functions such as GETDATE, DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, DAY, EOMONTH, FORMAT, CONVERT, CAST, DATEADD, DATEDIFF,
   and ISDATE.
   
   Table of Contents:
     1. GETDATE | Date Values
     2. Date Part Extractions (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
     3. DATETRUNC
     4. EOMONTH
     5. Date Parts
     6. FORMAT
     7. CONVERT
     8. CAST
     9. DATEADD / DATEDIFF
    10. ISDATE
===============================================================================
*/

/* ==============================================================================
   GETDATE() | DATE VALUES
===============================================================================*/

/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/

/* ==============================================================================
   DATE PART EXTRACTIONS
   (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
===============================================================================*/

/* TASK 2:
   Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/

    -- DATETRUNC Examples
         --YEAR
         --Day
         --minute

    -- DATENAME Examples
         --month
         --week
         --day
         --year

    -- DATEPART Examples
       --year
       --month
       --day
       --hour
       --quarter
       --week

       --year
       --month
       --day

/* ==============================================================================
   DATETRUNC() DATA AGGREGATION
===============================================================================*/

/* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/


/* ==============================================================================
   EOMONTH()
===============================================================================*/

/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/

/* ==============================================================================
   DATE PARTS | USE CASES
===============================================================================*/

/* TASK 5:
   How many orders were placed each year?
*/


/* TASK 6:
   How many orders were placed each month?
*/


/* TASK 7:
   How many orders were placed each month (using friendly month names)?
*/


/* TASK 8:
   Show all orders that were placed during the month of February.
*/


/* ==============================================================================
   FORMAT()
===============================================================================*/

/* TASK 9:
   Format CreationTime into various string representations.
*/


/* TASK 10:
   Display CreationTime using a custom format:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/


/* TASK 11:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
*/

/* ==============================================================================
   CONVERT()
===============================================================================*/

/* TASK 12:
   Demonstrate conversion using CONVERT.
*/


/* ==============================================================================
   CAST()
===============================================================================*/

/* TASK 13:
   Convert data types using CAST.
*/


/* ==============================================================================
   DATEADD() / DATEDIFF()
===============================================================================*/

/* TASK 14:
   Perform date arithmetic on OrderDate.
*/

/* TASK 15:
   Calculate the age of employees.
*/


/* TASK 16:
   Find the average shipping duration in days for each month.
*/


/* TASK 17:
   Time Gap Analysis: Find the number of days between each order and the previous order.
*/

/* ==============================================================================
   ISDATE()
===============================================================================*/

/* TASK 18:
   Validate OrderDate using ISDATE and convert valid dates.
*/

-- WHERE ISDATE(OrderDate) = 0