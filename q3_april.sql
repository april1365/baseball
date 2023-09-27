---FN, LN, total salary for all players from Vanderbilt (salary DESC)
---Highest earnings- David Price
SELECT namefirst AS first_name, namelast AS last_name, SUM(salary)::numeric::money AS earnings
FROM people INNER JOIN salaries USING(playerid)
INNER JOIN collegeplaying USING(playerid)
INNER JOIN schools USING(schoolid)
WHERE schoolname LIKE 'Vanderbilt%'
GROUP BY namefirst, namelast
ORDER BY SUM(salary) DESC;

SELECT namefirst AS first_name, namelast AS last_name, SUM(salary)::numeric::money AS earnings
FROM people INNER JOIN salaries USING(playerid)
INNER JOIN collegeplaying USING(playerid)
INNER JOIN schools USING(schoolid)
WHERE schoolname LIKE 'Vanderbilt%'
GROUP BY namefirst, namelast
ORDER BY SUM(salary) DESC
LIMIT 1;