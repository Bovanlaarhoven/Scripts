local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")
local Light = game:GetService("Lighting")
local players = game.Players:GetPlayers()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Redbox 2", HidePremium = false, IntroText = "Hydra Network", SaveConfig = true, ConfigFolder = "OrionTest"})

local MainTab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

getgenv().HeadSize = 10
getgenv().Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
        if Disabled then
        for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
        pcall(function()
        v.Character.Head.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
        v.Character.Head.Transparency = 0.7
        MainTab:AddColorpicker({
                Name = "Colorpicker",
                Default = Color3.fromRGB(255, 0, 0),
                Callback = function(Value)
                        v.Character.Head.BrickColor = Value
                end	  
        })
        
        v.Character.Head.Material = "ForceField"
        v.Character.Head.CanCollide = false
        end)
        end
        end
        end
        end)




local PlayerTab = Window:MakeTab({
	Name = "Local Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddBind({
	Name = "Inf Ammo (equipe Weapon before pressing)",
	Default = Enum.KeyCode.L,
	Hold = false,
	Callback = function()
        local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local m = require(Tool.toolSettings)
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(Tool)
        game:GetService("ReplicatedStorage").Assets.Remotes.syncAmmo:FireServer(1000000,1000000, Tool)
	end    
})

MainTab:AddButton({
	Name = "No Recoil",
	Callback = function()	
        local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local m = require(Tool.toolSettings)
        m.firingRecoilEnabled = false
  	end    
})

PlayerTab:AddButton({
	Name = "Full Bright.",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.Brightness = 5
        game.Lighting.GlobalShadows = false
  	end    
})
MainTab:AddSlider({
    Name = "Hitbox",
    Min = 0,
    Max = 100,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Head size",
    Callback = function(Value)
        HeadSize = Value
    end    
})


PlayerTab:AddSlider({
        Name = "Fov Slider",
	Min = 0,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Fov",
	Callback = function(Value)
	        local amount = Value
                game:GetService'Workspace'.Camera.FieldOfView = amount
	end    
})


local TargetWalkspeed
PlayerTab:AddSlider({
	Name = "Speed (MoveDirection)",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end   
})

PlayerTab:AddSlider({
	Name = "Jump Power Slider",
	Min = 0,
	Max = 120,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
            end
        end)
    end)