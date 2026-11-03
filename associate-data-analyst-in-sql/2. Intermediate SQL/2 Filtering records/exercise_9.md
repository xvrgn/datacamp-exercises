### Practice with NULLs
Well done. Now that you know what `NULL` means and what it's used for, it's time for some more practice!

Let's explore the `films` table again to better understand what data you have.

#### Instructions and Solutions
##### ✅ Instruction 1/2
**Task:** Select the `title` of every film that doesn't have a budget associated with it and use the alias `no_budget_info`.
```sql
-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL
```

##### ✅ Instruction 2/2
**Task:** - Count the number of films with a language associated with them and use the alias `count_language_known`.
```SQL
-- Count the number of films we have language data for
SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL
```