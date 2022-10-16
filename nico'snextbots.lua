local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra Network |Nico's Nextbots|", HidePremium = false, IntroText = "Nico's Nextbots", SaveConfig = true, ConfigFolder = "OrionTest"})

--tables

local Light = game:GetService("Lighting")
autofarm = true

--functions

function functionautofarm()
    while autofarm == true do task.wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(3080.2978515625, -740.00439453125, 16.78089714050293)
        wait(0.0000000000000001)
    end
end

function dofullbright()
    Light.Ambient = Color3.new(1, 1, 1)
    Light.ColorShift_Bottom = Color3.new(1, 1, 1)
    Light.ColorShift_Top = Color3.new(1, 1, 1)
    game.Lighting.FogEnd = 100000
    game.Lighting.FogStart = 0
    game.Lighting.ClockTime = 14
    game.Lighting.Brightness = 2
    game.Lighting.GlobalShadows = false
end


function Respawn()
OrionLib:MakeNotification({
	Name = "Respawning...",
	Content = "You Pressed the Respawn keybind.",
	Image = "rbxassetid://4483345998",
	Time = 2
})
end

function SafePlace()
    OrionLib:MakeNotification({
        Name = "Teleporting...",
        Content = "You Pressed the Teleport keybind.",
        Image = "rbxassetid://4483345998",
        Time = 2
    })
end

--tabs

local MainTab= Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CharacterTab= Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = true
})

--sliders

local TargetWalkspeed
CharacterTab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end   
})

CharacterTab:AddSlider({
    Name = "Hip height",
    Min = 2,
    Max = 100,
    Default = 2,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    Callback = function(HipValue)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = HipValue
    end    
})

--toggles

MainTab:AddToggle({
	Name = "AutoFarm",
	Default = false,
	Callback = function(Value)
        autofarm = Value
        functionautofarm()
	end    
})

--buttons

MainTab:AddButton({
	Name = "Full Bright",
	Callback = function()
        dofullbright()
  	end    
})

MainTab:AddButton({
	Name = "AutoSlide",
	Callback = function()
        local ohNumber1 = 2
        local ohBoolean2 = true
        game:GetService("ReplicatedStorage").events.runcrouchevent:FireServer(ohNumber1, ohBoolean2)
  	end    
})

MainTab:AddButton({
	Name = "Turn off autoslide",
	Callback = function()
        local ohNumber1 = 2
        local ohBoolean2 = false
        game:GetService("ReplicatedStorage").events.runcrouchevent:FireServer(ohNumber1, ohBoolean2)
  	end    
})

--Keybinds

MainTab:AddBind({
	Name = "Respawn",
	Default = Enum.KeyCode.R,
	Hold = false,
	Callback = function()
		game:GetService("ReplicatedStorage").events.respawnchar:FireServer()
        Respawn()
	end    
})

MainTab:AddBind({
	Name = "Teleport to Safe Place",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-290.45391845703125, 34.623172760009766, 51.15454864501953)
        SafePlace()
	end    
})

--others

CreditsTab:AddParagraph("Owner/Main Dev","hydra#1000")
CreditsTab:AddParagraph("Dont Forget to join the discord!")

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
        end
    end)
end)

OrionLib:Init()