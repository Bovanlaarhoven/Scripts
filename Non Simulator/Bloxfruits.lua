repeat wait() until game:IsLoaded()
local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
local Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/Util/main/Load.lua"))()
local plr = game:GetService("Players").LocalPlayer
local tools = {}
local Enemy = workspace.Enemies:GetChildren()
local Vu = game:GetService("VirtualUser")

for _,v in pairs(plr.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(tools, v.Name)
    end
end

local getClosest = function()
    local closest = nil
    local dist = math.huge
    for _,v in pairs(Enemy) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
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

local function getClosestPosition2D()
    local closestPosition3D = getClosest().HumanoidRootPart.Position
    local closestPosition2D = Vector2.new(closestPosition3D.X, closestPosition3D.Z)
    return closestPosition2D
end

local Click = function()
    local closestPosition2D = getClosestPosition2D()
    Vu:Button1Down(closestPosition2D)
    wait()
    Vu:Button1Up(closestPosition2D)
end


local Kill = function()
    for i = 1, 10 do
        Click()
        wait(0.1)
    end
end

TpEnemy()
wait(0.1)
Kill()