local Players = game:GetService("Players")
local mouse = Players.LocalPlayer:GetMouse()

local function getClosestPlayerToMouse(fov)
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("Head") then
                local head = character.Head
                local screenPosition = camera:WorldToScreenPoint(head.Position)
                local distance = (mouse.X - screenPosition.X).magnitude + (mouse.Y - screenPosition.Y).magnitude

                if distance < closestDistance and distance <= fov then
                    closestPlayer = player
                    closestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end
