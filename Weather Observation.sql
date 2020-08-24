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

SQL Query:


Problem 13:

SQL Query:


Problem 14:

SQL Query:


Problem 15:

SQL Query: