### Your first join
Throughout this course, you'll be working with the `countries` database, which contains information about the most populous cities in the world, along with country-level economic, population, and geographic data. The database also contains information on languages spoken in each country.

You can see the different tables in this database to get a sense of what they contain by clicking on the corresponding tabs. Familiarize yourself with the fields that seem to be shared across tables before you continue with the course.

In this exercise, you'll use the `cities` and `countries` tables to build your first inner join. You'll start off by selecting all columns in step 1, performing your join in step 2, and then refining your join to choose specific columns in step 3.

#### Instructions and Solutions
##### ✅ Instruction 1/3
**Task:** Begin by selecting all columns from the `cities` table, using the SQL shortcut that selects all.
```sql
-- Select all columns from cities
SELECT *
FROM cities;
```

##### ✅ Instruction 2/3
**Task 1:** Perform an inner join with the `cities` table on the left and the `countries` table on the right; you **do not** need to alias tables here.
```SQL
-- Inner join to countries
INNER JOIN countries
```

**Task 2:** Join `ON` the `country_code` and `code` columns, making sure you identify them with the correct table.
```sql
-- Match on country codes
ON cities.country_code = countries.code;
```


##### ✅ Instruction 3/3
**Task 1:** Complete the `SELECT` statement to keep three columns: the `name` of the city, the `name` of the country, **and** the `region` the country is located in (in this order).
```sql
-- Select name fields (with alias) and region 
SELECT 
    cities.name, 
    countries.name,
    region
```

**Task 2:** Alias the name of the city `AS city` and the name of the country `AS country`.
```sql
-- Select name fields (with alias) and region 
SELECT 
    cities.name AS city, 
    countries.name AS country,
    region
```


**Final query**
```sql
-- Select name fields (with alias) and region 
SELECT 
    cities.name AS city, 
    countries.name AS country,
    region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;
```
