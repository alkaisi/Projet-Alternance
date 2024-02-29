from flask import Flask, render_template
import subprocess
import mysql.connector.pooling
import concurrent
from concurrent.futures import ThreadPoolExecutor
import datetime

app = Flask(__name__)

# Création du pool de connexions à la base de données
db_connection_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="db_pool",
    pool_size=5,
    pool_reset_session=True,
    host='172.18.0.2',
    user='user',
    password='user',
    database='links'
)

def ping_host(ip):
    command = ['ping', '-c', '1', '-W', '1', ip]  # Timeout de 1 seconde pour le ping
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    ping_status = result.returncode
    last_successful_ping = None
    message = ""
    
    if ping_status == 0:
        last_successful_ping = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    else:
        message = result.stderr.decode('utf-8')
        
    return ping_status, last_successful_ping, message

def get_data_from_db(table_name):
    data = None
    connection = None
    cursor = None
    try:
        connection = db_connection_pool.get_connection()
        cursor = connection.cursor()
        query = f"SELECT nom_client, adresse_ip FROM {table_name}"
        cursor.execute(query)
        data = cursor.fetchall()
    except Exception as e:
        print("Error:", e)
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
    return data


def get_data_from_db_and_ping(table_name):
    data = get_data_from_db(table_name)
    if data is not None:
        ping_results = []
        for row in data:
            client_name, ip_address = row
            if ip_address:  # Vérifie si l'adresse IP n'est pas vide
                ping_status, last_successful_ping, message = ping_host(ip_address)
                if ping_status != 0:
                    reason = "Ping failed: " + message if message else "Ping failed"
                    last_ping = last_successful_ping if last_successful_ping else ""
                else:
                    reason = ""
                    last_ping = last_successful_ping if last_successful_ping else ""
                ping_results.append((client_name, ip_address, ping_status, reason, last_ping))

        ping_results.sort(key=lambda x: (x[2] == 0, x[2]))
        return table_name, ping_results
        
def custom_sort(results):
    def has_ip_address(result):
        for row in results[result]:
            if row[1]:
                return True
        return False
    
    tables_with_ip = [table for table in results if has_ip_address(table)]
    return sorted(tables_with_ip, key=has_ip_address, reverse=True)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/links')
def test_links():
    tables = ['4G', 'ADSL', 'A_FTTB', 'FIBRE_FTTE', 'FIBRE_OPTIQUE', 'FO_ASYMETRIQUE', 'FO_NOIRE', 'FTTB', 'FTTH', 'GTR', 'PAIRE_FO_NOIRE', 'SDLS_EFM', 'SDSL_ATM', 'VDSL', 'WIFI']
    results = {}
    with ThreadPoolExecutor(max_workers=10) as executor:
        future_to_table = {executor.submit(get_data_from_db_and_ping, table): table for table in tables}
        for future in concurrent.futures.as_completed(future_to_table):
            table_name = future_to_table[future]
            try:
                data = future.result()
                if data:
                    results[data[0]] = data[1]
            except Exception as e:
                print(f"Error processing {table_name}: {e}")

    sorted_tables = custom_sort(results)

    return render_template('links.html', results=results, sorted_tables=sorted_tables)

if __name__ == '__main__':
    app.run(debug=True, port=5000)
