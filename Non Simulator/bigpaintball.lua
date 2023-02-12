for i,v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "damage") then
        v.shotrate = 0.00001
        v.velocity = 10000
        v.automatic = true
        v.additionalSpeed = 100
    end
end