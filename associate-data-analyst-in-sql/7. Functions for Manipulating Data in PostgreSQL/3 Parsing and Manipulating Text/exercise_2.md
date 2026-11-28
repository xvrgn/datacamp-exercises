## Changing the case of string data

Now you are going to use the `film` and `category` tables to create a new field called `film_category` by concatenating the category `name` with the film's `title`. You will also format the result using functions you learned about in the video to transform the case of the fields you are selecting in the query; for example, the `INITCAP()` function which converts a string to title case.
#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Convert the film category `name` to uppercase.
```SQL
UPPER(name)
```

**Task 2:** Convert the first letter of each word in the film's `title` to upper case.
```SQL
INITCAP(title)
```

**Task 3:** Concatenate the converted category `name` and film `title` separated by a colon.
```SQL
-- Concatenate the category name to coverted to uppercase
-- to the film title converted to title case
UPPER(name)  || ': ' || INITCAP(title) AS film_category
```

**Task 4:** Convert the `description` column to lowercase.
```SQL
LOWER(description) AS description
```

**Final query**
```sql

```