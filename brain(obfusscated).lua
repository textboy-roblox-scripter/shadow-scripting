-- Full GUI Script with Fixed Player ESP and Brainrot ESP
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui", 10) -- Wait for PlayerGui with timeout

if not playerGui then
    warn("PlayerGui not found!")
    return
end

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "PARADISE"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Create Open Button
local openButton = Instance.new("TextButton")
openButton.Name = "AXSButton"
openButton.Text = "PARADISE"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 14
openButton.Font = Enum.Font.GothamBold
openButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openButton.BorderSizePixel = 0
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0.5, -25, 0.5, -25)
openButton.Active = true
openButton.Visible = true
openButton.Parent = gui
Instance.new("UICorner", openButton).CornerRadius = UDim.new(1, 0)

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Parent = gui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0.05, 0)

-- Create Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.Parent = mainFrame

-- Create Title Text
local titleText = Instance.new("TextLabel")
titleText.Text = "Steal a Brainrot | PARADISE HUB"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14
titleText.Font = Enum.Font.GothamBold
titleText.BackgroundTransparency = 1
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Parent = titleBar

-- Create Close Button
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Active = true
closeButton.Parent = titleBar
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0.1, 0)

-- Create Tab Buttons Frame
local tabButtons = Instance.new("Frame")
tabButtons.Size = UDim2.new(1, 0, 0, 40)
tabButtons.Position = UDim2.new(0, 0, 0, 30)
tabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabButtons.Parent = mainFrame

-- Create Tabs Container
local tabsContainer = Instance.new("Frame")
tabsContainer.Size = UDim2.new(1, -20, 1, 0)
tabsContainer.Position = UDim2.new(0, 10, 0, 0)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = tabButtons

-- Define Tabs
local tabs = {"Main", "Visual", "Misc"}
local tabFrames = {}

-- Create Tab Buttons and Frames
for i, name in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.TextSize = 14
    tabButton.Font = Enum.Font.GothamBold
    tabButton.BackgroundColor3 = (i == 1) and Color3.fromRGB(70, 70, 70) or Color3.fromRGB(50, 50, 50)
    tabButton.BorderSizePixel = 0
    tabButton.Size = UDim2.new(0.333, -5, 1, -10)
    tabButton.Position = UDim2.new((i - 1) / #tabs, 5, 0, 5)
    tabButton.Active = true
    tabButton.Parent = tabsContainer
    Instance.new("UICorner", tabButton).CornerRadius = UDim.new(0, 8)

    local frame = Instance.new("ScrollingFrame")
    frame.Name = name .. "Frame"
    frame.Size = UDim2.new(1, -20, 1, -80)
    frame.Position = UDim2.new(0, 10, 0, 80)
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.ScrollBarThickness = 5
    frame.BackgroundTransparency = 1
    frame.Visible = i == 1
    frame.Parent = mainFrame

    tabFrames[name] = frame
end

-- Connect Tab Button Clicks
for _, btn in ipairs(tabsContainer:GetChildren()) do
    if btn:IsA("TextButton") then
        btn.MouseButton1Click:Connect(function()
            print("Tab clicked: " .. btn.Text) -- Debug
            for name, frame in pairs(tabFrames) do
                frame.Visible = (name == btn.Text)
                print("Setting " .. name .. " frame visibility to: " .. tostring(frame.Visible)) -- Debug
            end
            for _, otherBtn in ipairs(tabsContainer:GetChildren()) do
                if otherBtn:IsA("TextButton") then
                    otherBtn.BackgroundColor3 = (otherBtn == btn) and Color3.fromRGB(70, 70, 70) or Color3.fromRGB(50, 50, 50)
                end
            end
        end)
    end
end

-- Button Creation Helper Function
local function createButton(parent, text, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Active = true
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    if callback then
        btn.MouseButton1Click:Connect(function()
            print("Button clicked: " .. text) -- Debug
            callback()
        end)
    end

    -- Update CanvasSize of parent ScrollingFrame
    local canvasHeight = posY + 50
    if parent.CanvasSize.Y.Offset < canvasHeight then
        parent.CanvasSize = UDim2.new(0, 0, 0, canvasHeight)
    end

    return btn
end

-- Infinite Jump
local infJump = false
local infBtn = createButton(tabFrames.Main, "Infinite Jump", 10, function()
    infJump = not infJump
    infBtn.BackgroundColor3 = infJump and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
end)

UserInputService.JumpRequest:Connect(function()
    if infJump and player.Character then
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

-- Noclip
local noclip = false
local noclipBtn = createButton(tabFrames.Main, "Noclip", 60, function()
    noclip = not noclip
    noclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
end)

RunService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Godmode
local godmode = false
local godBtn = createButton(tabFrames.Main, "Godmode", 110, function()
    godmode = not godmode
    godBtn.BackgroundColor3 = godmode and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
end)

RunService.Heartbeat:Connect(function()
    if godmode and player.Character then
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            if hum.Health < hum.MaxHealth then
                hum.Health = hum.MaxHealth
            end
            if not hum:FindFirstChild("NoDamage") then
                local tag = Instance.new("BoolValue")
                tag.Name = "NoDamage"
                tag.Parent = hum
            end
        end
    end
end)

-- Instant Steal (Jump)
createButton(tabFrames.Main, "Jump", 160, function()
    local function setup()
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")

        local jumpVelocity = 120
        local airBoost = false

        pcall(function()
            settings().Physics.AllowSleep = false
        end)

        humanoid.StateChanged:Connect(function(_, newState)
            if newState == Enum.HumanoidStateType.Jumping and not airBoost then
                airBoost = true
                RunService.RenderStepped:Wait()
                rootPart.Velocity = Vector3.new(0, jumpVelocity, 0)
                task.wait(0.3)
                airBoost = false
            end
        end)
    end

    player.CharacterAdded:Connect(function()
        task.wait(1)
        setup()
    end)

    if player.Character then
        setup()
    end
end)

-- Anti Ragdoll
createButton(tabFrames.Main, "Anti Ragdoll", 210, function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-gui/refs/heads/main/notficationantiragdoll.txt"))()
    end)
end)

-- Speed
local speedEnabled = false
local speedConnection = nil
local speed = 40

local function startCustomSpeed()
    local char = player.Character
    if not char then return end
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not (hrp and hum) then return end

    for _, v in pairs(hrp:GetChildren()) do
        if v:IsA("BodyVelocity") and v.Name == "SpeedForce" then
            v:Destroy()
        end
    end

    local bv = Instance.new("BodyVelocity")
    bv.Name = "SpeedForce"
    bv.MaxForce = Vector3.new(1e9, 0, 1e9)
    bv.Velocity = Vector3.zero
    bv.Parent = hrp

    speedConnection = RunService.RenderStepped:Connect(function()
        if not (char and char:FindFirstChild("HumanoidRootPart") and hum and hum.MoveDirection) then return end
        bv.Velocity = hum.MoveDirection * speed
    end)

    print("Custom walk speed applied using BodyVelocity.")
end

local function stopCustomSpeed()
    if speedConnection then
        speedConnection:Disconnect()
        speedConnection = nil
    end
    if player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            for _, v in pairs(hrp:GetChildren()) do
                if v:IsA("BodyVelocity") and v.Name == "SpeedForce" then
                    v:Destroy()
                end
            end
        end
    end
    print("Custom walk speed disabled.")
end

local speedBtn = createButton(tabFrames.Main, "Speed", 260, function()
    speedEnabled = not speedEnabled
    speedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
    if speedEnabled then
        startCustomSpeed()
    else
        stopCustomSpeed()
    end
end)

player.CharacterAdded:Connect(function()
    if speedEnabled then
        task.wait(1)
        startCustomSpeed()
    end
end)

createButton(tabFrames.Main, "Auto Base Lock (Soon)", 310, function()
    print("Auto Base Lock not implemented yet.")
end)

-- Lock Base ESP (Confirmed Working)
local activeLockTimeEsp = false
local lteInstances = {}

local function updateLock()
    if not activeLockTimeEsp then
        for _, instance in pairs(lteInstances) do
            if instance then
                instance:Destroy()
            end
        end
        lteInstances = {}
        return
    end

    for _, plot in pairs(workspace.Plots:GetChildren()) do
        local timeLabel = plot:FindFirstChild("Purchases", true) and 
            plot.Purchases:FindFirstChild("PlotBlock", true) and
            plot.Purchases.PlotBlock.Main:FindFirstChild("BillboardGui", true) and
            plot.Purchases.PlotBlock.Main.BillboardGui:FindFirstChild("RemainingTime", true)

        if timeLabel and timeLabel:IsA("TextLabel") then
            local espName = "LockTimeESP_" .. plot.Name
            local existingBillboard = plot:FindFirstChild(espName)
            local isUnlocked = timeLabel.Text == "0s"
            local displayText = isUnlocked and "Unlocked" or ("Lock: " .. timeLabel.Text)
            local textColor = isUnlocked and Color3.fromRGB(220, 20, 60) or Color3.fromRGB(255, 255, 0)

            if not existingBillboard then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = espName
                billboard.Size = UDim2.new(0, 200, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 5, 0)
                billboard.AlwaysOnTop = true
                billboard.Adornee = plot.Purchases.PlotBlock.Main

                local label = Instance.new("TextLabel")
                label.Text = displayText
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.TextScaled = true
                label.TextColor3 = textColor
                label.TextStrokeColor3 = Color3.new(0, 0, 0)
                label.TextStrokeTransparency = 0
                label.Font = Enum.Font.SourceSansBold
                label.Parent = billboard

                billboard.Parent = plot
                lteInstances[plot.Name] = billboard
            else
                local label = existingBillboard:FindFirstChildOfClass("TextLabel")
                if label then
                    label.Text = displayText
                    label.TextColor3 = textColor
                end
            end
        end
    end
end

RunService.Heartbeat:Connect(function() -- Changed to Heartbeat for better performance
    if activeLockTimeEsp then
        pcall(updateLock)
    end
end)

createButton(tabFrames.Visual, "Lock Base ESP", 10, function()
    print("Lock Base ESP toggled") -- Debug
    activeLockTimeEsp = not activeLockTimeEsp
    tabFrames.Visual:FindFirstChild("Lock Base ESP").BackgroundColor3 = activeLockTimeEsp and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
end)

-- Player ESP (Fixed)
local playerESPEnabled = false
local playerESPConnections = {}

local function createESP(plr)
    if plr == player then return end
    print("Attempting to create ESP for player: " .. plr.Name) -- Debug
    local function tryCreateESP()
        local char = plr.Character
        if not char then
            print("No character found for " .. plr.Name) -- Debug
            return false
        end
        local head = char:FindFirstChild("Head")
        if not head then
            print("No head found for " .. plr.Name) -- Debug
            return false
        end
        if head:FindFirstChild("ESP") then
            print("ESP already exists for " .. plr.Name) -- Debug
            return false
        end

        local tag = Instance.new("BillboardGui")
        tag.Name = "ESP"
        tag.Size = UDim2.new(0, 100, 0, 30)
        tag.StudsOffset = Vector3.new(0, 2, 0)
        tag.AlwaysOnTop = true
        tag.Adornee = head

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = plr.Name
        label.TextColor3 = Color3.new(1, 0, 0)
        label.TextStrokeTransparency = 0.5
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.Parent = tag

        tag.Parent = head
        print("ESP created for " .. plr.Name) -- Debug
        return true
    end

    if not tryCreateESP() then
        local charConn
        charConn = plr.CharacterAdded:Connect(function()
            task.wait(0.5) -- Small delay to ensure character is fully loaded
            if playerESPEnabled and tryCreateESP() then
                charConn:Disconnect()
            end
        end)
        table.insert(playerESPConnections, charConn)
    end
end

local function removeESP()
    print("Removing all Player ESP") -- Debug
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head and head:FindFirstChild("ESP") then
                head.ESP:Destroy()
                print("ESP removed for " .. plr.Name) -- Debug
            end
        end
    end
end

local function cleanupESPConnections()
    print("Cleaning up Player ESP connections") -- Debug
    for _, conn in pairs(playerESPConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    playerESPConnections = {}
end

createButton(tabFrames.Visual, "ESP", 60, function()
    print("Player ESP toggled: " .. tostring(not playerESPEnabled)) -- Debug
    playerESPEnabled = not playerESPEnabled
    tabFrames.Visual:FindFirstChild("ESP").BackgroundColor3 = playerESPEnabled and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)

    if playerESPEnabled then
        print("Enabling Player ESP for all players") -- Debug
        for _, plr in pairs(Players:GetPlayers()) do
            createESP(plr)
        end
        local playerAddedConn = Players.PlayerAdded:Connect(function(plr)
            print("New player joined: " .. plr.Name) -- Debug
            createESP(plr)
        end)
        table.insert(playerESPConnections, playerAddedConn)
    else
        cleanupESPConnections()
        removeESP()
    end
end)

-- Brainrot ESP (Fixed)
local brainrotESPEnabled = false
local brainrotESPUnloader = nil

createButton(tabFrames.Visual, "Brainrot ESP", 110, function()
    print("Brainrot ESP toggled: " .. tostring(not brainrotESPEnabled)) -- Debug
    brainrotESPEnabled = not brainrotESPEnabled
    tabFrames.Visual:FindFirstChild("Brainrot ESP").BackgroundColor3 = brainrotESPEnabled and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)

    if brainrotESPEnabled then
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/obama928292/Side-script/refs/heads/main/Protected_2105182217610060.lua.txt"))()
        end)
        if success and typeof(result) == "function" then
            brainrotESPUnloader = result
            print("Brainrot ESP loaded successfully") -- Debug
        else
            warn("Failed to load Brainrot ESP: " .. (result or "Unknown error")) -- Debug
            brainrotESPEnabled = false
            tabFrames.Visual:FindFirstChild("Brainrot ESP").BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            -- Fallback placeholder (optional, can be customized for your game)
            print("Using fallback Brainrot ESP placeholder")
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("brainrot") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "BrainrotESP"
                    billboard.Size = UDim2.new(0, 100, 0, 30)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Adornee = obj

                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = "Brainrot"
                    label.TextColor3 = Color3.new(0, 1, 0)
                    label.TextScaled = true
                    label.Parent = billboard

                    billboard.Parent = obj
                end
            end
        end
    else
        if typeof(brainrotESPUnloader) == "function" then
            pcall(brainrotESPUnloader)
            print("Brainrot ESP unloaded") -- Debug
            brainrotESPUnloader = nil
        end
        -- Clean up fallback ESP
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:FindFirstChild("BrainrotESP") then
                obj.BrainrotESP:Destroy()
            end
        end
    end
end)

-- ServerHop
createButton(tabFrames.Misc, "ServerHop", 10, function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Steal-a-Brianrot/refs/heads/main/Secrets%20finder.lua"))()
    end)
end)

print("Script started")
