local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local plrs = game:GetService('Players')
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()
local camera = workspace.CurrentCamera
local Fov = Drawing.new("Circle")
local DeadZone = Drawing.new("Circle")
local RunService = game:GetService("RunService")
DeadZone.Radius = 25
DeadZone.Color = Color3.fromRGB(0, 0, 0)
DeadZone.Filled = false
DeadZone.NumSides = 32 
DeadZone.Position = Vector2.new(20, 20)
DeadZone.Transparency = 0.5

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

local function getClosestPlayer(players)
    local closestPlayer, closestDistance
    for _, player in ipairs(players) do
        local character = player.Character
        if character and character:IsDescendantOf(workspace) then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.RootPart then
                local position, onScreen = camera:WorldToViewportPoint(humanoid.RootPart.Position)
                if onScreen then
                    local distanceFromCenter = (Vector2.new(position.X, position.Y) - Fov.Position).Magnitude
                    if not closestDistance or distanceFromCenter < closestDistance then
                        closestPlayer = player
                        closestDistance = distanceFromCenter
                    end
                end
            end
        end
    end
    return closestPlayer
end

local function updateDeadZonePosition()
    local playersWithinFOV = getPlayersWithinFOV()
    if #playersWithinFOV > 0 then
        local closestPlayer = getClosestPlayer(playersWithinFOV)
        if closestPlayer then
            local character = closestPlayer.Character
            if character then
                local head = character:FindFirstChild("Head")
                if head then
                    local headPos, onScreen = camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local deadzonePos = Vector2.new(headPos.X, headPos.Y)
                        local mousePos = Vector2.new(mouse.X, mouse.Y)
                        local distance = (deadzonePos - mousePos).Magnitude
                        local moveAmount = math.min(distance, DeadZone.Radius) * 0.5
                        local moveDirection = (deadzonePos - mousePos).Unit
                        local moveVector = moveDirection * moveAmount
                        mousemoverel(moveVector.X, moveVector.Y)
                        DeadZone.Position = deadzonePos
                        return
                    end
                end
            end
        end
    end
    DeadZone.Position = Fov.Position
end

local function update()
    Fov.Position = Vector2.new(mouse.X, mouse.Y + 36)
    updateDeadZonePosition()
    local playersWithinFOV = getPlayersWithinFOV()
    for _, player in ipairs(playersWithinFOV) do
        print(player.Name, "is within FOV")
    end
end

mouse.Move:Connect(update)

RunService.Stepped:Connect(function()
    if not mousemoverel then
        return
    end
    local mousePos = Vector2.new(mouse.X, mouse.Y)
    local deadzonePos = Vector2.new(DeadZone.AbsolutePosition.X + DeadZone.Radius, DeadZone.AbsolutePosition.Y + DeadZone.Radius)
    local distance = (deadzonePos - mousePos).Magnitude
    if distance > DeadZone.Radius then
        local moveAmount = math.min(distance - DeadZone.Radius, 10)
        local moveDirection = (mousePos - deadzonePos).Unit
        local moveVector = moveDirection * moveAmount
        mousemoverel(moveVector.X, moveVector.Y)
    end
end)

while wait() do
    update()
end

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
    DeadZone.Visible = Toggles.FovVisable.Value
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