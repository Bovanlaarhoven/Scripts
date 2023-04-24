local getupvalue = (getupvalue or debug.getupvalue)
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end
local Request = (syn and syn.request or request or http and http.request or http_request) or error("No request function")
local Tablefind = table.find
local players = game:GetService("Players")
local lplr = players.LocalPlayer
local camera = workspace.CurrentCamera
local runservice = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainEvent = ReplicatedStorage.MainEvent

local Remotes = {
   "CHECKER_1",
   "TeleportDetect",
   "OneMoreTime"
}

local namecall
namecall = hookmetamethod(game, "__namecall", function(...)
   local args = {...}
   local method = getnamecallmethod()
   local self = args[1]
   if not checkcaller() and (method == "FireServer" and self == MainEvent and Tablefind(Remotes, args[2])) then
      return
   end
   return namecall(...)
end)

local __newindex
__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
        return
    end
    return __newindex(t, k, v)
end)

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Script by Hydra#8270',
    Center = true,
    AutoShow = true,
    TabPadding = 4
})

local Tabs = {
   Legut = Window:AddTab('Legit'),
   Rage = Window:AddTab('Rage'),
   Players = Window:AddTab('Players'),
   Visuals = Window:AddTab('Visuals'),
   Misc = Window:AddTab('Misc'),
   Settings = Window:AddTab('Settings'),
   Config = Window:AddTab('Config'),
   ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Aiming = Tabs.Main:AddLeftGroupbox('Aiming')
local AimVisuals = Tabs.Main:AddLeftGroupbox('Aim Visuals')


Library:SetWatermark('Script By Hydra#8270')

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

local MyButton = MenuGroup:AddButton({
    Text = 'Join Discord',
    Func = function()
        Request(
            {
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["origin"] = "https://discord.com",
                },
                Body = game:GetService("HttpService"):JSONEncode(
                    {
                        ["args"] = {
                            ["code"] = "YvwEyH2W6t",
                        },
                        ["cmd"] = "INVITE_BROWSER",
                        ["nonce"] = "."
                    })
            })
    end,
    DoubleClick = false,
    Tooltip = 'makes you join the discord server'
})



Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])