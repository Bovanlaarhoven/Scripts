local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra Network Universal", HidePremium = false, IntroText = "Universal 0.01", SaveConfig = false, ConfigFolder = "OrionTest"})
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()

--scripts

lag = true

function functionlag()
    while lag == true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(0.00001)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        wait()
    end
end

--tabs

local CharTab = Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FeaturesTab = Window:MakeTab({
	Name = "Features",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--toggles

FeaturesTab:AddToggle({
	Name = "Fake lag",
	Default = false,
	Callback = function(Value)
        lag = Value
        functionlag()
	end    
})

--dropdowns

--sliders

CharTab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(WalkSpeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end   
})

CharTab:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 100,
	Default = 50.145,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
    end
})

CharTab:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 196.2,
	Default = 196.2,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Gravity)
        Workspace.Gravity = Gravity
    end
})

CharTab:AddSlider({
	Name = "Hip Height",
	Min = 1.7999993562698364,
	Max = 100,
	Default = 1.7999993562698364,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(JumpHeight)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = JumpHeight
    end
})

--buttons



OrionLib:Init()