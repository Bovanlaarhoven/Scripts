local lplr = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local Entities = game:GetService("Players")
local LocalPlayer = Entities.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Players = Entities
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "ABCD", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "Hello"
    }
 })

local tab = Window:CreateTab("main", 4483362458) -- Title, Image


local silentAimMode = "Legit"
local wallbangEnabled = false
local silentAimEnabled = false
local silentAimHitPart = "Head"


local function ClosestPlayer(fov)
    local MaxDist, Closest = math.huge
    for i,v in pairs(Players.GetPlayers(Players)) do
        local Head = v.Character.FindFirstChild(v.Character, "Head")
        if Head then
            local Pos, Vis = workspace.CurrentCamera.WorldToScreenPoint(workspace.CurrentCamera, Head.Position)
            if Vis then
                local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
                local Dist = (TheirPos - MousePos).Magnitude
                if Dist < MaxDist and Dist <= fov then
                    MaxDist = Dist
                    Closest = v
                end
            end
        end
    end
    return Closest
end

local function getClosestPlr1(distance)
    local closest, returnedplayer = (distance or math.huge), nil
    for _,v in next, Players.GetPlayers(Players) do
        local Head = v.Character.FindFirstChild(v.Character, "Head")
        if Head and lplr ~= v and v.Team ~= lplr.Team and v.NRPBS.Health.Value > 0 then
            local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if mag <= closest then
                closest = mag
                returnedplayer = v
            end
        end
    end
    return returnedplayer
end

local fovValue = 120

task.spawn(function()
    (LPH_JIT_MAX or function(...) return ... end)(function()
        local mt = getrawmetatable(game)
        local namecallold = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local Args = {...}
            local NamecallMethod = getnamecallmethod()
            if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" and wallbangEnabled then
                local plr = silentAimMode == "Legit" and ClosestPlayer(fovValue) or getClosestPlr1()
                if plr then
                    table.insert(Args[2], workspace.Map)
                end
            end
            if NamecallMethod == "FindPartOnRayWithIgnoreList" and not checkcaller() then
                if silentAimEnabled then
                    local plr = silentAimMode == "Legit" and ClosestPlayer(fovValue) or getClosestPlr1()
                    local part
                    if silentAimHitPart == "Random" then
                        local rand = math.random(0,1)
                        part = plr.Character.FindFirstChild(plr.Character, rand == 1 and "HumanoidRootPart" or "Head")
                    else
                        part = plr.Character.FindFirstChild(plr.Character, silentAimHitPart)
                    end
                    if plr and plr.Character and part then
                        Args[1] = Ray.new(Args[1].Origin, (part.Position - Args[1].Origin).Unit * 1000)
                        return namecallold(self, table.unpack(Args))
                    end
                end
            end
            if wallbangEnabled and NamecallMethod == "FireServer" and self and self.Name and self.Name == "UpdatePing" then
                return namecallold(self, table.unpack({
                    [1] = 10,
                    [2] = "LOL",
                }))
            end
            return namecallold(self, ...)
        end)
        setreadonly(mt, true)
    end)();
end)


local Toggle = tab:CreateToggle({
    Name = "Silent aim",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        silentAimEnabled = Value
    end,
 })

local Dropdown = tab:CreateDropdown({
    Name = "SilentAim Mode",
    Options = {"Legit","Blatant"},
    CurrentOption = "Option ",
    Flag = "Dropdown1",
    Callback = function(Option)
        silentAimMode = Option
    end,
 })
