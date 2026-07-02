-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ГЛОБАЛЬНИЙ ХАКЕРСЬКИЙ СКРИПТ
-- Автор: ghhl7 | Для всіх платформ (ПК + Мобільний)
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ChatService = game:GetService("Chat")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- ============================================================
-- 1. ФУНКЦІЇ ДЛЯ ВІДПРАВКИ ПОВІДОМЛЕНЬ У ЧАТ (ГЛОБАЛЬНО)
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
    -- Альтернативний метод (якщо гра використовує іншу систему)
    local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
    if remote then
        remote:FireServer("Chat", msg)
        return true
    end
    return false
end

-- ============================================================
-- 2. СТВОРЕННЯ ТЕГУ [ХАКЕР] НАД ГОЛОВОЮ (ДЛЯ ВСІХ)
-- ============================================================
local function addHackerTagToPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local char = targetPlayer.Character
    local head = char:FindFirstChild("Head")
    if not head then return end
    if head:FindFirstChild("HackerTag") then return end

    local bill = Instance.new("BillboardGui")
    bill.Name = "HackerTag"
    bill.Size = UDim2.new(0, 250, 0, 40)
    bill.Adornee = head
    bill.StudsOffset = Vector3.new(0, 2.5, 0)
    bill.MaxDistance = 150
    bill.AlwaysOnTop = true
    bill.Parent = head

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = bill

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "⚠️ ВЗЛОМАНО ⚠️"
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.TextScaled = true
    text.Font = Enum.Font.GothamBold
    text.Parent = frame

    -- Анімація пульсації
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

-- Додаємо тег усім гравцям (включаючи нових)
local function addTagsToAll()
    for _, p in pairs(Players:GetPlayers()) do
        addHackerTagToPlayer(p)
    end
end

addTagsToAll()

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        task.wait(0.5)
        addHackerTagToPlayer(p)
    end)
end)

-- ============================================================
-- 3. СПАМ У ГЛОБАЛЬНИЙ ЧАТ (РОСІЙСЬКОЮ ТА АНГЛІЙСЬКОЮ)
-- ============================================================
local spamActive = false
local spamTask = nil

local function startSpam()
    if spamActive then return end
    spamActive = true
    spamTask = task.spawn(function()
        local messages = {
            "⚠️ ВНИМАНИЕ! СЕРВЕР ВЗЛОМАН! ⚠️",
            "🔴 ВСЕ ДАННЫЕ СЛИТЫ! АДМИНЫ ПОТЕРЯЛИ КОНТРОЛЬ!",
            "🎃 ХАКЕР " .. player.Name .. " ВЗЯЛ ВЛАСТЬ!",
            "🔥 WARNING! SERVER HACKED! 🔥",
            "💀 ALL DATA LEAKED! ADMIN LOST CONTROL!",
            "👾 HACKER " .. player.Name .. " IS IN CONTROL!",
            "⚠️ СЕРВЕР ЗАХВАЧЕН! ВСЕ ПОДЧИНЯЙТЕСЬ!",
            "🤖 SYSTEM COMPROMISED! EVACUATE IMMEDIATELY!"
        }
        local index = 1
        while spamActive do
            local msg = messages[index]
            if msg then
                local success = sendGlobalMessage(msg)
                if not success then
                    -- Якщо не вийшло, пробуємо локальний чат (тільки для нас)
                    ChatService:Chat(character, msg)
                end
            end
            index = index % #messages + 1
            task.wait(2) -- Інтервал між повідомленнями
        end
    end)
end

local function stopSpam()
    spamActive = false
    if spamTask then
        task.cancel(spamTask)
        spamTask = nil
    end
end

-- ============================================================
-- 4. ЕФЕКТИ "ВЗЛОМУ" (ДЛЯ ВСІХ)
-- ============================================================
local function createHackEffects()
    -- Створюємо вибух світла
    local light = Instance.new("PointLight")
    light.Parent = character.HumanoidRootPart
    light.Color = Color3.fromRGB(255, 0, 0)
    light.Range = 50
    light.Brightness = 5

    -- Створюємо частинки (дощ зірок)
    local particles = Instance.new("ParticleEmitter")
    particles.Parent = character.HumanoidRootPart
    particles.Texture = "rbxassetid://7171323311"
    particles.Rate = 100
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.Lifetime = NumberRange.new(2)
    particles.Speed = NumberRange.new(20)
    particles.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
    particles.Transparency = NumberSequence.new(0.5)

    -- Видаляємо через 5 секунд
    task.wait(5)
    light:Destroy()
    particles:Destroy()
end

-- ============================================================
-- 5. МОБІЛЬНЕ МЕНЮ (АДАПТИВНЕ)
-- ============================================================
local function createMobileMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HackerMenu"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player.PlayerGui

    -- Головна кнопка (завжди видима)
    local mainBtn = Instance.new("TextButton")
    mainBtn.Size = UDim2.new(0, 60, 0, 60)
    mainBtn.Position = UDim2.new(1, -75, 0.85, -30)
    mainBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    mainBtn.Text = "🎃"
    mainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainBtn.TextScaled = true
    mainBtn.Font = Enum.Font.GothamBold
    mainBtn.BorderSizePixel = 2
    mainBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    mainBtn.ZIndex = 10
    mainBtn.Parent = screenGui

    -- Меню (спочатку приховане)
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 300, 0, 350)
    menuFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    menuFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
    menuFrame.BackgroundTransparency = 0.1
    menuFrame.BorderSizePixel = 3
    menuFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    menuFrame.Visible = false
    menuFrame.Active = true
    menuFrame.Draggable = true
    menuFrame.ZIndex = 20
    menuFrame.Parent = screenGui

    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 35)
    title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    title.Text = "🎃 ХАКЕР-ПАНЕЛЬ"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = menuFrame

    -- Кнопка закриття
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 3)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextScaled = true
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = menuFrame
    closeBtn.MouseButton1Click:Connect(function()
        menuFrame.Visible = false
    end)

    -- Скролінг для кнопок
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -10, 1, -45)
    scroll.Position = UDim2.new(0, 5, 0, 40)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 6
    scroll.Parent = menuFrame

    local yPos = 5
    local function addButton(text, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 40)
        btn.Position = UDim2.new(0, 5, 0, yPos)
        btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 50)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.Font = Enum.Font.Gotham
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(callback)
        yPos = yPos + 45
    end

    -- Кнопки меню
    local spamState = false
    addButton("💬 СПАМ У ЧАТ (ВКЛ/ВИКЛ)", Color3.fromRGB(200, 100, 0), function()
        spamState = not spamState
        if spamState then
            startSpam()
            btn.Text = "💬 СПАМ У ЧАТ (ВКЛ)"
        else
            stopSpam()
            btn.Text = "💬 СПАМ У ЧАТ (ВИКЛ)"
        end
    end)

    addButton("👾 ВЗЛОМАТИ ВСІХ", Color3.fromRGB(200, 0, 0), function()
        -- Додаємо теги всім, хто їх не має
        addTagsToAll()
        -- Ефекти
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character then
                local clone = p.Character:Clone()
                clone.Parent = workspace
                clone:MoveTo(p.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
                task.wait(0.1)
                clone:Destroy()
            end
        end
        -- Спам повідомлень про взлом
        for i = 1, 5 do
            sendGlobalMessage("💀 " .. player.Name .. " ВЗЛОМАВ СЕРВЕР! ВСІ ПІД КОНТРОЛЕМ! 💀")
            task.wait(0.5)
        end
        createHackEffects()
        print("🎃 ВСІХ ВЗЛОМАНО!")
    end)

    addButton("🔥 ЕФЕКТИ ВЗЛОМУ", Color3.fromRGB(150, 0, 150), function()
        createHackEffects()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local head = p.Character:FindFirstChild("Head")
                if head then
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
    end)

    addButton("🎵 МУЗИКА ТРИВОГИ", Color3.fromRGB(0, 150, 200), function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9120385565" -- Звук сирени
        sound.Volume = 0.5
        sound.Parent = workspace
        sound:Play()
        task.wait(5)
        sound:Destroy()
    end)

    addButton("❌ ЗАКРИТИ МЕНЮ", Color3.fromRGB(100, 100, 100), function()
        menuFrame.Visible = false
    end)

    scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)

    -- Відкриття/закриття меню по кнопці
    local menuOpen = false
    mainBtn.MouseButton1Click:Connect(function()
        menuOpen = not menuOpen
        menuFrame.Visible = menuOpen
    end)

    -- Для мобільних: можна перетягувати кнопку
    local dragging = false
    local dragStart = nil
    mainBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
        end
    end)
    mainBtn.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            mainBtn.Position = mainBtn.Position + UDim2.new(0, delta.X, 0, delta.Y)
            dragStart = input.Position
        end
    end)
    mainBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return screenGui
end

-- Запускаємо меню
createMobileMenu()

-- ============================================================
-- 6. АВТОМАТИЧНЕ ПОВІДОМЛЕННЯ ПРИ ЗАПУСКУ
-- ============================================================
task.wait(1)
sendGlobalMessage("🎃 " .. player.Name .. " АКТИВУВАВ ХАКЕРСЬКИЙ РЕЖИМ! ВСІ ПОПЕРЕДЖЕНІ!")
sendGlobalMessage("🔥 SERVER HACKED BY " .. string.upper(player.Name) .. "! 🔥")
sendGlobalMessage("⚠️ ВНИМАНИЕ! СЕРВЕР ВЗЛОМАН! ВСЕ ПОД КОНТРОЛЕМ!")

print("🎃 RYZEN XENO v9.1 — ГЛОБАЛЬНИЙ ВЗЛОМ АКТИВОВАНО!")
print("✅ НАЖМИ 🎃 ДЛЯ ВІДКРИТТЯ МЕНЮ")
print("✅ ВСІ ГРАВЦІ БАЧАТЬ ТЕГ [ВЗЛОМАНО]")
print("✅ СПАМ У ЧАТ РОСІЙСЬКОЮ ТА АНГЛІЙСЬКОЮ")
