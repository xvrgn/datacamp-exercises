## Moving average of Russian medals

Using frames with aggregate window functions allow you to calculate many common metrics, including moving averages and totals. These metrics track the change in performance over time.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Calculate the 3-year moving average of medals earned.
```sql
--- Calculate the 3-year moving average of medals earned  
WITH Russian_Medals AS (  
    SELECT Year, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country = 'RUS' AND Medal = 'Gold' AND Year >= 1980  
    GROUP BY Year)  
SELECT Year, Medals,  
    AVG(medals) OVER(ORDER BY Year ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Medals_MA  
FROM Russian_Medals  
ORDER BY Year ASC;
```