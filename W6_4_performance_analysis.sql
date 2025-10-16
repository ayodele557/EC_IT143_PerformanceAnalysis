/* ============================================================
   W6.4 Performance Analysis Assignment
   Author: [Your Name]
   Database: AdventureWorksLT2022
   Description: Demonstrating missing index recommendations,
                creating indexes, and improving query performance.
   ============================================================ */

-- Step 1: Use the AdventureWorksLT2022 database
USE AdventureWorksLT2022;
GO

/* ============================================================
   QUERY 1: Find missing index on SalesLT.Customer (EmailAddress)
   ============================================================ */

-- Turn ON Actual Execution Plan before running (Ctrl + M)
SELECT *
FROM SalesLT.Customer
WHERE EmailAddress = 'amy0@adventure-works.com';
GO

-- 💡 After running this query:
-- 1. Go to the "Execution Plan" tab.
-- 2. Look for green text: "Missing Index Recommendation".
-- 3. Right-click → Missing Index Details → Copy SQL suggestion.

-- Example of what SQL Server might recommend:
-- (Do not copy exactly if your suggestion differs slightly)

CREATE NONCLUSTERED INDEX IX_Customer_EmailAddress
ON SalesLT.Customer (EmailAddress);
GO

-- Step 4: Re-run the query to verify performance improvement
SELECT *
FROM SalesLT.Customer
WHERE EmailAddress = 'amy0@adventure-works.com';
GO


/* ============================================================
   QUERY 2: Find missing index on SalesLT.Product (Color)
   ============================================================ */

-- Step 1: Run this query (again, with Actual Execution Plan ON)
SELECT *
FROM SalesLT.Product
WHERE Color = 'Black';
GO

-- 💡 After running:
-- 1. Check for a missing index recommendation in the Execution Plan.
-- 2. Right-click → Missing Index Details → Copy the suggested code.

-- Example of a likely recommendation:
CREATE NONCLUSTERED INDEX IX_Product_Color
ON SalesLT.Product (Color);
GO

-- Step 4: Re-run the same query to see the improved execution plan
SELECT *
FROM SalesLT.Product
WHERE Color = 'Black';
GO


/* ============================================================
   PERFORMANCE CHECK NOTES
   ============================================================
   - Before creating indexes, both queries likely used a TABLE SCAN.
   - After creating indexes, SQL Server will use an INDEX SEEK.
   - You should see the Estimated Subtree Cost decrease.
   - Capture screenshots or record this as part of your video.
   ============================================================ */


/* ============================================================
   PROFILER QUESTIONS (for video discussion)
   ============================================================
   - Use Cases for SQL Server Profiler:
       * Monitoring query performance and server activity
       * Detecting long-running queries
       * Troubleshooting blocking and deadlocks
       * Auditing user activity or T-SQL statements

   - Major Steps to Use SQL Server Profiler:
       1. Open SQL Server Profiler.
       2. Connect to your SQL Server instance.
       3. Select a Trace Template (e.g., Tuning or Standard).
       4. Start the trace and run your queries.
       5. Observe performance events (e.g., RPC:Completed, SQL:BatchCompleted).
       6. Stop and save the trace for analysis.
   ============================================================ */

-- END OF SCRIPT
