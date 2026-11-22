## Ranking athletes from multiple countries

In the previous exercise, you used `RANK` to assign rankings to one group of athletes. In real-world data, however, you'll often find numerous groups within your data. Without partitioning your data, one group's values will influence the rankings of the others.

Also, while `RANK` skips numbers in case of identical values, the most natural way to assign rankings is not to skip numbers. If two countries are tied for second place, the country after them is considered to be third by most people.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Rank each country's athletes by the count of medals they've earned -- the higher the count, the higher the rank -- without skipping numbers in case of identical values.
```sql
-- Rank athletes in each country by the medals they've won  
WITH Athlete_Medals AS (  
    SELECT Country, Athlete, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country IN ('JPN', 'KOR') AND Year >= 2000  
    GROUP BY Country, Athlete  
    HAVING COUNT(*) > 1)  
SELECT Country, athlete,  
    DENSE_RANK() OVER (PARTITION BY country ORDER BY Medals DESC) AS Rank_N  
FROM Athlete_Medals  
ORDER BY Country ASC, RANK_N ASC;
```