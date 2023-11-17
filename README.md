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

