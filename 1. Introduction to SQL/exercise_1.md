### Querying the books table
You're ready to practice writing your first SQL queries using the `SELECT` and `FROM` keywords. Recall from the video that `SELECT` is used to choose the fields that will be included in the result set, while `FROM` is used to pick the table in which the fields are listed.

Feel free to explore `books` in the exercise.

Your task in this exercise is to practice selecting fields from `books`.

#### Instructions and Solutions

##### 1. Select all book titles
**Task:** Select the `title` column from the `books` table to view all book titles.
```sql
-- return all titles from the books table
SELECT title
FROM books;
```

##### 2. Select book titles and authors
**Task:** Select both the `title` and `author` fields from `books`.
```sql
-- Select title and author from the books table
SELECT title, author
FROM books;
```

##### 3. Select all columns
**Task:** Select all fields from the `books` table.
```sql
-- Select all fields from the books table
SELECT * 
FROM books;
```


