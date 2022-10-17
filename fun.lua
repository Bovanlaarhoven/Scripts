repeat wait() until game:IsLoaded() wait(1)
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local ownerId = game.CreatorId

local notif = Notification.new("success", "Executor Type", identifyexecutor()..)
notif:deleteTimeout(3)

game.Players.PlayerAdded:Connect(function(player)
local notif = Notification.new("success", "Player Joined", player.Name.." has joined")
notif:deleteTimeout(1.5)
end)

game.Players.PlayerRemoving:Connect(function(player)
    local notif = Notification.new("warning", "Player Left", player.Name.." has left")
    notif:deleteTimeout(1.5)
end)

game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        game.Players.LocalPlayer:Kick("Owner Joined")
    end
end)

local FpsCounter = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

FpsCounter.Name = "Fps Counter"
FpsCounter.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = FpsCounter
Frame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
Frame.BackgroundTransparency = 0.600
Frame.Position = UDim2.new(0.0549999997, 0, 0, -30)
Frame.Size = UDim2.new(0, 81, 0, 28)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(-0.0123448372, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 81, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 25.000

UICorner.CornerRadius = UDim.new(0.0199999996, 4)
UICorner.Parent = Frame

-- Scripts:
local script = Instance.new('LocalScript', TextLabel)
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function(frame)
script.Parent.Text = ("FPS: "..math.round(1/frame)) 
end)
