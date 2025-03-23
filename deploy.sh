#!/bin/bash

################################################################
#
# Description : déploiement à la volée de containers docker
#
# Auteur : Thfx31
#
# Date : 23.03.2025
#
################################################################

# Si create
if [ "$1" == "--create" ]; then

    # Définition du nombre de containers
    nb_container=1
    [  "$2" != "" ] && nb_container=$2

    # Création des containers
    echo "Début de la création du/des containers"
    echo""
    for i in $(seq 1 $nb_container); do
        docker run -tid --name $USER-alpine-$i alpine:latest
        echo "Création du container $USER-alpine-$i"
        echo""
    done

# Si drop
elif [ "$1" == "--drop" ]; then

    echo "Suppression des containers" 
    echo""   
    docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')
    echo""
    echo "Containers supprimés"

# Si info
elif [ "$1" == "--info" ]; then

    echo ""
    echo "l'option choisie est info"
    echo ""

# Si start
elif [ "$1" == "--start" ]; then

    echo ""
    echo "l'option choisie est start"
    echo ""

# Si ansible
elif [ "$1" == "--ansible" ]; then

    echo ""
    echo "l'option choisie est ansible"
    echo ""

# Si aucune option : affichage des options
else

echo "

Options :

   - --create : lancer des containers

   - --drop : supprimer les containers

   - --infos : caractéristique des containers (ip, nom, users, etc..)

   - --start : redémarrage des containers

   - --ansible : déploiement arborescence ansible
"

fi