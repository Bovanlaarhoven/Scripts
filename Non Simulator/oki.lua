local MainEvent = game:GetService("ReplicatedStorage").MainEvent
local function getClosestPlayer(players)
    local closestPlayer, closestDistance
    local cameraPos = workspace.CurrentCamera.CFrame.Position
    local localPlayer = game.Players.LocalPlayer
    for i = 1, #players do
        local player = players[i]
        local character = player.Character
        if player ~= localPlayer and character and character:IsDescendantOf(workspace) then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.RootPart then
                local rootPartPos = humanoid.RootPart.Position
                local distanceFromCamera = (rootPartPos - cameraPos).Magnitude
                if not closestDistance or distanceFromCamera < closestDistance then
                    closestPlayer = player
                    closestDistance = distanceFromCamera
                end
            end
        end
    end
    return closestPlayer
end

local players = game:GetService("Players"):GetPlayers()

local closestPlayer = getClosestPlayer(players)

print("The closest player is: " .. closestPlayer.Name)


local old
old = hookmetamethod(game, "__namecall", function(...)
    local args = {...}
    local method = getnamecallmethod()
    local self = args[1]
    if not checkcaller() and (method == "FireServer" and self == MainEvent) then
        args[2] = closestPlayer.Character.HumanoidRootPart.CFrame
    end
    return old(...)
end)