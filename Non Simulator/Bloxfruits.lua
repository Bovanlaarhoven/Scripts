repeat wait() until game:IsLoaded()
local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
local Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/Util/main/Load.lua"))()
local plr = game:GetService("Players").LocalPlayer
local Enemy = workspace.Enemies:GetChildren()
local Lvl = game:GetService("Players")[plr.Name].Data.Level.Value
local IslandsFolder = workspace._WorldOrigin.Locations

local getClosest = function()
    local closest = nil
    local dist = math.huge
    for _, v in pairs(Enemy) do
        local enemyName = v.Name
        if not string.find(enemyName, "%[Boss%]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local mag = (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
            if mag < dist then
                closest = v
                dist = mag
            end
        end
    end
    return closest
end

local TpEnemy = function()
    Util.CTween:go(plr, getClosest().HumanoidRootPart.CFrame, 1) 
end

local Click = function()
    local screenSize = workspace.CurrentCamera.ViewportSize
    local screenCenter = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
    mouse1click(screenCenter.X, screenCenter.Y)
end

local KillEnemy = function()
    local Enemy = getClosest()
    if Enemy then
        repeat
            Click()
            wait()
        until Enemy.Humanoid.Health <= 0
    end
end

local AutoFarm = function()
    while wait() do
        TpEnemy()
        KillEnemy()
    end
end

AutoFarm()
