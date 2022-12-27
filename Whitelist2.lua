_G.Key = "Key1"

local keys = {
    "Key1",
    "Key2",
    "key3"
}

local filename = "Whitelist.txt"
local json
local HttpService = game:GetService("HttpService")
local Http_Request = request;
local Body = Http_Request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local Decoded = game:GetService('HttpService'):JSONDecode(Body)
local GetHwid = Decoded.headers["Sw-Fingerprint"];
local Time = os.clock()
local counter = 1



local keyCheck
for i,v in pairs(keys) do
    if counter == #keys then
    print("Not a valid key!")
    keys = ""
    if (HttpService:JSONDecode(json).hwid == GetHwid) then
        print("[Whitelist] Whitelisted!")
        return
    else
        print("[Whitelist] Not Whitelisted!")
        game:Shutdown()
    end
    else
        if v == _G.Key then
            if (writefile) then
                json = HttpService:JSONEncode({["hwid"] = GetHwid})
                writefile(filename, json)
            else
                json = readfile(filename)
            end

            if (not json) then
                print("[Whitelist] Failed to load whitelist.")
                return
            end
            
            if (not HttpService:JSONDecode(json)) then
                print("[Whitelist] Failed to load whitelist.")
                return
            end
            
            print("[Whitelist] Loading...")
            wait(0.2)
            print("[Whitelist] ".. identifyexecutor())
            wait(0.2)
            
            print("[Whitelist] Checking Whitelist...")

            keyCheck = _G.Key
            keys = ""
        else
            counter = counter + 1
        end
    end
end