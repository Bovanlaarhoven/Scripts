local lplr = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local Entities = game:GetService("Players")
local LocalPlayer = Entities.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Players = Entities
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Shark bite 2",
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


local Tab = Window:CreateTab("Main")
local Tab1 = Window:CreateTab("Gunmods")

local sb = {
    ProjStats = require(game:GetService("ReplicatedStorage").Projectiles.ProjectileStatsModule),
    HitRemote = debug.getupvalue(debug.getupvalue(debug.getupvalue(require(lplr.PlayerScripts.ProjectilesClient.WeaponScript.HitScanFire).Fire, 8), 4), 2),
}

local yoffset = 20
local Slider = Tab:CreateSlider({
    Name = "Y Offset",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Offset",
    CurrentValue = 20,
    Flag = "Slider1",
    Callback = function(Value)
        yoffset = Value
    end,
})


local sharkAutoFarm = true
local Toggle = Tab:CreateToggle({
    Name = "Shark Auto Farm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(callback)
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
                    lplr.Character.HumanoidRootPart.CFrame = (shark.PrimaryPart.CFrame + Vector3.new(0,yoffset,0))
                    coroutine.wrap(function()
                        sb.HitRemote:FireServer(shark)
                    end)()
                end
                task.wait()
            until sharkAutoFarm == false
        else
            sharkAutoFarm = false
        end
    end,
})

local fireRate = math.huge
local spread = 0
local magSize = 9e9
local recoil = Vector3.new(0,0,0)
local reloadTime = 1e-123

local gunModsEnabled = false
local Toggle = Tab1:CreateToggle({
   Name = "Gun Mods",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(callback)
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

local Slider = Tab1:CreateSlider({
    Name = "Fire Rate",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Rate",
    CurrentValue = 1000,
    Flag = "Slider1",
    Callback = function(Value)
        fireRate = Value
        if gunModsEnabled then
            for _,v in next, sb.ProjStats.get() do
                v.FireRate = Value
            end
        end
    end,
})

local Slider = Tab1:CreateSlider({
    Name = "Reload Time",
    Range = {0, 10},
    Increment = 10,
    Suffix = "Time",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        reloadTime = Value
        if gunModsEnabled then
            for _,v in next, sb.ProjStats.get() do
                v.ReloadTime = Value
            end
        end
    end,
})

local Slider = Tab1:CreateSlider({
    Name = "Mag Size",
    Range = {0, 5000},
    Increment = 1,
    Suffix = "Size",
    CurrentValue = 0,
    Flag = "Slider1",
    Callback = function(Value)
        magSize = Value
        if gunModsEnabled then
            for _,v in next, sb.ProjStats.get() do
                v.MagSize = Value
            end
        end
    end,
})

local Slider = Tab1:CreateSlider({
    Name = "Spread",
    Range = {0, 10},
    Increment = 1,
    Suffix = "Spread",
    CurrentValue = 0,
    Flag = "Slider1",   
    Callback = function(Value)
        spread = Value
        if gunModsEnabled then
            for _,v in next, sb.ProjStats.get() do
                v.Spread = Value/10
            end
        end
    end,
})