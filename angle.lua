local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Light = game:GetService("Lighting")
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()


local Window = Library:CreateWindow({
    Title = 'Angel.lua',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Target'),  
    Extra = Window:AddTab('Extra'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Target')
local LeftGroupBoxx = Tabs.Extra:AddLeftGroupbox('Extra')
local RightGroupBox = Tabs.Main:AddRightGroupbox('Target Settings')


LeftGroupBox:AddToggle('Showdot', {
    Text = 'ShowBox',
    Default = true,
    Tooltip = '',
});

LeftGroupBox:AddToggle('Target', {
    Text = 'Target',
    Default = true,
    Tooltip = '',
})
Toggles.Target:OnChanged(function()
    getgenv().Target = Toggles.Target.Value
end)

Toggles.Target:SetValue(false)

LeftGroupBox:AddToggle('Airshot', {
    Text = 'Airshot',
    Default = true,
    Tooltip = '',
})
Toggles.Airshot:OnChanged(function()
    getgenv().AirshotFunccc = Toggles.Airshot.Value
end)

Toggles.Airshot:SetValue(false)


LeftGroupBox:AddToggle('NotifMode', {
    Text = 'Notification',
    Default = true,
})

LeftGroupBox:AddToggle('ChatMode', {
    Text = 'Chat Mode',
    Default = true,
    Tooltip = '',
})
Toggles.ChatMode:OnChanged(function()
    getgenv().ChatMode = Toggles.ChatMode.Value
end)

Toggles.ChatMode:SetValue(false)



Toggles.NotifMode:OnChanged(function()
    getgenv().NotifMode = Toggles.NotifMode.Value
end)

Toggles.NotifMode:SetValue(false)

LeftGroupBox:AddToggle('AutoPred', {
    Text = 'Ping Based',
    Default = true,
    Tooltip = '',
})
Toggles.AutoPred:OnChanged(function()
    getgenv().AutoPrediction = Toggles.AutoPred.Value
end)

Toggles.AutoPred:SetValue(false)

LeftGroupBox:AddInput('Prediction', {
    Default = '0.1229',
    Numeric = false,
    Finished = false,
    Text = 'Prediction',
    Tooltip = '',
    Placeholder = 'Enter New Pred Here',
})

Options.Prediction:OnChanged(function()
    getgenv().Prediction = Options.Prediction.Value
end)

Options.Prediction:SetValue(0.1229)

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'Head', 'UpperTorso', 'HumanoidRootPart', 'RightFoot' },
    Default = 1, 
    Multi = false, 
    Text = 'Hitpart',
    Tooltip = 'This is a tooltip',
})

Options.MyDropdown:OnChanged(function()
    getgenv().Partz = Options.MyDropdown.Value
end)

Options.MyDropdown:SetValue('UpperTorso')

RightGroupBox:AddLabel('Hitbox Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Hitbox Color',
});


RightGroupBox:AddSlider('MySlider', {
    Text = 'Hitbox Transparency',
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,
});

Options.MySlider:SetValue(0.3)

RightGroupBox:AddDivider()

RightGroupBox:AddToggle('FOVToggle', {
    Text = 'FOV',
    Default = true,
    Tooltip = '',
});

RightGroupBox:AddToggle('FOVFilled', {
    Text = 'FOV Filled',
    Default = false,
    Tooltip = '',
});

RightGroupBox:AddSlider('FOV', {
    Text = 'FOV Radius',

    Default = 0,
    Min = 0,
    Max = 750,
    Rounding = 0,

    Compact = false,
});

Options.FOV:SetValue(280)

RightGroupBox:AddSlider('Thickness', {
    Text = 'FOV Thickness',

    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Compact = false,
});

Options.Thickness:SetValue(0)

RightGroupBox:AddSlider('FOVTrans', {
    Text = 'FOV Transparency',
    Default = 0.8,
    Min = 0,
    Max = 1,
    Rounding = 1,

    Compact = false,
});

LeftGroupBoxx:AddSlider('fov', {
    Text = 'Fov',
    Default = 70,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Compact = false,
})

Options.fov:OnChanged(function()
    game:GetService'Workspace'.Camera.FieldOfView = Options.fov.Value
end)

local FullBright = LeftGroupBoxx:AddButton('Full Bright', function()
    Light.Ambient = Color3.new(1, 1, 1)
    Light.ColorShift_Bottom = Color3.new(1, 1, 1)
    Light.ColorShift_Top = Color3.new(1, 1, 1)
    game.Lighting.FogEnd = 100000
    game.Lighting.FogStart = 0
    game.Lighting.ClockTime = 14
    game.Lighting.Brightness = 5
    game.Lighting.GlobalShadows = false
end)

local Rejoin = LeftGroupBoxx:AddButton('Rejoin', function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

Library:SetWatermarkVisibility(true)

Library:SetWatermark('Angel.Lua Modded')

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)


local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind 

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)


SaveManager:IgnoreThemeSettings() 

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

SaveManager:BuildConfigSection(Tabs['UI Settings']) 

ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- Toggle
    getgenv().ChatMode = false
        getgenv().PartMode = true
        getgenv().Key = Enum.KeyCode.Q
        getgenv().Types = {
            Ball = Enum.PartType.Ball,
            Block = Enum.PartType.Block, 
            Cylinder = Enum.PartType.Cylinder,
        }
        
        --variables   
        local Tracer = Instance.new("Part", game.Workspace)
        Tracer.Name = "gay"	
        Tracer.Anchored = true		
        Tracer.CanCollide = false
        Tracer.Parent = game.Workspace	
        Tracer.Shape = Types.Block 
        Tracer.Size = Vector3.new(7,7,7)
        game:GetService("RunService").RenderStepped:Connect(function()
        Tracer.Transparency = Options.MySlider.Value
        Tracer.Color = Options.ColorPicker.Value
        end)

        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        local Runserv = game:GetService("RunService")
        
        circle = Drawing.new("Circle")
        circle.Color = Color3.fromRGB(173,216,230)
        circle.Thickness = 5
        circle.NumSides = 732
        circle.Transparency = 0.8
        game:GetService("RunService").RenderStepped:Connect(function()
        circle.Thickness = Options.Thickness.Value
        circle.Radius = Options.FOV.Value
        circle.Visible = Toggles.FOVToggle.Value
        circle.Transparency = Options.FOVTrans.Value
        circle.Filled = Toggles.FOVFilled.Value
    end)
    
    Runserv.RenderStepped:Connect(function()
        circle.Position = Vector2.new(mouse.X,mouse.Y+35)
        if getgenv().AirshotFunccc == true then
                if Plr ~= nil then else return; end
                if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Plastic then
                    getgenv().Partz = "RightFoot"
                else
                    Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                        if new == Enum.HumanoidStateType.Freefall then
                        getgenv().Partz = "RightFoot"
                        else
                            getgenv().Partz = "HumanoidRootPart"
                        end
                    end)
                end
            end
        end)
        
        local guimain = Instance.new("Folder", game.CoreGui)
        local CC = game:GetService"Workspace".CurrentCamera
        local LocalMouse = game.Players.LocalPlayer:GetMouse()
        local Locking = false
            
        if getgenv().valiansh == true then
            game.StarterGui:SetCore("SendNotification", {
                Title = "angel.lua",
                Text = "Already Loaded!",
                Duration = 5
             })
            return
        end
        
        getgenv().valiansh = true
        
            local UserInputService = game:GetService("UserInputService")
    
            UserInputService.InputBegan:Connect(function(keygo,ok)
               if (not ok) then
               if (keygo.KeyCode == getgenv().Key) then
                   if getgenv().Target == true then
                   Locking = not Locking
                   if Locking then
                   Plr =  getClosestPlayerToCursor()
                    if getgenv().ChatMode then
            local A_1 = "Target: "..tostring(Plr.Character.Humanoid.DisplayName) local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
                end	
                   if getgenv().NotifMode then
                    Library:Notify("Target: "..tostring(Plr.Character.Humanoid.DisplayName), 2)
        end
        elseif not Locking then
             if getgenv().ChatMode then
            local A_1 = "Unlocked!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
                end	
            if getgenv().NotifMode then
                Library:Notify("Unlocked", 2)
               elseif getgenv().Target == false then
                Library:Notify("Player Died", 2)
                   end

                end   
            end
        end
    end
end)
        
        function getClosestPlayerToCursor()
            local closestPlayer
            local shortestDistance = circle.Radius
    
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
                    local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
                    if magnitude < shortestDistance then
                        closestPlayer = v
                        shortestDistance = magnitude
                    end
                end
            end
            return closestPlayer
        end

    if getgenv().PartMode then
        game:GetService"RunService".Stepped:connect(function()
            if Locking and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
                Tracer.CFrame = CFrame.new(Plr.Character.LowerTorso.Position+(Plr.Character.LowerTorso.Velocity*Prediction))
            else
                Tracer.CFrame = CFrame.new(0, 9999, 0)
            end
        end)
    end

            
        --
        local rawmetatable = getrawmetatable(game)
        local old = rawmetatable.__namecall
        setreadonly(rawmetatable, false)
        rawmetatable.__namecall = newcclosure(function(...)
            local args = {...}
            if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
                return old(unpack(args))
            end
            return old(...)
        end)
    ---
    while wait() do
        if getgenv().AutoPrediction == true then
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local split = string.split(pingvalue,'(')
            local ping = tonumber(split[1])
            if ping < 130 then
                getgenv().Prediction = 0.151
            elseif ping < 125 then
                getgenv().Prediction = 0.149
            elseif ping < 110 then
                getgenv().Prediction = 0.140
            elseif ping < 105 then
                getgenv().Prediction = 0.133
            elseif ping < 90 then
                getgenv().Prediction = 0.130
            elseif ping < 80 then
                getgenv().Prediction = 0.128
            elseif ping < 70 then
                getgenv().Prediction = 0.1230
            elseif ping < 60 then
                getgenv().Prediction = 0.1229
            elseif ping < 50 then
                getgenv().Prediction = 0.1225
            elseif ping < 40 then
                getgenv().Prediction = 0.1256
            end
        end
    end