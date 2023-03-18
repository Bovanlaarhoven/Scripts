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
local camera = workspace.CurrentCamera;
local runservice = game:GetService("RunService");

do
    local Remotes = {
        "ErrorLoggerRemote",
    }

    local hook
    hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if (method == "FireServer" and table.find(Remotes, self.Name)) then
            return
        end
        if (method == "InvokeServer" and table.find(Remotes, self.Name)) then
            return
        end
        return hook(self, unpack(args))
    end))
end