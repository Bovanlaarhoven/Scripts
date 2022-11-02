local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Username = Instance.new("TextLabel")
local Distance = Instance.new("TextLabel")
local HP = Instance.new("TextLabel")
local Bar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Bar_2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local highlight = Instance.new("Highlight")

mouse.move:Connect(function()
	local closestplr
	local closestpos = 1e+100
	for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character ~= game.Players.LocalPlayer.Character then
            if v.Character then
                local mag = (mouse.Hit.p - v.Character.HumanoidRootPart.CFrame.Position).Magnitude
                if  mag < closestpos then
                    closestplr = v
                    closestpos = mag
                end
            end
        end
                
        if closestplr then
            highlight.Parent = closestplr.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = Color3.new(0.917647, 0, 1)
            ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            Frame.Parent = ScreenGui
            Frame.BackgroundColor3 = Color3.fromRGB(99, 99, 99)
            Frame.Position = UDim2.new(0.290521622, 0, 0.437731653, 0)
            Frame.Size = UDim2.new(0, 242, 0, 109)
            
            UICorner.Parent = Frame
            
            Username.Name = "Username"
            Username.Parent = Frame
            Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Username.BackgroundTransparency = 1.000
            Username.Position = UDim2.new(0.0316300839, 0, 0.0630406365, 0)
            Username.Size = UDim2.new(0, 95, 0, 46)
            Username.Font = Enum.Font.SourceSans
            Username.Text = closestplr.Name..""
            Username.TextColor3 = Color3.fromRGB(255, 255, 255)
            Username.TextScaled = true
            Username.TextSize = 14.000
            Username.TextWrapped = true
            
            Distance.Name = "Distance"
            Distance.Parent = Frame
            Distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Distance.BackgroundTransparency = 1.000
            Distance.Position = UDim2.new(0.745601654, 0, 0.127260804, 0)
            Distance.Size = UDim2.new(0, 51, 0, 46)
            Distance.Font = Enum.Font.SourceSans
            Distance.Text = closestpos..""
            Distance.TextColor3 = Color3.fromRGB(255, 255, 255)
            Distance.TextScaled = true
            Distance.TextSize = 14.000
            Distance.TextWrapped = false
            
            HP.Name = "HP"
            HP.Parent = Frame
            HP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HP.BackgroundTransparency = 1.000
            HP.Position = UDim2.new(0.743810534, 0, 0.552559078, 0)
            HP.Size = UDim2.new(0, 56, 0, 51)
            HP.Font = Enum.Font.SourceSans
            HP.Text = closestplr.Character.Humanoid.Health.."/100"
            HP.TextColor3 = Color3.fromRGB(255, 255, 255)
            HP.TextScaled = true
            HP.TextSize = 14.000
            HP.TextWrapped = true
            
            Bar.Name = "Bar"
            Bar.Parent = ScreenGui
            Bar.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
            Bar.Position = UDim2.new(0.298285097, 0, 0.505800188, 0)
            Bar.Size = UDim2.new(0, 154, 0, 26)
            UICorner_2.Parent = Bar
            Bar_2.Name = "Bar2"
            Bar_2.Parent = ScreenGui
            Bar_2.BackgroundColor3 = Color3.fromRGB(110, 255, 66)
            Bar_2.Position = UDim2.new(0.298285097, 0, 0.505800188, 0)
            Bar_2.Size = UDim2.new(0, 154, 0, 26)
            UICorner_3.Parent = Bar_2

            if closestplr.Character.Humanoid.Health < 50 then
                Bar_2.BackgroundColor3 = Color3.fromRGB(255, 162, 0)
                Bar_2.Size = UDim2.new(0, 77, 0, 26)
            end

            if closestplr.Character.Humanoid.Health < 20 then
                Bar_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Bar_2.Size = UDim2.new(0, 30, 0, 26)
            end

            if closestplr.Character.Humanoid.Health == 0 then
                Bar_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Bar_2.Size = UDim2.new(0, 0, 0, 26)
            end

        end
    end
end)



