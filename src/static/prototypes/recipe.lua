--recipe.lua
data:extend({
	{
		type = "recipe",
		name = "algaefarm",
		energy_required = 0.25,
		enabled = true,
		ingredients = {
			{type="item", name="iron-plate", amount=4},
			{type="item", name="stone", amount=10},
			{type="item", name="electronic-circuit", amount=3},
			{type="item", name="iron-gear-wheel", amount=5},
		},
		results = {
			{type="item", name="algae-farm", amount=1},
		},
		icon="__BasicSeaBlock__/graphics/icons/algae-farm.png",
		subgroup = "extraction-machine"
	},
	{
		type = "recipe",
		name = "filterplant",
		energy_required = 0.25,
		enabled = true,
		ingredients = {
			{type="item", name="iron-plate", amount=10},
			{type="item", name="electronic-circuit", amount=1},
			{type="item", name="iron-gear-wheel", amount=1},
		},
		results = {
			{type="item", name="filtration-plant", amount=1},
		},
		icon = "__BasicSeaBlock__/graphics/icons/filtration-plant.png",
		subgroup = "extraction-machine"
	},
	{
		type = "recipe",
		name = "pressure-furnace",
		energy_required = 0.25,
		enabled = false,
		ingredients = {
			{"steel-plate", 15},
			{"iron-gear-wheel", 10},
			{"stone-brick", 15},
			{"electronic-circuit", 10},
			{"pipe", 8}
		},
		results = {
			{type="item", name="pressure-furnace", amount=1},
		},
		icon = "__BasicSeaBlock__/graphics/icons/pressure-furnace.png",
		subgroup = "extraction-machine"
	},
	{
		type = "recipe",
		name = "harvest-algae",
		energy_required = 20,
		enabled = true,
		ingredients = {
			{type="fluid", name="water", amount=400},
		},
		results = {
			{type="fluid", name="algal-sludge", amount=50},
		},
		icon = "__BasicSeaBlock__/graphics/icons/algae-from-water.png",
		subgroup = "algae-group",
		category = "algaefarming"
	},
	{
		type = "recipe",
		name = "breed-algae",
		energy_required = 20,
		enabled = true,
		ingredients = {
			{type="fluid", name="water", amount=400},
			{type="fluid", name="algal-sludge", amount=100},
		},
		results = {
			{type="fluid", name="algal-sludge", amount=400},
		},
		icon = "__BasicSeaBlock__/graphics/icons/algal-sludge_multiply.png",
		subgroup = "algae-group",
		category = "algaefarming"
	},
	{
		type = "recipe",
		name = "press-algae",
		energy_required = 20,
		enabled = true,
		ingredients = {
			{type="fluid", name="algal-sludge", amount=200},
		},
		results = {
			{type="item", name="pulp", amount=20},
			{type="fluid", name="algal-sludge", amount=40},
		},
		icon = "__BasicSeaBlock__/graphics/icons/pulp.png",
		subgroup = "algae-group",
		category = "algaefarming"
	},
	{
		type = "recipe",
		name = "cook-algae",
		energy_required = 5,
		enabled = true,
		ingredients = {
			{type="item", name="pulp", amount=2},
		},
		results = {
			{type="item", name="coal", amount=1},
		},
		icon = "__base__/graphics/icons/coal.png",
		subgroup = "algae-group",
		category = "smelting"
	},
	{
		type = "recipe",
		name = "pulp-board",
		energy_required = 2,
		enabled = true,
		ingredients = {
			{type="item", name="pulp", amount=2},
		},
		results = {
			{type="item", name="wood", amount=1},
		},
		icon = "__base__/graphics/icons/wood.png",
		subgroup = "algae-group",
		category = "algaefarming"
	},
	{
		type = "recipe",
		name = "filter",
		energy_required = 1,
		enabled = true,
		ingredients = {
			{type="item", name="iron-plate", amount=2},
		},
		results = {
			{type="item", name="spent-filter", amount=1},
		},
		icon = "__BasicSeaBlock__/graphics/icons/filter-spent.png",
		subgroup = "filter-group",
		category = "crafting"
	},
	{
		type = "recipe",
		name = "reload-filters",
		energy_required = 1,
		enabled = true,
		ingredients = {
			{type="item", name="spent-filter", amount=5},
			{type="item", name="coal", amount=1},
		},
		results = {
			{type="item", name="filter", amount=5},
		},
		icon = "__BasicSeaBlock__/graphics/icons/filter.png",
		subgroup = "filter-group",
		category = "crafting"
	},
	{
		type = "recipe",
		name = "filter-water",
		energy_required = 4,
		enabled = true,
		ingredients = {
			{type="item", name="filter", amount=1},
			{type="fluid", name="water", amount=400},
		},
		results = {
			{type="fluid", name="mineral-sludge", amount=225},
			{type="item", name="spent-filter", amount=1},
		},
		icon = "__BasicSeaBlock__/graphics/icons/mineral-sludge.png",
		subgroup = "filter-group",
		category = "filtering"
	},
	{
		type = "recipe",
		name = "sludge-coper-extract",
		energy_required = 9,
		enabled = true,
		ingredients = {
			{type="fluid", name="mineral-sludge", amount=150},
		},
		results = {
			{type="item", name="copper-ore", amount=3},
		},
		icon = "__base__/graphics/icons/copper-ore.png",
		subgroup = "filter-group",
		category = "filtering"
	},
	{
		type = "recipe",
		name = "sludge-iron-extract",
		energy_required = 9,
		enabled = true,
		ingredients = {
			{type="fluid", name="mineral-sludge", amount=150},
		},
		results = {
			{type="item", name="iron-ore", amount=3},
		},
		icon = "__base__/graphics/icons/iron-ore.png",
		subgroup = "filter-group",
		category = "filtering"
	},
	{
		type = "recipe",
		name = "sludge-rock-congeal",
		energy_required = 9,
		enabled = true,
		ingredients = {
			{type="fluid", name="mineral-sludge", amount=150},
		},
		results = {
			{type="item", name="stone", amount=5},
		},
		icon = "__base__/graphics/icons/stone.png",
		subgroup = "filter-group",
		category = "filtering"
	},
	{
		type = "recipe",
		name = "pressure-pulp",
		energy_required = 20,
		enabled = true,
		ingredients = {
			{type="fluid", name="algal-sludge", amount=100},
		},
		results = {
			{type="fluid", name="crude-oil", amount=100},
		},
		icon = "__base__/graphics/icons/crude-oil.png",
		subgroup = "filter-group",
		category = "pressure-furnace",
		order = "z",
	},
})
