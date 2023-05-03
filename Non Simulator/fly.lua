local lplr = game:GetService("Players").LocalPlayer
local char = lplr:WaitForChild("Character")
local uis = game:GetService("UserInputService")

local canMove = true
local playerVelocity = char.HumanoidRootPart.Velocity
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

local Toggle = Tab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        canMove = Value
        if not canMove then
            playerVelocity = Vector3.new(0, 0, 0)
            char.HumanoidRootPart.Velocity = playerVelocity
        end
    end,
})

uis.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Q then
        canMove = not canMove
        if not canMove then
            playerVelocity = Vector3.new(0,0,0)
            char.HumanoidRootPart.Velocity = playerVelocity
        end
    end
end)

uis.InputChanged:Connect(function(input, gameProcessed)
    if canMove and input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.W then
            playerVelocity = playerVelocity + Vector3.new(0, 0, 50)
        elseif input.KeyCode == Enum.KeyCode.S then
            playerVelocity = playerVelocity + Vector3.new(0, 0, -50)
        elseif input.KeyCode == Enum.KeyCode.A then
            playerVelocity = playerVelocity + Vector3.new(-50, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.D then
            playerVelocity = playerVelocity + Vector3.new(50, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.Space then
            playerVelocity = playerVelocity + Vector3.new(0, 50, 0)
        end
    end
end)

char.HumanoidRootPart.Velocity = playerVelocity
