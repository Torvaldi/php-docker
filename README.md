# Dockerisation d'une application PHP

## A quoi s'attendre dans ce repo ?

Le but de ce repo est de montrer comment lancer une application minimaliste PHP dans un conteneur Docker.

Si vous lancer le repo tel quel, vous aurez une application PHP qui tourne sur un serveur Apache dans un conteneur Docker.

Vous pourrez y accéder à partir de l'URL [http://localhost:8080](http://localhost:8080).

## Commandes utiles

- `docker compose up -d --build` - Compile et lance les conteneurs Docker du fichier [docker-compose.yml](docker-compose.yml)

## Les fichiers à modifier / regarder

- [docker-compose.yml](docker-compose.yml) - Fichier de configuration de Docker Compose
- [Dockerfile](Dockerfile) - Fichier de compilation de l'image Docker
- [entrypoint.sh](entrypoint.sh) - Script d'entrée de l'image Docker
