local Library, SaveManager, InterfaceManager =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kyypie69/Library.UI/refs/heads/main/Speedhub.UI.lua"))()

local Window = Library:CreateWindow({
    Title = "Muscle Legends | SpeedHub X",
    SubTitle = "50kgXMarkyy Full Port",
    TabWidth = 125,
    Size = UDim2.fromOffset(600, 325),
    Acrylic = true,
    Theme = "SpeedHubX",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
FarmTab = Window:AddTab({ Title = "Farm",        Icon = "home" }),
StatsTab = Window:AddTab({ Title = "Stats",        Icon = "home" }),
CalcTab = Window:AddTab({ Title = "Calculator",        Icon = "home" }),
KillTab = Window:AddTab({ Title = "Killer",        Icon = "home" }),
TPTab = Window:AddTab({ Title = "Teleport",        Icon = "home" }),
CrystalTab = Window:AddTab({ Title = "Crystal",        Icon = "home" }),
GiftTab = Window:AddTab({ Title = "Gift",        Icon = "home" }),
CreditsTab = Window:AddTab({ Title = "Credits",        Icon = "home" }),

-- ✅ Farm OP
local Farm = FarmTab:AddSection("Auto Farm")

Farm:AddToggle("OP_STRENGTH", {
    Title = "OP STRENGTH",
    Default = false,
    Callback = function(v)
        getgenv()._AutoRepFarmEnabled = v
    end
})

Farm:AddToggle("EAT_EGG", {
    Title = "Eat Egg (30min)",
    Default = false,
    Callback = function(v)
        getgenv().autoEatEnabled = v
    end
})

Farm:AddToggle("ANTI_LAG", {
    Title = "Anti Lag",
    Default = false,
    Callback = function(v)
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") then
                v.Enabled = not v.Enabled
            end
        end
    end
})

Farm:AddToggle("ANTI_AFK", {
    Title = "Anti AFK",
    Default = false,
    Callback = function(v)
        getgenv().AntiAfkEnabled = v
        if v then
            game.Players.LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})

Farm:AddButton({
    Title = "Auto Spin",
    Callback = function()
        _G.AutoSpinWheel = true
        spawn(function()
            while _G.AutoSpinWheel do
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer(
                    "openFortuneWheel",
                    game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"]
                )
                task.wait(0.1)
            end
        end)
    end
})

Farm:AddButton({
    Title = "Equip Swift Samurai",
    Callback = function()
        local LocalPlayer = game.Players.LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
        if not petsFolder then return end

        -- Unequip all
        for _, folder in pairs(petsFolder:GetChildren()) do
            if folder:IsA("Folder") then
                for _, pet in pairs(folder:GetChildren()) do
                    ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
                end
            end
        end
        task.wait(0.2)

        -- Equip 8 Swift Samurai
        local equipped = 0
        for _, folder in pairs(petsFolder:GetChildren()) do
            if folder:IsA("Folder") then
                for _, pet in pairs(folder:GetChildren()) do
                    if pet.Name == "Swift Samurai" and equipped < 8 then
                        ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                        equipped = equipped + 1
                        task.wait(0.1)
                    end
                end
            end
        end
        print("Equipped " .. equipped .. " Swift Samurai")
    end
})

-- ✅ Rock Farming
local Rock = FarmTab:AddSection("Rock Farming")

local rocks = {
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

for _, rockName in ipairs(rocks) do
    Rock:AddToggle("FARM_" .. rockName:gsub(" ", "_"), {
        Title = "Farm " .. rockName,
        Default = false,
        Callback = function(v)
            getgenv()["FARM_" .. rockName:gsub(" ", "_")] = v
            spawn(function()
                while getgenv()["FARM_" .. rockName:gsub(" ", "_")] do
                    for _, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Parent.Rock.Name == rockName then
                            firetouchinterest(v.Parent.Rock, game.Players.LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game.Players.LocalPlayer.Character.RightHand, 1)
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    })
end

-- ✅ Auto Tools
local Tools = FarmTab:AddSection("Auto Tools")

local toolNames = {"Punch", "Weight", "Pushups", "Handstands", "Situps"}

for _, tool in ipairs(toolNames) do
    Tools:AddToggle("AUTO_" .. tool:upper(), {
        Title = "Auto " .. tool,
        Default = false,
        Callback = function(v)
            _G["AUTO_" .. tool:upper()] = v
            spawn(function()
                while _G["AUTO_" .. tool:upper()] do
                    local toolObj = game.Players.LocalPlayer.Backpack:FindFirstChild(tool)
                    if toolObj then
                        toolObj.Parent = game.Players.LocalPlayer.Character
                        game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                    end
                    task.wait(0.1)
                end
            end)
        end
    })
end

Tools:AddToggle("FAST_TOOLS", {
    Title = "Fast Tools",
    Default = false,
    Callback = function(v)
        for _, tool in ipairs(toolNames) do
            local toolObj = game.Players.LocalPlayer.Backpack:FindFirstChild(tool)
            if toolObj and toolObj:FindFirstChild("attackTime") then
                toolObj.attackTime.Value = v and 0 or 1
            end
        end
    end
})

-- ✅ Rebirth
local Rebirth = FarmTab:AddSection("Rebirth")

Rebirth:AddInput("REBIRTH_TARGET", {
    Title = "Rebirth Target",
    Default = "",
    Callback = function(v)
        getgenv().rebirthTarget = tonumber(v)
    end
})

Rebirth:AddToggle("AUTO_REBIRTH_TARGET", {
    Title = "Auto Rebirth to Target",
    Default = false,
    Callback = function(v)
        getgenv().autoRebirthTarget = v
        spawn(function()
            while getgenv().autoRebirthTarget do
                if game.Players.LocalPlayer.leaderstats.Rebirths.Value >= getgenv().rebirthTarget then
                    getgenv().autoRebirthTarget = false
                    break
                end
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                task.wait(0.1)
            end
        end)
    end
})

Rebirth:AddToggle("INFINITE_REBIRTH", {
    Title = "Infinite Rebirth",
    Default = false,
    Callback = function(v)
        getgenv().infiniteRebirth = v
        spawn(function()
            while getgenv().infiniteRebirth do
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                task.wait(0.1)
            end
        end)
    end
})

-- ✅ Kill
local Kill = KillTab:AddSection("Combat")

Kill:AddToggle("AUTO_KILL", {
    Title = "Auto Kill",
    Default = false,
    Callback = function(v)
        getgenv().autoKill = v
        spawn(function()
            while getgenv().autoKill do
                for _, plr in ipairs(game.Players:GetPlayers()) do
                    if plr ~= game.Players.LocalPlayer then
                        local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            firetouchinterest(game.Players.LocalPlayer.Character.RightHand, root, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.RightHand, root, 1)
                        end
                    end
                end
                task.wait(0.05)
            end
        end)
    end
})

Kill:AddDropdown("SELECT_TARGET", {
    Title = "Select Target",
    Values = (function()
        local t = {}
        for _, v in ipairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                table.insert(t, v.Name)
            end
        end
        return t
    end)(),
    Callback = function(name)
        getgenv().killTarget = name
    end
})

Kill:AddToggle("KILL_TARGET", {
    Title = "Kill Selected Target",
    Default = false,
    Callback = function(v)
        getgenv().killTargetEnabled = v
        spawn(function()
            while getgenv().killTargetEnabled do
                local target = game.Players:FindFirstChild(getgenv().killTarget)
                if target and target.Character then
                    local root = target.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        firetouchinterest(game.Players.LocalPlayer.Character.RightHand, root, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.RightHand, root, 1)
                    end
                end
                task.wait(0.05)
            end
        end)
    end
})

Kill:AddButton({
    Title = "NaN Size",
    Callback = function()
        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 0/0)
    end
})

Kill:AddButton({
    Title = "God Mode",
    Callback = function()
        spawn(function()
            while true do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait()
            end
        end)
    end
})

Kill:AddButton({
    Title = "Freeze Water",
    Callback = function()
        for i = 1, 50 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(10000, 0, 10000)
            part.Position = Vector3.new(0, -10, 0) + Vector3.new(math.random(-5000, 5000), 0, math.random(-5000, 5000))
            part.Anchored = true
            part.Parent = workspace
        end
    end
})

-- ✅ Teleport
local TP = TPTab:AddSection("Locations")

local locations = {
    {"Spawn", CFrame.new(2, 8, 115)},
    {"Tiny Island", CFrame.new(-34, 7, 1903)},
    {"Frozen Island", CFrame.new(-2600, 4, -404)},
    {"Mythical Island", CFrame.new(2255, 7, 1071)},
    {"Hell Island", CFrame.new(-6768, 7, -1287)},
    {"Legend Island", CFrame.new(4604, 991, -3887)},
    {"Muscle King Island", CFrame.new(-8646, 17, -5738)},
    {"Jungle Island", CFrame.new(-8659, 6, 2384)},
    {"Brawl Lava", CFrame.new(4471, 119, -8836)},
    {"Brawl Desert", CFrame.new(960, 17, -7398)},
    {"Brawl Regular", CFrame.new(-1849, 20, -6335)}
}

for _, loc in ipairs(locations) do
    TP:AddButton({
        Title = loc[1],
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc[2]
        end
    })
end

-- ✅ Crystals
local Crystal = CrystalTab:AddSection("Auto Buy")

local pets = {
    "Blue Birdie",
    "Dark Vampy",
    "Swift Samurai",
    "Infernal Dragon",
    "Muscle Sensei",
    "Neon Guardian"
}

Crystal:AddDropdown("SELECT_PET", {
    Title = "Select Pet",
    Values = pets,
    Callback = function(name)
        getgenv().selectedPet = name
    end
})

Crystal:AddToggle("AUTO_BUY_PET", {
    Title = "Auto Buy Pet",
    Default = false,
    Callback = function(v)
        getgenv().autoBuyPet = v
        spawn(function()
            while getgenv().autoBuyPet do
                local pet = game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(getgenv().selectedPet)
                if pet then
                    game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(pet)
                end
                task.wait(0.1)
            end
        end)
    end
})

-- ✅ Gift
local Gift = GiftTab:AddSection("Gifting")

Gift:AddDropdown("GIFT_PLAYER", {
    Title = "Player to Gift",
    Values = (function()
        local t = {}
        for _, v in ipairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                table.insert(t, v.Name)
            end
        end
        return t
    end)(),
    Callback = function(name)
        getgenv().giftPlayer = name
    end
})

Gift:AddInput("EGG_COUNT", {
    Title = "Egg Count",
    Default = "0",
    Numeric = true,
    Callback = function(v)
        getgenv().eggCount = tonumber(v)
    end
})

Gift:AddButton({
    Title = "Gift Eggs",
    Callback = function()
        local player = game.Players:FindFirstChild(getgenv().giftPlayer)
        if player and getgenv().eggCount then
            for i = 1, getgenv().eggCount do
                local egg = game.Players.LocalPlayer.consumablesFolder:FindFirstChild("Protein Egg")
                if egg then
                    game:GetService("ReplicatedStorage").rEvents.giftRemote:InvokeServer("giftRequest", player, egg)
                end
            end
        end
    end
})

-- ✅ Credits
local Credits = CreditsTab:AddSection("Credits")

Credits:AddParagraph({
    Title = "Made by ⚡SailynnxShi",
    Content = "Sai ❤️ Arvelyn\nðŸ”¥H3LL_KYYðŸ”¥\nYOSHIROSHIBOLxBer\nSenXd\nK13 Clan On Top\nH3LL Clan On Top"
})

-- ✅ Auto Farm Core (Preserved)
if not getgenv()._AutoRepFarmLoop then
    getgenv()._AutoRepFarmLoop = true
    spawn(function()
        while true do
            if getgenv()._AutoRepFarmEnabled then
                local LocalPlayer = game.Players.LocalPlayer
                if LocalPlayer:FindFirstChild("muscleEvent") then
                    for i = 1, 180 do
                        LocalPlayer.muscleEvent:FireServer("rep")
                    end
                end
            end
            task.wait(0.01)
        end
    end)
end

-- ✅ Auto Eat Egg
spawn(function()
    while true do
        if getgenv().autoEatEnabled then
            local egg = game.Players.LocalPlayer.Backpack:FindFirstChild("Protein Egg")
            if egg then
                egg.Parent = game.Players.LocalPlayer.Character
                egg:Activate()
            end
            task.wait(1800) -- 30 min
        else
            task.wait(1)
        end
    end
end)

-- ✅ Notify Finish
Library:Notify({
    Title = "Shi SpeedHubX Final",
    Content = "All features loaded & fixed!",
    Duration = 3
})
