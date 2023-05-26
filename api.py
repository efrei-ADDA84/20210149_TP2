import os
import requests
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def get_weather():
    lat = request.args.get('lat')
    lon = request.args.get('lon')
    API_KEY = os.environ.get('API_KEY')
    url = f'http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API_KEY}&units=metric'
    response = requests.get(url)
    data = response.json()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081) 
