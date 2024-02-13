# app.py
from flask import Flask, render_template
import subprocess
import mysql.connector
import threading

app = Flask(__name__)

# Fonction pour exécuter la commande ping
def ping_host(ip):
    command = ['ping', '-c', '1', ip]
    result = subprocess.run(command, stdout=subprocess.PIPE)
    return result.returncode

# Fonction pour se connecter à la base de données MySQL et récupérer les données
def get_data_from_db(table_name):
    connection = None
    data = None
    try:
        connection = mysql.connector.connect(
            host='172.18.0.2',
            user='user',
            password='user',
            database='links'
        )
        cursor = connection.cursor()
        query = f"SELECT nom_client, adresse_ip FROM {table_name}"
        cursor.execute(query)
        data = cursor.fetchall()
    except Exception as e:
        print("Error:", e)
    finally:
        if connection is not None and connection.is_connected():
            cursor.close()
            connection.close()
    return data

# Fonction pour récupérer les données de la base de données en utilisant un thread
def get_data_from_db_thread(table_name, results):
    data = get_data_from_db(table_name)
    if data is not None:
        ping_results = []
        for row in data:
            client_name, ip_address = row
            ping_status = ping_host(ip_address)
            ping_results.append((client_name, ip_address, ping_status))
        results[table_name] = ping_results

# Fonction de tri personnalisée pour vérifier la présence d'une adresse IP dans les résultats
def custom_sort(results):
    def has_ip_address(result):
        for row in results[result]:
            if row[1]:
                return True
        return False
    
    tables_with_ip = [table for table in results if has_ip_address(table)]
    return sorted(tables_with_ip, key=has_ip_address, reverse=True)

# Route pour afficher les résultats
@app.route('/')
def index():
    return render_template('index.html')

# Route pour tester les liens
@app.route('/links')
def test_links():
    tables = ['4G', 'ADSL', 'A_FTTB', 'FIBRE_FTTE', 'FIBRE_OPTIQUE', 'FO_ASYMETRIQUE', 'FO_NOIRE', 'FTTB', 'FTTH', 'GTR', 'PAIRE_FO_NOIRE', 'SDLS_EFM', 'SDSL_ATM', 'VDSL', 'WIFI']
    results = {}
    threads = []
    for table in tables:
        thread = threading.Thread(target=get_data_from_db_thread, args=(table, results))
        threads.append(thread)
        thread.start()

    # Attendre la fin de tous les threads
    for thread in threads:
        thread.join()

    # Trier les résultats en fonction de la présence d'une adresse IP
    sorted_tables = custom_sort(results)

    return render_template('links.html', results=results, sorted_tables=sorted_tables)

if __name__ == '__main__':
    app.run(debug=True)

