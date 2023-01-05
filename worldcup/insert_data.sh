#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WG OP
do
  if [[ YEAR -ne "year" ]]
  then
    INSERT_WINNER="$($PSQL "insert into teams(name) values('$WINNER')")"
    INSERT_OPPONENT="$($PSQL "insert into teams(name) values('$OPPONENT')")"
    if [[ INSERT_WINNER = "insert 0 1" || INSERT_OPPONENT == "insert 0 1" ]]
    then 
      echo -e "/nteam inserted"
    fi
    WINNER_ID="$($PSQL "select team_id from teams where name='$WINNER'")"
    OPPONENT_ID="$($PSQL "select team_id from teams where name = '$OPPONENT'")"
    INSERT_GAME="$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WG, $OP)")"
  fi
done
