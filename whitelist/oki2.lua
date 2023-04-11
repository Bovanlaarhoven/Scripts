_G.Key = "my[key1]"

local startTime = os.clock()
print("Starting whitelist check...")
local Request = (syn and syn.request or request or http and http.request or http_request) or error("No request function found")
local saves = loadstring(game:HttpGet("https://pastebin.com/raw/yH20wkeZ"))()
local body = Request({Url = "https://httpbin.org/get", Method = "GET"}).Body
local decode = game:GetService("HttpService"):JSONDecode(body)

local keyMatch = false
for _, validKey in ipairs(saves) do
   local keyBytes = {}
   for i = 1, #validKey, 2 do
      local byte = tonumber(validKey:sub(i, i + 1), 16)
      table.insert(keyBytes, byte)
   end
   local keyString = string.char(unpack(keyBytes))
   if _G.Key == keyString then
      keyMatch = true
      break
   end
end

if keyMatch then
   print("Whitelisted")
else
   warn("Invalid key provided. Loadstring not executed.")
end

local elapsedTime = os.clock() - startTime
print("Elapsed time: " .. elapsedTime .. " seconds")
