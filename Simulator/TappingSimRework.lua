local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Tapping Simulator",
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

getgenv().tap = false

task.spawn(function()
    while task.wait() do
       if tap == true then
            local ohNumber1 = 1
            game:GetService("ReplicatedStorage").Events.Tap:FireServer(ohNumber1)
        end
    end
end)

local Toggle = Tab:CreateToggle({
    Name = "Auto-Tap",
    Info = "Auto taps for you",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
         tap = Value
    end,
 })