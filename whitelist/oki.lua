_G.Key = "my[key1]"

local validKeys = {
   "6d795b6b6579315d",
   "6d795b6b6579325d",
   "6d795b6b6579335d",
   "68656c6c6f20776f726c64",
}


local keyMatch = false
for _, validKey in ipairs(validKeys) do
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
