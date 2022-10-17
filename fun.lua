local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local ownerId = game.CreatorId

game.Players.PlayerAdded:Connect(function(player)
local notif = Notification.new("success", "Player Joined", player.Name.." has joined")
notif:deleteTimeout(1.5)
end)

game.Players.PlayerRemoving:Connect(function(player)
    local notif = Notification.new("warning", "Player Left", player.Name.." has left")
    notif:deleteTimeout(1.5)
end)

game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        local notif = Notification.new("message", "Owner Joined", player.Name.." has joined")
    end
end)