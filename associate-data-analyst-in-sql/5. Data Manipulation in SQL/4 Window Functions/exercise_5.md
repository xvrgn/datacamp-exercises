## PARTITION BY multiple columns

The `PARTITION BY` clause can be used to break out window averages by multiple data points (columns). You can even calculate the information you want to use to partition your data! For example, you can calculate average goals scored by season and by country, or by the calendar year (taken from the date column).

In this exercise, you will calculate the average number home and away goals scored _Legia Warszawa_, and their opponents, partitioned by the month in each season.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Construct two window functions partitioning the average of home and away goals by season and month.
```sql
-- Calculate average goals partitioned by season and month
AVG(home_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_home,
AVG(away_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_away
```

**Task 2:** Filter the dataset by _Legia Warszawa_'s team ID (`8673`) so that the window calculation only includes matches involving them.
```sql
WHERE hometeam_id = 8673 OR awayteam_id = 8673
```

**Final query**
```sql
SELECT date, season, home_goal, away_goal,
	CASE WHEN hometeam_id = 8673 THEN 'home' 
		ELSE 'away' END AS warsaw_location,
    AVG(home_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_home,
    AVG(away_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_away
FROM match
WHERE hometeam_id = 8673 OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;
```