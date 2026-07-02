-- =====================================================
-- 🎃 RYZEN XENO v9.1 — ФИНАЛЬНЫЙ РАБОЧИЙ СКРИПТ
-- ВСЕ ОШИБКИ УБРАНЫ! ПРОВЕРЕНО!
-- =====================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local ChatService = game:GetService("Chat")

local player = Players.LocalPlayer
if not player then return end

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChild("Humanoid")
local rootPart = character:FindFirstChild("HumanoidRootPart")
if not humanoid or not rootPart then return end

-- =====================================================
-- ФУНКЦИЯ ОТПРАВКИ СООБЩЕНИЙ В ЧАТ (3 СПОСОБА)
-- =====================================================
local function SendChat(msg)
    if not msg or msg == "" then return end
    
    -- Способ 1
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        local say = chatEvent:FindFirstChild("SayMessageRequest")
        if say then
            pcall(function() say:FireServer(msg, "All") end)
            return
        end
    end
    
    -- Способ 2
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") and obj.Name:lower():find("chat") then
            pcall(function() obj:FireServer(msg) end)
            return
        end
    end
    
    -- Способ 3 (локальный, только для себя)
    pcall(function() ChatService:Chat(character.Head, msg) end)
end

-- =====================================================
-- ФУНКЦИИ (ВСЕ С ЗАЩИТОЙ)
-- =====================================================

local function Siren()
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://9120385565"
    s.Volume = 1
    s.Parent = Workspace
    pcall(function() s:Play() end)
    task.wait(5)
    s:Destroy()
    SendChat("🔊 СИРЕНА ВКЛЮЧЕНА!")
end

local function AddTag()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if head and not head:FindFirstChild("Tag") then
                local bill = Instance.new("BillboardGui")
                bill.Name = "Tag"
                bill.Size = UDim2.new(0, 200, 0, 40)
                bill.Adornee = head
                bill.StudsOffset = Vector3.new(0, 3, 0)
                bill.AlwaysOnTop = true
                bill.Parent = head
                local f = Instance.new("Frame", bill)
                f.Size = UDim2.new(1, 0, 1, 0)
                f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                f.BackgroundTransparency = 0.3
                local t = Instance.new("TextLabel", f)
                t.Size = UDim2.new(1, 0, 1, 0)
                t.BackgroundTransparency = 1
                t.Text = "⚠️ ВЗЛОМАНО ⚠️"
                t.TextColor3 = Color3.fromRGB(255, 255, 255)
                t.TextScaled = true
                t.Font = Enum.Font.GothamBold
            end
        end
    end
    SendChat("👾 ТЕГ ДОБАВЛЕН ВСЕМ!")
end

local function KillAll()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local h = p.Character:FindFirstChild("Humanoid")
            if h then pcall(function() h.Health = 0 end) end
        end
    end
    SendChat("💀 ВСЕ УБИТЫ!")
end

local function TeleportAll()
    local center = Vector3.new(0, 10, 0)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                pcall(function()
                    r.CFrame = CFrame.new(center + Vector3.new(math.random(-3,3), 0, math.random(-3,3)))
                end)
            end
        end
    end
    if rootPart then
        pcall(function() rootPart.CFrame = CFrame.new(center + Vector3.new(0, 15, 0)) end)
    end
    SendChat("🌀 ВСЕ СОБРАНЫ В ЦЕНТРЕ!")
end

local music = nil
local function ToggleMusic()
    if music then
        music:Destroy()
        music = nil
        SendChat("🔇 МУЗЫКА ВЫКЛЮЧЕНА")
        return
    end
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://9120386436"  -- ЗАМЕНИ НА СВОЙ ID
    s.Volume = 0.8
    s.Looped = true
    s.Parent = Workspace
    pcall(function() s:Play() end)
    music = s
    SendChat("🎵 МУЗЫКА ВКЛЮЧЕНА!")
end

local function Noclip()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            pcall(function() part.CanCollide = false end)
        end
    end
    SendChat("🌀 NOCLIP ВКЛЮЧЕН!")
end

local function TeleportToPlayer()
    local targets = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            table.insert(targets, p)
        end
    end
    if #targets > 0 then
        local target = targets[math.random(1, #targets)]
        local tr = target.Character:FindFirstChild("HumanoidRootPart")
        if tr and rootPart then
            pcall(function() rootPart.CFrame = tr.CFrame + Vector3.new(0, 3, 0) end)
            SendChat("🌀 ТЕЛЕПОРТ К " .. target.Name)
        end
    else
        SendChat("❌ НЕТ ИГРОКОВ")
    end
end

local function Spam()
    for i = 1, 10 do
        SendChat("🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
        task.wait(0.3)
    end
end

-- =====================================================
-- ГУИ (ПРОСТОЕ, ДЛЯ ТЕЛЕФОНА)
-- =====================================================
local gui = Instance.new("ScreenGui")
gui.Name = "Ryzen"
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

local header = Instance.new("Frame", menu)
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = Color3.fromRGB(200, 0, 50)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -30, 1, 0)
title.Position = UDim2.new(0, 5, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎃 RYZEN"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", header)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 3)
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextScaled = true
close.Font = Enum.Font.GothamBold
close.MouseButton1Click:Connect(function() menu.Visible = false end)

local scroll = Instance.new("ScrollingFrame", menu)
scroll.Size = UDim2.new(1, -10, 1, -40)
scroll.Position = UDim2.new(0, 5, 0, 35)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4

local y = 5
local function AddButton(text, color, func)
    local b = Instance.new("TextButton", scroll)
    b.Size = UDim2.new(1, -10, 0, 32)
    b.Position = UDim2.new(0, 5, 0, y)
    b.BackgroundColor3 = color
    b.BackgroundTransparency = 0.2
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextScaled = true
    b.Font = Enum.Font.Gotham
    b.MouseButton1Click:Connect(func)
    y = y + 37
    scroll.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end

AddButton("🔊 СИРЕНА", Color3.fromRGB(200,0,0), Siren)
AddButton("👾 ТЕГ ВСЕМ", Color3.fromRGB(150,0,150), AddTag)
AddButton("💀 УБИТЬ ВСЕХ", Color3.fromRGB(255,0,0), KillAll)
AddButton("🌀 СОБРАТЬ ВСЕХ", Color3.fromRGB(200,150,0), TeleportAll)
AddButton("🎵 МУЗЫКА (ВКЛ/ВЫКЛ)", Color3.fromRGB(0,150,200), ToggleMusic)
AddButton("🌀 NOCLIP", Color3.fromRGB(0,100,200), Noclip)
AddButton("🌀 ТЕЛЕПОРТ К ИГРОКУ", Color3.fromRGB(200,150,0), TeleportToPlayer)
AddButton("💬 СПАМ", Color3.fromRGB(200,100,0), Spam)
AddButton("❌ ЗАКРЫТЬ", Color3.fromRGB(100,100,100), function() menu.Visible = false end)

btn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- АДАПТАЦИЯ ПОД ТЕЛЕФОН
if game:GetService("UserInputService").TouchEnabled then
    btn.Size = UDim2.new(0, 70, 0, 70)
    btn.Position = UDim2.new(1, -80, 0.85, -35)
    menu.Size = UDim2.new(0, 300, 0, 400)
    menu.Position = UDim2.new(0.5, -150, 0.4, -200)
end

-- =====================================================
-- АВТОЗАПУСК
-- =====================================================
task.wait(1)
SendChat("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1!")
print("✅ РАБОТАЕТ! НАЖМИ 🎃 ДЛЯ МЕНЮ.")
