## Conditional selection and summation with CASE WHEN
You can use `CASE` statements to apply a constraint and run a calculation by including the statement inside an aggregate function like `SUM()`!

In this exercise, your goal is to filter for a specific team (Real Sociedad) and calculate their total home and away goals per season.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:**  Create a `CASE` statement to calculate the total number of **home goal**s where  `hometeam_id` is `8560`.
```sql
-- SUM the home goals
SUM(CASE WHEN hometeam_id = 8560 THEN home_goal END) AS home_goals
```

**Task 2:** Create a second `CASE` statement to calculate the total number of **away goal**s where the `awayteam_id` is `8560`, aliasing the column as `away_goals`.
```sql
-- SUM the away goals
SUM(CASE WHEN awayteam_id = 8560 THEN away_goal END) AS away_goals
```

**Task 3:** Group the query by `season`.
```sql
-- Group the results by season
GROUP BY season
```

**Final Query**
```sql
SELECT season,
    SUM(CASE WHEN hometeam_id = 8560 THEN home_goal END) AS home_goals,
    SUM(CASE WHEN awayteam_id = 8560 THEN away_goal END) AS away_goals
FROM match
GROUP BY season;
```

