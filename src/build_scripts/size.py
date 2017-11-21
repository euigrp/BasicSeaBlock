import bpy
import sys
import argparse
import json

p = argparse.ArgumentParser()
p.add_argument('-x', default=256)
p.add_argument('-y', default=256)
p.add_argument('--format', default='PNG')
p.add_argument('--samples', default=128)
p.add_argument('--no-anim', action='store_true', default=False)
p.add_argument('--obj-prop', action='append', default=[])
p.add_argument('--scene-prop', action='append', default=[])

if '--' in sys.argv:
	args = p.parse_args(sys.argv[sys.argv.index('--')+1:])
else:
	args = p.parse_args([])

print ('args', args)

for scene in bpy.data.scenes:
		scene.render.resolution_x = int(args.x)
		scene.render.resolution_y = int(args.y)
		scene.render.image_settings.file_format = args.format
		scene.cycles.samples = int(args.samples)

		for spec in args.scene_prop:
				path, value = spec.split('=')
				parts = path.split('.')
				path = parts[:-1]
				prop_name = parts[-1]

				value = eval(value)
				obj = scene

				for name in path:
					obj = obj.__getattribute__(name)

				obj.__setattr__(prop_name, value)

bpy.context.scene.render.resolution_x = int(args.x)
bpy.context.scene.render.resolution_y = int(args.y)

print ('no anim', args.no_anim)

if args.no_anim:
	bpy.context.scene.render.use_file_extension = False

for spec in args.obj_prop:
	path, value = spec.split('=')
	parts = path.split('.')
	obj_name = parts[0]
	path = parts[1:-1]
	prop_name = parts[-1]

	value = eval(value)
	obj = bpy.data.objects[obj_name]

	for name in path:
		obj = obj.__getattribute__(name)

	obj.__setattr__(prop_name, value)

bpy.ops.render.render(animation=(not args.no_anim))
