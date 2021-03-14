#!/usr/bin/bash

username=""
request=""
filename=""

# Get arguments
while getopts u:r:f: args
do
    case "${args}" in
      u) username=${OPTARG};;
      r) request=${OPTARG};;
      f) filename=${OPTARG};;
    esac
done

# Bad usage
if [ -z "$username" ] || \
   [ -z "$request" ] || \
   { [ "$request" != "create" ] && \
     [ "$request" != "drop" ] && \
     [ "$request" != "add_data" ] && \
     [ "$request" != "dump" ] && \
     [ "$request" != "create_from_dump" ]; } || \
   { [ "$request" = "dump" ] && \
     [ -z "$filename" ]; } || \
   { [ "$request" = "create_from_dump" ] && \
     [ -z "$filename" ]; }
then
  # USAGE
  cat<<'USAGE'

usage: regroupement00q7 -u [mysql_username] -r [request] -f [dump_filename]

  [mysql_username]: Your mysql username.
    User should have permission to
      - create and drop db, tables, procedures.
      - Insert data

  [request]: Request to execute.
    - create
    - drop
    - add_data
    - dump
    - create_from_dump

  [dump_filename]: Filename of the dump. Useful only when used with `-r dump`.

USAGE

# Execute command
else
  case "$request" in
    create)
      echo "Creating DB"
      mysql -u "$username" -p < create_db/createDB.sql
      ;;
    drop)
      echo "Dropping DB"
      mysql -u "$username" -p < dropDB.sql
      ;;
    add_data)
      echo "Adding demo data"
      mysql -u "$username" -p < data_demo/addDemoData.sql
      ;;
    dump)
      echo "Dumping DB"
      mysqldump -u "$username" -p --databases regroupement00q7 --routines > "$filename"
      ;;
    create_from_dump)
      echo "Creating DB from dump"
      mysql -u "$username" -p < "$filename"
      ;;
  esac
fi