local RunService = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer
local lcharacter = lplr.Character

local Settings = {
    Desync = false,
    DesyncPreseton = false,
    AutoBuyEnabled = false,
    DesyncPreset = "Random",
    GunSelection = {},
    DesyncX = 0,
    DesyncY = 0,
    DesyncZ = 0,
    Ammo = 0,
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

local Desync = Tabs.Misc:AddLeftGroupbox('Desync')
local AutoBuy = Tabs.Misc:AddRightGroupbox('Auto Buy')

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
    Min = 0,
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
    Min = 0,
    Max = 6000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.DesyncZ = Value
    end
})

AutoBuy:AddToggle('AutoBuyEnabled', {
    Text = 'Auto Buy',
    Default = false,
    Tooltip = 'Auto Buy',

    Callback = function(Value)
        Settings.AutoBuyEnabled = Value
    end
})

Desync:AddDropdown('MyDropdown', {
    Values = {"Revolver", "Revolver Ammo", "Double-Barrel", "Double-Barrel Ammo"},
    Default = 1,
    Multi = true,

    Text = 'Items',
    Tooltip = 'Select Items to buy',

    Callback = function(Value)
        Settings.GunSelection = Value
    end
})

Desync:AddSlider('Ammo', {
    Text = 'Ammo Amound',
    Default = 0,
    Min = 0,
    Max = 20,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.Ammo = Value
    end
})

--real hackery
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
end)

local function BuyGun(Weapon)
    if lcharacter.Humanoid.Health >= 1 then
        lcharacter.HumanoidRootPart.Position = Weapon:FindFirstChild("Head").CFrame
        wait(0.1)
        if Weapon.Name:match("Ammo") then
            for i=1, Ammo do
                fireclickdetector(Weapon:FindFirstChild("ClickDetector"))
                wait(0.5)
            end
        end
    else
        fireclickdetector(Weapon:FindFirstChild("ClickDetector"))
        wait(0.5)
    end
end

local function createBeam(p1, p2)
    local beam = Instance.new("Part")
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.ForceField
    beam.BrickColor = BrickColor.new("Bright red")
    
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
    local player = game.Players.LocalPlayer
    local gun = getPlayerGun(player)

    if gun then
        local handle = gun:FindFirstChild("Handle")
        if handle then
            local beamOrigin = handle.Position
            local beamDirection = (mouse.Hit.p - beamOrigin).unit
            local beamEnd = beamOrigin + beamDirection * 100

            local beam = createBeam(beamOrigin, beamEnd)
            wait(0.5)
            beam:Destroy()
        end
    end
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
SaveManager:LoadAutoloadConfig()

