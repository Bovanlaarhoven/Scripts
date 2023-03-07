
function Respawn()
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end

for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == "Menu" then
        Respawn()
    else
        print("Loading")
    end
end

local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Evade Premium",
    LoadingTitle = "Hydra Network",
    LoadingSubtitle = "by Hydra#8270",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "",
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

local Settings = {
    JumpPower = 50,
    WalkSpeed = 16,
    JumpEnabled = false,
    WalkEnabled = false,
    CameraShake = false
}

local T1 = Window:CreateTab("Main")
local T2 = Window:CreateTab("Misc")
local T4 = Window:CreateTab("Tp")
local T5 = Window:CreateTab("Fun")
local T6 = Window:CreateTab("Farms")
local T7 = Window:CreateTab("Bot ESP")
local T8 = Window:CreateTab("Settings")

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    if (Settings.WalkEnabled or Settings.JumpPower) and self and self.Name == "Communicator" and args[1] == "update" then
        return (Settings.WalkEnabled and Settings.JumpPower*100 or 1500), (Settings.WalkEnabled and Settings.WalkSpeed or 3)
    end
    return old(self,...)
end)

local Toggle = T1:CreateToggle({
    Name = "Enable WalkSpeed",
    Info = "Enable/Disable WalkSpeed",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.WalkEnabled = Value
    end,
})

local Slider = T1:CreateSlider({
    Name = "WalkSpeed slider",
    Info = "WalkSpeed slider",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1", 
    Callback = function(Value)
        Settings.WalkSpeed = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Enable JumpPower",
    Info = "Enable/Disable JumpPower",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.WalkEnabled = Value
    end,
})

local Slider = T1:CreateSlider({
    Name = "JumpPower slider",
    Info = "JumpPower slider",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 10,
    Flag = "Slider1", 
    Callback = function(Value)
        Settings.WalkSpeed = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Disable Camera Shake",
    Info = "Disables your camera shake",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.WalkEnabled = Value
    end,
})