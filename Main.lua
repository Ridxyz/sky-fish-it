-- SKY BASE UI (for your own game / Roblox Studio)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- CONFIG
local Config = {
    AutoFishing = false,
    FishingDelay = 1,
    CancelDelay = 0.5,
}

-- CREATE GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SkyBaseUI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- LOGO
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.BackgroundTransparency = 1
Logo.Image = "https://files.catbox.moe/35utto.jpg"
Logo.Parent = MainFrame

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 0, 40)
Title.Position = UDim2.new(0, 80, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "SKY BASE"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

-- CLOSE BUTTON
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

-- TOGGLE AUTO FISHING
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 260, 0, 35)
ToggleBtn.Position = UDim2.new(0, 20, 0, 80)
ToggleBtn.Text = "Auto Fishing : OFF"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.Parent = MainFrame

ToggleBtn.MouseButton1Click:Connect(function()
	Config.AutoFishing = not Config.AutoFishing
	ToggleBtn.Text = "Auto Fishing : " .. (Config.AutoFishing and "ON" or "OFF")
end)

-- INFO LABEL
local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(0, 260, 0, 30)
Info.Position = UDim2.new(0, 20, 0, 130)
Info.BackgroundTransparency = 1
Info.Text = "FishingDelay = "..Config.FishingDelay.." | CancelDelay = "..Config.CancelDelay
Info.TextColor3 = Color3.new(1,1,1)
Info.Parent = MainFrame

-- AUTO FISH LOOP (DUMMY)
task.spawn(function()
	while true do
		if Config.AutoFishing then
			print("[Fishing] Cast")
			task.wait(Config.FishingDelay)

			print("[Fishing] Cancel")
			task.wait(Config.CancelDelay)
		end
		task.wait(0.1)
	end
end)

-- HOTKEY TO OPEN/CLOSE MENU
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		MainFrame.Visible = not MainFrame.Visible
	end
end)

print("SKY BASE UI LOADED")
