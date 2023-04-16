local rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
local workspace = workspace:GetChildren()
local group = workspace.GroupBuildStructures:GetChildren()

while (task.wait(0.1)) do
    for i = 1, #workspace do
        local v = workspace[i];
        if v:FindFirstChild("TouchTrigger") then
            firetouchinterest(rootpart, v.TouchTrigger, 0)
            firetouchinterest(rootpart, v.TouchTrigger, 1)
        end
    end
    for i = 1, #group do
        local v = group[i];
        if v:FindFirstChild("Trigger") then
            firetouchinterest(rootpart, v.Trigger, 0)
            firetouchinterest(rootpart, v.Trigger, 1)
        end
    end
end
