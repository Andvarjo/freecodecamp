#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


MAIN(){
  echo Enter your username:

  read USER

  AVAILABLE_USER=$($PSQL "SELECT * FROM users WHERE user_name='$USER'")
  if [[ -z $AVAILABLE_USER ]]
  then
    echo Welcome, $USER! It looks like this is your first time here.
    INSERT_USER=$($PSQL "INSERT INTO users(user_name,games_played) VALUES ('$USER',0)")
    GUESS
  else
    USER_NAME=$($PSQL "SELECT user_name FROM users WHERE user_name='$USER';")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_name='$USER';")
    BT_GAME=$($PSQL "SELECT best_game FROM users WHERE user_name='$USER';")
    echo -e  "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BT_GAME guesses."
    
    GUESS
  fi
}

GUESS(){
  NUMBER=$(($RANDOM%10 +1 ))
  
  echo -e "\nGuess the secret number between 1 and 1000:"
  TRIES=1
  while :
  do
    read GUESS
    if [ $GUESS -gt $NUMBER ]
    then
     echo -e "\nIt's lower than that, guess again:"
    elif [ $GUESS -lt $NUMBER ]
    then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ ! "$GUESS" =~ ^-?[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    elif [ $GUESS -eq $NUMBER ]
    then
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
      GAME_POINTS
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE user_name='$USER';")
      break
    fi
    TRIES=$((TRIES+ 1))
  done
  
}


GAME_POINTS(){

  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_name='$USER'; ")
  
  if [[ -z $BEST_GAME ]]
  then
    NEW_BEST_GAME=$($PSQL "UPDATE users SET best_game=$TRIES WHERE user_name='$USER';")
  elif [ $BEST_GAME -gt $TRIES ]
  then
    NEW_BEST_GAME=$($PSQL "UPDATE users SET best_game=$TRIES WHERE user_name='$USER';")
    
  fi
  
}


MAIN