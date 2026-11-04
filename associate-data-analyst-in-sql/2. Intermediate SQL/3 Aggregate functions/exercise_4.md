### ROUND() with a negative parameter
Aggregate functions work great with numerical values; however, these results can sometimes get unwieldy when dealing with long decimal values. Luckily, SQL provides you with the `ROUND()` function to tame these long decimals.

If asked to give the average budget of your films, ten decimal places is not necessary. Instead, you can round to two decimal places to create results that make more sense for currency.

#### Instructions and Solutions
##### ✅ Instruction 1/1
**Task:** Calculate the average `budget` from the `films` table, aliased as `avg_budget_thousands`, and round to the nearest thousand.
```sql
-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget),-3) as avg_budget_thousands
FROM films;
```