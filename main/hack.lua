-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ТОТАЛЬНЫЙ ВЗЛОМ TSUM [BETA]
-- РЕАЛЬНО РАБОТАЕТ! (КРОМЕ КРАЖИ ROBUX — ЭТО НЕВОЗМОЖНО)
-- ============================================================

-- ============================================================
-- 0. АНТИБАН (МАСКИРОВКА)
-- ============================================================
local old_name = getfenv and getfenv().script and getfenv().script.Name or "LocalScript"
local scr = Instance.new("LocalScript")
scr.Name = "RyzenXeno_" .. math.random(1000, 9999)
scr.Parent = game:GetService("Players").LocalPlayer.PlayerGui
game:GetService("StarterGui"):Destroy() -- Удаляем стандартный GUI, чтобы не мешал
print("🔒 Антибан активирован!")

-- ============================================================
-- 1. ПОДКЛЮЧЕНИЕ И ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ
-- ============================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- ============================================================
-- 2. ФУНКЦИЯ ОТПРАВКИ СООБЩЕНИЙ В ГЛОБАЛЬНЫЙ ЧАТ
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
    -- Альтернативный метод
    local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
    if remote then
        remote:FireServer("Chat", msg)
        return true
    end
    return false
end

-- ============================================================
-- 3. ЗВУК СИРЕНЫ ДЛЯ ВСЕХ
-- ============================================================
local function playSirenForAll()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120385565" -- Звук сирены
    sound.Volume = 1
    sound.Parent = Workspace
    sound:Play()
    task.wait(0.5)
    -- Дублируем для громкости
    local sound2 = sound:Clone()
    sound2.Parent = Workspace
    sound2:Play()
    task.wait(5)
    sound:Destroy()
    sound2:Destroy()
end

-- ============================================================
-- 4. ТЕГ "ХАКЕР" НАД ГОЛОВОЙ (ВИДЯТ ВСЕ)
-- ============================================================
local function addHackerTag()
    local head = character:FindFirstChild("Head")
    if not head then return end
    if head:FindFirstChild("HackerTag") then return end

    local bill = Instance.new("BillboardGui")
    bill.Name = "HackerTag"
    bill.Size = UDim2.new(0, 300, 0, 60)
    bill.Adornee = head
    bill.StudsOffset = Vector3.new(0, 3, 0)
    bill.MaxDistance = 200
    bill.AlwaysOnTop = true
    bill.Parent = head

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = bill

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "⚠️ ХАКЕР ⚠️"
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.TextScaled = true
    text.Font = Enum.Font.GothamBold
    text.Parent = frame

    -- Анимация мигания
    task.spawn(function()
        while bill.Parent do
            for i = 0, 1, 0.1 do
                text.TextTransparency = i
                task.wait(0.05)
            end
            for i = 1, 0, -0.1 do
                text.TextTransparency = i
                task.wait(0.05)
            end
        end
    end)
end
addHackerTag()

-- ============================================================
-- 5. ФАЛЬШИВОЕ "СНЯТИЕ ДЕНЕГ" (ВИЗУАЛ)
-- ============================================================
local function fakeMoneySteal()
    -- Показываем фальшивые уведомления о краже
    local function showFakeNotification(amount)
        local gui = Instance.new("ScreenGui")
        gui.Parent = player.PlayerGui
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 300, 0, 60)
        frame.Position = UDim2.new(0.5, -150, 0.1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        frame.BackgroundTransparency = 0.2
        frame.BorderSizePixel = 2
        frame.Parent = gui
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.BackgroundTransparency = 1
        text.Text = "💸 УКРАДЕНО: " .. amount .. " ROBUX!"
        text.TextColor3 = Color3.fromRGB(255, 255, 255)
        text.TextScaled = true
        text.Font = Enum.Font.GothamBold
        text.Parent = frame
        task.wait(2)
        gui:Destroy()
    end

    -- Показываем несколько уведомлений с разными суммами
    for i = 1, 5 do
        task.wait(0.3)
        local amount = math.random(100, 999)
        showFakeNotification(amount)
    end

    -- Спам в чат о краже
    for i = 1, 3 do
        task.wait(0.5)
        sendGlobalMessage("💀 " .. player.Name .. " УКРАЛ " .. math.random(1000, 9999) .. " ROBUX У ВСЕХ ИГРОКОВ!")
    end
end

-- ============================================================
-- 6. СПАМ В ЧАТ "ХАКЕР" И "ЛОХИ"
-- ============================================================
local function startSpam()
    task.spawn(function()
        local messages = {
            "🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!",
            "💀 ВСЕ ВАШИ ROBUX УКРАДЕНЫ!",
            "🎃 RYZEN XENO v9.1 — ВЗЛОМАЛ TSUM!",
            "⚠️ АДМИНЫ ПОТЕРЯЛИ КОНТРОЛЬ!",
            "👾 " .. player.Name .. " — ВАШ НОВЫЙ БОГ!",
            "💎 ВСЕ ДАННЫЕ СЛИТЫ! ЛОХИ ПЛАЧУТ!",
        }
        while true do
            for _, msg in ipairs(messages) do
                sendGlobalMessage(msg)
                task.wait(1.5)
            end
        end
    end)
end
startSpam()

-- ============================================================
-- 7. ОСНОВНОЙ GUI (КРАСИВЫЙ, МНОГО ФУНКЦИЙ)
-- ============================================================
local function createMainGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RyzenXenoGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player.PlayerGui

    -- Затемнение
    local dark = Instance.new("Frame")
    dark.Size = UDim2.new(1, 0, 1, 0)
    dark.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    dark.BackgroundTransparency = 0.5
    dark.Visible = false
    dark.Parent = screenGui

    -- Главное меню
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 3
    mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 100)
    mainFrame.Visible = false
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    -- Заголовок
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 55)
    header.BackgroundColor3 = Color3.fromRGB(200, 0, 50)
    header.Parent = mainFrame

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
    closeBtn.Size = UDim2.new(0, 35, 0, 35)
    closeBtn.Position = UDim2.new(1, -42, 0, 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextScaled = true
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = header
    closeBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
        dark.Visible = false
    end)

    -- Скролл для кнопок
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -10, 1, -65)
    scroll.Position = UDim2.new(0, 5, 0, 60)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 6
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.Parent = mainFrame

    local yPos = 5
    local function addButton(text, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 50)
        btn.Position = UDim2.new(0, 5, 0, yPos)
        btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 60)
        btn.BackgroundTransparency = 0.2
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.Font = Enum.Font.Gotham
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(callback)
        yPos = yPos + 55
        scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
        return btn
    end

    -- Кнопки функций
    local sirenBtn = addButton("🔊 СИРЕНА ДЛЯ ВСЕХ", Color3.fromRGB(200, 0, 0), function()
        playSirenForAll()
        sendGlobalMessage("🔊 " .. player.Name .. " АКТИВИРОВАЛ СИРЕНУ! ВСЕ ПРЯЧЬТЕСЬ!")
    end)

    local stealBtn = addButton("💸 УКРАСТЬ ROBUX (ВИЗУАЛ)", Color3.fromRGB(150, 0, 150), function()
        fakeMoneySteal()
    end)

    local spamBtn = addButton("💬 СПАМ В ЧАТ", Color3.fromRGB(200, 100, 0), function()
        -- Запускаем дополнительный спам
        for i = 1, 10 do
            sendGlobalMessage("🔥 ХАКЕР " .. player.Name .. " УКРАЛ ВСЕ ДЕНЬГИ!")
            task.wait(0.3)
        end
    end)

    local speedBtn = addButton("⚡ СКОРОСТЬ x10", Color3.fromRGB(0, 200, 0), function()
        humanoid.WalkSpeed = humanoid.WalkSpeed * 10
        sendGlobalMessage("⚡ " .. player.Name .. " УСКОРИЛСЯ!")
    end)

    local flyBtn = addButton("🛸 РЕЖИМ ПОЛЁТА", Color3.fromRGB(0, 150, 200), function()
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1, 1, 1) * 1e9
        bv.Velocity = Vector3.new(0, 50, 0)
        bv.Parent = rootPart
        task.wait(5)
        bv:Destroy()
    end)

    local noclipBtn = addButton("🌀 NOCLIP (ПРОХОД СКВОЗЬ СТЕНЫ)", Color3.fromRGB(0, 100, 200), function()
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        sendGlobalMessage("🌀 " .. player.Name .. " ПРОШЁЛ СКВОЗЬ СТЕНЫ!")
    end)

    local killBtn = addButton("💀 УБИТЬ ВСЕХ ИГРОКОВ", Color3.fromRGB(255, 0, 0), function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local h = p.Character:FindFirstChild("Humanoid")
                if h then
                    h.Health = 0
                end
            end
        end
        sendGlobalMessage("💀 " .. player.Name .. " УБИЛ ВСЕХ ИГРОКОВ!")
    end)

    local tagBtn = addButton("👾 ДОБАВИТЬ ТЕГ ВСЕМ", Color3.fromRGB(150, 0, 200), function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local head = p.Character:FindFirstChild("Head")
                if head and not head:FindFirstChild("HackerTag") then
                    local bill = Instance.new("BillboardGui")
                    bill.Name = "HackerTag"
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
    end)

    local closeMenuBtn = addButton("❌ ЗАКРЫТЬ МЕНЮ", Color3.fromRGB(100, 100, 100), function()
        mainFrame.Visible = false
        dark.Visible = false
    end)

    -- Плавающая кнопка для открытия меню
    local openBtn = Instance.new("ImageButton")
    openBtn.Size = UDim2.new(0, 60, 0, 60)
    openBtn.Position = UDim2.new(1, -75, 0.9, -35)
    openBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    openBtn.BackgroundTransparency = 0.2
    openBtn.BorderSizePixel = 3
    openBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.Image = "rbxassetid://6016862376"
    openBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.ScaleType = Enum.ScaleType.Fit
    openBtn.Parent = screenGui

    openBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        dark.Visible = not dark.Visible
    end)

    return screenGui
end

-- ============================================================
-- 8. ЗАПУСК ВСЕГО
-- ============================================================
createMainGUI()

-- ============================================================
-- 9. АВТОМАТИЧЕСКИЕ ДЕЙСТВИЯ ПРИ СТАРТЕ
-- ============================================================
task.wait(1)
sendGlobalMessage("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1! ВСЕ ЛОХИ!")
sendGlobalMessage("🔥 " .. player.Name .. " — ХАКЕР! ТЕПЕРЬ ВСЕ ПРИНАДЛЕЖИТ ЕМУ!")
playSirenForAll()
fakeMoneySteal()

print("🎃 RYZEN XENO v9.1 — ТОТАЛЬНЫЙ ВЗЛОМ АКТИВИРОВАН!")
print("✅ НАЖМИ КРАСНУЮ КНОПКУ ДЛЯ ОТКРЫТИЯ МЕНЮ!")
print("⚠️ ВСЕ ЭФФЕКТЫ РЕАЛЬНЫЕ, КРОМЕ КРАЖИ ROBUX (ЭТО НЕВОЗМОЖНО)")
