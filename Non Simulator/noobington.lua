repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)


--

local Tyrisware = {
    Locals = {
        LastPreviewUpdate = 5
    },
    Account = {
        Username = game.Players.LocalPlayer.Name,
        UserID = game.Players.LocalPlayer.UserId
    },
    Configs = {},
    Weapons = { 
        "Glock",
        "SMG",
        "Silencer",
        "TacticalShotgun",
        "P90",
        "AUG",
        "Shotgun",
        "RPG",
        "AR",
        "Double-Barrel SG",
        "Flamethrower",
        "Revolver",
        "LMG",
        "AK47",
        "DrumGun",
        "Silencer",
        "GrenadeLauncher",
        "Taser",
        "SilencerAR"
    }
}
-- hello matas
function utility:UpdatePreview(Pass)
    if (Tyrisware.Locals.Window and Tyrisware.Locals.Window.isVisible and Tyrisware.Locals.SelectedPage == "Players") or Pass then
        if Tyrisware.Locals.SelectedPage and Tyrisware.Locals.SelectedPlayersSection then
            local Size = {0, 0}
            local Selection = ("Players" .. Tyrisware.Locals.SelectedPlayersSection .. "_")
            --
            if Flags[Selection .. "Chams"]:Get() then
                local ChamsFill, ChamsFillTransparency = Flags[Selection .. "ChamsFill"]:Get().Color, Flags[Selection .. "ChamsFill"]:Get().Transparency
                local ChamsOutline, ChamsOutlineTransparency = Flags[Selection .. "ChamsOutline"]:Get().Color, Flags[Selection .. "ChamsOutline"]:Get().Transparency
                --
                local ChamsAuto = Tyrisware.Locals.SelectedPlayersSection ~= "Local" and Flags[Selection .. "ChamsAuto"]:Get()
                local ChamsVisible, ChamsVisibleTransparency = ChamsAuto and Flags[Selection .. "ChamsVisible"]:Get().Color, ChamsAuto and Flags[Selection .. "ChamsVisible"]:Get().Transparency
                local ChamsHidden, ChamsHiddenTransparency = ChamsAuto and Flags[Selection .. "ChamsHidden"]:Get().Color, ChamsAuto and Flags[Selection .. "ChamsHidden"]:Get().Transparency
                --
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Chams", "Color", ChamsOutline, 1)
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Chams", "Transparency", 1 - ChamsOutlineTransparency, 1)
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Chams", "Color", ChamsAuto and ((Tyrisware.Locals.Window.VisualPreview.Visible) and ChamsVisible or ChamsHidden) or ChamsFill, 2)
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Chams", "Transparency", 1 - (ChamsAuto and ((Tyrisware.Locals.Window.VisualPreview.Visible) and ChamsVisibleTransparency or ChamsHiddenTransparency) or ChamsFillTransparency), 2)
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Chams", "Transparency", 0, 1)
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Chams", "Transparency", 0, 2)
            end
            --
            if Flags[Selection .. "Box"]:Get() then
                local BoxColor, BoxTransparency = Flags[Selection .. "BoxColor"]:Get().Color, Flags[Selection .. "BoxColor"]:Get().Transparency
                local BoxFillColor, BoxFillTransparency = Flags[Selection .. "BoxFill"]:Get().Color, Flags[Selection .. "BoxFill"]:Get().Transparency
                --
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Box", "Box", "Color", BoxColor)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Box", "Box", "Transparency", 1 - BoxTransparency)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Box", "Outline", "Transparency", 1 - BoxTransparency)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Box", "Fill", "Color", BoxFillColor)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Box", "Fill", "Transparency", 1 - BoxFillTransparency)
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Box", "Transparency", 0)
            end
            --
            local HealthBarColor, HealthBarColor2, HealthBarTransparency = Flags[Selection .. "HealthBarColor1"]:Get().Color, Flags[Selection .. "HealthBarColor2"]:Get().Color, Flags[Selection .. "HealthBarColor1"]:Get().Transparency
            --
            if Flags[Selection .. "HealthBar"]:Get() then
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("HealthBar", "Box", "Transparency", 1 - HealthBarTransparency)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("HealthBar", "Outline", "Transparency", 1 - HealthBarTransparency)
                --
                Size[1] = 5
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("HealthBar", "Transparency", 0)
            end
            --
            if Flags[Selection .. "HealthNum"]:Get() or Flags[Selection .. "HealthBar"]:Get() then
                Tyrisware.Locals.Window.VisualPreview.Color1 = HealthBarColor
                Tyrisware.Locals.Window.VisualPreview.Color2 = HealthBarColor2
                --
                Tyrisware.Locals.Window.VisualPreview:UpdateHealthBar()
            end
            --
            if Flags[Selection .. "HealthNum"]:Get() then
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("HealthBar", "Value", "Transparency", 1 - HealthBarTransparency or 0)
                --
                Tyrisware.Locals.Window.VisualPreview:UpdateHealthValue(Size[1])
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("HealthBar", "Value", "Transparency", 0)
            end
            --
            if Flags[Selection .. "Name"]:Get() then
                local NameColor, NameTransparency = Flags[Selection .. "NameColor"]:Get().Color, Flags[Selection .. "NameColor"]:Get().Transparency
                --
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Title", "Text", "Color", NameColor)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Title", "Text", "Transparency", 1 - NameTransparency)
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Title", "Transparency", 0)
            end
            --
            if Flags[Selection .. "Distance"]:Get() then
                local DistanceColor, DistanceTransparency = Flags[Selection .. "DistanceColor"]:Get().Color, Flags[Selection .. "DistanceColor"]:Get().Transparency
                --
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Distance", "Text", "Color", DistanceColor)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Distance", "Text", "Transparency", 1 - DistanceTransparency)
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Distance", "Transparency", 0)
            end
            --
            if Flags[Selection .. "Tool"]:Get() then
                local ToolColor, ToolTransparency = Flags[Selection .. "ToolColor"]:Get().Color, Flags[Selection .. "ToolColor"]:Get().Transparency
                --
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Tool", "Text", "Color", ToolColor)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Tool", "Text", "Transparency", 1 - ToolTransparency)
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Tool", "Transparency", 0)
            end
            --
            if Flags[Selection .. "Flags"]:Get() then
                local FlagsColor, FlagsTransparency = Flags[Selection .. "FlagsColor"]:Get().Color, Flags[Selection .. "FlagsColor"]:Get().Transparency
                --
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Flags", "Text", "Color", FlagsColor)
                Tyrisware.Locals.Window.VisualPreview:SetComponentSelfProperty("Flags", "Text", "Transparency", 1 - FlagsTransparency)
            else
                Tyrisware.Locals.Window.VisualPreview:SetComponentProperty("Flags", "Transparency", 0)
            end
            --
            Tyrisware.Locals.Window.VisualPreview:ValidateSize("X", Size[1])
        end
    end
end
--
utility:Connection(rs.Heartbeat, function()
    local Tick = tick()
    --
    if (Tick - Tyrisware.Locals.LastPreviewUpdate) > 0.05 then
        utility:ThreadFunction(utility.UpdatePreview)
        Tyrisware.Locals.LastPreviewUpdate = Tick
    end
end)
--

-- init configs
if isfolder("Tyrisware/Configs") then
    for i,v in pairs(listfiles("Tyrisware/Configs")) do
        table.insert(Tyrisware.Configs, v:split("\\")[2]:split(".")[1])
    end
else
    makefolder("Tyrisware/Configs")
end
local HttpService = game:GetService("HttpService")
local Library, utility, Flags, Theme = library, utility, library.pointers, theme
local Languages, Themes = {}, {
Default = {1, [[{"Outline":"000000","Accent":"5d3e98","LightText":"ffffff","DarkText":"afafaf","LightContrast":"1e1e1e","CursorOutline":"0a0a0a","DarkContrast":"141414","TextBorder":"000000","Inline":"323232"}]]},
Abyss = {2, [[{"Outline":"0a0a0a","Accent":"8c87b4","LightText":"ffffff","DarkText":"afafaf","LightContrast":"1e1e1e","CursorOutline":"141414","DarkContrast":"141414","TextBorder":"0a0a0a","Inline":"2d2d2d"}]]},
Fatality = {3, [[{"Outline":"0f0f28","Accent":"f00f50","LightText":"c8c8ff","DarkText":"afafaf","LightContrast":"231946","CursorOutline":"0f0f28","DarkContrast":"191432","TextBorder":"0a0a0a","Inline":"322850"}]]},
Neverlose = {4, [[{"Outline":"000005","Accent":"00b4f0","LightText":"ffffff","DarkText":"afafaf","LightContrast":"000f1e","CursorOutline":"0f0f28","DarkContrast":"050514","TextBorder":"0a0a0a","Inline":"0a1e28"}]]},
Aimware = {5, [[{"Outline":"000005","Accent":"c82828","LightText":"e8e8e8","DarkText":"afafaf","LightContrast":"2b2b2b","CursorOutline":"191919","DarkContrast":"191919","TextBorder":"0a0a0a","Inline":"373737"}]]},
Youtube = {6, [[{"Outline":"000000","Accent":"ff0000","LightText":"f1f1f1","DarkText":"aaaaaa","LightContrast":"232323","CursorOutline":"121212","DarkContrast":"0f0f0f","TextBorder":"121212","Inline":"393939"}]]},
Gamesense = {7, [[{"Outline":"000000","Accent":"a7d94d","LightText":"ffffff","DarkText":"afafaf","LightContrast":"171717","CursorOutline":"141414","DarkContrast":"0c0c0c","TextBorder":"141414","Inline":"282828"}]]},
Onetap = {8, [[{"Outline":"000000","Accent":"dda85d","LightText":"d6d9e0","DarkText":"afafaf","LightContrast":"2c3037","CursorOutline":"000000","DarkContrast":"1f2125","TextBorder":"000000","Inline":"4e5158"}]]},
Entropy = {9, [[{"Outline":"0a0a0a","Accent":"81bbe9","LightText":"dcdcdc","DarkText":"afafaf","LightContrast":"3d3a43","CursorOutline":"000000","DarkContrast":"302f37","TextBorder":"000000","Inline":"4c4a52"}]]},
Interwebz = {10, [[{"Outline":"1a1a1a","Accent":"c9654b","LightText":"fcfcfc","DarkText":"a8a8a8","LightContrast":"291f38","CursorOutline":"1a1a1a","DarkContrast":"1f162b","TextBorder":"000000","Inline":"40364f"}]]},
Dracula = {11, [[{"Outline":"202126","Accent":"9a81b3","LightText":"b4b4b8","DarkText":"88888b","LightContrast":"2a2c38","CursorOutline":"202126","DarkContrast":"252730","TextBorder":"2a2c38","Inline":"3c384d"}]]},
Spotify = {12, [[{"Outline":"0a0a0a","Accent":"1ed760","LightText":"d0d0d0","DarkText":"949494","LightContrast":"181818","CursorOutline":"000000","DarkContrast":"121212","TextBorder":"000000","Inline":"292929"}]]},
Sublime = {13, [[{"Outline":"000000","Accent":"ff9800","LightText":"e8ffff","DarkText":"d3d3c2","LightContrast":"32332d","CursorOutline":"000000","DarkContrast":"282923","TextBorder":"000000","Inline":"484944"}]]},
Vape = {14, [[{"Outline":"0a0a0a","Accent":"26866a","LightText":"dcdcdc","DarkText":"afafaf","LightContrast":"1f1f1f","CursorOutline":"000000","DarkContrast":"1a1a1a","TextBorder":"000000","Inline":"363636"}]]},
Neko = {15, [[{"Outline":"000000","Accent":"d21f6a","LightText":"ffffff","DarkText":"afafaf","LightContrast":"171717","CursorOutline":"0a0a0a","DarkContrast":"131313","TextBorder":"000000","Inline":"2d2d2d"}]]},
Corn = {16, [[{"Outline":"000000","Accent":"ff9000","LightText":"dcdcdc","DarkText":"afafaf","LightContrast":"252525","CursorOutline":"000000","DarkContrast":"191919","TextBorder":"000000","Inline":"333333"}]]},
Minecraft = {17, [[{"Outline":"000000","Accent":"27ce40","LightText":"ffffff","DarkText":"d7d7d7","LightContrast":"333333","CursorOutline":"000000","DarkContrast":"262626","TextBorder":"000000","Inline":"333333"}]]}}
--
Tyrisware.Locals.ShiftTick = tick()
Tyrisware.Locals.Shift = 0
--
function Tyrisware:CheckTeam(Player1, Player2)
    if Library.Relations[Player2.UserId] == "Friend" then
        return false
    elseif Library.Relations[Player2.UserId] == "Enemy" or Library.Relations[Player2.UserId] == "Priority" then
        return true
    end
    --
    return (Player1.TeamColor ~= Player2.TeamColor)
end
--
function Tyrisware:GetHealth(Player, Character, Humanoid)
    if Humanoid then
        return Clamp(Humanoid.Health, 0, Humanoid.MaxHealth), Humanoid.MaxHealth
    end
end
function Tyrisware:GetBodyParts(Character, RootPart, Indexes, Hitboxes)
    local Parts = {}
    local Hitboxes = Hitboxes or {"Head", "Torso", "Arms", "Legs"}
    --
    for Index, Part in pairs(Character:GetChildren()) do
        if Part:IsA("BasePart") and Part ~= RootPart then
            if Find(Hitboxes, "Head") and Part.Name:lower():find("head") then
                Parts[Indexes and Part.Name or #Parts + 1] = Part
            elseif Find(Hitboxes, "Torso") and Part.Name:lower():find("torso") then
                Parts[Indexes and Part.Name or #Parts + 1] = Part
            elseif Find(Hitboxes, "Arms") and Part.Name:lower():find("arm") then
                Parts[Indexes and Part.Name or #Parts + 1] = Part
            elseif Find(Hitboxes, "Legs") and Part.Name:lower():find("leg") then
                Parts[Indexes and Part.Name or #Parts + 1] = Part
            elseif (Find(Hitboxes, "Arms") and Part.Name:lower():find("hand")) or (Find(Hitboxes, "Legs ") and Part.Name:lower():find("foot")) then
                Parts[Indexes and Part.Name or #Parts + 1] = Part
            end
        end
    end
    --
    return Parts
end
--
function Tyrisware:ValidateClient(Player)
    local Object = Player.Character
    local Humanoid = (Object and Object:FindFirstChild("Humanoid"))
    local RootPart = (Humanoid and Object:FindFirstChild("HumanoidRootPart"))
    --
    return Object, Humanoid, RootPart
end
--
function Languages:GetTranslation(String)
    return String
end
--
do -- utility
    function utility:GetTableIndexes(Table, Custom)
        local Table2 = {}
        --
        for Index, Value in pairs(Table) do
            Table2[Custom and Value[1] or #Table2 + 1] = Index 
        end
        --
        return Table2
    end
    --
    function utility:ConvertTable(Table1)
        local Table2 = {}
        --
        for Index, Value in pairs(Table1) do
            Table2[typeof(Index) ~= "number" and Index or (#Table2 + 1)] = tostring(Value)
        end
        --
        return Table2
    end
    --
    function utility:ConvertString(Value)
        if typeof(Value) == "Color3" then
            Value = Value:ToHex()
        end
        --
        return Value
    end
    --
    function utility:Encode(Table)
        local Table2 = {}
        --
        for Index, Value in pairs(Table) do
            Table2[Index] = utility:ConvertString(Value)
        end
        --
        return HttpService:JSONEncode(Table2)
    end
    --
    function utility:Decode(Table)
        return HttpService:JSONDecode(Table)
    end
    --
    function Library:UpdateColor(ColorType, ColorValue)
        local ColorType = ColorType:lower()
        --
        Theme[ColorType] = ColorValue
        --
        for Index, Value in pairs(Library.colors) do
            for Index2, Value2 in pairs(Value) do
                if Value2 == ColorType then
                    Index[Index2] = Theme[Value2]
                end
            end
        end
    end
    --
    function Library:UpdateTheme(ThemeType, ThemeValue)
        if Flags["ConfigTheme_" .. ThemeType] then
            Flags["ConfigTheme_" .. ThemeType]:Set(ThemeValue)
        end
    end
    --
    function Library:LoadTheme(ThemeType)
        if Themes[ThemeType] then
            local ThemeValue = utility:Decode(Themes[ThemeType][2])
            --
            for Index, Value in pairs(ThemeValue) do
                Library:UpdateTheme(Index, Color3.fromHex(Value)) 
            end
        end
    end
    --
    function Library:RefreshConfigList()
        Flags["ConfigConfiguration_Box"].options = Tyrisware.Configs
        Flags["ConfigConfiguration_Box"]:Refresh()
        Flags["ConfigConfiguration_Box"].current = Clamp(Flags["ConfigConfiguration_Box"].current, 0, #Tyrisware.Configs)
    end
    --
    function Library:GetConfig()
        local Config = ""
        --
        for Index, Value in pairs(Flags) do
            print(Index, Value)
            if Index ~= "ConfigConfiguration_Box" and Index ~= "ConfigConfiguration_Name" then
                local Value2 = Value:Get()
                local Final = ""
                --
                if typeof(Value2) == "Color3" then
                    local Values = Value.current
                    --
                    Final = ("rgb(%s,%s,%s,%s)"):format(Values[1], Values[2], Values[3], Values[4])
                elseif typeof(Value2) == "table" and Value2.Color and Value2.Transparency then
                    local Values = Value.current
                    --
                    Final = ("rgb(%s,%s,%s,%s)"):format(Values[1], Values[2], Values[3], Values[4])
                elseif Value.mode then
                    local Values = Value.current
                    --
                    Final = ("key(%s,%s,%s)"):format(Values[1] or "nil", Values[2] or "nil", Value.mode)
                elseif (Value2 ~= nil) then
                    if typeof(Value2) == "boolean" then
                        Value2 = ("bool(%s)"):format(tostring(Value2))
                    elseif typeof(Value2) == "table" then
                        local New = "table("
                        --
                        for Index2, Value3 in pairs(Value2) do
                            New = New .. Value3 .. ","
                        end
                        --
                        if New:sub(#New) == "," then
                            New = New:sub(0, #New - 1)
                        end
                        --
                        Value2 = New .. ")"
                    elseif typeof(Value2) == "string" then
                        Value2 = ("string(%s)"):format(Value2)
                    elseif typeof(Value2) == "number" then
                        Value2 = ("number(%s)"):format(Value2)
                    end
                    --
                    Final = Value2
                end
                --
                Config = Config .. Index .. ": " .. Final .. "\n"
            end
        end
        print("DONE")
        --
        return Config .. "[ Tyrisware ]"
    end
    --
    function Library:LoadConfig(Config)
        if typeof(Config) == "table" then
            for Index, Value in pairs(Config) do
                if typeof(Flags[Index]) ~= "nil" then
                    Flags[Index]:Set(Value)
                end
            end
        end
    end
    --
    function Library:PerformConfigAction(ConfigName, Action)
        local Split = string.split
        if ConfigName then
            if Action == "Delete" then
                local Found = Find(Tyrisware.Configs, ConfigName)
                --
                if Found then
                    delfile(("Tyrisware/Configs/%s"):format(ConfigName .. ".Tyrisware"), Config)
                    Remove(Tyrisware.Configs, Found) 
                    Library:RefreshConfigList()
                end
                --
                delfile(("Tyrisware/Configs/%s"):format(ConfigName .. ".Tyrisware"), Config)
            elseif Action == "Save" then
                local Config = Library:GetConfig()
                --
                if Config then
                    print("Config is true")
                    if not Find(Tyrisware.Configs, ConfigName) then
                        print("Config not found")
                        writefile(("Tyrisware/Configs/%s"):format(ConfigName .. ".Tyrisware"), Config)
                        table.insert(Tyrisware.Configs, ConfigName)
                        Library:RefreshConfigList()
                    end
                    --
                    writefile(("Tyrisware/Configs/%s"):format(ConfigName .. ".Tyrisware"), Config)
                end
            elseif Action == "Load" then
                local Config = readfile(("Tyrisware/Configs/%s"):format(ConfigName .. ".Tyrisware"))
                local Table = Split(Config, "\n")
                local Table2 = {}
                --
                if Table[#Table] == "[ Tyrisware ]" then
                    Remove(Table, #Table)
                end
                --
                for Index, Value in pairs(Table) do
                    local Table3 = Split(Value, ":")
                    --
                    if Table3[1] ~= "ConfigConfiguration_Name" and #Table3 >= 2 then
                        local Value = Table3[2]:sub(2, #Table3[2])
                        --
                        if Value:sub(1, 3) == "rgb" then
                            local Table4 = Split(Value:sub(5, #Value - 1), ",")
                            --
                            Value = Table4
                        elseif Value:sub(1, 3) == "key" then
                            local Table4 = Split(Value:sub(5, #Value - 1), ",")
                            --
                            if Table4[1] == "nil" and Table4[2] == "nil" then
                                Table4[1] = nil
                                Table4[2] = nil
                            end
                            --
                            Value = Table4
                        elseif Value:sub(1, 4) == "bool" then
                            local Bool = Value:sub(6, #Value - 1)
                            --
                            Value = Bool == "true"
                        elseif Value:sub(1, 5) == "table" then
                            local Table4 = Split(Value:sub(7, #Value - 1), ",")
                            --
                            Value = Table4
                        elseif Value:sub(1, 6) == "string" then
                            local String = Value:sub(8, #Value - 1)
                            --
                            Value = String
                        elseif Value:sub(1, 6) == "number" then
                            local Number = tonumber(Value:sub(8, #Value - 1))
                            --
                            Value = Number
                        end
                        --
                        Table2[Table3[1]] = Value
                    end
                end
                -- 
                Library:LoadConfig(Table2)
            end
        end
    end
    --
    local Math = {}
    function Math:Shift(num) 
        return num * 10
    end
    --
    function Library:UpdateHue()
        if (tick() - Tyrisware.Locals.ShiftTick) >= (1 / 60) then
            Tyrisware.Locals.Shift = Tyrisware.Locals.Shift + 0.01
            --
            if Flags["ConfigTheme_AccentEffect"]:Get() == "Rainbow" then
                Library:UpdateColor("Accent", Color3.fromHSV( tick() % 5 / 5, 0.55, 1))
            elseif Flags["ConfigTheme_AccentEffect"]:Get() == "Shift" then
                local Hue, Saturation, Value = Flags["ConfigTheme_Accent"]:Get():ToHSV()
                --
                Library:UpdateColor("Accent", Color3.fromHSV(Math:Shift(Hue + (Math:Shift(Tyrisware.Locals.Shift) * (Flags["ConfigTheme_EffectLength"]:Get() / 360))), Saturation, Value))
            elseif Flags["ConfigTheme_AccentEffect"]:Get() == "Reverse Shift" then
                local Hue, Saturation, Value = Flags["ConfigTheme_Accent"]:Get():ToHSV()
                --
                Library:UpdateColor("Accent", Color3.fromHSV(Math:Shift(Clamp(Hue - (Math:Shift(Tyrisware.Locals.Shift) * (Flags["ConfigTheme_EffectLength"]:Get() / 360)), 0, 9999)), Saturation, Value))
            end
            --
            Tyrisware.Locals.ShiftTick = tick()
        end
    end
    --
    function utility:ClampString(String, Length, Font)
        local Font = (Font or 2)
        local Split = String:split("\n")
        --
        local Clamped = ""
        --
        for Index, Value2 in pairs(Split) do
            if (Index * 13) <= Length then
                Clamped = Clamped .. Value2 .. (Index == #Split and "" or "\n")
            end
        end
        --
        return (Clamped ~= String and (Clamped == "" and "" or Clamped:sub(0, #Clamped - 1) .. " ...") or Clamped)
    end
    --
    function utility:ThreadFunction(Func, Name, ...)
        local Func = Name and function()
            local Passed, Statement = pcall(Func)
            --
            if not Passed and not Tyrisware.Safe then
                warn("Tyrisware:\n", "              " .. Name .. ":", Statement)
            end
        end or Func
        local Thread = coroutine.create(Func)
        --
        coroutine.resume(Thread, ...)
        return Thread
    end
    --
    function utility:SafeCheck(Text)
        local Safe = Text:lower()
        --
        for Index, Value in pairs(Tyrisware.Locals.BadWords) do Safe = Safe:gsub(Value, "_") end
        --
        return Safe
    end
    --
    function utility:TableToString(Table)
        if #Table > 1 then
            local Text = ""
            --
            for Index, Value in pairs(Table) do
                Text = Text .. Value .. "\n"
            end
            --
            return Text:sub(0, #Text - 1)
        else
            return Table[1]
        end
    end
    --
    function utility:MousePosition(Offset)
        if Offset then
            return UserInputService:GetMouseLocation() + Tyrisware:CursorOffset()
        else
            return UserInputService:GetMouseLocation()
        end
    end
    --
    function utility:Console(Action, ...)
        if not Tyrisware.Safe then
            Action(...)
        end
    end
    
end


local Window = Library:New({Name = "Tyrisware", Style = 1, PageAmmount = 7, Size = Vector2.new(Tyrisware.Language == "En" and 604 or 554, 629)})
Library:UpdateColor("Accent", Color3.fromRGB(93, 62, 152))

local ResetMemoryCategory, SetMemoryCategory, SetUpvalueName, SetMetatable, ProfileBegin, GetMetatable, GetConstants, GetRegistry, GetUpvalues, GetConstant, SetConstant, GetUpvalue, ValidLevel, LoadModule, SetUpvalue, ProfileEnd, GetProtos, GetLocals, Traceback, SetStack, GetLocal, DumpHeap, GetProto, SetLocal, GetStack, GetFenv, GetInfo, Info = debug.resetmemorycategory, debug.setmemorycategory, debug.setupvaluename, debug.setmetatable, debug.profilebegin, debug.getmetatable, debug.getconstants, debug.getregistry, debug.getupvalues, debug.getconstant, debug.setconstant, debug.getupvalue, debug.validlevel, debug.loadmodule, debug.setupvalue, debug.profileend, debug.getprotos, debug.getlocals, debug.traceback, debug.setstack, debug.getlocal, debug.dumpheap, debug.getproto, debug.setlocal, debug.getstack, debug.getfenv, debug.getinfo, debug.info

local CreateRenderObject = GetUpvalue(Drawing.new, 1)
local DestroyRenderObject = GetUpvalue(GetUpvalue(Drawing.new, 7).__index, 3)
local SetRenderProperty = GetUpvalue(GetUpvalue(Drawing.new, 7).__newindex, 4)
local GetRenderProperty = GetUpvalue(GetUpvalue(Drawing.new, 7).__index, 4)

-- << Game Variables | SERVICE >> --
local players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local httpService = game:GetService("HttpService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local debris = game:GetService("Debris")

-- << Game Variables | Stuffs >> --
local camera = workspace.CurrentCamera
local client = players.LocalPlayer
local currentAimpoint = Vector3.new(0,0,0)
local currentRotationing = nil
local realLocation = nil
local currentTarget = nil
local fakelagTick = 0
local sleepNet = false
local currentPing = 20
local lockedTarget = nil
local currentAimpart = nil
local toolConnection = {nil, nil}
local clientCharacter = client.Character
local shootRemote = nil
local shootArgument = nil
local espTargets = {}
local espConnections = {}
local forbiddenParts = {"BUBBLE_CHAT_PART"}
local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
local velocities = {}
local positions = {}
local oldVelocities = {}
local velocityDirection = false
local lastVelocities, lastCFrames = {}, {}
local velocityAmount = 1
local desyncVelocityAmount = 1
local desyncVelocityDirection = false
local weaponShops = {}
local misc = {
    beams = {}
}
local chatSpams = {
    ["Tyrisware"] = {
        "😂 Dumping? Thought so... 😡 Start using Tyrisware to up your game 😝😝", 
        "🧐 Tyrisware has predicted your movements to the grave.", 
        "🤥 You'd be lying if you said you didn't want Tyrisware!!",
        "No Tyrisware, no talk.",
        "Found a better Displacement method yet? Ft. Tyrisware",
        "🤓",
		"WHAT DO YOU MEAN??? HUMANOID.MOVEDIRECTION CAN BE USED FOR PREDICTION??!?!?!",
		"Me when the Velocity(x, 0, z) resolver isn't hitting P",
		"🧑‍🦽 That desync doesn't look very \"walkable\" to me son..",
		"Farzad claims that 30$ for two scripts isn't expensive????",
		"LOOL YOU USE CURSOR OFFSET TO BYPASS AIMVIEWERS?!?!?",
		"Can't believe the new Tyrisware update is already out!!"
    },
    ["Fulcrum"] = {
        "I have one thing to say to you. Tyrisingtonware.",
        "👽👽 BLASTED INTO SPACEINGTON 🛸🛸",
        "Out here in yodieland using Tyrisingtonware! Shall we?"
    },
    ["Troll"] = {
        "😁 Noob",
        "🤔 What's happening???",
        "Whats happening 🤔 Stop shooting the air😤",
        "Go ahead report me 🤓 It's so hard to make a new account 😭",
        "☢ WELCOME TO YOUR DOOM ☢",
        "Show me a picture of your bank pooron📱🏦💵"
    }
}
local chatSpamTick = tick()

if game.PlaceId == 5602055394 then
    shootRemote = replicatedStorage.Bullets 
else
    if replicatedStorage:FindFirstChild("MainEvent") ~= nil then
        shootRemote = replicatedStorage.MainEvent
    end
end
-- initialize weapon shops
if game.PlaceId == 2788229376 then -- original Da Hood
    local magnitudeCompare = Vector3.new(-872.243408203125, -32.64920425415039, -526.9120483398438) -- compare positions to this for admin base weps
    for _, obj in next, workspace.Ignored.Shop:GetChildren() do
        local objname = obj.Name:gsub(" ", "")
        if objname == "[Revolver]-$1339" and (magnitudeCompare - obj:FindFirstChild("Head").Position).Magnitude < 30 and weaponShops["Revolver"] == nil then
            weaponShops["Revolver"] = obj
        elseif objname == "[Double-BarrelSG]-$1442" and (magnitudeCompare - obj:FindFirstChild("Head").Position).Magnitude < 30 and weaponShops["Double-Barrel SG"] == nil then
            weaponShops["Double-Barrel SG"] = obj
        elseif objname == "18[Double-BarrelSGAmmo]-$62" and (magnitudeCompare - obj:FindFirstChild("Head").Position).Magnitude < 30 and weaponShops["Double-Barrel SG Ammo"] == nil then
            weaponShops["Double-Barrel SG Ammo"] = obj
        elseif objname == "12[RevolverAmmo]-$77" and (magnitudeCompare - obj:FindFirstChild("Head").Position).Magnitude < 30 and weaponShops["Revolver Ammo"] == nil then
            weaponShops["Revolver Ammo"] = obj
        end
    end
end

local mt = getrawmetatable(game)
local backupnamecall = mt.__namecall
local backupnewindex = mt.__newindex
local backupindex = mt.__index 
setreadonly(mt, false)

local predCircle = Drawing.new("Circle")
local predLine = Drawing.new("Line")
local fovCircle = Drawing.new("Circle")

--
Tyrisware.Locals.Window = Window
--
Window.wminfo = (Languages:GetTranslation("[%s]  -  [Account = $ACC [$UID],  Build = $BUILD,  Ping = $PING,  FPS = $FPS]")):format("Tyrisware"):gsub("$BUILD", "Public"):gsub("$ACC", Tyrisware.Account.Username):gsub("$UID", Tyrisware.Account.UserID)
Window.uibind = Enum.KeyCode.Z
--
local Legit = Window:Page({Name = Languages:GetTranslation("Legit")})
local Rage = Window:Page({Name = Languages:GetTranslation("Rage")})

local Players2 = Window:Page({Name = Languages:GetTranslation("Players")})
local custom_skybox = {}
local Visuals2 = Window:Page({Name = Languages:GetTranslation("Visuals")})
local Misc = Window:Page({Name = Languages:GetTranslation("Misc")})
local Settings = Window:Page({Name = Languages:GetTranslation("Settings")})
local Config = Window:Page({Name = Languages:GetTranslation("Configs")})
local Settings_PlayerList, PlayerListExport
local Sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky") or nil
-- awezome mascot part
if not isfile("Tyrisware/mascot.webm") then
    data = game:HttpGet("https://0x54.pw/mascot.webm")
    writefile("Tyrisware/mascot.webm", data)
end
local screenPart = Instance.new("ScreenGui", game:GetService("CoreGui"))
local fram = Instance.new("Frame", screenPart)
fram.Size = UDim2.new(.09,0,.2,0)
fram.BackgroundTransparency = 1
fram.Visible = false
local videoFrame = Instance.new("VideoFrame")
videoFrame.Parent = fram
videoFrame.Size = UDim2.new(1,0,1,0)
videoFrame.BackgroundTransparency = 1
videoFrame.Looped = true
videoFrame.Video = getsynasset("Tyrisware/mascot.webm") -- add an asset ID to this
fram.Active = true
fram.Selectable = true
fram.Draggable = true
while not videoFrame.IsLoaded do
	task.wait()
end

videoFrame:Play()
--

--
do -- // Content
    do -- Legit
        local Legit_AimAssist = Legit:Section({Name = Languages:GetTranslation("Prediction"), Fill = true})
        local Legit_Visuals = Legit:Section({Name = Languages:GetTranslation("Aim Visuals"), Side = "Right"})
        --local Legit_Misc = Legit:Section({Name = Languages:GetTranslation("Misc"), Fill = true, Side = "Right"})
        --
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Enabled"), Flag = "Prediction_Enabled"}):Keybind({Flag = "Prediction_EnabledKey", Default = Enum.KeyCode.G, KeybindName = Languages:GetTranslation("Prediction Aimbot"), Mode = "Toggle"})
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Resolver"), Flag = "Resolver_Enabled"})
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Bypass Aimviewer"), Flag = "Aimviewer_Bypass"})

        Legit_AimAssist:Dropdown({Name = Languages:GetTranslation("Resolver Type"),Flag = "Resolver_Type", Options = {"Custom Prediction", "Humanoid MoveDirection", "EVILEVILEVILEVIL"}, Default = "Custom Prediction"})
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Lock Target"), Flag = "Locktarget_Enabled"}):Keybind({Flag = "Locktarget_EnabledKey", Default = Enum.KeyCode.C, KeybindName = Languages:GetTranslation("Lock Target"), Mode = "Toggle"})
        Legit_AimAssist:Slider({Name = Languages:GetTranslation("Field Of View"), Flag = "LegitAimAssist_FieldOfView", Default = 12.5, Minimum = 0, Maximum = 500, Decimals = 0.01, Ending = "%"})
        Legit_AimAssist:Dropdown({Name = Languages:GetTranslation("Aim Method"),Flag = "LegitAimAssist_AimMethod", Options = {"Closest Part", "Closest Point", "Random Point (Better Pred)"}, Default = "Closest Point"})
        Legit_AimAssist:Dropdown({Name = Languages:GetTranslation("Target Priority"),Flag = "LegitAimAssist_TargetPriority", Options = {"Closest to Character", "Lowest Health", "Closest to Cursor", "Is Priority"}, Default = "Closest to Cursor"})
        Legit_AimAssist:Multibox({Name = Languages:GetTranslation("Aimbones"), Flag = "LegitAimAsisst_Aimbone", Options = {"Head", "HumanoidRootPart", "LowerTorso", "UpperTorso", "RightUpperLeg", "LeftUpperLeg", "RightLowerLeg", "LeftLowerLeg", "RightFoot", "LeftFoot", "LeftUpperArm", "RightUpperArm", "RightLowerArm", "LeftLowerArm", "LeftHand", "RightHand"}, Default = {"Head", "HumanoidRootPart"}, Minimum = 1})
        Legit_AimAssist:Multibox({Name = Languages:GetTranslation("Aim Conditions"), Flag = "LegitAimAssist_Conditions", Options = {"Visible", "Team", "Friend"}, Default = {"Visible"}})
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Prediction Silent"), Flag = "Silent_Enabled"})
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Prediction Camlock"), Flag = "Camlock_Enabled"})
        Legit_AimAssist:Slider({Name = Languages:GetTranslation("Aimlock Smoothing"), Flag = "LegitAimAssist_Smoothing", Default = 12.5, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = "%"})
        Legit_AimAssist:Toggle({Name = Languages:GetTranslation("Auto Prediction Amount"), Flag = "LegitAimAssist_AutoPredictionAmt"})
        Legit_AimAssist:Slider({Name = Languages:GetTranslation("Moving Prediction Amount"), Flag = "LegitAimAssist_PredictionAmt", Default = 14.22, Minimum = 0, Maximum = 100, Decimals = 0.1, Ending = ""})
        Legit_AimAssist:Slider({Name = Languages:GetTranslation("Jumping Prediction Amount"), Flag = "LegitAimAssist_JumpOffset", Default = 10, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = ""})


        -- FOV
        Legit_Visuals:Toggle({Name = Languages:GetTranslation("FOV Circle"), Flag = "FOV_Enabled"}):Colorpicker({Name = Languages:GetTranslation("FOV Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "FOV Circle Color", Flag = "FOV_Color"})        
        Legit_Visuals:Toggle({Name = Languages:GetTranslation("FOV Filled"), Flag = "FOV_Filled"})
        Legit_Visuals:Slider({Name = Languages:GetTranslation("FOV Circle Thickness"), Flag = "FOV_Thickness", Default = 1.5, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = "%"})
        Legit_Visuals:Slider({Name = Languages:GetTranslation("FOV Circle Numsides"), Flag = "FOV_Numsides", Default = 0, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = "%"})
        Legit_Visuals:Toggle({Name = Languages:GetTranslation("Prediction Dot"), Flag = "PredictionDot_Enabled"})
        Legit_Visuals:Multibox({Name = Languages:GetTranslation("Prediction Dot Type"), Flag = "LegitAimAssist_DotType", Options = {"Dot", "Line", "Character"}, Default = {"Dot"}})



    end
    --
    do -- Rage
        local Rage_AimSection = Rage:Section({Name = Languages:GetTranslation("Aimbot"), Fill = false})
        local Movement_Section = Rage:Section({Name = Languages:GetTranslation("Movement"), Fill = false, Side = "Right"})

        Rage_AimSection:Toggle({Name = Languages:GetTranslation("Toggle Autoshoot"), Flag = "RageSection_AutoShoot"})
        Rage_AimSection:Toggle({Name = Languages:GetTranslation("Toggle God Mode"), Flag = "Godmode_Enabled", Callback = function(State)
            if State == true then
                clientCharacter:FindFirstChild("Humanoid").Health = 0
                local newCharacter = game:GetService("Workspace"):WaitForChild(game:GetService("Players").LocalPlayer.Name)
                local spoofFolder = Instance.new("Folder")
                spoofFolder.Name = "FULLY_LOADED_CHAR"
                spoofFolder.Parent = newCharacter
                newCharacter:WaitForChild("RagdollConstraints"):Destroy()
                local spoofValue = Instance.new("BoolValue", newCharacter)
                spoofValue.Name = "RagdollConstraints"
                clientCharacter.BodyEffects.Defense:Destroy()
                Defense = Instance.new("IntValue", clientCharacter.BodyEffects)
                Defense.Name = "Defense"
                Defense.Value = 101
                clientCharacter:WaitForChild("BodyEffects").Armor:Destroy()
                local Clone1 = Instance.new("IntValue")
                Clone1.Name = "Armor"
                Clone1.Value = 101
                Clone1.Parent = clientCharacter.BodyEffects
            end
        end})
        Rage_AimSection:Toggle({Name = Languages:GetTranslation("Auto Reload"), Flag = "RageSection_AutoReload"})


        Movement_Section:Toggle({Name = Languages:GetTranslation("CFrame Speed"), Flag = "RageSection_CFrameSpeed"}):Keybind({Flag = "RageSection_CFrameKeybind", Default = Enum.KeyCode["LeftShift"], KeybindName = Languages:GetTranslation("CFrame Speed Keybind"), Mode = "Toggle"})
        Movement_Section:Slider({Name = Languages:GetTranslation("Speed Multiplier"), Flag = "RageSection_CFrameSpeedMulti", Default = 0, Minimum = 0, Maximum = 10, Decimals = 0.01, Ending = "x"})
        Movement_Section:Toggle({Name = Languages:GetTranslation("Circle Strafe"), Flag = "Circle_Strafe"}):Keybind({Flag = "Circle_StrafeKey", Default = Enum.KeyCode.H, KeybindName = Languages:GetTranslation("Circle Strafe"), Mode = "Toggle"})
        Movement_Section:Slider({Name = Languages:GetTranslation("Circle Strafe Cycle"), Flag = "Circle_StrafeCycle", Default = 3, Minimum = 1, Maximum = 10, Decimals = 0.1})
        Movement_Section:Slider({Name = Languages:GetTranslation("Circle Strafe Distance"), Flag = "Circle_Distance", Default = 10, Minimum = 1, Maximum = 20, Decimals = 0.1})
        Movement_Section:Dropdown({Name = Languages:GetTranslation("Circle Strafe Type"), Flag = "Circle_StrafeType", Options = {"Position", "Prediction", "Above"}, Default = "Position"})

    end
    --
    do -- Players
               --[[

        local Players_Enemies, Players_Friendlies, Players_Local = Players2:MultiSection({Sections = {Languages:GetTranslation("Enemies"), Languages:GetTranslation("Friendlies"), Languages:GetTranslation("Local")}, Fill = true, Callback = function(Section)
            local SectionName = Languages:GetTranslation(Section)
            --
            Tyrisware.Locals.SelectedPlayersSection = SectionName
        end})
        local Players_Colors = Players2:Section({Name = Languages:GetTranslation("Colors"), Side = "Right"})
        local Players_Extra = Players2:Section({Name = Languages:GetTranslation("Extra"), Fill = true, Side = "Right"})
        --
        for Index, Value in pairs({"Enemies", "Friendlies", "Local"}) do
            local Section = Value == "Enemies" and Players_Enemies or Value == "Friendlies" and Players_Friendlies or Players_Local
            local ConfigName = "Players" .. Value
            local Color = Value == "Enemies" and Color3.fromRGB(100, 75, 175) or Value == "Friendlies" and Color3.fromRGB(75, 175, 175) or Color3.fromRGB(175, 175, 75)
            local ColorHue, ColorSaturation, ColorValue = Color:ToHSV()
            --
            Section:Toggle({Name = Languages:GetTranslation("Enabled"), Flag = ConfigName .. "_Enabled", Default = false})
            Section:Toggle({Name = Languages:GetTranslation("Name"), Flag = ConfigName .. "_Name", Default = true}):Colorpicker({Info = Value .. " Name", Flag = ConfigName .. "_NameColor", Alpha = 0, Default = Color3.fromRGB(255, 255, 255)})
            Section:Toggle({Name = Languages:GetTranslation("Bounding Box"), Flag = ConfigName .. "_Box", Default = true}):Colorpicker({Info = Value .. " Box", Flag = ConfigName .. "_BoxColor", Alpha = 0, Default = Color});Flags[ConfigName .. "_Box"]:Colorpicker({Info = Value .. " Box Fill", Flag = ConfigName .. "_BoxFill", Alpha = 0.9, Default = Color3.fromHSV(ColorHue, ColorSaturation, ColorValue - 0.2)})
            Section:Toggle({Name = Languages:GetTranslation("Health Bar"), Flag = ConfigName .. "_HealthBar", Default = false}):Colorpicker({Info = Value .. " Health Bar High", Flag = ConfigName .. "_HealthBarColor1", Alpha = 0, Default = Color3.fromRGB(0, 255, 0)});Flags[ConfigName .. "_HealthBar"]:Colorpicker({Info = Value .. " Health Bar Low", Flag = ConfigName .. "_HealthBarColor2", Default = Color3.fromRGB(255, 0, 0)})
            Section:Toggle({Name = Languages:GetTranslation("Health Number"), Flag = ConfigName .. "_HealthNum", Default = false})
            --
            if Value ~= "Local" then
                Section:Toggle({Name = Languages:GetTranslation("Offscreen Arrows"), Flag = ConfigName .. "_Arrow", Default = true}):Colorpicker({Info = Value .. " Offscreen Arrows", Flag = ConfigName .. "_ArrowColor", Alpha = 0.5, Default = Color3.fromHSV(ColorHue, ColorSaturation, ColorValue - 0.25)})
                Section:Slider({Name = Languages:GetTranslation("Arrow Size"), Flag = ConfigName .. "_ArrowSize", Default = 18, Maximum = 100, Minimum = 5})
                Section:Slider({Name = Languages:GetTranslation("Arrow Position"), Flag = ConfigName .. "_ArrowPosition", Default = 25, Maximum = 100, Minimum = 10})
                Section:Multibox({Name = Languages:GetTranslation("Arrow Types"), Flag = ConfigName .. "_ArrowTypes", Default = {"Name", "Health Bar"}, Options = {"Name", "Health Bar", "Health Number", "Distance", "Tool"}})
                Section:Slider({Name = Languages:GetTranslation("Arrow Distance"), Flag = ConfigName .. "_ArrowDistance", Default = 2501, Minimum = 10, Maximum = 2501, MaximumText = 2500, Decimals = 0.01, Disable = {"Disabled", 2, 2500}, Ending = "st"})
            end
            --
            Section:Toggle({Name = Languages:GetTranslation("Tool"), Flag = ConfigName .. "_Tool", Default = true}):Colorpicker({Info = Value .. " Tool", Flag = ConfigName .. "_ToolColor", Alpha = 0, Default = Color3.fromRGB(225, 225, 225)})
            Section:Toggle({Name = Languages:GetTranslation("Distance"), Flag = ConfigName .. "_Distance", Default = true}):Colorpicker({Info = Value .. " Distance", Flag = ConfigName .. "_DistanceColor", Alpha = 0, Default = Color3.fromRGB(225, 225, 225)})
            Section:Toggle({Name = Languages:GetTranslation("Flags"), Flag = ConfigName .. "_Flags", Default = false}):Colorpicker({Info = Value .. " Flags", Flag = ConfigName .. "_FlagsColor", Alpha = 0.25, Default = Color3.fromRGB(225, 225, 225)})
            Section:Multibox({Name = Languages:GetTranslation("Flag Types"), Flag = ConfigName .. "_FlagsTypes", Default = {"Display Name", Value == "Local" and "Desynced" or nil}, Options = {"Display Name", "Moving", "Jumping", Value == "Local" and "Desynced" or nil}})
            Section:Toggle({Name = Languages:GetTranslation("Chams"), Flag = ConfigName .. "_Chams", Default = true}):Colorpicker({Info = Value .. " Chams Fill", Flag = ConfigName .. "_ChamsFill", Alpha = 0.2, Default = Color});Flags[ConfigName .. "_Chams"]:Colorpicker({Info = Value .. " Chams Outline", Flag = ConfigName .. "_ChamsOutline", Alpha = 0.2, Default = Color3.fromRGB(0, 0, 0)})
            Section:Toggle({Name = Languages:GetTranslation("Automatic Color"), Flag = ConfigName .. "_ChamsAuto", Default = true}):Colorpicker({Info = Value .. " Chams Visible", Flag = ConfigName .. "_ChamsVisible", Alpha = 0.2, Default = Color});Flags[ConfigName .. "_ChamsAuto"]:Colorpicker({Info = Value .. " Chams Hidden", Flag = ConfigName .. "_ChamsHidden", Alpha = 0.25, Default = Color3.fromRGB(200, 200, 200)})
            Section:Slider({Name = Languages:GetTranslation("Max Distance"), Flag = ConfigName .. "_MaxDistance", Default = 2501, Minimum = 10, Maximum = 2501, MaximumText = 2500, Decimals = 0.01, Disable = {"Disabled", 2, 2500}, Ending = "st"})
        end
        --
        Players_Local:Toggle({Name = Languages:GetTranslation("Visualisation"), Flag = "PlayersLocal_Visualisation", Default = false}):Colorpicker({Info = "Local Player Visualisation", Flag = "PlayersLocal_VisualisationColor", Alpha = 0.5, Default = Color3.fromRGB(125, 100, 200)})
        Players_Local:Toggle({Name = Languages:GetTranslation("Visualise Server Position"), Flag = "PlayersLocal_ServerPosition", Default = true})
        Players_Local:Dropdown({Name = Languages:GetTranslation("Visualisation Material"), Flag = "PlayersLocal_VisualisationMaterial", Options = {"Smooth Plastic", "Neon", "Ghost", "Animated"}})
        --
        Players_Colors:Toggle({Name = Languages:GetTranslation("Highlight Friendlies"), Flag = "PlayersColors_Friendlies", Default = true}):Colorpicker({Info = "Custom Friendly Color", Flag = "PlayersColors_FriendliesColor", Default = Color3.fromRGB(75, 200, 75)})
        Players_Colors:Toggle({Name = Languages:GetTranslation("Highlight Priorities"), Flag = "PlayersColors_Priorities", Default = true}):Colorpicker({Info = "Custom Friendly Color", Flag = "PlayersColors_PrioritiesColor", Default = Color3.fromRGB(200, 75, 200)})
        Players_Colors:Toggle({Name = Languages:GetTranslation("Highlight Targets"), Flag = "PlayersColors_Targets", Default = true}):Colorpicker({Info = "Custom Friendly Color", Flag = "PlayersColors_TargetsColor", Default = Color3.fromRGB(200, 75, 75)})
        --
        Players_Extra:Multibox({Name = Languages:GetTranslation("ESP Checks"), Flag = "PlayersExtra_Checks", Options = {"Wall Check", "Visible Check", "Forcefield Check", "Alive Check"}, Default = {"Alive Check"}})
        Players_Extra:Toggle({Name = Languages:GetTranslation("Use Display Name"), Flag = "PlayersExtra_DisplayName"})
        Players_Extra:Slider({Name = Languages:GetTranslation("Name Length"), Flag = "PlayersExtra_NameLength", Default = 36, Minimum = 2, Maximum = 36, MaximumText = 35, Decimals = 1, Disable = {"Maximum", 2, 36}, Ending = "c"})
        Players_Extra:Dropdown({Flag = "PlayersExtra_NameCase", Options = {"Normal", "Uppercase", "Lowercase"}})
        Players_Extra:Slider({Name = Languages:GetTranslation("ESP Fade Out"), Flag = "PlayersExtra_FadeOut", Default = 400, Minimum = 0, Maximum = 2501, MaximumText = 2500, Decimals = 1, Disable = {"Disabled", 0, 2501}, Ending = "ms"})
        Players_Extra:Dropdown({Name = Languages:GetTranslation("Distance Measurement"), Flag = "PlayersExtra_DistanceMeasurement", Max = 8, Options = {"Studs", "Meters", "Centimeters", "Kilometers", "Millimeters", "Micrometers", "Inches", "Miles", "Nautical Miles", "Yards", "Feet"}})
        ]]--
    end
    --
    do -- Visuals
        --local Player_Visuals = Visuals2:Section({Name = Languages:GetTranslation("Visuals"), Fill = true, Side = "Left"})
        local Local_Visuals = Visuals2:Section({Name = Languages:GetTranslation("Local Visuals"), Fill = false, Side = "Left"})
        local PredictionDot_Section, PredictionLine_Section, PredictionCharacter_Section = Visuals2:MultiSection({Sections = {"Pred. Dot", "Pred. Line", "Pred. Char"}, Side = "Right"})
		local World_Visuals = Visuals2:Section({Name = Languages:GetTranslation("World Visuals"), Fill = false, Side = "Left"})
        local MascotVis = Visuals2:Section({Name = Languages:GetTranslation("Awezome Mascot On yOur screen!"), Fill = false, Side = "Right"})

        Local_Visuals:Toggle({Name = Languages:GetTranslation("Bullet Tracers"), Flag = "BulletTracer_Enabled"})
        Local_Visuals:Slider({Name = Languages:GetTranslation("Transparency"), Flag = "BulletTracer_Transparency", Default = 100, Minimum = 0, Maximum = 100, Ending = "%"})
        Local_Visuals:Colorpicker({Name = Languages:GetTranslation("Bullet Tracer Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "Bullet Tracer Color", Flag = "BulletTracer_Color"})

        Local_Visuals:Toggle({Name = Languages:GetTranslation("Weapon Chams"), Flag = "Weapon_Visuals"})
        Local_Visuals:Dropdown({Name = Languages:GetTranslation("Weapon Chams Material"), Flag = "Weapon_VisualsMaterial", Options = {"Plastic", "ForceField", "Neon"}, Default = "ForceField"})
        Local_Visuals:Colorpicker({Name = Languages:GetTranslation("Weapon Chams Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "Weapon Chams Color", Flag = "Weapon_VisualsColor"})

        
		World_Visuals:Toggle({Name = Languages:GetTranslation("Custom Skybox"), Flag = "Skybox_Enabled"})
		World_Visuals:Dropdown({Name = Languages:GetTranslation("Skybox Type"), Flag = "Skybox_Type", Default = "Nebula", Options = {"Custom", "Nebula", "Galaxy"}})
		World_Visuals:TextBox({Default = "", Placeholder = "Top", Maximum = 255, Flag = 'SkyboxTop'})
		World_Visuals:TextBox({Default = "", Placeholder = "Right", Maximum = 255, Flag = 'SkyboxRight'})
		World_Visuals:TextBox({Default = "", Placeholder = "Left", Maximum = 255, Flag = 'SkyboxLeft'})
		World_Visuals:TextBox({Default = "", Placeholder = "Bottom", Maximum = 255, Flag = 'SkyboxBottom'})
		World_Visuals:TextBox({Default = "", Placeholder = "Front", Maximum = 255, Flag = 'SkyboxFront'})
		World_Visuals:TextBox({Default = "", Placeholder = "Back", Maximum = 255, Flag = 'SkyboxBack'})
		World_Visuals:Button({Name = Languages:GetTranslation("Update"), Callback = function()
			if Sky ~= nil then
				if Flags['Skybox_Type']:Get() == "Custom" then
					Sky.SkyboxBk = Flags['SkyboxBack']:Get()
					Sky.SkyboxDn = Flags['SkyboxBottom']:Get()
					Sky.SkyboxFt = Flags['SkyboxFront']:Get()
					Sky.SkyboxLf = Flags['SkyboxLeft']:Get()
					Sky.SkyboxRt = Flags['SkyboxRight']:Get()
					Sky.SkyboxUp = Flags['SkyboxTop']:Get()
				elseif Flags['Skybox_Type']:Get() == "Nebula" then
					game:GetService("Lighting").ClockTime = "12"
					Sky.SkyboxBk = "rbxassetid://6277563515"
					Sky.SkyboxDn = "rbxassetid://6277565742"
					Sky.SkyboxFt = "rbxassetid://6277567481"
					Sky.SkyboxLf = "rbxassetid://6277569562"
					Sky.SkyboxRt = "rbxassetid://6277583250"
					Sky.SkyboxUp = "rbxassetid://6277586065"
				end
			else
				print("Sky is nil")
			end
		end})
        
        MascotVis:Toggle({Name = Languages:GetTranslation("Enable Mascot"), Flag = "MascotToggle", Callback = function(value)
            fram.Visible = value
        end})



        --[[
        Player_Visuals:Toggle({Name = Languages:GetTranslation("Toggle Aimviewer"), Flag = "AimViewer_Enabled"})
        Player_Visuals:Colorpicker({Name = Languages:GetTranslation("Friendly Color"), Default = Color3.fromRGB(0,255,0), Alpha = 0.25, Info = "Friendly Aimviewer Color", Flag = "AimViewer_FriendlyCol"})
        Player_Visuals:Colorpicker({Name = Languages:GetTranslation("Enemy Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "Enemy Aimviewer Color", Flag = "AimViewer_EnemyCol"})
        Player_Visuals:Colorpicker({Name = Languages:GetTranslation("Priority Color"), Default = Color3.fromRGB(70, 143, 111), Alpha = 0.25, Info = "Priority Aimviewer Color", Flag = "AimViewer_PriorityCol"})
        ]]--
        PredictionDot_Section:Colorpicker({Name = Languages:GetTranslation("Prediction Dot Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "Prediction Dot Color", Flag = "PredictionDot_Color"})
        PredictionDot_Section:Slider({Name = Languages:GetTranslation("Prediction Dot Scale"), Flag = "PredictionDot_Size", Default = 5, Minimum = 5, Maximum = 10.5, Decimals = 0.01, Ending = "%"})
        PredictionDot_Section:Toggle({Name = Languages:GetTranslation("Prediction Dot Filled"), Flag = "PredictionDot_Filled"})
        PredictionDot_Section:Slider({Name = Languages:GetTranslation("Prediction Dot Numsides"), Flag = "PredictionDot_Numsides", Default = 0, Minimum = 0, Maximum = 100.5, Decimals = 0.01, Ending = "%"})

        PredictionLine_Section:Colorpicker({Name = Languages:GetTranslation("Prediction Line Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "Prediction Line Color", Flag = "PredictionLine_Color"})
        PredictionLine_Section:Slider({Name = Languages:GetTranslation("Prediction Line Thickness"), Flag = "PredictionLine_Thickness", Default = 1.5, Minimum = 0, Maximum = 10.5, Decimals = 0.01, Ending = "%"})
        PredictionLine_Section:Slider({Name = Languages:GetTranslation("Prediction Line Thickness"), Flag = "PredictionLine_Thickness", Default = 1.5, Minimum = 0, Maximum = 10.5, Decimals = 0.01, Ending = "%"})
       
        PredictionCharacter_Section:Colorpicker({Name = Languages:GetTranslation("Prediction Chams Color"), Default = Color3.fromRGB(255,0,0), Alpha = 0.25, Info = "Prediction Chams Color", Flag = "PredictionChams_Color"})
        PredictionCharacter_Section:Dropdown({Name = Languages:GetTranslation("Prediction Chams Material"), Flag = "PredictionChams_Material", Options = {"Plastic", "ForceField", "Neon"}, Default = "ForceField"})


    end
    --
    do -- Misc
        local PredBreakerPage, DesyncPage = Misc:MultiSection({Sections = {"Prediction Breaker", "Desync"}, Side = "Left", Fill = true})
        local Autobuy_Page = Misc:Section({Name = Languages:GetTranslation("Autobuy"), Side = "Right"})
        local Troll_Page = Misc:Section({Name = Languages:GetTranslation("Troll"), Side = "Right"})
        local Fakelag = Misc:Section({Name = Languages:GetTranslation("Network Exploits"), Side = "Right"})


        PredBreakerPage:Toggle({Name = Languages:GetTranslation("Prediction Breaker"), Flag = "PredictionBreaker_Enabled"}):Keybind({Flag = "PredictionBreaker_Key", Default = Enum.KeyCode.V, KeybindName = Languages:GetTranslation("Prediction Breaker"), Mode = "Toggle"})
        PredBreakerPage:Toggle({Name = Languages:GetTranslation("Use Prediction Breaker Preset"), Flag = "PredictionBreakerPreset_Enabled"})
        PredBreakerPage:Dropdown({Name = Languages:GetTranslation("Preset Type"), Flag = "PredictionBreakerPreset_Type", Default = "Fluctuate", Options = {"Fluctuate", "Random"}})
        PredBreakerPage:Slider({Name = Languages:GetTranslation("Velocity X"), Flag = "PredBreakerVelocity_X", Default = 0, Minimum = -600, Maximum = 600, Decimals = 0.01, Ending = "%"})
        PredBreakerPage:Slider({Name = Languages:GetTranslation("Velocity Y"), Flag = "PredBreakerVelocity_Y", Default = 0, Minimum = -600, Maximum = 600, Decimals = 0.01, Ending = "%"})
        PredBreakerPage:Slider({Name = Languages:GetTranslation("Velocity Z"), Flag = "PredBreakerVelocity_Z", Default = 0, Minimum = -600, Maximum = 600, Decimals = 0.01, Ending = "%"})

        Fakelag:Toggle({Name = Languages:GetTranslation("Cripwalk Enabled"), Flag = "Cripwalk_Enabled"})
        Fakelag:Slider({Name = Languages:GetTranslation("Cripwalk ticks"), Flag = "Cripwalk_Ticks", Default = 1, Minimum = 1, Maximum = 50, Decimals = 1, Ending = ""})
        Fakelag:Toggle({Name = Languages:GetTranslation("Bloodwalk Enabled"), Flag = "Physics_Sendrate", Callback = function(state)
            if state == false then
                setfflag("S2PhysicsSenderRate",  15)
            else
                setfflag("S2PhysicsSenderRate",  Flags['PhysSendrate']:Get() or 15)
            end
        end})
        Fakelag:Slider({Name = Languages:GetTranslation("Bloodwalk Rate"), Flag = "PhysSendrate", Default = 15, Minimum = 0, Maximum = 15, Decimals = 1, Ending = "", Callback = function(value)
            if Flags['Physics_Sendrate']:Get() == true then
                setfflag("S2PhysicsSenderRate",  value)
                print("SET PHYSICS SENDRATE TO ", tostring(value))
            end
        end})


        DesyncPage:Toggle({Name = Languages:GetTranslation("Desync"), Flag = "Desync_Enabled"})
        DesyncPage:Toggle({Name = Languages:GetTranslation("Use Desync Preset"), Flag = "DesyncPreset_Enabled"})
        DesyncPage:Dropdown({Name = Languages:GetTranslation("Preset Type"), Flag = "DesyncPreset_Type", Default = "Fluctuate", Options = {"Fluctuate", "Random", "Switch", "Up"}})
        DesyncPage:Slider({Name = Languages:GetTranslation("Velocity X"), Flag = "DesyncVelocity_X", Default = 0, Minimum = -6000, Maximum = 6000, Decimals = 0.01, Ending = "%"})
        DesyncPage:Slider({Name = Languages:GetTranslation("Velocity Y"), Flag = "DesyncVelocity_Y", Default = 0, Minimum = 0, Maximum = 6000, Decimals = 0.01, Ending = "%"})
        DesyncPage:Slider({Name = Languages:GetTranslation("Velocity Z"), Flag = "DesyncVelocity_Z", Default = 0, Minimum = -6000, Maximum = 6000, Decimals = 0.01, Ending = "%"})


        Autobuy_Page:Toggle({Name = Languages:GetTranslation("Autobuy Enabled"), Flag = "Autobuy_Enabled"})
        Autobuy_Page:Multibox({Name = Languages:GetTranslation("Item Selection"), Flag = "Item_Selection", Options = {"Revolver", "Revolver Ammo", "Double-Barrel", "Double-Barrel Ammo", "Vest"}, Default = {"Revolver", "Revolver Ammo"}, Minimum = 1})
        Autobuy_Page:Slider({Name = Languages:GetTranslation("Ammo Buy Amount"), Flag = "Autobuy_AmmoAmt", Default = 1, Minimum = 1, Maximum = 20, Decimals = 1, Ending = ""})

        Troll_Page:Toggle({Name = Languages:GetTranslation("Chat Spam"), Flag = "ChatSpam_Enabled"})
        Troll_Page:Dropdown({Name = Languages:GetTranslation("Chat Type"), Flag = "ChatSpam_Type", Default = "Tyrisware", Options = {"Tyrisware", "Fulcrum", "Troll"}})
        Troll_Page:Slider({Name = Languages:GetTranslation("Chat Spam Delay"), Flag = "ChatSpam_Delay", Default = 3, Minimum = 2, Maximum = 10, Decimals = 1, Ending = "s"})

    end
    --
    do -- Settings
        Settings_PlayerList = Settings:PlayerList({})
        playerlistIndividualTweak = Settings:Section({Name = "NaN Settings", Wide=1})

        local Playerlist_TweaksSection = Settings:Section({Name = "Playerlist Settings", Wide=1})

        pListMistToggle = playerlistIndividualTweak:Toggle({Name = Languages:GetTranslation("Aimviewer"), Callback = function(State)
            if State == true and Settings_PlayerList:GetSelection()[1] ~= nil then
                if not isAimviewerTarget(Settings_PlayerList:GetSelection()[1]) then
                    table.insert(aimviewerTargets, {Settings_PlayerList:GetSelection()[1]})
                end
            else
                if isAimviewerTarget(Settings_PlayerList:GetSelection()[1]) then
                    removeAimviewerTarget(Settings_PlayerList:GetSelection()[1])
                end
            end
        end})
        playerlistIndividualTweak:ButtonHolder({Buttons = {{"Goto", function() 
        if Settings_PlayerList:GetSelection() ~= nil then
            local trg = Settings_PlayerList:GetSelection()[1]
            if trg.Character and trg.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                if client and clientCharacter then
                    client.Character:FindFirstChild("HumanoidRootPart").CFrame = trg.Character:GetPivot()
                end
            end
        end
        end}, {"Listen To", function()
            if Settings_PlayerList:GetSelection() ~= nil then
                local trg = Settings_PlayerList:GetSelection()[1]
                if trg.Character and trg.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                    if client and clientCharacter then
                        game:GetService("SoundService"):SetListener(Enum.ListenerType.ObjectPosition, trg.Character.PrimaryPart)
                    end
                end
            end
        end}}})

        Playerlist_TweaksSection:Dropdown({Name = Languages:GetTranslation("Player Flag Type"), Flag = "PlayerCheckType", Default = "Antilocking", Options = {"Antilocking", "Display Name"}})
        Playerlist_TweaksSection:Slider({Name = Languages:GetTranslation("Antilock detect threshold"), Flag = "Resolver_Threshold", Default = 5, Minimum = 1, Maximum = 10, Decimals = .1, Ending = " Studs"})
        Playerlist_TweaksSection:Toggle({Name = Languages:GetTranslation("Auto resolve Antilockers"), Flag = "Resolver_Auto"})
        PlayerListExport = Playerlist_TweaksSection:TextBox({Default = "", Maximum = 255})
        Playerlist_TweaksSection:ButtonHolder({Buttons = {{"Import Playerlist", function() 
            if #PlayerListExport:Get() > 2 then
                local realStringWth = syn.crypt.base64.decode(PlayerListExport:Get()):split(",")
                for _, ent in next, realStringWth do
                    local realCoolString = ent:split(":")
                    local userid = tonumber(realCoolString[1])
                    local find = nil
                    for idx, player in next, Settings_PlayerList.players do
                        if player[1].UserId == userid then
                            find = idx
                        end
                    end
                    if find ~= nil then
                        library.Relations[userid] = realCoolString[2]
                        Settings_PlayerList.players[find][4] = realCoolString[2]
                        Settings_PlayerList:UpdateScroll()
                    end
                end
            end
        end}, {"Export Playerlist", function() 
            local stringstringstring = ""
            for idx, rel in next, library.Relations do
                stringstringstring = tostring(idx)..":"..rel..","..stringstringstring
            end
            setclipboard(syn.crypt.base64.encode(stringstringstring:sub(1, #stringstringstring - 1)))
        end}}})



    end
    --
    do -- Config
        local Config_Menu = Config:Section({Name = Languages:GetTranslation("Menu")})
        local Config_Configuration = Config:Section({Name = Languages:GetTranslation("Configuration"), Side = "Right"})
        local Config_Theme = Config:Section({Name = Languages:GetTranslation("Theme")})
        local Config_Load = Config:Section({Name = Languages:GetTranslation("Load"), Side = "Right"})
        local Config_GInfo = Config:Section({Name = Languages:GetTranslation("Game Info"), Fill = true, Side = "Right"})

        local Config_Extra = Config:Section({Name = Languages:GetTranslation("Extra"), Fill = true})
        --
        Config_Menu:Keybind({Name = Languages:GetTranslation("Toggle"), Flag = "ConfigMenu_MenuToggle", Default = Enum.KeyCode.Z, KeybindName = Languages:GetTranslation("Menu Key"), Mode = "Toggle", Callback = function(Input, Active) Window.uibind = Input end})

        --
        Config_Configuration:List({Flag = "ConfigConfiguration_Box", Options = Tyrisware.Configs}) 
        Config_Configuration:TextBox({Flag = "ConfigConfiguration_Name", Name = Languages:GetTranslation("Config Name"), Default = "", Max = 20, PlaceHolder = "Config Name", Callback = function(Text) end})
        Config_Configuration:ButtonHolder({Buttons = {{"Create", function() Library:PerformConfigAction(Flags["ConfigConfiguration_Name"]:Get(), "Save") end}, {"Delete", function() Library:PerformConfigAction(Flags["ConfigConfiguration_Box"]:Get(), "Delete") end}}})
        Config_Configuration:ButtonHolder({Buttons = {{"Load", function() Library:PerformConfigAction(Flags["ConfigConfiguration_Box"]:Get(), "Load") end}, {"Save", function() Library:PerformConfigAction(Flags["ConfigConfiguration_Box"]:Get(), "Save") end}}})
        Config_Configuration:Button({Name = Languages:GetTranslation("Unload"), Callback = Window.Unload})
        --
        Config_Theme:Dropdown({Name = Languages:GetTranslation("Theme"), Flag = "ConfigTheme_Theme", Default = "Default", Max = 8, Options = utility:GetTableIndexes(Themes, true)})
        Config_Theme:Button({Name = Languages:GetTranslation("Load"), Callback = function() Library:LoadTheme(Flags.ConfigTheme_Theme:Get()) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Accent"), Flag = "ConfigTheme_Accent", Default = Color3.fromRGB(93, 62, 152), Callback = function(Color) Library:UpdateColor("Accent", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Light Contrast"), Flag = "ConfigTheme_LightContrast", Default = Color3.fromRGB(30, 30, 30), Callback = function(Color) Library:UpdateColor("LightContrast", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Dark Contrast"), Flag = "ConfigTheme_DarkContrast", Default = Color3.fromRGB(20, 20, 20), Callback = function(Color) Library:UpdateColor("DarkContrast", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Outline"), Flag = "ConfigTheme_Outline", Default = Color3.fromRGB(0, 0, 0), Callback = function(Color) Library:UpdateColor("Outline", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Inline"), Flag = "ConfigTheme_Inline", Default = Color3.fromRGB(50, 50, 50), Callback = function(Color) Library:UpdateColor("Inline", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Light Text"), Flag = "ConfigTheme_LightText", Default = Color3.fromRGB(255, 255, 255), Callback = function(Color) Library:UpdateColor("TextColor", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Dark Text"), Flag = "ConfigTheme_DarkText", Default = Color3.fromRGB(175, 175, 175), Callback = function(Color) Library:UpdateColor("TextDark", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Text Outline"), Flag = "ConfigTheme_TextBorder", Default = Color3.fromRGB(0, 0, 0), Callback = function(Color) Library:UpdateColor("TextBorder", Color) end})
        Config_Theme:Colorpicker({Name = Languages:GetTranslation("Cursor Outline"), Flag = "ConfigTheme_CursorOutline", Default = Color3.fromRGB(10, 10, 10), Callback = function(Color) Library:UpdateColor("CursorOutline", Color) end})
        Config_Theme:Dropdown({Name = Languages:GetTranslation("Accent Effect"), Flag = "ConfigTheme_AccentEffect", Default = "None", Options = {"None", "Rainbow", "Shift", "Reverse Shift"}, Callback = function(State) if State == "None" then Library:UpdateColor("Accent", Flags["ConfigTheme_Accent"]:Get()) end end})
        Config_Theme:Slider({Name = Languages:GetTranslation("Effect Length"), Flag = "ConfigTheme_EffectLength", Default = 40, Maximum = 360, Minimum = 1, Decimals = 1})
        --
        Config_Load:Toggle({Name = Languages:GetTranslation("Show Menu"), Flag = "ConfigLoad_ShowMenu", Default = true})
        Config_Load:Toggle({Name = Languages:GetTranslation("Auto Load Config"), Flag = "ConfigLoad_AutoLoad", Default = false})
        --
        Config_Extra:Toggle({Name = Languages:GetTranslation("Show Watermark"), Flag = "ConfigExtra_Watermark", Callback = function(State) Window.watermark:Update("Visible", State) end})
        Config_Extra:Toggle({Name = Languages:GetTranslation("Show Keybinds"), Flag = "ConfigExtra_KBList", Callback = function(State) Window.keybindslist:Update("Visible", State) end})
        Config_Extra:Toggle({Name = Languages:GetTranslation("Show Statuses"), Flag = "ConfigExtra_StatusList", Callback = function(State) Window.statuslist:Update("Visible", State) end})
        Config_Extra:Keybind({Name = Languages:GetTranslation("Shiftlock Bind"), Flag = "Config_ShiftlockBind", Default = Enum.KeyCode['RightControl'], KeybindName = Languages:GetTranslation("Shiftlock Key"), Mode = "Toggle", Callback = function(Input, Active) 
            game.Players.LocalPlayer["PlayerScripts"]:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController"):FindFirstChild("BoundKeys").Value = tostring(Input):split(".")[3] 
        end})

        Config_GInfo:Button({Name = Languages:GetTranslation("Copy Game Join Script"), Callback = function() setclipboard("Roblox.GameLauncher.joinGameInstance(".. game.PlaceId ..", \"".. game.JobId .."\")") end})
    end
end
--
Window.VisualPreview:SetPreviewState(false)

Window:Initialize()
Config:Show()
--





-- << Functions n stuffington >> --
local sayMessage = function(msg, target) replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, target or "ALL") end


workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    camera = workspace.CurrentCamera
end)

client:GetPropertyChangedSignal("Character"):Connect(function()
    clientCharacter = client.Character
end)

--[[
    <vector2> WTS(<vector3> position)
]]--
local WTS = function(position)
    local screen = workspace.CurrentCamera:WorldToViewportPoint(position)
    return Vector2.new(screen.x, screen.y)
end

--[[
    <boolean> isAlive(<player> player)
]]--
local isAlive = function(player)
    return (player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart")) and true or false
end

--[[
    <boolean> isOnScreen(<vector2> position)
]]--
local isOnScreen = function(position)
    local vec, os = camera:WorldToScreenPoint(position)
    return os == true
end

--[[
    <boolean> isVisible(<player> player)
]]--
local isVisible = function(player)
    if not isAlive(player) or not isAlive(client) then return false end
    local raycastParameters = RaycastParams.new();
    raycastParameters.FilterType = Enum.RaycastFilterType.Blacklist 
    raycastParameters.FilterDescendantsInstances = {camera, player.Character, clientCharacter};
    local direction = (player.Character.HumanoidRootPart.Position - camera.CFrame.Position);
    local result = workspace:Raycast(camera.CFrame.Position, direction.Unit * direction.Magnitude, raycastParameters);

    local resultInstance, resultPosition = result and result.Instance, result and result.Position 

    if resultInstance and resultPosition then 
        if not resultInstance:IsDescendantOf(player.Character) then 
            return false 
        end 
    end
    return true
end

--[[
    <boolean> isInFov(<player> target)
]]--
local isInFov = function(target)
    local screenPoint = camera:WorldToScreenPoint(target.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
    local vectorDistance = (Vector2.new(userInputService:GetMouseLocation().X, userInputService:GetMouseLocation().Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
    local charDistance = Vector3.new(clientCharacter:WaitForChild("HumanoidRootPart", math.huge).Position - target.Character:WaitForChild("HumanoidRootPart", math.huge).Position).Magnitude

    if vectorDistance < Flags['LegitAimAssist_FieldOfView']:Get() and isOnScreen(target.Character:WaitForChild("HumanoidRootPart", math.huge).Position) then
        return true
    end
    return false
end

--[[
    <player> getTarget()
]]--
local getTarget = function()

    local conditions = Flags['LegitAimAssist_Conditions']:Get()
    local targetSelection = Flags['LegitAimAssist_TargetPriority']:Get()
    local targets = {}
    if not isAlive(client) then return nil end
    for _, player in next, players:GetPlayers() do
        if player == client then continue end 
        if not player or not player.Character then continue end
        if Find(conditions, "Friend") then
            if player:IsFriendsWith(client.UserId) then continue end
        end

        if Find(conditions, "Visible") then
            if not isVisible(player) then continue end
        end

        local screenPoint = camera:WorldToScreenPoint(player.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
        local vectorDistance = (Vector2.new(userInputService:GetMouseLocation().X, userInputService:GetMouseLocation().Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
        local charDistance = Vector3.new(clientCharacter:WaitForChild("HumanoidRootPart", math.huge).Position - player.Character:WaitForChild("HumanoidRootPart", math.huge).Position).Magnitude

        if vectorDistance < Flags['LegitAimAssist_FieldOfView']:Get() and isOnScreen(player.Character:WaitForChild("HumanoidRootPart", math.huge).Position) then
            table.insert(targets, {player, vectorDistance, charDistance})
        end
    end

    local focusTarget = targets[1]

    if targetSelection == "Closest to Character" then

        for _, target in next, targets do
            if target[3] == focusTarget[3] then continue end

            if target[3] < focusTarget[3] then
                focusTarget = target
            end
        end

    elseif targetSelection == "Closest to Cursor" then
        for _, target in next, targets do 
            if target[2] == focusTarget[2] then continue end

            if target[2] < focusTarget[2] then
                focusTarget = target
            end
        end

    elseif targetSelection == "Is Priority" then 
        for _, target in next, targets do 
            if library.Relations[target.UserId] == "Priority" then
                return target
            end
        end
        return targets[1]
    else -- Lowest Health
        for _, target in next, targets do
            if target[1].Character:WaitForChild("Humanoid", math.huge).Health == focusTarget[1].Character:WaitForChild("Humanoid", math.huge).Health then continue end

            if target[1].Character:WaitForChild("Humanoid", math.huge).Health < focusTarget[1].Character:WaitForChild("Humanoid", math.huge).Health then
                focusTarget = target
            end
        end

    end    
    
    if focusTarget ~= nil then return focusTarget[1] else return nil end

end

--[[
    <boolean> isKnocked(player)
]]--
local isKnocked = function(plr)
    if not isAlive(plr) then return end
    if game.PlaceId == 9825515356 then
        if plr.Character:FindFirstChild("BodyEffects") ~= nil then
            return plr.Character:FindFirstChild("BodyEffects"):FindFirstChild("K.O").Value
        end
    end
    return false
end

--[[
    <part> closestPartToCursor(<player>)
]]--
local closestPartToCursor = function(player)

    local targetParts = {}

    for _, part in next, player.Character:GetChildren() do
        if part:IsA("MeshPart") or part:IsA("BasePart") then
            if Find(Flags["LegitAimAsisst_Aimbone"]:Get(), part.Name) and not Find(forbiddenParts, part.Name) then
                local screenPoint = camera:WorldToScreenPoint(part.Position)
                local vectorDistance = (Vector2.new(userInputService:GetMouseLocation().X, userInputService:GetMouseLocation().Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                table.insert(targetParts, {part, vectorDistance})
            end
        end
    end 

    local focusTarget = targetParts[1]

    for _, part in next, targetParts do
        if focusTarget[2] > part[2] then
            focusTarget = part
        end
    end
    return focusTarget[1]

end

--[[
    <CFrame> getClosestPoint()
]]--
local getClosestPoint = function()
    local Transform = currentAimpart.CFrame:pointToObjectSpace(client:GetMouse().Hit.Position) -- Transform into local space
    local HalfSize = currentAimpart.Size * 0.5
    return currentAimpart.CFrame * Vector3.new( -- Clamp & transform into world space
        math.clamp(Transform.x, -HalfSize.x, HalfSize.x),
        math.clamp(Transform.y, -HalfSize.y, HalfSize.y),
        math.clamp(Transform.z, -HalfSize.z, HalfSize.z)
    )
end

--[[
    <void> clearTable(<table> tab)
]]--
local clearTable = function(tab)
    for _, ent in next, tab do
        ent = nil 
    end
end

runService.heartbeat:Connect(function()
    if Flags['Desync_Enabled']:Get() == true then 
        if isAlive(client) then
            oldvel = clientCharacter.HumanoidRootPart.Velocity
            clientCharacter.HumanoidRootPart.Velocity = Vector3.new(Flags["DesyncVelocity_X"]:Get(), Flags["DesyncVelocity_Y"]:Get(), Flags["DesyncVelocity_Z"]:Get())
            clientCharacter.HumanoidRootPart.CFrame = clientCharacter.HumanoidRootPart.CFrame * CFrame.Angles(0,0.0001,0)
            runService.RenderStepped:Wait()
            clientCharacter.HumanoidRootPart.Velocity = oldvel

            if Flags["DesyncPreset_Enabled"]:Get() == true then
                if Flags["DesyncPreset_Type"]:Get() == "Random" then

                    Flags["DesyncVelocity_X"]:Set(math.random(-6000, 6000))
                    Flags["DesyncVelocity_Y"]:Set(math.random(0, 6000))
                    Flags["DesyncVelocity_Z"]:Set(math.random(-6000, 6000))

                elseif Flags["DesyncPreset_Type"]:Get() == "Fluctuate" then
                    if Flags["DesyncVelocity_X"]:Get() >= 6000 then
                        desyncVelocityDirection = true
                    elseif Flags["DesyncVelocity_X"]:Get() <= -6000 then
                        desyncVelocityDirection = false
                    end
                    xVelAmt = nil
                    if desyncVelocityAmount >= 0 then xVelAmt = 0 else xVelAmt = desyncVelocityAmount end
                    Flags["DesyncVelocity_X"]:Set(desyncVelocityAmount)
                    Flags["DesyncVelocity_Y"]:Set(xVelAmt)
                    Flags["DesyncVelocity_Z"]:Set(desyncVelocityAmount)



                    if desyncVelocityDirection then
                        desyncVelocityAmount -= 1
                    else
                        desyncVelocityAmount += 1
                    end

                elseif Flags["DesyncPreset_Type"]:Get() == "Switch" then
                    if desyncVelocityDirection then
                        desyncVelocityDirection = false
                        Flags["DesyncVelocity_X"]:Set(1000)
                        Flags["DesyncVelocity_Z"]:Set(1000)
                    else
                        Flags["DesyncVelocity_X"]:Set(-1000)
                        Flags["DesyncVelocity_Z"]:Set(-1000)
                        desyncVelocityDirection = true
                    end
                else
                    Flags["DesyncVelocity_Y"]:Set(math.random(150, 6000))
                end
            end

        end
    end 
end)



-- stuffington
spawn(function()
    while true do
        fl_info = {}
        if Flags['Cripwalk_Enabled']:Get() then  
            if isAlive(client) then
                fakelagTick += 1
                fl_info[1] = clientCharacter.HumanoidRootPart.CFrame


                if sleepNet == false then
                    clientCharacter.HumanoidRootPart.CFrame = clientCharacter.HumanoidRootPart.CFrame + Vector3.new(555,0,5)
                end
                sethiddenproperty(clientCharacter.HumanoidRootPart, "NetworkIsSleeping", sleepNet)
                clientCharacter.HumanoidRootPart.CFrame = fl_info[1]
                if fakelagTick >= Flags['Cripwalk_Ticks']:Get() then
                    sleepNet = false
                    fakelagTick = 0
                else
                    sleepNet = true
                end
            end
        end



        if Flags["PredictionBreaker_Enabled"]:Get() == true and Flags['PredictionBreaker_Key']:Active() == true then
            if isAlive(client) then
                fakeVelocity = Vector3.new(Flags["PredBreakerVelocity_X"]:Get(), Flags["PredBreakerVelocity_Y"]:Get(), Flags["PredBreakerVelocity_Z"]:Get())
                realVelocity = clientCharacter["HumanoidRootPart"].Velocity

                for index, part in next, clientCharacter:GetChildren() do
                    if part and part:IsA("BasePart") then 
                        lastVelocities[part] = part.Velocity
                        part.Velocity = fakeVelocity
    
                    end
                end
                
                
                runService.RenderStepped:wait()
                
                for index, part in next, clientCharacter:GetChildren() do
                    if part and part:IsA("BasePart") then 
                        part.Velocity = lastVelocities[part];

                    end
                end
                clearTable(lastVelocities);
                clearTable(lastCFrames);

                if Flags["PredictionBreakerPreset_Enabled"]:Get() == true then
                    if Flags["PredictionBreakerPreset_Type"]:Get() == "Random" then
                        Flags["PredBreakerVelocity_X"]:Set(math.random(-600, 600))
                        Flags["PredBreakerVelocity_Y"]:Set(math.random(-600, 600))
                        Flags["PredBreakerVelocity_Z"]:Set(math.random(-600, 600))
                    else
                        if Flags["PredBreakerVelocity_X"]:Get() >= 600 then
                            velocityDirection = true
                        elseif Flags["PredBreakerVelocity_X"]:Get() <= -600 then
                            velocityDirection = false
                        end
                        Flags["PredBreakerVelocity_X"]:Set(velocityAmount)
                        Flags["PredBreakerVelocity_Y"]:Set(velocityAmount)
                        Flags["PredBreakerVelocity_Z"]:Set(velocityAmount)

                        

                        if velocityDirection then
                            velocityAmount -= 1
                        else
                            velocityAmount += 1
                        end

                    end
                end
            end
        end
        
        runService.Heartbeat:Wait()
    end
end)

--[[
    <void> drawFov()
]]--
local drawFov = function()
    if Flags['FOV_Enabled']:Get() then
        fovCircle.Visible = true
        fovCircle.Thickness = Flags['FOV_Thickness']:Get() / 100
        fovCircle.NumSides = Flags['FOV_Numsides']:Get()
        fovCircle.Radius = Flags['LegitAimAssist_FieldOfView']:Get() 
        fovCircle.Filled = Flags['FOV_Filled']:Get() or false
        fovCircle.Position = Vector2.new(userInputService:GetMouseLocation().X, userInputService:GetMouseLocation().Y)
        fovCircle.Color = Flags['FOV_Color']:Get()["Color"] or Color3.fromRGB(255,0,0)
        fovCircle.Transparency = tonumber(Flags['FOV_Color']:Get()["Transparency"])
    else
        fovCircle.Visible = false
    end
end

--[[
    <void> drawAimpoint()
]]--
local drawAimpoint = function()
    if Flags['PredictionDot_Enabled']:Get() and currentAimpoint ~= nil and currentTarget ~= nil and currentAimpart ~= nil then
        if Find(Flags['LegitAimAssist_DotType']:Get(), "Dot") then
            predCircle.Visible = isOnScreen(currentAimpoint) 
            predCircle.Position = WTS(currentAimpoint)
            predCircle.Radius = Flags['PredictionDot_Size']:Get()
            predCircle.Filled = Flags['PredictionDot_Filled']:Get()
            predCircle.Color = Flags['PredictionDot_Color']:Get()
            predCircle.Thickness = 1
            predCircle.NumSides = Flags['PredictionDot_Numsides']:Get()
        end
        if Find(Flags['LegitAimAssist_DotType']:Get(), "Line") then
            predLine.Visible = isOnScreen(currentAimpoint)
            predLine.From = WTS(currentAimpart.Position)
            predLine.To = WTS(currentAimpoint)
            predLine.Color = Flags['PredictionLine_Color']:Get()
            predLine.Thickness = Flags['PredictionLine_Thickness']:Get()
            predLine.Transparency = 1
            predLine.ZIndex = 1
        end
        if Find(Flags['LegitAimAssist_DotType']:Get(), "Character") then
            if workspace:FindFirstChild("ServerChams") ~= nil then
                for _, part in next, workspace:FindFirstChild("ServerChams"):GetChildren() do
                    part.Color = Flags['PredictionChams_Color']:Get()
                    part.Transparency = Flags['PredictionChams_Color']:GetTransparency()
                    if Flags['Resolver_Enabled']:Get() == true or library.Relations[currentTarget.UserId] == "Resolve" then
                        part.CFrame = currentTarget.Character:FindFirstChild(part.Name).CFrame + (currentTarget.Character.Humanoid.MoveDirection * Flags['LegitAimAssist_PredictionAmt']:Get()/10)
                    else
                        part.CFrame = currentTarget.Character:FindFirstChild(part.Name).CFrame + (Vector3.new(currentAimpart.Velocity.X * (Flags['LegitAimAssist_PredictionAmt']:Get()/100), currentAimpart.Velocity.Y * (Flags['LegitAimAssist_JumpOffset']:Get() / 100) , currentAimpart.Velocity.Z * (Flags['LegitAimAssist_PredictionAmt']:Get()/100)))
                    end
                    part.Material = Enum.Material[Flags['PredictionChams_Material']:Get()]
                end
            else
                local fold = Instance.new("Folder", workspace)
                fold.Name = "ServerChams"
                for _, part in next, clientCharacter:GetChildren() do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        local pee = Instance.new("Part", fold)
                        pee.Name = part.Name
                        pee.Size = part.Size
                        pee.Parent = fold
                        pee.CanCollide = false
                        pee.Transparency = 0.5
                        pee.Anchored = true
                        pee.Color = Flags['PredictionChams_Color']:Get()
                        pee.Transparency = Flags['PredictionChams_Color']:GetTransparency()
                        pee.Material = Enum.Material[Flags['PredictionChams_Material']:Get()]
                    end
                end
            end
        end
    else
        if workspace:FindFirstChild("ServerChams") ~= nil then
            for _, part in next, workspace:FindFirstChild("ServerChams"):GetChildren() do
                part.Transparency = 1
            end
        end
        predLine.Visible = false
        predCircle.Visible = false
    end
end


--[[
    <void> drawEsp()
]]--

local function SkeletonLine(from, to)
    local Line = Drawing.new("Line")
    Line.Visible = false
    Line.From = Vector2.new(from.X, from.Y)
    Line.To = Vector2.new(to.X, to.Y)
    Line.Color = Color3.new(1,1,1)
    Line.Thickness = 1.5
    Line.Transparency = 1
    return Line
end

local espTargets = {}
for _, player in next, players:GetPlayers() do
    if player == client then continue end
    local nametag = Drawing.new("Text")
    nametag.Text = ""
    nametag.Size = 13
    nametag.Visible = false
    nametag.Font = 2
    nametag.Center = true
    table.insert(espTargets, {player, nametag})
end
players.PlayerAdded:Connect(function(player)
    local nametag = Drawing.new("Text")
    nametag.Text = ""
    nametag.Size = 13
    nametag.Visible = false
    nametag.Font = 2
    nametag.Center = true
    table.insert(espTargets, {player, nametag})
end)
players.PlayerRemoving:Connect(function(player)
    local newta = {}
    for _,v in pairs(espTargets) do
        if v[1] ~= player then
            table.insert(newta, v)
        else 
            v[2].Visible = false
        end
    end
    espTargets = newta
end)
local drawEsp = function()
    for _, targ in next, espTargets do
        local player = targ[1]
        local nametag = targ[2]
        if isAlive(player) then
            if library.Relations[player.UserId] == "Resolve" or library.Relations[player.UserId] == "Priority" or library.Relations[player.UserId] == "Friend" then
                nametag.Text = library.Relations[player.UserId]
                nametag.Color = library.Relations[player.UserId] == "Resolve" and Color3.fromRGB(252, 186, 3) or library.Relations[player.UserId] == "Priority" and Color3.fromRGB(66, 30, 227) or library.Relations[player.UserId] == "Friend" and Color3.fromRGB(55, 200, 55)
                nametag.Position = WTS(player.Character:GetPivot().p)
                nametag.Visible = isOnScreen(player.Character:GetPivot().p)
            else
                nametag.Visible = false
            end
        end
    end
end

--[[
    <bool> isWeapon(<tool> tool)
]]--
local isWeapon = function(tool)
    return tool:IsA("Tool") 
end




--[[
    <void> autoShoot()
]]--

local autoShoot = function()
    if Flags['RageSection_AutoShoot']:Get() == true then
        if currentTarget ~= nil and currentAimpoint ~= nil and clientCharacter and isAlive(client) then
            if isVisible(currentTarget) then
                if clientCharacter:FindFirstChildOfClass("Tool") ~= nil then
                    local tool = client.Character:FindFirstChildOfClass("Tool") 
                    if isWeapon(tool) then
                        if currentTarget.Character:FindFirstChild("ForceField") == nil then
                            tool:Activate()
                        end
                    end
                end
            end
        end
    end
end

--[[
    <vector3> smoothVelocity(<player> Player)
]]--



--[[
    <void> calculateAimpoint()
]]--
local calculateAimpoint = function()

    if currentTarget ~= nil then
        if currentAimpartOverride == nil then
            currentAimpart = closestPartToCursor(currentTarget)
        else
            currentAimpart = currentTarget.Character:FindFirstChild(currentAimpartOverride)
        end
        if Flags['LegitAimAssist_AimMethod']:Get() == "Closest Point" then
            currentAimpoint = getClosestPoint()
        elseif Flags['LegitAimAssist_AimMethod']:Get() == "Closest Part" then
            currentAimpoint = currentAimpart.Position
        else
            currentAimpoint = currentAimpart.Position + Vector3.new(math.random(-0.3,0.3), math.random(-0.1,0.1), math.random(-0.3, 0.3))
        end

        if Flags['Resolver_Enabled']:Get() == true or library.Relations[currentTarget.UserId] == "Resolve" then
            if Flags['Resolver_Type']:Get() == "Custom Prediction" then
                currentAimpoint = currentTarget.Character:GetPivot() + (Vector3.new(velocities[currentTarget].X * Flags['LegitAimAssist_PredictionAmt']:Get()/100, velocities[currentTarget].Y * Flags['LegitAimAssist_JumpOffset']:Get() / 100, velocities[currentTarget].Z * Flags['LegitAimAssist_PredictionAmt']:Get()/100))
            elseif Flags['Resolver_Type']:Get() == "EVILEVILEVILEVIL" then
                local smoof = smoothVelocity(currentTarget)
                print("SMOOF:")
                print(smoof)
                print("END SMOOF")
                currentAimpoint = currentTarget.Character:GetPivot().p + (Vector3.new(smoof.X * Flags['LegitAimAssist_PredictionAmt']:Get()/100, smoof.Y * Flags['LegitAimAssist_PredictionAmt']:Get()/100, smoof.Z * Flags['LegitAimAssist_PredictionAmt']:Get()/100))
            else
            -- Humanoid WalkTo pred
                currentAimpoint = currentTarget.Character:GetPivot() + (currentTarget.Character.Humanoid.MoveDirection * Flags['LegitAimAssist_PredictionAmt']:Get()/10)
            end
        else
            --aimPoint = currentTarget.Character:GetPivot().p + (currentTarget.Character.Humanoid.MoveDirection * .11)
            currentAimpoint = currentAimpoint + (Vector3.new(currentAimpart.Velocity.X * (Flags['LegitAimAssist_PredictionAmt']:Get()/100), currentAimpart.Velocity.Y * (Flags['LegitAimAssist_JumpOffset']:Get() / 100) , currentAimpart.Velocity.Z * (Flags['LegitAimAssist_PredictionAmt']:Get()/100)))
        end


        if typeof(currentAimpoint) == "CFrame" then
            currentAimpoint = currentAimpoint.p 
        end

    end
end



-- kys
local oldValuePrios = {}
local isOldSaved = function(plr)
    for _, v in next, oldValuePrios do
        if v[1] == plr then
            return true
        end
    end
    return false
end
local removeOldPrio = function(plr)
    local relt = {}
    for _, v in next, oldValuePrios do
        if v[1] ~= plr then
            table.insert(relt, v)
        end
    end
    oldValuePrios = relt
end

local getOldSaved = function(plr)
    for _, v in next, oldValuePrios do
        if v[1] == plr then
            return v[2]
        end
    end
end

function utility:GetTeam(plr)
    -- get corresponding character
    if not isAlive(plr) then return end
    local targ = nil
    for idx, pl in next, Settings_PlayerList.players do
        if pl[1] == plr then
            targ = idx
        end
    end


    if Flags["PlayerCheckType"]:Get() == "Antilocking" then
        local predictedPosition = plr.Character:GetPivot().p + (Vector3.new(plr.Character:WaitForChild("HumanoidRootPart").Velocity.X * (Flags['LegitAimAssist_PredictionAmt']:Get()/100), plr.Character:WaitForChild("HumanoidRootPart").Velocity.Y * (Flags['LegitAimAssist_JumpOffset']:Get() / 100) , plr.Character:WaitForChild("HumanoidRootPart").Velocity.Z * (Flags['LegitAimAssist_PredictionAmt']:Get()/100)))
        local resolvedPosition = plr.Character:GetPivot().p + (Vector3.new(velocities[plr].X * Flags['LegitAimAssist_PredictionAmt']:Get()/100, velocities[plr].Y * Flags['LegitAimAssist_JumpOffset']:Get() / 100, velocities[plr].Z * Flags['LegitAimAssist_PredictionAmt']:Get()/100))
        --if (plr.Character:GetPivot().p + (Vector3.new(plr.Character:WaitForChild("HumanoidRootPart").Velocity.X * (Flags['LegitAimAssist_PredictionAmt']:Get()/100), plr.Character:WaitForChild("HumanoidRootPart").Velocity.Y * (Flags['LegitAimAssist_JumpOffset']:Get() / 100) , plr.Character:WaitForChild("HumanoidRootPart").Velocity.Z * (Flags['LegitAimAssist_PredictionAmt']:Get()/100))) - plr.Character:GetPivot().p).Magnitude > Flags['Resolver_Threshold']:Get() then
        if (predictedPosition - resolvedPosition).Magnitude >= Flags['Resolver_Threshold']:Get() then -- this method should work a lot better
            Settings_PlayerList.players[targ][3] = "Antilocking"

            if Flags['Resolver_Auto']:Get() == true then
                if library.Relations[plr.UserId] == "Priority" or library.Relations[plr.UserId] == "Friend" and not isOldSaved(plr) then 
                    table.insert(oldValuePrios, {plr, library.Relations[plr.UserId]})
                end
                library.Relations[plr.UserId] = "Resolve"
            end

        else
            if Settings_PlayerList.players[targ][3] == "Antilocking" then
                if isOldSaved(plr) then 
                    print(isOldSaved(plr), plr.Name)
                    print(getOldSaved(plr), plr.Name)
                    library.Relations[plr.UserId] = getOldSaved(plr)
                    removeOldPrio(plr)
                else
                    Settings_PlayerList.players[targ][3] = "None"
                end
                if library.Relations[plr.UserId] == "Resolve" then
                    library.Relations[plr.UserId] = "None"
                end
            end
        end
	else
		Settings_PlayerList.players[targ][3] = plr.DisplayName
	end 
end
local xdt = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "-",
    "-B",
    "-BO",
    "-BOI",
    "-BOIN",
    "-BOING",
    "-BOING-",
    "-bOiNg-",
    "-BoInG-",
    "-bOiNg-",
    "-BoInG-",
    "-BOING-",
    "BOING-",
    "OING-",
    "ING-",
    "NG-",
    "G-",
    "G",
    "",
    "",
    "",
    "",
    "",
    "                                T",
    "                               Ty",
    "                              Tyr",
    "                             Tyri",
    "                            Tyris",
    "                           Tyrisw",
    "                          Tyriswa",
    "                         Tyriswar",
    "                        Tyrisware",
    "                       Tyrisware ",
    "                      Tyrisware -",
    "                     Tyrisware - J",
    "                    Tyrisware - Ju",
    "                   Tyrisware - Jum",
    "                  Tyrisware - Jump",
    "                 Tyrisware - Jumpi",
    "                Tyrisware - Jumpin",
    "               Tyrisware - Jumping",
    "              Tyrisware - Jumping ",
    "             Tyrisware - Jumping i",
    "            Tyrisware - Jumping is",
    "           Tyrisware - Jumping is ",
    "          Tyrisware - Jumping is n",
    "         Tyrisware - Jumping is no",
    "        Tyrisware - Jumping is not",
    "       Tyrisware - Jumping is not ",
    "      Tyrisware - Jumping is not a",
    "     Tyrisware - Jumping is not a ",
    "    Tyrisware - Jumping is not a c",
    "   Tyrisware - Jumping is not a cr",
    "  Tyrisware - Jumping is not a cri",
    " Tyrisware - Jumping is not a crim",
    "Tyrisware - Jumping is not a crime",
    "Tyrisware - Jumping is not a crime!",
    "Tyrisware - Jumping is not a crime",
    "Tyrisware - Jumping is not a crime!",
    "Tyrisware - Jumping is not a crime",
    "Tyrisware - Jumping is not a crime!",
    "Tyrisware - Jumping is not a crime",
    "Tyrisware - Jumping is not a crime!",
    "Tyrisware - Jumping is not a crime",
    "Tyrisware - Jumping is not a crime!",
}
-- kys
spawn(function()
    local counter = 1
    local total_len = #xdt
    local dir = false
    while true do
        Window:UpdateTitle(xdt[counter])
        
        if counter >= total_len then
            dir = true
        elseif counter <= 1 then
            dir = false
        end

        if dir == true then
            counter -= 1
            
        else
            counter += 1
        end

        wait(0.2)
    end 

end)

spawn(function()
    while true do

        for _, player in next, players:GetPlayers() do
            if player == client then continue end
            utility:GetTeam(player)
        end
        wait(1)
    end
end)

-- auto adjust pred amount by ping
task.spawn(function()
    while true do
        
        --- what the fuck fam
        if Flags['LegitAimAssist_AutoPredictionAmt']:Get() == true then
            if currentPing < 20 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 15.7 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 15.7 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 30 then    
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 15.5 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 15.5 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 40 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 14.5 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 14.5 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 50 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 14.3 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 14.3 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 60 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 14 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 14 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 70 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 13.6 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 13.6 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 80 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 13.3 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 13.3 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 90 then
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 13 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 13 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 105 then      
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 12.7 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 12.7 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            elseif currentPing < 110 then   
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 12.4 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 12.4 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            else 
                if Flags['LegitAimAssist_PredictionAmt']:Get() > 12.0 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()-.1) end
                if Flags['LegitAimAssist_PredictionAmt']:Get() < 12.0 then Flags['LegitAimAssist_PredictionAmt']:Set(Flags['LegitAimAssist_PredictionAmt']:Get()+.1) end
            end
        end
        
        --[[ this shit reduce ur fps to smitherines
        for _, player in next, players:GetPlayers() do
            if player == client then continue end
            if not isAlive(player) then continue end
            if player.Character:FindFirstChild("Highlight") then
                if library.Relations[player.UserId] == "Priority" then
                    player.Character:FindFirstChild("Highlight"):Destroy()
                    local hl = Instance.new("Highlight", player.Character)
                    hl.OutlineColor = Color3.fromRGB(66, 30, 227)
                    hl.FillTransparency = 1
                elseif library.Relations[player.UserId] == "Enemy" then
                    player.Character:FindFirstChild("Highlight"):Destroy()
                    local hl = Instance.new("Highlight", player.Character)
                    hl.OutlineColor = Color3.fromRGB(227, 30, 53)
                    hl.FillTransparency = 1
                elseif library.Relations[player.UserId] == "Resolve" then
                    player.Character:FindFirstChild("Highlight"):Destroy()
                    local hl = Instance.new("Highlight", player.Character)
                    hl.OutlineColor = Color3.fromRGB(252, 186, 3)
                    hl.FillTransparency = 1
                end
            end
        end
        ]]--

        wait(.2)
    end

end)


--[[
    <boolean> isGun(<tool> tool)
]]--
local isGun = function(tool)
    return tool:IsA("Tool") -- temporary
end

--[[
    <void> teleportBuy(<model> weapon)
]]--    
local teleportBuy = function(weapon)
    if clientCharacter.Humanoid.Health >= 1 then
        clientCharacter.HumanoidRootPart.CFrame = weapon:FindFirstChild("Head").CFrame
        wait(.2)
        if weapon.Name:match("Ammo") then
            for i=1, Flags['Autobuy_AmmoAmt']:Get() do
                fireclickdetector(weapon:FindFirstChild("ClickDetector"))
                wait(.5)
            end
        else
            fireclickdetector(weapon:FindFirstChild("ClickDetector"))
            wait(.2)
        end
    end
end

--[[
    <beam> misc:CreateBeam(<attachment> origin_att, <attachment> ending_att, <string> texture)
]]--
function misc:CreateBeam(origin_att, ending_att, texture)
    local beam = Instance.new("Beam")
    beam.Texture = texture or "http://www.roblox.com/asset/?id=446111271"
    beam.TextureMode = Enum.TextureMode.Wrap
    beam.TextureSpeed = 8
    beam.LightEmission = 1
    beam.LightInfluence = 1
    beam.TextureLength = 12
    beam.FaceCamera = true
    beam.Enabled = true
    beam.ZOffset = -1
    beam.Transparency = NumberSequence.new(Flags['BulletTracer_Transparency']:Get() / 100, Flags['BulletTracer_Transparency']:Get() / 100)
    beam.Color = ColorSequence.new(Flags['BulletTracer_Color']:Get(), Color3.new(0, 0, 0))
    beam.Attachment0 = origin_att
    beam.Attachment1 = ending_att
    debris:AddItem(beam, 3)
    debris:AddItem(origin_att, 3)
    debris:AddItem(ending_att, 3)
    
    local speedtween = TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
    tweenService:Create(beam, speedtween, { TextureSpeed = 2 }):Play()
    beam.Parent = Workspace
    table.insert(misc.beams, { beam = beam, time = tick() }) 
    return beam
end

--[[
    <void> misc:UpdateBeams()
]]--
function misc:UpdateBeams()
    local time = tick()
    for i = #self.beams, 1, -1 do
        if self.beams[i].beam  then
            local transp = 1 - (Flags['BulletTracer_Transparency']:Get() / 100)
            local transparency = transp + (((time - self.beams[i].time) - 2) * (1 - transp))
            self.beams[i].beam.Transparency = NumberSequence.new(transparency, transparency)
            if transparency >= 1 then
                table.remove(self.beams, i)
            end
        else
            table.remove(self.beams, i)
        end
    end
end

-- Aimviewer bypassington
client.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(child)

        if child.Name == "Christmas_Sock" then
            child:Destroy()
        end

        if isGun(child) then
            if toolConnection[1] == nil then
                toolConnection[1] = child 
            end
            if toolConnection[1] ~= child and toolConnection[2] ~= nil then 
                toolConnection[2]:Disconnect()
                toolConnection[1] = child
            end

            toolConnection[2] = child.Activated:Connect(function() 
                
                if Flags['RageSection_AutoReload']:Get() == true then
                    if child:FindFirstChild("Ammo") ~= nil then

                        if child["Ammo"].Value == 0 then
                            shootRemote:FireServer("Reload", child)
                        end
                    end
                end

                if Flags['BulletTracer_Enabled']:Get() == true then
                    -- for real da hood
                    if game.PlaceId == 2788229376 then
                        if child:FindFirstChild("Ammo") ~= nil then
                            if child["Ammo"].Value == 0 then
                                return
                            end
                        else
                            return 
                        end
                    end

                    local fromAttach = Instance.new("Attachment", workspace.Terrain)
                    fromAttach.Position = clientCharacter:FindFirstChildOfClass("Tool"):FindFirstChild("Handle").Position 
                    local toAttach = Instance.new("Attachment", workspace.Terrain)
                    local pPos = nil
                    if Flags['Prediction_EnabledKey']:Active() then 
                        pPos = currentAimpoint 
                    else 
                        pPos = mouse.Hit.p
                    end
                    toAttach.Position = pPos
                    local beam = misc:CreateBeam(fromAttach, toAttach)
                end
                if currentTarget ~= nil and currentAimpoint ~= nil and Flags['Prediction_EnabledKey']:Active() == true and Flags['Aimviewer_Bypass']:Get() == true then
                    
                    shootRemote:FireServer(shootArgument, currentAimpoint)
                end
    
            end)
        end
    end)


    if Flags['Autobuy_Enabled']:Get() == true and game.PlaceId == 2788229376 then
        while not isAlive(client) or clientCharacter:FindFirstChild("ForceField") do
            wait()
        end
        oldChar = clientCharacter.HumanoidRootPart.CFrame

        if Find(Flags['Item_Selection']:Get(), "Revolver") and not client.Backpack:FindFirstChild("[Revolver]") then
            teleportBuy(weaponShops["Revolver"])
            wait(Flags['Autobuy_AmmoAmt']:Get() * 0.5 + 0.6)
        end

        if Find(Flags['Item_Selection']:Get(), "Revolver Ammo") and client.Backpack:FindFirstChild("[Revolver]") then
            teleportBuy(weaponShops["Revolver Ammo"])
            wait(Flags['Autobuy_AmmoAmt']:Get() * 0.5 + 0.6)
        end

        if Find(Flags['Item_Selection']:Get(), "Double-Barrel") and not client.Backpack:FindFirstChild("[Double-Barrel SG]") then
            teleportBuy(weaponShops["Double-Barrel SG"])
            wait(Flags['Autobuy_AmmoAmt']:Get() * 0.5 + 0.6)
        end

        if Find(Flags['Item_Selection']:Get(), "Double-Barrel Ammo") and client.Backpack:FindFirstChild("[Double-Barrel SG]") then
            teleportBuy(weaponShops["Double-Barrel SG Ammo"])
            wait(Flags['Autobuy_AmmoAmt']:Get() * 0.5 + 0.6)
        end
        clientCharacter.HumanoidRootPart.CFrame = oldChar

    end
end)

client.Character.ChildAdded:Connect(function(child)

    if child.Name == "Christmas_Sock" then
        child:Destroy()
    end

    if isGun(child) then
        if toolConnection[1] == nil then
            toolConnection[1] = child 
        end
        if toolConnection[1] ~= child and toolConnection[2] ~= nil then 
            toolConnection[2]:Disconnect()
            toolConnection[1] = child
        end

        toolConnection[2] = child.Activated:Connect(function() 

            if Flags['RageSection_AutoReload']:Get() == true then
                if child:FindFirstChild("Ammo") ~= nil then
                    if child["Ammo"].Value == 0 then
                        shootRemote:FireServer("Reload", child)
                    end
                end
            end

            if Flags['BulletTracer_Enabled']:Get() == true then

                -- for real da hood
                if game.PlaceId == 2788229376 then
                    if child:FindFirstChild("Ammo") ~= nil then
                        if child["Ammo"].Value == 0 then
                            return
                        end
                    else
                        return 
                    end
                end

                local fromAttach = Instance.new("Attachment", workspace.Terrain)
                fromAttach.Position = clientCharacter:FindFirstChildOfClass("Tool"):FindFirstChild("Handle").Position 
                local toAttach = Instance.new("Attachment", workspace.Terrain)
                local pPos = nil
                if Flags['Prediction_EnabledKey']:Active() then 
                    pPos = currentAimpoint 
                else 
                    pPos = mouse.Hit.p
                end
                toAttach.Position = pPos
                local beam = misc:CreateBeam(fromAttach, toAttach)
            end
            if currentTarget ~= nil and currentAimpoint ~= nil and Flags['Prediction_EnabledKey']:Active() == true and Flags['Aimviewer_Bypass']:Get() == true then
             
                shootRemote:FireServer(shootArgument, currentAimpoint)
            end

        end)
    end
end)



for _, player in next, game:GetService("Players"):GetPlayers() do
    if player == client then continue end
    velocities[player] = Vector3.new(0,0,0)
    positions[player] = Vector3.new(0,0,0)
    oldVelocities[player] = Vector3.new(0,0,0)
    if player:IsFriendsWith(client.UserId) == true then
        library.Relations[player.UserId] = "Friend"  
        print("FRIEND INGAME ", player.Name)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(plr)

    velocities[plr] = Vector3.new(0,0,0)
    positions[plr] = Vector3.new(0,0,0)
    oldVelocities[plr] = Vector3.new(0,0,0)

    if plr:IsFriendsWith(client.UserId) == true then
       library.Relations[plr.UserId] = "Friend"  
       print("FRIEND JOINED", plr.Name)
    end

end)

-- thank you xaxa
runService.Heartbeat:Connect(function(step)

    currentPing = tonumber(string.format("%.3f", ping:GetValue()));


    for index, player in next, players:GetPlayers() do 
        if not isAlive(player) then continue end
        local lastPosition = positions[player];
        if not lastPosition or lastPosition == nil then 
            lastPosition = player.Character:GetPivot().p    
            continue
        end 
        local character = player.Character 
        local rootPart = character and character:FindFirstChild("HumanoidRootPart");

        velocities[player] = (player.Character:GetPivot().p - lastPosition) / step
        positions[player] = player.Character:GetPivot().p
        
        oldVelocities[player] = rootPart.Velocity

    end
    
    

    if Flags['RageSection_CFrameKeybind']:Active() then
        if isAlive(client) then 
            if clientCharacter.Humanoid.MoveDirection.Magnitude > 0 then
                for i=1, Flags['RageSection_CFrameSpeedMulti']:Get() do
                    clientCharacter:TranslateBy(clientCharacter.Humanoid.MoveDirection)
                end
            end
        end
    end

end)

--[[
    <void> camlock()
]]--
local camlock = function()
    if Flags['Camlock_Enabled']:Get() == true then
        if Flags['Prediction_EnabledKey']:Active() then 
            if camera then
                if isAlive(client) then
                    if currentAimpoint ~= nil and currentTarget ~= nil then
                        if isKnocked(currentTarget) then return end
                        if currentTarget.Character:FindFirstChild("ForceField") ~= nil then return end
                        local Main = CFrame.new(camera.CFrame.p, currentAimpoint)
                        camera.CFrame = camera.CFrame:Lerp(Main, Flags['LegitAimAssist_Smoothing']:Get() / 100, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                    end
                end
            end
        end
    end
end

--[[
    <void> drawWeapons()
]]--
local drawWeapons = function() 
    if Flags['Weapon_Visuals']:Get() == true then
        if isAlive(client) then
            if clientCharacter:FindFirstChildOfClass("Tool") then
                for _, v in next, clientCharacter:FindFirstChildOfClass("Tool"):GetDescendants() do
                    if v:IsA("MeshPart") then
                        v.Material = Enum.Material[Flags['Weapon_VisualsMaterial']:Get()]
                        v.Color = Flags['Weapon_VisualsColor']:Get()
                    end
                end
            end
        end
    end
end

--[[
    <void> circleStrafe(dt)
]]--
local ideez = 0
local circleStrafe = function(dt)
    if Flags['Circle_Strafe']:Get() == true and Flags['Circle_StrafeKey']:Active() == true then
        if currentRotationing == nil then 
            currentRotationing = getTarget()
        end
        if currentRotationing ~= nil then
            if isAlive(client) and isAlive(currentRotationing) then
                circleStrafeTargPos = nil
                if Flags['Circle_StrafeType']:Get() == "Position" then
                    circleStrafeTargPos = currentRotationing.Character.HumanoidRootPart.Position
                elseif Flags['Circle_StrafeType']:Get() == "Prediction" then
                    circleStrafeTargPos = currentRotationing.Character.HumanoidRootPart.Position + (Vector3.new(currentRotationing.Character.HumanoidRootPart.Velocity.X * (Flags['LegitAimAssist_PredictionAmt']:Get()/100), currentRotationing.Character.HumanoidRootPart.Velocity.Y * (Flags['LegitAimAssist_JumpOffset']:Get() / 100) , currentRotationing.Character.HumanoidRootPart.Velocity.Z * (Flags['LegitAimAssist_PredictionAmt']:Get()/100)))
                else
                    circleStrafeTargPos = currentRotationing.Character.HumanoidRootPart.Position + Vector3.new(0,5,0)
                end
                ideez = (ideez+ dt/(Flags['Circle_StrafeCycle']:Get() / 10)) % 1
                local alpha = 2 * math.pi * ideez
                clientCharacter.HumanoidRootPart.CFrame = CFrame.Angles(0, alpha, 0) * CFrame.new(0, 0, Flags['Circle_Distance']:Get()) + circleStrafeTargPos
            end
        end
    else
        currentRotationing = nil
    end
end

--[[
    <void> drawAimviewer()
]]--
local drawAimviewer = function()
    for _, player in next, aimviewerTargets do
        if player[2] == nil then
            -- create a new Aimviewer Beam
            local beam = Instance.new("Part", workspace)
            beam.Material = Enum.Material.ForceField
            beam.Color = theme.accent
            beam.CanCollide = false
            player[2] = beam
        else
            if isAlive(player[1]) and player[1].Character:FindFirstChildOfClass("Tool") then 
                player[2].Size = Vector3.new(0.3, 0.3, (player[1].Character.Head.CFrame * CFrame.new(0, 0, 0).Position - player[1].Character["BodyEffects"].MousePos.Value).Magnitude)
                player[2].CFrame = CFrame.new(player[1].Character.Head.CFrame * CFrame.new(0, 0, 0).Position, player[1].Character["BodyEffects"].MousePos.Value) * CFrame.new(0, 0, player[2].Size.Z / -2)
                player[2].Color = theme.accent
            else
                player[2].Position = Vector3.new(999999,9999999,999999)
            end
        end
    end
end



-- main RS
runService.RenderStepped:Connect(function(dt)

    currentTarget = getTarget() 

    if Flags['Locktarget_EnabledKey']:Active() == true then
        if lockedTarget ~= nil then
            if isInFov(lockedTarget) then
                currentTarget = lockedTarget
            else
                currentTarget = nil
                currentAimpoint = nil
            end
        else
            lockedTarget = currentTarget
        end
    else
        lockedTarget = nil
    end
   -- Aim --    
   calculateAimpoint() 

    -- Visuals --
    drawFov()
    drawAimpoint()
    drawEsp()
    misc:UpdateBeams()
    drawWeapons()
    drawAimviewer()

    -- Rage --
    autoShoot()

 

    -- camlock --
    camlock()

    -- circle strafer --
    circleStrafe(dt)
    
    -- chat spam -- 
    if Flags['ChatSpam_Enabled']:Get() == true then
        if tick() >= chatSpamTick + Flags['ChatSpam_Delay']:Get() then
            sayMessage(chatSpams[Flags['ChatSpam_Type']:Get()][math.random(1, #chatSpams[Flags['ChatSpam_Type']:Get()])])
            chatSpamTick = tick()
        end
    end

    -- anti bag --
    if clientCharacter ~= nil then
        if clientCharacter:FindFirstChild("Christmas_Sock") ~= nil then
            clientCharacter:FindFirstChild("Christmas_Sock"):Destroy()
        end
    end

    -- menu effects --
    --Library:UpdateHue()    

end)


local __namecall -- cock ;)
__namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
    local Method = getnamecallmethod()

    if tostring(self.Name) == "MainEvent" and tostring(Method) == "FireServer" then
        
        if Find({"TeleportDetect", "CHECKER_1", "CHECKER", "GUI_CHECK", "OneMoreTime", "checkingSPEED", "BANREMOTE", "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE"}, Args[1]) then
            return
        end
    end

    return __namecall(self, ...)
end)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    
    if Flags['Aimviewer_Bypass']:Get() == false and currentTarget ~= nil and currentAimpoint ~= nil and Flags['Prediction_EnabledKey']:Active() == true then
        if typeof(args[2]) == "Vector3" then
            args[2] = currentAimpoint
        end
        return backupnamecall(self, unpack(args))
    end

    if typeof(args[2]) == "Vector3" then
        shootArgument = args[1]
    end
    
    if game.PlaceId == 9825515356 then -- afk bypass in customs
        if args[1] == "RequestAFKDisplay" then
            args[2] = false
            return backupnamecall(self, unpack(args))
        end
    end

    return backupnamecall(self, ...)
end)