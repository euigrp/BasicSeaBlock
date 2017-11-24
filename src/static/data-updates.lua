for k,v in pairs(data.raw.resource) do
	v.autoplace = nil
end

for k,v in pairs(data.raw["unit-spawner"]) do
	table.insert(v.autoplace.peaks, {influence = 0.8})
end

for i,sz in ipairs({"small-worm-turret", "medium-worm-turret", "big-worm-turret"}) do
	table.insert(data.raw.turret[sz].autoplace.peaks, {influence = 0.4})
end

for k,v in pairs(data.raw.tree) do
	v.autoplace = nil
end

for k,v in pairs(data.raw["simple-entity"]) do
	v.autoplace = nil
end

data.raw.recipe['landfill'].ingredients = {{"stone", 5}}
data.raw.item['landfill'].stack_size = 1000
