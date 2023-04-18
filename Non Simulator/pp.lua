local lplr = game:GetService("Players").LocalPlayer
local rootpart = lplr.Character.HumanoidRootPart

local function hoops()
    for _,v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(rootpart, v.Parent, 0)
            wait(0.1)
            firetouchinterest(rootpart, v.Parent, 1)
        end
    end
end

local function orbs()
    for _,v in pairs(game:GetService("Workspace").orbFolder:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(rootpart, v.Parent, 0)
            wait(0.1)
            firetouchinterest(rootpart, v.Parent, 1)
        end
    end
end

while (task.wait(0.1)) do
    hoops()
    orbs()
end