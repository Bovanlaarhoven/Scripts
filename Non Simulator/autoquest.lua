for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

local getupvalue = (getupvalue or debug.getupvalue);
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end;

repeat wait() until game:IsLoaded();
local players = game:GetService("Players");
local lplr = players.LocalPlayer;
local variables, mainEnv, encrypt;
local runservice = game:GetService("RunService");

local Settings = {
    autoquest = true,
}

do
    local banRemotes = {
        "FireToDieInstantly";
        "LoadString";
        "FlyRequest";
        "FinishTimeTrial";
        "UpdateDunceList";
        "FF";
        "okbye";
        "Fling";
        "ClientFling";
        "LCombo";
        "SubmitCombo";
        "GetCurrentCombo";
        "MaxCombo";
        "UpdateCombo";
    }

    local hook
    hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if (method == "FireServer" and table.find(banRemotes, self.Name)) then
            return
        end
        if (method == "InvokeServer" and table.find(banRemotes, self.Name)) then
            return
        end
        return hook(self, unpack(args))
    end))

    local old
    old = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if (key == "PlaybackLoudness" and getfenv(2).script.Name == "RadioScript") then
            return 0;
        end

        return old(self, key);
    end))
    
    local function onCharacterAdded(char)
        if (not char)  then return end
        wait(1)
        local Main = lplr.Backpack:WaitForChild("Main")
        variables = getupvalue(getsenv(Main).charJump, 1)
        variables.adminLevel = 13
        getfenv().script = Main
        mainEnv = getsenv(Main)
        main = getupvalue(getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).resetAmmo, 1)
        encrypt = function(string)
            local _, res = pcall(mainEnv.encrypt, string)
            return res
        end
    end
    onCharacterAdded(lplr.Character);
    lplr.CharacterAdded:Connect(onCharacterAdded);
end

local Support = {
    general29 = false,
}

local SupportedMission = {
    general29 = function()
        if Support.general29 then
            for i = 1,10 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("landms", math.random(50, 75))
                wait(0.1)
            end
        end
    end,
}

local function reset()
    local defaultmission = game:GetService("ReplicatedStorage").PlayerData[lplr.Name].Generic.DefaultMission.Value
    game:GetService("ReplicatedStorage").MissionReroll:FireServer("default" .. defaultmission)
end

local foundSupportedFolder = false

while not foundSupportedFolder do
    for _,v in pairs(game:GetService("ReplicatedStorage").PlayerRuntimeData[lplr.Name]:GetDescendants()) do
        if v.ClassName == "Folder" and Support[v.name] ~= nil then
            Support[v.name] = true
            SupportedMission[v.name]()
            foundSupportedFolder = true
        end
    end
    if not foundSupportedFolder then
        print("No supported mission found. Rerolling mission...")
        reset()
        wait(5) -- Wait 5 seconds before searching again
    end
end

