SELECT *
FROM dbo.tx_deathrow;


SELECT First_Name, Last_Name, Age_at_Execution
FROM dbo.tx_deathrow
WHERE Age_at_Execution <=25;


SELECT First_Name, Last_Name, Execution, Execution_Date
FROM dbo.tx_deathrow
WHERE First_Name LIKE 'Ray%'
AND Last_Name LIKE '%and%'

SELECT First_Name, Last_Name, Age_at_execution, Execution_date, Last_statement
FROM dbo.tx_deathrow
WHERE First_Name = 'Napoleon'
AND Last_Name LIKE 'B%'


SELECT COUNT (*)
FROM dbo.tx_deathrow

SELECT COUNT (*) AS 'Harris_county_executions'
FROM dbo.tx_deathrow
WHERE  county = 'Harris'

SELECT COUNT (*) AS 'Dallas_county_executions'
FROM dbo.tx_deathrow
WHERE  county = 'Dallas'

SELECT COUNT (*) AS 'Tarrant_county_executions'
FROM dbo.tx_deathrow
WHERE  county = 'Tarrant'

SELECT
SUM (CASE WHEN county = 'Harris' THEN 1 ELSE 0 END) AS 'Harris_county_executions',
SUM (CASE WHEN county = 'Dallas' THEN 1 ELSE 0 END) AS 'Dallas_county_executions',
SUM (CASE WHEN county = 'Tarrant' THEN 1 ELSE 0 END) AS 'Tarrant_county_executions'
FROM dbo.tx_deathrow

SELECT COUNT (*) AS 'Age_50andOver_at_Execution'
FROM dbo.tx_deathrow
WHERE Age_at_Execution >= 50


SELECT COUNT (*) AS 'No_Last_Statement'
FROM dbo.tx_deathrow
WHERE Last_Statement IS NULL

SELECT COUNT(CASE WHEN Last_Statement IS NULL THEN 1 ELSE NULL END) AS 'No_Last_Statement'
FROM dbo.tx_deathrow


SELECT Age_at_Execution
FROM dbo.tx_deathrow

SELECT MIN(Age_at_Execution) AS 'Youngest_Executed'
FROM dbo.tx_deathrow

SELECT MAX(Age_at_Execution) AS 'Oldest_Executed'
FROM dbo.tx_deathrow

SELECT AVG(Age_at_Execution) AS 'Avg_Age_Executed'
FROM dbo.tx_deathrow

SELECT AVG(LEN(Last_Statement)) AS 'Avg_length_LS'
FROM dbo.tx_deathrow



SELECT DISTINCT County
FROM dbo.tx_deathrow


SELECT last_name, first_name, last_statement
FROM dbo.tx_deathrow
WHERE last_statement LIKE '%innocent%'

SELECT 1.0 * COUNT(CASE WHEN last_statement LIKE '%innocent%' THEN 1 ELSE NULL END)/COUNT(*)
FROM dbo.tx_deathrow


SELECT COUNT(*), County
FROM dbo.tx_deathrow
WHERE Age_at_Execution >=50
GROUP BY County

SELECT COUNT(Execution), County
FROM dbo.tx_deathrow
WHERE Age_at_Execution >=50
GROUP BY County
HAVING COUNT(Execution) > 2
ORDER BY COUNT(Execution) DESC


SELECT *
FROM dbo.tx_deathrow;

SELECT county
from dbo.tx_deathrow
group by County


SELECT county,
100.0*COUNT(*)/(SELECT COUNT(*) FROM dbo.tx_deathrow) AS percentage
FROM dbo.tx_deathrow
GROUP BY county
ORDER BY percentage DESC