local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

game.Players.PlayerAdded:Connect(function(player)
print(player.Name.." has joined")
local notif = Notification.new("success", "Player Joined", player.Name.." has joined")
end)