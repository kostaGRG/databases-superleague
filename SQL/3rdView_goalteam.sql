SELECT Short_Name AS Team, Goal_ID AS GOAL
FROM games JOIN goals ON OnGame_ID = Game_ID
		JOIN teams ON Home_Team_ID= Team_ID
        WHERE ForTeam = 'HomeTeam'
UNION
SELECT Teams.Short_Name, Goal_ID
FROM games JOIN goals ON OnGame_ID = Game_ID
		JOIN teams ON Away_Team_ID= Team_ID
        WHERE ForTeam = 'AwayTeam';

