#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams,games")

cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  #INSERT TEAMS NAMES
  if [[ $WINNER != winner ]]
  then
    # get winner name
    TEAM=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $TEAM ]]
    then
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
      
    fi
  fi

  if [[ $OPPONENT != opponent ]]
  then
    # get winner name
    TEAM=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")

    # if not found
    if [[ -z $TEAM ]]
    then
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
      
    fi
  fi
  #INSERT RESULTS

  #INSERT YEAR
    
done

cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  if [[ $YEAR != year ]]
    then
    #GET WINNER ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    
    #GET OPPONENT ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    #INSERT DATA
    echo $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
    INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  fi

done