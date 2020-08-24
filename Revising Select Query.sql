
The CITY table is described as follows:

CITY

Field		Type
ID		NUMBER
NAME		VARCHAR2(17)
COUNTRYCODE	VARCHAR2(3)
DISTRICT	VARCHAR2(20)
POPULATION	NUMBER


Problem 1:
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SQL Query:

SELECT * FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA'

Problem 2:
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SQL Query:

SELECT DISTINCT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA'

Problem 3:
Query all columns (attributes) for every row in the CITY table.

SQL Query:
SELECT * FROM CITY

Problem 4:
Query all columns for a city in CITY with the ID 1661.

SQL Query:
SELECT * FROM CITY WHERE ID = 1661;

Problem 5:
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SQL Query:
SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';

Problem 6:
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SQL Query:
SELECT DISTINCT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';

