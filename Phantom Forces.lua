local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
getgenv().enabled = false
getgenv().OutlineColor = Color3.fromRGB(255, 255, 255)
getgenv().FillColor = Color3.fromRGB(255, 255, 255)
getgenv().FillTransparency = 1
getgenv().OutlineTransparency = 1

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

ESP:AddLabel('Fill Color'):AddColorPicker('FillColor', {
    Default = Color3.new(0, 1, 0),
    Title = 'Some color',
})

Options.FillColor:OnChanged(function()
    FillColor = Options.FillColor.Value
end)

ESP:AddLabel('Outline Color'):AddColorPicker('OutlineColor', {
    Default = Color3.new(0, 1, 0),
    Title = 'Some color',
})

Options.OutlineColor:OnChanged(function()
    OutlineColor = Options.OutlineColor.Value
end)

pcall(
    function()
        local a = Instance.new("Highlight")
        game:GetService("RunService").RenderStepped:Connect(
            function()
                for b, c in pairs(game:GetService("Players"):GetPlayers()) do
                    if not c.Character:FindFirstChild("Highlight") then
                        a.FillTransparency = 1
                        a:Clone().Parent = c.Character
                        a.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                    game.Players.PlayerAdded:Connect(
                        function(d)
                            d.CharacterAdded:Connect(
                                function(e)
                                    if not e:FindFirstChild("Highlight") then
                                        a.FillTransparency = 1
                                        a:Clone().Parent = e
                                        a.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    end
                                end
                            )
                        end
                    )
                end
                for b, c in pairs(game.Players:GetPlayers()) do
                    local f = c.Character:FindFirstChild("Highlight")
                    f.Enabled = enabled
                    f.OutlineColor = OutlineColor
                    f.FillColor = FillColor
                    f.OutlineTransparency = OutlineTransparency
                    f.FillTransparency = FillTransparency
                end
            end
        )
    end
)

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
