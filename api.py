import os
import requests

lat = os.environ.get('LAT')
#on recupere la variable d environnement LAT
lon = os.environ.get('LONG')
#on recupere la variable d environnement LONG
key = os.environ.get('API_KEY')
#on recupere la variable d environnement API_KEY

url = f'http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={key}&units=metric'
response = requests.get(url)
#on utilise la bibliotheque python REQUESTS pour envoyer une requete a API Weather en utilisant, dans l URL, la latitude, la longitude et l API fournis par l utilisateur

data = response.json()
# on recupere le corps de la reponse HTTP en tant qu objet JSON

print(data)
#on affiche l element JSON ainsi obtenu
