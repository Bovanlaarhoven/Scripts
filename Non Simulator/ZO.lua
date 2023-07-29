local plr = game.Players.LocalPlayer
local players = game.Players:GetPlayers()
local RunService = game:GetService("RunService")

local Blocking = false
local Parry = false
local Attacking = false

local Settings = {
    AutoParry = true,
}

local function findSwingAnimationsFolder(parent)
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("Folder") and child.Name == "SwingAnimations" then
            return child
        end
    end
end

local function Closest()
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


RunService.Heartbeat:Connect(function()
    local closestCharacter = Closest()
    if closestCharacter then
        for _, v2 in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v2:IsA("Model") and v2.Name == closestCharacter.Name then
                for _, v3 in pairs(v2:GetChildren()) do
                    if v3:IsA("Tool") then
                        local boolValueParry = v3:FindFirstChild("Parry")
                        local boolValueBlocking = v3:FindFirstChild("Blocking")
    
                        if boolValueParry and boolValueParry:IsA("BoolValue") then
                            Blocking = boolValueParry.Value
                        end
    
                        if boolValueBlocking and boolValueBlocking:IsA("BoolValue") then
                            Parry = boolValueBlocking.Value
                        end
                    end
                end
            end
        end
    
        local humanoid = closestCharacter:FindFirstChild("Humanoid")
        if humanoid then
            local tool = nil
    
            for _, descendant in ipairs(closestCharacter:GetDescendants()) do
                if descendant:IsA("Tool") then
                    tool = descendant
                    break
                end
            end
    
            if tool then
                local swingAnimationsFolder = findSwingAnimationsFolder(tool)
                if swingAnimationsFolder then
                    local animationIdsToCheck = {}
    
                    local function collectAnimationIds(folder)
                        for _, animation in ipairs(folder:GetChildren()) do
                            if animation:IsA("Animation") then
                                local animationId = animation.AnimationId
                                if not table.find(animationIdsToCheck, animationId) then
                                    table.insert(animationIdsToCheck, animationId)
                                end
                            end
                        end
                    end
    
                    collectAnimationIds(swingAnimationsFolder)
    
                    local humanoid = closestCharacter:FindFirstChild("Humanoid")
                    if humanoid then
                        local animationplaying = humanoid:GetPlayingAnimationTracks()
                        if #animationplaying > 0 then
                            for _, v in ipairs(animationplaying) do
                                local AnimationId = v.Animation.AnimationId
    
                                for _, idToCheck in ipairs(animationIdsToCheck) do
                                    if AnimationId == idToCheck then
                                        Attacking = true
                                    else
                                        Attacking = false
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)


while wait() do
    if Settings.AutoParry then
        if not Parry and not Blocking then
            if Attacking then
                print("parry")
            end
        end
    end
end
