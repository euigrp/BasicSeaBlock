--data.lua

data:extend({
  {
    type = "recipe-category",
    name = "algaefarming"
  },
  {
    type = "recipe-category",
    name = "filtering"
  },
  {
    type = "recipe-category",
    name = "pressure-furnace"
  },
  {
    type = "recipe-category",
    name = "borehole-mine"
  },
  {
    type = "item-subgroup",
    name = "algae-group",
    group = "intermediate-products",
    order = "f"
  },
  {
    type = "item-subgroup",
    name = "filter-group",
    group = "intermediate-products",
    order = "f"
  },
  {
    type = "fluid",
    name = "algal-sludge",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0, g=0.4, b=0.1},
    flow_color = {r=0.1, g=0.43, b=0.1},
    max_temperature = 100,
    icon = "__BasicSeaBlock__/graphics/icons/algal-sludge.png",
    icon_size = 32,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-b[algal-sludge]"
  },
  {
    type = "fluid",
    name = "mineral-sludge",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=0.5, g=0.1, b=0.1},
    flow_color = {r=0.6, g=0.15, b=0.15},
    max_temperature = 100,
    icon = "__BasicSeaBlock__/graphics/icons/mineral-sludge.png",
    icon_size = 32,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-b[algal-sludge]"
  }
})

require("prototypes.item")
require("prototypes.recipe")
require("prototypes.entity")

for n,v in pairs(data.raw.tile) do
  v.autoplace = nil
end

local autoplace_utils = require("autoplace_utils")

local function autoplace_settings(noise_layer, rectangles)
  local ret = {}

  if noise_layer then
    ret = {
      {
        influence = 0.9999,
        noise_layer = noise_layer,
        noise_persistence = 0.9,
        octaves_difference = 0,
        starting_area_amount = 0,
	max_probability = 0.1,
      }
    }
  end

--  autoplace_utils.peaks(rectangles, ret)

  return { peaks = ret }
end

data.raw.tile['sand-1'].autoplace = {
  peaks = {{
    influence = 0.1
   }}
}



data.raw.tile['grass-1'].autoplace =
{
  sharpness = 1,
  control = "enemy-base",
  richness_multiplier = 1,
  richness_base = 0,
  force = "enemy",
  max_probability = 0.6,
  peaks = {
  {
    influence = -1,
    starting_area_weight_optimal = 1,
    starting_area_weight_range = 0.001,
    starting_area_weight_max_range = 0.001,
  },
  {
    influence = 0.9,
    noise_layer = 'enemy-base',
    noise_octaves_difference = -2.5,
    noise_persistence = 0.2,
  },
  {
    influence = 0.4,
    noise_layer = 'enemy-base',
    noise_octaves_difference = -2.5,
    noise_persistence = 0.2,
  },
  {
    influence = -1.6
  }}
}


data.raw.tile['deepwater'].autoplace = {
  peaks = {
  {
    influence = -0.1,
    starting_area_weight_optimal = 1,
    starting_area_weight_range = 0,
    starting_area_weight_max_range = 0,
    order = "zzzzzzzzzzzz"
  }}
}

table.insert(data.raw["technology"]["oil-processing"].effects, {type = "unlock-recipe", recipe = "pressure-furnace"})
table.insert(data.raw["technology"]["oil-processing"].effects, {type = "unlock-recipe", recipe = "pressure-pulp"})
table.insert(data.raw["technology"]["nuclear-power"].effects, {type = "unlock-recipe", recipe = "mine-uranium"})
table.insert(data.raw["technology"]["nuclear-power"].effects, {type = "unlock-recipe", recipe = "borehole-mine"})

-- Get rid of cliffs - the small islands don't look right with cliffs on them
data:extend({
	{
		name = "default-cliffiness",
		type = "noise-expression",
		expression = {
			expression_id = 'kill-cliffiness',
			literal_value = 0,
			type = 'literal-number'
		}
	}
})
