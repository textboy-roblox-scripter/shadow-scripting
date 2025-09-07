-- Full GUI Script with Fixed Player ESP and Brainrot ESP
-- Drop this as a LocalScript (StarterPlayerScripts or inside a LocalGui context)

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
openButton.Size = UDim2.new(0, 70, 0, 30)
openButton.Position = UDim2.new(0.5, -35, 0.5, -25)
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

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Text = "Steal a Brainrot | PARADISE HUB"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14
titleText.Font = Enum.Font.GothamBold
titleText.BackgroundTransparency = 1
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Parent = titleBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
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

-- Tab Buttons Frame
local tabButtons = Instance.new("Frame")
tabButtons.Size = UDim2.new(1, 0, 0, 40)
tabButtons.Position = UDim2.new(0, 0, 0, 30)
tabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabButtons.Parent = mainFrame

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
    tabButton.Name = name .. "TabButton"
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.TextSize = 14
    tabButton.Font = Enum.Font.GothamBold
    tabButton.BackgroundColor3 = (i == 1) and Color3.fromRGB(70, 70, 70) or Color3.fromRGB(50, 50, 50)
    tabButton.BorderSizePixel = 0
    tabButton.Size = UDim2.new(1/#tabs, -6, 1, -10)
    tabButton.Position = UDim2.new((i - 1)/#tabs, 5, 0, 5)
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
            for name, frame in pairs(tabFrames) do
                frame.Visible = (name == btn.Text)
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
    btn.Name = text -- IMPORTANT: name the button so FindFirstChild("...") works
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
            callback()
        end)
    end

    -- Update CanvasSize of parent ScrollingFrame (if it is a ScrollingFrame)
    pcall(function()
        if parent:IsA("ScrollingFrame") then
            local canvasHeight = posY + 60
            if parent.CanvasSize.Y.Offset < canvasHeight then
                parent.CanvasSize = UDim2.new(0, 0, 0, canvasHeight)
            end
        end
    end)

    return btn
end

-- Open/Close UI
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)
-- Make GUI Draggable
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- --- Main features ---

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

-- Instant Steal (Jump) - using your approach
createButton(tabFrames.Main, "instant steal", 160, function()
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

-- Anti Ragdoll (external loader)
createButton(tabFrames.Main, "Anti Ragdoll", 210, function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-gui/refs/heads/main/notficationantiragdoll.txt"))()
    end)
end)

-- Speed
local speedEnabled = false
local speedConnection = nil
local speed = 1000

local function startCustomSpeed()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not (hrp and hum) then return end

    -- remove old if exists
    for _, v in pairs(hrp:GetChildren()) do
        if v:IsA("BodyVelocity") and v.Name == "SpeedForce" then
            v:Destroy()
        end
    end

    local bv = Instance.new("BodyVelocity")
    bv.Name = "SpeedForce"
    bv.MaxForce = Vector3.new(1e9, 0, 1e9)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = hrp

    speedConnection = RunService.RenderStepped:Connect(function()
        if not (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then return end
        local localHum = player.Character:FindFirstChildOfClass("Humanoid")
        if not localHum then return end
        bv.Velocity = localHum.MoveDirection * speed
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

local function clearLockESPs()
    for _, inst in pairs(lteInstances) do
        if inst and inst.Parent then
            inst:Destroy()
        end
    end
    lteInstances = {}
end

local function updateLock()
    if not activeLockTimeEsp then
        clearLockESPs()
        return
    end

    -- ensure workspace.Plots exists
    if not workspace:FindFirstChild("Plots") then
        return
    end

    for _, plot in pairs(workspace.Plots:GetChildren()) do
        -- try to find time label robustly
        local success, timeLabel = pcall(function()
            local purchases = plot:FindFirstChild("Purchases", true)
            if not purchases then return nil end
            local plotBlock = purchases:FindFirstChild("PlotBlock", true)
            if not plotBlock then return nil end
            local main = plotBlock:FindFirstChild("Main")
            if not main then return nil end
            local bb = main:FindFirstChildOfClass("BillboardGui")
            if not bb then return nil end
            return bb:FindFirstChild("RemainingTime")
        end)

        if success and timeLabel and timeLabel:IsA("TextLabel") then
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
                billboard.Adornee = plot -- attach to plot
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Text = displayText
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.TextScaled = true
                label.TextColor3 = textColor
                label.Font = Enum.Font.SourceSansBold
                label.Parent = billboard
                billboard.Parent = plot
                lteInstances[plot.Name] = billboard
            else
                local label = existingBillboard:FindFirstChild("Label")
                if label then
                    label.Text = displayText
                    label.TextColor3 = textColor
                end
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    if activeLockTimeEsp then
        pcall(updateLock)
    end
end)

createButton(tabFrames.Visual, "Lock Base ESP", 10, function()
    activeLockTimeEsp = not activeLockTimeEsp
    local btn = tabFrames.Visual:FindFirstChild("Lock Base ESP")
    if btn then
        btn.BackgroundColor3 = activeLockTimeEsp and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
    end
    if not activeLockTimeEsp then
        clearLockESPs()
    end
end)

-- Player ESP (Fixed)
local playerESPEnabled = false
local playerESPConnections = {} -- stores connections so we can cleanup
local createdESPS = {} -- map player -> billboard instance (for cleanup)

local function removeESPForPlayer(plr)
    if not plr then return end
    local bill = createdESPS[plr]
    if bill and bill.Parent then
        bill:Destroy()
    end
    createdESPS[plr] = nil
end

local function createESP(plr)
    if plr == player then return end
    -- don't duplicate
    if createdESPS[plr] then return end

    local char = plr.Character
    local head = char and char:FindFirstChild("Head")

    local function spawnESP(targetHead)
        if not targetHead then return end
        if targetHead:FindFirstChild("ESP") then return end

        local tag = Instance.new("BillboardGui")
        tag.Name = "ESP"
        tag.Size = UDim2.new(0, 100, 0, 30)
        tag.StudsOffset = Vector3.new(0, 2, 0)
        tag.AlwaysOnTop = true
        tag.Adornee = targetHead

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = plr.Name
        label.TextColor3 = Color3.new(1, 0, 0)
        label.TextStrokeTransparency = 0.5
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.Parent = tag

        tag.Parent = targetHead
        createdESPS[plr] = tag
    end

    if head then
        spawnESP(head)
    else
        -- wait for character to load, store connection
        local conn
        conn = plr.CharacterAdded:Connect(function(char)
            task.wait(0.4)
            local newHead = char:FindFirstChild("Head")
            spawnESP(newHead)
            if conn then
                conn:Disconnect()
            end
        end)
        table.insert(playerESPConnections, conn)
    end
end

local function removeAllPlayerESPs()
    for plr, _ in pairs(createdESPS) do
        removeESPForPlayer(plr)
    end
end

local function cleanupESPConnections()
    for _, conn in pairs(playerESPConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    playerESPConnections = {}
end

createButton(tabFrames.Visual, "ESP", 60, function()
    playerESPEnabled = not playerESPEnabled
    local btn = tabFrames.Visual:FindFirstChild("ESP")
    if btn then
        btn.BackgroundColor3 = playerESPEnabled and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
    end

    if playerESPEnabled then
        -- create for all current players
        for _, plr in pairs(Players:GetPlayers()) do
            createESP(plr)
        end
        -- listen for new players
        local playerAddedConn = Players.PlayerAdded:Connect(function(plr)
            createESP(plr)
        end)
        table.insert(playerESPConnections, playerAddedConn)
    else
        cleanupESPConnections()
        removeAllPlayerESPs()
    end
end)

-- Brainrot ESP (Fixed)
local brainrotESPEnabled = false
local brainrotESPUnloader = nil
local fallbackBrainrotESPs = {} -- keep track of created fallback billboards

createButton(tabFrames.Visual, "Brainrot ESP", 110, function()
    brainrotESPEnabled = not brainrotESPEnabled
    local btn = tabFrames.Visual:FindFirstChild("Brainrot ESP")
    if btn then
        btn.BackgroundColor3 = brainrotESPEnabled and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(60, 60, 60)
    end

    if brainrotESPEnabled then
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/obama928292/Side-script/refs/heads/main/Protected_2105182217610060.lua.txt"))()
        end)
        if success and typeof(result) == "function" then
            brainrotESPUnloader = result
            print("Brainrot ESP loaded successfully")
        else
            warn("Failed to load Brainrot ESP externally. Using fallback.")
            -- fallback: create billboards for parts named like "brainrot"
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("brainrot") then
                    if not obj:FindFirstChild("BrainrotESP") then
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
                        table.insert(fallbackBrainrotESPs, billboard)
                    end
                end
            end
        end
    else
        -- unload external if present
        if typeof(brainrotESPUnloader) == "function" then
            pcall(function()
                brainrotESPUnloader()
            end)
            brainrotESPUnloader = nil
            print("Brainrot ESP unloaded via unloader.")
        end
        -- cleanup fallback ESPs
        for _, b in pairs(fallbackBrainrotESPs) do
            if b and b.Parent then
                b:Destroy()
            end
        end
        fallbackBrainrotESPs = {}
        -- also remove any BillboardGui named BrainrotESP in workspace descendants
        for _, obj in pairs(workspace:GetDescendants()) do
            local child = obj:FindFirstChild("BrainrotESP")
            if child and child:IsA("BillboardGui") then
                child:Destroy()
            end
        end
        print("Brainrot ESP cleaned up.")
    end
end)

-- ServerHop
createButton(tabFrames.Misc, "ServerHop", 10, function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Steal-a-Brianrot/refs/heads/main/Secrets%20finder.lua"))()
    end)
end)

print("Script started")
