#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE TABLE games,teams;")

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # Insert data to teams from winner
    echo inserting team from winner
    QUERY="SELECT team_id from teams where name='$winner'"
    TEAM_ID=$($PSQL "$QUERY")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) values('$winner')")

      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1'  ]]
      then
        echo Inserted into teams: $winner
      fi

      TEAM_ID=$($PSQL "$QUERY");
    fi

    #insert data to teams of opponents
    echo inserting team from opponents
    QUERY="SELECT team_id from teams where name='$opponent'"
    TEAM_ID=$($PSQL "$QUERY")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) values('$opponent')")

      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1'  ]]
      then
        echo Inserted into teams: $opponent
      fi

      TEAM_ID=$($PSQL "$QUERY");
    fi
  fi
done

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id from teams where name='$winner'")
    OPPONENT_ID=$($PSQL "SELECT team_id from teams where name='$opponent'")
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($year,'$round',$WINNER_ID,$OPPONENT_ID,$winner_goals,$opponent_goals)")

    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then 
      echo Inserted into games $year $winner $opponent
    fi
  fi
done

