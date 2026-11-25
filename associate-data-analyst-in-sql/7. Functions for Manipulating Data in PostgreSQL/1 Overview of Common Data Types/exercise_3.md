## Interval data types

`INTERVAL` data types provide you with a very useful tool for performing arithmetic on date and time data types. For example, let's say our rental policy requires a DVD to be returned within 3 days. We can calculate the `expected_return_date` for a given DVD rental by adding an `INTERVAL` of 3 days to the `rental_date` from the `rental` table. We can then compare this result to the actual `return_date` to determine if the DVD was returned late.

Let's try this example in the exercise.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Select the rental date and return date from the `rental` table.
```sql
-- Select the rental and return dates
SELECT rental_date, return_date,
FROM rental;
```

**Task 2:** Add an `INTERVAL` of 3 days to the `rental_date` to calculate the expected return date`.
```sql
-- Calculate the expected_return_date
    rental_date + INTERVAL '3 days' AS expected_return_date
```

**Final Query**
```sql
SELECT
    rental_date,
    return_date,
    rental_date + INTERVAL '3 days' AS expected_return_date
FROM rental;
```