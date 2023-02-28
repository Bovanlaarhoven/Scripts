local ragdoll = game:GetService("ReplicatedStorage").Remotes.Events.Ragdoll
local fall = game:GetService("ReplicatedStorage").Remotes.Events.Fall
local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    if self == fall and method == "FireServer" then
        return
    elseif self == ragdoll and method == "FireServer" then
        return
    end
    return old(self,...)
end)
