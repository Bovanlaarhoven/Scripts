local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"

for i,v in pairs(Players) do
    repeat wait() until v.Character
    if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
    local highlightclone = highlight:Clone()
    highlightclone.Adornee = v.Character
    highlightclone.Parent = v.Character:findFirstChild("HumanoidRootPart")
    highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlightclone.Name = "highlight"
end
end

game.Players.PlayerAdded:Connect(function(player)
    repeat wait() until player.Character
    if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
    local highlightclone = highlight:Clone()
    highlightclone.Adornee = player.Character
    highlightclone.Parent = player.Character:findFirstChild("HumanoidRootPart")
    highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlightclone.Name = "highlight"
    end
end)

game.Players.PlayerRemoving:Connect(function(playerRemoved)
    playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:destroy()
end)

RunService.Heartbeat:Connect(function()
    for i,v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumoidRootPart"):FindFirstChild("Highlight") then
        local highlightclone = highlight:Clone()
        highlightclone.Adornee = v.Character
        highlightclone.Parent = v.Character:findFirstChild("HumanoidRootPart")
        highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightclone.Name = "highlight"
    end
end
end)