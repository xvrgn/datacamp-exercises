### Using AND
The following exercises combine `AND` and `OR` with the `WHERE` clause. Using these operators together strengthens your queries and analyses of data.

You will apply these new skills now on the `films` table.

#### Instructions and Solutions
##### ✅ Instruction 1/3
**Task:** Select the `title` and `release_year` for all German-language films released before 2000.
```sql
-- Select the title and release_year for all German-language films 
-- released before 2000
SELECT title, release_year
FROM films
WHERE release_year < 2000 
	AND language = 'German';
```
##### ✅ Instruction 2/3
**Task:** update the query from the previous step to show German-language films released after 2000 rather than before.
```sql
-- Update the query to see all German-language films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000
    AND language = 'German';
```
##### ✅ Instruction 3/3
**Task:** Select all details for German-language films released after 2000 but before 2010 using **only** `WHERE` and `AND`.
```sql
-- Select all records for German-language films released after 2000 and before 2010
SELECT *
FROM films
WHERE language = 'German'
	AND release_year > 2000
	AND release_year < 2010;
```

