local GuiService = game:GetService("GuiService")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra network Keysystem", HidePremium = false, IntroText = "Key System", SaveConfig = false, ConfigFolder = "OrionTest"})

getgenv().Key = "test"
getgenv().Key1 = "test1"
getgenv().Keyinput = "string"

function MakeScript()
    OrionLib:Destroy()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Robobo2022/script/main/mains.lua"), true))()
end

function correctkey()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "Correct Key and is now loading the script",
        Image = "rbxassetid://4483345998",
        Time = 5
    }) 
end

function incorrectkey()
    OrionLib:MakeNotification({
        Name = "Incorrect Key",
        Content = "Get the Key from the link in your clipboard",
        Image = "rbxassetid://4483345998",
        Time = 5
    }) 
end

local Tab = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		Keyinput = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
      	if Keyinput == Key or Key1 then
            MakeScript()
            correctkey()
        else
            setclipboard("https://link-hub.net/488828/key-for-hydra-network")
            incorrectkey()
        end
  	end    
})

OrionLib:Init()