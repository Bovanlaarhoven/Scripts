local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local highlight = Instance.new("Highlight")

mouse.move:Connect(function()
	local closestplr
	local closestpos = 1e+100
	for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character ~= game.Players.LocalPlayer.Character then
            if v.team ~= plr.team then
                if v.Character then
                    local mag = (mouse.Hit.p - v.Character.HumanoidRootPart.CFrame.Position).Magnitude
                    if  mag < closestpos then
                        closestplr = v
                        closestpos = mag
                    end
                end
            end
            
            if closestplr then
                highlight.Parent = closestplr.Character
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = Color3.new(0.917647, 0, 1)
            end
        end
    end
end)

