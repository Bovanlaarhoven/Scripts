local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local function PlayerChatted(player)
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local notif = Notification.new("message", "Executor Type", identifyexecutor().."")
notif:deleteTimeout(2.5)
wait(3)
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()    
local ownerId = game.CreatorId

local Window = Library:CreateWindow({
    Title = 'Better Roblox',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Mods')
local LeftGroupBox1 = Tabs.Main:AddLeftGroupbox('Slider')
local LeftGroupBox2 = Tabs.Main:AddRightGroupbox('Game')

local MyButton = LeftGroupBox:AddButton('Player join notification', function()
    game.Players.PlayerAdded:Connect(function(player)
        local notifi = Notification.new("success", "Player Joined", player.Name.." has joined")
        notifi:deleteTimeout(1.5)
    end)
end)

local MyButton = LeftGroupBox:AddButton('Player leave notification', function()
    game.Players.PlayerRemoving:Connect(function(player)
        local notif = Notification.new("warning", "Player Left", player.Name.." has left")
        notif:deleteTimeout(1.5)
    end)
end)

local MyButton = LeftGroupBox:AddButton('Owner kick', function()
    game.Players.PlayerAdded:Connect(function(player)
        if player.UserId == ownerId then
            game.Players.LocalPlayer:Kick("Owner Joined")
        end
    end)
end)

local MyButton = LeftGroupBox:AddButton('enable shiftlock', function()
    game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
end)

LeftGroupBox1:AddSlider('Jump', {
    Text = 'JumpPower',
    Default = 20,
    Min = 0,
    Max = 250,
    Rounding = 1,
    Compact = false,
})

Options.Jump:OnChanged(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Options.Jump.Value
end)

local TargetWalkspeed
LeftGroupBox1:AddSlider('Walk', {
    Text = 'WalkSpeed',
    Default = 0,
    Min = 0,
    Max = 250,
    Rounding = 1,
    Compact = false,
})

Options.Walk:OnChanged(function()
    TargetWalkspeed = Options.Walk.Value
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
        end
    end)
end)

LeftGroupBox2:AddSlider('Brightness', {
    Text = 'Brightness',
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
})

Options.Brightness:OnChanged(function()
    game.Lighting.Brightness = Options.Brightness.Value
end)

LeftGroupBox2:AddSlider('Clocktime', {
    Text = 'Clocktime',
    Default = 12,
    Min = 0,
    Max = 24,
    Rounding = 1,
    Compact = false,
})

Options.Clocktime:OnChanged(function()
    game.Lighting.ClockTime = Options.Clocktime.Value
end)

LeftGroupBox2:AddSlider('Gravity', {
    Text = 'Gravity',
    Default = 196,
    Min = 0,
    Max = 196,
    Rounding = 1,
    Compact = false,
})

Options.Gravity:OnChanged(function()
    Game.Workspace.Gravity = Options.Gravity.Value
end)


LeftGroupBox2:AddSlider('Fov', {
    Text = 'Fov',
    Default = 70,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Compact = false,
})

Options.Fov:OnChanged(function()
    game:GetService'Workspace'.Camera.FieldOfView = Options.Fov.Value
end)

--settings
Library:SetWatermark('Better Roblox+')
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

end
local function chattedEvent(player)
    player.Chatted:Connect(function(msg)
        if string.lower(msg) == "+" then
            PlayerChatted(player)
        end
    end)
end

for _,player in pairs(Players:GetChildren()) do
    chattedEvent(player)
end
