## First athlete by name

It's often useful to get the first or last value in a dataset to compare all other values to it. With absolute fetching functions like `FIRST_VALUE`, you can fetch a value at an absolute position in the table, like its beginning or end.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return all athletes and the first athlete ordered by alphabetical order.
```sql
-- Fetch all athletes and the first athlete alphabetically  
WITH All_Male_Medalists AS (  
    SELECT DISTINCT Athlete  
    FROM Summer_Medals  
    WHERE Medal = 'Gold' AND Gender = 'Men')  
SELECT athlete, FIRST_VALUE(athlete) OVER (ORDER BY athlete ASC) AS First_Athlete  
FROM All_Male_Medalists;
```
