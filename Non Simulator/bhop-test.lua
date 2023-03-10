getgenv().Bhop = true
local LocalPlayer = game:GetService("Players").LocalPlayer.Name
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
local Remote = workspace.Game.Players[LocalPlayer].Communicator
local ohString1 = "JumpDone"
local namecall

namecall = hookmetamethod(game,"__namecall", function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if not checkcaller() and self == Remote and method == "InvokeServer" and args[1] == ohString1 and getgenv().Bhop then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        return print("Done Jumping")
    end
    return namecall(self,...)
end)