function queueOnTeleport(str)
    if identifyexecutor() == "Synapse X" then
        pcall(function()
            syn.queue_on_teleport(str)
        end)
    else 
        local suc,err = pcall(function() queue_on_teleport(str) end)
        if err then
            print("Error occured, trying again...")
            local suc,eror = pcall(function() queue_on_teleport(str) end)
                        if eror then print("Cant queue teleport") end
        end
    end
end
queueOnTeleport([[
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Robobo2022/Fun/main/farm.lua"), true))()
]])