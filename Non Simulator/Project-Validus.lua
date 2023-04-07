for _, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
    v:Disable()
end

for _, v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
    v:Disable()
end

local plrs = game:GetService('Players')
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()
local camera = workspace.CurrentCamera
local Fov = Drawing.new("Circle")
local DeadZone = Drawing.new("Circle")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local vu = game:GetService("VirtualUser")

getgenv().Assist = false
getgenv().TeamCheck = false
getgenv().VisableCheck = false
getgenv().Triggerbot = false
getgenv().Distance = 100
getgenv().DeadZoneColor = Color3.fromRGB(0, 0, 0)
getgenv().FovColor = Color3.fromRGB(255, 255, 255)

DeadZone.Radius = 25
DeadZone.Color = getgenv().DeadZoneColor
DeadZone.Filled = false
DeadZone.NumSides = 32 
DeadZone.Position = Vector2.new(20, 20)
DeadZone.Transparency = 0.5

Fov.Radius = 50
Fov.Color = getgenv().FovColor
Fov.Filled = false
Fov.NumSides = 32 
Fov.Position = Vector2.new(20, 20)
Fov.Transparency = 0.1

local function updateDeadZoneColor()
    DeadZone.Color = getgenv().DeadZoneColor
end
updateDeadZoneColor()
getgenv().DeadZoneColorChanged = updateDeadZoneColor
local function updateFovColor()
    Fov.Color = getgenv().FovColor
end
updateFovColor()
getgenv().FovColorChanged = updateFovColor

if game.GameId == 2788229376 then
    local MainEvent = ReplicatedStorage.MainEvent
    local SpoofTable = { WalkSpeed = 16, JumpPower = 50 }
    local Flags = { "CHECKER_1", "TeleportDetect", "OneMoreTime" }
    local Hooks = {}
    
    Hooks.__namecall = hookmetamethod(game, "__namecall", function(...)
        local args = {...}
        local self = args[1]
        local method = getnamecallmethod()
    
        if (method == "FireServer" and self == MainEvent and table.find(Flags, args[2])) then
            return
        end
    
        if (not checkcaller() and getfenv(2).crash) then
            hookfunction(getfenv(2).crash, function() warn("Crash Attempt") end)
        end
        return Hooks.__namecall(...)
    end)
    
    Hooks.__index = hookmetamethod(game, "__index", function(t, k)
        if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
            return SpoofTable[k]
        end
    
        return Hooks.__index(t, k)
    end)
    
    Hooks.__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
        if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
            SpoofTable[k] = v
            return
        end
        
        return Hooks.__newindex(t, k, v)
    end)
end

local success, err = pcall(function()
    local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

    local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
    local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
    local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
    
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
    
    local function isPlayerVisible(player)
        local character = player.Character
        if not character or not character:IsDescendantOf(workspace) then
            return false
        end
    
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or not humanoid.RootPart then
            return false
        end
    
        local ray = Ray.new(camera.CFrame.Position, humanoid.RootPart.Position - camera.CFrame.Position)
        local hitPart, hitPosition = workspace:FindPartOnRayWithIgnoreList(ray, {camera})
        if hitPart and hitPart:IsDescendantOf(character) then
            return true
        else
            return false
        end
    end
    
    local function getPlayersWithinFOV()
        local playersWithinFOV = {}
        local players = game:GetService("Players"):GetPlayers()
        for i = 1, #players do
            local player = players[i]
            if player ~= lplr and isPlayerWithinFOV(player) then
                if getgenv().VisableCheck == true then
                    if isPlayerVisible(player) then
                        table.insert(playersWithinFOV, player)
                    end
                else
                    table.insert(playersWithinFOV, player)
                end
            end
        end
        return playersWithinFOV
    end
    
    local function getClosestPlayer(players)
        local closestPlayer, closestDistance
        local cameraPos = workspace.CurrentCamera.CFrame.Position
        for i = 1, #players do
            local player = players[i]
            local character = player.Character
            if character and character:IsDescendantOf(workspace) then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.RootPart then
                    local rootPartPos = humanoid.RootPart.Position
                    local distanceFromCamera = (rootPartPos - cameraPos).Magnitude
                    if not getgenv().Distance or distanceFromCamera <= getgenv().Distance then
                        if not closestDistance or distanceFromCamera < closestDistance then
                            closestPlayer = player
                            closestDistance = distanceFromCamera
                        end
                    end
                end
            end
        end
        return closestPlayer
    end
    
    local desiredBodyPart = "Head"
    
    local bodyPartPresets = {
        Head = Vector3.new(0, 0.65, 0),
        UpperTorso = Vector3.new(0, 0.5, 0),
        LowerTorso = Vector3.new(0, 0.35, 0),
        RightHand = Vector3.new(1, 0, 0),
        LeftHand = Vector3.new(-1, 0, 0)
    }
    
    local function updateDeadZonePosition()
        local playersWithinFOV = getPlayersWithinFOV()
        if #playersWithinFOV > 0 then
            local closestPlayer = nil
            if getgenv().TeamCheck then
                for _, player in ipairs(playersWithinFOV) do
                    if player ~= lplr and player.Team ~= lplr.Team then
                        closestPlayer = closestPlayer or player
                        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                            closestPlayer = player
                            break
                        end
                    end
                end
            else
                closestPlayer = getClosestPlayer(playersWithinFOV)
            end
            if closestPlayer then
                local character = closestPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.RootPart then
                        local rootPart = humanoid.RootPart
                        local bodyPart = character:FindFirstChild(desiredBodyPart)
                        if not bodyPart or not bodyPart:IsDescendantOf(character) then
                            bodyPart = rootPart
                        end
                        local offset = bodyPartPresets[desiredBodyPart] or Vector3.new(0, 0, 0)
                        local bodyPartScreenPos, onScreen = camera:WorldToViewportPoint(bodyPart.Position + offset)
                        if onScreen then
                            local rootPartScreenPos = camera:WorldToViewportPoint(rootPart.Position)
                            local relativePos = bodyPartScreenPos - rootPartScreenPos
                            local deadzonePos = Vector2.new(rootPartScreenPos.X + relativePos.X, rootPartScreenPos.Y + relativePos.Y)
                            local mousePos = Vector2.new(mouse.X, mouse.Y)
                            local distance = (deadzonePos - mousePos).Magnitude
                            local moveAmount = math.min(distance, DeadZone.Radius) * 0.5
                            local moveDirection = (deadzonePos - mousePos).Unit
                            local moveVector = Vector2.new(moveDirection.X * moveAmount, 0)
                            if getgenv().Assist == true then
                                mousemoverel(moveVector.X, moveVector.Y)
                            end
                            if getgenv().Triggerbot == true and isPlayerWithinFOV(closestPlayer) then
                                local function isPlayerVisibleToggle(player)
                                    if getgenv().VisibleCheck then
                                        return isPlayerVisible(player)
                                    else
                                        return true
                                    end
                                end
                                
                                if isPlayerVisibleToggle(closestPlayer) then
                                    vu:Button1Down(Vector2.new(moveVector.X, moveVector.Y))
                                    wait()
                                    vu:Button1Up(Vector2.new(moveVector.X, moveVector.Y))
                                end
                            end
                            
                            DeadZone.Position = deadzonePos
                            return
                        end
                    end
                end
            end
        end
        DeadZone.Position = Fov.Position
    end
    
    local function updateFOV()
        Fov.Position = Vector2.new(mouse.X, mouse.Y + 36)
        updateDeadZonePosition()
    end
    
    mouse.Move:Connect(updateFOV)
    local updateInterval = 0.1
    local timeSinceLastUpdate = 0
    RunService.Heartbeat:Connect(function(deltaTime)
        timeSinceLastUpdate = timeSinceLastUpdate + deltaTime
        if timeSinceLastUpdate >= updateInterval then
            updateFOV()
            timeSinceLastUpdate = 0
        end
    end)
    
    local Window = Library:CreateWindow({
        Title = 'Project Validus',
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
    
    
    --fov settings
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
        Default = 0.2,
        Min = 0,
        Max = 1,
        Rounding = 1,
        Compact = true,
    })
    
    Options.FovTransparency:OnChanged(function()
        Fov.Transparency = Options.FovTransparency.Value
    end)
    
    FovSetting:AddSlider('DeadZoneTransparency', {
        Text = 'DeadZone Transparency',
        Default = 0.5,
        Min = 0,
        Max = 1,
        Rounding = 1,
        Compact = true,
    })
    
    Options.DeadZoneTransparency:OnChanged(function()
        DeadZone.Transparency = Options.DeadZoneTransparency.Value
    end)
    
    FovSetting:AddSlider('FovSize', {
        Text = 'Fov Size',
        Default = 50,
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Compact = true,
    })
    
    Options.FovSize:OnChanged(function()
        Fov.Radius = Options.FovSize.Value
    end)
    
    FovSetting:AddSlider('DeadZoneSize', {
        Text = 'DeadZone Size',
        Default = 25,
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Compact = true,
    })
    
    Options.DeadZoneSize:OnChanged(function()
        DeadZone.Radius = Options.DeadZoneSize.Value
    end)
    
    FovSetting:AddLabel('Fov Color'):AddColorPicker('FovColors', {
        Default = Color3.new(1, 1, 1),
        Title = 'Fov Color',
        Transparency = 0,
    
        Callback = function(Value)
            getgenv().FovColor = Value
            if getgenv().FovColorChanged then
                getgenv().FovColorChanged()
            end
        end
    })
    
    FovSetting:AddLabel('DeadZone color'):AddColorPicker('DeadZoneColors', {
        Default = Color3.new(0, 0, 0),
        Title = 'DeadZone Color',
        Transparency = 0,
    
        Callback = function(Value)
            getgenv().DeadZoneColor = Value
            
            if getgenv().DeadZoneColorChanged then
                getgenv().DeadZoneColorChanged()
            end
        end
    })
    
    --assist settings
    
    AimAssistSetting:AddToggle('AimAssist', {
        Text = 'Aim Assist',
        Default = false,
        Tooltip = 'Assists you with aim',
    })
    
    Toggles.AimAssist:OnChanged(function()
        getgenv().Assist = Toggles.AimAssist.Value
    end)
    
    AimAssistSetting:AddToggle('Triggetbots', {
        Text = 'Triggetbot',
        Default = false,
        Tooltip = 'Auto shoots at the player',
    })
    
    Toggles.Triggetbots:OnChanged(function()
        getgenv().Triggerbot = Toggles.Triggetbots.Value
    end)
    
    AimAssistSetting:AddToggle('TeamCheck', {
        Text = 'Team Check',
        Default = false,
        Tooltip = 'Checks if the player is on your team',
    })
    
    Toggles.TeamCheck:OnChanged(function()
        getgenv().TeamCheck = Toggles.TeamCheck.Value
    end)
    
    AimAssistSetting:AddToggle('VisableCheck', {
        Text = 'Visable Check',
        Default = false,
        Tooltip = 'Check if the player is visable or not',
    })
    
    Toggles.VisableCheck:OnChanged(function()
        getgenv().VisableCheck = Toggles.VisableCheck.Value
    end)
    
    AimAssistSetting:AddSlider('Distance', {
        Text = 'Distance',
        Default = 100,
        Min = 10,
        Max = 5000,
        Rounding = 0,
        Compact = true,
    })
    
    Options.Distance:OnChanged(function()
        getgenv().Distance = Options.Distance.Value
    end)
    
    AimAssistSetting:AddToggle('InfDistance', {
        Text = 'Inf Distance',
        Default = false,
        Tooltip = 'Toggles KeybindFrame',
    })
    
    Toggles.InfDistance:OnChanged(function()
        if Toggles.InfDistance.Value then
            getgenv().Distance = math.huge
        else
            getgenv().Distance = Options.Distance.Value
        end
    end)
    
    AimAssistSetting:AddDropdown('BodyPart', {
        Values = { 'Head', 'UpperTorso', 'LowerTorso', 'RightHand', 'LeftHand'},
        Default = 1,
        Multi = false,
        Text = 'Body part',
        Tooltip = 'Select a body part to focus on',
    
        Callback = function(Value)
            desiredBodyPart = Value
            updateDeadZonePosition()
        end
    })
    
    --ui settings
    Library:SetWatermark('Project-Validus By Hydra#8270')
    
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
end)

if not success then
    warn(err)
end