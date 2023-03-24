for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

local getupvalue = (getupvalue or debug.getupvalue);
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end;
local Time = os.clock()

repeat wait() until game:IsLoaded();
local players = game:GetService("Players");
local lplr = players.LocalPlayer;
local variables, mainEnv, encrypt;
local camera = workspace.CurrentCamera;
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
        "SetTrail";
        "InsertTrail";
    }

    local hook
    hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if (method == "FireServer" and table.find(banRemotes, self.Name)) then
            return
        end
        if (method == "InvokeServer" and table.find(banRemotes, self.Name)) then
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
        main = getupvalue(getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).resetAmmo, 1)
        encrypt = function(string)
            local _, res = pcall(mainEnv.encrypt, string)
            return res
        end
    end
    onCharacterAdded(lplr.Character);
    lplr.CharacterAdded:Connect(onCharacterAdded);
end

local Settings = {
    autofarm = false,
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
            for i = 1, 15 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("landms", math.random(50, 75))
             end
        end
    end,
    general11 = function()
        if Support.general11 then
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("damage", 0, 85)
        end
    end,
    general9 = function()
        if Support.general9 then
            for i = 1, 15 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("boost", math.random(50.1, 85))
            end
        end
    end,
    general17 = function()
        if Support.general17 then
            for i = 1,55 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("boost", 100)
            end
        end
    end,
    general41 = function()
        if Support.general41 then
            for i = 1,30 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("pLand")
            end
        end
    end,
    general4 = function()
        if Support.general4 then
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("combobreak", 5, 5)
        end
    end,
    general16 = function()
        if Support.general16 then
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("general16", 8)
        end
    end,
    general13 = function()
        if Support.general13 then
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("zipline", math.random(850 ,1000))
        end
    end,
    general45 = function()
        if Support.general45 then
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("general45")
        end
    end,
    general1 = function()
        if Support.general1 then
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("combobreak", 2, 2)
        end
    end,
    general23 = function()
        if Support.general23 then
            for i = 1, 105 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("vault")
            end
        end
    end,
    general54 = function()
        if Support.general54 then
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
            task.wait(0.1)
        end
    end
end

task.defer(function()
    while task.wait() do
        if Settings.flow then
            main.flowActive = true
            main.flowAlpha = 100
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.reset then
            if lplr.leaderstats.Points.Value >= Settings.resetvalue then
                game:GetService("ReplicatedStorage").Reset:InvokeServer()
            end
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.trickpass then
            main.hasTricksPass = Settings.trickpass
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.alwaysgliding then
            main.gliding = Settings.alwaysgliding
        end
    end
end)


task.defer(function()
    while task.wait() do
        if Settings.infwallboost then
            main.numWallclimb = math.huge
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.RemoveHardfall then
            main.landinghard = false
            main.landing4s = false
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.infdrink then
            main.lastDrink = 0
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.infmagrail then
            main.lastMagSlap = 0
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.infwallrun then
            main.numWallrun = math.huge
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.autocombo then
            main.comboLevel = Settings.combolvl
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.Slidespeed then
            main.slidespeed = Settings.slidevalue
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.walkspeedtoggle then
            main.walkspeedMult = Settings.walkspeedvalue
        elseif not Settings.walkspeedtoggle then
            main.walkspeedMult = 1
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.AntiComboHealth then
            main.comboHealth = math.huge
            main.extendeddrop = false
        else
            local originalValue = main.comboHealth
            main.comboHealth = originalValue
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.autroll then
            main.landRolling = true
        else
            main.landRolling = false
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.AntiComboSubtract then
            local originalValue = main.comboXp
            local newValue = main.comboXp
            main.timeBelowSpeed = 0
            main.timeStopped = 0
            main.timeSlow = 0
            if newValue >= originalValue then
                main.comboXp = newValue
            end
        else
            local originalValue = main.comboXp
            main.comboXp = originalValue
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.chargecooldown then
            main.chargeCooldown = 0
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.infglidestamina then
            main.glideStamina = math.huge
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.autoquest then
            for _,v in pairs(game:GetService("ReplicatedStorage").PlayerRuntimeData[lplr.Name]:GetDescendants()) do
                if v.ClassName == "Folder" and Support[v.name] ~= nil then
                    Support[v.name] = true
                    SupportedMission[v.name]()
                    repeat task.wait() until not v:FindFirstChild("DisplayName")
                        foundSupportedFolder = false
                end
            end
            if not foundSupportedFolder then
                reset()
            end
        elseif not Settings.autoquest then
            foundSupportedFolder = false
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

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Parkour",
    LoadingTitle = "Hydra Network",
    LoadingSubtitle = "by Hydra#8270",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "YvwEyH2W6t",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "Hello"
    }
})

local T1 = Window:CreateTab("Player", 4483362458)
local T2 = Window:CreateTab("Remove", 4483362458)
local T3 = Window:CreateTab("Exp", 4483362458)
local T4 = Window:CreateTab("Inf", 4483362458)
local T5 = Window:CreateTab("Combo", 4483362458)
local T6 = Window:CreateTab("Bag Esp", 4483362458)
local T7 = Window:CreateTab("Other", 4483362458)

local Toggle = T1:CreateToggle({
    Name = "Slidespeed",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.Slidespeed = Value
    end,
})

local Slider = T1:CreateSlider({
    Name = "SlideSpeed Value",
    Range = {34, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 34,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.slidevalue = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "WalkSpeed",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.walkspeedtoggle = Value
    end,
})

local Slider = T1:CreateSlider({
    Name = "WalkSpeed Value",
    Range = {1, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 1,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.walkspeedvalue = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "freerunnning pass",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.trickpass = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Always Glide",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.alwaysgliding = Value
    end,
})

local Keybind = T1:CreateKeybind({
    Name = "Reset Ammo",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "Keybind1",
    Callback = function(Keybind)
        if Keybind then
            getsenv(lplr.Backpack:WaitForChild("Main")).resetAmmo()
        end
    end,
})

local Toggle = T2:CreateToggle({
    Name = "Remove Fall Damage",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.Nofall = Value
    end,
})

local Toggle = T2:CreateToggle({
    Name = "Remove Hard Landing Slowdown",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.RemoveHardfall = Value
    end,
})

local Toggle = T2:CreateToggle({
    Name = "Remove Charge cooldown",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.chargecooldown = Value
    end,
})

local Toggle = T2:CreateToggle({
    Name = "Remove Drink cooldown",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.infdrink = Value
    end,
})

local Toggle = T2:CreateToggle({
    Name = "Remove Fall Animation",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.autroll = Value
    end,
})

local moves = {"dropdown","longjump"}

local Button = T3:CreateButton({
    Name = "Auto Farm",
    Callback = function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if lplr.PlayerScripts:FindFirstChild("Points") and getsenv(lplr.Backpack.Main) then
                local points = getsenv(lplr.PlayerScripts.Points);
                points.changeParkourRemoteParent(workspace);
                local Remote = getupvalue(points.changeParkourRemoteParent, 2);
        
                Remote:FireServer(encrypt("longjump"), {[encrypt("combo")] = encrypt(tostring(5))})
                Remote:FireServer(encrypt("dropdown"), {[encrypt("combo")] = encrypt(tostring(5))})
                Remote:FireServer(encrypt(moves[#moves]), {[encrypt("combo")] = encrypt(tostring(1.7976931348623157e+308))})
            end
        end)
    end,
})

local Toggle = T3:CreateToggle({
    Name = "Auto Turn-in Points",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.reset = Value
    end,
})

local Slider = T3:CreateSlider({
    Name = "Points Value",
    Range = {10000, 10000000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10000,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.slidevalue = Value
    end,
})

local Toggle = T3:CreateToggle({
    Name = "Flow",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.flow = Value
    end,
})

local Toggle = T3:CreateToggle({
    Name = "Auto Mission",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.autoquest = Value
    end,
})

local Toggle = T4:CreateToggle({
    Name = "Inf Wallboost",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.infwallboost = Value
    end,
})

local Toggle = T4:CreateToggle({
    Name = "Inf Wallrun",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.infwallrun = Value
    end,
})

local Toggle = T4:CreateToggle({
    Name = "Inf Magrail",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.Magrail = Value
    end,
})

local Toggle = T4:CreateToggle({
    Name = "Inf Glide Stamina",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.glideStamina = Value
    end,
})

local Toggle = T5:CreateToggle({
    Name = "Combo",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.autocombo = Value
    end,
})

local Slider = T5:CreateSlider({
    Name = "Combo Level",
    Range = {1, 5},
    Increment = 1,
    Suffix = "Level",
    CurrentValue = 1,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.combolvl = Value
    end,
})

local Toggle = T5:CreateToggle({
    Name = "Inf Combo Health",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.AntiComboHealth = Value
    end,
})

local Toggle = T5:CreateToggle({
    Name = "Anti Combo Subtract",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.AntiComboSubtract = Value
    end,
})

local Button = T7:CreateButton({
    Name = "Unlock all spawns",
    Callback = function()
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v.ClassName == "SpawnLocation" then
                lplr.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(1)
            end
        end
    end,
})

local Button = T7:CreateButton({
    Name = "Unlock Badges",
    Callback = function()
        for _, v in next, workspace:GetChildren() do
            if (v.Name ~= "BadgeAwarder" or not lplr.Character) then continue end;
            local part = v:FindFirstChildWhichIsA("Part");
            firetouchinterest(lplr.Character.HumanoidRootPart, part, 1);
            firetouchinterest(lplr.Character.HumanoidRootPart, part, 0);
        end;
    end,
})

local Toggle = T6:CreateToggle({
    Name = "Bag esp",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.Esp = Value
        if Settings.Esp then
            ToggleEsp()
        end
    end,
})

local Slider = T6:CreateSlider({
    Name = "Distance",
    Range = {100, 5000},
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 100,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.EspDistance = Value
    end,
})

local Toggle = T6:CreateToggle({
    Name = "Use color",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.UseColor = Value
    end,
})

local function onCharacterAdded(char)
    if (not char)  then return end
    wait(1)
    local function BagEsp(Object)
        local text = Drawing.new("Text")
        text.Color = Color3.new(1, 1, 1)
        text.OutlineColor = Color3.new(0, 0, 0)
        text.Center = true
        text.Outline = true
        text.Position = Vector2.new(100, 100)
        text.Size = 16
        text.Font = Drawing.Fonts.Monospace
        text.Transparency = .6
    
        local renderstepped
        renderstepped = runservice.RenderStepped:Connect(function()
            local Success, Error = pcall(function()
                if Object and Settings.Esp then
                    if Object ~= nil then
                        local Vector, OnScreen
                        if Object.Name then
                            Vector, OnScreen = camera:WorldToViewportPoint(Object.Position)
                            local distance = (Object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                            if distance <= Settings.EspDistance then
                                local distanceInMeters = distance * 0.282
                                text.Text = string.format("%s\n[%.2f Meters]", Object.Parent.Rarity.Value, distanceInMeters)
                                if Object.Parent:FindFirstChild("Rarity") and Settings.UseColor then
                                    if Object.Parent.Rarity.Value == "Common" then
                                        text.Color = Color3.fromRGB(148, 148, 145)
                                    elseif Object.Parent.Rarity.Value == "Uncommon" then
                                        text.Color = Color3.fromRGB(9, 255, 0)
                                    elseif Object.Parent.Rarity.Value == "Rare" then
                                        text.Color = Color3.fromRGB(179, 0, 255)
                                    elseif Object.Parent.Rarity.Value == "Epic" then
                                        text.Color = Color3.fromRGB(0, 251, 255)
                                    elseif Object.Parent.Rarity.Value == "Legendary" then
                                        text.Color = Color3.fromRGB(255, 255, 0)
                                    elseif Object.Parent.Rarity.Value == "Ultimate" then
                                        text.Color = Color3.fromRGB(255, 0, 255)
                                    elseif Object.Parent.Rarity.Value == "Resplendent" then
                                        text.Color = Color3.fromRGB(255, 0, 0)
                                    end
                                else
                                    text.Color = Color3.new(1, 1, 1)
                                end
                                if OnScreen then
                                    text.Position = Vector2.new(Vector.X, Vector.Y)
                                    text.Visible = true
                                else
                                    text.Visible = false
                                end
                            else
                                text.Visible = false
                            end
                        else
                            text.Visible = false
                        end
                    else
                        text.Visible = false
                        text:Remove()
                        renderstepped:Disconnect()
                    end
                else
                    text.Visible = false
                end
            end)
            if not Success then
                warn(Error)
                text:Remove()
                renderstepped:Disconnect()
            end
        end)
    
        Object.AncestryChanged:Connect(function(_, parent)
            if not parent then
                text:Remove()
                renderstepped:Disconnect()
            end
        end)
    end
    
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Side" then
            BagEsp(v)
        end
    end
end
onCharacterAdded(lplr.Character);
lplr.CharacterAdded:Connect(onCharacterAdded);

getsenv(lplr.PlayerScripts.SystemChatMessageHandler).message("Took: " .. math.floor((os.clock() - Time) * 100) / 100 .. "s to load!")
