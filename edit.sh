#!/bin/bash

# Créez un environnement virtuel
# python3 -m venv env_vir

# Activez l'environnement virtuel
source env_vir/bin/activate

# Exécutez docker-compose
docker-compose up -d

# pip install Flask

# pip install mysql-connector

# pip install mysql-connector-python

# Exécutez l'application Flask
python3 python/edit/app.py
