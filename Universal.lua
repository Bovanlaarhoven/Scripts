local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "Hydra Network",
	Content = "Welcome To Hydra Network Universal",
	Image = "rbxassetid://4483345998",
	Time = 5
})

wait(2)

local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")
local Light = game:GetService("Lighting")
local Window = OrionLib:MakeWindow({Name = "Hydra Network Universal", HidePremium = false, IntroText = "Universal 0.01", SaveConfig = false, ConfigFolder = "OrionTest"})

--scripts

lag = true

function functionlag()
    while lag == true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(0.00001)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        wait()
    end
end

--tabs

local CharTab = Window:MakeTab({
	Name = "Slider Feature's",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FeaturesTab = Window:MakeTab({
	Name = "Feature's",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--toggles

FeaturesTab:AddToggle({
	Name = "Fake lag",
	Default = false,
	Callback = function(Value)
        lag = Value
        functionlag()
	end    
})

--dropdowns

--sliders

local SpeedSection = CharTab:AddSection({
	Name = "Walk Modifiers"
})

local TargetWalkspeed
CharTab:AddSlider({
	Name = "Speed (MoveDirection)",
	Min = 0,
	Max = 100,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end   
})

CharTab:AddSlider({
	Name = "Speed (WalkSpeed)",
	Min = 0,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(WalkSpeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end   
})

local SpeedSection = CharTab:AddSection({
	Name = "Jump Modifiers"
})

CharTab:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 100,
	Default = 50.145,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
    end
})

local SpeedSection = CharTab:AddSection({
	Name = "Other Modifiers"
})

CharTab:AddSlider({
	Name = "Hip Height",
	Min = 1.7999993562698364,
	Max = 100,
	Default = 1.7999993562698364,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(JumpHeight)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = JumpHeight
    end
})

CharTab:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 196.2,
	Default = 196.2,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Gravity)
        Workspace.Gravity = Gravity
    end
})

CharTab:AddSlider({
	Name = "Day & night Slider",
	Min = 0,
	Max = 24,
	Default = 14,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Time)
        game.Lighting.ClockTime = Time
    end
})

--keybinds

FeaturesTab:AddBind({
	Name = "Rejoin Server",
	Default = Enum.KeyCode.Z,
	Hold = false,
	Callback = function()
        OrionLib:MakeNotification({
            Name = "You Pressed the Rejoin Keybind.",
            Content = "Rejoining in 5 seconds",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(1)
        OrionLib:MakeNotification({
            Name = "Hydra Network",
            Content = "Rejoining in 4 seconds",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(1)
        OrionLib:MakeNotification({
            Name = "Hydra Network",
            Content = "Rejoining in 3 seconds",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(1)
        OrionLib:MakeNotification({
            Name = "Hydra Network",
            Content = "Rejoining in 2 seconds",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(1)
        OrionLib:MakeNotification({
            Name = "Hydra Network",
            Content = "Rejoining in 1 seconds",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(1)
        OrionLib:MakeNotification({
            Name = "Hydra Network",
            Content = "Rejoining",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
	end    
})

--buttons

FeaturesTab:AddButton({
	Name = "Full Bright.",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.ClockTime = 14
        game.Lighting.Brightness = 10
        game.Lighting.GlobalShadows = false
  	end    
})

FeaturesTab:AddButton({
	Name = "Inf Jump",
	Callback = function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
  	end    
})

FeaturesTab:AddButton({
	Name = "Q to Teleport",
	Callback = function()
        plr = game.Players.LocalPlayer 
        hum = plr.Character.HumanoidRootPart 
        mouse = plr:GetMouse()
        mouse.KeyDown:connect(function(key)
            if key == "q" then
            if mouse.Target then
                hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
                end
            end
        end)
  	end    
})

FeaturesTab:AddButton({
    Name = "Free cam (shift + P)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Freecam.lua"))()
      end    
})

--others
CreditsTab:AddParagraph("Owner/Main Developer","Hydra#0001")
CreditsTab:AddParagraph("Discord","Dont Forget to join the discord.gg/k9a4zym5uG.")

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
        end
    end)
end)

OrionLib:Init()