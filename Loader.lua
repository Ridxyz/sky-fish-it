local games = {
    [121864768012064] = "https://raw.githubusercontent.com/Ridxyz/MyScriptBase/main/Main.lua"
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    print("Game tidak terdaftar di loader.")
end
