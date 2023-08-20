local Predix = ";"

return {
    Kick = function()
        return Predix .. "kick"
    end,
    Ban = function()
        return Predix .. "ban"
    end,
    Unban = function()
        return Predix .. "unban"
    end,
    Shutdown = function()
        return Predix .. "shutdown"
    end,
    Goto = function()
        return Predix .. "goto"
    end,
    Bring = function()
        return Predix .. "bring"
    end,
    Invisible = function()
        return Predix .. "invisible"
    end,
    Visible = function()
        return Predix .. "visible"
    end,
    God = function()
        return Predix .. "god"
    end,
    Ungod = function()
        return Predix .. "ungod"
    end,
    Kill = function()
        return Predix .. "kill"
    end,
}
