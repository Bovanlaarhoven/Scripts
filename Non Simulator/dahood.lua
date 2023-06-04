local function isGun(tool)
    return tool:IsA("Tool")
end

local function getPlayerGun(player)
    local character = player.Character
    if character then
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Tool") and isGun(child) then
                return child
            end
        end
    end
    return nil
end

local function createBeam(p1, p2)
    local beam = Instance.new("Part")
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.ForceField
    beam.BrickColor = BrickColor.new("Bright red")
    
    local thickness = 0.2
    local direction = p2 - p1
    local magnitude = direction.magnitude
    
    beam.Size = Vector3.new(thickness, thickness, magnitude)
    beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -magnitude / 2)
    beam.Parent = workspace
    return beam
end

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    local player = game.Players.LocalPlayer
    local gun = getPlayerGun(player)

    if gun then
        local handle = gun:FindFirstChild("Handle")
        if handle then
            local beamOrigin = handle.Position
            local beamDirection = (mouse.Hit.p - beamOrigin).unit
            local beamEnd = beamOrigin + beamDirection * 100

            local beam = createBeam(beamOrigin, beamEnd)
            wait(0.5)
            beam:Destroy()
        end
    end
end)
