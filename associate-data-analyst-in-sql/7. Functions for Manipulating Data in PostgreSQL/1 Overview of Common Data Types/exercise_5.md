## Searching an ARRAY with ANY

As we saw in the video, PostgreSQL also provides the ability to filter results by searching for values in an ARRAY. The `ANY` function allows you to search for a value in any index position of an ARRAY. Here's an example.

```
WHERE 'search text' = ANY(array_name)
```

When using the `ANY` function, the value you are filtering on appears on the left side of the equation with the name of the ARRAY column as the parameter in the `ANY` function.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Match `'Trailers'` in any index of the `special_features` ARRAY regardless of position.
```SQL
-- Modify the query to use the ANY function SELECT title, special_features  
FROM film  
WHERE 'Trailers' = ANY(special_features);
```