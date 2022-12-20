local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
s = game:GetService("Players").LocalPlayer.Backpack.Launcher.Stats
rs = require(s)

local Window = Rayfield:CreateWindow({
    Name = "Destruction Simulator",
    LoadingTitle = "Hydra Network",
    LoadingSubtitle = "by Hydra#8270",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "YvwEyH2W6t",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, 
       Key = "Hello"
    }
 })


local Tab = Window:CreateTab("Main")
local Tab1 = Window:CreateTab("Advanced modding")

getgenv().AutoSell = false

task.spawn(function()
    while task.wait(4) do
       if AutoSell == true then
            game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
        end
    end
end)

local Button = Tab:CreateButton({
   Name = "Mod Weapon",
   Info = "Modifies your weapon (dont hold to weapon to use it)",
   Interact = 'Mod Weapon now!',
   Callback = function()
        rs.Cooldown = 0
        rs.RocketSpeed = 100
        rs.BurstWait = 0
        rs.BlastRadius = 10
        rs.ShotgunSpread = 10
        rs.BlastForce = 1000
        rs.Burst = 10
        rs.ShotgunAmount = 10
        rs.BurstWait = 0
   end,
})

local Button = Tab:CreateButton({
    Name = "Free Levels and Coins",
    Info = "Gives you 10 levels and 10m coins",
    Interact = 'Gain money and lvls now!',
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
        game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 10000000)
    end,
 })

local Toggle = Tab:CreateToggle({
   Name = "Auto-Sell",
   Info = "Auto sells your items",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        AutoSell = Value
   end,
})


local Label = Tab:CreateLabel("Some Things might lag your game!")

local Slider = Tab1:CreateSlider({
   Name = "Cooldown",
   Info = "Changes the cooldown of your weapon",
   Range = {0, 10},
   Increment = 1,
   Suffix = "CoolDown",
   CurrentValue = 1,
   Flag = "Slider1", 
   Callback = function(Value)
        rs.Cooldown = Value
   end,
})

local Slider = Tab1:CreateSlider({
    Name = "RocketSpeed",
    Info = "Changes the RockSpeed of your weapon",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 1,
    Flag = "Slider1", 
    Callback = function(Value)
        rs.RocketSpeed = Value
    end,
})

local Slider = Tab1:CreateSlider({
    Name = "BurstWait",
    Info = "Changes the BurstWait of your weapon",
    Range = {0, 10},
    Increment = 1,
    Suffix = "BurstWait",
    CurrentValue = 1,
    Flag = "Slider1", 
    Callback = function(Value)
        rs.BurstWait = Value
    end,
})

local Slider = Tab1:CreateSlider({
    Name = "BlastRadius",
    Info = "Changes the BlastRadius of your weapon",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Radius",
    CurrentValue = 1,
    Flag = "Slider1", 
    Callback = function(Value)
        rs.BlastRadius = Value
    end,
})

local Slider = Tab1:CreateSlider({
    Name = "ShotgunSpread",
    Info = "Changes the ShotgunSpread of your weapon",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Spread",
    CurrentValue = 1,
    Flag = "Slider1", 
    Callback = function(Value)
        rs.ShotgunSpread = Value
    end,
})




