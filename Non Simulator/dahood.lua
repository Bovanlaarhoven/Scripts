local lifetime = 5
local material = Enum.Material.ForceField
local thickness = 0.1
local color = Color3.fromRGB(0, 120, 255)
local lplr = game:GetService("Players").LocalPlayer
local toolConnection = {nil, nil}
local mouse = lplr:GetMouse()


local function createBeam(p1, p2)
    local beam = Instance.new("Part")
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = material
    beam.Color = color
    beam.Size = Vector3.new(thickness, thickness, (p1 - p2).magnitude)
    beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -beam.Size.Z / 2)
    beam.Parent = workspace
    return beam
end

local isGun = function(tool)
    return tool:IsA("Tool")
end

lplr.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(child)
        if isGun(child) then
            if toolConnection[1] == nil then
                toolConnection[1] = child
            end
            if toolConnection[1] ~= child and toolConnection[2] ~= nil then
                toolConnection[2]:Disconnect()
                toolConnection[1] = child
            end

            if child:FindFirstChild("Ammo") ~= nil then
                if child["Ammo"].Value == 0 then
                    return
                end
            else
                return
            end

            local fromAttach = Instance.new("Attachment", workspace.Terrain)
            fromAttach.Position = lplr:FindFirstChildOfClass("Tool"):FindFirstChild("Handle").Position 
            local toAttach = Instance.new("Attachment", workspace.Terrain)
            local pPos = nil
            pPos = mouse.Hit.Position
            toAttach.Position = pPos
            local beam = createBeam(fromAttach, toAttach)
        end
    end)
end)
