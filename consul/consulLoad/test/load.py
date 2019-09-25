#!/user/bin/env python3
import json
import consul
import requests

c = consul.Consul()

filename = './values.json'

#Read JSON data into the datastore variable
if filename:
    with open(filename, 'r') as f:
        datastore = json.load(f)

#Use the new datastore datastructure
#print datastore

#for key in datastore.keys():
    ##if isinstance(datastore[key], datastore)== False:
    #print(key)

#print datastore['test'].keys()[0]

#top=datastore.keys()[0]
#print datastore[top]
#print top

#print len(datastore.values())

paths = []
values = []

jsonPath = ''

for key in datastore.keys():
    #if isinstance(datastore[key], datastore)== False:
    #print(datastore[key].keys())
    stringStart=key
    for x in (datastore[key].keys()):
        jsonPath = stringStart + '/' + x
        #print(datastore[key].values())
        print(jsonPath)
        paths.append(jsonPath)
        values.append(datastore[key][x])

print(paths)
print(values)
#jsonPath = key + '/' +

for x in range(len(paths)):
    c.kv.put(paths[x], values[x])

#print len(datastore[key].keys())

#print len(datastore.keys()[0])

#base=datastore.keys()[0] + '/'

#for x in range(len(datastore[key].keys())):
#    print(datastore[key].keys()[x])
#    print x

#print base
