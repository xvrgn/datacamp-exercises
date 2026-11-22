## Running totals of athlete medals

The running total (or cumulative sum) of a column helps you determine what each row's contribution is to the total sum.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the athletes, the number of medals they earned, and the medals running total, ordered by the athletes' names in alphabetical order.
```SQL
-- Calculate the running total of athlete medals  
WITH Athlete_Medals AS (  
    SELECT Athlete, COUNT(*) AS Medals  
    FROM Summer_Medals  
    WHERE Country = 'USA' AND Medal = 'Gold' AND Year >= 2000  
    GROUP BY Athlete)  
SELECT athlete, medals, SUM(medals) OVER (ORDER BY athlete ASC) AS Max_Medals  
FROM Athlete_Medals  
ORDER BY Athlete ASC;
```