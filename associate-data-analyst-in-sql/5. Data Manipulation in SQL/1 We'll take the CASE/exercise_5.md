## Filtering your CASE statement
Let's generate a list of matches won by Italy's _Bologna_ team! There are quite a few additional teams in the two tables, so a key part of generating a usable query will be using your `CASE` statement as a filter in the `WHERE` clause.

`CASE` statements allow you to categorize data that you're interested in -- and exclude data you're not interested in. In order to do this, you can use a `CASE` statement as a filter in the `WHERE` statement to remove output you don't want to see.

Here is how you might set that up:

```
SELECT *
FROM table
WHERE 
    CASE WHEN a > 5 THEN 'Keep'
         WHEN a <= 5 THEN 'Exclude' END = 'Keep';
```

In essence, you can use the `CASE` statement as a filtering column like any other column in your database. The only difference is that you _don't_ alias the statement in `WHERE`.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Use the `CASE` statement in the `WHERE` clause to filter where `hometeam_id` is `9857` and home goals exceed away goals.
```sql
-- Find games where home_goal is more than away_goal
WHERE CASE
	WHEN hometead_id = 9857 AND home_goal > away_goal THEN 'Bologna wins' 
END
```

**Task 2:** Use the `CASE` statement in the `WHERE` clause to filter where `awayteam_id` is `9857` and away goals exceed home goals.
```sql
WHERE CASE
	WHEN hometead_id = 9857 AND home_goal > away_goal THEN 'Bologna wins'
	-- Find games where away_goal is more than home_goal
	WHEN awayteam_id = 9857 AND home_goal < away_goal THEN 'Bologna wins'
END
```

**Task 3:** End the `CASE` statement by excluding games that Bologna **did not** win.
```sql
WHERE 
CASE
	WHEN hometead_id = 9857 AND home_goal > away_goal THEN 'Bologna wins' 
	WHEN awayteam_id = 9857 AND home_goal < away_goal THEN 'Bologna wins'
-- Exclude games not won by Bologna
END IS NOT NULL
```

**Final Query**
```sql
SELECT 
    season,
    date,
    home_goal,
    away_goal
FROM matches_italy
WHERE 
    CASE 
	    WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
		WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win' 
	END IS NOT NULL;
```
