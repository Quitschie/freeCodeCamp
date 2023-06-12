#! /bin/bash

PSQL="psql -X -A --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_ID_SELECTED=0
SERVICE=''
# select service
while : ; do
  # print services
  echo -e "\n -~ AVAILABLE SERVICES ~-"
  SERVICES=$($PSQL "SELECT * FROM services")
  echo $SERVICES | tr " " "\n" | tr "|" " " | while read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  #read service
  echo -e "\nWhich service would you like?"
  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE ]]
  then
    echo -e "\n== Service not found =="
  else
    break
  fi
done

# read customer phone
echo -e "\nEnter your phone-number:"
read CUSTOMER_PHONE

# resolve customer
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nEnter your name:"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESPONSE=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# read time
echo -e "\nWhen do you need that service?"
read SERVICE_TIME

#create appointment
INSERT_APPOINTMENT_RESPONSE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
