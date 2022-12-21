local players = game:GetService("Players")
local plr = players.LocalPlayer
local mouse = plr:GetMouse()
local camera = game:GetService("Workspace").CurrentCamera

function ClosestPlayerToMouse()
    local dist = math.huge
    local target = nil
    for i,v in pairs(players:GetPlayers()) do
        if v ~= plr and v.Character and v.Character:FindFirstChild("Head") then
            local screenpoint = camera.WorldToScreenPoint(camera,position)
            local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).Magnitude
            if check < dist then
                check = dist
                target = v
            end
        end
    end
    return target
end

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if not checkcaller() and tostring(self) == "fire" and method == "FireServer" then
        args[2][1] = Vector3.new(5,0,0)
        return old(self, unpack(args)) 
    end 
    return old(self, ...)
end)