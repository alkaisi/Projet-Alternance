#!/bin/bash

# Fonction pour ajouter un client
ajouter_client() {
    echo "Voici les tables disponibles :"
    mysql -h172.18.0.2 -u user -puser links -e "SHOW TABLES"
    echo "Choisissez une table en entrant son nom ou appuyez sur 'r' pour revenir en arrière :"
    read table_nom

    if [ "$table_nom" == "r" ]; then
        return
    fi

    echo "Entrez le nom du client :"
    read nom_client
    echo "Entrez l'adresse IP du client (laissez vide pour insérer une chaîne vide) :"
    read adresse_ip

    mysql -h172.18.0.2 -u user -puser links -e "INSERT INTO $table_nom (nom_client, adresse_ip) VALUES ('$nom_client', '${adresse_ip:-""}')"
    echo "Client ajouté avec succès à la table $table_nom"
}

# Fonction pour ajouter une table
ajouter_table() {
    echo "Entrez le nom de la nouvelle table :"
    read nom_table
    mysql -h172.18.0.2 -u user -puser links -e "CREATE TABLE $nom_table (id INT(11) NOT NULL AUTO_INCREMENT, nom_client VARCHAR(255) DEFAULT NULL, adresse_ip VARCHAR(15) DEFAULT NULL, PRIMARY KEY (id))"
    echo "Table $nom_table ajoutée avec succès"
}

# Fonction pour modifier le nom d'un client
modifier_nom_client() {
    echo "Voici les tables disponibles :"
    mysql -h172.18.0.2 -u user -puser links -e "SHOW TABLES"
    echo "Choisissez une table en entrant son nom :"
    read table_nom

    echo "Voici les clients dans la table $table_nom :"
    mysql -h172.18.0.2 -u user -puser links -e "SELECT id, nom_client FROM $table_nom"

    echo "Entrez l'ID du client que vous souhaitez modifier :"
    read client_id

    echo "Entrez le nouveau nom du client :"
    read nouveau_nom

    mysql -h172.18.0.2 -u user -puser links -e "UPDATE $table_nom SET nom_client='$nouveau_nom' WHERE id=$client_id"
    echo "Nom du client modifié avec succès"
}

# Fonction pour modifier l'adresse IP d'un client
modifier_ip_client() {
    echo "Voici les tables disponibles :"
    mysql -h172.18.0.2 -u user -puser links -e "SHOW TABLES"
    echo "Choisissez une table en entrant son nom :"
    read table_nom

    echo "Voici les clients dans la table $table_nom :"
    mysql -h172.18.0.2 -u user -puser links -e "SELECT id, nom_client, adresse_ip FROM $table_nom"

    echo "Entrez l'ID du client dont vous souhaitez modifier l'adresse IP :"
    read client_id

    echo "Entrez la nouvelle adresse IP du client (laissez vide pour insérer une chaîne vide) :"
    read nouvelle_ip

    if [ -z "$nouvelle_ip" ]; then
        nouvelle_ip='""'
    fi

    mysql -h172.18.0.2 -u user -puser links -e "UPDATE $table_nom SET adresse_ip=$nouvelle_ip WHERE id=$client_id"
    echo "Adresse IP du client modifiée avec succès"
}

# Fonction pour modifier le nom d'une table
modifier_table() {
    echo "Voici les tables disponibles :"
    mysql -h172.18.0.2 -u user -puser links -e "SHOW TABLES"
    echo "Entrez le nom de la table que vous souhaitez modifier :"
    read ancien_nom

    echo "Entrez le nouveau nom de la table :"
    read nouveau_nom

    mysql -h172.18.0.2 -u user -puser links -e "RENAME TABLE $ancien_nom TO $nouveau_nom"
    echo "Nom de la table modifié avec succès"
}

# Fonction pour supprimer un client
supprimer_client() {
    echo "Voici les tables disponibles :"
    mysql -h172.18.0.2 -u user -puser links -e "SHOW TABLES"
    echo "Choisissez une table en entrant son nom :"
    read table_nom

    echo "Voici les clients dans la table $table_nom :"
    mysql -h172.18.0.2 -u user -puser links -e "SELECT id, nom_client FROM $table_nom"

    echo "Entrez l'ID du client que vous souhaitez supprimer :"
    read client_id

    mysql -h172.18.0.2 -u user -puser links -e "DELETE FROM $table_nom WHERE id=$client_id"
    echo "Client supprimé avec succès"
}

# Fonction pour supprimer une table
supprimer_table() {
    echo "Voici les tables disponibles :"
    mysql -h172.18.0.2 -u user -puser links -e "SHOW TABLES"
    echo "Entrez le nom de la table que vous souhaitez supprimer :"
    read table_nom

    mysql -h172.18.0.2 -u user -puser links -e "DROP TABLE $table_nom"
    echo "Table supprimée avec succès"
}

# Fonction principale
while true; do
    echo "Menu principal :"
    echo "1. Ajouter"
    echo "2. Modifier"
    echo "3. Supprimer"
    echo "4. Quitter"
    read choix_principal

    case $choix_principal in
        1)
            while true; do
                echo "Menu Ajouter :"
                echo "1. Ajouter un client"
                echo "2. Ajouter une table"
                echo "3. Revenir en arrière"
                read choix_ajouter

                case $choix_ajouter in
                    1)
                        ajouter_client
                        ;;
                    2)
                        ajouter_table
                        ;;
                    3)
                        break
                        ;;
                    *)
                        echo "Choix invalide"
                        ;;
                esac
            done
            ;;
        2)
            echo "Menu Modifier :"
            echo "1. Modifier le nom d'un utilisateur"
            echo "2. Modifier l'adresse IP d'un utilisateur"
            echo "3. Modifier le nom d'une table"
            echo "4. Revenir en arrière"
            read choix_modifier

            case $choix_modifier in
                1)
                    modifier_nom_client
                    ;;
                2)
                    modifier_ip_client
                    ;;
                3)
                    modifier_table
                    ;;
                4)
                    ;;
                *)
                    echo "Choix invalide"
                    ;;
            esac
            ;;
        3)
            echo "Menu Supprimer :"
            echo "1. Supprimer un client"
            echo "2. Supprimer une table"
            echo "3. Revenir en arrière"
            read choix_supprimer

            case $choix_supprimer in
                1)
                    supprimer_client
                    ;;
                2)
                    supprimer_table
                    ;;
                3)
                    ;;
                *)
                    echo "Choix invalide"
                    ;;
            esac
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Choix invalide"
            ;;
    esac
done

