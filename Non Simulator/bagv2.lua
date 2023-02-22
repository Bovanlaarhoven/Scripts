for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:FindFirstChild("Slide") then
      for _,i in pairs(v:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.ClickPart.CFrame
      end
    end
end