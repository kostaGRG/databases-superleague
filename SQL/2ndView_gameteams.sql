SELECT Game_ID AS GAME , teams.Short_Name AS HOME , d.Short_Name AS AWAY
FROM games JOIN teams on Home_Team_ID = Team_ID
			JOIN teams as d on Away_Team_ID = d.Team_ID;
	