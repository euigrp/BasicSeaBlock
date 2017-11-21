#!/usr/bin/env python2
import glob
from PIL import Image
import sys

do_sort = True

args = sys.argv[1:]

while args[0].startswith("-"):
	if args[0] == "--no-sort":
		do_sort = False
	args = args[1:]

per_row = int(args[0])
outname = args[1]
if do_sort:
		images = sorted(args[2:])
else:
		images = args[2:]

rows_names = []
while images:
	rows_names.append(images[:per_row])
	images = images[per_row:]

row_images = []
for row_names in rows_names:
	images = []
	for name in row_names:
		images.append(Image.open(name))

	max_height=0
	total_width=0
	for img in images:
		w,h = img.size
		total_width += w
		max_height=max(max_height, h)
	row_img = Image.new("RGBA", (total_width, max_height))
	cursor = 0
	for img in images:
		row_img.paste(img, (cursor, 0))
		cursor += img.size[0]
	row_images.append(row_img)

max_width = 0
total_height = 0
for img in row_images:
	w,h = img.size
	total_height += h
	max_width = max(w, max_width)

whole = Image.new("RGBA", (max_width, total_height))
cursor = 0
for img in row_images:
	whole.paste(img, (0, cursor))
	cursor += img.size[1]

whole.save(outname)
