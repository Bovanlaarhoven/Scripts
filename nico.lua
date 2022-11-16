if game.CoreGui.RobloxGui.Modules:FindFirstChild("LuaApp") == nil then
	print("ApagoJa")
else
	game.CoreGui.RobloxGui.Modules.LuaApp:Destroy()
end
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Nico's Nextbots GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "NextCFG"})
local Esp = false
local Names = false
local ColoEs = Color3.fromRGB(255, 255, 255)
local ColoNa = Color3.fromRGB(255, 255, 255)
local BotCo = Color3.fromRGB(255, 0, 0)
local BotNaCO = Color3.fromRGB(255, 255, 255)

local Tab8 = Window:MakeTab({
	Name = "Esp Player",
	Icon = "rbxassetid://8217650131",
	PremiumOnly = false
})
local Tab2 = Window:MakeTab({
	Name = "Esp Bots",
	Icon = "rbxassetid://6802122289",
	PremiumOnly = false
})
local Tab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://6863521323",
	PremiumOnly = false
})
local Tab3 = Window:MakeTab({
	Name = "MSC",
	Icon = "rbxassetid://3340612851",
	PremiumOnly = false
})
local Tab6 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://7992557358",
	PremiumOnly = false
})
local Tab7 = Window:MakeTab({
	Name = "World",
	Icon = "rbxassetid://6185435494",
	PremiumOnly = false
})
local Tab4 = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://5197571732",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "CREDITS!",
	Content = "Script made by : Kramos",
	Image = "rbxassetid://4483345998",
	Time = 5
})

Tab:AddDropdown({
	Name = "Safezone",
	Default = "Select",
	Options = {"Safezone1", "Safezone2", "Safezone3", "Safezone4", "Safezone5", "XL Safezone"},
	Callback = function(Value)
		if Value == "Safezone1" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-71, 36, 361))
		elseif  Value == "Safezone2" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-96, 21, -9))
		elseif  Value == "Safezone3" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-45, 52, 334))
		elseif  Value == "Safezone4" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-45, 52, 344))
		elseif  Value == "Safezone5" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-290, 36, 61))
		elseif  Value == "XL Safezone" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(101, 105, 335))
		end
	end    
})
Tab:AddDropdown({
	Name = "Msc",
	Default = "Select",
	Options = {"BackRoom", "Duct", "Nico's Club", "Secret Room", "Marketplace", "Gate", "Gate2", "Storage", "Farm"},
	Callback = function(Value)
		if Value == "BackRoom" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-146, 20, 494))
		elseif  Value == "Duct" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(20, 43, 362))
		elseif  Value == "Nico's Club" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-307, 55, 338))
		elseif  Value == "Secret Room" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-239, 57, 305))
		elseif  Value == "Marketplace" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-286, 39, 228))
		elseif  Value == "Gate" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(147, 36, 126))
		elseif  Value == "Gate2" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-306, 36, 103))
		elseif  Value == "Storage" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-315, 36, 145))
		elseif  Value == "Farm" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186.406494140625, 102.73624420166016, 295.02508544921875)
		end
	end    
})



Tab8:AddToggle({
	Name = "Player Box",
	Default = false,
	Callback = function(Value)
		Esp = Value
	end    
})
Tab8:AddToggle({
	Name = "Player Name",
	Default = false,
	Callback = function(Value)
		Names = Value
	end    
})
Tab8:AddColorpicker({
	Name = "Box Color",
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(Value)
		ColoEs = Value
	end	  
})
Tab8:AddColorpicker({
	Name = "Name Color",
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(Value)
		ColoNa = Value
	end	  
})
Tab2:AddButton({
	Name = "Esp Bots",
	Callback = function()
		while task.wait(1) do
			for i,v in pairs(game.Workspace.bots:GetDescendants()) do
				if v:FindFirstChild("SexoEbom") == nil then
					if v:IsA("Model") then
						local testando = true
						local Ins = Instance.new("BillboardGui",v)
						local ImageLabel = Instance.new("ImageLabel")
						Ins.Name = "SexoEbom"
						Ins.Size = UDim2.new(7,0,7,0)
						Ins.AlwaysOnTop = true
						Ins.MaxDistance = 250
						local TEx = Instance.new('TextLabel',ImageLabel)
						TEx.Size = UDim2.new(2,0,2,0)
						TEx.BorderSizePixel = 0
						TEx.TextColor3 = BotNaCO
						TEx.TextSize = 15
						TEx.Text = v.Name
						TEx.BackgroundTransparency = 1
						ImageLabel.Parent = Ins
						ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ImageLabel.BackgroundTransparency = 1.000
						ImageLabel.Size = UDim2.new(1, 0, 1, 0)
						ImageLabel.Image = "rbxassetid://7171709336"
					else

					end
				end
			end
		end
	end    
})





Tab6:AddSlider({
	Name = "Gravity Changer",
	Min = 0,
	Max = 150,
	Default = 150,
	Color = Color3.fromRGB(13, 179, 1),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		workspace.Gravity = Value
	end    
})

Tab7:AddToggle({
	Name = "FullBright(-Blackout-)",
	Default = false,
	Callback = function(Value)
		if Value == true then
			local brig = game:GetService("Lighting").Brightness 
			local Clock = game:GetService("Lighting").ClockTime 
			local Fog = game:GetService("Lighting").FogEnd
			local Globa = game:GetService("Lighting").GlobalShadows

			game:GetService("Lighting").Brightness = 1
			game:GetService("Lighting").ClockTime = 12
			game:GetService("Lighting").FogEnd = 786543
			game:GetService("Lighting").GlobalShadows = false
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		else
			game:GetService("Lighting").Brightness = brig
			game:GetService("Lighting").ClockTime = Clock
			game:GetService("Lighting").FogEnd = Fog
			game:GetService("Lighting").GlobalShadows = Globa
			game:GetService("Lighting").Ambient = Color3.fromRGB(0.101961, 0.101961, 0.101961)
		end
	end    
})

Tab6:AddButton({
	Name = "Fly(Press[T])",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/XxnhAdut"))()
		local Event = game:GetService("ReplicatedStorage").events.respawnchar
		Event:FireServer()
	end    
})
Tab7:AddButton({
	Name = "No Garage Collision",
	Callback = function()
		game.Workspace.map.tunnel2.h_garage.garage.CanCollide = false
		game.Workspace.map.tunnel2.l_garage.garage.CanCollide = false
		game.Workspace.map.parking_lot_all.parking_tunnel.h_garage.garage.CanCollide = false
		game.Workspace.map.parking_lot_all.parking_tunnel.l_garage.garage.CanCollide = false
	end    
})

Tab7:AddButton({
	Name = "Destroy Doors",
	Callback = function()
		game:GetService("Workspace").doors:Destroy() game:GetService("Workspace").junk:Destroy()
	end    
})


Tab6:AddSlider({
	Name = "FOV",
	Min = 1,
	Max = 120,
	Default = 80,
	Color = Color3.fromRGB(13, 179, 1),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		game.Players.LocalPlayer.PlayerScripts.options.fov.Value = Value
	end    
})


Tab6:AddTextbox({
	Name = "Best Time",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.leaderstats["best time"].Value = Value
	end	  
})
	
Tab6:AddButton({
	Name = "Enable Speed",
	Callback = function()
		Tab6:AddSlider({
			Name = "Speed Changer",
			Min = 0,
			Max = 250,
			Default = 100,
			Color = Color3.fromRGB(13, 179, 1),
			Increment = 1,
			ValueName = "Speed",
			Callback = function(Value)
				walkSpeed = Value

				local UIS = game:GetService("UserInputService")
				local RS = game:GetService("RunService")
				local W, A, S, D
				local xVelo, yVelo

				RS.RenderStepped:Connect(function()
					local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
					local C = game.Workspace.CurrentCamera
					local LV = C.CFrame.LookVector
					for i,v in pairs(UIS:GetKeysPressed()) do
						if v.KeyCode == Enum.KeyCode.W then
							W = true
						end
						if v.KeyCode == Enum.KeyCode.A then
							A = true
						end
						if v.KeyCode == Enum.KeyCode.S then
							S = true
						end
						if v.KeyCode == Enum.KeyCode.D then
							D = true
						end
					end

					if W == true and S == true then
						yVelo = false
						W,S = nil
					end

					if A == true and D == true then
						xVelo = false
						A,D = nil
					end

					if yVelo ~= false then
						if W == true then
							if xVelo ~= false then
								if A == true then
									local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
									HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
									W,A = nil
								else
									if D == true then
										local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
										HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
										W,D = nil
									end
								end
							end
						else
							if S == true then
								if xVelo ~= false then
									if A == true then
										local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
										HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
										S,A = nil
									else
										if D == true then
											local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
											HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
											S,D = nil
										end
									end
								end
							end
						end
					end

					if W == true then
						HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
					end
					if S == true then
						HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
					end
					if A == true then
						local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
						HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
					end
					if D == true then
						local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
						HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
					end

					xVelo, yVelo, W, A, S, D = nil
				end)
			end    
		})
	end    
})


Tab3:AddButton({
	Name = "AntAFK",
	Callback = function()
		assert(firesignal, "Your exploit does not support firesignal.")
		local UserInputService: UserInputService = game:GetService("UserInputService")
		local RunService: RunService = game:GetService("RunService")
		UserInputService.WindowFocusReleased:Connect(function()
			RunService.Stepped:Wait()
			pcall(firesignal, UserInputService.WindowFocused)
		end)
	end    
})

Tab3:AddButton({
	Name = "Respawn",
	Callback = function()
		local Event = game:GetService("ReplicatedStorage").events.respawnchar
		Event:FireServer()
	end    
})

Tab4:AddLabel("By: Kramos")
Tab4:AddLabel("Last update: 08/07/2022")

--ESP


--Kramos Here
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = Player:GetMouse()
local ps = game:GetService("Players")
local rs = game:GetService("RunService")


local function Dist(pointA, pointB) -- magnitude errors for some reason : (
	return math.sqrt(math.pow(pointA.X - pointB.X, 2) + math.pow(pointA.Y - pointB.Y, 2))
end

local function GetClosest(points, dest)
	local min = math.huge
	local closest = nil
	for _,v in pairs(points) do
		local dist = Dist(v, dest)
		if dist < min then
			min = dist
			closest = v
		end
	end
	return closest
end

local function DrawESP(plr)
	local Box = Drawing.new("Quad")
	Box.Visible = Esp
	Box.PointA = Vector2.new(0, 0)
	Box.PointB = Vector2.new(0, 0)
	Box.PointC = Vector2.new(0, 0)
	Box.PointD = Vector2.new(0, 0)
	Box.Color = ColoEs
	Box.Thickness = 2
	Box.Transparency = 1

	local function Update()
		local c
		c = game:GetService("RunService").RenderStepped:Connect(function()
			if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
				local pos, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
				if vis then
					local points = {}
					local c = 0
					for _,v in pairs(plr.Character:GetChildren()) do
						if v:IsA("BasePart") then
							c = c + 1
							local p = Camera:WorldToViewportPoint(v.Position)
							if v.Name == "HumanoidRootPart" then
								p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
							elseif v.Name == "Head" then
								p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
							elseif string.match(v.Name, "Left") then
								p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
							elseif string.match(v.Name, "Right") then
								p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
							end
							points[c] = p
						end
					end
					local Left = GetClosest(points, Vector2.new(0, pos.Y))
					local Right = GetClosest(points, Vector2.new(Camera.ViewportSize.X, pos.Y))
					local Top = GetClosest(points, Vector2.new(pos.X, 0))
					local Bottom = GetClosest(points, Vector2.new(pos.X, Camera.ViewportSize.Y))

					if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
						Box.PointA = Vector2.new(Right.X, Top.Y)
						Box.PointB = Vector2.new(Left.X, Top.Y)
						Box.PointC = Vector2.new(Left.X, Bottom.Y)
						Box.PointD = Vector2.new(Right.X, Bottom.Y)
						Box.Color = ColoEs	
						Box.Visible = Esp
					else
						Box.Visible = false
					end
				else
					Box.Visible = false
				end
			else
				Box.Visible = false
				if game.Players:FindFirstChild(plr.Name) == nil then
					c:Disconnect()
				end
			end
		end)
	end
	coroutine.wrap(Update)()
end


for _,v in pairs(game:GetService("Players"):GetChildren()) do
	if v.Name ~= Player.Name then
		DrawESP(v)
	end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	DrawESP(v)
end)

local function esp(p,cr)
	local h = cr:WaitForChild("Humanoid")
	local hrp = cr:WaitForChild("Head")

	local text = Drawing.new("Text")
	text.Visible = Names
	text.Center = true
	text.Outline = true 
	text.Font = 2
	text.Color = ColoNa
	text.Size = 13

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

	c2 = cr.AncestryChanged:Connect(function(_,parent)
		if not parent then
			dc()
		end
	end)

	c3 = h.HealthChanged:Connect(function(v)
		if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
			dc()
		end
	end)

	c1 = rs.RenderStepped:Connect(function()
		local hrp_pos,hrp_onscreen = Camera:WorldToViewportPoint(hrp.Position)
		if hrp_onscreen then
			text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y - 10)
			text.Text = p.Name
			text.Color = ColoNa
			text.Visible = Names
		else
			text.Visible = false
		end
	end)
end

local function p_added(p)
	if p.Character then
		esp(p,p.Character)
	end
	p.CharacterAdded:Connect(function(cr)
		esp(p,cr)
	end)
end

for i,p in next, ps:GetPlayers() do 
	if p ~= Player then
		p_added(p)
	end
end


ps.PlayerAdded:Connect(p_added)




OrionLib:Init()



