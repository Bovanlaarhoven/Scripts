local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Websites = {
    [1] = "https://link-hub.net/488828/hydra-network-key",
    [2] = "https://link-center.net/488828/hydra-network-key1",
    [3] = "https://link-hub.net/488828/key-hydra-network-best",
    [4] = "https://link-center.net/488828/key-for-hydra-network1",
    [5] = "https://link-hub.net/488828/key-for-hydra-network"
}

local Random = function()
    return Websites[math.random(1, #Websites)]
end

setclipboard(Random())

local Window = Rayfield:CreateWindow({
    Name = "Hydra network key",
    LoadingTitle = "Key",
    LoadingSubtitle = "by Hydra.xd",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, 
       FileName = ""
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
       Title = "Hydra network",
       Subtitle = "Key System",
       Note = "Copy to Clipboard",
       FileName = "Key", 
       SaveKey = false,
       GrabKeyFromSite = true,
       Key = {"99L2ZQvqLr","YhIHXlJzgt","NAIH82u0dm", "Qj72SBNKBq", "tisksjxncbgbbtsyruwo13383"}
    }
})

Rayfield:Destroy()

for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

local Time = os.clock()
local ownerId = game.CreatorId
local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Robobo2022/notify-lib/main/lib'),true))()

game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        Lib.prompt('Hydra Network v4', 'Owned Joined the game', 2)
    end
end)

local games = ({
    [8908228901] = "sharkbite2.lua",
    [9872472334] = "EVADE.lua",
    [10662542523] = "EVADE.lua",
    [10324347967] = "EVADE.lua",
    [10530697691] = "EVADE.lua",
    [10530697691] = "EVADE.lua",
    [10324346056] = "EVADE.lua",
    [10808838353] = "EVADE.lua",
    [12816512561] = "Evade.lua",
    [445664957] = "Parkour.lua",
})[game.PlaceId]

if games then
    Lib.prompt('Game is supported, and is now executing', "" .. games, 2)
    print("Time taken: " .. os.clock() - Time)
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/script/main/Games/" .. games))()
else
    Lib.prompt('Hydra Network v2', 'Game is not supported, and is now executing universal', 2)
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/script/main/Universal.lua", true))();
end 

