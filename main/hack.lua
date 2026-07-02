-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ОБНОВЛЁННЫЙ
-- Убрана скорость, полёт -> СБОР ВСЕХ ИГРОКОВ
-- Добавлен МУЗЫКАЛЬНЫЙ ПЛЕЕР с твоим треком
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- ============================================================
-- ФУНКЦИЯ ОТПРАВКИ СООБЩЕНИЙ В ГЛОБАЛЬНЫЙ ЧАТ
-- ============================================================
local function sendGlobalMessage(msg)
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        local sayMessage = chatEvent:FindFirstChild("SayMessageRequest")
        if sayMessage then
            sayMessage:FireServer(msg, "All")
            return true
        end
    end
    local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
    if remote then
        remote:FireServer("Chat", msg)
        return true
    end
    return false
end

-- ============================================================
-- СИРЕНА ДЛЯ ВСЕХ
-- ============================================================
local function playSiren()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120385565"
    sound.Volume = 1
    sound.Parent = Workspace
    sound:Play()
    task.wait(0.3)
    local sound2 = sound:Clone()
    sound2.Parent = Workspace
    sound2:Play()
    task.wait(5)
    sound:Destroy()
    sound2:Destroy()
end

-- ============================================================
-- ТЕГ "ХАКЕР" ВСЕМ ИГРОКАМ
-- ============================================================
local function addHackerTagToAll()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head and not head:FindFirstChild("HackerTag") then
                local bill = Instance.new("BillboardGui")
                bill.Name = "HackerTag"
                bill.Size = UDim2.new(0, 200, 0, 40)
                bill.Adornee = head
                bill.StudsOffset = Vector3.new(0, 3, 0)
                bill.MaxDistance = 150
                bill.AlwaysOnTop = true
                bill.Parent = head
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                frame.BackgroundTransparency = 0.3
                frame.BorderSizePixel = 2
                frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
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
    sendGlobalMessage("👾 " .. player.Name .. " ДОБАВИЛ ТЕГИ ВСЕМ ИГРОКАМ!")
end

-- ============================================================
-- УБИТЬ ВСЕХ ИГРОКОВ
-- ============================================================
local function killAll()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local h = p.Character:FindFirstChild("Humanoid")
            if h then
                h.Health = 0
            end
        end
    end
    sendGlobalMessage("💀 " .. player.Name .. " УБИЛ ВСЕХ ИГРОКОВ!")
end

-- ============================================================
-- 🔥 НОВАЯ ФУНКЦИЯ: ТЕЛЕПОРТ ВСЕХ В ОДНО МЕСТО (ТЫ НАВЕРХУ)
-- ============================================================
local function teleportAllToCenter()
    -- Точка сбора (центр карты)
    local centerPoint = Vector3.new(0, 10, 0)
    
    -- Телепортируем всех игроков в центр
    local playersTeleported = 0
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local char = p.Character
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = CFrame.new(centerPoint + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
                playersTeleported = playersTeleported + 1
            end
        end
    end
    
    -- Ты остаёшься наверху (над ними)
    if rootPart then
        rootPart.CFrame = CFrame.new(centerPoint + Vector3.new(0, 15, 0))
    end
    
    sendGlobalMessage("🌀 " .. player.Name .. " СОБРАЛ ВСЕХ В ОДНОМ МЕСТЕ! Я НАВЕРХУ!")
    sendGlobalMessage("💀 " .. playersTeleported .. " ИГРОКОВ СОБРАНО!")
end

-- ============================================================
-- 🎵 НОВАЯ ФУНКЦИЯ: МУЗЫКАЛЬНЫЙ ПЛЕЕР (ТВОЙ ТРЕК)
-- ============================================================
local function playCustomMusic()
    -- ⚠️ ВСТАВЬ СЮДА СВОЙ AUDIO ID!
    -- Как получить: загрузи звук в Roblox → скопируй ID
    local yourAudioId = "9120386436"  -- ← ЗАМЕНИ НА СВОЙ ID
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. yourAudioId
    sound.Volume = 0.8
    sound.Looped = true  -- Зациклить
    sound.Parent = Workspace
    sound:Play()
    
    sendGlobalMessage("🎵 " .. player.Name .. " ВКЛЮЧИЛ МУЗЫКУ ДЛЯ ВСЕХ!")
    
    -- Кнопка для остановки (в меню)
    return sound
end

local currentMusic = nil

-- ============================================================
-- GUI (ТОЛЬКО РЕАЛЬНЫЕ ФУНКЦИИ)
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RyzenXenoRealGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Плавающая кнопка
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(1, -75, 0.9, -35)
openBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
openBtn.Text = "🎃"
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold
openBtn.BorderSizePixel = 2
openBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Parent = screenGui

-- Меню
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 350, 0, 420)
menuFrame.Position = UDim2.new(0.5, -175, 0.5, -210)
menuFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
menuFrame.BackgroundTransparency = 0.1
menuFrame.BorderSizePixel = 2
menuFrame.BorderColor3 = Color3.fromRGB(255, 0, 100)
menuFrame.Visible = false
menuFrame.ClipsDescendants = true
menuFrame.Parent = screenGui

-- Заголовок
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(200, 0, 50)
header.Parent = menuFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎃 RYZEN XENO v9.1"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 7)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
end)

-- Скролл
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -55)
scroll.Position = UDim2.new(0, 5, 0, 50)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = menuFrame

local yPos = 5
local function addButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 60)
    btn.BackgroundTransparency = 0.2
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Parent = scroll
    btn.MouseButton1Click:Connect(callback)
    yPos = yPos + 50
    scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
    return btn
end

-- ============================================================
-- КНОПКИ (ОБНОВЛЁННЫЕ)
-- ============================================================

-- 1. Сирена
addButton("🔊 СИРЕНА", Color3.fromRGB(200, 0, 0), function()
    playSiren()
    sendGlobalMessage("🔊 " .. player.Name .. " ВКЛЮЧИЛ СИРЕНУ!")
end)

-- 2. Теги всем
addButton("👾 ТЕГ ВСЕМ", Color3.fromRGB(150, 0, 150), function()
    addHackerTagToAll()
end)

-- 3. Убить всех
addButton("💀 УБИТЬ ВСЕХ", Color3.fromRGB(255, 0, 0), function()
    killAll()
end)

-- 4. 🔥 НОВАЯ КНОПКА: Собрать всех в одну точку
addButton("🌀 СОБРАТЬ ВСЕХ", Color3.fromRGB(200, 150, 0), function()
    teleportAllToCenter()
end)

-- 5. 🎵 НОВАЯ КНОПКА: Включить музыку
addButton("🎵 ВКЛЮЧИТЬ ТРЕК", Color3.fromRGB(0, 150, 200), function()
    if currentMusic then
        currentMusic:Destroy()
        currentMusic = nil
        sendGlobalMessage("🔇 " .. player.Name .. " ВЫКЛЮЧИЛ МУЗЫКУ")
    else
        currentMusic = playCustomMusic()
    end
end)

-- 6. Noclip
addButton("🌀 NOCLIP", Color3.fromRGB(0, 100, 200), function()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    sendGlobalMessage("🌀 " .. player.Name .. " ВКЛЮЧИЛ NOCLIP!")
end)

-- 7. Телепорт к игроку
addButton("🌀 ТЕЛЕПОРТ К ИГРОКУ", Color3.fromRGB(200, 150, 0), function()
    local targets = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            table.insert(targets, p)
        end
    end
    if #targets > 0 then
        local target = targets[math.random(1, #targets)]
        rootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        sendGlobalMessage("🌀 " .. player.Name .. " ТЕЛЕПОРТИРОВАЛСЯ К " .. target.Name)
    end
end)

-- 8. Спам в чат
addButton("💬 СПАМ В ЧАТ", Color3.fromRGB(200, 100, 0), function()
    for i = 1, 10 do
        sendGlobalMessage("🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
        task.wait(0.3)
    end
end)

-- 9. Закрыть
addButton("❌ ЗАКРЫТЬ", Color3.fromRGB(100, 100, 100), function()
    menuFrame.Visible = false
end)

-- Открытие/закрытие меню
openBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Адаптация под мобильные
if UserInputService.TouchEnabled then
    openBtn.Size = UDim2.new(0, 80, 0, 80)
    openBtn.Position = UDim2.new(1, -95, 0.85, -40)
    menuFrame.Size = UDim2.new(0, 380, 0, 480)
    menuFrame.Position = UDim2.new(0.5, -190, 0.4, -240)
end

-- ============================================================
-- АВТОЗАПУСК
-- ============================================================
task.wait(1)
sendGlobalMessage("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1!")
playSiren()

print("🎃 RYZEN XENO v9.1 — ОБНОВЛЁН! НАЖМИ КРАСНУЮ КНОПКУ ДЛЯ МЕНЮ.")
print("🔥 НОВЫЕ ФУНКЦИИ: СБОР ВСЕХ + МУЗЫКАЛЬНЫЙ ПЛЕЕР!")
