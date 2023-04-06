local settings = {
    boxesp = true,
    teamcheck = true,
    teamhide = false,
}

local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint
local lteam = lplr.Team
local headoff = Vector3.new(0, 0.5, 0)
local legoff = Vector3.new(0, 3, 0)


for _,v in pairs(plrs:GetChildren()) do
    local boxoutline = Drawing.new("Square")
    local box = Drawing.new("Square")

    boxoutline.Visible = false
    boxoutline.Color = Color3.fromRGB(0, 0, 0)
    boxoutline.Thickness = 2
    boxoutline.Transparency = 0
    boxoutline.Filled = false

    box.Visible = false
    box.Color = Color3.fromRGB(43, 42, 42)
    box.Thickness = 1
    box.transparency = 0
    box.Filled = false
    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 and settings.boxesp == true then
                if settings.teamcheck == true then
                    if v.Team == lteam then
                        boxoutline.Color = Color3.fromRGB(0, 255, 0)
                        box.Color = Color3.fromRGB(0, 255, 0)
                    else
                        boxoutline.Color = Color3.fromRGB(255, 0, 0)
                        box.Color = Color3.fromRGB(255, 0, 0)
                    end                    
                end
                local vector, onScreen = WorldToViewportPoint(CurrentCamera, v.Character.HumanoidRootPart.Position)
                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = WorldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = WorldToViewportPoint(CurrentCamera, Head.Position + headoff)
                local LegPostion = WorldToViewportPoint(CurrentCamera, RootPart.Position - legoff) 
                if onScreen then
                    boxoutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPostion.Y)
                    boxoutline.Position = Vector2.new(RootPosition.X - boxoutline.Size.X / 2, RootPosition.Y - boxoutline.Size.Y / 2)
                    boxoutline.Visible = true

                    box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPostion.Y)
                    box.Position = Vector2.new(RootPosition.X - box.Size.X / 2, RootPosition.Y - box.Size.Y / 2)
                    box.Visible = true
                else
                    boxoutline.Visible = false
                    box.Visible = false
                end
            else
                boxoutline.Visible = false
                box.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end

plrs.PlayerAdded:Connect(function(v)
    local boxoutline = Drawing.new("Square")
    local box = Drawing.new("Square")

    boxoutline.Visible = false
    boxoutline.Color = Color3.fromRGB(0, 0, 0)
    boxoutline.Thickness = 2
    boxoutline.Transparency = 0
    boxoutline.Filled = false

    box.Visible = false
    box.Color = Color3.fromRGB(43, 42, 42)
    box.Thickness = 1
    box.transparency = 0
    box.Filled = false
    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 and settings.boxesp == true then
                local vector, onScreen = WorldToViewportPoint(CurrentCamera, v.Character.HumanoidRootPart.Position)
                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = WorldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = WorldToViewportPoint(CurrentCamera, Head.Position + headoff)
                local LegPostion = WorldToViewportPoint(CurrentCamera, RootPart.Position - legoff) 
                if onScreen then
                    boxoutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPostion.Y)
                    boxoutline.Position = Vector2.new(RootPosition.X - boxoutline.Size.X / 2, RootPosition.Y - boxoutline.Size.Y / 2)
                    boxoutline.Visible = true

                    box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPostion.Y)
                    box.Position = Vector2.new(RootPosition.X - box.Size.X / 2, RootPosition.Y - box.Size.Y / 2)
                    box.Visible = true
                else
                    boxoutline.Visible = false
                    box.Visible = false
                end
            else
                boxoutline.Visible = false
                box.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end)