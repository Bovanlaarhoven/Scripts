local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    task.wait(1)
    fireproximityprompt(workspace.JoesPizza.PizzaPrompt.ProximityPrompt)
    for _,v in pairs(workspace.PizzaNPCS:GetDescendants()) do
        if v.Name == "DeliveryHitbox" then
            fireproximityprompt(v.ProximityPrompt, 0)
        end
    end
end)
