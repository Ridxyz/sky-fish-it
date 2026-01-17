-- =================================
--        SKY FISH SCRIPT
-- =================================

print([[
███████╗██╗  ██╗██╗   ██╗
██╔════╝██║ ██╔╝╚██╗ ██╔╝
███████╗█████╔╝  ╚████╔╝ 
╚════██║██╔═██╗   ╚██╔╝  
███████║██║  ██╗   ██║   
╚══════╝╚═╝  ╚═╝   ╚═╝   
      SKY FISH SCRIPT LOADED
]])

-- =================================
-- CONFIG
-- =================================
Config = {
    MenuOpen = true,
    AutoFishing = false,
    FishingDelay = 1.0,
    CancelDelay = 0.5
}

-- =================================
-- FISHING FUNCTIONS (ISI KODE ASLI DI SINI)
-- =================================
function doCastFishing()
    print("[Fishing] Cast rod")
    -- ganti ini dengan logic kamu sendiri nanti
end

function doCancelFishing()
    print("[Fishing] Cancel / Reel")
    -- ganti ini dengan logic kamu sendiri nanti
end

-- =================================
-- MENU CONTROL
-- =================================
function ToggleMenu()
    Config.MenuOpen = not Config.MenuOpen
    print("[MENU]", Config.MenuOpen and "OPENED" or "CLOSED")
end

function ToggleAutoFishing()
    Config.AutoFishing = not Config.AutoFishing
    print("[AUTO FISHING]", Config.AutoFishing and "ON" or "OFF")
end

function SetFishingDelay(v)
    Config.FishingDelay = v
    print("[SET] Fishing Delay:", v)
end

function SetCancelDelay(v)
    Config.CancelDelay = v
    print("[SET] Cancel Delay:", v)
end

-- =================================
-- MENU DISPLAY
-- =================================
function ShowMenu()
    if not Config.MenuOpen then return end

    print([[
==============================
         SKY MENU
==============================
1. Toggle Auto Fishing
2. Set Fishing Delay
3. Set Cancel Delay
4. Open / Close Menu
5. Show Current Config
0. Exit Menu
==============================
]])
end

-- =================================
-- INPUT HELPER
-- =================================
function input(msg)
    io.write(msg .. ": ")
    return io.read()
end

-- =================================
-- AUTO FISHING LOOP
-- =================================
local function sleep(sec)
    local t = os.clock()
    while os.clock() - t < sec do end
end

-- thread auto fishing
coroutine.wrap(function()
    while true do
        if Config.AutoFishing then
            doCastFishing()
            sleep(Config.FishingDelay)

            doCancelFishing()
            sleep(Config.CancelDelay)
        end
        sleep(0.1)
    end
end)()

-- =================================
-- MENU LOOP
-- =================================
while true do
    ShowMenu()
    local c = input("Select")

    if c == "1" then
        ToggleAutoFishing()

    elseif c == "2" then
        local v = tonumber(input("Fishing Delay (seconds)"))
        if v then SetFishingDelay(v) end

    elseif c == "3" then
        local v = tonumber(input("Cancel Delay (seconds)"))
        if v then SetCancelDelay(v) end

    elseif c == "4" then
        ToggleMenu()

    elseif c == "5" then
        print("===== CURRENT CONFIG =====")
        print("MenuOpen     :", Config.MenuOpen)
        print("AutoFishing  :", Config.AutoFishing)
        print("FishingDelay :", Config.FishingDelay)
        print("CancelDelay  :", Config.CancelDelay)

    elseif c == "0" then
        print("Menu closed. Script still running.")
        break
    end

    sleep(0.2)
end
