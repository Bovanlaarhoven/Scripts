local generated_key = crypt.generatekey()
local generated_nonce = crypt.generatebytes()

local b = {
    key = generated_key,
    nonce = generated_nonce
}

makefolder("hi")
writefile("hi/a.json", game:GetService("HttpService"):JSONEncode(b))

local encrypted = crypt.encrypt("hello, world!", generated_key, generated_nonce)

print(encrypted) --encrypted "hello, world!"

-- decryption

local keys = game:GetService("HttpService"):JSONDecode(readfile("hi/a.json"))

local decrypted = crypt.decrypt(encrypted, keys.key, keys.nonce)

print(decrypted)