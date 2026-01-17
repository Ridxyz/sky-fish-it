-- ===============================
-- SKY BASE (UI ENGINE TEMPLATE)
-- ===============================

print("SKY BASE LOADED")

-- ===============================
-- CONFIG
-- ===============================
local Config = {
    MenuOpen = true,
    AutoFishing = false,
    FishingDelay = 1.0,
    CancelDelay = 0.5
}

-- ===============================
-- UI ABSTRACTION (DUMMY ENGINE)
-- ===============================
local UI = {}

function UI:CreateWindow(title)
    print("[UI] Window Created:", title)
    return {
        Title = title,
        Visible = true
    }
end

function UI:CreateImage(window, url)
    print("[UI] Image Loaded:", url)
end

function UI:CreateButton(window, text, callback)
    print("[UI] Button Created:", text)
    return {
        Click = callback
    }
end

function UI:SetVisible(window, state)
    window.Visible = state
    print("[UI] Window Visible:", state)
end

-- ===============================
-- CREATE UI
-- ===============================
local Window = UI:CreateWindow("SKY FISH BASE")

-- Logo dari URL kamu
UI:CreateImage(Window, "https://files.catbox.moe/35utto.jpg")

-- Buttons
local ToggleFishingBtn = UI:CreateButton(Window, "Toggle Auto Fishing", function()
    Config.AutoFishing = not Config.AutoFishing
    print("[AutoFishing]", Config.AutoFishing and "ON" or "OFF")
end)

local CloseMenuBtn = UI:CreateButton(Window, "Close Menu", function()
    Config.MenuOpen = false
    UI:SetVisible(Window, false)
end)

local OpenMenuBtn = UI:CreateButton(Window, "Open Menu", function()
    Config.MenuOpen = true
    UI:SetVisible(Window, true)
end)

-- ===============================
-- FISHING LOGIC (DUMMY)
-- ===============================
local function doCastFishing()
    print("[Fishing] Cast rod")
end

local function doCancelFishing()
    print("[Fishing] Cancel")
end

-- ===============================
-- AUTO FISH LOOP (SIMULATION)
-- ===============================
local function sleep(t)
    local start = os.time()
    repeat until os.time() > start + t
end

coroutine.wrap(function()
    while true do
        if Config.AutoFishing then
            doCastFishing()
            sleep(Config.FishingDelay)

            doCancelFishing()
            sleep(Config.CancelDelay)
        end
        sleep(1)
    end
end)()

print("SKY BASE UI READY")
