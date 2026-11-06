## Comparing global economies
In this exercise, you have two tables, `economies2015` and `economies2019`, available to you under the tabs in the console. You'll perform a set operation to stack all records in these two tables on top of each other, **excluding duplicates**.

When drafting queries containing set operations, it is often helpful to write the queries on either side of the operation first, and _then_ call the set operator. The instructions are ordered accordingly

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Begin your query by selecting all fields from `economies2015`.
```SQL
-- Select all fields from economies2015
SELECT *
FROM economies2015
```

**Task 2:** Create a second query that selects all fields from `economies2019`.
```SQL
-- Select all fields from economies2019
SELECT *
FROM economies2019
```

**Task 3:** Perform a set operation to combine the two queries you just created, ensuring you do **not** return duplicates.
```SQL
SELECT *
FROM economies2015
UNION
SELECT *
FROM economies2019
ORDER BY code, year;
```