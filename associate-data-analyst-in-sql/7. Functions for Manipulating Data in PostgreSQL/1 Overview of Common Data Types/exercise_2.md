## Determining data types

The `columns` table of the `INFORMATION_SCHEMA` database also allows us to extract information about the data types of columns in a table. We can extract information like the character or string length of a `CHAR` or `VARCHAR` column or the precision of a `DECIMAL` or `NUMERIC` floating point type.

Using the techniques you learned in the lesson, let's explore the `customer` table of our DVD Rental database.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Select the column name and data type from the `INFORMATION_SCHEMA.COLUMNS` system database.
```sql
-- Get the column name and data type From the system database information schema

SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
```

**Task 2:** Limit results to only include the `customer` table.
```sql
-- For the customer table
WHERE table_name = 'customer';
```

**Final query**
```sql
SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'customer';
```

