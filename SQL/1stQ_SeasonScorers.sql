SELECT Name AS PLAYER, COUNT(*) AS Goals
FROM goals JOIN players ON Scorer_ID = Player_ID
JOIN games ON Game_ID = OnGame_ID
where Season = '2021-22'
GROUP BY Player_ID  
ORDER BY Goals DESC;
