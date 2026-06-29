local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local results = {}

for _, player in ipairs(Players:GetPlayers()) do
    local char = player.Character
    local backpack = player:FindFirstChild("Backpack")
    local function scan(container, location)
        if not container then return end
        for _, item in ipairs(container:GetChildren()) do
            if item:IsA("Tool") then
                table.insert(results, "[Weapon] " .. player.Name .. " | " .. location .. ": " .. item.Name)
            end
        end
    end
    scan(char, "Character")
    scan(backpack, "Backpack")
end

for _, obj in ipairs(Workspace:GetDescendants()) do
    if obj.Name:lower():find("coin") then
        local parent = obj.Parent
        local parentName = parent and parent.Name or "NO_PARENT"
        local touch = obj:FindFirstChild("TouchInterest")
        local info = "[Coin] Parent: " .. parentName .. " | Name: " .. obj.Name .. " | Class: " .. obj.ClassName
        if touch then info = info .. " | TouchInterest: YES" end
        local key = parentName .. obj.Name
        if not results[key] then results[key] = info end
    end
end

for _, obj in ipairs(Workspace:GetChildren()) do
    if obj.Name:lower():find("gun") or obj.Name:lower():find("drop") then
        table.insert(results, "[Dropped] " .. obj.Name .. " | Class: " .. obj.ClassName)
    end
end

print("==================== SCANNER RESULTS ====================")
if #results == 0 then
    print("Nothing found.")
else
    for _, v in ipairs(results) do
        print(v)
    end
end
print("=========================================================")
