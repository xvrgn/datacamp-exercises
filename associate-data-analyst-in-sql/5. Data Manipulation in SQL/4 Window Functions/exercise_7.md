## Slide to the right

Now let's see how _FC Utrecht_ performs when they're the away team. You'll notice that the total for the season is at the bottom of the data set you queried. Depending on your results, this could be pretty long, and scrolling down is not very helpful.

In this exercise, you will slightly modify the query from the previous exercise by sorting the data set in reverse order and calculating a backward running total **from the** `CURRENT ROW` **to the end of the data set** (earliest record).

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Complete the window function by:
- Assessing the running **total** of away goals scored by **FC Utrecht**.
- Assessing the running **average** of away goals scored.
- Ordering both the running average and running total by `date`, **descending**.

```sql
SELECT date, away_goal,
	SUM(away_goal) OVER(ORDER BY date DESC
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_total,
	AVG(away_goal) OVER(ORDER BY date DESC
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_avg
FROM match
WHERE awayteam_id = 9908 AND season = '2011/2012';
```
