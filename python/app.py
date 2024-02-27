from flask import Flask, render_template
import subprocess
import mysql.connector.pooling
import concurrent
from concurrent.futures import ThreadPoolExecutor
import datetime
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import re

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
    
# Fonction pour envoyer un email
def send_email(subject, body):
    sender_email = "support@dsl-network.fr"  # Modifier avec votre adresse email
    receiver_email = "support@dsl-network.fr"  # Modifier avec l'adresse email du destinataire
    password = "3185Joana"  # Modifier avec votre mot de passe

    message = MIMEMultipart()
    message["From"] = sender_email
    message["To"] = receiver_email
    message["Subject"] = subject
    message.attach(MIMEText(body, "plain"))

    try:
        server = smtplib.SMTP("smtp.office365.com", 587)
        server.starttls()
        server.login(sender_email, password)
        text = message.as_string()
        server.sendmail(sender_email, receiver_email, text)
        print("Email sent successfully!")
    except Exception as e:
        print(f"Error sending email: {e}")
    finally:
        server.quit()
        
# Fonction pour extraire le texte entre parenthèses
def extract_client_name(client_name):
    match = re.search(r'\((.*?)\)', client_name)
    if match:
        return match.group(1)
    else:
        return None
        
def check_status_change(previous_results, current_results):
    for table_name, current_data in current_results.items():
        previous_data = previous_results.get(table_name, [])
        for i, (client_name, ip_address, ping_status, reason, last_ping) in enumerate(current_data):
            previous_status = None
            if i < len(previous_data):
                previous_status = previous_data[i][2]
            if previous_status is not None and previous_status != ping_status:
                if ping_status == 0:
                    subject = f"{client_name} : Changement de statut - Liaison Up"
                    client_name_extracted = extract_client_name(client_name)
                    if client_name_extracted:
                        # Créer le lien avec le texte extrait du nom du client
                        client_link = "https://tinyurl.com/" + client_name_extracted
                        body = f"Le client avec l'adresse IP {ip_address} est maintenant Up.\n" \
                               f"Lien de client: {client_link}."
                    else:
                        # Si aucun texte n'est extrait, envoyer l'e-mail sans le lien
                        body = f"Le client avec l'adresse IP {ip_address} est maintenant Up."
                    send_email(subject, body)
                else:
                    # Check if the client transitioned from "Up" to "Down"
                    if previous_status == 0:
                        last_successful_ping = previous_data[i][4]
                        client_name_extracted = extract_client_name(client_name)
                        if client_name_extracted:
                            # Créer le lien avec le texte extrait du nom du client
                            client_link = "https://tinyurl.com/" + client_name_extracted
                            subject = f"{client_name} : Changement de statut - Liaison Down"
                            body = f"Le client avec l'adresse IP {ip_address} est maintenant Down.\n" \
                                   f"Dernier ping réussi: {last_successful_ping}.\n" \
                                   f"Lien de client: {client_link}."
                            send_email(subject, body)
                        else:
                            # Si aucun texte n'est extrait, envoyer l'e-mail sans le lien
                            subject = f"{client_name} : Changement de statut - Liaison Down"
                            body = f"La liaison {client_name} avec l'adresse IP {ip_address} est maintenant Down.\n" \
                                   f"Dernier ping réussi: {last_successful_ping}."
                            send_email(subject, body)

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
    
    # Vérification des changements de statut et envoi d'email en conséquence
    if 'previous_results' in globals():
        check_status_change(previous_results, results)
    globals()['previous_results'] = results.copy()

    return render_template('links.html', results=results, sorted_tables=sorted_tables)

if __name__ == '__main__':
    app.run(debug=True, port=5000)
