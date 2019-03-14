#/usr/bin/python

import requests

#print("hello world")


r = requests.get("http://127.0.0.1:8500//v1/kv/test/0?raw")
print(r.json())
