local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Test", HidePremium = false, SaveConfig = true, IntroEnabled = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Joined",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Left",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Test",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


local Tab3 = Window:MakeTab({
	Name = "Test",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


game.Players.PlayerAdded:Connect(function(player)
    Tab:AddButton({
        Name = player.Name.." Joined",
        Callback = function()
            local notif = Notification.new("success", "Player joined", player.Name.." joined")
            notif:deleteTimeout(3)
          end    
    })    
end)

game.Players.PlayerRemoving:Connect(function(player)
    Tab1:AddButton({
        Name = player.Name.." Left",
        Callback = function()
            local notif = Notification.new("error", "Player Left", player.Name.." left")
            notif:deleteTimeout(3)
          end    
    })    
end)




game.Players.PlayerAdded:Connect(function(player)
Tab2:AddTextbox({
	Name = player.Name.."Test",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		if Value == "print" then
            print(player.Name.. "")
        end
	end	  
})
end)