local pages = game:GetService("AssetService"):GetGamePlacesAsync()
local places = {}
while true do
for _,v in next, pages:GetCurrentPage() do
places[v.Name] = v.PlaceId
end
if pages.IsFinished then
break
end
pages:AdvanceToNextPageAsync()
end

local highlight = Instance.new("Highlight")
local selectionbox = Instance.new("SelectionBox")
local InputService = game:GetService('UserInputService')
local CoreGui = game:GetService('CoreGui')
local Logger = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local Output = Instance.new("TextLabel")
local Main1 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Template = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")

local Id = Instance.new("ScreenGui")
local Idsfilling = Instance.new("Frame")
local UICorner4 = Instance.new("UICorner")
local Padding = Instance.new("Frame")
local UIListLayout1 = Instance.new("UIListLayout")
local UICorner_3 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local Title1 = Instance.new("TextLabel")

local PlayerList = Instance.new("ScreenGui")
local Filling = Instance.new("Frame")
local UICorner5 = Instance.new("UICorner")
local padsing = Instance.new("Frame")
local UIListLayout2 = Instance.new("UIListLayout")
local UICorner_5 = Instance.new("UICorner")
local TextButton1 = Instance.new("TextButton")
local Title4 = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")

Logger.Name = "Logger"
Logger.Parent = CoreGui
Logger.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = Logger
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Position = UDim2.new(0.168009207, 0, 0.312967569, 0)
Main.Size = UDim2.new(0, 544, 0, 285)

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Main

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Main
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0169171542, 0, 0.0272445828, 0)
Title.Size = UDim2.new(0, 258, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "BetterLogger - Roblox Console Logger"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Output.Name = "Output"
Output.Parent = Main
Output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Output.BackgroundTransparency = 1.000
Output.Position = UDim2.new(0.0169171542, 0, 0.171104237, 0)
Output.Size = UDim2.new(0, 258, 0, 25)
Output.Font = Enum.Font.GothamBold
Output.Text = "Output:"
Output.TextColor3 = Color3.fromRGB(208, 208, 208)
Output.TextSize = 14.000
Output.TextXAlignment = Enum.TextXAlignment.Left

Main1.Name = "Main1"
Main1.Parent = Main
Main1.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Main1.Position = UDim2.new(0.0154356118, 0, 0.256827146, 0)
Main1.Size = UDim2.new(0, 526, 0, 204)

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = Main1

Template.Name = "Template"
Template.Parent = Main1
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BackgroundTransparency = 1.000
Template.ClipsDescendants = true
Template.Position = UDim2.new(-0.0085551329, 0, 0.00278906734, 0)
Template.Size = UDim2.new(0, 520, 0, 203)
Template.Font = Enum.Font.GothamBold
Template.Text = "BetterLogger - Roblox Console Logger"
Template.TextColor3 = Color3.fromRGB(255, 255, 255)
Template.TextSize = 14.000
Template.TextWrapped = true
Template.TextXAlignment = Enum.TextXAlignment.Left
Template.TextYAlignment = Enum.TextYAlignment.Top

UIListLayout.Parent = Main1
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Scripts:

local function CRYDRVK_fake_script()
	local script = Instance.new('LocalScript', Template)

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
coroutine.wrap(CRYDRVK_fake_script)()

local function SPQJXF_fake_script() -- Main.Dragify 
	local script = Instance.new('LocalScript', Main)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (10);
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(SPQJXF_fake_script)()



Id.Name = "Id"
Id.Parent = CoreGui
Id.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Id.ResetOnSpawn = false

Idsfilling.Name = "Idsfilling"
Idsfilling.Parent = Id
Idsfilling.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Idsfilling.Position = UDim2.new(0.879475594, 0, 0.0266821384, 0)
Idsfilling.Size = UDim2.new(0, 146, 0, 616)

UICorner4.CornerRadius = UDim.new(0, 6)
UICorner4.Parent = Idsfilling

Padding.Name = "Padding"
Padding.Parent = Idsfilling
Padding.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Padding.Position = UDim2.new(0.0958904102, 0, 0.0890052319, 0)
Padding.Size = UDim2.new(0, 117, 0, 540)

UIListLayout1.Parent = Padding

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = Padding

for i,v in next, places do
	local TextbuttonClone = TextButton:Clone()
	TextbuttonClone.Parent = Padding
	TextbuttonClone.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TextbuttonClone.Size = UDim2.new(0, 117, 0, 50)
	TextbuttonClone.ZIndex = 2
	TextbuttonClone.Text = v..""
	TextbuttonClone.Font = Enum.Font.SourceSans
	TextbuttonClone.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextbuttonClone.TextSize = 14.000
	TextbuttonClone.MouseButton1Click:Connect(function()
		game:GetService("TeleportService"):Teleport(v)
	end)
end


Title1.Name = "Title1"
Title1.Parent = Idsfilling
Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title1.BackgroundTransparency = 1.000
Title1.Position = UDim2.new(0.30458802, 0, 0.0220089555, 0)
Title1.Size = UDim2.new(0, 56, 0, 25)
Title1.Font = Enum.Font.GothamBold
Title1.Text = "Placeids"
Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
Title1.TextSize = 14.000
Title1.TextXAlignment = Enum.TextXAlignment.Left

local function BMRDXRL_fake_script() -- Idsfilling.Dragify 
	local script = Instance.new('LocalScript', Idsfilling)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (10);
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(BMRDXRL_fake_script)()

PlayerList.Name = "PlayerList"
PlayerList.Parent = CoreGui
PlayerList.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Filling.Name = "Filling"
Filling.Parent = PlayerList
Filling.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Filling.Position = UDim2.new(0.00683454098, 0, 0.00812064949, 0)
Filling.Size = UDim2.new(0, 261, 0, 855)

UICorner5.CornerRadius = UDim.new(0, 6)
UICorner5.Parent = Filling

padsing.Name = "padsing"
padsing.Parent = Filling
padsing.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
padsing.Position = UDim2.new(0.0882275477, 0, 0.0638099611, 0)
padsing.Size = UDim2.new(0, 212, 0, 785)

UIListLayout2.Parent = ScrollingFrame

UICorner_5.CornerRadius = UDim.new(0, 6)
UICorner_5.Parent = padsing

ScrollingFrame.Parent = padsing
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ScrollingFrame.BorderColor3 = Color3.fromRGB(35, 35, 35)
ScrollingFrame.Size = UDim2.new(0, 212, 0, 785)

local Players = game:GetService("Players")
for i, player in pairs(Players:GetPlayers()) do
	local TextbuttonClone1 = TextButton1:Clone()
	TextbuttonClone1.Parent = ScrollingFrame
	TextbuttonClone1.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	TextbuttonClone1.BorderColor3 = Color3.fromRGB(35, 35, 35)
	TextbuttonClone1.Size = UDim2.new(0, 212, 0, 50)
	TextbuttonClone1.Text = player.Name..""
	TextbuttonClone1.ZIndex = 2
	TextbuttonClone1.Font = Enum.Font.SourceSansBold
	TextbuttonClone1.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextbuttonClone1.TextSize = 18.000
	TextbuttonClone1.MouseButton1Click:Connect(function()
		highlight.Parent = player.Character
		selectionbox.Adornee = player.Character
		selectionbox.Parent = player.Character
	end)
end

Title4.Name = "Title4"
Title4.Parent = Filling
Title4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title4.BackgroundTransparency = 1.000
Title4.Position = UDim2.new(0.354396492, 0, 0.0354893431, 0)
Title4.Size = UDim2.new(0, 75, 0, 25)
Title4.Font = Enum.Font.GothamBold
Title4.Text = "Player List"
Title4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title4.TextSize = 14.000
Title4.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function DQVSVDW_fake_script() -- Filling.Dragify 
	local script = Instance.new('LocalScript', Filling)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (10);
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(DQVSVDW_fake_script)()


InputService.InputBegan:Connect(function(Input, Processed)
    if Input.KeyCode == Enum.KeyCode.F1 or (Input.KeyCode == Enum.KeyCode.Insert and (not Processed)) then
        Main.Visible = not Main.Visible
		Idsfilling.Visible = not Idsfilling.Visible
		Filling.Visible = not Filling.Visible
    end
end)

InputService.InputBegan:Connect(function(Input)
	if Input.KeyCode == Enum.KeyCode.Delete then
		Main:Destroy()
		Idsfilling:Destroy()
		Filling:Destroy()
	end
end)
	