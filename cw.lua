local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local localplayer = game:GetService("Players").PlayerCharacters.LocalPlayer
local getup = true

local Window = Library:CreateWindow({
    Title = '[Combat warriors] atomic v0.01 by hydra#8270',
    Center = false, 
    AutoShow = true,
})

local Tabs = {
    Legit = Window:AddTab('Legit'), 
    Rage = Window:AddTab('Rage'),
    Player = Window:AddTab('Player'),
    Misc = Window:AddTab('Misc'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Player = Tabs.Misc:AddLeftGroupbox('Player')

Player:AddToggle('getup', {
    Text = 'Auto unragdoll',
    Default = false,
    Tooltip = 'Auto unragdolls your localPlayer',
})

Toggles.getup:OnChanged(function()
    getup = Toggles.getup.Value
end)

if getup == true then
    local A_1 = false
    local Event = localplayer.Humanoid.RagdollRemoteEvent
    Event:FireServer(A_1)
end

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