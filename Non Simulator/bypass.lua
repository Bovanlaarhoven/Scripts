for _, v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

for _, v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

local AntiExploit = game:GetService("ReplicatedStorage").Remotes.AntiExploit
local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    if self == AntiExploit and method == "FireServer" then
        return
    end
    return old(self,...)
end)