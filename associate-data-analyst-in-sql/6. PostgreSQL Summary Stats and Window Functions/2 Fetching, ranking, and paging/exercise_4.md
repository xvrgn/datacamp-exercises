## Ranking athletes by medals earned

In chapter 1, you used `ROW_NUMBER` to rank athletes by awarded medals. However, `ROW_NUMBER` assigns different numbers to athletes with the same count of awarded medals, so it's not a useful ranking function; if two athletes earned the same number of medals, they should have the same rank.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Rank each athlete by the number of medals they've earned -- the higher the count, the higher the rank -- with identical numbers in case of identical values.
```sql
-- Rank athletes by the medals they've won  
WITH Athlete_Medals AS (  
    SELECT Athlete, COUNT(*) AS Medals  
    FROM Summer_Medals  
    GROUP BY Athlete)  
SELECT Athlete, Medals, RANK() OVER (ORDER BY medals DESC) AS Rank_N  
FROM Athlete_Medals  
ORDER BY Medals DESC;
```