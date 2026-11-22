## Numbering Olympic athletes by medals earned

Row numbering can also be used for ranking. For example, numbering rows and ordering by the count of medals each athlete earned in the OVER clause will assign 1 to the highest-earning medalist, 2 to the second highest-earning medalist, and so on.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** For each athlete, count the number of medals he or she has earned.
```sql
-- Count the number of medals each athlete has earned
SELECT athlete, COUNT(medal) AS Medals
FROM Summer_Medals
GROUP BY Athlete
ORDER BY Medals DESC;
```
##### ✅ Instruction 2/2
**Task:** For each athlete, count the number of medals he or she has earned.
```sql
-- Count the number of medals each athlete has earned
WITH Athlete_Medals AS (
	SELECT Athlete, COUNT(*) AS Medals
	FROM Summer_Medals
	GROUP BY Athlete)
-- Number each athlete by how many medals they've earned
SELECT Athlete, ROW_NUMBER() OVER (ORDER BY Medals DESC) AS Row_N
FROM Athlete_Medals
ORDER BY Medals DESC;
```
