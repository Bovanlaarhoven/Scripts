if not game:IsLoaded() then game.Loaded:Wait() end

if shared.EquityLoaded and not shared.EquityDeveloper then error("Equity Already Loaded!") return end

shared.EquityLoaded = (shared.EquityDeveloper and false or true)

if not isfile("Equity-UI-Lib.lua") and shared.EquityDeveloper then
    writefile("Equity-UI-Lib.lua", game:HttpGet("https://raw.githubusercontent.com/Mistercoolertyper/Scripts/main/Equity-UI-Lib.lua", true))
end
if not isfile("Equity-Fly.lua") and shared.EquityDeveloper then
    writefile("Equity-Fly.lua", game:HttpGet("https://raw.githubusercontent.com/Mistercoolertyper/Scripts/main/Equity-Fly.lua", true))
end
if not isfile("ServerHop.lua") and shared.EquityDeveloper then
    writefile("ServerHop.lua", game:HttpGet("https://raw.githubusercontent.com/Mistercoolertyper/Scripts/main/ServerHop.lua", true))
end

local lplr = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local Entities = game:GetService("Players")
local LocalPlayer = Entities.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Players = Entities

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local loadButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UserInputService = game.UserInputService

local function fadeOut(gui)
    local tbl = {}
    for _,v in next, gui:GetDescendants() do
        pcall(function()
            if v.BackgroundTransparency == 1 then
                tbl[#tbl+1] = v
            end
        end)
    end
    for i = 1,100,.6 do
        for _,v in next, gui:GetDescendants() do
            pcall(function()
                v.Transparency = i/100
                if table.find(tbl, v) then
                    v.BackgroundTransparency = 1
                end
            end)
        end
        task.wait()
    end
    gui:Destroy()
end

local function createNotification(name, text, perm, time, okbutton)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel_2 = Instance.new("TextLabel")
    local loadButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(36, 35, 53)
    Frame.BorderColor3 = Color3.fromRGB(55, 54, 76)
    Frame.Position = UDim2.new(.5,-185, .5, -75)
    UICorner.CornerRadius = UDim.new(0, 13)
    UICorner.Parent = Frame
    local namelen = #name
    local textlen = #text
    local longest
    if namelen > textlen then longest = namelen else longest = textlen end
    Frame:TweenSize(UDim2.new(0, longest*12.5, 0, (text == "" and 50 or 100)))
    Frame.Position = UDim2.new(.5,-185, .5, -75)
    task.wait(1)

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderColor3 = Color3.fromRGB(212, 200, 231)
    TextLabel.Position = UDim2.new(0, 5, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.Size = UDim2.new(0, longest*12, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = name
    TextLabel.TextColor3 = Color3.fromRGB(212, 200, 231)

    TextLabel_2.Parent = Frame
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1
    TextLabel_2.BorderColor3 = Color3.fromRGB(212, 200, 231)
    TextLabel_2.Position = UDim2.new(0, 5, 0, 40)
    TextLabel_2.TextScaled = true
    TextLabel_2.Size = UDim2.new(0, longest*12, 0, 50)
    TextLabel_2.Font = Enum.Font.GothamBold
    TextLabel_2.Text = text
    TextLabel_2.TextColor3 = Color3.fromRGB(212, 200, 231)

    local connection

    if perm and okbutton then
        loadButton.Parent = Frame
        loadButton.BackgroundColor3 = Color3.fromRGB(57, 52, 81)
        loadButton.Position = UDim2.new(0.043243248, 0, 0.659999967, 0)
        loadButton.Size = UDim2.new(0, 76, 0, 38)
        loadButton.Font = Enum.Font.GothamBold
        loadButton.Text = "Ok"
        loadButton.TextColor3 = Color3.fromRGB(177, 172, 228)
        loadButton.TextSize = 17.000
        loadButton.TextStrokeColor3 = Color3.fromRGB(177, 172, 228)
        connection = loadButton.MouseButton1Click:Connect(function()
            connection:Disconnect()
            fadeOut(ScreenGui)
        end)
    end

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = loadButton

    if not perm then
        task.wait(time)
        fadeOut(ScreenGui)
    else
        return {
            Destroy = function()
                if connection then
                    connection:Disconnect()
                end
                if ScreenGui then
                    fadeOut(ScreenGui)
                end
            end
        }
    end
end

local games = {
    SharkBite = 8908228901,
    SkyWars = 855499080,
    PrisonLife = 155615604,
    Arsenal = 286090429,
    Evade = 9872472334
}

local currentGame = "Universal"

for i,v in next, games do
    if game.PlaceId == v then
        currentGame = i
    end
end

local function isAlive()
    if lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChildOfClass("Humanoid") and lplr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
        return true
    end
    return false
end

local function getClosestPlr(distance, teamcheck)
    local closest, returnedplayer = (distance or math.huge), nil
    teamcheck = teamcheck or false
    if isAlive() then
        for _,v in next, game.Players:GetPlayers() do
            local check1 = true
            if teamcheck then
                check1 = (v.Team ~= lplr.Team)
            end
            if check1 and v ~= lplr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if mag <= closest then
                    closest = mag
                    returnedplayer = v
                end
            end
        end
    end
    return returnedplayer
end

local function makeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        object.Position = pos
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(36, 35, 53)
Frame.BorderColor3 = Color3.fromRGB(55, 54, 76)
Frame.Position = UDim2.new(.5,-185, .5, -75)
makeDraggable(Frame, Frame)
UICorner.CornerRadius = UDim.new(0, 13)
UICorner.Parent = Frame
Frame:TweenSize(UDim2.new(0, 370, 0, 150))
Frame.Position = UDim2.new(.5,-185, .5, -75)
task.wait(1)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(212, 200, 231)
TextLabel.Position = UDim2.new(0, 0, 0.0666666701, 0)
TextLabel.Size = UDim2.new(0, 127, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = currentGame
TextLabel.TextColor3 = Color3.fromRGB(212, 200, 231)
TextLabel.TextSize = 24.000

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(212, 200, 231)
TextLabel_2.Position = UDim2.new(0.0852432443, 0, 0.333333343, 0)
TextLabel_2.Size = UDim2.new(0, 244, 0, 43)
TextLabel_2.Font = Enum.Font.GothamMedium
TextLabel_2.Text = (currentGame == "Universal" and "This game is not supported by Equity" or "This game is Supported by Equity")
TextLabel_2.TextColor3 = Color3.fromRGB(156, 139, 173)
TextLabel_2.TextSize = 16.000

loadButton.Parent = Frame
loadButton.BackgroundColor3 = Color3.fromRGB(57, 52, 81)
loadButton.Position = UDim2.new(0.043243248, 0, 0.659999967, 0)
loadButton.Size = UDim2.new(0, 76, 0, 38)
loadButton.Font = Enum.Font.GothamBold
loadButton.Text = "Load"
loadButton.TextColor3 = Color3.fromRGB(177, 172, 228)
loadButton.TextSize = 17.000
loadButton.TextStrokeColor3 = Color3.fromRGB(177, 172, 228)

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = loadButton

local function loadArsenal()
    local win = shared.Equity.MainWindow

    local tab = win:Tab("Main")
    local tab1 = win:Tab("GunMods")

    local silentAimMode = "Legit"
    local wallbangEnabled = false
    local silentAimEnabled = false
    local silentAimHitPart = "Head"

    local arsenal = {
        Weapons = require(lplr.PlayerGui.GUI.Client.Functions.Weapons),
    }

    local function ClosestPlayer(fov)
        local MaxDist, Closest = math.huge
        for i,v in pairs(Players.GetPlayers(Players)) do
            local Head = v.Character.FindFirstChild(v.Character, "Head")
            if Head then
                local Pos, Vis = workspace.CurrentCamera.WorldToScreenPoint(workspace.CurrentCamera, Head.Position)
                if Vis then
                    local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
                    local Dist = (TheirPos - MousePos).Magnitude
                    if Dist < MaxDist and Dist <= fov then
                        MaxDist = Dist
                        Closest = v
                    end
                end
            end
        end
        return Closest
    end

    local function getClosestPlr1(distance)
        local closest, returnedplayer = (distance or math.huge), nil
        for _,v in next, Players.GetPlayers(Players) do
            local Head = v.Character.FindFirstChild(v.Character, "Head")
            if Head and lplr ~= v and v.Team ~= lplr.Team and v.NRPBS.Health.Value > 0 then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if mag <= closest then
                    closest = mag
                    returnedplayer = v
                end
            end
        end
        return returnedplayer
    end

    local fovValue = 120

    task.spawn(function()
        (LPH_JIT_MAX or function(...) return ... end)(function()
            local mt = getrawmetatable(game)
            local namecallold = mt.__namecall
            setreadonly(mt, false)
            mt.__namecall = newcclosure(function(self, ...)
                local Args = {...}
                local NamecallMethod = getnamecallmethod()
                if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" and wallbangEnabled then
                    local plr = silentAimMode == "Legit" and ClosestPlayer(fovValue) or getClosestPlr1()
                    if plr then
                        table.insert(Args[2], workspace.Map)
                    end
                end
                if NamecallMethod == "FindPartOnRayWithIgnoreList" and not checkcaller() then
                    if silentAimEnabled then
                        local plr = silentAimMode == "Legit" and ClosestPlayer(fovValue) or getClosestPlr1()
                        local part
                        if silentAimHitPart == "Random" then
                            local rand = math.random(0,1)
                            part = plr.Character.FindFirstChild(plr.Character, rand == 1 and "HumanoidRootPart" or "Head")
                        else
                            part = plr.Character.FindFirstChild(plr.Character, silentAimHitPart)
                        end
                        if plr and plr.Character and part then
                            Args[1] = Ray.new(Args[1].Origin, (part.Position - Args[1].Origin).Unit * 1000)
                            return namecallold(self, table.unpack(Args))
                        end
                    end
                end
                if wallbangEnabled and NamecallMethod == "FireServer" and self and self.Name and self.Name == "UpdatePing" then
                    return namecallold(self, table.unpack({
                        [1] = 10,
                        [2] = "LOL",
                    }))
                end
                return namecallold(self, ...)
            end)
            setreadonly(mt, true)
        end)();
    end)

    tab:CreateOptionsButton({
        Name = "SilentAim",
        Function = function(callback)
            silentAimEnabled = callback
        end
    })

    tab:CreateDropdown({
        Name = "SilentAim Mode",
        List = {"Legit", "Blatant"},
        Function = function(val)
            silentAimMode = val
        end
    })

    tab:CreateSlider({
        Name = "SlientAim FOV",
        Min = 1,
        Max = 900,
        Default = 120,
        Function = function(val)
            fovValue = val
        end
    })

    tab:CreateDropdown({
        Name = "HitPart",
        List = {
            "Head",
            "HumanoidRootPart",
            "Random"
        },
        Function = function(val)
            silentAimHitPart = val
        end
    })

    tab:CreateOptionsButton({
        Name = "WallBang",
        Function = function(callback)
            wallbangEnabled = callback
        end
    })

    local auraToggled = false
    tab:CreateOptionsButton({
        Name = "KillAura(RISKY)",
        Function = function(callback)
            auraToggled = callback
            coroutine.wrap(function()
                repeat
                    pcall(function()
                        for _,v in next, game.Players:GetPlayers() do
                            if isAlive() and isAlive(v) and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 100 and v.Team ~= lplr.Team then
                                game.ReplicatedStorage.Events.FallDamage:FireServer(math.clamp((v.NRPBS.Health.Value-1)/4,0,600),(isAlive(v) and v.Character.Hitbox or nil),"JUMP")
                            end
                        end
                    end)
                    task.wait()
                until auraToggled == false
            end)()
        end
    })

    local vals = {
        FireRate = 20,
        Recoil = 0,
        Auto = true
    }

    local oldVals = {}
    local oldFunc = arsenal.Weapons.getammo
    local gunModsEnabled
    tab1:CreateOptionsButton({
        Name = "GunMods",
        Function = function(callback)
            if callback then
                arsenal.Weapons.getammo = function()
                    task.delay(.5, function()
                        lplr.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
                    end)
                    return 1000
                end
                for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                    oldVals[v.Name] = {
                        FireRate = (v:FindFirstChild("FireRate") and v:FindFirstChild("FireRate").Value or nil),
                        Recoil = (v:FindFirstChild("RecoilControl") and v:FindFirstChild("RecoilControl").Value or nil),
                        Auto = (v:FindFirstChild("Auto") and v:FindFirstChild("Auto").Value or nil),
                        EquipTime = (v:FindFirstChild("EquipTime") and v:FindFirstChild("EquipTime").Value or nil)
                    }
                    if v:FindFirstChild("EquipTime") then v.EquipTime.Value = .02 end
                    if v:FindFirstChild("FireRate") then v.FireRate.Value = vals.FireRate/1000 end
                    if v:FindFirstChild("RecoilControl") then v.RecoilControl.Value = vals.Recoil/100 end
                    if v:FindFirstChild("Auto") then v.Auto.Value = vals.Auto end
                end
            else
                arsenal.Weapons.getammo = oldFunc
                for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                    local oldVal = oldVals[v.Name]
                    if v:FindFirstChild("FireRate") and oldVal.FireRate then
                        v.FireRate.Value = math.clamp(oldVal.FireRate, 0.02, math.huge)
                    end
                    if v:FindFirstChild("RecoilControl") and oldVal.Recoil then
                        v.RecoilControl.Value = oldVal.Recoil
                    end
                    if v:FindFirstChild("Auto") and oldVal.Auto then
                        v.Auto.Value = oldVal.Auto
                    end
                    if v:FindFirstChild("EquipTime") and oldVal.EquipTime then
                        v.EquipTime.Value = oldVal.EquipTime
                    end
                end
            end
        end
    })

    tab1:CreateSlider({
        Name = "FireRate",
        Min = 20,
        Max = 500,
        Default = 20,
        Function = function(val)
            if gunModsEnabled then
                for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                    if v:FindFirstChild("FireRate") then v.FireRate.Value = val/1000 end
                end
            end
            vals.FireRate = val
        end
    })

    tab1:CreateSlider({
        Name = "Recoil",
        Min = 0,
        Max = 100,
        Default = 0,
        Function = function(val)
            if gunModsEnabled then
                for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                    if v:FindFirstChild("RecoilControl") then v.RecoilControl.Value = val/100 end
                end
            end
            vals.Recoil = val
        end
    })

    tab1:CreateOptionsButton({
        Name = "AutoFire",
        Default = true,
        Function = function(callback)
            if gunModsEnabled then
                for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                    if v:FindFirstChild("Auto") then v.Auto.Value = vals.Auto end
                end
            end
            vals.Auto = callback
        end
    })
end

local function loadPrisonLife()
    local AimPart = "Head"

    FOV_Circle = Drawing.new("Circle")
    FOV_Circle.Color = Color3.fromRGB(255,255,255)
    FOV_Circle.Thickness = 2.5
    FOV_Circle.NumSides = 13
    FOV_Circle.Radius = 100
    FOV_Circle.Visible = false
    FOV_Circle.Filled = false

    local win = shared.Equity.MainWindow

    local maintab = win:Tab("Main")
    local guntab = win:Tab("Gun Mods")
    local vistab = win:Tab("Visuals")
    local tptab = win:Tab("Teleports")
    local localtab = win:Tab("Local")
    local misctab = win:Tab("Misc")

    guntab:Label("Coming Soon")

    local aimbotEnabled = false
    maintab:Toggle("Aimlock",false, function(callback)
        aimbotEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    local dist = math.huge
                    local closest_char = nil
                    for _,v in next, Entities:GetChildren() do
                        local pressing
                        for _,v2 in next, UIS:GetMouseButtonsPressed() do
                            if v2.UserInputType == Enum.UserInputType.MouseButton2 then
                                pressing = true
                            end
                        end
                        if v ~= LocalPlayer and
                        v.Character and
                        v.Character:FindFirstChild("HumanoidRootPart") and
                        v.Character:FindFirstChild("Humanoid") and
                        v.Character:FindFirstChild("Humanoid").Health > 0 and
                        v.Team ~= lplr.Team and
                        pressing then
                            local char = v.Character
                            local char_part_pos, is_onscreen = Camera:WorldToViewportPoint(char[AimPart].Position)
                            if is_onscreen then
                                local mag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude
                                if mag < dist and mag < FOV_Circle.Radius then
                                    dist = mag
                                    closest_char = char
                                end
                            end
                        end

                        if closest_char ~= nil and
                        closest_char:FindFirstChild("HumanoidRootPart") and
                        closest_char:FindFirstChild("Humanoid") and
                        closest_char:FindFirstChild("Humanoid").Health > 0 then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest_char[AimPart].Position)
                        end
                    end
                    task.wait()
                until aimbotEnabled == false
            end)()
        end
    end)

    maintab:Dropdown("Aimlock Part", {"Head","Torso","Legs"}, function(t)
        if t == "Head" then
            AimPart = "Head"
        end

        if t == "Torso" then
            AimPart = "Torso"
        end

        if t == "Legs" then
            AimPart = "Right Leg"
        end
    end)

    local triggerbotEnabled = false
    maintab:Toggle("Trigger Bot",false, function(callback)
        triggerbotEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    if Mouse.Target then
                        if Mouse.Target.Parent:FindFirstChild('Humanoid') then
                            mouse1click()
                        end
                    end
                    task.wait()
                until triggerbotEnabled == false
            end)()
        end
    end)

    local mainRemotes = game.ReplicatedStorage
    local meleeRemote = mainRemotes['meleeEvent']
    local mouse = game.Players.LocalPlayer:GetMouse()

    local function punch(plr)
        coroutine.wrap(function()
            meleeRemote:FireServer(plr)
        end)()
    end

    local autoclickEnabled = false
    maintab:Toggle("Super Punch", false, function(callback)
        autoclickEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    if UserInputService:IsKeyDown(Enum.KeyCode.F) then
                        local plr = getClosestPlr(40)
                        if plr then
                            punch(plr)
                        end
                    end
                    task.wait()
                until autoclickEnabled == false
            end)()
        end
    end)

    maintab:Dropdown("Get Gun", {"Remington 870","AK-47","M9"}, function(t)
        if t == "Remington 870" then
            local args = {
                [1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP
            }
            workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        end
        if t == "AK-47" then
            local args = {
                [1] = workspace.Prison_ITEMS.giver:FindFirstChild("AK-47").ITEMPICKUP
            }
            workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        end
        if t == "M9" then
            local args = {
                [1] = workspace.Prison_ITEMS.giver.M9.ITEMPICKUP
            }
            workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        end
    end)

    local loopKillAllEnabled = false
    misctab:Toggle("Loop Kill All", false, function(callback)
        loopKillAllEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    for _,v in next, game:GetService("Players"):GetPlayers() do
                        --pcall(function()
                            if v ~= lplr and v.Team ~= lplr.Team and not v.Character:FindFirstChildOfClass("ForceField") and v.Character.Humanoid.Health > 0 then
                                for _ = 1,30 do
                                    punch(v)
                                end
                            end
                        --end)
                    end
                    task.wait()
                until loopKillAllEnabled == false
            end)()
        end
    end)

    misctab:Button("Remove Textures", function()
        local hasProperty = function(a, b)
            local c = a[b]
            return (c and true or nil)
        end
        task.spawn(function()
            for i, v in next, workspace:GetDescendants() do
                local Check = pcall(function()hasProperty(v, "Material")end)
                if Check then
                    v.Material = "Plastic"
                end
            end
            workspace.DescendantAdded:Connect(function(v)
                local Check = pcall(function()hasProperty(v, "Material")end)
                if Check then
                    v.Material = "Plastic"
                end
            end)
        end)
    end)

    vistab:Toggle("Aim FOV",false, function(callback)
        FOV_Circle.Visible = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 37)
                    task.wait()
                until FOV_Circle.Visible == false
            end)()
        end
    end)

    vistab:Slider("FOV Size",30,300,150, function(t)
        FOV_Circle.Radius = t
    end)

    vistab:Toggle("Fill FOV",false, function(t)
        FOV_Circle.Filled = t
        FOV_Circle.Transparency = (t == true and 0.6 or 1)
    end)

    tptab:Button("Cafeteria", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917, 100, 2332)
    end)

    tptab:Button("Cell Block", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917, 100, 2417)
    end)

    tptab:Button("Court Yard", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(821, 98, 2389)
    end)

    tptab:Button("Police Guns", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(835, 100, 2267)
    end)

    tptab:Button("Prison Gates", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(496, 98, 2217)
    end)

    tptab:Button("Criminal Spawn", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-915, 95, 2138)
    end)

    tptab:Button("Criminal Guns", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943, 94, 2056)
    end)

    misctab:Button("Arrest All", function()
        if lplr.Team ~= game.Teams.Guards then return end
        for _,v in pairs(game.Teams.Criminals:GetPlayers()) do
            if v.Name ~= lplr.Name and v.Team ~= lplr.Team then
                for i = 1,10 do
                    if lplr.Character.Humanoid.Sit then
                        lplr.Character.Humanoid.Jump = true
                        lplr.Character.Humanoid:ChangeState("Jumping")
                    end
                    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                    lplr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    task.wait(.1)
                end
            end
        end
    end)

    misctab:Button("Delete Doors", function()
        workspace.Doors:Destroy()
    end)

    --[[misctab:Dropdown("Team", {"Inmates","Criminals","Guards"},"Change Teams", function(t)
        if t == "Inmates" then
            game.Players.LocalPlayer.Team = game.Teams.Inmates
        end
        if t == "Criminals" then
            game.Players.LocalPlayer.Team = game.Teams.Criminals
        end
        if t == "Guards" then
            game.Players.LocalPlayer.Team = game.Teams.Guards
        end
    end)]]

    local gravityValue = 192.6
    local gravityEnabled = false

    localtab:Toggle("Custom Gravity",false, function(callback)
        gravityEnabled = callback
        if callback then
            workspace.Gravity = gravityValue
        else
            workspace.Gravity = 192.6
        end
    end)

    localtab:Slider("Gravity",0,192.6,192.6, function(val)
        if gravityEnabled then
            workspace.Gravity = val
        end
        gravityValue = val
    end)
end

local function loadSharkBite()
    local win = shared.Equity.MainWindow

    local tab = win:Tab("Main")
    local gunModsTab = win:Tab("GunMods")

    local sb = {
        ProjStats = require(game:GetService("ReplicatedStorage").Projectiles.ProjectileStatsModule),
        HitRemote = debug.getupvalue(debug.getupvalue(debug.getupvalue(require(lplr.PlayerScripts.ProjectilesClient.WeaponScript.HitScanFire).Fire, 8), 4), 2),
    }

    local oldVals = {}

    tab:CreateSlider({
        Name = "Water Transparency",
        Min = 1,
        Max = 100,
        Default = 50,
        Function = function(value)
            workspace.Terrain.WaterTransparency = (value/100)
        end
    })

    local sharkTPEnabled = false
    tab:CreateOptionsButton({
        Name = "SharkTP",
        Function = function(callback)
            if callback then
                sharkTPEnabled = true
                repeat
                    local shark = workspace.Sharks:GetChildren()[1]
                    if shark then
                        lplr.Character.HumanoidRootPart.CFrame = (shark.PrimaryPart.CFrame + Vector3.new(0,20,0))
                    end
                    task.wait()
                until sharkTPEnabled == false
            else
                sharkTPEnabled = false
            end
        end
    })

    local sharkAutoFarm = true
    tab:CreateOptionsButton({
        Name = "SharkAutoFarm",
        Function = function(callback)
            if callback then
                sharkAutoFarm = true
                repeat
                    local shark = workspace.Sharks:GetChildren()[1]
                    pcall(function()
                        if lplr.Character.Humanoid.Sit == true then
                            lplr.Character.Humanoid.Jump = true
                            lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                        local gun = lplr.Backpack:GetChildren()[1]
                        if gun then
                            lplr.Character.Humanoid:EquipTool(gun)
                        end
                    end)
                    if shark and lplr.Team == game.Teams.Survivor then
                        lplr.Character.HumanoidRootPart.CFrame = (shark.PrimaryPart.CFrame + Vector3.new(0,20,0))
                        coroutine.wrap(function()
                            sb.HitRemote:FireServer(shark)
                        end)()
                    end
                    task.wait()
                until sharkAutoFarm == false
            else
                sharkAutoFarm = false
            end
        end
    })

    local function kill(shark, plr)
        pcall(function()
            game:GetService("ReplicatedStorage").EventsFolder.Shark.Kill:InvokeServer(table.unpack({
                [1] = plr.Character,
                [2] = shark,
            }))
        end)
    end

    local teethExploitDelay = 10
    local teethExploitEnabled = false
    tab:CreateOptionsButton({
        Name = "TeethExploit",
        Function = function(callback)
            if callback then
                teethExploitEnabled = true
                coroutine.wrap(function()
                    repeat
                        local shark = workspace.Sharks:GetChildren()[1]
                        for _,v in next, game.Players:GetPlayers() do
                            pcall(function()
                                if (shark.PrimaryPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 100 and lplr.Team == game.Teams.Shark then
                                    coroutine.wrap(function()
                                        kill(shark, v)
                                    end)()
                                    task.wait(teethExploitDelay/100)
                                end
                            end)
                        end
                        task.wait()
                    until teethExploitEnabled == false
                end)()
            else
                teethExploitEnabled = false
            end
        end
    })

    tab:CreateSlider({
        Name = "TeethExploitDelay",
        Min = 0,
        Max = 100,
        Default = 10,
        Function = function(val)
            teethExploitDelay = val
        end
    })

    local fireRate = math.huge
    local spread = 0
    local magSize = 9e9
    local recoil = Vector3.new(0,0,0)
    local reloadTime = 1e-123

    local gunModsEnabled = false
    gunModsTab:CreateOptionsButton({
        Name = "GunMods",
        Function = function(callback)
            if callback then
                gunModsEnabled = true
                for _,v in next, sb.ProjStats.get() do
                    oldVals.FireRate = v.FireRate
                    oldVals.ReloadTime = v.ReloadTime
                    oldVals.Spread = v.Spread
                    oldVals.MagSize = v.MagSize
                    oldVals.Mode = v.Mode
                    oldVals.ProjectileSpeed = v.ProjectileSpeed
                    oldVals.Range = v.Range
                    oldVals.Recoil = v.Recoil
                    v.FireRate = fireRate
                    v.ReloadTime = reloadTime
                    v.Spread = spread
                    v.MagSize = magSize
                    v.Mode = 2
                    v.ProjectileSpeed = 15000
                    v.Range = 100000
                    v.Recoil = recoil
                end
            else
                gunModsEnabled = false
                for _,v in next, sb.ProjStats.get() do
                    for i,v2 in next, oldVals do
                        v[i] = v2
                    end
                end
            end
        end,
        Default = false
    })

    gunModsTab:CreateSlider({
        Name = "FireRate",
        Min = 0,
        Max = 1000,
        Default = 1000,
        Function = function(val)
            fireRate = val
            if gunModsEnabled then
                for _,v in next, sb.ProjStats.get() do
                    v.FireRate = val
                end
            end
        end
    })

    gunModsTab:CreateSlider({
        Name = "ReloadTime",
        Min = 0,
        Max = 10,
        Default = 10,
        Function = function(val)
            reloadTime = val
            if gunModsEnabled then
                for _,v in next, sb.ProjStats.get() do
                    v.ReloadTime = val
                end
            end
        end
    })

    gunModsTab:CreateSlider({
        Name = "MagSize",
        Min = 0,
        Max = 2000,
        Default = 0,
        Function = function(val)
            magSize = val
            if gunModsEnabled then
                for _,v in next, sb.ProjStats.get() do
                    v.MagSize = val
                end
            end
        end
    })

    gunModsTab:CreateSlider({
        Name = "Spread",
        Min = 0,
        Max = 10,
        Default = 0,
        Function = function(val)
            spread = val
            if gunModsEnabled then
                for _,v in next, sb.ProjStats.get() do
                    v.Spread = val/10
                end
            end
        end
    })
end

local function loadSkyWars()
    local AimPart = "Head"

    FOV_Circle = Drawing.new("Circle")
    FOV_Circle.Color = Color3.fromRGB(255,255,255)
    FOV_Circle.Thickness = 2.5
    FOV_Circle.NumSides = 13
    FOV_Circle.Radius = 100
    FOV_Circle.Visible = false
    FOV_Circle.Filled = false

    game:GetService('RunService').Stepped:Connect(function()
        if FOV_Circle.Visible then
            FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 37)
        end
    end)

    workspace.Lobby.KillPlates:Destroy()
    workspace.Lobby.ChildAdded:Connect(function(v)
        if v.Name == "KillPlates" then
            task.wait()
            v:Destroy()
        end
    end)

    for _,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "antivoid" then
            v:Destroy()
        end
    end

    local antivoidpart = Instance.new("Part")
    antivoidpart.Parent = game.Workspace
    antivoidpart.Name = "antivoid"
    antivoidpart.Anchored = true
    antivoidpart.CFrame = CFrame.new(1, 160, 1)
    antivoidpart.Size = Vector3.new(666,1,666)
    antivoidpart.Color = Color3.fromRGB(255,0,0)
    antivoidpart.Transparency = 1
    antivoidpart.CanCollide = false

    local lib = shared.Equity.Lib
    local win = shared.Equity.MainWindow

    local CombatTab = win:Tab("Main")
    local VisualTab = win:Tab("Visuals")
    local TeleportsTab = win:Tab("Teleports")
    local LocalTab = win:Tab("Local")
    local MiscTab = win:Tab("Misc")

    local aimbotEnabled = false
    CombatTab:Toggle("Aimlock", false, function(callback)
        aimbotEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    local dist = math.huge
                    local closest_char = nil
                    local pressing = false
                    for _, v in pairs(Entities:GetChildren()) do
                        if v ~= LocalPlayer and
                        v.Character and
                        v.Character:FindFirstChild("HumanoidRootPart") and
                        v.Character:FindFirstChild("Humanoid") and
                        v.Character:FindFirstChild("Humanoid").Health > 0 and
                        v.Team ~= lplr.Team then
                            for _, v2 in pairs(UIS:GetMouseButtonsPressed()) do
                                if v2.UserInputType == Enum.UserInputType.MouseButton2 then
                                    pressing = true
                                end
                            end
                            if pressing then
                                local char = v.Character
                                local char_part_pos, is_onscreen = Camera:WorldToViewportPoint(char[AimPart].Position)
                                if is_onscreen then
                                    local mag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude
                                    if mag < dist and mag < FOV_Circle.Radius then
                                        dist = mag
                                        closest_char = char
                                    end
                                end
                            end
                        end
                    end
                    if closest_char and
                    closest_char:FindFirstChild("HumanoidRootPart") and
                    closest_char:FindFirstChild("Humanoid") and
                    closest_char:FindFirstChild("Humanoid").Health > 0 then
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest_char[AimPart].Position)
                    end
                    task.wait()
                until aimbotEnabled == false
            end)()
        end
    end)

    CombatTab:Dropdown("Aimlock Part", {"Head","Torso","Legs"}, function(t)
        if t == "Head" then
            AimPart = "Head"
        end
        if t == "Torso" then
            AimPart = "Torso"
        end
        if t == "Legs" then
            AimPart = "Right Leg"
        end
    end)

    local triggerbotEnabled = false
    CombatTab:Toggle("Trigger Bot",false, function(callback)
        triggerbotEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    if Mouse.Target then
                        if Mouse.Target.Parent:FindFirstChild('Humanoid') then
                            mouse1click()
                        end
                    end
                    task.wait()
                until triggerbotEnabled == false
            end)()
        end
    end)

    local hitboxsize = 2
    local hitboxEnabled = false
    local showHitboxEnabled = false

    CombatTab:Toggle("Hitbox Expander",false, function(callback)
        hitboxEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v ~= game.Players.LocalPlayer then
                            if showHitboxEnabled then
                                v.Character.HumanoidRootPart.Transparency = 0.5
                                v.Character.HumanoidRootPart.Color = Color3.fromRGB(255,0,0)
                            else
                                v.Character.HumanoidRootPart.Transparency = 1
                                v.Character.HumanoidRootPart.Color = Color3.fromRGB(255,255,255)
                            end
                            v.Character.HumanoidRootPart.Size = Vector3.new(hitboxsize ,hitboxsize ,hitboxsize)
                        end
                    end
                    task.wait(1)
                until hitboxEnabled == false
            end)()
        end
    end)

    CombatTab:Toggle("Show Hitboxes",false, function(callback)
        showHitboxEnabled = callback
        if callback then
            for _,v in next, game.Players:GetPlayers() do
                if v == lplr then continue end
                v.Character.HumanoidRootPart.Transparency = 0.5
                v.Character.HumanoidRootPart.Color = Color3.fromRGB(255,0,0)
            end
        else
            for _,v in next, game.Players:GetPlayers() do
                if v == lplr then continue end
                v.Character.HumanoidRootPart.Transparency = 1
                v.Character.HumanoidRootPart.Color = Color3.fromRGB(255,255,255)
            end
        end
    end)

    CombatTab:Slider("Hitbox Size",0,50,30, function(t)
        hitboxsize = t
    end)

    CombatTab:Button("Anti Hitbox",false, function()
        if lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChildOfClass("Humanoid") and lplr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            local char = lplr.Character
            char.Parent = nil
            char.HumanoidRootPart:Destroy()
            char.Parent = workspace
        end
    end)

    VisualTab:Toggle("Aim FOV",false, function(t)
        FOV_Circle.Visible = t
    end)

    VisualTab:Slider("FOV Size",30,300,150, function(t)
        FOV_Circle.Radius = t
    end)

    VisualTab:Toggle("Fill FOV",false, function(callback)
        FOV_Circle.Filled = callback
        FOV_Circle.Transparency = (callback == true and 0.6 or 1)
    end)

    TeleportsTab:Button("Mega VIP", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2, 264, 68)
    end)
    TeleportsTab:Button("VIP", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0, 264, -70)
    end)
    TeleportsTab:Button("Group Room", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129, 264, 4)
    end)
    TeleportsTab:Button("Center Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1, 165, -10)
    end)
    TeleportsTab:Button("Island 1", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8, 165, -96)
    end)
    TeleportsTab:Button("Island 2", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(102, 165, -108)
    end)
    TeleportsTab:Button("Island 3", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 165, 2)
    end)
    TeleportsTab:Button("Island 4", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 165, 109)
    end)
    TeleportsTab:Button("Island 5", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9, 165, 120)
    end)
    TeleportsTab:Button("Island 6", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-103, 165, 122)
    end)
    TeleportsTab:Button("Island 7", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-111, 165, 18)
    end)
    TeleportsTab:Button("Island 8", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-115, 165, -95)
    end)

    local infShieldEnabled = false
    MiscTab:Toggle("Infinite Shield",false, function(callback)
        infShieldEnabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    coroutine.wrap(function()
                        game.Players.LocalPlayer.Character:FindFirstChild("Shield"):Activate()
                        task.wait(1)
                        game.Workspace:FindFirstChild(lplr.Name).Shield.ShieldPotion:Destroy()
                    end)()
                    task.wait(.05)
                until infShieldEnabled == false
            end)()
        end
    end)

    MiscTab:Button("Anti Round Kill",false, function()
        workspace.FallenPartsDestroyHeight = -math.huge
    end)

    MiscTab:Toggle("Anti Void",false, function(t)
        if t then
            antivoidpart.Transparency = 1
            antivoidpart.CanCollide = true
        else
            antivoidpart.Transparency = 1
            antivoidpart.CanCollide = false
        end
    end)

    MiscTab:Button("Auto Collect Coins",false, function()
        for _,v in pairs(game.Workspace.GameStorage.Coins:GetChildren()) do
            if string.find(v.Name, "Coin") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                task.wait(.05)
            end
        end
    end)

    --[[local autoFarmEnabled = false
    MiscTab:Toggle("Auto Farm", false, function(callback)
        autoFarmEnabled = callback
        if callback then
            local stuff = workspace:getDescendants()
            coroutine.wrap(function()
                repeat
                    for i = 1, #stuff do
                        if stuff[i].Name == "Block" and stuff[i].Parent.Name == "Ores" then
                            repeat
                                if not (lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChildOfClass("Humanoid") and lplr.Character:FindFirstChildOfClass("Humanoid").Health > 0) then continue end
                                lplr.Character.HumanoidRootPart.CFrame = stuff[i].CFrame
                                lplr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,0,0)
                                lplr.Character.Axe.RemoteEvent:FireServer(stuff[i])
                                task.wait()
                            until stuff[i].Name ~= "Block" or not lplr.Character:FindFirstChild("Axe") or autoFarmEnabled == false
                        end
                    end
                    task.wait()
                until autoFarmEnabled == false
            end)()
        end
    end)]]
    MiscTab:Label("Auto Farm will be back soon!")
end

local evadeSettings = {
    speedValue = 20,
    speedEnabled = false,
    jumpPowerValue = 20,
    jumpPowerEnabled = false
}

local function loadEvade()
    local win = shared.Equity.MainWindow

    local tab = win:Tab("Main");

    (LPH_JIT_MAX or function(...) return ... end)(function()
        local old;old = hookmetamethod(game, "__namecall", function(self, ...)
            local args = {...}
            if (evadeSettings.speedEnabled or evadeSettings.jumpPowerEnabled) and self and self.Name == "Communicator" and args[1] == "update" then
                return (evadeSettings.speedEnabled and evadeSettings.speedValue*100 or 1500), (evadeSettings.jumpPowerEnabled and evadeSettings.jumpPowerValue or 3)
            end
            return old(self,...)
        end)
    end)()

    local function revive(plr, status)
        return game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(plr.Name, status)
    end

    local plr
    local reviveFarmEnabled = false

    local function respawn()
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
        local old = tick()
        local deleted = false
        repeat
            if lplr.PlayerGui:FindFirstChild("MouseView") then
                deleted = true
                lplr.PlayerGui.MouseView:Destroy()
            end
            task.wait()
        until tick() - old > 2.2 or deleted
        UserInputService.MouseIconEnabled = false
        lplr.PlayerGui.Centered.Crosshair.Visible = true
    end

    local function isDowned(plr)
        if plr and plr.Character and plr.Character:GetAttribute("Downed") then return true end
        return false
    end

    local function isCarried(plr)
        local plr = workspace.Game.Players:FindFirstChild(plr.Name)
        if plr then
            return plr:FindFirstChild("CarriedBy") ~= nil
        end
        return false
    end

    tab:CreateOptionsButton({
        Name = "ReviveAutoFarm",
        Function = function(callback)
            reviveFarmEnabled = callback
            if callback then
                coroutine.wrap(function()
                    repeat
                        local suc,res = pcall(function()
                            for _,v in next, game.Players:GetPlayers() do
                                if v and v ~= lplr and isDowned(v) and not isCarried(v) then
                                    plr = v
                                    task.spawn(function()
                                        for _ = 1,30 do
                                            if isDowned(lplr) then respawn() end
                                            if plr ~= v or not isDowned(v) or isCarried(v) then return end
                                            if lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and v and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                                lplr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                                            end
                                            task.wait(.0866666667)
                                        end
                                    end)
                                    task.wait(.2)
                                    revive(v, false)
                                    task.wait(2.2)
                                    for _ = 1,2 do
                                        revive(v, true)
                                        task.wait(.1)
                                    end
                                    task.wait(.3)
                                end
                            end
                        end)
                        if not suc then warn("[ReviveAutoFarm Error]: "..res) end
                        task.wait()
                    until reviveFarmEnabled == false
                end)()
            end
        end
    })

    local autoRespawnEnabled = false

    tab:CreateOptionsButton({
        Name = "AutoRespawn",
        Function = function(callback)
            if callback then
                autoRespawnEnabled = callback
                coroutine.wrap(function()
                    repeat
                        local suc,res = pcall(function()
                            if isDowned(lplr) then
                                respawn()
                            end
                        end)
                        if not suc then warn("[AutoRespawn Error]: "..res) end
                        task.wait()
                    until autoRespawnEnabled == false
                end)()
            end
        end
    })

    tab:CreateOptionsButton({
        Name = "FastRevive",
        Function = function(callback)
            workspace.Game.Settings:SetAttribute("ReviveTime", callback and 3 or 2.2)
        end
    })
end

local gameFuncs = {
    PrisonLife = loadPrisonLife,
    SharkBite = loadSharkBite,
    SkyWars = loadSkyWars,
    Arsenal = loadArsenal,
    Evade = loadEvade
}

local function loadEvadeSpeed(tab)
    tab:CreateOptionsButton({
        Name = "Speed",
        Function = function(callback)
            evadeSettings.speedEnabled = callback
        end
    })

    tab:CreateSlider({
        Name = "Speed",
        Min = 0,
        Max = 100,
        Default = 20,
        Function = function(val)
            evadeSettings.speedValue = val
        end
    })

    tab:CreateOptionsButton({
        Name = "JumpPower",
        Function = function(callback)
            evadeSettings.jumpPowerEnabled = callback
        end
    })

    tab:CreateSlider({
        Name = "JumpPower",
        Min = 0,
        Max = 100,
        Default = 20,
        Function = function(val)
            evadeSettings.jumpPowerValue = val
        end
    })
end

local function loadUniversal()
    local lib
    if shared.EquityDeveloper then
        lib = loadfile("Equity-UI-lib.lua")()
    else
        lib = loadstring(game:HttpGet("http://78.108.218.40:25984/Equity-UI-Lib.lua?username="..lplr.Name, true))()
    end
    local win = lib:Window("Equity", Color3.fromHex("#7B36B1"), Enum.KeyCode.RightShift)
    shared.Equity = {
        Lib = lib,
        MainWindow = win
    }

    local tab = win:Tab("Universal")
    local visualTab = win:Tab("Visuals")
    local bindTab = win:Tab("Keybinds")

    local label;label = bindTab:CreateLabel({
        Name = "Current Gui Keybind: RightShift"
    })

    bindTab:CreateButton({
        Name = "Change Gui Keybind",
        Function = function()
            local notif = createNotification("Press a key to set the Gui Keybind", "", true)
            local bind
            local connection;connection = UserInputService.InputBegan:Connect(function(key)
                if key.KeyCode ~= Enum.KeyCode.Unknown and key.UserInputType == Enum.UserInputType.Keyboard then
                    connection:Disconnect()
                    bind = key
                end
            end)

            repeat task.wait() until bind

            notif:Destroy()
            lib:SetBind(bind.KeyCode)
            label.SetText("Current Gui Keybind: "..bind.KeyCode.Name)
            createNotification("Successfully set Gui Keybind!", "", false, 1)
        end
    })

    local fly = {Enabled = false}
    local speed = {Enabled = false}
    local speedSlider = {Value = 100}

    local suc,ESP = pcall(function()
        return loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
    end)
    if not suc then warn("Failed to load ESP! "..ESP) end
    ESP:Toggle(true)
    ESP.Players = true
    ESP.Tracers = false
    ESP.Boxes = false
    ESP.Names = false
    ESP.Thickness = 2
    ESP.Color = Color3.fromRGB(255, 255, 255)

    local fovEnabled = false
    local fovValue = 100
    local oldFov

    local clickTpConnection
    tab:CreateOptionsButton({
        Name = "ClickTp",
        Function = function(callback)
            if callback then
                if clickTpConnection then
                    clickTpConnection:Disconnect()
                end
                local mouse = lplr:GetMouse()
                clickTpConnection = UserInputService.InputBegan:Connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.hit.p)+Vector3.new(0,3,0)
                    end
                end)
            else
                if clickTpConnection then
                    clickTpConnection:Disconnect()
                end
            end
        end
    })

    local tpMod
    if shared.EquityDeveloper then
        tpMod = loadfile("ServerHop.lua")()
    else
        tpMod = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mistercoolertyper/Scripts/main/ServerHop.lua", true))()
    end
    tab:CreateButton({
        Name = "ServerHop",
        Function = function()
            tpMod:Teleport()
        end
    })

    tab:Toggle("Custom FOV",false, function(callback)
        fovEnabled = callback
        if callback then
            oldFov = workspace.CurrentCamera.FieldOfView
            workspace.CurrentCamera.FieldOfView = fovValue
            coroutine.wrap(function()
                repeat
                    workspace.CurrentCamera.FieldOfView = fovValue
                    task.wait(.5)
                until fovEnabled == false
                workspace.CurrentCamera.FieldOfView = oldFov
            end)()
        end
    end)

    tab:CreateSlider({
        Name = "FOV",
        Min = 70,
        Max = 120,
        Default = 100,
        Function = function(val)
            if fovEnabled then
                workspace.CurrentCamera.FieldOfView = val
            end
            fovValue = val
        end
    })

    local gravityValue = 192.6
    local gravityEnabled = false
    tab:Toggle("Custom Gravity",false, function(callback)
        gravityEnabled = callback
        if callback then
            workspace.Gravity = gravityValue
        else
            workspace.Gravity = 192.6
        end
    end)

    tab:Slider("Gravity",0,192.6,192.6, function(val)
        if gravityEnabled then
            workspace.Gravity = val
        end
        gravityValue = val
    end)

    visualTab:Toggle("Tracer ESP",false, function(t)
        ESP.Tracers = t
    end)

    visualTab:Toggle("Box ESP",false, function(t)
        ESP.Boxes = t
    end)

    visualTab:Toggle("Name ESP",false, function(t)
        ESP.Names = t
    end)

    local noclipConnection
    local oldParts = {}
    tab:CreateOptionsButton({
        Name = "Noclip",
        Function = function(callback)
            if callback then
                if noclipConnection then
                    noclipConnection:Disconnect()
                end
                noclipConnection = game.RunService.Stepped:Connect(function()
                    for _,v in pairs(lplr.Character:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide == true then
                            oldParts[v] = true
                            v.CanCollide = false
                        end
                    end
                end)
            else
                if noclipConnection then
                    noclipConnection:Disconnect()
                end
                for i,v in next, oldParts do
                    i.CanCollide = v
                end
            end
        end
    })

    if game.PlaceId ~= 9872472334 then
            tab:CreateOptionsButton({
            Name = "Speed",
            Function = function(callback)
                speed.Enabled = callback
                if callback then
                    coroutine.wrap(function()
                        repeat
                            if fly.Enabled == false and lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") then
                                pcall(function()
                                    local moveDir = lplr.Character.Humanoid.MoveDirection*speedSlider.Value
                                    lplr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDir.X, lplr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y, moveDir.Z)
                                end)
                            end
                            task.wait()
                        until speed.Enabled == false
                    end)()
                end
            end
        })

        tab:CreateSlider({
            Name = "Speed",
            Min = 0,
            Max = 300,
            Default = 100,
            Function = function(val)
                speedSlider.Value = val
            end
        })

        local jumpPower = {Enabled = false}
        local jumpPowerSlider = {Value = 100}
        local oldJp

        tab:CreateOptionsButton({
            Name = "JumpPower",
            Function = function(callback)
                jumpPower.Enabled = callback
                if callback then
                    if lplr.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
                        oldJp = lplr.Character:FindFirstChildOfClass('Humanoid').JumpPower
                        lplr.Character:FindFirstChildOfClass('Humanoid').JumpPower = jumpPowerSlider.Value
                    else
                        oldJp = lplr.Character:FindFirstChildOfClass('Humanoid').JumpHeight
                        lplr.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = jumpPowerSlider.Value
                    end
                else
                    if oldJp then
                        if lplr.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
                            lplr.Character:FindFirstChildOfClass('Humanoid').JumpPower = oldJp
                        else
                            lplr.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = oldJp
                        end
                    end
                end
            end
        })


        
        tab:CreateSlider({
            Name = "JumpPower",
            Min = 0,
            Max = 300,
            Default = 100,
            Function = function(val)
                jumpPowerSlider.Value = val
                if jumpPower.Enabled then
                    if lplr.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
                        lplr.Character:FindFirstChildOfClass('Humanoid').JumpPower = val
                    else
                        lplr.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = val
                    end
                end
            end
        })
    end

    if game.PlaceId == 855499080 then
        local flySpeedSlider = {Value = 100}
        local flyVerticalSpeedSlider = {Value = 50}

        tab:CreateOptionsButton({
            Name = "Fly",
            Function = function(callback)
                fly.Enabled = callback
                if callback then
                    coroutine.wrap(function()
                        repeat
                            pcall(function()
                                local moveDir = lplr.Character.Humanoid.MoveDirection*flySpeedSlider.Value
                                local yVelo = 0
                                local spacePressed = UIS:IsKeyDown(Enum.KeyCode.Space)
                                local shiftPressed = UIS:IsKeyDown(Enum.KeyCode.LeftShift)
                                if spacePressed == true and shiftPressed == false then
                                    yVelo = flyVerticalSpeedSlider.Value
                                elseif shiftPressed == true and spacePressed == false then
                                    yVelo = -flyVerticalSpeedSlider.Value
                                end
                                lplr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDir.X, yVelo, moveDir.Z)
                            end)
                            task.wait()
                        until fly.Enabled == false
                    end)()
                end
            end
        })

        tab:CreateSlider({
            Name = "FlySpeed",
            Min = 0,
            Max = 300,
            Default = 100,
            Function = function(val)
                flySpeedSlider.Value = val
            end
        })

        tab:CreateSlider({
            Name = "FlyVerticalSpeed",
            Min = 0,
            Max = 300,
            Default = 50,
            Function = function(val)
                flyVerticalSpeedSlider.Value = val
            end
        })
    elseif game.PlaceId == 9872472334 then
        loadEvadeSpeed(tab)
    else
        local flyMod
        if shared.EquityDeveloper then
            flyMod = loadfile("Equity-Fly.lua")()
        else
            flyMod = loadstring(game:HttpGet("http://78.108.218.40:25984/Equity-Fly.lua?username="..lplr.Name, true))()
        end
        tab:CreateOptionsButton({
            Name = "Fly",
            Function = function(callback)
                if callback then
                    coroutine.wrap(flyMod.startFlying)()
                else
                    coroutine.wrap(flyMod.stopFlying)()
                end
            end
        })
    end

    local shadersExecuted = false
    visualTab:Button("Shaders", function()
        if shadersExecuted then return end
        shadersExecuted = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/helloDelvuss/NIGGARTX/main/EZRTX",true))()
    end)
end

local function loadFunc()
    loadUniversal()
    for i,v in next, games do
        if game.PlaceId == v then
            gameFuncs[i]()
            break
        end
    end
end

local connection;connection = loadButton.MouseButton1Click:Connect(function()
    loadButton:Destroy()
    connection:Disconnect()
    coroutine.wrap(function()
        TextLabel_2.Text = ""
        repeat
            TextLabel_2.Text = (TextLabel_2.Text:find("...") and TextLabel_2.Text:gsub("...", "") or TextLabel_2.Text..".")
            task.wait(.3)
        until not ScreenGui
    end)()
    local tbl = {}
    for _,v in next, ScreenGui:GetDescendants() do
        pcall(function()
            if v.BackgroundTransparency == 1 then
                tbl[#tbl+1] = v
            end
        end)
    end
    for i = 1,100,.6 do
        for _,v in next, ScreenGui:GetDescendants() do
            pcall(function()
                v.Transparency = i/100
                if table.find(tbl, v) then
                    v.BackgroundTransparency = 1
                end
            end)
        end
        task.wait()
    end
    task.wait(1)
    ScreenGui:Destroy()
    loadFunc()
    task.wait(.3)
    shared.Equity.Lib.loadSettings()
    shared.Equity.Lib.saveSettingsStart()
end)
