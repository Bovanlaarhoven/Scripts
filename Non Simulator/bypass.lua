for _, v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

for _, v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

local random = math.random(1, 100000000000)
local ACDTResponse = game:GetService("ReplicatedStorage").Communication.Events.ACDTResponse
local ACDTRequest = game:GetService("ReplicatedStorage").Communication.Events.ACDTRequest
local ErrorLog = game:GetService("ReplicatedStorage").ErrorLoggerRemote
local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    local args = {...}
    if self == ACDTResponse and method == "FireServer" then
        return
    elseif self == ACDTRequest and method == "FireServer" then
        return
    elseif self == ErrorLog and method == "FireServer" then
        return
    end
    return old(self,...)
end)