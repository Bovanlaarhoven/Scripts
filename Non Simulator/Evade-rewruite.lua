local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local uis = game:GetService("UserInputService")
local char = lplr.Character
local camera =  workspace.CurrentCamera
local runservice = game:GetService("RunService")
local teleportservice = game:GetService("TeleportService")
local Id = nil
local OldFov
local keys = {}
local canFly = false
local flySpeed = 10
local lightning = game:GetService("Lighting")

getgenv().Disabled = false

local function Downed(plr)
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

local function revive(plr, status)
    return game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(plr.Name, status)
end

local function Respawn()
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end

local function Disable()
    for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
        v:Disable()
    end
    
    for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
        v:Disable()
    end
end

for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == "Menu" ~= nil then
        Respawn()
        if getgenv().Disabled == false then
            Disable()
            getgenv().Disabled = true
        end
    elseif Downed(lplr) ~= nil then
        Respawn()
        if getgenv().Disabled == false then
            Disable()
            getgenv().Disabled = true
        end
    else
        print("working")
        if getgenv().Disabled == false then
            Disable()
            getgenv().Disabled = true
        end
    end
end


local function updateChar()
    local character = game:GetService("Players").LocalPlayer.Character
    if character then
        char = character
    end
end

updateChar()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(updateChar)

uis.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        keys[input.KeyCode] = true
    end
end)

uis.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        keys[input.KeyCode] = false
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if canFly and char then
        local forward = (keys[Enum.KeyCode.W] and 1 or 0) - (keys[Enum.KeyCode.S] and 1 or 0)
        local right = (keys[Enum.KeyCode.D] and 1 or 0) - (keys[Enum.KeyCode.A] and 1 or 0)
        local up = (keys[Enum.KeyCode.Space] and 1 or 0) - (keys[Enum.KeyCode.LeftControl] and 1 or 0)

        local camera = workspace.CurrentCamera
        local cf = camera.CFrame
        local unit = cf.lookVector
        local upUnit = Vector3.new(0, 1, 0)
        local rightUnit = unit:Cross(upUnit)

        local targetVelocity = (unit * forward + rightUnit * right) * flySpeed + upUnit * up * flySpeed
        char.HumanoidRootPart.Velocity = targetVelocity
    end
end)

local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Robobo2022/notify-lib/main/lib'),true))()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
setclipboard("https://link-hub.net/488828/key-for-hydra-network")

local Window = Rayfield:CreateWindow({
    Name = "Evade",
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
	KeySystem = true,
	KeySettings = {
		Title = "Hydra Network",
		Subtitle = "Key System",
		Note = "Key link copied in clipboard!",
		FileName = "SiriusKey",
		SaveKey = false,
		GrabKeyFromSite = true,
		Key = "https://pastebin.com/raw/tmEjATBA"
	}
})

local Settings = {
    JumpPower = 20,
    WalkSpeed = 20,
    JumpEnabled = false,
    WalkEnabled = false,
    CameraShake = false,
    FearFov = false,
    AutoRespawn = false,
    WebhookOnImportant = false,
    ReviveFarm = false,
    LeverEsp = false,
    BotEsp = false,
    EspColor = Color3.fromRGB(255, 255, 255),
    AfkFarm = false,
}

local T1 = Window:CreateTab("Main")
local T2 = Window:CreateTab("Player")
local T3 = Window:CreateTab("Misc")
local T4 = Window:CreateTab("Visuals")
local T5 = Window:CreateTab("Game")

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    if (Settings.WalkEnabled or Settings.JumpEnabled) and self and self.Name == "Communicator" and args[1] == "update" then
        return (Settings.WalkEnabled and Settings.WalkSpeed*100 or 1500), (Settings.JumpEnabled and Settings.JumpPower or 3)
    end
    return old(self,...)
end)

task.defer(function()
    while task.wait() do
        if Settings.CameraShake then
            lplr.PlayerScripts.CameraShake.Value = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.FearFov then
            if lplr.PlayerScripts.FOVAdjusters.Fear.Value then
                OldFov = lplr.PlayerScripts.FOVAdjusters.Fear.Value
                OldFov.PlayerScripts.FOVAdjusters.Fear.Value = 1
            else
                OldFov = lplr.PlayerScripts.FOVAdjusters.Fear.Value
                lplr.PlayerScripts.FOVAdjusters.Fear.Value = 1
            end
        else
            if OldFov then
                if lplr.PlayerScripts.FOVAdjusters.Fear.Value then
                    lplr.PlayerScripts.FOVAdjusters.Fear.Value = OldFov
                else
                    lplr.PlayerScripts.FOVAdjusters.Fear.Value = OldFov
                end
                
            end
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.AutoRespawn then
            if char:GetAttribute("Downed") then
                Respawn()
            end
        end
    end
end)

task.defer(function()
    while task.wait() do
        if Settings.AfkFarm then
            char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(6007, 7005, 8005)
        end
    end
end)

--Switch esp
function esp(Object)
    pcall(function()
        local text = Drawing.new("Text")
        text.Visible = true
        text.Center = true
        text.Outline = true
        text.Color = Settings.EspColor
        text.OutlineColor = Settings.EspColor
        text.Size = 18
    
        local renderstepped 
        renderstepped = runservice.RenderStepped:Connect(function()
            if Object then
                local vector, onScreen
                vector, onScreen = camera:WorldToViewportPoint(Object.Position)
                local distance = (Object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                local distanceInMeters = distance * 0.282
                text.Text = string.format("%s\nDistance: %.2f Meters", Object.Name, distanceInMeters)
                if onScreen then
                    text.Position = Vector2.new(vector.X, vector.Y)
                    text.Visible = Settings.LeverEsp
                else
                    text.Visible = false
                end
            else
                text.Visible = false
                text:Remove()
                renderstepped:Disconnect()
            end
        end)
    end)
end

for _,v in pairs(game:GetService("Workspace").Game.Map:GetDescendants()) do
    if v.Name == "Switch" and v:FindFirstChild("Switch") then
        esp(v)
    end
end

--bot esp

function BotEsp(plr)
    if plrs:GetPlayerFromCharacter(plr) == nil then
        local line = Drawing.new("Line")
        local text = Drawing.new("Text")
        runservice.RenderStepped:Connect(function()
            if plr:FindFirstChild("HumanoidRootPart") then
                local Vector, OnScreen = camera:WorldToViewportPoint(plr.HumanoidRootPart.Position)
                if OnScreen then
                    local Distance = (plr.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).magnitude
                    text.Visible = Settings.BotEsp
                    line.Visible = Settings.BotEsp
                    text.Color = Settings.EspColor
                    text.OutlineColor = Settings.EspColor
                    text.Text = string.format("%s\nDistance: %.2f Studs", plr.Name, Distance)
                    text.Position = Vector2.new(Vector.X, Vector.Y)
                    line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    line.To = Vector2.new(Vector.X, Vector.Y)
                    line.Color = Settings.EspColor
                    line.Thickness = 2
                else
                    line.Visible = false
                    text.Visible = false
                end
            else
                pcall(function()
                    line.Visible = false
                    text.Visible = false
                end)
            end
            if not plr:FindFirstChild("HumanoidRootPart") or not plr:FindFirstChild("HumanoidRootPart"):IsDescendantOf(game:GetService("Workspace")) then
                pcall(function()
                    line:Remove()
                    text:Remove()
                end)
            end
        end)
    end
end

for _,v in pairs(game:GetService'Workspace'.Game.Players:GetChildren()) do
    BotEsp(v)
end

game:GetService'Workspace'.Game.Players.ChildAdded:Connect(function(plr)
    BotEsp(plr)
end)


local Toggle = T2:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.WalkEnabled = Value
    end,
})

local Slider = T2:CreateSlider({
    Name = "WalkSpeed slider",
    Range = {0, 100},
    Increment = 10,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.WalkSpeed = Value
    end,
})

local Toggle = T2:CreateToggle({
    Name = "Enable JumpPower",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.JumpEnabled = Value
    end,
})

local Slider = T2:CreateSlider({
    Name = "JumpPower slider",
    Range = {0, 100},
    Increment = 10,
    Suffix = "Power",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        Settings.JumpPower = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Disable Camera Shake",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.CameraShake = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Disable Fear Fov Change",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.FearFov = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Auto Respawn",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.AutoRespawn = Value
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Revive Farm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.ReviveFarm = Value
        if Value then
            coroutine.wrap(function()
                repeat
                    local suc,res = pcall(function()
                        for _,v in next, game.Players:GetPlayers() do
                            if v and v ~= lplr and Downed(v) and not isCarried(v) then
                                plrs = v
                                task.spawn(function()
                                    for _ = 1,30 do
                                        if Downed(lplr) then Respawn() end
                                        if plrs ~= v or not Downed(v) or isCarried(v) then return end
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
                    if not suc then Lib:prompt("[ReviveAutoFarm Error]: "..res, 5) end
                    task.wait()
                until Settings.ReviveFarm == false
            end)()
        end
    end,
})

local Toggle = T1:CreateToggle({
    Name = "Afk AutoFarm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.AfkFarm = Value
    end,
})

local Toggle = T4:CreateToggle({
    Name = "Lever Esp",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.LeverEsp = Value
    end,
})

local Dropdown = T5:CreateDropdown({
    Name = "Teleport Choose",
    Options = {"Main", "BigTeam", "SocialSpace", "TeamDeathmatch", "Casual", "VcOnly", "Infection", "Pro", "PlayerNextbot"},
    CurrentOption = "Choose a game",
    Flag = "Dropdown1",
    Callback = function(Option)
        if Option == "Main" then
            Id = 9872472334
        elseif Option == "BigTeam" then
            Id = 10324346056
        elseif Option == "SocialSpace" then
            Id = 10324347967
        elseif Option == "TeamDeathmatch" then
            Id = 10539706691
        elseif Option == "Casual" then
            Id = 10662542523
        elseif Option == "VcOnly" then
            Id = 10808838353
        elseif Option == "Infection" then
            Id = 11353532384
        elseif Option == "Pro" then
            Id = 11353528705
        elseif Option == "PlayerNextbot" then
            Id = 11987867148
        end
    end,
})

local Button = T5:CreateButton({
    Name = "Teleport to game",
    Callback = function()
        teleportservice:Teleport(Id,lplr)
    end,
})

local Toggle = T4:CreateToggle({
    Name = "Toggle esp",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Settings.BotEsp = Value
    end,
})

local ColorPicker = T4:CreateColorPicker({
    Name = "Bot Esp Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1",
    Callback = function(Value)
        Settings.EspColor = Value
    end
})

local Slider = T1:CreateSlider({
    Name = "Brightness slider",
    Range = {0, 10},
    Increment = 1,
    Suffix = "Brightness",
    CurrentValue = 1,
    Flag = "Slider1",
    Callback = function(Value)
        lightning.Brightness = Value
    end,
})

local Slider = T2:CreateSlider({
    Name = "Fly Speed",
    Range = {0, 100},
    Increment = 10,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        flySpeed = Value
    end,
})

local Keybind = T2:CreateKeybind({
    Name = "Start Fly",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "Keybind1", 
    Callback = function(Keybind)
        canFly = not canFly
    end,
})

