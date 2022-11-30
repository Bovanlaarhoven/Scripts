local Light = game:GetService("Lighting")
local Time = os.clock()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().Drink = false
getgenv().Eat = false
getgenv().Drop = false
getgenv().autothrow = false

local x = 0
local y = 0
local z = 0

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

task.spawn(function()
	while task.wait() do
		if getgenv().autothrow then
			local ohVector31 = Vector3.new(x, y, z)
			game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.ThrowBomb:InvokeServer(ohVector31)
			game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.ThrowLandmine:InvokeServer(ohVector31)
			game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.ThrowCrate:InvokeServer(ohVector31)
			game:GetService("ReplicatedStorage").Assets.RemoteFunctions.Items.ThrowBanana:InvokeServer(ohVector31)
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

local T1 = Window:CreateTab("Player", 4483362458)
local T2 = Window:CreateTab("Power-ups", 4483362458)
local T3 = Window:CreateTab("Fun", 4483362458)
local T4 = Window:CreateTab("Auto-Throw", 4483362458)

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
	Range = {70, 120},
	Increment = 1,
	Suffix = "HipHeight",
	CurrentValue = 70,
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

local Label1 = T4:CreateLabel("x cords are 0")
local Label2 = T4:CreateLabel("y cords are 0")
local Label3 = T4:CreateLabel("z cords are 0")

local Toggle = T4:CreateToggle({
	Name = "Auto Throw",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		autothrow = Value
	end,
})

local Input = T4:CreateInput({
	Name = "x cords",
	PlaceholderText = "x",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		x = Text
		Label1:Set("x cords are "..x)
	end,
})

local Input = T4:CreateInput({
	Name = "y cords",
	PlaceholderText = "y",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		y = Text
		Label2:Set("y cords are "..y)
	end,
})

local Input = T4:CreateInput({
	Name = "z cords",
	PlaceholderText = "z",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		z = Text
		Label3:Set("z cords are "..z)
	end,
})

local Label = T4:CreateLabel("Recommend turning on 'Disable Ragdoll'")





game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
        end
    end)
end)

local notif = Notification.new("success", "Success", "HydraNetworkv2 took " .. math.round(os.clock() - Time) .. "s to load!")
notif:deleteTimeout(3)