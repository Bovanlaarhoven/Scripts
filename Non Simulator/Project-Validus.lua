local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local plrs = game:GetService('Players')
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()
local camera = workspace.CurrentCamera
local Fov = Drawing.new("Circle")
Fov.Radius = 50
Fov.Color = Color3.fromRGB(255, 255, 255)
Fov.Filled = false
Fov.NumSides = 32 
Fov.Position = Vector2.new(20, 20)
Fov.Transparency = 0.1

local function isPlayerWithinFOV(player)
    local character = player.Character
    if not character or not character:IsDescendantOf(workspace) then
        return false
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or not humanoid.RootPart then
        return false
    end

    local position, onScreen = camera:WorldToViewportPoint(humanoid.RootPart.Position)
    if not onScreen then
        return false
    end

    local distanceFromCenter = (Vector2.new(position.X, position.Y) - Fov.Position).Magnitude
    return distanceFromCenter <= Fov.Radius
end

local function getPlayersWithinFOV()
    local playersWithinFOV = {}
    for _, player in ipairs(plrs:GetPlayers()) do
        if player ~= lplr and isPlayerWithinFOV(player) then
            table.insert(playersWithinFOV, player)
        end
    end
    return playersWithinFOV
end

mouse.Move:Connect(function()
    Fov.Position = Vector2.new(mouse.X, mouse.Y + 36)
    local playersWithinFOV = getPlayersWithinFOV()
    for _, player in ipairs(playersWithinFOV) do
        print(player.Name, "is within FOV")
    end
end)


local Window = Library:CreateWindow({
    Title = 'Project-Validus',
    Center = false,
    AutoShow = true,
    TabPadding = 4,
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local tab1 = Tabs.Main:AddLeftTabbox()
local AimAssistSetting = tab1:AddTab('Aim Assist')
local FovSetting = tab1:AddTab('Fov Settings')

FovSetting:AddToggle('FovVisable', {
    Text = 'Fov Visable',
    Default = false,
    Tooltip = 'changes the fov visability',
})

Toggles.FovVisable:OnChanged(function()
    Fov.Visible = Toggles.FovVisable.Value
end)

FovSetting:AddSlider('FovTransparency', {
    Text = 'Fov Transparency',
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = true,
})

Options.FovTransparency:OnChanged(function()
    Fov.Transparency = Options.FovTransparency.Value
end)

--ui settings
Library:SetWatermark('Project-Validus By Hydra#8270')

Library:OnUnload(function()
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
local Other = Tabs['UI Settings']:AddRightGroupbox('Other')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
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

Other:AddDropdown('MyPlayerDropdown', {
    SpecialType = 'Player',
    Text = 'A player dropdown',
    Tooltip = 'Player Dropdown',
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