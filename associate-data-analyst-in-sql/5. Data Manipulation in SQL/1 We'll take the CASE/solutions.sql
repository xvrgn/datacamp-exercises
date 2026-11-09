-- Identify the home team as Bayern Munich, Schalke 04, or Other
SELECT
    CASE WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
         WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
    COUNT(id) AS total_matches
FROM match
GROUP BY home_team;

-- Identify home wins, losses, or ties
SELECT
    date,
    CASE WHEN home_goal > away_goal THEN 'Home win!'
         WHEN home_goal < away_goal THEN 'Home loss :('
         ELSE 'Tie' END AS outcome
FROM match;

-- Select matches where Barcelona was the away team
-- Filter for Barcelona
SELECT
    m.date,
    t.team_long_name AS opponent,
    CASE WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
         WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :('
         ELSE 'Tie' END AS outcome
FROM match AS m
LEFT JOIN team AS t
ON m.hometeam_id = t.team_api_id
WHERE m.awayteam_id = 8634;

-- Identify possible home match outcomes
SELECT
    date,
    CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END as home,
    CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END as away,
    CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!'
         WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!'
         ELSE 'Tie!' END AS outcome
FROM match
WHERE hometeam_id = 8634 AND awayteam_id = 8633;

-- Find games where home_goal is more than away_goal
-- Find games where away_goal is more than home_goal
-- Exclude games not won by Bologna
SELECT
    season,
    date,
    home_goal,
    away_goal
FROM match
WHERE
    CASE WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
         WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win'
        END IS NOT NULL;

-- Count matches in 2012/2013
-- Count matches in 2013/2014
SELECT
    c.name AS country,
    COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
    COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;

-- SUM the home goals
-- SUM the away goals
-- Group the results by season
SELECT season,
       SUM(CASE WHEN hometeam_id = 8560 THEN home_goal END) AS home_goals,
       SUM(CASE WHEN awayteam_id = 8560 THEN away_goal END) AS away_goals
FROM match
GROUP BY season;

-- Calculate the fraction of tied games in each season
SELECT
    c.name AS country,
    AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
             WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
        END) AS ties_2013_2014,
    AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
             WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
        END) AS ties_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;