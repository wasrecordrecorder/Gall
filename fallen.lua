-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomScrollGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем Frame для ScrollGui
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.25, 0, -0.5, 0)
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.BorderColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 3
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Закругляем края
local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = mainFrame

-- Создаем ScrollFrame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, 0, 0.8, 0)
scrollFrame.Position = UDim2.new(0, 0, 0.1, 0)
scrollFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 10
scrollFrame.Parent = mainFrame

local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = scrollFrame

-- Создаем TextLabel для текста
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.Size = UDim2.new(1, 0, 0.1, 0)
textLabel.Position = UDim2.new(0, 0, 0.9, 0)
textLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
textLabel.BorderSizePixel = 0
textLabel.Text = "[Right Ctrl to open/close]"
textLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextStrokeTransparency = 0.5
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 18
textLabel.Parent = mainFrame

local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = textLabel

-- Создаем TextLabel для текста
local textLabel = Instance.new("TextLabel")
textLabel.Name = "ByText"
textLabel.Size = UDim2.new(0.9, 0, 0.05, 0)
textLabel.Position = UDim2.new(-0.2, 0, 0.02, 0)
textLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
textLabel.BackgroundTransparency = 1 -- Полностью прозрачный фон
textLabel.BorderSizePixel = 0
textLabel.Text = "Created By was_record | Full Free"
textLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextStrokeTransparency = 0.5
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 18
textLabel.Parent = mainFrame

local roundedCorner = Instance.new("UICorner")
roundedCorner.CornerRadius = UDim.new(0.05, 0)
roundedCorner.Parent = textLabel

-- Создаем кнопку Destroy
local destroyButton = Instance.new("TextButton")
destroyButton.Name = "DestroyButton"
destroyButton.Size = UDim2.new(0.1, 0, 0.06, 0)
destroyButton.Position = UDim2.new(0.885, 0, 0.029, 0)
destroyButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
destroyButton.BorderSizePixel = 0
destroyButton.Text = "Destroy"
destroyButton.TextColor3 = Color3.new(1, 1, 1)
destroyButton.Font = Enum.Font.SourceSansBold
destroyButton.TextSize = 18
destroyButton.Parent = mainFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = destroyButton

-- Функция для уничтожения GUI с анимацией
destroyButton.MouseButton1Click:Connect(function()
    mainFrame:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true, function()
        screenGui:Destroy()
    end)
end)

-- Создаем кнопку для включения/выключения ESP
local espButton = Instance.new("TextButton")
espButton.Name = "ESPButton"
espButton.Size = UDim2.new(0.1, 0, 0.06, 0)
espButton.Position = UDim2.new(0.785, 0, 0.029, 0)
espButton.BackgroundColor3 = Color3.new(0, 0.8, 0)
espButton.BorderSizePixel = 0
espButton.Text = "ESP"
espButton.TextColor3 = Color3.new(1, 1, 1)
espButton.Font = Enum.Font.SourceSansBold
espButton.TextSize = 18
espButton.Parent = mainFrame

-- Закругляем края кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = espButton

-- Логика для включения/выключения ESP
local espEnabled = false
local espGuis = {}

local function createEspGui(player)
    local character = player.Character
    if character then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = character:WaitForChild("HumanoidRootPart")
        billboardGui.Size = UDim2.new(0, 100, 0, 100)
        billboardGui.AlwaysOnTop = true

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BorderSizePixel = 3
        if player.Name == "fggfgfggfffg" or player.Name == "was_record" then
            frame.BorderColor3 = Color3.new(0, 0, 1) -- Синий цвет
        else
            frame.BorderColor3 = Color3.new(1, 0, 0) -- Красный цвет
        end
        frame.BackgroundTransparency = 1
        frame.Parent = billboardGui

        billboardGui.Parent = screenGui
        table.insert(espGuis, billboardGui)
    end
end

local function removeEspGui()
    for _, gui in ipairs(espGuis) do
        gui:Destroy()
    end
    espGuis = {}
end

espButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espButton.Text = "ESP ON"
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                createEspGui(player)
            end
        end
    else
        espButton.Text = "ESP OFF"
        removeEspGui()
    end
end)

-- Функция для обновления ESP
local function updateEsp()
    if espEnabled then
        for _, gui in ipairs(espGuis) do
            local player = game.Players:FindFirstChild(gui.Adornee.Parent.Name)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                gui.Adornee = player.Character.HumanoidRootPart
                local frame = gui:FindFirstChildOfClass("Frame")
                if frame then
                    if player.Name == "fggfgfggfffg" or player.Name == "was_record" then
                        frame.BorderColor3 = Color3.new(0, 0, 1) -- Синий цвет
                    else
                        frame.BorderColor3 = Color3.new(1, 0, 0) -- Красный цвет
                    end
                end
            end
        end
    end
end

-- Обновление ESP каждые 0.1 секунды
game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
    if espEnabled then
        updateEsp()
    end
end)

-- Функция для анимации открытия/закрытия
local function toggleGui()
    if mainFrame.Position.Y.Scale == -0.5 then
        mainFrame:TweenPosition(UDim2.new(0.25, 0, 0.25, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    else
        mainFrame:TweenPosition(UDim2.new(0.25, 0, -0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    end
end

-- Обработка нажатия клавиши Right Ctrl
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightControl then
        toggleGui()
    end
end)

-- Функция для перемещения GUI
local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)