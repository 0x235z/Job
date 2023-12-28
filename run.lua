--I didnt finish :p

local Network = require(game.ReplicatedStorage.GetNetwork)()
assert(Network, "Failed to find network")

local Library = require(game.ReplicatedStorage.Screen)
local Assets = require(game.ReplicatedStorage.Assets)

local Tab = Library:CreateTab("Auto Farm")
local actives_section = Tab:CreateSection("Main")
local config_section = Tab:CreateSection("Config")

local Jobs = {
	Boxer = true,
	Kitchen = true,
	Delivery = true,
	Packer = true,
}

actives_section:CreateToggle("Enabled", function(state)
end)

config_section:CreateSlider("Start refil", 1, 50, 50, false, function(value : number) 
end)

config_section:CreateSlider("End refil", 50, 100, 100, false, function(value : number)
end)

config_section:CreateLabel("Select your work", "Jobs")

for job, i in Jobs do
	config_section:CreateToggle(job, function(state)
		Jobs[job] = state
	end)
end

-- update info supply
local supply_counts = {
	TomatoSauce = 99,
	Cheese = 99,
	Sausage = 99,
	Pepperoni = 99,
	Dough = 99,
	Box = 99,
	Dew = 99
}

for i, v in supply_counts do
	local supplys = workspace.SupplyCounters.Model[v =="Dew" and "CounterMountainDew" or "Counter"..v].a.SG.Counter
	supply_counts[v] = tonumber(supplys.Text)

	supplys.Changed:Connect(function()
		supply_counts[v] = tonumber(supplys.Text)
	end)
end

