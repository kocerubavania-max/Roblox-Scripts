-- Gui to Lua
-- Version: 3.2

-- Instances:

local RYZENADMIN = Instance.new("ScreenGui")
local AdminFrame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UICorner = Instance.new("UICorner")
local fly = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local osnovnoi = Instance.new("Frame")
local script = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_6 = Instance.new("UICorner")
local name = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local SettingsFrame = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local Settings = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local ScrollingFrame_2 = Instance.new("ScrollingFrame")
local UICorner_10 = Instance.new("UICorner")

--Properties:

RYZENADMIN.Name = "RYZEN ADMIN"
RYZENADMIN.Parent = game.CoreGui
RYZENADMIN.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

AdminFrame.Name = "AdminFrame"
AdminFrame.Parent = RYZENADMIN
AdminFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame.BorderSizePixel = 0
AdminFrame.Position = UDim2.new(0.354934186, 0, 0.0833333358, 0)
AdminFrame.Size = UDim2.new(0, 199, 0, 237)
AdminFrame.Visible = false

ScrollingFrame.Parent = AdminFrame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 0.200
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(0, 199, 0, 236)

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ScrollingFrame

fly.Name = "fly"
fly.Parent = ScrollingFrame
fly.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
fly.BorderColor3 = Color3.fromRGB(0, 0, 0)
fly.BorderSizePixel = 0
fly.Position = UDim2.new(0.110552765, 0, 0.0542265512, 0)
fly.Size = UDim2.new(0, 45, 0, 22)
fly.Font = Enum.Font.SourceSans
fly.Text = "fly"
fly.TextColor3 = Color3.fromRGB(255, 255, 255)
fly.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 50)
UICorner_2.Parent = fly

UICorner_3.CornerRadius = UDim.new(0, 50)
UICorner_3.Parent = AdminFrame

osnovnoi.Name = "osnovnoi"
osnovnoi.Parent = RYZENADMIN
osnovnoi.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
osnovnoi.BorderColor3 = Color3.fromRGB(0, 0, 0)
osnovnoi.BorderSizePixel = 0
osnovnoi.Position = UDim2.new(0.328654915, 0, 0, 0)
osnovnoi.Size = UDim2.new(0, 399, 0, 44)

script.Name = "script"
script.Parent = osnovnoi
script.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
script.BorderColor3 = Color3.fromRGB(255, 255, 255)
script.BorderSizePixel = 0
script.Position = UDim2.new(0.324128509, 0, 0.13636364, 0)
script.Size = UDim2.new(0, 34, 0, 32)
script.Font = Enum.Font.SourceSans
script.Text = "Скрипт"
script.TextColor3 = Color3.fromRGB(255, 255, 255)
script.TextSize = 14.000
script.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

UICorner_4.CornerRadius = UDim.new(0, 40)
UICorner_4.Parent = script

UICorner_5.CornerRadius = UDim.new(1, 0)
UICorner_5.Parent = osnovnoi

ImageLabel.Parent = osnovnoi
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(0, 45, 0, 44)
ImageLabel.Image = "rbxassetid://74347438788688"

UICorner_6.CornerRadius = UDim.new(1, 0)
UICorner_6.Parent = ImageLabel

name.Name = "name"
name.Parent = osnovnoi
name.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
name.BorderColor3 = Color3.fromRGB(0, 0, 0)
name.BorderSizePixel = 0
name.Position = UDim2.new(0.138465524, 0, 0.13636364, 0)
name.Size = UDim2.new(0, 52, 0, 18)
name.Font = Enum.Font.SourceSans
name.Text = "Welcome"
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextSize = 14.000

UICorner_7.CornerRadius = UDim.new(0, 50)
UICorner_7.Parent = name

SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Parent = osnovnoi
SettingsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingsFrame.BorderSizePixel = 0
SettingsFrame.Position = UDim2.new(0.89223057, 0, 0.0909090936, 0)
SettingsFrame.Size = UDim2.new(0, 43, 0, 36)
SettingsFrame.Font = Enum.Font.SourceSans
SettingsFrame.Text = "⚙️"
SettingsFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
SettingsFrame.TextSize = 14.000

UICorner_8.CornerRadius = UDim.new(0, 40)
UICorner_8.Parent = SettingsFrame

Settings.Name = "Settings"
Settings.Parent = RYZENADMIN
Settings.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0.556523204, 0, 0.0818713456, 0)
Settings.Size = UDim2.new(0, 179, 0, 172)
Settings.Visible = false

UICorner_9.CornerRadius = UDim.new(0, 40)
UICorner_9.Parent = Settings

ScrollingFrame_2.Parent = Settings
ScrollingFrame_2.Active = true
ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_2.BorderSizePixel = 0
ScrollingFrame_2.Size = UDim2.new(0, 179, 0, 172)

UICorner_10.CornerRadius = UDim.new(0, 40)
UICorner_10.Parent = ScrollingFrame_2

-- Scripts:

local function TQDWBXB_fake_script() -- fly.LocalScript 
	local script = Instance.new('LocalScript', fly)

	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	
	local player = Players.LocalPlayer
	local button = script.Parent
	
	local flying = false
	local speed = 50 -- Швидкість польоту (можеш змінити)
	
	local bodyGyro, bodyVelocity
	local connection
	
	-- Функція для увімкнення/вимкнення польоту
	local function toggleFly()
		local character = player.Character
		local rootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	
		if not rootPart or not humanoid then return end
	
		flying = not flying
	
		if flying then
			-- Міняємо колір або текст кнопки для краси
			button.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Синій, коли летимо
			humanoid.PlatformStand = true -- Вимикаємо стандартну анімацію ходьби
	
			-- Створюємо сили для тримання персонажа в повітрі
			bodyGyro = Instance.new("BodyGyro")
			bodyGyro.P = 9e4
			bodyGyro.maxTorque = Vector3.new(9e5, 9e5, 9e5)
			bodyGyro.cframe = rootPart.CFrame
			bodyGyro.Parent = rootPart
	
			bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.velocity = Vector3.new(0, 0, 0)
			bodyVelocity.maxForce = Vector3.new(9e5, 9e5, 9e5)
			bodyVelocity.Parent = rootPart
	
			-- Постійне оновлення напрямку польоту залежно від камери
			local camera = workspace.CurrentCamera
			connection = RunService.RenderStepped:Connect(function()
				local direction = Vector3.new(0, 0, 0)
	
				-- Зчитуємо кнопки клавіатури
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					direction = direction + camera.CFrame.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					direction = direction - camera.CFrame.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					direction = direction - camera.CFrame.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					direction = direction + camera.CFrame.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					direction = direction + Vector3.new(0, 1, 0) -- Вгору
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
					direction = direction - Vector3.new(0, 1, 0) -- Вниз
				end
	
				-- Повертаємо персонажа туди, куди дивиться камера
				bodyGyro.cframe = camera.CFrame
	
				-- Задаємо швидкість
				if direction.Magnitude > 0 then
					bodyVelocity.velocity = direction.Unit * speed
				else
					bodyVelocity.velocity = Vector3.new(0, 0, 0)
				end
			end)
		else
			-- Якщо політ вимкнули — прибираємо сили і повертаємо все назад
			button.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Повертаємо темний колір кнопки
			humanoid.PlatformStand = false
	
			if connection then connection:Disconnect() end
			if bodyGyro then bodyGyro:Destroy() end
			if bodyVelocity then bodyVelocity:Destroy() end
		end
	end
	
	-- Слідкуємо, коли гравець респавниться, щоб скинути політ
	player.CharacterAdded:Connect(function()
		flying = false
		if connection then connection:Disconnect() end
	end)
	
	-- Зв'язуємо клік по кнопці з функцією польоту
	button.MouseButton1Click:Connect(toggleFly)
end
coroutine.wrap(TQDWBXB_fake_script)()
local function TOEUXKM_fake_script() -- osnovnoi.DragScript 
	local script = Instance.new('LocalScript', osnovnoi)

	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	
	local frame = script.Parent -- Твой фрейм osnovnoi
	local ryzenAdmin = frame.Parent
	
	-- Ищем AdminFrame и фрейм Settings
	local adminFrame = ryzenAdmin:FindFirstChild("AdminFrame")
	local settingsFrame = ryzenAdmin:FindFirstChild("Settings") -- НАШЛИ НАСТРОЙКИ
	
	local dragging = false
	local dragStart
	local startPos
	local startAdminPos
	local startSettingsPos -- Стартовая позиция настроек перед перетаскиванием
	local initialYScale = nil 
	
	-- НАСТРОЙКА ПРОРЫВА ЗА ГРАНИЦЫ РОБЛОКСА:
	if ryzenAdmin:IsA("ScreenGui") then
		ryzenAdmin.IgnoreGuiInset = true
	end
	
	frame.Active = true
	frame.Selectable = true
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			-- Обновляем ссылки на элементы на случай, если они перезагрузились
			adminFrame = ryzenAdmin:FindFirstChild("AdminFrame")
			settingsFrame = ryzenAdmin:FindFirstChild("Settings")
	
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
	
			if not initialYScale then
				initialYScale = frame.Position.Y.Scale
			end
	
			if adminFrame then
				startAdminPos = adminFrame.Position
			end
	
			-- Запоминаем, где стояли настройки в момент начала перетаскивания
			if settingsFrame then
				startSettingsPos = settingsFrame.Position
			end
	
			local connection
			connection = UserInputService.InputEnded:Connect(function(endInput)
				if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
					dragging = false
					connection:Disconnect()
				end
			end)
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local screenSize = ryzenAdmin.AbsoluteSize
			if screenSize.X == 0 or screenSize.Y == 0 then return end
	
			local delta = input.Position - dragStart
	
			local deltaXScale = delta.X / screenSize.X
			local deltaYScale = delta.Y / screenSize.Y
	
			-- 1. ОГРАНИЧЕНИЕ ПО ВЕРТИКАЛИ (Y)
			local newYScale = startPos.Y.Scale + deltaYScale
	
			local minY = 0.0 
			local maxY = initialYScale + 0.02 
	
			local clampedY = math.clamp(newYScale, minY, maxY)
	
			-- 2. ОГРАНИЧЕНИЕ ПО ГОРИЗОНТАЛИ (X)
			local newXScale = startPos.X.Scale + deltaXScale
			local clampedX = math.clamp(newXScale, 0.0, 1.0 - frame.Size.X.Scale)
	
			local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
			-- Двигаем основную полосу (osnovnoi)
			local goalFrame = UDim2.new(clampedX, frame.Position.X.Offset, clampedY, frame.Position.Y.Offset)
			TweenService:Create(frame, tweenInfo, {Position = goalFrame}):Play()
	
			-- Считаем чистое смещение, на которое сдвинулся палец/мышка
			local realDeltaX = clampedX - startPos.X.Scale
			local realDeltaY = clampedY - startPos.Y.Scale
	
			-- Двигаем AdminFrame следом
			if adminFrame and startAdminPos then
				local goalAdmin = UDim2.new(
					startAdminPos.X.Scale + realDeltaX,
					adminFrame.Position.X.Offset,
					startAdminPos.Y.Scale + realDeltaY,
					adminFrame.Position.Y.Offset
				)
				TweenService:Create(adminFrame, TweenInfo.new(0), {Position = goalAdmin}):Play()
			end
	
			-- Двигаем фрейм Settings (Настройки) следом без задержек
			if settingsFrame and startSettingsPos then
				local goalSettings = UDim2.new(
					startSettingsPos.X.Scale + realDeltaX,
					settingsFrame.Position.X.Offset,
					startSettingsPos.Y.Scale + realDeltaY,
					settingsFrame.Position.Y.Offset
				)
				TweenService:Create(settingsFrame, TweenInfo.new(0), {Position = goalSettings}):Play()
			end
		end
	end)
end
coroutine.wrap(TOEUXKM_fake_script)()
local function EGGW_fake_script() -- script.LocalScript 
	local script = Instance.new('LocalScript', script)

	local TweenService = game:GetService("TweenService")
	
	local button = script.Parent 
	local frameOsnovnoi = button.Parent 
	local ryzenAdmin = frameOsnovnoi.Parent 
	
	-- Находим фрейм
	local frameToOpen = ryzenAdmin:WaitForChild("AdminFrame") 
	
	-- Настройки плавности (0.3 секунды)
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	
	-- Переменная, которая запоминает, открыто ли окно (false = закрыто)
	local isOpen = false 
	
	local function onButtonClick()
		if not isOpen then
			-- === КОД ДЛЯ ОТКРЫТИЯ ===
			isOpen = true
			frameToOpen.Visible = true
	
			-- Проявляем фон фрейма
			TweenService:Create(frameToOpen, tweenInfo, {BackgroundTransparency = 0}):Play()
	
			-- Проявляем всё, что внутри фрейма
			for _, child in pairs(frameToOpen:GetDescendants()) do
				if child:IsA("ImageLabel") or child:IsA("ImageButton") then
					TweenService:Create(child, tweenInfo, {ImageTransparency = 0}):Play()
				elseif child:IsA("TextLabel") or child:IsA("TextButton") then
					TweenService:Create(child, tweenInfo, {TextTransparency = 0}):Play()
				end
			end
		else
			-- === КОД ДЛЯ ЗАКРЫТИЯ ===
			isOpen = false
	
			-- Делаем прозрачным фон фрейма
			local hideTween = TweenService:Create(frameToOpen, tweenInfo, {BackgroundTransparency = 1})
			hideTween:Play()
	
			-- Делаем прозрачным всё, что внутри фрейма
			for _, child in pairs(frameToOpen:GetDescendants()) do
				if child:IsA("ImageLabel") or child:IsA("ImageButton") then
					TweenService:Create(child, tweenInfo, {ImageTransparency = 1}):Play()
				elseif child:IsA("TextLabel") or child:IsA("TextButton") then
					TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
				end
			end
	
			-- Полностью выключаем Visible только ПОСЛЕ того, как анимация исчезновения закончится
			hideTween.Completed:Connect(function()
				if not isOpen then -- Дополнительная проверка, чтобы не выключить случайно, если быстро нажали опять
					frameToOpen.Visible = false
				end
			end)
		end
	end
	
	button.MouseButton1Click:Connect(onButtonClick)
end
coroutine.wrap(EGGW_fake_script)()
local function UOPY_fake_script() -- name.name 
	local script = Instance.new('LocalScript', name)

	local TweenService = game:GetService("TweenService")
	local player = game.Players.LocalPlayer
	local textLabel = script.Parent
	
	-- Настройки времени для анимации (в секундах)
	local fadeInTime = 1.0 -- Как долго будет появляться текст (1 секунда)
	local pauseTime = 0.5  -- Пауза между "Welcome" и появлением ника
	
	-- Создаем инфо для плавности (Quad стиль делает появление очень мягким)
	local tweenInfo = TweenInfo.new(fadeInTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	-- Скрипт подстрахуется: на старте делаем текст точно невидимым
	textLabel.TextTransparency = 1
	
	-- СТАДИЯ 1: Пишем "Welcome" и плавно его проявляем
	textLabel.Text = "Welcome"
	
	local fadeInWelcome = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 0})
	fadeInWelcome:Play()
	
	-- Ждем, пока "Welcome" полностью появится, и делаем небольшую паузу
	fadeInWelcome.Completed:Wait()
	task.wait(pauseTime)
	
	-- СТАДИЯ 2: Плавно растворяем "Welcome", чтобы заменить на ник
	local fadeOutWelcome = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 1})
	fadeOutWelcome:Play()
	fadeOutWelcome.Completed:Wait()
	
	-- Меняем текст на ник игрока (можно использовать player.DisplayName для красивого имени)
	textLabel.Text = player.Name
	
	-- СТАДИЯ 3: Плавно проявляем ник игрока
	local fadeInNickname = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 0})
	fadeInNickname:Play()
end
coroutine.wrap(UOPY_fake_script)()
local function PAYBUG_fake_script() -- SettingsFrame.setemd 
	local script = Instance.new('LocalScript', SettingsFrame)

	local TweenService = game:GetService("TweenService")
	local toggleButton = script.Parent -- Твоя кнопка SettingsFrame
	local osnovnoi = toggleButton.Parent -- Полоса osnovnoi
	local ryzenAdmin = osnovnoi.Parent -- Главный RYZEN ADMIN
	
	-- Ищем фрейм Settings на одном уровне с osnovnoi
	local settingsWindow = ryzenAdmin:WaitForChild("Settings")
	local isOpen = false
	
	-- Скорость анимации появления (0.25 секунды)
	local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	toggleButton.MouseButton1Click:Connect(function()
		isOpen = not isOpen
	
		if isOpen then
			-- Сначала делаем фрейм прозрачным, но включаем его видимость
			settingsWindow.Size = UDim2.new(0, 0, 0, 0) -- Начинаем с нуля для эффекта выплывания
			settingsWindow.Visible = true
	
			-- Укажи размеры своего фрейма Settings, которые тебе нужны (например, ширина 250, высота 200)
			local openTween = TweenService:Create(settingsWindow, tweenInfo, {Size = UDim2.new(0, 250, 0, 200)})
			openTween:Play()
		else
			-- Плавно сжимаем и закрываем окошко обратно
			local closeTween = TweenService:Create(settingsWindow, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
			closeTween:Play()
			closeTween.Completed:Wait()
	
			if not isOpen then
				settingsWindow.Visible = false
			end
		end
	end)
end
coroutine.wrap(PAYBUG_fake_script)()
