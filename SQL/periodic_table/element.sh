#!/bin/bash

CALL=$1

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


NUMBER(){
  AVAILABLE_NUMBER=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number= properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$CALL;")
  if [[ -z $AVAILABLE_NUMBER ]]
  then 
    echo I could not find that element in the database.
  else
    
    echo "$AVAILABLE_NUMBER" | while read ATM_NUM BAR SYMBOL BAR NAME BAR ATM_NUM BAR ATM_MASS BAR MELT BAR BOIL BAR TID BAR TID BAR TYPE
    do
      echo -e "The element with atomic number $ATM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
}

SYMBOL(){
  AVAILABLE_SYMBOL=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number= properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id WHERE elements.symbol ILIKE '$CALL';")
  if [[ -z  $AVAILABLE_SYMBOL ]]
  then
    echo I could not find that element in the database.
  else
    echo "$AVAILABLE_SYMBOL" | while read ATM_NUM BAR SYMBOL BAR NAME BAR ATM_NUM BAR ATM_MASS BAR MELT BAR BOIL BAR TID BAR TID BAR TYPE
    do
      echo -e "The element with atomic number $ATM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
}

NAME(){
  AVAILABLE_NAME=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number= properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id WHERE elements.name ILIKE '$CALL';")
  if [[ -z  $AVAILABLE_NAME ]]
  then
    echo I could not find that element in the database.
  else
    echo "$AVAILABLE_NAME" | while read ATM_NUM BAR SYMBOL BAR NAME BAR ATM_NUM BAR ATM_MASS BAR MELT BAR BOIL BAR TID BAR TID BAR TYPE
    do
      echo -e "The element with atomic number $ATM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
}





CHECK_INPUT(){
  if [[  $CALL =~ ^[0-9]+$ ]]
  then
    #if a number
    NUMBER
  elif [[ ${#CALL} -le 2 ]]
  then
    #if a letter
    SYMBOL
  else
    #if a word
    NAME
  fi  
}


if [[ -z $CALL ]];
then 
    echo Please provide an element as an argument.
else
  CHECK_INPUT
fi

