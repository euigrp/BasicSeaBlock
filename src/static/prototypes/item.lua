--item.lua
data:extend{

{
	type = "item",
	name = "algae-farm",
	icon = "__BasicSeaBlock__/graphics/icons/af.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[algae]-a[algae-farm]",
	place_result = "algae-farm",
	stack_size = 10
},
{
	type = "item",
	name = "filtration-plant",
	icon = "__BasicSeaBlock__/graphics/icons/fm.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[algae]-b[filtration-machine]",
	place_result = "filtration-plant",
	stack_size = 10
},
{
	type = "item",
	name = "pressure-furnace",
	icon = "__BasicSeaBlock__/graphics/icons/pf.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[algae]-c[pressure-furnace]",
	place_result = "pressure-furnace",
	stack_size = 10
},
{
	type = "item",
	name = "borehole-mine",
	icon = "__BasicSeaBlock__/graphics/icons/bm.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[items]-c[borehole-mine]",
	place_result = "borehole-mine",
	stack_size = 10
},
{
	type = "item",
	name = "pulp",
	icon = "__BasicSeaBlock__/graphics/icons/pulp.png",
	icon_size = 32,
	flags = {},
	subgroup = "raw-material",
	order = "a[pulp]",
	stack_size = 200,
},
{
	type = "item",
	name = "spent-filter",
	icon = "__BasicSeaBlock__/graphics/icons/filter-empty.png",
	icon_size = 32,
	flags = {},
	subgroup = "intermediate-product",
	order = "b[filter]-a[empty]",
	stack_size = 200,
},
{
	type = "item",
	name = "filter",
	icon = "__BasicSeaBlock__/graphics/icons/filter.png",
	icon_size = 32,
	flags = {},
	subgroup = "intermediate-product",
	order = "b[filter]-b[filter]",
	stack_size = 200,
},
}
