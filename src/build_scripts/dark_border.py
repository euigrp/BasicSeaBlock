#!/usr/bin/env python

import Image
import ImageEnhance
import sys

src=sys.argv[1]
dest=sys.argv[2]

si = Image.open(src)
shadow = ImageEnhance.Brightness(si).enhance(0)
end = Image.new("RGBA", si.size)

for dx in range(-1, 2):
	for dy in range(-1, 2):
		end.paste(shadow, (dx, dy), shadow)
end.paste(si, (0,0), si)

end.save(dest)
