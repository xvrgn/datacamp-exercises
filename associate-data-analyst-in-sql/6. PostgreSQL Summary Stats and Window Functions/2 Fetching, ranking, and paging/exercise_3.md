## Last country by name

Just like you can get the first row's value in a dataset, you can get the last row's value. This is often useful when you want to compare the most recent value to previous values.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the year and the city in which each Olympic games were held. Fetch the last city in which the Olympic games were held.
```sql
-- Get the last city in which the Olympic games were held  
WITH Hosts AS (  
    SELECT DISTINCT Year, City  
    FROM Summer_Medals)  
SELECT Year, City,  
    LAST_VALUE(city)OVER (ORDER BY Year ASC  
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Last_City  
FROM Hosts  
ORDER BY Year ASC;
```