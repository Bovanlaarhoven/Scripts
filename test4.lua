local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local highlight = Instance.new("Highlight")

mouse.move:Connect(function()
	local closestplr
	local closestpos = 1e+100
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Character then
			local mag = (mouse.Hit.p - v.Character.HumanoidRootPart.CFrame.Position).Magnitude
			if  mag < closestpos then
				closestplr = v
				closestpos = mag
			end
		end
	end
	
	if closestplr then
		--print(closestplr.Name)
        highlight.Parent = closestplr.Character.Head
	end
end)