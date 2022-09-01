local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra Network |Trade Tower|", HidePremium = false,IntroText = "Trade Tower", SaveConfig = false, ConfigFolder = "OrionTest"})
--tables

autoclick = true

--functions

function functionautoclick()
    while autoclick == true do
        game:GetService("ReplicatedStorage").Events.ClientClick:FireServer()
        wait()
    end
end

--tabs

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--toggles



--buttons


OrionLib:Init()