local msg = Instance.new("Message")
msg.Parent = workspace

local found = false
for _, obj in ipairs(workspace:GetChildren()) do
    if obj:IsA("Model") then
        local cc = obj:FindFirstChild("CoinContainer")
        if cc then
            found = true
            msg.Text = "Map: " .. obj.Name .. " | Coins: " .. #cc:GetChildren()
            for _, coin in ipairs(cc:GetChildren()) do
                local part = nil
                for _, child in ipairs(coin:GetDescendants()) do
                    if (child.Name == "MainCoin" or child.Name == "Coin") and child:IsA("BasePart") then
                        part = child
                        break
                    end
                end
                if part then
                    msg.Text = msg.Text .. " | Found: " .. part.Name
                else
                    msg.Text = msg.Text .. " | No part in " .. coin.Name
                end
                wait(1)
            end
            break
        end
    end
end

if not found then
    msg.Text = "No CoinContainer found. Waiting..."
    wait(3)
    msg.Text = "Workspace children: " .. #workspace:GetChildren()
    for _, child in ipairs(workspace:GetChildren()) do
        msg.Text = msg.Text .. " | " .. child.Name
        wait(0.3)
    end
end
