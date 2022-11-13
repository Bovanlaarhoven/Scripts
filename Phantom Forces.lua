local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local enabled = true
local highlight = Instance.new("Highlight")
local plr = game:GetService("Players").LocalPlayer
local players = game:GetService("Players")

local Window = Library:CreateWindow({
    Title = '[Phantom Forces] atomic V0.01 By hydra#8270',
    Center = false, 
    AutoShow = true,
})

local Tabs = {
    Legit = Window:AddTab('Legit'), 
    Rage = Window:AddTab('Rage'),
    Misc = Window:AddTab('Misc'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local ESP = Tabs.Legit:AddLeftGroupbox('ESP')

ESP:AddToggle('ESP', {
    Text = 'ESP',
    Default = false,
    Tooltip = 'Toggle to Toggle/Untoggle ESP',
})

Toggles.ESP:OnChanged(function()
    enabled = Toggles.ESP.Value
end)

if enabled then
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        local highlightclone = highlight:Clone()
        highlightclone.Adornee = v.Character
        highlightclone.Parent = v.Character
        highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

players.PlayerAdded:Connect(function()
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        local highlightclone = highlight:Clone()
        highlightclone.Adornee = v.Character
        highlightclone.Parent = v.Character
        highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end)

players.PlayerRemoving:Connect(function(playerRemoved)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v == playerRemoved then
            v.Character:FindFirstChildOfClass("Highlight"):Destroy()
        end
    end
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
