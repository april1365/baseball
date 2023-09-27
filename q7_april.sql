---1970-2016 
---Largest # wins for team that did not win WS- 116
SELECT w as highest_wins_no_WS
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
AND wswin = 'N'
ORDER BY w DESC
LIMIT 1;

---Smallest # wins for team that did win WS- 63
---Why?- 1981 MLB strike resulting in cancellation of 713 regular-season games
SELECT w AS lowest_wins_and_WS
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
AND wswin = 'Y'
ORDER BY w ASC
LIMIT 1;

---Redo query excluding problem year- 83
SELECT w AS lowest_wins_and_WS_corrected
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
AND wswin = 'Y'
ORDER BY w ASC
LIMIT 1 OFFSET 1;

---How often did team with most wins also win WS? 12/46
WITH team_rank AS
(SELECT teamid, yearid, w, wswin, RANK() OVER (PARTITION BY yearid ORDER BY w DESC) AS rank
FROM teams
WHERE yearid BETWEEN 1970 AND 2016)
SELECT COUNT(teamid) AS most_wins_and_WS_count
FROM team_rank 
WHERE rank = 1
AND wswin = 'Y';

---Percentage? 26%
WITH team_rank AS
(SELECT teamid, yearid, w, wswin, RANK() OVER (PARTITION BY yearid ORDER BY w DESC) AS rank
FROM teams
WHERE yearid BETWEEN 1970 AND 2016)
SELECT ROUND(((SELECT COUNT(*) 
FROM team_rank 
WHERE wswin = 'Y' 
AND rank = 1) * 100.0 /
(SELECT COUNT(*) 
FROM team_rank 
WHERE wswin = 'Y')), 0) 
AS count_as_percent;		
