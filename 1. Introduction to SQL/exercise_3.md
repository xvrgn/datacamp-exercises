### Aliasing
Default column names in an SQL result set come from the fields used to create them. You can use aliasing to rename these columns. This is helpful for making it clear what the column is about.

#### Instructions and Solutions
##### 1. Adding alias on author
**Task:** add an alias to the SQL query to rename the `author` column to `unique_author`
```sql
-- Alias author so that it becomes unique_author
SELECT DISTINCT author AS unique_author
FROM books;
```



