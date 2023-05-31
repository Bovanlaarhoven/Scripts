local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local lplr = Players.LocalPlayer
local mouse = lplr:GetMouse()
local camera = Workspace.CurrentCamera
local RaycastModule = require(ReplicatedStorage.GunSystem.Raycast)

local function distance(position1, position2)
    return (position1 - position2).magnitude
end

local function findHumanoidRootPart(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        return humanoidRootPart
    end

    for _, child in ipairs(character:GetDescendants()) do
        if child:IsA("BasePart") and child.Name == "HumanoidRootPart" then
            return child
        end
    end

    return nil
end

local function findClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= lplr then
            local character = player.Character
            if character then
                local humanoidRootPart = findHumanoidRootPart(character)
                if humanoidRootPart then
                    local characterPosition = humanoidRootPart.Position
                    local playerDistance = distance(mouse.Hit.p, characterPosition)
                    if playerDistance < closestDistance then
                        closestPlayer = player
                        closestDistance = playerDistance
                    end
                end
            end
        end
    end

    return closestPlayer
end

local closestPlayer = findClosestPlayer()

local originalRaycast = RaycastModule.Raycast
hookfunction(RaycastModule.Raycast, function(value)
    if closestPlayer then
        local targetPart = findHumanoidRootPart(closestPlayer.Character)
        if targetPart then
            local ray = Workspace:Raycast(camera.CFrame.Position, (targetPart.Position - camera.CFrame.Position).Unit * 1000)
            if ray then
                return ray
            end
        end
    end
    return originalRaycast(value)
end)
