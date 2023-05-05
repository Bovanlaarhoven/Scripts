local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local uis = game:GetService("UserInputService")
local char = lplr.Character
local camera =  workspace.CurrentCamera
local runservice = game:GetService("RunService")
local teleportservice = game:GetService("TeleportService")
local Id = nil
local OldFov
local keys = {}
local canFly = false
local flySpeed = 10
local lightning = game:GetService("Lighting")

getgenv().Disabled = false

local function Downed(plr)
    if plr and plr.Character and plr.Character:GetAttribute("Downed") then return true end
    return false
end

local function isCarried(plr)
    local plr = workspace.Game.Players:FindFirstChild(plr.Name)
    if plr then
        return plr:FindFirstChild("CarriedBy") ~= nil
    end
    return false
end

local function revive(plr, status)
    return game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(plr.Name, status)
end

local function Respawn()
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end

local function Disable()
    for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
        v:Disable()
    end
    
    for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
        v:Disable()
    end
end

for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == "Menu" ~= nil then
        Respawn()
        if getgenv().Disabled == false then
            Disable()
            getgenv().Disabled = true
        end
    elseif Downed(lplr) ~= nil then
        Respawn()
        if getgenv().Disabled == false then
            Disable()
            getgenv().Disabled = true
        end
    else
        print("working")
        if getgenv().Disabled == false then
            Disable()
            getgenv().Disabled = true
        end
    end
end


local function updateChar()
    local character = game:GetService("Players").LocalPlayer.Character
    if character then
        char = character
    end
end

updateChar()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(updateChar)

uis.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        keys[input.KeyCode] = true
    end
end)

uis.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        keys[input.KeyCode] = false
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if canFly and char then
        local forward = (keys[Enum.KeyCode.W] and 1 or 0) - (keys[Enum.KeyCode.S] and 1 or 0)
        local right = (keys[Enum.KeyCode.D] and 1 or 0) - (keys[Enum.KeyCode.A] and 1 or 0)
        local up = (keys[Enum.KeyCode.Space] and 1 or 0) - (keys[Enum.KeyCode.LeftControl] and 1 or 0)

        local camera = workspace.CurrentCamera
        local cf = camera.CFrame
        local unit = cf.lookVector
        local upUnit = Vector3.new(0, 1, 0)
        local rightUnit = unit:Cross(upUnit)

        local targetVelocity = (rightUnit * right + unit * forward) * (flySpeed * 2) + upUnit * up * flySpeed
        targetVelocity = targetVelocity - (upUnit * targetVelocity:Dot(upUnit) / upUnit.Magnitude^2) / 2 
        char.HumanoidRootPart.Velocity = targetVelocity
    end
end)


local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Robobo2022/notify-lib/main/lib'),true))()
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Evade Premium',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Player = Window:AddTab('Player'),
    Misc = Window:AddTab('Misc'),
    Visuals = Window:AddTab('Visuals'),
    Game = Window:AddTab('Game'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Settings = {
    JumpPower = 20,
    WalkSpeed = 20,
    JumpEnabled = false,
    WalkEnabled = false,
    CameraShake = false,
    FearFov = false,
    AutoRespawn = false,
    ReviveFarm = false,
    LeverEsp = false,
    BotEsp = false,
    EspColor = Color3.fromRGB(255, 255, 255),
    AfkFarm = false,
}

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    if (Settings.WalkEnabled or Settings.JumpEnabled) and self and self.Name == "Communicator" and args[1] == "update" then
        return (Settings.WalkEnabled and Settings.WalkSpeed*100 or 1500), (Settings.JumpEnabled and Settings.JumpPower or 3)
    end
    return old(self,...)
end)

task.defer(function()
    while task.wait() do
        if Settings.CameraShake then
            lplr.PlayerScripts.CameraShake.Value = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.FearFov then
            if lplr.PlayerScripts.FOVAdjusters.Fear.Value then
                OldFov = lplr.PlayerScripts.FOVAdjusters.Fear.Value
                OldFov.PlayerScripts.FOVAdjusters.Fear.Value = 1
            else
                OldFov = lplr.PlayerScripts.FOVAdjusters.Fear.Value
                lplr.PlayerScripts.FOVAdjusters.Fear.Value = 1
            end
        else
            if OldFov then
                if lplr.PlayerScripts.FOVAdjusters.Fear.Value then
                    lplr.PlayerScripts.FOVAdjusters.Fear.Value = OldFov
                else
                    lplr.PlayerScripts.FOVAdjusters.Fear.Value = OldFov
                end
                
            end
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.AutoRespawn then
            if char:GetAttribute("Downed") then
                Respawn()
            end
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.AfkFarm then
            char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(6007, 7005, 8005)
        end
    end
end)

--Switch esp
function esp(Object)
    pcall(function()
        local text = Drawing.new("Text")
        text.Visible = true
        text.Center = true
        text.Outline = true
        text.Color = Settings.EspColor
        text.OutlineColor = Settings.EspColor
        text.Size = 18
    
        local renderstepped 
        renderstepped = runservice.RenderStepped:Connect(function()
            if Object then
                local vector, onScreen
                vector, onScreen = camera:WorldToViewportPoint(Object.Position)
                local distance = (Object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                local distanceInMeters = distance * 0.282
                text.Text = string.format("%s\nDistance: %.2f Meters", Object.Name, distanceInMeters)
                if onScreen then
                    text.Position = Vector2.new(vector.X, vector.Y)
                    text.Visible = Settings.LeverEsp
                else
                    text.Visible = false
                end
            else
                text.Visible = false
                text:Remove()
                renderstepped:Disconnect()
            end
        end)
    end)
end

for _,v in pairs(game:GetService("Workspace").Game.Map:GetDescendants()) do
    if v.Name == "Switch" and v:FindFirstChild("Switch") then
        esp(v)
    end
end

--bot esp

function BotEsp(plr)
    if plrs:GetPlayerFromCharacter(plr) == nil then
        local line = Drawing.new("Line")
        local text = Drawing.new("Text")
        runservice.RenderStepped:Connect(function()
            if plr:FindFirstChild("HumanoidRootPart") then
                local Vector, OnScreen = camera:WorldToViewportPoint(plr.HumanoidRootPart.Position)
                if OnScreen then
                    local Distance = (plr.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).magnitude
                    text.Visible = Settings.BotEsp
                    line.Visible = Settings.BotEsp
                    text.Color = Settings.EspColor
                    text.OutlineColor = Settings.EspColor
                    text.Text = string.format("%s\nDistance: %.2f Studs", plr.Name, Distance)
                    text.Position = Vector2.new(Vector.X, Vector.Y)
                    line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    line.To = Vector2.new(Vector.X, Vector.Y)
                    line.Color = Settings.EspColor
                    line.Thickness = 2
                else
                    line.Visible = false
                    text.Visible = false
                end
            else
                pcall(function()
                    line.Visible = false
                    text.Visible = false
                end)
            end
            if not plr:FindFirstChild("HumanoidRootPart") or not plr:FindFirstChild("HumanoidRootPart"):IsDescendantOf(game:GetService("Workspace")) then
                pcall(function()
                    line:Remove()
                    text:Remove()
                end)
            end
        end)
    end
end

for _,v in pairs(game:GetService'Workspace'.Game.Players:GetChildren()) do
    BotEsp(v)
end

game:GetService'Workspace'.Game.Players.ChildAdded:Connect(function(plr)
    BotEsp(plr)
end)

local t1 = Tabs.Player:AddLeftGroupbox('Player')
local t2 = Tabs.Player:AddRightGroupbox('Camera')
local t3 = Tabs.Misc:AddLeftGroupbox('QoL')
local t4 = Tabs.Main:AddLeftGroupbox('AutoFarms')
local t5 = Tabs.Visuals:AddLeftGroupbox('Visuals')
local t6 = Tabs.Game:AddLeftGroupbox('Teleport')
local t7 = Tabs.Game:AddRightGroupbox('World')

t1:AddLabel('WalkSpeed Keybind'):AddKeyPicker('KeyPicker', {
    Default = 'X',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'WalkSpeed',
    NoUI = false,
    Callback = function(Value)
        Settings.WalkEnabled = Value
    end,
})

t1:AddToggle('MyToggle', {
    Text = 'Enabled WalkSpeed',
    Default = false,
    Tooltip = 'Enabled WalkSpeed',
    Callback = function(Value)
        Settings.WalkEnabled = Value
    end
})

t1:AddSlider('MySlider', {
    Text = 'WalkSpeed',
    Default = 20,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.WalkSpeed = Value
    end
})

t1:AddLabel('JumpPower Keybind'):AddKeyPicker('KeyPicker', {
    Default = 'Z',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'JumpPower',
    NoUI = false,
    Callback = function(Value)
        Settings.JumpEnabled = Value
    end,
})

t1:AddToggle('MyToggle', {
    Text = 'Enabled JumpPower',
    Default = false,
    Tooltip = 'Enabled JumpPower',
    Callback = function(Value)
        Settings.JumpEnabled = Value
    end
})

t1:AddSlider('MySlider', {
    Text = 'JumpPower',
    Default = 20,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        Settings.JumpPower = Value
    end
})

t2:AddToggle('MyToggle', {
    Text = 'Disable Camera Shake',
    Default = false,
    Tooltip = 'Disable Camera Shake',
    Callback = function(Value)
        Settings.CameraShake = Value
    end
})

t2:AddToggle('MyToggle', {
    Text = 'Disable Fear Fov Change',
    Default = false,
    Tooltip = 'Disable Fear Fov Change',
    Callback = function(Value)
        Settings.FearFov = Value
    end
})

t3:AddToggle('MyToggle', {
    Text = 'Auto Respawn',
    Default = false,
    Tooltip = 'Auto Respawn',
    Callback = function(Value)
        Settings.AutoRespawn = Value
    end
})

t4:AddToggle('MyToggle', {
    Text = 'Revive Farm',
    Default = false,
    Tooltip = 'Revive Farm',
    Callback = function(Value)
        Settings.ReviveFarm = Value
        if Value then
            coroutine.wrap(function()
                repeat
                    local suc,res = pcall(function()
                        for _,v in next, game.Players:GetPlayers() do
                            if v and v ~= lplr and Downed(v) and not isCarried(v) then
                                plrs = v
                                task.spawn(function()
                                    for _ = 1,30 do
                                        if Downed(lplr) then Respawn() end
                                        if plrs ~= v or not Downed(v) or isCarried(v) then return end
                                        if lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and v and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                            lplr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                                        end
                                        task.wait(.0866666667)
                                    end
                                end)
                                task.wait(.2)
                                revive(v, false)
                                task.wait(2.2)
                                for _ = 1,2 do
                                    revive(v, true)
                                    task.wait(.1)
                                end
                                task.wait(.3)
                            end
                        end
                    end)
                    if not suc then Lib:prompt("[ReviveAutoFarm Error]: "..res, 5) end
                    task.wait()
                until Settings.ReviveFarm == false
            end)()
        end
    end
})

t4:AddToggle('MyToggle', {
    Text = 'Afk Farm',
    Default = false,
    Tooltip = 'Afk Farm',
    Callback = function(Value)
        Settings.AfkFarm = Value
    end
})

t5:AddToggle('MyToggle', {
    Text = 'Lever Esp',
    Default = false,
    Tooltip = 'Lever Esp',
    Callback = function(Value)
        Settings.LeverEsp = Value
    end
})

t5:AddToggle('MyToggle', {
    Text = 'Bot Esp',
    Default = false,
    Tooltip = 'Bot esp',
    Callback = function(Value)
        Settings.BotEsp = Value
    end
})

t5:AddLabel('Esp Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Esp Color',
    Transparency = 0,

    Callback = function(Value)
        Settings.EspColor = Value
    end
})

t6:AddDropdown('MyDropdown', {
    Values = { "Main", "Big Team", "Social Space", "Team Deathmatch", "Casual", "Vc Only", "Infection", "Pro", "Player Nextbot"},
    Default = 1, 
    Multi = false,

    Text = 'Teleport Choose',
    Tooltip = 'What gamemode you wanne teleport to?',

    Callback = function(Option)
        if Option == "Main" then
            Id = 9872472334
        elseif Option == "Big Team" then
            Id = 10324346056
        elseif Option == "Social Space" then
            Id = 10324347967
        elseif Option == "Team Deathmatch" then
            Id = 10539706691
        elseif Option == "Casual" then
            Id = 10662542523
        elseif Option == "Vc Only" then
            Id = 10808838353
        elseif Option == "Infection" then
            Id = 11353532384
        elseif Option == "Pro" then
            Id = 11353528705
        elseif Option == "Player Nextbot" then
            Id = 11987867148
        end
    end
})

local MyButton = t6:AddButton({
    Text = 'Teleport to Game',
    Func = function()
        teleportservice:Teleport(Id,lplr)
    end,
    DoubleClick = true,
    Tooltip = 'You Sure?'
})

t7:AddSlider('MySlider', {
    Text = 'Brightness',
    Default = 1,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        lightning.Brightness = Value
    end
})

t7:AddLabel('Ambient'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 0, 0),
    Title = 'Ambient Color',
    Transparency = 0,

    Callback = function(Value)
        lightning.Ambient = Value
    end
})

t1:AddLabel('Fly Keybind'):AddKeyPicker('KeyPicker', {
    Default = 'Q',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Fly',
    NoUI = false,
    Callback = function(Value)
        canFly = not canFly
    end,
})

t1:AddSlider('MySlider', {
    Text = 'Fly Speed',
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        flySpeed = Value
    end
})

Library:SetWatermark('Evade Premium Script By Hydra#8270')

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