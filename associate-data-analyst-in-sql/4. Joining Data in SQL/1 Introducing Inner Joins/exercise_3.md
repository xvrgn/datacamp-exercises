### USING in action
In the previous exercises, you performed your joins using the `ON` keyword. Recall that when **both** the field names being joined on are the same, you can take advantage of the `USING` clause.

You'll now explore the `languages` table from our database. Which languages are official languages, and which ones are unofficial?

You'll employ `USING` to simplify your query as you explore this question.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Use the country `code` field to complete the `INNER JOIN` with `USING`; do **not** change any alias names.
```sql
-- Match using the code column
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
USING(code);
```