#!/bin/bash
# wait-for-mysql.sh

set -e

host="$1"
port="$2"
user="$3"
password="$4"
database="$5"
shift 5
cmd="$@"

#wait populate script

while ! mysql -h "$host" -P "$port" -u "$user" -p"$password" -D "$database" -e "select * from casino.event;" | grep -q 1
do
  echo "mysql -h $host -P $port -u $user -p$password -D $database" | egrep .
  sleep 5
done
>&2 echo "Postgres is populated - executing command"
exec $cmd
