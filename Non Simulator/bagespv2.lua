local camera = workspace.CurrentCamera
local runservice = game:GetService("RunService")

local Settings = {
    Esp = false,
    distance = 1000,
}

-- Function to toggle the ESP on and off
local function ToggleEsp()
    Settings.Esp = not Settings.Esp
end

-- Bind the toggle function to a key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        ToggleEsp()
    end
end)

-- Render the ESP text for a given object
local function BagEsp(Object)
    local text = Drawing.new("Text")
    text.Color = Color3.new(1, 1, 1)
    text.OutlineColor = Color3.new(0, 0, 0)
    text.Center = true
    text.Outline = true
    text.Position = Vector2.new(100, 100)
    text.Size = 20
    text.Font = Drawing.Fonts.Monospace
    text.Transparency = 0.9

    local renderstepped
    renderstepped = runservice.RenderStepped:Connect(function()
        local Success, Error = pcall(function()
            if Object and Settings.Esp then
                if Object ~= nil then
                    local Vector, OnScreen
                    if Object.Name then
                        Vector, OnScreen = camera:WorldToViewportPoint(Object.Position)
                        local distance = (Object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                        if distance <= Settings.distance then
                            local distanceInMeters = distance * 0.282
                            text.Text = string.format("%s\n[%.2f Meters]", Object.Parent.Rarity.Value, distanceInMeters)
                            if OnScreen then
                                text.Position = Vector2.new(Vector.X, Vector.Y)
                                text.Visible = true
                            else
                                text.Visible = false
                            end
                        else
                            text.Visible = false
                        end
                    else
                        text.Visible = false
                    end
                else
                    text.Visible = false
                    text:Remove()
                    renderstepped:Disconnect()
                end
            else
                text.Visible = false
            end
        end)
        if not Success then
            warn(Error)
            text:Remove()
            renderstepped:Disconnect()
        end
    end)

    Object.AncestryChanged:Connect(function(_, parent)
        if not parent then
            text:Remove()
            renderstepped:Disconnect()
        end
    end)
end

-- Loop through all descendants of the workspace to find objects with the name "Side"
for _,v in pairs(workspace:GetDescendants()) do
    if v.Name == "Side" then
        BagEsp(v)
    end
end
