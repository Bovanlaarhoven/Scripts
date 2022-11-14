local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local time1 = 1
getgenv().getup = false
getgenv().InfParry = false
getgenv().InfStamina = false

local Window = Library:CreateWindow({
    Title = '[Combat warriors] atomic v0.01 by hydra#8270',
    Center = false, 
    AutoShow = true,
})

local Tabs = {
    Pvp = Window:AddTab('PvP'), 
    Player = Window:AddTab('Player'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Player = Tabs.Player:AddLeftGroupbox('Player')
local Cooldown = Tabs.Player:AddRightGroupbox('Cooldown')

Player:AddToggle('getup', {
    Text = 'Auto unragdoll',
    Default = false,
    Tooltip = 'Auto unragdolls your localPlayer',
})

Cooldown:AddSlider('CoolDown', {
    Text = 'Unragdoll Cooldown',
    Default = 0,
    Min = 0,
    Max = 2,
    Rounding = 1,

    Compact = false,
})

Player:AddToggle('InfParry', {
    Text = 'Infinite Parry',
    Default = false,
    Tooltip = 'Parry with no cooldown',
})

Player:AddToggle('InfStamina', {
    Text = 'Infinite Stamina',
    Default = false,
    Tooltip = 'infinte stamina',
})

Toggles.InfStamina:OnChanged(function()
    InfStamina = Toggles.InfStamina.Value
end)

Toggles.InfParry:OnChanged(function()
    InfParry = Toggles.InfParry.Value
end)

Options.CoolDown:OnChanged(function()
    time1 = Options.CoolDown.Value
end)

Toggles.getup:OnChanged(function()
    getup = Toggles.getup.Value
end)

task.spawn(function()
    while task.wait(time1) do
        if getup == true then
            local A_1 = false
            local Event = game:GetService("Workspace").PlayerCharacters.fksdjhfskjhf.Humanoid.RagdollRemoteEvent
            Event:FireServer(A_1)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        for i,v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "PARRY_COOLDOWN_IN_SECONDS") and rawget(v, "PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY") then
                if InfParry == true then
                    v.PARRY_COOLDOWN_IN_SECONDS = 0
                    v.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY = 0
                else
                    v.PARRY_COOLDOWN_IN_SECONDS = 3
                    v.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY = 0.33
                end
            end
        end
    end
end)


for i,v in getgc((true)) do
    if typeof(v) == "table" and rawget(v, "_setStamina") then
        local old = v._setStamina
        v._setStamina = function(sta, mina)
            if InfStamina == true then
                sta._stamina = math.huge
                sta._staminaChangedSignal:Fire(150)
            else
                return old(sta, mina)
            end
        end
    end
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