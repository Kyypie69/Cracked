--  SpeedHub X | Muscle Legends – 50kgXMarkyy Port
--  =================================================
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
    Main       = Window:AddTab({ Title = "Main",        Icon = "home" }),
    AutoFarm   = Window:AddTab({ Title = "Auto Farm",   Icon = "bot" }),
    Island     = Window:AddTab({ Title = "Island",      Icon = "map-pin" }),
    Rebirth    = Window:AddTab({ Title = "Rebirth",     Icon = "refresh-cw" }),
    Killing    = Window:AddTab({ Title = "Killing",     Icon = "skull" }),
    Stats      = Window:AddTab({ Title = "Stats",       Icon = "activity" }),
    Misc       = Window:AddTab({ Title = "Misc",        Icon = "settings" }),
    Settings   = Window:AddTab({ Title = "Settings",    Icon = "sliders" }),
    Sky        = Window:AddTab({ Title = "Sky",         Icon = "cloud" })
}

--------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------
local player = game:GetService("Players").LocalPlayer
local rs     = game:GetService("ReplicatedStorage")
local vu     = game:GetService("VirtualUser")

local function notify(t, c, d) Library:Notify({ Title = t, Content = c, Duration = d or 4 }) end
local function firemuscle(...) player.muscleEvent:FireServer(...) end
local function getTool(name)
    return player.Backpack:FindFirstChild(name) or player.Character:FindFirstChild(name)
end
local function equip(name)
    local t = getTool(name)
    if t then player.Character.Humanoid:EquipTool(t) end
end

--------------------------------------------------------------------
-- Main – Packs
--------------------------------------------------------------------
do
    local S = Tabs.Main:AddSection("PACKS ONLY")

    S:AddButton({
        Title = "Packs Farm Rebirth",
        Description = "230K+ A DAY",
        Callback = function()
            Library:Dialog({
                Title = "Confirm",
                Content = "DO **NOT** EXECUTE IF YOU DONT WANNA REBIRTH",
                Buttons = {
                    { Title = "Confirm", Callback = function()
                        loadstring(game:HttpGet("https://pastebin.com/raw/8D0yiJ0j"))() -- rebirth loop
                    end},
                    { Title = "Cancel" }
                }
            })
        end
    })

    S:AddButton({
        Title = "Fast Grind",
        Description = "Super Speed (With Swifts)",
        Callback = function()
            Library:Dialog({
                Title = "Confirm",
                Content = "Speed Grind",
                Buttons = {
                    { Title = "Confirm", Callback = function()
                        equip("Swift Samurai")
                        while true do
                            for _=1,20 do firemuscle("rep") end
                            task.wait(0.001)
                        end
                    end},
                    { Title = "Cancel" }
                }
            })
        end
    })
end

--------------------------------------------------------------------
-- AutoFarm
--------------------------------------------------------------------
do
    local S = Tabs.AutoFarm:AddSection("Auto Farm Tools")

    local function toolLoop(name, toggle)
        while _G[toggle] do
            equip(name)
            firemuscle("rep")
            task.wait()
        end
    end

    for _, tool in ipairs({"Weight","Pushups","Handstands","Situps"}) do
        S:AddToggle("Auto"..tool, {
            Title = "Auto "..tool,
            Default = false,
            Callback = function(v)
                _G["Auto"..tool] = v
                if v then task.spawn(function() toolLoop(tool, "Auto"..tool) end) end
            end
        })
    end

    S:AddToggle("AutoPunch", {
        Title = "Auto Punch",
        Default = false,
        Callback = function(v)
            _G.AutoPunch = v
            if v then
                task.spawn(function()
                    while _G.AutoPunch do
                        equip("Punch")
                        firemuscle("punch","rightHand")
                        firemuscle("punch","leftHand")
                        task.wait()
                    end
                end)
            end
        end
    })

    S:AddToggle("FastTools", {
        Title = "Fast Tools",
        Default = false,
        Callback = function(v)
            for _,t in ipairs(player.Backpack:GetChildren()) do
                if t:FindFirstChild("repTime") then t.repTime.Value = v and 0 or 1 end
                if t:FindFirstChild("attackTime") then t.attackTime.Value = v and 0 or 0.35 end
            end
        end
    })
end

--------------------------------------------------------------------
-- Island Rock Farm
--------------------------------------------------------------------
do
    local S = Tabs.Island:AddSection("Rock Farm")

    local function rockFarm(reqDura, rockName)
        while getgenv()[rockName] do
            if player.Durability.Value >= reqDura then
                for _,v in ipairs(workspace.machinesFolder:GetDescendants()) do
                    if v.Name=="neededDurability" and v.Value==reqDura and player.Character:FindFirstChild("RightHand") then
                        local rock = v.Parent.Rock
                        for _=1,4 do
                            firetouchinterest(rock, player.Character.RightHand, 0)
                            firetouchinterest(rock, player.Character.RightHand, 1)
                        end
                        equip("Punch")
                        firemuscle("punch","leftHand")
                        firemuscle("punch","rightHand")
                    end
                end
            end
            task.wait()
        end
    end

    for _,cfg in ipairs({
        {"Legend Gym Rock", 1e6},
        {"Muscle King Gym Rock", 5e6},
        {"Ancient Jungle Rock", 1e7}
    }) do
        local name, dura = cfg[1], cfg[2]
        S:AddToggle(name:gsub("%s",""), {
            Title = "Farm "..name,
            Default = false,
            Callback = function(v)
                getgenv()[name:gsub("%s","")] = v
                if v then task.spawn(function() rockFarm(dura, name:gsub("%s","")) end) end
            end
        })
    end
end

--------------------------------------------------------------------
-- Rebirth
--------------------------------------------------------------------
do
    local S = Tabs.Rebirth:AddSection("Auto Rebirth")

    local target = 1
    S:AddInput("RebirthTarget", {
        Title = "Target Rebirth",
        Numeric = true,
        Finished = true,
        Callback = function(v) target = tonumber(v) or 1 end
    })

    S:AddToggle("AutoRebirthTarget", {
        Title = "Auto Rebirth [Target]",
        Default = false,
        Callback = function(v)
            if v then
                _G.rebirthLoop = task.spawn(function()
                    while task.wait(.1) do
                        if player.leaderstats.Rebirths.Value >= target then break end
                        rs.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    end
                    notify("Target reached!")
                end)
            else
                if _G.rebirthLoop then task.cancel(_G.rebirthLoop) end
            end
        end
    })

    S:AddToggle("AutoRebirthInf", {
        Title = "Auto Rebirth [Infinite]",
        Default = false,
        Callback = function(v)
            if v then
                _G.infLoop = task.spawn(function()
                    while task.wait(.1) do
                        rs.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    end
                end)
            else
                if _G.infLoop then task.cancel(_G.infLoop) end
            end
        end
    })
end

--------------------------------------------------------------------
-- Killing
--------------------------------------------------------------------
do
    local S = Tabs.Killing:AddSection("Combat")

    S:AddToggle("AutoKill", {
        Title = "Auto Kill Players",
        Default = false,
        Callback = function(v)
            while v do
                for _,p in ipairs(game.Players:GetPlayers()) do
                    if p~=player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local root = p.Character.HumanoidRootPart
                        for _,hand in ipairs({"RightHand","LeftHand"}) do
                            if player.Character:FindFirstChild(hand) then
                                firetouchinterest(player.Character[hand], root, 0)
                                firetouchinterest(player.Character[hand], root, 1)
                            end
                        end
                    end
                end
                task.wait(.1)
            end
        end
    })

    local drop = {}
    for _,p in ipairs(game.Players:GetPlayers()) do if p~=player then table.insert(drop, p.Name) end end
    local targetDrop = S:AddDropdown("TargetKill", { Title = "Target Player", Values = drop, Multi = false })
    S:AddToggle("KillTarget", {
        Title = "Kill Selected",
        Default = false,
        Callback = function(v)
            while v do
                local t = game.Players:FindFirstChild(targetDrop.Value)
                if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
                    local root = t.Character.HumanoidRootPart
                    for _,h in ipairs({"RightHand","LeftHand"}) do
                        if player.Character:FindFirstChild(h) then
                            firetouchinterest(player.Character[h], root, 0)
                            firetouchinterest(player.Character[h], root, 1)
                        end
                    end
                end
                task.wait(.1)
            end
        end
    })
end

--------------------------------------------------------------------
-- Stats
--------------------------------------------------------------------
do
    local S = Tabs.Stats:AddSection("Session Stats")
    local para = S:AddParagraph({ Title = "Timer", Content = "0d 0h 0m 0s" })
    local start = os.time()
    game:GetService("RunService").RenderStepped:Connect(function()
        local t = os.time()-start
        para:SetContent(string.format("%dd %dh %dm %ds", t//86400, t//3600%24, t//60%60, t%60))
    end)
end

--------------------------------------------------------------------
-- Misc
--------------------------------------------------------------------
do
    local S = Tabs.Misc:AddSection("Extras")

    S:AddButton({
        Title = "Low Graphics / Anti Crash",
        Callback = function()
            for _,v in ipairs(game:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then v.Enabled = false end
            end
            settings().Rendering.QualityLevel = 1
            notify("Graphics lowered")
        end
    })

    S:AddToggle("AntiAFK", {
        Title = "Anti AFK",
        Default = false,
        Callback = function(v)
            if v then
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end
        end
    })
end
