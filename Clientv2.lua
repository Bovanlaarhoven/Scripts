local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Main = Instance.new("ScreenGui")
local Top = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Background = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Player = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local Username = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Name_2 = Instance.new("TextLabel")
local Name_3 = Instance.new("TextLabel")
local UserId = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local userId = Instance.new("TextLabel")
local Id = Instance.new("TextLabel")
local AccountAge = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local AccAge = Instance.new("TextLabel")
local Age = Instance.new("TextLabel")
local WalkSpeed = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Speed = Instance.new("TextLabel")
local Studs = Instance.new("TextLabel")
local JumpPower = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Power = Instance.new("TextLabel")
local Jumppower = Instance.new("TextLabel")
local Health = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local health = Instance.new("TextLabel")
local Hp = Instance.new("TextLabel")
local MaxHealth = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local MaxHp = Instance.new("TextLabel")
local maxhealth = Instance.new("TextLabel")
local RigType = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local RigTypeName = Instance.new("TextLabel")
local RigType_2 = Instance.new("TextLabel")
local Extra = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local Hp_2 = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local OpenClose = Instance.new("TextButton")
local UICorner_15 = Instance.new("UICorner")

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
            Main.Name = "Main"
            Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            Main.ResetOnSpawn = false
            
            Top.Name = "Top"
            Top.Parent = Main
            Top.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
            Top.BorderColor3 = Color3.fromRGB(54, 54, 54)
            Top.Position = UDim2.new(0.418227553, 0, 0.155555561, 0)
            Top.Size = UDim2.new(0, 317, 0, 24)
            Top.ZIndex = 2
            
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Top
            
            Background.Name = "Background"
            Background.Parent = Top
            Background.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Background.BorderColor3 = Color3.fromRGB(60, 60, 60)
            Background.Position = UDim2.new(0, 0, 0.691296399, 0)
            Background.Size = UDim2.new(0, 317, 0, 308)
            
            UICorner_2.CornerRadius = UDim.new(0, 5)
            UICorner_2.Parent = Background
            
            Name.Name = "Name"
            Name.Parent = Top
            Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Name.BackgroundTransparency = 1.000
            Name.Size = UDim2.new(0, 317, 0, 24)
            Name.ZIndex = 2
            Name.Font = Enum.Font.SourceSans
            Name.Text = " Player Info"
            Name.TextColor3 = Color3.fromRGB(255, 255, 255)
            Name.TextSize = 20.000
            Name.TextXAlignment = Enum.TextXAlignment.Left
            
            Player.Name = "Player"
            Player.Parent = Top
            Player.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Player.BorderColor3 = Color3.fromRGB(60, 60, 60)
            Player.Position = UDim2.new(0.050896775, 0, 1.35560226, 0)
            Player.Size = UDim2.new(0, 144, 0, 164)
            
            UICorner_3.CornerRadius = UDim.new(0, 5)
            UICorner_3.Parent = Player
            
            ImageLabel.Parent = Player
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BackgroundTransparency = 1.000
            ImageLabel.Size = UDim2.new(0, 144, 0, 164)
            ImageLabel.Image = "rbxassetid://11512316807"
            
            UICorner_4.CornerRadius = UDim.new(0, 5)
            UICorner_4.Parent = ImageLabel
            
            Username.Name = "Username"
            Username.Parent = Top
            Username.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            Username.BorderColor3 = Color3.fromRGB(76, 76, 78)
            Username.Position = UDim2.new(0.0504731871, 0, 8.5939436, 0)
            Username.Size = UDim2.new(0, 289, 0, 26)
            Username.ZIndex = 2
            
            UICorner_5.CornerRadius = UDim.new(0, 5)
            UICorner_5.Parent = Username
            
            Name_2.Name = "Name:"
            Name_2.Parent = Username
            Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Name_2.BackgroundTransparency = 1.000
            Name_2.Size = UDim2.new(0, 289, 0, 22)
            Name_2.ZIndex = 2
            Name_2.Font = Enum.Font.SourceSans
            Name_2.Text = " Name:"
            Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Name_2.TextSize = 26.000
            Name_2.TextWrapped = true
            Name_2.TextXAlignment = Enum.TextXAlignment.Left
            
            Name_3.Name = "Name"
            Name_3.Parent = Username
            Name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Name_3.BackgroundTransparency = 1.000
            Name_3.Position = UDim2.new(0.00046462749, 0, 0, 0)
            Name_3.Size = UDim2.new(0, 288, 0, 22)
            Name_3.ZIndex = 2
            Name_3.Font = Enum.Font.SourceSans
            Name_3.Text = "Hydra"
            Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            Name_3.TextSize = 26.000
            Name_3.TextWrapped = true
            Name_3.TextXAlignment = Enum.TextXAlignment.Right
            
            UserId.Name = "UserId"
            UserId.Parent = Top
            UserId.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            UserId.BorderColor3 = Color3.fromRGB(76, 76, 78)
            UserId.Position = UDim2.new(0.0473186113, 0, 10, 0)
            UserId.Size = UDim2.new(0, 289, 0, 26)
            UserId.ZIndex = 2
            
            UICorner_6.CornerRadius = UDim.new(0, 5)
            UICorner_6.Parent = UserId
            
            userId.Name = "userId:"
            userId.Parent = UserId
            userId.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            userId.BackgroundTransparency = 1.000
            userId.Size = UDim2.new(0, 289, 0, 22)
            userId.ZIndex = 2
            userId.Font = Enum.Font.SourceSans
            userId.Text = " User Id:"
            userId.TextColor3 = Color3.fromRGB(255, 255, 255)
            userId.TextSize = 26.000
            userId.TextWrapped = true
            userId.TextXAlignment = Enum.TextXAlignment.Left
            
            Id.Name = "Id"
            Id.Parent = UserId
            Id.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Id.BackgroundTransparency = 1.000
            Id.Position = UDim2.new(0.00046462749, 0, 0, 0)
            Id.Size = UDim2.new(0, 288, 0, 22)
            Id.ZIndex = 2
            Id.Font = Enum.Font.SourceSans
            Id.Text = "1234567890"
            Id.TextColor3 = Color3.fromRGB(255, 255, 255)
            Id.TextSize = 26.000
            Id.TextWrapped = true
            Id.TextXAlignment = Enum.TextXAlignment.Right
            
            AccountAge.Name = "AccountAge"
            AccountAge.Parent = Top
            AccountAge.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            AccountAge.Position = UDim2.new(0.0441640355, 0, 11.416666, 0)
            AccountAge.Size = UDim2.new(0, 289, 0, 26)
            AccountAge.ZIndex = 2
            
            UICorner_7.CornerRadius = UDim.new(0, 5)
            UICorner_7.Parent = AccountAge
            
            AccAge.Name = "AccAge:"
            AccAge.Parent = AccountAge
            AccAge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AccAge.BackgroundTransparency = 1.000
            AccAge.Size = UDim2.new(0, 289, 0, 22)
            AccAge.ZIndex = 2
            AccAge.Font = Enum.Font.SourceSans
            AccAge.Text = " Age (in days):"
            AccAge.TextColor3 = Color3.fromRGB(255, 255, 255)
            AccAge.TextSize = 26.000
            AccAge.TextWrapped = true
            AccAge.TextXAlignment = Enum.TextXAlignment.Left
            
            Age.Name = "Age"
            Age.Parent = AccountAge
            Age.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Age.BackgroundTransparency = 1.000
            Age.Position = UDim2.new(0.00046462749, 0, 0, 0)
            Age.Size = UDim2.new(0, 288, 0, 22)
            Age.ZIndex = 2
            Age.Font = Enum.Font.SourceSans
            Age.Text = "123123"
            Age.TextColor3 = Color3.fromRGB(255, 255, 255)
            Age.TextSize = 26.000
            Age.TextWrapped = true
            Age.TextXAlignment = Enum.TextXAlignment.Right
            
            WalkSpeed.Name = "WalkSpeed"
            WalkSpeed.Parent = Top
            WalkSpeed.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            WalkSpeed.BorderColor3 = Color3.fromRGB(76, 76, 78)
            WalkSpeed.Position = UDim2.new(0.539130092, 0, 1.3465488, 0)
            WalkSpeed.Size = UDim2.new(0, 132, 0, 20)
            WalkSpeed.ZIndex = 2
            
            UICorner_8.CornerRadius = UDim.new(0, 5)
            UICorner_8.Parent = WalkSpeed
            
            Speed.Name = "Speed"
            Speed.Parent = WalkSpeed
            Speed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Speed.BackgroundTransparency = 1.000
            Speed.Position = UDim2.new(0.000464237091, 0, 0, 0)
            Speed.Size = UDim2.new(0, 131, 0, 20)
            Speed.ZIndex = 2
            Speed.Font = Enum.Font.SourceSans
            Speed.Text = "16 "
            Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
            Speed.TextSize = 22.000
            Speed.TextWrapped = true
            Speed.TextXAlignment = Enum.TextXAlignment.Right
            
            Studs.Name = "Studs"
            Studs.Parent = WalkSpeed
            Studs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Studs.BackgroundTransparency = 1.000
            Studs.Position = UDim2.new(0.000464237091, 0, 0, 0)
            Studs.Size = UDim2.new(0, 131, 0, 20)
            Studs.ZIndex = 2
            Studs.Font = Enum.Font.SourceSans
            Studs.Text = " Studs/s:"
            Studs.TextColor3 = Color3.fromRGB(255, 255, 255)
            Studs.TextSize = 22.000
            Studs.TextWrapped = true
            Studs.TextXAlignment = Enum.TextXAlignment.Left
            
            JumpPower.Name = "JumpPower"
            JumpPower.Parent = Top
            JumpPower.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            JumpPower.BorderColor3 = Color3.fromRGB(76, 76, 78)
            JumpPower.Position = UDim2.new(0.536277592, 0, 2.66666675, 0)
            JumpPower.Size = UDim2.new(0, 132, 0, 20)
            JumpPower.ZIndex = 2
            
            UICorner_9.CornerRadius = UDim.new(0, 5)
            UICorner_9.Parent = JumpPower
            
            Power.Name = "Power"
            Power.Parent = JumpPower
            Power.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Power.BackgroundTransparency = 1.000
            Power.Position = UDim2.new(0.000464237091, 0, 0, 0)
            Power.Size = UDim2.new(0, 131, 0, 20)
            Power.ZIndex = 2
            Power.Font = Enum.Font.SourceSans
            Power.Text = "50"
            Power.TextColor3 = Color3.fromRGB(255, 255, 255)
            Power.TextSize = 22.000
            Power.TextWrapped = true
            Power.TextXAlignment = Enum.TextXAlignment.Right
            
            Jumppower.Name = "Jumppower"
            Jumppower.Parent = JumpPower
            Jumppower.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Jumppower.BackgroundTransparency = 1.000
            Jumppower.Position = UDim2.new(0.000464237091, 0, 0, 0)
            Jumppower.Size = UDim2.new(0, 131, 0, 20)
            Jumppower.ZIndex = 2
            Jumppower.Font = Enum.Font.SourceSans
            Jumppower.Text = " Power:"
            Jumppower.TextColor3 = Color3.fromRGB(255, 255, 255)
            Jumppower.TextSize = 22.000
            Jumppower.TextWrapped = true
            Jumppower.TextXAlignment = Enum.TextXAlignment.Left
            
            Health.Name = "Health"
            Health.Parent = Top
            Health.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            Health.BorderColor3 = Color3.fromRGB(76, 76, 78)
            Health.Position = UDim2.new(0.536277592, 0, 4, 0)
            Health.Size = UDim2.new(0, 132, 0, 20)
            Health.ZIndex = 2
            
            UICorner_10.CornerRadius = UDim.new(0, 5)
            UICorner_10.Parent = Health
            
            health.Name = "health"
            health.Parent = Health
            health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            health.BackgroundTransparency = 1.000
            health.Position = UDim2.new(0.000464237091, 0, 0, 0)
            health.Size = UDim2.new(0, 131, 0, 20)
            health.ZIndex = 2
            health.Font = Enum.Font.SourceSans
            health.Text = " Health:"
            health.TextColor3 = Color3.fromRGB(255, 255, 255)
            health.TextSize = 22.000
            health.TextWrapped = true
            health.TextXAlignment = Enum.TextXAlignment.Left
            
            Hp.Name = "Hp"
            Hp.Parent = Health
            Hp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hp.BackgroundTransparency = 1.000
            Hp.Position = UDim2.new(0.000464237091, 0, 0, 0)
            Hp.Size = UDim2.new(0, 131, 0, 20)
            Hp.ZIndex = 2
            Hp.Font = Enum.Font.SourceSans
            Hp.Text = "100"
            Hp.TextColor3 = Color3.fromRGB(255, 255, 255)
            Hp.TextSize = 22.000
            Hp.TextWrapped = true
            Hp.TextXAlignment = Enum.TextXAlignment.Right
            
            MaxHealth.Name = "MaxHealth"
            MaxHealth.Parent = Top
            MaxHealth.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            MaxHealth.BorderColor3 = Color3.fromRGB(76, 76, 78)
            MaxHealth.Position = UDim2.new(0.533123016, 0, 5.20833349, 0)
            MaxHealth.Size = UDim2.new(0, 132, 0, 20)
            
            UICorner_11.CornerRadius = UDim.new(0, 5)
            UICorner_11.Parent = MaxHealth
            
            MaxHp.Name = "MaxHp"
            MaxHp.Parent = MaxHealth
            MaxHp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MaxHp.BackgroundTransparency = 1.000
            MaxHp.Position = UDim2.new(0.000464237091, 0, 0, 0)
            MaxHp.Size = UDim2.new(0, 131, 0, 20)
            MaxHp.ZIndex = 2
            MaxHp.Font = Enum.Font.SourceSans
            MaxHp.Text = "100"
            MaxHp.TextColor3 = Color3.fromRGB(255, 255, 255)
            MaxHp.TextSize = 22.000
            MaxHp.TextWrapped = true
            MaxHp.TextXAlignment = Enum.TextXAlignment.Right
            
            maxhealth.Name = "maxhealth"
            maxhealth.Parent = MaxHealth
            maxhealth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            maxhealth.BackgroundTransparency = 1.000
            maxhealth.Position = UDim2.new(0.000464237091, 0, 0, 0)
            maxhealth.Size = UDim2.new(0, 131, 0, 20)
            maxhealth.ZIndex = 2
            maxhealth.Font = Enum.Font.SourceSans
            maxhealth.Text = " MaxHealth:"
            maxhealth.TextColor3 = Color3.fromRGB(255, 255, 255)
            maxhealth.TextSize = 22.000
            maxhealth.TextWrapped = true
            maxhealth.TextXAlignment = Enum.TextXAlignment.Left
            
            RigType.Name = "RigType"
            RigType.Parent = Top
            RigType.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            RigType.BorderColor3 = Color3.fromRGB(76, 76, 78)
            RigType.Position = UDim2.new(0.533123016, 0, 6.41666651, 0)
            RigType.Size = UDim2.new(0, 132, 0, 20)
            
            UICorner_12.CornerRadius = UDim.new(0, 5)
            UICorner_12.Parent = RigType
            
            RigTypeName.Name = "RigTypeName"
            RigTypeName.Parent = RigType
            RigTypeName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RigTypeName.BackgroundTransparency = 1.000
            RigTypeName.Position = UDim2.new(0.000464237091, 0, 0, 0)
            RigTypeName.Size = UDim2.new(0, 131, 0, 20)
            RigTypeName.ZIndex = 2
            RigTypeName.Font = Enum.Font.SourceSans
            RigTypeName.Text = "R15"
            RigTypeName.TextColor3 = Color3.fromRGB(255, 255, 255)
            RigTypeName.TextSize = 22.000
            RigTypeName.TextWrapped = true
            RigTypeName.TextXAlignment = Enum.TextXAlignment.Right
            
            RigType_2.Name = "RigType"
            RigType_2.Parent = RigType
            RigType_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RigType_2.BackgroundTransparency = 1.000
            RigType_2.Position = UDim2.new(0.000464237091, 0, 0, 0)
            RigType_2.Size = UDim2.new(0, 131, 0, 20)
            RigType_2.ZIndex = 2
            RigType_2.Font = Enum.Font.SourceSans
            RigType_2.Text = " RigType:"
            RigType_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            RigType_2.TextSize = 22.000
            RigType_2.TextWrapped = true
            RigType_2.TextXAlignment = Enum.TextXAlignment.Left
            
            Extra.Name = "Extra"
            Extra.Parent = Top
            Extra.BackgroundColor3 = Color3.fromRGB(76, 76, 78)
            Extra.BorderColor3 = Color3.fromRGB(76, 76, 78)
            Extra.Position = UDim2.new(0.531395316, 0, 7.67314816, 0)
            Extra.Size = UDim2.new(0, 132, 0, 12)
            Extra.ZIndex = 2
            
            UICorner_13.CornerRadius = UDim.new(0, 5)
            UICorner_13.Parent = Extra
            
            Hp_2.Name = "Hp"
            Hp_2.Parent = Top
            Hp_2.BackgroundColor3 = Color3.fromRGB(34, 255, 10)
            Hp_2.BorderColor3 = Color3.fromRGB(34, 255, 10)
            Hp_2.Position = UDim2.new(0.531395316, 0, 7.67314816, 0)
            Hp_2.Size = UDim2.new(0, 132, 0, 12)
            Hp_2.ZIndex = 3
            
            UICorner_14.CornerRadius = UDim.new(0, 5)
            UICorner_14.Parent = Hp_2
            
            OpenClose.Name = "Open/Close"
            OpenClose.Parent = Top
            OpenClose.BackgroundColor3 = Color3.fromRGB(218, 24, 18)
            OpenClose.BorderColor3 = Color3.fromRGB(218, 24, 18)
            OpenClose.Position = UDim2.new(0.809000015, 0, 0.170333311, 0)
            OpenClose.Size = UDim2.new(0, 48, 0, 14)
            OpenClose.ZIndex = 2
            OpenClose.Font = Enum.Font.SourceSans
            OpenClose.Text = "Close"
            OpenClose.TextColor3 = Color3.fromRGB(255, 255, 255)
            OpenClose.TextScaled = true
            OpenClose.TextSize = 14.000
            OpenClose.TextWrapped = true
            
            UICorner_15.CornerRadius = UDim.new(0, 5)
            UICorner_15.Parent = OpenClose

        local script = Instance.new('LocalScript', Top)
    
        local UserInputService = game:GetService("UserInputService")
        local runService = (game:GetService("RunService"));
        
        local gui = script.Parent
        
        local dragging
        local dragInput
        local dragStart
        local startPos
        
        function Lerp(a, b, m)
            return a + (b - a) * m
        end;
        
        local lastMousePos
        local lastGoalPos
        local DRAG_SPEED = (25);
        function Update(dt)
            if not (startPos) then return end;
            if not (dragging) and (lastGoalPos) then
                gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
                return 
            end;
        
            local delta = (lastMousePos - UserInputService:GetMouseLocation())
            local xGoal = (startPos.X.Offset - delta.X);
            local yGoal = (startPos.Y.Offset - delta.Y);
            lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
            gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
        end;
        
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
                lastMousePos = UserInputService:GetMouseLocation()
        
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        
        runService.Heartbeat:Connect(Update)
    end
        local script = Instance.new('LocalScript', OpenClose)
    
        local Toggled = true
        
        OpenClose.MouseButton1Down:Connect(function()
            if Toggled then
                Toggled = false
                Background:TweenSize(UDim2.new(0, 317,0, 0), "InOut", "Linear", 0.1)
                AccountAge.Visible = false
                Hp.Visible = false
                Extra.Visible = false
                Health.Visible = false
                JumpPower.Visible = false
                WalkSpeed.Visible = false
                MaxHealth.Visible = false
                Player.Visible = false
                RigType.Visible = false
                UserId.Visible = false
                Username.Visible = false
                OpenClose.BackgroundColor3 = Color3.fromRGB(34, 255, 10)
                OpenClose.Text = "Open"
            else
                Toggled = true
                Background:TweenSize(UDim2.new(0, 317,0, 308), "InOut", "Linear", 0.1)
                AccountAge.Visible = true
                Hp.Visible = true
                Extra.Visible = true
                Health.Visible = true
                JumpPower.Visible = true
                WalkSpeed.Visible = true
                MaxHealth.Visible = true
                Player.Visible = true
                RigType.Visible = true
                UserId.Visible = true
                Username.Visible = true
                OpenClose.BackgroundColor3 = Color3.fromRGB(218, 24, 18)
                OpenClose.Text = "Close"
            end
        end)
    end
end)
