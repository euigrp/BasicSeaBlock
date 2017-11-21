#!/usr/bin/env python2
import glob
from PIL import Image
import sys

do_sort = True

output = sys.argv[1]
size = [int(x) for x in sys.argv[2].split('x')]
locs = [tuple([int(x) for x in loc.split('x')]+[name]) for loc,name in [x.split(':') for x in sys.argv[3:]]]

img = Image.new("RGBA", size)
for x,y,path in locs:
	img.paste(Image.open(path), (x, y))

img.save(output)
