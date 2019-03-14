#/usr/bin/python

import requests

#print("hello world")


r = requests.get("http://localhost:8500/v1/kv?recurse")
print(r.json())
