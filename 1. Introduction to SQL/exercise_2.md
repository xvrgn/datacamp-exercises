### Making queries DISTINCT
You've learned that the `DISTINCT` keyword can be used to return unique values in a field.

The `books` table contains 350 books, representing all of the books that our local library has available for checkout.

But how many different authors are represented in these 350 books?

#### Instructions and Solutions

##### 1. Select unique authors
**Task:** Select only the unique authors from the `books` table
```sql
-- Select unique authors from the books table
SELECT DISTINCT author
FROM books;
```

##### 2. Select unique author and genres
**Task:** Update the code to return the unique `author` and `genre` combinations in the `books` table.
```sql
-- Select unique authors and genre combinations from the books table
SELECT DISTINCT author, genre
FROM books;
```

