#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select sum(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT avg(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(avg(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT avg(winner_goals+opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT Max(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(winner_goals) FROM games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT t.name FROM games g, teams t where g.winner_id = t.team_id and year = 2018 and round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT t.name FROM games g, teams t where (g.winner_id = t.team_id  or g.opponent_id = t.team_id) and year = 2014 and round = 'Eighth-Final' order by name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct(t.name) from games g, teams t where g.winner_id = t.team_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT g.year, t.name FROM games g, teams t where g.winner_id = t.team_id and round = 'Final' order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT distinct(t.name) FROM games g, teams t where (g.winner_id = t.team_id  or g.opponent_id = t.team_id) and name like 'Co%'")"