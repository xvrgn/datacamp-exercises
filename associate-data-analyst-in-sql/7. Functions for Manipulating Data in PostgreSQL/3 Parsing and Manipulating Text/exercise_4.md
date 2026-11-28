## Determining the length of strings

Determining the number of characters in a string is something that you will use frequently when working with data in a SQL database. Many situations will require you to find the length of a string stored in your database. For example, you may need to limit the number of characters that are displayed in an application or you may need to ensure that a column in your dataset contains values that are all the same length. In this example, we are going to determine the length of the `description` column in the `film` table of the DVD Rental database.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Select the `title` and `description` columns from the `film` table.
```sql
-- Select the title and description columns
SELECT title, description,
FROM film;
```

**Task 2:** Find the number of characters in the `description` column with the alias `desc_len`.
```sql
-- Determine the length of the description column
SELECT title, description, LENGTH(description) AS desc_len
FROM film;
```