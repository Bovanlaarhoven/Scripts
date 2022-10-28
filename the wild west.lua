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
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		Key = "ABCDEF"
	}
})

local T1 = Window:CreateTab("Animal ESP")
local T2 = Window:CreateTab("Ore ESP")

local Button = T1:CreateButton({
	Name = "Bear Esp",
	Callback = function()
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
            TextLabel.TextColor3 = Color3.new(1, 0, 0)
            TextLabel.TextScaled = true
            end
        end
	end,
})


