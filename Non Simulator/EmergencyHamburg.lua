local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local lplr = game:GetService("Players").LocalPlayer

local settings = {
    godcar = false,
    inffual = false,
}

local Window = Rayfield:CreateWindow({
    Name = "Emergency Hamburg",
    LoadingTitle = "Hydra Network",
    LoadingSubtitle = "by Hydra#8270",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "YvwEyH2W6t",
       RememberJoins = true
    },
	KeySystem = false,
	KeySettings = {
		Title = "Hydra Network",
		Subtitle = "Key System",
		Note = "Key link copied in clipboard!",
		FileName = "SiriusKey",
		SaveKey = false,
		GrabKeyFromSite = true,
		Key = ""
	}
})

task.defer(function()
    while task.wait() do
        if settings.godcar then
            workspace.Vehicles[lplr.Name]:SetAttribute("CurrentHealth", 1)
        end
    end
end)

task.defer(function()
    while task.wait() do
        if settings.inffual then
            workspace.Vehicles[lplr.Name]:SetAttribute("CurrentFuel", 100)
        end
    end
end)

local Tab = Window:CreateTab("Main", 4483362458)

local Toggle = Tab:CreateToggle({
    Name = "god car",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        settings.godcar = Value
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "inf fuel",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        settings.inffual = Value
    end,
})