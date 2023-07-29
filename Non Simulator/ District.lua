local plr = game.Players.LocalPlayer

for _,v in pairs(game:GetService("Workspace").Map.Jobs.Cleaner2.Interactables:GetDescendants()) do
    if v.Name == "dirtiness" then
        v.ProximityPrompt.HoldDuration = 0
        fireproximityprompt(v.ProximityPrompt, 0)
    end
end