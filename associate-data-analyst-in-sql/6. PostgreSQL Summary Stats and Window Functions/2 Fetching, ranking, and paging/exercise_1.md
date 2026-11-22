## Future gold medalists

Fetching functions allow you to get values from different parts of the table into one row. If you have time-ordered data, you can "peek into the future" with the `LEAD` fetching function. This is especially useful if you want to compare a current value to a future value.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** For each year, fetch the current gold medalist and the gold medalist 3 competitions ahead of the current row.
```sql
-- For each year, fetch the current and future medalists  
WITH Discus_Medalists AS (  
    SELECT DISTINCT Year, Athlete  
    FROM Summer_Medals  
    WHERE Medal = 'Gold'  
      AND Event = 'Discus Throw'  
      AND Gender = 'Women'  
      AND Year >= 2000)  
SELECT year, athlete,  
    LEAD(athlete,3) OVER (ORDER BY year ASC) AS Future_Champion  
FROM Discus_Medalists  
ORDER BY Year ASC;
```