local hook
hook = hookfunction("__namecall", newcclosure(function(...)
    local args = {...}

    if not checkcaller() then
        if self.Name == "ClientMover" then
            return wait(10e1)
        end
    end
end))


local hook
hook = hookfunction(getrenv().require, newcclosure(function(...)
    local Args = {...}
    local getname = game.GetFullName


    if not checkcaller() then
        if (getname(getcallingscript()) == ".ClientMover" and Args[1].Name == "Client") then
            return wait(10e1)
        end
    end
end))