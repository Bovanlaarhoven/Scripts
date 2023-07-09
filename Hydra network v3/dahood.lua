local MainEvent = game:GetService("ReplicatedStorage"):WaitForChild("MainEvent")
local RunService = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer
local lcharacter = lplr.Character
local userInputService = game:GetService("UserInputService")
local camera = workspace.CurrentCamera
local mt = getrawmetatable(game)
local namecall = mt.__namecall
local lastVelocities, lastCFrames = {}, {}
local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
Fov = Drawing.new("Circle")


local Weapons = {
    "[Glock]",
    "[SMG]",
    "[Silencer]",
    "[TacticalShotgun]",
    "[P90]",
    "[AUG]",
    "[Shotgun]",
    "[RPG]",
    "[AR]",
    "[Double-Barrel SG]",
    "[Flamethrower]",
    "[Revolver]",
    "[LMG]",
    "[AK47]", 
    "[DrumGun]",
    "[Silencer]",
    "[GrenadeLauncher]",
    "[Taser]",
    "[SilencerAR]"
}

local Visuals = {
    Fov = false,
    FovColor = Color3.new(0, 120, 255),
    Transparency = 0.5,
    Radius = 25,
}

local Settings = {
    Legit = false,
    Prediction = false,
    AutoPrediction = false,
    PredictionBreaker = false,
    Desync = false,
    WeaponVisuals = false,
    DesyncPreseton = false,
    BreakerPreseton = false,
    BulletTracers = false,
    Camlock = false,
    AutoShoot = false,
    BulletTracersColor = Color3.new(0, 120, 255),
    WeaponColor = Color3.new(0, 120, 255),
    DesyncPreset = "Random",
    BreakerPreset = "Random",
    priority = "Visible",
    Bone = "Head",  
    AimMethod = "Closest to Cursor",
    DesyncX = 0,
    DesyncY = 0,
    DesyncZ = 0,
    BreakerX = 0,
    BreakerY = 0,
    BreakerZ = 0,
    PredictionAmount = 0,
    Ping = 20,
    Smoothing = 50,
}

local function isGun(tool)
    return tool:IsA("Tool")
end

local isAlive = function(player)
    if player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoid = player.Character.Humanoid
        local humanoidRootPart = player.Character.HumanoidRootPart
        if humanoid.Health > 0 and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
            if humanoidRootPart.Anchored then
                return false
            end            
            return true
        end
    end
    
    return false
end


local function getPlayerGun(player)
    local character = player.Character
    if character then
        for _, child in ipairs(character:GetChildren()) do
            if isGun(child) then
                if game.PlaceId == 2788229376 then
                    if child:FindFirstChild("Ammo") ~= nil then
                        if child["Ammo"].Value == 0 then
                            return nil
                        end
                    else
                        return nil
                    end
                end
                return child
            end
        end
    end
    return nil
end

local clearTable = function(tab)
    for _, ent in next, tab do
        ent = nil 
    end
end

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Hydra network',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Legit = Window:AddTab('Legit'),
    Rage = Window:AddTab('Rage'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Breakers = Tabs.Misc:AddLeftTabbox()

local Desync = Breakers:AddTab('Desync')
local PredictionBreaker = Breakers:AddTab('Prediction Breaker')

local Gun = Tabs.Visuals:AddRightGroupbox('Weapon Visuals')
local BulletTracers = Tabs.Visuals:AddLeftGroupbox('Bullet')

local Weapon = Tabs.Rage:AddLeftGroupbox('Weapon')

local AimVisuals = Tabs.Legit:AddRightGroupbox('Aim Visuals')
local LegitAim = Tabs.Legit:AddLeftGroupbox('Legit')

Desync:AddToggle('Desync', {
    Text = 'Desync',
    Default = false,
    Tooltip = 'desyncington',

    Callback = function(Value)
        Settings.Desync = Value
    end
})

Desync:AddToggle('DesyncPreset', {
    Text = 'Desync Preset',
    Default = false,
    Tooltip = 'desyncington',

    Callback = function(Value)
        Settings.DesyncPreseton = Value
    end
})

Desync:AddDropdown('MyDropdown', {
    Values = { 'Random', '',},
    Default = 1,
    Multi = false,

    Text = 'Desync Presets',
    Tooltip = 'This is a tooltip',

    Callback = function(Value)
        Settings.DesyncPreset = Value
    end
})

Desync:AddSlider('DesyncX', {
    Text = 'Desync X',
    Default = 0,
    Min = -6000,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.DesyncX = Value
    end
})

Desync:AddSlider('DesyncY', {
    Text = 'Desync Y',
    Default = 0,
    Min = 0,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.DesyncY = Value
    end
})

Desync:AddSlider('DesyncZ', {
    Text = 'Desync Z',
    Default = 0,
    Min = -6000,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.DesyncZ = Value
    end
})

BulletTracers:AddToggle('BulletTracers', {
    Text = 'Bullet Tracers',
    Default = false,
    Tooltip = 'BulletTracers Duhh',

    Callback = function(Value)
        Settings.BulletTracers = Value
    end
})

BulletTracers:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Tracer Color',
    Transparency = 0,

    Callback = function(Value)
        Settings.BulletTracersColor = Value
    end
})

Gun:AddToggle('GunVisuals', {
    Text = 'Weapon Visuals',
    Default = false,
    Tooltip = 'Weapon Visuals Duhh',

    Callback = function(Value)
        Settings.WeaponVisuals = Value
    end
})

Gun:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Weapon Color',
    Transparency = 0,

    Callback = function(Value)
        Settings.WeaponColor = Value
    end
})

PredictionBreaker:AddToggle('Breaker', {
    Text = 'Breaker',
    Default = false,
    Tooltip = 'Breakerington',

    Callback = function(Value)
        Settings.PredictionBreaker = Value
    end
})

PredictionBreaker:AddToggle('Predication', {
    Text = 'Predication Preset',
    Default = false,
    Tooltip = 'Velocityington',

    Callback = function(Value)
        Settings.BreakerPreseton = Value
    end
})

PredictionBreaker:AddDropdown('VelocityDropdown', {
    Values = { 'Random', '',},
    Default = 1,
    Multi = false,

    Text = 'Velocity Presets',
    Tooltip = 'This is a tooltip',

    Callback = function(Value)
        Settings.BreakerPreset = Value
    end
})

PredictionBreaker:AddSlider('VelocityX', {
    Text = 'Velocity X',
    Default = 0,
    Min = -6000,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.BreakerX = Value
    end
})

PredictionBreaker:AddSlider('VelocityY', {
    Text = 'Velocity Y',
    Default = 0,
    Min = 0,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.BreakerY = Value
    end
})

PredictionBreaker:AddSlider('VelocityZ', {
    Text = 'Velocity Z',
    Default = 0,
    Min = -6000,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.BreakerZ = Value
    end
})

AimVisuals:AddToggle('Fov', {
    Text = 'Fov',
    Default = false,
    Tooltip = 'Fovington',

    Callback = function(Value)
        Visuals.Fov = Value
    end
})

AimVisuals:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Fov Color',
    Transparency = 0,

    Callback = function(Value)
        Visuals.FovColor = Value
    end
})

AimVisuals:AddSlider('Transparency', {
    Text = 'Transparency',
    Default = 0.5,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Visuals.Transparency = Value
    end
})

AimVisuals:AddSlider('Radius', {
    Text = 'Radius',
    Default = 25,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Visuals.Radius = Value
    end
})

LegitAim:AddLabel('Silent'):AddKeyPicker('KeyPicker', {
    Default = 'G',
    SyncToggleState = false,
    Mode = 'Toggle',

    Text = 'Silent',
    NoUI = false,
    Callback = function(Value)
        Settings.Legit = Value
    end,
})

LegitAim:AddLabel('Camlock'):AddKeyPicker('KeyPicker', {
    Default = 'C',
    SyncToggleState = false,
    Mode = 'Toggle',

    Text = 'Camlock',
    NoUI = false,
    Callback = function(Value)
        Settings.Camlock = Value
    end,
})

LegitAim:AddToggle('Prediction', {
    Text = 'Predication',
    Default = false,
    Tooltip = 'Legitington',

    Callback = function(Value)
        Settings.Prediction = Value
    end
})

LegitAim:AddToggle('Prediction', {
    Text = 'Auto Predication',
    Default = false,
    Tooltip = 'Legitington',

    Callback = function(Value)
        Settings.AutoPrediction = Value
    end
})

LegitAim:AddDropdown('AimMethod', {
    Values = { 'Closest to Cursor', 'Closest to Character',},
    Default = 1,
    Multi = false,

    Text = 'Aim method',
    Tooltip = 'Aimington',

    Callback = function(Value)
        Settings.AimMethod = Value
    end
})

LegitAim:AddDropdown('MyDropdown', {
    Values = { 'Head', 'HumanoidRootPart', 'LowerTorso', 'UpperTorso'},
    Default = 1,
    Multi = false,

    Text = 'Hit Bone',
    Tooltip = 'This is a tooltip',

    Callback = function(Value)
        Settings.Bone = Value
    end
})

LegitAim:AddDropdown('Priority', {
    Values = { 'Visible', 'Team', "Friend"},
    Default = 1,
    Multi = false,

    Text = 'Priority',
    Tooltip = 'Priorityington',

    Callback = function(Value)
        Settings.Priority = Value
    end
})

LegitAim:AddSlider('Amound', {
    Text = 'Predication Amount',
    Default = 14.3,
    Min = 1,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Visuals.PredictionAmount = Value
    end
})

LegitAim:AddSlider('Smoothing', {
    Text = 'Camlock smoothing',
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Visuals.Smoothing = Value
    end
})

Weapon:AddToggle('Fov', {
    Text = 'Auto Shoot',
    Default = false,
    Tooltip = 'Shootington',

    Callback = function(Value)
        Settings.AutoShoot = Value
    end
})

--real hackery

local function createBeam(p1, p2)
    local beam = Instance.new("Part")
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.ForceField
    beam.BrickColor = BrickColor.new(Settings.BulletTracersColor)   
    
    local thickness = 0.2
    local direction = p2 - p1
    local magnitude = direction.magnitude
    
    beam.Size = Vector3.new(thickness, thickness, magnitude)
    beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -magnitude / 2)
    beam.Parent = workspace
    return beam
end

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    if Settings.BulletTracers then
        local player = game.Players.LocalPlayer
        local gun = getPlayerGun(player)
    
        if gun then
            local handle = gun:FindFirstChild("Handle")
            if handle and table.find(Weapons, gun.Name) then
                local beamOrigin = handle.Position
                local beamDirection = (mouse.Hit.p - beamOrigin).unit
                local beamEnd = beamOrigin + beamDirection * 100
    
                local beam = createBeam(beamOrigin, beamEnd)
                wait(0.5)
                beam:Destroy()
            end
        end
    end
end)

local VisualWeapon = function()
    if Settings.WeaponVisuals then
        if isAlive(lplr) then
            if lcharacter:FindFirstChildOfClass("Tool") then
                local toolname = lcharacter:FindFirstChildOfClass("Tool").Name
                if table.find(Weapons, toolname) then
                    for _,v in next, lcharacter:FindFirstChildOfClass("Tool"):GetDescendants() do
                        if v:IsA("MeshPart") then
                            v.Material = "ForceField"
                            v.Color = Settings.WeaponColor
                        end
                    end
                end
            end
        end
    end
end

RunService.Heartbeat:Connect(function()

    Settings.Ping = tonumber(string.format("%.3f", ping:GetValue()))

    if Settings.Desync then
        if isAlive(lplr) then
            oldval = lcharacter.HumanoidRootPart.Velocity
            lcharacter.HumanoidRootPart.Velocity = Vector3.new(Settings.DesyncX, Settings.DesyncY, Settings.DesyncZ)
            lcharacter.HumanoidRootPart.CFrame = lcharacter.HumanoidRootPart.CFrame * CFrame.Angles(0,0.0001, 0)
            RunService.RenderStepped:Wait()
            lcharacter.HumanoidRootPart.Velocity = oldval
            
            if Settings.DesyncPreseton then
                if Settings.DesyncPreset == "Random" then
                    Options.DesyncX:SetValue(math.random(-6000, 6000))
                    Options.DesyncY:SetValue(math.random(0, 6000))
                    Options.DesyncZ:SetValue(math.random(-6000, 6000))
                end                
            end
        end
    end

    if Settings.PredictionBreaker then
        if isAlive(lplr) then
            fakeVelocity = Vector3.new(Settings.BreakerX, Settings.BreakerY, Settings.BreakerZ)
            realVelocity = lcharacter.HumanoidRootPart.Velocity

            for _,v in next, lcharacter:GetChildren() do
                if v and v:IsA("BasePart") then
                    lastVelocities[v] = v.Velocity
                    v.Velocity = fakeVelocity
                end
            end


            for _,v in next, lcharacter:GetChildren() do
                if v and v:IsA("BasePart") then
                    v.Velocity = lastVelocities[v]
                end
            end
            clearTable(lastVelocities)
            clearTable(lastCFrames)

            if Settings.BreakerPreseton then
                if Settings.BreakerPreset == "Random" then
                    Options.VelocityX:SetValue(math.random(-6000, 6000))
                    Options.VelocityY:SetValue(math.random(0, 6000))
                    Options.VelocityZ:SetValue(math.random(-6000, 6000))
                end
            end

        end
    end

    
    

    if Settings.AutoPrediction then
        if Settings.Ping < 20 then
            if Options.Amound.Value > 15.7 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 15.7 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 30 then    
            if Options.Amound.Value > 15.5 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 15.5 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 40 then
            if Options.Amound.Value > 14.5 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 14.5 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 50 then
            if Options.Amound.Value > 14.3 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 14.3 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 60 then
            if Options.Amound.Value > 14 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 14 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 70 then
            if Options.Amound.Value > 13.6 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 13.6 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 80 then
            if Options.Amound.Value > 13.3 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 13.3 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 90 then
            if Options.Amound.Value > 13 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 13 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 105 then      
            if Options.Amound.Value > 12.7 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 12.7 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        elseif Settings.Ping < 110 then   
            if Options.Amound.Value > 12.4 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 12.4 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        else 
            if Options.Amound.Value > 12.0 then Options.Amound:SetValue(Options.Amound.Value-.1) end
            if Options.Amound.Value < 12.0 then Options.Amound:SetValue(Options.Amound.Value+.1) end
        end

        wait(0.2)
    end
end)

local function isSameTeam(player)
    return player.Team == lplr.Team
end

local function isFriend(player)
    return player:IsFriendsWith(lplr.UserId)
end

local Fov = function()
    if Visuals.Fov then
        Fov.Visible = true
        Fov.Color = Visuals.FovColor
        Fov.Radius = Visuals.Radius
        Fov.Transparency = Visuals.Transparency
        Fov.Position = Vector2.new(mouse.X, mouse.Y + 36)
    else
        Fov.Visible = false
    end
end

local function isInFov(target)
    local character = target.Character
    if not character or not character:IsDescendantOf(workspace) then
        return false
    end

    local rootPart = character.PrimaryPart
    if not rootPart then
        return false
    end

    local camera = workspace.CurrentCamera
    local screenPos, isVisible = camera:WorldToScreenPoint(rootPart.Position)
    if not isVisible then
        return false
    end

    local mousePos = userInputService:GetMouseLocation()
    local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
    return distance < Visuals.Radius
end


local isVisible = function(player)
    if not isAlive(player) or not isAlive(lplr) then return false end
    local raycastParameters = RaycastParams.new();
    raycastParameters.FilterType = Enum.RaycastFilterType.Blacklist 
    raycastParameters.FilterDescendantsInstances = {camera, player.Character, lcharacter};
    local direction = (player.Character.HumanoidRootPart.Position - camera.CFrame.Position);
    local result = workspace:Raycast(camera.CFrame.Position, direction.Unit * direction.Magnitude, raycastParameters);

    local resultInstance, resultPosition = result and result.Instance, result and result.Position 

    if resultInstance and resultPosition then 
        if not resultInstance:IsDescendantOf(player.Character) then 
            return false 
        end 
    end
    return true
end

local function getClosestPlayer()
    local Players = game:GetService("Players"):GetPlayers()
    local ClosestPlayer
    local Camera = workspace.CurrentCamera
    local CameraPosition = Camera.CFrame.Position
    local CameraDirection = Camera.CFrame.LookVector

    for _, Player in ipairs(Players) do
        if Player ~= lplr and isInFov(Player) then
            if isAlive(Player) then
                if not isAlive(Player) then return end
                local Character = Player.Character
                local TargetPart = Character and Character:FindFirstChild(Settings.Bone)
                if TargetPart then
                    local RayDirection = (TargetPart.Position - CameraPosition).Unit
                    local DotProduct = CameraDirection:Dot(RayDirection)

                    if DotProduct > 0 then
                        local TargetSelection = Settings.AimMethod

                        if Settings.Priority == "Visible" then
                            local isVisibleToCursor = isVisible(Player) and TargetSelection == "Closest to Cursor"
                            local isVisibleToCharacter = isVisible(Player) and TargetSelection == "Closest to Character"

                            if isVisibleToCursor or isVisibleToCharacter then
                                if ClosestPlayer then
                                    local CurrentDistance = (ClosestPlayer.Position - CameraPosition).Magnitude
                                    local TargetDistance = (TargetPart.Position - CameraPosition).Magnitude
                                    if TargetDistance < CurrentDistance then
                                        ClosestPlayer = TargetPart
                                    end
                                else
                                    ClosestPlayer = TargetPart
                                end
                            end
                        elseif Settings.Priority == "Team" then
                            if isSameTeam(Player) and not isFriend(Player) then
                                if ClosestPlayer then
                                    local CurrentDistance = (ClosestPlayer.Position - CameraPosition).Magnitude
                                    local TargetDistance = (TargetPart.Position - CameraPosition).Magnitude
                                    if TargetDistance < CurrentDistance then
                                        ClosestPlayer = TargetPart
                                    end
                                else
                                    ClosestPlayer = TargetPart
                                end
                            end
                        elseif Settings.Priority == "Friend" then
                            if not isFriend(Player) then
                                if ClosestPlayer then
                                    local CurrentDistance = (ClosestPlayer.Position - CameraPosition).Magnitude
                                    local TargetDistance = (TargetPart.Position - CameraPosition).Magnitude
                                    if TargetDistance < CurrentDistance then
                                        ClosestPlayer = TargetPart
                                    end
                                else
                                    ClosestPlayer = TargetPart
                                end
                            end
                        elseif TargetSelection == "Closest to Character" then
                            if ClosestPlayer then
                                local CurrentDistance = (ClosestPlayer.Position - CameraPosition).Magnitude
                                local TargetDistance = (TargetPart.Position - CameraPosition).Magnitude
                                if TargetDistance < CurrentDistance then
                                    ClosestPlayer = TargetPart
                                end
                            else
                                ClosestPlayer = TargetPart
                            end
                        elseif TargetSelection == "Closest to Cursor" then
                            if ClosestPlayer then
                                local CurrentDistance = (ClosestPlayer.Position - CameraPosition).Magnitude
                                local TargetDistance = (TargetPart.Position - CameraPosition).Magnitude
                                if TargetDistance < CurrentDistance then
                                    ClosestPlayer = TargetPart
                                end
                            else
                                ClosestPlayer = TargetPart
                            end
                        end
                    end
                end
            end
        end
    end

    return ClosestPlayer
end

local function Camlock()
    local Target = getClosestPlayer()
    if Settings.Camlock then
        if Settings.Prediction or Settings.AutoPrediction then
            if camera then
                if isAlive(lplr) then
                    if Target ~= nil then
                        local Main = CFrame.new(camera.CFrame.Position, Target.Position)
                        camera.CFrame = camera.CFrame:Lerp(Main, Settings.Smoothing / 100, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                    end
                end
            end
        end
    end
end

local AutoShoot = function()
    local Target = getClosestPlayer()
    if Settings.AutoShoot and isAlive(lplr) and Settings.Priority == "Visible" then
        if Target and lplr.Character and lplr.Character:FindFirstChildOfClass("Tool") then
            local tool = lplr.Character:FindFirstChildOfClass("Tool")
            if isGun(tool) then
                if Target.Parent:FindFirstChild("ForceField") then return end
                tool:Activate()
                wait(.2)
            end
        end
    end
end

LPH_JIT_MAX(function()
    local oldIndex = nil
    oldIndex = hookmetamethod(game, "__index", function(self, Index)
        if self == mouse and not checkcaller() and Settings.Legit then
            local HitPart = getClosestPlayer()
    
            if Index == "Target" or Index == "target" then
                return HitPart
            elseif Index == "Hit" or Index == "hit" then
                if HitPart then
                    return ((Settings.Prediction and (HitPart.CFrame + (HitPart.Velocity * Settings.PredictionAmount))) or HitPart.CFrame)
                end
            end
        end
        return oldIndex(self, Index)
    end)
end)

RunService.RenderStepped:Connect(function()
    VisualWeapon()
    Fov()
    Camlock()
    AutoShoot()
end)

Library:SetWatermark('Privte Project Btw')

Library:OnUnload(function()
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
local MyButton = MenuGroup:AddButton({
    Text = 'Unload',
    Func = function()
        Library:Unload()
    end,
    DoubleClick = true,
    Tooltip = 'Unload Script'
})

MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
MenuGroup:AddToggle('keybindframe', {
    Text = 'Keybind Frame',
    Default = false,
    Tooltip = 'Toggles KeybindFrame',
})

Toggles.keybindframe:OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.keybindframe.Value
end)

MenuGroup:AddToggle('Watermark', {
    Text = 'Watermark',
    Default = false,
    Tooltip = 'Toggles Watermark',
})

Toggles.Watermark:OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.Watermark.Value)
end)

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])

local blocked = {
    "TeleportDetect",
    "CHECKER_1",
    "CHECKER",
    "GUI_CHECK",
    "OneMoreTime",
    "checkingSPEED",
    "BANREMOTE",
    "KICKREMOTE",
    "BR_KICKPC",
    "BR_KICKMOBILE"
}

local hook
hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if self == MainEvent and method == "FireServer" and table.find(blocked, args[1]) then
        return nil
    end

    return hook(self, ...)
end))