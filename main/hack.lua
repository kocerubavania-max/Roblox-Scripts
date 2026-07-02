-- ============================================================
-- 🎃 RYZEN XENO v9.1 — TSUM BETA "ВЗЛОМ"
-- Фальшивый GUI для розыгрыша/развлечения.
-- ВСЕ ЭФФЕКТЫ — ТОЛЬКО ВИЗУАЛЬНЫЕ! НИЧЕГО НЕ ВЗЛАМЫВАЕТСЯ!
-- ============================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- ============================================================
-- 1. СОЗДАНИЕ ЭКРАНА "ВЗЛОМА"
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TsumHackGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Затемнение
local dark = Instance.new("Frame")
dark.Size = UDim2.new(1, 0, 1, 0)
dark.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dark.BackgroundTransparency = 0.7
dark.Parent = screenGui

-- Главное окно
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 300)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
mainFrame.BorderSizePixel = 4
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
title.Text = "🔓 TSUM BETA — ВЗЛОМАНА!"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Текст "Доступ открыт"
local accessText = Instance.new("TextLabel")
accessText.Size = UDim2.new(1, 0, 0, 40)
accessText.Position = UDim2.new(0, 0, 0, 55)
accessText.BackgroundTransparency = 1
accessText.Text = "✅ ДОСТУП ПОЛУЧЕН! ВСЕ ДАННЫЕ РАЗБЛОКИРОВАНЫ!"
accessText.TextColor3 = Color3.fromRGB(0, 255, 100)
accessText.TextScaled = true
accessText.Font = Enum.Font.GothamBold
accessText.Parent = mainFrame

-- Кнопка "Открыть каталог"
local openCatalog = Instance.new("TextButton")
openCatalog.Size = UDim2.new(0, 200, 0, 50)
openCatalog.Position = UDim2.new(0.5, -100, 0.5, -20)
openCatalog.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
openCatalog.Text = "📦 ОТКРЫТЬ КАТАЛОГ"
openCatalog.TextColor3 = Color3.fromRGB(255, 255, 255)
openCatalog.TextScaled = true
openCatalog.Font = Enum.Font.GothamBold
openCatalog.Parent = mainFrame
openCatalog.MouseButton1Click:Connect(function()
    -- Показываем фейковый каталог с бесплатными вещами
    local fakeCatalog = Instance.new("Frame")
    fakeCatalog.Size = UDim2.new(0, 400, 0, 300)
    fakeCatalog.Position = UDim2.new(0.5, -200, 0.5, -150)
    fakeCatalog.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
    fakeCatalog.BorderSizePixel = 3
    fakeCatalog.BorderColor3 = Color3.fromRGB(0, 200, 255)
    fakeCatalog.Parent = screenGui

    local title2 = Instance.new("TextLabel")
    title2.Size = UDim2.new(1, 0, 0, 40)
    title2.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    title2.Text = "🎁 БЕСПЛАТНЫЙ КАТАЛОГ"
    title2.TextColor3 = Color3.fromRGB(255, 255, 255)
    title2.TextScaled = true
    title2.Font = Enum.Font.GothamBold
    title2.Parent = fakeCatalog

    local closeFake = Instance.new("TextButton")
    closeFake.Size = UDim2.new(0, 30, 0, 30)
    closeFake.Position = UDim2.new(1, -35, 0, 5)
    closeFake.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeFake.Text = "✕"
    closeFake.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeFake.TextScaled = true
    closeFake.Font = Enum.Font.GothamBold
    closeFake.Parent = fakeCatalog
    closeFake.MouseButton1Click:Connect(function()
        fakeCatalog:Destroy()
    end)

    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, -10, 1, -50)
    list.Position = UDim2.new(0, 5, 0, 45)
    list.BackgroundTransparency = 1
    list.ScrollBarThickness = 6
    list.Parent = fakeCatalog

    local items = {"🔥 Админка", "🚀 Скорость x100", "💎 Бесконечные Robux", "👑 Корона", "🛡️ Неуязвимость"}
    local y = 5
    for _, item in ipairs(items) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 40)
        btn.Position = UDim2.new(0, 5, 0, y)
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
        btn.Text = item .. " (ПОЛУЧИТЬ)"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.Font = Enum.Font.Gotham
        btn.Parent = list
        btn.MouseButton1Click:Connect(function()
            btn.Text = "✅ ПОЛУЧЕНО!"
            btn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            task.wait(1)
            btn:Destroy()
        end)
        y = y + 45
    end
    list.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end)

-- Кнопка "Закрыть"
local closeHack = Instance.new("TextButton")
closeHack.Size = UDim2.new(0, 120, 0, 40)
closeHack.Position = UDim2.new(0.5, -60, 1, -50)
closeHack.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeHack.Text = "❌ ЗАКРЫТЬ"
closeHack.TextColor3 = Color3.fromRGB(255, 255, 255)
closeHack.TextScaled = true
closeHack.Font = Enum.Font.GothamBold
closeHack.Parent = mainFrame
closeHack.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ============================================================
-- 2. ЭФФЕКТЫ "ВЗЛОМА" (ПУЛЬСАЦИЯ, СПАМ В ЧАТ)
-- ============================================================
-- Отправка сообщений в глобальный чат (фейковый спам)
local function sendGlobalMessage(msg)
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        local sayMessage = chatEvent:FindFirstChild("SayMessageRequest")
        if sayMessage then
            sayMessage:FireServer(msg, "All")
            return true
        end
    end
    return false
end

task.spawn(function()
    local messages = {
        "🔥 TSUM BETA ВЗЛОМАНА! ВСЕ ВЕЩИ БЕСПЛАТНЫ!",
        "🎃 ХАКЕР " .. player.Name .. " ПОЛУЧИЛ ДОСТУП КО ВСЕМУ!",
        "💎 ВСЕ ROBUX РАЗДАЮТСЯ!",
        "⚠️ АДМИНЫ ПОТЕРЯЛИ КОНТРОЛЬ!",
    }
    for i = 1, 3 do
        task.wait(2)
        sendGlobalMessage(messages[i] or "🔓 ДОСТУП ОТКРЫТ!")
    end
end)

-- Пульсация рамки
task.spawn(function()
    while mainFrame.Parent do
        for i = 0, 1, 0.1 do
            mainFrame.BorderColor3 = Color3.fromRGB(255 * (1 - i), 0, 255 * i)
            task.wait(0.05)
        end
        for i = 1, 0, -0.1 do
            mainFrame.BorderColor3 = Color3.fromRGB(255 * (1 - i), 0, 255 * i)
            task.wait(0.05)
        end
    end
end)

-- ============================================================
-- 3. АВТОМАТИЧЕСКОЕ ОТКРЫТИЕ ПРИ ЗАПУСКЕ
-- ============================================================
task.wait(0.5)
print("🎃 TSUM BETA — ФАЛЬШИВЫЙ ВЗЛОМ АКТИВИРОВАН!")
print("🔥 ВСЕ ЭФФЕКТЫ — ТОЛЬКО ВИЗУАЛЬНЫЕ! НИЧЕГО НЕ ВЗЛАМАНО РЕАЛЬНО!")
