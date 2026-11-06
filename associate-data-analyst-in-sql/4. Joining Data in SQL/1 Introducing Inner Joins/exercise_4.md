### Inspecting a relationship
You've just identified that the `countries` table has a many-to-many relationship with the `languages` table. That is, many languages can be spoken in a country, and a language can be spoken in many countries.

But, what is the best way to query all the different languages spoken in a country? Or, all the countries that speak a certain language?

#### Instructions and Solutions

##### ✅ Instruction 1/4
**Task:** - Select the country `name`, aliased as `country`, from the `countries` table.
```sql
-- Select country (aliased) from countries
SELECT name AS country
FROM countries;
```

##### ✅ Instruction 2/4
**Task 1:** Now add an alias `c` for the `countries` table and perform an inner join with the `languages` table, `l`, on the right; 
```sql
-- From countries (aliased)
FROM countries c
-- Join to languages (aliased)
INNER JOIN languages l
```

**Task 2:** join on `code` in line 8 with the `USING` keyword; include the language name, aliased as `language`.
```sql
-- Use code as the joining field with the USING keyword
USING(code)
```

##### ✅ Instruction 3/4
**Task:** Add a `WHERE` clause to find how many countries speak the language `'Bhojpuri'`.
```sql
-- Filter for the Bhojpuri language
WHERE l.name = 'Bhojpuri';
```

##### ✅ Instruction 4/4
**Task:** In how many countries is the `'Bhojpuri'` language spoken? **Answer:** `2`

**Final Query:**
```sql
SELECT c.name AS country, l.name AS language
FROM countries c
INNER JOIN languages l
USING(code);
```

