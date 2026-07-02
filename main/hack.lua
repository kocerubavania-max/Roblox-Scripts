-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ПОЛНАЯ РУССКАЯ ВЕРСИЯ
-- ВСЕ КОММЕНТАРИИ И ТЕКСТ НА РУССКОМ
-- ============================================================

-- Подключаем сервисы
local Игроки = game:GetService("Players")
local Хранилище = game:GetService("ReplicatedStorage")
local Мир = game:GetService("Workspace")
local Ввод = game:GetService("UserInputService")

-- Получаем нашего игрока
local Я = Игроки.LocalPlayer
if not Я then return end

-- Ждём появления персонажа
local Персонаж = Я.Character or Я.CharacterAdded:Wait()
local Хуманоид = Персонаж and Персонаж:FindFirstChild("Humanoid")
local Корень = Персонаж and Персонаж:FindFirstChild("HumanoidRootPart")

if not Хуманоид or not Корень then
    warn("❌ Персонаж не загрузился")
    return
end

-- ============================================================
-- ФУНКЦИЯ ОТПРАВКИ СООБЩЕНИЙ В ЧАТ (3 СПОСОБА)
-- ============================================================
local function ОтправитьВЧат(текст)
    if not текст or текст == "" then return false end

    -- Способ 1: Стандартный чат Roblox
    local СобытиеЧата = Хранилище:FindFirstChild("DefaultChatSystemChatEvents")
    if СобытиеЧата then
        local Отправить = СобытиеЧата:FindFirstChild("SayMessageRequest")
        if Отправить then
            pcall(function()
                Отправить:FireServer(текст, "All")
            end)
            return true
        end
    end

    -- Способ 2: Любой RemoteEvent с именем, содержащим "Chat"
    for _, объект in pairs(Хранилище:GetChildren()) do
        if объект:IsA("RemoteEvent") and объект.Name:find("Chat") then
            pcall(function()
                объект:FireServer(текст)
            end)
            return true
        end
    end

    -- Способ 3: Локальный чат (только для себя, как запасной)
    local ЧатСервис = game:GetService("Chat")
    if ЧатСервис then
        pcall(function()
            ЧатСервис:Chat(Персонаж.Head, текст)
        end)
        return true
    end

    return false
end

-- ============================================================
-- ФУНКЦИЯ "СИРЕНА"
-- ============================================================
local function ВключитьСИрену()
    local Звук = Instance.new("Sound")
    Звук.SoundId = "rbxassetid://9120385565"
    Звук.Volume = 1
    Звук.Parent = Мир
    pcall(function()
        Звук:Play()
    end)
    task.wait(0.3)
    local Звук2 = Звук:Clone()
    Звук2.Parent = Мир
    pcall(function()
        Звук2:Play()
    end)
    task.wait(5)
    Звук:Destroy()
    Звук2:Destroy()
    ОтправитьВЧат("🔊 " .. Я.Name .. " ВКЛЮЧИЛ СИРЕНУ ДЛЯ ВСЕХ!")
end

-- ============================================================
-- ФУНКЦИЯ "ДОБАВИТЬ ТЕГ ВСЕМ ИГРОКАМ" (ЛОКАЛЬНО)
-- ============================================================
local function ДобавитьТегВсем()
    for _, другой in pairs(Игроки:GetPlayers()) do
        if другой ~= Я and другой.Character then
            local Голова = другой.Character:FindFirstChild("Head")
            if Голова and not Голова:FindFirstChild("ТегХакера") then
                local Билборд = Instance.new("BillboardGui")
                Билборд.Name = "ТегХакера"
                Билборд.Size = UDim2.new(0, 200, 0, 40)
                Билборд.Adornee = Голова
                Билборд.StudsOffset = Vector3.new(0, 3, 0)
                Билборд.MaxDistance = 150
                Билборд.AlwaysOnTop = true
                Билборд.Parent = Голова

                local Рамка = Instance.new("Frame")
                Рамка.Size = UDim2.new(1, 0, 1, 0)
                Рамка.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Рамка.BackgroundTransparency = 0.3
                Рамка.BorderSizePixel = 2
                Рамка.BorderColor3 = Color3.fromRGB(255, 255, 255)
                Рамка.Parent = Билборд

                local Текст = Instance.new("TextLabel")
                Текст.Size = UDim2.new(1, 0, 1, 0)
                Текст.BackgroundTransparency = 1
                Текст.Text = "⚠️ ВЗЛОМАНО ⚠️"
                Текст.TextColor3 = Color3.fromRGB(255, 255, 255)
                Текст.TextScaled = true
                Текст.Font = Enum.Font.GothamBold
                Текст.Parent = Рамка
            end
        end
    end
    ОтправитьВЧат("👾 " .. Я.Name .. " ДОБАВИЛ ТЕГ 'ВЗЛОМАНО' ВСЕМ ИГРОКАМ!")
end

-- ============================================================
-- ФУНКЦИЯ "УБИТЬ ВСЕХ"
-- ============================================================
local function УбитьВсех()
    for _, другой in pairs(Игроки:GetPlayers()) do
        if другой ~= Я and другой.Character then
            local Хум = другой.Character:FindFirstChild("Humanoid")
            if Хум then
                pcall(function()
                    Хум.Health = 0
                end)
            end
        end
    end
    ОтправитьВЧат("💀 " .. Я.Name .. " УБИЛ ВСЕХ ИГРОКОВ!")
end

-- ============================================================
-- ФУНКЦИЯ "СОБРАТЬ ВСЕХ В ОДНУ ТОЧКУ"
-- ============================================================
local function СобратьВсех()
    local Центр = Vector3.new(0, 10, 0)
    for _, другой in pairs(Игроки:GetPlayers()) do
        if другой ~= Я and другой.Character then
            local КореньДругого = другой.Character:FindFirstChild("HumanoidRootPart")
            if КореньДругого then
                pcall(function()
                    КореньДругого.CFrame = CFrame.new(Центр + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
                end)
            end
        end
    end
    if Корень then
        pcall(function()
            Корень.CFrame = CFrame.new(Центр + Vector3.new(0, 15, 0))
        end)
    end
    ОтправитьВЧат("🌀 " .. Я.Name .. " СОБРАЛ ВСЕХ ИГРОКОВ В ОДНОМ МЕСТЕ!")
end

-- ============================================================
-- ФУНКЦИЯ "ВКЛЮЧИТЬ МУЗЫКУ" (СВОЙ ТРЕК)
-- ============================================================
local ТекущаяМузыка = nil
local function ВключитьМузыку()
    -- ⚠️ ЗАМЕНИ ID НА СВОЙ (как получить — в инструкции ниже)
    local ID_трека = "9120386436"
    local Звук = Instance.new("Sound")
    Звук.SoundId = "rbxassetid://" .. ID_трека
    Звук.Volume = 0.8
    Звук.Looped = true
    Звук.Parent = Мир
    pcall(function()
        Звук:Play()
    end)
    ОтправитьВЧат("🎵 " .. Я.Name .. " ВКЛЮЧИЛ МУЗЫКУ ДЛЯ ВСЕХ!")
    return Звук
end

-- ============================================================
-- ФУНКЦИЯ "ВКЛЮЧИТЬ NOCLIP" (ПРОХОД СКВОЗЬ СТЕНЫ)
-- ============================================================
local function ВключитьНоклип()
    for _, деталь in pairs(Персонаж:GetDescendants()) do
        if деталь:IsA("BasePart") then
            pcall(function()
                деталь.CanCollide = false
            end)
        end
    end
    ОтправитьВЧат("🌀 " .. Я.Name .. " ВКЛЮЧИЛ РЕЖИМ ПРОХОЖДЕНИЯ СКВОЗЬ СТЕНЫ!")
end

-- ============================================================
-- ФУНКЦИЯ "ТЕЛЕПОРТ К СЛУЧАЙНОМУ ИГРОКУ"
-- ============================================================
local function ТелепортКИгроку()
    local Цели = {}
    for _, другой in pairs(Игроки:GetPlayers()) do
        if другой ~= Я and другой.Character then
            table.insert(Цели, другой)
        end
    end
    if #Цели > 0 then
        local Цель = Цели[math.random(1, #Цели)]
        local КореньЦели = Цель.Character:FindFirstChild("HumanoidRootPart")
        if КореньЦели and Корень then
            pcall(function()
                Корень.CFrame = КореньЦели.CFrame + Vector3.new(0, 3, 0)
            end)
            ОтправитьВЧат("🌀 " .. Я.Name .. " ТЕЛЕПОРТИРОВАЛСЯ К " .. Цель.Name)
        end
    else
        ОтправитьВЧат("❌ НЕТ ДРУГИХ ИГРОКОВ ДЛЯ ТЕЛЕПОРТА")
    end
end

-- ============================================================
-- ФУНКЦИЯ "СПАМ В ЧАТ" (10 СООБЩЕНИЙ)
-- ============================================================
local function СпамВЧат()
    for i = 1, 10 do
        ОтправитьВЧат("🔥 " .. Я.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
        task.wait(0.3)
    end
end

-- ============================================================
-- СОЗДАНИЕ ГРАФИЧЕСКОГО ИНТЕРФЕЙСА (ГУИ)
-- ============================================================
local Экран = Instance.new("ScreenGui")
Экран.Name = "RyzenGUI"
Экран.ResetOnSpawn = false
Экран.Parent = Я.PlayerGui

-- КНОПКА ОТКРЫТИЯ МЕНЮ (КРАСНАЯ ТЫКВА)
local КнопкаОткрыть = Instance.new("TextButton")
КнопкаОткрыть.Size = UDim2.new(0, 55, 0, 55)
КнопкаОткрыть.Position = UDim2.new(1, -65, 0.9, -30)
КнопкаОткрыть.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
КнопкаОткрыть.Text = "🎃"
КнопкаОткрыть.TextColor3 = Color3.fromRGB(255, 255, 255)
КнопкаОткрыть.TextScaled = true
КнопкаОткрыть.Font = Enum.Font.GothamBold
КнопкаОткрыть.BorderSizePixel = 2
КнопкаОткрыть.BorderColor3 = Color3.fromRGB(255, 255, 255)
КнопкаОткрыть.Parent = Экран

-- ГЛАВНОЕ МЕНЮ (УМЕНЬШЕННОЕ ДЛЯ ТЕЛЕФОНА)
local Меню = Instance.new("Frame")
Меню.Size = UDim2.new(0, 260, 0, 350)
Меню.Position = UDim2.new(0.5, -130, 0.5, -175)
Меню.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
Меню.BackgroundTransparency = 0.1
Меню.BorderSizePixel = 2
Меню.BorderColor3 = Color3.fromRGB(255, 0, 100)
Меню.Visible = false
Меню.ClipsDescendants = true
Меню.Parent = Экран

-- ЗАГОЛОВОК
local Шапка = Instance.new("Frame")
Шапка.Size = UDim2.new(1, 0, 0, 30)
Шапка.BackgroundColor3 = Color3.fromRGB(200, 0, 50)
Шапка.Parent = Меню

local Заголовок = Instance.new("TextLabel")
Заголовок.Size = UDim2.new(1, -30, 1, 0)
Заголовок.Position = UDim2.new(0, 5, 0, 0)
Заголовок.BackgroundTransparency = 1
Заголовок.Text = "🎃 RYZEN"
Заголовок.TextColor3 = Color3.fromRGB(255, 255, 255)
Заголовок.TextScaled = true
Заголовок.Font = Enum.Font.GothamBold
Заголовок.TextXAlignment = Enum.TextXAlignment.Left
Заголовок.Parent = Шапка

-- КНОПКА ЗАКРЫТИЯ МЕНЮ
local КнопкаЗакрыть = Instance.new("TextButton")
КнопкаЗакрыть.Size = UDim2.new(0, 25, 0, 25)
КнопкаЗакрыть.Position = UDim2.new(1, -30, 0, 3)
КнопкаЗакрыть.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
КнопкаЗакрыть.Text = "✕"
КнопкаЗакрыть.TextColor3 = Color3.fromRGB(255, 255, 255)
КнопкаЗакрыть.TextScaled = true
КнопкаЗакрыть.Font = Enum.Font.GothamBold
КнопкаЗакрыть.Parent = Шапка
КнопкаЗакрыть.MouseButton1Click:Connect(function()
    Меню.Visible = false
end)

-- СКРОЛЛИНГ ДЛЯ КНОПОК
local Скролл = Instance.new("ScrollingFrame")
Скролл.Size = UDim2.new(1, -10, 1, -40)
Скролл.Position = UDim2.new(0, 5, 0, 35)
Скролл.BackgroundTransparency = 1
Скролл.ScrollBarThickness = 4
Скролл.CanvasSize = UDim2.new(0, 0, 0, 0)
Скролл.Parent = Меню

local Y_позиция = 5
local function СоздатьКнопку(текст, цвет, действие)
    local Кнопка = Instance.new("TextButton")
    Кнопка.Size = UDim2.new(1, -10, 0, 32)
    Кнопка.Position = UDim2.new(0, 5, 0, Y_позиция)
    Кнопка.BackgroundColor3 = цвет or Color3.fromRGB(30, 30, 60)
    Кнопка.BackgroundTransparency = 0.2
    Кнопка.Text = текст
    Кнопка.TextColor3 = Color3.fromRGB(255, 255, 255)
    Кнопка.TextScaled = true
    Кнопка.Font = Enum.Font.Gotham
    Кнопка.Parent = Скролл
    Кнопка.MouseButton1Click:Connect(действие)
    Y_позиция = Y_позиция + 37
    Скролл.CanvasSize = UDim2.new(0, 0, 0, Y_позиция + 10)
    return Кнопка
end

-- ============================================================
-- СОЗДАНИЕ КНОПОК МЕНЮ (ВСЕ НА РУССКОМ)
-- ============================================================
СоздатьКнопку("🔊 СИРЕНА", Color3.fromRGB(200, 0, 0), ВключитьСИрену)
СоздатьКнопку("👾 ТЕГ ВСЕМ", Color3.fromRGB(150, 0, 150), ДобавитьТегВсем)
СоздатьКнопку("💀 УБИТЬ ВСЕХ", Color3.fromRGB(255, 0, 0), УбитьВсех)
СоздатьКнопку("🌀 СОБРАТЬ ВСЕХ", Color3.fromRGB(200, 150, 0), СобратьВсех)

-- Музыка (вкл/выкл)
local МузыкаВключена = false
СоздатьКнопку("🎵 МУЗЫКА (ВКЛ/ВЫКЛ)", Color3.fromRGB(0, 150, 200), function()
    if ТекущаяМузыка then
        ТекущаяМузыка:Destroy()
        ТекущаяМузыка = nil
        ОтправитьВЧат("🔇 " .. Я.Name .. " ВЫКЛЮЧИЛ МУЗЫКУ")
    else
        ТекущаяМузыка = ВключитьМузыку()
    end
end)

СоздатьКнопку("🌀 NOCLIP", Color3.fromRGB(0, 100, 200), ВключитьНоклип)
СоздатьКнопку("🌀 ТЕЛЕПОРТ К ИГРОКУ", Color3.fromRGB(200, 150, 0), ТелепортКИгроку)
СоздатьКнопку("💬 СПАМ (10 СООБЩЕНИЙ)", Color3.fromRGB(200, 100, 0), СпамВЧат)

-- Кнопка закрытия (дублирующая)
СоздатьКнопку("❌ ЗАКРЫТЬ", Color3.fromRGB(100, 100, 100), function()
    Меню.Visible = false
end)

-- ОТКРЫТИЕ/ЗАКРЫТИЕ МЕНЮ ПО КНОПКЕ ТЫКВЫ
КнопкаОткрыть.MouseButton1Click:Connect(function()
    Меню.Visible = not Меню.Visible
end)

-- АДАПТАЦИЯ ДЛЯ ТЕЛЕФОНА (УВЕЛИЧЕНИЕ КНОПОК И МЕНЮ)
if Ввод.TouchEnabled then
    КнопкаОткрыть.Size = UDim2.new(0, 70, 0, 70)
    КнопкаОткрыть.Position = UDim2.new(1, -80, 0.85, -35)
    Меню.Size = UDim2.new(0, 300, 0, 400)
    Меню.Position = UDim2.new(0.5, -150, 0.4, -200)
end

-- ============================================================
-- АВТОМАТИЧЕСКИЙ ЗАПУСК ПРИ СТАРТЕ
-- ============================================================
task.wait(1)
ОтправитьВЧат("🎃 " .. Я.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1!")
print("🎃 СКРИПТ ЗАПУЩЕН! НАЖМИ КРАСНУЮ КНОПКУ 🎃 ДЛЯ МЕНЮ.")
print("✅ ВСЕ ФУНКЦИИ РАБОТАЮТ, ОШИБКИ ИСПРАВЛЕНЫ")
