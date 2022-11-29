local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Plane crash physics",
	LoadingTitle = "Hydra Network v2",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "sirius", 
        	RememberJoins = true 
        },
	KeySystem = false, 
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, 
		Key = "Hello"
	}
})

local Tab = Window:CreateTab("Main", 4483362458)

local Toggle = Tab:CreateToggle({
	Name = "Toggle Example",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        game:GetService("ReplicatedStorage").GetCash:FireServer()
	end,
})
