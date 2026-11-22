-- For each year, fetch the current and future medalists
WITH Discus_Medalists AS (
    SELECT DISTINCT Year, Athlete
    FROM summer_olympics
    WHERE Medal = 'Gold'
      AND Event = 'Discus Throw'
      AND Gender = 'Women'
      AND Year >= 2000)
SELECT year, athlete,
    LEAD(athlete,3) OVER (ORDER BY year ASC) AS Future_Champion
FROM Discus_Medalists
ORDER BY Year ASC;

-- Fetch all athletes and the first athlete alphabetically
WITH All_Male_Medalists AS (
    SELECT DISTINCT Athlete
    FROM summer_olympics
    WHERE Medal = 'Gold' AND Gender = 'Men')
SELECT athlete, FIRST_VALUE(athlete) OVER (ORDER BY athlete ASC) AS First_Athlete
FROM All_Male_Medalists;

-- Get the last city in which the Olympic games were held
WITH Hosts AS (
    SELECT DISTINCT Year, City
    FROM summer_olympics)
SELECT Year, City,
    LAST_VALUE(city)OVER (ORDER BY Year ASC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Last_City
FROM Hosts
ORDER BY Year ASC;

-- Rank athletes by the medals they've won
WITH Athlete_Medals AS (
    SELECT Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    GROUP BY Athlete)
SELECT Athlete, Medals, RANK() OVER (ORDER BY medals DESC) AS Rank_N
FROM Athlete_Medals
ORDER BY Medals DESC;

-- Rank athletes in each country by the medals they've won
WITH Athlete_Medals AS (
    SELECT Country, Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Country IN ('JPN', 'KOR') AND Year >= 2000
    GROUP BY Country, Athlete
    HAVING COUNT(*) > 1)
SELECT Country, athlete,
    DENSE_RANK() OVER (PARTITION BY country ORDER BY Medals DESC) AS Rank_N
FROM Athlete_Medals
ORDER BY Country ASC, RANK_N ASC;

--- Split up the distinct events into 111 unique groups
WITH Events AS (
    SELECT DISTINCT Event
    FROM summer_olympics)
SELECT DISTINCT event, NTILE(111) OVER (ORDER BY event ASC) AS Page
FROM Events
ORDER BY Event ASC;

-- Split athletes into thirds by their earned medals
WITH Athlete_Medals AS (
    SELECT Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    GROUP BY Athlete
    HAVING COUNT(*) > 1)
SELECT Athlete, Medals, NTILE(3) OVER(ORDER BY Medals DESC) AS Third
FROM Athlete_Medals
ORDER BY Medals DESC, Athlete ASC;

-- Get the average medals earned in each third
WITH Athlete_Medals AS (
    SELECT Athlete, COUNT(*) AS Medals
    FROM summer_olympics
    GROUP BY Athlete
    HAVING COUNT(*) > 1),
Thirds AS (
    SELECT
    Athlete,
    Medals,
    NTILE(3) OVER (ORDER BY Medals DESC) AS Third
    FROM Athlete_Medals)
SELECT Third, AVG(Medals) AS Avg_Medals
FROM Thirds
GROUP BY Third
ORDER BY Third ASC;