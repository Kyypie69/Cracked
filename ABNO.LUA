-- =====================================================================
--  SHI PAID  |  FLUENT RENEWED FULL PORT
--  Author : SailynnxShi  |  Re-built by AI
-- =====================================================================
local Fluent = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

-- ---------------------------------------------------------------------
--  WINDOW
-- ---------------------------------------------------------------------
local Window = Fluent:CreateWindow({
    Title = "Shi PAID",
    SubTitle = "Fluent Renewed Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(610,830),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- ---------------------------------------------------------------------
--  SERVICES & SHORTCUTS
-- ---------------------------------------------------------------------
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local WS = workspace
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")

-- ---------------------------------------------------------------------
--  TABS
-- ---------------------------------------------------------------------
local Tabs = {
    AutoFarm = Window:AddTab({Title="Farm OP", Icon="hammer"}),
    StatsFarm = Window:AddTab({Title="Stats Farm", Icon="chart-line"}),
    Calculator = Window:AddTab({Title="Calculator", Icon="calculator"}),
    Kills = Window:AddTab({Title="Kills", Icon="sword"}),
    Teleport = Window:AddTab({Title="Teleport", Icon="map-pin"}),
    Crystals = Window:AddTab({Title="Crystals", Icon="gem"}),
    Gift = Window:AddTab({Title="Gift", Icon="gift"}),
    Credits = Window:AddTab({Title="Credits", Icon="heart"})
}

local AF = Tabs.AutoFarm

AF:AddToggle("OPStrength", {Title="OP STRENGTH", Default=false, Callback=function(v)
    getgenv()._AutoRepFarmEnabled = v
end})

AF:AddToggle("EatEgg30", {Title="Eat Egg (30 min)", Default=false, Callback=function(v)
    getgenv().autoEatEnabled = v
end})

AF:AddToggle("AntiLag", {Title="Anti Lag", Default=false, Callback=function(v)
    if v then
        for _,o in pairs(WS:GetDescendants()) do
            if o:IsA("ParticleEmitter") or o:IsA("PointLight") or o:IsA("SpotLight") or o:IsA("SurfaceLight") then o:Destroy() end
        end
        for _,sky in pairs(game.Lighting:GetChildren()) do if sky:IsA("Sky") then sky:Destroy() end end
        local darkSky = Instance.new("Sky")
        for _,prop in pairs({"SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"}) do darkSky[prop] = "rbxassetid://0" end
        darkSky.Parent = game.Lighting
        game.Lighting.Brightness = 0
        game.Lighting.ClockTime = 0
        game.Lighting.OutdoorAmbient = Color3.new(0,0,0)
        game.Lighting.Ambient = Color3.new(0,0,0)
        game.Lighting.FogColor = Color3.new(0,0,0)
        game.Lighting.FogEnd = 100
    end
end})

AF:AddToggle("AntiAFK", {Title="Anti AFK", Default=false, Callback=function(v)
    if v then
        LocalPlayer.Idled:Connect(function() VU:CaptureController(); VU:ClickButton2(Vector2.new()) end)
    end
end})

AF:AddButton("Jungle Squat", function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(-8374.25586, 34.5933418, 2932.44995)
    local mach = WS:FindFirstChild("machinesFolder") and WS.machinesFolder:FindFirstChild("Jungle Squat")
    if mach then
        RS.rEvents.machineInteractRemote:InvokeServer("useMachine", mach.interactSeat)
    end
end)

AF:AddButton("Auto Spin", function()
    _G.AutoSpinWheel = true
    while _G.AutoSpinWheel do
        RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", RS.fortuneWheelChances["Fortune Wheel"])
        task.wait(0.1)
    end
end)

AF:AddButton("Equip Swift Samurai", function()
    for _,folder in pairs(LocalPlayer.petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _,pet in pairs(folder:GetChildren()) do RS.rEvents.equipPetEvent:FireServer("unequipPet", pet) end
        end
    end
    task.wait(.1)
    local equipped = 0
    for _,folder in pairs(LocalPlayer.petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _,pet in pairs(folder:GetChildren()) do
                if pet.Name=="Swift Samurai" and equipped<8 then
                    RS.rEvents.equipPetEvent:FireServer("equipPet", pet)
                    equipped = 1
                end
            end
        end
    end
end)

-- Fast Rebirths
AF:AddToggle("FastRebirths", {Title="Fast Rebirths", Default=false, Callback=function(v)
    getgenv().AutoFarming = v
    if v then
        task.spawn(function()
            while getgenv().AutoFarming do
                local req = 10000 + 5000*LocalPlayer.leaderstats.Rebirths.Value
                local golden = (LocalPlayer:FindFirstChild("ultimatesFolder") and LocalPlayer.ultimatesFolder:FindFirstChild("Golden Rebirth")) and LocalPlayer.ultimatesFolder["Golden Rebirth"].Value or 0
                if golden>=1 and golden<=5 then req = req * (1 - golden*0.1) end
                req = math.floor(req)
                -- equip swift
                for _,f in pairs(LocalPlayer.petsFolder:GetChildren()) do if f:IsA("Folder") then for _,p in pairs(f:GetChildren()) do if p.Name=="Swift Samurai" then RS.rEvents.equipPetEvent:FireServer("equipPet", p) end end end end
                while LocalPlayer.leaderstats.Strength.Value < req and getgenv().AutoFarming do
                    for i=1,10 do LocalPlayer.muscleEvent:FireServer("rep") end
                    task.wait()
                end
                -- rebirth
                for _,f in pairs(LocalPlayer.petsFolder:GetChildren()) do if f:IsA("Folder") then for _,p in pairs(f:GetChildren()) do if p.Name=="Tribal Overlord" then RS.rEvents.equipPetEvent:FireServer("equipPet", p) end end end end
                local old = LocalPlayer.leaderstats.Rebirths.Value
                repeat RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest"); task.wait(0.1) until LocalPlayer.leaderstats.Rebirths.Value>old or not getgenv().AutoFarming
                task.wait()
            end
        end)
    end
end})

-- Lock Position
AF:AddToggle("LockPos", {Title="Lock Position", Default=false, Callback=function(v)
    if v then
        getgenv().posLock = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().lockedPos or LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end)
        getgenv().lockedPos = LocalPlayer.Character.HumanoidRootPart.CFrame
    else
        if getgenv().posLock then getgenv().posLock:Disconnect(); getgenv().posLock=nil end
    end
end})

-- Anti Lag button
AF:AddButton("Anti Lag", function()
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then v.Enabled = false end
        if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end
        if v:IsA("BasePart") and not v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic v.Reflectance = 0 end
    end
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false; lighting.FogEnd = 9e9; lighting.Brightness = 0
    for _,v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then v.Enabled = false end
    end
    Fluent:Notify({Title="Anti Lag",Content="Full optimisation applied!",Duration=5})
end)

-- Jungle Lift
AF:AddButton("Jungle Lift", function()
    local hrp = LocalPlayer.Character.HumanoidRootPart
    hrp.CFrame = CFrame.new(-8652.8672, 29.2667, 2089.2617)
    local VIM = game:GetService("VirtualInputManager")
    VIM:SendKeyEvent(true,Enum.KeyCode.E,false,game); task.wait(0.05); VIM:SendKeyEvent(false,Enum.KeyCode.E,false,game)
end)

-- Auto-tools folder (example inside AutoFarm)
local ToolsSec = AF:AddSection("Auto Tools")
ToolsSec:AddToggle("AutoWeight", {Title="Auto Weight", Default=false, Callback=function(v)
    _G.AutoWeight = v
    if v then
        local tool = LocalPlayer.Backpack:FindFirstChild("Weight")
        if tool then LocalPlayer.Character.Humanoid:EquipTool(tool) end
        task.spawn(function() while _G.AutoWeight do LocalPlayer.muscleEvent:FireServer("rep"); task.wait(.1) end end)
    else
        local c = LocalPlayer.Character:FindFirstChild("Weight")
        if c then c.Parent = LocalPlayer.Backpack end
    end
end})

-- replicate identical toggles for Pushups, Handstands, Situps, Punch, Fast Tools... (omitted for size)

-- Rock-farming section
local RockSec = AF:AddSection("Rock Farming")
local rocks = {
    "Tiny Island Rock", "Starter Island Rock", "Legend Beach Rock",
    "Frost Gym Rock", "Mythical Gym Rock", "Eternal Gym Rock",
    "Legend Gym Rock", "Muscle King Gym Rock", "Ancient Jungle Rock"
}
for _,rock in ipairs(rocks) do
    RockSec:AddToggle("Farm"..rock:gsub(" ",""), {Title="Farm "..rock, Default=false, Callback=function(v)
        getgenv().autoFarm = v
        getgenv().selectedRock = rock
        if v then
            task.spawn(function()
                while getgenv().autoFarm do
                    local dur = LocalPlayer.Durability.Value
                    local needed = ({["Tiny Island Rock"]=0,["Starter Island Rock"]=100,["Legend Beach Rock"]=5000,["Frost Gym Rock"]=150000,["Mythical Gym Rock"]=400000,["Eternal Gym Rock"]=750000,["Legend Gym Rock"]=1e6,["Muscle King Gym Rock"]=5e6,["Ancient Jungle Rock"]=1e7})[rock]
                    if dur>=needed then
                        for _,v in pairs(WS.machinesFolder:GetDescendants()) do
                            if v.Name=="neededDurability" and v.Value==needed and LocalPlayer.Character:FindFirstChild("RightHand") and LocalPlayer.Character:FindFirstChild("LeftHand") then
                                firetouchinterest(v.Parent.Rock, LocalPlayer.Character.RightHand, 0)
                                firetouchinterest(v.Parent.Rock, LocalPlayer.Character.RightHand, 1)
                                firetouchinterest(v.Parent.Rock, LocalPlayer.Character.LeftHand, 0)
                                firetouchinterest(v.Parent.Rock, LocalPlayer.Character.LeftHand, 1)
                                local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                                if punch then LocalPlayer.Character.Humanoid:EquipTool(punch) end
                                LocalPlayer.muscleEvent:FireServer("punch","leftHand")
                                LocalPlayer.muscleEvent:FireServer("punch","rightHand")
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end})
end

-- Rebirth section
local RebirthSec = AF:AddSection("OP Rebirth")
RebirthSec:AddInput("RebirthTarget",{Title="Rebirth Target",Default="",Placeholder="number only",Callback=function(v) _G.rebirthTarget = tonumber(v) end})
RebirthSec:AddToggle("AutoRebirthTarget",{Title="Auto Rebirth Target", Default=false, Callback=function(v)
    _G.targetRebirthActive = v
    if v then
        _G.infiniteRebirthActive = false
        task.spawn(function()
            while _G.targetRebirthActive do
                if LocalPlayer.leaderstats.Rebirths.Value >= (_G.rebirthTarget or math.huge) then
                    Fluent:Notify({Title="Target reached!",Content="You hit ".._G.rebirthTarget.." rebirths",Duration=5})
                    _G.targetRebirthActive = false; return
                end
                RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                task.wait(.1)
            end
        end)
    end
end})
RebirthSec:AddToggle("InfRebirth",{Title="Auto Rebirth (Infinite)", Default=false, Callback=function(v)
    _G.infiniteRebirthActive = v
    if v then
        _G.targetRebirthActive = false
        task.spawn(function()
            while _G.infiniteRebirthActive do RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest"); task.wait(.1) end
        end)
    end
end})
RebirthSec:AddToggle("AutoSize1",{Title="Auto Size 1", Default=false, Callback=function(v)
    _G.autoSizeActive = v
    if v then task.spawn(function() while _G.autoSizeActive do RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",1); task.wait() end end) end
end})
RebirthSec:AddToggle("AutoTPMuscleKing",{Title="Auto Teleport Muscle King", Default=false, Callback=function(v)
    _G.teleportActive = v
    if v then task.spawn(function() while _G.teleportActive do LocalPlayer.Character:MoveTo(Vector3.new(-8646,17,-5738)); task.wait() end end) end
end})

-- Time-of-day dropdown
local times = {"Tomorrow","Noon","Late","SunSet","Evening","Midnight","SunRise","EarlyMorning"}
AF:AddDropdown("TimeDrop",{Title="Change Time",Values=times,Callback=function(sel)
    local lighting = game:GetService("Lighting")
    lighting.Brightness = 2; lighting.FogEnd = 100000; lighting.Ambient = Color3.fromRGB(127,127,127)
    local t = ({["Tomorrow"]=6,["Noon"]=12,["Late"]=16,["SunSet"]=18,["Evening"]=20,["Midnight"]=0,["SunRise"]=4,["EarlyMorning"]=2})[sel]
    lighting.ClockTime = t
end})

local SF = Tabs.StatsFarm
SF:AddParagraph({Title="Session Tracker",Content="Strength & Durability rates live"})
local stopwatch = SF:AddLabel("Fast Rep Time: 0d 0h 0m 0s")
local rateStr = SF:AddLabel("Strength Rate: 0 /Hour | 0 /Day | 0 /Week | 0 /Month")
local rateDura = SF:AddLabel("Durability Rate: 0 /Hour | 0 /Day | 0 /Week | 0 /Month")
local statsLabel = SF:AddLabel("Stats:")
local strLabel = SF:AddLabel("Strength: 0 | Gained: 0")
local duraLabel = SF:AddLabel("Durability: 0 | Gained: 0")

local function abbr(n)
    local neg = n<0; n = math.abs(n)
    local fmt
    if n>=1e15 then fmt = string.format("%.2fQa",n/1e15)
    elseif n>=1e12 then fmt = string.format("%.2fT",n/1e12)
    elseif n>=1e9 then fmt = string.format("%.2fB",n/1e9)
    elseif n>=1e6 then fmt = string.format("%.2fM",n/1e6)
    elseif n>=1e3 then fmt = string.format("%.2fK",n/1e3)
    else fmt = tostring(math.floor(n)) end
    return neg and "-"..fmt or fmt
end

local start = tick()
local initStr = LocalPlayer.leaderstats.Strength.Value
local initDura = LocalPlayer.Durability.Value
local tracking = false
local strHist = {}; local duraHist = {}

task.spawn(function()
    local lastCalc = tick()
    while true do
        local now = tick()
        local curStr = LocalPlayer.leaderstats.Strength.Value
        local curDura = LocalPlayer.Durability.Value
        if not tracking and (curStr-initStr)>=100e9 then tracking = true; start = tick(); strHist = {}; duraHist = {} end
        if tracking then
            local elap = now - start
            local d = math.floor(elap/86400); local h = math.floor(elap%86400/3600); local m = math.floor(elap%3600/60); local s = math.floor(elap%60)
            stopwatch:SetText(string.format("Fast Rep Time: %dd %dh %dm %ds",d,h,m,s))
            strLabel:SetText("Strength: "..abbr(curStr).." | Gained: "..abbr(curStr-initStr))
            duraLabel:SetText("Durability: "..abbr(curDura).." | Gained: "..abbr(curDura-initDura))
            table.insert(strHist,{t=now,v=curStr}); table.insert(duraHist,{t=now,v=curDura})
            while #strHist>0 and now-strHist[1].t>10 do table.remove(strHist,1) end
            while #duraHist>0 and now-duraHist[1].t>10 do table.remove(duraHist,1) end
            if now-lastCalc>=10 then
                lastCalc = now
                if #strHist>=2 then
                    local dStr = strHist[#strHist].v - strHist[1].v
                    local perSec = dStr / 10
                    rateStr:SetText("Strength Rate: "..abbr(perSec*3600).."/Hour | "..abbr(perSec*86400).."/Day | "..abbr(perSec*604800).."/Week | "..abbr(perSec*2592000).."/Month")
                end
                if #duraHist>=2 then
                    local dDura = duraHist[#duraHist].v - duraHist[1].v
                    local perSec = dDura / 10
                    rateDura:SetText("Durability Rate: "..abbr(perSec*3600).."/Hour | "..abbr(perSec*86400).."/Day | "..abbr(perSec*604800).."/Week | "..abbr(perSec*2592000).."/Month")
                end
            end
        end
        task.wait(0.05)
    end
end)

local Calc = Tabs.Calculator
local dmgSec = Calc:AddSection("Pack Damage Calculator")
local baseDmg = 0
dmgSec:AddInput("DmgInput",{Title="Pack Damage (1.2T etc)",Default="",Placeholder="1.2T",Callback=function(v)
    local units = {T=1e12,Q=1e15,B=1e9}
    v = v:upper()
    for u,m in pairs(units) do if v:find(u) then local n = tonumber(v:match("(%d+%.?%d*)")); if n then baseDmg = n*m return end end end
    baseDmg = tonumber(v:match("(%d+%.?%d*)")) or 0
end})
local dmgResults = {}
for i=1,8 do dmgResults[i] = dmgSec:AddLabel(i.." pack(s): -") end
dmgSec:AddButton("Calculate", function()
    if baseDmg<=0 then for i=1,8 do dmgResults[i]:SetText(i.." pack(s): -") end return end
    local d = baseDmg * 0.10
    local inc = 0.335
    for pack=1,8 do
        local val = d * (1 + pack*inc)
        dmgResults[pack]:SetText(pack.." pack(s): "..abbr(val))
    end
end)

local duraSec = Calc:AddSection("Pack Durability Calculator")
local baseDura = 0
duraSec:AddInput("DuraInput",{Title="Durability",Default="",Placeholder="1.2T",Callback=function(v)
    local units = {T=1e12,Q=1e15,B=1e9}
    v = v:upper()
    for u,m in pairs(units) do if v:find(u) then local n = tonumber(v:match("(%d+%.?%d*)")); if n then baseDura = n*m return end end end
    baseDura = tonumber(v:match("(%d+%.?%d*)")) or 0
end})
local duraResults = {}
for i=1,8 do duraResults[i] = duraSec:AddLabel(i.." pack(s): -") end
duraSec:AddButton("Calculate Durability", function()
    if baseDura<=0 then for i=1,8 do duraResults[i]:SetText(i.." pack(s): -") end return end
    local inc = 0.335; local ad = 1.5
    for pack=1,8 do
        local val = baseDura * (1 + pack*inc) * ad
        duraResults[pack]:SetText(pack.." pack(s): "..abbr(val))
    end
end)

local Kill = Tabs.Kills
Kill:AddToggle("AutoKill",{Title="Auto Kill", Default=false, Callback=function(v)
    _G.autoKill = v
    if v then
        task.spawn(function()
            while _G.autoKill do
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then punch.Parent = char end
                local rh = char:FindFirstChild("RightHand"); local lh = char:FindFirstChild("LeftHand")
                if rh and lh then
                    for _,p in pairs(Players:GetPlayers()) do
                        if p~=LocalPlayer then
                            local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                            if root then
                                firetouchinterest(rh, root, 1); firetouchinterest(lh, root, 1)
                                firetouchinterest(rh, root, 0); firetouchinterest(lh, root, 0)
                            end
                        end
                    end
                end
                task.wait(0.05)
            end
        end)
    end
end})

local whitelist = {}
Kill:AddInput("WhitelistInput",{Title="Whitelist Player",Default="",Placeholder="name",Callback=function(v) whitelist[v]=true end})
Kill:AddInput("UnwhitelistInput",{Title="Unwhitelist",Default="",Placeholder="name",Callback=function(v) whitelist[v]=nil end})

local targetList = {}
local tgtDrop = Kill:AddDropdown("TargetDrop",{Title="Select Target",Values={},Callback=function(v) table.insert(targetList,v) end})
for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then tgtDrop:Add(p.Name) end end
Players.PlayerAdded:Connect(function(p) if p~=LocalPlayer then tgtDrop:Add(p.Name) end end)
Players.PlayerRemoving:Connect(function(p) tgtDrop:Clear(); for _,pl in pairs(Players:GetPlayers()) do if pl~=LocalPlayer then tgtDrop:Add(pl.Name) end end end)

Kill:AddToggle("KillTarget",{Title="Kill Target List", Default=false, Callback=function(v)
    _G.killTarget = v
    if v then
        task.spawn(function()
            while _G.killTarget do
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then punch.Parent = char end
                local rh = char:FindFirstChild("RightHand"); local lh = char:FindFirstChild("LeftHand")
                if rh and lh then
                    for _,name in pairs(targetList) do
                        local p = Players:FindFirstChild(name)
                        if p and p~=LocalPlayer then
                            local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                            if root then
                                firetouchinterest(rh, root, 1); firetouchinterest(lh, root, 1)
                                firetouchinterest(rh, root, 0); firetouchinterest(lh, root, 0)
                            end
                        end
                    end
                end
                task.wait(0.05)
            end
        end)
    end
end})

local followDrop = Kill:AddDropdown("FollowDrop",{Title="Follow Player(TP)",Values={},Callback=function(v)
    _G.followTarget = v; _G.following = true
    local tgt = Players:FindFirstChild(v)
    if tgt then
        local myHRP = LocalPlayer.Character.HumanoidRootPart
        local tgtHRP = tgt.Character.HumanoidRootPart
        local behind = tgtHRP.CFrame * CFrame.new(0,0,3)
        myHRP.CFrame = behind
    end
end})
for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then followDrop:Add(p.Name) end end
Players.PlayerAdded:Connect(function(p) if p~=LocalPlayer then followDrop:Add(p.Name) end end)
Kill:AddButton("Unfollow", function() _G.following = false; _G.followTarget = nil end)
task.spawn(function()
    while true do
        task.wait(0.2)
        if _G.following and _G.followTarget then
            local tgt = Players:FindFirstChild(_G.followTarget)
            if tgt and tgt.Character and tgt.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local behind = tgt.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                LocalPlayer.Character.HumanoidRootPart.CFrame = behind
            end
        end
    end
end)


-- Stick-dead button (loads all raws)
local urls = {
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack2",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack3",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack4",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack5",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack6"
}
Kill:AddButton("Stick Dead", function()
    for _,url in ipairs(urls) do
        task.spawn(function()
            local s,r = pcall(function() return game:HttpGet(url) end)
            if s and r then pcall(function() loadstring(r)() end) end
        end)
    end
end)

local Tp = Tabs.Teleport
local places = {
    {"Spawn", CFrame.new(2,8,115)},
    {"Secret Area", CFrame.new(1947,2,6191)},
    {"Tiny Island", CFrame.new(-34,7,1903)},
    {"Frozen Island", CFrame.new(-2600.00244, 3.67686558, -403.884369)},
    {"Mythical Island", CFrame.new(2255,7,1071)},
    {"Hell Island", CFrame.new(-6768,7,-1287)},
    {"Legend Island", CFrame.new(4604,991,-3887)},
    {"Muscle King Island", CFrame.new(-8646,17,-5738)},
    {"Jungle Island", CFrame.new(-8659,6,2384)},
    {"Brawl Lava", CFrame.new(4471,119,-8836)},
    {"Brawl Desert", CFrame.new(960,17,-7398)},
    {"Brawl Regular", CFrame.new(-1849,20,-6335)}
}
for _,plc in ipairs(places) do
    Tp:AddButton(plc[1], function()
        local hrp = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        hrp.CFrame = plc[2]
        Fluent:Notify({Title="Teleported",Content=plc[1],Duration=3})
    end)
end

local Cry = Tabs.Crystals
-- (crystalData table copied from original)
local crystalData = {
    ["Blue Crystal"] = {
        {name = "Blue Birdie", rarity = "Basic"}, {name = "Orange Hedgehog", rarity = "Basic"}, {name = "Blue Aura", rarity = "Basic"}, {name = "Red Kitty", rarity = "Basic"}, {name = "Dark Vampy", rarity = "Advanced"}, {name = "Blue Bunny", rarity = "Basic"}, {name = "Red Aura", rarity = "Basic"}, {name = "Green Aura", rarity = "Basic"}, {name = "Purple Aura", rarity = "Basic"}, {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Green Crystal"] = {
        {name = "Silver Dog", rarity = "Basic"}, {name = "Green Aura", rarity = "Advanced"}, {name = "Dark Golem", rarity = "Advanced"}, {name = "Green Butterfly", rarity = "Advanced"}, {name = "Crimson Falcon", rarity = "Rare"}, {name = "Red Aura", rarity = "Basic"}, {name = "Blue Aura", rarity = "Basic"}, {name = "Purple Aura", rarity = "Basic"}, {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Frost Crystal"] = {
        {name = "Yellow Butterfly", rarity = "Advanced"}, {name = "Purple Dragon", rarity = "Rare"}, {name = "Blue Pheonix", rarity = "Epic"}, {name = "Orange Pegasus", rarity = "Rare"}, {name = "Lightning", rarity = "Rare"}, {name = "Electro", rarity = "Advanced"}
    },
    ["Mythical Crystal"] = {
        {name = "Purple Falcon", rarity = "Rare"}, {name = "Red Dragon", rarity = "Rare"}, {name = "Blue Firecaster", rarity = "Epic"}, {name = "Golden Pheonix", rarity = "Epic"}, {name = "Power Lightning", rarity = "Rare"}, {name = "Dark Lightning", rarity = "Epic"}
    },
    ["Inferno Crystal"] = {
        {name = "Red Firecaster", rarity = "Epic"}, {name = "Infernal Dragon", rarity = "Unique"}, {name = "White Pegasus", rarity = "Rare"}, {name = "Golden Pheonix", rarity = "Epic"}, {name = "Inferno", rarity = "Epic"}, {name = "Dark Storm", rarity = "Unique"}
    },
    ["Legends Crystal"] = {
        {name = "Ultra Birdie", rarity = "Unique"}, {name = "Magic Butterfly", rarity = "Unique"}, {name = "Green Firecaster", rarity = "Epic"}, {name = "White Pheonix", rarity = "Epic"}, {name = "Supernova", rarity = "Epic"}, {name = "Purple Nova", rarity = "Unique"}
    },
    ["Muscle Elite Crystal"] = {
        {name = "Frostwave Legends Penguin", rarity = "Rare"}, {name = "Phantom Genesis Dragon", rarity = "Rare"}, {name = "Dark Legends Manticore", rarity = "Epic"}, {name = "Ultimate Supernova Pegasus", rarity = "Epic"}, {name = "Aether Spirit Bunny", rarity = "Unique"}, {name = "Cybernetic Showdown Dragon", rarity = "Unique"}
    },
    ["Galaxy Oracle Crystal"] = {
        {name = "Eternal Strike Leviathan", rarity = "Rare"}, {name = "Lightning Strike Phantom", rarity = "Epic"}, {name = "Darkstar Hunter", rarity = "Unique"}, {name = "Muscle King", rarity = "Unique"}, {name = "Azure Tundra", rarity = "Epic"}, {name = "Ultra Inferno", rarity = "Rare"}
    },
    ["Jungle Crystal"] = {
        {name = "Entropic Blast", rarity = "Unique"}, {name = "Muscle Sensei", rarity = "Unique"}, {name = "Grand Supernova", rarity = "Epic"}, {name = "Neon Guardian", rarity = "Unique"}, {name = "Eternal Megastrike", rarity = "Unique"}, {name = "Golden Viking", rarity = "Epic"}, {name = "Astral Electro", rarity = "Epic"}, {name = "Dark Electro", rarity = "Epic"}, {name = "Enchanted Mirage", rarity = "Epic"}, {name = "Ultra Mirage", rarity = "Unique"}, {name = "Unstable Mirage", rarity = "Unique"}
    }
}

-- flatten pets & auras
local allPets = {}; local allAuras = {}
for crystal,list in pairs(crystalData) do
    for _,pet in ipairs(list) do
        if pet.name:find("Aura") then
            if not allAuras[pet.name] then allAuras[pet.name] = {name=pet.name, rarity=pet.rarity, crystal=crystal} end
        else
            if not allPets[pet.name] then allPets[pet.name] = {name=pet.name, rarity=pet.rarity, crystal=crystal} end
        end
    end
end

Cry:AddParagraph({Title="Buy pets & auras",Content="Select then toggle auto-buy"})
local petDrop = Cry:AddDropdown("PetDrop",{Title="Select Pet", Values={}, Callback=function(v) _G.selectedPet = v end})
for name in pairs(allPets) do petDrop:Add(name.." ("..allPets[name].rarity..")") end
local auraDrop = Cry:AddDropdown("AuraDrop",{Title="Select Aura", Values={}, Callback=function(v) _G.selectedAura = v end})
for name in pairs(allAuras) do auraDrop:Add(name.." ("..allAuras[name].rarity..")") end

Cry:AddToggle("AutoBuyPet",{Title="Auto Buy Pet", Default=false, Callback=function(v)
    _G.autoBuyPet = v
    if v then
        local petName = (_G.selectedPet or ""):match("^(.-)%s*%(") or _G.selectedPet or ""
        if petName=="" then Fluent:Notify({Title="No pet selected",Content="Choose a pet first",Duration=3}) return end
        task.spawn(function()
            while _G.autoBuyPet do
                local pet = RS.cPetShopFolder:FindFirstChild(petName)
                if pet then RS.cPetShopRemote:InvokeServer(pet) end
                task.wait(0.1)
            end
        end)
    end
end})

Cry:AddToggle("AutoBuyAura",{Title="Auto Buy Aura", Default=false, Callback=function(v)
    _G.autoBuyAura = v
    if v then
        local auraName = (_G.selectedAura or ""):match("^(.-)%s*%(") or _G.selectedAura or ""
        if auraName=="" then Fluent:Notify({Title="No aura selected",Content="Choose an aura first",Duration=3}) return end
        task.spawn(function()
            while _G.autoBuyAura do
                local aura = RS.cPetShopFolder:FindFirstChild(auraName)
                if aura then RS.cPetShopRemote:InvokeServer(aura) end
                task.wait(0.1)
            end
        end)
    end
end})

local Gift = Tabs.Gift
Gift:AddParagraph({Title="Gifting",Content="Protein Eggs & Tropical Shakes"})

local eggCount = 0; local shakeCount = 0
local selectedEggPlr; local selectedShakePlr

Gift:AddLabel("Protein Eggs: 0"):SetAttribute("Tag","EggLabel")
Gift:AddDropdown("EggDrop",{Title="Player to Gift Eggs",Values={},Callback=function(v) selectedEggPlr = Players:FindFirstChild(v) end})
Gift:AddInput("EggAmount",{Title="Amount of Eggs",Default="",Placeholder="number",Callback=function(v) eggCount = tonumber(v) or 0 end})
Gift:AddButton("Gift Eggs", function()
    if selectedEggPlr and eggCount>0 then
        for i=1,eggCount do
            local egg = LocalPlayer.consumablesFolder:FindFirstChild("Protein Egg")
            if egg then RS.rEvents.giftRemote:InvokeServer("giftRequest", selectedEggPlr, egg) end
            task.wait(0.1)
        end
    end
end)

Gift:AddLabel("Tropical Shakes: 0"):SetAttribute("Tag","ShakeLabel")
Gift:AddDropdown("ShakeDrop",{Title="Player to Gift Shakes",Values={},Callback=function(v) selectedShakePlr = Players:FindFirstChild(v) end})
Gift:AddInput("ShakeAmount",{Title="Tropical Shakes gift",Default="",Placeholder="number",Callback=function(v) shakeCount = tonumber(v) or 0 end})
Gift:AddButton("Gift Shakes", function()
    if selectedShakePlr and shakeCount>0 then
        for i=1,shakeCount do
            local shake = LocalPlayer.consumablesFolder:FindFirstChild("Tropical Shake") or LocalPlayer.consumablesFolder:FindFirstChild("Piñas")
            if shake then RS.rEvents.giftRemote:InvokeServer("giftRequest", selectedShakePlr, shake) end
            task.wait(0.1)
        end
    end
end)

-- fill dropdowns & auto-refresh counts
for _,p in pairs(Players:GetPlayers()) do
    if p~=LocalPlayer then
        Gift:Get("EggDrop"):Add(p.Name)
        Gift:Get("ShakeDrop"):Add(p.Name)
    end
end
Players.PlayerAdded:Connect(function(p)
    if p~=LocalPlayer then
        Gift:Get("EggDrop"):Add(p.Name)
        Gift:Get("ShakeDrop"):Add(p.Name)
    end
end)
task.spawn(function()
    while true do
        local eggs = 0; local shakes = 0
        for _,o in pairs(LocalPlayer.Backpack:GetChildren()) do
            if o.Name=="Protein Egg" then eggs=1 end
            if o.Name=="Tropical Shake" or o.Name=="Piñas" then shakes=1 end
        end
        Gift:Get("EggLabel"):SetText("Protein Eggs: "..eggs)
        Gift:Get("ShakeLabel"):SetText("Tropical Shakes: "..shakes)
        task.wait(0.25)
    end
end)

-- eat-all button
Gift:AddButton("Eat Everything", function()
    local items = {"Tropical Shake","Energy Shake","Protein Bar","TOUGH Bar","Protein Shake","ULTRA Shake","Energy Bar"}
    local function fmt(name) local parts = name:split(" "); for i=2,#parts do parts[i] = parts[i]:sub(1,1):upper()..parts[i]:sub(2) end; return table.concat(parts) end
    for i=1,4 do
        for _,it in ipairs(items) do
            local tool = LocalPlayer.Backpack:FindFirstChild(it) or LocalPlayer.Character:FindFirstChild(it)
            if tool then LocalPlayer.muscleEvent:FireServer(fmt(it), tool) end
        end
        task.wait(0.5)
    end
end)

Tabs.Credits:AddParagraph({Title="Credits",Content=[[
⚡SailynnxShi  
Sai ❤️ Arvelyn  
🔥H3LL_KYY🔥  
YOSHIROSHIBOLxBer  
SenXd  
K13 Clan On Top  
H3LL Clan On Top  
TANG INA NYO MGA BASURANG BINGOT 300₱ LANG TONG SCRIPT
]]})


task.spawn(function()
    while true do
        if getgenv().autoEatEnabled then
            local egg = LocalPlayer.Backpack:FindFirstChild("Protein Egg")
            if egg then
                egg.Parent = LocalPlayer.Character
                pcall(function() egg:Activate() end)
            end
            task.wait(1800)
        else
            task.wait(1)
        end
    end
end)

if not getgenv()._AutoRepFarmLoop then
    getgenv()._AutoRepFarmLoop = true
    task.spawn(function()
        local PET_NAME = "Swift Samurai"
        local ROCK_NAME = "Rock5M"
        local PROTEIN_EGG_NAME = "ProteinEgg"
        local PROTEIN_EGG_INTERVAL = 30*60
        local REPS_PER_CYCLE = 180
        local REP_DELAY = 0.01
        local ROCK_INTERVAL = 1
        local MAX_PING = 1100
        local lastProteinEggTime = tick()
        local lastRockTime = tick()
        local RockRef = WS:FindFirstChild(ROCK_NAME)
        local function getPing() local s,p = pcall(function() return StatsService.Network.ServerStatsItem["Data Ping"]:GetValue() end); return s and p or 999 end
        local function equipPet()
            local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
            if petsFolder and petsFolder:FindFirstChild("Unique") then
                for _,pet in pairs(petsFolder.Unique:GetChildren()) do
                    if pet.Name==PET_NAME then RS.rEvents.equipPetEvent:FireServer("equipPet", pet); break end
                end
            end
        end
        local function eatProteinEgg()
            if LocalPlayer:FindFirstChild("Backpack") then
                for _,item in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if item.Name==PROTEIN_EGG_NAME then RS.rEvents.eatEvent:FireServer("eat", item); break end
                end
            end
        end
        local function hitRock()
            if not RockRef or not RockRef.Parent then RockRef = WS:FindFirstChild(ROCK_NAME) end
            if RockRef and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = RockRef.CFrame * CFrame.new(0,0,-5)
                RS.rEvents.hitEvent:FireServer("hit", RockRef)
            end
        end
        equipPet()
        lastProteinEggTime = tick(); lastRockTime = tick()
        while true do
            if getgenv()._AutoRepFarmEnabled then
                local ping = getPing()
                if ping>MAX_PING then warn("[Auto Rep Farm] High ping ("..math.floor(ping).."ms), pausing 5s..."); task.wait(5)
                else
                    if LocalPlayer:FindFirstChild("muscleEvent") then
                        for i=1,REPS_PER_CYCLE do LocalPlayer.muscleEvent:FireServer("rep") end
                    end
                    if tick()-lastProteinEggTime>=PROTEIN_EGG_INTERVAL then eatProteinEgg(); lastProteinEggTime = tick() end
                    if tick()-lastRockTime>=ROCK_INTERVAL then hitRock(); lastRockTime = tick() end
                    task.wait(REP_DELAY)
                end
            else
                task.wait(1)
            end
        end
    end)
end


Fluent:Notify({Title="Shi PAID Loaded",Content="Fluent UI port ready",Duration=5})
