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
    name = "water-pumping"
  },
  {
    type = "resource-category",
    name = "sludge"
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
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-b[algal-sludge]"
  }
})

require("prototypes.item")
require("prototypes.recipe")
require("prototypes.entity")

for _,v in pairs(data.raw.tile) do
  v.autoplace = nil
end

data.raw.tile['sand'].autoplace = {
  peaks = {{
    influence = 0.1
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
