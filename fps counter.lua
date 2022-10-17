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

local script = Instance.new('LocalScript', TextLabel)
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function(frame)
script.Parent.Text = ("FPS: "..math.round(1/frame)) 
end)