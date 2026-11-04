### Sorting multiple fields
`ORDER BY` can also be used to sort on multiple fields. It will sort by the first field specified, then sort by the next, and so on. As an example, you may want to sort the `people` data by age and keep the names in alphabetical order. Try using `ORDER BY` to sort multiple columns.

#### Instructions and Solutions
##### ✅ Instruction 1/2
**Task:** Select the `release_year`, `duration`, and `title` of films ordered by their release year and duration, in that order.
```sql
-- Select the release year, duration, and title sorted by release year and duration
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;
```

##### ✅ Instruction 2/2
**Task:** Select the `certification`, `release_year`, and `title` from `films` ordered first by certification (alphabetically) and second by release year, starting with the most recent year.
```SQL
-- Select the certification, release year, and title sorted by certification and release year
SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year DESC;
```
