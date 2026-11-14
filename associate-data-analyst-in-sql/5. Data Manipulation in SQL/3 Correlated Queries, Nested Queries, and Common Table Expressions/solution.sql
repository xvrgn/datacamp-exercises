-- Filter the main query by the subquery
-- Join the main query to the subquery with country_id in WHERE
SELECT main.country_id, main.date, main.home_goal, main.away_goal
FROM match AS main
WHERE (home_goal + away_goal) > 
	(SELECT AVG((sub.home_goal + sub.away_goal) * 3)
	FROM match AS sub
	WHERE main.country_id = sub.country_id);

-- Filter for matches with the maximum number of total goals scored
-- Join the main query to the subquery in WHERE
SELECT main.country_id, main.date, main.home_goal, main.away_goal
FROM match AS main
WHERE (home_goal + away_goal) = (
	SELECT MAX(sub.home_goal + sub.away_goal)
	FROM match AS sub
	WHERE main.country_id = sub.country_id
		AND main.season = sub.season);

-- Subquery to get the max goals in an 'England Premier League' match for the same season
SELECT 
    season,
    MAX(home_goal + away_goal) AS max_goals,
    (SELECT MAX(home_goal + away_goal) 
	FROM match 
	WHERE season = main.season
		AND country_id IN (
			SELECT country_id
			FROM league
			WHERE name = 'England Premier League'
	     )
	) AS pl_max_goals
FROM match AS main
GROUP BY season;

-- Calculate the average matches per season
-- Left join outer_s to country
-- Close parentheses and alias the subquery
SELECT c.name AS country, AVG(outer_s.matches) AS avg_seasonal_high_scores
    FROM country AS c
    LEFT JOIN (
        SELECT country_id, season, COUNT(id) AS matches
        FROM (
            SELECT country_id, season, id
            FROM match
            WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
        GROUP BY country_id, season) AS outer_s
    ON c.id = outer_s.country_id
    GROUP BY country;

-- Set up your CTE
-- Select league name and count of matches from the CTE
-- Join the CTE to the league table using country_id
WITH match_list AS (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10)

SELECT l.name AS league, COUNT(match_list.id) AS matches
FROM league AS l
LEFT JOIN match_list
ON l.id = match_list.country_id
GROUP BY l.name;

-- Set up your CTE
-- Select the league name, date, home, and away goals
-- Select the league, date, home, and away goals from the CTE
-- Filter by total goals
WITH match_list AS (
    SELECT
        l.name AS league, m.date, m.home_goal, m.away_goal,
        (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN league as l
    ON m.country_id = l.id
)

SELECT league, date, home_goal, away_goal
FROM match_list
WHERE total_goals >= 10;

-- Set up your CTE
-- Create a list of match IDs to filter data in the CTE
-- Select the league name and average of goals in the CTE
-- Join the CTE onto the league table using country_id
WITH match_list AS (
    SELECT country_id, (home_goal + away_goal) AS goals
    FROM match
    WHERE id IN (
        SELECT id
        FROM match
        WHERE season = '2013/2014' AND EXTRACT(MONTH FROM date) = 08
    )
)

SELECT l.name, AVG(match_list.goals)
FROM league AS l
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;


-- Get the home team name and away team name from the subqueries
-- Join the home subquery to the match table
-- Join the away subquery to the match table
-- Get the away team ID in the subquery
SELECT
    m.date,
    home.hometeam_name,
    away.awayteam_name,
    m.home_goal,
    m.away_goal
FROM match AS m
INNER JOIN (
    SELECT match.id, team.team_long_name AS hometeam_name
    FROM match
    LEFT JOIN team
    ON match.hometeam_id = team.team_api_id) AS home
ON home.id = m.id

INNER JOIN (
    SELECT match.id, team.team_long_name AS awayteam_name
    FROM match
    LEFT JOIN team
    ON match.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;


-- Declare and set up the away CTE
-- Select date, home_goal, and away_goal
-- Join away and home on the id column
WITH home AS (
    SELECT m.id, m.date, t.team_long_name AS hometeam, m.home_goal
    FROM match AS m
    LEFT JOIN team AS t
    ON m.hometeam_id = t.team_api_id
),
away AS (
    SELECT m.id, m.date, t.team_long_name AS awayteam, m.away_goal
    FROM match AS m
    LEFT JOIN team AS t
    ON m.awayteam_id = t.team_api_id
)
SELECT home.date, home.hometeam, away.awayteam, home.home_goal, away.away_goal
FROM home
INNER JOIN away
ON home.id = away.id;