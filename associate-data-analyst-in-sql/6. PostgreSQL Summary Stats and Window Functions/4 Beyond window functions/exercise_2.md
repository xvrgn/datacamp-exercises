## Pivoting with ranking

You want to produce an easy scannable table of the rankings of the three most populous EU countries by how many gold medals they've earned in the 2004 through 2012 Olympic games. The table needs to be in this format:

```
| Country | 2004 | 2008 | 2012 |
|---------|------|------|------|
| FRA     | ...  | ...  | ...  |
| GBR     | ...  | ...  | ...  |
| GER     | ...  | ...  | ...  |
```

You'll need to count the gold medals each country has earned, produce the ranks of each country by medals earned, then pivot the table to this shape.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Count the gold medals that France (`FRA`), the UK (`GBR`), and Germany (`GER`) have earned per country and year.
```sql
SELECT country, year, COUNT(*) AS awards
FROM Summer_Medals
WHERE country IN ('FRA', 'GBR', 'GER')
	AND year IN (2004, 2008, 2012)
	AND medal = 'Gold'
GROUP BY country, year
ORDER BY country ASC, year ASC;
```

**Task 2:** Select the country and year columns, then rank the three countries by how many gold medals they earned per year.
```sql
WITH Country_Awards AS (
	SELECT Country, Year, COUNT(*) AS Awards
	FROM Summer_Medals
	WHERE Country IN ('FRA', 'GBR', 'GER')
		AND Year IN (2004, 2008, 2012)
		AND Medal = 'Gold'
	GROUP BY Country, Year)
-- Select Country and Year
-- Rank by gold medals earned per year
SELECT Country, Year, RANK() OVER(ORDER BY Awards) :: INTEGER AS rank
FROM Country_Awards
ORDER BY Country ASC, Year ASC;
```

**Task 3:** Pivot the query's results by `Year` by filling in the new table's correct column names.
```sql
-- Fill in the correct column names for the pivoted table  
SELECT * FROM CROSSTAB($$  
    WITH Country_Awards AS (        
	    SELECT Country, Year, COUNT(*) AS Awards
		FROM Summer_Medals
		WHERE Country IN ('FRA', 'GBR', 'GER')
			AND Year IN (2004, 2008, 2012)
			AND Medal = 'Gold'
		GROUP BY Country, Year)
	SELECT Country, Year, RANK() OVER (PARTITION BY Year ORDER BY Awards DESC) :: INTEGER AS rank
	FROM Country_Awards    
	ORDER BY Country ASC, Year ASC;    
    $$) AS ct (Country VARCHAR, "2004" INTEGER, "2008" INTEGER, "2012" INTEGER)  
Order by Country ASC;
```
