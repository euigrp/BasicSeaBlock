--item.lua
data:extend{

{
	type = "item",
	name = "algae-farm",
	icon = "__BasicSeaBlock__/graphics/icons/algae-farm.png",
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[algae]-a[algae-farm]",
	place_result = "algae-farm",
	stack_size = 10
},
{
	type = "item",
	name = "filtration-plant",
	icon = "__BasicSeaBlock__/graphics/icons/filtration-plant.png",
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[algae]-b[filtration-machine]",
	place_result = "filtration-plant",
	stack_size = 10
},
{
	type = "item",
	name = "pressure-furnace",
	icon = "__BasicSeaBlock__/graphics/icons/pressure-furnace.png",
	flags = {"goes-to-quickbar"},
	subgroup = "extraction-machine",
	order = "a[algae]-c[pressure-furnace]",
	place_result = "pressure-furnace",
	stack_size = 10
},
{
	type = "item",
	name = "pulp",
	icon = "__BasicSeaBlock__/graphics/icons/pulp.png",
	flags = {},
	subgroup = "raw-material",
	order = "a[pulp]",
	stack_size = 200,
},
{
	type = "item",
	name = "spent-filter",
	icon = "__BasicSeaBlock__/graphics/icons/filter-spent.png",
	flags = {},
	subgroup = "intermediate-product",
	order = "b[filter]-a[empty]",
	stack_size = 200,
},
{
	type = "item",
	name = "filter",
	icon = "__BasicSeaBlock__/graphics/icons/filter.png",
	flags = {},
	subgroup = "intermediate-product",
	order = "b[filter]-b[filter]",
	stack_size = 200,
},
}
