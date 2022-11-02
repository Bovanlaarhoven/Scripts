local Event

Event = game:GetService("RunService").RenderStepped:Connect(function()
	if game.Players.LocalPlayer.Character then
		game.Players.LocalPlayer.Character:MoveTo(game.Players.LocalPlayer:GetMouse().Hit.p)
	end
end)