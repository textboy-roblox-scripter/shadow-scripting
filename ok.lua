local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Upgrade = ReplicatedStorage.GameEvents.FairyService.Upgrade
local SubmitFairyFountainAllPlants = ReplicatedStorage.GameEvents.FairyService.SubmitFairyFountainAllPlants
local CreateLooseFairy = ReplicatedStorage.GameEvents.FairyService.CreateLooseFairy
local CollectLooseFairy = ReplicatedStorage.GameEvents.FairyService.CollectLooseFairy

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["FAIRY_AUTOMATION"] = "Fairy SCRIPT",
            ["WELCOME"] = "Genzura Hub",
            ["UPGRADE_SPAMMER"] = "Upgrade Spammer",
            ["FAIRY_FOUNTAIN"] = "Fairy Fountain",
            ["VISUALS"] = "Visuals",
            ["COLLECTION"] = "Collection",
            ["SELECT_UPGRADE"] = "Select Upgrades (Multi)",
            ["SPAM_UPGRADE"] = "Spam Upgrades",
            ["UPGRADE_SPEED"] = "Upgrade Spam Speed (ms)",
            ["AUTO_SUBMIT_FAIRY"] = "Auto Submit Fairy Plants",
            ["FAIRY_SUBMIT_SPEED"] = "Fairy Submit Speed (ms)",
            ["SPAWN_FAIRY"] = "Auto Spawn Fairies",
            ["SPAWN_SPEED"] = "Fairy Spawn Speed (ms)",
            ["COLLECT_FAIRY"] = "Auto Collect Fairies",
            ["COLLECT_SPEED"] = "Fairy Collect Speed (ms)",
            ["SPAWN_WARNING"] = "WARNING: Spawning fairies may cause lag!",
            ["COLLECT_DESC"] = "Automatically collect spawned fairies"
        }
    }
})

WindUI:SetTheme("Dark")
WindUI.TransparencyValue = 0.2

local Window = WindUI:CreateWindow({
    Title = "loc:FAIRY_AUTOMATION",
    Icon = "sparkles",
    Author = "loc:WELCOME",
    Size = UDim2.fromOffset(580, 490),
    Theme = "Dark",
    Acrylic = true,
    HideSearchBar = false,
    SideBarWidth = 200
})

local Tabs = {
    Main = Window:Section({ Title = "loc:FAIRY_AUTOMATION", Opened = true })
}

local TabHandles = {
    UpgradeSpammer = Tabs.Main:Tab({ Title = "loc:UPGRADE_SPAMMER", Icon = "zap", Desc = "Automate upgrade purchases" }),
    FairyFountain = Tabs.Main:Tab({ Title = "loc:FAIRY_FOUNTAIN", Icon = "droplet", Desc = "Auto submit fairy plants" }),
    Visuals = Tabs.Main:Tab({ Title = "loc:VISUALS", Icon = "eye", Desc = "Visual effects (may lag)" }),
    Collection = Tabs.Main:Tab({ Title = "loc:COLLECTION", Icon = "star", Desc = "Auto collect fairies" }),
    VisualCurrency = Tabs.Main:Tab({ Title = "Visual Currency", Icon = "dollar-sign", Desc = "Visual currency changes" })
}

TabHandles.UpgradeSpammer:Paragraph({
    Title = "Upgrade Automation",
    Desc = "Select multiple upgrades to spam",
    Image = "zap",
    ImageSize = 20,
    Color = Color3.fromHex("#30ff6a")
})

TabHandles.UpgradeSpammer:Divider()

local upgradeOptions = {
    "Glimmer Multiplier",
    "Loose Fairy Spawn Amount",
    "Fairy Event Duration",
    "Fairy Spawn Amount"
}

local upgradeDropdown = TabHandles.UpgradeSpammer:Dropdown({
    Title = "loc:SELECT_UPGRADE",
    Values = upgradeOptions,
    Value = {upgradeOptions[1]},
    Multi = true,
    Callback = function(options)
        _G.selectedUpgrades = options
        WindUI:Notify({
            Title = "Upgrades Selected",
            Content = "Selected: " .. table.concat(options, ", "),
            Duration = 2
        })
    end
})

local upgradeToggle = TabHandles.UpgradeSpammer:Toggle({
    Title = "loc:SPAM_UPGRADE",
    Value = false,
    Callback = function(state)
        _G.isSpammingUpgrade = state
        WindUI:Notify({
            Title = "Upgrade Spammer",
            Content = state and "Spamming Enabled" or "Spamming Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local upgradeSpeedSlider = TabHandles.UpgradeSpammer:Slider({
    Title = "loc:UPGRADE_SPEED",
    Value = { Min = 100, Max = 1000, Default = 100 },
    Step = 10,
    Callback = function(value)
        _G.upgradeDelay = value / 1000
    end
})

TabHandles.FairyFountain:Paragraph({
    Title = "Fairy Fountain Automation",
    Desc = "Auto submit all fairy plants",
    Image = "droplet",
    ImageSize = 20,
    Color = Color3.fromHex("#30ff6a")
})

TabHandles.FairyFountain:Divider()

local fairyFountainToggle = TabHandles.FairyFountain:Toggle({
    Title = "loc:AUTO_SUBMIT_FAIRY",
    Value = false,
    Callback = function(state)
        _G.isSpammingFairyFountain = state
        WindUI:Notify({
            Title = "Fairy Fountain",
            Content = state and "Auto Submit Enabled" or "Auto Submit Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local fairyFountainSpeedSlider = TabHandles.FairyFountain:Slider({
    Title = "loc:FAIRY_SUBMIT_SPEED",
    Value = { Min = 100, Max = 1000, Default = 100 },
    Step = 10,
    Callback = function(value)
        _G.fairyFountainDelay = value / 1000
    end
})

TabHandles.Visuals:Paragraph({
    Title = "loc:SPAWN_WARNING",
    Desc = "Use with caution due to potential lag",
    Image = "alert-triangle",
    ImageSize = 20,
    Color = Color3.fromHex("#ff5555")
})

TabHandles.Visuals:Divider()

local fairySpawnToggle = TabHandles.Visuals:Toggle({
    Title = "loc:SPAWN_FAIRY",
    Value = false,
    Callback = function(state)
        _G.isSpammingFairySpawn = state
        WindUI:Notify({
            Title = "Fairy Spawner",
            Content = state and "Spawning Enabled" or "Spawning Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local fairySpawnSpeedSlider = TabHandles.Visuals:Slider({
    Title = "loc:SPAWN_SPEED",
    Value = { Min = 100, Max = 1000, Default = 100 },
    Step = 10,
    Callback = function(value)
        _G.fairySpawnDelay = value / 1000
    end
})

TabHandles.Collection:Paragraph({
    Title = "Fairy Collection",
    Desc = "loc:COLLECT_DESC",
    Image = "star",
    ImageSize = 20,
    Color = Color3.fromHex("#30ff6a")
})

TabHandles.Collection:Divider()

local fairyCollectToggle = TabHandles.Collection:Toggle({
    Title = "loc:COLLECT_FAIRY",
    Value = false,
    Callback = function(state)
        _G.isCollectingFairies = state
        WindUI:Notify({
            Title = "Fairy Collector",
            Content = state and "Collecting Enabled" or "Collecting Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local fairyCollectSpeedSlider = TabHandles.Collection:Slider({
    Title = "loc:COLLECT_SPEED",
    Value = { Min = 100, Max = 1000, Default = 100 },
    Step = 10,
    Callback = function(value)
        _G.fairyCollectDelay = value / 1000
    end
})

local function addCommas(num)
    local formatted = tostring(num)
    while true do
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end

TabHandles.VisualCurrency:Input({
    Title = "Set Sheckles Amount",
    Value = "",
    Callback = function(value)
        local num = tonumber(value)
        if num then
            Players.LocalPlayer.PlayerGui.Sheckles_UI.TextLabel.Text = addCommas(num)
        end
    end
})

TabHandles.VisualCurrency:Input({
    Title = "Set Fairy Currency Amount",
    Value = "",
    Callback = function(value)
        local num = tonumber(value)
        if num then
            Players.LocalPlayer.PlayerGui.FairyCurrency_UI.Frame.TextLabel1.Text = addCommas(num)
        end
    end
})

_G.selectedUpgrades = {upgradeOptions[1]}
_G.isSpammingUpgrade = false
_G.isSpammingFairyFountain = false
_G.isSpammingFairySpawn = false
_G.isCollectingFairies = false
_G.upgradeDelay = 0.1
_G.fairyFountainDelay = 0.1
_G.fairySpawnDelay = 0.1
_G.fairyCollectDelay = 0.1
_G.fairyIds = {}

CreateLooseFairy.OnClientEvent:Connect(function(fairyId, position, source)
    if source == "Server" then
        table.insert(_G.fairyIds, fairyId)
    end
end)

local function spamUpgrade()
    while _G.isSpammingUpgrade do
        if _G.selectedUpgrades and #_G.selectedUpgrades > 0 then
            for _, upgrade in ipairs(_G.selectedUpgrades) do
                Upgrade:FireServer(upgrade)
                task.wait(_G.upgradeDelay / #_G.selectedUpgrades)
            end
        else
            task.wait(_G.upgradeDelay)
        end
    end
end

local function spamFairyFountain()
    while _G.isSpammingFairyFountain do
        SubmitFairyFountainAllPlants:FireServer()
        task.wait(_G.fairyFountainDelay)
    end
end

local function spamFairySpawn()
    local player = Players.LocalPlayer
    local fairyUUID = "1b219b6c-bf29-4e3e-84ae-65d1b3276ace"
    while _G.isSpammingFairySpawn do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local position = player.Character.HumanoidRootPart.Position
            firesignal(CreateLooseFairy.OnClientEvent, fairyUUID, position, "Server")
        end
        task.wait(_G.fairySpawnDelay)
    end
end

local function collectFairies()
    while _G.isCollectingFairies do
        if #_G.fairyIds > 0 then
            local fairyId = table.remove(_G.fairyIds, 1)
            CollectLooseFairy:FireServer(fairyId)
        end
        task.wait(_G.fairyCollectDelay)
    end
end

task.spawn(function()
    while true do
        if _G.isSpammingUpgrade then
            spamUpgrade()
        end
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if _G.isSpammingFairyFountain then
            spamFairyFountain()
        end
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if _G.isSpammingFairySpawn then
            spamFairySpawn()
        end
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if _G.isCollectingFairies then
            collectFairies()
        end
        task.wait()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        Window:ToggleVisibility()
    end
end)

upgradeDropdown:Select({upgradeOptions[1]})
Window:SetActiveTab(TabHandles.UpgradeSpammer)
Window:ToggleVisibility(true)
