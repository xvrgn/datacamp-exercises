## Calculating the expected return date

So now that you've practiced how to add and subtract timestamps and perform relative calculations using intervals, let's use those new skills to calculate the actual expected return date of a specific rental. As you've seen in previous exercises, the `rental_duration` is the number of days allowed for a rental before it's considered late. To calculate the `expected_return_date` you will want to use the `rental_duration` and add it to the `rental_date`.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Convert `rental_duration` by multiplying it with a 1-day `INTERVAL`.
```sql
INTERVAL '1' day * f.rental_duration
```

**Task 2:** Add it to the rental date.
```sql
-- Add the rental duration to the rental date
INTERVAL '1' day * f.rental_duration + r.rental_date
```

**Final Query**
```sql
SELECT
    f.title,
    r.rental_date,
    f.rental_duration,
    INTERVAL '1' day * f.rental_duration + r.rental_date AS expected_return_date,
    r.return_date
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;
```