### Combining filtering and selecting
You now know you can query multiple conditions using the `IN` operator and a set of parentheses. It is a valuable piece of code that helps us keep our queries clean and concise.

Try using the `IN` operator yourself!

#### Instructions and Solutions
##### ✅ Instruction 1/1

**Task 1:** Count the unique `title`s from the films database and use the alias provided.
```SQL
-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
```

**Task 2:** Filter to include only movies with a `release_year` from 1990 to 1999, inclusive.
```sql
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
```

**Task 3:** Add another filter narrowing your query down to English-language films.
```sql
-- Filter to English-language films
	AND language = 'English'
```

**Task 4:** Add a final filter to select only films with 'G', 'PG', 'PG-13' certifications.
```sql
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13');
```

**Final Query:**
```SQL
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
	AND language = 'English'
	AND certification IN ('G', 'PG', 'PG-13');
```