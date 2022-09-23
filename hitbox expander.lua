local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

getgenv().Color = BrickColor
getgenv().HeadSize = 10
getgenv().Rootpart = 50
getgenv().Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
    if Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
    pcall(function()
    v.Character.Head.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
    v.Character.Head.Transparency = 0.2
    v.Character.Head.BrickColor = BrickColor.new(Color)
    v.Character.Head.Material = "ForceField"
    v.Character.Head.CanCollide = false
    end)
    end
    end
    end
    end)

game:GetService('RunService').RenderStepped:connect(function()
    if Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
    pcall(function()
    v.Character.HumanoidRootPart.Size = Vector3.new(Rootpart,Rootpart,Rootpart)
    v.Character.HumanoidRootPart.Transparency = 0.2
    v.Character.HumanoidRootPart.BrickColor = BrickColor.new(Color)
    v.Character.HumanoidRootPart.Material = "ForceField"
    v.Character.HumanoidRootPart.CanCollide = false
    end)
    end
    end
    end
    end)

local Window = Library:CreateWindow({
    Title = 'RedBox2 v2',
    Center = true, 
    AutoShow = true,
})
local Tabs = {
    Main = Window:AddTab('Hitbox'), 
    Main1 = Window:AddTab('Local Player'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
local Sliders = Tabs.Main:AddLeftGroupbox('Hitbox Sliders')
local ColorWheel = Tabs.Main:AddRightGroupbox('Color Wheel')
local Modifieres = Tabs.Main1:AddLeftGroupbox('Slider Modifieres')
local Modifieres1 = Tabs.Main1:AddLeftGroupbox('Keybind Modifieres')

Sliders:AddSlider('HitboxHead', {
    Text = 'Hitbox Slider (head)',
    Default = 0,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Compact = false,
})

Options.HitboxHead:OnChanged(function()
    HeadSize = Options.HitboxHead.Value
end)

Sliders:AddSlider('HitboxRoot', {
    Text = 'Hitbox Slider (HumanoidRootPart)',
    Default = 2,
    Min = 2,
    Max = 100,
    Rounding = 1,
    Compact = false,
})

Options.HitboxRoot:OnChanged(function()
    Rootpart = Options.HitboxRoot.Value
end)


ColorWheel:AddLabel('Hitbox Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Hitbox Color',
})

Options.ColorPicker:OnChanged(function()
    Color = Options.ColorPicker.Value
end)

local TargetWalkspeed
Modifieres:AddSlider('Speed', {
    Text = 'Speed slider',
    Default = 0,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Compact = false,
})

Options.Speed:OnChanged(function()
    TargetWalkspeed = Options.Speed.Value
end)

Modifieres:AddSlider('Jump', {
    Text = 'Jump slider',
    Default = 0,
    Min = 0,
    Max = 250,
    Rounding = 1,
    Compact = false,
})

Options.Jump:OnChanged(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Options.Jump.Value
end)

--some functions
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
        end
    end)
end)

--settings
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