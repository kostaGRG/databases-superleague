# Databases: Superleague 

## Contributors
1. Konstantinos Gerogiannis  
   Email: kostas.gerogiannis04@gmail.com  
   Github: https://github.com/kostaGRG  
2. Aristeidis Sarchousidis  
   Email:  
   Github: https://github.com/saristei  
3. Eleftherios Klonos  
   Email: lefterisklonos@gmail.com  
   Github: https://github.com/eiklonos
   
## Intro
This project was created on December of 2022, for the university course Databases at Aristotle University of Thessaloniki (AUTh).

## Part A
An application that requires database management should be selected, and the logical design of the database should be done according to the relational model. The logical design includes:

1. Description of the application and its data requirements.
2. User categories and their requirements for database access, input, and output of data.
3. Definition of entities and relationships of the database and the entity-relationship diagram.
4. Logical design of the schema, specifying data definition fields, relationships, integrity constraints, and various perspectives. For each data definition field, specify the data type (integer, alphanumeric 30 characters, date, etc.). For each relationship, specify attributes, primary key(s), and make an estimate of the table size (number of rows). Show the relationships for each perspective.
5. Examples of tables with 5-10 rows of real or artificial data.
6. Examples of queries or query classes that can be answered by the schema you will design. Provide at least one example for each operation, with an emphasis on projection, selection, and join operations.

## Part A: Solution
### Intro
The purpose of SuperleagueDB is to construct a database that will contain data related to the Greek football championship. Users will be able to access information about the championship as well as details about each participating team in the competition.

In SuperleagueDB, data related to football teams is stored, including their players, titles they have won in the past, the stadium they play in, the coaches who train them, and general information about the team, such as the year of foundation and its name. Additionally, users can search for more detailed information about the stadium, including its name, capacity, location, and more. Users can also access information about each coach (age, nationality, etc.), each player (age, nationality, position, etc.), and view their statistics for the current playing season, including their appearances, goals, assists, and cards received. Users can search for information about individual matches, including the date of the match and the score if the match has already taken place. For completed matches, users can find information about the scorers, assist providers, players who received cards, and the minutes in which these significant events occurred.


For the calculation of the expected data to be stored in SuperleagueDB, we divide the data into static and dynamic categories. The static data includes teams, team stadiums, and players, while the dynamic data will be updated over time and includes matches, cards, goals, and assists. We estimate that there will be <= 20 stadiums, 20 teams, 20 coaches, and approximately 600 players for static data. For dynamic data per season, we can estimate that with ~400 matches, there will be ~2000 cards, ~800 goals, and ~500 assists. Considering that the system will store data for the last 10 seasons, we expect approximately ten times the dynamic data compared to what was recorded previously.

### User Categories and Their Requirements
_Administrator_:
Responsible for the complete management and supervision of the database. Their rights include:
* Access to all data in the database.
* Creating new user roles.
* Ability to edit stored data.

_Developer_:
Responsible for the maintenance of the database. Their rights include:
* Access to all data in the database.
* Ability to edit stored data.
* Addressing operational issues that may arise during the operation of the database.
  
_User/Visitor_:
Represents the regular user who can access information about the Greek football championship by searching for the desired data.

### Entities/Relationships Model
_Entities_:
* Team 
* Players 
* Coaches
* Match 
* Stadium
* Achievements 
* Goals
* Cards


_Relationships and Attributes_:
* Each team must have a stadium where they will compete. Additionally, they will have N titles (championships/cups), sign contracts with N players, and have 1 coach.
* Each stadium will be used by N teams.
* Each title has been won by one and only one team.
* Each player has signed contracts with N teams. They have also scored N goals, provided N assists, received N cards, and played in N matches.
* Each card belongs to a specific player. Additionally, each card has been issued in a specific match.
* In each match, there are N goals scored, N cards issued, N players participating, and one home team and one visiting team.

_Assumptions_:
* The championship is closed, consisting of 20 teams, without promotions and relegations, and without European participation.
* The season is completed when each team plays double matches with every other team.
* We are interested in player contracts only with teams from the Greek championship.
* Each match ends without delays, in 90 minutes.

### Entities
| Name         | Description                              | Properties    | Attributes                                          |
|--------------|------------------------------------------|---------------|-----------------------------------------------------|
| Teams        | Storing details for the league's teams   | Strong entity | Team_ID,Full_Name,Short_Name,Year_Founded,City      |
| Matches      | Storing details for the league's matches | Strong entity | Match_ID,MatchWeek,Season,DateTime                  |
| Players      | Storing details for the league's players | Strong entity | Player_ID,Name,Birth_Date,Nationality,Main_Position |
| Goals        | Storing league's goals                   | Strong entity | Goal_ID,Type,Minute                                 |
| Cards        | Storing player's cards (yellow or red)   | Weak entity   | Type, Minute                                        |
| Achievements | Storing teams' trophies                  | Strong entity | Achievement_ID,Season,Competition                   |
| Stadiums     | Storing fields for each team             | Strong entity | Name,Capacity,Address(Street,City,ZIP)              |
| Coaches      | Storing details for league's coaches     | Strong entity | Coach_ID,Name,Nationality,Birth_Date                |

### Relationships
| Name                                   | Description                                                                                                                         | Properties  | Cardinality Ratio | Participation                                                                               | Attributes                                    |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|-------------|-------------------|---------------------------------------------------------------------------------------------|-----------------------------------------------|
| Team_Has_Achievement                   | Each team can have 0 or more achievements                                                                                           | has-A       | 1:N               | Teams: Partial, Achievements: Total                                                         | -                                             |
| Stadium_UsedBy_Team                    | Each stadium can be used from 1 or more teams                                                                                       | Has-A       | 1:N               | Stadiums: Partial, Teams: Total                                                             | -                                             |
| Player_and_Team_Have_Contract          | Each team has a contract with a lot of players  and each player can sign a contract with more than 1 team,  but not simultaneously. | Has-A       | M:N               | Players: Total, Teams: Total                                                                | Contract_ID, From_Date, To_Date, Shirt_Number |
| Match_Has_Teams                        | Each match has a home team and an away team                                                                                         | Has-A       | 1:2               | Matches: Total, Teams: Partial                                                              | -                                             |
| Goal_is_for_Team                       | Each goal has a team that achieves it. Each team can score 0 or more goals in the league and each match separately.                 | Has-A       | 1:N               | Teams: Partial, Goals: Total                                                                | -                                             |
| Goal_Has_Players (Scorer and Assister) | Each goal must have a scorer and may have an assister.                                                                              | Has-A       | 1:2               | Goals: Total on Player_Scores_Goal, Goals: Partial on Player_Assists_Goal, Players: Partial | -                                             |
| Player_Plays_Match                     | Each player can play multiple matches and in each match can play a lot of players.                                                  | Has-A       | M:N               | Players: Partial, Matches: Partial                                                          | From_Minute, To_Minute                        |
| Player_Takes_Card                      | Each player can have from 0 to many cards in the league                                                                             | Determining | 1:N               | Cards: Total, Players: Partial                                                              | -                                             |
| Match_Has_Goals                        | Each match can have from 0 to many goals.                                                                                           | Has-A       | 1:N               | Goals: Total, Matches: Partial                                                              | -                                             |
| Match_Has_Cards                        | Each match can have 0 or more cards.                                                                                                | Determining | 1:N               | Cards: Total, Matches: Partial                                                              | -                                             |
| Team_Has_Coach                         | Each team has one coach, and each coach coaches one team.                                                                           | Has-A       | 1:1               | Coaches: Total, Matches: Partial                                                            | -                                             |

### Entities/Relationships Diagram
![ERD](/images/erd.png)

### Relational Model
#### Domains

| Domain                   | Data Type                                                 |
|--------------------------|-----------------------------------------------------------|
| Integer                  | INT                                                       |
| Small team name          | CHAR(4)                                                   |
| Long string              | VARCHAR(60)                                               |
| Address                  | VARCHAR(35)                                               |
| TIN                      | INT                                                       |
| YEAR                     | INT                                                       |
| Simple string            | VARCHAR(25)                                               |
| Capacity                 | INT                                                       |
| Postal code              | INT                                                       |
| Card categories          | ENUM('Yellow','Second_Yellow','Red')                      |
| Date                     | DATE                                                      |
| Period                   | ENUM('2018-19','2019-2020','2020-21','2021-22','2022-23') |
| Date and Time            | DATETIME                                                  |
| Player Position          | ENUM('ST','MD','DE','GK')                                 |
| Match Minute             | INT                                                       |
| Goals' categories        | ENUM('Goal','Penalty_Goal','Own_Goal')                    |
| Competitions' categories | ENUM('SuperLeague','Greek Cup')                           |

#### Relations
##### Teams

| Name         | Type                     |
|--------------|--------------------------|
| Team_ID      | TIN                      |
| Full_Name    | Long String              |
| Short_Name   | Small team name          |
| Year_Founded | Year                     |
| City         | Simple String            |
| Stadium_Name | Simple String            |
| Restrictions | -                        |
| Primary key  | Team_ID                  |
| Foreign keys | Stadium_Name ON Stadiums |

##### Stadiums

| Name         | Type          |
|--------------|---------------|
| Name         | Simple String |
| Capacity     | Capacity      |
| Street       | Simple String |
| City         | Simple String |
| ZIP          | Postal Code   |
| Restrictions | -             |
| Primary key  | Name          |
| Foreign keys | -             |

##### Achievements

| Name           | Type                     |
|----------------|--------------------------|
| Achievement_ID | INTEGER                  |
| Team_ID        | TIN                      |
| Competition    | Competitions' categories |
| Season         | Period                   |
| Restrictions   | -                        |
| Primary key    | Achievement_ID           |
| Foreign keys   | -                        |

##### Players

| Name          | Type              |
|---------------|-------------------|
| Player_ID     | INTEGER           |
| Name          | Simple String     |
| Birth_Date    | DATE              |
| Nationality   | Simple String     |
| Main_Position | Players' Position |
| Restrictions  | -                 |
| Primary key   | Player_ID         |
| Foreign keys  | -                 |

##### Player_and_Team_Have_Contracts

| Name         | Type                                   |
|--------------|----------------------------------------|
| Contract_ID  | INTEGER                                |
| From_Date    | DATE                                   |
| To_Date      | DATE                                   |
| Player_ID    | INTEGER                                |
| Team_ID      | TIN                                    |
| Shirt_Number | INTEGER                                |
| Restrictions | -                                      |
| Primary key  | Contract_ID                            |
| Foreign keys | Player_ID ON Players, Team_ID ON Teams |

##### Matches

| Name         | Type                                         |
|--------------|----------------------------------------------|
| Match_ID     | INTEGER                                      |
| Home_Team_ID | TIN                                          |
| Away_Team_ID | TIN                                          |
| MatchWeek    | INTEGER                                      |
| Season       | Period                                       |
| DateTime     | DATETIME                                     |
| Restrictions | -                                            |
| Primary key  | Match_ID                                     |
| Foreign keys | Home_Team_ID ON Teams, Away_Team_ID ON Teams |

##### Player_Plays_Match

| Name         | Type                                      |
|--------------|-------------------------------------------|
| From_Minute  | Match minute                              |
| To_Minute    | Match minute                              |
| Player_ID    | INTEGER                                   |
| Match_ID     | INTEGER                                   |
| Restrictions | -                                         |
| Primary key  | Player_ID,Match_ID                        |
| Foreign keys | Player_ID ON Players, Match_ID ON Matches |

##### Goals

| Name         | Type                                                                                     |
|--------------|------------------------------------------------------------------------------------------|
| Goal_ID      | INTEGER                                                                                  |
| Minute       | Match minute                                                                             |
| Scorer_ID    | INTEGER                                                                                  |
| Assister_ID  | INTEGER                                                                                  |
| ForTeam_ID   | TIN                                                                                      |
| OnMatch_ID   | INTEGER                                                                                  |
| Type         | Goals Categories                                                                         |
| Restrictions | -                                                                                        |
| Primary key  | Goal_ID                                                                                  |
| Foreign keys | Scorer_ID ON Players, Assister_ID ON Players, forTeam_ID ON Teams, OnMatch_ID ON Matches |

##### Cards

| Name         | Type                                          |
|--------------|-----------------------------------------------|
| Type         | Card Categories                               |
| Minute       | Match minute                                  |
| OnPlayer_ID  | INTEGER                                       |
| OnMatch_ID   | INTEGER                                       |
| Restrictions | -                                             |
| Primary key  | OnPlayer_ID,OnMatch_ID,Type                   |
| Foreign keys | OnPlayer_ID ON Players, OnMatch_ID ON Matches |

##### Coaches

| Name         | Type          |
|--------------|---------------|
| Coach_ID     | INTEGER       |
| Team_ID      | TIN           |
| Name         | Simple String |
| Birth_Date   | DATE          |
| Nationality  | Simple String |
| Restrictions | -             |
| Primary key  | Coach_ID      |
| Foreign keys | -             |

### Relational Schema

![Schema](/images/schema.png)
