#!/bin/bash

nbTableFound=$(mysql -u$DATABASE_USER -h$DATABASE_HOST -p$DATABASE_PASSWORD $DATABASE_NAME -s -N -e "SELECT COUNT(TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_NAME = 'todo';")

while [ $? -ne 0 ]; do
    echo "Waiting for database to be ready..."
    sleep 1
    nbTableFound=$(mysql -u$DATABASE_USER -h$DATABASE_HOST -p$DATABASE_PASSWORD $DATABASE_NAME -s -N -e "SELECT COUNT(TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_NAME = 'todo';")
done

if [ $nbTableFound -eq 0 ]; then
    mysql -u$DATABASE_USER -h$DATABASE_HOST -p$DATABASE_PASSWORD $DATABASE_NAME -e "CREATE TABLE todo (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255), done BOOLEAN);"
fi

apache2-foreground