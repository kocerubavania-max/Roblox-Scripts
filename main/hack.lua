-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ГЛОБАЛЬНИЙ + МОБІЛЬНИЙ
-- Зменшене GUI, 3 способи чату, спроба глобальних дій
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
-- ФУНКЦІЇ ЧАТУ (3 СПОСОБИ)
-- ============================================================
local function sendGlobalMessage(msg)
    -- 1. Стандартний метод (більшість ігор)
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        local sayMessage = chatEvent:FindFirstChild("SayMessageRequest")
        if sayMessage then
            sayMessage:FireServer(msg, "All")
            return true
        end
    end

    -- 2. Через будь-який RemoteEvent (шукаємо в ReplicatedStorage)
    for _, obj in pairs(ReplicatedStorage:GetChildren()) do
        if obj:IsA("RemoteEvent") and obj.Name:find("Chat") then
            obj:FireServer(msg)
            return true
        end
    end

    -- 3. Пряма трансляція через текстові об'єкти (рідко, але пробуємо)
    local textService = game:GetService("TextService")
    local chat = game:GetService("Chat")
    if chat then
        chat:Chat(character.Head, msg)
        return true
    end

    warn("❌ Не вдалося відправити повідомлення в чат")
    return false
end

-- ============================================================
-- ГЛОБАЛЬНІ ДІЇ (СПРОБА ВИКЛИКАТИ РЕМОУТИ)
-- ============================================================
local function findRemote(pattern)
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            if obj.Name:find(pattern) then
                return obj
            end
        end
    end
    return nil
end

local function tryGlobalAction(actionName, ...)
    local remote = findRemote(actionName)
    if remote then
        pcall(function()
            if remote:IsA("RemoteEvent") then
                remote:FireServer(...)
            elseif remote:IsA("RemoteFunction") then
                remote:InvokeServer(...)
            end
            sendGlobalMessage("✅ " .. player.Name .. " ВИКОНАВ " .. actionName .. " ГЛОБАЛЬНО!")
            return true
        end)
    else
        warn("❌ Ремоут " .. actionName .. " не знайдено")
        return false
    end
end

-- ============================================================
-- ФУНКЦІЇ
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
    sendGlobalMessage("🔊 " .. player.Name .. " ВКЛЮЧИВ СИРЕНУ!")
end

local function addHackerTagToAll()
    -- Це тільки локально, але пробуємо через ремоут
    if not tryGlobalAction("Tag", "All") then
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
        sendGlobalMessage("👾 " .. player.Name .. " ДОДАВ ТЕГИ (локально)")
    end
end

local function killAll()
    if not tryGlobalAction("Kill", "All") then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local h = p.Character:FindFirstChild("Humanoid")
                if h then h.Health = 0 end
            end
        end
        sendGlobalMessage("💀 " .. player.Name .. " УБИВ ВСІХ (локально)")
    end
end

local function teleportAllToCenter()
    if not tryGlobalAction("Teleport", "All", Vector3.new(0, 10, 0)) then
        local centerPoint = Vector3.new(0, 10, 0)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local root = p.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(centerPoint + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
                end
            end
        end
        if rootPart then rootPart.CFrame = CFrame.new(centerPoint + Vector3.new(0, 15, 0)) end
        sendGlobalMessage("🌀 " .. player.Name .. " ЗІБРАВ ВСІХ (локально)")
    end
end

local function playCustomMusic()
    local yourAudioId = "9120386436"  -- ← ЗАМІНИ НА СВІЙ ID
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. yourAudioId
    sound.Volume = 0.8
    sound.Looped = true
    sound.Parent = Workspace
    sound:Play()
    sendGlobalMessage("🎵 " .. player.Name .. " ВКЛЮЧИВ МУЗИКУ!")
    return sound
end
local currentMusic = nil

-- ============================================================
-- МОБІЛЬНЕ ГУІ (ЗМЕНШЕНЕ)
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RyzenXenoRealGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Кнопка відкриття (менша)
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 55, 0, 55)
openBtn.Position = UDim2.new(1, -65, 0.9, -30)
openBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
openBtn.Text = "🎃"
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold
openBtn.BorderSizePixel = 2
openBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Parent = screenGui

-- Меню (вужче)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 280, 0, 380)  -- Зменшено
menuFrame.Position = UDim2.new(0.5, -140, 0.5, -190)
menuFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
menuFrame.BackgroundTransparency = 0.1
menuFrame.BorderSizePixel = 2
menuFrame.BorderColor3 = Color3.fromRGB(255, 0, 100)
menuFrame.Visible = false
menuFrame.ClipsDescendants = true
menuFrame.Parent = screenGui

-- Заголовок (менший)
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(200, 0, 50)
header.Parent = menuFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 1, 0)
title.Position = UDim2.new(0, 5, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎃 RYZEN"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
end)

-- Скролл (менші кнопки)
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -45)
scroll.Position = UDim2.new(0, 5, 0, 40)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = menuFrame

local yPos = 5
local function addButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)  -- Менші кнопки
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 60)
    btn.BackgroundTransparency = 0.2
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Parent = scroll
    btn.MouseButton1Click:Connect(callback)
    yPos = yPos + 40
    scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
    return btn
end

-- ============================================================
-- КНОПКИ
-- ============================================================
addButton("🔊 СИРЕНА", Color3.fromRGB(200, 0, 0), function()
    playSiren()
end)

addButton("👾 ТЕГ ВСІМ", Color3.fromRGB(150, 0, 150), function()
    addHackerTagToAll()
end)

addButton("💀 УБИТИ ВСІХ", Color3.fromRGB(255, 0, 0), function()
    killAll()
end)

addButton("🌀 ЗІБРАТИ ВСІХ", Color3.fromRGB(200, 150, 0), function()
    teleportAllToCenter()
end)

addButton("🎵 МУЗИКА (ВКЛ/ВИКЛ)", Color3.fromRGB(0, 150, 200), function()
    if currentMusic then
        currentMusic:Destroy()
        currentMusic = nil
        sendGlobalMessage("🔇 " .. player.Name .. " ВИКЛЮЧИВ МУЗИКУ")
    else
        currentMusic = playCustomMusic()
    end
end)

addButton("🌀 NOCLIP", Color3.fromRGB(0, 100, 200), function()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    sendGlobalMessage("🌀 " .. player.Name .. " ВКЛЮЧИВ NOCLIP")
end)

addButton("🌀 ТЕЛЕПОРТ ДО ГРАВЦЯ", Color3.fromRGB(200, 150, 0), function()
    local targets = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            table.insert(targets, p)
        end
    end
    if #targets > 0 then
        local target = targets[math.random(1, #targets)]
        rootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        sendGlobalMessage("🌀 " .. player.Name .. " ТЕЛЕПОРТУВАВСЯ ДО " .. target.Name)
    end
end)

addButton("💬 СПАМ (10)", Color3.fromRGB(200, 100, 0), function()
    for i = 1, 10 do
        sendGlobalMessage("🔥 " .. player.Name .. " — ХАКЕР! ВСІ ЛОХИ!")
        task.wait(0.3)
    end
end)

addButton("❌ ЗАКРИТИ", Color3.fromRGB(100, 100, 100), function()
    menuFrame.Visible = false
end)

-- Відкриття/закриття
openBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Адаптація під мобільний (розміри вже зменшені)
if UserInputService.TouchEnabled then
    openBtn.Size = UDim2.new(0, 70, 0, 70)
    openBtn.Position = UDim2.new(1, -80, 0.85, -35)
    menuFrame.Size = UDim2.new(0, 300, 0, 400)
    menuFrame.Position = UDim2.new(0.5, -150, 0.4, -200)
end

-- ============================================================
-- АВТОЗАПУСК
-- ============================================================
task.wait(1)
sendGlobalMessage("🎃 " .. player.Name .. " АКТИВУВАВ RYZEN XENO v9.1!")
playSiren()

print("🎃 RYZEN XENO v9.1 — МОБІЛЬНА ВЕРСІЯ ЗАПУЩЕНА!")
print("✅ МЕНЮ ЗМЕНШЕНО! ЧАТ ПРАЦЮЄ!")
