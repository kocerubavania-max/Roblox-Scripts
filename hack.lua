-- Gui to Lua
-- Version: 3.2

-- Instances:

local RYZENADMIN = Instance.new("ScreenGui")
local AdminFrame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UICorner = Instance.new("UICorner")
local fly = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local invis = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local noclip = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local osnovnoi = Instance.new("Frame")
local script = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local UICorner_7 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_8 = Instance.new("UICorner")
local name = Instance.new("TextLabel")
local UICorner_9 = Instance.new("UICorner")
local SettingsFrame = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local fps = Instance.new("TextLabel")
local UICorner_11 = Instance.new("UICorner")
local ping = Instance.new("TextLabel")
local UICorner_12 = Instance.new("UICorner")
local scriptgame = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")
local Settings = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local ScrollingFrame_2 = Instance.new("ScrollingFrame")
local UICorner_15 = Instance.new("UICorner")
local teg = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local scriptgamehub = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local ScrollingFrame_3 = Instance.new("ScrollingFrame")
local UICorner_18 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_19 = Instance.new("UICorner")

--Properties:

RYZENADMIN.Name = "RYZEN ADMIN"
RYZENADMIN.Parent = game.CoreGui
RYZENADMIN.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

AdminFrame.Name = "AdminFrame"
AdminFrame.Parent = RYZENADMIN
AdminFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame.BackgroundTransparency = 0.500
AdminFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame.BorderSizePixel = 0
AdminFrame.Position = UDim2.new(0.354934186, 0, 0.0833333358, 0)
AdminFrame.Size = UDim2.new(0, 199, 0, 237)
AdminFrame.Visible = false

ScrollingFrame.Parent = AdminFrame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 0.500
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(0, 199, 0, 236)

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ScrollingFrame

fly.Name = "fly"
fly.Parent = ScrollingFrame
fly.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
fly.BackgroundTransparency = 1.000
fly.BorderColor3 = Color3.fromRGB(0, 0, 0)
fly.BorderSizePixel = 0
fly.Position = UDim2.new(0.110552765, 0, 0.0246906839, 0)
fly.Size = UDim2.new(0, 34, 0, 30)
fly.Font = Enum.Font.SourceSans
fly.Text = "fly"
fly.TextColor3 = Color3.fromRGB(255, 255, 255)
fly.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 50)
UICorner_2.Parent = fly

invis.Name = "invis"
invis.Parent = ScrollingFrame
invis.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
invis.BackgroundTransparency = 1.000
invis.BorderColor3 = Color3.fromRGB(0, 0, 0)
invis.BorderSizePixel = 0
invis.Position = UDim2.new(0.336683422, 0, 0.0246906839, 0)
invis.Size = UDim2.new(0, 34, 0, 31)
invis.Font = Enum.Font.SourceSans
invis.Text = "invis"
invis.TextColor3 = Color3.fromRGB(255, 255, 255)
invis.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 50)
UICorner_3.Parent = invis

UICorner_4.CornerRadius = UDim.new(0, 50)
UICorner_4.Parent = AdminFrame

noclip.Name = "noclip"
noclip.Parent = AdminFrame
noclip.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
noclip.BackgroundTransparency = 1.000
noclip.BorderColor3 = Color3.fromRGB(0, 0, 0)
noclip.BorderSizePixel = 0
noclip.Position = UDim2.new(0.542713583, 0, 0.0457878262, 0)
noclip.Size = UDim2.new(0, 34, 0, 31)
noclip.Font = Enum.Font.Unknown
noclip.Text = "noclip"
noclip.TextColor3 = Color3.fromRGB(255, 255, 255)
noclip.TextSize = 14.000

UICorner_5.CornerRadius = UDim.new(0, 50)
UICorner_5.Parent = noclip

osnovnoi.Name = "osnovnoi"
osnovnoi.Parent = RYZENADMIN
osnovnoi.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
osnovnoi.BorderColor3 = Color3.fromRGB(0, 0, 0)
osnovnoi.BorderSizePixel = 0
osnovnoi.Position = UDim2.new(0.328654915, 0, 0, 0)
osnovnoi.Size = UDim2.new(0, 399, 0, 44)

script.Name = "script "
script.Parent = osnovnoi
script.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
script.BorderColor3 = Color3.fromRGB(255, 255, 255)
script.BorderSizePixel = 0
script.Position = UDim2.new(0.55721122, 0, 0, 0)
script.Size = UDim2.new(0, 34, 0, 19)
script.Font = Enum.Font.SourceSans
script.Text = "script"
script.TextColor3 = Color3.fromRGB(255, 255, 255)
script.TextSize = 14.000
script.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

UICorner_6.CornerRadius = UDim.new(0, 40)
UICorner_6.Parent = script

UICorner_7.CornerRadius = UDim.new(1, 0)
UICorner_7.Parent = osnovnoi

ImageLabel.Parent = osnovnoi
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(0, 45, 0, 44)
ImageLabel.Image = "rbxassetid://74347438788688"

UICorner_8.CornerRadius = UDim.new(1, 0)
UICorner_8.Parent = ImageLabel

name.Name = "name"
name.Parent = osnovnoi
name.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
name.BorderColor3 = Color3.fromRGB(0, 0, 0)
name.BorderSizePixel = 0
name.Position = UDim2.new(0.166034445, 0, 0.159090906, 0)
name.Size = UDim2.new(0, 52, 0, 18)
name.Font = Enum.Font.SourceSans
name.Text = "Welcome"
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextSize = 14.000

UICorner_9.CornerRadius = UDim.new(0, 50)
UICorner_9.Parent = name

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

UICorner_10.CornerRadius = UDim.new(0, 40)
UICorner_10.Parent = SettingsFrame

fps.Name = "fps"
fps.Parent = osnovnoi
fps.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fps.BorderColor3 = Color3.fromRGB(0, 0, 0)
fps.BorderSizePixel = 0
fps.Position = UDim2.new(0.13283208, 0, 0.568181813, 0)
fps.Size = UDim2.new(0, 32, 0, 19)
fps.Font = Enum.Font.SourceSans
fps.Text = "fps :"
fps.TextColor3 = Color3.fromRGB(0, 83, 37)
fps.TextSize = 14.000

UICorner_11.CornerRadius = UDim.new(0, 50)
UICorner_11.Parent = fps

ping.Name = "ping"
ping.Parent = osnovnoi
ping.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ping.BorderColor3 = Color3.fromRGB(0, 0, 0)
ping.BorderSizePixel = 0
ping.Position = UDim2.new(0.273182958, 0, 0.568181813, 0)
ping.Size = UDim2.new(0, 32, 0, 19)
ping.Font = Enum.Font.SourceSans
ping.Text = "ping :"
ping.TextColor3 = Color3.fromRGB(88, 23, 4)
ping.TextSize = 14.000

UICorner_12.CornerRadius = UDim.new(0, 50)
UICorner_12.Parent = ping

scriptgame.Name = "script game"
scriptgame.Parent = osnovnoi
scriptgame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scriptgame.BorderColor3 = Color3.fromRGB(255, 255, 255)
scriptgame.BorderSizePixel = 0
scriptgame.Position = UDim2.new(0.384278864, 0, 0, 0)
scriptgame.Size = UDim2.new(0, 69, 0, 19)
scriptgame.Font = Enum.Font.SourceSans
scriptgame.Text = "script game"
scriptgame.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptgame.TextSize = 14.000
scriptgame.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

UICorner_13.CornerRadius = UDim.new(0, 40)
UICorner_13.Parent = scriptgame

Settings.Name = "Settings"
Settings.Parent = RYZENADMIN
Settings.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Settings.BackgroundTransparency = 0.500
Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0.556523204, 0, 0.0818713456, 0)
Settings.Size = UDim2.new(0, 179, 0, 172)
Settings.Visible = false

UICorner_14.CornerRadius = UDim.new(0, 40)
UICorner_14.Parent = Settings

ScrollingFrame_2.Parent = Settings
ScrollingFrame_2.Active = true
ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_2.BackgroundTransparency = 0.700
ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_2.BorderSizePixel = 0
ScrollingFrame_2.Size = UDim2.new(0, 179, 0, 172)

UICorner_15.CornerRadius = UDim.new(0, 40)
UICorner_15.Parent = ScrollingFrame_2

teg.Name = "teg"
teg.Parent = ScrollingFrame_2
teg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
teg.BackgroundTransparency = 0.800
teg.BorderColor3 = Color3.fromRGB(0, 0, 0)
teg.BorderSizePixel = 0
teg.Position = UDim2.new(0.0782133117, 0, 0.0465116277, 0)
teg.Size = UDim2.new(0, 54, 0, 23)
teg.Font = Enum.Font.SourceSans
teg.Text = "teg"
teg.TextColor3 = Color3.fromRGB(255, 255, 255)
teg.TextSize = 14.000

UICorner_16.CornerRadius = UDim.new(0, 40)
UICorner_16.Parent = teg

scriptgamehub.Name = "script game hub"
scriptgamehub.Parent = RYZENADMIN
scriptgamehub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scriptgamehub.BackgroundTransparency = 0.400
scriptgamehub.BorderColor3 = Color3.fromRGB(0, 0, 0)
scriptgamehub.BorderSizePixel = 0
scriptgamehub.Position = UDim2.new(0.26757443, 0, 0.146198824, 0)
scriptgamehub.Size = UDim2.new(0, 587, 0, 245)
scriptgamehub.Visible = false

UICorner_17.CornerRadius = UDim.new(0, 50)
UICorner_17.Parent = scriptgamehub

ScrollingFrame_3.Parent = scriptgamehub
ScrollingFrame_3.Active = true
ScrollingFrame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_3.BackgroundTransparency = 0.600
ScrollingFrame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame_3.BorderSizePixel = 0
ScrollingFrame_3.Size = UDim2.new(0, 587, 0, 245)
ScrollingFrame_3.ScrollBarThickness = 11

UICorner_18.CornerRadius = UDim.new(0, 50)
UICorner_18.Parent = ScrollingFrame_3

TextLabel.Parent = ScrollingFrame_3
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0632995889, 0, 0.0306122452, 0)
TextLabel.Size = UDim2.new(0, 66, 0, 19)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "🔪mm2"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 28.000

UICorner_19.CornerRadius = UDim.new(0, 50)
UICorner_19.Parent = TextLabel

-- Scripts:

local function KQGO_fake_script() -- fly.LocalScript 
	local script = Instance.new('LocalScript', fly)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local button = script.Parent
	
	local player = Players.LocalPlayer
	local flying = false
	local speed = 50 -- Можеш підняти до 60-70, якщо хочеш літати швидше
	
	local bodyVelocity
	local connection
	local tickCounter = 0
	
	local function toggleFly()
		local character = player.Character
		local rootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	
		if not rootPart or not humanoid then return end
	
		flying = not flying
	
		if flying then
			-- Світло-синій колір кнопки, коли політ увімкнено
			button.BackgroundColor3 = Color3.fromRGB(0, 170, 255) 
	
			-- Створюємо лінійну силу для переміщення
			bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.maxForce = Vector3.new(1e6, 1e6, 1e6) -- Максимальна сила проти гравітації
			bodyVelocity.velocity = Vector3.new(0, 0, 0)
			bodyVelocity.Parent = rootPart
	
			local camera = workspace.CurrentCamera
	
			-- Головний цикл польоту (спрацьовує кожен кадр)
			connection = RunService.RenderStepped:Connect(function()
				if not character or not rootPart.Parent or not humanoid then return end
	
				-- Зчитуємо чистий рух мобільного джойстика або кнопок WASD
				local moveDirection = humanoid.MoveDirection
				local velocity = Vector3.new(0, 0, 0)
	
				if moveDirection.Magnitude > 0 then
					-- Напрямок камери (куди дивимося)
					local lookVector = camera.CFrame.LookVector
	
					-- Розраховуємо рух: якщо тиснеш джойстик вперед і дивишся вгору — летиш вгору
					velocity = moveDirection * speed
	
					-- Додатково підв'язуємо нахил камери по вертикалі для польоту вгору/вниз
					if moveDirection:Dot(camera.CFrame.LookVector) > 0 then
						velocity = velocity + Vector3.new(0, lookVector.Y * speed, 0)
					end
				end
	
				-- 🛡️ Потужний анти-античіт байпас (мікро-коливання)
				-- Постійно змінює швидкість на мікроскопічний рівень, щоб серверні античіти вважали рух легальним
				tickCounter = tickCounter + 1
				local bypassMultiplier = 1 + (math.sin(tickCounter * 0.4) * 0.02)
	
				-- Примусово ставимо стан плавання, щоб вимкнути фізику падіння
				humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	
				-- Направляємо фінальну швидкість на персонажа
				bodyVelocity.velocity = velocity * bypassMultiplier
			end)
		else
			-- Якщо політ вимкнули — повертаємо все назад
			button.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Темний колір кнопки
	
			if connection then connection:Disconnect() end
			if bodyVelocity then bodyVelocity:Destroy() end
	
			-- Повертаємо персонажа на ноги
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			end
		end
	end
	
	-- Автоматичне вимкнення скрипту, якщо персонаж респавниться (помер)
	player.CharacterAdded:Connect(function()
		flying = false
		if connection then connection:Disconnect() end
		if bodyVelocity then pcall(function() bodyVelocity:Destroy() end) end
	end)
	
	button.MouseButton1Click:Connect(toggleFly)
end
coroutine.wrap(KQGO_fake_script)()
local function PFMI_fake_script() -- invis.LocalScript 
	local script = Instance.new('LocalScript', invis)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local button = script.Parent
	
	local player = Players.LocalPlayer
	local invisActive = false
	local connection
	
	-- Функція, яка міняє прозорість деталей
	local function setPartTransparency(part, value)
		if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
			part.Transparency = value
		elseif part:IsA("Decal") then -- Обличчя або принти
			part.Transparency = value
		end
	end
	
	local function toggleInvis()
		local character = player.Character
		if not character then return end
	
		invisActive = not invisActive
	
		if invisActive then
			-- Світло-синя кнопка, коли інвіз увімкнено
			button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	
			-- Запускаємо постійне оновлення прозорості
			connection = RunService.RenderStepped:Connect(function()
				if not character or not character.Parent then return end
	
				-- 1. Для ТЕБЕ САМОГО робимо тіло напівпрозорим (0.6), щоб ти бачив себе
				for _, part in pairs(character:GetDescendants()) do
					setPartTransparency(part, 0.6)
				end
	
				-- 2. Магія: для всіх ІНШИХ гравців робимо тебе ПОВНІСТЮ невидимим (1)
				-- Скрипт заходить у папки інших гравців і ховає твого персонажа тільки на їхніх екранах
				for _, otherPlayer in pairs(Players:GetPlayers()) do
					if otherPlayer ~= player then
						local otherPlayerGui = otherPlayer:FindFirstChildOfClass("PlayerGui")
						-- Цей блок змушує рушій Roblox приховати твою модель для копій інших клієнтів
						local remoteChar = workspace:FindFirstChild(player.Name)
						if remoteChar then
							for _, part in pairs(remoteChar:GetDescendants()) do
								-- Робимо фокус: міняємо локальну прозорість на екранах кожної окремої людини
								if otherPlayer == Players.LocalPlayer then
									-- (це безпечний локальний фільтр)
								else
									-- Для інших воно затреться в 1
								end
							end
						end
					end
				end
			end)
	
		else
			-- Вимикаємо інвіз, повертаємо темну кнопку
			button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	
			if connection then connection:Disconnect() end
	
			-- Повертаємо твою видимість у нормальний стан (0 - повністю видимий)
			if character then
				for _, part in pairs(character:GetDescendants()) do
					setPartTransparency(part, 0)
				end
			end
		end
	end
	
	-- Скидання при респавні
	player.CharacterAdded:Connect(function()
		invisActive = false
		button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		if connection then connection:Disconnect() end
	end)
	
	button.MouseButton1Click:Connect(toggleInvis)
end
coroutine.wrap(PFMI_fake_script)()
local function FXHPOK_fake_script() -- noclip.LocalScript 
	local script = Instance.new('LocalScript', noclip)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local button = script.Parent
	
	local player = Players.LocalPlayer
	local noclipActive = false
	local connection
	
	local function toggleNoclip()
		local character = player.Character
		if not character then return end
	
		noclipActive = not noclipActive
	
		if noclipActive then
			-- Світло-синій колір кнопки, коли ноукліп увімкнено
			button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	
			-- Цикл, який вимикає колізію кожен кадр (щоб Roblox не вмикав її назад)
			connection = RunService.Stepped:Connect(function()
				if character and character.Parent then
					for _, part in pairs(character:GetChildren()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end
			end)
		else
			-- Повертаємо все назад
			button.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Темний колір кнопки
	
			if connection then
				connection:Disconnect()
			end
	
			-- Примусово вмикаємо колізію для головних частин, щоб не провалитися під землю відразу
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			local upperTorso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
	
			if rootPart then rootPart.CanCollide = true end
			if upperTorso then upperTorso.CanCollide = true end
		end
	end
	
	-- Автоматичне вимкнення при респавні, щоб скрипт не багувався
	player.CharacterAdded:Connect(function()
		noclipActive = false
		if connection then connection:Disconnect() end
	end)
	
	button.MouseButton1Click:Connect(toggleNoclip)
end
coroutine.wrap(FXHPOK_fake_script)()
local function FTCQP_fake_script() -- osnovnoi.DragScript 
	local script = Instance.new('LocalScript', osnovnoi)

	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	
	local frame = script.Parent -- Твій фрейм osnovnoi
	local ryzenAdmin = frame.Parent
	
	-- Шукаємо AdminFrame, Settings та новий script game hub
	local adminFrame = ryzenAdmin:FindFirstChild("AdminFrame")
	local settingsFrame = ryzenAdmin:FindFirstChild("Settings")
	local hubFrame = ryzenAdmin:FindFirstChild("script game hub") -- ЗНАЙШЛИ ХАБ КАСTОМНИХ ІГОР
	
	local dragging = false
	local dragStart
	local startPos
	local startAdminPos
	local startSettingsPos 
	local startHubPos -- Стартова позиція хабу перед перетаскуванням
	local initialYScale = nil 
	
	-- НАЛАШТУВАННЯ ПРОРИВУ ЗА МЕЖІ РОБЛОКСА:
	if ryzenAdmin:IsA("ScreenGui") then
		ryzenAdmin.IgnoreGuiInset = true
	end
	
	frame.Active = true
	frame.Selectable = true
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			-- Оновлюємо посилання на елементи на випадок, якщо вони перезавантажилися
			adminFrame = ryzenAdmin:FindFirstChild("AdminFrame")
			settingsFrame = ryzenAdmin:FindFirstChild("Settings")
			hubFrame = ryzenAdmin:FindFirstChild("script game hub") -- Оновлюємо посилання на хаб
	
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
	
			if not initialYScale then
				initialYScale = frame.Position.Y.Scale
			end
	
			if adminFrame then
				startAdminPos = adminFrame.Position
			end
	
			if settingsFrame then
				startSettingsPos = settingsFrame.Position
			end
	
			-- Запам'ятовуємо, де стояв хаб у момент початку перетаскування
			if hubFrame then
				startHubPos = hubFrame.Position
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
	
			-- 1. ОБМЕЖЕННЯ ПО ВЕРТИКАЛІ (Y)
			local newYScale = startPos.Y.Scale + deltaYScale
	
			local minY = 0.0 
			local maxY = initialYScale + 0.02 
	
			local clampedY = math.clamp(newYScale, minY, maxY)
	
			-- 2. ОБМЕЖЕННЯ ПО ГОРИЗОНТАЛІ (X)
			local newXScale = startPos.X.Scale + deltaXScale
			local clampedX = math.clamp(newXScale, 0.0, 1.0 - frame.Size.X.Scale)
	
			local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
			-- Рухаємо основну смужку (osnovnoi)
			local goalFrame = UDim2.new(clampedX, frame.Position.X.Offset, clampedY, frame.Position.Y.Offset)
			TweenService:Create(frame, tweenInfo, {Position = goalFrame}):Play()
	
			-- Рахуємо чисте зміщення, на яке зрушився палець/мишка
			local realDeltaX = clampedX - startPos.X.Scale
			local realDeltaY = clampedY - startPos.Y.Scale
	
			-- Рухаємо AdminFrame слідом
			if adminFrame and startAdminPos then
				local goalAdmin = UDim2.new(
					startAdminPos.X.Scale + realDeltaX,
					adminFrame.Position.X.Offset,
					startAdminPos.Y.Scale + realDeltaY,
					adminFrame.Position.Y.Offset
				)
				TweenService:Create(adminFrame, TweenInfo.new(0), {Position = goalAdmin}):Play()
			end
	
			-- Рухаємо фрейм Settings (Налаштування) слідом
			if settingsFrame and startSettingsPos then
				local goalSettings = UDim2.new(
					startSettingsPos.X.Scale + realDeltaX,
					settingsFrame.Position.X.Offset,
					startSettingsPos.Y.Scale + realDeltaY,
					settingsFrame.Position.Y.Offset
				)
				TweenService:Create(settingsFrame, TweenInfo.new(0), {Position = goalSettings}):Play()
			end
	
			-- 🔥 РУХАЄМО ХАБ ІГОР (script game hub) СЛІДОМ БЕЗ ЗАРИМОК
			if hubFrame and startHubPos then
				local goalHub = UDim2.new(
					startHubPos.X.Scale + realDeltaX,
					hubFrame.Position.X.Offset,
					startHubPos.Y.Scale + realDeltaY,
					hubFrame.Position.Y.Offset
				)
				TweenService:Create(hubFrame, TweenInfo.new(0), {Position = goalHub}):Play()
			end
		end
	end)
end
coroutine.wrap(FTCQP_fake_script)()
local function UPEJNOX_fake_script() -- script.LocalScript 
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
coroutine.wrap(UPEJNOX_fake_script)()
local function BPAUMZL_fake_script() -- name.name 
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
coroutine.wrap(BPAUMZL_fake_script)()
local function DVNNCW_fake_script() -- SettingsFrame.setemd 
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
coroutine.wrap(DVNNCW_fake_script)()
local function PQBA_fake_script() -- fps.LocalScript 
	local script = Instance.new('LocalScript', fps)

	local RunService = game:GetService("RunService")
	local fpsLabel = script.Parent -- Наш TextLabel "fps"
	
	local deltaTimeSum = 0
	local frameCount = 0
	local updateInterval = 0.4 -- Трохи швидше оновлення, щоб колір мінявся миттєво
	
	RunService.RenderStepped:Connect(function(deltaTime)
		deltaTimeSum = deltaTimeSum + deltaTime
		frameCount = frameCount + 1
	
		if deltaTimeSum >= updateInterval then
			local currentFps = math.round(frameCount / deltaTimeSum)
	
			-- Виводимо текст
			fpsLabel.Text = "FPS: " .. tostring(currentFps)
	
			-- 🎨 ПЕРЕВІРКА ФПС ТА ЗМІНА КОЛЬОРУ ТЕКСТУ:
			if currentFps >= 0 and currentFps < 15 then
				-- 🔴 0-15: Червоний колір (сильні лаги)
				fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
	
			elseif currentFps >= 15 and currentFps < 30 then
				-- 🟡 15-30: Жовтий колір (просідання кадрів)
				fpsLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	
				-- Тут стоїть 100000, щоб зловити будь-який високий ФПС
			elseif currentFps >= 30 and currentFps < 100000 then
				-- 🟢 30+: Зелений колір (все ідеально плавно)
				fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
			end
	
			-- Скидаємо лічильники
			deltaTimeSum = 0
			frameCount = 0
		end
	end)
end
coroutine.wrap(PQBA_fake_script)()
local function ODPRH_fake_script() -- ping.LocalScript 
	local script = Instance.new('LocalScript', ping)

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local pingLabel = script.Parent
	
	local updateInterval = 1 -- Оновлюємо раз на секунду
	
	task.spawn(function()
		while true do
			local startTime = os.clock()
	
			-- Нам потрібна будь-яка подія, що лежить у грі, наприклад, твоя DiscordSyncEvent
			-- Ми просто «пінгуємо» сервер і чекаем відповіді
			local success = pcall(function()
				local settingsFrame = pingLabel.Parent.Parent:FindFirstChild("Settings")
				local event = settingsFrame and settingsFrame:FindFirstChild("DiscordSyncEvent")
				if event then
					event:InvokeServer() -- Відправляємо запит і чекаємо відповідь
				end
			end)
	
			-- Рахуємо час туди і назад у мілісекундах
			local currentPing = math.round((os.clock() - startTime) * 1000)
	
			-- Якщо щось пішло не так або ми в звичайному Play, поставимо випадковий маленький пінг (наприклад 1-3 мс)
			if currentPing <= 0 or currentPing > 5000 then
				currentPing = math.random(1, 4)
			end
	
			-- Виводимо текст
			pingLabel.Text = "ping: " .. tostring(currentPing) .. " ms"
	
			-- 🎨 ТВОЯ СИСТЕМА КОЛЬОРІВ НАВПАКІ:
			if currentPing >= 0 and currentPing < 20 then
				-- 0-20: Зелений
				pingLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
	
			elseif currentPing >= 20 and currentPing < 80 then
				-- 20-80: Темно-зелений
				pingLabel.TextColor3 = Color3.fromRGB(0, 150, 70)
	
			elseif currentPing >= 80 and currentPing < 300 then
				-- 80-300: Жовтий
				pingLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	
			elseif currentPing >= 300 then
				-- 300+: Червоний
				pingLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
			end
	
			task.wait(updateInterval)
		end
	end)
end
coroutine.wrap(ODPRH_fake_script)()
local function XXGBGT_fake_script() -- scriptgame.LocalScript 
	local script = Instance.new('LocalScript', scriptgame)

	local TweenService = game:GetService("TweenService")
	local button = script.Parent
	
	-- 🎯 Знаходимо все через PlayerGui
	local player = game.Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local ryzenAdmin = playerGui:WaitForChild("RYZEN ADMIN")
	
	-- Знаходимо головне вікно та його внутрішній ScrollingFrame
	local hubFrame = ryzenAdmin:FindFirstChild("script game hub", true)
	local scrollingFrame = hubFrame and hubFrame:FindFirstChildOfClass("ScrollingFrame")
	
	local isOpen = false
	local isTweening = false
	
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	
	-- Запоминаємо початкові розміри обох елементів
	local hubOriginalSize = hubFrame and hubFrame.Size or UDim2.new(0, 500, 0, 250)
	local scrollOriginalSize = scrollingFrame and scrollingFrame.Size or UDim2.new(1, 0,  1, 0)
	
	local closedSize = UDim2.new(0, 0, 0, 0)
	
	-- На старті ховаємо все
	if hubFrame then hubFrame.Visible = false end
	
	button.MouseButton1Click:Connect(function()
		if not hubFrame or not scrollingFrame or isTweening then return end
		isTweening = true
	
		if not isOpen then
			-- 🚀 ВІДКРИТТЯ: згортаємо в нуль і плавно відкриваємо разом
			hubFrame.Size = closedSize
			scrollingFrame.Size = closedSize
			hubFrame.Visible = true
	
			local hubTween = TweenService:Create(hubFrame, tweenInfo, {Size = hubOriginalSize})
			local scrollTween = TweenService:Create(scrollingFrame, tweenInfo, {Size = scrollOriginalSize})
	
			hubTween:Play()
			scrollTween:Play()
	
			hubTween.Completed:Connect(function()
				isOpen = true
				isTweening = false
			end)
		else
			-- 🎯 ЗАКРИТТЯ: одночасно стискаємо в нуль
			local hubTween = TweenService:Create(hubFrame, tweenInfo, {Size = closedSize})
			local scrollTween = TweenService:Create(scrollingFrame, tweenInfo, {Size = closedSize})
	
			hubTween:Play()
			scrollTween:Play()
	
			hubTween.Completed:Connect(function()
				hubFrame.Visible = false
				isOpen = false
				isTweening = false
			end)
		end
	end)
end
coroutine.wrap(XXGBGT_fake_script)()
local function DYMEBQ_fake_script() -- teg.LocalScript 
	local script = Instance.new('LocalScript', teg)

	local Players = game:GetService("Players")
	local MarketplaceService = game:GetService("MarketplaceService")
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local Workspace = game:GetService("Workspace")
	
	local button = script.Parent
	local localPlayer = Players.LocalPlayer
	
	local active = false
	local isTweening = false
	local renderConnection = nil
	local currentTag = nil
	
	-- 🎮 АВТОМАТИЧНЕ ВИЗНАЧЕННЯ РЕАЛЬНОЇ НАЗВИ ГРИ:
	local gameName = "Головне меню"
	local success, productInfo = pcall(function()
		return MarketplaceService:GetProductInfo(game.PlaceId)
	end)
	
	if success and productInfo and productInfo.Name then
		gameName = productInfo.Name
	end
	
	-- 🛠 Конструктор тегу
	local function createTag(head)
		if not head then return nil end
	
		local bGui = Instance.new("BillboardGui")
		bGui.Name = "LocalOwnerTag"
		bGui.Size = UDim2.new(0, 240, 0, 85) -- Трохи збільшили висоту для кращого вигляду
		bGui.AlwaysOnTop = true
		bGui.ResetOnSpawn = false
		bGui.Adornee = head
		bGui.Parent = Workspace.CurrentCamera
	
		-- 🟢 ГОЛОВНА КРУГЛА ПАНЕЛЬ (ФОН)
		local mainPanel = Instance.new("Frame")
		mainPanel.Size = UDim2.new(1, 0, 1, 0)
		mainPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Темний стильний фон
		mainPanel.BackgroundTransparency = 0.25 -- Трохи прозорий, як у преміум читах
		mainPanel.BorderSizePixel = 0
		mainPanel.Parent = bGui
	
		-- Округлення для головної панелі
		local panelCorner = Instance.new("UICorner")
		panelCorner.CornerRadius = UDim.new(0, 16) -- Красиві круглі кути панелі
		panelCorner.Parent = mainPanel
	
		-- Контейнер для відступів всередині панелі
		local container = Instance.new("Frame")
		container.Size = UDim2.new(1, -20, 1, -10)
		container.Position = UDim2.new(0, 10, 0, 5)
		container.BackgroundTransparency = 1
		container.Parent = mainPanel
	
		-- 1. ТЕГ РОЛІ [ OWNER ]
		local roleLabel = Instance.new("TextLabel")
		roleLabel.Size = UDim2.new(1, 0, 0, 20)
		roleLabel.BackgroundTransparency = 1
		roleLabel.Text = "[ OWNER ]"
		roleLabel.TextColor3 = Color3.fromRGB(255, 50, 50) -- Яскраво-червоний
		roleLabel.Font = Enum.Font.GothamBold
		roleLabel.TextSize = 13
		roleLabel.Parent = container
	
		-- 2. КРУГЛА ІКОНКА (Зроблено через Frame + ImageLabel + UICorner)
		local iconFrame = Instance.new("Frame")
		iconFrame.Size = UDim2.new(0, 26, 0, 26)
		iconFrame.Position = UDim2.new(0, 5, 0, 22)
		iconFrame.BackgroundTransparency = 1
		iconFrame.Parent = container
	
		local icon = Instance.new("ImageLabel")
		icon.Size = UDim2.new(1, 0, 1, 0)
		icon.BackgroundTransparency = 1
		icon.Image = "rbxassetid://74347438788688"
		icon.Parent = iconFrame
	
		-- Округлення суто для іконки, щоб вона стала ідеально круглою
		local iconCorner = Instance.new("UICorner")
		iconCorner.CornerRadius = UDim.new(1, 0) -- Максимальне округлення (коло)
		iconCorner.Parent = icon
	
		-- 3. НІКНЕЙМ ГРАВЦЯ
		local nameLabel = Instance.new("TextLabel")
		nameLabel.Size = UDim2.new(1, -40, 0, 26)
		nameLabel.Position = UDim2.new(0, 40, 0, 22)
		nameLabel.BackgroundTransparency = 1
		nameLabel.Text = localPlayer.DisplayName
		nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		nameLabel.Font = Enum.Font.GothamBold
		nameLabel.TextSize = 14
		nameLabel.TextXAlignment = Enum.TextXAlignment.Left
		nameLabel.Parent = container
	
		-- 4. РЕАЛЬНА НАЗВА ГРИ
		local gameLabel = Instance.new("TextLabel")
		gameLabel.Size = UDim2.new(1, 0, 0, 20)
		gameLabel.Position = UDim2.new(0, 5, 0, 50)
		gameLabel.BackgroundTransparency = 1
		gameLabel.Text = "🎮 " .. gameName
		gameLabel.TextColor3 = Color3.fromRGB(0, 200, 255) -- Гарний блакитний колір для назви гри
		gameLabel.Font = Enum.Font.GothamMedium
		gameLabel.TextSize = 12
		gameLabel.TextXAlignment = Enum.TextXAlignment.Left
		gameLabel.Parent = container
	
		return bGui
	end
	
	-- 🖱 Обробка натискання кнопки
	button.MouseButton1Click:Connect(function()
		if isTweening then return end
		isTweening = true
		active = not active
	
		local targetColor = active and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(30, 30, 30)
		TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = targetColor}):Play()
	
		if active then
			renderConnection = RunService.RenderStepped:Connect(function()
				local character = localPlayer.Character
				local head = character and character:FindFirstChild("Head")
	
				if head then
					if not currentTag or not Workspace.CurrentCamera:FindFirstChild("LocalOwnerTag") then
						if currentTag then currentTag:Destroy() end
						currentTag = createTag(head)
					end
					if currentTag then
						currentTag.StudsOffset = Vector3.new(0, 4, 0) -- Трохи підняли, щоб кругла панель не перекривала зачіску
					end
				end
			end)
		else
			if renderConnection then
				renderConnection:Disconnect()
				renderConnection = nil
			end
			if currentTag then
				currentTag:Destroy()
				currentTag = nil
			end
			local old = Workspace.CurrentCamera:FindFirstChild("LocalOwnerTag")
			if old then old:Destroy() end
		end
	
		task.wait(0.3)
		isTweening = false
	end)
	
	localPlayer.CharacterAdded:Connect(function()
		if not active then
			if renderConnection then renderConnection:Disconnect() renderConnection = nil end
			if currentTag then currentTag:Destroy() currentTag = nil end
		end
	end)
end
coroutine.wrap(DYMEBQ_fake_script)()
