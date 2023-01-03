local lplr = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local Entities = game:GetService("Players")
local LocalPlayer = Entities.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Players = Entities
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Silent aim",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "ABCD",
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

local tab = Window:CreateTab("main", 4483362458)
local tab1 = Window:CreateTab("Gun mods", 4483362458)

local arsenal = {
    Weapons = require(lplr.PlayerGui.GUI.Client.Functions.Weapons),
}

local silentAimMode = "Legit"
local wallbangEnabled = false
local silentAimEnabled = false
local silentAimHitPart = "Head"


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

local Toggle = tab:CreateToggle({
    Name = "Silent aim",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        silentAimEnabled = Value
    end,
})

local Dropdown = tab:CreateDropdown({
    Name = "SilentAim Mode",
    Options = {"Legit","Blatant"},
    CurrentOption = "Legit",
    Flag = "Dropdown1",
    Callback = function(Option)
        silentAimMode = Option
    end,
})

 local Slider = tab:CreateSlider({
    Name = "Fov Value",
    Range = {1, 900},
    Increment = 1,
    Suffix = "Fov",
    CurrentValue = 120,
    Flag = "Slider1",
    Callback = function(Value)
        fovValue = Value
    end,
})

local Dropdown = tab:CreateDropdown({
    Name = "HitPart",
    Options = {"Head","HumanoidRootPart", "Random"},
    CurrentOption = "Head",
    Flag = "Dropdown1",
    Callback = function(Option)
        silentAimHitPart = Option
    end,
})

local vals = {
    FireRate = 20,
    Recoil = 0,
    Auto = true
}

local oldVals = {}
local oldFunc = arsenal.Weapons.getammo
local gunModsEnabled
local Toggle = tab1:CreateToggle({
    Name = "Gun mods",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(callback)
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
    end,
})

local Slider = tab1:CreateSlider({
    Name = "FireRate",
    Range = {20, 500},
    Increment = 1,
    Suffix = "Fire rate",
    CurrentValue = 20,
    Flag = "Slider1",
    Callback = function(val)
        if gunModsEnabled then
            for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                if v:FindFirstChild("FireRate") then v.FireRate.Value = val/1000 end
            end
        end
        vals.FireRate = val
    end,
})

local Slider = tab1:CreateSlider({
    Name = "Recoil",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Fire rate",
    CurrentValue = 0,
    Flag = "Slider1",
    Callback = function(val)
        if gunModsEnabled then
            for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                if v:FindFirstChild("RecoilControl") then v.RecoilControl.Value = val/100 end
            end
        end
        vals.Recoil = val
    end,
})

local Toggle = tab1:CreateToggle({
    Name = "Auto Fire",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(callback)
        if gunModsEnabled then
            for _,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
                if v:FindFirstChild("Auto") then v.Auto.Value = vals.Auto end
            end
        end
        vals.Auto = callback
    end,
})