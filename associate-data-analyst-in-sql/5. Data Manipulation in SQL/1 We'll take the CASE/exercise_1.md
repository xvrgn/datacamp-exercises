## Basic CASE statements
The _European Soccer Database_ contains data about 12,800 matches from 11 countries played between 2011-2015! Throughout this course, you will be shown filtered versions of the tables in this database in order to better explore their contents.

In this exercise, you will identify matches played between _FC Schalke 04_ and _FC Bayern Munich_. There are 2 teams identified in each match in the `hometeam_id` and `awayteam_id` columns, available to you in the filtered `matches_germany` table. ID can join to the `team_api_id` column in the `teams_germany` table, but you cannot perform a join on both at the same time.

However, you can perform this operation using a `CASE` statement once you've identified the `team_api_id` associated with each team!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Create a `CASE` statement that identifies whether a match in Germany included `FC Bayern Munich`, `FC Schalke 04`, or `Other` as the home team.
```SQL
-- Identify the home team as Bayern Munich, Schalke 04, or Other
SELECT 
        CASE 
	        WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
	        WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
	        ELSE 'Other' 
        END AS home_team,
        COUNT(id) AS total_matches
FROM matches_germany
GROUP BY home_team;
```