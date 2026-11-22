-- Assign numbers to each row
SELECT *, ROW_NUMBER() OVER() AS Row_N
FROM summer_olympics
ORDER BY Row_N ASC;

-- Assign numbers to each year
SELECT Year, ROW_NUMBER() OVER() AS Row_N
FROM (
    SELECT DISTINCT Year
    FROM summer_olympics
    ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;

-- Assign the lowest numbers to the most recent years
SELECT Year, ROW_NUMBER() OVER (ORDER BY Year DESC) AS Row_N
FROM (
    SELECT DISTINCT Year
    FROM summer_olympics
) AS Years
ORDER BY Year;


-- Count the number of medals each athlete has earned
SELECT athlete, COUNT(medal) AS Medals
FROM summer_olympics
GROUP BY Athlete
ORDER BY Medals DESC;

-- Count the number of medals each athlete has earned
-- Number each athlete by how many medals they've earned
WITH Athlete_Medals AS (
    SELECT Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    GROUP BY Athlete)
SELECT Athlete, ROW_NUMBER() OVER (ORDER BY Medals DESC) AS Row_N
FROM Athlete_Medals
ORDER BY Medals DESC;

-- Return each year's champions' countries
SELECT year, country AS champion
FROM summer_olympics
WHERE
    Discipline = 'Weightlifting' AND
    Event = '69KG' AND
    Gender = 'Men' AND
    Medal = 'Gold';

-- Return each year's champions' countries
-- Fetch the previous year's champion
WITH Weightlifting_Gold AS (
    SELECT Year, Country AS champion
    FROM summer_olympics
    WHERE
        Discipline = 'Weightlifting' AND
        Event = '69KG' AND
        Gender = 'Men' AND
        Medal = 'Gold')
SELECT
    Year, Champion, LAG(Champion, 1) OVER(ORDER BY Year ASC) AS Last_Champion
FROM Weightlifting_Gold
ORDER BY Year ASC;

-- Fetch the previous year's champion by gender
WITH Tennis_Gold AS (
    SELECT DISTINCT Gender, Year, Country
    FROM summer_olympics
    WHERE
        Year >= 2000 AND
        Event = 'Javelin Throw' AND
        Medal = 'Gold')
SELECT
    Gender, Year, Country AS Champion,
    LAG(Country, 1) OVER (PARTITION BY Gender ORDER BY Year ASC) AS Last_Champion
FROM Tennis_Gold
ORDER BY Gender ASC, Year ASC;

-- Fetch the previous year's champion by gender and event
WITH Athletics_Gold AS (
    SELECT DISTINCT Gender, Year, Event, Country
    FROM summer_olympics
    WHERE
        Year >= 2000 AND
        Discipline = 'Athletics' AND
        Event IN ('100M', '10000M') AND
        Medal = 'Gold')
SELECT
    Gender, Year, Event, Country AS Champion,
    LAG(Country, 1) OVER (PARTITION BY Gender, Event
        ORDER BY Year ASC) AS Last_Champion
FROM Athletics_Gold
ORDER BY Event ASC, Gender ASC, Year ASC;