#!/bin/sh

echo "Waiting for MySQL to be ready..."

# Wait for MySQL to become available
until nc -z -v -w30 mysql 3306
do
  echo "Waiting for MySQL..."
  sleep 5
done

echo "MySQL is up. Starting Tomcat..."

# Start Tomcat
exec catalina.sh run
