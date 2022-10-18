local Players = game:GetService("Players")

local function PlayerChatted(player)
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Better roblox", HidePremium = true, IntroText = "Better Roblox", SaveConfig = true, ConfigFolder = "OrionTest"})
local ownerId = game.CreatorId

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Player join notification",
    Callback = function()
        game.Players.PlayerAdded:Connect(function(player)
            local notifi = Notification.new("success", "Player Joined", player.Name.." has joined")
            notifi:deleteTimeout(1.5)
        end)
      end    
})

Tab:AddButton({
    Name = "Player leave notification",
    Callback = function()
        game.Players.PlayerRemoving:Connect(function(player)
            local notif = Notification.new("warning", "Player Left", player.Name.." has left")
            notif:deleteTimeout(1.5)
        end)
      end    
})

Tab:AddButton({
    Name = "Owner join kick",
    Callback = function()
        game.Players.PlayerAdded:Connect(function(player)
            if player.UserId == ownerId then
                game.Players.LocalPlayer:Kick("Owner Joined")
            end
        end)
      end    
})
     
Tab:AddButton({
    Name = "Unlock Shiftlock",
    Callback = function()
        game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
      end    
})
end

local function chattedEvent(player)
    player.Chatted:Connect(function(msg)
        if string.lower(msg) == "better roblox" or "Better roblox" or "Better Roblox" or "btr" or "+" then
            PlayerChatted(player)
        end
    end)
end

for _,player in pairs(Players:GetChildren()) do
    chattedEvent(player)
end