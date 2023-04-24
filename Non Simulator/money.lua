local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

function moveToMoneyDrop(moneyDrop)
    local targetPosition = moneyDrop.Position

    local tweenInfo = TweenInfo.new(1) -- 1 second duration
    local tween = game:GetService("TweenService"):Create(character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
    tween:Play()

    while (targetPosition - character.HumanoidRootPart.Position).Magnitude > 5 do
        wait()
    end

    tween:Cancel()
    fireclickdetector(moneyDrop.ClickDetector)
end

while wait(1) do
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "MoneyDrop" and (v.Position - character.HumanoidRootPart.Position).Magnitude <= 10 then
            moveToMoneyDrop(v)
        end
    end
end
