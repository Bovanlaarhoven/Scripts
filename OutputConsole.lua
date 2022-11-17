local Output = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextOuput = Instance.new("TextLabel")

Output.Name = "Output"
Output.Parent = game.Players.LocalPlayer:WaitForChild("CoreGui")

Main.Name = "Main"
Main.Parent = Output
Main.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Main.BackgroundTransparency = 0.200
Main.Position = UDim2.new(0.0174418613, 0, 0.0255220421, 0)
Main.Size = UDim2.new(0, 448, 0, 743)

TextOuput.Name = "Text Ouput"
TextOuput.Parent = Main
TextOuput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextOuput.BackgroundTransparency = 1.000
TextOuput.Position = UDim2.new(0.0216696654, 0, 0.0225039255, 0)
TextOuput.Size = UDim2.new(0, 427, 0, 726)
TextOuput.Font = Enum.Font.SourceSans
TextOuput.TextColor3 = Color3.fromRGB(0, 0, 0)
TextOuput.TextSize = 24.000
TextOuput.TextWrapped = true
TextOuput.TextXAlignment = Enum.TextXAlignment.Left
TextOuput.TextYAlignment = Enum.TextYAlignment.Top

-- Scripts:

local function RIWMFBW_fake_script() -- TextOuput.LocalScript 
	local script = Instance.new('LocalScript', TextOuput)

	local LogService = game:GetService("LogService")
	
	
	local TextLabel = script.Parent
	
	local function onMessageOut(message, messageType)
		if messageType == Enum.MessageType.MessageWarning then
			TextLabel.TextColor3 = Color3.new(1, 0, 0.0654307)
			TextLabel.Text = " " ..message
		elseif messageType == Enum.MessageType.MessageOutput then
			TextLabel.TextColor3 = Color3.new(255,255,255)
			TextLabel.Text = " " ..message
		elseif messageType == Enum.MessageType.MessageError then
			TextLabel.TextColor3 = Color3.new(1, 0.449516, 0.0210575)
			TextLabel.Text = " " ..message
		elseif messageType == Enum.MessageType.MessageInfo then
			TextLabel.TextColor3 = Color3.new(0, 1, 0.925261)
			TextLabel.Text = " " ..message
		end
	end
	
	LogService.MessageOut:Connect(onMessageOut)
end
coroutine.wrap(RIWMFBW_fake_script)()
