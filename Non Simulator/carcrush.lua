local lplrname = game:GetService("Players").LocalPlayer.Name
local vehicleName = lplrname
local vehiclename1 = "Honda_4"

game:GetService("ReplicatedStorage").rF.SpawnVehicle:InvokeServer(vehiclename1)
print("Remote event fired.")

while true do
    local success, error = pcall(function()
        local vehicle = workspace.CarCollection[lplrname]:FindFirstChild("Car")
        if vehicle then
            local rootPart = vehicle.Body:FindFirstChild("VehicleSeat")
            local parts = vehicle:GetDescendants()

            if rootPart then
                if not rootPart.Occupant then
                    game:GetService("ReplicatedStorage").rF.SpawnVehicle:InvokeServer(vehiclename1)
                    print("Remote event fired.")
                else
                    local offset = Vector3.new(0, 100, 0)
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") then
                            part.CFrame = part.CFrame + offset
                        end
                    end
                    print("Vehicle teleported successfully.")
                end
            else
                print("Root part not found. Resetting character.")
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
            end
        else
            print("Vehicle not found in the workspace.")
        end
    end)

    if not success then
        print("An error occurred:", error)
    end

    wait(0.5)
end
