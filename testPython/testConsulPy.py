import consul

c = consul.Consul()

index = 0
index, data = c.kv.get('test/2', index=index)
print data['Value']

#c.kv.put('test/2', 'bar2')

import json
from pprint import pprint

with open('consulJson.json') as f:
    data = json.load(f)

pprint(data['maps'])

json_data = json.dumps({
  "result":[
    {
      "run":[
        {
          "action":"stop"
        },
        {
          "foo":"bar"
        },
        {
          "hat":"start"
        }
      ],
      "find": "true"
    }
  ]
})

item_dict = json.loads(json_data)
print len(item_dict['result'][0]['run'])

jsonList = item_dict['result'][0]['run']

print(jsonList[0].value)


