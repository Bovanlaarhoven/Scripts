local Suitname = ""
local module = require(game:GetService("ReplicatedStorage").Modules.SuitData)
local SuitTable = module[Suitname]
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Iron man simulator 2",
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

local Tab = Window:CreateTab("Main", 4483362458)

local Input = Tab:CreateInput({
    Name = "Suit name",
    Info = "Put the name of the suit you want to get",
    PlaceholderText = "Mark name here",
    NumbersOnly = false,
    CharacterLimit = 15,
    OnEnter = true,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        Suitname = Text
        SuitTable = module[Suitname]
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Flight Speed",
    Info = "Change flight speed",
    Range = {10, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        SuitTable.FlightSpeed = Value
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Power Efficiency",
    Info = "Changes the efficiency",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Efficiency",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        SuitTable.Efficiency = Value
    end,
})

local Button = Tab:CreateButton({
    Name = "Inf Efficiency",
    Info = "Gives inf efficiency",
    Interact = 'Press',
    Callback = function()
        SuitTable.Efficiency = math.huge
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Flight Height",
    Info = "Changes the flight height",
    Range = {500, 5000},
    Increment = 1,
    Suffix = "Hight",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        SuitTable.MaxHeight = Value
    end,
})

local Button = Tab:CreateButton({
    Name = "Inf Flight Height",
    Info = "Gives inf Flight Height",
    Interact = 'Press',
    Callback = function()
        SuitTable.MaxHeight = math.huge
    end,
})