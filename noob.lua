local enabled = true
local highlight = Instance.new("Highlight")
local plr = game:GetService("Players").LocalPlayer
local players = game:GetService("Players")

if enabled == true then
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        local highlightclone = highlight:Clone()
        highlightclone.Name = v
        highlightclone.Adornee = v.Character
        highlightclone.Parent = v.Character
        highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

players.PlayerAdded:Connect(function()
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        local highlightclone = highlight:Clone()
        highlightclone.Name = v
        highlightclone.Adornee = v.Character
        highlightclone.Parent = v.Character
        highlightclone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end)

players.PlayerRemoving:Connect(function(playerRemoved)
    playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:destroy()
end)
