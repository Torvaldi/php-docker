#!/bin/bash

# On récupère l'information afin de savoir si la base de données est prête
nbTableFound=$(mysql -u$DATABASE_USER -h$DATABASE_HOST -p$DATABASE_PASSWORD $DATABASE_NAME -s -N -e "SELECT COUNT(TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_NAME = 'todo';")

# Tant que la base de données n'est pas prête, on attend
while [ $? -ne 0 ]; do
    echo "Waiting for database to be ready..."
    sleep 1
    nbTableFound=$(mysql -u$DATABASE_USER -h$DATABASE_HOST -p$DATABASE_PASSWORD $DATABASE_NAME -s -N -e "SELECT COUNT(TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_NAME = 'todo';")
done

# Si la table n'existe pas, on la crée
if [ $nbTableFound -eq 0 ]; then
    mysql -u$DATABASE_USER -h$DATABASE_HOST -p$DATABASE_PASSWORD $DATABASE_NAME -e "CREATE TABLE todo (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255), done BOOLEAN);"
fi

# On lance le serveur apache
apache2-foreground