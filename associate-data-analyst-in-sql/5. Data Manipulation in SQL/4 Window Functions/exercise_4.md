## PARTITION BY a column

The `PARTITION BY` clause allows you to calculate separate "windows" based on columns you want to divide your results. For example, you can create a single column that calculates an overall average of goals scored for each season.

In this exercise, you will be creating a data set of games played by _Legia Warszawa_ (Warsaw League), the top ranked team in Poland, and comparing their individual game performance to the overall average for that season.

Where do you see more outliers? Are they _Legia Warszawa_'s home or away games?

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the two window functions that calculate the home and away goal **averages**. Partition the window functions by **season** to calculate separate averages for each season.
```sql
-- Calculate separately the average home and away goals scored, partitioned by season
AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
```

**Task 2:** Filter the query to only include matches played by _Legia Warszawa_, `id = 8673`.
```sql
-- Filter the data set for Legia Warszawa (id 8673) matches only
WHERE hometeam_id = 8673 OR awayteam_id = 8673
```

**Final query**
```sql
SELECT date, season, home_goal, away_goal,
	CASE WHEN hometeam_id = 8673 THEN 'home' 
		ELSE 'away' END AS warsaw_location,
    AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
    AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
WHERE hometeam_id = 8673 OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;
```
