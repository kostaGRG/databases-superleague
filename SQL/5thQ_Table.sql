CREATE TEMPORARY TABLE t AS
SELECT OnGame_ID AS t_ID, COUNT(*) AS HoGoals
FROM goals 
WHERE ForTeam = 'HomeTeam' 
GROUP BY OnGame_ID;

CREATE TEMPORARY TABLE i AS
SELECT OnGame_ID AS i_ID, COUNT(*) AS AwGoals 
FROM goals
WHERE ForTeam = 'AwayTeam' 
GROUP BY OnGame_ID;

CREATE TEMPORARY TABLE j AS
SELECT Home_Team_ID, IFNULL(HoGoals,0) AS Home_Goals, IFNULL(AwGoals,0) AS Away_Goals, Away_Team_ID
FROM games LEFT JOIN t ON Game_ID = t_ID
		LEFT JOIN i ON Game_ID = i_ID
        WHERE Season ='2022-23' and DateTime < now();
       
       CREATE TEMPORARY TABLE a AS
SELECT Home_Team_ID, COUNT(*)*3 AS ap
From j 
WHERE Home_Goals > Away_Goals
GROUP BY Home_Team_ID;

CREATE TEMPORARY TABLE b AS
SELECT Away_Team_ID AS b_ID, COUNT(*)*3 AS bp
From j 
WHERE Home_Goals < Away_Goals
GROUP BY Away_Team_ID;

CREATE TEMPORARY TABLE c AS
SELECT Home_Team_ID AS c_ID , COUNT(*) AS cp
From j 
WHERE Home_Goals = Away_Goals
GROUP BY Home_Team_ID;

CREATE TEMPORARY TABLE d AS
SELECT Away_Team_ID AS d_ID , COUNT(*) AS dp
From j 
WHERE Home_Goals = Away_Goals
GROUP BY Away_Team_ID;

SELECT Short_Name,  IFNULL(ap,0) + IFNULL(bp,0) + IFNULL(cp,0) +IFNULL(dp,0) AS Points
FROM  teams LEFT JOIN a ON Team_ID = Home_Team_ID LEFT JOIN b ON Team_ID = b_ID
		LEFT JOIN c ON Team_ID=c_ID
        LEFT JOIN d ON Team_ID=d_ID
ORDER BY Points DESC;


drop table t;
drop table i;
drop table j;
drop table a;
drop table b;
drop table c;
drop table d;