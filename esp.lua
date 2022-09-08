local ESPColor = Color3.fromRGB(0, 255, 0) -- Your color

local function remove()
    for i, v in pairs(game.Players:GetPlayers()) do
        for i, v in pairs(v.Character:GetChildren()) do
            if v:IsA("Highlight") then
                v:Destroy()
            end
        end
    end
end

    local function create()
        local hl = Instance.new("Highlight")
        hl.Parent = character
        hl.FillColor = ESPColor
    end
    
    for i, v in pairs(game.Players:GetPlayers()) do
        character = v.Character
        create()
    end
    
    game.Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function()
            remove()
            character = plr.Character
            create()
        end)
    end)