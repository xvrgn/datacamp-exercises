### Limiting results

Let's take a look at a few of the genres represented in our library's books.

Recall that limiting results is useful when testing code since result sets can have thousands of results. Queries are often written with a `LIMIT` of just a few records to test out code before selecting thousands of results from the database.

Let's practice with `LIMIT`!
#### Instructions and Solutions
##### ✅ Instruction 1/1
**Task:** Using PostgreSQL, select the `genre` field from `books` table; limit the number of results to 10.
```sql
-- Select the first 10 genres from books using PostgreSQL
SELECT genre
FROM books
LIMIT 10;
```