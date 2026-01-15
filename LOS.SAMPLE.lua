local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
game:GetService("StarterGui"):SetCore("SendNotification",{  
Title = "JOY HUB",     
Text = "Welcome",
Icon = "",
Duration = 3,
Color = Success
})

wait(3)

game:GetService("StarterGui"):SetCore("SendNotification",{  
Title = "Hello",     
Text = player.Name,
Icon = content,
Duration = 2,
Color = Info
})
wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", 		{ 			Title = "UCIHA HUB", 			Text = "Script Loaded..",	   Duration = 6    } )  



wait(5)



local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kyypie69/Library.UI/refs/heads/main/LosV2Lib.lua    "))()


		MAINTTL = "Uciha HUB" 

local win = VLib:Window("Legends Of Speeds", Color3.fromRGB(196, 40, 28))

local main = win:Tab("Main")
local ss = win:Tab("Auto Farm")
local sss = win:Tab("Teleport")
local race = win:Tab("Race")
local anim = win:Tab("Animation")
local egg = win:Tab("Crystal")
local misc = win:Tab("Misc")
local cred = win:Tab("Credits")
local how = win:Tab("How To Make Pet Glitch")



local Npc_Table = {}     
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
    if v:IsA("Model") and v:FindFirstChild("NPC") and v:FindFirstChild("AttackScript") and not table.find(Npc_Table,v.Name) then
        table.insert(Npc_Table,v.Name)
    end 
end 

    local tool_table = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tool_table, v.Name)
        end
    end
    
    distance = 5 
    
race:Label("Auto Finish Race")
main:Label("Main")
main:Button("Claim All Chest [Coming Soon]",function()    
end)

main:Toggle("Auto Rebirth",function(state)
_G.Rebirth = (state and true or false)
	wait()
	while _G.Rebirth == true do
		wait()
		game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
		end
		end)
    
 main:Button("Dissable Trading",function()
 local args = {
    [1] = "disableTrading"
}

game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
 end)


 main:Button("Enable Trading",function()
 local args = {
    [1] = "enableTrading"
}

game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
 end)


 main:Toggle("Spam Chat",function(state)   
 	_G.Chat = (state and true or false)
	wait()
	while _G.Chat == true do
		wait(1)
local args = {
    [1] = "Uciha Hub The Beast",
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
 
 end
 end)
 
 main:Toggle("Spam Chat",function(state)   
 	_G.Chat = (state and true or false)
	wait()
	while _G.Chat == true do
		wait(1)
local args = {
    [1] = "You're a Noob",
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
 
 end
 end)
 
 local PLIST = {}

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PLIST,v.DisplayName)
end

main:Dropdown("Teleport To Player",PLIST,function(value)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[value].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,1)
end)
 
main:Slider("Speed",0,1000,16,function(v)
 game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
 end)

main:Slider("Jump",0,1000,50,function(v)
 game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
 end)
    
    
    
 ss:Label("City Farm")
 
local city; 
    ss:Dropdown("Select Orbs", {"Red Orbs",
  "Yellow Orbs"  ,
  "Gems"  ,
  "Hoops"  
  
    },  function(value)
        city = value; --STORES THE USERS SELECTION
    end)
  ss:Toggle("Farm Orbs", function(state)

        ---Loops---
        

if city == "Red Orbs" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Red Orb"
local A_3 = "City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end
    

if city == "Yellow Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Yellow Orb"
local A_3 = "City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end

 
if city == "Gems" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Gem"
local A_3 = "City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end
if city == "Hoops" then
_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end 
        end
        end)
 

 
race:Toggle("Auto Finish Race City",function(state)
_G.Race = (state and true or false)
	wait()
	while _G.Race == true do
		wait()
local args = {
    [1] = "joinRace"
}

game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer(unpack(args))

wait(0.1)
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1733.00537109375, 0.4995613992214203, -5977.1591796875))

wait(0.1)
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(66.76042938232422, 0.607559859752655, -8653.8896484375))

wait(0.1)
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1039.900634765625, 0.6075596809387207, -10999.5283203125))


end
end)


sss:Label("Teleports")
		sss:Button("City", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-9687.1923828125, 59.072853088378906, 3096.58837890625))
end)

sss:Button("Snow City", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-9677.6640625, 59.072853088378906, 3783.736572265625))
end)

sss:Button("Magma City", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-11053.3837890625, 217.0328369140625, 4896.10986328125))
end)

sss:Button("Legends Highway", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-13097.8583984375, 217.0328369140625, 5904.84716796875))
end)

sss:Button("Space", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-336.0252380371094, 3.942866802215576, 592.1419067382812))
end)

sss:Button("Desert", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(2508.404296875, 14.834074974060059, 4352.73388671875))
end)


ss:Label("Space Farm")

local space; 
    ss:Dropdown("Select Orbs", {"Red Orbs",
  "Yellow Orbs"  ,
  "Gems"  ,
  "Hoops"  
  
    },  function(value)
        space = value; --STORES THE USERS SELECTION
    end)
  ss:Toggle("Farm Orbs", function(state)

        ---Loops---
        

if space == "Red Orbs" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Red Orb"
local A_3 = "Space"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end

if space == "Gems" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Gem"
local A_3 = "Space"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end

if space == "Yellow Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Yellow Orb"
local A_3 = "Space"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end


if space == "Hoops" then
	_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end
        end 
		end)

race:Toggle("Auto Finish Race Space",function(state)
_G.Race = (state and true or false)
	wait()
	while _G.Race == true do
		wait()
local args = {
    [1] = "joinRace"
}

game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer(unpack(args))
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4379.244140625, 28.04288673400879, -14063.7978515625)
end
end)

ss:Label("Desert Farm")

local desert; 
    ss:Dropdown("Select Orbs", {"Red Orbs",
  "Yellow Orbs"  ,
  "Gems"  ,
  "Hoops"  
  
    },  function(value)
        desert = value; --STORES THE USERS SELECTION
    end)
  ss:Toggle("Farm Orbs", function(state)

        ---Loops---
        

if desert == "Red Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Red Orb"
local A_3 = "Desert"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end


if desert == "Gems" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Gem"
local A_3 = "Desert"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end

if desert == "Yellow Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Yellow Orb"
local A_3 = "Desert"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end
if desert == "Hoops" then
	_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end
        end 
		end)
		
race:Toggle("Auto Finish Race Desert",function(state)
_G.Race = (state and true or false)
	wait()
	while _G.Race == true do
		wait()
		local args = {
    [1] = "joinRace"
}

game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer(unpack(args))
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2049.19140625, 27.492855072021484, 17866.822265625)
end
end)

ss:Label("Snow Farm")
local snow; 
    ss:Dropdown("Select Orbs", {"Red Orbs",
  "Yellow Orbs"  ,
  "Gems"  ,
  "Hoops"  
  
    },  function(value)
        snow = value; --STORES THE USERS SELECTION
    end)
  ss:Toggle("Farm Orbs", function(state)

        ---Loops---
        

if snow == "Red Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Red Orb"
local A_3 = "Snow City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end end
end

if snow == "Gems" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Gem"
local A_3 = "Snow City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end end
end



if snow == "Hoops" then
	_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end
		end


if snow == "Yellow Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Yellow Orb"
local A_3 = "Snow City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end
end)
ss:Label("Magma Farm")
local magma; 
    ss:Dropdown("Select Orbs", {"Red Orbs",
  "Yellow Orbs"  ,
  "Gems"  ,
  "Hoops"  
  
    },  function(value)
        magma = value; --STORES THE USERS SELECTION
    end)
  ss:Toggle("Farm Orbs", function(state)

        ---Loops---
        

if magma == "Red Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Red Orb"
local A_3 = "Magma City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end end
end

if magma == "Gems" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Gem"
local A_3 = "Magma City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end end
end
if magma == "Yellow Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Yellow Orb"
local A_3 = "Magma City"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end


if magma == "Hoops" then
	_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end
end 
end)
ss:Label("Legends Highway Farm")
local legends; 
    ss:Dropdown("Select Orbs", {"Red Orbs",
  "Yellow Orbs"  ,
  "Gems"  ,
  "Hoops"  
  
    },  function(value)
        legends = value; --STORES THE USERS SELECTION
    end)
  ss:Toggle("Farm Orbs", function(state)

        ---Loops---
        

if legends == "Red Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Red Orb"
local A_3 = "Legends Highway"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end end
end
if legends == "Gems" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Gem"
local A_3 = "Legends Highway"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end

if legends == "Yellow Orbs" then
_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
	for i=1, 50 do
     local A_1 = "collectOrb"
local A_2 = "Yellow Orb"
local A_3 = "Legends Highway"
local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
Event:FireServer(A_1, A_2, A_3)
end
end
end

if legends == "Hoops" then
	_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end

end
end)
egg:Label("Auto Open Crystal")


    
local EC; 
    egg:Dropdown("Select Crystal", {"Electro Legends Crystal",
  "Lava Crystal"  ,
  "Inferno Crystal"  ,
  "Snow Crystal"  ,
  "Electro Crystal"  ,
  "Space Crystal"  ,
  "Desert Crystal"  
  
    },  function(value)
        EC = value; --STORES THE USERS SELECTION
    end)
  egg:Toggle("Auto Open", function(state)

        ---Loops---
        

if EC == "Electro Legends Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Electro Legends Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end



if EC == "Lava Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Lava Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end



if EC == "Inferno Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Inferno Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end



if EC == "Electro Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Electro Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end



if EC == "Snow Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Snow Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end



if EC == "Desert Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Desert Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end



if EC == "Space Crystal" then

_G.Mm = (state and true or false)
	wait()
	while _G.Mm == true do
		wait()
   local args = {
    [1] = "openCrystal",
    [2] = "Space Crystal"
}

game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end end
end)


egg:Toggle("Auto Farm Unltimate Overdrive Bunny",function(state)
_G.Bunny = (state and true or false)
	wait()
	while _G.Bunny == true do
		wait()
local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder.Omega:FindFirstChild("Shadows Edge Kitty")
}
game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder.Omega:FindFirstChild("Eternal Nebula Dragon")
}
game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder.Omega:FindFirstChild("Dark Soul Birdie")
}
game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder.Omega:FindFirstChild("Hypersonic Pegasus")
}
game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

local args = {
    [1] = "sellPet",
    [2] = game:GetService("Players").LocalPlayer.petsFolder.Omega:FindFirstChild("Soul Fusion Dog")
}

game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer(unpack(args))

end
end)
egg:Toggle("Auto Evolved Overdrive Bunny",function(state)
_G.EvoBunny = (state and true or false)
	wait()
	while _G.EvoBunny == true do
		wait()
local args = {
    [1] = "evolvePet",
    [2] = "Ultimate Overdrive Bunny"
}

game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(unpack(args))

end
end)

misc:Label("Misc")

	
misc:Button("Dissable Jump",function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
end)

misc:Button("Enable Jump",function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)





misc:Button("ANTI AFK GUI",function()

wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti AFK Script"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="UCIHA HUB"
_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox tried to kick u but i kicked him instead"wait(2)ab.Text="Status : Active"end)
end)

misc:Button("Active FPS BOOST",function()
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end)

misc:Button("INF JUMP",function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
end)
end)
 
 								
misc:Button("Destroy Gui",function()
game.CoreGui["Library"]:Destroy()
end)


cred:Label("Credits By Uciha HUB")
cred:Label("https://youtube.com/channel/UCD7hHx9yNjik1HjX3GkxaeQ   ")    
cred:Button("Copy Link",function()
setclipboard('https://youtube.com/channel/UCD7hHx9yNjik1HjX3GkxaeQ   ')
end)

cred:Label("https://sociabuzz.com/farelgaming77/donate   ")
cred:Button("Coppy Donate Link" ,function()
setclipboard("https://sociabuzz.com/farelgaming77/donate   ")
end)


local Animate = game.Players.LocalPlayer.Character.Animate


anim:Label("Animation")
local animDD; 
    anim:Dropdown("Select Animation", {"Default Animation",
  "Zombie"  ,
  "Astrounaut"  ,
  "Bubbly"  ,
  "Cartoony"  ,
  "Elder"  ,
  "Knight"  
  ,
  "Levitation"  ,
  "Mage"  ,
  "Ninja"  ,
  "Pirate"  ,
  "Robot"  ,
  "Stylish"  
  ,
  "Super Hero"  ,
  "Toy"  ,
  "Vampire"  ,
  "Werewolf"  ,
  "Patrol"  ,
  "Confident"  
  ,
  "PopStar"  ,
  "CowBoy"  ,
  "Ghost"  ,
  "Sneeky"  
  
  
    },  function(value)
        animDD = value; --STORES THE USERS SELECTION
    end)
  anim:Button("Set Animation", function()

        ---Loops---
        

if animDD == "Default Animation" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Zombie" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Astronout" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Bubbly" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910   "
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921   "
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Cartoony" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Elder" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Knight" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Levitation" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Mage" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Ninja" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Pirate" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Robot" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Stylish" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Super Hero" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Toy" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Vampire" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Werewolf" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end

if animDD == "Patrol" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Confident" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "PopStar" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "CowBoy" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Ghost" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863   "
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453   "
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Sneeky" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842   "
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671   "
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133   "
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274   "
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853   "
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372   "
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004   "
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
end)

how:Label(" - - Tutorial - - ")
how:Label("1. Use Pet Level 1 No XP")
how:Label("2. Turn on Yellow Orbs In Auto Farm Menu")
how:Label("3. Don't Get About XP")
how:Label("4. Don't Use Other Features Except Yellow Orbs")
how:Label("5. Done")

how:Label("- - Notes - -")
how:Label("The Power Pet Will Return If You Disconnect / Quit the Game")
