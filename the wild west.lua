getgenv().SecureMode = true
local Light = game:GetService("Lighting")
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "tww esp",
	LoadingTitle = "tww esp",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FileName = "Big Hub"
	},
	KeySystem = false,
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		Key = "ABCDEF"
	}
})

local T1 = Window:CreateTab("Animal Esp(billboard)")
local T2 = Window:CreateTab("Animal Esp(highlight)")
local T3 = Window:CreateTab("Other")

local Button = T1:CreateButton({
	Name = "Bear Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Bear" then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                
                BillboardGui.Parent = v.Parent
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = "Bear"
                TextLabel.TextColor3 = Color3.new(0.831372, 0.607843, 0.607843)
                TextLabel.TextScaled = true
                end
            end
        end)
	end,
})

local Button = T1:CreateButton({
	Name = "Bison Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Bison" then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                
                BillboardGui.Parent = v.Parent
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = "Bison"
                TextLabel.TextColor3 = Color3.new(0.831372, 0.607843, 0.607843)
                TextLabel.TextScaled = true
                end
            end
        end)
	end,
})

local Button = T1:CreateButton({
	Name = "Deer Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Deer" then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                
                BillboardGui.Parent = v.Parent
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = "Deer"
                TextLabel.TextColor3 = Color3.new(0.235294, 0.125490, 0.125490)
                TextLabel.TextScaled = true
                end
            end
        end)
	end,
})

local Button = T1:CreateButton({
	Name = "Gator Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Gator" then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                
                BillboardGui.Parent = v.Parent
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = "Gator"
                TextLabel.TextColor3 = Color3.new(0, 1, 0.117647)
                TextLabel.TextScaled = true
                end
            end
        end)
	end,
})

local Button = T2:CreateButton({
	Name = "Bear Esp",
	Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.ClassName == "Model" and v.Parent.Name == "Bear" then
                local BillboardGui = Instance.new("Highlight")
                BillboardGui.Parent = v.Parent
            end
        end
	end,
})

local Button = T2:CreateButton({
	Name = "Bison Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Bison" then
                local BillboardGui = Instance.new("Highlight")
                BillboardGui.Parent = v.Parent
                end
            end
        end)
	end,
})

local Button = T2:CreateButton({
	Name = "Deer Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Deer" then
                local BillboardGui = Instance.new("Highlight")
                BillboardGui.Parent = v.Parent
                end
            end
        end)
	end,
})

local Button = T2:CreateButton({
	Name = "Gator Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Gator" then
                    local BillboardGui = Instance.new("Highlight")
                    BillboardGui.Parent = v.Parent
                end
            end
        end)
	end,
})

local Button = T3:CreateButton({
	Name = "Horse Esp (billboard)",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Horse" then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                
                BillboardGui.Parent = v.Parent
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = "Horse"
                TextLabel.TextColor3 = Color3.new(0, 1, 0.117647)
                TextLabel.TextScaled = true
                end
            end
        end)
	end,
})

local Button = T3:CreateButton({
	Name = "Horse Esp (highlight)",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Horse" then
                    local BillboardGui = Instance.new("Highlight")
                    BillboardGui.Parent = v.Parent
                end
            end
        end)
	end,
})


local Button = T3:CreateButton({
	Name = "Item Esp",
	Callback = function()
        game:GetService("Workspace").Ignore.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "AnimalMeat" or v.Parent.Name == "GrizzlyPelt" or v.Parent.Name == "BisonPelt" or v.Parent.Name == "BearClaw" or v.Parent.Name == "DeerPelt" then
                    local BillboardGui = Instance.new("Highlight")
                    BillboardGui.Parent = v.Parent
                end
            end
        end)
	end,
})

local Button = T3:CreateButton({
	Name = "Fullbright",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.ClockTime = 14
        game.Lighting.Brightness = 2
        game.Lighting.GlobalShadows = false
	end,
})

