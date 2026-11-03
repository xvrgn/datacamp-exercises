### Using WHERE with numbers
Filtering with `WHERE` allows you to analyze your data better. You may have a dataset that includes a range of different movies, and you need to do a case study on the most notable films with the biggest budgets. In this case, you'll want to filter your data to a specific `budget` range.

Now it's your turn to use the `WHERE` clause to filter numeric values
#### Instructions and Solutions
##### ✅ Instruction 1/3
**Task:** Select the `film_id` and `imdb_score` from the `reviews` table and filter on scores higher than `7.0`
```SQL
-- Select film_id and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_Score
FROM reviews
WHERE imdb_score > 7.0
```

##### ✅ Instruction 2/3
**Task:** Select the `film_id` and `facebook_likes` of the first ten records with less than 1000 likes from the `reviews` table.
```sql
-- Select film_id and facebook_likes for ten records with less than 1000 likes
SELECT film_id, facebook_likes
FROM reviews 
WHERE facebook_likes < 1000
LIMIT 10;
```

##### ✅ Instruction 2/3
**Task:** Count how many records have a `num_votes` of at least `100,000`: use the alias `films_over_100K_votes`.
```sql
SELECT COUNT(num_votes) AS films_over_100k_votes
FROM reviews
WHERE num_votes > 100000
```

