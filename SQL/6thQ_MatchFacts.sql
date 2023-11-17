CREATE TEMPORARY TABLE t as

SELECT Team, Type,minute,Scorer_ID AS Player, OnGame_ID,Assister_ID
FROM goals JOIN goalteam ON GOAL = Goal_ID
UNION ALL
SELECT Team, Type, minute, OnPlayer_ID, OnGame_ID,-1
FROM cards JOIN playerteam ON OnPlayer_ID=Pl_ID;

Select  minute AS Minute,Team, Type, players.Name
From t JOIN players ON Player = Player_ID
where OnGame_ID = 9
ORDER BY Minute ASC;
drop table t;

