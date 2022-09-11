local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
OrionLib:MakeNotification({
    Name = "Hydra Network",
    Content = "Hydra Network is Loading.",
    Image = "rbxassetid://4483345998",
    Time = 4
})
game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
wait(4)
OrionLib:MakeNotification({
    Name = "Hydra Network",
    Content = "Hydra Network is Ready!",
    Image = "rbxassetid://4483345998",
    Time = 2
})
local Window = OrionLib:MakeWindow({Name = "Hydra Network |Evade|", HidePremium = false,IntroText = "Evade V2.2s", SaveConfig = false, ConfigFolder = "OrionTest"})

--locals
local GuiService = game:GetService("GuiService")
local Light = game:GetService("Lighting")

--functions and shit

getgenv().AutoSlide = true
getgenv().money = true
getgenv().revivedie = true
getgenv().autowistle = true
getgenv().autochat = true
getgenv().autofarm = true

function queueOnTeleport(str)
	if identifyexecutor() == "Synapse X" then
		pcall(function()
			syn.queue_on_teleport(str)
		end)
	else 
		local suc,err = pcall(function() queue_on_teleport(str) end)
		if err then
			print("Error occured, trying again...")
			local suc,eror = pcall(function() queue_on_teleport(str) end)
						if eror then print("Cant queue teleport") end
		end
	end
	end
	queueOnTeleport([[
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Robobo2022/script/main/Main.lua"), true))()
	]])

function functionautofarm()
    while autofarm == true do task.wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(3080.2978515625, -800.8651733398438, 16.78089714050293)
        wait(0.0000000000000000000000001)
    end
end

function SpamChat()
    while autochat == true do
        local ohString1 = "Hydra Network on top"
        local ohString2 = "All"
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
        wait(1)
    end
end

function autowistlefunction()
    while autowistle == true do
        local ohString1 = "Whistle"
        local ohBoolean2 = true
        game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
        game:GetService("ReplicatedStorage").Events.Whistle:FireServer()
        wait(5)
    end
end

function god()
    while revivedie == true do
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
        wait()
    end
end
            


function dofullbright()
    Light.Ambient = Color3.new(1, 1, 1)
    Light.ColorShift_Bottom = Color3.new(1, 1, 1)
    Light.ColorShift_Top = Color3.new(1, 1, 1)
    game.Lighting.FogEnd = 100000
    game.Lighting.FogStart = 0
    game.Lighting.ClockTime = 14
    game.Lighting.Brightness = 2
    game.Lighting.GlobalShadows = false
end

function freemoney()
    while money == true do
        local ohString1 = "Free money <font color=\"rgb(100,255,100)\">($99999)</font>"
        game:GetService("Players").LocalPlayer.PlayerGui.HUD.Messages.Use:Fire(ohString1)
        wait(5)
    end
end

function Autoslide()
    while AutoSlide == true do
    game:GetService("ReplicatedStorage").ModuleStorage.WeaponBase.Framework.BaseVM.Slide:Fire()
    local ohString1 = "Crouch"
    local ohBoolean2 = true
    game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
    wait()
    end
end
    

function Notification()
OrionLib:MakeNotification({
    Name = "Respawning...",
    Content = "You pressed the respawn keybind",
    Image = "rbxassetid://4483345998",
    Time = 5
})
end

OrionLib:MakeNotification({
    Name = "Welcome To Hydra Network",
    Content = "Thanks for using Hydra Network!",
    Image = "rbxassetid://4483345998",
    Time = 5
})
    

function RandomEmote()
    OrionLib:MakeNotification({
        Name = "Random Emoting...",
        Content = "You pressed the Random Emote keybind",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end


--tabs

local MainTab= Window:MakeTab({
	Name = "Main features",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscTab= Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ESPTab = Window:MakeTab({
    Name =  "Esp",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local TeleportTab= Window:MakeTab({
    Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FunTab= Window:MakeTab({
    Name = "Fun",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = true
})

--sliders

local MainTab3 = MainTab:AddSection({
	Name = "Sliders"
})

local TargetWalkspeed
MainTab:AddSlider({
	Name = "Speed",
	Min = -2,
	Max = 100,
	Default = -2,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end   
})

MainTab:AddSlider({
    Name = "Hip height",
    Min = -1.40,
    Max = 100,
    Default = -1.40,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    Callback = function(HipValue)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = HipValue
    end    
})

MainTab:AddSlider({
	Name = "Fov Slider",
	Min = 1,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Fov)
        local ohString1 = "FieldOfView"
        local ohNumber2 = Fov
        game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(ohString1, ohNumber2)
    end
})

MainTab:AddSlider({
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

--toggles

local FunTab2 = FunTab:AddSection({
	Name = "Toggles"
})

local MiscTab3 = MainTab:AddSection({
	Name = "Toggles"
})

MainTab:AddToggle({
	Name = "AutoFarm",
	Default = false,
	Callback = function(Value)
        autofarm = Value
        functionautofarm()
	end    
})

FunTab:AddToggle({
	Name = "Spam Chat",
	Default = false,
	Callback = function(Value)
        autochat = Value
        SpamChat()
	end    
})

FunTab:AddToggle({
	Name = "AutoSlide (press c for onces after turning on)",
	Default = false,
	Callback = function(Value)
        AutoSlide = Value
		Autoslide()
	end    
})

FunTab:AddToggle({
	Name = "fake money giver",
	Default = false,
	Callback = function(Value)
        money = Value
        freemoney()
	end    
})

MainTab:AddToggle({
	Name = "auto respawn (you respawn when you get downed)",
	Default = false,
	Callback = function(Value)
        revivedie = Value
        god()
	end    
})

FunTab:AddToggle({
	Name = "Auto Wistle",
	Default = false,
	Callback = function(Value)
		autowistle = Value
        autowistlefunction()
	end    
})

--buttons

local FunTab3 = FunTab:AddSection({
	Name = "Buttons"
})

local MiscTab2 = MiscTab:AddSection({
	Name = "Buttons"
})

MiscTab:AddButton({
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

ESPTab:AddButton({
	Name = "Player Esp",
	Callback = function()
		local c = workspace.CurrentCamera
		local ps = game:GetService("Players")
		local lp = ps.LocalPlayer
		local rs = game:GetService("RunService")
		local function getdistancefc(part)
			return (part.Position - c.CFrame.Position).Magnitude
		end
		local function esp(p, cr)
			local h = cr:WaitForChild("Humanoid")
			local hrp = cr:WaitForChild("HumanoidRootPart")
			local text = Drawing.new("Text")
			text.Visible = false
			text.Center = true
			text.Outline = true
			text.Font = 2
			text.Color = Color3.fromRGB(255, 255, 255)
			text.Size = 17
			local c1
			local c2
			local c3
			local function dc()
				text.Visible = false
				text:Remove()
				if c1 then
					c1:Disconnect()
					c1 = nil
				end
				if c2 then
					c2:Disconnect()
					c2 = nil
				end
				if c3 then
					c3:Disconnect()
					c3 = nil
				end
			end
			c2 =
				cr.AncestryChanged:Connect(
				function(_, parent)
					if not parent then
						dc()
					end
				end
			)
			c3 =
				h.HealthChanged:Connect(
				function(v)
					if (v <= 0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
						dc()
					end
				end
			)
			c1 =
				rs.RenderStepped:Connect(
				function()
					local hrp_pos, hrp_os = c:WorldToViewportPoint(hrp.Position)
					if hrp_os then
						text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
						text.Text = p.Name .. " (" .. tostring(math.floor(getdistancefc(hrp))) .. " m)"
						text.Visible = true
					else
						text.Visible = false
					end
				end
			)
		end
		local function p_added(p)
			if p.Character then
				esp(p, p.Character)
			end
			p.CharacterAdded:Connect(
				function(cr)
					esp(p, cr)
				end
			)
		end
		for i, p in next, ps:GetPlayers() do
			if p ~= lp then
				p_added(p)
			end
		end
		ps.PlayerAdded:Connect(p_added)
        OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Player Esp Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
  	end    
})

MiscTab:AddButton({
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
			Content = "Pressed on the Inf Jump Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
  	end    
})

MiscTab:AddButton({
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
			Content = "Pressed on the Q To Teleport Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
  	end    
})

MiscTab:AddButton({
	Name = "Full Bright",
	Callback = function()
        dofullbright()
        OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Full Bright Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
  	end    
})

MiscTab:AddButton({
	Name = "Return Too Main Menu",
	Callback = function()
        game:GetService("ReplicatedStorage").Events.ReturnToMenu:FireServer()
  	end    
})

MiscTab:AddButton({
	Name = "Low Quality",
	Callback = function()
        local ohString1 = "LowQuality"
        local ohBoolean2 = true
        game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(ohString1, ohBoolean2)
        OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Low Quality Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
  	end    
})

FunTab:AddButton({
    Name = "Free cam (shift + P)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Freecam.lua"))()
        OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Free cam Button",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
      end    
})

TeleportTab:AddButton({
    Name = "Main Game",
    Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 9872472334
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
      end    
})


TeleportTab:AddButton({
    Name = "Casual",
    Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10662542523
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
      end    
})

TeleportTab:AddButton({
    Name = "Social Space",
    Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10324347967
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
      end    
})

TeleportTab:AddButton({
    Name = "Big Team",
    Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10324346056
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
      end    
})

TeleportTab:AddButton({
    Name = "Team DeathMatch",
    Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 110539706691
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
      end    
})

TeleportTab:AddButton({
    Name = "Vc Only",
    Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10808838353
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
      end    
})

local MiscTab2 = MiscTab:AddSection({
	Name = "Item Giver"
})

MiscTab:AddButton({
	Name = "Test Emote (Permanant)",
	Callback = function()
        game:GetService("ReplicatedStorage").Events.UI.Purchase:InvokeServer("Emotes", "Test")
  	end    
})

--keybinds

local MiscTab1 = MiscTab:AddSection({
	Name = "KeyBinds"
})

local FunTab1 = FunTab:AddSection({
	Name = "KeyBinds"
})

MiscTab:AddBind({
	Name = "Rejoin Server",
	Default = Enum.KeyCode.B,
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

MiscTab:AddBind({
	Name = "Random Vote",
	Default = Enum.KeyCode.X,
	Hold = false,
	Callback = function()
        local RandomVote = math.random(3)
		local ohNumber1 = (RandomVote)
        game:GetService("ReplicatedStorage").Events.Vote:FireServer(ohNumber1)
        OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed on the Random Vote Keybind",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
	end    
})

FunTab:AddBind({
	Name = "Random Emote",
	Default = Enum.KeyCode.Z,
	Hold = false,
	Callback = function()
        local number = math.random(4)
        local ohString1 = (number)
        game:GetService("ReplicatedStorage").Events.Emote:FireServer(ohString1)
        RandomEmote()
	end    
})

MiscTab:AddBind({
	Name = "Respawn",
	Default = Enum.KeyCode.R,
	Hold = false,
	Callback = function()
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
        Notification()
        OrionLib:MakeNotification({
			Name = "Hydra Network",
			Content = "Pressed The Respawn Keybind",
			Image = "rbxassetid://4483345998",
			Time = 2
		}) 
	end    
})

--test

ESPTab:AddToggle({
    Name = "Bots tracers",
    Default = true,
    Callback = function(Value)
        getgenv().toggleespmpt = Value
    end    
})

ESPTab:AddColorpicker({
    Name = "Colour",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        getgenv().mptespcolour = Value
    end  
})

--credits

CreditsTab:AddParagraph("Owner/Main Dev","hydra#1000")
CreditsTab:AddParagraph("Credits","Felix and ss.spooky.ss")


local cam = workspace.CurrentCamera
local rs = game:GetService'RunService'

getgenv().toggleespmpt = true
function esp(plr)
   if game:GetService'Players':GetPlayerFromCharacter(plr) == nil then
    local rat = Drawing.new("Line")
        rs.RenderStepped:Connect(function()
            if plr:FindFirstChild'HumanoidRootPart' then
                local vector,screen = cam:WorldToViewportPoint(plr.HumanoidRootPart.Position)
                if screen then
                    rat.Visible = toggleespmpt
                    rat.From = Vector2.new(cam.ViewportSize.X / 2,cam.ViewportSize.Y / 1)
                    rat.To = Vector2.new(vector.X,vector.Y)
                    rat.Color = getgenv().mptespcolour
                    rat.Thickness = getgenv().mptespthickness
                    else
                        rat.Visible = false
                end
                else
                    pcall(function()
                    rat.Visible = false
                    end)
            end
                if not plr:FindFirstChild'HumanoidRootPart' or not plr:FindFirstChild'HumanoidRootPart':IsDescendantOf(game:GetService'Workspace') then
                    pcall(function()
                    rat:Remove()
                    end)
            end
        end)
   end
end

for i,v in pairs(game:GetService'Workspace'.Game.Players:GetChildren()) do
    esp(v)
end

game:GetService'Workspace'.Game.Players.ChildAdded:Connect(function(plr)
    esp(plr)
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
        end
    end)
end)

setclipboard("https://discord.gg/k9a4zym5uG")

OrionLib:MakeNotification({
Name = "Join Discord",
Content = "Join the Discord Copied in your clip Board",
Image = "rbxassetid://4483345998",
Time = 5
})

OrionLib:Init()