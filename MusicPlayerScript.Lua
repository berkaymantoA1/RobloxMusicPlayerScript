local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 240)
Frame.Position = UDim2.new(0.5, -150, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Visible = false  -- Başlangıçta görünmez olacak
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundTransparency = 0.5

-- Gradient Arka Plan
local gradient = Instance.new("UIGradient", Frame)
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
})
gradient.Rotation = 45

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "BerkHub Sound V1"
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 0.7
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.TextAlignment = Enum.TextAlignment.Center
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -20, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 40)
TextBox.PlaceholderText = "Enter Music ID"
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 16
TextBox.TextTransparency = 0.7
TextBox.BorderRadius = UDim.new(0, 12)

local PlayButton = Instance.new("TextButton", Frame)
PlayButton.Size = UDim2.new(1, -20, 0, 40)
PlayButton.Position = UDim2.new(0, 10, 0, 80)
PlayButton.Text = "Play Music"
PlayButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
PlayButton.TextColor3 = Color3.new(1, 1, 1)
PlayButton.Font = Enum.Font.SourceSansBold
PlayButton.TextSize = 18
PlayButton.BorderRadius = UDim.new(0, 12)

-- Buton Hover Efekti
PlayButton.MouseEnter:Connect(function()
    PlayButton.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
end)

PlayButton.MouseLeave:Connect(function()
    PlayButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
end)

local StopButton = Instance.new("TextButton", Frame)
StopButton.Size = UDim2.new(1, -20, 0, 40)
StopButton.Position = UDim2.new(0, 10, 0, 130)
StopButton.Text = "Stop Music"
StopButton.BackgroundColor3 = Color3.fromRGB(178, 34, 34)
StopButton.TextColor3 = Color3.new(1, 1, 1)
StopButton.Font = Enum.Font.SourceSansBold
StopButton.TextSize = 18
StopButton.BorderRadius = UDim.new(0, 12)

-- Stop Button Hover Efekti
StopButton.MouseEnter:Connect(function()
    StopButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
end)

StopButton.MouseLeave:Connect(function()
    StopButton.BackgroundColor3 = Color3.fromRGB(178, 34, 34)
end)

local currentSound = nil

PlayButton.MouseButton1Click:Connect(function()
    local id = tonumber(TextBox.Text)
    if id then
        if currentSound then
            currentSound:Destroy()  -- Önceki sesi durdur
        end
        currentSound = Instance.new("Sound", game.Workspace)
        currentSound.SoundId = "rbxassetid://" .. id
        currentSound.Volume = 1
        currentSound.Looped = true
        currentSound:Play()
    end
end)

StopButton.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Stop()
        currentSound:Destroy()
        currentSound = nil
    end
end)

-- BS Butonu için Şık Tasarım
local BSButton = Instance.new("TextButton", ScreenGui)
BSButton.Size = UDim2.new(0, 120, 0, 50)
BSButton.Position = UDim2.new(0.5, -60, 0.5, 40)
BSButton.Text = "BS"
BSButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BSButton.TextColor3 = Color3.fromRGB(0, 0, 0)
BSButton.Font = Enum.Font.SourceSansBold
BSButton.TextSize = 24
BSButton.BorderRadius = UDim.new(0, 12)
BSButton.TextStrokeTransparency = 0.5
BSButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Gradient Arka Plan
local gradient = Instance.new("UIGradient", BSButton)
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 165, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
})
gradient.Rotation = 45

-- BS Butonunun Hover Efekti
BSButton.MouseEnter:Connect(function()
    BSButton.BackgroundTransparency = 0.2
    BSButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Renk beyaz olacak
    BSButton.TextStrokeTransparency = 0.3  -- Metin kenarlık daha belirgin olacak
end)

BSButton.MouseLeave:Connect(function()
    BSButton.BackgroundTransparency = 0
    BSButton.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Metin rengi geri siyah olacak
    BSButton.TextStrokeTransparency = 0.5  -- Metin kenarlık transparan olacak
end)

-- BS Butonu Tıklandığında Frame'i Açma/Kapama
BSButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible  -- Frame görünürlüğünü değiştirir
end)

-- BS Butonu için Animasyonlu Renk Efekti
task.spawn(function()
    while true do
        for hue = 0, 1, 0.01 do
            BSButton.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
            task.wait(0.1)
        end
    end
end)
