getgenv().Alts = {
    alt1 = "HermesDHC1",
    alt2 = "HermesDHC2",
    alt3 = "HermesDHC3",
    alt4 = "HermesDHC4",
    alt5 = "HermesDHC5",
    alt6 = "HermesDHC6",
    alt7 = "HermesDHC7",
    alt8 = "HermesDHC8",
    alt9 = "HermesDHC9",
    alt10 = "HermesDHC10",
}

-- Gui to Lua
-- Version: 3.2

-- Instances:

local SG = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local HermesTotalStock = Instance.new("TextLabel")
local Stock = Instance.new("TextLabel")

--Properties:

SG.Name = "SG"
SG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = SG
MainFrame.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.21758908, 0, 0.121980675, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 71)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 62, 94)), ColorSequenceKeypoint.new(0.82, Color3.fromRGB(26, 166, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 158, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient.Parent = MainFrame

UICorner.Parent = MainFrame

HermesTotalStock.Name = "HermesTotalStock"
HermesTotalStock.Parent = MainFrame
HermesTotalStock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HermesTotalStock.BackgroundTransparency = 1.000
HermesTotalStock.BorderColor3 = Color3.fromRGB(0, 0, 0)
HermesTotalStock.BorderSizePixel = 0
HermesTotalStock.Size = UDim2.new(0, 220, 0, 26)
HermesTotalStock.Font = Enum.Font.SourceSansBold
HermesTotalStock.Text = "Hermes Total Stock"
HermesTotalStock.TextColor3 = Color3.fromRGB(255, 255, 255)
HermesTotalStock.TextScaled = true
HermesTotalStock.TextSize = 14.000
HermesTotalStock.TextWrapped = true

Stock.Name = "Stock"
Stock.Parent = MainFrame
Stock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stock.BackgroundTransparency = 1.000
Stock.BorderColor3 = Color3.fromRGB(0, 0, 0)
Stock.BorderSizePixel = 0
Stock.Position = UDim2.new(0, 0, 0.450704217, 0)
Stock.Size = UDim2.new(0, 220, 0, 26)
Stock.Font = Enum.Font.SourceSansBold
Stock.Text = "999,999,99$"
Stock.TextColor3 = Color3.fromRGB(34, 255, 0)
Stock.TextScaled = true
Stock.TextSize = 14.000
Stock.TextWrapped = true

local Players = game:GetService("Players")

local alt1 = Players:FindFirstChild(getgenv().Alts.alt1)
local alt2 = Players:FindFirstChild(getgenv().Alts.alt2)
local alt3 = Players:FindFirstChild(getgenv().Alts.alt3)
local alt4 = Players:FindFirstChild(getgenv().Alts.alt4)
local alt5 = Players:FindFirstChild(getgenv().Alts.alt5)
local alt6 = Players:FindFirstChild(getgenv().Alts.alt6)
local alt7 = Players:FindFirstChild(getgenv().Alts.alt7)
local alt8 = Players:FindFirstChild(getgenv().Alts.alt8)
local alt9 = Players:FindFirstChild(getgenv().Alts.alt9)
local alt10 = Players:FindFirstChild(getgenv().Alts.alt10)

local alt1currency = alt1:WaitForChild("DataFolder").Currency
local alt2currency = alt2:WaitForChild("DataFolder").Currency
local alt3currency = alt3:WaitForChild("DataFolder").Currency
local alt4currency = alt4:WaitForChild("DataFolder").Currency
local alt5currency = alt5:WaitForChild("DataFolder").Currency
local alt6currency = alt6:WaitForChild("DataFolder").Currency
local alt7currency = alt7:WaitForChild("DataFolder").Currency
local alt8currency = alt8:WaitForChild("DataFolder").Currency
local alt9currency = alt9:WaitForChild("DataFolder").Currency
local alt10currency = alt10:WaitForChild("DataFolder").Currency

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

while true do
    local totalStock = alt1currency.Value + alt2currency.Value + alt3currency.Value + alt4currency.Value + alt5currency.Value + alt6currency.Value + alt7currency.Value + alt8currency.Value + alt9currency.Value + alt10currency.Value
    Stock.Text = formatNumber(totalStock) .. "$"
    wait(1)
end
