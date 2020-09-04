You are given a table, Functions, containing two columns: X and Y.

COLUMN			TYPE
X			INTEGER
Y			INTEGER


Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.



SQL Query:

(SELECT F1.X, F1.Y FROM FUNCTIONS AS F1
WHERE F1.X = F1.Y
GROUP BY F1.X, F1.Y
HAVING COUNT(*) > 1)
UNION
(SELECT F1.X, F1.Y FROM FUNCTIONS AS F1
WHERE EXISTS (SELECT X, Y FROM FUNCTIONS WHERE X= F1.Y AND Y = F1.X )AND F1.X< F1.Y)
ORDER BY 1
