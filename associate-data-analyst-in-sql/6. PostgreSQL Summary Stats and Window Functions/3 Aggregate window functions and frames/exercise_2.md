## Maximum country medals by year

Getting the maximum of a country's earned medals so far helps you determine whether a country has broken its medals record by comparing the current year's earned medals and the maximum so far.
#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the year, country, medals, and the maximum medals earned so far for each country, ordered by year in ascending order.
```SQL
-- Return the max medals earned so far per country  
WITH Country_Medals AS (  
    SELECT Year, Country, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country IN ('CHN', 'KOR', 'JPN') AND Medal = 'Gold' AND Year >= 2000  
    GROUP BY Year, Country)  
SELECT year, country, medals,  
    MAX(medals) OVER (PARTITION BY country ORDER BY year ASC) AS Max_Medals  
FROM Country_Medals  
ORDER BY Country ASC, Year ASC;
```