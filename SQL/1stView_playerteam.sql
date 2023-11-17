SELECT players.Player_ID AS Pl_ID, players.Name AS Player, teams.Team_ID AS T_ID, teams.Short_Name AS Team
FROM players JOIN contracts ON Player_ID = ConPlayer_ID
	JOIN teams ON teams.Team_ID = ConTeam_ID
    WHERE Contract_ID not in (SELECT Contract_ID FROM contracts  WHERE contracts.To_Date < now());
