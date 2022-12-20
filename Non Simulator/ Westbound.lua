local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Westbound",
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

local Tab = Window:CreateTab("Auto Farm", 11866433904)

local Slider = Tab:CreateSlider({
   Name = "Coin Giver",
   Info = "Give yourself coins (visuals only)",
   Range = {0, 100000000},
   Increment = 1,
   Suffix = "Coins",
   CurrentValue = game:GetService("Players").LocalPlayer.leaderstats["$$"].Value.."",
   Flag = "Slider1",
   Callback = function(Value)
      game:GetService("Players").LocalPlayer.leaderstats["$$"].Value = Value
   end,
})
