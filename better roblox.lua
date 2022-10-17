repeat wait() until game:IsLoaded() wait(1)
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local ownerId = game.CreatorId

local notif1 = Notification.new("success", "Executor Type", identifyexecutor().."")
notif1:deleteTimeout(3)

game.Players.PlayerAdded:Connect(function(player)
    local notifi = Notification.new("success", "Player Joined", player.Name.." has joined")
    notifi:deleteTimeout(1.5)
end)

game.Players.PlayerRemoving:Connect(function(player)
    local notif = Notification.new("warning", "Player Left", player.Name.." has left")
    notif:deleteTimeout(1.5)
end)

game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        game.Players.LocalPlayer:Kick("Owner Joined")
    end
end)

