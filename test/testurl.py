import requests

def create_short_url(long_url, alias=None):
    api_url = "http://tinyurl.com/api-create.php?url=" + long_url
    if alias:
        api_url += "&alias=" + alias
    response = requests.get(api_url)
    if response.status_code == 200:
        return response.text
    else:
        return None

def main():
    long_url = input("Veuillez entrer l'URL longue : ")
    alias = input("Veuillez entrer un numéro ou un identifiant pour l'URL raccourcie : ")
    short_url = create_short_url(long_url, alias)
    if short_url:
        print("URL raccourcie créée avec succès :", short_url)
    else:
        print("Une erreur s'est produite lors de la création de l'URL raccourcie.")

if __name__ == "__main__":
    main()

