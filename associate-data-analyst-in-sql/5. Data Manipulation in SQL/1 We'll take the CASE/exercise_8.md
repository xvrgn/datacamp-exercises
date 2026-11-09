## Using CASE and AVG to derive fractions
`CASE` statements will return any value you specify in your `THEN` clause. This is an incredibly powerful tool for robust calculations and data manipulation when used in conjunction with an aggregate statement. One key task you can perform is using `CASE` inside an `AVG` function to calculate a fraction of information in your database.

Here's an example of how you set that up:

```
AVG(CASE WHEN condition_is_met THEN 1
         WHEN condition_is_not_met THEN 0 END)
```

With this approach, it's important to accurately specify which records count as `0`, otherwise your calculations may not be correct!

Your task is to examine the number of wins, losses, and ties in each country. The `matches` table is filtered to include all matches from the 2013/2014 and 2014/2015 seasons.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:**  Within an `AVG()` function, complete the `CASE` statement by checking if `m.home_goal` is not equal to `m.away_goal`, assigning a value of `0` if this condition is met.
```sql
AVG(CASE
		WHEN m.season = '2013/2014' AND m.home_goal = m.away_goal THEN 1
		WHEN m.season = '2013/2014' AND m.home_goal != m.away_goal THEN 0
	END) AS ties_2013_2014
```

**Task 2:** Repeat this process to compare home and away goals in `'2014/2015'`, aliasing as `ties_2014_2015`.
```sql
AVG(CASE
		WHEN m.season = '2014/2015' AND m.home_goal = m.away_goal THEN 1
		WHEN m.season = '2014/2015' AND m.home_goal != m.away_goal THEN 0
	END) AS ties_2014_2015
```

**Main query**
```SQL
SELECT 
    c.name AS country,
    AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
            WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
            END) AS ties_2013_2014,

    AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
            WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
            END) AS ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```