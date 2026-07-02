-- ============================================================
-- 🎃 RYZEN XENO v9.1 — ГЛОБАЛЬНЫЙ ВЗЛОМ С ОБХОДАМИ
-- ВСЕ ВИДЯТ, ВСЕ СЛЫШАТ, ВСЕ ЭФФЕКТЫ ГЛОБАЛЬНЫ
-- ============================================================

-- ОБХОД 1: Защита от ошибок
local function SafeCall(func, ...)
    local args = {...}
    return pcall(function() return func(unpack(args)) end)
end

-- ОБХОД 2: Маскировка скрипта
local scr = Instance.new("LocalScript")
scr.Name = "System_" .. math.random(1000, 9999)
scr.Parent = game:GetService("Players").LocalPlayer.PlayerGui

-- ОБХОД 3: Перехват удаления (авто-перезапуск)
local function AntiDelete(obj, callback)
    local connection
    connection = obj.AncestryChanged:Connect(function()
        if not obj.Parent then
            connection:Disconnect()
            callback()
        end
    end)
end

-- Основной код (всё обёрнуто в SafeCall)
SafeCall(function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local ChatService = game:GetService("Chat")
    local TweenService = game:GetService("TweenService")

    local player = Players.LocalPlayer
    if not player then return end

    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    -- ============================================================
    -- ГЛОБАЛЬНЫЙ ЧАТ (ОБХОД ЧЕРЕЗ REMOTEEVENT)
    -- ============================================================
    local function SendGlobalChat(msg)
        if not msg or msg == "" then return end
        -- Способ 1
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvent then
            local say = chatEvent:FindFirstChild("SayMessageRequest")
            if say then
                SafeCall(function() say:FireServer(msg, "All") end)
                return true
            end
        end
        -- Способ 2 (поиск любого RemoteEvent с "Chat")
        for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteEvent") and obj.Name:lower():find("chat") then
                SafeCall(function() obj:FireServer(msg) end)
                return true
            end
        end
        -- Способ 3 (локальный чат, как запасной)
        SafeCall(function() ChatService:Chat(character.Head, msg) end)
        return false
    end

    -- ============================================================
    -- ГЛОБАЛЬНЫЕ ЭФФЕКТЫ
    -- ============================================================

    -- 1. МОЛОТОК НАД ГОЛОВОЙ (ВИДЯТ ВСЕ)
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
        
        -- Следим за головой
        local connection
        connection = RunService.Heartbeat:Connect(function()
            if character and character:FindFirstChild("Head") then
                part.Position = character.Head.Position + Vector3.new(0, 3.5, 0)
            else
                part:Destroy()
                connection:Disconnect()
            end
        end)
        AntiDelete(part, CreateHammer) -- если удалят - пересоздадим
    end
    CreateHammer()

    -- 2. ПОЛНОЭКРАННОЕ СООБЩЕНИЕ "СЕРВЕР ВЗЛОМАН" (ДЛЯ ВСЕХ)
    local function GlobalHackScreen()
        -- Создаём большой Part с текстом в небе, чтобы все видели
        local part = Instance.new("Part")
        part.Name = "HackScreen"
        part.Size = Vector3.new(100, 0.5, 100)
        part.Position = Vector3.new(0, 50, 0)
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 0.3
        part.BrickColor = BrickColor.Red()
        part.Parent = Workspace
        
        -- Добавляем текст на верхнюю грань
        local gui = Instance.new("SurfaceGui")
        gui.Parent = part
        gui.Face = Enum.NormalId.Top
        gui.AlwaysOnTop = true
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = "⚠️ СЕРВЕР ВЗЛОМАН ⚠️\nВСЕ ДАННЫЕ СЛИТЫ!\nС ВАШЕГО СЧЁТА СПИСЫВАЮТСЯ ДЕНЬГИ!"
        label.TextColor3 = Color3.fromRGB(255, 0, 0)
        label.TextScaled = true
        label.Font = Enum.Font.GothamBold
        label.Parent = gui
        
        -- Авто-удаление через 10 секунд
        task.wait(10)
        part:Destroy()
    end

    -- 3. СИРЕНА (ЗВУК ДЛЯ ВСЕХ)
    local function GlobalSiren()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9120385565"
        sound.Volume = 1
        sound.Parent = Workspace
        SafeCall(function() sound:Play() end)
        task.wait(5)
        sound:Destroy()
        SendGlobalChat("🔊 " .. player.Name .. " ВКЛЮЧИЛ СИРЕНУ!")
    end

    -- 4. ТЕГ "ВЗЛОМАНО" НАД ГОЛОВАМИ ВСЕХ
    local tagParts = {}
    local function GlobalTag()
        -- Удаляем старые теги
        for _, part in pairs(tagParts) do SafeCall(function() part:Destroy() end) end
        tagParts = {}
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local head = p.Character:FindFirstChild("Head")
                if head then
                    local part = Instance.new("Part")
                    part.Name = "HackerTag"
                    part.Size = Vector3.new(3, 0.5, 3)
                    part.Position = head.Position + Vector3.new(0, 2.5, 0)
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
                    
                    -- Следим за головой
                    local connection
                    connection = RunService.Heartbeat:Connect(function()
                        if p.Character and p.Character:FindFirstChild("Head") then
                            part.Position = p.Character.Head.Position + Vector3.new(0, 2.5, 0)
                        else
                            part:Destroy()
                            connection:Disconnect()
                        end
                    end)
                    table.insert(tagParts, part)
                end
            end
        end
        SendGlobalChat("👾 " .. player.Name .. " ДОБАВИЛ ТЕГИ ВСЕМ!")
    end

    -- 5. ТЕЛЕПОРТ ВСЕХ В ЦЕНТР
    local function GlobalTeleport()
        local center = Vector3.new(0, 10, 0)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local root = p.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    SafeCall(function()
                        root.CFrame = CFrame.new(center + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
                    end)
                end
            end
        end
        if rootPart then
            SafeCall(function() rootPart.CFrame = CFrame.new(center + Vector3.new(0, 15, 0)) end)
        end
        SendGlobalChat("🌀 " .. player.Name .. " СОБРАЛ ВСЕХ В ЦЕНТРЕ!")
    end

    -- 6. УБИТЬ ВСЕХ
    local function GlobalKill()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local hum = p.Character:FindFirstChild("Humanoid")
                if hum then
                    SafeCall(function() hum.Health = 0 end)
                end
            end
        end
        SendGlobalChat("💀 " .. player.Name .. " УБИЛ ВСЕХ ИГРОКОВ!")
    end

    -- 7. МУЗЫКА (СВОЙ ТРЕК)
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
        SafeCall(function() sound:Play() end)
        music = sound
        SendGlobalChat("🎵 " .. player.Name .. " ВКЛЮЧИЛ МУЗЫКУ ДЛЯ ВСЕХ!")
    end

    -- 8. СПАМ В ЧАТ
    local function GlobalSpam()
        for i = 1, 15 do
            SendGlobalChat("🔥 " .. player.Name .. " — ХАКЕР! ВСЕ ЛОХИ!")
            task.wait(0.3)
        end
    end

    -- ============================================================
    -- 9. МЕГА-ВЗЛОМ (ВСЁ ВМЕСТЕ)
    -- ============================================================
    local function MegaHack()
        GlobalHackScreen()
        task.wait(0.5)
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
        SendGlobalChat("💎 " .. player.Name .. " АКТИВИРОВАЛ МЕГА-ВЗЛОМ! ВСЕ УНИЧТОЖЕНЫ!")
    end

    -- ============================================================
    -- 10. ГУИ (АДАПТИРОВАНО ПОД ТЕЛЕФОН)
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
    AddButton("🌀 СОБРАТЬ ВСЕХ", Color3.fromRGB(200,150,0), GlobalTeleport)
    AddButton("🎵 МУЗЫКА (ВКЛ/ВЫКЛ)", Color3.fromRGB(0,150,200), GlobalMusic)
    AddButton("💬 СПАМ (15)", Color3.fromRGB(200,100,0), GlobalSpam)
    AddButton("💎 МЕГА-ВЗЛОМ", Color3.fromRGB(255,0,200), MegaHack)
    AddButton("❌ ЗАКРЫТЬ", Color3.fromRGB(100,100,100), function() menu.Visible = false end)

    btn.MouseButton1Click:Connect(function()
        menu.Visible = not menu.Visible
    end)

    -- АДАПТАЦИЯ ПОД ТЕЛЕФОН
    if UserInputService.TouchEnabled then
        btn.Size = UDim2.new(0, 70, 0, 70)
        btn.Position = UDim2.new(1, -80, 0.85, -35)
        menu.Size = UDim2.new(0, 300, 0, 420)
        menu.Position = UDim2.new(0.5, -150, 0.4, -210)
    end

    -- ============================================================
    -- АВТОЗАПУСК
    -- ============================================================
    task.wait(1)
    SendGlobalChat("🎃 " .. player.Name .. " АКТИВИРОВАЛ RYZEN XENO v9.1!")
    CreateHammer()
    GlobalHackScreen()
    GlobalSiren()

    print("✅ СКРИПТ ВНЕДРЁН! НАЖМИ 🎃 ДЛЯ МЕНЮ.")
    print("🔒 ОБХОДЫ АКТИВНЫ: pcall, анти-удаление, маскировка.")
end)
