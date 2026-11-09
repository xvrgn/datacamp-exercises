## CASE statements comparing column values
Barcelona is considered one of the strongest teams in Spain's soccer league.

In this exercise, you will be creating a list of matches in the 2011/2012 season where Barcelona was the _home team_. You will do this using a `CASE` statement that compares the values of two columns to create a new group -- wins, losses, and ties.

In 3 steps, you will build a query that identifies a match's winner, identifies the identity of the opponent, and finally filters for Barcelona as the home team. Completing a query in this order will allow you to watch your results take shape with each new piece of information.

The `matches_spain` table currently contains Barcelona's matches from the 2011/2012 season, and has two key columns, `hometeam_id` and `awayteam_id`, that can be joined with the `teams_spain` table. However, you can only join `teams_spain` to one column at a time.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Create a `CASE` statement to identify matches as home wins, home losses, or else ties.
```SQL
-- Identify home wins, losses, or ties
SELECT 
    date,
    CASE WHEN home_goal > away_goal THEN 'Home win!'
        WHEN home_goal < away_goal THEN 'Home loss :(' 
        ELSE 'Tie' END AS outcome
FROM matches_spain;
```

