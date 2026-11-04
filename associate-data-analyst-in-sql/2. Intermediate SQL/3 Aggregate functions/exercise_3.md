### Using ROUND()
Aggregate functions work great with numerical values; however, these results can sometimes get unwieldy when dealing with long decimal values. Luckily, SQL provides you with the `ROUND()` function to tame these long decimals.

If asked to give the average budget of your films, ten decimal places is not necessary. Instead, you can round to two decimal places to create results that make more sense for currency.

#### Instructions and Solutions
##### ✅ Instruction 1/1
**Task:** Calculate the average `facebook_likes` to one decimal place and assign to the alias, `avg_facebook_likes`.
```SQL
-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes),1) AS avg_facebook_likes
FROM reviews;
```