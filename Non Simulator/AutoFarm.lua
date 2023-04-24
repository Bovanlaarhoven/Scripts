local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

getgenv().moneyFound = false
getgenv().allMoneyCollected = false

for _, v in pairs(workspace:GetDescendants()) do
    if v.ClassName == "Seat" then
        v.Disabled = true
    end
end

local function equipTool()
    local backpack = player:WaitForChild("Backpack")
    local tool = backpack:FindFirstChild("Combat")
    if tool then
        player.Character.Humanoid:EquipTool(tool)
    end
end

equipTool()

local initialOpenSize = Vector3.new(2.6, 0.5, 1.3)
local function moveToCashier(searchForDifferentCashier)
    local cashiers = game.Workspace.Cashiers:GetChildren()
    local validCashiers = {}

    for _, cashierPart in ipairs(cashiers) do
        local openPart = cashierPart:FindFirstChild("Open")
        if openPart and openPart.Size ~= initialOpenSize then
            table.insert(validCashiers, cashierPart)
        end
    end

    if #validCashiers == 0 then
        warn("No open cashiers found")
        return
    end

    local attempts = 0
    while true do
        local cashierPart = validCashiers[math.random(#validCashiers)]
        local openPart = cashierPart:FindFirstChild("Open")
        if not openPart then
            warn("Open part not found in cashier")
            attempts += 1
            if attempts >= 3 then -- try a different cashier after 3 failed attempts
                return
            end
        else
            local targetPosition = openPart.CFrame

            local tweenInfo = TweenInfo.new(1)
            local tween = game:GetService("TweenService"):Create(character.HumanoidRootPart, tweenInfo, {CFrame = targetPosition})
            tween:Play()

            tween.Completed:Wait()

            mouse1press()
            wait(2)
            mouse1release()
            wait(2)
            mouse1press()
            wait(2)
            mouse1release()
            wait(2)

            while true do
                for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == "MoneyDrop" and (v.Position - character.HumanoidRootPart.Position).Magnitude <= 100 then
                        fireclickdetector(v.ClickDetector)
                        getgenv().moneyFound = true
                    end
                end
                if not getgenv().moneyFound then
                    getgenv().moneyFound = false
                    break
                end
                task.wait(1)
            end
            
            if searchForDifferentCashier then
                return
            else
                break
            end
        end
    end
end

local function main()
    while not getgenv().allMoneyCollected do
        repeat
            moveToCashier(false)
        until getgenv().moneyFound
        
        wait(8) -- Wait for money collection to complete
        
        repeat
            moveToCashier(true)
        until getgenv().moneyFound
        
        getgenv().moneyFound = false
    end
end

coroutine.wrap(main)()
