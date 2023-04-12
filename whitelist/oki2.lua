_G.Key = "hello world"

local Request = (syn and syn.request or request or http and http.request or http_request) or error("No request function found")
local encryptedKeys = loadstring(game:HttpGet("https://pastebin.com/raw/yH20wkeZ"))()
local body = Request({Url = "https://httpbin.org/get", Method = "GET"}).Body
local decode = game:GetService("HttpService"):JSONDecode(body)


local saves = {}
for i, encryptedKey in ipairs(encryptedKeys) do
   local decryptedKey = ""
   for j = 1, #encryptedKey, 2 do
      local byte = tonumber(encryptedKey:sub(j, j+1), 16)
      local keyByte = string.byte(encryptionKey, (j/2) % #encryptionKey + 1)
      local decryptedByte = bit32.bxor(byte, keyByte)
      decryptedKey = decryptedKey .. string.char(decryptedByte)
   end
   saves[i] = decryptedKey
end

-- Check if the provided key matches one of the saved keys
local keyMatch = false
for _, savedKey in ipairs(saves) do
   if _G.Key == savedKey then
      keyMatch = true
      break
   end
end

-- Print the result
if keyMatch then
   print("Whitelisted")
else
   warn("Invalid key provided. Loadstring not executed.")
end
