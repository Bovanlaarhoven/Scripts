local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

getgenv().loop = true


local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


MainTab:AddToggle({
	Name = "Kill All",
	Default = false,
	Callback = function(Value)
		loop = Value
	end    
})

--made by prokillp
while loop do task.wait(10)
    local Players = game:GetService("Players")
    for _,player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
    task.wait(5)
    game:GetService("ReplicatedStorage").Packages.Knit.Services.PvpService.RF.Damage:InvokeServer(player.Character.Humanoid, 100, true)
         end
    end
end