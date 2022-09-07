local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "Hydra Network",
	Content = "Loading Hydra Network.",
	Image = "rbxassetid://4483345998",
	Time = 2
})

wait(2)

local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")
local Light = game:GetService("Lighting")
local Window = OrionLib:MakeWindow({Name = "Hydra Network Universal", HidePremium = false, IntroText = "Universal 0.05", SaveConfig = false, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Hydra Network",
	Content = "Welcome to Hydra Network Universal",
	Image = "rbxassetid://4483345998",
	Time = 2
})

--scripts

lag = true

function functionlag()
    while lag == true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        wait(0.34)
    end
end

--tabs

local SliderTab = Window:MakeTab({
	Name = "Sliders",
	Icon = "rbxassetid://10847740232",
	PremiumOnly = false
})

local ButtonsTab = Window:MakeTab({
	Name = "Buttons",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TogglesTab = Window:MakeTab({
	Name = "Toggles",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local KeybindsTab = Window:MakeTab({
	Name = "Keybinds",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local OthersTab = Window:MakeTab({
	Name = "Others",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--toggles

TogglesTab:AddToggle({
	Name = "Fake lag",
	Default = false,
	Callback = function(Value)
        lag = Value
        functionlag()
	end    
})

--inputs

OthersTab:AddTextbox({
    Name = "Chat Spammer (Click it After input)",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        local ohString1 = (Value)
        local ohString2 = "All"
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
    end	  
})

--dropdowns


--sliders


local SpeedSection = SliderTab:AddSection({
	Name = "Walk Modifiers"
})

local TargetWalkspeed
SliderTab:AddSlider({
	Name = "Speed (MoveDirection)",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end   
})

SliderTab:AddSlider({
	Name = "Speed (WalkSpeed)",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(WalkSpeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end   
})

local SpeedSection = SliderTab:AddSection({
	Name = "Jump Modifiers"
})

SliderTab:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 250,
	Default = 50.145,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
    end
})

local SpeedSection = SliderTab:AddSection({
	Name = "Other Player Modifiers"
})

SliderTab:AddSlider({
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

SliderTab:AddSlider({
	Name = "Fov Slider",
	Min = 1,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Fov)
        game:GetService'Workspace'.Camera.FieldOfView = Fov
    end
})

local SpeedSection = SliderTab:AddSection({
	Name = "World Modifiers"
})

SliderTab:AddSlider({
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

SliderTab:AddSlider({
	Name = "Day & night Slider",
	Min = 0,
	Max = 24,
	Default = 14,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	Callback = function(Time)
        game.Lighting.ClockTime = Time
    end
})

--keybinds

KeybindsTab:AddBind({
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


KeybindsTab:AddBind({
	Name = "Bind",
	Default = Enum.KeyCode.X,
	Hold = false,
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		OrionLib:MakeNotification({
            Name = "Hydra Network",
            Content = "Pressed The Reset Keybind",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
	end    
})

--buttons

ButtonsTab:AddButton({
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
		OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Full bright Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		})
  	end    
})

ButtonsTab:AddButton({
	Name = "Inf Jump",
	Callback = function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
		OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the inf jump Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		})
  	end    
})

ButtonsTab:AddButton({
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
		OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Q to Teleport Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		})
  	end    
})

ButtonsTab:AddButton({
    Name = "Free cam (shift + P)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Freecam.lua"))()
		OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the free cam Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		})    
      end
})

ButtonsTab:AddButton({
    Name = "Anti-Afk",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
		OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Anti-Afk Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		})    
      end    
})

ButtonsTab:AddButton({
    Name = "Chat Spy",
    Callback = function()
        enabled = true
spyOnMyself = false
public = false
publicItalics = true
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
OrionLib:MakeNotification({
	Name = "Hydra Network",
	Content = "Pressed on the Chat Spy Button",
	Image = "rbxassetid://4483345998",
	Time = 2
})    
      end    
})

ButtonsTab:AddButton({
    Name = "Enables Shift lock in settings",
    Callback = function()
        game:GetService("Players").LocalPlayer.DevEnableMouseLock = true
		OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Enables Shift lock in settings",
			Image = "rbxassetid://4483345998",
			Time = 2
		})    
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