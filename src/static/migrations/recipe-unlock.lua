for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["pressure-furnace"].enabled = technologies["oil-processing"].researched
  recipes["pressure-pulp"].enabled = technologies["oil-processing"].researched
  recipes["mine-uranium"].enabled = technologies["nuclear-power"].researched
  recipes["borehole-mine"].enabled = technologies["nuclear-power"].researched
  recipes["mine-uranium"].reload()
end
