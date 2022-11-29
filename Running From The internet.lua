local Time = os.clock()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().Drink = true

task.spawn(function()
    while task.wait() do
        if getgenv().Drink then
            game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.DrinkSpeedCola:InvokeServer()
        end
    end
end)

local Window = Rayfield:CreateWindow({
	Name = "RUNNING FROM THE INTERNET!",
	LoadingTitle = "Hydra Network v2",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
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

local T1 = Window:CreateTab("Main", 4483362458)
local T2 = Window:CreateTab("Misc", 4483362458)

local TargetWalkspeed
local Slider = T1:CreateSlider({
	Name = "WalkSpeed Slider",
	Range = {0, 250},
	Increment = 1,
	Suffix = "WalkSpeed",
	CurrentValue = 0,
	Flag = "Slider1",
	Callback = function(Value)
        TargetWalkspeed = Value
	end,
})

local Slider = T1:CreateSlider({
	Name = "JumpPower Slider",
	Range = {50, 250},
	Increment = 1,
	Suffix = "JumpPower",
	CurrentValue = 50,
	Flag = "Slider1",
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
	end,
})

local Slider = T1:CreateSlider({
	Name = "HipHeight Slider",
	Range = {0, 250},
	Increment = 1,
	Suffix = "HipHeight",
	CurrentValue = 0,
	Flag = "Slider1",
	Callback = function(HipValue)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = HipValue
	end,
})

local Toggle = T2:CreateToggle({
	Name = "Insta Speed-Cola",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        Drink = Value
	end,
})









game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
        end
    end)
end)

local notif = Notification.new("success", "Success", "HydraNetworkv2 took " .. math.round(os.clock() - Time) .. "s to load!")
notif:deleteTimeout(3)