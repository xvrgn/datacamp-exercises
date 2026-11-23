## A basic pivot

You have the following table of Pole Vault gold medalist countries by gender in 2008 and 2012.

```
| Gender | Year | Country |
|--------|------|---------|
| Men    | 2008 | AUS     |
| Men    | 2012 | FRA     |
| Women  | 2008 | RUS     |
| Women  | 2012 | USA     |
```

Pivot it by `Year` to get the following reshaped, cleaner table.

```
| Gender | 2008 | 2012 |
|--------|------|------|
| Men    | AUS  | FRA  |
| Women  | RUS  | USA  |
```

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Create the correct extension.
```sql
-- Create the correct extension to enable CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc;
```

**Task 2:** Fill in the column names of the pivoted table. 
```sql
-- Fill in the correct column names for the pivoted table
SELECT * FROM CROSSTAB($$
	SELECT gender, year, country
	FROM Summer_Medals
	WHERE year IN (2008, 2012)
		AND medal = 'Gold'
		AND event = 'Pole Vault'
	ORDER BY gender ASC, year ASC
	$$) AS ct (gender VARCHAR, "2008" VARCHAR, "2012" VARCHAR)
ORDER BY gender ASC;
```