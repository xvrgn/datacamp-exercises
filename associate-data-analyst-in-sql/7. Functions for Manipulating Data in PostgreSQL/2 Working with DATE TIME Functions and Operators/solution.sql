-- Calculate the number of days rented
SELECT
    f.title, f.rental_duration,
    r.return_date - r.rental_date AS days_rented
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

-- Calculate the number of days rented
SELECT
    f.title, f.rental_duration,
    AGE(return_date, rental_date) AS days_rented
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;


-- Convert the rental_duration to an interval
-- Calculate the days rented as we did previously
-- Filter the query to exclude outstanding rentals
SELECT
    f.title,
    INTERVAL '1' day * f.rental_duration,
    r.return_date - r.rental_date AS days_rented
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
ORDER BY f.title;

-- Add the rental duration to the rental date
SELECT f.title, r.rental_date, f.rental_duration,
    INTERVAL '1' day * f.rental_duration + r.rental_date AS expected_return_date,
    r.return_date
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

-- Select the current timestamp
SELECT NOW();

-- Select the current date
SELECT CURRENT_DATE;

--Select the current timestamp without a timezone
SELECT CAST( NOW() AS TIMESTAMP );

-- CAST the result of the NOW() function to a date
SELECT CURRENT_DATE, CAST( NOW() AS date);

--Select the current timestamp without timezone
SELECT CURRENT_TIMESTAMP::TIMESTAMP AS right_now;

SELECT
    CURRENT_TIMESTAMP::timestamp AS right_now,
    INTERVAL '5 DAYS'  + CURRENT_TIMESTAMP AS five_days_from_now;

SELECT
    CURRENT_TIMESTAMP(0)::timestamp AS right_now,
    interval '5 days' + CURRENT_TIMESTAMP(0) AS five_days_from_now;

-- Count the number of rentals
SELECT
    EXTRACT(dow FROM rental_date) AS dayofweek,
    COUNT(*) as rentals
FROM rental
GROUP BY 1;

-- Truncate rental_date by year
SELECT DATE_TRUNC('YEAR', rental_date) AS rental_year
FROM rental;

-- Truncate rental_date by month
SELECT DATE_TRUNC('MONTH', rental_date) AS rental_month
FROM rental;

-- Truncate rental_date by day of the month
SELECT DATE_TRUNC('DAY', rental_date) AS rental_day
FROM rental;

-- Count total number of rentals
SELECT
    DATE_TRUNC('day', rental_date) AS rental_day,
    COUNT(*) AS rentals
FROM rental
GROUP BY 1;

-- Extract the day of week date part from the rental_date
-- Use an INTERVAL for the upper bound of the rental_date
SELECT
    EXTRACT(DOW FROM rental_date) AS dayofweek,
    AGE(return_date, rental_date) AS rental_days
FROM rental AS r
WHERE rental_date BETWEEN CAST('2005-05-01' AS date)
    AND CAST('2005-05-01' AS date) + INTERVAL '90 day';


-- Extract the day of week date part from the rental_date
-- Use DATE_TRUNC to get days from the AGE function
-- Calculate number of d
SELECT
    c.first_name || '' || c.last_name AS customer_name,
    f.title,
    r.rental_date,
    EXTRACT(dow FROM r.rental_date) AS dayofweek,
    AGE(r.return_date, r.rental_date) AS rental_days,
    CASE
        WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) >
            f.rental_duration * INTERVAL '1' day
        THEN TRUE
        ELSE FALSE
    END AS past_due
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
INNER JOIN customer AS c ON c.customer_id = r.customer_id
WHERE r.rental_date BETWEEN CAST('2005-05-01' AS DATE)
    AND CAST('2005-05-01' AS DATE) + INTERVAL '90 day';