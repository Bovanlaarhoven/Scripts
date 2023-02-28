rconsolecreate()
local Time = os.clock()

local lplr = game:GetService("Players").LocalPlayer
local usecode = game:GetService("ReplicatedStorage").Remotes.Functions.UseCode
local fall_Request = game:GetService("ReplicatedStorage").Remotes.Events.Fall_Request
local ragdoll = game:GetService("ReplicatedStorage").Remotes.Events.Ragdoll
local fall = game:GetService("ReplicatedStorage").Remotes.Events.Fall
local bleeding = game:GetService("Workspace").Characters.Players[lplr.Name].LimbHealths.bleed
local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    if self == fall and method == "FireServer" then
        return
    elseif self == fall_Request and method == "FireServer" then
        return
    elseif self == ragdoll and method == "FireServer" then
        return
    elseif self == usecode and method == "InvokeServer" then
        return
    elseif self == bleeding and method == "FireServer" then
        return
    end
    return old(self,...)
end)
rconsoleprint("Disabled fall/ragdoll/Bleeding [time taken :" .. os.clock() - Time .. "]")

game:GetService("Workspace").Doors:Destroy()
rconsoleprint("Removed all doors [time taken :" .. os.clock() - Time .. "]")
