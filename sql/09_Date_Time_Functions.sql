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
use SalesDB
/* ==============================================================================
   GETDATE() | DATE VALUES
===============================================================================*/

/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/
SELECT 
OrderID,
CreationTime,
'2025-09-08' as hardCodedDae,
GETDATE()
FROM Sales.Orders ;
/* ==============================================================================
   DATE PART EXTRACTIONS
   (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
===============================================================================*/

/* TASK 2:
   Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/
SELECT 
OrderID,
CreationTime,
    -- DATETRUNC Examples
         --YEAR
DATETRUNC(YEAR,CreationTime) as YearDT,
         --Day
DATETRUNC(DAY,CreationTime) as DAYDT,
         --minute
DATETRUNC(MINUTE,CreationTime) as MINUTEDT,
    -- DATENAME Examples
         --month
DATENAME(MONTH,CreationTime) as MONTHDN,
         --week
DATENAME(WEEKDAY,CreationTime) as WEEKDN,
         --day
DATENAME(DAY,CreationTime) as DAYDN,
         --year
DATENAME(YEAR,CreationTime) as YEARDN,
    -- DATEPART Examples
       --year
DATEPART(YEAR,CreationTime) as YEARDP,
       --month
DATEPART(MONTH,CreationTime) as MONTHDP,
       --day
DATEPART(DAY,CreationTime) as DAYDP,
       --hour
DATEPART(HOUR,CreationTime) as HOURDP,
       --quarter
DATEPART(QUARTER,CreationTime) as QUARTERDP,
       --week
DATEPART(WEEK,CreationTime) as WEEKDP ,
       --year
YEAR(CreationTime) as YEAR,
       --month
MONTH(CreationTime) as MONTH,
       --day
DAY(CreationTime) as DAY
FROM Sales.Orders ;



/* ==============================================================================
   DATETRUNC() DATA AGGREGATION
===============================================================================*/

/* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/
SELECT 
DATETRUNC(YEAR,CreationTime) as creation,
COUNT(*) as orderCount
FROM Sales.Orders 
GROUP BY DATETRUNC(YEAR,CreationTime)

/* ==============================================================================
   EOMONTH()
===============================================================================*/

/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/
SELECT 
OrderID,
CreationTime,
EOMONTH(CreationTime) as EndOfMonth
FROM Sales.Orders ;
/* ==============================================================================
   DATE PARTS | USE CASES
===============================================================================*/

/* TASK 5:
   How many orders were placed each year?
*/
SELECT 
YEAR(OrderDate) as orderyear,
COUNT(*) as total_orders
FROM Sales.Orders 
GROUP BY YEAR(OrderDate)

/* TASK 6:
   How many orders were placed each month?
*/
SELECT 
MONTH(OrderDate) as OrderMonth,
COUNT(*) as total_ordersPerMonth
FROM Sales.Orders 
GROUP BY MONTH(OrderDate)

/* TASK 7:
   How many orders were placed each month (using friendly month names)?
*/
SELECT 
DATENAME(MONTH,CreationTime) as OrderMonth,
COUNT(*) as Total_order_per_month
FROM Sales.Orders 
GROUP BY DATENAME(MONTH,CreationTime)
ORDER by MIN(OrderDate)

/* TASK 8:
   Show all orders that were placed during the month of February.
*/
SELECT 
DATENAME(MONTH,CreationTime) as Order_month,
COUNT(*) as total_order_Per_Month
FROM Sales.Orders 
WHERE DATENAME(MONTH,CreationTime)='February'
GROUP By DATENAME(MONTH,CreationTime)

/* ==============================================================================
   FORMAT()
===============================================================================*/

/* TASK 9:
   Format CreationTime into various string representations.
*/
SELECT
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_Format,
    FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO_Format,
    FORMAT(CreationTime, 'dd') AS dd,
    FORMAT(CreationTime, 'ddd') AS ddd,
    FORMAT(CreationTime, 'dddd') AS dddd,
    FORMAT(CreationTime, 'MM') AS MM,
    FORMAT(CreationTime, 'MMM') AS MMM,
    FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders;

/* TASK 10:
   Display CreationTime using a custom format:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/
SELECT
    OrderID,
    CreationTime,
    'Day ' + FORMAT(CreationTime, 'ddd MMM') +
    ' Q' + DATENAME(quarter, CreationTime) + ' ' +
    FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomFormat
FROM Sales.Orders;
/* TASK 11:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
*/
SELECT
    FORMAT(CreationTime, 'MMM yy') AS OrderDate,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY FORMAT(CreationTime, 'MMM yy')
ORDER BY MIN(OrderDate)
/* ==============================================================================
   CONVERT()
===============================================================================*/

/* TASK 12:
   Demonstrate conversion using CONVERT.
*/
SELECT
    CONVERT(INT, '123') AS [String to Int CONVERT],
    CONVERT(DATE, '2025-08-20') AS [String to Date CONVERT],
    CreationTime,
    CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
    CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32],
    CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style:34]
FROM Sales.Orders;

/* ==============================================================================
   CAST()
===============================================================================*/

/* TASK 13:
   Convert data types using CAST.
*/
SELECT
    CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATE) AS [String to Date],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;

/* ==============================================================================
   DATEADD() / DATEDIFF()
===============================================================================*/

/* TASK 14:
   Perform date arithmetic on OrderDate.
*/
SELECT
    OrderID,
    OrderDate,
    DATEADD(day, -10, OrderDate) AS TenDaysBefore,
    DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
    DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;

/* TASK 15:
   Calculate the age of employees.
*/
SELECT 
   FirstName,
   BirthDate,
   DATEDIFF(YEAR,BirthDate,GETDATE()) AS aGE
FROM Sales.Employees ;


/* TASK 16:
   Find the average shipping duration in days for each month.
*/
SELECT
    MONTH(OrderDate) AS OrderMonth,
    AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

/* TASK 17:
   Time Gap Analysis: Find the number of days between each order and the previous order.
*/
SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;
/* ==============================================================================
   ISDATE()
===============================================================================*/

/* TASK 18:
   Validate OrderDate using ISDATE and convert valid dates.
*/
SELECT
    OrderDate,
    ISDATE(OrderDate) AS IsValidDate,
    CASE 
        WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
        ELSE '9999-01-01'
    END AS NewOrderDate
FROM (
    SELECT '2025-08-20' AS OrderDate UNION
    SELECT '2025-08-21' UNION
    SELECT '2025-08-23' UNION
    SELECT '2025-08'
) AS t

-- WHERE ISDATE(OrderDate) = 0