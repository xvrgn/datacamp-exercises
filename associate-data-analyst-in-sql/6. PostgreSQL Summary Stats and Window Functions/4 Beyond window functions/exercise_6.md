## Summarizing results

After ranking each country in the 2000 Olympics by gold medals awarded, you want to return the top 3 countries in one row, as a comma-separated string. In other words, turn this:

```
| Country | Rank |
|---------|------|
| USA     | 1    |
| RUS     | 2    |
| AUS     | 3    |
| ...     | ...  |
```

into this:

```
USA, RUS, AUS
```

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Rank countries by the medals they've been awarded.
```sql
-- Rank countries by the medals awarded
WITH Country_Medals AS (
	SELECT Country, COUNT(*) AS Medals
	FROM Summer_Medals
	WHERE Year = 2000 AND Medal = 'Gold'
	GROUP BY Country)

SELECT Country, RANK() OVER(ORDER BY Medals DESC) AS Rank
FROM Country_Medals
ORDER BY Rank ASC;
```
##### ✅ Instruction 2/2
**Task:** Return the top 3 countries by medals awarded as one comma-separated string.
```sql
WITH Country_Medals AS (
	SELECT Country, COUNT(*) AS Medals
	FROM Summer_Medals
	WHERE Year = 2000 AND Medal = 'Gold'
	GROUP BY Country),
Country_Ranks AS (
	SELECT Country, RANK() OVER (ORDER BY Medals DESC) AS Rank
	FROM Country_Medals
	ORDER BY Rank ASC)
-- Compress the countries column and Select only the top three ranks
SELECT STRING_AGG(Country, ', ')
FROM Country_Ranks
WHERE rank <= 3;
	```