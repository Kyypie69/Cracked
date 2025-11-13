local Library, SaveManager, InterfaceManager =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kyypie69/Library.UI/refs/heads/main/Speedhub.UI.lua"))()

local Window = Library:CreateWindow({
    Title = "Markyy | Muscle Legends",
    SubTitle = "KYY HUB x KYY PIE",
    TabWidth = 125,
    Size = UDim2.fromOffset(450, 325),
    Acrylic = true,
    Theme = "SpeedHubX",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Farm    = Window:AddTab({ Title = "Main",        Icon = "home" }),
    Stats   = Window:AddTab({ Title = "Stats",   Icon = "bot" }),
    Calc    = Window:AddTab({ Title = "Calculator",      Icon = "refresher-cw" }),
    Kill    = Window:AddTab({ Title = "Killer",     Icon = "skull" }),
    TP      = Window:AddTab({ Title = "Teleport",     Icon = "map-pin" }),
    Crystal = Window:AddTab({ Title = "Crystal",       Icon = "activity" }),
    Gift    = Window:AddTab({ Title = "Gift",        Icon = "cloud" }),
    Credits = Window:AddTab({ Title = "Credits",         Icon = "settings" })
}

local Farm = Tabs.Farm:AddSection("Auto Farm")

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
    Callback = function()
        local lighting = game:GetService("Lighting")
    if State then
        for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") then gui:Destroy() end
        end
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                obj:Destroy()
            end
        end
        for _, v in pairs(lighting:GetChildren()) do
            if v:IsA("Sky") then v:Destroy() end
        end
        local darkSky = Instance.new("Sky")
        darkSky.Name = "DarkSky"
        darkSky.SkyboxBk = "rbxassetid://0"
        darkSky.SkyboxDn = "rbxassetid://0"
        darkSky.SkyboxFt = "rbxassetid://0"
        darkSky.SkyboxLf = "rbxassetid://0"
        darkSky.SkyboxRt = "rbxassetid://0"
        darkSky.SkyboxUp = "rbxassetid://0"
        darkSky.Parent = lighting
        lighting.Brightness = 0
        lighting.ClockTime = 0
        lighting.TimeOfDay = "00:00:00"
        lighting.OutdoorAmbient = Color3.new(0,0,0)
        lighting.Ambient = Color3.new(0,0,0)
        lighting.FogColor = Color3.new(0,0,0)
        lighting.FogEnd = 100
        task.spawn(function()
            while State do
                task.wait(5)
                if not lighting:FindFirstChild("DarkSky") then
                    darkSky:Clone().Parent = lighting
                end
            end
        end)
    end
end
})

Farm:AddToggle("ANTI_AFK", {
    Title = "Anti AFK",
    Default = false,
    Callback = function()
        if state then
        -- Ã¢Å“â€¦ ACTIVAR ANTI AFK
        if getgenv().AntiAfkExecuted and thisoneissocoldww then 
            getgenv().AntiAfkExecuted = false
            getgenv().zamanbaslaticisi = false
            game.CoreGui.thisoneissocoldww:Destroy()
        end
        getgenv().AntiAfkExecuted = true

        local thisoneissocoldww = Instance.new("ScreenGui")
        local madebybloodofbatus = Instance.new("Frame")
        local UICornerw = Instance.new("UICorner")
        local DestroyButton = Instance.new("TextButton")
        local uselesslabelone = Instance.new("TextLabel")
        local timerlabel = Instance.new("TextLabel")
        local uselesslabeltwo = Instance.new("TextLabel")
        local fpslabel = Instance.new("TextLabel")
        local uselesslabelthree = Instance.new("TextLabel")
        local pinglabel = Instance.new("TextLabel")
        local uselessframeone = Instance.new("Frame")
        local UICornerww = Instance.new("UICorner")
        local uselesslabelfour = Instance.new("TextLabel")

        thisoneissocoldww.Name = "thisoneissocoldww"
        thisoneissocoldww.Parent = game.CoreGui
        thisoneissocoldww.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        madebybloodofbatus.Name = "madebybloodofbatus"
        madebybloodofbatus.Parent = thisoneissocoldww
        madebybloodofbatus.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        madebybloodofbatus.Position = UDim2.new(0.085,0,0.13,0)
        madebybloodofbatus.Size = UDim2.new(0,225,0,96)
        UICornerw.Parent = madebybloodofbatus

        DestroyButton.Name = "DestroyButton"
        DestroyButton.Parent = madebybloodofbatus
        DestroyButton.BackgroundTransparency = 1
        DestroyButton.Position = UDim2.new(0.87,0,0.02,0)
        DestroyButton.Size = UDim2.new(0,27,0,15)
        DestroyButton.Font = Enum.Font.SourceSans
        DestroyButton.Text = "X"
        DestroyButton.TextColor3 = Color3.fromRGB(255,255,255)
        DestroyButton.TextSize = 14
        DestroyButton.MouseButton1Click:Connect(function()
            getgenv().AntiAfkExecuted = false
            wait(0.1)
            thisoneissocoldww:Destroy()
        end)

        uselesslabelone.Parent = madebybloodofbatus
        uselesslabelone.BackgroundTransparency = 1
        uselesslabelone.Position = UDim2.new(0.3,0,0,0)
        uselesslabelone.Size = UDim2.new(0,95,0,24)
        uselesslabelone.Font = Enum.Font.SourceSans
        uselesslabelone.Text = "Anti Afk Activated"
        uselesslabelone.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabelone.TextSize = 14

        timerlabel.Parent = madebybloodofbatus
        timerlabel.BackgroundTransparency = 1
        timerlabel.Position = UDim2.new(0.65,0,0.68,0)
        timerlabel.Size = UDim2.new(0,60,0,24)
        timerlabel.Font = Enum.Font.SourceSans
        timerlabel.Text = "0:0:0"
        timerlabel.TextColor3 = Color3.fromRGB(255,255,255)
        timerlabel.TextSize = 14

        uselesslabeltwo.Parent = madebybloodofbatus
        uselesslabeltwo.BackgroundTransparency = 1
        uselesslabeltwo.Position = UDim2.new(0.03,0,0.37,0)
        uselesslabeltwo.Size = UDim2.new(0,29,0,24)
        uselesslabeltwo.Font = Enum.Font.SourceSans
        uselesslabeltwo.Text = "Ping: "
        uselesslabeltwo.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabeltwo.TextSize = 14

        fpslabel.Parent = madebybloodofbatus
        fpslabel.BackgroundTransparency = 1
        fpslabel.Position = UDim2.new(0.72,0,0.35,0)
        fpslabel.Size = UDim2.new(0,55,0,24)
        fpslabel.Font = Enum.Font.SourceSans
        fpslabel.Text = "0"
        fpslabel.TextColor3 = Color3.fromRGB(255,255,255)
        fpslabel.TextSize = 14

        uselesslabelthree.Parent = madebybloodofbatus
        uselesslabelthree.BackgroundTransparency = 1
        uselesslabelthree.Position = UDim2.new(0.5,0,0.35,0)
        uselesslabelthree.Size = UDim2.new(0,26,0,24)
        uselesslabelthree.Font = Enum.Font.SourceSans
        uselesslabelthree.Text = "Fps: "
        uselesslabelthree.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabelthree.TextSize = 14

        pinglabel.Parent = madebybloodofbatus
        pinglabel.BackgroundTransparency = 1
        pinglabel.Position = UDim2.new(0.2,0,0.37,0)
        pinglabel.Size = UDim2.new(0,55,0,24)
        pinglabel.Font = Enum.Font.SourceSans
        pinglabel.Text = "0"
        pinglabel.TextColor3 = Color3.fromRGB(255,255,255)
        pinglabel.TextSize = 14
        pinglabel.TextWrapped = true

        uselessframeone.Parent = madebybloodofbatus
        uselessframeone.BackgroundColor3 = Color3.fromRGB(255,255,255)
        uselessframeone.Position = UDim2.new(0.004,0,0.24,0)
        uselessframeone.Size = UDim2.new(0,224,0,5)
        UICornerww.CornerRadius = UDim.new(0,50)
        UICornerww.Parent = uselessframeone

        uselesslabelfour.Parent = madebybloodofbatus
        uselesslabelfour.BackgroundTransparency = 1
        uselesslabelfour.Position = UDim2.new(0.05,0,0.81,0)
        uselesslabelfour.Size = UDim2.new(0,95,0,12)
        uselesslabelfour.Font = Enum.Font.SourceSans
        uselesslabelfour.Text = "Anti-Afk Auto Enabled"
        uselesslabelfour.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabelfour.TextSize = 14

        -- Ã°Å¸Â§Â² Draggable UI
        local Drag = madebybloodofbatus
        local gsTween = game:GetService("TweenService")
        local UserInputService = game:GetService("UserInputService")
        local dragging, dragInput, dragStart, startPos
        local function update(input)
            local delta = input.Position - dragStart
            local dragTime = 0.04
            local SmoothDrag = {}
            SmoothDrag.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
            gsTween:Create(Drag,TweenInfo.new(dragTime,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),SmoothDrag):Play()
        end
        Drag.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = Drag.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        Drag.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then update(input) end
        end)

        -- Ã°Å¸â€™Â¤ Anti-AFK Core
        local vu = game:GetService('VirtualUser')
        game.Players.LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)

        -- Ã¢Å¡Â¡ FPS & Ping
        local RunService = game:GetService("RunService")
        local sec = tick()
        local FPS = {}
        RunService.RenderStepped:Connect(function()
            local fr = tick()
            for i=#FPS,1,-1 do FPS[i+1] = (FPS[i]>=fr-1) and FPS[i] or nil end
            FPS[1] = fr
            local fps = math.floor((tick()-sec>=1 and #FPS) or (#FPS/(tick()-sec)))
            fpslabel.Text = fps
        end)

        spawn(function()
            while getgenv().AntiAfkExecuted do
                wait(1)
                local ping = math.floor(tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue()))
                pinglabel.Text = ping
            end
        end)

        -- Ã¢ÂÂ±Ã¯Â¸Â Timer
        local saniye, dakika, saat = 0,0,0
        getgenv().zamanbaslaticisi = true
        spawn(function()
            while getgenv().zamanbaslaticisi do
                saniye = saniye + 1
                wait(1)
                if saniye>=60 then saniye=0;dakika=dakika+1 end
                if dakika>=60 then dakika=0;saat=saat+1 end
                timerlabel.Text = saat..":"..dakika..":"..saniye
            end
        end)
    else
        -- Ã¢ÂÅ’ DESACTIVAR ANTI AFK
        getgenv().AntiAfkExecuted = false
        getgenv().zamanbaslaticisi = false
        if game.CoreGui:FindFirstChild("thisoneissocoldww") then
            game.CoreGui.thisoneissocoldww:Destroy()
        end
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
local Rock = Tabs.Farm:AddSection("Rock Farming")

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
local Tools = Tabs.Farm:AddSection("Auto Tools")

local toolNames = {"Punch", "Weight", "Pushups", "Handstands", "Situps"}

for _, tool in ipairs(toolNames) do
    Tools:AddToggle("AUTO_" .. tool:upper(), {
        Title = "Auto " .. tool,
        Default = false,
        Callback = function(v)
            G.fastHitActive = Value
    
    if Value then
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then
                    punch.Parent = LocalPlayer.Character
                    if punch:FindFirstChild("attackTime") then
                        punch.attackTime.Value = 0
                    end
                end
                task.wait(0.1)
            end
        end)
        
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                
                local character = LocalPlayer.Character
                if character then
                    local punchTool = character:FindFirstChild("Punch")
                    if punchTool then
                        punchTool:Activate()
                    end
                end
                task.wait()
            end
        end)
    else
        local character = LocalPlayer.Character
        local equipped = character:FindFirstChild("Punch")
        if equipped then
            equipped.Parent = LocalPlayer.Backpack
        end
    end
end)

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
local Rebirth = Tabs.Farm:AddSection("Rebirth")

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
            while getgenv().autoRebirthTarget do                if game.Players.LocalPlayer.leaderstats.Rebirths.Value >= getgenv().rebirthTarget then
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
local Kill = Tabs.Kill:AddSection("Combat")

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
local TP = Tabs.TP:AddSection("Locations")

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
local Crystal = Tabs.Crystal:AddSection("Auto Buy")

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
local Gift = Tabs.Gift:AddSection("Gifting")

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
local Credits = Tabs.Credits:AddSection("Credits")

Credits:AddParagraph({
    Title = "Made by MARKYY -pie"
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

Library:Notify({
    Title = "KYY 6.9",
    Content = "HANDSOME MOMINTS NI MARKYY",
    Duration = 3
})
