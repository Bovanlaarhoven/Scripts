local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local players = game.Players:GetPlayers()

local Tab = Window:MakeTab({
    Name = "Tab 1",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


function esp(v)
        repeat wait() until v.Character.Humanoid
        if v ~= game.Players.LocalPlayer then
        local esp = Instance.new("Highlight")
        esp.Name = v.Name
        esp.FillTransparency = 0.75
        esp.FillColor = Color3.new(255, 0, 0)
        esp.OutlineColor = Color3.new(0,0,0)
        esp.OutlineTransparency = 0
        esp.Parent = v.Character
        end
    end
    
    for i,v in pairs(players) do
        esp(v)
        v.CharacterAdded:Connect(function()
            esp(v)
        end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
        v.CharacterAdded:Connect(function()
            esp(v)
        end)
    end)


Tab:AddToggle({
    Name = "Esp",
    Default = false,
    Callback = function(Value)
        esp(v)
    end    
})