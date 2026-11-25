## Searching an ARRAY with @>

The contains operator `@>` operator is alternative syntax to the `ANY` function and matches data in an ARRAY using the following syntax.

```
WHERE array_name @> ARRAY['search text'] :: type[]
```

So let's practice using this operator in the exercise.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Use the contains operator to match the text `Deleted Scenes` in the `special_features` column.
```SQL
-- Filter where special_features contains 'Deleted Scenes'  
SELECT title, special_features  
FROM film  
WHERE special_features @> ARRAY['Deleted Scenes'];
```