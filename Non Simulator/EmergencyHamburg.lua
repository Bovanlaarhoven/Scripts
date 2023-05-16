local function isInVehicle(player)
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        return humanoid.SeatPart ~= nil
    end
    return false
end

local function teleportPlayer(player, position)
    local character = player.Character
    if character and character.PrimaryPart then
        local primaryPart = character.PrimaryPart

        primaryPart.CFrame = CFrame.new(position)

        if isInVehicle(player) then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local seatPart = humanoid.SeatPart

            if seatPart and seatPart:IsA("VehicleSeat") then
                local vehicle = seatPart.Parent
                vehicle:SetPrimaryPartCFrame(CFrame.new(position))
            end
        end
    end
end

local player = game.Players.LocalPlayer
if player then
    local teleportPosition = Vector3.new(0, 10, 0)
    teleportPlayer(player, teleportPosition)
end
