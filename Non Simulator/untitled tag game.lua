local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "untitled tag game",
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

local Slider = Tab:CreateSlider({
   Name = "Coin Giver",
   Info = "Give yourself coins (visuals only)",
   Range = {0, 100000000},
   Increment = 1,
   Suffix = "Coins",
   CurrentValue = game:GetService("Players").LocalPlayer.CoinAmount.Value.."",
   Flag = "Slider1",
   Callback = function(Value)
        game:GetService("Players").LocalPlayer.CoinAmount.Value = Value
   end,
})

local TargetWalkspeed
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Info = "Speaks for itself",
   Range = {0, 500},
   Increment = 1,
   Suffix = "walkspeed",
   CurrentValue = "0",
   Flag = "Slider1",
   Callback = function(Value)
         TargetWalkspeed = Value
   end,
})

game:GetService("RunService").RenderStepped:Connect(function()
   pcall(function()
       if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
           game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
       end
   end)
end)
