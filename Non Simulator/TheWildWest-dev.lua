local lplr = game:GetService("Players").LocalPlayer
local walkspeed = lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
local speedSlider = {Value = walkspeed}
local speed = {Enabled = false}
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
	Name = "The Wild West (dev build)",
	LoadingTitle = "Hydra Network",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = true,
        	Invite = "YvwEyH2W6t",
        	RememberJoins = true 
        },
	KeySystem = false,
	KeySettings = {
		Title = "Hydra Network",
		Subtitle = "Key System",
		Note = "Key link copied in clipboard!",
		FileName = "SiriusKey",
		SaveKey = false,
		GrabKeyFromSite = true,
		Key = ""
	}
})

local T1 = Window:CreateTab("Player", 4483362458)

local Toggle = T1:CreateToggle({
    Name = "Toggle walkspeed",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(callback)
        speed.Enabled = callback
        if callback then
            coroutine.wrap(function()
                repeat
                    if lplr and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") then
                        pcall(function()
                            local moveDir = lplr.Character.Humanoid.MoveDirection*speedSlider.Value
                            lplr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDir.X, lplr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y, moveDir.Z)
                        end)
                    end
                    task.wait()
                until speed.Enabled == false
            end)()
        end
    end,
 })

local Slider = T1:CreateSlider({
    Name = "walkspeed",
    Range = {0, 40},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 5,
    Flag = "Slider1",
    Callback = function(callback)
        speedSlider.Value = callback
    end,
 })
