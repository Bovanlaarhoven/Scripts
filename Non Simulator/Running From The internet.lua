getgenv().spinSpeed = 20
local Spin = Instance.new("BodyAngularVelocity")
local Light = game:GetService("Lighting")
local Time = os.clock()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().Drink = false
getgenv().Eat = false
getgenv().Drop = false

task.spawn(function()
	while task.wait() do
		if getgenv().Drop then
			game:GetService("ReplicatedStorage").Assets.RemoteEvents.Items.DropItem:FireServer()
		end
	end
end)

task.spawn(function()
    while task.wait() do
        if getgenv().Drink then
            game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.DrinkSpeedCola:InvokeServer()
        end
    end
end)

task.spawn(function()
	while task.wait() do
		if getgenv().Eat then
			game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.HealBurger:InvokeServer()
		end
	end
end)


function spin()
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
end


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
        	Enabled = true,
        	Invite = "YvwEyH2W6t", 
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

local T1 = Window:CreateTab("Player", 4483362458)
local T2 = Window:CreateTab("Power-ups", 4483362458)
local T3 = Window:CreateTab("Fun", 4483362458)

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
	Name = "FieldOfView Slider",
	Range = {75, 120},
	Increment = 1,
	Suffix = "FOV",
	CurrentValue = 75,
	Flag = "Slider1",
	Callback = function(View)
		game:GetService("Workspace").CurrentCamera.FieldOfView = View
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

local Toggle = T2:CreateToggle({
	Name = "Insta ChezBurger",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        Eat = Value
	end,
})


local Toggle = T2:CreateToggle({
	Name = "Disable Ragdoll",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        game:GetService("Players").LocalPlayer.Character.Player.Parkour.Ragdoll.Disabled = Value
	end,
})

local Toggle = T3:CreateToggle({
	Name = "Drop Items",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		Drop = Value
	end,
})

local Button = T1:CreateButton({
	Name = "Fullbright",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.Brightness = 1
        game.Lighting.GlobalShadows = false
	end,
})

local Slider = T3:CreateSlider({
	Name = "SpinSpeed",
	Range = {0, 50},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 1,
	Flag = "Slider1",
	Callback = function(Value)
		spinSpeed = Value
	end,
})

local Toggle = T3:CreateToggle({
	Name = "Spin-bot",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if Value then
			spin()
		else
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Spinning:Destroy()
		end
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