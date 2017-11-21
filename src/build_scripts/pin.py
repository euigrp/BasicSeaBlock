#!/usr/bin/env python2
from PIL import Image
import sys
import json

donkey = Image.open(sys.argv[1])
tail = Image.open(sys.argv[2])

# locations = [(float(x),float(y)) for x,y in [x.split(',') for x in sys.argv[4:]]]
locations = [json.loads(x) for x in sys.argv[4:]]

tw, th = tail.size

for spec in locations:
	x = spec.get('x', 0)
	y = spec.get('y', 0)
	dx = spec.get('dx', 0)
	dy = spec.get('dy', 0)
	cx = spec.get('cx', 1)
	cy = spec.get('cy', 1)

	for vy in range(cy):
		for vx in range(cx):
			donkey.paste(tail, (int(tw*(x+vx*dx)),int(th*(y+vy*dy))), tail)

donkey.save(sys.argv[3])
