local Time = os.clock()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().autoclick = false
getgenv().autofarm = false
getgenv().autowalk = false

task.spawn(function()
    while task.wait(6) do
        if autoclick == true then
            game:GetService("ReplicatedStorage").System.SystemClick.Click:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if autowalk == true then
            local ohString1 = "isAutoOn"
            local ohNumber2 = 1
            game:GetService("ReplicatedStorage").ServerMsg.Setting:InvokeServer(ohString1, ohNumber2)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if autowalk == false then
            local ohString1 = "isAutoOn"
            local ohNumber2 = 0
            game:GetService("ReplicatedStorage").ServerMsg.Setting:InvokeServer(ohString1, ohNumber2)
        end
    end
end)

local Window = Rayfield:CreateWindow({
	Name = "Anime Clicker Fight",
	LoadingTitle = "Hydra Network",
	LoadingSubtitle = "by hydra#8270",
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
		Key = "https://pastebin.com/raw/DZdeYpEw"
	}
})

local T1 = Window:CreateTab("Auto Farm", 4483362458)

local Toggle = T1:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        autoclick = Value
   end,
})

local Toggle = T1:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        autofarm = Value
        if autofarm == true then
            autoclick = true
            autowalk = true
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 1000
        else
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 20
            autowalk = false
            autoclick = false
        end
    end,
 })



local notif = Notification.new("success", "Success", "HydraNetworkv2 took " .. math.round(os.clock() - Time) .. "s to load!")
notif:deleteTimeout(3)