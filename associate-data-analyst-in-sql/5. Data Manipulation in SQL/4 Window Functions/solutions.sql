-- Select the match id, country name, season, home, and away goals
-- Use a window to include the aggregate average in each row
SELECT
    m.id,
    c.name AS country,
    m.season,
    m.home_goal,
    m.away_goal,
    AVG(m.home_goal + m.away_goal) OVER() AS overall_avg
FROM match AS m
LEFT JOIN country AS c
ON m.country_id = c.id;


-- Select the league name and average goals scored
-- Rank each league over the average goals
-- Order the query by the rank you created
SELECT
    l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal)) AS league_rank
FROM league AS l
LEFT JOIN match AS m
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
ORDER BY RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal));


-- Select the league name and average goals scored
-- Rank leagues in descending order by average goals
-- Order the query by the rank you created
SELECT
    l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal) DESC) AS league_rank
FROM league AS l
LEFT JOIN match AS m
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
ORDER BY AVG(m.home_goal + m.away_goal);


-- Calculate average goals partitioned by season and month
SELECT date, season, home_goal, away_goal,
    CASE WHEN hometeam_id = 8673 THEN 'home'
         ELSE 'away' END AS warsaw_location,
    AVG(home_goal) OVER(PARTITION BY season,
        EXTRACT(MONTH FROM date)) AS season_mo_home,
    AVG(away_goal) OVER(PARTITION BY season,
        EXTRACT(MONTH FROM date)) AS season_mo_away
FROM match
WHERE hometeam_id = 8673 OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;


-- Create a running total and running average of home goals
SELECT date, home_goal, away_goal,
    SUM(home_goal) OVER(ORDER BY date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,
    AVG(home_goal) OVER(ORDER BY date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg
FROM match
WHERE hometeam_id = 9908 AND season = '2011/2012';


-- Select the date and away
-- Create a running total sum and running average of away goals
SELECT date, away_goal,
    SUM(away_goal) OVER(ORDER BY date DESC
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_total,
    AVG(away_goal) OVER(ORDER BY date DESC
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_avg
FROM match
WHERE awayteam_id = 9908 AND season = '2011/2012';


-- Identify matches as home/away wins or ties
-- Left join team on the hometeam_ID and team_API_id
-- Filter for 2014/2015 and Manchester United as the home team
SELECT m.id, t.team_long_name,
    CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
         WHEN m.home_goal < m.away_goal THEN 'MU Loss'
         ELSE 'Tie' END AS outcome
FROM match AS m
LEFT JOIN team AS t
ON m.hometeam_id = t.team_api_id
WHERE season = '2014/2015' AND t.team_long_name = 'Manchester United';


-- Identify matches as home/away wins or ties
-- Join the match table's awayteam_id to the team table
-- Filter for 2014/2015 and Manchester United as the away team
SELECT m.id, t.team_long_name,
    CASE
        WHEN m.home_goal > m.away_goal THEN 'MU Loss'
        WHEN m.home_goal < m.away_goal THEN 'MU Win'
        ELSE 'Tie' END AS outcome
FROM match AS m
LEFT JOIN team AS t
ON m.awayteam_id = t.team_api_id
WHERE season = '2014/2015' AND t.team_long_name = 'Manchester United';


-- Set up the home team CTE
-- Set up the away team CTE
-- Select the date, team names and goals
-- Join the CTEs onto the match table
WITH home AS (
    SELECT m.id, t.team_long_name,
    CASE
        WHEN m.home_goal > m.away_goal THEN 'MU Win'
        WHEN m.home_goal < m.away_goal THEN 'MU Loss'
        ELSE 'Tie' END AS outcome
    FROM match AS m
    LEFT JOIN team AS t
    ON m.hometeam_id = t.team_api_id),
away AS (
    SELECT m.id, t.team_long_name,
    CASE
        WHEN m.home_goal > m.away_goal THEN 'MU Loss'
        WHEN m.home_goal < m.away_goal THEN 'MU Win'
        ELSE 'Tie' END AS outcome
    FROM match AS m
    LEFT JOIN team AS t
    ON m.awayteam_id = t.team_api_id)

SELECT DISTINCT
    m.date,
    home.team_long_name AS home_team_name,
    away.team_long_name AS away_team_name,
    m.home_goal,
    m.away_goal
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
WHERE m.season = '2014/2015'
    AND (home.team_long_name = 'Manchester United'
    OR away.team_long_name = 'Manchester United');


-- Set up the home team CTE
-- Set up the away team CTE
-- Select columns and and rank the matches by goal difference
-- Join the CTEs onto the match table
WITH home AS (
    SELECT m.id, t.team_long_name,
    CASE
        WHEN m.home_goal > m.away_goal THEN 'MU Win'
        WHEN m.home_goal < m.away_goal THEN 'MU Loss'
        ELSE 'Tie' END AS outcome
    FROM match AS m
    LEFT JOIN team AS t
    ON m.hometeam_id = t.team_api_id),
away AS (
    SELECT m.id, t.team_long_name,
    CASE
        WHEN m.home_goal > m.away_goal THEN 'MU Loss'
        WHEN m.home_goal < m.away_goal THEN 'MU Win'
        ELSE 'Tie' END AS outcome
    FROM match AS m
    LEFT JOIN team AS t
    ON m.awayteam_id = t.team_api_id)

SELECT DISTINCT
    date,
    home.team_long_name AS home_team,
    away.team_long_name AS away_team,
    m.home_goal, m.away_goal,
    RANK() OVER(ORDER BY ABS(home_goal - away_goal) DESC) as match_rank
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
WHERE m.season = '2014/2015'
    AND ((home.team_long_name = 'Manchester United' AND home.outcome = 'MU Loss')
    OR (away.team_long_name = 'Manchester United' AND away.outcome = 'MU Loss'));