## Slide to the left

Sliding windows allow you to create running calculations between any two points in a window using functions such as `PRECEDING`, `FOLLOWING`, and `CURRENT ROW`. You can calculate running counts, sums, averages, and other aggregate functions between any two points you specify in the data set.

In this exercise, you will expand on the examples discussed in the video, calculating the running total of goals scored by the _FC Utrecht_ when they were the home team during the 2011/2012 season. Do they score more goals at the end of the season as the home or away team?

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Complete the window function by:
-  Assessing the running **total** of home goals scored by FC Utrecht.
- Assessing the running **average** of home goals scored.
- Ordering both the running average and running total `BY` the `date`.
```sql
SELECT date, home_goal, away_goal,
    SUM(home_goal) OVER(ORDER BY date 
	    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,
    AVG(home_goal) OVER(ORDER BY date
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg
FROM match
WHERE hometeam_id = 9908 AND season = '2011/2012';
```