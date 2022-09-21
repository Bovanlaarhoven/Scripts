game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local WorkspacePlayers = game:GetService("Workspace").Game.Players
local Players = game:GetService('Players')
local localplayer = Players.LocalPlayer
local GuiService = game:GetService("GuiService")
local Light = game:GetService("Lighting")
Library:SetWatermarkVisibility(true)
Library:SetWatermark('Hydra Network')

getgenv().money = true
getgenv().revivedie = true
getgenv().autowistle = true
getgenv().autochat = true
getgenv().autofarm = true
getgenv().AutoDrink = true
getgenv().NoCameraShake = true
getgenv().Settings = {
    moneyfarm = false,
    afkfarm = false,
    NoCameraShake = false,
    Downedplayeresp = false,
    AutoRespawn = false,
    Speed = 1450,
    Jump = 3,
    reviveTime = 3,
}

local FindAI = function()
    for _,v in pairs(WorkspacePlayers:GetChildren()) do
        if not Players:FindFirstChild(v.Name) then
            return v
        end
    end
end

local GetDownedPlr = function()
    for i,v in pairs(WorkspacePlayers:GetChildren()) do
        if v:GetAttribute("Downed") then
            return v
        end
    end
end

local revive = function()
    local downedplr = GetDownedPlr()
    if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
        task.spawn(function()
            while task.wait() do
                if localplayer.Character then
                    workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
                    localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
                    task.wait()
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false)
                    task.wait(4.5)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    break
                end
            end
        end)
    end
end

task.spawn(function()
    while task.wait() do
        if Settings.AutoRespawn then
             if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
             end
        end

        if Settings.NoCameraShake then
            localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
        end
        if Settings.moneyfarm then
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                task.wait(3)
            else
                revive()
                task.wait(1)
            end
        end
        if Settings.moneyfarm == false and Settings.afkfarm and localplayer.Character:FindFirstChild('HumanoidRootPart') ~= nil then
            localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(6007, 7005, 8005)
        end
    end
end)

function camerashake()
    while NoCameraShake == true do task.wait()
        localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
    end
end

function autodrink()
	while AutoDrink == true do
		local ohString1 = "Cola"
		game:GetService("ReplicatedStorage").Events.UseUsable:FireServer(ohString1)
		wait(6)
	end
end

function functionautofarm()
    while autofarm == true do task.wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(3080.2978515625, -800.8651733398438, 16.78089714050293)
    end
end

function SpamChat()
    while autochat == true do
        local ohString1 = "Hydra Network on top"
        local ohString2 = "All"
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
        wait(1)
    end
end

function autowistlefunction()
    while autowistle == true do
        local ohString1 = "Whistle"
        local ohBoolean2 = true
        game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
        game:GetService("ReplicatedStorage").Events.Whistle:FireServer()
        wait(5)
    end
end

function god()
    while revivedie == true do
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
        wait()
    end
end

local Window = Library:CreateWindow({
    Title = 'Hydra Network |Evade',
    Center = true, 
    AutoShow = true,
})

local MainTab = {
    Main = Window:AddTab('Main Features'), 
}

local AutoFarms = MainTab.Main:AddLeftGroupbox('Auto Farms')
local Modifiers = MainTab.Main:AddLeftGroupbox('Modifiers')
local Keybinds = MainTab.Main:AddLeftGroupbox('Keybinds')
local Buttons = MainTab.Main:AddRightGroupbox('Buttons')

--tabs
AutoFarms:AddToggle('MoneyFarm', {
    Text = 'Money Farm',
    Default = false,
    Tooltip = 'Auto Revives Players',
})

AutoFarms:AddToggle('AfkFarm', {
    Text = 'Afk Farm',
    Default = false,
    Tooltip = 'Afks outside the map',
})

--toggles
Toggles.MoneyFarm:OnChanged(function(Value)
    Settings.moneyfarm = Value
end)

Toggles.AfkFarm:OnChanged(function(Value)
    Settings.afkfarm = Value
end)

--sliders
local TargetWalkspeed
Modifiers:AddSlider('Speed', {
    Text = 'Speed slider',
    Default = 0,
    Min = 0,
    Max = 250,
    Rounding = 1,
    Compact = false,
})

Options.Speed:OnChanged(function()
    TargetWalkspeed = Options.Speed.Value
end)

Modifiers:AddSlider('jump', {
    Text = 'Jump slider',
    Default = 3,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Compact = false,
})
Options.jump:OnChanged(function()
    Settings.Jump = Options.jump.Value
end)

Modifiers:AddSlider('Time', {
    Text = 'Time slider',
    Default = 14,
    Min = 0,
    Max = 24,
    Rounding = 1,
    Compact = false,
})
Options.Time:OnChanged(function()
    game.Lighting.ClockTime = Options.Time.Value
end)

--keybinds

Keybinds:AddLabel('Respawn'):AddKeyPicker('Respawn', {
    Default = 'R',
    SyncToggleState = false, 
    Mode = 'Hold',
    Text = 'Respawn Keybind',
    NoUI = false,
})

Options.Respawn:OnClick(function()
     Respawn:GetState()
end)

task.spawn(function()
    while true do
        wait(1)
        local state = Options.Respawn:GetState()
        if state then
            game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
        end
        if Library.Unloaded then break end
    end
end)

--buttons

local MyButton = Buttons:AddButton('Test Emote Giver', function()
    game:GetService("ReplicatedStorage").Events.UI.Purchase:InvokeServer("Emotes", "Test")
end)

--others

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
        end
    end)
end)

local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local Args = {...}
    local method = getnamecallmethod()
    if tostring(self) == 'Communicator' and method == "InvokeServer" and Args[1] == "update" then
        return Settings.Speed, Settings.Jump 
    end
    return old(self,...)
end))