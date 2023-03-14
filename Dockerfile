FROM php:apache

# Définition des variables d'environnement **PAR DEFAULT** pour la connexion à la base de données
ENV DATABASE_NAME=database
ENV DATABASE_USER=user
ENV DATABASE_PASSWORD=password
ENV DATABASE_HOST=host
ENV DATABASE_PORT=port

# D'aprés la documentation de l'image php:apache, on travaille dans le dossier /var/www/html
WORKDIR /var/www/html

# On copie les fichiers de notre application
COPY . .

# Installation des dépendances pour MYSQL
RUN docker-php-ext-install pdo pdo_mysql && apt update && apt install -y mariadb-client

# On défini notre utilisateur comme étant www-data (pour éviter les problèmes de droits)
USER www-data

# On s'assure que le script d'entrée est exécutable
RUN chmod +x entrypoint.sh

# On défini le point d'entrée de notre image Docker
ENTRYPOINT ["./entrypoint.sh"]