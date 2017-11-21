for k,v in pairs(data.raw.resource) do
	v.autoplace = nil
end

for k,v in pairs(data.raw["unit-spawner"]) do
	v.autoplace = nil
	v.control = nil
end

for k,v in pairs(data.raw.tree) do
	v.autoplace = nil
end

for k,v in pairs(data.raw["simple-entity"]) do
	v.autoplace = nil
end

data.raw.recipe['landfill'].ingredients = {{"stone", 5}}
data.raw.item['landfill'].stack_size = 1000
