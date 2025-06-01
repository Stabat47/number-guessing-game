#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

#does user exist?
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
 #add new user to db
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME="null"
else
  
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  echo
fi

# Generate secret number 1-1000
SECRET=$(( RANDOM % 1000 + 1 ))
NUM_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS

  # Validate input is integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUM_GUESSES++))

  if (( GUESS == SECRET )); then
    echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET. Nice job!"

    ((GAMES_PLAYED++))

    if [[ "$BEST_GAME" == "null" || $NUM_GUESSES -lt $BEST_GAME ]]; then
      BEST_GAME=$NUM_GUESSES
    fi

    # Update user stats in database
    $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID"

    break
  elif (( GUESS > SECRET )); then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done
