#!/user/bin/env python3
import itertools
import json
import consul
import requests
import sys, os

c = consul.Consul()
filename = os.path.dirname(sys.argv[0]) + '/values.json'
paths=[]
values=[]
startString = ""
jsonPath = ""

#Read JSON data into the datastore variable
if filename:
    f = open(filename)
    datastore = json.load(f)
    f.close()


def print_dict(v, prefix=''):
    if isinstance(v, dict):
        for k, v2 in v.items():
            p2 = "{}/{}".format(prefix, k)
            print_dict(v2, p2)
    elif isinstance(v, list):
        for i, v2 in enumerate(v):
            p2 = "{}/{}".format(prefix, i)
            print_dict(v2, p2)
    else:
        paths.append(prefix[1:len(prefix)])
        values.append(v)

print_dict(datastore)

print(paths)
print(values)

for x in range(len(paths)):
     c.kv.put(paths[x], values[x])
