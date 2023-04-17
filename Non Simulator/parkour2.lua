for _, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
    v:Disable()
end

for _, v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
    v:Disable()
end

local getupvalue = (getupvalue or debug.getupvalue)
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end
local Request = (syn and syn.request or request or http and http.request or http_request) or error("No request function")
local Time = os.clock()

repeat wait() until game:IsLoaded()
local Tablefind = table.find
local players = game:GetService("Players")
local lplr = players.LocalPlayer
local encrypt
local camera = workspace.CurrentCamera
local runservice = game:GetService("RunService")

do
    local Remotes = {
        "FireToDieInstantly",
        "LoadString",
        "FlyRequest",
        "FinishTimeTrial",
        "UpdateDunceList",
        "FF",
        "okbye",
        "Fling",
        "ClientFling",
        "LCombo",
        "SubmitCombo",
        "GetCurrentCombo",
        "MaxCombo",
        "UpdateCombo",
        "SetTrail",
        "InsertTrail",
    }

    local hook
    hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if (method == "FireServer" and Tablefind(Remotes, self.Name)) then
            return
        end
        if (method == "InvokeServer" and Tablefind(Remotes, self.Name)) then
            return
        end
        return hook(self, unpack(args))
    end))
    
    local function onCharacterAdded(char)
        if (not char) then
            return
        end
        wait(1)
        local Main = lplr.Backpack:WaitForChild("Main")
        main = getupvalue(getsenv(lplr.Backpack:WaitForChild("Main")).resetAmmo, 1)
        getsenv(Main).adminLevel = 13
        getfenv().script = Main
        encrypt = function(string)
            local _, v = pcall(getsenv(Main).encrypt, string)
            return v
        end
    end
    
    onCharacterAdded(lplr.Character)
    lplr.CharacterAdded:Connect(onCharacterAdded)
end

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Settings = {
    autocombo = false,
    combolvl = 1,
    Nofall = false,
    Slidespeed = false,
    slidevalue = 1,
    chargecooldown = false,
    infwallboost = false,
    infwallrun = false,
    trickpass = false,
    reset = false,
    resetvalue = 10000,
    flow = false,
    stimeject = false,
    autoquest = false,
    infglidestamina = false,
    infmagrail = false,
    walkspeedvalue = 1,
    walkspeedtoggle = false,
    infdrink = false,
    AntiComboSubtract = false,
    AntiComboHealth = false,
    RemoveHardfall = false,
    alwaysgliding = false,
    Esp = false,
    EspDistance = 1000,
    UseColor = false,
    autroll = false,
}

local foundSupportedFolder = false

local Support = {
    general29 = false,
    general11 = false,
    general9 = false,
    general17 = false,
    general41 = false,
    general4 = false,
    general16 = false,
    general13 = false,
    general45 = false,
    general1 = false,
    general23 =false,
    general54 = false,
}

local SupportedMission = {
    general29 = function()
        if Support.general29 then
            Library:Notify("Doing: Break a leg", 5)
            for i = 1, 15 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("landms", math.random(50, 75))
             end
        end
    end,
    general11 = function()
        if Support.general11 then
            Library:Notify("Doing: Dropper", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("damage", 0, 85)
        end
    end,
    general9 = function()
        if Support.general9 then
            Library:Notify("Doing: Quick fingers", 5)
            for i = 1, 15 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("boost", math.random(50.1, 85))
            end
        end
    end,
    general17 = function()
        if Support.general17 then
            Library:Notify("Doing: Boost master", 5)
            for i = 1,55 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("boost", 100)
            end
        end
    end,
    general41 = function()
        if Support.general41 then
            Library:Notify("Doing: Luck landing", 5)
            for i = 1,30 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("pLand")
            end
        end
    end,
    general4 = function()
        if Support.general4 then
            Library:Notify("Doing: Combo Legend", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("combobreak", 5, 5)
        end
    end,
    general16 = function()
        if Support.general16 then
            Library:Notify("Doing: Push your limits", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("general16", 8)
        end
    end,
    general13 = function()
        if Support.general13 then
            Library:Notify("Doing: Highrider", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("zipline", math.random(850 ,1000))
        end
    end,
    general45 = function()
        if Support.general45 then
            Library:Notify("Doing: Lax to Chi", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("general45")
        end
    end,
    general1 = function()
        if Support.general1 then
            Library:Notify("Doing: Combo Breaker", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("combobreak", 2, 2)
        end
    end,
    general23 = function()
        if Support.general23 then
            Library:Notify("Doing: Vaultist", 5)
            for i = 1, 105 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("vault")
            end
        end
    end,
    general54 = function()
        if Support.general54 then
            Library:Notify("Doing: Deep n Damp", 5)
            for i = 1, 255 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("dampen")
            end
        end
    end,
}

local function reset()
    for _,v in pairs(game:GetService("ReplicatedStorage").PlayerRuntimeData[lplr.Name]:GetDescendants()) do
        if v.Name ~= Support[v.Name] then
            game:GetService("ReplicatedStorage").MissionReroll:FireServer(v.Name)
            wait()
        end
    end
end

local Window = Library:CreateWindow({
    Title = 'Parkour',
    Center = false,
    AutoShow = true,
    TabPadding = 4,
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Player = Tabs.Main:AddLeftGroupbox('Player')
local Remove = Tabs.Main:AddLeftGroupbox('Remove')
local Exp = Tabs.Main:AddRightGroupbox('Exp')
local Inf = Tabs.Main:AddRightGroupbox('inf')
local Combo = Tabs.Main:AddRightGroupbox('Combo')
local Other = Tabs.Main:AddLeftGroupbox('Other')
local Visuals = Tabs.Visuals:AddLeftGroupbox('Bag Esp')






Library:SetWatermark('Parkour script By Hydra#8270')

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