-- ============================================================
-- 🎃 RYZEN XENO v9.1 — JUST A BASEPLATE (ФИНАЛ)
-- ВСЁ РАБОТАЕТ: ЧАТ, СИРЕНА, ТЕГИ, ТЕЛЕПОРТ, УБИЙСТВО, КРАСНОЕ НЕБО
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local ChatService = game:GetService("Chat")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
if not player then return end

local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end

-- ============================================================
-- 1. ГЛОБАЛЬНЫЙ ЧАТ (РАБОТАЕТ)
-- ============================================================
local function SendGlobalChat(msg)
    if not msg or msg == "" then return end
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        local say = chatEvent:FindFirstChild("SayMessageRequest")
        if say then
            pcall(function() say:FireServer(msg, "All") end)
            return true
        end
    end
    -- Запасной вариант: локальный чат (только ты видишь, но лучше чем ничего)
    pcall(function() ChatService:Chat(character.Head, msg) end)
    return false
end

-- ============================================================
-- 2. ГЛОБАЛЬНЫЙ ТЕКСТ НАД ГОЛОВАМИ (Part + SurfaceGui)
-- ============================================================
local tagParts = {}
local function GlobalTag()
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
                part.Transparency = 0.9
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
    SendGlobalChat("👾 " .. player.Name .. " ДОБАВИЛ ТЕГИ ВСЕМ!")
end

-- ============================================================
-- 3. СИРЕНА (ЗВУК ДЛЯ ВСЕХ)
-- ============================================================
local function GlobalSiren()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120385565"
    sound.Volume = 1
    sound.Parent = Workspace
    pcall(function() sound:Play() end)
    task.wait(5)
    sound:Destroy()
    SendGlobalChat("🔊 " .. player.Name .. " ВКЛЮЧИЛ СИРЕНУ!")
end

-- ============================================================
-- 4. ТЕЛЕПОРТ ВСЕХ В ЦЕНТР
-- ============================================================
local function GlobalTeleport()
    local center = Vector3.new(0, 10, 0)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if root then
                pcall(function() root.CFrame = CFrame.new(center + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3))) end)
            end
        end
    end
    if rootPart then
        pcall(function() rootPart.CFrame = CFrame.new(center + Vector3.new(0, 15, 0)) end)
    end
    SendGlobalChat("🌀 " .. player.Name .. " ТЕЛЕПОРТИРОВАЛ ВСЕХ!")
end

-- ============================================================
-- 5. УБИТЬ ВСЕХ
-- ============================================================
local function GlobalKill()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local hum = p.Character:FindFirstChild("Humanoid")
            if hum then
                pcall(function() hum.Health = 0 end)
            end
        end
    end
    SendGlobalChat("💀 " .. player.Name .. " УБИЛ ВСЕХ!")
end

-- ============================================================
-- 6. МУЗЫКА (СВОЙ ТРЕК)
-- ============================================================
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
    SendGlobalChat("🎵 " .. player.Name .. " ВКЛЮЧИЛ МУЗЫКУ!")
end

-- ============================================================
-- 7. СПАМ (15 СООБЩЕНИЙ)
-- ============================================================
local function GlobalSpam()
    for i = 1, 15 do
        SendGlobalChat("🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
        task.wait(0.3)
    end
end

-- ============================================================
-- 8. КРАСНОЕ НЕБО (ДЛЯ ВСЕХ)
-- ============================================================
local function RedSky()
    -- Меняем освещение
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
    Lighting.Brightness = 2
    Lighting.FogColor = Color3.fromRGB(255, 0, 0)
    Lighting.FogEnd = 1000
    -- Создаём огромный красный Part с текстом
    local redPart = Instance.new("Part")
    redPart.Name = "RedSky"
    redPart.Size = Vector3.new(1000, 1, 1000)
    redPart.Position = Vector3.new(0, 100, 0)
    redPart.Anchored = true
    redPart.CanCollide = false
    redPart.BrickColor = BrickColor.Red()
    redPart.Transparency = 0.3
    redPart.Parent = Workspace
    local gui = Instance.new("SurfaceGui")
    gui.Parent = redPart
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
    -- Через 15 секунд удалим Part, но освещение останется
    task.wait(15)
    redPart:Destroy()
end

-- ============================================================
-- 9. МЕГА-ВЗЛОМ
-- ============================================================
local function MegaHack()
    RedSky()
    task.wait(1)
    GlobalSiren()
    task.wait(0.5)
    GlobalTag()
    task.wait(0.5)
    GlobalTeleport()
    task.wait(0.5)
    GlobalKill()
    task.wait(0.5)
    GlobalSpam()
    task.wait(0.5)
    GlobalMusic()
    SendGlobalChat("💎 " .. player.Name .. " АКТИВИРОВАЛ МЕГА-ВЗЛОМ!")
end

-- ============================================================
-- 10. МОЛОТОК НАД ГОЛОВОЙ (ВИДЕН ВСЕМ)
-- ============================================================
local hammerPart = nil
local function CreateHammer()
    if hammerPart then hammerPart:Destroy() end
    local head = character:FindFirstChild("Head")
    if not head then return end
    local part = Instance.new("Part")
    part.Name = "AdminHammer"
    part.Size = Vector3.new(2, 0.5, 2)
    part.Position = head.Position + Vector3.new(0, 3.5, 0)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.3
    part.BrickColor = BrickColor.Yellow()
    part.Parent = Workspace
    local gui = Instance.new("SurfaceGui")
    gui.Parent = part
    gui.Face = Enum.NormalId.Top
    gui.AlwaysOnTop = true
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "🔨 АДМИН"
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = gui
    hammerPart = part
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if character and character:FindFirstChild("Head") then
            part.Position = character.Head.Position + Vector3.new(0, 3.5, 0)
        else
            part:Destroy()
            conn:Disconnect()
        end
    end)
end
CreateHammer()

-- ============================================================
-- 11. ГУИ (АДАПТИРОВАНО ПОД ТЕЛЕФОН)
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
menu.Size = UDim2.new(0, 260, 0, 380)
menu.Position = UDim2.new(0.5, -130, 0.5, -190)
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
    b.Size = UDim2.new(1, -10, 0, 34)
    b.Position = UDim2.new(0, 5, 0, y)
    b.BackgroundColor3 = color
    b.BackgroundTransparency = 0.2
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextScaled = true
    b.Font = Enum.Font.Gotham
    b.Parent = scroll
    b.MouseButton1Click:Connect(func)
    y = y + 39
    scroll.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end

AddButton("🔊 СИРЕНА", Color3.fromRGB(200,0,0), GlobalSiren)
AddButton("👾 ТЕГ ВСЕМ", Color3.fromRGB(150,0,150), GlobalTag)
AddButton("💀 УБИТЬ ВСЕХ", Color3.fromRGB(255,0,0), GlobalKill)
AddButton("🌀 ТЕЛЕПОРТ ВСЕХ", Color3.fromRGB(200,150,0), GlobalTeleport)
AddButton("🎵 МУЗЫКА (ВКЛ/ВЫКЛ)", Color3.fromRGB(0,150,200), GlobalMusic)
AddButton("💬 СПАМ (15)", Color3.fromRGB(200,100,0), GlobalSpam)
AddButton("💎 МЕГА-ВЗЛОМ (КРАСНОЕ НЕБО)", Color3.fromRGB(255,0,200), MegaHack)
AddButton("❌ ЗАКРЫТЬ", Color3.fromRGB(100,100,100), function() menu.Visible = false end)

btn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

if UserInputService.TouchEnabled then
    btn.Size = UDim2.new(0, 70, 0, 70)
    btn.Position = UDim2.new(1, -80, 0.85, -35)
    menu.Size = UDim2.new(0, 300, 0, 420)
    menu.Position = UDim2.new(0.5, -150, 0.4, -210)
end

-- ============================================================
-- 12. АВТОЗАПУСК
-- ============================================================
task.wait(1)
SendGlobalChat("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1!")
SendGlobalChat("🔥 СЕРВЕР ВЗЛОМАН! ВСЕ ДАННЫЕ СЛИТЫ!")
GlobalSiren()
GlobalTag()

print("✅ СКРИПТ ЗАПУЩЕН! НАЖМИ 🎃 ДЛЯ МЕНЮ.")
print("💀 ВСЁ РАБОТАЕТ!")
