## Comparing a country to itself
Self joins are very useful for comparing data from one part of a table with another part of the same table. Suppose you are interested in finding out how much the populations for each country changed from 2010 to 2015. You can visualize this change by performing a self join.

In this exercise, you'll work to answer this question by joining the `populations` table with itself. Recall that, with self joins, tables must be aliased. Use this as an opportunity to practice your aliasing!

Since you'll be joining the `populations` table to itself, you can alias `populations` first as `p1` and again as `p2`. This is good practice whenever you are aliasing tables with the same first letter.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task 1:** Perform an inner join of `populations` with itself `ON` `country_code`, aliased `p1` and `p2` respectively.
```sql
-- Join populations as p1 to itself, alias as p2, on country code
FROM populations p1
INNER JOIN populations p2
USING(code)
```

**Task 2:** Select the `country_code` from `p1` and the `size` field from both `p1` and `p2`, aliasing `p1.size` as `size2010` and `p2.size` as `size2015` (in that order).
```sql
-- Select aliased fields from populations as p1
SELECT 
	p1.country_code, 
	p1.size AS size2010, 
	p2.size AS size2015
```

##### ✅ Instruction 2/2
**Task:** Since you want to compare records from 2010 and 2015, eliminate unwanted records by extending the `WHERE` statement to include only records where the `p1.year` = `p2.year - 5`.
```sql
-- Filter such that p1.year is always five years before p2.year
WHERE p1.year = 2010
    AND p1.year = p2.year - 5
```

**Final Query**
```sql
SELECT 
    p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
    AND p1.year = p2.year - 5
```