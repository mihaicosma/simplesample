#!/bin/bash

########## V A R I A B L E S    D E F I N I T I O N  #########
echo "Defining variables to use..."

tmpfile=$(mktemp)
declare -p > "$tmpfile"

WAR_FILE="SampleWebApp.war"
PROJECT_NAME="mihai"

declare -p | diff "$tmpfile" -
rm -f "$tmpfile"

echo
echo
read -p "Press enter to continue, CTRL+C to stop the execution..."

########## DEPLOY TEMPLATE
echo
echo "Creating/Modifying Jmeter in the CI/CD project..."
oc process -f app-template.yaml -p WAR_FILE="$WAR_FILE"  | oc apply -n "$PROJECT_NAME" -f - 

########## P R O C E S S    C O M P L E T E D
echo
echo
echo "Process finished!!! Review the log for errors."
