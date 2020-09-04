Samantha interviews many candidates from different colleges using coding challenges and contests. 

Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, 
and total_unique_views for each contest sorted by contest_id. 

Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

Input Format

The following tables hold interview data:

=> Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker. 

COLUMN			TYPE
CONTEST_ID		INTEGER
HACKER_ID		INTEGER
NAME			STRING


=> Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates.

COLUMN			TYPE
COLLEGE_ID		INTEGER
CONTEST_ID		INTEGER

=> Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, 
and college_id is the id of the college where the challenge was given to candidates.

COLUMN			TYPE
CHALLENGE_ID		INTEGER
COLLEGE_ID		INTEGER

=> View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, 
and total_unique_views is the number of times the challenge was viewed by unique candidates.

COLUMN			TYPE
CHALLENGE_ID		INTEGER
TOTAL_VIEWS		INTEGER
TOTAL_UNIQUE_VIEWS	INTEGER

=> Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, 
and total_accepted_submission is the number of submissions that achieved full scores.

COLUMN				TYPE
CHALLENGE_ID			INTEGER
TOTAL_SUBMISSIONS		INTEGER
TOTAL_ACCEPTED_SUBMISSIONS	INTEGER

SQL Query:

SELECT C.CONTEST_ID, C.HACKER_ID, C.NAME, 
SUM(S.TOTAL_SUBMISSIONS), SUM(S.TOTAL_ACCEPTED_SUBMISSIONS),
SUM(V.TOTAL_VIEWS), SUM(V.TOTAL_UNIQUE_VIEWS)

FROM CONTESTS AS C

LEFT OUTER JOIN COLLEGES AS COL
ON C.CONTEST_ID = COL.CONTEST_ID

LEFT OUTER JOIN CHALLENGES AS CH
ON COL.COLLEGE_ID = CH.COLLEGE_ID

LEFT OUTER JOIN 
(SELECT CHALLENGE_ID, SUM(TOTAL_VIEWS) AS TOTAL_VIEWS, 
 SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
FROM VIEW_STATS 
GROUP BY CHALLENGE_ID) AS V

ON CH.CHALLENGE_ID = V.CHALLENGE_ID

LEFT OUTER JOIN 
(SELECT CHALLENGE_ID, SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS, 
 SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
FROM SUBMISSION_STATS
 GROUP BY CHALLENGE_ID
) AS S

ON CH.CHALLENGE_ID = S.CHALLENGE_ID

GROUP BY C.CONTEST_ID, C.HACKER_ID, C.NAME

HAVING (SUM(V.TOTAL_VIEWS)+ SUM(V.TOTAL_UNIQUE_VIEWS) +
SUM(S.TOTAL_SUBMISSIONS)+ SUM(S.TOTAL_ACCEPTED_SUBMISSIONS)) >1

ORDER BY 1




