## Adding and subtracting date and time values

In this exercise, you will calculate the actual number of days rented as well as the true `expected_return_date` by using the `rental_duration` column from the `film` table along with the familiar `rental_date` from the `rental` table.

This will require that you dust off the skills you learned from prior courses on how to join two or more tables together. To select columns from both the `film` and `rental` tables in a single query, we'll need to use the `inventory` table to join these two tables together since there is no explicit relationship between them. Let's give it a try!
#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Subtract the `rental_date` from the `return_date` to calculate the number of `days_rented`.
```SQL
-- Calculate the number of days rented
SELECT 
	f.title, f.rental_duration,
	r.return_date - r.rental_date AS days_rented
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;
```
##### ✅ Instruction 2/2
**Task:** Now use the `AGE()` function to calculate the `days_rented`.
```SQL
-- Calculate the number of days rented
SELECT 
	f.title, f.rental_duration,
	AGE(return_date, rental_date) AS days_rented
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;
```

