## Using DATE_TRUNC

The `DATE_TRUNC()` function will truncate timestamp or interval data types to return a timestamp or interval at a specified precision. The precision values are a subset of the field identifiers that can be used with the `EXTRACT()` and `DATE_PART()` functions. `DATE_TRUNC()` will return an interval or timestamp rather than a number. For example

```
SELECT DATE_TRUNC('month', TIMESTAMP '2005-05-21 15:30:30');
```

**Result: 2005-05-01 00;00:00**

Now, let's experiment with different precisions and ultimately modify the queries from the previous exercises to aggregate rental activity.

#### Instructions and Solutions

##### ✅ Instruction 1/4
**Task:** Truncate the `rental_date` field by `year`.
```sql
-- Truncate rental_date by year
SELECT DATE_TRUNC('YEAR', rental_date) AS rental_year
FROM rental;
```

##### ✅ Instruction 2/4
**Task:** Now modify the previous query to truncate the `rental_date` by `month`.
```sql
-- Truncate rental_date by month
SELECT DATE_TRUNC('MONTH', rental_date) AS rental_month
FROM rental;
```

##### ✅ Instruction 3/4
**Task:** Let's see what happens when we truncate by day of the month.
```SQL
-- Truncate rental_date by day of the month 
SELECT DATE_TRUNC('DAY', rental_date) AS rental_day 
FROM rental;
```

##### ✅ Instruction 4/4
**Task:** Finally, count the total number of rentals by `rental_day` and alias it as `rentals`.
```SQL
-- Count total number of rentals 
SELECT DATE_TRUNC('day', rental_date) AS rental_day, COUNT(*) AS rentals 
FROM rental
GROUP BY 1;
```
