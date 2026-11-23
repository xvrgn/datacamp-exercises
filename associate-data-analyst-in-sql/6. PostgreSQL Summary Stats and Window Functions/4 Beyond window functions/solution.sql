-- Create the correct extension to enable CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Fill in the correct column names for the pivoted table
SELECT * FROM CROSSTAB($$
    SELECT Gender, Year, Country
    FROM summer_olympics
    WHERE Year IN (2008, 2012)
        AND Medal = 'Gold'
        AND Event = 'Pole Vault'
    ORDER By Gender ASC, Year ASC;
$$) AS ct (Gender VARCHAR, "2008" VARCHAR, "2012" VARCHAR)
ORDER BY Gender ASC;

-- Count the gold medals per country and year
SELECT country, year, count(*) AS Awards
FROM summer_olympics
WHERE Country IN ('FRA', 'GBR', 'GER')
    AND Year IN (2004, 2008, 2012)
    AND Medal = 'Gold'
GROUP BY country, year
ORDER BY Country ASC, Year ASC;

-- Select Country and Year
-- Rank by gold medals earned per year
WITH Country_Awards AS (
    SELECT Country, Year, COUNT(*) AS Awards
    FROM summer_olympics
    WHERE
        Country IN ('FRA', 'GBR', 'GER')
        AND Year IN (2004, 2008, 2012)
        AND Medal = 'Gold'
    GROUP BY Country, Year)
SELECT Country, Year, RANK() OVER(ORDER BY Awards) :: INTEGER AS rank
FROM Country_Awards
ORDER BY Country ASC, Year ASC;


-- Fill in the correct column names for the pivoted table
SELECT * FROM CROSSTAB($$
    WITH Country_Awards AS (
        SELECT Country, Year, COUNT(*) AS Awards
        FROM summer_olympics
        WHERE Country IN ('FRA', 'GBR', 'GER')
            AND Year IN (2004, 2008, 2012)
            AND Medal = 'Gold'
        GROUP BY Country, Year)
    SELECT Country, Year, RANK() OVER (PARTITION BY Year ORDER BY Awards DESC) :: INTEGER AS rank
    FROM Country_Awards
    ORDER BY Country ASC, Year ASC;
    $$) AS ct (Country VARCHAR, "2004" INTEGER, "2008" INTEGER, "2012" INTEGER)
Order by Country ASC;


-- Count the gold medals per country and gender
-- Generate Country-level subtotals
SELECT country, gender, COUNT(*) AS Gold_Awards
FROM summer_olympics
WHERE Year = 2004
    AND Medal = 'Gold'
    AND Country IN ('DEN', 'NOR', 'SWE')
GROUP BY country, ROLLUP(gender)
ORDER BY Country ASC, Gender ASC;


-- Count the medals per gender and medal type
-- Get all possible group-level subtotals
SELECT gender, medal, COUNT(*) AS Awards
FROM summer_olympics
WHERE Year = 2012 AND Country = 'RUS'
GROUP BY CUBE(gender, medal)
ORDER BY Gender ASC, Medal ASC;

-- Rank countries by the medals awarded
WITH Country_Medals AS (
    SELECT Country, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Year = 2000 AND Medal = 'Gold'
    GROUP BY Country)
SELECT Country, RANK() OVER(ORDER BY Medals DESC) AS Rank
FROM Country_Medals
ORDER BY Rank ASC;

-- Compress the countries column
-- Select only the top three ranks
WITH Country_Medals AS (
    SELECT Country, COUNT(*) AS Medals
    FROM summer_olympics
    WHERE Year = 2000 AND Medal = 'Gold'
    GROUP BY Country),
Country_Ranks AS (
    SELECT Country, RANK() OVER (ORDER BY Medals DESC) AS Rank
    FROM Country_Medals
    ORDER BY Rank ASC)
SELECT STRING_AGG(Country, ', ')
FROM Country_Ranks
WHERE rank <= 3;