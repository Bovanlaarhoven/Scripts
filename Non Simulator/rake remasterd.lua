local oldfog
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "The Rake",
    LoadingTitle = "Hydra Network",
    LoadingSubtitle = "by hydra#8270",
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
 
local Tab = Window:CreateTab("Main", 4483362458)

local Toggle = Tab:CreateToggle({
    Name = "No Fog",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            oldfog = game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value
            game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value = math.huge
        else
            oldfog = game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value
            game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value = oldfog
        end
    else
        if oldfog then
            if game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value then
                game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value = oldfog
            else
                game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value = oldfog
            end
        end
    end,
 })