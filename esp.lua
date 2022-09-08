local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

getgenv().uselocalplayer = false --Choose whether the ESP highlights LocalPlayer or not
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency


Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
        getgenv().enabled = value

        getgenv().outlinecolor =  Color3.new(255,255,255)
        local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
        if enabled == false then
            holder:Destroy()
        end
        
        if holder.Name == "Folder" then
            holder.Name = "ESPHolder"
            holder.Parent = game.CoreGui
        end
        
        if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
            holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
        end
        
        if getgenv().enabled == true then 
            getgenv().enabled = false
            getgenv().enabled = true
        end
        while getgenv().enabled do
            task.wait()
            for _,v in pairs(game.Players:GetChildren()) do
                local chr = v.Character
                if chr ~= nil then
                    local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
                    esp.Name = v.Name
                    if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
                        else
                    esp.Parent = holder
                    if filluseteamcolor then
                        esp.FillColor = v.TeamColor.Color
                    else
                        esp.FillColor = fillcolor 
                    end
                    if outlineuseteamcolor then
                        esp.OutlineColor = v.TeamColor.Color
                    else
                        esp.OutlineColor = outlinecolor    
                    end
                    esp.FillTransparency = filltrans
                    esp.OutlineTransparency = outlinetrans
                    esp.Adornee = chr
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                end
            end
        end
	end
})

    

Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
        if value == true then
            getgenv().outlinetrans = 0
        elseif value == false then
            getgenv().outlinetrans = 1
        end
	end    
})

Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
        if value == true then
            getgenv().filltrans = 0
        elseif value == false then
            getgenv().filltrans = 1
        end
	end    
})

Tab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
        s = value
        getgenv().fillcolor =  value
	end	  
})

Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
		if value == true then
            local Player = game:GetService("Players").LocalPlayer
            local Camera = game:GetService("Workspace").CurrentCamera
            local Mouse = Player:GetMouse()
            
            local function Dist(pointA, pointB) 
                return math.sqrt(math.pow(pointA.X - pointB.X, 2) + math.pow(pointA.Y - pointB.Y, 2))
            end
            
            local function GetClosest(points, dest)
                local min  = math.huge 
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
                Box.Visible = false
                Box.PointA = Vector2.new(0, 0)
                Box.PointB = Vector2.new(0, 0)
                Box.PointC = Vector2.new(0, 0)
                Box.PointD = Vector2.new(0, 0)
                Box.Color = Color3.fromRGB(255, 255, 255)
                Box.Thickness = 1
                Box.Transparency = 10
            
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
            
                                    Box.Visible = true
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
        elseif value == false then
            DrawESP = false
            Box.Transparency = 2
        end
	end    
})

OrionLib:Init()