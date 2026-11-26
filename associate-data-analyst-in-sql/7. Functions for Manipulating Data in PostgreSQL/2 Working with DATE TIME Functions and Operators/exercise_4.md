## Working with the current date and time

Because the Sakila database is a bit dated and most of the date and time values are from 2005 or 2006, you are going to practice using the current date and time in our queries without using Sakila. You'll get back into working with this database in the next video and throughout the remainder of the course. For now, let's practice the techniques you learned about so far in this chapter to work with the current date and time.

As you learned in the video, `NOW()` and `CURRENT_TIMESTAMP` can be used interchangeably.

#### Instructions and Solutions

##### ✅ Instruction 1/4
**Task:** use `NOW()` to select the current timestamp with time zone.
```sql
-- Select the current timestamp
SELECT NOW();
```
##### ✅ Instruction 2/4
**Task:** Select the current date without any time value.
```sql
-- Select the current date
SELECT CURRENT_DATE;
```
##### ✅ Instruction 3/4
**Task:** Now, let's use the `CAST()` function to eliminate the timezone from the current timestamp.
```sql
--Select the current timestamp without a timezone
SELECT CAST( NOW() AS TIMESTAMP )
```

##### ✅ Instruction 4/4
**Task:** - Finally, let's select the current date. Use `CAST()` to retrieve the same result from the `NOW()` function.
```sql
    -- CAST the result of the NOW() function to a date
SELECT CURRENT_DATE, CAST( NOW() AS date );
```