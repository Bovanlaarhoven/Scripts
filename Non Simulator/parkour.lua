for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

local getupvalue = (getupvalue or debug.getupvalue);
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end;

repeat wait() until game:IsLoaded();
local main = getupvalue(getsenv(game:GetService("Players").LocalPlayer.Backpack.Main).resetAmmo, 1)
local players = game:GetService("Players");
local lplr = players.LocalPlayer;
local variables, mainEnv, encrypt;
local runservice = game:GetService("RunService");

do
    local banRemotes = {
        "FireToDieInstantly";
        "LoadString";
        "FlyRequest";
        "FinishTimeTrial";
        "UpdateDunceList";
        "FF";
        "okbye";
        "Fling";
        "ClientFling";
        "LCombo";
        "SubmitCombo";
        "GetCurrentCombo";
        "MaxCombo";
        "UpdateCombo";
    }

    local hook
    hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        if (method == "FireServer" and table.find(banRemotes, self.Name)) then
            return
        end
        return hook(self, unpack(args))
    end))

    local old
    old = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if (key == "PlaybackLoudness" and getfenv(2).script.Name == "RadioScript") then
            return 0;
        end

        return old(self, key);
    end))
    
    local function onCharacterAdded(char)
        if (not char)  then return end
        wait(1)
        local Main = lplr.Backpack:WaitForChild("Main")
        variables = getupvalue(getsenv(Main).charJump, 1)
        variables.adminLevel = 13
        getfenv().script = Main
        mainEnv = getsenv(Main)
        encrypt = function(string)
            local _, res = pcall(mainEnv.encrypt, string)
            return res
        end
    end
    onCharacterAdded(lplr.Character);
    lplr.CharacterAdded:Connect(onCharacterAdded);
end

local moves = {
    "slide";
    "dropdown";
    "ledgegrab";
    "edgejump";
    "longjump";
    "vault";
    "wallrun";
    "springboard";
}

local Settings = {
    autofarm = false,
    autocombo = false,
    combolvl = 1,
    Nofall = false,
    Slidespeed = false,
    slidevalue = 1,
}

task.spawn(function()
    while task.wait() do
        if Settings.autocombo then
            main.comboLevel = Settings.combolvl    
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.Slidespeed then
            main.slidespeed = Settings.slidevalue
        end
    end
end)


local Nofall
Nofall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if (method == "TakeDamage" and self.ClassName == "Humanoid") and Settings.Nofall then
        return
    end
    return Nofall(self, unpack(args))
end))

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Parkour',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('QOL')

LeftGroupBox:AddToggle('ComboToggle', {
    Text = 'Combo',
    Default = false,
    Tooltip = 'Toggles the combo feature',
})

Toggles.ComboToggle:OnChanged(function()
    Settings.autocombo = Toggles.ComboToggle.Value
end)

LeftGroupBox:AddSlider('Combo', {
    Text = 'Combo lvl',
    Default = 1,
    Min = 0,
    Max = 5,
    Rounding = 0,
    Compact = false,
})

Options.Combo:OnChanged(function()
    Settings.combolvl = Options.Combo.Value
end)

LeftGroupBox:AddToggle('Nofall', {
    Text = 'No fall',
    Default = false,
    Tooltip = 'Toggles the No fall feature',
})

Toggles.Nofall:OnChanged(function()
    Settings.Nofall = Toggles.Nofall.Value
end)

LeftGroupBox:AddToggle('slideToggle', {
    Text = 'Slide speed',
    Default = false,
    Tooltip = 'toggles slide speed feature',
})

Toggles.slideToggle:OnChanged(function()
    Settings.Slidespeed = Toggles.slideToggle.Value
end)

LeftGroupBox:AddSlider('slideValue', {
    Text = 'slide speed value',
    Default = 0,
    Min = 0,
    Max = 1000,
    Rounding = 0,
    Compact = false,
})

Options.slideValue:OnChanged(function()
    Settings.slidevalue = Options.slideValue.Value
end)

LeftGroupBox:AddLabel('Reset Ammo'):AddKeyPicker('ammoreset', {
    Default = 'F',  
    SyncToggleState = false, 
    Mode = 'Hold',
    Text = 'Reset Ammo',
    NoUI = false,
})

task.spawn(function()
    while true do
        local state = Options.ammoreset:GetState()
        if state then
            lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            wait()
            lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Seated")
        end
        if Library.Unloaded then break end
    end
end)

--Misc tab--

local LeftGroupBox1 = Tabs.Misc:AddLeftGroupbox('Settings')

LeftGroupBox1:AddToggle('KeybindShow', {
    Text = 'Keybind Frame',
    Default = false,
    Tooltip = 'makes the keybind frame visible/invisible', 
})

Toggles.KeybindShow:OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.KeybindShow.Value
end)

--settings
Library:SetWatermark('Parkour By Hydra#8270')

Library:OnUnload(function()
    Library.Unloaded = true
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