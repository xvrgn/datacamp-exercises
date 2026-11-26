## Using EXTRACT

You can use `EXTRACT()` and `DATE_PART()` to easily create new fields in your queries by extracting sub-fields from a source timestamp field.

Now suppose you want to produce a predictive model that will help forecast DVD rental activity by day of the week. You could use the `EXTRACT()` function with the `dow` field identifier in our query to create a new field called `dayofweek` as a sub-field of the `rental_date` column from the `rental` table.

You can `COUNT()` the number of records in the rental table for a given date range and aggregate by the newly created `dayofweek` column.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Get the day of the week from the `rental_date` column.
```sql
-- Extract day of week from rental_date
SELECT EXTRACT(DOW FROM rental_date) AS dayofweek 
FROM rental 
LIMIT 100;
```

##### ✅ Instruction 2/2
**Task:** Count the total number of rentals by day of the week.
```sql
-- Count the number of rentals
SELECT EXTRACT(dow FROM rental_date) AS dayofweek, COUNT(*) as rentals 
FROM rental 
GROUP BY 1;
```