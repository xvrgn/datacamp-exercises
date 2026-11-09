## In CASE of rivalry
Barcelona and Real Madrid have been rival teams for more than 80 years. Matches between these two teams are given the name _El Clásico_ (The Classic). In this exercise, you will query a list of matches played between these two rivals, where **Barcelona** is the **home** team, categorizing as a home or away win depending on multiple conditions.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Construct the `CASE` statement identifying who won each match. Fill in the **operators** to identify Barcelona or Real Madrid as the winner.
```SQL
SELECT 
	date,
	CASE
		WHEN hometeam_id = 8634 THEN 'FC Barcelona'
		ELSE 'Real Madrid CF'
	END AS home_team,
	
	CASE
		WHEN awayteam_id = 8634 THEN 'FC Barcelona'
		ELSE 'Real Madrid CF'
	END AS away_team,
	-- Identify possible home match outcomes
	CASE
		WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win'
		WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid CF'
		ELSE 'Tie'
	END AS outcome
FROM match
WHERE hometeam_id = 8634 AND awayteam_id = 8633;
```

