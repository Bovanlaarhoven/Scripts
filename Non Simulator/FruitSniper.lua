local lplr = game:GetService("Players").LocalPlayer
local lcharacter = lplr.Character

local Fruits = {
    "Kilo Fruit",
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

local function getfruit()
    local FruitFound = false
    for _,v in pairs(Fruits) do
        if game:GetService("Workspace"):FindFirstChild(v) then
            print("Fruit Found: " .. v)
            FruitFound = true
        end
    end
    print("Function called. FruitFound = " .. tostring(FruitFound))
    return FruitFound
end

local function NotFound(FruitFound)
    if FruitFound == false then
        print("no fruits... hopping")
    end
end

local function hopServer()
    local teleportService = game:GetService("TeleportService")
    local success, errorMessage = pcall(function()
        teleportService:Teleport(game.PlaceId)
    end)
    
    if not success then
        warn("Failed to hop servers: " .. errorMessage)
    end
end

local fruitFound = getfruit()

if NotFound(fruitFound) then
    hopServer()
end

