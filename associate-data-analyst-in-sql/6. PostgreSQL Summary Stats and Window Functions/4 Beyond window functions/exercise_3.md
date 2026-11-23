## Country-level subtotals

You want to look at three Scandinavian countries' earned gold medals per country and gender in the year 2004. You're also interested in `Country`-level subtotals to get the total medals earned for each country, but `Gender`-level subtotals don't make much sense in this case, so disregard them.
#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Count the gold medals awarded per country and gender.
```sql
-- Count the gold medals per country and gender
SELECT country, gender, COUNT(*) AS Gold_Awards
FROM Summer_Medals
```

**Task 2:** Generate `Country`-level gold award counts.
```sql
-- Generate Country-level subtotals
GROUP BY country, ROLLUP(gender)
```

**Final query**
```sql
SELECT country, gender, COUNT(*) AS Gold_Awards
FROM Summer_Medals
WHERE Year = 2004 
	AND Medal = 'Gold'
	AND Country IN ('DEN', 'NOR', 'SWE')
GROUP BY country, ROLLUP(gender)
ORDER BY Country ASC, Gender ASC;
```