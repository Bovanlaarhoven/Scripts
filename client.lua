getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Animate = game.Players.LocalPlayer.Character.Animate

local Window = Rayfield:CreateWindow({
	Name = "Juul Client",
	LoadingTitle = "Juul Client",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "Jull"
	},
        Discord = {
        	Enabled = false,
        	Invite = "YvwEyH2W6t",
        	RememberJoins = true 
        },
	KeySystem = false,
	KeySettings = {
		Title = "Noob",
		Subtitle = "Noob",
		Note = "Noob",
		FileName = "Noob",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "Noob"
	}
})

local Render = Window:CreateTab("Render", 4483362458)

local Input = Render:CreateInput({
	Name = "Idle Animation",
	PlaceholderText = "Put in Idle animation id",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id="..Text
	end,
})

local Input = Render:CreateInput({
	Name = "Walk Animation",
	PlaceholderText = "Put in Walk animation id",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id="..Text
	end,
})

local Input = Render:CreateInput({
	Name = "Run Animation",
	PlaceholderText = "Put in run animation id",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id="..Text
	end,
})

local Input = Render:CreateInput({
	Name = "Jump Animation",
	PlaceholderText = "Put in jump animation id",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id="..Text
	end,
})

local Input = Render:CreateInput({
	Name = "Climb Animation",
	PlaceholderText = "Put in climb animation id",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id="..Text
	end,
})

local Input = Render:CreateInput({
	Name = "Fall Animation",
	PlaceholderText = "Put in fall animation id",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id="..Text
	end,
})


