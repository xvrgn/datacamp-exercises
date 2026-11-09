## CASE statements comparing two column values part 2
Similar to the previous exercise, you will construct a query to determine the outcome of Barcelona's matches where they played as the _**away team**_. You will learn how to combine these two queries in chapters 2 and 3.

Did their performance differ from the matches where they were the home team?

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the `CASE` statement to identify Barcelona's away team games as wins, losses, or ties.
```sql
-- Select matches where Barcelona was the away team
SELECT
    m.date,
    t.team_long_name AS opponent,
    CASE 
	    WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
        WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :(' 
        ELSE 'Tie' 
	END AS outcome
FROM matches_spain;
```

**Task 2:** Left join the `teams_spain` table `team_api_id` column on the `matches_spain` table `hometeam_id` column. This retrieves the identity of the _home team_ opponent.
```sql
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.hometeam_id = t.team_api_id
```

**Task 3:** Filter the query to only include matches where Barcelona (`awayteam_id = 8634`) was the _away_ team.
```sql
-- Filter for Barcelona
WHERE m.awayteam_id = 8634;
```

**Final Query**
```sql
-- Select matches where Barcelona was the away team
SELECT  
    m.date,
    t.team_long_name AS opponent,
    CASE 
	    WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
        WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :(' 
        ELSE 'Tie' 
    END AS outcome
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.hometeam_id = t.team_api_id
WHERE m.awayteam_id = 8634;
```

