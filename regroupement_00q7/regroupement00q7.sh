#!/usr/bin/bash

username=""
request=""

# Get arguments
while getopts u:r: args
do
    case "${args}" in
      u) username=${OPTARG};;
      r) request=${OPTARG};;
    esac
done

# Bad usage
if [ -z "$username" ] || [ -z "$request" ] || { [ "$request" != "create" ] && [ "$request" != "drop" ] && [ "$request" != "add_data" ]; }
then
  # USAGE
  cat<<'USAGE'

usage: regroupement00q7 -u [mysql_username] -r [request]

  [mysql_username]: Your mysql username.
    User should have permission to
      - create and drop db, tables, procedures.
      - Insert data

  [request]: Request to execute.
    - create
    - drop
    - add_data

USAGE

# Execute command
else
  case "$request" in
    create)
      echo "Creating DB"
      mysql -u "$username" -p < createDB.sql
      ;;
    drop)
      echo "Drop DB"
      mysql -u "$username" -p < dropDB.sql
      ;;
    add_data)
      echo "Add demo data"
      mysql -u "$username" -p < addDemoData.sql
      ;;
  esac
fi