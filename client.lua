local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Time = Instance.new("TextLabel")
local MaxHealth = Instance.new("TextLabel")
local Health = Instance.new("TextLabel")
local RigType = Instance.new("TextLabel")
local _ = Instance.new("TextLabel")
local Distance = Instance.new("TextLabel")
local Username = Instance.new("TextLabel")
local UserId = Instance.new("TextLabel")
local WalkSpeed = Instance.new("TextLabel")
local JumpPower = Instance.new("TextLabel")
local Bar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Hp = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local lightning = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local highlight = Instance.new("Highlight")

mouse.move:Connect(function()
	local closestplr
	local closestpos = 1e+100
	for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character ~= game.Players.LocalPlayer.Character then
            if v.Character then
                local mag = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.position - v.Character.HumanoidRootPart.CFrame.Position).Magnitude
                if  mag < closestpos then
                    closestplr = v
                    closestpos = mag
                end
            end
        end

        if closestplr then
            Gui.Name = "Gui"
            Gui.Parent = CoreGui:FindFirstChild("RobloxGui")
            Gui.ResetOnSpawn = false

            highlight.Parent = closestplr.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = Color3.fromRGB(34, 255, 10)
            Main.Name = "Main"
            Main.Parent = Gui
            Main.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
            Main.BackgroundTransparency = 0.500
            Main.Position = UDim2.new(0.40356642, 0, -0.000619233353, 0)
            Main.Size = UDim2.new(0, 311, 0, 93)
            Time.Name = "Time"
            Time.Parent = Main
            Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Time.BackgroundTransparency = 1.000
            Time.Position = UDim2.new(-0.00501439162, 0, -0.00116009277, 0)
            Time.Size = UDim2.new(0, 50, 0, 32)
            Time.Font = Enum.Font.SourceSans
            Time.Text = lightning.ClockTime..""
            Time.TextColor3 = Color3.fromRGB(0, 0, 0)
            Time.TextSize = 18.000
            Time.TextWrapped = true
            

            MaxHealth.Name = "MaxHealth"
            MaxHealth.Parent = Main
            MaxHealth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MaxHealth.BackgroundTransparency = 1.000
            MaxHealth.Position = UDim2.new(0.846657276, 0, 0.553788424, 0)
            MaxHealth.Size = UDim2.new(0, 47, 0, 41)
            MaxHealth.Font = Enum.Font.SourceSans
            MaxHealth.Text = "/"..closestplr.Character.Humanoid.MaxHealth
            MaxHealth.TextColor3 = Color3.fromRGB(0, 0, 0)
            MaxHealth.TextSize = 24.000
            
            Health.Name = "Health"
            Health.Parent = Main
            Health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Health.BackgroundTransparency = 1.000
            Health.Position = UDim2.new(0.738774836, 0, 0.500336766, 0)
            Health.Size = UDim2.new(0, 47, 0, 49)
            Health.Font = Enum.Font.SourceSans
            Health.Text = math.floor(closestplr.Character.Humanoid.Health.."")
            Health.TextColor3 = Color3.fromRGB(0, 0, 0)
            Health.TextSize = 26.000
            
            RigType.Name = "RigType"
            RigType.Parent = Main
            RigType.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RigType.BackgroundTransparency = 1.000
            RigType.Position = UDim2.new(-0.00475877896, 0, 0.225806415, 0)
            RigType.Size = UDim2.new(0, 48, 0, 51)
            RigType.Font = Enum.Font.SourceSans
            RigType.Text = closestplr.Character.Humanoid.RigType.Name..""
            RigType.TextColor3 = Color3.fromRGB(0, 0, 0)
            RigType.TextSize = 20.000
            
            _.Name = "_"
            _.Parent = Main
            _.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _.BackgroundTransparency = 1.000
            _.Position = UDim2.new(-0.041388303, 0, -0.289387017, 0)
            _.Size = UDim2.new(0, 70, 0, 84)
            _.Font = Enum.Font.SourceSans
            _.Text = "_"
            _.TextColor3 = Color3.fromRGB(0, 0, 0)
            _.TextSize = 45.000
            
            Distance.Name = "Distance"
            Distance.Parent = Main
            Distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Distance.BackgroundTransparency = 1.000
            Distance.Position = UDim2.new(0.745837271, 0, 0.0107526882, 0)
            Distance.Size = UDim2.new(0, 79, 0, 42)
            Distance.Font = Enum.Font.SourceSans
            Distance.Text = math.floor(closestpos.."")
            Distance.TextColor3 = Color3.fromRGB(0, 0, 0)
            Distance.TextSize = 28.000
            
            Username.Name = "Username"
            Username.Parent = Main
            Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Username.BackgroundTransparency = 1.000
            Username.Position = UDim2.new(0.096319586, 0, 0.0107526882, 0)
            Username.Size = UDim2.new(0, 200, 0, 50)
            Username.Font = Enum.Font.SourceSans
            Username.Text = closestplr.Name..""
            Username.TextColor3 = Color3.fromRGB(0, 0, 0)
            Username.TextSize = 24.000
            
            UserId.Name = "UserId"
            UserId.Parent = Main
            UserId.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            UserId.BackgroundTransparency = 1.000
            UserId.Position = UDim2.new(0.128473908, 0, 0.247311845, 0)
            UserId.Size = UDim2.new(0, 180, 0, 45)
            UserId.Font = Enum.Font.SourceSans
            UserId.Text = closestplr.UserId..""
            UserId.TextColor3 = Color3.fromRGB(0, 0, 0)
            UserId.TextSize = 24.000
            
            WalkSpeed.Name = "WalkSpeed"
            WalkSpeed.Parent = Main
            WalkSpeed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            WalkSpeed.BackgroundTransparency = 1.000
            WalkSpeed.Position = UDim2.new(0.826366544, 0, 0.268817246, 0)
            WalkSpeed.Size = UDim2.new(0, 59, 0, 45)
            WalkSpeed.Font = Enum.Font.SourceSans
            WalkSpeed.Text = closestplr.Character.Humanoid.WalkSpeed..""
            WalkSpeed.TextColor3 = Color3.fromRGB(0, 0, 0)
            WalkSpeed.TextSize = 20.000
            
            JumpPower.Name = "JumpPower"
            JumpPower.Parent = Main
            JumpPower.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            JumpPower.BackgroundTransparency = 1.000
            JumpPower.Position = UDim2.new(0.71704179, 0, 0.247311786, 0)
            JumpPower.Size = UDim2.new(0, 60, 0, 50)
            JumpPower.Font = Enum.Font.SourceSans
            JumpPower.Text = closestplr.Character.Humanoid.JumpPower..""
            JumpPower.TextColor3 = Color3.fromRGB(0, 0, 0)
            JumpPower.TextSize = 20.000
            
            Bar.Name = "Bar"
            Bar.Parent = Gui
            Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Bar.BackgroundTransparency = 0.800
            Bar.Position = UDim2.new(0.409020424, 0, 0.0634630024, 0)
            Bar.Size = UDim2.new(0, 221, 0, 10)
            
            UICorner.Parent = Bar
            
            Hp.Name = "Hp"
            Hp.Parent = Gui
            Hp.BackgroundColor3 = Color3.fromRGB(34, 255, 10)
            Hp.BackgroundTransparency = 0.500
            Hp.Position = UDim2.new(0.409020424, 0, 0.0634630024, 0)
            Hp.Size = UDim2.new(0, 221, 0, 10)
            
            UICorner_2.Parent = Hp

            if closestplr.Character.Humanoid.Health < 90 then
                Hp.BackgroundColor3 = Color3.fromRGB(132, 255, 10)
                Hp.Size = UDim2.new(0, 198.9, 0, 10)
                highlight.FillColor = Color3.fromRGB(132, 255, 10)
            end

            if closestplr.Character.Humanoid.Health < 80 then
                Hp.BackgroundColor3 = Color3.fromRGB(114, 228, 7)
                Hp.Size = UDim2.new(0, 176.8, 0, 10)
                highlight.FillColor = Color3.fromRGB(114, 228, 7)
            end

            if closestplr.Character.Humanoid.Health < 70 then
                Hp.BackgroundColor3 = Color3.fromRGB(185, 222, 1)
                Hp.Size = UDim2.new(0 ,154.7 , 0, 10)
                highlight.FillColor = Color3.fromRGB(185, 222, 1)
            end

            if closestplr.Character.Humanoid.Health < 60 then
                Hp.BackgroundColor3 = Color3.fromRGB(212, 191, 2)
                Hp.Size = UDim2.new(0, 132.6, 0, 10)
                highlight.FillColor = Color3.fromRGB(212, 191, 2)
            end

            if closestplr.Character.Humanoid.Health < 50 then
                Hp.BackgroundColor3 = Color3.fromRGB(212, 142, 2)
                Hp.Size = UDim2.new(0, 110.5, 0, 10)
                highlight.FillColor = Color3.fromRGB(212, 142, 2)
            end

            if closestplr.Character.Humanoid.Health < 40 then
                Hp.BackgroundColor3 = Color3.fromRGB(225, 127, 0)
                Hp.Size = UDim2.new(0, 88.4, 0, 10)
                highlight.FillColor = Color3.fromRGB(225, 127, 0)
            end

            if closestplr.Character.Humanoid.Health < 30 then
                Hp.BackgroundColor3 = Color3.fromRGB(222, 100, 0)
                Hp.Size = UDim2.new(0, 66.3, 0, 10)
                highlight.FillColor = Color3.fromRGB(222, 100, 0)
            end

            if closestplr.Character.Humanoid.Health < 20 then
                Hp.BackgroundColor3 = Color3.fromRGB(232, 74, 0)
                Hp.Size = UDim2.new(0, 44.2, 0, 10)
                highlight.FillColor = Color3.fromRGB(232, 74, 0)
            end
            
            if closestplr.Character.Humanoid.Health < 10 then
                Hp.BackgroundColor3 = Color3.fromRGB(232, 0, 0)
                Hp.Size = UDim2.new(0, 22.1, 0, 10)
                highlight.FillColor = Color3.fromRGB(232, 0, 0)
            end

            if closestplr.Character.Humanoid.Health == 0 then
                Hp.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Hp.BackgroundTransparency = 1
                Hp.Size = UDim2.new(0, 0, 0, 0)
                highlight.FillColor = Color3.fromRGB(0, 0, 0)
            end

        end
    end
end)
