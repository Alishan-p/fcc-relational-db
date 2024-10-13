#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

MAIN_MENU() {
  # fetch user detail with username
  USER_DETAILS=$($PSQL "SELECT user_id,total_games_played,best_game_guesses FROM users where username='$USERNAME'")
  # if not found
  if [[ -z $USER_DETAILS ]]
  then  
    # create new
    NEW_USER_INSERT=$($PSQL "INSERT INTO users(username,total_games_played,best_game_guesses) values('$USERNAME',0,-1)")
    if [[ $NEW_USER_INSERT == 'INSERT 0 1' ]]
    then
      USER_ID=$($PSQL "SELECT user_id FROM users where username='$USERNAME'")
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      GAME_MENU $USER_ID
    fi
  else
    IFS='|' read USER_ID TOTAL_GAMES_PLAYED BEST_GAME_GUESSES <<< "$USER_DETAILS"
    echo "Welcome back, $USERNAME! You have played $TOTAL_GAMES_PLAYED games, and your best game took $BEST_GAME_GUESSES guesses."
    GAME_MENU $USER_ID
  fi
}

GAME_MENU() {
  USER_ID=$1
  SECRET_NUMBER=$(($RANDOM%(1000)+1))
  NUMBER_OF_GUESSES=0
  echo -e "\nGuess the secret number between 1 and 1000:"
  while true
  do
    read NUMBER
    if [[ ! $NUMBER =~ ^[0-9]+$ ]] 
    then
      echo "That is not an integer, guess again:"
    elif [[ $NUMBER == $SECRET_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
      UPDATE_GAME_TABLE $USER_ID $NUMBER_OF_GUESSES
      break;
    elif [[ $NUMBER > $SECRET_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
      echo "It's lower than that, guess again:"
    else
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
      echo "It's higher than that, guess again:"
    fi
  done
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

UPDATE_GAME_TABLE() {
  USER_ID=$1
  NUMBER_OF_GUESSES=$2

  USER_DETAILS=$($PSQL "SELECT total_games_played, best_game_guesses FROM users WHERE user_id=$USER_ID")
  IFS='|' read TOTAL_GAMES_PLAYED BEST_GAME_GUESSES <<< "$USER_DETAILS"

  # Increment the total number of games played
  TOTAL_GAMES_PLAYED=$(($TOTAL_GAMES_PLAYED + 1))

  # Update best_game_guesses if the current guesses are fewer
  if [[ $BEST_GAME_GUESSES == -1 || $NUMBER_OF_GUESSES -lt $BEST_GAME_GUESSES ]]
  then
    UPDATE_USER=$($PSQL "UPDATE users SET total_games_played=$TOTAL_GAMES_PLAYED, best_game_guesses=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
  else
    UPDATE_USER=$($PSQL "UPDATE users SET total_games_played=$TOTAL_GAMES_PLAYED WHERE user_id=$USER_ID")
  fi

  # Insert the current game details
  INSERT_GAME_DETAILS=$($PSQL "INSERT INTO game(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
}

MAIN_MENU
