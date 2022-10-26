local library = {}
local toggled = false

function library:CreateWindow(name)
    local Design = Instance.new("ScreenGui")
    local TopMain = Instance.new("Frame")
    local Container = Instance.new("Frame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local Title = Instance.new("TextLabel")
    local ToggleVisable = Instance.new("TextButton")


    Design.Name = "Design"
    Design.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    TopMain.Name = "TopMain"
    TopMain.Parent = Design
    TopMain.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    TopMain.BackgroundTransparency = 0.100
    TopMain.BorderColor3 = Color3.fromRGB(61, 61, 61)
    TopMain.Position = UDim2.new(0.0988264382, 0, 0.081206508, 0)
    TopMain.Size = UDim2.new(0, 455, 0, 25)

    Container.Name = "Container"
    Container.Parent = TopMain
    Container.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    Container.BackgroundTransparency = 0.300
    Container.BorderColor3 = Color3.fromRGB(61, 61, 61)
    Container.Position = UDim2.new(-6.25177927e-05, 0, 0.99540621, 0)
    Container.Size = UDim2.new(0, 455, 0, 440)

    UIGridLayout.Parent = Container
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 455, 0, 45)

    Title.Name = "Title"
    Title.Parent = TopMain
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(-0.00246277917, 0, 0, 0)
    Title.Size = UDim2.new(0, 455, 0, 25)
    Title.Font = Enum.Font.SourceSans
    Title.TextColor3 = Color3.fromRGB(0, 0, 0)
    Title.TextSize = 14.000
    Title.Text = name
    Title.TextScaled = true

    ToggleVisable.Name = "ToggleVisable"
    ToggleVisable.Parent = TopMain
    ToggleVisable.BackgroundColor3 = Color3.fromRGB(198, 28, 31)
    ToggleVisable.BorderColor3 = Color3.fromRGB(255, 0, 0)
    ToggleVisable.Position = UDim2.new(0.928791225, 0, 0, 0)
    ToggleVisable.Size = UDim2.new(0, 32, 0, 25)
    ToggleVisable.Font = Enum.Font.SourceSans
    ToggleVisable.Text = "V"
    ToggleVisable.TextColor3 = Color3.fromRGB(0, 0, 0)
    ToggleVisable.TextScaled = true
    ToggleVisable.TextSize = 14.000
    ToggleVisable.TextWrapped = true
    ToggleVisable.MouseButton1Down:Connect(function()
            if toggled then
                toggled = false
                Container:TweenSize(UDim2.new(0, 455,0, 0), "In", "Linear", 0.1)
            else
                toggled = true
                Container:TweenSize(UDim2.new(0, 455,0, 440), "Out", "Linear", 0.1)
            end
        end)

    local HydraLib = {}

    function HydraLib:CreateButton(text, callback)
        local callback = callback or function() end

        local TextButton = Instance.new("TextButton")

        TextButton.Parent = Container
        TextButton.BackgroundColor3 = Color3.fromRGB(123, 123, 129)
        TextButton.BackgroundTransparency = 0.800
        TextButton.BorderColor3 = Color3.fromRGB(123, 123, 129)
        TextButton.Position = UDim2.new(0.0040485831, 0, 0.0366197191, 0)
        TextButton.Size = UDim2.new(0, 246, 0, 50)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.Text = "Filler Text"
        TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton.TextScaled = true
        TextButton.TextSize = 14.000
        TextButton.TextWrapped = true
        TextButton.Text = text

        TextButton.MouseButton1Down:Connect(function()
            pcall(callback)
        end)
    end 
    return HydraLib
end

local main = library:CreateWindow("Noob")

main:CreateButton("test", function()
    print("test")
end)