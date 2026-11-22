## Reigning champions by gender

You've already fetched the previous year's champion for one event. However, if you have multiple events, genders, or other metrics as columns, you'll need to split your table into partitions to avoid having a champion from one event or gender appear as the previous champion of another event or gender.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the previous champions of each year's event by gender.
```sql
-- Fetch the previous year's champion by gender  
WITH Tennis_Gold AS (  
    SELECT DISTINCT Gender, Year, Country  
    FROM Summer_Medals
    WHERE  
        Year >= 2000 AND  
        Event = 'Javelin Throw' AND  
        Medal = 'Gold')  
SELECT  
    Gender, Year, Country AS Champion,   
    LAG(Country, 1) OVER (PARTITION BY Gender ORDER BY Year ASC) AS Last_Champion  
FROM Tennis_Gold  
ORDER BY Gender ASC, Year ASC;
```