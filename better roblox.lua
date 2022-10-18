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
        if string.lower(msg) == "better roblox" or "Better roblox" or "Better Roblox" or "btr" or "+"then
            PlayerChatted(player)
        end
    end)
end

for _,player in pairs(Players:GetChildren()) do
    chattedEvent(player)
end
