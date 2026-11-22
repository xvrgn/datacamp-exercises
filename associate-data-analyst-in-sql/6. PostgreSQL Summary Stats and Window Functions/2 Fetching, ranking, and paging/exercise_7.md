## Top, middle, and bottom thirds

Splitting your data into thirds or quartiles is often useful to understand how the values in your dataset are spread. Getting summary statistics (averages, sums, standard deviations, _etc._) of the top, middle, and bottom thirds can help you determine what distribution your values follow.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Split the athletes into top, middle, and bottom thirds based on their count of medals.
```sql
-- Split athletes into thirds by their earned medals  
WITH Athlete_Medals AS (  
    SELECT Athlete, COUNT(*) AS Medals  
    FROM Summer_Medals  
    GROUP BY Athlete  
    HAVING COUNT(*) > 1)  
SELECT Athlete, Medals, NTILE(3) OVER(ORDER BY Medals DESC) AS Third  
FROM Athlete_Medals  
ORDER BY Medals DESC, Athlete ASC;
```
##### ✅ Instruction 2/2
**Task:** Return the average of each third.
```sql
-- Get the average medals earned in each third  
WITH Athlete_Medals AS (  
    SELECT Athlete, COUNT(*) AS Medals  
    FROM Summer_Medals  
    GROUP BY Athlete  
    HAVING COUNT(*) > 1),  
Thirds AS (  
    SELECT  
    Athlete,  
    Medals,  
    NTILE(3) OVER (ORDER BY Medals DESC) AS Third  
    FROM Athlete_Medals)  
SELECT Third, AVG(Medals) AS Avg_Medals  
FROM Thirds  
GROUP BY Third  
ORDER BY Third ASC;
```