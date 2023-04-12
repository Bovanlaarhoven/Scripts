local spooftable = {
    WalkSpeed = 16,
    JumpPower = 50
}

local old
old = hookmetamethod(game, "__index", function(t, k)
    if not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower") then
        spooftable[k] = spooftable[k] or t[k]
        return spooftable[k]
    end
    return old and old(t, k)
end)
