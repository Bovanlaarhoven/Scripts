repeat wait() until game:IsLoaded() wait(1)
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local notif1 = Notification.new("success", "Executor Type", identifyexecutor().."")
notif1:deleteTimeout(2.5)
wait(3)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/venus/source.lua", true))()
local main = library:Load({Name = "Better Roblox", Theme = "Dark", SizeX = 440, SizeY = 480, ColorOverrides = {}})
local ownerId = game.CreatorId

local MainTab = main:Tab("Main")
local section = MainTab:Section({Name = "Player", column = 1})

local button = section:Button({Name = "Player join notif", Callback = function()
    game.Players.PlayerAdded:Connect(function(player)
        local notifi = Notification.new("success", "Player Joined", player.Name.." has joined")
        notifi:deleteTimeout(1.5)
    end)    
 end})

 local button = section:Button({Name = "Player leave notif", Callback = function()
    game.Players.PlayerRemoving:Connect(function(player)
        local notif = Notification.new("warning", "Player Left", player.Name.." has left")
        notif:deleteTimeout(1.5)
    end)
 end})

 local button = section:Button({Name = "Kick when owner joins", Callback = function()
    game.Players.PlayerAdded:Connect(function(player)
        if player.UserId == ownerId then
            game.Players.LocalPlayer:Kick("Owner Joined")
        end
    end)
 end})

 local button = section:Button({Name = "Unlock Shiftlock", Callback = function()
    game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
 end})

