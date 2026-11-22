## Minimum country medals by year

So far, you've seen `MAX` and `SUM`, aggregate functions normally used with `GROUP BY`, being used as window functions. You can also use the other aggregate functions, like `MIN`, as window functions.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the year, medals earned, and minimum medals earned so far.
```SQL
WITH France_Medals AS (  
    SELECT Year, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country = 'FRA' AND Medal = 'Gold' AND Year >= 2000  
    GROUP BY Year)  
SELECT year, Medals, MIN(Medals) OVER (ORDER BY year ASC) AS Min_Medals  
FROM France_Medals  
ORDER BY Year ASC;
```