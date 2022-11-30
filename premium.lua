local HWID = game:GetService("RbxAnalyticsService"):GetClientId();

local WhitelistedHWIDs = {
    "6b3062c5-7287-4c5b-80d5-50694afae8f9",
    "4F69CA78-86D0-4721-8F2A-256ACBBBD7C4", 
    "0C89E70A-A834-4E9D-9119-A81DCD9076DD", 
    "2FD48713-75B5-4408-A02F-CBECE223A5D1",
    "97D90E0D-A9AE-46AD-81AE-BFD46417F57D",
}

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

if has_value(WhitelistedHWIDs, HWID) then
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Robobo2022/script/main/JumpSimulator.lua"), true))()
else
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Robobo2022/script/main/EVADE.lua"), true))()
end
