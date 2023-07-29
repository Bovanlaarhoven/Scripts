local plr = game.Players.LocalPlayer
local players = game.Players:GetPlayers()
local Animations = {"1","2","3","4"}

local Closest = function()
    local closestPlayer = nil
    local distance = math.huge

    for _, v in pairs(players) do
        if v ~= plr then
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local magnitude = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                if magnitude < distance then
                    closestPlayer = v.Character
                    distance = magnitude
                end
            end
        end
    end

    return closestPlayer
end

local closestCharacter = Closest()

if closestCharacter then
    print("Closest Player:", closestCharacter.Name)

    for _, v2 in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v2:IsA("Model") and v2.Name == closestCharacter.Name then
            for _, v3 in pairs(v2:GetChildren()) do
                if v3:IsA("Tool") then
                    local boolValueParry = v3:FindFirstChild("Parry")
                    local boolValueBlocking = v3:FindFirstChild("Blocking")
    
                    if boolValueParry and boolValueParry:IsA("BoolValue") then
                        print("Parry value:", boolValueParry.Value)
                    end
    
                    if boolValueBlocking and boolValueBlocking:IsA("BoolValue") then
                        print("Blocking value:", boolValueBlocking.Value)
                    end
                end
            end
        end
    end
else
    print("No suitable players found.")
end

