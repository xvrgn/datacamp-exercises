### SELECT DISTINCT
Often query results will include many duplicate values. You can use the `DISTINCT` keyword to select the unique values from a field.

This might be useful if, for example, you're interested in knowing which languages are represented in the `films` table. See if you can find out what countries are represented in this table with the following exercises.

#### Instructions and Solutions
##### ✅ Instruction 1/2
**Task:** return the unique countries represented in the `films` table using `DISTINCT`
```sql
-- Return the unique countries from the films table
SELECT DISTINCT country
FROM films
```

##### ✅ Instruction 2/2
**Task:** Return the number of unique countries represented in the `films` table, aliased as `count_distinct_countries`.
```sql
SELECT COUNT(DISTINCT country) AS count_distinct_country
FROM films;
```
