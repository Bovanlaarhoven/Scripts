local lifetime = 5
local material = Enum.Material.ForceField
local thickness = 0.1
local color = Color3.fromRGB(0, 120, 255)

local mt = getrawmetatable(game)
local old = mt.__namecall
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService").RenderStepped
local lasthittick = tick()

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

setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if getnamecallmethod() == "FireServer" and self.Name == "GNX_S" and tick() - lasthittick > 0.005 then
        lasthittick = tick()
        spawn(function()
            local beam = createBeam(lp.Character.Head.Position, args[5])
            local transparencyStep = 1 / (60 * lifetime)
            for i = 1, 60 * lifetime do
                rs:Wait()
                beam.Transparency = i * transparencyStep
            end
            beam:Destroy()
        end)
    end
    return old(self, ...)
end)
setreadonly(mt, true)