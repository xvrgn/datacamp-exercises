## You've got it, EXCEPT...
Just as you were able to leverage `INTERSECT` to find the names of cities with the same names as countries, you can also do the reverse, using `EXCEPT`.

In this exercise, you will find the names of cities that _do not_ have the same names as their countries.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return all cities that do not have the same `name` as a country.
```SQL
-- Return all cities that do not have the same name as a country
SELECT  name
FROM cities
EXCEPT
SELECT name
FROM countries
ORDER BY name;
```

