local lplr = game:GetService("Players").LocalPlayer
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "Side" then
    lplr.Character.HumanoidRootPart.CFrame = v.CFrame
        v.Touched:Connect(function(Object)
            if Object.Parent:FindFirstChild("Humanoid") then
                v:Destroy()
                wait(1)
                local Http = game:GetService("HttpService") local TPS = game:GetService("TeleportService") local Api = "https://games.roblox.com/v1/games/" local _place = game.PlaceId local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100" function ListServers(cursor) local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or "")) return Http:JSONDecode(Raw) end local Server, Next; repeat local Servers = ListServers(Next) Server = Servers.data[1] Next = Servers.nextPageCursor until Server TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
            end
        end)
    end
end