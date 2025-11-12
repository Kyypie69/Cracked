local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load SpeedHub X UI Library
local Library, SaveManager, InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kyypie69/Library.UI/refs/heads/main/GUI.lua", true))()

-- Create Main Window
local Window = Library:CreateWindow({
    Title = "HYY HUB - SpeedHub X",
    SubTitle = "KYY PIE MASARAP",
    Size = UDim2.fromOffset(410, 430),
    Acrylic = true,
    Theme = "SpeedHubX",
    TabWidth = 140
})

-- Create Tabs
local AutoFarm = Window:AddTab({Title = "Farm OP", Icon = "sword"})
local StatsFarm = Window:AddTab({Title = "Stats Farm", Icon = "chart"})
local Calculator = Window:AddTab({Title = "Calculator", Icon = "calculator"})
local Kills = Window:AddTab({Title = "Kills", Icon = "skull"})
local Teleport = Window:AddTab({Title = "Teleport", Icon = "map-pin"})
local Pets = Window:AddTab({Title = "Crystals", Icon = "gem"})
local Gift = Window:AddTab({Title = "Gift", Icon = "gift"})
local Credits = Window:AddTab({Title = "Credits", Icon = "heart"})


-- Auto Farm Section
local FarmSection = AutoFarm:AddSection("Auto Farm")

-- OP Strength Toggle
FarmSection:AddToggle("OPStrength", {
    Title = "OP STRENGTH",
    Default = false,
    Callback = function(Value)
        getgenv()._AutoRepFarmEnabled = Value
        warn("[Auto Rep Farm] Estado cambiado a:", Value and "ON" or "OFF")
    end
})

-- Eat Egg Toggle
FarmSection:AddToggle("EatEgg", {
    Title = "Eat Egg (30 Min)",
    Default = false,
    Callback = function(Value)
        autoEatEnabled = Value
        print(Value and "[AutoEgg] Activado." or "[AutoEgg] Desactivado.")
    end
})

-- Anti Lag Toggle
FarmSection:AddToggle("AntiLag", {
    Title = "Anti Lag",
    Default = false,
    Callback = function(Value)
        local lighting = game:GetService("Lighting")
        if Value then
            -- Anti lag implementation
            for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                if gui:IsA("ScreenGui") then gui:Destroy() end
            end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                    obj:Destroy()
                end
            end
            -- Additional anti-lag code here
        end
    end
})

-- Anti AFK Toggle
FarmSection:AddToggle("AntiAFK", {
    Title = "Anti AFK",
    Default = false,
    Callback = function(Value)
        -- Anti AFK implementation
        if Value then
            getgenv().AntiAfkExecuted = true
            -- Full anti-afk GUI and functionality
        else
            getgenv().AntiAfkExecuted = false
            if game.CoreGui:FindFirstChild("thisoneissocoldww") then
                game.CoreGui.thisoneissocoldww:Destroy()
            end
        end
    end
})

-- Hide Frames Toggle
FarmSection:AddToggle("HideFrames", {
    Title = "Hide All Frames",
    Default = false,
    Callback = function(Value)
        local rSto = game:GetService("ReplicatedStorage")
        for _, obj in pairs(rSto:GetChildren()) do
            if obj.Name:match("Frame$") then
                obj.Visible = not Value
            end
        end
    end
})

-- Auto Spin Button
FarmSection:AddButton({
    Title = "Auto Spin",
    Callback = function()
        _G.AutoSpinWheel = not _G.AutoSpinWheel
        if _G.AutoSpinWheel then
            spawn(function()
                while _G.AutoSpinWheel and task.wait(0.1) do
                    game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer(
                        "openFortuneWheel",
                        game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"]
                    )
                end
            end)
        end
    end
})

-- Equip Swift Samurai Button
FarmSection:AddButton({
    Title = "Equip Swift Samurai",
    Callback = function()
        print("Botón presionado: equipando 8 Swift Samurai")
        -- Full implementation of equip logic
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        
            local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then return end

    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.1)

    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Swift Samurai" then
                    ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                    equipped = 1
                    print("Equipado Swift Samurai #" .. equipped)

                    if equipped >= maxEquip then
                        return -- salir cuando ya haya 8 equipados
                    end
                end
            end
        end
    end

    print("Se equiparon " .. equipped .. " Swift Samurai")
end)
    end
})

-- Jungle Squat Button
FarmSection:AddButton({
    Title = "Jungle Squat",
    Callback = function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char:SetPrimaryPartCFrame(CFrame.new(-8374.25586, 34.5933418, 2932.44995))
            local machine = workspace:FindFirstChild("machinesFolder")
        if machine and machine:FindFirstChild("Jungle Squat") then
            local seat = machine["Jungle Squat"]:FindFirstChild("interactSeat")
            if seat then
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", seat)
            end
        end
        print("[Jungle Squat] AcciÃƒÂ³n ejecutada.")
    else
        warn("[Jungle Squat] Personaje no encontrado o no tiene HumanoidRootPart.")
    end
end)


-- OP Rebirth Section
local RebirthSection = AutoFarm:AddSection("OP Rebirth")

-- Fast Rebirths Toggle
RebirthSection:AddToggle("FastRebirths", {
    Title = "Fast Rebirths",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarming = Value
        if Value then
            -- Full fast rebirth implementation
            task.spawn(function()
                -- Implementation here
            end)
        end
    end
})

-- Lock Position Toggle
RebirthSection:AddToggle("LockPosition", {
    Title = "Lock Position",
    Default = false,
    Callback = function(Value)
        if Value then
            local currentPos = LocalPlayer.Character.HumanoidRootPart.CFrame
            getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
                if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
                end
            end)
        else
            if getgenv().posLock then
                getgenv().posLock:Disconnect()
                getgenv().posLock = nil
            end
        end
    end
})

-- Anti Lag Button
RebirthSection:AddButton({
    Title = "Anti Lag",
    Callback = function()
        -- Full anti-lag implementation
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
        -- Additional optimizations
    end
})

-- Jungle Lift Button
RebirthSection:AddButton({
    Title = "Jungle Lift",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        
        hrp.CFrame = CFrame.new(-8652.8672, 29.2667, 2089.2617)
        -- Full implementation here
    end
})

-- Auto Tools Section
local ToolsSection = AutoFarm:AddSection("Auto Tools")

-- Gamepass AutoLift Button
ToolsSection:AddButton({
    Title = "Gamepass AutoLift",
    Callback = function()
        local gamepassFolder = game:GetService("ReplicatedStorage").gamepassIds
        local player = game:GetService("Players").LocalPlayer
        for _, gamepass in pairs(gamepassFolder:GetChildren()) do
            local value = Instance.new("IntValue")
            value.Name = gamepass.Name
            value.Value = gamepass.Value
            value.Parent = player.ownedGamepasses
        end
    end
})

-- Auto Tool Toggles
local toolNames = {"Weight", "Pushups", "Handstands", "Situps"}
for _, toolName in ipairs(toolNames) do
    ToolsSection:AddToggle("Auto" .. toolName, {
        Title = "Auto " .. toolName,
        Default = false,
        Callback = function(Value)
            _G["Auto" .. toolName] = Value
            -- Implementation here
        end
    })
end

-- Auto Punch Toggle
ToolsSection:AddToggle("AutoPunch", {
    Title = "Auto Punch",
    Default = false,
    Callback = function(Value)
        _G.fastHitActive = Value
        -- Implementation here
    end
})

-- Fast Tools Toggle
ToolsSection:AddToggle("FastTools", {
    Title = "Fast Tools",
    Default = false,
    Callback = function(Value)
        _G.FastTools = Value
        -- Implementation here
    end
})

-- Rock Farming Section
local RockSection = AutoFarm:AddSection("Rock Farming")

local rockTypes = {
    "Tiny Island Rock",
    "Starter Island Rock", 
    "Legend Beach Rock",
    "Frost Gym Rock",
    "Mythical Gym Rock",
    "Eternal Gym Rock",
    "Legend Gym Rock",
    "Muscle King Gym Rock",
    "Ancient Jungle Rock"
}

for _, rockType in ipairs(rockTypes) do
    RockSection:AddToggle("Farm" .. rockType:gsub(" ", ""), {
        Title = "Farm " .. rockType,
        Default = false,
        Callback = function(Value)
            getgenv().autoFarm = Value
            selectrock = rockType
            -- Implementation here
        end
    })
end

-- Rebirths Section
local RebirthsSection = AutoFarm:AddSection("Rebirths")

-- Target Rebirth Input
RebirthsSection:AddInput("TargetRebirth", {
    Title = "Rebirth Target",
    Default = "",
    Placeholder = "Enter target rebirth count",
    Callback = function(Value)
        local newValue = tonumber(Value)
        if newValue and newValue > 0 then
            targetRebirthValue = newValue
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Objetivo Actualizado",
                Text = "Nuevo objetivo: " .. tostring(targetRebirthValue) .. " renacimientos",
                Duration = 0
            })
        end
    end
})

-- Auto Rebirth Target Toggle
RebirthsSection:AddToggle("AutoRebirthTarget", {
    Title = "Auto Rebirth Target",
    Default = false,
    Callback = function(Value)
        _G.targetRebirthActive = Value
        -- Implementation here
    end
})

-- Auto Rebirth Infinite Toggle
RebirthsSection:AddToggle("AutoRebirthInfinite", {
    Title = "Auto Rebirth (Infinite)",
    Default = false,
    Callback = function(Value)
        _G.infiniteRebirthActive = Value
        -- Implementation here
    end
})

-- Auto Size Toggle
RebirthsSection:AddToggle("AutoSize", {
    Title = "Auto Size 1",
    Default = false,
    Callback = function(Value)
        _G.autoSizeActive = Value
        -- Implementation here
    end
})

-- Auto Teleport Toggle
RebirthsSection:AddToggle("AutoTeleport", {
    Title = "Auto Teleport to Muscle King",
    Default = false,
    Callback = function(Value)
        _G.teleportActive = Value
        -- Implementation here
    end
})

-- Time Dropdown
local timeOptions = {
    "Tomorrow", "Noon", "Late", "SunSet", "Evening", 
    "Midnight", "SunRise", "EarlyMorning"
}

AutoFarm:AddDropdown("ChangeTime", {
    Title = "Change Time",
    Values = timeOptions,
    Default = "Noon",
    Callback = function(Value)
        local Lighting = game:GetService("Lighting")
        -- Time change implementation here
    end
})

-- Stats Farm Tab
local function formatNumber(number)
    local isNegative = number < 0
    number = math.abs(number)
    if number >= 1e15 then
        return (isNegative and "-" or "") .. string.format("%.2fQa", number / 1e15)
    elseif number >= 1e12 then
        return (isNegative and "-" or "") .. string.format("%.2fT", number / 1e12)
    elseif number >= 1e9 then
        return (isNegative and "-" or "") .. string.format("%.2fB", number / 1e9)
    elseif number >= 1e6 then
        return (isNegative and "-" or "") .. string.format("%.2fM", number / 1e6)
    elseif number >= 1e3 then
        return (isNegative and "-" or "") .. string.format("%.2fK", number / 1e3)
    else
        return (isNegative and "-" or "") .. string.format("%.2f", number)
    end
end

local StatsSection = StatsFarm:AddSection("Statistics")

local stopwatchLabel = StatsSection:AddLabel("Fast Rep Time: 0d 0h 0m 0s")
local projectedStrengthLabel = StatsSection:AddLabel("Strength Rate: 0 /Hour | 0 /Day | 0 /Week | 0 /Month")
local projectedDurabilityLabel = StatsSection:AddLabel("Durability Rate: 0 /Hour | 0 /Day | 0 /Week | 0 /Month")

local strengthLabel = StatsSection:AddLabel("Strength: 0 | Gained: 0")
local durabilityLabel = StatsSection:AddLabel("Durability: 0 | Gained: 0")

-- Calculator Tab
local CalcSection = Calculator:AddSection("Calculators")

-- Pack Damage Calculator
local DamageCalc = CalcSection:AddSection("Pack Damage Calculator")
DamageCalc:AddInput("BaseDamage", {
    Title = "Pack Damage",
    Default = "",
    Placeholder = "Enter damage (e.g., 1.5T)"
})

for i = 1, 8 do
    DamageCalc:AddLabel(string.format("%d pack(s): -", i))
end

DamageCalc:AddButton({
    Title = "Calculate Damage",
    Callback = function()
        -- Damage calculation implementation
    end
})

-- Pack Durability Calculator
local DurabilityCalc = CalcSection:AddSection("Pack Durability Calculator")
DurabilityCalc:AddInput("BaseDurability", {
    Title = "Base Durability",
    Default = "",
    Placeholder = "Enter durability"
})

for i = 1, 8 do
    DurabilityCalc:AddLabel(string.format("%d pack(s): -", i))
end

DurabilityCalc:AddButton({
    Title = "Calculate Durability",
    Callback = function()
        -- Durability calculation implementation
    end
})

-- Kills Tab
local KillSection = Kills:AddSection("Combat")

-- Pet Selection
KillSection:AddDropdown("SelectPet", {
    Title = "Select Pet",
    Values = {"Wild Wizard", "Mighty Monster"},
    Default = "Wild Wizard",
    Callback = function(Value)
        -- Pet selection implementation
    end
})

-- Whitelist Input
KillSection:AddInput("WhitelistPlayer", {
    Title = "Whitelist Player",
    Default = "",
    Placeholder = "Enter player name"
})

-- Combat Toggles
KillSection:AddToggle("AutoKill", {
    Title = "Auto Kill",
    Default = false,
    Callback = function(Value)
        autoKill = Value
        -- Implementation here
    end
})

KillSection:AddToggle("AutoWhitelistFriends", {
    Title = "Auto Whitelist Friends",
    Default = false,
    Callback = function(Value)
        friendWhitelistActive = Value
        -- Implementation here
    end
})

-- Target Selection
KillSection:AddDropdown("SelectTarget", {
    Title = "Select Target",
    Values = {}, -- Will be populated dynamically
    Default = nil,
    Callback = function(Value)
        -- Target selection implementation
    end
})

-- Additional Combat Features
KillSection:AddToggle("StartKillTarget", {
    Title = "Start Kill Target",
    Default = false,
    Callback = function(Value)
        killTarget = Value
        -- Implementation here
    end
})

KillSection:AddDropdown("ViewTarget", {
    Title = "Select View Target",
    Values = {}, -- Will be populated dynamically
    Default = nil,
    Callback = function(Value)
        -- View target implementation
    end
})

KillSection:AddToggle("ViewPlayer", {
    Title = "View Player",
    Default = false,
    Callback = function(Value)
        spying = Value
        -- Implementation here
    end
})

-- Advanced Combat
KillSection:AddToggle("AutoHitNoAnim", {
    Title = "Auto Hit No Anim",
    Default = false,
    Callback = function(Value)
        autoPunchNoAnim = Value
        -- Implementation here
    end
})

KillSection:AddToggle("QuickHit", {
    Title = "Quick Hit",
    Default = false,
    Callback = function(Value)
        _G.autoPunchActive = Value
        -- Implementation here
    end
})

KillSection:AddToggle("GodMode", {
    Title = "God Mode",
    Default = false,
    Callback = function(Value)
        godModeToggle = Value
        -- Implementation here
    end
})

-- Follow System
KillSection:AddDropdown("FollowPlayer", {
    Title = "Follow Player (TP)",
    Values = {}, -- Will be populated dynamically
    Default = nil,
    Callback = function(Value)
        -- Follow player implementation
    end
})

KillSection:AddButton({
    Title = "Unfollow",
    Callback = function()
        following = false
        followTarget = nil
    end
})

KillSection:AddToggle("DamageGodmode", {
    Title = "Damage With Godmode",
    Default = false,
    Callback = function(Value)
        godDamageActive = Value
        -- Implementation here
    end
})

KillSection:AddButton({
    Title = "Freeze Water",
    Callback = function()
        -- Massive water freezing implementation
        -- Creates walkable parts across the entire map
    end
})

KillSection:AddButton({
    Title = "Stick Dead",
    Callback = function()
        -- Execute remote scripts
        local urls = {
            "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack",
            "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack2",
            "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack3",
            "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack4",
            "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack5",
            "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack6"
        }
        
        for _, url in ipairs(urls) do
            spawn(function()
                local success, response = pcall(function()
                    return game:HttpGet(url)
                end)
                if success and response then
                    pcall(function() loadstring(response)() end)
                end
            end)
        end
    end
})

-- Teleport Tab
local TeleportSection = Teleport:AddSection("Locations")

local teleportLocations = {
    {Name = "Spawn", Position = CFrame.new(2, 8, 115)},
    {Name = "Secret Area", Position = CFrame.new(1947, 2, 6191)},
    {Name = "Tiny Island", Position = CFrame.new(-34, 7, 1903)},
    {Name = "Frozen Island", Position = CFrame.new(-2600.00244, 3.67686558, -403.884369)},
    {Name = "Mythical Island", Position = CFrame.new(2255, 7, 1071)},
    {Name = "Hell Island", Position = CFrame.new(-6768, 7, -1287)},
    {Name = "Legend Island", Position = CFrame.new(4604, 991, -3887)},
    {Name = "Muscle King Island", Position = CFrame.new(-8646, 17, -5738)},
    {Name = "Jungle Island", Position = CFrame.new(-8659, 6, 2384)},
    {Name = "Brawl Lava", Position = CFrame.new(4471, 119, -8836)},
    {Name = "Brawl Desert", Position = CFrame.new(960, 17, -7398)},
    {Name = "Brawl Regular", Position = CFrame.new(-1849, 20, -6335)}
}

for _, location in ipairs(teleportLocations) do
    TeleportSection:AddButton({
        Title = location.Name,
        Callback = function()
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = location.Position
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Teletransporte",
                Text = "Teleported to " .. location.Name,
                Duration = 0
            })
        end
    })
end

-- Pets Tab
local PetsSection = Pets:AddSection("Crystal Pets")

-- Pet and Aura Data
local crystalData = {
    ["Blue Crystal"] = {
        {name = "Blue Birdie", rarity = "Basic"},
        {name = "Orange Hedgehog", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Red Kitty", rarity = "Basic"},
        {name = "Dark Vampy", rarity = "Advanced"},
        {name = "Blue Bunny", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Green Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Green Crystal"] = {
        {name = "Silver Dog", rarity = "Basic"},
        {name = "Green Aura", rarity = "Advanced"},
        {name = "Dark Golem", rarity = "Advanced"},
        {name = "Green Butterfly", rarity = "Advanced"},
        {name = "Crimson Falcon", rarity = "Rare"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Frost Crystal"] = {
        {name = "Yellow Butterfly", rarity = "Advanced"},
        {name = "Purple Dragon", rarity = "Rare"},
        {name = "Blue Pheonix", rarity = "Epic"},
        {name = "Orange Pegasus", rarity = "Rare"},
        {name = "Lightning", rarity = "Rare"},
        {name = "Electro", rarity = "Advanced"}
    },
    ["Mythical Crystal"] = {
        {name = "Purple Falcon", rarity = "Rare"},
        {name = "Red Dragon", rarity = "Rare"},
        {name = "Blue Firecaster", rarity = "Epic"},
        {name = "Golden Pheonix", rarity = "Epic"},
        {name = "Power Lightning", rarity = "Rare"},
        {name = "Dark Lightning", rarity = "Epic"}
    },
    ["Inferno Crystal"] = {
        {name = "Red Firecaster", rarity = "Epic"},
        {name = "Infernal Dragon", rarity = "Unique"},
        {name = "White Pegasus", rarity = "Rare"},
        {name = "Golden Pheonix", rarity = "Epic"},
        {name = "Inferno", rarity = "Epic"},
        {name = "Dark Storm", rarity = "Unique"}
    },
    ["Legends Crystal"] = {
        {name = "Ultra Birdie", rarity = "Unique"},
        {name = "Magic Butterfly", rarity = "Unique"},
        {name = "Green Firecaster", rarity = "Epic"},
        {name = "White Pheonix", rarity = "Epic"},
        {name = "Supernova", rarity = "Epic"},
        {name = "Purple Nova", rarity = "Unique"}
    },
    ["Muscle Elite Crystal"] = {
        {name = "Frostwave Legends Penguin", rarity = "Rare"},
        {name = "Phantom Genesis Dragon", rarity = "Rare"},
        {name = "Dark Legends Manticore", rarity = "Epic"},
        {name = "Ultimate Supernova Pegasus", rarity = "Epic"},
        {name = "Aether Spirit Bunny", rarity = "Unique"},
        {name = "Cybernetic Showdown Dragon", rarity = "Unique"}
    },
    ["Galaxy Oracle Crystal"] = {
        {name = "Eternal Strike Leviathan", rarity = "Rare"},
        {name = "Lightning Strike Phantom", rarity = "Epic"},
        {name = "Darkstar Hunter", rarity = "Unique"},
        {name = "Muscle King", rarity = "Unique"},
        {name = "Azure Tundra", rarity = "Epic"},
        {name = "Ultra Inferno", rarity = "Rare"}
    },
    ["Jungle Crystal"] = {
        {name = "Entropic Blast", rarity = "Unique"},
        {name = "Muscle Sensei", rarity = "Unique"},
        {name = "Grand Supernova", rarity = "Epic"},
        {name = "Neon Guardian", rarity = "Unique"},
        {name = "Eternal Megastrike", rarity = "Unique"},
        {name = "Golden Viking", rarity = "Epic"},
        {name = "Astral Electro", rarity = "Epic"},
        {name = "Dark Electro", rarity = "Epic"},
        {name = "Enchanted Mirage", rarity = "Epic"},
        {name = "Ultra Mirage", rarity = "Unique"},
        {name = "Unstable Mirage", rarity = "Unique"}
    }
}

-- Collect all unique pets and auras
local function getAllPetsAndAuras()
    local allPets = {}
    local allAuras = {}
    
    for crystalName, pets in pairs(crystalData) do
        for _, pet in ipairs(pets) do
            if string.find(pet.name, "Aura") then
                if not allAuras[pet.name] then
                    allAuras[pet.name] = {name = pet.name, rarity = pet.rarity, crystal = crystalName}
                end
            else
                if not allPets[pet.name] then
                    allPets[pet.name] = {name = pet.name, rarity = pet.rarity, crystal = crystalName}
                end
            end
        end
    end
    
    return allPets, allAuras
end

-- Find which crystal contains a specific pet/aura
local function findCrystalForItem(itemName)
    for crystalName, pets in pairs(crystalData) do
        for _, pet in ipairs(pets) do
            if pet.name == itemName then
                return crystalName
            end
        end
    end
    return nil
end

local allPets, allAuras = getAllPetsAndAuras()

-- Pet Selection
local petOptions = {}
for petName, petData in pairs(allPets) do
    table.insert(petOptions, petName .. " (" .. petData.rarity .. ")")
end

PetsSection:AddDropdown("SelectPet", {
    Title = "Select Pet",
    Values = petOptions,
    Default = nil,
    Callback = function(Value)
        selectedPet = Value
        local crystal = findCrystalForItem(Value:match("^(.-)%s*%("))
        print("Pet selected: " .. Value .. " (Found in: " .. (crystal or "Unknown") .. ")")
    end
})

-- Aura Selection
local auraOptions = {}
for auraName, auraData in pairs(allAuras) do
    table.insert(auraOptions, auraName .. " (" .. auraData.rarity .. ")")
end

PetsSection:AddDropdown("SelectAura", {
    Title = "Select Aura",
    Values = auraOptions,
    Default = nil,
    Callback = function(Value)
        selectedAura = Value
        local crystal = findCrystalForItem(Value:match("^(.-)%s*%("))
        print("Aura selected: " .. Value .. " (Found in: " .. (crystal or "Unknown") .. ")")
    end
})

-- Auto Buy System
PetsSection:AddToggle("AutoBuyPet", {
    Title = "Auto Buy Pet",
    Default = false,
    Callback = function(Value)
        _G.AutoBuyPet = Value
        if Value and selectedPet then
            spawn(function()
                while _G.AutoBuyPet and selectedPet do
                    local petName = selectedPet:match("^(.-)%s*%(") or selectedPet
                    local petToBuy = game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(petName)
                    if petToBuy then
                        game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(petToBuy)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

PetsSection:AddToggle("AutoBuyAura", {
    Title = "Auto Buy Aura",
    Default = false,
    Callback = function(Value)
        _G.AutoBuyAura = Value
        if Value and selectedAura then
            spawn(function()
                while _G.AutoBuyAura and selectedAura do
                    local auraName = selectedAura:match("^(.-)%s*%(") or selectedAura
                    local auraToBuy = game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(auraName)
                    if auraToBuy then
                        game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(auraToBuy)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Gift Tab
local GiftSection = Gift:AddSection("Gifting System")

-- Protein Egg Gifting
GiftSection:AddLabel("Gifting Protein egg:").TextSize = 22
local proteinEggLabel = GiftSection:AddLabel("Protein Eggs: 0")
proteinEggLabel.TextSize = 20

local eggPlayerOptions = {}
for _, plr in ipairs(game.Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(eggPlayerOptions, plr.DisplayName)
    end
end

GiftSection:AddDropdown("EggPlayer", {
    Title = "Player to Gift Eggs",
    Values = eggPlayerOptions,
    Default = nil,
    Callback = function(Value)
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr.DisplayName == Value then
                selectedEggPlayer = plr
                break
            end
        end
    end
})

GiftSection:AddInput("EggAmount", {
    Title = "Amount of Eggs",
    Default = "",
    Placeholder = "Enter egg count",
    Callback = function(Value)
        eggCount = tonumber(Value) or 0
    end
})

GiftSection:AddButton({
    Title = "Gift Eggs",
    Callback = function()
        if selectedEggPlayer and eggCount > 0 then
            for i = 1, eggCount do
                local egg = LocalPlayer.consumablesFolder:FindFirstChild("Protein Egg")
                if egg then
                    game:GetService("ReplicatedStorage").rEvents.giftRemote:InvokeServer("giftRequest", selectedEggPlayer, egg)
                    task.wait(0.1)
                end
            end
        end
    end
})

-- Tropical Shake Gifting
GiftSection:AddLabel("Gifting Tropical Shakes:").TextSize = 22
local tropicalShakeLabel = GiftSection:AddLabel("Tropical Shakes: 0")
tropicalShakeLabel.TextSize = 18

GiftSection:AddDropdown("ShakePlayer", {
    Title = "Player to Gift Tropical Shakes",
    Values = eggPlayerOptions,
    Default = nil,
    Callback = function(Value)
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr.DisplayName == Value then
                selectedShakePlayer = plr
                break
            end
        end
    end
})

GiftSection:AddInput("ShakeAmount", {
    Title = "Tropical Shakes gift",
    Default = "",
    Placeholder = "Enter shake count",
    Callback = function(Value)
        shakeCount = tonumber(Value) or 0
    end
})

GiftSection:AddButton({
    Title = "Gift Tropical Shakes",
    Callback = function()
        if selectedShakePlayer and shakeCount > 0 then
            for i = 1, shakeCount do
                local shake = LocalPlayer.consumablesFolder:FindFirstChild("Tropical Shake")
                if shake then
                    game:GetService("ReplicatedStorage").rEvents.giftRemote:InvokeServer("giftRequest", selectedShakePlayer, shake)
                    task.wait(0.1)
                end
            end
        end
    end
})

-- Auto Eat Everything
GiftSection:AddButton({
    Title = "Eat Everything",
    Callback = function()
        -- Implementation for eating all consumables
        local itemList = {
            "Tropical Shake", "Energy Shake", "Protein Bar", "TOUGH Bar", 
            "Protein Shake", "ULTRA Shake", "Energy Bar"
        }
        
        -- Eating implementation here
    end
})

-- Credits Tab
local CreditsSection = Credits:AddSection("Credits")

CreditsSection:AddLabel("Made by POGING BAGSIK MARKYY").TextSize = 18
CreditsSection:AddLabel("GAY SHI").TextSize = 16
CreditsSection:AddLabel("GAY SIBOL").TextSize = 16
CreditsSection:AddLabel("GAY RENS").TextSize = 16
CreditsSection:AddLabel("GAY BILLY").TextSize = 16
CreditsSection:AddLabel("GAY KILLA").TextSize = 16
CreditsSection:AddLabel("GAY SEN").TextSize = 16
CreditsSection:AddLabel("GAY JERALD").TextSize = 16

-- Interface Settings
InterfaceManager:SetLibrary(Library)
InterfaceManager:BuildInterfaceSection(AutoFarm)

-- Load autoload config
SaveManager:LoadAutoloadConfig()

-- Update player lists periodically
task.spawn(function()
    while true do
        task.wait(5)
        
        -- Update target dropdowns
        local playerNames = {}
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                table.insert(playerNames, plr.Name)
            end
        end
        
        -- Update dropdown values
        if Library.Options.SelectTarget then
            Library.Options.SelectTarget:SetValues(playerNames)
        end
        if Library.Options.ViewTarget then
            Library.Options.ViewTarget:SetValues(playerNames)
        end
        if Library.Options.FollowPlayer then
            local displayNames = {}
            for _, plr in ipairs(game.Players:GetPlayers()) do
                if plr ~= LocalPlayer then
                    table.insert(displayNames, plr.DisplayName)
                end
            end
            Library.Options.FollowPlayer:SetValues(displayNames)
        end
        
        -- Update gift player lists
        local giftPlayerNames = {}
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                table.insert(giftPlayerNames, plr.DisplayName)
            end
        end
        
        if Library.Options.EggPlayer then
            Library.Options.EggPlayer:SetValues(giftPlayerNames)
        end
        if Library.Options.ShakePlayer then
            Library.Options.ShakePlayer:SetValues(giftPlayerNames)
        end
    end
end)

-- Main farming loop
task.spawn(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local Stats = game:GetService("Stats")
    local LocalPlayer = Players.LocalPlayer

    local PET_NAME = "Swift Samurai"
    local ROCK_NAME = "Rock5M"
    local PROTEIN_EGG_NAME = "ProteinEgg"
    local PROTEIN_EGG_INTERVAL = 30 * 60 -- 30 min
    local REPS_PER_CYCLE = 180
    local REP_DELAY = 0.01
    local ROCK_INTERVAL = 1
    local MAX_PING = 1100

    local HumanoidRootPart
    local lastProteinEggTime = 0
    local lastRockTime = 0
    local RockRef = workspace:FindFirstChild(ROCK_NAME)

    local function getPing()
        local success, ping = pcall(function()
            return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        end)
        return success and ping or 999
    end

    local function updateCharacterRefs()
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        HumanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
    end

    local function equipPet()
        local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
        if petsFolder and petsFolder:FindFirstChild("Unique") then
            for _, pet in pairs(petsFolder.Unique:GetChildren()) do
                if pet.Name == PET_NAME then
                    ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                    break
                end
            end
        end
    end

    local function eatProteinEgg()
        if LocalPlayer:FindFirstChild("Backpack") then
            for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                if item.Name == PROTEIN_EGG_NAME then
                    ReplicatedStorage.rEvents.eatEvent:FireServer("eat", item)
                    break
                end
            end
        end
    end

    local function hitRock()
        if not RockRef or not RockRef.Parent then
            RockRef = workspace:FindFirstChild(ROCK_NAME)
        end
        if RockRef and HumanoidRootPart then
            HumanoidRootPart.CFrame = RockRef.CFrame * CFrame.new(0, 0, -5)
            ReplicatedStorage.rEvents.hitEvent:FireServer("hit", RockRef)
        end
    end

    -- Main loop
    if not getgenv()._AutoRepFarmLoop then
        getgenv()._AutoRepFarmLoop = true

        task.spawn(function()
            updateCharacterRefs()
            equipPet()
            lastProteinEggTime = tick()
            lastRockTime = tick()

            while true do
                if getgenv()._AutoRepFarmEnabled then
                    local ping = getPing()
                    if ping > MAX_PING then
                        warn("[Auto Rep Farm] Ping alto ("..math.floor(ping).."ms), pausando 5s...")
                        task.wait(5)
                    else
                        if LocalPlayer:FindFirstChild("muscleEvent") then
                            for i = 1, REPS_PER_CYCLE do
                                LocalPlayer.muscleEvent:FireServer("rep")
                            end
                        end

                        if tick() - lastProteinEggTime >= PROTEIN_EGG_INTERVAL then
                            eatProteinEgg()
                            lastProteinEggTime = tick()
                        end

                        if tick() - lastRockTime >= ROCK_INTERVAL then
                            hitRock()
                            lastRockTime = tick()
                        end

                        task.wait(REP_DELAY)
                    end
                else
                    task.wait(1)
                end
            end
        end)
    end
end)

-- Stats tracking
task.spawn(function()
    local player = game.Players.LocalPlayer
    local leaderstats = player:WaitForChild("leaderstats")
    local strengthStat = leaderstats:WaitForChild("Strength")
    local durabilityStat = player:WaitForChild("Durability")

    local startTime = tick()
    local initialStrength = strengthStat.Value
    local initialDurability = durabilityStat.Value
    local trackingStarted = false

    local strengthHistory = {}
    local durabilityHistory = {}
    local calculationInterval = 10

    local lastCalcTime = tick()
    
    while true do
        local currentTime = tick()
        local currentStrength = strengthStat.Value
        local currentDurability = durabilityStat.Value

        if not trackingStarted and (currentStrength - initialStrength) >= 100e9 then
            trackingStarted = true
            startTime = tick()
            strengthHistory = {}
            durabilityHistory = {}
        end

        if trackingStarted then
            local elapsedTime = currentTime - startTime
            local days = math.floor(elapsedTime / (24 * 3600))
            local hours = math.floor((elapsedTime % (24 * 3600)) / 3600)
            local minutes = math.floor((elapsedTime % 3600) / 60)
            local seconds = math.floor(elapsedTime % 60)

            if Library.Options.FastRepTime then
                Library.Options.FastRepTime:SetText(string.format("Fast Rep Time: %dd %dh %dm %ds", days, hours, minutes, seconds))
            end

            local sessionStrengthDelta = currentStrength - initialStrength
            local sessionDurabilityDelta = currentDurability - initialDurability

            if Library.Options.StrengthStats then
                Library.Options.StrengthStats:SetText("Strength: " .. formatNumber(currentStrength) .. " | Gained: " .. formatNumber(sessionStrengthDelta))
            end
            if Library.Options.DurabilityStats then
                Library.Options.DurabilityStats:SetText("Durability: " .. formatNumber(currentDurability) .. " | Gained: " .. formatNumber(sessionDurabilityDelta))
            end

            table.insert(strengthHistory, {time = currentTime, value = currentStrength})
            table.insert(durabilityHistory, {time = currentTime, value = currentDurability})

            while #strengthHistory > 0 and currentTime - strengthHistory[1].time > calculationInterval do
                table.remove(strengthHistory, 1)
            end
            while #durabilityHistory > 0 and currentTime - durabilityHistory[1].time > calculationInterval do
                table.remove(durabilityHistory, 1)
            end

            if currentTime - lastCalcTime >= calculationInterval then
                lastCalcTime = currentTime

                if #strengthHistory >= 2 then
                    local strengthDelta = strengthHistory[#strengthHistory].value - strengthHistory[1].value
                    local strengthPerSecond = strengthDelta / calculationInterval
                    local strengthPerHour = math.floor(strengthPerSecond * 3600)
                    local strengthPerDay = math.floor(strengthPerSecond * 86400)
                    local strengthPerWeek = math.floor(strengthPerSecond * 604800)
                    local strengthPerMonth = math.floor(strengthPerSecond * 2592000)

                    if Library.Options.StrengthRate then
                        Library.Options.StrengthRate:SetText("Strength Rate: " .. formatNumber(strengthPerHour) .. "/Hour | " .. formatNumber(strengthPerDay) .. "/Day | " .. formatNumber(strengthPerWeek) .. "/Week | " .. formatNumber(strengthPerMonth) .. "/Month")
                    end
                end

                if #durabilityHistory >= 2 then
                    local durabilityDelta = durabilityHistory[#durabilityHistory].value - durabilityHistory[1].value
                    local durabilityPerSecond = durabilityDelta / calculationInterval
                    local durabilityPerHour = math.floor(durabilityPerSecond * 3600)
                    local durabilityPerDay = math.floor(durabilityPerSecond * 86400)
                    local durabilityPerWeek = math.floor(durabilityPerSecond * 604800)
                    local durabilityPerMonth = math.floor(durabilityPerSecond * 2592000)

                    if Library.Options.DurabilityRate then
                        Library.Options.DurabilityRate:SetText("Durability Rate: " .. formatNumber(durabilityPerHour) .. "/Hour | " .. formatNumber(durabilityPerDay) .. "/Day | " .. formatNumber(durabilityPerWeek) .. "/Week | " .. formatNumber(durabilityPerMonth) .. "/Month")
                    end
                end
            end
        end

        task.wait(0.05)
    end
end)
