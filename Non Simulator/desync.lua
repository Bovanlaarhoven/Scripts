local RunService = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer
local lcharacter = lplr.Character


RunService.heartbeat:Connect(function(parameters)
    oldval = lcharacter.HumanoidRootPart.Velocity
    lcharacter.HumanoidRootPart.Velocity = Vector3.new(math.random(-6000, 6000), math.random(0, 6000), math.random(-6000, 6000))
    lcharacter.HumanoidRootPart.CFrame = lcharacter.HumanoidRootPart.CFrame * CFrame.Angles(0,0.0001, 0)
    RunService.RenderStepped:Wait()
    lcharacter.HumanoidRootPart.Velocity = oldval
end)


