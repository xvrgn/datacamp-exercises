### Answering business questions
In the real world, every SQL query starts with a business question. Then it is up to you to decide how to write the query that answers the question. Let's try this out.

Using the `films` table: which `release_year` had the most language diversity?

Take your time to translate this question into code and test your queries in the console.

"Most language diversity" can be interpreted as `COUNT(DISTINCT ___)`. Now over to you.

#### Instructions and Solutions
##### ✅ Instruction 1/1
**Task:** Using the `films` table: which `release_year` had the most language diversity?
**Answer:* `2006`
```sql
SELECT release_year, COUNT(DISTINCT language) AS most_diverse_language
FROM films
GROUP BY release_year
ORDER BY most_diverse_language DESC
LIMIT 1;
```

