
getgenv().Bhop = true
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
local namecall

namecall = hookmetamethod(game,"__namecall", function(self,...)
    local args = {...}
    if not checkcaller() and self and self.Name == "Communicator" and args[1] == "JumpDone" and getgenv().Bhop then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        return
    end
    return namecall(self,...)
end)
