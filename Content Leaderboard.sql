You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

COLUMN			TYPE
HACKER_ID		INTEGER
NAME			STRING

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, 
challenge_id is the id of the challenge for which the submission belongs to, and score is the score of the submission.


COLUMN			TYPE
SUBMISSION_ID		INTEGER
HACKER_ID		INTEGER
CHALLENGE_ID		INTEGER
SCORE			INTEGER


SQL Query:

SELECT S.HACKER_ID, H.NAME, SUM(S.SCORE) AS SUM_SCORE
FROM
(
SELECT HACKER_ID, CHALLENGE_ID, MAX(SCORE) AS SCORE
FROM SUBMISSIONS
GROUP BY HACKER_ID, CHALLENGE_ID
) AS S
INNER JOIN HACKERS AS H
ON S.HACKER_ID = H.HACKER_ID
GROUP BY S.HACKER_ID, H.NAME
HAVING SUM_SCORE != 0
ORDER BY SUM_SCORE DESC, 1 ASC