## Is this RIGHT?
You learned that right joins are not used as commonly as left joins. A key reason for this is that right joins can always be re-written as left joins, and because joins are typically typed from left to right, joining from the left feels more intuitive when constructing queries.

It can be tricky to wrap one's head around when left and right joins return equivalent results. You'll explore this in this exercise!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Write a new query using `RIGHT JOIN` that produces an identical result to the `LEFT JOIN` provided.
```sql
-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
SELECT countries.name AS country, languages.name AS language, percent
FROM languages
RIGHT JOIN countries
USING(code)
ORDER BY language;
```