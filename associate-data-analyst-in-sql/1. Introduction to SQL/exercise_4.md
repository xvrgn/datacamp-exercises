### VIEWing your query

You've worked hard to create the below SQL query:

```
SELECT DISTINCT author AS unique_author
FROM books;
```

What if you'd like to be able to refer to it later, or allow others to access and use the results?

The best way to do this is by creating a view. Recall that a view is a virtual table: it's very similar to a real table, but rather than the data itself being stored, the query code is stored for later use.
#### Instructions and Solutions
##### ✅ Instruction 1/2
**Task:** Create a view called `library_authors`
```sql
-- Create a view called library_authors
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;
```

##### ✅ Instruction 2/2
**Task:** Check that the view was created by selecting all columns from `library_authors`.
```sql
-- Your code to create the view:
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;

  
-- Select all columns from library_authors
SELECT *
FROM library_authors
___
```