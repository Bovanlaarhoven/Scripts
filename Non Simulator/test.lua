if not messagebox then
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Credits:",
            Text = "Thanks to xgamer for helping me a lot while I was making this script.",
            Duration = 10
        }
    )
else
    messagebox("Thanks to xgamer for helping me a lot during the cretion of this script.", "Credits", 1856)
end
local a = game:GetService("Players")
local a = a.LocalPlayer
if getgenv().Activated == true then
    pcall(
        function()
            getgenv().Connections.Stepped_RunService:Disconnect()
            getgenv().Connections.Input_Began:Disconnect()
        end
    )
end
getgenv().Activated = true
getgenv().Connections = {Input_Began = nil, Stepped_RunService = nil}
getgenv().Toggles = {
    InfCola = false,
    NoDunce = false,
    GodMode = false,
    NoTrail = false,
    AutoCola = false,
    MD = false,
    IW = false,
    InfAdrenaline = false,
    NoAdrenalineCooldown = false,
    CC = false,
    InfGrappler = false,
    InfWallClimb = false,
    fastGrapple = false,
    infglide = false,
    padesp = false,
    ws = false,
    sp = false,
    af = false,
    ch = false,
    AE = false
}
getgenv().BagRarity = "Rare"
getgenv().AntiCheat = {
    BanRemotes = {
        "LoadString",
        "HighCombo",
        "FF",
        "SubmitCombo",
        "UpdateCombo",
        "LowCombo",
        "FinishTimeTrial",
        "UpdateDunceList"
    },
    Remotes = {}
}
local b = {"Legendary", "Epic", "Rare", "Common", "Uncommon", "Random"}
getgenv().BAGESP = false
getgenv().Other = {Stimmed = false, CanZipline = true}
getgenv().ATT = false
getgenv().Sliders = {CL = 1, ws = 1, sp = 1, ESPRE = 1000}
getgenv().TS = 5
local c = game.Players.LocalPlayer
local c = {WindowName = "Parkour Cheat V1.3", Color = Color3.fromRGB(255, 128, 64), Keybind = Enum.KeyCode.RightBracket}
local d = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Bracket/main/BracketV3.lua"))()
local c = d:CreateWindow(c, game:GetService("CoreGui"))
local c = c:CreateTab("Main")
local d = c:CreateSection("Gears Section")
local e = c:CreateSection("Gearless Section")
local f = c:CreateSection("Miscellaneous")
local g = c:CreateSection("LocalPlayer")
local h = c:CreateSection("BAG Section", 2)
local i = c:CreateSection("Chat Mods", 2)
local j = c:CreateSection("OP Stuff", 2)
local c = c:CreateSection("Credits Section")
j:CreateButton(
    "Set Dataloss. (dupe stuff)",
    function()
        if messagebox then
            local a, b =
                pcall(
                function()
                    appendfile(
                        "HAS_BEEN_WARNED.txt",
                        "This file only checks if you have already been warned by the dataloss on our script. :)"
                    )
                end
            )
            if not a then
                local a =
                    messagebox(
                    "By clicking the button below (YES), any future progress that you will do during the game will be lost after rejoining, including trades. (this is a one-time warning)",
                    "WARNING",
                    1841
                )
                if a == 1 then
                    messagebox(
                        "Any progress you do by now will be loss after rejoining. (you wont be warned again.)",
                        "WARNING",
                        1840
                    )
                    game:GetService("ReplicatedStorage").UpdateKeybind:FireServer("Three", "Enum.KeyCode.\255")
                    writefile(
                        "HAS_BEEN_WARNED.txt",
                        "This file only checks if you have already been warned by the dataloss on our script. :)"
                    )
                else
                    messagebox("Your progress will still be saved, you cancelled the operation!", "Information", 1856)
                end
            else
                messagebox("Any progress you do by now will be loss after rejoining.", "WARNING", 1840)
                game:GetService("ReplicatedStorage").UpdateKeybind:FireServer("Three", "Enum.KeyCode.\255")
            end
        else
            game.StarterGui:SetCore(
                "SendNotification",
                {Title = "WARNING", Text = "Any progress you do by now will be loss after rejoining.", Duration = 10}
            )
        end
    end
)
c:CreateLabel("Main Dev: Dxy#9823")
c:CreateLabel("Ton of help: xgamer626#1683")
d:CreateLabel("Cola")
d:CreateToggle(
    "Inf Cola",
    getgenv().Toggles.InfCola,
    function(a)
        getgenv().Toggles.InfCola = a
    end
)
d:CreateToggle(
    "Auto Cola",
    getgenv().Toggles.AutoCola,
    function(a)
        getgenv().Toggles.AutoCola = a
    end
)
d:CreateLabel("MagRail")
d:CreateButton(
    "Free magrail (equip magrope)",
    function()
        getupvalue(getsenv(game.Players.LocalPlayer.Backpack:WaitForChild("Main")).updateGrapplerPos, 1).leftarm.Value =
            "MagRail"
    end
)
d:CreateToggle(
    "Infinite MagDash",
    getgenv().Toggles.MD,
    function(a)
        getgenv().Toggles.MD = a
    end
)
d:CreateLabel("Adrenaline")
d:CreateButton(
    "Free adrenaline. (equip zipline kit)",
    function()
        getupvalue(getsenv(game.Players.LocalPlayer.Backpack:WaitForChild("Main")).updateGrapplerPos, 1).back.Value =
            "AdrenalineBelt"
    end
)
d:CreateToggle(
    "Infinite Adrenaline",
    getgenv().Toggles.InfAdrenaline,
    function(a)
        getgenv().Toggles.InfAdrenaline = a
    end
)
d:CreateToggle(
    "Auto Eject",
    getgenv().Toggles.AE,
    function(a)
        getgenv().Toggles.AE = a
    end
)
e:CreateToggle(
    "Inf WallRun",
    getgenv().Toggles.IW,
    function(a)
        getgenv().Toggles.IW = a
    end
)
e:CreateToggle(
    "Remove Charge CC",
    getgenv().Toggles.CC,
    function(a)
        getgenv().Toggles.CC = a
    end
)
f:CreateToggle(
    "No Dunce cap",
    getgenv().Toggles.NoDunce,
    function(a)
        getgenv().Toggles.NoDunce = a
    end
)
f:CreateToggle(
    "GodMode",
    getgenv().Toggles.GodMode,
    function(a)
        getgenv().Toggles.GodMode = a
    end
)
f:CreateToggle(
    "No Trail",
    getgenv().Toggles.NoTrail,
    function(a)
        getgenv().Toggles.NoTrail = a
    end
)
g:CreateToggle(
    "Always Flow",
    getgenv().Toggles.af,
    function(a)
        getgenv().Toggles.af = a
    end
)
g:CreateToggle(
    "Inf Combo health",
    getgenv().Toggles.ch,
    function(a)
        getgenv().Toggles.ch = a
    end
)
g:CreateToggle(
    "Modify Combo",
    getgenv().Toggles.CL,
    function(a)
        getgenv().Toggles.CL = a
    end
)
g:CreateSlider(
    "Combo Level",
    1,
    5,
    0,
    true,
    function(a)
        getgenv().Sliders.CL = a
    end
)
g:CreateToggle(
    "Modify Walkspeed",
    getgenv().Toggles.ws,
    function(a)
        getgenv().Toggles.ws = a
    end
)
g:CreateSlider(
    "walkspeed",
    1,
    20,
    1,
    false,
    function(a)
        getgenv().Sliders.ws = a
    end
)
g:CreateToggle(
    "mod Slidespeed",
    getgenv().Toggles.sp,
    function(a)
        getgenv().Toggles.sp = a
    end
)
g:CreateSlider(
    "Slidespeed",
    1,
    1000,
    1,
    false,
    function(a)
        getgenv().Sliders.sp = a
    end
)
d:CreateLabel("Grappler")
d:CreateToggle(
    "Inf grappler",
    getgenv().InfGrappler,
    function(a)
        getgenv().Toggles.InfGrappler = a
    end
)
e:CreateToggle(
    "Inf WallClimb",
    getgenv().Toggles.InfWallClimb,
    function(a)
        getgenv().Toggles.InfWallClimb = a
    end
)
d:CreateToggle(
    "Fast Grappler",
    getgenv().Toggles.fastGrapple,
    function(a)
        getgenv().Toggles.fastGrapple = a
    end
)
d:CreateLabel("Extra")
d:CreateButton(
    "Free Paraglider. (equip zipline kit)",
    function()
        getupvalue(getsenv(game.Players.LocalPlayer.Backpack:WaitForChild("Main")).updateGrapplerPos, 1).back.Value =
            "Paraglider"
    end
)
d:CreateToggle(
    "Inf Glide",
    getgenv().Toggles.infglide,
    function(a)
        getgenv().Toggles.infglide = a
    end
)
h:CreateSlider(
    "BAG ESP Render",
    200,
    3500,
    1000,
    false,
    function(a)
        getgenv().Sliders.ESPRE = a
    end
)
h:CreateToggle(
    "Bag Esp",
    getgenv().BAGESP,
    function(a)
        getgenv().BAGESP = a
    end
)
h:CreateDropdown(
    "Bag Rarity",
    b,
    function(a)
        getgenv().BagRarity = a
    end
)
h:CreateButton(
    "Go to bag",
    function()
        for a, a in pairs(workspace:GetChildren()) do
            if a:FindFirstChild("BagTouchScript") and a:FindFirstChild("Rarity") then
                if a.Rarity.Value == "Random" then
                    final = a.Main.CFrame
                    local a = game:GetService("TweenService")
                    a:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(math.random(7, 10)),
                        {CFrame = final}
                    ):Play()
                else
                    if a.Rarity.Value == getgenv().BagRarity then
                        final = a.Main.CFrame
                        local a = game:GetService("TweenService")
                        a:Create(
                            game.Players.LocalPlayer.Character.HumanoidRootPart,
                            TweenInfo.new(math.random(7, 10)),
                            {CFrame = final}
                        ):Play()
                    end
                end
            end
        end
    end
)
f:CreateLabel("Trials (risky)")
f:CreateSlider(
    "Trial Speed",
    5,
    60,
    5,
    false,
    function(a)
        getgenv().TS = a
    end
)
f:CreateButton(
    "Complete current trial",
    function(a)
        local a = game:GetService("Workspace").TimeTrials
        for a, a in pairs(a:GetChildren()) do
            if a.Name == "TimeTrial" then
                if a.End.Transparency ~= 1 then
                    local a = a.End.CFrame
                    local b = game:GetService("TweenService")
                    b:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(getgenv().TS),
                        {CFrame = a}
                    ):Play()
                    break
                end
            end
        end
    end
)
i:CreateToggle(
    "RGB Chat",
    false,
    function(a)
        game.ReplicatedStorage.BubbleColours:WaitForChild(game.Players.LocalPlayer.Name).RGB.Value = a
    end
)
i:CreateColorpicker(
    "Chat Text Color",
    function(a)
        print(a, type(a))
        game.ReplicatedStorage.BubbleColours:WaitForChild(game.Players.LocalPlayer.Name).TextColour.Value = a
    end
)
i:CreateColorpicker(
    "Chat BG Color",
    function(a)
        print(a, type(a))
        game.ReplicatedStorage.BubbleColours:WaitForChild(game.Players.LocalPlayer.Name).Value = a
    end
)
local b = a.PlayerScripts.Points
local b = getsenv(b)
local b = rawget(getrawmetatable(b), "__index")
local b = rawget(rawget(b, "shared"), "triggerPointsFunction")
local c = getrawmetatable(game)
setreadonly(c, false)
local d = c.__namecall
if b and type(b) == "function" then
    local a
    for b, b in pairs(debug.getupvalues(b)) do
        if type(b) == "table" and rawget(b, "parkour") and rawget(b, "statAdd") and rawget(b, "missionTrigger") then
            a = b
            break
        end
    end
    if a then
        for a, b in pairs(a) do
            for b, b in pairs(debug.getupvalues(b)) do
                if b.ClassName == "RemoteEvent" then
                    getgenv().AntiCheat.Remotes[a] = b
                    break
                end
            end
        end
    end
end
c.__namecall =
    newcclosure(
    function(a, ...)
        local b = getnamecallmethod()
        if b == "FireServer" and table.find(getgenv().AntiCheat.BanRemotes, a.Name) then
            return nil
        elseif b == "InvokeServer" and table.find(getgenv().AntiCheat.BanRemotes, a.Name) then
            return nil
        elseif b == "FireServer" and a == getgenv().AntiCheat.Remotes.statAdd then
            return nil
        elseif b == "FireServer" and a.Name == "SetTrail" and getgenv().Toggles.NoTrail == true then
            return nil
        elseif b == "TakeDamage" and a.ClassName and getgenv().Toggles.GodMode == true then
            return nil
        end
        return d(a, ...)
    end
)
local b = game:GetService("Players")
local c = game:GetService("ReplicatedStorage")
local c = game:GetService("VirtualInputManager")
local d = game:GetService("RunService")
local d = game:GetService("Players")
local e = game:GetService("ReplicatedStorage")
local e = game:GetService("ScriptContext")
local d = d.LocalPlayer
local e = b.LocalPlayer
local f = e.Name
local b = b
local b = e
local f = false
local f = game.Workspace.CurrentCamera
d = game.Players.LocalPlayer
getgenv().alive = false
if getgenv().exec == nil or not getgenv().exec then
    getgenv().exec = true
    b = game.Players.LocalPlayer
    local a = game.Workspace.CurrentCamera
    local a = function(...)
        local a, b = a.WorldToViewportPoint(a, ...)
        return Vector2.new(a.X, a.Y), b, a.Z
    end
    local function c(a)
        return math.floor(a + 0.5)
    end
    local d = {}
    function CreateESP(a)
        local b = {}
        b.Name = Drawing.new("Text")
        b.Name = Drawing.new("Text")
        b.Name.Visible = true
        b.Name.Font = 0
        b.Name.Center = true
        b.Name.Size = 15
        b.Name.Outline = true
        b.Name.OutlineColor = Color3.fromRGB(0, 0, 0)
        b.Name.Color = a.Main.Color
        b.NameText = ""
        b.TG = a
        d[a] = b
    end
    function RemoveEsp(a)
        if (rawget(d, a)) then
            for a, a in pairs(d[a]) do
                a:Remove()
            end
            d[a] = nil
        end
    end
    function Update(d, e)
        local b = b.Character
        local d = d
        local f, g =
            pcall(
            function()
                local a = e.TG
                local a = e.TG.Main
            end
        )
        if d and f then
            if getgenv().BAGESP then
                if getgenv().Sliders.ESPRE < c((b.HumanoidRootPart.Position - d.Main.Position).magnitude) then
                    e.Name.Visible = false
                    return
                end
                local f = d.Main.Position
                local a, f = a(f)
                e.Name.Visible = f
                if f and d then
                    e.Name.Text =
                        d.Rarity.Value ..
                        "\n" .. c((b.HumanoidRootPart.Position - e.TG.Main.Position).magnitude) .. " m"
                    e.Name.Position = Vector2.new(a.X, a.Y)
                end
            else
                e.Name.Visible = false
            end
        else
            e.Name.Visible = false
        end
    end
    for a, a in pairs(workspace:GetChildren()) do
        if a:FindFirstChild("BagTouchScript") and a:FindFirstChild("Rarity") then
            CreateESP(a)
        end
    end
    task.spawn(
        function()
            game:GetService("RunService"):BindToRenderStep(
                "esp",
                Enum.RenderPriority.Camera.Value,
                function()
                    for a, c in pairs(d) do
                        if (c and a ~= b) then
                            Update(a, c)
                        end
                    end
                end
            )
        end
    )
end
getgenv().settings = {
    fillcolor = Color3.fromRGB(255, 255, 255),
    filltransparency = .75,
    outlinecolor = Color3.fromRGB(255, 255, 255),
    outlinetransparency = 0
}
local b = game:service "Players".LocalPlayer
local b = Instance.new("Folder", game:service "CoreGui")
local function d(a)
    local b = Instance.new("Highlight", b)
    b.Adornee = a
    b.FillColor = getgenv().settings.fillcolor
    b.FillTransparency = getgenv().settings.filltransparency
    b.OutlineColor = getgenv().settings.outlinecolor
    b.OutlineTransparency = getgenv().settings.outlinetransparency
    b.Enabled = getgenv().Toggles.padesp
    b.Adornee.Changed:Connect(
        function()
            b.Enabled = getgenv().Toggles.padesp
            if not b.Adornee or not b.Adornee.Parent then
                b:Destroy()
            end
        end
    )
    return b
end
local function b(a)
    if a.Name == "Pad" or a.Name == "Pillow" then
        d(a)
    end
end
getgenv().Connections.Stepped_RunService =
    game:GetService("RunService").Stepped:Connect(
    function()
        if a.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Backpack:FindFirstChild("Main") then
            local b = game.Players.LocalPlayer.Backpack:WaitForChild("Main")
            local d = getupvalue(getsenv(b).charJump, 1)
            local f = getupvalue(getsenv(b).resetAmmo, 1)
            local b = getsenv(b)
            encrypt = function(a)
                local a, a = pcall(b.encrypt, a)
                return a
            end
            getgenv().alive = true
            local b = game:GetService("Players").LocalPlayer.PlayerGui.NewUI.Windows.Keybinds.Window.Cola.Binding
            local e = e.Character
            if getgenv().Toggles.InfCola then
                d.lastDrink = 0
            end
            if getgenv().Toggles.MD then
                d.lastMagSlap = 0
            end
            if getgenv().Toggles.NoDunce == true then
                local b = getrenv().shared
                b.dunces[a.Name] = false
            end
            if getgenv().Toggles.IW == true then
                d.recentWallruns = 0
                d.lastWR = 0
                d.maxWallrun = math.huge
                d.numWallrun = math.huge
            end
            if getgenv().Toggles.CC == true then
                d.chargeCooldown = 0
            else
                d.chargeCooldown = 2
            end
            if getgenv().Toggles.ws == true then
                d.walkspeedMult = getgenv().Sliders.ws
            else
                d.walkspeedMult = 1
            end
            if getgenv().Toggles.sp == true then
                d.slidespeed = getgenv().Sliders.sp
            end
            if getgenv().Toggles.InfGrappler then
                f.canGrapple = true
            end
            if getgenv().Toggles.InfWallClimb then
                f.numWallclimb = 2
            end
            if getgenv().Toggles.fastGrapple then
                d.grappling = false
            end
            if getgenv().Toggles.infglide then
                f.glideStamina = 1
            end
            if getgenv().Toggles.af then
                d.flowActive = true
                d.flowDelta = 100
            end
            if
                getgenv().Toggles.autosell and
                    game:GetService("ReplicatedStorage").PlayerData.LocalPlayer.Generic.Points.Value > 10000
             then
                local a = game:GetService("ReplicatedStorage").Reset
                a:InvokeServer()
            end
            if getgenv().Toggles.ch then
                d.comboHealth = 100
            end
            if getgenv().Toggles.CL == true then
                d.comboTime = 1000
                d.comboXp = 1
                d.comboLevel = getgenv().Sliders.CL
            end
            if getgenv().Toggles.AE then
                if (game:GetService("Players").LocalPlayer.PlayerGui.GameplayUI.AdrenalineBar.Bar.AbsoluteSize.X) ~= 0 then
                    if
                        (game:GetService("Players").LocalPlayer.PlayerGui.GameplayUI.AdrenalineBar.Bar.AbsoluteSize.X) <=
                            8
                     then
                        local a =
                            game:GetService("Players").LocalPlayer.PlayerGui.NewUI.Windows.Keybinds.Window.UseKit.Binding
                        c:SendKeyEvent(true, a.Text, false, game)
                    end
                end
            end
            if getgenv().Toggles.AutoCola then
                local a = e.Humanoid
                local a = a.Health
                if a >= 1 and true then
                    if a < 100 then
                        c:SendKeyEvent(true, b.Text, false, game)
                    end
                end
            end
        else
            getgenv().alive = false
            getgenv().Other.Stimmed = false
        end
    end
)
UserInputService = game:GetService("UserInputService")
getgenv().Connections.Input_Began =
    UserInputService.InputBegan:Connect(
    function(b, c)
        local d = game.Players.LocalPlayer.Backpack:WaitForChild("Main")
        local d = getupvalue(getsenv(d).resetAmmo, 1)
        local a = a.PlayerGui.NewUI.Windows.Keybinds.Window.UseKit.Binding
        if b.KeyCode == Enum.KeyCode[a.Text] and not c then
            if getgenv().Toggles.InfAdrenaline == false then
                getgenv().Other.Stimmed = false
                return
            else
                if getgenv().Other.Stimmed == true then
                    getgenv().Other.Stimmed = false
                    if getgenv().Toggles.NoAdrenalineCooldown then
                        d.adrenalineCooldown = 0.3
                    else
                        d.adrenalineCooldown = 30
                    end
                elseif getgenv().Other.Stimmed == false then
                    getgenv().Other.Stimmed = true
                    task.wait(.2)
                    d.adrenalineCooldown = math.huge
                end
            end
        end
    end
)
