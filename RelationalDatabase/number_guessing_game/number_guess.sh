#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(((RANDOM % 1000) + 1))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  USER_INSERT_RESPONSE=$($PSQL "INSERT INTO users(name) VALUES ('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
else
  #ToDo SELECT games_played and best_game from DB
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT guesses FROM games WHERE user_id = $USER_ID ORDER BY guesses LIMIT 1")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
GUESSES=0
while : ; do
  read GUESS
  RE='^[0-9]+'
  if [[ $GUESS =~ $RE ]]
  then
    ((GUESSES++))
    if [[ $GUESS == $RANDOM_NUMBER ]]
    then
      GAME_INSERT_RESPONSE=$($PSQL "INSERT INTO games(user_id, guesses) VALUES ($USER_ID, $GUESSES)")
      echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      break
    elif [[ $GUESS < $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done
