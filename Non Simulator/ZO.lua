local plr = game.Players.LocalPlayer
local players = game.Players:GetPlayers()

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

local closestCharacter = Closest()
if closestCharacter then
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
                            local AnimationName = v.Name
                            local AnimationId = v.Animation.AnimationId

                            for _, idToCheck in ipairs(animationIdsToCheck) do
                                if AnimationId == idToCheck then
                                    print("Found Animation:", AnimationName, "AnimationId:", AnimationId)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
