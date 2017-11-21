#!/usr/bin/env python

import sys
import os.path
import Image

prefix = sys.argv[1]
scale = float(sys.argv[2])
paths = sys.argv[3:]

for path in paths:
	i = Image.open(path)
	scaled = i.transform(
		(int(i.size[0]/scale), int(i.size[1]/scale)),
		Image.AFFINE,
		(scale, 0, 0, 0, scale, 0))

	new_name = os.path.dirname(path) + "/" + prefix + os.path.basename(path)
	scaled.save(new_name)
