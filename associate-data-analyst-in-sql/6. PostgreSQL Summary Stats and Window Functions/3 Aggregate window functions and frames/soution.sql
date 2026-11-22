-- Calculate the running total of athlete medals
WITH Athlete_Medals AS (
    SELECT Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Country = 'USA' AND Medal = 'Gold' AND Year >= 2000
    GROUP BY Athlete)
SELECT athlete, medals, SUM(medals) OVER (ORDER BY athlete ASC) AS Max_Medals
FROM Athlete_Medals
ORDER BY Athlete ASC;

-- Return the max medals earned so far per country
WITH Country_Medals AS (
    SELECT Year, Country, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Country IN ('CHN', 'KOR', 'JPN') AND Medal = 'Gold' AND Year >= 2000
    GROUP BY Year, Country)
SELECT year, country, medals,
    MAX(medals) OVER (PARTITION BY country ORDER BY year ASC) AS Max_Medals
FROM Country_Medals
ORDER BY Country ASC, Year ASC;


WITH France_Medals AS (
    SELECT Year, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Country = 'FRA' AND Medal = 'Gold' AND Year >= 2000
    GROUP BY Year)
SELECT year, Medals, MIN(Medals) OVER (ORDER BY year ASC) AS Min_Medals
FROM France_Medals
ORDER BY Year ASC;

-- Select each year's medals
-- Get the max of the current and next years'  medals
WITH Scandinavian_Medals AS (
    SELECT Year, COUNT(*) AS Medals
    FROM Summer_Medals
    WHERE Country IN ('DEN', 'NOR', 'FIN', 'SWE', 'ISL') AND Medal = 'Gold'
    GROUP BY Year)
SELECT year, Medals,
    MAX(Medals) OVER (ORDER BY year ASC
        ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS Max_Medals
FROM Scandinavian_Medals
ORDER BY Year ASC;

-- Select the athletes and the medals they've earned
-- Get the max of the last two and current rows' medals
WITH Chinese_Medals AS (
    SELECT Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Country = 'CHN' AND Medal = 'Gold' AND Year >= 2000
    GROUP BY Athlete)
SELECT athlete, Medals,
    MAX(Medals) OVER (ORDER BY athlete ASC
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Max_Medals
FROM Chinese_Medals
ORDER BY Athlete ASC;

--- Calculate the 3-year moving average of medals earned
WITH Russian_Medals AS (
    SELECT Year, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Country = 'RUS' AND Medal = 'Gold' AND Year >= 1980
    GROUP BY Year)
SELECT Year, Medals,
    AVG(medals) OVER(ORDER BY Year ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Medals_MA
FROM Russian_Medals
ORDER BY Year ASC;

-- Calculate each country's 3-game moving total
WITH Country_Medals AS (
    SELECT Year, Country, COUNT(*) AS Medals
    FROM summer_olympics
    GROUP BY Year, Country)
SELECT Year, Country, Medals,
    SUM(Medals) OVER (PARTITION BY country ORDER BY Year ASC
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Medals_MA
FROM Country_Medals
ORDER BY Country ASC, Year ASC;