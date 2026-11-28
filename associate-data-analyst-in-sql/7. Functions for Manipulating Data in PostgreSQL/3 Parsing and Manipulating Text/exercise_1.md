## Concatenating strings

In this exercise and the ones that follow, we are going to derive new fields from columns within the `customer` and `film` tables of the DVD rental database.

We'll start with the `customer` table and create a query to return the customers name and email address formatted such that we could use it as a "To" field in an email script or program. This format will look like the following:

`Brian Piccolo <bpiccolo@datacamp.com>`

**In the first step of the exercise, use the `||` operator to do the string concatenation and in the second step, use the `CONCAT()` functions.**
#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Concatenate the `first_name` and `last_name` columns separated by a single space followed by `email` surrounded by `<` and `>`.
```SQL
-- Concatenate the first_name and last_name and email 
SELECT first_name || ' ' || last_name || ' <' || email || '>' AS full_email 
FROM customer
```

##### ✅ Instruction 2/2
**Task:** Now use the `CONCAT()` function to do the same operation as the previous step.
```SQL
-- Concatenate the first_name and last_name and email
SELECT CONCAT(first_name, ' ', last_name,  ' <', email, '>') AS full_email 
FROM customer
```

