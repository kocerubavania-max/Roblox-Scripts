-- GUI 2 LUA --

local RYZEN ADMIN_1 = Instance.new("ScreenGui")
local AdminFrame_1 = Instance.new("Frame")
local ScrollingFrame_1 = Instance.new("ScrollingFrame")
local UICorner_1 = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local osnovnoi_1 = Instance.new("Frame")
local DragScript_1 = Instance.new("LocalScript")
local script_1 = Instance.new("TextButton")
local LocalScript_1 = Instance.new("LocalScript")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local ImageLabel_1 = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local name_1 = Instance.new("TextLabel")
local name_2 = Instance.new("LocalScript")
local UICorner_6 = Instance.new("UICorner")
local SettingsFrame_1 = Instance.new("TextButton")
local setemd_1 = Instance.new("LocalScript")
local UICorner_7 = Instance.new("UICorner")
local Settings_1 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")

RYZEN ADMIN_1.Name = "RYZEN ADMIN"
RYZEN ADMIN_1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

AdminFrame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame_1.Name = "AdminFrame"
AdminFrame_1.Parent = RYZEN ADMIN_1
AdminFrame_1.Position = UDim2.new(0.3549341857433319, 0, 0.0833333358168602, 0)
AdminFrame_1.Size = UDim2.new(0, 199, 0, 237)
AdminFrame_1.Visible = false
AdminFrame_1.Selectable = false

ScrollingFrame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_1.Name = "ScrollingFrame"
ScrollingFrame_1.Parent = AdminFrame_1
ScrollingFrame_1.Position = UDim2.new(0, 0, 0.004219409078359604, 0)
ScrollingFrame_1.Size = UDim2.new(0, 199, 0, 236)

UICorner_1.CornerRadius = UDim.new(0, 50)
UICorner_1.Parent = ScrollingFrame_1

UICorner_2.CornerRadius = UDim.new(0, 50)
UICorner_2.Parent = AdminFrame_1

osnovnoi_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
osnovnoi_1.Name = "osnovnoi"
osnovnoi_1.Parent = RYZEN ADMIN_1
osnovnoi_1.Position = UDim2.new(0.3286549150943756, 0, 0, 0)
osnovnoi_1.Size = UDim2.new(0, 399, 0, 44)
osnovnoi_1.Selectable = false

script_1.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
script_1.BorderColor3 = Color3.fromRGB(255, 255, 255)
script_1.Name = "script"
script_1.Parent = osnovnoi_1
script_1.Position = UDim2.new(0.32412850856781006, 0, 0.13636364042758942, 0)
script_1.Size = UDim2.new(0, 34, 0, 32)
script_1.Text = "Скрипт"
script_1.TextColor3 = Color3.fromRGB(255, 255, 255)
script_1.TextSize = 14
script_1.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

UICorner_3.CornerRadius = UDim.new(0, 40)
UICorner_3.Parent = script_1

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = osnovnoi_1

ImageLabel_1.Parent = osnovnoi_1
ImageLabel_1.Size = UDim2.new(0, 45, 0, 44)
ImageLabel_1.Image = "rbxassetid://74347438788688"
ImageLabel_1.ImageContent = Content.fromUri("rbxassetid://74347438788688")

UICorner_5.CornerRadius = UDim.new(1, 0)
UICorner_5.Parent = ImageLabel_1

name_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
name_1.Name = "name"
name_1.Parent = osnovnoi_1
name_1.Position = UDim2.new(0.1384655237197876, 0, 0.13636364042758942, 0)
name_1.Size = UDim2.new(0, 52, 0, 18)
name_1.Selectable = false
name_1.Text = "Welcome"
name_1.TextColor3 = Color3.fromRGB(255, 255, 255)
name_1.TextSize = 14

UICorner_6.CornerRadius = UDim.new(0, 50)
UICorner_6.Parent = name_1

SettingsFrame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingsFrame_1.Name = "SettingsFrame"
SettingsFrame_1.Parent = osnovnoi_1
SettingsFrame_1.Position = UDim2.new(0.8646616339683533, 0, 0.09090909361839294, 0)
SettingsFrame_1.Size = UDim2.new(0, 43, 0, 36)
SettingsFrame_1.Text = "⚙️"
SettingsFrame_1.TextSize = 14

UICorner_7.CornerRadius = UDim.new(0, 40)
UICorner_7.Parent = SettingsFrame_1

Settings_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Settings_1.Name = "Settings"
Settings_1.Parent = RYZEN ADMIN_1
Settings_1.Position = UDim2.new(0.5478150844573975, 0, 0.07456140220165253, 0)
Settings_1.Size = UDim2.new(0, 179, 0, 172)
Settings_1.Visible = false
Settings_1.Selectable = false

UICorner_8.CornerRadius = UDim.new(0, 40)
UICorner_8.Parent = Settings_1

local function C3035309d7cad4045b8af12fe5cc66b5()
local script = Instance.new("LocalScript", osnovnoi_1)
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

coroutine.wrap(C3035309d7cad4045b8af12fe5cc66b5)()

local function C48d27bb1258a485391e0f7e524f9929()
local script = Instance.new("LocalScript", script_1)
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

coroutine.wrap(C48d27bb1258a485391e0f7e524f9929)()

local function Cb006ef3e9faf4778b309d9cc2b63e74()
local script = Instance.new("LocalScript", name_1)
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

coroutine.wrap(Cb006ef3e9faf4778b309d9cc2b63e74)()

local function C1800f9d7852644d0b0f68a7cbf869fd()
local script = Instance.new("LocalScript", SettingsFrame_1)
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

coroutine.wrap(C1800f9d7852644d0b0f68a7cbf869fd)()
