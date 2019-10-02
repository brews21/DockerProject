#!/bin/bash
set -x
docker-compose up -d --build

echo "Sleeping while database comes up"
sleep 10s

docker exec django_postgres psql -U postgres -d postgres -f /tmp/scripts/01_createDB.sql

file="./scripts.txt"

ls image/scripts > $file

cat $file

while IFS= read line
do
  echo "Script --> $line"
  if [[ $line != "01_createDB.sql" ]]; then
    echo "Loading script $line"
    docker exec django_postgres psql -U postgres -d test -f /tmp/scripts/$line
  fi
done < "$file"


#docker exec postgres psql -U postgres -d postgres -f /tmp/scripts/01_createDB.sql
#docker exec postgres psql -U postgres -d test -f /tmp/scripts/02_setUp.sql
