getgenv().Alts = {
    6049022818,
    6049037261,
    6049040511,
    6049044874,
    6049052744,
    6049055846,
    6049065390,
    6050730630,
    6053809369,
    6053812476,
    6053816044,
    6053819083,
    6053822242,
    6053825153,
    6053827852,
    2889217025,
    3367905700,
    3370399006,
    3367927005,
    4248946333,
    4248950694,
    4248953001,
    4248956975,
    4248959589,
    4998414217
}

-- Gui to Lua
-- Version: 3.2

-- Instances:

local SG = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Hermes = Instance.new("TextLabel")
local Hermes_2 = Instance.new("TextLabel")

--Properties:

SG.Name = "SG"
SG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = SG
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.223654285, 0, 0.113526568, 0)
MainFrame.Size = UDim2.new(0, 299, 0, 87)

UICorner.Parent = MainFrame

Hermes.Name = "Hermes"
Hermes.Parent = MainFrame
Hermes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hermes.BackgroundTransparency = 1.000
Hermes.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hermes.BorderSizePixel = 0
Hermes.Size = UDim2.new(0, 299, 0, 37)
Hermes.Font = Enum.Font.SourceSansBold
Hermes.Text = "Hermes Total Stock"
Hermes.TextColor3 = Color3.fromRGB(255, 255, 255)
Hermes.TextScaled = true
Hermes.TextSize = 14.000
Hermes.TextWrapped = true

Hermes_2.Name = "Hermes"
Hermes_2.Parent = MainFrame
Hermes_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hermes_2.BackgroundTransparency = 1.000
Hermes_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hermes_2.BorderSizePixel = 0
Hermes_2.Position = UDim2.new(0, 0, 0.425287366, 0)
Hermes_2.Size = UDim2.new(0, 299, 0, 37)
Hermes_2.Font = Enum.Font.SourceSansBold
Hermes_2.Text = "Currency"
Hermes_2.TextColor3 = Color3.fromRGB(47, 255, 0)
Hermes_2.TextScaled = true
Hermes_2.TextSize = 14.000
Hermes_2.TextWrapped = true

local Players = game:GetService("Players")

function makeFrameDraggable(frame)
    local UserInputService = game:GetService("UserInputService")

    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end

makeFrameDraggable(MainFrame)

local function formatNumber(num)
    local formatted = tostring(num)
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

local function updateCurrency()
    local totalCurrency = 0
    for _, altId in ipairs(getgenv().Alts) do
        local altPlayer = Players:GetPlayerByUserId(altId)
        if altPlayer and altPlayer:FindFirstChild("DataFolder") and altPlayer.DataFolder:FindFirstChild("Currency") then
            totalCurrency = totalCurrency + altPlayer.DataFolder.Currency.Value
        end
    end
    Hermes_2.Text = "Currency: " .. formatNumber(totalCurrency)
end

local function startUpdatingCurrency()
    while true do
        updateCurrency()
        wait(1)  -- Update every 5 seconds, adjust as needed
    end
end

-- Start updating the currency continuously
spawn(startUpdatingCurrency)
