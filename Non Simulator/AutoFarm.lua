local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

if character and character:FindFirstChild("Humanoid") then
    local closestDrop = nil
    local closestDistance = math.huge
    
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "MoneyDrop" then
            local distance = (v.Position - character.HumanoidRootPart.Position).Magnitude
            
            if distance < closestDistance then
                closestDrop = v
                closestDistance = distance
            end
        end
    end
    
    if closestDrop then
        local targetPosition = closestDrop.Position

        local tweenInfo = TweenInfo.new(1) -- 1 second duration
        local tween = game:GetService("TweenService"):Create(character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
        tween:Play()

        while (targetPosition - character.HumanoidRootPart.Position).Magnitude > 5 do
            wait()
        end

        tween:Cancel()
        fireclickdetector(closestDrop.ClickDetector)
        wait(5)
    end
end
