### Debugging errors
Debugging is an essential skill for all coders, and it comes from making many mistakes and learning from them. In this exercise, you'll be given some buggy code that you'll need to fix

#### Instructions and Solutions
##### ✅ Instruction 1/3
**Task:** - Debug and fix the SQL query provided.
```sql
-- Debug this code
SELECT certification 
FROM films
LIMIT 5; -- fixes typograhpical error
```

##### ✅ Instruction 2/3
**Task:** Find the two errors in this code; the same error has been repeated twice.
```sql
-- Debug this code
SELECT film_id, imdb_score, num_votes
FROM reviews;  -- fixes missing commas
```

##### ✅ Instruction 3/3
**Task:** Find the two bugs in this final query.
```sql
-- Debug this code
SELECT COUNT(birthdate) AS count_birthdays 
FROM people; -- fixes typographical error on table name and function
```