local esp = Instance.new("SelectionBox")
local Players = game:GetService("Players"):GetChildren()
local SelectionBox = Instance.new("SelectionBox")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

for i,v in pairs(Players) do
    repeat wait() until v.Character
    if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("SelectionBox") then
        if v.Character ~= LocalPlayer then
            local espclone = esp:Clone()
            espclone.Adornee = v.Character
            espclone.Parent = v.Character:findFirstChild("HumanoidRootPart")
            espclone.Name = "SelectionBox"
        end
    end
end


game:GetService("Players"):Connect(function(player)
    repeat wait() until player.Character
    if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("SelectionBox") then
        local espclone = esp:Clone()
        espclone.Adornee = player.Character
        espclone.Parent = player.Character:findFirstChild("HumanoidRootPart")
        espclone.Name = "SelectionBox"
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function(playerRemoved)
    playerRemoved.Character:FindFirstChild("HumanoidRootPart").SelectionBox:destroy()
end)

RunService.Heartbeat:Connect(function()
    for i,v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):findFirstChild("SelectionBox") then
            if v.Character ~= LocalPlayer then
                local espclone = esp:Clone()
                espclone.Adornee = v.Character
                espclone.Parent = v.Character:findFirstChild("HumanoidRootPart")
                espclone.Name = "SelectionBox"
            end
        end
    end
end)