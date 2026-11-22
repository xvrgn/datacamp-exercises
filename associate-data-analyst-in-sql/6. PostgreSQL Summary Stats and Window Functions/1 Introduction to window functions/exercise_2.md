## Numbering Olympic games in ascending order

The Summer Olympics dataset contains the results of the games between 1896 and 2012. The first Summer Olympics were held in 1896, the second in 1900, and so on. What if you want to easily query the table to see in which year the 13th Summer Olympics were held? You'd need to number the rows for that.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Assign a number to each year in which Summer Olympic games were held.
```sql
-- Assign numbers to each year
SELECT Year, ROW_NUMBER() OVER() AS Row_N
FROM (
	SELECT DISTINCT Year
	FROM Summer_Medals
	ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;
```