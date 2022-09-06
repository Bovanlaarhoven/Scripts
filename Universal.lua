local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra Network Universal", HidePremium = false, IntroText = "Universal 0.01", SaveConfig = true, ConfigFolder = "OrionTest"})

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

--toggles

CharTab:AddToggle({
	Name = "Fake lag",
	Default = false,
	Callback = function(Value)
        lag = Value
        functionlag()
	end    
})

--dropdowns

--sliders

--buttons


OrionLib:Init()