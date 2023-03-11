local getupvalue = (getupvalue or debug.getupvalue);
local getmetatable = (debug.getmetatable or getrawmetatable);
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end;

repeat wait() until game:IsLoaded();
local players = game:GetService("Players");
local replicatedStorage = game:GetService("ReplicatedStorage");
local scriptContext = game:GetService("ScriptContext");
local client = players.LocalPlayer;
local variables, mainEnv, encrypt;
local runservice = game:GetService("RunService");

do
    local banRemotes = {
        "AttemptTeleport";
        "FireToDieInstantly";
        "LandWithForceField";
        "LoadString";
        "FlyRequest";
        "FinishTimeTrial";
        "Under3Seconds";
        "UpdateDunceList";
        "HighCombo";
        "r";
        "t";
        "FF";
    };

    local nc;
    nc = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...};
        local method = getnamecallmethod();
    
        if (method == "FireServer" and table.find(banRemotes, self.Name)) then
            return;
        elseif (method == "FireServer" and self.Name == "SubmitCombo" and args[1] > 299) then
            args[1] = math.random(250, 299); --> Hudzell, please suck my cock :)
        elseif (method == "TakeDamage" and self.ClassName == "Humanoid") then
            return;
        end;
    
        return nc(self, unpack(args));
    end));

    local idx;
    idx = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if (key == "PlaybackLoudness" and getfenv(2).script.Name == "RadioScript") then
            return 0;
        end;

        return idx(self, key);
    end));

    local function onCharacterAdded(char)
        if (not char) then return end;
        wait(1);
        local mainScript = client.Backpack:WaitForChild("Main");
        variables = getupvalue(getsenv(mainScript).charJump, 1);
        variables.adminLevel = 13;
        getfenv().script = mainScript;
        mainEnv = getsenv(mainScript);
        encrypt = function(str)
            local _, res = pcall(mainEnv.encrypt, str);
            return res;
        end;
    end;

    onCharacterAdded(client.Character);
    client.CharacterAdded:Connect(onCharacterAdded);
end;

local moves = {
  "slide";
  "dropdown";
  "ledgegrab";
  "edgejump";
  "longjump";
  "vault";
  "wallrun";
  "springboard";
};

runservice.RenderStepped:Connect(function()
  if (client.Backpack and client.Backpack:FindFirstChild("Main") and client.PlayerScripts:FindFirstChild("Points") and getsenv(client.Backpack.Main)) then
    local pointsEnv = getsenv(client.PlayerScripts.Points);
    pointsEnv.changeParkourRemoteParent(workspace);
  
    local scoreRemote = getupvalue(pointsEnv.changeParkourRemoteParent, 2);
  
    scoreRemote:FireServer(encrypt("walljump"), {
        [encrypt("walljumpDelta")] = encrypt(tostring(math.random(2.02, 3.55)));
        [encrypt("combo")] = encrypt(tostring(math.random(4, 5)));
    });
  
    wait(0.4);
  
    scoreRemote:FireServer(encrypt(moves[math.random(1, #moves)]), {
        [encrypt("combo")] = encrypt(tostring(1));
    });
  
    wait(math.random(1.25, 1.35));
  end;
  wait();
end)