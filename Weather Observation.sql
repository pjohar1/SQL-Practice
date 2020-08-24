The STATION table is described as follows:

where LAT_N is the northern latitude and LONG_W is the western longitude.

STATION:

Field		Type
ID		NUMBER
CITY		VARCHAR2(21)
STATE		VARCHAR2(2)
LAT_N		NUMBER
LONG_W		NUMBER


Problem 1:
Query a list of CITY and STATE from the STATION table.

SQL Query:
SELECT DISTINCT CITY, STATE FROM STATION


Problem 2:
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

SQL Query:
SELECT DISTINCT CITY FROM STATION WHERE (ID % 2 = 0) 


Problem 3:
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
The STATION table is described as follows:

SQL Query:
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION


Problem 4:
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SQL Query:
SELECT CITY, LENGTH(CITY) FROM STATION 
WHERE (LENGTH(CITY) = (SELECT MAX(LENGTH(CITY)) FROM STATION) OR LENGTH(CITY) = (SELECT MIN(LENGTH(CITY)) FROM STATION) )
ORDER BY 2 DESC, 1 ASC LIMIT 2


Problem 5:
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.	

SQL Query:
SELECT DISTINCT CITY FROM STATION WHERE SUBSTRING(CITY,1,1) IN ('A', 'E', 'I', 'O', 'U')


Problem 6:
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SQL Query:
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) IN ('a', 'e', 'i', 'o', 'u')


Problem 7:
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SQL Query:
SELECT DISTINCT CITY FROM STATION WHERE LOWER(RIGHT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u') AND LOWER(LEFT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u')

Problem 8:
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SQL Query:
SELECT DISTINCT CITY FROM STATION WHERE LOWER(LEFT(CITY,1)) NOT IN ('a', 'e', 'i', 'o', 'u');


Problem 9:
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SQL Query:
SELECT DISTINCT CITY FROM STATION WHERE LOWER(SUBSTR(CITY,-1,1)) NOT IN ('a', 'e', 'i', 'o', 'u');


Problem 10:
SELECT DISTINCT CITY FROM STATION WHERE LOWER(SUBSTR(CITY,-1,1)) NOT IN ('a', 'e', 'i', 'o', 'u');

SQL Query:
SELECT DISTINCT CITY FROM STATION 
WHERE LOWER(SUBSTR(CITY,-1,1)) NOT IN ('a', 'e', 'i', 'o', 'u')
OR LOWER(SUBSTR(CITY,1,1)) NOT IN ('a', 'e', 'i', 'o', 'u');


Problem 11:
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SQL Query:
SELECT DISTINCT CITY FROM STATION 
WHERE LOWER(SUBSTR(CITY,-1,1)) NOT IN ('a', 'e', 'i', 'o', 'u')
AND LOWER(SUBSTR(CITY,1,1)) NOT IN ('a', 'e', 'i', 'o', 'u');


Problem 12:
Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.

SQL Query:
SELECT ROUND(SUM(LAT_N),2) AS lat, ROUND(SUM(LONG_W),2) AS lon FROM STATION


Problem 13:
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

SQL Query:
SELECT TRUNCATE(SUM(LAT_N),4) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345


Problem 14:
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places

SQL Query:
SELECT TRUNCATE(MAX(LAT_N),4) FROM STATION WHERE LAT_N < 137.2345


Problem 15:
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

SQL Query:
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345)


Problem 16:
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880. Round your answer to 4 decimal places.

SQL Query:
SELECT ROUND(MIN(LAT_N),4) FROM STATION WHERE LAT_N > 38.7780


Problem 17:
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880. Round your answer to 4 decimal places.

SQL Query:
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780)


Problem 18:
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

SQL Query:
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),4) FROM STATION

Problem 19:
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) 
are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.

SQL Query:
SELECT TRUNCATE(SQRT( POWER(MIN(LAT_N)- MAX(LAT_N),2) + POWER(MIN(LONG_W)- MAX(LONG_W),2)),4) FROM STATION


Problem 20:
A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

SQL Query:
WITH cte AS (SELECT s.*, ROW_NUMBER() OVER (ORDER BY LAT_N) rn,
            COUNT(*) OVER () cnt
            FROM STATION s)

SELECT ROUND(AVG(LAT_N),4) FROM cte 
WHERE 
(MOD(cnt, 2) = 0 AND rn IN (FLOOR(cnt/2), FLOOR(cnt/2)+1))
OR
(MOD(cnt,2) = 1) AND rn IN (FLOOR(cnt/2)+1)