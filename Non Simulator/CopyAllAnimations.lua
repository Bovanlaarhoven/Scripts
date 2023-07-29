local animationIdsToCheck = {}  -- Array to store unique animationIds

local function collectAnimationIds(folder)
    for _, animation in ipairs(folder:GetChildren()) do
        if animation:IsA("Animation") then
            local animationId = animation.AnimationId
            local formattedAnimationId = '"' .. animationId .. '"'
            if not table.find(animationIdsToCheck, formattedAnimationId) then
                table.insert(animationIdsToCheck, formattedAnimationId)
            end
        end
    end
end

local function processFolder(folder)
    if not folder:IsA("Folder") then
        return
    end

    collectAnimationIds(folder)

    for _, subFolder in ipairs(folder:GetChildren()) do
        if subFolder:IsA("Folder") then
            processFolder(subFolder)
        end
    end
end

local folderName = "SwingAnimations"
local allSwingAnimationFolders = {}

local function findSwingAnimationFolders(parent)
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("Folder") and child.Name == folderName then
            table.insert(allSwingAnimationFolders, child)
        elseif child:IsA("Model") or child:IsA("Folder") then
            findSwingAnimationFolders(child)
        end
    end
end

findSwingAnimationFolders(game.Workspace)

for _, folder in ipairs(allSwingAnimationFolders) do
    processFolder(folder)
end

local animationIdsText = table.concat(animationIdsToCheck, ",\n")
setclipboard(animationIdsText .. "}")

print("Copied AnimationIds to Clipboard:")
print("{" .. animationIdsText .. "}")
