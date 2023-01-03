local lplr = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local Entities = game:GetService("Players")
local LocalPlayer = Entities.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Players = Entities
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Silent aim",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "ABCD",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "Hello"
    }
 })

local tab = Window:CreateTab("main", 4483362458)

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

function ClosestPlayerToMouse()
    local dist = math.huge
    local target = nil
    for i,v in pairs(Entities:GetPlayers()) do
        if v ~= lplr and v.Character and v.Character:FindFirstChild("Head") then
            local screenpoint = Camera.WorldToScreenPoint(Camera.Position)
            local check = (Vector2.new(Mouse.X,Mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).Magnitude
            if check < dist then
                check = dist
                target = v
            end
        end
    end
    return target
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
                local plr = silentAimMode == "Legit" and ClosestPlayer(fovValue) or ClosestPlayerToMouse()
                if plr then
                    table.insert(Args[2], workspace.Map)
                end
            end
            if NamecallMethod == "FindPartOnRayWithIgnoreList" and not checkcaller() then
                if silentAimEnabled then
                    local plr = silentAimMode == "Legit" and ClosestPlayer(fovValue) or ClosestPlayerToMouse()
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
            if wallbangEnabled and NamecallMethod == "FireServer" and self and self.Name and self.Name == "fire" then
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
    CurrentOption = "Legit",
    Flag = "Dropdown1",
    Callback = function(Option)
        silentAimMode = Option
    end,
})

 local Slider = tab:CreateSlider({
    Name = "Fov Value",
    Range = {1, 900},
    Increment = 1,
    Suffix = "Bananas",
    CurrentValue = 120,
    Flag = "Slider1",
    Callback = function(Value)
        fovValue = Value
    end,
})

local Dropdown = tab:CreateDropdown({
    Name = "HitPart",
    Options = {"Head","HumanoidRootPart", "Random"},
    CurrentOption = "Head",
    Flag = "Dropdown1",
    Callback = function(Option)
        silentAimHitPart = Option
    end,
})

local Toggle = tab:CreateToggle({
    Name = "Wallbang",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        wallbangEnabled = Value
    end,
 })