#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  WHERE=""
  RE='^[0-9]+'
  if [[ $1 =~ $RE ]]
  then
    WHERE="WHERE atomic_number = $1"
  else
    WHERE="WHERE symbol = '$1' OR name = '$1'"
  fi
  ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) $WHERE")
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    IFS='|' read -a VALUES <<< "$ELEMENT"
    echo "The element with atomic number ${VALUES[1]} is ${VALUES[3]} (${VALUES[2]}). It's a ${VALUES[7]}, with a mass of ${VALUES[4]} amu. ${VALUES[3]} has a melting point of ${VALUES[5]} celsius and a boiling point of ${VALUES[6]} celsius."
  fi
fi