require ("util")

function entlayer(options)
	local d = {
		frame_count = options.frame_count,
		filename = "__BasicSeaBlock__/graphics/entity/sr-" .. options.name .. ".png",
		width = options.width / 2,
		height = options.height / 2,
		scale = 1.0,
		x = options.x / 2,
		y = options.y / 2,
		shift = options.shift,
		hr_version = {
			frame_count = options.frame_count,
			filename = "__BasicSeaBlock__/graphics/entity/" .. options.name .. ".png",
			width = options.width,
			height = options.height,
			scale = 0.5,
			x = options.x,
			y = options.y,
			shift = options.shift,
		}
	}

	for _, opt in ipairs({"priority", "draw_as_shadow", "animation_speed", "run_mode", "line_length"}) do
		if options[opt] then
			d[opt] = options[opt]
			d.hr_version[opt] = options[opt]
		end
	end

	return d
end

data:extend({

{
	type = "assembling-machine",
	name = "algae-farm",
	icon = "__BasicSeaBlock__/graphics/icons/algae-farm.png",
	flags = {"placeable-neutral","placeable-player", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "algae-farm"},
	max_health = 300,
	corpse = "big-remnants",
	dying_explosion = "medium-explosion",
	collision_box = {{-1.45, -1.45}, {1.45, 1.45}},
	selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	order = "s-e-w-f",
	module_specification =
	{
		module_slots = 3
	},
	allowed_effects = {"consumption", "speed", "productivity", "pollution"},

	animation = (function() 
		local ret = {}
		local directions = {"north", "west", "south", "east"}

		for i, dir in ipairs(directions) do
			ret[dir] = {
				layers = {
					entlayer({
						frame_count = 1,
						name="af",
						priority = "high",
						width = 256,
						height = 256,
						scale = 0.5,
						x = 1024+256*(i-1),
						y = 1024,
						shift = util.by_pixel(0, -0),
					}),
					entlayer({
						frame_count = 1,
						draw_as_shadow = true,
						name = "af",
						priority = "high",
						width = 256,
						height = 256,
						scale = 0.5,
						x = 0+256*(i-1),
						y = 1024,
						shift = util.by_pixel(0, -0),
					})
				}
			}
		end

		return ret
	end)(),
	working_visualisations = {
	(function()
		local ret = {}
		local directions = {"north", "west", "south", "east"}

		for i, dir in ipairs(directions) do
			ret[dir.."_animation"]= {
				priority="medium",
				frame_count = 8,
				filename = "__BasicSeaBlock__/graphics/entity/af.png",
				width = 256,
				height = 256,
				x = 0,
				y = 0 + 256 * (i-1),
				scale=0.5,
				animation_speed = 0.10,
				run_mode = "forward-then-backward",
			}
		end
		return ret
	end)()},
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	working_sound = {
		sound = {
			{
			  filename = "__base__/sound/chemical-plant.ogg",
			  volume = 0.8
			}
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
		apparent_volume = 1.5,
	},
	crafting_speed = 1.00,
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
	},
	energy_usage = "100kW",
	ingredient_count = 1,
	crafting_categories = {"algaefarming"},
	fluid_boxes = {
		{
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = -1,
			pipe_connections = {{ type="input", position = {0, 2} }}
		},
		{
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = -1,
			pipe_connections = {{ type="input", position = {2, 0} }}
		},
		{
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = 1,
			pipe_connections = {{ type="output", position = {0, -2} }}
		},
	}
},

{
	type = "assembling-machine",
	name = "filtration-plant",
	icon = "__BasicSeaBlock__/graphics/icons/filtration-plant.png",
	flags = {"placeable-neutral","placeable-player", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "filtration-plant"},
	max_health = 300,
	corpse = "big-remnants",
	dying_explosion = "medium-explosion",
	collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
	selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	order = "s-e-w-f",
	module_specification =
	{
		module_slots = 3
	},
	allowed_effects = {"consumption", "speed", "productivity", "pollution"},

	animation = (function() 
		local ret = {}
		local directions = {"north", "west", "south", "east"}

		for i, dir in ipairs(directions) do
			ret[dir] = {
				layers = {
					entlayer({
						name = "fm",
						priority = "high",
						width = 256,
						height = 256,
						frame_count = 1,
						scale = 0.5,
						x = 0 + 256 * (i-1),
						y = 512,
						shift = util.by_pixel(0, -0),
					}),
					entlayer({
						draw_as_shadow = true,
						name = "fm",
						width = 256,
						height = 256,
						frame_count = 1,
						scale = 0.5,
						x = 0 + 256 * (i-1),
						y = 768,
						shift = util.by_pixel(0, -0),
					})
				}
			}
		end
		return ret
	end)(),
	working_visualisations = (function()
		local anims = {}
		local directions = {"north", "west", "south", "east"}

		for i, dir in ipairs(directions) do
			anims[dir.."_animation"] = entlayer({
				name = "fm",
				frame_count = 8,
				width = 128,
				height = 128,
				x = 0,
				y = 0 + 128 * (i-1),
				scale=0.5,
				animation_speed = 0.25,
				run_mode = "forward-then-backward",
				shift = util.by_pixel(0, -29),
			})
		end
		return {anims}
	end)(),
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	working_sound = {
		sound = {
			{
				filename = "__base__/sound/chemical-plant.ogg",
				volume = 0.8
			}
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
		apparent_volume = 1.5,
	},
	crafting_speed = 1.00,
	energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
	},
	energy_usage = "600kW",
	ingredient_count = 1,
	crafting_categories = {"filtering"},
	fluid_boxes = {
		{
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = -1,
			pipe_connections = {{ type="input", position = {0, -2} }}
		},
		{
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			base_level = 1,
			pipe_connections = {{ position = {0, 2} }}
		}
	}
},

{
	type = "assembling-machine",
	name = "pressure-furnace",
	icon = "__BasicSeaBlock__/graphics/icons/pressure-furnace.png",
	flags = {"placeable-neutral","placeable-player", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "pressure-furnace"},
	max_health = 300,
	corpse = "big-remnants",
	dying_explosion = "medium-explosion",
	collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
	selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
	fluid_boxes = {
		{
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			base_level = 1,
			pipe_connections = {{ position = {-2, -3} }}
		},
		{
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			base_level = -1,
			pipe_connections = {{ position = {-2, 3} }}
		}
	},
	order = "s-e-w-f",
	module_specification = {
		module_slots = 3
	},
	allowed_effects = {"consumption", "speed", "productivity", "pollution"},
	animation = (function()
		local directions= {"north", "east", "south", "west"}
		local ret = {}
		for i,dir in ipairs(directions) do
			ret[dir] = {
				layers = {
					entlayer({
						priority = "extra-high",
						width = 384,
						height = 384,
						line_length = 1,
						shift = util.by_pixel(0, 0),
						name = "pf",
						frame_count = 1,
						scale=0.5,
						y=1536, x=0 + 384 * (i-1),
					}),
				}
			}
		end
		return ret
	end)(),
	working_visualisations =
	{
		{
			animation = entlayer({
				x = 0,
				y = 0,
				width = 384,
				height = 384,
				line_length = 5,
				shift = util.by_pixel(0, 0),
				name = "pf",
				frame_count = 20,
				animation_speed = 0.35,
				scale=0.5
			}),
		}
	},
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	working_sound = {
		sound = {
			{
				filename = "__base__/sound/chemical-plant.ogg",
				volume = 0.8
			}
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
		apparent_volume = 1.5,
	},
	crafting_speed = 1.00,
	energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
	},
	energy_usage = "2500KW",
	ingredient_count = 1,
	crafting_categories = {"pressure-furnace"},
},
{
	type = "assembling-machine",
	name = "borehole-mine",
	icon = "__BasicSeaBlock__/graphics/icons/bm.png",
	flags = {"placeable-neutral","placeable-player", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "borehole-mine"},
	max_health = 300,
	corpse = "big-remnants",
	dying_explosion = "medium-explosion",
	collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
	selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
	order = "s-e-w-f",
	module_specification = {
		module_slots = 3
	},
	allowed_effects = {"consumption", "speed", "productivity", "pollution"},
	animation = (function()
		local directions= {"north", "east", "south", "west"}
		local ret = {}
		for i,dir in ipairs(directions) do
			ret[dir] = {
				layers = {
					entlayer({
						priority = "extra-high",
						width = 384,
						height = 384,
						line_length = 1,
						shift = util.by_pixel(0, 0),
						name = "bm",
						frame_count = 1,
						scale=0.5,
						y=1152, x=384,
					}),
					entlayer({
						draw_as_shadow=true,
						priority = "high",
						width = 384,
						height = 384,
						line_length = 1,
						shift = util.by_pixel(0, 0),
						name = "bm",
						frame_count = 1,
						scale=0.5,
						y=1152, x=768,
					}),
				}
			}
		end
		return ret
	end)(),
	working_visualisations =
	{
		{
			animation = entlayer({
				x = 0,
				y = 0,
				width = 384,
				height = 384,
				line_length = 5,
				shift = util.by_pixel(0, 0),
				name = "bm",
				frame_count = 16,
				animation_speed = 0.25,
				scale=0.5
			}),
		}
	},
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	working_sound = {
		sound = {
			{
				filename = "__base__/sound/assembling-machine-t2-1.ogg",
				volume = 0.8
			},
			{
				filename = "__base__/sound/assembling-machine-t2-2.ogg",
				volume = 0.8
			},
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
		apparent_volume = 1.5,
	},
	crafting_speed = 1.00,
	energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
	},
	energy_usage = "200KW",
	ingredient_count = 1,
	crafting_categories = {"borehole-mine"},
},

})
