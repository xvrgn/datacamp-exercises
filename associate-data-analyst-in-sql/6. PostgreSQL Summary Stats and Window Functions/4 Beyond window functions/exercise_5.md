## Cleaning up results

Returning to the breakdown of Scandinavian awards you previously made, you want to clean up the results by replacing the `null`s with meaningful text.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Turn the `null`s in the `Country` column to `All countries`, and the `null`s in the `Gender` column to `All genders`.
```sql
-- Replace the nulls in the columns with meaningful text
SELECT
	COALESCE(Country, 'All countries') AS Country,
	COALESCE(Gender, 'All genders') AS Gender,
	COUNT(*) AS Awards
FROM Summer_Medals
WHERE Year = 2004
	AND Medal = 'Gold'
	AND Country IN ('DEN', 'NOR', 'SWE')
GROUP BY ROLLUP(Country, Gender)
ORDER BY Country ASC, Gender ASC;
```
