local plr = game:GetService("Players").LocalPlayer
local RootPart = plr.Character.HumanoidRootPart

for _,v in pairs(game:GetService("Workspace").CollectableMoney:GetDescendants()) do
    if v.Name == "TouchInterest" then
        firetouchinterest(RootPart, v.Parent, 1)
    end
end
