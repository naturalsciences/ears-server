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
echo "Starting Tomcat only when mysql is up"
while ! mysql -h "$host" -P "$port" -u "$user" -p"$password" -D "$database" -s -N -e "select count(*) from casino.event;" | grep -q 0
do
  echo "exit code $?"
  echo "mysql -h $host -P $port -u $user -p$password -D $database" | egrep .
  sleep 2
done
result=`mysql -h "$host" -P "$port" -u "$user" -p"$password" -D "$database" -s -N -e "select count(*) from casino.SEAAREA;"`
echo $result
>&2 echo "Postgres is populated - executing command"
exec $cmd
