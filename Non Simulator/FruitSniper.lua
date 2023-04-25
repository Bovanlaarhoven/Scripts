repeat wait() until game:IsLoaded()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")

local lplr = game:GetService("Players").LocalPlayer
local lcharacter = lplr.Character
local TweenService = game:GetService("TweenService")
_G.TweenSpeed = 10
local TweenInfo = TweenInfo.new(_G.TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local FruitName = "nil"
local FruitFound = false
local FruitPickedUp = false

local Fruits = {
    "Spin Fruit",
    "Chop Fruit",
    "Spring Fruit",
    "Bomb Fruit",
    "Smoke Fruit",
    "Spike Fruit",
    "Flame Fruit",
    "Falcon Fruit",
    "Ice Fruit",
    "Sand Fruit",
    "Dark Fruit",
    "Revive Fruit",
    "Diamond Fruit",
    "Light Fruit",
    "Rubber Fruit",
    "Barrier Fruit",
    "Magma Fruit",
    "Quake Fruit",
    "Buddha Fruit",
    "Love Fruit",
    "Spider Fruit",
    "Pheonix Fruit",
    "Portal Fruit",
    "Rumble Fruit",
    "Paw Fruit",
    "Blizzard Fruit",
    "Gravity Fruit",
    "Dough Fruit",
    "Shadow Fruit",
    "Venom Fruit",
    "Control Fruit",
    "Spirit Fruit",
    "Dragon Fruit",
    "Leopard Fruit",
}

local StoreNames = {
    Fruits[2] == "Spin-Spin",
    Fruits[3] == "Chop-Chop",
    Fruits[4] == "Spring-Spring",
    Fruits[5] == "Bomb-Bomb",
    Fruits[6] == "Smoke-Smoke",
    Fruits[7] == "Spike-Spike",
    Fruits[8] == "Flame-Flame",
    Fruits[9] == "Falcon-Falcon",
    Fruits[10] == "Ice-Ice",
    Fruits[11] == "Sand-Sand",
    Fruits[12] == "Dark-Dark",
    Fruits[13] == "Revive-Revive",
    Fruits[14] == "Diamond-Diamond",
    Fruits[15] == "Light-Light",
    Fruits[16] == "Rubber-Rubber",
    Fruits[17] == "Barrier-Barrier",
    Fruits[18] == "Magma-Magma",
    Fruits[19] == "Quake-Quake",
    Fruits[20] == "Buddha-Buddha",
    Fruits[21] == "Love-Love",
    Fruits[22] == "Spider-Spider",
    Fruits[23] == "Pheonix-Pheonix",
    Fruits[24] == "Portal-Portal",
    Fruits[25] == "Rumble-Rumble",
    Fruits[26] == "Paw-Paw",
    Fruits[27] == "Blizzard-Blizzard",
    Fruits[28] == "Gravity-Gravity",
    Fruits[29] == "Dough-Dough",
    Fruits[30] == "Shadow-Shadow",
    Fruits[31] == "Venom-Venom",
    Fruits[32] == "Control-Control",
    Fruits[33] == "Spirit-Spirit",
    Fruits[34] == "Dragon-Dragon",
    Fruits[35] == "Leopard-Leopard",
}

--Credits to LeoKholYt for the server hop function
local function hopServer()
    local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
    module:Teleport(game.PlaceId)
end

local function NotFound(FruitFound)
    if not FruitFound then
        print("Fruit not found. Hopping servers.")
        hopServer()
    end
end

local function Store()
    local args1 = "StoreFruit"
    local args2 = StoreNames
    local args3 = workspace.Characters[lplr.Name][FruitName]
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(args1, args2, args3)
end

local function findfruit()
    local FruitFound = false
    for _,v in pairs(Fruits) do
        if game:GetService("Workspace"):FindFirstChild(v) then
            print("Fruit Found: " .. v)
            FruitName = v
            FruitFound = true
            local tween = TweenService:Create(lcharacter.HumanoidRootPart, TweenInfo, {CFrame = game:GetService("Workspace")[v].Fruit.CFrame})
            tween:Play()
            tween.Completed:Connect(function()
                FruitPickedUp = true 
            end)
        end
    end
    print("Function called. FruitFound = " .. tostring(FruitFound))
    return FruitFound
end

if findfruit() then
    if FruitPickedUp then
        Store()
    end
else
    NotFound(FruitFound)
end

findfruit()
