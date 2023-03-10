getgenv().Bhop = true
local Input = game:GetService("VirtualInputManager")
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
local namecall

namecall = hookmetamethod(game,"__namecall", function(self,...)
    local args = {...}
    if not checkcaller() and self and self.Name == "Communicator" and args[1] == "JumpDone" and getgenv().Bhop then
        -- Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        Input:SendKeyEvent(true ,Enum.KeyCode.Space ,false ,game)
        return
    end
    return namecall(self,...)
end)
