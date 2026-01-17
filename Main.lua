local Config = require(script.Config)
local Teleport = require(script.Modules.Teleport)
local Farming = require(script.Modules.Farming)
local Fishing = require(script.Modules.Fishing)

spawn(function()
    while true do
        if Config.Teleport.Enabled then
            Teleport.Run(Config.Teleport.Target)
            Config.Teleport.Enabled = false
        end

        if Config.Farming.Enabled then
            Farming.Run()
            wait(Config.Farming.Delay)
        end

        if Config.Fishing.Enabled then
            Fishing.Cast()
            wait(Config.Fishing.Speed)
            Fishing.Reel()
            wait(Config.Fishing.Speed)
        end

        wait(0.1)
    end
end)

print("MyScriptBase Loaded")
