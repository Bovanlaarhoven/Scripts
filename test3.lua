for _,plrs in pairs(game.Players:GetPlayers()) do
	if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - plrs.Character.HumanoidRootPart.Position).magnitude <= 20 then
        local esp = Instance.new("Highlight")
        esp.Parent = 
    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - plrs.Character.HumanoidRootPart.Position).magnitude > 20 then
        print("player not near")
	end
end