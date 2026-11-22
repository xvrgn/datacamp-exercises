## Paging events

There are exactly 666 unique events in the Summer Medals Olympics dataset. If you want to chunk them up to analyze them piece by piece, you'll need to split the events into groups of approximately equal size.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Split the distinct events into exactly 111 groups, ordered by event in alphabetical order.
```sql
--- Split up the distinct events into 111 unique groups  
WITH Events AS (  
    SELECT DISTINCT Event  
    FROM Summer_Medals)  
SELECT DISTINCT event, NTILE(111) OVER (ORDER BY event ASC) AS Page  
FROM Events  
ORDER BY Event ASC;
```