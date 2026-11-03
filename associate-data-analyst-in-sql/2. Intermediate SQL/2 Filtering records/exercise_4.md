### Using OR
This time you'll write a query to get the `title` and `release_year` of films released in 1990 or 1999, which were in English or Spanish and took in more than $2,000,000 `gross`.

It looks like a lot, but you can build the query up one step at a time to get comfortable with the underlying concept in each step. Let's go!

#### Instructions and Solutions
##### ✅ Instruction 1/3
**Task:** Select the `title` and `release_year` for films released in 1990 or 1999 using only `WHERE` and `OR`.
```sql
-- Find the title and year of films from the 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year = 1990
	OR relesase_year = 1999;
```
##### ✅ Instruction 2/3
**Task:** Filter the records to only include English or Spanish-language films.
```sql
-- Add a filter to see only English or Spanish-language films
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
```
##### ✅ Instruction 3/3
**Task:** Finally, restrict the query to only return films worth more than $2,000,000 `gross`.
```sql
-- Filter films with more than $2,000,000 gross
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
    AND (language = 'English' OR language = 'Spanish')
	AND (gross > 2000000);
```
