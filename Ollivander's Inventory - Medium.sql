Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.

Input Format

The following tables contain data on the wands in Ollivander's inventory:

Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, 
and power denotes the quality of the wand (the higher the power, the better the wand is).

COLUMN			TYPE
ID			INTEGER
CODE			INTEGER
COINS_NEEDED		INTEGER
POWER			INTEGER


Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. 
If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs, (code1, age1) and (code2, age2), 
then (code1 != code2) and (age1 != age2).

COLUMN			TYPE
CODE			INTEGER
AGE			INTEGER
IS_EVIL			INTEGER


SQL Query:

SELECT ID, AGE, M.COINS_NEEDED, M.POWER FROM 
(SELECT CODE, POWER, MIN(COINS_NEEDED) AS COINS_NEEDED FROM WANDS GROUP BY CODE, POWER) AS M
JOIN WANDS AS W ON M.CODE = W.CODE AND M.POWER = W.POWER AND M.COINS_NEEDED = W.COINS_NEEDED
JOIN WANDS_PROPERTY AS WP ON M.CODE = WP.CODE
WHERE WP.IS_EVIL = 0
ORDER BY M.POWER DESC, AGE DESC;