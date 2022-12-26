local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Legends of speed",
	LoadingTitle = "Hydra Network v2",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = true,
        	Invite = "k9a4zym5uG", 
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

getgenv().AutoHoop = false

task.spawn(function()
    while task.wait() do
        if getgenv().AutoHoop == true then
            while true do task.wait()
                for i,v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
                    if v.Name == "Hoop" then
                        v.CFrame = game:GetService("Players").LocalPlayer.Character.Head.CFrame
					else
						v:Destroy()
                    end
                end
            end
        end
    end
end)

local Tab = Window:CreateTab("Main", 4483362458)

local Button = Tab:CreateButton({
	Name = "Hoop Auto Farm",
	Callback = function()
		AutoHoop = true
	end,
})