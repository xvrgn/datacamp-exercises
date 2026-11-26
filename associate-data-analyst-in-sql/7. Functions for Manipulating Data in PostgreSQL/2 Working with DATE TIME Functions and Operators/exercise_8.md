## Putting it all together

Many of the techniques you've learned in this course will be useful when building queries to extract data for model training. Now let's use some date/time functions to extract and manipulate some DVD rentals data from our fictional DVD rental store.

In this exercise, you are going to extract a list of customers and their rental history over 90 days. You will be using the `EXTRACT()`, `DATE_TRUNC()`, and `AGE()` functions that you learned about during this chapter along with some general SQL skills from the prerequisites to extract a data set that could be used to determine what day of the week customers are most likely to rent a DVD and the likelihood that they will return the DVD late.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task 1:** - Extract the day of the week from the `rental_date` column using the alias `dayofweek`.
```sql
-- Extract the day of week date part from the rental_date
EXTRACT(DOW FROM rental_date) AS dayofweek
```

**Task 2:** Use an `INTERVAL` in the `WHERE` clause to select records for the 90 day period starting on 5/1/2005.
```sql
-- Use an INTERVAL for the upper bound of the rental_date 
WHERE
	rental_date BETWEEN CAST('2005-05-01' AS date)
	AND CAST('2005-05-01' AS date) + INTERVAL '90 day';
```

##### ✅ Instruction 2/2
**Task:** Finally, use a `CASE` statement and `DATE_TRUNC()` to create a new column called `past_due` which will be `TRUE` if the `rental_days` is greater than the `rental_duration` otherwise, it will be `FALSE`.
```sql
-- Use DATE_TRUNC to get days from the AGE function
  CASE 
	  WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) > 
		  f.rental_duration * INTERVAL '1' day 
	  THEN TRUE 
	  ELSE FALSE 
  END AS past_due
```

**Final Query**
```sql
SELECT 
	c.first_name || '' || c.last_name AS customer_name,
	f.title,
	r.rental_date,
	EXTRACT(dow FROM r.rental_date) AS dayofweek,
	AGE(r.return_date, r.rental_date) AS rental_days,
	CASE 
		WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) > 
			f.rental_duration * INTERVAL '1' day 
		THEN TRUE 
		ELSE FALSE 
	END AS past_due 
FROM film AS f 
INNER JOIN inventory AS i 
ON f.film_id = i.film_id 
INNER JOIN rental AS r 
ON i.inventory_id = r.inventory_id 
INNER JOIN customer AS c 
ON c.customer_id = r.customer_id 
WHERE r.rental_date BETWEEN CAST('2005-05-01' AS DATE) 
	AND CAST('2005-05-01' AS DATE) + INTERVAL '90 day';
```