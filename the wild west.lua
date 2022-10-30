getgenv().SecureMode = true
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
                TextLabel.TextColor3 = Color3.new(0.545098, 0.345098, 0.003921)
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
	Name = "Bear Esp",
	Callback = function()
        game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(child)
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.ClassName == "Model" and v.Parent.Name == "Bear" then
                    if v.ClassName == "NumberValue" and v.Health.NumberValue > 800 then
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
                        TextLabel.TextColor3 = Color3.new(0.545098, 0.345098, 0.003921)
                        TextLabel.TextScaled = true
                    end
                end
            end
        end)
	end,
})

local Button = T3:CreateButton({
	Name = "Button Example",
	Callback = function()
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            local health = v:WaitForChild("Health")
            if health and health.Value > 800 then 
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
                TextLabel.TextColor3 = Color3.new(0.545098, 0.345098, 0.003921)
                TextLabel.TextScaled = true
            end
        end
	end,
})

