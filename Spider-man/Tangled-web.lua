local plr = game:GetService("Players").LocalPlayer
local RootPart = plr.Character.HumanoidRootPart
getgenv().AutoCriminal = true

local Attack = function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Combat", "Punch", false)
end

task.defer(function()
    while task.wait() do
        if AutoCriminal then
            for _,v in pairs(workspace.Enemies:GetDescendants()) do
                if v.Name == "HumanoidRootPart" then
                    RootPart.CFrame = v.CFrame + Vector3.new(0, 2.5, 0)
                    Attack()
                end
            end
        end
    end
end)
