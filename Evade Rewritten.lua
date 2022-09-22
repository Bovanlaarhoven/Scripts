game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
wait()
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
    Title = 'Evade V3',
    Center = true, 
    AutoShow = true,
})

local MainTab = {
    Main = Window:AddTab('Main Features'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
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
    Text = 'Respawn Keybind (Hold To work)',
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

local MyButton = Buttons:AddButton('Chat Spy', function()
    enabled = true
    spyOnMyself = false
    public = false
    publicItalics = true
    privateProperties = {
        Color = Color3.fromRGB(0,255,255); 
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    }
    local StarterGui = game:GetService("StarterGui")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
    local instance = (_G.chatSpyInstance or 0) + 1
    _G.chatSpyInstance = instance
    
    local function onChatted(p,msg)
        if _G.chatSpyInstance == instance then
            if p==player and msg:lower():sub(1,4)=="/spy" then
                enabled = not enabled
                wait(0.3)
                privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
                StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
            elseif enabled and (spyOnMyself==true or p~=player) then
                msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
                local hidden = true
                local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                    if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
                        hidden = false
                    end
                end)
                wait(1)
                conn:Disconnect()
                if hidden and enabled then
                    if public then
                        saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
                    else
                        privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                    end
                end
            end
        end
    end
    
    for _,p in ipairs(Players:GetPlayers()) do
        p.Chatted:Connect(function(msg) onChatted(p,msg) end)
    end
    Players.PlayerAdded:Connect(function(p)
        p.Chatted:Connect(function(msg) onChatted(p,msg) end)
    end)
    privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
    StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
    local chatFrame = player.PlayerGui.Chat.Frame
    chatFrame.ChatChannelParentFrame.Visible = true
    chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
    OrionLib:MakeNotification({
        Name = "Hydra Network",
        Content = "Pressed on the Chat Spy Button",
        Image = "rbxassetid://4483345998",
        Time = 2
    })    
end)

local MyButton = Buttons:AddButton('Player esp', function()
    local c = workspace.CurrentCamera
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local rs = game:GetService("RunService")
local function getdistancefc(part)
    return (part.Position - c.CFrame.Position).Magnitude
end
local function esp(p, cr)
    local h = cr:WaitForChild("Humanoid")
    local hrp = cr:WaitForChild("HumanoidRootPart")
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Color = Color3.fromRGB(255, 255, 255)
    text.Size = 17
    local c1
    local c2
    local c3
    local function dc()
        text.Visible = false
        text:Remove()
        if c1 then
            c1:Disconnect()
            c1 = nil
        end
        if c2 then
            c2:Disconnect()
            c2 = nil
        end
        if c3 then
            c3:Disconnect()
            c3 = nil
        end
    end
    c2 =
        cr.AncestryChanged:Connect(
        function(_, parent)
            if not parent then
                dc()
            end
        end
    )
    c3 =
        h.HealthChanged:Connect(
        function(v)
            if (v <= 0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
                dc()
            end
        end
    )
    c1 =
        rs.RenderStepped:Connect(
        function()
            local hrp_pos, hrp_os = c:WorldToViewportPoint(hrp.Position)
            if hrp_os then
                text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
                text.Text = p.Name .. " (" .. tostring(math.floor(getdistancefc(hrp))) .. " m)"
                text.Visible = true
            else
                text.Visible = false
            end
        end
    )
end
local function p_added(p)
    if p.Character then
        esp(p, p.Character)
    end
    p.CharacterAdded:Connect(
        function(cr)
            esp(p, cr)
        end
    )
end
for i, p in next, ps:GetPlayers() do
    if p ~= lp then
        p_added(p)
    end
end
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

--ui settings

local MenuGroup = MainTab['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'P', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(MainTab['UI Settings']) 
ThemeManager:ApplyToTab(MainTab['UI Settings'])