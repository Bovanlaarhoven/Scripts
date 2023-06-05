local RunService = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer
local lcharacter = lplr.Character
local camera = workspace.CurrentCamera
local replicatedStorage = game:GetService("ReplicatedStorage")
local lastVelocities, lastCFrames = {}, {}
local Fov = Drawing.new("Circle")

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
    Transparency = 1,
}

local Settings = {
    PredictionBreaker = false,
    Desync = false,
    WeaponVisuals = false,
    DesyncPreseton = false,
    BreakerPreseton = false,
    BulletTracers = false,
    BulletTracersColor = Color3.new(0, 120, 255),
    WeaponColor = Color3.new(0, 120, 255),
    DesyncPreset = "Random",
    BreakerPreset = "Random",
    DesyncX = 0,
    DesyncY = 0,
    DesyncZ = 0,
    BreakerX = 0,
    BreakerY = 0,
    BreakerZ = 0,
}

local function isGun(tool)
    return tool:IsA("Tool")
end

local isAlive = function(player)
    return (player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart")) and true or false
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
    player = Window:AddTab('Player'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Breakers = Tabs.Misc:AddLeftTabbox()

local Desync = Breakers:AddTab('Desync')
local PredictionBreaker = Breakers:AddTab('Prediction Breaker')

local AimVisuals = Tabs.Legit:AddLeftGroupbox('Aim Visuals')
local BulletTracers = Tabs.Visuals:AddLeftGroupbox('Bullet')
local Gun = Tabs.Visuals:AddRightGroupbox('Weapon Visuals')

Desync:AddLabel('Desync'):AddKeyPicker('KeyPicker', {
    Default = 'T',
    SyncToggleState = false,
    Mode = 'Toggle',

    Text = 'Desync',
    NoUI = false,
    Callback = function(Value)
        Settings.Desync = Value
    end,
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
    Values = { 'Random', 'nothing',},
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

PredictionBreaker:AddLabel('Prediction Breaker'):AddKeyPicker('KeyPicker', {
    Default = 'G',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Breaker',
    NoUI = false,
    Callback = function(Value)
        Settings.PredictionBreaker = Value
    end,
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
    Values = { 'Random', 'nothing',},
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

--real hackery

local Fov = function()
    if Visuals.Fov then
        Fov.Visible = true
        Fov.Color = Visuals.FovColor
        Fov.Transparency = Visuals.Transparency
    else
        Fov.Visible = false
    end
end

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
end)

RunService.RenderStepped:Connect(function()
    VisualWeapon()
    Fov()
end)

local blockedMethods = {
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

local __namecall
__namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
    local Method = getnamecallmethod()
    if tostring(self.Name) == "MainEvent" and tostring(Method) == "FireServer" then
        local method = Args[1]
        if table.find(blockedMethods, method) then
            return
        end
    end

    return __namecall(self, ...)
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
