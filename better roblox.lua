repeat wait() until game:IsLoaded() wait()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local notif1 = Notification.new("success", "Executor Type", identifyexecutor().."")
notif1:deleteTimeout(2.5)
wait(3)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Better Roblox", HidePremium = true, IntroText = "Better Roblox", IntroIcon = "rbxassetid://7539983773", SaveConfig = true, ConfigFolder = "OrionTest"})
local ownerId = game.CreatorId
local player = game.Players.LocalPlayer

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://7539983773",
	PremiumOnly = false
})

OrionLib:MakeNotification({
	Name = "Better Roblox",
	Content =  player.Name.." Welcome" ,
	Image = "rbxassetid://10993876184",
	Time = 5
})

Tab:AddToggle({
	Name = "Player join",
	Default = false,
	Callback = function(Value)
        Playerjoins = Value
        playerjoin()
	end    
})