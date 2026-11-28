## Truncating strings

In the previous exercise, you calculated the length of the `description` column and noticed that the number of characters varied but most of the results were over 75 characters. There will be many times when you need to truncate a text column to a certain length to meet specific criteria for an application. In this exercise, we will practice getting the first 50 characters of the `description` column.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Select the first 50 characters of the `description` column with the alias `short_desc`
```sql
-- Select the first 50 characters of description
SELECT LEFT(description, 50) AS short_desc
FROM film AS f;
```