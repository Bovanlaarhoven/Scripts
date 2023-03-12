local lplr = game:GetService("Players").LocalPlayer
while task.wait(10) do
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Side" then
        lplr.Character.HumanoidRootPart.CFrame = v.CFrame
            v.Touched:Connect(function(Object)
                if Object.Parent:FindFirstChild("Humanoid") then
                    v:Destroy()
                end
            end)
        end
    end
end
