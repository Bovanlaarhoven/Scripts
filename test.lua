local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat"))()
local Window = Library:CreateWindow("Speed Run 4 | PeachHub.lua", Vector2.new(492, 598), Enum.KeyCode.RightControl)
local AimingTab = Window:CreateTab("Main")

getgenv().getallvls = true
getgenv().getstars = true


function GetAllStars()
while getstars == true do task.wait()
    local args = {
        [1] = "Level 1"
    } 
    game:GetService("ReplicatedStorage").GotStar:FireServer(unpack(args))   
end
end

function GetAllLvls()
while getallvls == true do task.wait()
    local args = {
        [1] = 1660243517.868455,
        [2] = "Level 1",
        [3] = "Normal",
        [4] = false
    }
    game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
    wait(0.5)        
end
end

local otherSection = AimingTab:CreateSector("lvl switch", "right")
local testSection = AimingTab:CreateSector("Main", "left")
local textSection = AimingTab:CreateSector("(Switch Dimension When lvl 30)", "left")

testSection:AddToggle("Give Stars", false, function(first)
    getstars = first
    GetAllStars()
end)

testSection:AddToggle("Auto lvl", false, function(first)
    getallvls = first
    GetAllLvls()
end)

otherSection:AddButton("Normal", function(IhateGayPeople)
    local args = {
        [1] = "Normal"
    }  
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))  
end)

otherSection:AddButton("Peach Desert", function(IhateGayPeople)
    local args = {
        [1] = "Peach Desert"
    }
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))
end)

otherSection:AddButton("Cybernaut", function(IhateGayPeople)
    local args = {
        [1] = "Cybernaut"
    }
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))
end)

otherSection:AddButton("Cosmic", function(IhateGayPeople)
    local args = {
        [1] = "Cosmic"
    }
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))
end)

otherSection:AddButton("Moon", function(IhateGayPeople)
    local args = {
        [1] = "Moon"
    }
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))
end)

otherSection:AddButton("Chromium", function(IhateGayPeople)
    local args = {
        [1] = "Chromium"
    }
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))
end)

otherSection:AddButton("Birchock", function(IhateGayPeople)
    local args = {
        [1] = "Birchock"
    }
    game:GetService("ReplicatedStorage").SetDimension:FireServer(unpack(args))
end) 
