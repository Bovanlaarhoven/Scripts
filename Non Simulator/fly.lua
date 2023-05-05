local lplr = game:GetService("Players").LocalPlayer
local char = lplr.Character
local uis = game:GetService("UserInputService")

local canFly = false
local flySpeed = 10
local keys = {}
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Fly Script",
    LoadingTitle = "Loading script duhh",
    LoadingSubtitle = "by Hydra#8270",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

local Tab = Window:CreateTab("Main", 4483362458)

local Slider = Tab:CreateSlider({
    Name = "Fly Speed",
    Range = {0, 100},
    Increment = 10,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        flySpeed = Value
    end,
})

local Keybind = Tab:CreateKeybind({
    Name = "Start Fly Keybind",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "Keybind1", 
    Callback = function(Keybind)
        canFly = not canFly
    end,
})

uis.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        keys[input.KeyCode] = true
    end
end)

uis.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        keys[input.KeyCode] = false
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if canFly then
        local forward = (keys[Enum.KeyCode.W] and 1 or 0) - (keys[Enum.KeyCode.S] and 1 or 0)
        local right = (keys[Enum.KeyCode.D] and 1 or 0) - (keys[Enum.KeyCode.A] and 1 or 0)
        local up = (keys[Enum.KeyCode.Space] and 1 or 0) - (keys[Enum.KeyCode.LeftControl] and 1 or 0)

        local camera = workspace.CurrentCamera
        local cf = camera.CFrame
        local unit = cf.lookVector
        local upUnit = Vector3.new(0, 1, 0)
        local rightUnit = unit:Cross(upUnit)

        local targetVelocity = (unit * forward + rightUnit * right) * flySpeed + upUnit * up * flySpeed
        char.HumanoidRootPart.Velocity = targetVelocity
    end
end)


