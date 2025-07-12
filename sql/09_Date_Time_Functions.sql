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
use salesdb
/* ==============================================================================
   GETDATE() | DATE VALUES
===============================================================================*/

/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/
SELECT 
OrderID,
CreationTime,
'2025-06-11' as hardcoded_date,
GETDATE() as todaysDate
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
DATETRUNC(YEAR,CreationTime) as DTY,
DATETRUNC(Day,CreationTime) as DTD,
DATETRUNC(MINUTE,CreationTime) as DTminute,
DATENAME(MONTH,CreationTime) as DNM,
DATENAME(WEEKDAY,CreationTime) as DNW,
DATENAME(DAY,CreationTime) as DND,
DATENAME(YEAR,CreationTime) as DNY,
DATEPART(YEAR,CreationTime) as DPY,
DATEPART(MONTH,CreationTime) as DPM,
DATEPART(DAY,CreationTime) as DPD,
DATEPART(HOUR,CreationTime) as DPH,
DATEPART(QUARTER,CreationTime) as DPQ,
DATEPART(WEEK,CreationTime) as DPW,
YEAR(CreationTime) as Year,
MONTH(CreationTime) as MONTH,
DAY(CreationTime) as DAY
FROM Sales.Orders ;
/* ==============================================================================
   DATETRUNC() DATA AGGREGATION
===============================================================================*/

/* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/
SELECT 
DATETRUNC(Year,CreationTime) as YEAR,
count(1) as Total_orders
FROM Sales.Orders 
GROUP BY DATETRUNC(Year,CreationTime)


/* ==============================================================================
   EOMONTH()
===============================================================================*/

/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/
SELECT 
OrderID,
CreationTime,
EOMONTH(CreationTime) as Eomonth
FROM Sales.Orders 

/* ==============================================================================
   DATE PARTS | USE CASES
===============================================================================*/

/* TASK 5:
   How many orders were placed each year?
*/
SELECT 
YEAR(CreationTime) as year,
COUNT(1) as total_orders
FROM Sales.Orders
GROUP BY YEAR(CreationTime)


/* TASK 6:
   How many orders were placed each month?
*/
SELECT 
MONTH(CreationTime) as MONTH,
count(*) as Total_orders
FROM Sales.Orders 
GROUP BY MONTH(CreationTime) 
ORDER by MIN(OrderDate)

/* TASK 7:
   How many orders were placed each month (using friendly month names)?
*/
SELECT 
DATENAME(MONTH,CreationTime) as MONTH,
count(*) as Total_orders
FROM Sales.Orders 
GROUP BY DATENAME(MONTH,CreationTime)
ORDER by MIN(OrderDate)

/* TASK 8:
   Show all orders that were placed during the month of February.
*/
SELECT 
DATENAME(MONTH,CreationTime) as MONTH,
count(*) as Total_orders
FROM Sales.Orders 
WHERE MONTH(CreationTime)=2
GROUP BY DATENAME(MONTH,CreationTime)


/* ==============================================================================
   FORMAT()
===============================================================================*/

/* TASK 9:
   Format CreationTime into various string representations.
*/
SELECT 
CreationTime,
FORMAT(creationtime,'yyyy-MM-dd') as usFormat,
FORMAT(creationtime,'dd-MM-yyyy') as EuroFormat,
FORMAT(creationtime,'dd') as dd,
FORMAT(creationtime,'ddd') as dd,
FORMAT(creationtime,'dddd') as dddd,
FORMAT(creationtime,'MM') as MM,
FORMAT(creationtime,'MMM') as MMM,
FORMAT(creationtime,'MMMM') as MMMM,
FORMAT(creationtime,'yyyy') as yyyy
FROM Sales.Orders ;

/* TASK 10:
   Display CreationTime using a custom format:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/
SELECT 
CreationTime,
'Day '+FORMAT(CreationTime,'ddd MMM ')+'Q'+DATENAME(QUARTER,CreationTime)+' '+FORMAT(creationtime, 'yyyy hh:mm:ss:tt') as customeformat
FROM Sales.Orders ;

/* TASK 11:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
*/
SELECT 
FORMAT(CreationTime, 'MMM yy') as YEAR,
count(*) as total_orders
FROM Sales.Orders 
GROUP BY FORMAT(CreationTime, 'MMM yy')
order by min(OrderDate)
/* ==============================================================================
   CONVERT()
===============================================================================*/

/* TASK 12:
   Demonstrate conversion using CONVERT.
*/
SELECT CONVERT(int ,'123') as stringToint

/* ==============================================================================
   CAST()
===============================================================================*/

/* TASK 13:
   Convert data types using CAST.
*/
SELECT CAST('123' AS int) as stringToint

/* ==============================================================================
   DATEADD() / DATEDIFF()
===============================================================================*/

/* TASK 14:
   Perform date arithmetic on OrderDate.
*/
SELECT 
CreationTime,
DATEADD(DAY,2,CreationTime) as twodaysAfter,
DATEADD(MONTH,2,CreationTime) as twoMONthAfter,
DATEADD(DAY,-2,CreationTime) as twodaysBefore
FROM Sales.Orders ;

/* TASK 15:
   Calculate the age of employees.
*/
SELECT 
EmployeeID,
FirstName,
BirthDate,
DATEDIFF(YEAR,BirthDate,GETDATE()) AS AGE
FROM Sales.Employees ;

/* TASK 16:
   Find the average shipping duration in days for each month.
*/
SELECT 
MONTH(CreationTime) as MONTH,
AVG(DATEDIFF(DAY,OrderDate,ShipDate))  as avgShippingDays
FROM Sales.Orders 
GROUP BY MONTH(CreationTime)


/* TASK 17:
   Time Gap Analysis: Find the number of days between each order and the previous order.
*/
SELECT 
OrderDate,
LAG(OrderDate) OVER(order by OrderDate) as previousOrder,
DATEDIFF(day,LAG(OrderDate) OVER(order by OrderDate), OrderDate ) as numberofdays
FROM Sales.Orders ;
/* ==============================================================================
   ISDATE()
===============================================================================*/

/* TASK 18:
   Validate OrderDate using ISDATE and convert valid dates.
*/
SELECT 
ISDATE('2025-09-06') as ISDATE
FROM  Sales.Orders;
-- WHERE ISDATE(OrderDate) = 0