## Numbering rows

The simplest application for window functions is numbering rows. Numbering rows allows you to easily fetch the `n`th row. For example, it would be very difficult to get the 35th row in any given table if you didn't have a column with each row's number.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Number each row in the dataset.
```sql
-- Assign numbers to each row
SELECT *, ROW_NUMBER() OVER() AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;
```