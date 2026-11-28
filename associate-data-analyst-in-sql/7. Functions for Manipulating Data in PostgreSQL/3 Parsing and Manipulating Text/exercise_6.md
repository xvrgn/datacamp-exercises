## Extracting substrings from text data

In this exercise, you are going to practice how to extract substrings from text columns. The Sakila database contains the `address` table which stores the street address for all the rental store locations. You need a list of all the street names where the stores are located but the `address` column also contains the street number. You'll use several functions that you've learned about in the video to manipulate the `address` column and return only the street address.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Extract only the street address without the street number from the `address` column.
```sql
SUBSTRING(address FROM POSITION(' ' IN address))
```

**Task 2:** Use functions to determine the starting and ending position parameters.
```sql
-- Select only the street name from the address table
SELECT SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR LENGTH(address))
FROM address;
```