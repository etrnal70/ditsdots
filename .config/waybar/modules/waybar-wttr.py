#!/usr/bin/env python

# Based on https://gist.github.com/bjesus/f8db49e1434433f78e5200dc403d58a3
# Extra modification by etrnal70

import json
import os
import requests

WEATHER_CODES = {
    '113': ('☀️', 'weather-clear'),
    '116': ('⛅️', 'weather-few-clouds'),
    '119': ('☁️', 'weather-overcast'),
    '122': ('☁️', 'weather-overcast'),
    '143': ('🌫', 'weather-windy'),
    '176': ('🌦', 'weather-showers'),
    '179': ('🌧', 'weather-cattered'),
    '182': ('🌧', 'weather-cattered'),
    '185': ('🌧', 'weather-scattered'),
    '200': ('⛈', 'weather-storm'),
    '227': ('🌨', 'weather-showers'),
    '230': ('❄️', 'weather-snow'),
    '248': ('🌫', 'weather-windy'),
    '260': ('🌫', 'weather-windy'),
    '263': ('🌦', 'weather-showers-scattered'),
    '266': ('🌦', 'weather-showers-scattered'),
    '281': ('🌧', 'weather-showers-scattered'),
    '284': ('🌧', 'weather-showers-scattered'),
    '293': ('🌦', 'weather-showers-scattered'),
    '296': ('🌦', 'weather-showers-scattered'),
    '299': ('🌧', 'weather-showers-scattered'),
    '302': ('🌧', 'weather-showers-scattered'),
    '305': ('🌧', 'weather-showers-scattered'),
    '308': ('🌧', 'weather-showers-scattered'),
    '311': ('🌧', 'weather-showers-scattered'),
    '314': ('🌧', 'weather-showers-scattered'),
    '317': ('🌧', 'weather-showers-scattered'),
    '320': ('🌨', 'weather-showers'),
    '323': ('🌨', 'weather-showers'),
    '326': ('🌨', 'weather-showers'),
    '329': ('❄️', 'weather-snow'),
    '332': ('❄️', 'weather-snow'),
    '335': ('❄️', 'weather-snow'),
    '338': ('❄️', 'weather-snow'),
    '350': ('🌧', 'weather-showers-scattered'),
    '353': ('🌦', 'weather-showers-scattered'),
    '356': ('🌧', 'weather-showers-scattered'),
    '359': ('🌧', 'weather-showers-scattered'),
    '362': ('🌧', 'weather-showers-scattered'),
    '365': ('🌧', 'weather-showers-scattered'),
    '368': ('🌨', 'weather-showers'),
    '371': ('❄️', 'weather-snow'),
    '374': ('🌧', 'weather-showers-scattered'),
    '377': ('🌧', 'weather-showers-scattered'),
    '386': ('⛈', 'weather-storm'),
    '389': ('🌩', 'weather-storm'),
    '392': ('⛈', 'weather-storm'),
    '395': ('❄️', 'weather-snow')
}


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event] + " " + hour[event] + "%")
    return ", ".join(conditions)

def main():
    data = {}
    weather = requests.get("https://wttr.in/?format=j1").json()

    condition = weather['current_condition'][0]
    code = WEATHER_CODES[condition['weatherCode']]

    data['text'] = condition['temp_C'] + "°" + code[0]

    data[
        'tooltip'] = f"<b>{condition['weatherDesc'][0]['value']} {condition['temp_C']}°</b>\n"
    data[
        'tooltip'] += f"Feels like: {condition['FeelsLikeC']}°\n"
    data[
        'tooltip'] += f"Wind: {condition['windspeedKmph']}Km/h\n"
    data['tooltip'] += f"Humidity: {condition['humidity']}%"

    notify_title = f"{condition['weatherDesc'][0]['value']}"
    notify_text = f"Currently {condition['temp_C']}°. Feels like {condition['FeelsLikeC']}°\n\n"
    notify_text += f"Wind {condition['windspeedKmph']}Km/h\n"
    notify_text += f"Humidity {condition['humidity']}%"

    os.system(f"notify-send.sh '{notify_title}' '{notify_text}' -i {code[1]}")
    print(json.dumps(data))

if __name__ == "__main__":
    main()
