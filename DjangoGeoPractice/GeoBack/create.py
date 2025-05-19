import requests
from django.contrib.gis.geos import Polygon
import json


API_URL = "http://127.0.0.1:8000/api/buildings/"


d = {"geom": {"type": '', "coordinates":''}}
x = 0
y = 1

for i in range (10):
    p = Polygon(((x, x), (y, y), (x, y), (x, x)), srid=4326)
    d["geom"]["type"] = p.geom_type
    d["geom"]["coordinates"] = p.coords
    res = requests.post(API_URL + '', json=d)
    assert res.status_code == 201
    x += 2
    y += 2

def test_list_buildings():
    res = requests.get(API_URL + '')
    assert res.status_code == 200
    data = res.json()
    return data

print("Buildings created")
for i in test_list_buildings()["features"]:
    print(i)


