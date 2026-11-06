## UNION vs. UNION ALL
Two tables, `languages` and `currencies`, are provided. Run the queries provided in the console and select the correct answer for the multiple-choice questions in this exercise.

#### Instructions and Solutions

##### ✅ Instruction 1/3
**Task:** What result will the following SQL query produce?
```SQL
SELECT * 
FROM languages
UNION
SELECT * 
FROM currencies;
```
**answer**: A SQL error, because `languages` and `currencies` do not have the same number of fields
##### ✅ Instruction 2/3
**Task:** What result will the following SQL query produce?
```sql
SELECT code FROM
languages
UNION ALL
SELECT code FROM 
currencies;
```
**answer**: An unordered list of each country `code` in `languages` and `currencies`, including duplicates
##### ✅ Instruction 3/3
**Task:** What result will the following SQL query produce?
```sql
SELECT code 
FROM languages
UNION
SELECT curr_id 
FROM currencies;
```
answer: A SQL error, because `code` and `curr_id` are not of the same data type
