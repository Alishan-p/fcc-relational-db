#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

# print the services
# choose the services
# if not correct id
# send to main menu again

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My Salon, how can I help you?\n"
  SERVICES_OFFERED_RESULT=$($PSQL "SELECT * FROM services")
  echo "$SERVICES_OFFERED_RESULT" | while read SERVICE_ID BAR SERVICE_NAME
  do 
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # choose the service to perform
  read SERVICE_ID_SELECTED
  
  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "That is not a valid service number."
  else
    # verify validity of service id
    SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id=$SERVICE_ID_SELECTED")
    # service if not available
    if [[ -z $SERVICE_NAME ]]
    then
      # sent to main menu
      MAIN_MENU "Choose the correct service"
    else
      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # if customer doesn't exists
      if [[ -z $CUSTOMER_NAME ]]
      then
        # get new customer name
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/ //'), $(echo $CUSTOMER_NAME| sed 's/ //')?"

      read SERVICE_TIME

      APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $(echo $CUSTOMER_NAME| sed 's/ //')."

    fi
  fi
}

MAIN_MENU
