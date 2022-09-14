getgenv().collectOrbsToggle = true

spawn(function(AutoCollect)
    local playerhead = game.Players.LocalPlayer.Character.Head
    while wait() do
    if not getgenv().collectOrbsToggle then break end
        for i, v in pairs(game:GetService("Workspace").orbFolder:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(playerhead, v.Parent, 0)
                wait(0.15)
                break
            end
        end
    end
end)

spawn(function()
    local playerhead = game.Players.LocalPlayer.Character.Head
    while wait() do
    if not getgenv().collectOrbsToggle then break end
        for i, v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(playerhead, v.Parent, 0)
                wait(0.1)
                firetouchinterest(playerhead, v.Parent, 1)
                break
            end
        end
    end
end)
