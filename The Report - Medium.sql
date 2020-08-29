You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.

Column		Type
ID		Integer
Name		String
Marks		Integer



Grades contains the following data:

Grade		Min_Mark		Max_Mark
1		0			9		
2		10			19
3		20			29
4		30			39
5		40			49	
6		50			59
7		60			69
8		70			79
9		80			89
10		90			100


Ketty gives Eve a task to generate a report containing three columns: 
Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.

SQL Query:

SELECT CASE WHEN GRADES > 7 THEN NAME ELSE NULL END AS NAME, GRADES, MARKS

FROM

(SELECT NAME, MARKS, 
CASE
WHEN MARKS BETWEEN 10 AND 19 THEN 2
WHEN MARKS BETWEEN 20 AND 29 THEN 3
WHEN MARKS BETWEEN 30 AND 39 THEN 4
WHEN MARKS BETWEEN 40 AND 49 THEN 5
WHEN MARKS BETWEEN 50 AND 59 THEN 6
WHEN MARKS BETWEEN 60 AND 69 THEN 7
WHEN MARKS BETWEEN 70 AND 79 THEN 8
WHEN MARKS BETWEEN 80 AND 89 THEN 9
WHEN MARKS BETWEEN 90 AND 100 THEN 10
ELSE 1 END AS GRADES
FROM STUDENTS) AS GR

ORDER BY 2 DESC,1 ASC, 3 ASC 