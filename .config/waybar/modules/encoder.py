import json
import sys
with open('text.json', encoding='SHIFT_JIS') as f:
    d = json.loads(f.read().encode('SHIFT_JIS').decode())
print(d)
