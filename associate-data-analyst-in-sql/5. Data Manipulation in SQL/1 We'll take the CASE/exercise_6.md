## COUNT using CASE WHEN
Do the number of soccer matches played in a given European country differ across seasons? We will use the European Soccer Database to answer this question.

You will examine the number of matches played in 3 seasons within each country listed in the database. This is much easier to explore with each season's matches in separate columns. Using the `country` and unfiltered `match` table, you will count the number of matches played in each country during the 2012/2013 and 2013/2014 seasons.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Create a `CASE WHEN` statement counting the matches played in the `'2012/2013'` season.
```SQL
-- Count matches in 2012/2013
COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013)
```

**Task 2:** Create a `CASE WHEN` statement counting the matches played in the`'2013/2014'` season, aliasing as `matches_2013_2014`.
```sql
-- Count matches in 2013/2014
COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2012_2013
```

**Final Query**
```sql
SELECT 
    c.name AS country,
    COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
    COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;
```

