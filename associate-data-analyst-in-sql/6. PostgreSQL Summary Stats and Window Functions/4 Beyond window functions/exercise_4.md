## All group-level subtotals

You want to break down all medals awarded to Russia in the 2012 Olympic games per gender and medal type. Since the medals all belong to one country, Russia, it makes sense to generate all possible subtotals (`Gender`- and `Medal`-level subtotals), as well as a grand total.

Generate a breakdown of the medals awarded to Russia per country and medal type, including all group-level subtotals and a grand total.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Count the medals awarded per gender and medal type.
```sql
-- Count the medals per gender and medal type
SELECT gender, medal, COUNT(*) AS Awards
FROM Summer_Medals
```

**Task 2:**  Generate all possible group-level counts (per gender and medal type subtotals and the grand total).
```sql
-- Get all possible group-level subtotals
GROUP BY CUBE(gender, medal)
ORDER BY Gender ASC, Medal ASC;
```

**Final Query**
```sql
SELECT gender, medal, COUNT(*) AS Awards
FROM Summer_Medals
WHERE Year = 2012
	AND Country = 'RUS'
GROUP BY CUBE(gender, medal)
ORDER BY Gender ASC, Medal ASC;
```