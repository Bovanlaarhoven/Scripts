function printNoob()
    local n = string.char(110) .. string.char(111) .. string.char(111) .. string.char(98)
    local t = {}
    for i = 1, #n do
        t[i] = string.byte(n, i)
    end
    for _, v in ipairs(t) do
        io.write(string.char(v))
    end
end

printNoob()
