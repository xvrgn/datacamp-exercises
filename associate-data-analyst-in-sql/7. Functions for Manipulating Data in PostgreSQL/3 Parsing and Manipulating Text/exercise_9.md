## The TRIM function

In this exercise, we are going to revisit and combine a couple of exercises from earlier in this chapter. If you recall, you used the `LEFT()` function to truncate the `description` column to 50 characters but saw that some words were cut off and/or had trailing whitespace. We can use trimming functions to eliminate the whitespace at the end of the string after it's been truncated.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Convert the film category `name` to uppercase and use the `CONCAT()` concatenate it with the `title`.
```sql
-- Concatenate the uppercase category name and film title
CONCAT(UPPER(name), ': ', title) AS film_category
```

**Task 2:** Truncate the description to the first 50 characters and make sure there is no leading or trailing whitespace after truncating.
```sql
-- Truncate the description remove trailing whitespace
TRIM(LEFT(description, 50)) AS film_desc
```

**Final Query**
```sql
SELECT  
    CONCAT(UPPER(name), ': ', title) AS film_category,  
    TRIM(LEFT(description, 50)) AS film_desc  
FROM film AS f  
INNER JOIN film_category AS fc  
ON f.film_id = fc.film_id  
INNER JOIN category AS c  
ON fc.category_id = c.category_id;
```