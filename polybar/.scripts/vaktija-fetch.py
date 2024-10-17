import requests
from bs4 import BeautifulSoup
import json
import re
from datetime import datetime
import sys


def fetch_prayer_times(url):
        try:
            with open('vaktija.json', 'r') as openfile:
                prayer_times = json.load(openfile)
        except OSError:
                prayer_times = None

        date = datetime.now().strftime("%d/%m/%Y")

        if prayer_times == None or prayer_times["date"] != date :
            response = requests.get(url)
            
            if response.status_code == 200:
                soup = BeautifulSoup(response.content, 'html.parser')
                regex = '{"fajr":.*"isha":"\\d{2}:\\d{2}:\\d{2}"}'
                script_tag = soup.find('script', string=re.compile(regex))

                if script_tag:
                    json_text = re.search(regex, script_tag.string).group()
                    prayer_times = json.loads(json_text)
                    prayer_times["date"] = date

                    with open("vaktija.json", "w") as outfile:
                            outfile.write(json.dumps(prayer_times))

        return prayer_times

url = 'https://vaktija.eu/graz'  
prayer_times = fetch_prayer_times(url)

try:
        arg = sys.argv[1]
        prayer_string = prayer_times[arg]
        prayer_string = prayer_string[:-3] 
        print(prayer_string)
except:
        arg = "Done"






