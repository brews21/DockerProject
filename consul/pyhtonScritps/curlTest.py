#!/user/bin/env python3

import requests

r = requests.get('http://localhost:8500/v1/kv/test/testing?raw')
print(r.json())
