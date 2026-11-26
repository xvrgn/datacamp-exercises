## INTERVAL arithmetic

If you were running a real DVD Rental store, there would be times when you would need to determine what film titles were currently out for rental with customers. In the previous exercise, we saw that some of the records in the results had a `NULL` value for the `return_date`. This is because the rental was still outstanding.

Each rental in the `film` table has an associated `rental_duration` column which represents the number of days that a DVD can be rented by a customer before it is considered late. In this example, you will exclude films that have a `NULL` value for the `return_date` and also convert the `rental_duration` to an `INTERVAL` type. Here's a reminder of one method for performing this conversion.

```
SELECT INTERVAL '1' day * timestamp '2019-04-10 12:34:56'
```

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Convert `rental_duration` by multiplying it with a 1 day `INTERVAL`
```sql
-- Convert the rental_duration to an interval
INTERVAL '1' day * f.rental_duration
```

**Task 2:** Subtract the `rental_date` from the `return_date` to calculate the number of `days_rented`.
```sql
-- Calculate the days rented as we did previously
r.return_date - r.rental_date AS days_rented
```

**Task 3:** Exclude rentals with a `NULL` value for `return_date`.
```sql
-- Filter the query to exclude outstanding rentals
WHERE r.return_date IS NOT NULL
```

**Final Query**
```sql
SELECT
    f.title,
    INTERVAL '1' day * f.rental_duration,
    r.return_date - r.rental_date AS days_rented
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
ORDER BY f.title;
```
