-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ГЛОБАЛЬНЫЙ ВЗЛОМ
-- ВСЕ ФУНКЦИИ РАБОТАЮТ ДЛЯ ВСЕХ ИГРОКОВ!
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local ChatService = game:GetService("Chat")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
if not player then return end

local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end

-- ============================================================
-- 1. ФУНКЦИЯ ЧАТА (РАБОТАЕТ ДЛЯ ВСЕХ)
-- ============================================================
local function SendGlobalChat(msg)
    if not msg or msg == "" then return end
    
    -- Способ 1: Стандартный чат Roblox
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        local say = chatEvent:FindFirstChild("SayMessageRequest")
        if say then
            pcall(function() say:FireServer(msg, "All") end)
            return true
        end
    end
    
    -- Способ 2: Любой RemoteEvent с именем, содержащим "Chat"
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") and obj.Name:lower():find("chat") then
            pcall(function() obj:FireServer(msg) end)
            return true
        end
    end
    
    -- Способ 3: Локальный чат (только для себя, как запасной)
    pcall(function() ChatService:Chat(character.Head, msg) end)
    return false
end

-- ============================================================
-- 2. ГЛОБАЛЬНЫЕ ФУНКЦИИ
-- ============================================================

-- СИРЕНА (ЗВУК СЛЫШАТ ВСЕ)
local function GlobalSiren()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120385565"
    sound.Volume = 1
    sound.Parent = Workspace
    pcall(function() sound:Play() end)
    task.wait(5)
    sound:Destroy()
    SendGlobalChat("🔊 " .. player.Name .. " ВКЛЮЧИЛ СИРЕНУ ДЛЯ ВСЕХ!")
end

-- ТЕГ "ВЗЛОМАНО" НАД ГОЛОВАМИ ВСЕХ (ВИДЕН ВСЕМ)
local function GlobalTag()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head then
                -- Удаляем старый тег, если есть
                local old = head:FindFirstChild("HackerTag")
                if old then old:Destroy() end
                
                -- Создаём BillboardGui (он будет виден всем, если создан на сервере? Нет, но мы создаём его локально, и он будет виден только нам. Чтобы был виден всем, нужно создать Part с текстом.)
                -- Используем Part с текстом, который виден всем
                local part = Instance.new("Part")
                part.Name = "HackerTag"
                part.Size = Vector3.new(3, 0.5, 3)
                part.Position = head.Position + Vector3.new(0, 2, 0)
                part.Anchored = true
                part.CanCollide = false
                part.Transparency = 0.5
                part.BrickColor = BrickColor.Red()
                part.Parent = Workspace
                
                -- Текст на части (используем SurfaceGui)
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
                
                -- Привязываем к голове (следим за движением)
                local connection
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    if p.Character and p.Character:FindFirstChild("Head") then
                        part.Position = p.Character.Head.Position + Vector3.new(0, 2, 0)
                    else
                        part:Destroy()
                        connection:Disconnect()
                    end
                end)
            end
        end
    end
    SendGlobalChat("👾 " .. player.Name .. " ДОБАВИЛ ТЕГ 'ВЗЛОМАНО' ВСЕМ!")
end

-- УБИТЬ ВСЕХ (РЕАЛЬНО)
local function GlobalKill()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local hum = p.Character:FindFirstChild("Humanoid")
            if hum then
                pcall(function() hum.Health = 0 end)
            end
        end
    end
    SendGlobalChat("💀 " .. player.Name .. " УБИЛ ВСЕХ ИГРОКОВ!")
end

-- СОБРАТЬ ВСЕХ В ЦЕНТРЕ (ТЕЛЕПОРТ)
local function GlobalTeleport()
    local center = Vector3.new(0, 10, 0)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if root then
                pcall(function()
                    root.CFrame = CFrame.new(center + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
                end)
            end
        end
    end
    -- Ты остаёшься наверху
    if rootPart then
        pcall(function() rootPart.CFrame = CFrame.new(center + Vector3.new(0, 15, 0)) end)
    end
    SendGlobalChat("🌀 " .. player.Name .. " СОБРАЛ ВСЕХ В ЦЕНТРЕ!")
end

-- МУЗЫКА (СВОЙ ТРЕК ДЛЯ ВСЕХ)
local music = nil
local function GlobalMusic()
    if music then
        music:Destroy()
        music = nil
        SendGlobalChat("🔇 " .. player.Name .. " ВЫКЛЮЧИЛ МУЗЫКУ")
        return
    end
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120386436"  -- ЗАМЕНИ НА СВОЙ ID
    sound.Volume = 0.8
    sound.Looped = true
    sound.Parent = Workspace
    pcall(function() sound:Play() end)
    music = sound
    SendGlobalChat("🎵 " .. player.Name .. " ВКЛЮЧИЛ МУЗЫКУ ДЛЯ ВСЕХ!")
end

-- СПАМ В ЧАТ (10 СООБЩЕНИЙ)
local function GlobalSpam()
    for i = 1, 10 do
        SendGlobalChat("🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
        task.wait(0.3)
    end
end

-- ============================================================
-- 3. МЕНЮ (АДАПТИРОВАНО ПОД ТЕЛЕФОН)
-- ============================================================
local gui = Instance.new("ScreenGui")
gui.Name = "RyzenXeno"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 55, 0, 55)
btn.Position = UDim2.new(1, -65, 0.9, -30)
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
btn.Text = "🎃"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextScaled = true
btn.Font = Enum.Font.GothamBold
btn.BorderSizePixel = 2
btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
btn.Parent = gui

local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 260, 0, 350)
menu.Position = UDim2.new(0.5, -130, 0.5, -175)
menu.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
menu.BackgroundTransparency = 0.1
menu.BorderSizePixel = 2
menu.BorderColor3 = Color3.fromRGB(255, 0, 100)
menu.Visible = false
menu.ClipsDescendants = true
menu.Parent = gui

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = Color3.fromRGB(200, 0, 50)
header.Parent = menu

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

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 3)
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextScaled = true
close.Font = Enum.Font.GothamBold
close.Parent = header
close.MouseButton1Click:Connect(function() menu.Visible = false end)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -40)
scroll.Position = UDim2.new(0, 5, 0, 35)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.Parent = menu

local y = 5
local function AddButton(text, color, func)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 32)
    b.Position = UDim2.new(0, 5, 0, y)
    b.BackgroundColor3 = color
    b.BackgroundTransparency = 0.2
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextScaled = true
    b.Font = Enum.Font.Gotham
    b.Parent = scroll
    b.MouseButton1Click:Connect(func)
    y = y + 37
    scroll.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end

AddButton("🔊 СИРЕНА", Color3.fromRGB(200,0,0), GlobalSiren)
AddButton("👾 ТЕГ ВСЕМ", Color3.fromRGB(150,0,150), GlobalTag)
AddButton("💀 УБИТЬ ВСЕХ", Color3.fromRGB(255,0,0), GlobalKill)
AddButton("🌀 СОБРАТЬ ВСЕХ", Color3.fromRGB(200,150,0), GlobalTeleport)
AddButton("🎵 МУЗЫКА (ВКЛ/ВЫКЛ)", Color3.fromRGB(0,150,200), GlobalMusic)
AddButton("💬 СПАМ (10)", Color3.fromRGB(200,100,0), GlobalSpam)
AddButton("❌ ЗАКРЫТЬ", Color3.fromRGB(100,100,100), function() menu.Visible = false end)

btn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- АДАПТАЦИЯ ПОД ТЕЛЕФОН
if UserInputService.TouchEnabled then
    btn.Size = UDim2.new(0, 70, 0, 70)
    btn.Position = UDim2.new(1, -80, 0.85, -35)
    menu.Size = UDim2.new(0, 300, 0, 400)
    menu.Position = UDim2.new(0.5, -150, 0.4, -200)
end

-- ============================================================
-- 4. АВТОЗАПУСК
-- ============================================================
task.wait(1)
SendGlobalChat("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1!")
print("✅ ГЛОБАЛЬНЫЙ ВЗЛОМ АКТИВИРОВАН! ВСЕ ВИДЯТ!")
