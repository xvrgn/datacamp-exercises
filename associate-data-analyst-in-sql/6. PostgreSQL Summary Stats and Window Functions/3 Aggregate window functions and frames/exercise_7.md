## Moving total of countries' medals

What if your data is split into multiple groups spread over one or more columns in the table? Even with a defined frame, if you can't somehow separate the groups' data, one group's values will affect the average of another group's values.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Calculate the 3-year moving sum of medals earned per country.
```sql
-- Calculate each country's 3-game moving total  
WITH Country_Medals AS (  
    SELECT Year, Country, COUNT(*) AS Medals  
    FROM Summer_Medals  
    GROUP BY Year, Country)  
SELECT Year, Country, Medals,  
    SUM(Medals) OVER (PARTITION BY country ORDER BY Year ASC  
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Medals_MA  
FROM Country_Medals  
ORDER BY Country ASC, Year ASC;
```