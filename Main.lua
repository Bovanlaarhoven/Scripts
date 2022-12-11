if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

getgenv().Network = true
getgenv().nonSimulator = true
getgenv().Simulator = true

local ownerId = game.CreatorId
game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Hydra Network",
            Text = "Owner joined! be careful with what you do."
        })
    end
end)

if nonSimulator == true then
    local NonSimulator ({
        [9872472334] = "Evade.lua",
        [10324346056] = "Evade.lua",
        [10324347967] = "Evade.lua",
        [10539706691] = "Evade.lua",
        [10662542523] = "Evade.lua",
        [10808838353] = "Evade.lua",
        [11353528705] = "Evade.lua",
        [11353532384] = "Evade.lua",
    })[game.PlaceId]

    if NonSimulator then
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/Hydra-Network-V3/main/Games/" .. NonSimulator))()
    end
end