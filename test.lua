--discord.gg/boronide, code generated using luamin.js™



local a= game:GetService("StarterPlayer")local a= game:GetService("Workspace")local a= game:GetService("Lighting")local b= game.Players:GetPlayers()local b= loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()local b= b:MakeWindow({Name = "Redbox 2", HidePremium = false, IntroText = "Hydra Network", SaveConfig = true, ConfigFolder = "OrionTest"})getgenv().Color=BrickColor;getgenv().HeadSize=10;getgenv().Disabled=true;game:GetService('RunService').RenderStepped:connect(function()
        if Disabled then
        for a,a in next, game:GetService('Players'):GetPlayers() do
        if a.Name ~= game:GetService('Players').LocalPlayer.Name then
        pcall(function()
        a.Character.Head.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
        a.Character.Head.Transparency = 0.7
        a.Character.Head.BrickColor = BrickColor.new(Color)
        a.Character.Head.Material = "ForceField"
        a.Character.Head.CanCollide = false
        end)
        end
        end
        end
        end)local c= b:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})local b= b:MakeTab({
	Name = "Local Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})c:AddBind({
	Name = "Inf Ammo (equipe Weapon before pressing)",
	Default = Enum.KeyCode.L,
	Hold = false,
	Callback = function()
        local a = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local b = require(a.toolSettings)
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(a)
        game:GetService("ReplicatedStorage").Assets.Remotes.syncAmmo:FireServer(1000000,1000000, a)
	end    
})c:AddButton({
	Name = "No Recoil",
	Callback = function()	
        local a = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local a = require(a.toolSettings)
        a.firingRecoilEnabled = false
  	end    
})b:AddButton({
	Name = "Full Bright.",
	Callback = function()
        a.Ambient = Color3.new(1, 1, 1)
        a.ColorShift_Bottom = Color3.new(1, 1, 1)
        a.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.Brightness = 5
        game.Lighting.GlobalShadows = false
  	end    
})c:AddSlider({
    Name = "Hitbox",
    Min = 0,
    Max = 5,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Head size",
    Callback = function(a)
        HeadSize = a
    end    
})c:AddColorpicker({
	Name = "Hitbox Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(a)
		Color = a
	end	  
})b:AddSlider({
        Name = "Fov Slider",
	Min = 0,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Fov",
	Callback = function(a)
	        local a = a
                game:GetService'Workspace'.Camera.FieldOfView = a
	end    
})local a;b:AddSlider({
	Name = "Speed (MoveDirection)",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(b)
		a = b
	end   
})b:AddSlider({
	Name = "Jump Power Slider",
	Min = 0,
	Max = 120,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(a)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
	end    
})game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * a/100)
            end
        end)
    end)
