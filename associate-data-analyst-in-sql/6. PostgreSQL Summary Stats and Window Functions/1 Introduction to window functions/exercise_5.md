## Reigning weightlifting champions

A reigning champion is a champion who's won both the previous and current years' competitions. To determine if a champion is reigning, the previous and current years' results need to be in the same row, in two different columns.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Return each year's gold medalists in the Men's 69KG weightlifting competition.
```sql
-- Return each year's champions' countries
SELECT year, country AS champion
FROM Summer_Medals
WHERE
	Discipline = 'Weightlifting' AND
	Event = '69KG' AND
	Gender = 'Men' AND
	Medal = 'Gold';
```

##### ✅ Instruction 2/2
**Task** Having wrapped the previous query in the `Weightlifting_Gold` CTE, get the previous year's champion for each year.
```sql
-- Return each year's champions' countries  
WITH Weightlifting_Gold AS (  
    SELECT Year, Country AS champion  
    FROM Summer_Medals
    WHERE  
        Discipline = 'Weightlifting' AND  
        Event = '69KG' AND  
        Gender = 'Men' AND  
        Medal = 'Gold')
-- Fetch the previous year's champion  
SELECT  
    Year, Champion, LAG(Champion, 1) OVER(ORDER BY Year ASC) AS Last_Champion  
FROM Weightlifting_Gold  
ORDER BY Year ASC;
```
