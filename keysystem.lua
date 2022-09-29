local GuiService = game:GetService("GuiService")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra network Keysystem", HidePremium = false, IntroText = "Key System", SaveConfig = false, ConfigFolder = "OrionTest"})

local var = "https://link-hub.net/488828/key-for-hydra-network"
local var2 = "noob"
local vars = {var,var2}

getgenv().Key = "test"
getgenv().Key1 = "test1"
getgenv().Key2 = "test2"
getgenv().Key3 = "test2"
getgenv().Key4 = "test2"
getgenv().Key5 = "test2"
getgenv().Key6 = "test2"
getgenv().Key7 = "test2"
getgenv().Key8 = "test2"
getgenv().Key9 = "test2"
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
      	if Keyinput == Key or Key1 or Key2 or Key3 or Key4 or Key5 or Key6 or Key7 or Key8 or Key9 then
            MakeScript()
            correctkey()
        else
            setclipboard(vars[math.random(1,#vars)])
            incorrectkey()
        end
  	end    
})

OrionLib:Init()