## Reigning champions by gender and event

In the previous exercise, you partitioned by gender to ensure that data about one gender doesn't get mixed into data about the other gender. If you have multiple columns, however, partitioning by only one of them will still mix the results of the other columns.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the previous champions of each year's events by gender and event.
```sql
-- Fetch the previous year's champion by gender and event  
WITH Athletics_Gold AS (  
    SELECT DISTINCT Gender, Year, Event, Country  
    FROM Summer_Medals
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
```
