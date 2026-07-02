-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ХАКЕРСКИЙ СКРИПТ
-- Все видят твой ник с тегом [ХАКЕР]
-- Доступ ко всем командам
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ChatService = game:GetService("Chat")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- ============================================================
-- 1. ПОКАЗЫВАЕМ ВСЕМ НИК С ТЕГОМ [ХАКЕР]
-- ============================================================
local function addHackerTag()
    -- Создаём BillboardGui над головой
    local tagGui = Instance.new("BillboardGui")
    tagGui.Name = "HackerTag"
    tagGui.Size = UDim2.new(0, 250, 0, 40)
    tagGui.Adornee = character:WaitForChild("Head")
    tagGui.StudsOffset = Vector3.new(0, 2.5, 0)
    tagGui.MaxDistance = 100
    tagGui.AlwaysOnTop = true
    tagGui.Parent = character

    -- Фрейм для тега
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = tagGui

    -- Текст "ХАКЕР"
    local hackerText = Instance.new("TextLabel")
    hackerText.Size = UDim2.new(1, 0, 0.6, 0)
    hackerText.Position = UDim2.new(0, 0, 0, 0)
    hackerText.BackgroundTransparency = 1
    hackerText.Text = "⚠️ ХАКЕР ⚠️"
    hackerText.TextColor3 = Color3.fromRGB(255, 0, 0)
    hackerText.TextScaled = true
    hackerText.Font = Enum.Font.GothamBold
    hackerText.Parent = frame

    -- Ник игрока
    local nameText = Instance.new("TextLabel")
    nameText.Size = UDim2.new(1, 0, 0.4, 0)
    nameText.Position = UDim2.new(0, 0, 0.6, 0)
    nameText.BackgroundTransparency = 1
    nameText.Text = player.Name .. " [ХАКЕР]"
    nameText.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameText.TextScaled = true
    nameText.Font = Enum.Font.Gotham
    nameText.Parent = frame

    -- Анимация свечения
    local glow = Instance.new("UIGradient")
    glow.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    })
    glow.Parent = frame

    print("✅ Тег [ХАКЕР] добавлен! Все видят!")
end

-- Добавляем тег каждому новому персонажу
addHackerTag()

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    wait(0.5)
    addHackerTag()
end)

-- ============================================================
-- 2. ОПОВЕЩЕНИЕ ВСЕХ О ВЗЛОМЕ (ЧАТ)
-- ============================================================
local function sendHackMessage()
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    local sayMessage = chatEvent and chatEvent:FindFirstChild("SayMessageRequest")
    
    if sayMessage then
        local messages = {
            "⚠️ ВНИМАНИЕ! СЕРВЕР ВЗЛОМАН!",
            "🔴 АДМИНИСТРАТОРЫ ПОТЕРЯЛИ КОНТРОЛЬ!",
            "🎃 ХАКЕР " .. player.Name .. " ВЗЯЛ ВЛАСТЬ!",
            "🔥 ВСЕ ДАННЫЕ СЛИТЫ!",
            "💀 ТЕПЕРЬ Я ЗДЕСЬ ГЛАВНЫЙ!",
        }
        for _, msg in ipairs(messages) do
            task.wait(1)
            sayMessage:FireServer(msg, "All")
        end
    else
        -- Альтернатива: локальный чат
        ChatService:Chat(character, "⚠️ СЕРВЕР ВЗЛОМАН! ⚠️")
        print("⚠️ Сообщение только локальное")
    end
end

sendHackMessage()

-- ============================================================
-- 3. ГУИ С АДМИН-КОМАНДАМИ (ДОСТУП КО ВСЕМУ)
-- ============================================================
local function createAdminGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HackerGUI"
    screenGui.Parent = player.PlayerGui

    -- Основное окно
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 450)
    mainFrame.Position = UDim2.new(0, 10, 0.5, -225)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 3
    mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    mainFrame.Visible = false
    mainFrame.Parent = screenGui

    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    title.Text = "🎃 ХАКЕР-ПАНЕЛЬ"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame

    -- Кнопка закрыть
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextScaled = true
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = mainFrame
    closeBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)

    -- Контейнер для кнопок
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -10, 1, -55)
    scroll.Position = UDim2.new(0, 5, 0, 45)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 6
    scroll.Parent = mainFrame

    local yPos = 5
    local commands = {
        {"🔥 Телепорт к игроку", function() 
            local target = Players:GetPlayers()[math.random(2, #Players:GetPlayers())]
            if target and target.Character then
                character:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
            end
        end},
        {"💀 Убить всех", function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = 0
                end
            end
        end},
        {"🔄 Отродить всех", function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = 100
                end
            end
        end},
        {"⚡ Скорость x5", function()
            humanoid.WalkSpeed = humanoid.WalkSpeed * 5
        end},
        {"⚡ Скорость x10", function()
            humanoid.WalkSpeed = humanoid.WalkSpeed * 10
        end},
        {"🛸 Режим полёта", function()
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1, 1, 1) * 1e9
            bv.Velocity = Vector3.new(0, 50, 0)
            bv.Parent = character:WaitForChild("HumanoidRootPart")
        end},
        {"🎯 NoClip", function()
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end},
        {"💣 Взорвать сервер (спам)", function()
            for i = 1, 20 do
                local p = Instance.new("Part")
                p.Size = Vector3.new(5, 5, 5)
                p.Position = Vector3.new(math.random(-100, 100), 50, math.random(-100, 100))
                p.Anchored = true
                p.BrickColor = BrickColor.Random()
                p.Parent = workspace
                task.wait(0.1)
            end
        end},
        {"🌊 Потоп", function()
            local water = Instance.new("Part")
            water.Size = Vector3.new(1000, 10, 1000)
            water.Position = Vector3.new(0, -5, 0)
            water.Material = Enum.Material.Water
            water.Anchored = true
            water.Transparency = 0.5
            water.Parent = workspace
        end},
        {"🧊 Заморозить всех", function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local hum = p.Character:FindFirstChild("Humanoid")
                    if hum then
                        hum.WalkSpeed = 0
                        hum.JumpPower = 0
                    end
                end
            end
        end},
        {"💬 Спам в чат", function()
            local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            local sayMessage = chatEvent and chatEvent:FindFirstChild("SayMessageRequest")
            if sayMessage then
                for i = 1, 30 do
                    sayMessage:FireServer("🔥 ВСЕХ ВЗЛОМАЛ " .. player.Name .. "! 🔥", "All")
                    task.wait(0.2)
                end
            end
        end},
        {"👾 Клонировать себя", function()
            for i = 1, 5 do
                local clone = character:Clone()
                clone.Parent = workspace
                clone:MoveTo(character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10)))
            end
        end},
        {"🎵 Включить музыку", function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://9120385565"
            sound.Volume = 1
            sound.Parent = workspace
            sound:Play()
        end},
    }

    for _, cmd in ipairs(commands) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 35)
        btn.Position = UDim2.new(0, 5, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        btn.Text = cmd[1]
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.Font = Enum.Font.Gotham
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(cmd[2])
        yPos = yPos + 40
    end
    scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)

    -- Кнопка для открытия GUI (на экране)
    local openBtn = Instance.new("TextButton")
    openBtn.Size = UDim2.new(0, 50, 0, 50)
    openBtn.Position = UDim2.new(1, -65, 0.9, -60)
    openBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    openBtn.Text = "🎃"
    openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.TextScaled = true
    openBtn.Font = Enum.Font.GothamBold
    openBtn.BorderSizePixel = 2
    openBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.Parent = screenGui

    openBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)

    print("✅ Хакер-панель создана! Нажми 🎃")
    return screenGui
end

createAdminGUI()

-- ============================================================
-- 4. АВТОМАТИЧЕСКИЙ РЕЖИМ (ВСЕ ВИДЯТ, ЧТО ТЫ ХАКЕР)
-- ============================================================
-- Каждые 10 секунд спамим в чат, что ты хакер
task.spawn(function()
    while true do
        task.wait(10)
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        local sayMessage = chatEvent and chatEvent:FindFirstChild("SayMessageRequest")
        if sayMessage then
            sayMessage:FireServer("⚠️ " .. player.Name .. " — ХАКЕР! СЕРВЕР ВЗЛОМАН! ⚠️", "All")
        end
    end
end)

-- ============================================================
-- 5. ДОПОЛНИТЕЛЬНО: МИГАЮЩИЙ ТЕКСТ "ВЗЛОМАНО" ДЛЯ ВСЕХ
-- ============================================================
-- Создаём BillboardGui над головой каждого игрока с надписью "ВЗЛОМАНО"
task.spawn(function()
    while true do
        task.wait(5)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local head = p.Character:FindFirstChild("Head")
                if head then
                    -- Проверяем, есть ли уже тег
                    local tag = head:FindFirstChild("HackedTag")
                    if not tag then
                        local bill = Instance.new("BillboardGui")
                        bill.Name = "HackedTag"
                        bill.Size = UDim2.new(0, 150, 0, 30)
                        bill.Adornee = head
                        bill.StudsOffset = Vector3.new(0, 3, 0)
                        bill.AlwaysOnTop = true
                        bill.Parent = head

                        local frame = Instance.new("Frame")
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        frame.BackgroundTransparency = 0.5
                        frame.Parent = bill

                        local text = Instance.new("TextLabel")
                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.BackgroundTransparency = 1
                        text.Text = "⚠️ ВЗЛОМАНО ⚠️"
                        text.TextColor3 = Color3.fromRGB(255, 255, 255)
                        text.TextScaled = true
                        text.Font = Enum.Font.GothamBold
                        text.Parent = frame
                    end
                end
            end
        end
    end
end)

print("🎃 RYZEN XENO v9.1 — ХАКЕРСКИЙ РЕЖИМ АКТИВИРОВАН!")
print("✅ ВСЕ ВИДЯТ, ЧТО ТЫ ХАКЕР!")
print("✅ НАЖМИ 🎃 ДЛЯ ОТКРЫТИЯ ПАНЕЛИ КОМАНД!")