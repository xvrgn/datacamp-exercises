## Moving maximum of Scandinavian athletes' medals

Frames allow you to restrict the rows passed as input to your window function to a sliding window for you to define the start and finish.

Adding a frame to your window function allows you to calculate "moving" metrics, inputs of which slide from row to row.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the year, medals earned, and the maximum medals earned, comparing only the current year and the next year.
```sql
-- Select each year's medals  
WITH Scandinavian_Medals AS (  
    SELECT Year, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country IN ('DEN', 'NOR', 'FIN', 'SWE', 'ISL') AND Medal = 'Gold'  
    GROUP BY Year)
-- Get the max of the current and next years'  medals  
SELECT year, Medals,  
    MAX(Medals) OVER (ORDER BY year ASC  
        ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS Max_Medals  
FROM Scandinavian_Medals  
ORDER BY Year ASC;
```