Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Input Format

The following tables contain challenge data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

COLUMN			TYPE
HACKER_ID		INTEGER
NAME			STRING

Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge.

COLUMN			TYPE
CHALLENEGE_ID		INTEGER
HACKER_ID		INTEGER


SQL Query:

SELECT H.HACKER_ID, H.NAME, COUNT(CHALLENGE_ID) AS CNT
FROM HACKERS AS H
INNER JOIN CHALLENGES AS C
ON H.HACKER_ID = C.HACKER_ID
GROUP BY H.HACKER_ID, H.NAME

HAVING CNT = (SELECT COUNT(C1.CHALLENGE_ID) AS CNT1 FROM CHALLENGES  AS C1 GROUP BY C1.HACKER_ID 
              ORDER BY CNT1 DESC LIMIT 1)
OR 
CNT NOT IN (
    SELECT COUNT(C2.CHALLENGE_ID) AS CNT2 FROM CHALLENGES AS C2 GROUP BY C2.HACKER_ID
    HAVING C2.HACKER_ID <>  H.HACKER_ID)
    
ORDER BY CNT DESC, H.HACKER_ID