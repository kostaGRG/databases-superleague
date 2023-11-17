CREATE TEMPORARY TABLE t AS
SELECT OnGame_ID AS t_ID, COUNT(*) AS Home_Goals
FROM goals 
WHERE ForTeam = 'HomeTeam' 
GROUP BY OnGame_ID;

CREATE TEMPORARY TABLE i AS
SELECT OnGame_ID AS i_ID, COUNT(*) AS Away_Goals 
FROM goals
WHERE ForTeam = 'AwayTeam' 
GROUP BY OnGame_ID;

SELECT HOME, IFNULL(Home_Goals,0), IFNULL(Away_Goals,0), AWAY, DateTime, MatchWeek
FROM gameteams LEFT JOIN t ON GAME = t_ID
		LEFT JOIN i ON GAME = i_ID
        JOIN games ON GAME = Game_ID
        WHERE DateTime < now() and Season ='2022-23';


drop table t;
drop table i;