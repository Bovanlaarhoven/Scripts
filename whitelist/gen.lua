local inputString = "my[key1]"
local byteString = ""
for i = 1, #inputString do
    local byte = string.byte(inputString, i)
    byteString = byteString .. string.format("%02x", byte)
end
print(byteString)
setclipboard(byteString)