## Numbering Olympic games in descending order

You've already numbered the rows in the Summer Medals dataset. What if you need to reverse the row numbers so that the most recent Olympic games' rows have a lower number?

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Assign a number to each year in which Summer Olympic games were held so that rows with the most recent years have lower row numbers.
```sql
-- Assign the lowest numbers to the most recent years
SELECT Year, ROW_NUMBER() OVER (ORDER BY Year DESC) AS Row_N
FROM (
	SELECT DISTINCT Year
	FROM Summer_Medals
) AS Years
ORDER BY Year;
```