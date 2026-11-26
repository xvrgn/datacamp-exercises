## Manipulating the current date and time

Most of the time when you work with the current date and time, you will want to transform, manipulate, or perform operations on the value in your queries. In this exercise, you will practice adding an `INTERVAL` to the current timestamp as well as perform some more advanced calculations.

Let's practice retrieving the current timestamp. For this exercise, please use `CURRENT_TIMESTAMP` instead of the `NOW()` function and if you need to convert a date or time value to a timestamp data type, please use the PostgreSQL specific casting rather than the `CAST()` function.

#### Instructions and Solutions

##### ✅ Instruction 1/3
**Task:** Select the current timestamp without timezone and alias it as `right_now`.
```sql
--Select the current timestamp without timezone
SELECT CURRENT_TIMESTAMP::TIMESTAMP AS right_now;
```
##### ✅ Instruction 2/3
**Task:** Now select a timestamp five days from now and alias it as `five_days_from_now`.
```sql
SELECT
	CURRENT_TIMESTAMP::timestamp AS right_now,
    INTERVAL '5 DAYS'  + CURRENT_TIMESTAMP AS five_days_from_now;
```

##### ✅ Instruction 3/3
**Task:** Finally, let's use a second-level precision with no fractional digits for both the `right_now` and `five_days_from_now` fields.
```sql
SELECT
    CURRENT_TIMESTAMP(0)::timestamp AS right_now,
    interval '5 days' + CURRENT_TIMESTAMP(0) AS five_days_from_now;
```