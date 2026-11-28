-- Concatenate the first_name and last_name and email
SELECT first_name || ' ' || last_name || ' <' || email || '>' AS full_email
FROM customer;

-- Concatenate the first_name and last_name and email
SELECT CONCAT(first_name, ' ', last_name,  ' <', email, '>') AS full_email
FROM customer;

-- Concatenate the category name to coverted to uppercase
-- to the film title converted to title case
-- Convert the description column to lowercase
SELECT
    UPPER(name)  || ': ' || INITCAP(title) AS film_category,
    LOWER(description) AS description
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id;

-- Replace whitespace in the film title with an underscore
SELECT REPLACE(title, ' ', '_') AS title
FROM film;

-- Select the title and description columns
-- Determine the length of the description column
SELECT title, description, LENGTH(description) AS desc_len
FROM film;

-- Select the first 50 characters of description
SELECT LEFT(description, 50) AS short_desc
FROM film AS f;

-- Select only the street name from the address table
SELECT SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR LENGTH(address))
FROM address;

-- Extract the characters to the left of the '@'
-- Extract the characters to the right of the '@'
SELECT
    LEFT(email, POSITION('@' IN email)-1) AS username,
    SUBSTRING(email FROM POSITION('@' IN email)+1 FOR LENGTH(email)) AS domain
FROM customer;

-- Concatenate the padded first_name and last_name
SELECT RPAD(first_name, LENGTH(first_name)+1) || last_name AS full_name
FROM customer;

-- Concatenate the first_name and last_name
SELECT first_name || LPAD(last_name, LENGTH(last_name)+1) AS full_name
FROM customer;

-- Concatenate the first_name and last_name
SELECT
    RPAD(first_name, LENGTH(first_name)+1)
        || RPAD(last_name, LENGTH(last_name)+2, ' <')
        || RPAD(email, LENGTH(email)+1, '>') AS full_email
FROM customer;


-- Concatenate the uppercase category name and film title
-- Truncate the description remove trailing whitespace
SELECT
    CONCAT(UPPER(name), ': ', title) AS film_category,
    TRIM(LEFT(description, 50)) AS film_desc
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id;

-- Truncate the description without cutting off a word
-- Subtract the position of the first whitespace character
SELECT
    UPPER(c.name) || ': ' || f.title AS film_category,
    LEFT(description, 50 - POSITION(' ' IN REVERSE(LEFT(description, 50))))
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id;