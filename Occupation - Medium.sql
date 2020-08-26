Input Format

The OCCUPATIONS table is described as follows:  

Column		Type
Name		String
occupation	String

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Generate the following two result sets:

Problem 1:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

SQL Query:
SELECT CONCAT(NAME, '(', LEFT(OCCUPATION,1), ')') FROM OCCUPATIONS ORDER BY 1;


Problem 2:
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

SQL Query:
SELECT CONCAT('There are a total of ', COUNT(OCCUPATION),' ', LOWER(OCCUPATION), 's.') FROM OCCUPATIONS
GROUP BY OCCUPATION ORDER BY COUNT(OCCUPATION), OCCUPATION

Note: There will be at least two entries in the table for each type of occupation.


Problem 3:
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.

SQL Query:
SELECT MIN(O.Doctor), MIN(O.Professor), MIN(O.Singer), MIN(O.Actor)

FROM
(
SELECT 
ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) rn,
CASE WHEN OCCUPATION = 'Doctor' THEN NAME ELSE NULL END AS 'Doctor',
CASE WHEN OCCUPATION = 'Professor' THEN NAME ELSE NULL END AS 'Professor',
CASE WHEN OCCUPATION = 'Singer' THEN NAME ELSE NULL END AS 'Singer',
CASE WHEN OCCUPATION = 'Actor' THEN NAME ELSE NULL END AS 'Actor'
FROM OCCUPATIONS) AS O

GROUP BY rn    
ORDER BY rn


Problem 3:

SQL Query:



