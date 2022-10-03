Hacker Rank Challenges - Basic SQL. https://www.hackerrank.com/domains/sql

1.  Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
Solution:
SELECT *
FROM CITY
WHERE population >100000
AND countrycode = "USA";

2. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
Solution:
SELECT name
FROM city
WHERE population >120000
AND countrycode = "USA";

3. Query all columns (attributes) for every row in the CITY table.
Solution:
SELECT *
FROM city;

4. Query all columns for a city in CITY with the ID 1661.
Solution:
SELECT *
FROM city
WHERE id=1661;

5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
Solution:
SELECT * 
FROM city
WHERE countrycode = "JPN";

6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
Solution:
SELECT name
FROM city
WHERE countrycode = "JPN";

7.Query a list of CITY and STATE from the STATION table.
Solution:
SELECT city, state
FROM station;

8.Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
Solution:
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2) = 0;

9. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
Solution:
SELECT COUNT(CITY)-COUNT(DISTINCT(CITY))
FROM STATION;

10. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
Solution:
SELECT city, LENGTH(city) 
FROM station
ORDER BY LENGTH(city),city ASC
limit 1;
SELECT city, LENGTH(city) 
FROM station
ORDER BY LENGTH(city) DESC
limit 1;

11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
Solution:
SELECT DISTINCT city 
FROM station 
WHERE (city LIKE 'A%' or city LIKE'E%' or city LIKE 'I%' or city LIKE 'O%' or city LIKE 'U%');

12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
Solution:
SELECT DISTINCT city
FROM station
WHERE (city LIKE '%a' or city LIKE '%e' or city LIKE '%i' or city LIKE '%o' or city LIKE '%u');

13. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
Solution:
SELECT DISTINCT city 
FROM station
WHERE (city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%') AND (city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u');

14.Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
Solution:
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[^aeiou]';

15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
Solution:
SELECT DISTINCT city
FROM station
WHERE city REGEXP '[^aeiou]$';

16. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
Solution:
 SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[^aeiou]|[^aeiou]$';

17. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
Solution:
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$';

18.Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
Solution:
SELECT name
FROM students
WHERE marks >75
ORDER BY right (name, 3), id;

19. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
Solution:
SELECT name
FROM employee
ORDER BY name;

20. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
Solution:
SELECT name
FROM employee
WHERE salary >2000 AND months <10
ORDER BY employee_id;
