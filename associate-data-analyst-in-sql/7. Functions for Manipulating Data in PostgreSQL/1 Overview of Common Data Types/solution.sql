-- Select all columns from the TABLES system database
-- Filter by schema
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = 'public' ;


-- Select all columns from the COLUMNS system database
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'actor';


-- Get the column name and data type
-- From the system database information schema
-- For the customer table
SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'customer';

-- Select the rental and return dates
-- Calculate the expected_return_date
SELECT rental_date, return_date,
    rental_date + INTERVAL '3 days' AS expected_return_date
FROM rental;


-- Select the title and special features column
SELECT title, special_features
FROM film;

-- Select the title and special features column
-- Use the array index of the special_features column
SELECT title, special_features
FROM film
WHERE special_features[1] = 'Trailers';


-- Select the title and special features column
-- Use the array index of the special_features column
SELECT title, special_features
FROM film
WHERE special_features[2] = 'Deleted Scenes';


-- Modify the query to use the ANY function
SELECT title, special_features
FROM film
WHERE 'Trailers' = ANY(special_features);


-- Filter where special_features contains 'Deleted Scenes'
SELECT title, special_features
FROM film
WHERE special_features @> ARRAY['Deleted Scenes'];