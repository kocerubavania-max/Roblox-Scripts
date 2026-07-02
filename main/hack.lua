-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ХАКЕРСЬКИЙ ІНТЕРФЕЙС
-- Тільки ти бачиш це ГУІ! Адаптовано під мобільні пристрої.
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatService = game:GetService("Chat")

local player = Players.LocalPlayer

-- ============================================================
-- 1. СТВОРЕННЯ ГОЛОВНОГО ГУІ
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RyzenHackerGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Задній фон (приглушене затемнення)
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.7
background.Visible = false
background.Parent = screenGui

-- ============================================================
-- 2. ГОЛОВНА КНОПКА (ПЛАВАЮЧА)
-- ============================================================
local mainButton = Instance.new("ImageButton")
mainButton.Size = UDim2.new(0, 70, 0, 70)
mainButton.Position = UDim2.new(1, -85, 0.9, -35)
mainButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mainButton.BackgroundTransparency = 0.2
mainButton.BorderSizePixel = 3
mainButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
mainButton.Image = "rbxassetid://6016862376" -- іконка "гамбургер" або інша
mainButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
mainButton.ScaleType = Enum.ScaleType.Fit
mainButton.Parent = screenGui

-- Ефект пульсації кнопки
task.spawn(function()
    while mainButton.Parent do
        local tween = TweenService:Create(mainButton, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 75, 0, 75)
        })
        tween:Play()
        task.wait(1)
        local tween2 = TweenService:Create(mainButton, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 65, 0, 65)
        })
        tween2:Play()
        task.wait(1)
    end
end)

-- ============================================================
-- 3. ОСНОВНЕ МЕНЮ
-- ============================================================
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 350, 0, 450)
menuFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
menuFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
menuFrame.BackgroundTransparency = 0.1
menuFrame.BorderSizePixel = 2
menuFrame.BorderColor3 = Color3.fromRGB(255, 0, 100)
menuFrame.Visible = false
menuFrame.ClipsDescendants = true
menuFrame.Parent = screenGui

-- Заголовок з градієнтом
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
header.BorderSizePixel = 0
header.Parent = menuFrame

local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, 0, 1, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.Text = "🎃 RYZEN XENO v9.1"
headerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
headerLabel.TextScaled = true
headerLabel.Font = Enum.Font.GothamBold
headerLabel.Parent = header

-- Кнопка закриття (хрестик)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
    background.Visible = false
end)

-- Скроллінг для кнопок
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -60)
scrollFrame.Position = UDim2.new(0, 5, 0, 55)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.Parent = menuFrame

local yPos = 5
local buttonList = {}

-- ============================================================
-- 4. ФУНКЦІЯ ДЛЯ СТВОРЕННЯ КНОПОК
-- ============================================================
local function addButton(text, color, callback, icon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 50)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = color or Color3.fromRGB(25, 25, 45)
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = (icon or "") .. " " .. text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = scrollFrame
    btn.MouseButton1Click:Connect(callback)
    table.insert(buttonList, btn)
    yPos = yPos + 55
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
    return btn
end

-- ============================================================
-- 5. ФУНКЦІЇ ДЛЯ ВІДПРАВКИ ПОВІДОМЛЕНЬ
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
-- 6. ФУНКЦІЇ ДЛЯ ЕФЕКТІВ
-- ============================================================
local function createHackEffects()
    -- Вибух світла
    local light = Instance.new("PointLight")
    light.Parent = player.Character.HumanoidRootPart
    light.Color = Color3.fromRGB(255, 0, 0)
    light.Range = 80
    light.Brightness = 10
    task.wait(0.5)
    light:Destroy()
    
    -- Частинки
    local particles = Instance.new("ParticleEmitter")
    particles.Parent = player.Character.HumanoidRootPart
    particles.Texture = "rbxassetid://7171323311"
    particles.Rate = 200
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.Lifetime = NumberRange.new(3)
    particles.Speed = NumberRange.new(30)
    particles.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
    particles.Transparency = NumberSequence.new(0.5)
    task.wait(2)
    particles:Destroy()
end

-- ============================================================
-- 7. ДОДАЄМО КНОПКИ В МЕНЮ
-- ============================================================
-- Стан спаму
local spamActive = false
local spamTask = nil

local function startSpam()
    if spamActive then return end
    spamActive = true
    spamTask = task.spawn(function()
        local messages = {
            "⚠️ ВНИМАНИЕ! СЕРВЕР ВЗЛОМАН!",
            "🔥 HACKED BY " .. string.upper(player.Name),
            "💀 ALL DATA LEAKED! ADMIN LOST CONTROL!",
            "🎃 RYZEN XENO v9.1 ACTIVE!",
            "👾 " .. player.Name .. " IS IN CONTROL!",
        }
        local i = 1
        while spamActive do
            local msg = messages[i]
            if msg then
                sendGlobalMessage(msg)
            end
            i = i % #messages + 1
            task.wait(1.5)
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

-- Кнопка спаму
local spamBtn = addButton("💬 СПАМ (ВКЛ/ВИКЛ)", Color3.fromRGB(200, 100, 0), function()
    if spamActive then
        stopSpam()
        spamBtn.Text = "💬 СПАМ (ВИКЛ)"
    else
        startSpam()
        spamBtn.Text = "💬 СПАМ (ВКЛ)"
    end
end)

-- Кнопка "Взломать всех"
addButton("👾 ВЗЛОМАТИ ВСІХ", Color3.fromRGB(200, 0, 0), function()
    -- Масовий спам у чат
    for i = 1, 10 do
        sendGlobalMessage("💀 " .. player.Name .. " ВЗЛОМАВ СЕРВЕР! ВСІ ПІД КОНТРОЛЕМ!")
        task.wait(0.3)
    end
    -- Ефекти
    createHackEffects()
    -- Теги на всіх гравцях
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head and not head:FindFirstChild("HackedTag") then
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
end)

-- Кнопка "Ефекти"
addButton("🔥 ЕФЕКТИ ВЗЛОМУ", Color3.fromRGB(150, 0, 150), function()
    createHackEffects()
    -- Додатковий спам
    sendGlobalMessage("🎃 " .. player.Name .. " ВИКОРИСТАВ ХАКЕРСЬКІ ЕФЕКТИ!")
end)

-- Кнопка "Музика"
addButton("🎵 СИРЕНА", Color3.fromRGB(0, 150, 200), function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120385565"
    sound.Volume = 0.5
    sound.Parent = workspace
    sound:Play()
    task.wait(5)
    sound:Destroy()
end)

-- Кнопка "Скорость"
addButton("⚡ СКОРОСТЬ x10", Color3.fromRGB(0, 200, 0), function()
    local hum = player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = hum.WalkSpeed * 10
        sendGlobalMessage("⚡ " .. player.Name .. " УВЕЛИЧИЛ СКОРОСТЬ!")
    end
end)

-- Кнопка "Телепорт к игроку"
addButton("🌀 ТЕЛЕПОРТ К ИГРОКУ", Color3.fromRGB(0, 100, 200), function()
    local targets = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            table.insert(targets, p)
        end
    end
    if #targets > 0 then
        local target = targets[math.random(1, #targets)]
        player.Character:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
        sendGlobalMessage("🌀 " .. player.Name .. " ТЕЛЕПОРТИРОВАЛСЯ К " .. target.Name)
    end
end)

-- Кнопка "Закрити"
addButton("❌ ЗАКРИТИ", Color3.fromRGB(100, 100, 100), function()
    menuFrame.Visible = false
    background.Visible = false
end)

-- ============================================================
-- 8. ВІДКРИТТЯ/ЗАКРИТТЯ МЕНЮ ПО КНОПЦІ
-- ============================================================
local menuOpen = false
mainButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    menuFrame.Visible = menuOpen
    background.Visible = menuOpen
    -- Анімація появи
    if menuOpen then
        menuFrame.BackgroundTransparency = 0.1
        menuFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
        local tween = TweenService:Create(menuFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -175, 0.5, -225)
        })
        tween:Play()
    end
end)

-- ============================================================
-- 9. АДАПТАЦІЯ ПІД МОБІЛЬНІ ПРИСТРОЇ (РОЗМІРИ)
-- ============================================================
local function adaptToMobile()
    local isMobile = UserInputService.TouchEnabled
    if isMobile then
        -- Збільшуємо кнопки для пальців
        for _, btn in pairs(buttonList) do
            btn.Size = UDim2.new(1, -10, 0, 60)
        end
        mainButton.Size = UDim2.new(0, 80, 0, 80)
        mainButton.Position = UDim2.new(1, -95, 0.85, -40)
        menuFrame.Size = UDim2.new(0, 350, 0, 500)
        menuFrame.Position = UDim2.new(0.5, -175, 0.4, -250)
    end
end
adaptToMobile()
UserInputService.TouchEnabledChanged:Connect(adaptToMobile)

-- ============================================================
-- 10. ПРИВІТАЛЬНЕ ПОВІДОМЛЕННЯ
-- ============================================================
task.wait(1)
sendGlobalMessage("🎃 " .. player.Name .. " АКТИВУВАВ RYZEN XENO v9.1! ВСІ ПОПЕРЕДЖЕНІ!")
print("🎃 ГУІ ЗАВАНТАЖЕНО! НАТИСНИ ЧЕРВОНУ КНОПКУ 🎃")

-- ============================================================
-- 11. АВТОМАТИЧНЕ ОНОВЛЕННЯ ТЕГІВ НА НОВИХ ГРАВЦЯХ
-- ============================================================
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        task.wait(1)
        -- Додаємо тег автоматично, якщо він включений (можна зробити через змінну)
    end)
end)
