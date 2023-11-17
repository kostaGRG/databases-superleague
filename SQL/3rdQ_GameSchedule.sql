SELECT HOME, AWAY, DateTime, Season, MatchWeek, Stadium_Name AS Stadium
FROM gameteams JOIN games ON Game_ID = GAME
		JOIN teams ON Team_ID = Home_Team_ID 
WHERE DateTime > now();