## Moving maximum of Chinese athletes' medals

Frames allow you to "peek" forwards or backward without first using the relative fetching functions, `LAG` and `LEAD`, to fetch previous rows' values into the current row.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the athletes, medals earned, and the maximum medals earned, comparing only the last two and current athletes, ordering by athletes' names in alphabetical order.
```sql
WITH Chinese_Medals AS (  
    SELECT Athlete, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country = 'CHN' AND Medal = 'Gold' AND Year >= 2000  
    GROUP BY Athlete)  
-- Select the athletes and the medals they've earned
-- Get the max of the last two and current rows' medals 
SELECT athlete, Medals,  
	MAX(Medals) OVER (ORDER BY athlete ASC  
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Max_Medals  
FROM Chinese_Medals  
ORDER BY Athlete ASC;
```