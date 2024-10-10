#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PRINT_ELEMENT_DETAILS () {
  ATOMIC_NUMBER=$1
  # if not found
  if [[ -z $ATOMIC_NUMBER ]]
  then
    # echo message
    echo "I could not find that element in the database."
  else 
    # print the element details
    ELEMENT_DETAILS=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
    IFS='|'
    read type_id atomic_number symbol name atomic_mass melting_point boiling_point type <<< "$ELEMENT_DETAILS"
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
  fi
}

INPUT=$1
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
elif [[ $INPUT =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$INPUT");
  PRINT_ELEMENT_DETAILS $ATOMIC_NUMBER
else
  # find the element with atomic_number
  ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$INPUT' OR name='$INPUT'");
  PRINT_ELEMENT_DETAILS $ATOMIC_NUMBER
fi
