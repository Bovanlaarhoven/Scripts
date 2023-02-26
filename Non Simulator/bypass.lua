for _, v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

for _, v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

local Log = game:GetService("ReplicatedStorage").ErrorLoggerRemote
local ACDT = game:GetService("ReplicatedStorage").Communication.Events.ACDTResponse
local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    local args = {...}
    if self == ACDT and method == "FireServer" then
        args[1] = random
    return old(self,unpack(args))
    elseif self == Log and method == "FireServer" then
        return
    end
    return old(self,...)
end)
