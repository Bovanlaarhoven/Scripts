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
    Name = "Rayfield Example Window",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
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
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "Copy to Clipboard",
       FileName = "Key", 
       SaveKey = false,
       GrabKeyFromSite = true,
       Key = {"99L2ZQvqLr","YhIHXlJzgt","NAIH82u0dm", "Qj72SBNKBq", "tisksjxncbgbbtsyruwo13383"}
    }
})

Rayfield:Destroy()