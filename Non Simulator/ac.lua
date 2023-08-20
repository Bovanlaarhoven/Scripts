local Ranks = {
    "Admin",
    "Moderator",
    "VIP",
    "Player"
}

local Userids = {
    123456789,
}

local GetRank = function(Userid)
    for i,v in pairs(Userids) do
        if v == Userid then
            return Ranks[i]
        end
    end
    return "Player"
end

local GetPlayerRank = function(Player)
    return GetRank(Player.UserId)
end

local GetPlayerRankColor = function(Player)
    local Rank = GetPlayerRank(Player)
    if Rank == "Admin" then
        return Color3.fromRGB(255, 0, 0)
    elseif Rank == "Moderator" then
        return Color3.fromRGB(255, 255, 0)
    elseif Rank == "VIP" then
        return Color3.fromRGB(0, 255, 0)
    elseif Rank == "Player" then
        return Color3.fromRGB(255, 255, 255)
    end
end

local GetPlayerRankTag = function(Player)
    local Rank = GetPlayerRank(Player)
    if Rank == "Admin" then
        return "[Admin]"
    elseif Rank == "Moderator" then
        return "[Mod]"
    elseif Rank == "VIP" then
        return "[VIP]"
    elseif Rank == "Player" then
        return ""
    end
end

