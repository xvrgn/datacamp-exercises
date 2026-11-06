## INTERSECT
Well done getting through the material on `INTERSECT`!

Let's say you are interested in those countries that share names with cities. Use this task as an opportunity to show off your knowledge of set theory in SQL!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return all city names that are also country names.
```SQL
-- Return all cities with the same name as a country
SELECT name
FROM cities
INTERSECT
SELECT name
FROM countries
```
