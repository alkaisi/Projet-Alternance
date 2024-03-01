#!/bin/bash

# Récupération de la date pour inclure dans le nom du fichier de sauvegarde
current_date=$(date +"%Y-%m-%d")

# Vérification si le jour est différent de samedi ou dimanche
day_of_week=$(date +"%u")
if [ $day_of_week -ne 6 ] && [ $day_of_week -ne 7 ]; then
    # Effectuer la sauvegarde de la base de données
    mysqldump --no-tablespaces -h 172.18.0.2 -u user -P 3306 -puser links > "/home/dsln/links/backup/backup_$current_date.sql"
fi

