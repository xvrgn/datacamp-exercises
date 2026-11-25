## Accessing data in an ARRAY

In our DVD Rentals database, the film table contains an ARRAY for `special_features` which has a type of `TEXT[]`. Much like any `ARRAY` data type in PostgreSQL, a `TEXT[]` array can store an array of `TEXT` values. This comes in handy when you want to store things like phone numbers or email addresses as we saw in the lesson.

Let's take a look at the `special_features` column and also practice accessing data in the ARRAY.

#### Instructions and Solutions

##### ✅ Instruction 1/3
**Task:** Select the title and special features from the `film` table and compare the results between the two columns.
```SQL
-- Select the title and special features column 
SELECT title, special_features 
FROM film;
```

##### ✅ Instruction 2/3
**Task:** Select all films that have a special feature `Trailers` by filtering on the first index of the `special_features` ARRAY.
```SQL
-- Use the array index of the special_features column
SELECT title, special_features 
FROM film
WHERE special_features[1] = 'Trailers';
```

##### ✅ Instruction 3/3
**Task:** Now let's select all films that have `Deleted Scenes` in the second index of the `special_features` ARRAY.
```SQL
-- Use the array index of the special_features column
SELECT title, special_features 
FROM film
WHERE special_features[2] = 'Deleted Scenes';
```

