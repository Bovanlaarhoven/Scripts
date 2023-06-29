local plr = game:GetService("Players").LocalPlayer
local plrs = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GetMouseLocation = UserInputService.GetMouseLocation
local ValidTargetParts = {"Head", "HumanoidRootPart"}
local mouse = plr:GetMouse()
local GetPlayers = plrs.GetPlayers
local Camera = workspace.CurrentCamera
local Character = plr.Character
local Humanoid = Character.Humanoid
local RootPart = Character.HumanoidRootPart

local Settings = {
    Enabled = false,
    Method = "Raycast",
    TeamCheck = false,
    TargetPart = "Head",
    HitChance = 100, 

    --Fov
    FovRadius = 100,
    FovVisable = false,
    FovTransparency = 0.5,
    
}

local GetScreenPosition = function(Vector)
    local Vec3, OnScreen = WorldToScreen(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local IsTool = function(Tool)
    return Tool:IsA("Tool")
end

local IsAlive = function(Plr)
    return Plr.Character and Plr.Character:FindFirstChild("Humanoid") and Plr.Character.Humanoid.Health > 0
end

local GetTool = function()
    for _,v in pairs(plr.Backpack:GetChildren()) do
        if IsTool(v) then
            return v
        end
    end
end

local TeamCheck = function(Plr)
    return plr.Team ~= Plr.Team
end

local GetMousePosition = function()
    return GetMouseLocation(UserInputService)
end

local VisibleCheck = function(player)
    local ray = Ray.new(RootPart.Position, (player.Character.Head.Position - RootPart.Position).unit * 300)
    local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {RootPart, Character})
    if part then
        local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Parent == Character then
            return true
        end
    end
    return false
end

local Arguments = {
    FindPartOnRayWithIgnoreList = {
        ArgsAmound = 3,
        Args = {
            "Instance", "Ray", "table", "boolean", "boolean"
        }
    },
    FindPartOnRayWithWhitelist = {
        ArgsAmound = 3,
        Args = {
            "Instance", "Ray", "table", "boolean"
        }
    },
    FindPartOnRay = {
        ArgsAmound = 2,
        Args = {
            "Instance", "Ray", "Instance", "boolean", "boolean"
        }
    },
    Raycast = {
        ArgsAmound = 3,
        Args = {
            "Instance", "Vector3", "Vector3", "RaycastParams"
        }
    }
}

local HitChanceMath = function(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100

    return chance <= Percentage / 100
end

local ValidateArgument = function(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgsAmound then
        return false
    end

    for Pos,Arguments in next, Args do
        if typeof(Arguments) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgsAmound
end

local Direction = function(Origin, Position)
    return (Position - Origin).unit * 1000
end

local GetClosestPlayer = function()
    local Closest
    local DistanceToMouse
    for _,Player in next, GetPlayers(plrs) do
        if Player == plr then continue end
        if Settings.TeamCheck and TeamCheck(Player) then continue end
        local Character = Player.Character
        if not Character then continue end

        if Settings.VisibleCheck and not VisibleCheck(Player) then continue end

        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChild(Character, "Humanoid")
        if not HumanoidRootPart or not Humanoid or not IsAlive(Player) then continue end

        local ScreenPosition, OnScreen = GetScreenPosition(HumanoidRootPart.Position)
        if not OnScreen then continue end

        local Distance = (GetMousePosition() - ScreenPosition).Magnitude
        if Distance <= (DistanceToMouse or Settings.FovRadius or 2000) then
            Closest = ((Settings.TargetPart == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]] or Character[Settings.TargetPart]) or HumanoidRootPart)
            DistanceToMouse = Distance
        end
    end
    return Closest
end

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Universal',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Legit'),
    Rage = Window:AddTab('Rage'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Silent = Tabs.Main:AddLeftGroupbox('Silent')
local Fov = Tabs.Main:AddRightGroupbox('Fov')

Silent:AddToggle('Enabled', {
    Text = 'Enable',
    Default = false,
    Tooltip = 'Enbles the script',
    Callback = function(Value)
        Settings.Enabled = Value
    end
})

Silent:AddToggle('TeamCheck', {
    Text = 'Team Check',
    Default = false,
    Tooltip = 'Checkington',
    Callback = function(Value)
        Settings.TeamCheck = Value
    end
})

Silent:AddToggle('VisibleCheck', {
    Text = 'Visible Check',
    Default = false,
    Tooltip = 'Checkington',
    Callback = function(Value)
        Settings.VisibleCheck = Value
    end
})

Silent:AddDropdown('HitPart', {
    Values = {'Random', 'Head', 'HumanoidRootPart'},
    Default = 1,
    Multi = false, 
    Text = 'HitPart',
    Tooltip = 'Targetington',

    Callback = function(Value)
        Settings.HitPart = Value
    end
})

Silent:AddDropdown('MyDropdown', {
    Values = { 'Raycast', 'FindPartOnRay', 'FindPartOnRayWithWhitelist', 'FindPartOnRayWithIgnoreList' },
    Default = 1,
    Multi = false, 
    Text = 'A dropdown',
    Tooltip = 'This is a tooltip',
    Callback = function(Value)
        Settings.Method = Value
    end
})

Silent:AddSlider('hitchance', {
    Text = 'Hit Chance',
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Settings.HitChance = Value
    end
})

Fov:AddToggle('Fov Visible', {
    Text = 'Enable',
    Default = false,
    Tooltip = 'Visible',
    Callback = function(Value)
        Settings.FovVisable = Value
    end
})

Fov:AddSlider('Radois', {
    Text = 'Fov Radius',
    Default = 100,
    Min = 1,
    Max = 250,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Settings.FovRadius = Value
    end
})

Fov:AddSlider('Trans', {
    Text = 'Fov Transparency',
    Default = 0.4,
    Min = 0.1,
    Max = 1,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Settings.FovTransparency = Value
    end
})


local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = getnamecallmethod()
    local Args = {...}
    local self = Args[1]
    local chance = HitChanceMath(Settings.HitChance)
    if Settings.Enabled and self == workspace and not checkcaller() and chance == true then
        if Method == "FindPartOnRayWithIgnoreList" and Settings.Method == Method then
            if ValidateArgument(Args, Arguments.FindPartOnRayWithIgnoreList) then
                local A_Ray = Args[2]
                local HitPart = GetClosestPlayer()
                if HitPart then
                    local Origin = A_Ray.Origin
                    local Direction = Direction(Origin, HitPart.Position)
                    Args[2] = Ray.new(Origin, Direction)
                    return OldNamecall(unpack(Args))
                end
            end
        elseif Method == "FindPartOnRayWithWhitelist" and Settings.Method == Method then
            if ValidateArgument(Args, Arguments.FindPartOnRayWithWhitelist) then
                local A_Ray = Args[2]
                local HitPart = GetClosestPlayer()
                if HitPart then
                    local Origin = A_Ray.Origin
                    local Direction = Direction(Origin, HitPart.Position)
                    Args[2] = Ray.new(Origin, Direction)
                    return OldNamecall(unpack(Args))
                end
            end
        elseif (Method == "FindPartOnRay" and Settings.Method == Method) and Settings.Method:lower() == Method:Lower() then
            if ValidateArgument(Args, Arguments.FindPartOnRay) then
                local A_Ray = Args[2]
                local HitPart = GetClosestPlayer()
                if HitPart then
                    local Origin = A_Ray.Origin
                    local Direction = Direction(Origin, HitPart.Position)
                    Args[2] = Ray.new(Origin, Direction)
                    return OldNamecall(unpack(Args))
                end
            end
        elseif Method == "Raycast" and Settings.Method == Method then
            if ValidateArgument(Args, Arguments.Raycast) then
                local A_Origin = Args[2]
                local HitPart = GetClosestPlayer()
                if HitPart then
                    Args[3] = Direction(A_Origin, HitPart.Position)
                    return OldNamecall(unpack(Args))
                end
            end
        end
    end
    return OldNamecall(...)
end))

local Fov = Drawing.new("Circle")

local Fov = function()
    if Settings.FovVisable then
        Fov.Visible = true
        Fov.Color = Color3.fromRGB(255, 255, 255)
        Fov.Radius = Settings.FovRadius
        Fov.Transparency = Settings.FovTransparency
        Fov.Position = Vector2.new(mouse.X, mouse.Y + 36)
    else
        Fov.Visible = false
    end
end

RunService.RenderStepped:Connect(function()
    Fov()
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
