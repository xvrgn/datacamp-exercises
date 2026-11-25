## Getting information about your database

As we saw in the video, PostgreSQL has a system database called `INFORMATION_SCHEMA` that allows us to extract information about objects, including tables, in our database.

In this exercise we will look at how to query the `tables` table of the `INFORMATION_SCHEMA` database to discover information about tables in the DVD Rentals database including the name, type, schema, and catalog of all tables and views and then how to use the results to get additional information about columns in our tables.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Select all columns from the `INFORMATION_SCHEMA.TABLES` system database. Limit results that have a public `table_schema`.
```sql
 -- Select all columns from the TABLES system database
  -- Filter by schema
 SELECT * 
 FROM INFORMATION_SCHEMA.TABLES
 WHERE table_schema = 'public' ;
```
##### ✅ Instruction 2/2

**Task:** Select all columns from the `INFORMATION_SCHEMA.COLUMNS` system database. Limit by `table_name` to `actor`
```sql
 -- Select all columns from the COLUMNS system database
 SELECT * 
 FROM INFORMATION_SCHEMA.COLUMNS 
 WHERE table_name = 'actor';
```