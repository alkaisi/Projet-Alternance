from flask import Flask, render_template, request, redirect, url_for, jsonify
import mysql.connector

app = Flask(__name__)

# Connexion à la base de données MySQL
db = mysql.connector.connect(
    host="172.18.0.2",
    user="user",
    password="user",
    database="links"
)

# Fonction pour vérifier l'existence d'une table
def table_exists(table_name):
    cursor = db.cursor()
    cursor.execute("SHOW TABLES LIKE %s", (table_name,))
    result = cursor.fetchone()
    cursor.close()
    return result is not None
    
@app.route('/get_clients')
def get_clients():
    table_nom = request.args.get('table_nom')
    cursor = db.cursor()
    cursor.execute("SELECT nom_client FROM {}".format(table_nom))
    clients = [client[0] for client in cursor.fetchall()]
    cursor.close()
    return jsonify(clients)

# Page d'accueil
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/ajouter')
def ajouter():
    return render_template('ajouter.html')
    
@app.route('/modifier')
def modifier():
    return render_template('modifier.html')
    
# Route pour afficher le menu de suppression
@app.route('/supprimer')
def supprimer():
    return render_template('supprimer.html')

# Page pour ajouter un client
@app.route('/ajouter/client', methods=['GET', 'POST'])
def ajouter_client():
    if request.method == 'POST':
        table_nom = request.form['table_nom']
        nom_client = request.form['nom_client']
        adresse_ip = request.form['adresse_ip']

        if not table_exists(table_nom):
            return "<span style='color: red;'>La table '{}' n'existe pas.</span>".format(table_nom)

        cursor = db.cursor()
        cursor.execute("SELECT COUNT(*) FROM {} WHERE nom_client = %s".format(table_nom), (nom_client,))
        nom_client_existe = cursor.fetchone()[0]

        if nom_client_existe > 0:
            return "<span style='color: red;'>Erreur : Le nom du client '{}' existe déjà dans la table {}.</span>".format(nom_client, table_nom)

        cursor.execute("INSERT INTO {} (nom_client, adresse_ip) VALUES (%s, %s)".format(table_nom), (nom_client, adresse_ip))
        db.commit()
        cursor.close()

        return "<span style='color: green;'>Client ajouté avec succès à la table {}</span>".format(table_nom)

    else:
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()

        return render_template('ajouter_client.html', tables=tables)

@app.route('/ajouter/table', methods=['GET', 'POST'])
def ajouter_table():
    if request.method == 'POST':
        nom_table = request.form['nom_table']

        # Vérifier si la table existe déjà
        cursor = db.cursor()
        cursor.execute("SHOW TABLES LIKE '{}'".format(nom_table))
        result = cursor.fetchone()

        if result:
            # La table existe déjà, afficher un message d'erreur en rouge
            return '<span style="color: red;">Erreur : la table {} existe déjà</span>'.format(nom_table)
        else:
            # Créer la table si elle n'existe pas encore
            cursor.execute("CREATE TABLE {} (id INT AUTO_INCREMENT PRIMARY KEY, nom_client VARCHAR(255), adresse_ip VARCHAR(15))".format(nom_table))
            db.commit()
            cursor.close()

            # Afficher un message de succès en vert
            return '<span style="color: green;">Table {} ajoutée avec succès</span>'.format(nom_table)

    else:
        return render_template('ajouter_table.html')
        
# Route pour afficher le formulaire de modification du nom du client
@app.route('/modifier/nom_client', methods=['GET', 'POST'])
def modifier_nom_client():
    if request.method == 'POST':
        # Récupérer les données du formulaire
        table_nom = request.form['table_nom']
        ancien_nom_client = request.form['ancien_nom_client']
        nouveau_nom_client = request.form['nouveau_nom_client']

        # Vérifier si le nouveau nom du client existe déjà dans la table
        cursor = db.cursor()
        cursor.execute("SELECT COUNT(*) FROM {} WHERE nom_client = %s".format(table_nom), (nouveau_nom_client,))
        nom_client_existe = cursor.fetchone()[0]

        if nom_client_existe > 0:
            return "<span style='color: red;'>Erreur : Le nouveau nom du client '{}' existe déjà dans la table {}.</span>".format(nouveau_nom_client, table_nom)

        # Modifier le nom du client dans la base de données
        cursor.execute("UPDATE {} SET nom_client = %s WHERE nom_client = %s".format(table_nom), (nouveau_nom_client, ancien_nom_client))
        db.commit()
        cursor.close()

        return "<span style='color: green;'>Nom du client modifié avec succès dans la table {}</span>".format(table_nom)

    else:
        # Récupérer la liste des tables depuis la base de données
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()

        return render_template('modifier_nom_client.html', tables=tables)

# Route pour afficher le formulaire de modification de l'adresse IP du client
@app.route('/modifier/ip_client', methods=['GET', 'POST'])
def modifier_ip_client():
    if request.method == 'POST':
        # Récupérer les données du formulaire
        table_nom = request.form['table_nom']
        nom_client = request.form['nom_client']
        nouvelle_adresse_ip = request.form['nouvelle_adresse_ip']

        # Modifier l'adresse IP du client dans la base de données
        cursor = db.cursor()
        cursor.execute("UPDATE {} SET adresse_ip = %s WHERE nom_client = %s".format(table_nom), (nouvelle_adresse_ip, nom_client))
        db.commit()
        cursor.close()

        return "<span style='color: green;'>Adresse IP du client modifiée avec succès dans la table {}</span>".format(table_nom)

    else:
        # Récupérer la liste des tables depuis la base de données
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()

        return render_template('modifier_ip_client.html', tables=tables)

# Route pour afficher le formulaire de modification du nom de la table
@app.route('/modifier/table', methods=['GET', 'POST'])
def modifier_table():
    if request.method == 'POST':
        # Récupérer les données du formulaire
        ancien_nom_table = request.form['ancien_nom_table']
        nouveau_nom_table = request.form['nouveau_nom_table']

        # Vérifier si le nouveau nom de la table existe déjà
        cursor = db.cursor()
        cursor.execute("SHOW TABLES LIKE %s", (nouveau_nom_table,))
        table_existe = cursor.fetchone()

        if table_existe:
            return "<span style='color: red;'>Erreur : Le nouveau nom de la table '{}' existe déjà.</span>".format(nouveau_nom_table)

        # Modifier le nom de la table dans la base de données
        cursor.execute("ALTER TABLE {} RENAME TO {}".format(ancien_nom_table, nouveau_nom_table))
        db.commit()
        cursor.close()

        return "<span style='color: green;'>Nom de la table modifié avec succès de {} à {}</span>".format(ancien_nom_table, nouveau_nom_table)

    else:
        # Récupérer la liste des tables depuis la base de données
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()

        return render_template('modifier_table.html', tables=tables)
        
# Route pour supprimer un client
@app.route('/supprimer/client', methods=['GET', 'POST'])
def supprimer_client():
    if request.method == 'POST':
        table_nom = request.form['table_nom']
        nom_client = request.form['nom_client']

        cursor = db.cursor()
        cursor.execute("DELETE FROM {} WHERE nom_client = %s".format(table_nom), (nom_client,))
        db.commit()
        cursor.close()

        return "<span style='color: green;'>Client supprimé avec succès de la table {}</span>".format(table_nom)

    else:
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()

        return render_template('supprimer_client.html', tables=tables)

# Route pour supprimer une table
@app.route('/supprimer/table', methods=['GET', 'POST'])
def supprimer_table():
    if request.method == 'POST':
        table_nom = request.form['table_nom']

        cursor = db.cursor()
        cursor.execute("DROP TABLE {}".format(table_nom))
        db.commit()
        cursor.close()

        return "<span style='color: green;'>Table {} supprimée avec succès</span>".format(table_nom)

    else:
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()

        return render_template('supprimer_table.html', tables=tables)

if __name__ == '__main__':
    app.run(debug=True, port=5001)


