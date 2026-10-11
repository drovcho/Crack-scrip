local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")
local player = Players.LocalPlayer
if _G.RockHubUnload then
	pcall(_G.RockHubUnload)
end
local toggleKey = Enum.KeyCode.RightShift
local blurSize = 16
local keyListener
local bgColor = Color3.fromRGB(14, 14, 14)
local panelColor = Color3.fromRGB(20, 20, 20)
local elemColor = Color3.fromRGB(27, 27, 27)
local hoverColor = Color3.fromRGB(36, 36, 36)
local strokeColor = Color3.fromRGB(42, 42, 42)
local textColor = Color3.fromRGB(230, 230, 230)
local dimColor = Color3.fromRGB(120, 120, 120)
local mutedColor = Color3.fromRGB(85, 85, 85)
local accentColor = Color3.fromRGB(255, 255, 255)
local connections = {}
local lobbyBrand

local function connect(signal, fn)
	local c = signal:Connect(fn)
	table.insert(connections, c)
	return c
end

local function create(className, props)
	local inst = Instance.new(className)
	local parent = props.Parent
	props.Parent = nil
	for k, v in pairs(props) do
		inst[k] = v
	end
	inst.Parent = parent
	return inst
end

local function addCorner(inst, r)
	create("UICorner", { CornerRadius = UDim.new(0, r or 6), Parent = inst })
end

local function makeRound(inst)
	create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = inst })
end

local function addStroke(inst, color)
	return create("UIStroke", {
		Color = color or strokeColor,
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = inst,
	})
end

local function tween(inst, t, props, dir, style)
	local tw = TweenService:Create(inst, TweenInfo.new(t, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end

local gradients = {}

local function addGradient(target)
	local gradient = create("UIGradient", { Parent = target })
	table.insert(gradients, gradient)
	return gradient
end

local function shimmerSeq(t)
	local kps = {}
	for i = 0, 8 do
		local x = i / 8
		local v = 0.5 + 0.5 * math.sin((x - t) * math.pi * 2)
		local c = math.floor(80 + v * 175)
		kps[#kps + 1] = ColorSequenceKeypoint.new(x, Color3.fromRGB(c, c, c))
	end
	return ColorSequence.new(kps)
end

local function line(parent, x1, y1, x2, y2, th, color)
	local dx, dy = x2 - x1, y2 - y1
	local len = math.sqrt(dx * dx + dy * dy)
	local f = create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset((x1 + x2) / 2, (y1 + y2) / 2),
		Size = UDim2.fromOffset(len + th * 0.6, th),
		Rotation = math.deg(math.atan2(dy, dx)),
		BackgroundColor3 = color or dimColor,
		BorderSizePixel = 0,
		Parent = parent,
	})
	makeRound(f)
	return f
end

local function dot(parent, x, y, size)
	local f = create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(x, y),
		Size = UDim2.fromOffset(size, size),
		BackgroundColor3 = dimColor,
		BorderSizePixel = 0,
		Parent = parent,
	})
	makeRound(f)
	return f
end

local function createIcon(kind, parent)
	local holder = create("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(18, 18),
		BackgroundTransparency = 1,
		ZIndex = 3,
		Parent = parent,
	})
	local scale = create("UIScale", { Parent = holder })
	local parts = {}

	local function add(inst, prop)
		table.insert(parts, { inst, prop })
	end

	if kind == "move" then
		add(dot(holder, 11.5, 2.8, 4.6), "BackgroundColor3")
		local lines = {
			{ 10, 6, 8, 11 },
			{ 9.6, 7, 12.6, 9 },
			{ 12.6, 9, 15, 7.4 },
			{ 9.6, 7, 6.6, 8.6 },
			{ 6.6, 8.6, 4.6, 7 },
			{ 8, 11, 11, 13.4 },
			{ 11, 13.4, 10.6, 17 },
			{ 8, 11, 6, 14 },
			{ 6, 14, 2.6, 15 },
		}
		for _, s in ipairs(lines) do
			add(line(holder, s[1], s[2], s[3], s[4], 2), "BackgroundColor3")
		end
	elseif kind == "eye" then
		local eye = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(9, 9),
			Size = UDim2.fromOffset(16, 10),
			BackgroundTransparency = 1,
			Parent = holder,
		})
		makeRound(eye)
		add(create("UIStroke", { Color = dimColor, Thickness = 1.6, Parent = eye }), "Color")
		add(dot(holder, 9, 9, 5), "BackgroundColor3")
	elseif kind == "wing" then
		add(dot(holder, 3, 15, 3.4), "BackgroundColor3")
		local lines = { { 3, 15, 9, 3 }, { 9, 3, 16.5, 5 }, { 7.4, 6.4, 15.5, 9.6 }, { 5.6, 9.8, 13, 14.2 } }
		for _, s in ipairs(lines) do
			add(line(holder, s[1], s[2], s[3], s[4], 1.8), "BackgroundColor3")
		end
	elseif kind == "sliders" then
		local rows = { { 4, 6 }, { 9, 12 }, { 14, 8 } }
		for _, r in ipairs(rows) do
			add(line(holder, 2, r[1], 16, r[1], 1.6), "BackgroundColor3")
			add(dot(holder, r[2], r[1], 5), "BackgroundColor3")
		end
	elseif kind == "star" then
		add(line(holder, 9, 1.5, 9, 16.5, 2), "BackgroundColor3")
		add(line(holder, 1.5, 9, 16.5, 9, 2), "BackgroundColor3")
		add(line(holder, 5, 5, 13, 13, 1.4), "BackgroundColor3")
		add(line(holder, 13, 5, 5, 13, 1.4), "BackgroundColor3")
		add(dot(holder, 9, 9, 5), "BackgroundColor3")
	elseif kind == "gear" then
		local ring = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(9, 9),
			Size = UDim2.fromOffset(10, 10),
			BackgroundTransparency = 1,
			Parent = holder,
		})
		makeRound(ring)
		add(create("UIStroke", { Color = dimColor, Thickness = 2.6, Parent = ring }), "Color")
		for i = 0, 7 do
			local a = math.rad(i * 45)
			add(line(holder, 9 + math.cos(a) * 5.5, 9 + math.sin(a) * 5.5, 9 + math.cos(a) * 8, 9 + math.sin(a) * 8, 3), "BackgroundColor3")
		end
	elseif kind == "target" then
		local ring = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(9, 9),
			Size = UDim2.fromOffset(12, 12),
			BackgroundTransparency = 1,
			Parent = holder,
		})
		makeRound(ring)
		add(create("UIStroke", { Color = dimColor, Thickness = 1.6, Parent = ring }), "Color")
		add(line(holder, 9, 0.5, 9, 4.5, 1.6), "BackgroundColor3")
		add(line(holder, 9, 13.5, 9, 17.5, 1.6), "BackgroundColor3")
		add(line(holder, 0.5, 9, 4.5, 9, 1.6), "BackgroundColor3")
		add(line(holder, 13.5, 9, 17.5, 9, 1.6), "BackgroundColor3")
		add(dot(holder, 9, 9, 3), "BackgroundColor3")
	elseif kind == "cart" then
		local lines = {
			{ 1, 3, 4, 3 },
			{ 4, 3, 6.2, 11.5 },
			{ 4.8, 5.5, 16.5, 5.5 },
			{ 16.5, 5.5, 14.8, 11.5 },
			{ 6.2, 11.5, 14.8, 11.5 },
			{ 5.5, 8.5, 15.8, 8.5 },
		}
		for _, s in ipairs(lines) do
			add(line(holder, s[1], s[2], s[3], s[4], 1.7), "BackgroundColor3")
		end
		add(dot(holder, 7.2, 15, 3.2), "BackgroundColor3")
		add(dot(holder, 13.8, 15, 3.2), "BackgroundColor3")
	elseif kind == "pin" then
		local ring = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(9, 7),
			Size = UDim2.fromOffset(10, 10),
			BackgroundTransparency = 1,
			Parent = holder,
		})
		makeRound(ring)
		add(create("UIStroke", { Color = dimColor, Thickness = 1.8, Parent = ring }), "Color")
		add(line(holder, 4.8, 9.6, 9, 16.5, 1.8), "BackgroundColor3")
		add(line(holder, 13.2, 9.6, 9, 16.5, 1.8), "BackgroundColor3")
		add(dot(holder, 9, 7, 3), "BackgroundColor3")
	elseif kind == "smile" then
		add(dot(holder, 5.5, 6, 3.4), "BackgroundColor3")
		add(dot(holder, 12.5, 6, 3.4), "BackgroundColor3")
		add(line(holder, 4, 11, 6.8, 13.8, 2), "BackgroundColor3")
		add(line(holder, 6.8, 13.8, 11.2, 13.8, 2), "BackgroundColor3")
		add(line(holder, 11.2, 13.8, 14, 11, 2), "BackgroundColor3")
	elseif kind == "bolt" then
		add(line(holder, 12, 1.5, 5.5, 10, 2.4), "BackgroundColor3")
		add(line(holder, 5.5, 10, 12.5, 8, 2.4), "BackgroundColor3")
		add(line(holder, 12.5, 8, 6, 16.5, 2.4), "BackgroundColor3")
	elseif kind == "globe" then
		local ring = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(9, 9),
			Size = UDim2.fromOffset(16, 16),
			BackgroundTransparency = 1,
			Parent = holder,
		})
		makeRound(ring)
		add(create("UIStroke", { Color = dimColor, Thickness = 1.5, Parent = ring }), "Color")
		local meridian = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(9, 9),
			Size = UDim2.fromOffset(7, 16),
			BackgroundTransparency = 1,
			Parent = holder,
		})
		makeRound(meridian)
		add(create("UIStroke", { Color = dimColor, Thickness = 1.3, Parent = meridian }), "Color")
		add(line(holder, 1.5, 9, 16.5, 9, 1.3), "BackgroundColor3")
		add(line(holder, 3, 5, 15, 5, 1.1), "BackgroundColor3")
		add(line(holder, 3, 13, 15, 13, 1.1), "BackgroundColor3")
	elseif kind == "drone" then
		for _, c in ipairs({ { 4, 4 }, { 14, 4 }, { 4, 14 }, { 14, 14 } }) do
			add(line(holder, 9, 9, c[1], c[2], 1.8), "BackgroundColor3")
			local r = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromOffset(c[1], c[2]),
				Size = UDim2.fromOffset(6, 6),
				BackgroundTransparency = 1,
				Parent = holder,
			})
			makeRound(r)
			add(create("UIStroke", { Color = dimColor, Thickness = 1.4, Parent = r }), "Color")
		end
		add(dot(holder, 9, 9, 5), "BackgroundColor3")
	elseif kind == "grid" then
		for _, p in ipairs({ { 4.5, 4.5 }, { 13.5, 4.5 }, { 4.5, 13.5 }, { 13.5, 13.5 } }) do
			local sq = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromOffset(p[1], p[2]),
				Size = UDim2.fromOffset(6.5, 6.5),
				BackgroundColor3 = dimColor,
				BorderSizePixel = 0,
				Parent = holder,
			})
			addCorner(sq, 2)
			add(sq, "BackgroundColor3")
		end
	end
	local icon = {}

	icon.color = function(c, t)
		for _, p in ipairs(parts) do
			tween(p[1], t or 0.2, { [p[2]] = c })
		end
	end

	icon.pop = function()
		scale.Scale = 0.7
		tween(scale, 0.35, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
	end

	return icon
end

local gui = create("ScreenGui", {
	Name = "RockHub",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 100,
})
local parented = false
if gethui then
	parented = pcall(function()
		gui.Parent = gethui()
	end)
end
if not parented then
	parented = pcall(function()
		gui.Parent = game:GetService("CoreGui")
	end)
end
if not parented then
	gui.Parent = player:WaitForChild("PlayerGui")
end
pcall(function()
	gui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	gui.ClipToDeviceSafeArea = true
end)

local function findLobbyBrandWall()
	local lobby = workspace:FindFirstChild("RegularLobby")
	local mainLobby = lobby and lobby:FindFirstChild("MainLobby")
	local parts = mainLobby and mainLobby:FindFirstChild("Parts")
	if not parts then
		return
	end
	for _, part in ipairs(parts:GetChildren()) do
		if part:IsA("BasePart") then
			local size = part.Size
			if math.abs(size.X - 13.7) < 0.3 and math.abs(size.Y - 14.5) < 0.3 and math.abs(size.Z - 0.5) < 0.2 then
				return part
			end
		end
	end
end

local function attachLobbyBrand()
	local wall = findLobbyBrandWall()
	if not wall then
		return
	end
	local old = wall:FindFirstChild("RockHubWallBrand")
	if old then
		old:Destroy()
	end
	lobbyBrand = create("Part", {
		Name = "RockHubWallBrand",
		Anchored = true,
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		CastShadow = false,
		Transparency = 1,
		Size = Vector3.new(24, 4, 0.1),
		CFrame = wall.CFrame * CFrame.new(0, wall.Size.Y / 2 + 3.2, wall.Size.Z / 2 + 0.06),
		Parent = wall,
	})
	local surface = create("SurfaceGui", {
		Name = "Surface",
		Face = Enum.NormalId.Back,
		AlwaysOnTop = false,
		LightInfluence = 0,
		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = 60,
		Parent = lobbyBrand,
	})
	create("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBlack,
		RichText = true,
		Text = '<font color="#FFFFFF">ROCK</font> <font color="#A8FF3E">HUB</font>',
		TextScaled = true,
		TextColor3 = Color3.new(1, 1, 1),
		TextStrokeColor3 = Color3.new(0, 0, 0),
		TextStrokeTransparency = 0,
		Parent = surface,
	})
end

task.spawn(function()
	while gui.Parent do
		if not lobbyBrand or not lobbyBrand.Parent then
			attachLobbyBrand()
		end
		task.wait(2)
	end
end)
local blur = create("BlurEffect", { Name = "RockHubBlur", Size = 0, Parent = Lighting })
local main = create("Frame", {
	Name = "Main",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(680, 470),
	BackgroundColor3 = bgColor,
	BorderSizePixel = 0,
	Visible = false,
	ZIndex = 2,
	Parent = gui,
})
addCorner(main, 10)
local mainStroke = create("UIStroke", { Thickness = 1, Color = accentColor, Transparency = 0.3, Parent = main })
addGradient(mainStroke)
local mainScale = create("UIScale", { Scale = 0, Parent = main })
local menuOpen = false
local responsiveScale = 1
local viewportConnection
local updateWatermarkResponsive

local function updateResponsiveScale()
	local cam = workspace.CurrentCamera
	if not cam then
		return
	end
	local viewport = cam.ViewportSize
	local topLeft, bottomRight = Vector2.zero, Vector2.zero
	pcall(function()
		topLeft, bottomRight = GuiService:GetGuiInset()
	end)
	local margin = UserInputService.TouchEnabled and 16 or 24
	local availableWidth = math.max(1, viewport.X - topLeft.X - bottomRight.X - margin)
	local availableHeight = math.max(1, viewport.Y - topLeft.Y - bottomRight.Y - margin)
	responsiveScale = math.clamp(math.min(availableWidth / 680, availableHeight / 470), 0.35, 1)
	if UserInputService.TouchEnabled then
		main.Position = UDim2.fromScale(0.5, 0.5)
	end
	if menuOpen then
		mainScale.Scale = responsiveScale
	end
	if updateWatermarkResponsive then
		updateWatermarkResponsive()
	end
end

local function bindViewport()
	if viewportConnection then
		viewportConnection:Disconnect()
	end
	local cam = workspace.CurrentCamera
	if cam then
		viewportConnection = connect(cam:GetPropertyChangedSignal("ViewportSize"), updateResponsiveScale)
	end
	updateResponsiveScale()
end

connect(workspace:GetPropertyChangedSignal("CurrentCamera"), bindViewport)
connect(gui:GetPropertyChangedSignal("AbsoluteSize"), updateResponsiveScale)
bindViewport()
local topBar = create("Frame", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, Parent = main })
local logo = create("TextLabel", {
	Text = "Rock Hub t.me/rockscript",
	Font = Enum.Font.GothamBold,
	TextSize = 16,
	TextColor3 = accentColor,
	TextXAlignment = Enum.TextXAlignment.Left,
	BackgroundTransparency = 1,
	Position = UDim2.fromOffset(14, 0),
	Size = UDim2.new(0, 205, 1, 0),
	Parent = topBar,
})
addGradient(logo)
create("TextLabel", {
	Text = "v2.0",
	Font = Enum.Font.Gotham,
	TextSize = 11,
	TextColor3 = dimColor,
	TextXAlignment = Enum.TextXAlignment.Left,
	BackgroundTransparency = 1,
	Position = UDim2.fromOffset(219, 1),
	Size = UDim2.new(0, 40, 1, 0),
	Parent = topBar,
})
local closeBtn = create("TextButton", {
	Text = "x",
	Font = Enum.Font.GothamBold,
	TextSize = 13,
	TextColor3 = dimColor,
	BackgroundColor3 = elemColor,
	BackgroundTransparency = 1,
	AutoButtonColor = false,
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -8, 0.5, 0),
	Size = UDim2.fromOffset(24, 24),
	Parent = topBar,
})
addCorner(closeBtn, 6)
connect(closeBtn.MouseEnter, function()
	tween(closeBtn, 0.15, { TextColor3 = accentColor, BackgroundTransparency = 0 })
end)
connect(closeBtn.MouseLeave, function()
	tween(closeBtn, 0.15, { TextColor3 = dimColor, BackgroundTransparency = 1 })
end)
local headerLine = create("Frame", {
	Position = UDim2.fromOffset(0, 38),
	Size = UDim2.new(1, 0, 0, 1),
	BackgroundColor3 = accentColor,
	BorderSizePixel = 0,
	Parent = main,
})
addGradient(headerLine)
local tabY = 10
local layoutOrder = 0
local sidebar = create("ScrollingFrame", {
	Position = UDim2.fromOffset(0, 39),
	Size = UDim2.new(0, 170, 1, -39),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ScrollBarThickness = 0,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	ElasticBehavior = Enum.ElasticBehavior.Never,
	ScrollingEnabled = true,
	Active = true,
	CanvasSize = UDim2.new(),
	Parent = main,
})
local tabSelector = create("Frame", {
	Position = UDim2.fromOffset(8, 10),
	Size = UDim2.new(1, -16, 0, 32),
	BackgroundColor3 = accentColor,
	BorderSizePixel = 0,
	ZIndex = 1,
	Parent = sidebar,
})
addCorner(tabSelector, 8)
create("UIGradient", {
	Color = ColorSequence.new(Color3.fromRGB(105, 105, 105), Color3.fromRGB(62, 62, 62)),
	Parent = tabSelector,
})
local selectorStroke = create("UIStroke", {
	Color = accentColor,
	Thickness = 1,
	Transparency = 0.75,
	ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	Parent = tabSelector,
})
local sweepGradient = create("UIGradient", { Parent = selectorStroke })
local solidSeq = NumberSequence.new(0)
local sweepSeq = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.5, 1),
	NumberSequenceKeypoint.new(0.85, 0.2),
	NumberSequenceKeypoint.new(1, 0),
})
local sweepId = 0
local sweepTween

local function playSweep()
	sweepId += 1
	local id = sweepId
	if sweepTween then
		sweepTween:Cancel()
	end
	sweepGradient.Transparency = sweepSeq
	sweepGradient.Rotation = -90
	sweepTween = tween(sweepGradient, 0.5, { Rotation = 270 }, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine)
	sweepTween.Completed:Connect(function(state)
		if id ~= sweepId or state ~= Enum.PlaybackState.Completed then
			return
		end
		sweepGradient.Transparency = solidSeq
		selectorStroke.Transparency = 0.4
		tween(selectorStroke, 0.4, { Transparency = 0.75 })
	end)
end

local tabList = create("Frame", {
	Position = UDim2.fromOffset(8, 10),
	Size = UDim2.new(1, -16, 1, -10),
	BackgroundTransparency = 1,
	ZIndex = 2,
	Parent = sidebar,
})
local tabLayout = create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder, Parent = tabList })

local function updateSidebarCanvas()
	sidebar.CanvasSize = UDim2.fromOffset(0, 10 + tabLayout.AbsoluteContentSize.Y + 24)
end

tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSidebarCanvas)
create("Frame", {
	Position = UDim2.fromOffset(170, 39),
	Size = UDim2.new(0, 1, 1, -39),
	BackgroundColor3 = strokeColor,
	BorderSizePixel = 0,
	Parent = main,
})
sidebar.ZIndex = 5
local content = create("Frame", {
	Position = UDim2.fromOffset(184, 50),
	Size = UDim2.new(1, -196, 1, -60),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	ZIndex = 1,
	Parent = main,
})
local fadeOverlay = create("Frame", {
	Size = UDim2.fromScale(1, 1),
	BackgroundColor3 = bgColor,
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ZIndex = 50,
	Parent = content,
})
local fadeTween
local tabs = {}
local currentTab

local function selectTab(tab)
	if currentTab == tab then
		return
	end
	local old = currentTab
	currentTab = tab
	for _, t in ipairs(tabs) do
		if t ~= tab then
			t.page.Visible = false
		end
	end
	local y = tab.y
	if old then
		tween(tabSelector, 0.3, { Position = UDim2.fromOffset(8, y) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
	else
		tabSelector.Position = UDim2.fromOffset(8, y)
	end
	playSweep()
	if old then
		tween(old.label, 0.2, { TextColor3 = dimColor })
		old.label.Font = Enum.Font.GothamMedium
		old.icon.color(dimColor)
		old.chev(false)
	end
	tween(tab.label, 0.2, { TextColor3 = accentColor })
	tab.label.Font = Enum.Font.GothamBold
	tab.icon.color(accentColor)
	tab.icon.pop()
	tab.chev(true)
	tab.page.CanvasPosition = Vector2.zero
	tab.page.Position = UDim2.fromOffset(0, 14)
	tab.page.Visible = true
	tween(tab.page, 0.35, { Position = UDim2.fromOffset(0, 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
	if fadeTween then
		fadeTween:Cancel()
	end
	fadeOverlay.BackgroundTransparency = 0
	fadeTween = tween(fadeOverlay, 0.3, { BackgroundTransparency = 1 })
end

return (function(...)
	local searchTerms

	local function matchesSearch(item, s, tab)
		local key = item.key .. " " .. s.name:lower() .. " " .. tab.label.Text:lower()
		for _, w in ipairs(searchTerms) do
			if not key:find(w, 1, true) then
				return false
			end
		end
		return true
	end

	local function layoutTab(tab)
		if tab.custom then
			return
		end
		local y = 46
		if searchTerms then
			for _, s in ipairs(tab.sections) do
				local rowY = 30
				local any = false
				for _, item in ipairs(s.items) do
					local ok = matchesSearch(item, s, tab)
					item.row.Visible = ok
					if ok then
						item.row.Position = UDim2.fromOffset(8, rowY)
						rowY += item.h + 6
						any = true
					end
				end
				s.card.Visible = any
				if any then
					local h = rowY + 8 - 6
					s.card.Position = UDim2.fromOffset(2, y)
					s.card.Size = UDim2.new(1, -8, 0, h)
					y += h + 10
				end
			end
			tab.page.CanvasSize = UDim2.fromOffset(0, y - 10 + 2 + 4)
			return
		end
		for _, s in ipairs(tab.sections) do
			local shown = not tab.subs or s.group == tab.sub
			local expanded = not s.collapsible or s.isOpen or s.open > 0.001
			for _, item in ipairs(s.items) do
				item.row.Position = UDim2.fromOffset(8, item.y)
				item.row.Visible = expanded
			end
			local h = s.height
			if s.collapsible then
				h = math.floor(30 + (s.height - 30) * s.open + 0.5)
			end
			s.card.Visible = shown
			if shown then
				s.card.Position = UDim2.fromOffset(2, y)
				s.card.Size = UDim2.new(1, -8, 0, h)
				y += h + 10
			end
		end
		tab.page.CanvasSize = UDim2.fromOffset(0, y - 10 + 2 + 4)
	end

	local function addSeparator()
		layoutOrder += 1
		local holder = create("Frame", {
			Size = UDim2.new(1, 0, 0, 9),
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			Parent = tabList,
		})
		create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 4, 0, 1),
			BackgroundColor3 = strokeColor,
			BorderSizePixel = 0,
			Parent = holder,
		})
		tabY += 12
	end

	local function addTab(name, iconName, desc)
		local index = #tabs + 1
		layoutOrder += 1
		local y = tabY
		tabY += 35
		local tabBtn = create("TextButton", {
			Text = "",
			BackgroundColor3 = elemColor,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Size = UDim2.new(1, 0, 0, 32),
			LayoutOrder = layoutOrder,
			Parent = tabList,
		})
		addCorner(tabBtn, 7)
		local icon = createIcon(iconName, tabBtn)
		local label = create("TextLabel", {
			Text = name,
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			TextColor3 = dimColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(38, 0),
			Size = UDim2.new(1, -60, 1, 0),
			ZIndex = 3,
			Parent = tabBtn,
		})
		local chevron = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(1, -14, 0.5, 0),
			Size = UDim2.fromOffset(6, 10),
			BackgroundTransparency = 1,
			ZIndex = 3,
			Parent = tabBtn,
		})
		local chevTop = line(chevron, 1, 1.5, 4.5, 5, 1.5, mutedColor)
		local chevBottom = line(chevron, 4.5, 5, 1, 8.5, 1.5, mutedColor)
		chevTop.ZIndex, chevBottom.ZIndex = 3, 3

		local function setChevron(on)
			tween(chevron, 0.3, { Rotation = on and 90 or 0 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			tween(chevTop, 0.2, { BackgroundColor3 = on and accentColor or mutedColor })
			tween(chevBottom, 0.2, { BackgroundColor3 = on and accentColor or mutedColor })
		end

		local page = create("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = dimColor,
			CanvasSize = UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always,
			ScrollBarImageTransparency = 0.4,
			ClipsDescendants = true,
			Visible = false,
			ZIndex = 1,
			Parent = content,
		})
		local pageTitle = create("TextLabel", {
			Text = name,
			Font = Enum.Font.GothamBold,
			TextSize = 18,
			TextColor3 = accentColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -8, 0, 22),
			Parent = page,
		})
		local pageDesc = create("TextLabel", {
			Text = desc or "",
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = dimColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 22),
			Size = UDim2.new(1, -8, 0, 16),
			Parent = page,
		})
		local tab = {
			index = index,
			y = y,
			btn = tabBtn,
			label = label,
			icon = icon,
			chev = setChevron,
			page = page,
			sections = {},
			title = pageTitle,
			desc = pageDesc,
		}
		table.insert(tabs, tab)
		connect(tabBtn.MouseButton1Click, function()
			selectTab(tab)
		end)
		connect(tabBtn.MouseEnter, function()
			if currentTab ~= tab then
				tween(label, 0.15, { TextColor3 = textColor })
				icon.color(textColor, 0.15)
			end
		end)
		connect(tabBtn.MouseLeave, function()
			if currentTab ~= tab then
				tween(label, 0.15, { TextColor3 = dimColor })
				icon.color(dimColor, 0.15)
			end
		end)
		return tab
	end

	local Section = {}
	Section.__index = Section

	local function addSection(tab, name, group)
		local card = create("Frame", { BackgroundColor3 = panelColor, Parent = tab.page })
		addCorner(card, 10)
		local stroke = addStroke(card)
		create("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new(accentColor, Color3.fromRGB(190, 190, 190)),
			Parent = card,
		})
		local highlight = create("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 12, 0, 15),
			Size = UDim2.fromOffset(3, 12),
			BackgroundColor3 = accentColor,
			BorderSizePixel = 0,
			Parent = card,
		})
		makeRound(highlight)
		addGradient(highlight)
		create("TextLabel", {
			Text = string.upper(name),
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = textColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(22, 0),
			Size = UDim2.new(1, -34, 0, 30),
			Parent = card,
		})
		connect(card.MouseEnter, function()
			tween(stroke, 0.2, { Color = Color3.fromRGB(56, 56, 56) })
		end)
		connect(card.MouseLeave, function()
			tween(stroke, 0.2, { Color = strokeColor })
		end)
		local s = setmetatable({
			tab = tab,
			card = card,
			name = name,
			items = {},
			y = 30,
			height = 32,
			rows = {},
			open = 1,
			group = group or tab.subs and tab.subs[1],
		}, Section)
		table.insert(tab.sections, s)
		layoutTab(tab)
		return s
	end

	local function setSubTabs(tab, items)
		tab.subs = items
		tab.sub = items[1]
		local cur = 1
		local titleW = TextService:GetTextSize(tab.title.Text, 18, Enum.Font.GothamBold, Vector2.new(400, 40)).X
		tab.desc.Visible = false
		tab.title.Size = UDim2.fromOffset(titleW + 4, 40)
		local bar = create("Frame", {
			Position = UDim2.fromOffset(titleW + 16, 6),
			Size = UDim2.new(1, -(titleW + 16) - 8, 0, 28),
			BackgroundTransparency = 1,
			ZIndex = 3,
			Parent = tab.page,
		})
		local subButtons = {}
		local x = 0
		for i, sub in ipairs(items) do
			local tw = TextService:GetTextSize(sub, 12, Enum.Font.GothamMedium, Vector2.new(300, 40)).X
			local w = tw + 34
			local b = create("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = Color3.fromRGB(90, 90, 90),
				BackgroundTransparency = i == cur and 0.35 or 1,
				Position = UDim2.fromOffset(x, 0),
				Size = UDim2.fromOffset(w, 28),
				ZIndex = 3,
				Parent = bar,
			})
			addCorner(b, 9)
			local pip = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0, 13, 0.5, 0),
				Size = UDim2.fromOffset(i == cur and 6 or 0, i == cur and 6 or 0),
				BackgroundColor3 = accentColor,
				BorderSizePixel = 0,
				ZIndex = 4,
				Parent = b,
			})
			makeRound(pip)
			local lbl = create("TextLabel", {
				Text = sub,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = i == cur and accentColor or dimColor,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(i == cur and 22 or 12, 0),
				Size = UDim2.new(1, -22, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 4,
				Parent = b,
			})
			subButtons[i] = { b = b, dot = pip, lbl = lbl, w = w }
			x += w + 4
		end

		local function refresh(i, on)
			local o = subButtons[i]
			tween(o.b, 0.25, { BackgroundTransparency = on and 0.35 or 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			tween(o.dot, 0.25, { Size = UDim2.fromOffset(on and 6 or 0, on and 6 or 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			tween(o.lbl, 0.25, { TextColor3 = on and accentColor or dimColor, Position = UDim2.fromOffset(on and 22 or 12, 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
		end

		local function relayout(anim)
			layoutTab(tab)
			if anim then
				tab.page.CanvasPosition = Vector2.zero
				tab.page.Position = UDim2.fromOffset(0, 14)
				tween(tab.page, 0.35, { Position = UDim2.fromOffset(0, 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				if fadeTween then
					fadeTween:Cancel()
				end
				fadeOverlay.BackgroundTransparency = 0
				fadeTween = tween(fadeOverlay, 0.3, { BackgroundTransparency = 1 })
			end
		end

		local function set(i)
			if i == cur then
				return
			end
			refresh(cur, false)
			cur = i
			tab.sub = items[i]
			refresh(i, true)
			relayout(true)
		end

		tab.setSub = function(sub)
			local i = table.find(items, sub)
			if i then
				set(i)
			end
		end

		for i, o in ipairs(subButtons) do
			connect(o.b.MouseEnter, function()
				if i ~= cur then
					tween(o.b, 0.15, { BackgroundTransparency = 0.8 })
					tween(o.lbl, 0.15, { TextColor3 = textColor })
				end
			end)
			connect(o.b.MouseLeave, function()
				if i ~= cur then
					tween(o.b, 0.15, { BackgroundTransparency = 1 })
					tween(o.lbl, 0.15, { TextColor3 = dimColor })
				end
			end)
			connect(o.b.MouseButton1Click, function()
				set(i)
			end)
		end
		layoutTab(tab)
	end

	Section.Collapsible = function(self2, startOpen)
		self2.collapsible = true
		self2.isOpen = startOpen and true or false
		self2.open = self2.isOpen and 1 or 0
		self2.card.ClipsDescendants = true
		local stroke = self2.card:FindFirstChildOfClass("UIStroke")
		local headerBtn = create("TextButton", {
			Text = "",
			BackgroundColor3 = elemColor,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 4,
			Parent = self2.card,
		})
		local hint = create("TextLabel", {
			Text = self2.isOpen and "hide" or "open",
			Font = Enum.Font.GothamMedium,
			TextSize = 10,
			TextColor3 = mutedColor,
			TextXAlignment = Enum.TextXAlignment.Right,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -30, 0, 15),
			Size = UDim2.fromOffset(40, 14),
			ZIndex = 5,
			Parent = self2.card,
		})
		local arrow = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(1, -18, 0, 15),
			Size = UDim2.fromOffset(10, 6),
			BackgroundTransparency = 1,
			Rotation = self2.isOpen and 180 or 0,
			ZIndex = 5,
			Parent = self2.card,
		})
		local arrowL = line(arrow, 1, 1, 5, 5, 1.6)
		local arrowR = line(arrow, 5, 5, 9, 1, 1.6)
		arrowL.ZIndex, arrowR.ZIndex = 5, 5
		local anim = Instance.new("NumberValue")
		anim.Value = self2.open
		connect(anim.Changed, function(v)
			self2.open = v
			layoutTab(self2.tab)
		end)
		local openTween

		local function toggleCollapse()
			self2.isOpen = not self2.isOpen
			local on = self2.isOpen
			if on then
				for _, r in ipairs(self2.rows) do
					r.Visible = true
				end
			end
			if openTween then
				openTween:Cancel()
			end
			openTween = tween(anim, on and 0.4 or 0.3, { Value = on and 1 or 0 }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			openTween.Completed:Connect(function(st)
				if st == Enum.PlaybackState.Completed and not self2.isOpen then
					for _, r in ipairs(self2.rows) do
						r.Visible = false
					end
				end
			end)
			tween(arrow, 0.35, { Rotation = on and 180 or 0 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			hint.Text = on and "hide" or "open"
			if stroke then
				stroke.Color = accentColor
				tween(stroke, 0.5, { Color = strokeColor })
			end
		end

		connect(headerBtn.MouseButton1Click, toggleCollapse)

		self2.expand = function()
			if not self2.isOpen then
				toggleCollapse()
			end
		end

		connect(headerBtn.MouseEnter, function()
			tween(arrowL, 0.15, { BackgroundColor3 = accentColor })
			tween(arrowR, 0.15, { BackgroundColor3 = accentColor })
			tween(hint, 0.15, { TextColor3 = textColor })
		end)
		connect(headerBtn.MouseLeave, function()
			tween(arrowL, 0.15, { BackgroundColor3 = dimColor })
			tween(arrowR, 0.15, { BackgroundColor3 = dimColor })
			tween(hint, 0.15, { TextColor3 = mutedColor })
		end)
		layoutTab(self2.tab)
		return self2
	end

	local config = {}
	local registry = {}
	local loading = true
	local HttpService = game:GetService("HttpService")
	local storageFolder = "Rock Hub"
	local currentConfigFile = storageFolder .. "/current.json"
	local profilesFile = storageFolder .. "/configs.json"
	if makefolder and not (isfolder and isfolder(storageFolder)) then
		pcall(makefolder, storageFolder)
	end
	pcall(function()
		local file = isfile and isfile(currentConfigFile) and currentConfigFile or "rockhub_config.json"
		if isfile and isfile(file) then
			local d = HttpService:JSONDecode(readfile(file))
			if type(d) == "table" then
				config = d
			end
		end
	end)
	local profiles = {}
	pcall(function()
		local file = isfile and isfile(profilesFile) and profilesFile or "rockhub_configs.json"
		if isfile and isfile(file) then
			local d = HttpService:JSONDecode(readfile(file))
			if type(d) == "table" then
				profiles = d
			end
		end
	end)
	local dirty, dirtyAt = false, 0
	local noSave = { ["Troll Fun/Hug/Hug"] = true }

	local function setConfig(key, v)
		if noSave[key] then
			return
		end
		if loading or config[key] == v then
			return
		end
		config[key] = v
		dirty = true
		dirtyAt = os.clock()
	end

	local function saveConfig()
		dirty = false
		if not writefile then
			return
		end
		pcall(function()
			writefile(currentConfigFile, HttpService:JSONEncode(config))
		end)
	end

	local function copyConfig(source)
		local ok, result = pcall(function()
			return HttpService:JSONDecode(HttpService:JSONEncode(source))
		end)
		return ok and result or {}
	end

	local function snapshotConfig()
		local snapshot = copyConfig(config)
		for _, r in ipairs(registry) do
			if r.get then
				local ok, value = pcall(r.get)
				if ok and value ~= nil then
					snapshot[r.key] = value
				end
			end
		end
		return snapshot
	end

	local function saveProfiles()
		if not writefile then
			return false, "file API is unavailable"
		end
		local ok, err = pcall(function()
			writefile(profilesFile, HttpService:JSONEncode(profiles))
		end)
		return ok, err
	end

	local function normalizeProfileName(name)
		name = tostring(name or ""):match("^%s*(.-)%s*$")
		if name == "" then
			return nil, "enter a config name"
		end
		if (utf8.len(name) or #name) > 32 then
			return nil, "name must be 32 characters or less"
		end
		if name:find("[%c]") then
			return nil, "name contains unsupported characters"
		end
		return name
	end

	local function applyConfig(data)
		config = copyConfig(data)
		loading = true
		for _, r in ipairs(registry) do
			local value = config[r.key]
			if value == nil then
				value = r.default
			end
			if value ~= nil then
				pcall(r.set, value)
			end
		end
		loading = false
		dirty = false
		saveConfig()
	end

	connect(RunService.Heartbeat, function()
		if dirty and os.clock() - dirtyAt > 1 then
			saveConfig()
		end
	end)

	local function configKey(sec, itemName)
		return sec.tab.label.Text .. "/" .. sec.name .. "/" .. itemName
	end

	local function register(key, set, get, default)
		if noSave[key] then
			return
		end
		table.insert(registry, { key = key, set = set, get = get, default = default })
	end

	local hoverStroke = Color3.fromRGB(62, 62, 62)
	local activeStroke = Color3.fromRGB(88, 88, 88)

	Section._row = function(self2, name, desc, height)
		local h = height or (desc and 40 or 32)
		local row = create("TextButton", {
			Text = "",
			BackgroundColor3 = elemColor,
			AutoButtonColor = false,
			Position = UDim2.fromOffset(8, self2.y),
			Size = UDim2.new(1, -16, 0, h),
			ClipsDescendants = true,
			Parent = self2.card,
		})
		addCorner(row, 7)
		local rowStroke = addStroke(row)
		table.insert(self2.rows, row)
		table.insert(self2.items, {
			row = row,
			y = self2.y,
			h = h,
			name = name,
			desc = desc,
			key = (name .. " " .. (desc or "")):lower(),
		})
		if self2.collapsible and not self2.isOpen then
			row.Visible = false
		end
		self2.y += h + 6
		self2.height = self2.y + 8 - 6
		layoutTab(self2.tab)
		local accent = create("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(2, 0),
			BackgroundColor3 = accentColor,
			BorderSizePixel = 0,
			ZIndex = 2,
			Parent = row,
		})
		addCorner(accent, 1)
		local logo2 = create("TextLabel", {
			Text = name,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextColor3 = textColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(12, desc and 6 or 0),
			Size = UDim2.new(1, -150, 0, desc and 15 or h),
			Parent = row,
		})
		if desc then
			create("TextLabel", {
				Text = desc,
				Font = Enum.Font.Gotham,
				TextSize = 10,
				TextColor3 = mutedColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(12, 21),
				Size = UDim2.new(1, -150, 0, 13),
				Parent = row,
			})
		end
		local hovered, active = false, false

		local function refresh()
			local lit = hovered or active
			tween(accent, 0.3, { Size = UDim2.fromOffset(2, active and h - 14 or (hovered and 12 or 0)) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			tween(row, 0.15, { BackgroundColor3 = hovered and hoverColor or elemColor })
			tween(logo2, 0.2, {
				TextColor3 = lit and accentColor or textColor,
				Position = UDim2.fromOffset(hovered and 15 or 12, logo2.Position.Y.Offset),
			}, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			tween(rowStroke, 0.2, { Color = active and activeStroke or (hovered and hoverStroke or strokeColor) })
		end

		connect(row.MouseEnter, function()
			hovered = true
			refresh()
		end)
		connect(row.MouseLeave, function()
			hovered = false
			refresh()
		end)

		local function highlight(on)
			active = on
			refresh()
		end

		return row, logo2, rowStroke, highlight
	end

	Section.Toggle = function(self2, name, desc, callback)
		local state = false
		local key = configKey(self2, name)
		local row, _, _, highlight = self2:_row(name, desc)
		local track = create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(34, 18),
			BackgroundColor3 = bgColor,
			BorderSizePixel = 0,
			Parent = row,
		})
		makeRound(track)
		local trackStroke = addStroke(track)
		local glow = create("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = accentColor,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = track,
		})
		makeRound(glow)
		create("UIGradient", { Color = ColorSequence.new(Color3.fromRGB(150, 150, 150), accentColor), Parent = glow })
		local knob = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0, 9, 0.5, 0),
			Size = UDim2.fromOffset(12, 12),
			BackgroundColor3 = dimColor,
			BorderSizePixel = 0,
			ZIndex = 2,
			Parent = track,
		})
		makeRound(knob)

		local function apply(v, silent)
			state = v
			knob.Size = UDim2.fromOffset(18, 12)
			tween(knob, 0.35, {
				Position = UDim2.new(0, state and 25 or 9, 0.5, 0),
				Size = UDim2.fromOffset(12, 12),
				BackgroundColor3 = state and bgColor or dimColor,
			}, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			tween(glow, 0.25, { BackgroundTransparency = state and 0 or 1 })
			tween(trackStroke, 0.25, { Color = state and accentColor or strokeColor })
			highlight(state)
			setConfig(key, state)
			if not silent then
				task.spawn(callback, state)
			end
		end

		connect(row.MouseButton1Click, function()
			apply(not state)
		end)
		register(key, function(v)
			if type(v) == "boolean" and v ~= state then
				apply(v)
			end
		end, function()
			return state
		end, false)
		return {
			Set = function(v, silent)
				if v ~= state then
					apply(v, silent)
				end
			end,
			Get = function()
				return state
			end,
		}
	end

	Section.Segmented = function(self2, name, options, default, callback)
		local cur = table.find(options, default) or 1
		local n = #options
		local key = configKey(self2, name)
		local row, logo2 = self2:_row(name, nil, 34)
		local totalW = n * 60
		logo2.Size = UDim2.new(1, -(totalW + 24), 1, 0)
		local pill = create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -6, 0.5, 0),
			Size = UDim2.fromOffset(totalW, 24),
			BackgroundColor3 = bgColor,
			Parent = row,
		})
		addCorner(pill, 7)
		local pillStroke = addStroke(pill)
		local thumb = create("Frame", {
			Position = UDim2.new((cur - 1) / n, 2, 0, 2),
			Size = UDim2.new(1 / n, -4, 1, -4),
			BackgroundColor3 = accentColor,
			BorderSizePixel = 0,
			ZIndex = 2,
			Parent = pill,
		})
		addCorner(thumb, 6)
		create("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new(accentColor, Color3.fromRGB(185, 185, 185)),
			Parent = thumb,
		})
		local thumbScale = create("UIScale", { Parent = thumb })
		local optionBtns = {}

		local function set(i, silent)
			if i == cur then
				return
			end
			tween(optionBtns[cur], 0.2, { TextColor3 = dimColor })
			optionBtns[cur].Font = Enum.Font.GothamMedium
			cur = i
			tween(optionBtns[i], 0.2, { TextColor3 = bgColor })
			optionBtns[i].Font = Enum.Font.GothamBold
			tween(thumb, 0.35, { Position = UDim2.new((i - 1) / n, 2, 0, 2) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			thumbScale.Scale = 0.86
			tween(thumbScale, 0.4, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			pillStroke.Color = accentColor
			tween(pillStroke, 0.45, { Color = strokeColor })
			setConfig(key, options[i])
			if not silent then
				task.spawn(callback, options[i])
			end
		end

		register(key, function(v)
			local i = table.find(options, v)
			if i then
				set(i)
			end
		end, function()
			return options[cur]
		end, options[table.find(options, default) or 1])
		for i, opt in ipairs(options) do
			local b = create("TextButton", {
				Text = opt,
				Font = i == cur and Enum.Font.GothamBold or Enum.Font.GothamMedium,
				TextSize = 11,
				TextColor3 = i == cur and bgColor or dimColor,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Position = UDim2.fromScale((i - 1) / n, 0),
				Size = UDim2.fromScale(1 / n, 1),
				ZIndex = 3,
				Parent = pill,
			})
			optionBtns[i] = b
			connect(b.MouseEnter, function()
				if i ~= cur then
					tween(b, 0.15, { TextColor3 = textColor })
				end
			end)
			connect(b.MouseLeave, function()
				if i ~= cur then
					tween(b, 0.15, { TextColor3 = dimColor })
				end
			end)
			connect(b.MouseButton1Click, function()
				set(i)
			end)
		end
		return {
			Set = function(opt, silent)
				local i = table.find(options, opt)
				if i then
					set(i, silent)
				end
			end,
			Get = function()
				return options[cur]
			end,
		}
	end

	Section.Button = function(self2, name, desc, callback)
		local row = self2:_row(name, desc)
		local holder = create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -8, 0.5, 0),
			Size = UDim2.fromOffset(22, 22),
			BackgroundColor3 = bgColor,
			ZIndex = 2,
			Parent = row,
		})
		makeRound(holder)
		local circleStroke = addStroke(holder)
		local circleScale = create("UIScale", { Parent = holder })
		local arrow = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 1, 0.5, 0),
			Size = UDim2.fromOffset(6, 10),
			BackgroundTransparency = 1,
			ZIndex = 2,
			Parent = holder,
		})
		local a1 = line(arrow, 1, 1, 5, 5, 1.6)
		local a2 = line(arrow, 5, 5, 1, 9, 1.6)
		a1.ZIndex, a2.ZIndex = 3, 3
		connect(row.MouseEnter, function()
			tween(holder, 0.2, { BackgroundColor3 = accentColor })
			tween(circleStroke, 0.2, { Color = accentColor })
			tween(a1, 0.2, { BackgroundColor3 = bgColor })
			tween(a2, 0.2, { BackgroundColor3 = bgColor })
		end)
		connect(row.MouseLeave, function()
			tween(holder, 0.2, { BackgroundColor3 = bgColor })
			tween(circleStroke, 0.2, { Color = strokeColor })
			tween(a1, 0.2, { BackgroundColor3 = dimColor })
			tween(a2, 0.2, { BackgroundColor3 = dimColor })
		end)
		connect(row.MouseButton1Click, function()
			local w = row.AbsoluteSize.X * 1.15
			local ripple = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(0, 0),
				BackgroundColor3 = accentColor,
				BackgroundTransparency = 0.82,
				BorderSizePixel = 0,
				Parent = row,
			})
			makeRound(ripple)
			tween(ripple, 0.55, { Size = UDim2.fromOffset(w, w), BackgroundTransparency = 1 })
			task.delay(0.6, function()
				ripple:Destroy()
			end)
			circleScale.Scale = 0.75
			tween(circleScale, 0.4, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			task.spawn(callback)
		end)
	end

	Section.Input = function(self2, name, desc, placeholder)
		local row = self2:_row(name, desc)
		local box = create("TextBox", {
			Text = "",
			PlaceholderText = placeholder or "enter text",
			PlaceholderColor3 = mutedColor,
			Font = Enum.Font.GothamMedium,
			TextSize = 11,
			TextColor3 = textColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			BackgroundColor3 = bgColor,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(130, 24),
			Parent = row,
		})
		addCorner(box, 6)
		local outline = addStroke(box)
		create("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), Parent = box })
		connect(box.Focused, function()
			tween(outline, 0.15, { Color = accentColor })
		end)
		connect(box.FocusLost, function()
			tween(outline, 0.25, { Color = strokeColor })
		end)
		return {
			Get = function()
				return box.Text
			end,
			Set = function(value)
				box.Text = tostring(value or "")
			end,
			SetPlaceholder = function(value)
				box.PlaceholderText = tostring(value or "")
			end,
			Focus = function()
				box:CaptureFocus()
			end,
		}
	end

	Section.Dropdown = function(self2, name, desc, options, placeholder, callback)
		local row = self2:_row(name, desc)
		local values = table.clone(options or {})
		local selected
		local closePopup
		local badge = create("TextButton", {
			Text = placeholder or "select...",
			Font = Enum.Font.GothamMedium,
			TextSize = 11,
			TextColor3 = dimColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			BackgroundColor3 = bgColor,
			AutoButtonColor = false,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(130, 24),
			Parent = row,
		})
		addCorner(badge, 6)
		local badgeStroke = addStroke(badge)
		create("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 20), Parent = badge })
		local arrow = create("TextLabel", {
			Text = "v",
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			TextColor3 = mutedColor,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -6, 0.5, -1),
			Size = UDim2.fromOffset(12, 16),
			ZIndex = 3,
			Parent = badge,
		})

		local function setSelected(value, silent)
			if value ~= nil and not table.find(values, value) then
				return
			end
			selected = value
			badge.Text = value or placeholder or "select..."
			badge.TextColor3 = value and textColor or dimColor
			if value and not silent then
				task.spawn(callback, value)
			end
		end

		connect(badge.MouseButton1Click, function()
			if closePopup then
				closePopup()
				return
			end
			local backdrop = create("TextButton", {
				Text = "",
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Size = UDim2.fromScale(1, 1),
				ZIndex = 149,
				Parent = gui,
			})
			local visibleRows = math.max(1, math.min(#values, 5))
			local popupHeight = visibleRows * 26 + 8
			local rel = badge.AbsolutePosition - gui.AbsolutePosition
			local x = math.clamp(rel.X, 4, math.max(4, gui.AbsoluteSize.X - 134))
			local below = rel.Y + badge.AbsoluteSize.Y + 4
			local y = below + popupHeight <= gui.AbsoluteSize.Y - 4 and below or math.max(4, rel.Y - popupHeight - 4)
			local popup = create("Frame", {
				Position = UDim2.fromOffset(x, y),
				Size = UDim2.fromOffset(130, popupHeight),
				BackgroundColor3 = panelColor,
				ZIndex = 150,
				Parent = gui,
			})
			addCorner(popup, 7)
			create("UIStroke", { Color = accentColor, Transparency = 0.45, Thickness = 1, Parent = popup })
			local list = create("ScrollingFrame", {
				Position = UDim2.fromOffset(4, 4),
				Size = UDim2.new(1, -8, 1, -8),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = #values > 5 and 2 or 0,
				CanvasSize = UDim2.fromOffset(0, math.max(22, #values * 26)),
				ZIndex = 151,
				Parent = popup,
			})
			closePopup = function()
				closePopup = nil
				if backdrop.Parent then
					backdrop:Destroy()
				end
				if popup.Parent then
					popup:Destroy()
				end
				tween(badgeStroke, 0.2, { Color = strokeColor })
				tween(arrow, 0.2, { Rotation = 0, TextColor3 = mutedColor })
			end
			backdrop.MouseButton1Click:Connect(closePopup)
			tween(badgeStroke, 0.15, { Color = accentColor })
			tween(arrow, 0.2, { Rotation = 180, TextColor3 = accentColor })
			if #values == 0 then
				create("TextLabel", {
					Text = "no configs",
					Font = Enum.Font.GothamMedium,
					TextSize = 10,
					TextColor3 = mutedColor,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 22),
					ZIndex = 152,
					Parent = list,
				})
			else
				for i, value in ipairs(values) do
					local option = create("TextButton", {
						Text = value,
						Font = selected == value and Enum.Font.GothamBold or Enum.Font.GothamMedium,
						TextSize = 10,
						TextColor3 = selected == value and accentColor or textColor,
						TextTruncate = Enum.TextTruncate.AtEnd,
						BackgroundColor3 = selected == value and hoverColor or elemColor,
						AutoButtonColor = false,
						Position = UDim2.fromOffset(0, (i - 1) * 26),
						Size = UDim2.new(1, -2, 0, 22),
						ZIndex = 152,
						Parent = list,
					})
					addCorner(option, 5)
					option.MouseButton1Click:Connect(function()
						setSelected(value)
						closePopup()
					end)
				end
			end
		end)

		return {
			Get = function()
				return selected
			end,
			Set = setSelected,
			Update = function(newOptions)
				values = table.clone(newOptions or {})
				if selected and not table.find(values, selected) then
					setSelected(nil, true)
				end
				if closePopup then
					closePopup()
				end
			end,
		}
	end

	local dragSlider

	Section.Slider = function(self2, name, min, max, default, callback, fmt)
		fmt = fmt or tostring
		local key = configKey(self2, name)
		local row, logo2 = self2:_row(name, nil, 44)
		logo2.Position = UDim2.fromOffset(12, 7)
		local valueW = 40
		for _, v in ipairs({ min, max, default }) do
			valueW = math.max(valueW, TextService:GetTextSize(fmt(v), 10, Enum.Font.GothamBold, Vector2.new(200, 20)).X + 16)
		end
		logo2.Size = UDim2.new(1, -(valueW + 30), 0, 16)
		local valueLabel = create("TextLabel", {
			Text = fmt(default),
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			TextColor3 = textColor,
			BackgroundColor3 = bgColor,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -10, 0, 6),
			Size = UDim2.fromOffset(valueW, 18),
			Parent = row,
		})
		addCorner(valueLabel, 6)
		local valueStroke = addStroke(valueLabel)
		local bar = create("Frame", {
			Position = UDim2.new(0, 12, 0, 31),
			Size = UDim2.new(1, -24, 0, 5),
			BackgroundColor3 = bgColor,
			BorderSizePixel = 0,
			Parent = row,
		})
		makeRound(bar)
		addStroke(bar)
		local pct = (default - min) / (max - min)
		local fillBar = create("Frame", {
			Size = UDim2.new(pct, 6 - 12 * pct, 1, 0),
			BackgroundColor3 = accentColor,
			BorderSizePixel = 0,
			Parent = bar,
		})
		makeRound(fillBar)
		create("UIGradient", { Color = ColorSequence.new(Color3.fromRGB(95, 95, 95), accentColor), Parent = fillBar })
		local track = create("Frame", {
			Position = UDim2.fromOffset(6, 0),
			Size = UDim2.new(1, -12, 1, 0),
			BackgroundTransparency = 1,
			ZIndex = 2,
			Parent = bar,
		})
		local knob = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(pct, 0.5),
			Size = UDim2.fromOffset(12, 12),
			BackgroundColor3 = accentColor,
			BorderSizePixel = 0,
			ZIndex = 2,
			Parent = track,
		})
		makeRound(knob)
		create("UIStroke", { Color = elemColor, Thickness = 2, Parent = knob })
		local knobScale = create("UIScale", { Parent = knob })
		local hit = create("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 22),
			Size = UDim2.new(1, 0, 0, 22),
			ZIndex = 3,
			Parent = row,
		})
		local last = default
		local dragging = false

		local function render(val, t)
			local r = (val - min) / (max - min)
			tween(knob, t, { Position = UDim2.fromScale(r, 0.5) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			tween(fillBar, t, { Size = UDim2.new(r, 6 - 12 * r, 1, 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			valueLabel.Text = fmt(val)
		end

		local function set(x)
			local w = math.max(track.AbsoluteSize.X, 1)
			local rel = math.clamp((x - track.AbsolutePosition.X) / w, 0, 1)
			local val = math.floor(min + (max - min) * rel + 0.5)
			render(val, 0.08)
			if val ~= last then
				last = val
				setConfig(key, val)
				task.spawn(callback, val)
			end
		end

		connect(row.MouseEnter, function()
			if not dragging then
				tween(knobScale, 0.2, { Scale = 1.15 })
			end
		end)
		connect(row.MouseLeave, function()
			if not dragging then
				tween(knobScale, 0.2, { Scale = 1 })
			end
		end)
		connect(hit.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragSlider = set
				dragging = true
				tween(knobScale, 0.2, { Scale = 1.35 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				tween(valueStroke, 0.15, { Color = accentColor })
				tween(valueLabel, 0.15, { TextColor3 = accentColor })
				set(input.Position.X)
			end
		end)
		connect(UserInputService.InputEnded, function(input)
			if not dragging then
				return
			end
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
				tween(knobScale, 0.25, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				tween(valueStroke, 0.3, { Color = strokeColor })
				tween(valueLabel, 0.3, { TextColor3 = textColor })
			end
		end)

		local function setValue(v, silent)
			v = math.clamp(v, min, max)
			render(v, 0.3)
			if v ~= last then
				last = v
				setConfig(key, v)
				if not silent then
					task.spawn(callback, v)
				end
			end
		end

		register(key, function(v)
			if type(v) == "number" then
				setValue(v)
			end
		end, function()
			return last
		end, default)
		return {
			Set = setValue,
			Get = function()
				return last
			end,
		}
	end

	Section.Keybind = function(self2, name, desc, getKey, setKey)
		local key = configKey(self2, name)
		local row = self2:_row(name, desc)
		local badge = create("TextLabel", {
			Text = getKey().Name,
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			TextColor3 = textColor,
			TextTruncate = Enum.TextTruncate.AtEnd,
			BackgroundColor3 = bgColor,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(84, 22),
			Parent = row,
		})
		addCorner(badge, 6)
		local badgeStroke = addStroke(badge)
		connect(row.MouseButton1Click, function()
			if keyListener then
				return
			end
			badge.Text = "press a key..."
			tween(badgeStroke, 0.15, { Color = accentColor })
			tween(badge, 0.15, { BackgroundColor3 = hoverColor })

			keyListener = function(k)
				if k and k ~= Enum.KeyCode.Escape then
					setKey(k)
					setConfig(key, k.Name)
				end
				badge.Text = getKey().Name
				tween(badgeStroke, 0.3, { Color = strokeColor })
				tween(badge, 0.3, { BackgroundColor3 = bgColor })
			end
		end)
		register(key, function(v)
			local ok, k = pcall(function()
				return Enum.KeyCode[v]
			end)
			if ok and k then
				setKey(k)
				badge.Text = k.Name
			end
		end, function()
			return getKey().Name
		end, getKey().Name)
	end

	Section.Select = function(self2, name, desc, options, default, callback)
		local cur = table.find(options, default) or 1
		local n = #options
		local key = configKey(self2, name)
		local row = self2:_row(name, desc)
		local badge = create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(130, 24),
			BackgroundColor3 = bgColor,
			ClipsDescendants = true,
			Parent = row,
		})
		addCorner(badge, 6)
		local badgeStroke = addStroke(badge)
		local arrows = {}
		for _, dir in ipairs({ -1, 1 }) do
			local a = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(dir < 0 and 0 or 1, dir < 0 and 10 or -10, 0.5, -1),
				Size = UDim2.fromOffset(5, 8),
				BackgroundTransparency = 1,
				ZIndex = 2,
				Parent = badge,
			})
			local l1, l2
			if dir < 0 then
				l1, l2 = line(a, 4, 0.5, 1, 4, 1.4), line(a, 1, 4, 4, 7.5, 1.4)
			else
				l1, l2 = line(a, 1, 0.5, 4, 4, 1.4), line(a, 4, 4, 1, 7.5, 1.4)
			end
			l1.ZIndex, l2.ZIndex = 2, 2
			arrows[dir] = { frame = a, l1 = l1, l2 = l2 }
		end
		local dots = {}
		if n <= 8 then
			for i = 1, n do
				local d = create("Frame", {
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, (i - (n + 1) / 2) * 6, 1, -3),
					Size = UDim2.fromOffset(i == cur and 5 or 2, 2),
					BackgroundColor3 = i == cur and accentColor or mutedColor,
					BorderSizePixel = 0,
					ZIndex = 2,
					Parent = badge,
				})
				makeRound(d)
				dots[i] = d
			end
		end

		local function makeLabel(text, yScale, transp)
			return create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 11,
				TextColor3 = textColor,
				TextTransparency = transp,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 18, yScale, #dots > 0 and -2 or 0),
				Size = UDim2.new(1, -36, 1, 0),
				Parent = badge,
			})
		end

		local lbl = makeLabel(options[cur], 0, 0)
		local labelY = #dots > 0 and -2 or 0

		local function choose(i, dir, silent)
			if i == cur then
				return
			end
			if dots[cur] then
				tween(dots[cur], 0.25, { Size = UDim2.fromOffset(2, 2), BackgroundColor3 = mutedColor })
			end
			cur = i
			if dots[cur] then
				tween(dots[cur], 0.25, { Size = UDim2.fromOffset(5, 2), BackgroundColor3 = accentColor }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			end
			local old = lbl
			tween(old, 0.15, { Position = UDim2.new(0, 18, -dir, labelY), TextTransparency = 1 })
			task.delay(0.16, function()
				old:Destroy()
			end)
			lbl = makeLabel(options[cur], dir, 1)
			tween(lbl, 0.25, { Position = UDim2.new(0, 18, 0, labelY), TextTransparency = 0 }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			local ar = arrows[dir]
			local base = ar.frame.Position
			ar.frame.Position = base + UDim2.fromOffset(dir * 3, 0)
			tween(ar.frame, 0.3, { Position = base }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			badgeStroke.Color = accentColor
			tween(badgeStroke, 0.4, { Color = strokeColor })
			setConfig(key, options[cur])
			if not silent then
				task.spawn(callback, options[cur])
			end
		end

		register(key, function(v)
			local i = table.find(options, v)
			if i and i ~= cur then
				choose(i, i > cur and 1 or -1)
			end
		end, function()
			return options[cur]
		end, options[table.find(options, default) or 1])

		local function step(dir)
			choose((cur - 1 + dir) % n + 1, dir)
		end

		connect(row.MouseButton1Click, function()
			step(1)
		end)
		connect(row.MouseButton2Click, function()
			step(-1)
		end)
		connect(row.MouseEnter, function()
			for _, ar in pairs(arrows) do
				tween(ar.l1, 0.15, { BackgroundColor3 = accentColor })
				tween(ar.l2, 0.15, { BackgroundColor3 = accentColor })
			end
		end)
		connect(row.MouseLeave, function()
			for _, ar in pairs(arrows) do
				tween(ar.l1, 0.15, { BackgroundColor3 = dimColor })
				tween(ar.l2, 0.15, { BackgroundColor3 = dimColor })
			end
		end)
		return {
			Set = function(opt, silent)
				local i = table.find(options, opt)
				if i then
					choose(i, i > cur and 1 or -1, silent)
				end
			end,
			Get = function()
				return options[cur]
			end,
		}
	end

	local openPicker
	local presets = {
		Color3.fromRGB(255, 255, 255),
		Color3.fromRGB(255, 69, 58),
		Color3.fromRGB(255, 159, 10),
		Color3.fromRGB(255, 214, 10),
		Color3.fromRGB(48, 209, 88),
		Color3.fromRGB(100, 210, 255),
		Color3.fromRGB(10, 132, 255),
		Color3.fromRGB(191, 90, 242),
		Color3.fromRGB(255, 55, 95),
	}

	local function relPos(inst)
		return inst.AbsolutePosition - gui.AbsolutePosition
	end

	local function openColorPicker(anchor, startColor, defaultColor, onChange)
		local h, sat, v = startColor:ToHSV()
		local original = startColor
		local backdrop = create("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 149,
			Parent = main,
		})
		addCorner(backdrop, 10)
		tween(backdrop, 0.3, { BackgroundTransparency = 0.45 })
		local popup = create("CanvasGroup", {
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = panelColor,
			GroupTransparency = 1,
			Size = UDim2.fromOffset(264, 344),
			ZIndex = 150,
			Parent = gui,
		})
		addCorner(popup, 12)
		create("UIStroke", { Color = accentColor, Transparency = 0.82, Thickness = 1, Parent = popup })
		local popupScale = create("UIScale", { Scale = 0.08, Parent = popup })

		local function anchorCenter()
			local p, sz = relPos(anchor), anchor.AbsoluteSize
			return UDim2.fromOffset(p.X + sz.X / 2, p.Y + sz.Y / 2)
		end

		local function mainCenter()
			local p, sz = relPos(main), main.AbsoluteSize
			return UDim2.fromOffset(p.X + sz.X / 2, p.Y + sz.Y / 2)
		end

		popup.Position = anchorCenter()
		local lights = {}
		local lightDefs = {
			{ Color3.fromRGB(255, 95, 87), "×" },
			{ Color3.fromRGB(254, 188, 46), "–" },
			{ Color3.fromRGB(40, 200, 64), "+" },
		}
		local lightsBar = create("Frame", {
			Position = UDim2.fromOffset(12, 10),
			Size = UDim2.fromOffset(56, 12),
			BackgroundTransparency = 1,
			ZIndex = 151,
			Parent = popup,
		})
		for i, l in ipairs(lightDefs) do
			local b = create("TextButton", {
				Text = "",
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Color3.fromRGB(60, 20, 10),
				TextTransparency = 1,
				AutoButtonColor = false,
				BackgroundColor3 = l[1],
				Position = UDim2.fromOffset((i - 1) * 19, 0),
				Size = UDim2.fromOffset(12, 12),
				ZIndex = 152,
				Parent = lightsBar,
			})
			makeRound(b)
			b.Text = l[2]
			lights[i] = b
		end
		connect(lightsBar.MouseEnter, function()
			for _, b in ipairs(lights) do
				tween(b, 0.12, { TextTransparency = 0.2 })
			end
		end)
		connect(lightsBar.MouseLeave, function()
			for _, b in ipairs(lights) do
				tween(b, 0.12, { TextTransparency = 1 })
			end
		end)
		create("TextLabel", {
			Text = "Color",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = dimColor,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 32),
			ZIndex = 151,
			Parent = popup,
		})
		local sq = create("Frame", {
			Active = true,
			Position = UDim2.fromOffset(14, 36),
			Size = UDim2.fromOffset(236, 150),
			BackgroundColor3 = Color3.fromHSV(h, 1, 1),
			ZIndex = 151,
			Parent = popup,
		})
		addCorner(sq, 8)
		local whiteLayer = create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = accentColor, ZIndex = 152, Parent = sq })
		addCorner(whiteLayer, 8)
		create("UIGradient", { Transparency = NumberSequence.new(0, 1), Parent = whiteLayer })
		local blackLayer = create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), ZIndex = 153, Parent = sq })
		addCorner(blackLayer, 8)
		create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0), Parent = blackLayer })
		local svCursor = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(14, 14),
			BackgroundTransparency = 1,
			ZIndex = 155,
			Parent = sq,
		})
		makeRound(svCursor)
		create("UIStroke", { Color = accentColor, Thickness = 2, Parent = svCursor })
		local svCursorScale = create("UIScale", { Parent = svCursor })
		local hueBar = create("Frame", {
			Active = true,
			Position = UDim2.fromOffset(14, 198),
			Size = UDim2.fromOffset(236, 12),
			BackgroundColor3 = accentColor,
			ZIndex = 151,
			Parent = popup,
		})
		makeRound(hueBar)
		local hueKps = {}
		for i = 0, 6 do
			hueKps[#hueKps + 1] = ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(i / 6 % 1, 1, 1))
		end
		create("UIGradient", { Color = ColorSequence.new(hueKps), Parent = hueBar })
		local hueKnob = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromOffset(16, 16),
			BackgroundColor3 = accentColor,
			ZIndex = 153,
			Parent = hueBar,
		})
		makeRound(hueKnob)
		local hueKnobFill = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(10, 10),
			ZIndex = 154,
			Parent = hueKnob,
		})
		makeRound(hueKnobFill)
		local hueKnobScale = create("UIScale", { Parent = hueKnob })
		local prev = create("Frame", {
			Position = UDim2.fromOffset(14, 224),
			Size = UDim2.fromOffset(56, 30),
			BackgroundColor3 = original,
			ClipsDescendants = true,
			ZIndex = 151,
			Parent = popup,
		})
		addCorner(prev, 8)
		addStroke(prev, hoverColor)
		local previewNew = create("Frame", {
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(0.5, 1),
			BorderSizePixel = 0,
			ZIndex = 152,
			Parent = prev,
		})
		local hexBox = create("TextBox", {
			Text = "",
			PlaceholderText = "#FFFFFF",
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextColor3 = textColor,
			PlaceholderColor3 = mutedColor,
			ClearTextOnFocus = false,
			BackgroundColor3 = elemColor,
			Position = UDim2.fromOffset(78, 224),
			Size = UDim2.new(1, -92, 0, 30),
			ZIndex = 151,
			Parent = popup,
		})
		addCorner(hexBox, 8)
		local hexStroke = addStroke(hexBox)
		create("UIPadding", { PaddingLeft = UDim.new(0, 10), Parent = hexBox })
		hexBox.TextXAlignment = Enum.TextXAlignment.Left
		local rgbLabel = create("TextLabel", {
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = mutedColor,
			TextXAlignment = Enum.TextXAlignment.Right,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -8, 0, 0),
			Size = UDim2.new(0, 90, 1, 0),
			ZIndex = 152,
			Parent = hexBox,
		})
		local swatches = {}
		local gap = (236 - #presets * 20) / (#presets - 1)
		for i, c in ipairs(presets) do
			local b = create("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = c,
				Position = UDim2.fromOffset(14 + (i - 1) * (20 + gap), 266),
				Size = UDim2.fromOffset(20, 20),
				ZIndex = 151,
				Parent = popup,
			})
			makeRound(b)
			local st = create("UIStroke", { Color = accentColor, Thickness = 1.5, Transparency = 1, Parent = b })
			local scale = create("UIScale", { Parent = b })
			connect(b.MouseEnter, function()
				tween(scale, 0.15, { Scale = 1.15 })
			end)
			connect(b.MouseLeave, function()
				tween(scale, 0.15, { Scale = 1 })
			end)
			swatches[i] = { btn = b, stroke = st, color = c, scale = scale }
		end
		local done = create("TextButton", {
			Text = "Done",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = bgColor,
			AutoButtonColor = false,
			BackgroundColor3 = accentColor,
			Position = UDim2.fromOffset(14, 300),
			Size = UDim2.new(1, -28, 0, 30),
			ZIndex = 151,
			Parent = popup,
		})
		addCorner(done, 8)
		local doneScale = create("UIScale", { Parent = done })
		connect(done.MouseEnter, function()
			tween(done, 0.15, { BackgroundColor3 = Color3.fromRGB(215, 215, 215) })
		end)
		connect(done.MouseLeave, function()
			tween(done, 0.15, { BackgroundColor3 = accentColor })
		end)

		local function currentTab2()
			return Color3.fromHSV(h, sat, v)
		end

		local function refresh(keepText)
			local c = currentTab2()
			sq.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
			svCursor.Position = UDim2.fromScale(sat, 1 - v)
			hueKnob.Position = UDim2.fromScale(h, 0.5)
			hueKnobFill.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
			previewNew.BackgroundColor3 = c
			if not keepText then
				hexBox.Text = "#" .. c:ToHex():upper()
			end
			rgbLabel.Text = ("%d  %d  %d"):format(math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
			for _, sw in ipairs(swatches) do
				local match = sw.color:ToHex() == c:ToHex()
				sw.stroke.Transparency = match and 0 or 1
			end
			onChange(c)
		end

		refresh()
		local dragging
		local lastRelease = 0
		local overPopup = false

		local function dragTo(pos)
			if dragging == "sq" then
				local p, sz = sq.AbsolutePosition, sq.AbsoluteSize
				sat = math.clamp((pos.X - p.X) / sz.X, 0, 1)
				v = 1 - math.clamp((pos.Y - p.Y) / sz.Y, 0, 1)
			elseif dragging == "hue" then
				local p, sz = hueBar.AbsolutePosition, hueBar.AbsoluteSize
				h = math.clamp((pos.X - p.X) / sz.X, 0, 0.999)
			end
			refresh()
		end

		local function isPress(input)
			return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
		end

		local conns = {}

		local function bind(signal, fn)
			local c = signal:Connect(fn)
			table.insert(conns, c)
			table.insert(connections, c)
		end

		bind(sq.InputBegan, function(input)
			if not isPress(input) then
				return
			end
			dragging = "sq"
			tween(svCursorScale, 0.15, { Scale = 1.3 })
			dragTo(input.Position)
		end)
		bind(hueBar.InputBegan, function(input)
			if not isPress(input) then
				return
			end
			dragging = "hue"
			tween(hueKnobScale, 0.15, { Scale = 1.2 })
			dragTo(input.Position)
		end)
		bind(UserInputService.InputChanged, function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragTo(input.Position)
			end
		end)
		bind(UserInputService.InputEnded, function(input)
			if dragging and isPress(input) then
				dragging = nil
				lastRelease = os.clock()
				tween(svCursorScale, 0.2, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				tween(hueKnobScale, 0.2, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			end
		end)

		local function setColor(c)
			h, sat, v = c:ToHSV()
			refresh()
		end

		for _, sw in ipairs(swatches) do
			bind(sw.btn.MouseButton1Click, function()
				sw.scale.Scale = 0.8
				tween(sw.scale, 0.3, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				setColor(sw.color)
			end)
		end
		bind(hexBox.Focused, function()
			tween(hexStroke, 0.15, { Color = accentColor })
		end)
		bind(hexBox.FocusLost, function()
			tween(hexStroke, 0.15, { Color = strokeColor })
			local hex = hexBox.Text:gsub("[^%x]", "")
			local ok, c = pcall(Color3.fromHex, hex)
			if ok and c and #hex == 6 then
				setColor(c)
			else
				refresh()
			end
		end)
		tween(popup, 0.5, { Position = mainCenter() }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
		tween(popupScale, 0.55, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
		tween(popup, 0.25, { GroupTransparency = 0 })
		local closing = false

		local function close(instant)
			if closing then
				return
			end
			closing = true
			if openPicker == close then
				openPicker = nil
			end
			for _, c in ipairs(conns) do
				c:Disconnect()
			end
			if instant then
				backdrop:Destroy()
				popup:Destroy()
				return
			end
			tween(backdrop, 0.25, { BackgroundTransparency = 1 })
			tween(popup, 0.32, { Position = anchorCenter() }, Enum.EasingDirection.In, Enum.EasingStyle.Quint)
			tween(popupScale, 0.32, { Scale = 0.05 }, Enum.EasingDirection.In, Enum.EasingStyle.Quint)
			local t = tween(popup, 0.3, { GroupTransparency = 1 }, Enum.EasingDirection.In)
			t.Completed:Connect(function()
				backdrop:Destroy()
				popup:Destroy()
			end)
		end

		bind(popup.MouseEnter, function()
			overPopup = true
		end)
		bind(popup.MouseLeave, function()
			overPopup = false
		end)
		bind(backdrop.MouseButton1Click, function()
			if overPopup or dragging or os.clock() - lastRelease < 0.3 then
				return
			end
			close()
		end)
		bind(lights[1].MouseButton1Click, function()
			setColor(original)
			close()
		end)
		bind(lights[2].MouseButton1Click, function()
			close()
		end)
		bind(lights[3].MouseButton1Click, function()
			setColor(defaultColor)
		end)
		bind(done.MouseButton1Click, function()
			doneScale.Scale = 0.92
			tween(doneScale, 0.2, { Scale = 1 })
			close()
		end)
		return close
	end

	local closeActiveAlert

	local function showAlert(logo2, text, buttonText)
		if closeActiveAlert then
			closeActiveAlert()
		end
		local backdrop = create("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 159,
			Parent = main,
		})
		addCorner(backdrop, 10)
		tween(backdrop, 0.25, { BackgroundTransparency = 0.45 })
		local card = create("CanvasGroup", {
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(300, 176),
			BackgroundColor3 = panelColor,
			GroupTransparency = 1,
			ZIndex = 160,
			Parent = main,
		})
		addCorner(card, 14)
		local st = create("UIStroke", { Color = accentColor, Transparency = 0.6, Parent = card })
		addGradient(st)
		local scale = create("UIScale", { Scale = 0.85, Parent = card })
		local alertIcon = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 18),
			Size = UDim2.fromOffset(38, 38),
			BackgroundColor3 = accentColor,
			ZIndex = 161,
			Parent = card,
		})
		makeRound(alertIcon)
		create("TextLabel", {
			Text = "!",
			Font = Enum.Font.GothamBlack,
			TextSize = 22,
			TextColor3 = bgColor,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 162,
			Parent = alertIcon,
		})
		local alertIconScale = create("UIScale", { Scale = 0.4, Parent = alertIcon })
		create("TextLabel", {
			Text = logo2,
			Font = Enum.Font.GothamBold,
			TextSize = 15,
			TextColor3 = accentColor,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(16, 64),
			Size = UDim2.new(1, -32, 0, 20),
			ZIndex = 161,
			Parent = card,
		})
		create("TextLabel", {
			Text = text,
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = dimColor,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(20, 86),
			Size = UDim2.new(1, -40, 0, 34),
			ZIndex = 161,
			Parent = card,
		})
		local done = create("TextButton", {
			Text = buttonText or "Done",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = bgColor,
			AutoButtonColor = false,
			BackgroundColor3 = accentColor,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -14),
			Size = UDim2.new(1, -32, 0, 30),
			ZIndex = 161,
			Parent = card,
		})
		addCorner(done, 8)
		local doneScale = create("UIScale", { Parent = done })
		connect(done.MouseEnter, function()
			tween(done, 0.15, { BackgroundColor3 = Color3.fromRGB(215, 215, 215) })
		end)
		connect(done.MouseLeave, function()
			tween(done, 0.15, { BackgroundColor3 = accentColor })
		end)
		tween(card, 0.25, { GroupTransparency = 0 })
		tween(scale, 0.45, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
		task.delay(0.12, function()
			tween(alertIconScale, 0.45, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
		end)
		local closed = false

		local function close()
			if closed then
				return
			end
			closed = true
			if closeActiveAlert == close then
				closeActiveAlert = nil
			end
			tween(backdrop, 0.2, { BackgroundTransparency = 1 })
			tween(scale, 0.2, { Scale = 0.9 }, Enum.EasingDirection.In)
			local t = tween(card, 0.2, { GroupTransparency = 1 })
			t.Completed:Connect(function()
				backdrop:Destroy()
				card:Destroy()
			end)
		end

		closeActiveAlert = close
		connect(done.MouseButton1Click, function()
			doneScale.Scale = 0.92
			tween(doneScale, 0.2, { Scale = 1 })
			close()
		end)
		connect(backdrop.MouseButton1Click, close)
	end

	Section.ColorPicker = function(self2, name, desc, default, callback)
		local color = default
		local key = configKey(self2, name)
		local row = self2:_row(name, desc)
		local swatch = create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(38, 22),
			BackgroundColor3 = color,
			ZIndex = 2,
			Parent = row,
		})
		addCorner(swatch, 6)
		local outline = addStroke(swatch)
		local swatchScale = create("UIScale", { Parent = swatch })
		local hexLabel = create("TextLabel", {
			Text = "#" .. color:ToHex():upper(),
			Font = Enum.Font.GothamMedium,
			TextSize = 11,
			TextColor3 = dimColor,
			TextXAlignment = Enum.TextXAlignment.Right,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -56, 0.5, 0),
			Size = UDim2.fromOffset(70, 20),
			ZIndex = 2,
			Parent = row,
		})

		local function apply(c, silent)
			color = c
			swatch.BackgroundColor3 = c
			hexLabel.Text = "#" .. c:ToHex():upper()
			setConfig(key, c:ToHex())
			if not silent then
				task.spawn(callback, c)
			end
		end

		connect(row.MouseEnter, function()
			tween(outline, 0.15, { Color = accentColor })
		end)
		connect(row.MouseLeave, function()
			tween(outline, 0.15, { Color = strokeColor })
		end)
		connect(row.MouseButton1Click, function()
			if openPicker then
				openPicker(true)
			end
			swatchScale.Scale = 0.85
			tween(swatchScale, 0.3, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			openPicker = openColorPicker(swatch, color, default, function(c)
				apply(c)
			end)
		end)
		register(key, function(v)
			if type(v) ~= "string" then
				return
			end
			local ok, c = pcall(Color3.fromHex, v)
			if ok and c then
				apply(c)
			end
		end, function()
			return color:ToHex()
		end, default:ToHex())
		return {
			Set = function(c, silent)
				apply(c, silent)
			end,
			Get = function()
				return color
			end,
		}
	end

	local charMods = { speed = nil, jump = nil, infJump = false }

	local function getHumanoid()
		local character = player.Character
		return character and character:FindFirstChildOfClass("Humanoid")
	end

	connect(RunService.Heartbeat, function()
		local hum = getHumanoid()
		if hum then
			if charMods.speed and hum.WalkSpeed ~= charMods.speed then
				hum.WalkSpeed = charMods.speed
			end
			if charMods.jump then
				hum.UseJumpPower = true
				if hum.JumpPower ~= charMods.jump then
					hum.JumpPower = charMods.jump
				end
			end
		end
	end)
	local noclipParts = {}
	connect(RunService.Stepped, function()
		if not charMods.noclip then
			return
		end
		local char = player.Character
		if not char then
			return
		end
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				noclipParts[part] = true
				part.CanCollide = false
			end
		end
	end)

	local function disableNoclip()
		charMods.noclip = false
		for part in pairs(noclipParts) do
			if part.Parent then
				part.CanCollide = true
			end
		end
		table.clear(noclipParts)
	end

	local flingParts = {}
	local safeCFrame, safeTime = nil, 0
	connect(RunService.Stepped, function()
		if not charMods.antiFling then
			return
		end
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				for _, part in ipairs(p.Character:GetDescendants()) do
					if part:IsA("BasePart") and part.CanCollide then
						flingParts[part] = true
						part.CanCollide = false
					end
				end
			end
		end
	end)
	connect(RunService.Heartbeat, function()
		if not charMods.antiFling then
			return
		end
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then
			return
		end
		local v, w = hrp.AssemblyLinearVelocity, hrp.AssemblyAngularVelocity
		if v.Magnitude > 200 or w.Magnitude > 60 then
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
				end
			end
			if safeCFrame then
				hrp.CFrame = safeCFrame
			end
		elseif os.clock() - safeTime > 0.1 then
			safeCFrame, safeTime = hrp.CFrame, os.clock()
		end
	end)

	local function disableAntiFling()
		charMods.antiFling = false
		for part in pairs(flingParts) do
			if part.Parent then
				part.CanCollide = true
			end
		end
		table.clear(flingParts)
	end

	connect(UserInputService.JumpRequest, function()
		if not charMods.infJump then
			return
		end
		local hum = getHumanoid()
		if hum and hum.Health > 0 then
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
	local menuSeq = 0
	local showMascot
	local mascot = {}
	local onMenuToggled

	local function setMenuOpen(state)
		menuOpen = state
		if showMascot then
			showMascot(state)
		end
		if onMenuToggled then
			onMenuToggled(state)
		end
		if not state and openPicker then
			openPicker(true)
		end
		menuSeq += 1
		local id = menuSeq
		if state then
			main.Visible = true
			tween(mainScale, 0.3, { Scale = responsiveScale }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			tween(blur, 0.3, { Size = blurSize })
			if currentTab then
				task.delay(0.15, function()
					if id == menuSeq then
						playSweep()
					end
				end)
			end
		else
			tween(blur, 0.2, { Size = 0 })
			local t = tween(mainScale, 0.2, { Scale = 0 }, Enum.EasingDirection.In)
			t.Completed:Connect(function()
				if id == menuSeq then
					main.Visible = false
				end
			end)
		end
	end

	local introPlaying = false

	local function toggleMenu()
		if introPlaying then
			return
		end
		setMenuOpen(not menuOpen)
	end

	connect(closeBtn.MouseButton1Click, function()
		setMenuOpen(false)
	end)
	connect(UserInputService.InputBegan, function(input, gameProcessed)
		if keyListener then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				local f = keyListener
				keyListener = nil
				f(input.KeyCode)
			end
			return
		end
		if gameProcessed then
			return
		end
		if input.KeyCode == toggleKey then
			toggleMenu()
		end
	end)
	local hud = {}

	local function makeDraggable(inst, key, onClick, onRelease, handle)
		local saved = config[key]
		if type(saved) == "table" and #saved == 4 then
			inst.Position = UDim2.new(saved[1], saved[2], saved[3], saved[4])
		end
		local dragInput, dragStart, startPos, moved
		connect((handle or inst).InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragInput, dragStart, startPos, moved = input, input.Position, inst.Position, false
			end
		end)
		connect(UserInputService.InputChanged, function(input)
			if not dragInput then
				return
			end
			if input.UserInputType ~= Enum.UserInputType.MouseMovement and input ~= dragInput then
				return
			end
			local d = input.Position - dragStart
			if not moved and d.Magnitude < 6 then
				return
			end
			moved = true
			inst.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
			local absPos, absSize, vel = inst.AbsolutePosition, inst.AbsoluteSize, gui.AbsoluteSize
			local fx = math.clamp(absPos.X, 0, math.max(0, vel.X - absSize.X)) - absPos.X
			local py = math.clamp(absPos.Y, 0, math.max(0, vel.Y - absSize.Y)) - absPos.Y
			if fx ~= 0 or py ~= 0 then
				inst.Position = inst.Position + UDim2.fromOffset(fx, py)
			end
		end)
		connect(UserInputService.InputEnded, function(input)
			if not dragInput then
				return
			end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input ~= dragInput then
				return
			end
			dragInput = nil
			if onRelease then
				onRelease()
			end
			if moved then
				local p = inst.Position
				config[key] = { p.X.Scale, p.X.Offset, p.Y.Scale, p.Y.Offset }
				dirty, dirtyAt = true, os.clock()
			elseif onClick then
				onClick()
			end
		end)
	end

	local function setPopVisible(frame, scale, on, targetScale)
		targetScale = targetScale or 1
		frame:SetAttribute("pzOn", on)
		if on then
			frame.Visible = true
			scale.Scale = targetScale * 0.6
			tween(scale, 0.35, { Scale = targetScale }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
		else
			local tween2 = tween(scale, 0.18, { Scale = 0 }, Enum.EasingDirection.In)
			tween2.Completed:Connect(function()
				if not frame:GetAttribute("pzOn") then
					frame.Visible = false
				end
			end)
		end
	end

	local wmGradients = {}
	local wmHolder = create("Frame", {
		Name = "WatermarkHolder",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(12, 62),
		Size = UDim2.fromOffset(320, 36),
		ZIndex = 50,
		Parent = gui,
	})
	local watermark = create("TextButton", {
		Name = "Watermark",
		Text = "",
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = bgColor,
		BackgroundTransparency = 0.04,
		Size = UDim2.fromOffset(0, 36),
		Visible = false,
		ZIndex = 50,
		Parent = wmHolder,
	})
	addCorner(watermark, 10)
	local wmScale = create("UIScale", { Scale = 0, Parent = watermark })
	local watermarkTargetScale = 1
	updateWatermarkResponsive = function()
		local cam = workspace.CurrentCamera
		local viewport = cam and cam.ViewportSize or Vector2.new(1280, 720)
		if UserInputService.TouchEnabled then
			if math.min(viewport.X, viewport.Y) >= 600 then
				watermarkTargetScale = 0.85
			else
				watermarkTargetScale = math.clamp(responsiveScale, 0.58, 0.75)
			end
		else
			watermarkTargetScale = 1
		end
		if watermark:GetAttribute("pzOn") then
			wmScale.Scale = watermarkTargetScale
		end
	end
	updateWatermarkResponsive()
	local wmStroke = create("UIStroke", {
		Color = accentColor,
		Thickness = 1,
		Transparency = 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = watermark,
	})
	table.insert(wmGradients, create("UIGradient", { Parent = wmStroke }))
	create("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), Parent = watermark })
	create("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 9),
		Parent = watermark,
	})
	local wmOrder = 0

	local function wmItem(className, props)
		wmOrder += 1
		props.LayoutOrder = wmOrder
		if props.BackgroundTransparency == nil then
			props.BackgroundTransparency = 1
		end
		props.BorderSizePixel = 0
		props.ZIndex = props.ZIndex or 51
		props.Parent = props.Parent or watermark
		return create(className, props)
	end

	local function wmDivider()
		return wmItem("Frame", { Size = UDim2.fromOffset(1, 14), BackgroundTransparency = 0, BackgroundColor3 = strokeColor })
	end

	local function wmLabel(width)
		return wmItem("TextLabel", {
			Text = "",
			RichText = true,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextColor3 = textColor,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromOffset(width, 36),
		})
	end

	local logo2 = wmItem("Frame", { Size = UDim2.fromOffset(24, 24), BackgroundTransparency = 0, BackgroundColor3 = accentColor, ClipsDescendants = true })
	addCorner(logo2, 7)
	table.insert(wmGradients, create("UIGradient", { Rotation = 45, Parent = logo2 }))
	local logoText = create("TextLabel", {
		Text = "rh",
		Font = Enum.Font.GothamBlack,
		TextSize = 12,
		TextColor3 = bgColor,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromOffset(0, -1),
		ZIndex = 52,
		Parent = logo2,
	})
	local logoImage = create("ImageLabel", {
		Image = "",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ScaleType = Enum.ScaleType.Fit,
		Visible = false,
		ZIndex = 53,
		Parent = logo2,
	})
	task.spawn(function()
		local getAsset = getcustomasset or getsynasset
		if not (writefile and getAsset) then
			return
		end
		local file = "rockhub_logo.png"
		if not (isfile and isfile(file)) then
			local ok, data = pcall(game.HttpGet, game, "https://raw.githubusercontent.com/rockscripter/MM2Drone/refs/heads/main/logo.png")
			if not ok or type(data) ~= "string" or #data == 0 or not pcall(writefile, file, data) then
				return
			end
		end
		local ok, asset = pcall(getAsset, file)
		if ok and asset then
			logoImage.Image = asset
			logoImage.Visible = true
			logoText.Visible = false
		end
	end)
	local brandLabel = wmItem("TextLabel", {
		Text = "rock hub",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = accentColor,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, 36),
	})
	table.insert(wmGradients, create("UIGradient", { Parent = brandLabel }))
	wmDivider()
	local fpsLabel = wmLabel(50)
	wmDivider()
	local signalIcon = wmItem("Frame", { Size = UDim2.fromOffset(13, 10) })
	local signalBars = {}
	for i = 1, 3 do
		signalBars[i] = create("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, (i - 1) * 5, 1, 0),
			Size = UDim2.fromOffset(3, 3 + i * 2.4),
			BackgroundColor3 = hoverColor,
			BorderSizePixel = 0,
			ZIndex = 52,
			Parent = signalIcon,
		})
		addCorner(signalBars[i], 1)
	end
	local pingLabel = wmLabel(44)
	wmDivider()
	local clockLabel = wmLabel(34)
	local function statText(left, right)
		return string.format("<font color=\"#FFFFFF\">%s</font> <font color=\"#787878\">%s</font>", left, right)
	end

	fpsLabel.Text = statText("--", "fps")
	pingLabel.Text = statText("--", "ms")
	clockLabel.Text = "<font color=\"#FFFFFF\">" .. os.date("%H:%M") .. "</font>"
	local menuButton = wmItem("Frame", {
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, 24),
		BackgroundTransparency = 0,
		BackgroundColor3 = elemColor,
	})
	addCorner(menuButton, 7)
	local menuStroke = create("UIStroke", {
		Color = accentColor,
		Transparency = 0.6,
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = menuButton,
	})
	create("UIPadding", { PaddingLeft = UDim.new(0, 9), PaddingRight = UDim.new(0, 10), Parent = menuButton })
	create("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 7),
		Parent = menuButton,
	})
	local burger = create("Frame", {
		Size = UDim2.fromOffset(12, 10),
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Parent = menuButton,
	})
	local burgerLines = {}
	for i = 1, 3 do
		burgerLines[i] = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0, 1 + (i - 1) * 4),
			Size = UDim2.fromOffset(12, 2),
			BackgroundColor3 = textColor,
			BorderSizePixel = 0,
			ZIndex = 53,
			Parent = burger,
		})
		makeRound(burgerLines[i])
	end
	local menuLabel = create("TextLabel", {
		Text = "menu",
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		TextColor3 = textColor,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(32, 24),
		LayoutOrder = 2,
		ZIndex = 53,
		Parent = menuButton,
	})
	return (function(...)
		local tip = create("Frame", {
			Name = "WatermarkTip",
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = panelColor,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 60,
			Parent = wmHolder,
		})
		addCorner(tip, 8)
		addStroke(tip, hoverColor)
		local tipScale = create("UIScale", { Scale = 0, Parent = tip })
		create("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 7),
			PaddingBottom = UDim.new(0, 7),
			Parent = tip,
		})
		create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = tip })
		local tipTitle = create("TextLabel", {
			Text = "click to open the menu",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = accentColor,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ZIndex = 61,
			Parent = tip,
		})
		local tipHint = create("TextLabel", {
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextColor3 = dimColor,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ZIndex = 61,
			Parent = tip,
		})
		local tipArrow = create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(9, 9),
			Rotation = 45,
			BackgroundColor3 = panelColor,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 59,
			Parent = wmHolder,
		})
		addStroke(tipArrow, hoverColor)
		local wmUsed = config["hud/wm_used"] == true
		local hovering = false
		local tipShown, tipSeq = false, 0

		local function placeTip()
			local x0 = watermark.AbsolutePosition.X
			local relX = menuButton.AbsolutePosition.X - x0
			local y = watermark.AbsoluteSize.Y + 10
			tip.Position = UDim2.fromOffset(relX + menuButton.AbsoluteSize.X + 6, y)
			tipArrow.Position = UDim2.fromOffset(relX + menuButton.AbsoluteSize.X / 2, y)
		end

		local function showTip(on, hideAfter)
			tipSeq += 1
			if on == tipShown then
				if not on then
					return
				end
			else
				tipShown = on
				tipTitle.Text = menuOpen and "click to close the menu" or "click to open the menu"
				tipHint.Text = "drag to move  ·  or press " .. toggleKey.Name
				if on then
					placeTip()
				end
				setPopVisible(tip, tipScale, on)
				tipArrow.Visible = on
			end
			if on and hideAfter then
				local id = tipSeq
				task.delay(hideAfter, function()
					if id == tipSeq and not hovering then
						showTip(false)
					end
				end)
			end
		end

		local function refreshMenuButton()
			local hover = hovering
			tween(wmScale, 0.2, { Scale = watermarkTargetScale * (hover and 1.03 or 1) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			tween(wmStroke, 0.2, { Transparency = (hover or menuOpen) and 0 or 0.5 })
			local btnColor = hover and accentColor or (menuOpen and hoverColor or elemColor)
			local fg = hover and bgColor or textColor
			tween(menuButton, 0.2, { BackgroundColor3 = btnColor })
			tween(menuLabel, 0.2, { TextColor3 = fg })
			for _, l in ipairs(burgerLines) do
				tween(l, 0.2, { BackgroundColor3 = fg })
			end
			if wmUsed or hover then
				tween(menuStroke, 0.2, { Transparency = hover and 0 or 0.6 })
			end
		end

		local function animateBurger(open)
			local direction, style = Enum.EasingDirection.Out, Enum.EasingStyle.Quint
			tween(burgerLines[1], 0.35, { Position = UDim2.new(0.5, 0, 0, open and 5 or 1), Rotation = open and 45 or 0 }, direction, style)
			tween(burgerLines[2], 0.25, { Size = UDim2.fromOffset(open and 0 or 12, 2), BackgroundTransparency = open and 1 or 0 }, direction, style)
			tween(burgerLines[3], 0.35, { Position = UDim2.new(0.5, 0, 0, open and 5 or 9), Rotation = open and -45 or 0 }, direction, style)
			menuLabel.Text = open and "close" or "menu"
		end

		connect(watermark.MouseEnter, function()
			hovering = true
			refreshMenuButton()
			local id = tipSeq
			task.delay(0.35, function()
				if hovering and id == tipSeq then
					showTip(true)
				end
			end)
		end)
		connect(watermark.MouseLeave, function()
			hovering = false
			refreshMenuButton()
			showTip(false)
		end)
		connect(watermark.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				tween(wmScale, 0.1, { Scale = watermarkTargetScale * 0.96 })
			end
		end)
		makeDraggable(wmHolder, "hud/watermark_pos", function()
			if not wmUsed then
				wmUsed = true
				config["hud/wm_used"] = true
				dirty, dirtyAt = true, os.clock()
			end
			showTip(false)
			toggleMenu()
		end, function()
			if not UserInputService.MouseEnabled then
				hovering = false
			end
			refreshMenuButton()
		end, watermark)

		hud.setWatermark = function(on)
			if on == (watermark:GetAttribute("pzOn") == true) then
				return
			end
			setPopVisible(watermark, wmScale, on, watermarkTargetScale)
			if not on then
				showTip(false)
			end
		end

		local Stats = game:GetService("Stats")

		local function getPing()
			local ok, ping = pcall(function()
				return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)
			if ok and type(ping) == "number" then
				return ping
			end
			ok, ping = pcall(function()
				return player:GetNetworkPing() * 2000
			end)
			return ok and ping or 0
		end

		local frameCount, fpsClock, lastLevel = 0, os.clock(), -1
		local wmStart = os.clock()
		connect(RunService.RenderStepped, function()
			frameCount += 1
			local now = os.clock()
			if watermark.Visible then
				local t = (now - wmStart) * 0.35
				local seq = shimmerSeq(t)
				for _, g in ipairs(wmGradients) do
					g.Color = seq
				end
				if not wmUsed and not hovering then
					menuStroke.Transparency = 0.15 + 0.55 * (0.5 + 0.5 * math.cos((now - wmStart) * 4))
				end
				if wmScale.Scale > watermarkTargetScale * 0.99 then
					wmHolder.Size = UDim2.fromOffset(watermark.AbsoluteSize.X, watermark.AbsoluteSize.Y)
				end
				if tip.Visible then
					placeTip()
				end
			end
			if now - fpsClock < 0.5 then
				return
			end
			local fps = math.floor(frameCount / (now - fpsClock) + 0.5)
			frameCount, fpsClock = 0, now
			if not watermark.Visible then
				return
			end
			local pingMs = math.floor(getPing() + 0.5)
			fpsLabel.Text = statText(fps, "fps")
			pingLabel.Text = statText(pingMs, "ms")
			clockLabel.Text = "<font color=\"#FFFFFF\">" .. os.date("%H:%M") .. "</font>"
			local lit = pingMs < 90 and 3 or (pingMs < 180 and 2 or 1)
			if lit ~= lastLevel then
				lastLevel = lit
				for i, b in ipairs(signalBars) do
					tween(b, 0.25, { BackgroundColor3 = i <= lit and accentColor or hoverColor })
				end
			end
		end)

		onMenuToggled = function(state)
			animateBurger(state)
			refreshMenuButton()
			if state then
				showTip(false)
			elseif not wmUsed and watermark:GetAttribute("pzOn") then
				task.delay(0.25, function()
					if not menuOpen and not wmUsed then
						showTip(true, 6)
					end
				end)
			end
		end

		local dragging, dragOrigin, startPos
		connect(topBar.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragOrigin = input.Position
				startPos = main.Position
			end
		end)
		connect(UserInputService.InputChanged, function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			if dragSlider then
				dragSlider(input.Position.X)
			elseif dragging then
				local d = input.Position - dragOrigin
				main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
			end
		end)
		connect(UserInputService.InputEnded, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
				dragSlider = nil
			end
		end)
		local gradStart, lastGradientUpdate = os.clock(), 0
		connect(RunService.RenderStepped, function()
			if not main.Visible then
				return
			end
			local now = os.clock()
			if now - lastGradientUpdate < 1 / 30 then
				return
			end
			lastGradientUpdate = now
			local t = (now - gradStart) * 0.35
			local seq = shimmerSeq(t)
			for _, g in ipairs(gradients) do
				g.Color = seq
			end
			gradients[1].Rotation = t * 90 % 360
		end)
		do
			local mascots = {
				CoolRock = {
					file = storageFolder .. "/coolrock2.png",
					url = "https://raw.githubusercontent.com/rockscripter/MM2Drone/refs/heads/main/coolrock2.png",
					frames = 45,
					cols = 7,
					cell = 144,
					cropLeft = 8,
					cropRight = 8,
					cropTop = 16,
					cropBottom = 4,
					delay = 0.14,
				},
			}
			local img = create("ImageLabel", {
				Name = "Mascot",
				AnchorPoint = Vector2.new(0.5, 1),
				Size = UDim2.fromOffset(150, 150),
				BackgroundTransparency = 1,
				ImageTransparency = 1,
				ScaleType = Enum.ScaleType.Fit,
				Visible = false,
				ZIndex = 1,
				Parent = gui,
			})
			local cur
			mascot.name = "CoolRock"
			if config["meta/coolrock_default"] ~= true then
				config["meta/coolrock_default"] = true
				config["Settings/Mascot/CoolRock"] = true
				dirty = true
				saveConfig()
				pcall(function()
					if writefile then
						writefile("rockhub_mascot.txt", "CoolRock")
					end
				end)
			else
				pcall(function()
					if isfile and isfile("rockhub_mascot.txt") then
						local v = readfile("rockhub_mascot.txt")
						if v == "Off" or v == "CoolRock" then
							mascot.name = v
						end
					end
				end)
			end

			local cache = {}

			local function loadAsset(name)
				if cache[name] then
					return cache[name]
				end
				local m = mascots[name]
				local getAsset = getcustomasset or getsynasset
				if not m or not getAsset then
					return
				end
				if not (isfile and isfile(m.file)) and m.url and writefile then
					local ok, data = pcall(game.HttpGet, game, m.url)
					if ok and type(data) == "string" and #data > 0 then
						pcall(writefile, m.file, data)
					end
				end
				if not (isfile and isfile(m.file)) then
					return
				end
				local ok, asset = pcall(getAsset, m.file)
				if ok and asset then
					cache[name] = asset
					return asset
				end
			end

			local popValue = Instance.new("NumberValue")
			local hoverValue = Instance.new("NumberValue")
			local popTween
			local popSeq = 0

			showMascot = function(state)
				if not cur then
					return
				end
				popSeq += 1
				local id = popSeq
				if popTween then
					popTween:Cancel()
				end
				if state then
					img.Visible = true
					popValue.Value = 0
					popTween = TweenService:Create(popValue, TweenInfo.new(0.75, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0.2), { Value = 1 })
					popTween:Play()
				else
					popTween = tween(popValue, 0.2, { Value = 0 }, Enum.EasingDirection.In)
					popTween.Completed:Connect(function(st)
						if id == popSeq and st == Enum.PlaybackState.Completed then
							img.Visible = false
						end
					end)
				end
			end

			local loadSeq = 0

			local function loadMascot(name)
				loadSeq += 1
				local id = loadSeq
				task.spawn(function()
					if cur and img.Visible then
						showMascot(false)
						task.wait(0.22)
					end
					if id ~= loadSeq then
						return
					end
					cur = nil
					img.Visible = false
					if name == "Off" then
						return
					end
					local asset = loadAsset(name)
					if id ~= loadSeq or not asset then
						return
					end
					local m = mascots[name]
					img.Image = asset
					local cropLeft, cropTop = m.cropLeft or 0, m.cropTop or 0
					local cropRight, cropBottom = m.cropRight or 0, m.cropBottom or 0
					img.ImageRectOffset = m.frames and Vector2.new(cropLeft, cropTop) or Vector2.zero
					img.ImageRectSize = m.frames and Vector2.new(m.cell - cropLeft - cropRight, m.cell - cropTop - cropBottom) or Vector2.zero
					cur = m
					if menuOpen then
						showMascot(true)
					end
				end)
			end

			mascot.set = function(name)
				if name == mascot.name then
					return
				end
				mascot.name = name
				pcall(function()
					if writefile then
						writefile("rockhub_mascot.txt", name)
					end
				end)
				loadMascot(name)
			end

			connect(img.MouseEnter, function()
				tween(hoverValue, 0.35, { Value = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			end)
			connect(img.MouseLeave, function()
				tween(hoverValue, 0.3, { Value = 0 })
			end)
			local fx, py, vx, vy = 0, 0, 0, 0
			local rot, rotVel = 0, 0
			local smoothVx = 0
			local lastX
			local dragAmt = 0
			local mascotStart = os.clock()
			connect(RunService.RenderStepped, function(dt)
				if not img.Visible or not cur then
					lastX = nil
					return
				end
				dt = math.min(dt, 0.03333333333333333)
				local t = os.clock() - mascotStart
				local s = mainScale.Scale
				local p = popValue.Value
				local hoverAmt = hoverValue.Value
				local pos, meshSize = main.Position, main.Size
				local menuX, menuY = pos.X.Offset, pos.Y.Offset
				if cur.frames then
					local f = math.floor(t / cur.delay) % cur.frames
					img.ImageRectOffset = Vector2.new(f % cur.cols * cur.cell + (cur.cropLeft or 0), math.floor(f / cur.cols) * cur.cell + (cur.cropTop or 0))
				end
				if not lastX then
					fx, py, vx, vy, rot, rotVel, smoothVx = menuX, menuY, 0, 0, 0, 0, 0
					lastX = menuX
				end
				smoothVx += ((menuX - lastX) / dt - smoothVx) * math.min(dt * 12, 1)
				lastX = menuX
				dragAmt += ((dragging and 1 or 0) - dragAmt) * math.min(dt * 8, 1)
				local h = dt / 2
				for _ = 1, 2 do
					vx += ((menuX - fx) * 170 - vx * 13) * h
					vy += ((menuY - py) * 170 - vy * 13) * h
					fx += vx * h
					py += vy * h
					rotVel += ((math.clamp(-smoothVx * 0.015, -22, 22) - rot) * 120 - rotVel * 9) * h
					rot += rotVel * h
				end
				local lagX = math.clamp(fx - menuX, -10, 10)
				local lagY = math.clamp(py - menuY, -40, 0)
				fx, py = menuX + lagX, math.clamp(py, menuY - 40, menuY)
				local sq = math.clamp(vy * 0.00025, -0.12, 0.12)
				local sx, sy = 1 + sq * 0.6, 1 - sq
				local size = 150 * s * (1 + 0.07 * hoverAmt)
				local w, imgH = size * sx, size * sy
				local left = menuX - meshSize.X.Offset / 2 * s
				local topBar2 = menuY - meshSize.Y.Offset / 2 * s
				local x = left + 58 * s + lagX * p
				local peekY = topBar2 + 13 * s
				local y = peekY - (1 - p) * 70 * s + lagY * p - 6 * hoverAmt * s - 6 * dragAmt * s
				local angle = rot * math.clamp(p, 0, 1) - 4 * hoverAmt
				local r = math.rad(angle)
				x += math.sin(r) * imgH / 2
				y += (1 - math.cos(r)) * imgH / 2
				img.Position = UDim2.new(pos.X.Scale, x, pos.Y.Scale, y)
				img.Size = UDim2.fromOffset(w, imgH)
				img.Rotation = angle
				img.ImageTransparency = math.clamp(1 - p * 3, 0, 1)
			end)
			loadMascot(mascot.name)
		end
		local mainTab = addTab("Main", "gear", "speed, jumps and character")
		local combatTab = addTab("Combat", "target", "combat features")
		local droneTab = addTab("Drone", "drone", "fly a Shahed or FPV drone into players")
		addSeparator()
		local trollTab = addTab("Troll Fun", "smile", "fun and trolling")
		local playersTab = addTab("Players", "smile", "player list and quick actions")
		local animsTab = addTab("Free anims", "move", "animation packs for your character")
		local voteTab = addTab("Vote Dupe Map", "pin", "vote for a map over and over (tp + reset loop)")
		local stopAnims
		addSeparator()
		local visualsTab = addTab("Visuals", "eye", "realistic shader, light and sky")
		setSubTabs(visualsTab, { "Shader", "ESP", "BackTrack", "Models" })
		local skinTab = addTab("Skin Changer", "star", "every MM2 knife and gun, only you see them")
		local cursorsTab = addTab("Cursors", "bolt", "your own cursor")
		local stopCursor
		local stopEsp
		local stopSpin
		local stopBackTrack
		local stopSkinChanger
		local stopShader
		local stopVoteDupe
		local stopBunnyModel
		local stopAvatar
		local stopAura
		local stopOrbs
		local stopSkyWorms
		local stopAwm
		local stopRoleFling
		local playerFlingAction
		local playerKnifeKill
		local playerGunKill
		local stopPlayersActions
		local function findTool(p, name)
			local char, backpack = p and p.Character, p and p:FindFirstChildOfClass("Backpack")
			return char and char:FindFirstChild(name) or backpack and backpack:FindFirstChild(name)
		end

		local function alive(p)
			local char = p and p.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if hrp and hum and hum.Health > 0 then
				return hrp, hum, char
			end
		end

		local lobbyCache, lobbyCFrame, lobbyHalfSize, lobbyCacheAt
		local function inLobby(pos)
			local now = os.clock()
			if not lobbyCacheAt or now - lobbyCacheAt > 1 or not lobbyCache or not lobbyCache.Parent then
				lobbyCacheAt = now
				lobbyCache = workspace:FindFirstChild("Lobby") or workspace:FindFirstChild("RegularLobby")
				lobbyCFrame, lobbyHalfSize = nil, nil
				if lobbyCache then
					local ok, cf, size = pcall(lobbyCache.GetBoundingBox, lobbyCache)
					if ok then
						lobbyCFrame = cf
						lobbyHalfSize = size / 2 + Vector3.new(10, 30, 10)
					end
				end
			end
			if not lobbyCFrame then
				return false
			end
			local rel = lobbyCFrame:PointToObjectSpace(pos)
			return math.abs(rel.X) <= lobbyHalfSize.X and math.abs(rel.Y) <= lobbyHalfSize.Y and math.abs(rel.Z) <= lobbyHalfSize.Z
		end

		local desync = { real = nil, pause = 0, on = false }
		local function pauseDesync(root)
			if desync.real and root and root.Parent then
				root.CFrame = desync.real
			end
			desync.real = nil
			desync.pause += 1
		end

		local function resumeDesync()
			desync.pause = math.max(0, desync.pause - 1)
		end

		addSeparator()
		local settingsTab = addTab("Settings", "sliders", "menu settings")
		updateSidebarCanvas()
		local serverTab = addTab("Server", "globe", "server and utilities")
		local notify
		local playerSection = addSection(mainTab, "Player")
		playerSection:Slider("WalkSpeed", 16, 150, 16, function(v)
			charMods.speed = v
		end)
		playerSection:Slider("JumpPower", 50, 250, 50, function(v)
			charMods.jump = v
		end)
		playerSection:Toggle("Infinite Jump", "jump again in the air", function(on)
			charMods.infJump = on
		end)
		playerSection:Toggle("Anti Fling", "nobody can fling you", function(on)
			if on then
				charMods.antiFling = true
			else
				disableAntiFling()
			end
			notify("Anti Fling: " .. (on and "On" or "Off"), on and "you can't be flung" or "disabled")
		end)
		playerSection:Toggle("Noclip", "walk through walls", function(on)
			if on then
				charMods.noclip = true
			else
				disableNoclip()
			end
			notify("Noclip: " .. (on and "On" or "Off"), on and "walls can't stop you" or "collision is back")
		end)
		local otherSection = addSection(mainTab, "Other")
		otherSection:Button("Reset stats", "speed and jump back to default", function()
			charMods.speed, charMods.jump = nil, nil
			local hum = getHumanoid()
			if hum then
				hum.WalkSpeed = 16
				hum.JumpPower = 50
			end
		end)
		otherSection:Button("Respawn", "kill your character", function()
			local hum = getHumanoid()
			if hum then
				hum.Health = 0
			end
		end)
		local notifications = {}

		local function notifyStyle(head)
			local h = head:lower()
			if h:find("murderer") then
				return Color3.fromRGB(255, 70, 70), "!"
			end
			if h:find("sheriff") then
				return Color3.fromRGB(70, 150, 255), "!"
			end
			if h:find(": on") then
				return Color3.fromRGB(110, 230, 140), "check"
			end
			if h:find(": off") then
				return Color3.fromRGB(150, 150, 158), "cross"
			end
			return accentColor, "i"
		end

		local function layoutNotifications()
			for i, t in ipairs(notifications) do
				local y = -20 - (i - 1) * 68
				tween(t.card, 0.35, { Position = UDim2.new(1, -20, 1, y) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
			end
		end

		notify = function(head, body)
			if loading then
				return
			end
			local accent, kind = notifyStyle(head)
			local card = create("TextButton", {
				Text = "",
				AutoButtonColor = false,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, 330, 1, -20),
				Size = UDim2.fromOffset(270, 58),
				BackgroundColor3 = panelColor,
				ZIndex = 150,
				Parent = gui,
			})
			addCorner(card, 12)
			create("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new(accentColor, Color3.fromRGB(170, 170, 170)),
				Parent = card,
			})
			local st = create("UIStroke", {
				Color = accent,
				Transparency = 0.15,
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Parent = card,
			})
			local scale = create("UIScale", { Scale = 0.88, Parent = card })
			local glow = create("Frame", {
				Size = UDim2.new(0.7, 0, 1, 0),
				BackgroundColor3 = accent,
				BorderSizePixel = 0,
				ZIndex = 150,
				Parent = card,
			})
			addCorner(glow, 12)
			create("UIGradient", {
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.84), NumberSequenceKeypoint.new(1, 1) }),
				Parent = glow,
			})
			local icon = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0, 29, 0.5, -1),
				Size = UDim2.fromOffset(34, 34),
				BackgroundColor3 = accent,
				BackgroundTransparency = 0.82,
				ZIndex = 151,
				Parent = card,
			})
			makeRound(icon)
			create("UIStroke", { Color = accent, Transparency = 0.3, Thickness = 1.2, Parent = icon })
			local iconScale = create("UIScale", { Scale = 0, Parent = icon })
			if kind == "check" then
				for _, s in ipairs({ { 10, 17.5, 15, 22.5 }, { 15, 22.5, 24.5, 12 } }) do
					line(icon, s[1], s[2], s[3], s[4], 2.6, accent).ZIndex = 152
				end
			elseif kind == "cross" then
				for _, s in ipairs({ { 11.5, 11.5, 22.5, 22.5 }, { 22.5, 11.5, 11.5, 22.5 } }) do
					line(icon, s[1], s[2], s[3], s[4], 2.4, accent).ZIndex = 152
				end
			else
				create("TextLabel", {
					Text = kind,
					Font = Enum.Font.GothamBlack,
					TextSize = 17,
					TextColor3 = accent,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 152,
					Parent = icon,
				})
			end
			create("TextLabel", {
				Text = head,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				TextColor3 = accentColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(56, 10),
				Size = UDim2.new(1, -68, 0, 17),
				ZIndex = 151,
				Parent = card,
			})
			create("TextLabel", {
				Text = body or "",
				Font = Enum.Font.Gotham,
				TextSize = 11,
				TextColor3 = Color3.fromRGB(165, 165, 172),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(56, 28),
				Size = UDim2.new(1, -68, 0, 15),
				ZIndex = 151,
				Parent = card,
			})
			local bar = create("Frame", {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 14, 1, -6),
				Size = UDim2.new(1, -28, 0, 2),
				BackgroundColor3 = accent,
				BackgroundTransparency = 0.25,
				BorderSizePixel = 0,
				ZIndex = 151,
				Parent = card,
			})
			makeRound(bar)
			local t = { card = card, alive = true }
			table.insert(notifications, 1, t)
			while #notifications > 4 do
				local old = table.remove(notifications)
				old.alive = false
				old.card:Destroy()
			end
			layoutNotifications()
			tween(scale, 0.45, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			task.delay(0.12, function()
				if card.Parent then
					tween(iconScale, 0.45, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				end
			end)
			st.Transparency = 0
			tween(st, 0.8, { Transparency = 0.6 })
			tween(bar, 2.8, { Size = UDim2.new(0, 0, 0, 2) }, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear)

			local function close()
				if not t.alive then
					return
				end
				t.alive = false
				local i = table.find(notifications, t)
				if i then
					table.remove(notifications, i)
				end
				layoutNotifications()
				tween(scale, 0.25, { Scale = 0.9 }, Enum.EasingDirection.In)
				local out = tween(card, 0.28, { Position = UDim2.new(1, 330, card.Position.Y.Scale, card.Position.Y.Offset) }, Enum.EasingDirection.In, Enum.EasingStyle.Quint)
				out.Completed:Connect(function()
					card:Destroy()
				end)
			end

			connect(card.MouseEnter, function()
				tween(st, 0.15, { Transparency = 0.1 })
			end)
			connect(card.MouseLeave, function()
				tween(st, 0.25, { Transparency = 0.6 })
			end)
			connect(card.MouseButton1Click, close)
			task.delay(2.8, close)
		end

		do
			local TeleportService = game:GetService("TeleportService")
			local HttpService = game:GetService("HttpService")
			local page = serverTab.page
			serverTab.custom = true
			serverTab.title.Visible = false
			serverTab.desc.Visible = false
			page.CanvasSize = UDim2.new()
			local cardColor = Color3.fromRGB(27, 27, 29)
			create("TextLabel", {
				Text = "Server",
				Font = Enum.Font.GothamBold,
				TextSize = 18,
				TextColor3 = accentColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -8, 0, 22),
				Parent = page,
			})
			local subtitle = create("TextLabel", {
				Text = "loading...",
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = dimColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 22),
				Size = UDim2.new(1, -8, 0, 16),
				Parent = page,
			})
			local gameName = "this game"
			task.spawn(function()
				local ok, info = pcall(function()
					return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
				end)
				if ok and info and info.Name then
					gameName = info.Name
				end
			end)
			local cardGradients = {}

			local function card(parent, props)
				local className = props.Class or "Frame"
				props.Class = nil
				props.BackgroundColor3 = props.BackgroundColor3 or cardColor
				props.Parent = parent
				local f = create(className, props)
				addCorner(f, 10)
				local st = create("UIStroke", {
					Color = accentColor,
					Transparency = 0.55,
					Thickness = 1,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Parent = f,
				})
				table.insert(cardGradients, create("UIGradient", { Parent = st }))
				return f, st
			end

			local layoutY = 50
			local statsGrid = create("Frame", {
				Position = UDim2.fromOffset(2, layoutY),
				Size = UDim2.new(1, -12, 0, 64),
				BackgroundTransparency = 1,
				Parent = page,
			})
			create("UIGridLayout", {
				CellSize = UDim2.new(0.25, -7, 0, 64),
				CellPadding = UDim2.fromOffset(8, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = statsGrid,
			})
			local statOrder = 0

			local function statCard(label)
				statOrder += 1
				local f = card(statsGrid, { LayoutOrder = statOrder })
				f.Name = label
				create("TextLabel", {
					Text = label,
					Font = Enum.Font.GothamBold,
					TextSize = 9,
					TextColor3 = mutedColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(12, 9),
					Size = UDim2.new(1, -24, 0, 12),
					Parent = f,
				})
				local statText2 = create("TextLabel", {
					Text = "--",
					RichText = true,
					Font = Enum.Font.GothamBold,
					TextSize = 19,
					TextColor3 = accentColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(12, 24),
					Size = UDim2.new(1, -24, 0, 24),
					Parent = f,
				})
				return f, statText2
			end

			local _, uptimeStat = statCard("ON THIS SERVER")
			local playersCard, playersStat = statCard("PLAYERS")
			local _, pingStat = statCard("PING")
			local _, fpsStat = statCard("FPS")
			local playersBar = create("Frame", {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 12, 1, -9),
				Size = UDim2.new(1, -24, 0, 3),
				BackgroundColor3 = hoverColor,
				BorderSizePixel = 0,
				Parent = playersCard,
			})
			makeRound(playersBar)
			local fill = create("Frame", {
				Size = UDim2.fromScale(0, 1),
				BackgroundColor3 = accentColor,
				BorderSizePixel = 0,
				Parent = playersBar,
			})
			makeRound(fill)
			layoutY += 76
			local jobCard = card(page, { Position = UDim2.fromOffset(2, layoutY), Size = UDim2.new(1, -12, 0, 56) })
			create("TextLabel", {
				Text = "JOB ID",
				Font = Enum.Font.GothamBold,
				TextSize = 9,
				TextColor3 = mutedColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(12, 10),
				Size = UDim2.new(1, -24, 0, 12),
				Parent = jobCard,
			})
			local jobId = game.JobId ~= "" and game.JobId or "studio / local server"
			create("TextLabel", {
				Text = jobId,
				Font = Enum.Font.Code,
				TextSize = 12,
				TextColor3 = textColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(12, 26),
				Size = UDim2.new(1, -176, 0, 18),
				Parent = jobCard,
			})

			local function miniButton(parent, text, x, w, fn)
				local b = create("TextButton", {
					Text = text,
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextColor3 = textColor,
					AutoButtonColor = false,
					BackgroundColor3 = bgColor,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, x, 0.5, 0),
					Size = UDim2.fromOffset(w, 28),
					Parent = parent,
				})
				addCorner(b, 8)
				local st = addStroke(b)
				local scale = create("UIScale", { Parent = b })
				connect(b.MouseEnter, function()
					tween(b, 0.15, { BackgroundColor3 = accentColor, TextColor3 = bgColor })
					tween(st, 0.15, { Color = accentColor })
				end)
				connect(b.MouseLeave, function()
					tween(b, 0.15, { BackgroundColor3 = bgColor, TextColor3 = textColor })
					tween(st, 0.15, { Color = strokeColor })
				end)
				connect(b.MouseButton1Click, function()
					scale.Scale = 0.88
					tween(scale, 0.3, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
					fn(b)
				end)
				return b
			end

			local function copyText(text, what)
				if setclipboard then
					setclipboard(text)
					notify("Copied", what)
				else
					notify("Clipboard", "not supported here")
				end
			end

			local function flash(b, text)
				local old = b.Text
				b.Text = text
				task.delay(1.2, function()
					if b.Parent then
						b.Text = old
					end
				end)
			end

			miniButton(jobCard, "Copy join", -12, 76, function(b)
				copyText(("game:GetService(\"TeleportService\"):TeleportToPlaceInstance(%d, \"%s\")"):format(game.PlaceId, game.JobId), "join script - send it to a friend")
				flash(b, "Copied")
			end)
			miniButton(jobCard, "Copy ID", -94, 66, function(b)
				copyText(game.JobId, "job id")
				flash(b, "Copied")
			end)
			layoutY += 68
			local actionGrid = create("Frame", {
				Position = UDim2.fromOffset(2, layoutY),
				Size = UDim2.new(1, -12, 0, 62),
				BackgroundTransparency = 1,
				Parent = page,
			})
			create("UIGridLayout", {
				CellSize = UDim2.new(0.3333333333333333, -6, 0, 62),
				CellPadding = UDim2.fromOffset(8, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = actionGrid,
			})
			local busy = false
			local actionOrder = 0

			local function actionCard(logo3, desc, fn)
				actionOrder += 1
				local b, st = card(actionGrid, { Class = "TextButton", LayoutOrder = actionOrder })
				b.Text = ""
				b.AutoButtonColor = false
				local scale = create("UIScale", { Parent = b })
				local titleLabel = create("TextLabel", {
					Text = logo3,
					Font = Enum.Font.GothamBold,
					TextSize = 14,
					TextColor3 = accentColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(12, 12),
					Size = UDim2.new(1, -24, 0, 18),
					Parent = b,
				})
				local descLabel = create("TextLabel", {
					Text = desc,
					Font = Enum.Font.Gotham,
					TextSize = 10,
					TextColor3 = mutedColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(12, 32),
					Size = UDim2.new(1, -24, 0, 14),
					Parent = b,
				})
				local arrow = create("Frame", {
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -12, 0, 14),
					Size = UDim2.fromOffset(8, 8),
					BackgroundTransparency = 1,
					Parent = b,
				})
				local a1 = line(arrow, 0, 8, 8, 0, 1.6, mutedColor)
				local a2 = line(arrow, 2.5, 0, 8, 0, 1.6, mutedColor)
				local a3 = line(arrow, 8, 0, 8, 5.5, 1.6, mutedColor)

				local function hover(on)
					tween(b, 0.18, { BackgroundColor3 = on and accentColor or cardColor })
					tween(st, 0.18, { Transparency = on and 0 or 0.55 })
					tween(titleLabel, 0.18, { TextColor3 = on and bgColor or accentColor })
					tween(descLabel, 0.18, { TextColor3 = on and Color3.fromRGB(90, 90, 90) or mutedColor })
					for _, l in ipairs({ a1, a2, a3 }) do
						tween(l, 0.18, { BackgroundColor3 = on and bgColor or mutedColor })
					end
					tween(arrow, 0.25, { Position = UDim2.new(1, on and -10 or -12, 0, on and 12 or 14) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				end

				connect(b.MouseEnter, function()
					hover(true)
				end)
				connect(b.MouseLeave, function()
					hover(false)
				end)
				connect(b.MouseButton1Click, function()
					scale.Scale = 0.94
					tween(scale, 0.35, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
					if busy then
						return
					end
					busy = true
					local old = descLabel.Text
					local ok, err = pcall(fn, function(t)
						descLabel.Text = t
					end)
					if not ok then
						notify(logo3, tostring(err):sub(1, 60))
					end
					task.delay(3, function()
						busy = false
						if descLabel.Parent then
							descLabel.Text = old
						end
					end)
				end)
			end

			local function findServer(smallest)
				local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100"):format(game.PlaceId, smallest and "Asc" or "Desc")
				local ok, res = pcall(function()
					return HttpService:JSONDecode(game:HttpGet(url))
				end)
				if not ok or type(res) ~= "table" or type(res.data) ~= "table" then
					return nil
				end
				local list = {}
				for _, server in ipairs(res.data) do
					if server.id ~= game.JobId and server.playing and server.maxPlayers and server.playing < server.maxPlayers then
						table.insert(list, server)
					end
				end
				if #list == 0 then
					return nil
				end
				if smallest then
					table.sort(list, function(x, y)
						return x.playing < y.playing
					end)
					return list[1]
				end
				return list[math.random(#list)]
			end

			local function hop(smallest, setStatus)
				setStatus("searching...")
				local server = findServer(smallest)
				if not server then
					setStatus("no servers found")
					notify("Server", "no free servers found")
					return
				end
				setStatus(("joining %d/%d..."):format(server.playing, server.maxPlayers))
				notify("Server", ("teleporting · %d/%d players"):format(server.playing, server.maxPlayers))
				TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, player)
			end

			actionCard("Rejoin", "same server again", function(setStatus)
				setStatus("rejoining...")
				notify("Server", "rejoining")
				if #Players:GetPlayers() <= 1 then
					TeleportService:Teleport(game.PlaceId, player)
				else
					TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
				end
			end)
			actionCard("Server Hop", "random other server", function(setStatus)
				hop(false, setStatus)
			end)
			actionCard("Small Server", "fewest players", function(setStatus)
				hop(true, setStatus)
			end)
			connect(TeleportService.TeleportInitFailed, function(p, _, msg)
				if p == player then
					busy = false
					notify("Teleport failed", tostring(msg):sub(1, 60))
				end
			end)
			layoutY += 74
			local afkCard = card(page, { Class = "TextButton", Position = UDim2.fromOffset(2, layoutY), Size = UDim2.new(1, -12, 0, 44) })
			afkCard.Text = ""
			afkCard.AutoButtonColor = false
			create("TextLabel", {
				Text = "Anti AFK",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = textColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(12, 7),
				Size = UDim2.new(1, -80, 0, 16),
				Parent = afkCard,
			})
			create("TextLabel", {
				Text = "no kick for idling 20 minutes",
				Font = Enum.Font.Gotham,
				TextSize = 10,
				TextColor3 = mutedColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(12, 23),
				Size = UDim2.new(1, -80, 0, 13),
				Parent = afkCard,
			})
			local track = create("Frame", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -12, 0.5, 0),
				Size = UDim2.fromOffset(34, 18),
				BackgroundColor3 = bgColor,
				Parent = afkCard,
			})
			makeRound(track)
			local trackStroke = addStroke(track)
			local knob = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0, 9, 0.5, 0),
				Size = UDim2.fromOffset(12, 12),
				BackgroundColor3 = dimColor,
				ZIndex = 2,
				Parent = track,
			})
			makeRound(knob)
			local antiAfkOn, idleConn = false, nil

			local function setAntiAfk(on)
				antiAfkOn = on
				if idleConn then
					idleConn:Disconnect()
				end
				idleConn = nil
				if on then
					local VirtualUser = game:GetService("VirtualUser")
					idleConn = connect(player.Idled, function()
						VirtualUser:CaptureController()
						VirtualUser:ClickButton2(Vector2.new())
					end)
				end
				knob.Size = UDim2.fromOffset(18, 12)
				tween(knob, 0.35, {
					Position = UDim2.new(0, on and 25 or 9, 0.5, 0),
					Size = UDim2.fromOffset(12, 12),
					BackgroundColor3 = on and bgColor or dimColor,
				}, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				tween(track, 0.25, { BackgroundColor3 = on and accentColor or bgColor })
				tween(trackStroke, 0.25, { Color = on and accentColor or strokeColor })
				setConfig("Server/Utilities/Anti AFK", on)
			end

			connect(afkCard.MouseButton1Click, function()
				setAntiAfk(not antiAfkOn)
			end)
			register("Server/Utilities/Anti AFK", function(v)
				if type(v) == "boolean" then
					setAntiAfk(v)
				end
			end, function()
				return antiAfkOn
			end, false)
			page.CanvasSize = UDim2.fromOffset(0, layoutY + 44 + 12)

			local function formatUptime(sec)
				sec = math.floor(sec)
				local h, m, secs = sec // 3600, sec // 60 % 60, sec % 60
				if h > 0 then
					return ("%d<font color=\"#787878\">h</font> %02d<font color=\"#787878\">m</font>"):format(h, m)
				end
				return ("%d<font color=\"#787878\">m</font> %02d<font color=\"#787878\">s</font>"):format(m, secs)
			end

			local function withUnit(n, entry)
				return ("%s <font color=\"#787878\" size=\"12\">%s</font>"):format(n, entry)
			end

			local frameCount2, at, lastCardGradient = 0, os.clock(), 0
			local serverStart = os.clock()
			connect(RunService.RenderStepped, function()
				frameCount2 += 1
				local now = os.clock()
				if page.Visible and main.Visible and now - lastCardGradient >= 1 / 30 then
					lastCardGradient = now
					local t = (now - serverStart) * 0.35
					local seq = shimmerSeq(t)
					for i, g in ipairs(cardGradients) do
						g.Color = seq
						g.Rotation = (t * 90 + i * 40) % 360
					end
				end
				if now - at < 0.5 then
					return
				end
				local fps = math.floor(frameCount2 / (now - at) + 0.5)
				frameCount2, at = 0, now
				if not page.Visible or not main.Visible then
					return
				end
				local n, max = #Players:GetPlayers(), Players.MaxPlayers
				uptimeStat.Text = formatUptime(time())
				playersStat.Text = withUnit(n, "/ " .. max)
				tween(fill, 0.4, { Size = UDim2.fromScale(math.clamp(n / math.max(max, 1), 0, 1), 1) })
				pingStat.Text = withUnit(math.floor(getPing() + 0.5), "ms")
				fpsStat.Text = tostring(fps)
				subtitle.Text = gameName .. "  ·  " .. n .. " players"
			end)
		end
		do
			local iface = addSection(settingsTab, "Interface")
			iface:Keybind("Menu key", "click and press any key", function()
				return toggleKey
			end, function(k)
				toggleKey = k
			end)
			iface:Slider("Background blur", 0, 40, blurSize, function(v)
				blurSize = v
				if menuOpen then
					blur.Size = v
				end
			end)
			local wmToggle
			wmToggle = iface:Toggle("Watermark", "fps, ping, time - click it to open the menu", function(on)
				if not on and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
					notify("Watermark", "needed to open the menu on mobile")
					task.defer(wmToggle.Set, true)
					return
				end
				hud.setWatermark(on)
			end)
			wmToggle.Set(true)
			local mascot2 = addSection(settingsTab, "Mascot")
			local mascotToggle = mascot2:Toggle("CoolRock", "show the animated mascot above the menu", function(on)
				mascot.set(on and "CoolRock" or "Off")
			end)
			mascotToggle.Set(mascot.name ~= "Off", true)
			local configsSec = addSection(settingsTab, "Configs")
			local configName = configsSec:Input("Name", "up to 32 characters", "enter config name")

			local function profileNames()
				local names = {}
				for name, data in pairs(profiles) do
					if type(name) == "string" and type(data) == "table" then
						table.insert(names, name)
					end
				end
				table.sort(names, function(a, b)
					return a:lower() < b:lower()
				end)
				return names
			end
			local profileDropdown = configsSec:Dropdown("Saved configs", "choose a config", profileNames(), "select...", function(name)
				configName.Set(name)
			end)

			local function refreshProfileList()
				profileDropdown.Update(profileNames())
			end

			local function enteredProfileName()
				local name, err = normalizeProfileName(configName.Get())
				if not name then
					notify("Config", err)
					configName.Focus()
				end
				return name
			end

			configsSec:Button("Create", "save current settings as a new config", function()
				local name = enteredProfileName()
				if not name then
					return
				end
				if profiles[name] then
					notify("Config", "that name already exists")
					return
				end
				profiles[name] = snapshotConfig()
				local ok, err = saveProfiles()
				if not ok then
					profiles[name] = nil
					notify("Config", "create failed: " .. tostring(err))
					return
				end
				configName.Set(name)
				refreshProfileList()
				profileDropdown.Set(name, true)
				notify("Config", 'created "' .. name .. '"')
			end)
			configsSec:Button("Save", "overwrite the named config with current settings", function()
				local name = enteredProfileName()
				if not name then
					return
				end
				if not profiles[name] then
					notify("Config", "config not found - create it first")
					return
				end
				local previous = profiles[name]
				profiles[name] = snapshotConfig()
				local ok, err = saveProfiles()
				if not ok then
					profiles[name] = previous
					notify("Config", "save failed: " .. tostring(err))
					return
				end
				notify("Config", 'saved "' .. name .. '"')
			end)
			configsSec:Button("Load", "apply every setting from the named config", function()
				local name = enteredProfileName()
				if not name then
					return
				end
				local profile = profiles[name]
				if type(profile) ~= "table" then
					notify("Config", "config not found")
					return
				end
				applyConfig(profile)
				configName.Set(name)
				profileDropdown.Set(name, true)
				notify("Config", 'loaded "' .. name .. '"')
			end)
			configsSec:Button("Delete", "permanently remove the named config", function()
				local name = enteredProfileName()
				if not name then
					return
				end
				local previous = profiles[name]
				if type(previous) ~= "table" then
					notify("Config", "config not found")
					return
				end
				profiles[name] = nil
				local ok, err = saveProfiles()
				if not ok then
					profiles[name] = previous
					notify("Config", "delete failed: " .. tostring(err))
					return
				end
				configName.Set("")
				refreshProfileList()
				notify("Config", 'deleted "' .. name .. '"')
			end)
			refreshProfileList()
			local scriptSec = addSection(settingsTab, "Script")
			scriptSec:Button("Reset config", "restore defaults for the active settings", function()
				applyConfig({})
				notify("Config", "active settings reset")
			end)
			scriptSec:Button("Unload", "remove the menu and reset all", function()
				_G.RockHubUnload()
			end)
		end
		do
			local terrain = workspace.Terrain
			local presets2 = {
				Natural = {
					exposure = 2,
					contrast = 12,
					saturation = 10,
					warmth = 6,
					bloom = 30,
					rays = 15,
					shadows = 25,
					dof = 12,
					fog = 25,
					vignette = 25,
					time = 28,
					timeMode = "Game",
				},
				["Golden Hour"] = {
					exposure = 3,
					contrast = 16,
					saturation = 20,
					warmth = 38,
					bloom = 55,
					rays = 45,
					shadows = 40,
					dof = 20,
					fog = 40,
					vignette = 35,
					time = 35,
					timeMode = "Custom",
				},
				Cinematic = {
					exposure = 0,
					contrast = 28,
					saturation = -8,
					warmth = -8,
					bloom = 40,
					rays = 12,
					shadows = 45,
					dof = 45,
					fog = 35,
					vignette = 55,
					time = 30,
					timeMode = "Game",
				},
				Moody = {
					exposure = -3,
					contrast = 32,
					saturation = -30,
					warmth = -14,
					bloom = 25,
					rays = 6,
					shadows = 60,
					dof = 30,
					fog = 65,
					vignette = 60,
					time = 16,
					timeMode = "Custom",
				},
				Night = {
					exposure = 6,
					contrast = 22,
					saturation = -18,
					warmth = -32,
					bloom = 65,
					rays = 0,
					shadows = 50,
					dof = 20,
					fog = 45,
					vignette = 50,
					time = 0,
					timeMode = "Custom",
				},
			}
			local presetNames = { "Natural", "Golden Hour", "Cinematic", "Moody", "Night" }
			local st = { on = false, preset = "Natural", clouds = true }
			for k, v in pairs(presets2.Natural) do
				st[k] = v
			end
			local lightProps = { "Brightness", "ExposureCompensation", "GlobalShadows", "ShadowSoftness", "EnvironmentDiffuseScale", "EnvironmentSpecularScale", "Ambient", "OutdoorAmbient", "ClockTime" }
			local fx = {}
			local saved
			local clouds
			local vignetteGui = create("ScreenGui", {
				Name = "RockHubFX",
				IgnoreGuiInset = true,
				ResetOnSpawn = false,
				DisplayOrder = -1,
				Enabled = false,
				Parent = gui.Parent,
			})
			local vignetteGrads = {}
			for _, e in ipairs({
				{ Vector2.new(0, 0), UDim2.fromScale(0, 0), UDim2.fromScale(1, 0.4), 90 },
				{ Vector2.new(0, 1), UDim2.fromScale(0, 1), UDim2.fromScale(1, 0.4), -90 },
				{ Vector2.new(0, 0), UDim2.fromScale(0, 0), UDim2.fromScale(0.3, 1), 0 },
				{ Vector2.new(1, 0), UDim2.fromScale(1, 0), UDim2.fromScale(0.3, 1), 180 },
			}) do
				local f = create("Frame", {
					AnchorPoint = e[1],
					Position = e[2],
					Size = e[3],
					BackgroundColor3 = Color3.new(0, 0, 0),
					BorderSizePixel = 0,
					Parent = vignetteGui,
				})
				table.insert(vignetteGrads, create("UIGradient", { Rotation = e[4], Parent = f }))
			end

			local function updateVignette()
				local a = 1 - st.vignette / 100 * 0.75
				local seq = NumberSequence.new({
					NumberSequenceKeypoint.new(0, a),
					NumberSequenceKeypoint.new(0.45, 1 - (1 - a) * 0.3),
					NumberSequenceKeypoint.new(1, 1),
				})
				for _, g in ipairs(vignetteGrads) do
					g.Transparency = seq
				end
				vignetteGui.Enabled = st.on and st.vignette > 0
			end

			local function applyLighting()
				if not st.on then
					return
				end
				pcall(function()
					Lighting.GlobalShadows = true
					Lighting.ShadowSoftness = st.shadows / 100
					Lighting.ExposureCompensation = st.exposure / 10
					Lighting.EnvironmentDiffuseScale = 1
					Lighting.EnvironmentSpecularScale = 1
					Lighting.Brightness = 3
					Lighting.Ambient = Color3.fromRGB(38, 40, 46)
					Lighting.OutdoorAmbient = Color3.fromRGB(118, 120, 130)
					if st.timeMode == "Custom" then
						Lighting.ClockTime = st.time / 2
					end
				end)
			end

			local function updateClouds()
				local want = st.on and st.clouds
				if want and not clouds and not terrain:FindFirstChildOfClass("Clouds") then
					clouds = create("Clouds", { Cover = 0.55, Density = 0.7, Color = Color3.fromRGB(245, 245, 250), Parent = terrain })
				elseif not want and clouds then
					clouds:Destroy()
					clouds = nil
				end
			end

			local function apply()
				if not st.on or not fx.cc then
					return
				end
				local w = st.warmth / 50
				local tint = w >= 0 and Color3.new(1, 1 - 0.08 * w, 1 - 0.24 * w) or Color3.new(1 + 0.24 * w, 1 + 0.07 * w, 1)
				fx.cc.Brightness = 0.01
				fx.cc.Contrast = st.contrast / 100
				fx.cc.Saturation = st.saturation / 100
				fx.cc.TintColor = tint
				fx.bloom.Enabled = st.bloom > 0
				fx.bloom.Intensity = st.bloom / 100 * 1.4
				fx.bloom.Size = 18 + st.bloom * 0.34
				fx.bloom.Threshold = 1.35 - st.bloom / 100 * 0.5
				fx.rays.Enabled = st.rays > 0
				fx.rays.Intensity = st.rays / 100 * 0.35
				fx.rays.Spread = 0.6 + st.rays / 100 * 0.3
				fx.dof.Enabled = st.dof > 0
				fx.dof.FarIntensity = st.dof / 100 * 0.75
				fx.dof.NearIntensity = 0
				fx.dof.FocusDistance = 30
				fx.dof.InFocusRadius = 70 - st.dof * 0.4
				local f = st.fog / 100
				fx.atmo.Density = 0.15 + f * 0.5
				fx.atmo.Offset = 0.2
				fx.atmo.Haze = f * 3
				fx.atmo.Glare = st.rays / 100 * 2
				fx.atmo.Color = Color3.fromRGB(199, 209, 222):Lerp(Color3.fromRGB(255, 212, 168), math.max(w, 0))
				fx.atmo.Decay = Color3.fromRGB(106, 112, 125):Lerp(Color3.fromRGB(150, 96, 60), math.max(w, 0))
				applyLighting()
				updateVignette()
				updateClouds()
			end

			local function enable()
				saved = { light = {}, effects = {}, atmos = {}, timeTouched = st.timeMode == "Custom" }
				for _, p in ipairs(lightProps) do
					pcall(function()
						saved.light[p] = Lighting[p]
					end)
				end
				for _, inst in ipairs(Lighting:GetChildren()) do
					if inst:IsA("PostEffect") and inst ~= blur and inst.Enabled then
						inst.Enabled = false
						table.insert(saved.effects, inst)
					elseif inst:IsA("Atmosphere") then
						table.insert(saved.atmos, inst)
						inst.Parent = nil
					end
				end
				fx.cc = create("ColorCorrectionEffect", { Name = "RockHubRealisticColor", Parent = Lighting })
				fx.bloom = create("BloomEffect", { Name = "RockHubRealisticBloom", Parent = Lighting })
				fx.rays = create("SunRaysEffect", { Name = "RockHubRealisticRays", Parent = Lighting })
				fx.dof = create("DepthOfFieldEffect", { Name = "RockHubRealisticDOF", Parent = Lighting })
				fx.atmo = create("Atmosphere", { Name = "RockHubRealisticAtmosphere", Parent = Lighting })
				apply()
			end

			local function disable()
				for _, o in pairs(fx) do
					o:Destroy()
				end
				table.clear(fx)
				updateClouds()
				vignetteGui.Enabled = false
				if saved then
					for p, v in pairs(saved.light) do
						if p ~= "ClockTime" or saved.timeTouched then
							pcall(function()
								Lighting[p] = v
							end)
						end
					end
					for _, o in ipairs(saved.effects) do
						pcall(function()
							o.Enabled = true
						end)
					end
					for _, o in ipairs(saved.atmos) do
						pcall(function()
							o.Parent = Lighting
						end)
					end
					saved = nil
				end
			end

			local acc = 0
			connect(RunService.Heartbeat, function(dt)
				if not st.on then
					return
				end
				acc += dt
				if acc < 0.5 then
					return
				end
				acc = 0
				applyLighting()
			end)
			local sliders = {}
			local timeSeg

			local function setMode(m)
				st.timeMode = m
				if m == "Custom" then
					if saved then
						saved.timeTouched = true
					end
					applyLighting()
				elseif saved and saved.light.ClockTime then
					pcall(function()
						Lighting.ClockTime = saved.light.ClockTime
					end)
				end
			end

			local function applyPreset(name)
				local p = presets2[name]
				if not p then
					return
				end
				st.preset = name
				for k, v in pairs(p) do
					if k == "timeMode" then
						if timeSeg then
							timeSeg.Set(v, true)
						end
						setMode(v)
					else
						st[k] = v
						if sliders[k] then
							sliders[k].Set(v, true)
						end
					end
				end
				apply()
			end

			local function bindFx(key)
				return function(v)
					st[key] = v
					apply()
				end
			end

			local function fmtPct(v)
				return v .. "%"
			end

			local function fmtSigned(v)
				return (v > 0 and "+" or "") .. v .. "%"
			end

			local sec = addSection(visualsTab, "Realistic")
			sec:Toggle("Enable", "real lighting, bloom, fog and color grading", function(on)
				st.on = on
				if on then
					enable()
				else
					disable()
				end
				notify("Realistic: " .. (on and "On" or "Off"), on and "preset " .. st.preset or "lighting restored")
			end)
			sec:Select("Preset", "right click - previous", presetNames, st.preset, function(v)
				applyPreset(v)
				if st.on then
					notify("Realistic", "preset " .. v)
				end
			end)
			sec:Button("Reset", "back to the preset values", function()
				applyPreset(st.preset)
				notify("Realistic", st.preset .. " restored")
			end)
			local color = addSection(visualsTab, "Color"):Collapsible(true)
			sliders.exposure = color:Slider("Exposure", -20, 20, st.exposure, bindFx("exposure"), function(v)
				return string.format("%+.1f EV", v / 10)
			end)
			sliders.contrast = color:Slider("Contrast", -20, 50, st.contrast, bindFx("contrast"), fmtSigned)
			sliders.saturation = color:Slider("Saturation", -50, 50, st.saturation, bindFx("saturation"), fmtSigned)
			sliders.warmth = color:Slider("Warmth", -50, 50, st.warmth, bindFx("warmth"), function(v)
				if v == 0 then
					return "neutral"
				end
				return (v > 0 and "warm " or "cold ") .. math.abs(v)
			end)
			local light = addSection(visualsTab, "Light"):Collapsible(true)
			sliders.bloom = light:Slider("Bloom", 0, 100, st.bloom, bindFx("bloom"), fmtPct)
			sliders.rays = light:Slider("Sun rays", 0, 100, st.rays, bindFx("rays"), fmtPct)
			sliders.shadows = light:Slider("Soft shadows", 0, 100, st.shadows, bindFx("shadows"), fmtPct)
			sliders.dof = light:Slider("Depth of field", 0, 100, st.dof, bindFx("dof"), fmtPct)
			sliders.fog = light:Slider("Atmosphere", 0, 100, st.fog, bindFx("fog"), fmtPct)
			sliders.vignette = light:Slider("Vignette", 0, 100, st.vignette, bindFx("vignette"), fmtPct)
			local sky = addSection(visualsTab, "Sky"):Collapsible(true)
			timeSeg = sky:Segmented("Time", { "Game", "Custom" }, st.timeMode, setMode)
			sliders.time = sky:Slider("Time of day", 0, 47, st.time, function(v)
				st.time = v
				if st.timeMode ~= "Custom" then
					timeSeg.Set("Custom", true)
					setMode("Custom")
				end
				applyLighting()
			end, function(v)
				return string.format("%02d:%02d", math.floor(v / 2), v % 2 * 30)
			end)
			local cloudsToggle = sky:Toggle("Clouds", "soft volumetric clouds", function(on)
				st.clouds = on
				updateClouds()
			end)
			cloudsToggle.Set(true, true)

			stopShader = function()
				if st.on then
					st.on = false
					disable()
				end
				vignetteGui:Destroy()
			end
		end
		do
			local esp = {
				on = false,
				roles = true,
				dist = 1500,
				color = "White",
				chams = true,
				box = true,
				boxStyle = "Corners",
				name = true,
				distance = true,
				health = true,
				tracers = false,
				tracerFrom = "Bottom",
				fill = 30,
				text = 12,
				thick = 1,
			}
			local espGui = create("ScreenGui", {
				Name = "RockHubESP",
				IgnoreGuiInset = true,
				ResetOnSpawn = false,
				DisplayOrder = -2,
				Enabled = false,
				Parent = gui.Parent,
			})
			local chamsFolder = create("Folder", { Name = "Chams", Parent = espGui })
			local black = Color3.new(0, 0, 0)
			local red = Color3.fromRGB(255, 58, 58)
			local blue = Color3.fromRGB(64, 150, 255)
			local entries = {}

			local serverRoles = {}
			local alive = true
			task.spawn(function()
				local remote
				while alive do
					if esp.on and esp.roles then
						if not remote or not remote.Parent then
							remote = game:GetService("ReplicatedStorage"):FindFirstChild("GetPlayerData", true)
						end
						if remote and remote:IsA("RemoteFunction") then
							local ok, data = pcall(remote.InvokeServer, remote)
							if ok and type(data) == "table" then
								local newRoles = {}
								for name, d in pairs(data) do
									if type(d) == "table" and type(d.Role) == "string" and not d.Dead and not d.Killed then
										newRoles[name] = d.Role
									end
								end
								serverRoles = newRoles
							end
						end
					end
					task.wait(1)
				end
			end)

			local function getRole(plr)
				if findTool(plr, "Knife") then
					return "Murderer"
				end
				if findTool(plr, "Gun") then
					return "Sheriff"
				end
				local r = serverRoles[plr.Name]
				if r == "Murderer" then
					return "Murderer"
				end
				if r == "Sheriff" or r == "Hero" then
					return "Sheriff"
				end
			end

			local function newLine(parent)
				local f = create("Frame", { BackgroundColor3 = accentColor, BorderSizePixel = 0, Parent = parent })
				create("UIStroke", { Color = black, Transparency = 0.5, Thickness = 1, Parent = f })
				return f
			end

			local function label(parent, ay)
				return create("TextLabel", {
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextColor3 = accentColor,
					TextStrokeColor3 = black,
					TextStrokeTransparency = 0.45,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, ay),
					Size = UDim2.fromOffset(220, 14),
					Parent = parent,
				})
			end

			local function add(plr)
				if plr == player or entries[plr] then
					return
				end
				local e = { plr = plr, alpha = 0, hp = 1, hue = math.random() }
				e.root = create("Frame", { BackgroundTransparency = 1, Size = UDim2.fromOffset(0, 0), Visible = false, Parent = espGui })
				e.fill = create("Frame", { BackgroundColor3 = accentColor, BorderSizePixel = 0, Parent = e.root })
				e.fillGrad = create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0.82), Parent = e.fill })
				e.corners = {}
				for i = 1, 8 do
					e.corners[i] = newLine(e.root)
				end
				e.full = create("Frame", { BackgroundTransparency = 1, Parent = e.root })
				e.fullStroke = create("UIStroke", { Color = accentColor, Thickness = 1, Parent = e.full })
				e.fullShadow = create("Frame", { BackgroundTransparency = 1, Parent = e.root })
				create("UIStroke", { Color = black, Transparency = 0.5, Thickness = 3, Parent = e.fullShadow })
				e.name = label(e.root, 1)
				e.info = label(e.root, 0)
				e.info.Font = Enum.Font.GothamMedium
				e.hpBg = create("Frame", { BackgroundColor3 = black, BackgroundTransparency = 0.35, BorderSizePixel = 0, Parent = e.root })
				e.hpFill = create("Frame", {
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 1, 1, -1),
					BackgroundColor3 = accentColor,
					BorderSizePixel = 0,
					Parent = e.hpBg,
				})
				e.tracer = newLine(e.root)
				e.tracer.AnchorPoint = Vector2.new(0.5, 0.5)
				e.hl = create("Highlight", { DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, Enabled = false, Parent = chamsFolder })
				entries[plr] = e
			end

			local function remove(plr)
				local e = entries[plr]
				if not e then
					return
				end
				e.root:Destroy()
				e.hl:Destroy()
				entries[plr] = nil
			end

			for _, plr in ipairs(Players:GetPlayers()) do
				add(plr)
			end
			connect(Players.PlayerAdded, add)
			connect(Players.PlayerRemoving, remove)

			local function hpColor(r)
				return Color3.fromHSV(0.33 * math.clamp(r, 0, 1), 0.8, 1)
			end

			local function placeLine(f, x1, y1, x2, y2, th)
				local dx, dy = x2 - x1, y2 - y1
				f.Position = UDim2.fromOffset((x1 + x2) / 2, (y1 + y2) / 2)
				f.Size = UDim2.fromOffset(math.sqrt(dx * dx + dy * dy), th)
				f.Rotation = math.deg(math.atan2(dy, dx))
			end

			local function hideAll()
				for _, e in pairs(entries) do
					e.alpha = 0
					e.root.Visible = false
					e.hl.Enabled = false
				end
			end

			connect(RunService.RenderStepped, function(dt)
				if not esp.on then
					return
				end
				local cam = workspace.CurrentCamera
				if not cam then
					return
				end
				local viewport = cam.ViewportSize
				local camPos = cam.CFrame.Position
				local now = os.clock()
				local k = math.min(dt * 10, 1)
				for plr, e in pairs(entries) do
					local char = plr.Character
					local hrp = char and char:FindFirstChild("HumanoidRootPart")
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					local render = false
					local dist = 0
					if hrp and hum and hum.Health > 0 then
						dist = (camPos - hrp.Position).Magnitude
						if dist <= esp.dist then
							local topBar2 = cam:WorldToViewportPoint(hrp.Position + Vector3.new(0, 3, 0))
							local bottom = cam:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3.4, 0))
							if topBar2.Z > 0 and bottom.Z > 0 then
								local h = math.max(bottom.Y - topBar2.Y, 6)
								local w = h * 0.6
								local relX = (topBar2.X + bottom.X) / 2
								render = relX > -w and relX < viewport.X + w and bottom.Y > 0 and topBar2.Y < viewport.Y
								if render then
									e.x, e.y, e.w, e.h, e.d = relX, topBar2.Y, w, h, dist
								end
							end
						end
					end
					e.alpha += ((render and 1 or 0) - e.alpha) * k
					if e.alpha < 0.02 or not e.x then
						e.root.Visible = false
						e.hl.Enabled = false
						continue
					end
					e.root.Visible = true
					local a = e.alpha
					local fade = 1 - a
					local hpFrac = hum and hum.MaxHealth > 0 and hum.Health / hum.MaxHealth or 0
					e.hp += (hpFrac - e.hp) * math.min(dt * 8, 1)
					if not e.roleAt or now - e.roleAt > 0.25 then
						e.roleAt = now
						local role = esp.roles and getRole(plr) or nil
						if role and role ~= e.role then
							notify(role == "Murderer" and "Murderer found" or "Sheriff found", plr.DisplayName)
						end
						e.role = role
					end
					local col = accentColor
					if e.role == "Murderer" then
						col = red
					elseif e.role == "Sheriff" then
						col = blue
					elseif esp.color == "Health" then
						col = hpColor(e.hp)
					elseif esp.color == "Rainbow" then
						col = Color3.fromHSV((now * 0.15 + e.hue) % 1, 0.55, 1)
					end
					local x0, y0 = e.x - e.w / 2, e.y
					local x1, y1 = e.x + e.w / 2, e.y + e.h
					local th = esp.thick
					e.fill.Visible = esp.box
					e.fill.Position = UDim2.fromOffset(x0, y0)
					e.fill.Size = UDim2.fromOffset(e.w, e.h)
					e.fill.BackgroundColor3 = col
					e.fill.BackgroundTransparency = fade
					local corners = esp.box and esp.boxStyle == "Corners"
					local cw, ch = math.max(e.w * 0.28, 4), math.max(e.h * 0.2, 4)
					local rects = {
						{ x0, y0, cw, th },
						{ x0, y0, th, ch },
						{ x1 - cw, y0, cw, th },
						{ x1 - th, y0, th, ch },
						{ x0, y1 - th, cw, th },
						{ x0, y1 - ch, th, ch },
						{ x1 - cw, y1 - th, cw, th },
						{ x1 - th, y1 - ch, th, ch },
					}
					for i, c in ipairs(e.corners) do
						c.Visible = corners
						if corners then
							local q = rects[i]
							c.Position = UDim2.fromOffset(q[1], q[2])
							c.Size = UDim2.fromOffset(q[3], q[4])
							c.BackgroundColor3 = col
							c.BackgroundTransparency = fade
						end
					end
					local full = esp.box and esp.boxStyle == "Full"
					e.full.Visible = full
					e.fullShadow.Visible = full
					if full then
						e.full.Position = UDim2.fromOffset(x0, y0)
						e.full.Size = UDim2.fromOffset(e.w, e.h)
						e.fullShadow.Position = e.full.Position
						e.fullShadow.Size = e.full.Size
						e.fullStroke.Color = col
						e.fullStroke.Thickness = th
						e.fullStroke.Transparency = fade
					end
					e.name.Visible = esp.name
					if esp.name then
						e.name.Text = plr.DisplayName
						e.name.TextSize = esp.text
						e.name.Position = UDim2.fromOffset(e.x, y0 - 3)
						e.name.TextColor3 = col
						e.name.TextTransparency = fade
						e.name.TextStrokeTransparency = 0.45 + 0.55 * fade
					end
					e.info.Visible = esp.distance
					if esp.distance then
						local m = math.floor(e.d + 0.5) .. "m"
						e.info.Text = e.role and string.upper(e.role) .. "  ·  " .. m or m
						e.info.TextSize = esp.text - 1
						e.info.Position = UDim2.fromOffset(e.x, y1 + 3)
						e.info.TextColor3 = e.role and col or dimColor:Lerp(accentColor, 0.5)
						e.info.TextTransparency = fade
						e.info.TextStrokeTransparency = 0.45 + 0.55 * fade
					end
					e.hpBg.Visible = esp.health
					if esp.health then
						e.hpBg.Position = UDim2.fromOffset(x0 - 6, y0 - 1)
						e.hpBg.Size = UDim2.fromOffset(4, e.h + 2)
						e.hpBg.BackgroundTransparency = 0.35 + 0.65 * fade
						e.hpFill.Size = UDim2.new(0, 2, math.clamp(e.hp, 0, 1), -2)
						e.hpFill.BackgroundColor3 = hpColor(e.hp)
						e.hpFill.BackgroundTransparency = fade
					end
					e.tracer.Visible = esp.tracers
					if esp.tracers then
						local py = esp.tracerFrom == "Center" and viewport.Y / 2 or viewport.Y - 2
						placeLine(e.tracer, viewport.X / 2, py, e.x, y1, th)
						e.tracer.BackgroundColor3 = col
						e.tracer.BackgroundTransparency = 0.25 + 0.75 * fade
					end
					e.hl.Enabled = esp.chams
					if esp.chams then
						e.hl.Adornee = char
						e.hl.FillColor = col
						e.hl.OutlineColor = col
						e.hl.FillTransparency = 1 - esp.fill / 100 * 0.85 * a
						e.hl.OutlineTransparency = 1 - 0.9 * a
					end
				end
			end)

			local function setter(key)
				return function(v)
					esp[key] = v
				end
			end

			local sec = addSection(visualsTab, "ESP", "ESP")
			sec:Toggle("Enable", "see players through walls", function(on)
				esp.on = on
				espGui.Enabled = on
				if not on then
					hideAll()
				end
				notify("ESP: " .. (on and "On" or "Off"), on and "players highlighted" or "esp hidden")
			end)
			sec:Toggle("Roles", "murderer red, sheriff blue", function(v)
				esp.roles = v
				for _, e in pairs(entries) do
					e.roleAt = nil
				end
			end).Set(esp.roles, true)
			sec:Select("Color", "for everyone else", { "White", "Health", "Rainbow" }, esp.color, setter("color"))
			sec:Slider("Max distance", 50, 3000, esp.dist, setter("dist"), function(v)
				return v .. "m"
			end)
			local parts = addSection(visualsTab, "Elements", "ESP"):Collapsible(true)
			parts:Toggle("Chams", "glowing body through walls", setter("chams")).Set(esp.chams, true)
			parts:Toggle("Box", nil, setter("box")).Set(esp.box, true)
			parts:Segmented("Box style", { "Corners", "Full" }, esp.boxStyle, setter("boxStyle"))
			parts:Toggle("Name", nil, setter("name")).Set(esp.name, true)
			parts:Toggle("Distance", nil, setter("distance")).Set(esp.distance, true)
			parts:Toggle("Health bar", nil, setter("health")).Set(esp.health, true)
			parts:Toggle("Tracers", "lines to players", setter("tracers"))
			parts:Segmented("Tracers from", { "Bottom", "Center" }, esp.tracerFrom, setter("tracerFrom"))
			local look = addSection(visualsTab, "Look", "ESP"):Collapsible(false)
			look:Slider("Chams fill", 0, 100, esp.fill, setter("fill"), function(v)
				return v .. "%"
			end)
			look:Slider("Text size", 9, 18, esp.text, setter("text"))
			look:Slider("Thickness", 1, 3, esp.thick, setter("thick"), function(v)
				return v .. "px"
			end)

			stopEsp = function()
				esp.on = false
				alive = false
				espGui:Destroy()
			end
		end
		do
			local animPacks = {
				{
					"New (2024-2025)",
					{
						{ "Bold", 16738333868, 16738334710, 16738340646, 16738337225, 16738336650, 16738333171, 16738332169, 16738339158, 16738339817 },
						{ "Realistic", 17172918855, 17173014241, 11600249883, 11600211410, 11600210487, 11600206437, 11600205519, 11600212676, 11600213505 },
						{ "No Boundaries", 18747067405, 18747063918, 18747074203, 18747070484, 18747069148, 18747062535, 18747060903, 18747073181, 18747071682 },
						{ "NFL", 92080889861410, 74451233229259, 110358958299415, 117333533048078, 119846112151352, 129773241321032, 134630013742019, 132697394189921, 79090109939093 },
						{ "Adidas Aura", 110211186840347, 114191137265065, 83842218823011, 118320322718866, 109996626521204, 95603166884636, 97824616490448, 134530128383903, 94922130551805 },
						{ "Adidas Sports", 18537376492, 18537371272, 18537392113, 18537384940, 18537380791, 18537367238, 18537363391, 18537389531, 18537387180 },
						{ "Adidas Community", 122257458498464, 102357151005774, 122150855457006, 82598234841035, 75290611992385, 98600215928904, 88763136693023, 133308483266208, 109346520324160 },
						{ "Wicked Popular", 118832222982049, 76049494037641, 92072849924640, 72301599441680, 104325245285198, 121152442762481, 131326830509784, 99384245425157, 113199415118199 },
						{ "Catwalk Glam", 133806214992291, 94970088341563, 109168724482748, 81024476153754, 116936326516985, 92294537340807, 119377220967554, 134591743181628, 98854111361360 },
						{ "Wicked Dance", 92849173543269, 132238900951109, 73718308412641, 135515454877967, 78508480717326, 78147885297412, 129447497744818, 110657013921774, 129183123083281 },
						{ "Unboxed", 98281136301627, 138183121662404, 90478085024465, 134824450619865, 121454505477205, 94788218468396, 121145883950231, 105962919001086, 129126268464847 },
					},
				},
				{
					"Classic",
					{
						{ "Stylish", 616136790, 616138447, 616146177, 616140816, 616139451, 616134815, 616133594, 616143378, 616144772 },
						{ "Zombie", 616158929, 616160636, 616168032, 616163682, 616161997, 616157476, 616156119, 616165109, 616166655 },
						{ "Robot", 616088211, 616089559, 616095330, 616091570, 616090535, 616087089, 616086039, 616092998, 616094091 },
						{ "Toy", 782841498, 782845736, 782843345, 782842708, 782847020, 782846423, 782843869, 782844582, 782845186 },
						{ "Cartoony", 742637544, 742638445, 742640026, 742638842, 742637942, 742637151, 742636889, 742639220, 742639812 },
						{ "Superhero", 616111295, 616113536, 616122287, 616117076, 616115533, 616108001, 616104706, 616119360, 616120861 },
						{ "Mage", 707742142, 707855907, 707897309, 707861613, 707853694, 707829716, 707826056, 707876443, 707894699 },
						{ "Levitation", 616006778, 616008087, 616013216, 616010382, 616008936, 616005863, 616003713, 616011509, 616012453 },
						{ "Vampire", 1083445855, 1083450166, 1083473930, 1083462077, 1083455352, 1083443587, 1083439238, 1083464683, 1083467779 },
						{ "Elder", 845397899, 845400520, 845403856, 845386501, 845398858, 845396048, 845392038, 845401742, 845403127 },
						{ "Werewolf", 1083195517, 1083214717, 1083178339, 1083216690, 1083218792, 1083189019, 1083182000, 1083222527, 1083225406 },
						{ "Knight", 657595757, 657568135, 657552124, 657564596, 658409194, 657600338, 658360781, 657560551, 657557095 },
						{ "Astronaut", 891621366, 891633237, 891667138, 891636393, 891627522, 891617961, 891609353, 891639666, 891663592 },
						{ "Bubbly", 910004836, 910009958, 910034870, 910025107, 910016857, 910001910, 909997997, 910028158, 910030921 },
						{ "Pirate", 750781874, 750782770, 750785693, 750783738, 750782230, 750780242, 750779899, 750784579, 750785176 },
						{ "Rthro", 2510196951, 2510197257, 2510202577, 2510198475, 2510197830, 2510195892, 2510192778, 2510199791, 2510201162 },
						{ "Ninja", 656117400, 656118341, 656121766, 656118852, 656117878, 656115606, 656114359, 656119721, 656121397 },
						{ "Oldschool", 5319828216, 5319831086, 5319847204, 5319844329, 5319841935, 5319839762, 5319816685, 5319850266, 5319852613 },
						{ "Princess", 941003647, 941013098, 941028902, 941015281, 941008832, 941000007, 940996062, 941018893, 941025398 },
						{ "Confident", 1069977950, 1069987858, 1070017263, 1070001516, 1069984524, 1069973677, 1069946257, 1070009914, 1070012133 },
						{ "Popstar", 1212900985, 1150842221, 1212980338, 1212980348, 1212954642, 1212900995, 1213044953, 1212852603, 1070012133 },
						{ "Patrol", 1149612882, 1150842221, 1151231493, 1150967949, 1150944216, 1148863382, 1148811837, 1151204998, 1151221899 },
						{ "Sneaky", 1132473842, 1132477671, 1132510133, 1132494274, 1132489853, 1132469004, 1132461372, 1132500520, 1132506407 },
						{ "Cowboy", 1014390418, 1014398616, 1014421541, 1014401683, 1014394726, 1014384571, 1014380606, 1014406523, 1014411816 },
						{ "Stylized Female", 4708191566, 4708192150, 4708193840, 4708192705, 4708188025, 4708186162, 4708184253, 4708189360, 4708190607 },
						{ "Default R15", 4211217646, 4211218409, 4211223236, 4211220381, 4211219390, 4211216152, 4211214992, 4211221314, 4374694239 },
						{ "Mocap", 913367814, 913373430, 913402848, 913376220, 913370268, 913365531, 913362637, 913384386, 913389285 },
					},
				},
				{
					"Special",
					{
						{ "Ghost", 616006778, 616008087, 616013216, 616013216, 616008936, 616005863, 0, 616011509, 616012453 },
						{ "Mech", 4417977954, 4417978624, 2510202577, 4417979645, 2510197830, 2510195892, 2510192778, 2510199791, 2510201162 },
						{ "Udzal", 3303162274, 3303162549, 3303162967, 3236836670, 2510197830, 2510195892, 2510192778, 2510199791, 2510201162 },
						{ "Oinan Thickhoof", 657595757, 657568135, 2510202577, 3236836670, 2510197830, 2510195892, 2510192778, 2510199791, 2510201162 },
						{ "Borock", 3293641938, 3293642554, 2510202577, 3236836670, 2510197830, 2510195892, 2510192778, 2510199791, 2510201162 },
					},
				},
			}
			local bundles = {
				{ 356, "Rthro Animation Package", 2510235063, 2510242378, 2510238627, 2510236649, 2510233257, 2510230574, 2510240941 },
				{ 667, "Oldschool Animation Pack", 5319922112, 5319909330, 5319900634, 5319917561, 5319914476, 5319931619, 5319927054 },
				{ 83, "Stylish Animation Pack", 619511648, 619512767, 619512153, 619511974, 619511417, 619509955, 619512450 },
				{ 82, "Robot Animation Pack", 619521748, 619522849, 619522386, 619522088, 619521521, 619521311, 619522642 },
				{ 43, "Toy Animation Pack", 973771666, 973767371, 973766674, 973770652, 973768058, 973773170, 973772659 },
				{ 2623795, "adidas Community Animation Pack", 126354114956642, 106810508343012, 124765145869332, 115715495289805, 93993406355955, 123695349157584, 106537993816942 },
				{ 80, "Zombie Animation Pack", 619535834, 619537468, 619536621, 619536283, 619535616, 619535091, 619537096 },
				{ 63, "Mage Animation Package", 754637456, 754636298, 754635032, 754637084, 754636589, 754639239, 754638471 },
				{ 56, "Cartoony Animation Package", 837011741, 837010234, 837009922, 837011171, 837010685, 837013990, 837012509 },
				{ 39, "Bubbly Animation Package", 1018553897, 1018549681, 1018548665, 1018553240, 1018552770, 1018554668, 1018554245 },
				{ 75, "Ninja Animation Package", 658832408, 658831143, 658830056, 658832070, 658831500, 658833139, 658832807 },
				{ 1189398, "Wicked Popular Animation Pack", 101839542383818, 133304526526319, 136276875045281, 130373407996664, 83937116921114, 135810009801094, 128475661806875 },
				{ 427999, "adidas Sports Animation Pack", 18538150608, 18538146480, 18538133604, 18538153691, 18538164337, 18538170170, 18538158932 },
				{ 81, "Superhero Animation Pack", 619528125, 619529601, 619528716, 619528412, 619527817, 619527470, 619529095 },
				{ 48, "Elder Animation Package", 892268340, 892267099, 892265784, 892267917, 892267521, 892269341, 892268710 },
				{ 4294795, "adidas aura animation pack", 73137983344853, 75183215343859, 123973978164540, 129527230938281, 99457463463495, 140398319728398, 119007025452432 },
				{ 33, "Vampire Animation Pack", 1113742618, 1113741192, 1113740510, 1113742359, 1113742092, 1113743239, 1113742944 },
				{ 79, "Levitation Animation Pack", 619542203, 619544080, 619543231, 619542888, 619541867, 619541458, 619543721 },
				{ 32, "Werewolf Animation Pack", 1113752682, 1113751657, 1113750642, 1113752285, 1113751889, 1113754738, 1113752975 },
				{ 34, "Astronaut Animation Pack", 1090133099, 1090131576, 1090130630, 1090132507, 1090132063, 1090134016, 1090133583 },
				{ 455003, "No Boundaries Animation Pack by Walmart", 18755930927, 18755942776, 18755933883, 18755925411, 18755922352, 18755919175, 18755938274 },
				{ 4164795, "Amazon Unboxed Animation Pack", 82219139681769, 128339543796138, 114998633936467, 110418911914024, 125108870423182, 117011755848398, 137392271797713 },
				{ 68, "Knight Animation Package", 734327140, 734326330, 734325948, 734326930, 734326679, 734329002, 734327363 },
				{ 55, "Pirate Animation Package", 837024662, 837023892, 837023444, 837024350, 837024147, 837025325, 837025054 },
				{ 122746952391276, "Cute Kawaii", 87378581612013, 134893286312907, 114496981964667, 78753669029804, 78668034869322, 114544880037945, 77472834006636 },
				{ 151819968930057, "Victoria Model", 103718214826066, 116254697237169, 123079125703048, 91133124065771, 74672131231886, 72034200995655, 121980654863805 },
				{ 115540548213210, "Jolly Animation Pack", 121468276202179, 83096586914276, 71971990553119, 86777047181866, 83063007119941, 73563861115457, 71637541197973 },
				{ 5134295, "Billie Eilish Animation Pack", 82009039247070, 74056522836252, 107895705891639, 114806832298003, 132771121298158, 95937554524959, 78340083978503 },
				{ 4899847411546, "Endless Aura Floating Pack", 75638427965557, 131290152729043, 77610456891399, 74451563346167, 74203422263286, 116293937663140, 110044773049875 },
				{ 4974195, "KATSEYE Animation Pack", 125286451593779, 105967194765350, 140179859838109, 121868657321572, 84737112249504, 130399277423748, 87465102258861 },
				{ 4128695, "Wicked \"Dancing Through Life\" Animation Pack", 82682578794949, 94133616443608, 79789194522561, 111157411630082, 124742764102674, 123509187015792, 135050138303161 },
				{ 44134738352110, "Bicyclist / Bike", 110301614683999, 78201729008814, 82563400820481, 107759406184171, 116348378285841, 106713991255001, 77327275394482 },
				{ 13847677942977, "Annoying Mini Me Animation Pack", 118862283492023, 123499402060535, 108064018869475, 77719056586289, 81914368217933, 122736580472463, 133063333973854 },
				{ 246417977128963, "Doll 3.0", 109401010312897, 73488864835464, 90126309265051, 118036998124357, 99977942446739, 86104031977265, 133772806040245 },
				{ 81397985471047, "Cute Bouncy", 112758171987743, 105398643971664, 81980688988481, 95845383984913, 91206221270256, 77455242814172, 137674505873151 },
				{ 110693219046747, "Cute", 73073438542366, 87016985886252, 103569388072604, 126765807132662, 74500938515101, 130431162972600, 112736233576006 },
				{ 57393899235237, "👼 Angel (Floating)", 138791542100078, 98178584535094, 120880326870608, 140709061221147, 98791635084597, 132683235998205, 133193009842625 },
				{ 226926215014942, "It-Girl Essential Model Anim Bundle", 120992094851618, 90277175857099, 111476936032056, 112646876784472, 125665759397426, 129595215811160, 114352975745413 },
				{ 202303684183778, "Zombie Animation V1", 99683684875874, 93573919758577, 118223426835901, 117775165215292, 126356736613041, 73917242953119, 75615514809696 },
				{ 83150063434113, "Cute Sit", 110542674051174, 118167050072619, 113254670339077, 124327113511763, 99664258493491, 125102831404256, 112149520105094 },
				{ 202937663223114, "Cute Joy", 106422977106635, 84929464233480, 136095340410517, 91003269917350, 99857206072384, 92360639959809, 83689554087147 },
				{ 171430088634553, "Modern R6 Animation Pack", 104406060298008, 124988819613327, 99901926147031, 116343198036897, 129580654694779, 110907985002120, 99928806802401 },
				{ 130315691170614, "Zombie Animation Pack", 72020579345676, 112308035206770, 131605772282759, 123878221388719, 138858643345164, 130045357922950, 93287488161066 },
				{ 117734412711622, "R6 Survivor Animation Pack", 79575948465396, 127283838990258, 132471521372294, 137934973717401, 107615688046955, 111862482779638, 138445851536606 },
				{ 94415078985878, "Kawaii Cute Girly Animation Pack", 111249376072333, 73636981266788, 131576761090801, 125116610868743, 106910927390939, 133959656651864, 104067918460960 },
				{ 226897222628299, "Chill Boy", 79638430446468, 125935884379030, 140668178711040, 121044668035612, 90121153486837, 107026478538282, 74464049474878 },
				{ 13290832259834, "Cute Animation Pack", 102526860241644, 129081631925429, 106225307541637, 118216190885024, 120436889637318, 83450718624718, 102260064079692 },
				{ 52466328299272, "cutesy chibi animation pack", 103179664605636, 103849563001453, 136485344017634, 85211239912050, 110743159760232, 140486275218961, 121372042956337 },
				{ 89768357010362, "Nonchalant Animation Pack", 107123120166007, 125611743000994, 88865794201668, 107221788639672, 118450647827858, 119095716889455, 96444605185114 },
				{ 221310517641058, "Mini Me Animation Animation Pack", 106089150684940, 116237551178158, 104913000423601, 133780000255900, 79041695698101, 104828442123637, 83799110138560 },
				{ 102048798144595, "Cool Emo Aura", 127580418054168, 91102198537347, 77210591876650, 123882301747791, 95117093930538, 131813760681065, 95685828345272 },
				{ 23288783307950, "Dizzy Animation Pack", 137255148783720, 81054479341998, 105873418863090, 121811306911133, 78281355074909, 117513930450845, 97259493650901 },
				{ 279612870347264, "Kawaii Animation Pack", 84721389105549, 79177448240579, 71632541042172, 105876388602982, 137590039087467, 76215614145945, 92467188495424 },
				{ 107449487713343, "R6 Angel Wings", 79466032234245, 138299319826930, 122722513478504, 123793358507075, 75098379256118, 96350191100381, 100038070580099 },
				{ 85110921996528, "It-Girl Diva Model Anim Bundle", 80494300854973, 82957409029972, 128240121430408, 125072972081311, 74013738186250, 81815597656897, 82440401004480 },
				{ 6968492533072, "Competent", 119086399545479, 123321628856372, 121093676807537, 97770192168063, 93095471463296, 97137023603110, 76929827202134 },
				{ 111318635278464, "Spider Hero", 98498958085614, 89415990707521, 94788684136734, 122116140777779, 74735559532482, 81017611230610, 91804560705435 },
				{ 107350693632269, "🦋 Fairy Animation Pack", 89083151597904, 70694340291974, 121135476621722, 124909042161301, 87787512377012, 140475232307421, 117829242170557 },
				{ 211258251729003, "Tsundere Animation Pack", 114875140433256, 108526601061721, 76151663022671, 83923174202568, 94236133353214, 73379865259884, 81953883148936 },
				{ 155758204354290, "Realistic Male 01", 114822686413694, 139525865069063, 130062168996362, 90526784917601, 88683402647046, 94323572155517, 83944244201171 },
				{ 25615747990214, "Endless Aura Animation Pack", 72370291265693, 100590428856100, 123264174003256, 79652918388064, 93289495565458, 80570157540129, 88619827935968 },
				{ 245160420458794, "[R6] Sonic Speedster Anim Pack", 128200188464094, 96353899184850, 83851522234030, 81618354444197, 90715718113183, 98500626075688, 128862881664678 },
				{ 145077181619782, "Furry Animation Pack", 122017321744523, 124732270095091, 78822241982559, 106970102410990, 75892211224822, 101997929337327, 105993144805512 },
				{ 169806000893599, "Cute Shy Animation Pack", 110335965613791, 88354674253567, 108892505937356, 112598844654591, 116336440124933, 108646387674307, 105086806405008 },
				{ 230396238988595, "🌜 Dreamy Aura Animation Pack", 103821987445449, 140236552335090, 86404050564430, 122416620253122, 111655584291361, 117378264371555, 87494549118785 },
				{ 276498990431337, "Joyful Animation Pack", 115993266440776, 139313407695532, 79320869574382, 131930671650999, 131117498790057, 96747830207189, 126095360657826 },
				{ 140802726445209, "Girl Boss", 93912644503832, 139844094650898, 117605897887039, 140026102623246, 86187846912270, 94548540472517, 122971733814893 },
				{ 86270790880748, "🖥️ Glitch Animation Pack", 107245650589762, 128190163643941, 121934531969232, 115414916728373, 108245427497486, 95898854434873, 90839362430731 },
				{ 113723687671765, "Viltrumite", 75641026799451, 106987123511072, 82398394563415, 134140909114564, 93363225480628, 125663362682162, 83574442579349 },
				{ 164355299748180, "💅 Diva Animation Pack", 88482554139722, 94256804666698, 79334438988956, 97808091973123, 124469782365525, 109755265573758, 87225003917447 },
				{ 94426143364477, "Haunted Ghost Soul", 103573927681025, 122735933423158, 100802507391931, 138692334288616, 130467240352433, 87318358377157, 81668714343553 },
				{ 3209000400683, "😇🪽 Angel Animation Pack", 85043173762737, 89201769650144, 138287417917411, 106183812356921, 104600877757491, 104660563121727, 118177131718784 },
				{ 79431454004759, "Bossy Confidence", 80237907572702, 103950002102007, 97688227121610, 88971196153642, 71037370337331, 137816596837314, 129547215527832 },
				{ 238848825749740, "Ghoul Animation Pack", 76989014478397, 116022874958585, 112734296077543, 71865240269363, 80620104261118, 133899475603776, 130029645154775 },
				{ 15910512001792, "puppy-girl animation pack", 111749180513057, 90443424631782, 78024865892029, 97624693542486, 119524820750332, 73719994122245, 84374727885308 },
				{ 77123023523467, "Sword Animation Pack (Right)", 114369154163347, 132189012366468, 87770000067910, 113357698901401, 108519921701378, 112902067866259, 117331900750388 },
				{ 219073071095899, "Secret Agent Animation Pack", 92218190346839, 104724130283444, 86044573374946, 90413927505422, 102469518998022, 78168066364210, 120149490597139 },
				{ 168323858482919, "Halloween Tall Monster", 115802980358279, 81348372408717, 93642290766073, 87768181719255, 97117757510612, 128478657986830, 86117063258438 },
				{ 152581890258482, "Nonchalant", 87426496981743, 121007634567279, 127973374851693, 88365385749971, 127305386281368, 99405504747797, 72718815132793 },
				{ 196159361726685, "Effortless Aura Animation Pack", 106390953994044, 111484087971615, 112515971043909, 89547925261998, 135065867268215, 116904502538281, 133821165523889 },
				{ 39278497764465, "Endless Levitating Aura", 71962531353983, 101401670392323, 98775178030183, 81745729002991, 121128633842201, 120507931847610, 76641694464522 },
				{ 244246106823662, "Moonwalker Animation Pack", 92710716765283, 114763801999339, 101531926378460, 104533631513747, 70566441403811, 79306475091221, 98563274763262 },
				{ 141645144245825, "Gyaru Animation Pack", 93285939059101, 134475730682161, 76990605488118, 77117607881594, 87497678199524, 102628481691065, 81891537510998 },
				{ 3290671274997, "Dumb Dumb animation pack", 105004614594851, 82802187852670, 94065959215233, 95678097589635, 139471194330271, 74141666174470, 128952343229653 },
				{ 103600337266099, "Killua", 113784126268587, 83436079239604, 93027547767719, 139330690411409, 109287098151511, 102087233204814, 84703542966981 },
				{ 210501410435903, "Unrivaled Swordsman", 101628587972724, 94592212795048, 112472072663118, 134760817926751, 111518283525040, 140192747449146, 73916168921479 },
				{ 262821442676286, "Cute Animation Pack", 138939410330874, 99840464746127, 73656936285475, 121638805023018, 103433308815918, 71446019452035, 106328912863928 },
				{ 63728567056735, "Cute Shy Pack", 98637605375705, 127754112524189, 126145942574326, 105662064099352, 121626615485133, 75396216925695, 113753688495484 },
				{ 251391123581565, "ANIMATRONIC BUNDLE", 101544755943444, 134168450460030, 90846537286775, 93439028227818, 103651923804354, 91870702348480, 90773108715760 },
				{ 120481257024256, "Cool Boy", 130315830989545, 137785643057516, 85494649926570, 133898250810070, 121898694120755, 109255428875312, 97318831452205 },
				{ 18028500709412, "Snake", 126436582760335, 108545392217814, 135108986609280, 72385458051568, 103279744626670, 103281762091297, 123956653220362 },
				{ 141664514953254, "Silent Nurse", 83503720560704, 124045989288571, 135611588077870, 86489085940301, 134825190604786, 80613329641752, 135801055305466 },
				{ 168696849243692, "Spiderman Web Slinger Animation Pack", 123498494711538, 109264538322789, 71399059326335, 134626738614630, 78726403425717, 97796906157079, 72914380938732 },
				{ 73967670574306, "🎖️ Military Animation Pack", 114264441201765, 122783976375321, 117276571225301, 92738460397646, 121807925179208, 78517162186590, 104015116392523 },
				{ 117879278582279, "Runway Diva", 132433153091310, 138178933183814, 84022133617342, 104950449133842, 105680381958805, 113498101915070, 123982847022337 },
				{ 43338041964133, "Retro Animation Pack", 91334610292493, 113866237794361, 82449559205951, 81975998427267, 131265023902034, 71746696709344, 71819090103948 },
				{ 129474238740939, "Little Friend Animation", 124201191757508, 100578384342496, 80482404506684, 137019482160610, 113331933689305, 76480109863921, 106028120008614 },
				{ 54114110658153, "🤸 Handstand Animation Pack", 119718678619654, 120779828540112, 74743923335305, 106738358000265, 140035581518979, 105106152978552, 93107206685726 },
				{ 163017378149235, "Cool Boy Floating Aura", 99104946083968, 138593385056356, 138761087398466, 83805029805026, 130748737873692, 92874125671939, 106250550031017 },
				{ 280320546845566, "Sans Animation Pack", 116495170219410, 133278416896063, 92706100850185, 111618306974792, 89136705428977, 70913664505920, 75168138059254 },
				{ 63244228017921, "R6 Animation Pack", 107510976901968, 81418689285592, 136312347048580, 78528539300829, 75362328318455, 92902598283305, 74692454929935 },
				{ 190021249320677, "Headless Aura", 134955376393871, 71703551981504, 99509554618141, 135798298648231, 72562819406445, 128311988778489, 84517244080655 },
				{ 132004524113589, "🛹Skater Animation Pack", 94910599998393, 136750898054727, 73280209872250, 72883750852520, 80566602616169, 109510347698976, 109468717300474 },
				{ 148589613222341, "Animal Animation Pack", 99955302753648, 80777353730960, 98285202393652, 104778622992335, 101869145556635, 125737530068698, 137600244154602 },
				{ 154816754181611, "No Animations Pack", 125181193511446, 98277462212808, 114909951212740, 84385111200080, 123565201644193, 128704251886648, 104642998429173 },
				{ 132761028326938, "Casual Animation Pack", 136607681838394, 88766053158819, 78209309053197, 70380397793550, 123732290752173, 88787300450271, 78871479374096 },
				{ 219075592036639, "Shy Doll ʚɞ", 120409233127901, 136018973495139, 140452828857398, 96648456154700, 96027555904188, 79085398750382, 108176320752952 },
				{ 165127141291580, "Kawaii Bouncy Animation Pack", 70555112060391, 120312452429453, 107040972522394, 85980076701165, 110732584497974, 119148235349086, 136546912982911 },
				{ 42247150176607, "R6 Reimagined", 113781694262261, 102878343237330, 124242847545277, 85143176135829, 82543840872740, 81130977190069, 86967055554090 },
				{ 101626628473103, "Survivor Animation Pack", 117955497432173, 84228988694177, 74391569199700, 77213702560699, 117303527707873, 90727684391435, 125001214042734 },
				{ 48085018323528, "Bouncy Cute Kawaii", 134371248846631, 91422662153285, 90921053952424, 134976602822718, 125232738686501, 101450438167306, 138313860455106 },
				{ 211603209255940, "😌 Nonchalant Animation Pack", 120361344309821, 137080061938111, 138817543112482, 101362426464232, 137504551310868, 112352256883383, 121597417409288 },
				{ 51189308475249, "Steven Animation Pack", 133253708125525, 84157863686470, 73636886914394, 76594222545001, 96851516499601, 72765107060955, 124364040445553 },
				{ 5626295, "FIFA Football Animation Pack", 118649383584034, 116562432475955, 85988010084587, 109764146230261, 114350110947576, 93756360672538, 96253251952462 },
				{ 174234884993258, "♡ kawaii anime girl pack", 118402733965469, 137873085101178, 130849350236070, 94640150317449, 125678285855898, 72639448259486, 78062527010701 },
				{ 130256743410606, "Aura Float Animation Pack", 77944556069734, 118783698771757, 92373181998670, 128455215897480, 129911095680365, 115980070775346, 83505514580679 },
				{ 112431871100891, "💅 Sassy Animation Pack ✨", 129626196680285, 96410564425021, 75896195178885, 114840474009020, 80824008450652, 136213738352357, 124254242876616 },
				{ 31650195771989, "Cute Impatient Tsundere", 79632663995121, 100069639645127, 124751284064591, 140066430486591, 95491270698008, 88059525289085, 88912476295478 },
				{ 236876291974067, "Detective / Mafia Animation Pack", 139109279036888, 130318375466007, 100035784099110, 130915975817889, 130448881461319, 129001808884122, 137198611187499 },
				{ 67246619830311, "Spider Animation Pack", 112466965724680, 108424853644232, 75841551285120, 100706347195538, 75241830583351, 86343110170387, 124788696828521 },
				{ 153762937122364, "Kawaii Animation Pack V1", 139284113672221, 122146776836501, 114307772322044, 121481289336077, 119438473051601, 98018800506974, 90908339375985 },
				{ 133029085353625, "Diva Effortless Aura Float Pack", 136462080938426, 85942415677641, 104659090959141, 80104657332873, 133638268834647, 113339705060994, 77349285629064 },
				{ 103419279227461, "Princess", 112247064065622, 126906500970658, 102952751730257, 104343764860688, 95402289660381, 135831725136212, 108376021237535 },
				{ 36026146779603, "Social Anxiety", 121663093701363, 120883274762528, 109934846900463, 94778609167745, 92704985508053, 82905220322821, 121066908207013 },
				{ 155148535503082, "angelic dainty floating animation pack", 122087124095413, 133979848959140, 138857433670797, 130915558062129, 103456136433561, 110517842631547, 81357557460188 },
				{ 142368140565439, "Hatsune Miku VOCALOID", 77394702918889, 115076409379509, 132703832811724, 104800719202256, 79679642704558, 124311346839421, 123121833221754 },
				{ 331465, "Bold Animation Pack", 16744209868, 16744219182, 16744214662, 16744212581, 16744207822, 16744204409, 16744217055 },
				{ 1036896, "Default Animation Retargeting", 97469447878281, 138584736068420, 104556634816668, 102957313714134, 112811597738377, 92204703529731, 89611570900463 },
				{ 932296, "NFL Animation Pack", 101094325978637, 120071305586627, 84823630062362, 140600227095432, 123307994439772, 122757794615785, 136750772888868 },
				{ 1036897, "Pirate Animation Retargeting", 93961142580011, 131469949729016, 129218825505545, 102669705555030, 118846833823973, 106906206764899, 92456594622012 },
			}
			local newBundles = {
				{ 346718828628, "R6 Softie Animation Pack", 102651918060342, 92161818406039, 118095235880083, 118115709618417, 92081032014414, 118521737972592, 123622969112890 },
				{ 240013541704767, "Burtonesque Animation Pack", 121987160492958, 133859183088488, 123267566647443, 113353475841465, 136850071141658, 73109666815168, 132617060260018 },
				{ 81295854326892, "✨ Aura (Floating)", 119126902591378, 78093568415363, 127441950006817, 125716954489552, 130109078714595, 125145865285401, 72625909388144 },
				{ 64359359118780, "Matching Gojo & Geto - Geto", 74700203716777, 139575967445620, 108430565380083, 70865735021615, 89516682191923, 125706692592941, 101366581640976 },
				{ 210813929860435, "[MGSV] Venom Snake Animation Pack", 92845210569291, 110268416056059, 119407040328053, 71368900313773, 91470925932898, 118861344282603, 74485633139255 },
				{ 22999254604507, "Clean Girl", 99617445188896, 98432516102509, 75417410614580, 111467153412202, 101496693975399, 71306092771466, 97617322069183 },
				{ 81889112216202, "Fairy Animation Pack", 126500995514436, 111347977822579, 87861850888726, 72177014322054, 83015219645885, 128525453879414, 123969942041709 },
				{ 215163851706936, "Tall Scary Creature", 99930491676650, 114946964023598, 112706676171803, 132823341775268, 100611329530991, 82075092072041, 140647468200484 },
				{ 195619017160446, "💨 Ninja Animation Pack", 107377621660534, 132035242186767, 71990522773224, 118835903505201, 97302677062076, 122413280106175, 109349550251797 },
				{ 69255288290150, "Silver Surfer Animation Pack", 102553531089218, 128481002419055, 73410262711109, 136907314514233, 133023549971499, 114638785955574, 81100272666954 },
				{ 29854653487192, "Best Jotaro Kujo Animation Pack [JOJO]", 122303709528974, 128700191590653, 80885848966338, 131831849983542, 136236486473376, 118039419450962, 95414956629341 },
				{ 100406542283134, "🔥 Menacing Floating Viltrumite Pack (Invincible)", 127794126361401, 140377650140124, 94357470013234, 133844541164572, 96782647421445, 120376221505068, 125432791579005 },
				{ 178030229597008, "Fake Lag Animation Pack", 131268753169058, 100534648341456, 128135398672253, 117761196710546, 72426380380145, 136633822449776, 116038868377383 },
				{ 168780946552846, "Dog Animation Pack", 86568145958023, 82759748724300, 90568510415059, 103791706490551, 82477993292508, 139728378883263, 75585586350309 },
				{ 90233089251471, "Halloween Cute Sleepy Zombie", 110042753242042, 121957019198248, 91802592336625, 130302717838156, 133552486102001, 120615385853156, 92975795432744 },
				{ 130512117821725, "Cute Shy Doll Twirl Animation Pack", 126232044071474, 110114682207503, 139881581082270, 118205975863094, 102359751134377, 103564718944086, 122682073438591 },
				{ 103654832647918, "Almond Eye - Uma Musume", 123563916862517, 128069645009648, 74477024273867, 88963980305022, 136243234419016, 88871017266742, 128869981832315 },
				{ 58114753443214, "Pirate Animation Pack", 105097357784138, 101907866742265, 71523544324648, 137650189926028, 120311358635815, 75782889213241, 86531929072722 },
				{ 50557425118268, "R6 Creeper Animation Pack", 75523909326842, 77120301846359, 139352162278905, 95617922141272, 87252677843032, 83248820150680, 116164306507083 },
				{ 76869663076404, "Hiding In A Trashcan With Accessory!", 122563566229229, 102709129046892, 127605149031726, 77362821791514, 96308087510226, 120616719984435, 100462230823521 },
				{ 72788764355691, "cute anime girl sway kawaii pack", 119037038589162, 83858445465753, 121242824693191, 87446875569105, 76718103382741, 83829747186223, 101814079044625 },
				{ 203884520960460, "Goofball Animation Pack", 71882784891671, 70634869984615, 105939529889727, 78011340545782, 105416600557424, 80428760844405, 75820848971233 },
				{ 7458997449692, "🌙 Nonchalant Laid Back Aura Pack (Floating)", 100151586261686, 137425296181056, 110577583842277, 113235349732772, 111696172442428, 92757030112663, 88307134494773 },
				{ 6535623688584, "✨ Cute Pose Laying Aura Pack (Floating)", 117197173691073, 71706288099375, 97216931005942, 83712976418916, 71969867726175, 132522733385827, 98935053237666 },
				{ 77892115233294, "GTA CJ Animation Pack ⭐ORIGINAL⭐", 118623886392486, 95860024032857, 93323445795978, 97713278193617, 93770439278759, 75379729668530, 118916799762866 },
				{ 252484030352496, "🌙🌸 Kawaii Sailor Moon Flying Aura Animation Pack", 136522740838112, 81542090561099, 97885968384749, 95712834264331, 123275625279184, 93450667546879, 123847253229797 },
				{ 28201483276338, "Emo Aura Floating Animation Pack", 78645276679006, 77299242052377, 101636604008106, 86676316711548, 114787855055183, 110849943940175, 96406779847899 },
				{ 103135883866153, "Classic Vampire Animation Pack", 127499925377464, 72670516117084, 136172783186593, 110718836088108, 100009506792121, 130847482819362, 87911754624645 },
				{ 25704340036948, "Chill Guy Aura Farm Animation Pack", 85525896071224, 100625294782222, 121498618544582, 106575367964532, 122778307875305, 89618474667266, 130944785287900 },
				{ 96298932601360, "Cute Aura Flying Animation Pack 💫🌠", 85025973989178, 121193171893051, 76246333533136, 122673407386115, 127146126385914, 127693718415398, 93706778297407 },
				{ 192543446110579, "Crawling Animation Pack", 137806631269292, 91057479836882, 128895867740513, 131780669588937, 89162380786728, 78148016528629, 130058926615484 },
				{ 214466134093264, "Cool Guy Aura Animation Pack", 85267879188594, 83255863654928, 114493563888145, 73988126833546, 118740348379850, 110479971524890, 118130030155282 },
				{ 33141150609984, "Cheerful Cartoony Animation Bundle 😊", 101375057394281, 103397623981092, 124122866075020, 91193753828092, 110370932833569, 73610349065218, 114846464401954 },
				{ 170780990658194, "Lazy Float Animation Pack", 93999503659421, 105561835903946, 97910588621921, 83480876088136, 107196905208347, 95678919217249, 106777676300109 },
				{ 121974117115613, "The Nurse - Dead by Daylight", 73071046669341, 138823968011219, 113549159019291, 99010959763319, 102327644380473, 107897900282867, 104621075264639 },
				{ 100631627459825, "Ghost Animation Pack", 135055120827684, 76189697399044, 115080665168960, 133991032899590, 78097327112928, 97551824780414, 117191731184382 },
				{ 219242833772205, "Mini Tank Animation Pack", 96055421212453, 122057768211563, 85666217062452, 92501402738820, 87930704892851, 133227304522459, 90968985949634 },
				{ 3740276104199, "Shy Cute [3.0]", 138297485420191, 89464681685474, 82350105174729, 130652682437363, 128173484101534, 112338515646914, 133557217215546 },
				{ 96822070451129, "[MGS3 DELTA] N Snake Animation Pack", 116373240353239, 137212837402810, 124985168992629, 108946478789549, 96340226362936, 109624688326490, 125815766800638 },
				{ 130712556441073, "[MGS3] N Snake Animation Pack", 90287538630017, 101101594771970, 130026853919102, 83384706262856, 105237567714590, 126529248768011, 124826489378334 },
				{ 244495263660190, "Motor bike", 98953261541373, 86749265272940, 127216367675398, 94724585321015, 119146909757244, 109312692839021, 125458328923962 },
				{ 2554700661078, "God Endless Aura", 140257972350930, 75803431179392, 124643432505022, 87901598630163, 119550784755766, 105949776856550, 110409614440547 },
				{ 260460749130860, "Cute Baby Girl", 131228697811112, 108442900101114, 80641134642012, 85859964219434, 86652090148766, 105154513381753, 113175498589951 },
				{ 29541990297544, "Cute Zombie Girl", 95875054425935, 82250217733202, 101261501159015, 81094043127936, 74503562351686, 129503832468030, 112045237330625 },
				{ 139980616397340, "Cute Anime Accurate Girl Animation Pack", 123361993725314, 98900851613800, 134514296943852, 77105092795234, 126426621974829, 106501993251536, 103199218311663 },
				{ 237142673233282, "Texas Cowboy", 137530343766636, 133034402843265, 112949286915127, 119966406173769, 136130690287220, 93710047260909, 108804864887472 },
				{ 223992941593945, "Aura Headless Hover Animation Pack 🎃🦇", 119883817735679, 107877258428987, 95263315997959, 139442111541178, 113624742007635, 73222487330469, 101229651249319 },
				{ 109854023066610, "Cat-boy Animation Pack", 85163331300454, 72342918281987, 93765468680106, 79926571638154, 133759466033378, 128774319815820, 81206256359713 },
				{ 101809116064067, "Jolly Animation Pack", 86822978607368, 137660640858861, 77536436651913, 97437126647537, 110413287038667, 87882735676493, 88596944586212 },
				{ 152306106818054, "Cat-Girl Animation Pack", 97317100261517, 116870418497306, 119510100333782, 122910742742130, 118747804995604, 92496064469025, 81309395375420 },
				{ 269761199979151, "Yuji Jump Animation Pack V2", 90096455782289, 74405958592823, 135224407517123, 73912943159582, 132179141594611, 75527654293493, 120027590582238 },
				{ 167942519332380, "Cute Frog 🐸", 107853639072984, 110447391478976, 94204782170994, 139391685278077, 110454726325518, 78952577481681, 107955532457303 },
				{ 206275572257570, "67 Aura Animation Pack", 130271944198901, 118085427171298, 73723415834655, 100467691343122, 78316555374950, 78747622689419, 89061332430573 },
				{ 274284729014181, "Injured Animation Pack", 104477657447895, 96419109016980, 78542544704586, 136958917667806, 98056993478207, 76271441572688, 134467497229442 },
				{ 207559180464658, "Cute Playing Around", 89432596623410, 118070195741831, 131511660973957, 84633211136675, 70669548271771, 118444670723715, 101476083423992 },
				{ 62852628400321, "Cute Needy Bouncing", 72067797659191, 124972111409414, 92079481922699, 92736583114162, 115301125593866, 96488436493859, 125098596917753 },
				{ 194237466511735, "The Shape Michael Meyers - Dead by Daylight", 70860596388375, 90130092120122, 98148572059842, 126969703678648, 77839379096699, 131025886592960, 78589734666595 },
				{ 260331541590062, "Cool Boy Pack", 80171866305021, 139930443270979, 94305659214661, 111286671182613, 117689288459932, 82679823117260, 122623311785376 },
				{ 249705331606154, "Headless Horse Rider Halloween Animation Pack", 106989230981555, 140075290450368, 88613046132234, 105644717957223, 125992853799091, 103555796630005, 99792641790749 },
				{ 219196833552012, "Floating Animation Pack", 113858313416489, 88471654472148, 132857529438108, 83578339581624, 71535051799354, 93321075431546, 87949112447276 },
				{ 96218112462687, "Injured survivor animation pack", 91004093524361, 121424887124246, 90081077563840, 90522226340402, 88359527582669, 109698092826334, 139551965568218 },
				{ 157068024753326, "Cute Kawaii Girl", 78294398529281, 132502249513547, 109496577835577, 123630463152824, 127822567000511, 130676104756900, 76274836988148 },
				{ 78316657350968, "Cute Kawaii Doll", 95933625306405, 96186536617838, 129394133110246, 94830488207575, 137395179912796, 91497237628692, 79756759306847 },
				{ 149879406785473, "R6 Shy Yandere Doll", 139749857583281, 138029921045597, 102476724311834, 89272416526830, 87921948176693, 137165561932341, 127088533535788 },
				{ 148489958236762, "Heavy Golem Animation Pack", 135701630284804, 84428266027481, 121135597921003, 109986699026128, 90414753106749, 118065750275214, 80661069027206 },
				{ 210039970254554, "Ballerina Animation Pack", 125515675842892, 132953626083118, 124895093738174, 128128077709320, 120945680003606, 85938558644551, 80258459486435 },
				{ 219272004092971, "Swim Animation Pack", 82965462235821, 100542085819897, 122994413708703, 136041073174325, 99526810377092, 75690732146878, 125896604636794 },
				{ 78201426027104, "Michael Jackson Pack", 139737257808318, 119261195846349, 103928836905414, 97498268058458, 70794549833186, 129875830849484, 104184039162344 },
				{ 215390157024702, "Spinning Animation Pack", 88578995084665, 75526479927182, 88715943305890, 93766625689040, 134679252211114, 87460654630692, 71204360453355 },
				{ 45181992921284, "MAGE ANIMATION", 95412524556432, 135715316604799, 86843251007732, 94267079287244, 114202488937962, 77815115545843, 83803952450950 },
				{ 235864691929345, "sleepy cute kawaii animation pack", 99885596122948, 137750032328715, 136224663594149, 127451227519129, 107326540977737, 84170363870797, 98317063179329 },
				{ 279287319590676, "Cool Boy Aura Floating Sit Animation Pack", 127452678420147, 135999443549171, 112986026358295, 118964234540904, 90136671427215, 118123216253768, 70589650329218 },
				{ 59336316790104, "Cute Model Girl", 72763656715596, 103577782244832, 79717533616833, 92838424262999, 118885163492445, 74812525561245, 81640929232810 },
				{ 191308001565914, "Cute Gyaru Joyous Girl", 116970330059411, 133645960318815, 128053582126246, 103447792656149, 91886663967396, 90659398203981, 101563830896712 },
				{ 144390297632617, "Cute Joyous Doll", 100901492270582, 105293968086403, 125208376396180, 84330494327869, 84709100954434, 129177004292851, 123971090817524 },
				{ 240545187485207, "Cute Joyous Swaying Girl 3.0", 102879169205038, 102113239789768, 110270849715256, 121922639458716, 70417725551265, 72625186253766, 115627618692151 },
				{ 235748691244472, "Realistic Zombie Animation Pack", 97271539683055, 121977418368927, 118240305404123, 111580617219204, 102808826006248, 140656058165576, 95786068741018 },
				{ 271750463772104, "Cute Baby", 73421603134927, 104701560759467, 139802219099705, 123234370489036, 118651607358840, 92478876494158, 136541591428167 },
				{ 167555137794755, "Cute Sit Floating", 104336043212491, 108763749289460, 75398364567441, 83964382908600, 81002225217932, 140167547508427, 111234293122503 },
				{ 238434413254101, "Cute Shy Doll", 81132802911146, 121942336973643, 71528806562821, 92645236363717, 129254372210059, 84246439515369, 120612365648651 },
				{ 105197486240045, "Sneaky Animation Pack", 74577925898509, 94737333218733, 97913326476428, 82775460888591, 100054440300149, 123355070533168, 119231509302601 },
				{ 107535279657732, "Confident Animation Pack", 80338861930712, 122564973169214, 133724458565522, 112164600756795, 80626819732131, 130442757525478, 77641535635641 },
				{ 4645180709379, "Full Of Joy Animation Pack", 112697198445949, 120412109522349, 121696438773017, 80146665499399, 71067597691974, 74279421611048, 105330739520152 },
				{ 8793479539641, "MM2 Fake Dead Animation Pack", 136230440471372, 138424891541704, 138958313587847, 140621572670253, 105500230417230, 112337412231852, 81567621205747 },
				{ 106044231344969, "Cute Shy Girl Pack", 106705278836440, 101760042345605, 138053854205135, 78059067540085, 99363563273607, 119452852001390, 119004313922987 },
				{ 54843787624853, "Superhero Animation Pack", 133885837245735, 100903067741657, 89150861190550, 90526719969682, 135808067855041, 100819872682736, 133510432675559 },
				{ 238021101976189, "BoredAnimationPack", 81108258054128, 118225959186464, 106303901972505, 96584218892392, 133997591845887, 131852032155353, 77738785476558 },
				{ 104270348457345, "The Earthbound Hero", 115586654010215, 99630725572520, 105937528135441, 127499818514448, 84042957473345, 127674878647760, 93967450827531 },
				{ 194092575833989, "Matching Gojo & Geto - Gojo", 116143264571425, 113393685850920, 100348565164106, 122942170308359, 110411574657654, 88370911565785, 126439838561769 },
				{ 80518893637907, "🤣 ZEN FLOAT MOTION PACK", 137462958179305, 78531395021175, 135436716455054, 82322037475595, 78124909364784, 116668243662787, 100963601832351 },
				{ 264763278477816, "completely stiff", 110531944855263, 137403770390683, 97869145096827, 118667339556946, 113995959639869, 81593934396367, 106780688408107 },
				{ 169012738981402, "Cute Chibi Sassy", 77314984584545, 82006175599281, 137302467139344, 101006398429994, 114824427236668, 117239002744710, 132658936694612 },
				{ 261672699599456, "Halloween Cute Zombie Nurse", 109341777923994, 108334209793925, 118686861288812, 90345010338893, 120665590312864, 71676809013968, 106417050771200 },
				{ 128523558594849, "Hood Walk Animation Pack", 122506696113672, 104741391551671, 128584977482633, 81740095053841, 126990651625080, 97132076459823, 103913105635251 },
				{ 40188790057873, "Possessed Crawling Animation Pack", 116915241391805, 128750743583051, 125166469849476, 108253402973768, 78298842551143, 122303538944449, 135737244509911 },
				{ 145338216183705, "Flying Aura Farmer Animation Bundle", 77791651089479, 129363373168599, 123081436536094, 96068867309714, 134008951696821, 125651485178519, 133878107477099 },
				{ 8937001401294, "Vampire Animation Pack 🦇🧛🏻", 84752569530713, 80337281422433, 90507664248957, 111715484252761, 135515490952874, 71447775349973, 118575291063270 },
				{ 259113896317680, "Emo Flying Aura Farming Animation Pack", 91230300801706, 127037824940169, 116668725669697, 71015392129909, 127080802411319, 101828605672931, 134726585265124 },
				{ 58008550856515, "💀 MM2 Animation Pack 💀😹", 96385977083778, 72197041576015, 94964320083399, 101861348010348, 109522809200301, 100577223872149, 108766346107869 },
				{ 218363945814573, "Moonwalker Film Pack", 114502908879897, 109402978501307, 77965013441865, 83819464193193, 119645343410403, 84734891638618, 95817832098000 },
				{ 37942358904819, "Survivor Animation Pack", 135674002690538, 127484714354536, 82854940462817, 75244591963793, 77043813788444, 123518287072605, 139982966829837 },
				{ 226333114683103, "Kawaii Bouncy Nerdy School Girl", 135942776905421, 84995896833734, 74139952254854, 73526026144499, 118035587107014, 75788386725132, 126762092773955 },
				{ 15279952972706, "Kawaii Cute Whimsy Girl", 108149127341810, 128484963183463, 79118538240281, 93238127126247, 82280767407792, 113077878759887, 108679620828890 },
				{ 196670956226483, "Cute Shy Pouty Girl", 119528600250052, 109185231917244, 112662974444844, 127781842059460, 133015054391336, 92908919868974, 97958948335858 },
				{ 45823831309697, "Cute Sleepy Tired Tsundere", 85415795044178, 108933493223197, 79389984856904, 132060352425993, 135293602487463, 81929470367318, 130923042546110 },
				{ 183415039546818, "Cute Stylish Girly Diva", 113865042653446, 106692867109053, 104749767253371, 99672303381341, 94154759028013, 107613417092267, 119119951845178 },
				{ 129980707435676, "Bored Sassy Mean Girl", 136601483414758, 95607213703404, 79760282991190, 124394717662756, 94041168358558, 81900172692959, 124662363089270 },
				{ 165106603811960, "[R6] Daydreamer Animation Pack", 111948164040561, 124344951085066, 75303574652811, 93312341190716, 76151318810184, 113834028623165, 135303950851589 },
				{ 122125716415607, "Tall Slenderman Animations", 122806859329839, 99448802469406, 126104026007446, 122286127706042, 115783359270546, 91449271168772, 93488770319183 },
				{ 254454190905327, "Faust - Limbus Company", 102377305607045, 73259516607307, 113349182721150, 139840357507302, 85307926752778, 139997270770450, 136836770486718 },
				{ 231583091863184, "Rivaling Spider Hero v2", 136668077102077, 123024274599820, 118367736336496, 103208327885734, 107304583269426, 93325873731329, 110194681731643 },
				{ 266825133703741, "V1 Clash Mode ULTRAKILL Animation Pack", 84967279390950, 103883079468882, 93337492116743, 118554613342071, 89075107205983, 86307584737703, 121602442665611 },
				{ 64842196438423, "Psycho", 118086017761082, 131337854476238, 109585056712932, 125432016616771, 138142200761786, 89172105619917, 97897452540515 },
				{ 237887942496224, "Cute Kawaii Cat Girl", 86892423945466, 119692089648088, 95411795354662, 77106544942843, 96707673993441, 116536110277892, 118383577362271 },
				{ 281213457343854, "Cute Puppy Girl Animation Pack", 81200193729952, 140090954970456, 124282040126811, 102754820468722, 78237372835821, 115908996311928, 83850064158159 },
				{ 146631584295776, "Ninja Animation Pack", 139025265615945, 120181245834586, 119341465624661, 115984803005019, 111085341389942, 120861164738915, 109470126430376 },
				{ 149613246755627, "🐾 Therian Furry", 94925478547755, 111277037711705, 113440665495248, 117902437286612, 80010379317159, 81758690520669, 105439957980795 },
				{ 5692212788525, "NPC Avatar Animation Bundle", 105434767037086, 114420021859694, 113750415532506, 88350251537308, 126339090911461, 87133513702806, 104737387655624 },
				{ 164628585885005, "R6 Lego (Fake knee)", 127140437889594, 129170298227145, 125539089354894, 71683361004944, 88374714784532, 99106880992526, 100194596945796 },
				{ 200493094373809, "Sitting R6 Animation", 99590209409204, 127441052413544, 103026531476968, 132911004994525, 122966638146164, 114159194482746, 112571093788907 },
			}
			local emotes = {
				{ 3360689775, "Salute", false },
				{ 3360692915, "Tilt", false },
				{ 5915779043, "Applaud", false },
				{ 3576968026, "Shrug", false },
				{ 3360686498, "Stadium", false },
				{ 3576686446, "Hello", false },
				{ 3576823880, "Point2", false },
				{ 3716636630, "Monkey", false },
				{ 4646306583, "Curtsy", false },
				{ 4849499887, "Happy", false },
				{ 3823158750, "Godlike", false },
				{ 14353423348, "Baby Queen - Bouncy Twirl", false },
				{ 4689362868, "Sleep", false },
				{ 3576717965, "Shy", false },
				{ 14353421343, "Baby Queen - Face Frame", false },
				{ 5917570207, "Floss Dance", false },
				{ 5104377791, "Hero Landing", false },
				{ 15610015346, "Yungblud Happier Jump", false },
				{ 7466046574, "Quiet Waves", false },
				{ 5230661597, "Bored", false },
				{ 14353425085, "Baby Queen - Strut", false },
				{ 5915776835, "High Wave", false },
				{ 12507097350, "Alo Yoga Pose - Lotus Position", false },
				{ 4940597758, "Cower", false },
				{ 4272484885, "Baby Dance", false },
				{ 101573394483995, "Effortless Aura Pose", false },
				{ 76361248833307, "Godly Aura fly pose idle", false },
				{ 3994127840, "Celebrate", false },
				{ 132384701706046, "💀MM2 Fake Dead", false },
				{ 10214418283, "V Pose - Tommy Hilfiger", false },
				{ 104131847054135, "Jamal Brazil Groove", true },
				{ 16553249658, "Mae Stephens - Piano Hands", false },
				{ 10214406616, "Frosty Flair - Tommy Hilfiger", false },
				{ 139021427684680, "KATSEYE - Touch", false },
				{ 4849502101, "Sad", false },
				{ 4102315500, "Haha", false },
				{ 15698511500, "Cuco - Levitate", false },
				{ 106708015414624, "Endless Aura Floating", false },
				{ 3762654854, "Greatest", false },
				{ 98603994713783, "Rat Dance", false },
				{ 15554010118, "Olivia Rodrigo Head Bop", false },
				{ 93511411593120, "/e fly", false },
				{ 105381637724646, "🎃Pumpkin King👑", false },
				{ 71302743123422, "Popular", false },
				{ 88425531063616, "Stylish Floating", false },
				{ 104142334418357, "[BEST] It's Gangnam Style!", false },
				{ 4049646104, "Line Dance", false },
				{ 120642514156293, "Secret Handshake Dance", false },
				{ 111378664166805, "Moonwalk", true },
				{ 80963950541052, "hip sway", false },
				{ 7202898984, "Show Dem Wrists - KSI", false },
				{ 5938394742, "Old Town Road Dance - Lil Nas X (LNX)", false },
				{ 74716792202343, "🕷️ Hornet's Spider Dance 🕷️", false },
				{ 4940592718, "Confused", false },
				{ 15679955281, "Festive Dance", false },
				{ 115203580644128, "⚡ Raiden Punching Armstrong Loop", false },
				{ 79312439851071, "Chappell Roan HOT TO GO!", false },
				{ 3762641826, "Side to Side", false },
				{ 5230615437, "Beckon", false },
				{ 130371895389423, "[BEST] Invisiblity", false },
				{ 107282826166809, "Basketball Head", false },
				{ 79017619155911, "Wall Phase (GLITCH)", true },
				{ 125328720114284, "Nervy Dance", true },
				{ 113702736944973, "Yuji Jumping Edit", true },
				{ 4272351660, "Fast Hands", false },
				{ 97164262994588, "Floating in Love 🥰", false },
				{ 16572756230, "HIPMOTION - Amaarae", false },
				{ 78224683906191, "Cute Feet Kicking", false },
				{ 82727664018494, "Lush Life", false },
				{ 5938365243, "Dolphin Dance", false },
				{ 70919402339484, "Scuba Nick Wilde", true },
				{ 95325218641213, "Psycho Teddy", true },
				{ 15506503658, "Victory Dance", false },
				{ 4940602656, "Jumping Wave", false },
				{ 108635834286627, "Spiderman Hang", false },
				{ 5915773992, "Break Dance", false },
				{ 3934986896, "Dizzy", false },
				{ 136648387080677, "DARE - Gorillaz", false },
				{ 111426928948833, "Floating on clouds", false },
				{ 127764273000599, "Dropkick", false },
				{ 137234266130963, "MJ - P.Y.T. Pretty Young Thing", false },
				{ 17746270218, "Sturdy Dance - Ice Spice", false },
				{ 3716633898, "Twirl", false },
				{ 129149402922241, "griddy", false },
				{ 94064805002669, "Cute Kawaii Posing >-<", false },
				{ 139058906415119, "Floating", false },
				{ 94292601332790, ";invisible me", false },
				{ 4212496830, "Zombie", false },
				{ 75911227509248, "Ghost Floating", false },
				{ 79127989560307, "Moon Walk", false },
				{ 89157328525577, "silly jumping spider dance", false },
				{ 5938396308, "HOLIDAY Dance - Lil Nas X (LNX)", false },
				{ 120904242187887, "🤣 GOOFY FLAP FLY ANIME - FUNNY MEME", true },
				{ 107708114415320, "Big Guy - 🔥 Ice Spice x Spongebob", false },
				{ 132367660388476, "SHAKE", false },
				{ 14353417553, "Baby Queen - Air Guitar & Knee Slide", false },
				{ 138515241510970, "Cute kawaii girly idle Profile pose", false },
				{ 76261461321661, "★ curiously cute sitting pose", false },
				{ 4391208058, "Shuffle", false },
				{ 88859617281337, "WOOF BARK WOOF", false },
				{ 10370922566, "Sidekicks - George Ezra", false },
				{ 103040723950430, "Gojo Floating JJK/ The Honored One", false },
				{ 82995540773684, "Tornado", false },
				{ 3994130516, "Bodybuilder", false },
				{ 13823339506, "Tommy - Archer", false },
				{ 4849487550, "Agree", false },
				{ 79216795769647, "Tall Scary Creature", false },
				{ 83917238288783, "cute dancy dance", true },
				{ 122147154162464, "Hakari Dance", false },
				{ 118853736905967, "Wall Aura Farm Pose", false },
				{ 4849497510, "Power Blast", false },
				{ 15123050663, "Bone Chillin' Bop", false },
				{ 103102322875221, "Skibidi Toilet - Titan Speakerman Laser Spin", false },
				{ 133685484220846, "KATSEYE - GNARLY", false },
				{ 117119421748582, "Jamal Brazil Groove", true },
				{ 111539333518905, "Needy V sit Split Drop (OG) 🔮", true },
				{ 72947568152049, "Cute Sit", false },
				{ 14353419229, "Baby Queen - Dramatic Bow", false },
				{ 3576745472, "Fashionable", false },
				{ 106370760824973, "Possessed Glitcher", false },
				{ 98388724133440, "[OG] i got that feeling 💌", true },
				{ 122740406985544, "Fly Aura pose", true },
				{ 80573839869810, "Kneeling Sit", true },
				{ 89360359553814, "Sunflower", true },
				{ 73181508272121, "Party Funk", true },
				{ 73049975726252, "Yeah, Im Listening...", true },
				{ 121621458064078, "Wish Nle Choppa", true },
				{ 123838228516868, "[Limited] Cute Crying Beg Kneeling", true },
				{ 126941778232900, "♡ kawaii sit emote with cat paws", true },
				{ 116416944161215, "♡ kawaii schoolgirl sitting pose", true },
				{ 76598468338330, "Fall From The Sky", true },
				{ 88456688900525, "Reanimated 🎃", true },
				{ 77080714986256, "Moving Like Berney", true },
				{ 77016426916262, "Rich Girl Flowside", true },
				{ 108039409530319, "Runway Victoria Fashion Model", true },
				{ 137636136946673, "Tubo Dance", true },
				{ 87433588393157, "Cute Bouncy Side Sway", true },
				{ 131145074585836, "Viltrum Hovering Aura Farm (Invincible)", true },
				{ 82831170082875, "Stopframe: Puppet Panic", true },
				{ 98094482524931, "Met my match [Say Now]", true },
				{ 96059912242002, "Them Hips", true },
				{ 79087653980931, "Master Lord Verity Setalcix", true },
				{ 73710784930636, "Cry for Me - [TREND] IronMouse", true },
				{ 121132556900708, "Floating Aura", true },
				{ 99246819283563, "Goofball Griddy [MOCAP]", true },
				{ 128814921948602, "Super Funk Dance", true },
				{ 104751376138396, "Worm Infinite Roll", true },
				{ 87636335269696, "Consegue dançar igual ?", true },
				{ 121793928888678, "cute bratty whiny adorable girl sit pose", true },
				{ 83161594745131, "⏳[BEST] I'M A DEMON WITH THIS 😈", true },
				{ 90418129403506, "Relaxed Cloud Floating", true },
				{ 86938925857615, "Superhero Pose", true },
				{ 90923883214225, "Master Of Humanity!", true },
				{ 122249198697121, "Nameless monster dance", true },
				{ 140461713742908, "He Pedals Funk Emote", true },
				{ 76618267763261, "𑣲 KISS N TELL - AESPA", true },
				{ 93647110985355, "Scuba [FULL VERSION]", true },
				{ 73148982402007, "Fake Running Disconnect lag", true },
				{ 82966937735800, "I got that feeling trend", true },
				{ 90121297911534, "Jeyke Funk", true },
				{ 98840627727488, "Peaches - Justin Bieber", true },
				{ 126178027638785, "Tinashe - Nasty Girl", true },
				{ 98049374819131, "Diego - Jojo Anime Pose", true },
				{ 114800420888775, "Pennywise Dance 👹🤡", true },
				{ 135157485603506, "[⭐] Scubaa Scubaa", true },
				{ 105765738022096, "♡ : Cutesy standing doll pose", true },
				{ 131171992525098, "One Arm Push Ups", true },
				{ 101582120044688, "sweet puppy girl kicking leg profile pose", true },
				{ 81708325562195, "Cute Needy Happy Shake Dance", true },
				{ 105201400407575, "Cute Happy Bouncy Jumps Dance", true },
				{ 81346143283632, "needy kawaii puppy sitting profile pose", true },
				{ 71819053016074, "[BEST] i got that feeling MM2", true },
				{ 116521788694479, "🔥 The Bass Trend", true },
				{ 73757246494324, "Werewolf Alpha Transformation - Halloween", true },
				{ 126498185656790, "Happy Bounce", true },
				{ 78623311762574, "WestPole Emote [OG]", true },
				{ 97926971484337, "12 to 12 [PERFECT]", true },
				{ 96403455275692, "Trend Dance of Lord Verity", true },
				{ 94724645460262, "The worm move", true },
				{ 128779345795509, "Alien goofy wave✨", true },
				{ 97052459488169, "Feeling myself emote", true },
				{ 120918501233808, "Funy tubo dance", true },
				{ 134942500171655, "Pathetic Cat (Furry)", true },
				{ 129965107667269, "Lagui pose", true },
				{ 93072647185531, "🔥 Dorobo Dance [V2]", true },
				{ 103722701410933, "Brazilian Dance Viral Trend", true },
				{ 110569633730333, "Lord Verity dance! (Emote)", true },
				{ 88160454118928, "[BEST] Salsa", true },
				{ 123604753182408, "ADELA - Nicole Kidman", true },
				{ 110059706944899, "im a demon with this nh (balenci balenci) Dance", true },
				{ 140594655288573, "Mangarap Dance", true },
				{ 91914407217006, "The Bass Trend V2", true },
				{ 90960483742655, "MM2 fake death pose (unique)", true },
				{ 139324301384120, "Cute anime girl pose (cute)", true },
				{ 117343790961625, "BLACKPINK ROSÉ - On The Ground", true },
				{ 128860586829249, "anime dance", true },
				{ 119998025796052, "Super Needy Jiggly Shake Dance", true },
				{ 89733893354683, "Cute Bouncy Shake Dance", true },
				{ 102174264026632, "GG Animation", true },
				{ 86375122997153, "still idle", true },
				{ 112654855034352, "Green Lantern Aura Pose", true },
				{ 132600795042399, "Bby Wow trend", true },
				{ 73193222304259, "Jamal Dance 3.0", true },
				{ 87663078346140, "Halloween Vampire ´ཀ` Zombie ҂ Coffin Crawl Pose", true },
				{ 99311131968819, "Stopframe: Sneaky Shuffle", true },
				{ 138127306398554, "Confident Flying Aura Farming", true },
				{ 106724593413222, "Cutsey Flying Aura 💕", true },
				{ 122901201145982, "Emo Floating Aura", true },
				{ 132697034165623, "🤡💀 Murder Mystery 2 OOF 💀🤡", true },
				{ 108435804337942, "Murder Mystery 2 💀👹🥹🤡", true },
				{ 109436261994235, "Shy Vampire", true },
				{ 100120361806075, "MM2 💀🤡", true },
				{ 94897348118820, "MM2 💀😭😵🤡", true },
				{ 104120919345158, "♡ cute halloween headless holding your head pose", true },
				{ 96021230764442, "[OG] Milwaukee Bounce", true },
				{ 116215733070133, "Just Wanna Rock (Lil Uzi Vert)", true },
				{ 125450302010193, "💀 L Dance", true },
				{ 108395206588249, "💀mm2 fake side lay", true },
				{ 91339094607949, "Ballerina Spin", true },
				{ 91341416163208, "Cute Sitting", true },
				{ 82555721533394, "Choo Choo TRAIN", true },
				{ 117498793976482, "Snowman Dance - Left", true },
				{ 123032739590624, "Snowman Dance - Right", true },
				{ 83190195248548, "Boredom", true },
				{ 106393319667237, "\"Don't Stop Til' You Get Enough\" Music Video Intro", true },
				{ 79729995051649, "Chedder Bbq Wavy Sour Cream and Onion /Trend Dance", true },
				{ 111937410622410, "Balance balance", true },
				{ 126198554443561, "I had a hunch", true },
				{ 110870173502552, "ghostly possession, pose, aura", true },
				{ 133537618008799, "Toxic Laugh", true },
				{ 71555837867329, "NPC Greeting", true },
				{ 80160023079097, "[Mini Me] Gangnam Style", true },
				{ 80069514148007, "Vezna Idle Animation", true },
				{ 113267287854914, "cute kawaii sit", true },
				{ 119535274797446, "Press F to inspect", true },
				{ 76934438548184, "Kangaroo Dance King Aura", true },
				{ 138032573559043, "Orange Caramel Chaewon Catallena Dance", true },
				{ 95654893473488, "Passinho do Jamal 🇧🇷 Mandrake", true },
				{ 99399545142101, "Headless Swap", true },
				{ 99576158170768, "Everybody - Backstreet Boys", true },
			}
			local HttpService = game:GetService("HttpService")
			local AvatarEditorService = game:GetService("AvatarEditorService")
			local green = Color3.fromRGB(104, 222, 92)
			local cardColor = Color3.fromRGB(36, 36, 38)
			local cardHover = Color3.fromRGB(48, 48, 52)
			local footerColor = Color3.fromRGB(17, 17, 19)
			local slotOrder = { "idle", "walk", "run", "jump", "fall", "climb", "swim" }
			local validSlots = {
				idle = true,
				walk = true,
				run = true,
				jump = true,
				fall = true,
				climb = true,
				swim = true,
				swimidle = true,
			}
			local assetSlot = {
				IdleAnimation = 1,
				WalkAnimation = 2,
				RunAnimation = 3,
				JumpAnimation = 4,
				FallAnimation = 5,
				ClimbAnimation = 6,
				SwimAnimation = 7,
			}

			local function idStr(id)
				return string.format("%.0f", id)
			end

			local function normName(s)
				s = s:lower():gsub("animations?", ""):gsub("package", ""):gsub("pack", ""):gsub("[^%w]", "")
				return s
			end

			local classicByName = {}
			for _, cat in ipairs(animPacks) do
				for _, p in ipairs(cat[2]) do
					classicByName[normName(p[1])] = p
				end
			end

			local function classicSlots(p)
				local function wrap(v)
					return v and v ~= 0 and { "rbxassetid://" .. idStr(v) } or nil
				end

				local idle2 = p[3] and p[3] ~= 0 and p[3] or p[2]
				return {
					idle = { "rbxassetid://" .. idStr(p[2]), "rbxassetid://" .. idStr(idle2) },
					walk = wrap(p[4]),
					run = wrap(p[5]),
					jump = wrap(p[6]),
					fall = wrap(p[7]),
					climb = wrap(p[8]),
					swim = wrap(p[9]),
					swimidle = wrap(p[10]),
				}
			end

			local function bundleAssets(items)
				local a = { 0, 0, 0, 0, 0, 0, 0 }
				for _, item in ipairs(items or {}) do
					local k = assetSlot[tostring(item.AssetType or "")]
					if not k and item.Name then
						local n = item.Name:lower()
						for i, s in ipairs(slotOrder) do
							if n:find(s, 1, true) then
								k = i
								break
							end
						end
					end
					if k and (item.Type == nil or item.Type == "Asset") then
						a[k] = item.Id
					end
				end
				return a
			end

			local bundleList, bundleById = {}, {}

			local function addBundle(id, name, cache, isNew, at)
				local b = bundleById[id]
				if b then
					if isNew then
						b.new = true
					end
					return b, false
				end
				b = { id = id, name = name, assets = cache, new = isNew, kind = "b" }
				bundleById[id] = b
				if at then
					table.insert(bundleList, at, b)
				else
					table.insert(bundleList, b)
				end
				return b, true
			end

			for _, r in ipairs(bundles) do
				addBundle(r[1], r[2], { r[3], r[4], r[5], r[6], r[7], r[8], r[9] }, false)
			end
			for _, r in ipairs(newBundles) do
				addBundle(r[1], r[2], { r[3], r[4], r[5], r[6], r[7], r[8], r[9] }, true)
			end
			local emoteList, emoteById = {}, {}
			for _, r in ipairs(emotes) do
				local e = { id = r[1], name = r[2], new = r[3], kind = "e" }
				table.insert(emoteList, e)
				emoteById[r[1]] = e
			end
			local favs = {}

			local function favKey(item)
				return item.kind .. idStr(item.id)
			end

			pcall(function()
				if isfile and readfile and isfile("rockhub_favs.json") then
					for _, f in ipairs(HttpService:JSONDecode(readfile("rockhub_favs.json"))) do
						local item = { kind = f.kind, id = tonumber(f.id), name = f.name }
						if f.assets then
							item.assets = {}
							for i, v in ipairs(f.assets) do
								item.assets[i] = tonumber(v) or 0
							end
						end
						if item.id then
							favs[favKey(item)] = item
						end
					end
				end
			end)

			local function saveFavs()
				if not writefile then
					return
				end
				local rows = {}
				for _, item in pairs(favs) do
					local f = { kind = item.kind, id = idStr(item.id), name = item.name }
					if item.assets then
						f.assets = {}
						for i, v in ipairs(item.assets) do
							f.assets[i] = idStr(v)
						end
					end
					table.insert(rows, f)
				end
				pcall(writefile, "rockhub_favs.json", HttpService:JSONEncode(rows))
			end

			local function favList()
				local out = {}
				for _, f in pairs(favs) do
					local item = f.kind == "b" and bundleById[f.id] or f.kind == "e" and emoteById[f.id] or f
					table.insert(out, item)
				end
				table.sort(out, function(a, b)
					return a.name:lower() < b.name:lower()
				end)
				return out
			end

			local animCache = {}

			local function loadAnims(assetId)
				if animCache[assetId] then
					return animCache[assetId]
				end
				local ok, objs = pcall(function()
					return game:GetObjects("rbxassetid://" .. idStr(assetId))
				end)
				if not ok or type(objs) ~= "table" then
					return {}
				end
				local anims = {}
				for _, o in ipairs(objs) do
					local list = o:GetDescendants()
					table.insert(list, 1, o)
					for _, a in ipairs(list) do
						if a:IsA("Animation") and a.AnimationId ~= "" then
							table.insert(anims, { slot = a.Parent and a.Parent.Name:lower() or "", name = a.Name, id = a.AnimationId })
						end
					end
				end
				table.sort(anims, function(x, y)
					return x.name < y.name
				end)
				animCache[assetId] = anims
				return anims
			end

			local slotCache = {}

			local function getSlots(b)
				if slotCache[b.id] then
					return slotCache[b.id]
				end
				local k = classicByName[normName(b.name)]
				if k then
					slotCache[b.id] = classicSlots(k)
					return slotCache[b.id]
				end
				local slots, any = {}, false
				for i, asset in ipairs(b.assets or {}) do
					if asset and asset ~= 0 then
						for _, a in ipairs(loadAnims(asset)) do
							local s = validSlots[a.slot] and a.slot or slotOrder[i]
							slots[s] = slots[s] or {}
							table.insert(slots[s], a.id)
							any = true
						end
					end
				end
				if any then
					slotCache[b.id] = slots
					return slots
				end
			end

			local origAnims, currentTab2 = nil, nil
			local function updateActive() end

			local function getAnimate()
				local c = player.Character
				return c and c:FindFirstChild("Animate")
			end

			local function sortedAnims(folder)
				local t = {}
				for _, a in ipairs(folder:GetChildren()) do
					if a:IsA("Animation") then
						table.insert(t, a)
					end
				end
				table.sort(t, function(x, y)
					return x.Name < y.Name
				end)
				return t
			end

			local function backupAnims(animate)
				if origAnims then
					return
				end
				origAnims = {}
				for _, folder in ipairs(animate:GetChildren()) do
					if validSlots[folder.Name:lower()] then
						for _, a in ipairs(sortedAnims(folder)) do
							origAnims[a] = a.AnimationId
						end
					end
				end
			end

			local function restartAnimate()
				local animate, hum = getAnimate(), getHumanoid()
				if not animate or not hum then
					return
				end
				animate.Disabled = true
				for _, tr in ipairs(hum:GetPlayingAnimationTracks()) do
					tr:Stop(0)
				end
				animate.Disabled = false
			end

			local function applySlots(slots)
				local animate = getAnimate()
				if not animate then
					return false
				end
				backupAnims(animate)
				for _, folder in ipairs(animate:GetChildren()) do
					local ids = slots[folder.Name:lower()]
					if ids and #ids > 0 then
						for i, a in ipairs(sortedAnims(folder)) do
							a.AnimationId = ids[i] or ids[1]
						end
					end
				end
				restartAnimate()
				return true
			end

			local function savePack(b)
				config["Free anims/pack"] = b and { kind = "b", id = b.id, name = b.name, assets = b.assets } or nil
				dirty, dirtyAt = true, os.clock()
			end

			local function resetAnims()
				currentTab2 = nil
				savePack(nil)
				if origAnims then
					for a, id in pairs(origAnims) do
						if a.Parent then
							a.AnimationId = id
						end
					end
					restartAnimate()
				end
				updateActive()
			end

			local busy = false

			local function applyPack(b)
				if busy then
					return
				end
				busy = true
				task.spawn(function()
					if not slotCache[b.id] and not classicByName[normName(b.name)] then
						notify("Loading", b.name)
					end
					local slots = getSlots(b)
					busy = false
					if not slots then
						notify("Free anims", "can't load pack (no GetObjects in executor)")
						return
					end
					local hum = getHumanoid()
					if hum and hum.RigType == Enum.HumanoidRigType.R6 and not b.name:find("R6") then
						notify("R6 avatar", "most packs are made for R15")
					end
					if applySlots(slots) then
						currentTab2 = { id = b.id, slots = slots }
						savePack(b)
						notify("Animation pack", b.name)
						updateActive()
					end
				end)
			end

			local emoteTrack
			local emoteAnims = {}

			local function stopEmote()
				if emoteTrack then
					pcall(function()
						emoteTrack:Stop(0.2)
					end)
					emoteTrack = nil
				end
			end

			local function playEmote(e)
				local hum = getHumanoid()
				if not hum then
					return
				end
				task.spawn(function()
					local menuSeq2 = emoteAnims[e.id]
					if not menuSeq2 then
						local list = loadAnims(e.id)
						menuSeq2 = list[1] and list[1].id
						emoteAnims[e.id] = menuSeq2
					end
					stopEmote()
					if menuSeq2 then
						local anim = Instance.new("Animation")
						anim.AnimationId = menuSeq2
						local animator = hum:FindFirstChildOfClass("Animator") or hum
						local ok, tr = pcall(function()
							return animator:LoadAnimation(anim)
						end)
						if ok and tr then
							tr.Priority = Enum.AnimationPriority.Action
							tr.Looped = true
							tr:Play(0.2)
							emoteTrack = tr
							notify("Emote", e.name)
							return
						end
					end
					local ok, _, tr = pcall(function()
						return hum:PlayEmoteAndGetAnimTrackById(e.id)
					end)
					if ok and tr then
						emoteTrack = tr
						notify("Emote", e.name)
					else
						notify("Free anims", "can't play: " .. e.name)
					end
				end)
			end

			connect(RunService.Heartbeat, function()
				if emoteTrack then
					local hum = getHumanoid()
					if hum and hum.MoveDirection.Magnitude > 0.1 then
						stopEmote()
					end
				end
			end)

			stopAnims = function()
				stopEmote()
				resetAnims()
			end
			register("Free anims/pack", function(v)
				if type(v) == "table" and v.id then
					task.spawn(function()
						local char = player.Character or player.CharacterAdded:Wait()
						char:WaitForChild("Animate", 10)
						task.wait(0.5)
						if config["Free anims/pack"] == v and not currentTab2 then
							applyPack(v)
						end
					end)
				elseif v == false then
					resetAnims()
				end
			end, function()
				return config["Free anims/pack"] or false
			end, false)

			connect(player.CharacterAdded, function(char)
				origAnims = nil
				emoteTrack = nil
				if not currentTab2 then
					return
				end
				char:WaitForChild("Animate", 10)
				task.wait(0.3)
				applySlots(currentTab2.slots)
			end)
			local page = animsTab.page
			animsTab.custom = true
			animsTab.title.Visible = false
			animsTab.desc.Visible = false
			page.ScrollingEnabled = false
			page.ScrollBarThickness = 0
			page.CanvasSize = UDim2.new()
			local mode = "Bundles"
			local filter = "All"
			local query = ""
			local lookup
			local refresh
			local bar = create("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 3, Parent = page })
			local tabs2, tabX = {}, 0
			for _, sub in ipairs({ "Bundles", "Emotes", "Favs" }) do
				local on = sub == mode
				local w = TextService:GetTextSize(sub, 13, Enum.Font.GothamMedium, Vector2.new(200, 40)).X + 34
				local b = create("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(90, 90, 90),
					BackgroundTransparency = on and 0.35 or 0.85,
					Position = UDim2.fromOffset(tabX, 0),
					Size = UDim2.fromOffset(w, 30),
					ZIndex = 3,
					Parent = bar,
				})
				addCorner(b, 9)
				local d = create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0, 13, 0.5, 0),
					Size = UDim2.fromOffset(on and 6 or 0, on and 6 or 0),
					BackgroundColor3 = accentColor,
					BorderSizePixel = 0,
					ZIndex = 4,
					Parent = b,
				})
				makeRound(d)
				local l = create("TextLabel", {
					Text = sub,
					Font = Enum.Font.GothamMedium,
					TextSize = 13,
					TextColor3 = on and accentColor or dimColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(on and 22 or 17, 0),
					Size = UDim2.new(1, -22, 1, 0),
					ZIndex = 4,
					Parent = b,
				})
				tabs2[sub] = { b = b, dot = d, lbl = l }
				tabX += w + 4
			end

			local function searchBox(parent, pos, size, placeholder, withIcon)
				local f = create("Frame", {
					Position = pos,
					Size = size,
					BackgroundColor3 = Color3.fromRGB(22, 22, 22),
					ZIndex = 3,
					Parent = parent,
				})
				addCorner(f, 9)
				local st = addStroke(f)
				local left = 12
				if withIcon then
					local icon = create("Frame", {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 10, 0.5, 0),
						Size = UDim2.fromOffset(12, 12),
						BackgroundTransparency = 1,
						ZIndex = 4,
						Parent = f,
					})
					local ring = create("Frame", { Size = UDim2.fromOffset(8, 8), BackgroundTransparency = 1, ZIndex = 4, Parent = icon })
					makeRound(ring)
					create("UIStroke", { Color = dimColor, Thickness = 1.6, Parent = ring })
					line(icon, 7, 7, 11, 11, 1.6).ZIndex = 4
					left = 30
				end
				local box = create("TextBox", {
					Text = "",
					PlaceholderText = placeholder,
					PlaceholderColor3 = mutedColor,
					Font = Enum.Font.Gotham,
					TextSize = 12,
					TextColor3 = accentColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ClearTextOnFocus = false,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(left, 0),
					Size = UDim2.new(1, -left - 8, 1, 0),
					ZIndex = 4,
					Parent = f,
				})
				connect(box.Focused, function()
					tween(st, 0.2, { Color = Color3.fromRGB(120, 120, 120) })
				end)
				connect(box.FocusLost, function()
					tween(st, 0.2, { Color = strokeColor })
				end)
				return box
			end

			local filterBox = searchBox(bar, UDim2.fromOffset(tabX + 6, 0), UDim2.new(1, -(tabX + 6), 0, 30), "Search...", true)
			local lookupBox = searchBox(page, UDim2.fromOffset(0, 38), UDim2.new(1, -72, 0, 34), "Search packs or paste bundle ID / link", false)
			local goBtn = create("TextButton", {
				Text = "Go",
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = Color3.fromRGB(20, 60, 16),
				BackgroundColor3 = green,
				AutoButtonColor = false,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 38),
				Size = UDim2.fromOffset(64, 34),
				ZIndex = 3,
				Parent = page,
			})
			addCorner(goBtn, 9)
			connect(goBtn.MouseEnter, function()
				tween(goBtn, 0.15, { BackgroundColor3 = Color3.fromRGB(130, 240, 118) })
			end)
			connect(goBtn.MouseLeave, function()
				tween(goBtn, 0.15, { BackgroundColor3 = green })
			end)
			local info = create("TextLabel", {
				Text = "",
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = dimColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(2, 80),
				Size = UDim2.new(0.45, 0, 0, 18),
				ZIndex = 3,
				Parent = page,
			})
			local chips = create("Frame", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 79),
				Size = UDim2.new(0.62, 0, 0, 20),
				BackgroundTransparency = 1,
				ZIndex = 3,
				Parent = page,
			})
			create("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = chips,
			})

			local function menuButton2(text, order, on, actionCard, cb)
				local w = TextService:GetTextSize(text, 11, Enum.Font.GothamMedium, Vector2.new(200, 40)).X + 16
				local b = create("TextButton", {
					Text = text,
					Font = Enum.Font.GothamMedium,
					TextSize = 11,
					TextColor3 = (on or actionCard) and accentColor or dimColor,
					BackgroundColor3 = actionCard and elemColor or Color3.fromRGB(90, 90, 90),
					BackgroundTransparency = actionCard and 0 or (on and 0.35 or 1),
					AutoButtonColor = false,
					Size = UDim2.fromOffset(w, 20),
					LayoutOrder = order,
					ZIndex = 4,
					Parent = chips,
				})
				addCorner(b, 6)
				if actionCard then
					addStroke(b)
				end
				connect(b.MouseEnter, function()
					if not on then
						tween(b, 0.15, { TextColor3 = accentColor })
					end
				end)
				connect(b.MouseLeave, function()
					if not on and not actionCard then
						tween(b, 0.15, { TextColor3 = dimColor })
					end
				end)
				connect(b.MouseButton1Click, cb)
			end

			local function rebuildChips()
				for _, c in ipairs(chips:GetChildren()) do
					if c:IsA("GuiButton") then
						c:Destroy()
					end
				end
				local n = 0
				if lookup then
					n += 1
					menuButton2("Back", n, false, true, function()
						lookup = nil
						lookupBox.Text = ""
						refresh()
					end)
				elseif mode ~= "Favs" then
					for _, f in ipairs({ "All", "New 2026", "Popular" }) do
						n += 1
						menuButton2(f, n, filter == f, false, function()
							filter = f
							refresh()
						end)
					end
				end
				if mode ~= "Emotes" then
					n += 1
					menuButton2("Reset", n, false, true, function()
						resetAnims()
						notify("Free anims", "default animations")
					end)
				end
				if mode ~= "Bundles" then
					n += 1
					menuButton2("Stop", n, false, true, function()
						stopEmote()
					end)
				end
			end

			local grid = create("ScrollingFrame", {
				Position = UDim2.fromOffset(0, 104),
				Size = UDim2.new(1, 0, 1, -104),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 3,
				ScrollBarImageColor3 = dimColor,
				ScrollBarImageTransparency = 0.3,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(),
				ZIndex = 2,
				Parent = page,
			})
			create("UIPadding", {
				PaddingTop = UDim.new(0, 1),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 4),
				Parent = grid,
			})
			local layout = create("UIGridLayout", {
				CellSize = UDim2.new(0.3333333333333333, -6, 0, 160),
				CellPadding = UDim2.fromOffset(8, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = grid,
			})
			local emptyLabel = create("TextLabel", {
				Text = "",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = mutedColor,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 144),
				Size = UDim2.new(1, 0, 0, 20),
				ZIndex = 3,
				Parent = page,
			})

			local function updateCanvas()
				grid.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 8)
			end

			connect(layout:GetPropertyChangedSignal("AbsoluteContentSize"), updateCanvas)
			local cards, strokes = {}, {}

			updateActive = function()
				for item, st in pairs(strokes) do
					local on = currentTab2 and item.kind == "b" and currentTab2.id == item.id
					st.Color = on and accentColor or strokeColor
					st.Transparency = on and 0.1 or 0
				end
			end

			local function makeCard(item, order)
				local card = create("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					LayoutOrder = order,
					ZIndex = 2,
					Parent = grid,
				})
				table.insert(cards, card)
				local thumb = create("Frame", { Size = UDim2.new(1, 0, 0, 102), BackgroundColor3 = cardColor, ZIndex = 2, Parent = card })
				addCorner(thumb, 8)
				strokes[item] = addStroke(thumb)
				create("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 4),
					Size = UDim2.fromOffset(84, 84),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = ("rbxthumb://type=%s&id=%s&w=150&h=150"):format(item.kind == "b" and "BundleThumbnail" or "Asset", idStr(item.id)),
					ZIndex = 3,
					Parent = thumb,
				})
				if item.new then
					local badge = create("TextLabel", {
						Text = "NEW 2026",
						Font = Enum.Font.GothamBold,
						TextSize = 9,
						TextColor3 = Color3.fromRGB(10, 10, 10),
						BackgroundColor3 = accentColor,
						Position = UDim2.fromOffset(6, 6),
						Size = UDim2.fromOffset(52, 15),
						ZIndex = 4,
						Parent = thumb,
					})
					addCorner(badge, 5)
				end
				local idBtn = create("TextButton", {
					Text = "ID",
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextColor3 = textColor,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -26, 0, 4),
					Size = UDim2.fromOffset(20, 18),
					ZIndex = 5,
					Parent = thumb,
				})
				connect(idBtn.MouseButton1Click, function()
					if setclipboard then
						setclipboard(idStr(item.id))
						notify("Copied", "ID " .. idStr(item.id))
					else
						notify("ID", idStr(item.id))
					end
				end)
				local favBtn = create("TextButton", {
					Text = favs[favKey(item)] and "★" or "☆",
					Font = Enum.Font.GothamBold,
					TextSize = 14,
					TextColor3 = favs[favKey(item)] and accentColor or dimColor,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -4, 0, 3),
					Size = UDim2.fromOffset(20, 20),
					ZIndex = 5,
					Parent = thumb,
				})
				connect(favBtn.MouseButton1Click, function()
					local key = favKey(item)
					if favs[key] then
						favs[key] = nil
						notify("Favs", "removed " .. item.name)
					else
						favs[key] = { kind = item.kind, id = item.id, name = item.name, assets = item.assets }
						notify("Favs", "added " .. item.name)
					end
					saveFavs()
					favBtn.Text = favs[key] and "★" or "☆"
					favBtn.TextColor3 = favs[key] and accentColor or dimColor
					if mode == "Favs" then
						refresh()
					end
				end)
				local footer = create("Frame", {
					Position = UDim2.fromOffset(0, 108),
					Size = UDim2.new(1, 0, 1, -108),
					BackgroundColor3 = footerColor,
					ZIndex = 2,
					Parent = card,
				})
				addCorner(footer, 8)
				create("TextLabel", {
					Text = item.name:upper(),
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextColor3 = accentColor,
					TextWrapped = true,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(6, 0),
					Size = UDim2.new(1, -12, 1, 0),
					ZIndex = 3,
					Parent = footer,
				})
				connect(card.MouseEnter, function()
					tween(thumb, 0.15, { BackgroundColor3 = cardHover })
				end)
				connect(card.MouseLeave, function()
					tween(thumb, 0.15, { BackgroundColor3 = cardColor })
				end)
				connect(card.MouseButton1Click, function()
					if item.kind == "b" then
						applyPack(item)
					else
						playEmote(item)
					end
				end)
			end

			local list, shown = {}, 0

			local function loadMore()
				local last = math.min(#list, shown + 30)
				for i = shown + 1, last do
					makeCard(list[i], i)
				end
				shown = last
				updateActive()
				updateCanvas()
			end

			connect(grid:GetPropertyChangedSignal("CanvasPosition"), function()
				if shown < #list and grid.CanvasPosition.Y + grid.AbsoluteWindowSize.Y > grid.CanvasSize.Y.Offset - 250 then
					loadMore()
				end
			end)

			local function getItems()
				local src
				if lookup and lookup.mode == mode then
					src = lookup.items
				elseif mode == "Bundles" then
					src = bundleList
				elseif mode == "Emotes" then
					src = emoteList
				else
					src = favList()
				end
				local out = {}
				for _, item in ipairs(src) do
					local pass = lookup or mode == "Favs" or filter == "All" or filter == "New 2026" and item.new or filter == "Popular" and not item.new
					if pass and (query == "" or item.name:lower():find(query, 1, true)) then
						table.insert(out, item)
					end
				end
				return out
			end

			refresh = function()
				for _, c in ipairs(cards) do
					c:Destroy()
				end
				table.clear(cards)
				table.clear(strokes)
				list = getItems()
				shown = 0
				grid.CanvasPosition = Vector2.zero
				loadMore()
				if lookup and lookup.mode == mode then
					info.Text = "Results: " .. #list
				elseif mode == "Bundles" then
					info.Text = "Bundles loaded: " .. #bundleList
				elseif mode == "Emotes" then
					info.Text = "Emotes loaded: " .. #emoteList
				else
					info.Text = "Favorites: " .. #list
				end
				emptyLabel.Text = #list == 0 and (mode == "Favs" and "tap ☆ on any card to add it here" or "nothing found") or ""
				rebuildChips()
			end

			local function setMode(m)
				if m == mode then
					return
				end
				local old = tabs2[mode]
				tween(old.b, 0.25, { BackgroundTransparency = 0.85 })
				tween(old.dot, 0.25, { Size = UDim2.fromOffset(0, 0) })
				tween(old.lbl, 0.25, { TextColor3 = dimColor, Position = UDim2.fromOffset(17, 0) })
				mode = m
				local p = tabs2[m]
				tween(p.b, 0.25, { BackgroundTransparency = 0.35 })
				tween(p.dot, 0.25, { Size = UDim2.fromOffset(6, 6) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				tween(p.lbl, 0.25, { TextColor3 = accentColor, Position = UDim2.fromOffset(22, 0) })
				lookup = nil
				lookupBox.Text = ""
				lookupBox.PlaceholderText = m == "Emotes" and "Search emotes or paste emote ID / link" or "Search packs or paste bundle ID / link"
				refresh()
			end

			for sub, p in pairs(tabs2) do
				connect(p.b.MouseButton1Click, function()
					setMode(sub)
				end)
			end
			connect(filterBox:GetPropertyChangedSignal("Text"), function()
				query = filterBox.Text:lower():gsub("^%s+", ""):gsub("%s+$", "")
				refresh()
			end)

			local function fetchBundle(num)
				if bundleById[num] then
					return bundleById[num]
				end
				local ok, d = pcall(function()
					return AvatarEditorService:GetItemDetailsAsync(num, Enum.AvatarItemType.Bundle)
				end)
				return if ok and d and d.BundledItems then {
					id = num,
					name = d.Name or "Bundle " .. idStr(num),
					assets = bundleAssets(d.BundledItems),
					new = false,
					kind = "b",
				} else if ok and d and d.Items then {
					id = num,
					name = d.Name or "Bundle " .. idStr(num),
					assets = bundleAssets(d.Items),
					new = false,
					kind = "b",
				} else nil
			end

			local searching = false

			local function doSearch()
				local text = lookupBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
				if text == "" then
					lookup = nil
					refresh()
					return
				end
				if searching then
					return
				end
				searching = true
				local m = mode == "Favs" and "Bundles" or mode
				task.spawn(function()
					local num = tonumber(text:match("(%d%d%d%d%d+)"))
					if num then
						if m == "Bundles" then
							local b = fetchBundle(num)
							if b then
								bundleById[num] = bundleById[num] or b
								lookup = { mode = "Bundles", items = { b } }
								if mode ~= "Bundles" then
									setMode("Bundles")
								end
								refresh()
								applyPack(b)
							else
								notify("Free anims", "bundle " .. idStr(num) .. " not found")
							end
						else
							local e = emoteById[num] or { id = num, name = "Emote " .. idStr(num), kind = "e" }
							lookup = { mode = "Emotes", items = { e } }
							refresh()
							playEmote(e)
						end
					else
						info.Text = "Searching..."
						local params = CatalogSearchParams.new()
						params.SearchKeyword = text
						params.Limit = 60
						params.IncludeOffSale = true
						if m == "Emotes" then
							params.AssetTypes = { Enum.AvatarAssetType.EmoteAnimation }
						else
							params.BundleTypes = { Enum.BundleType.Animations }
						end
						local ok, content2 = pcall(function()
							return AvatarEditorService:SearchCatalogAsync(params)
						end)
						if ok and content2 then
							local items = {}
							for _, r in ipairs(content2:GetCurrentPage()) do
								if m == "Emotes" then
									table.insert(items, emoteById[r.Id] or { id = r.Id, name = r.Name, kind = "e" })
								else
									local b = bundleById[r.Id]
									if not b then
										b = { id = r.Id, name = r.Name, assets = bundleAssets(r.BundledItems), new = false, kind = "b" }
										bundleById[r.Id] = b
									end
									table.insert(items, b)
								end
							end
							lookup = { mode = m, items = items }
							if mode ~= m then
								setMode(m)
							end
							refresh()
						else
							lookup = nil
							filterBox.Text = text
							notify("Search", "catalog offline, filtered local list")
						end
					end
					searching = false
				end)
			end

			connect(goBtn.MouseButton1Click, doSearch)
			connect(lookupBox.FocusLost, function(enter)
				if enter then
					doSearch()
				end
			end)
			refresh()
			task.spawn(function()
				local function loadAsset(setup)
					local params = CatalogSearchParams.new()
					params.SortType = Enum.CatalogSortType.RecentlyCreated
					params.Limit = 120
					setup(params)
					local ok, content2 = pcall(function()
						return AvatarEditorService:SearchCatalogAsync(params)
					end)
					return ok and content2 and content2:GetCurrentPage() or {}
				end

				local at
				for i, b in ipairs(bundleList) do
					if b.new then
						at = i
						break
					end
				end
				at = at or #bundleList + 1
				local newBundles2 = 0
				for _, r in ipairs(loadAsset(function(p)
					p.BundleTypes = { Enum.BundleType.Animations }
				end)) do
					local _, added = addBundle(r.Id, r.Name, bundleAssets(r.BundledItems), true, at)
					if added then
						at += 1
						newBundles2 += 1
					end
				end
				local newEmotes, pos = 0, 1
				for _, r in ipairs(loadAsset(function(p)
					p.AssetTypes = { Enum.AvatarAssetType.EmoteAnimation }
				end)) do
					if not emoteById[r.Id] then
						local e = { id = r.Id, name = r.Name, new = true, kind = "e" }
						emoteById[r.Id] = e
						table.insert(emoteList, pos, e)
						pos += 1
						newEmotes += 1
					end
				end
				if newBundles2 + newEmotes > 0 then
					if not lookup and grid.CanvasPosition.Y < 5 then
						refresh()
					else
						info.Text = mode == "Emotes" and "Emotes loaded: " .. #emoteList or mode == "Bundles" and "Bundles loaded: " .. #bundleList or info.Text
					end
				end
			end)
		end
		do
			local backtrack = {
				on = false,
				target = "Others",
				style = "Ghost",
				color = "Shimmer",
				custom = Color3.fromHSV(0.999, 0.746, 0.737),
				material = "ForceField",
				outline = true,
				marker = true,
				delay = 400,
				count = 4,
				dist = 150,
				opacity = 70,
			}
			local materials = { ForceField = Enum.Material.ForceField, Neon = Enum.Material.Neon, Glass = Enum.Material.Glass }
			local red = Color3.fromRGB(255, 58, 58)
			local blue = Color3.fromRGB(64, 150, 255)
			local farCf = CFrame.new(0, -50000, 0)
			local gradients2 = {
				Aqua = { Color3.fromRGB(90, 230, 255), Color3.fromRGB(150, 95, 255) },
				Sunset = { Color3.fromRGB(255, 170, 80), Color3.fromRGB(255, 60, 150) },
			}
			local folder
			local data = {}
			local lastRecord = 0

			local function removeRecord(p)
				local d = data[p]
				if d then
					if d.folder then
						d.folder:Destroy()
					end
					for _, o in ipairs(d.extra or {}) do
						o:Destroy()
					end
				end
				data[p] = nil
			end

			local function clearAll()
				for p in pairs(data) do
					removeRecord(p)
				end
				if folder then
					folder:Destroy()
				end
				folder = nil
			end

			local function isTarget(p)
				if backtrack.target == "Self" then
					return p == player
				end
				if backtrack.target == "Others" then
					return p ~= player
				end
				return true
			end

			local function setup(g, mat)
				g.Anchored = true
				g.CanCollide = false
				g.CanTouch = false
				g.CanQuery = false
				g.CastShadow = false
				g.Material = mat or materials[backtrack.material] or Enum.Material.ForceField
				g.Transparency = 1
				g.CFrame = farCf
				return g
			end

			local function makeGhostPart(src, parent)
				local ok, g = pcall(function()
					return src:Clone()
				end)
				if not ok or not g then
					g = Instance.new("Part")
					g.Size = src.Size
				end
				for _, c in ipairs(g:GetChildren()) do
					if not c:IsA("DataModelMesh") then
						c:Destroy()
					end
				end
				pcall(function()
					g.TextureID = ""
				end)
				setup(g)
				g.Parent = parent
				return g
			end

			local function roleColor(p)
				local char, backpack = p.Character, p:FindFirstChildOfClass("Backpack")

				local function has(n)
					return char and char:FindFirstChild(n) or backpack and backpack:FindFirstChild(n)
				end

				if has("Knife") then
					return red
				end
				if has("Gun") then
					return blue
				end
			end

			local function ghostColor(d, f, t)
				local colorMode = if backtrack.color == "Rainbow" then 46109 else if backtrack.color == "White" then 39828 else if backtrack.color == "Role" then 5129 else if backtrack.color == "Custom" then 11958 else 31519
				if colorMode == 11958 then
					local wave = 0.5 + 0.5 * math.sin(t * 3 - f * 5)
					return backtrack.custom:Lerp(Color3.new(0, 0, 0), f * 0.45):Lerp(accentColor, wave * 0.18)
				elseif colorMode == 39828 then
					return accentColor
				elseif colorMode == 46109 then
					return Color3.fromHSV((t * 0.25 + f * 0.6) % 1, 0.6, 1)
				elseif colorMode == 5129 then
					return d.role or accentColor
				end
				local grad = gradients2[backtrack.color]
				if grad then
					local k = math.clamp(f + 0.15 * math.sin(t * 2.5 - f * 4), 0, 1)
					return grad[1]:Lerp(grad[2], k)
				end
				local v = 0.5 + 0.5 * math.sin(t * 3 - f * 5)
				local c = math.floor(90 + v * 165)
				return Color3.fromRGB(c, c, c)
			end

			local function key()
				return backtrack.style .. backtrack.count .. backtrack.material .. tostring(backtrack.outline) .. tostring(backtrack.marker)
			end

			local function build(p, char)
				local d = {
					char = char,
					key = key(),
					hist = {},
					ghosts = {},
					parts = {},
					extra = {},
					vis = 0,
					folder = create("Model", { Name = p.Name, Parent = folder }),
				}
				for _, part in ipairs(char:GetChildren()) do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						table.insert(d.parts, part)
					end
				end
				if backtrack.style == "Trail" then
					local hrp = char:FindFirstChild("HumanoidRootPart")

					local function trail(topBar2, bottom, emission)
						local a0 = create("Attachment", { Name = "RockHubTrailA", Position = Vector3.new(0, topBar2, 0), Parent = hrp })
						local a1 = create("Attachment", { Name = "RockHubTrailB", Position = Vector3.new(0, bottom, 0), Parent = hrp })
						local tr = create("Trail", {
							Name = "RockHubTrail",
							Attachment0 = a0,
							Attachment1 = a1,
							FaceCamera = false,
							LightEmission = emission,
							LightInfluence = 0,
							MinLength = 0.05,
							Lifetime = backtrack.delay / 1000,
							Parent = hrp,
						})
						table.insert(d.extra, a0)
						table.insert(d.extra, a1)
						table.insert(d.extra, tr)
						return tr
					end

					if hrp then
						d.trail = trail(2.1, -2.8, 0.35)
						d.core = trail(0.12, -0.12, 1)
					end
				else
					for i = 1, backtrack.count do
						local g = { vis = 0 }
						if backtrack.style == "Ghost" then
							g.map = {}
							for _, src in ipairs(d.parts) do
								g.map[src] = makeGhostPart(src, d.folder)
							end
						else
							g.dot = setup(Instance.new("Part"))
							g.dot.Shape = Enum.PartType.Ball
							g.dot.Parent = d.folder
							g.link = setup(Instance.new("Part"))
							g.link.Parent = d.folder
						end
						d.ghosts[i] = g
					end
					if backtrack.outline then
						d.hl = create("Highlight", {
							Adornee = d.folder,
							DepthMode = Enum.HighlightDepthMode.Occluded,
							FillTransparency = 1,
							OutlineTransparency = 1,
							Parent = d.folder,
						})
					end
				end
				if backtrack.marker then
					d.ring = setup(Instance.new("Part"), Enum.Material.Neon)
					d.ring.Shape = Enum.PartType.Cylinder
					d.ring.Size = Vector3.new(0.06, 3.6, 3.6)
					d.ring.Parent = folder
					table.insert(d.extra, d.ring)
					d.disc = setup(Instance.new("Part"), Enum.Material.ForceField)
					d.disc.Shape = Enum.PartType.Cylinder
					d.disc.Size = Vector3.new(0.1, 3.2, 3.2)
					d.disc.Parent = folder
					table.insert(d.extra, d.disc)
				end
				data[p] = d
				return d
			end

			local function sample(hist, want)
				local n = #hist
				if n == 0 then
					return
				end
				if want <= hist[1].t then
					return hist[1], hist[1], 0
				end
				for i = n, 2, -1 do
					local a, b = hist[i - 1], hist[i]
					if a.t <= want then
						local k = math.clamp((want - a.t) / math.max(b.t - a.t, 0.001), 0, 1)
						return a, b, k
					end
				end
				return hist[n], hist[n], 0
			end

			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			connect(RunService.Heartbeat, function(dt)
				if not backtrack.on then
					return
				end
				local now = os.clock()
				local cam = workspace.CurrentCamera
				if not cam then
					return
				end
				if not folder or not folder.Parent then
					folder = create("Folder", { Name = "RockHubBackTrack", Parent = cam })
				end
				local doRecord = now - lastRecord >= 0.03
				if doRecord then
					lastRecord = now
				end
				local delaySec = backtrack.delay / 1000
				local camPos = cam.CFrame.Position
				local smooth = math.min(dt * 8, 1)
				local baseTransp = 1 - backtrack.opacity / 100
				for _, p in ipairs(Players:GetPlayers()) do
					local char = p.Character
					local hrp = char and char:FindFirstChild("HumanoidRootPart")
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					local d = data[p]
					if not isTarget(p) or not hrp or not hum or hum.Health <= 0 then
						if d then
							removeRecord(p)
						end
						continue
					end
					if not d or d.char ~= char or d.key ~= key() then
						removeRecord(p)
						d = build(p, char)
					end
					if doRecord then
						local snap = { t = now, root = hrp.CFrame }
						if backtrack.style == "Ghost" then
							snap.cf = {}
							for _, src in ipairs(d.parts) do
								if src.Parent then
									snap.cf[src] = src.CFrame
								end
							end
						end
						table.insert(d.hist, snap)
						local cutoff = now - delaySec - 0.2
						while #d.hist > 2 and d.hist[1].t < cutoff do
							table.remove(d.hist, 1)
						end
						if backtrack.color == "Role" then
							d.role = roleColor(p)
						end
					end
					local near = p == player or (camPos - hrp.Position).Magnitude <= backtrack.dist
					d.vis += ((near and 1 or 0) - d.vis) * smooth
					local oa, ob, ok = sample(d.hist, now - delaySec)
					local pastCf = oa and oa.root:Lerp(ob.root, ok)
					local apart = pastCf and (pastCf.Position - hrp.Position).Magnitude > 0.35
					if d.trail then
						local kps = {}
						for j = 0, 4 do
							kps[#kps + 1] = ColorSequenceKeypoint.new(j / 4, ghostColor(d, j / 4, now))
						end
						local seq = ColorSequence.new(kps)
						local vis = d.vis

						local function transpSeq(a0, a1)
							return NumberSequence.new({
								NumberSequenceKeypoint.new(0, 1 - (1 - a0) * vis),
								NumberSequenceKeypoint.new(0.6, 1 - (1 - (a0 + (a1 - a0) * 0.6)) * vis),
								NumberSequenceKeypoint.new(1, 1),
							})
						end

						d.trail.Color = seq
						d.trail.Lifetime = delaySec
						d.trail.Transparency = transpSeq(math.min(baseTransp + 0.35, 0.98), 1)
						d.core.Color = seq
						d.core.Lifetime = delaySec
						d.core.Transparency = transpSeq(baseTransp * 0.6, 1)
					end
					local lastPos = hrp.Position
					local shown = false
					for i, g in ipairs(d.ghosts) do
						local a, b, k = sample(d.hist, now - delaySec * i / backtrack.count)
						local rootCf = a and a.root:Lerp(b.root, k)
						local moved = rootCf and (rootCf.Position - hrp.Position).Magnitude > 0.35
						g.vis += ((moved and d.vis > 0.02 and 1 or 0) - g.vis) * smooth
						local frac = (i - 1) / math.max(backtrack.count - 1, 1)
						local tr = 1 - (1 - (baseTransp + (1 - baseTransp) * 0.75 * frac)) * g.vis * d.vis
						local col = ghostColor(d, frac, now)
						if tr < 0.99 then
							shown = true
						end
						if g.map then
							for src, gp in pairs(g.map) do
								local ca, cb = a and a.cf and a.cf[src], b and b.cf and b.cf[src]
								if ca and tr < 0.99 then
									gp.CFrame = cb and ca:Lerp(cb, k) or ca
									gp.Color = col
									gp.Transparency = tr
								elseif gp.Transparency < 1 then
									gp.Transparency = 1
									gp.CFrame = farCf
								end
							end
						elseif g.dot then
							if rootCf and tr < 0.99 then
								local pos = rootCf.Position
								local sz = 0.9 - 0.5 * frac
								g.dot.Size = Vector3.one * sz
								g.dot.CFrame = CFrame.new(pos)
								g.dot.Color = col
								g.dot.Transparency = tr
								local dist = (pos - lastPos).Magnitude
								if dist > 0.05 then
									g.link.Size = Vector3.new(0.12, 0.12, dist)
									g.link.CFrame = CFrame.lookAt((pos + lastPos) / 2, pos)
									g.link.Color = col
									g.link.Transparency = math.min(tr + 0.15, 1)
								else
									g.link.Transparency = 1
								end
								lastPos = pos
							elseif g.dot.Transparency < 1 then
								g.dot.Transparency = 1
								g.link.Transparency = 1
								g.dot.CFrame, g.link.CFrame = farCf, farCf
							end
						end
					end
					if d.hl then
						local on = shown and d.vis > 0.05
						d.hl.Enabled = on
						if on then
							d.hl.OutlineColor = ghostColor(d, 0, now)
							d.hl.OutlineTransparency = math.clamp(baseTransp + 0.1, 0, 0.9)
						end
					end
					if d.ring then
						local vis = (apart and 1 or 0) * d.vis
						d.ringVis = (d.ringVis or 0) + (vis - (d.ringVis or 0)) * smooth
						if pastCf and d.ringVis > 0.02 then
							rayParams.FilterDescendantsInstances = { folder, char }
							local hit = workspace:Raycast(pastCf.Position, Vector3.new(0, -8, 0), rayParams)
							local y = hit and hit.Position.Y + 0.05 or pastCf.Position.Y - 3
							local base = CFrame.new(pastCf.Position.X, y, pastCf.Position.Z) * CFrame.Angles(0, 0, math.rad(90))
							local pulse = 0.5 + 0.5 * math.sin(now * 4)
							local col = ghostColor(d, 1, now)
							local s = 3.2 + pulse * 0.6
							d.ring.Size = Vector3.new(0.05, s, s)
							d.ring.CFrame = base
							d.ring.Color = col
							d.ring.Transparency = 1 - (1 - (0.55 + pulse * 0.25)) * d.ringVis
							d.disc.CFrame = base * CFrame.new(0.02, 0, 0)
							d.disc.Color = col
							d.disc.Transparency = 1 - (1 - baseTransp * 0.5) * d.ringVis
						elseif d.ring.Transparency < 1 then
							d.ring.Transparency, d.disc.Transparency = 1, 1
							d.ring.CFrame, d.disc.CFrame = farCf, farCf
						end
					end
				end
				for p in pairs(data) do
					if not p.Parent then
						removeRecord(p)
					end
				end
			end)

			local function setter(k)
				return function(v)
					backtrack[k] = v
				end
			end

			local sec = addSection(visualsTab, "BackTrack", "BackTrack")
			sec:Toggle("Enable", "ghosts of past positions", function(on)
				backtrack.on = on
				if not on then
					clearAll()
				end
				notify("BackTrack: " .. (on and "On" or "Off"), on and "showing past positions" or "ghosts removed")
			end)
			sec:Segmented("Target", { "Self", "Others", "All" }, backtrack.target, setter("target"))
			sec:Segmented("Style", { "Ghost", "Trail", "Dots" }, backtrack.style, setter("style"))
			local colorSelect = sec:Select("Color", "Role = murderer red, sheriff blue", { "Shimmer", "Rainbow", "Aqua", "Sunset", "White", "Role", "Custom" }, backtrack.color, setter("color"))
			sec:ColorPicker("Custom color", "pick a color - Color switches to Custom", backtrack.custom, function(c)
				backtrack.custom = c
				if not loading and colorSelect.Get() ~= "Custom" then
					colorSelect.Set("Custom")
				end
			end)
			sec:Select("Material", "for Ghost and Dots", { "ForceField", "Neon", "Glass" }, backtrack.material, setter("material"))
			local fx = addSection(visualsTab, "Effects", "BackTrack")
			local outlineToggle = fx:Toggle("Outline", "glowing edge around the ghosts", setter("outline"))
			local markerToggle = fx:Toggle("Marker", "pulsing disc at the oldest position", setter("marker"))
			outlineToggle.Set(true, true)
			markerToggle.Set(true, true)
			local tuning = addSection(visualsTab, "Tuning", "BackTrack"):Collapsible(true)
			tuning:Slider("Delay", 100, 1000, backtrack.delay, setter("delay"), function(v)
				return v .. "ms"
			end)
			tuning:Slider("Ghosts", 1, 8, backtrack.count, setter("count"))
			tuning:Slider("Opacity", 10, 100, backtrack.opacity, setter("opacity"), function(v)
				return v .. "%"
			end)
			tuning:Slider("Max distance", 25, 500, backtrack.dist, setter("dist"), function(v)
				return v .. "m"
			end)

			stopBackTrack = function()
				backtrack.on = false
				clearAll()
			end
		end
		do
			local cm = {
				on = false,
				target = "Self",
				model = "Toy",
				turn = 0,
				fur = Color3.fromRGB(250, 248, 245),
				bow = Color3.fromRGB(255, 92, 138),
			}
			local modelIds = { Toy = 6132351260, Sugar = 13856439988, Real = 110128375015584 }
			local cache, loading2 = {}, {}
			local records = {}

			local function modelFor(p)
				if p == player then
					return cm.on and cm.model or nil
				end
				if cm.on and cm.target == "All" then
					return cm.model
				end
				return nil
			end

			local function clear(p)
				local d = records[p]
				if not d then
					return
				end
				if d.folder then
					d.folder:Destroy()
				end
				if d.char and d.char.Parent then
					for _, x in ipairs(d.char:GetDescendants()) do
						if (x:IsA("BasePart") or x:IsA("Decal")) and not x:FindFirstAncestorOfClass("Tool") then
							x.LocalTransparencyModifier = 0
						end
					end
				end
				records[p] = nil
			end

			local function loadModel(name)
				if cache[name] ~= nil then
					return cache[name] or nil
				end
				if loading2[name] then
					return nil
				end
				loading2[name] = true
				task.spawn(function()
					local ok, objs = pcall(function()
						return game:GetObjects("rbxassetid://" .. modelIds[name])
					end)
					local root = ok and objs and objs[1]
					if root and not root:IsA("Model") then
						local m = Instance.new("Model")
						for _, o in ipairs(objs) do
							o.Parent = m
						end
						root = m
					end
					if root then
						for _, x in ipairs(root:GetDescendants()) do
							if x:IsA("LuaSourceContainer") or x:IsA("Sound") or x:IsA("ClickDetector") or x:IsA("ProximityPrompt") or x:IsA("Humanoid") or x:IsA("JointInstance") or x:IsA("WeldConstraint") or x:IsA("BillboardGui") then
								x:Destroy()
							end
						end
						if not root:FindFirstChildWhichIsA("BasePart", true) then
							root = nil
						end
					end
					cache[name] = root or false
					loading2[name] = nil
					if not root then
						notify("Custom Models", name .. " failed to load")
					end
				end)
				return nil
			end

			local function applyModel(p, char, template)
				local hrp = char:FindFirstChild("HumanoidRootPart")
				local hum = char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum then
					return
				end
				local d = { char = char, parts = {}, ears = {}, seed = math.random() * 10, kind = "asset" }
				d.folder = create("Folder", { Name = "RockHubCustomModel", Parent = char })
				local m = template:Clone()
				local parts = {}
				for _, x in ipairs(m:GetDescendants()) do
					if x:IsA("BasePart") then
						x.Name = "RockHubBunny"
						x.Anchored = false
						x.CanCollide = false
						x.CanQuery = false
						x.CanTouch = false
						x.Massless = true
						table.insert(parts, x)
					end
				end
				local _, size = m:GetBoundingBox()
				local height = hum.HipHeight + hrp.Size.Y / 2 + 2.6
				pcall(function()
					m:ScaleTo(m:GetScale() * height / math.max(size.Y, 0.1))
				end)
				local bbCf, bbSize = m:GetBoundingBox()
				m.WorldPivot = CFrame.new(bbCf.Position) * (m.WorldPivot - m.WorldPivot.Position)
				local legHeight = hum.HipHeight + hrp.Size.Y / 2
				local base = CFrame.new(0, -legHeight + bbSize.Y / 2, 0) * CFrame.Angles(0, math.rad(cm.turn), 0)
				m:PivotTo(hrp.CFrame * base)
				table.sort(parts, function(a, b)
					return a.Size.Magnitude > b.Size.Magnitude
				end)
				local main2 = parts[1]
				for i = 2, #parts do
					local wc = Instance.new("WeldConstraint")
					local wcObj = wc
					local wcProps = {}
					wcProps[23771] = {
						"Part0",
						function()
							return main2
						end,
					}
					wcProps[20038] = {
						"Parent",
						function()
							return parts[i]
						end,
					}
					wcProps[1541] = {
						"Part1",
						function()
							return parts[i]
						end,
					}
					local wcOrder = { 23771, 1541, 20038 }
					for wcIdx = 1, #wcOrder do
						local wcProp = wcProps[wcOrder[wcIdx]]
						wcObj[wcProp[1]] = wcProp[2]()
					end
				end
				local w = Instance.new("Weld")
				do
					local hopObj = w
					local hopProps = {}
					hopProps[57596] = {
						"Part0",
						function()
							return hrp
						end,
					}
					hopProps[41635] = {
						"C0",
						function()
							return (hrp.CFrame:ToObjectSpace(main2.CFrame))
						end,
					}
					hopProps[47751] = {
						"Part1",
						function()
							return main2
						end,
					}
					hopProps[60997] = {
						"Parent",
						function()
							return main2
						end,
					}
					local hopOrder = { 57596, 47751, 41635, 60997 }
					for hopIdx = 1, #hopOrder do
						local hopProp = hopProps[hopOrder[hopIdx]]
						hopObj[hopProp[1]] = hopProp[2]()
					end
				end
				d.hop, d.hopBase = w, w.C0
				m.Parent = d.folder
				records[p] = d
				return d
			end

			local function clearAll()
				for p in pairs(records) do
					clear(p)
				end
			end

			connect(RunService.Heartbeat, function()
				if not cm.on and next(records) == nil then
					return
				end
				local t = os.clock()
				for _, p in ipairs(Players:GetPlayers()) do
					local char = p.Character
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					local d = records[p]
					local name = modelFor(p)
					if not name or not char or not hum or hum.Health <= 0 then
						if d then
							clear(p)
						end
					else
						if not d or d.char ~= char or not d.folder.Parent or d.model ~= name or d.turn ~= cm.turn then
							local template = loadModel(name)
							if template then
								clear(p)
								d = applyModel(p, char, template)
								if d then
									d.model, d.turn = name, cm.turn
								end
							end
						end
						if d then
							for _, x in ipairs(char:GetDescendants()) do
								if (x:IsA("BasePart") or x:IsA("Decal")) and x.Name ~= "HumanoidRootPart" and not x:IsDescendantOf(d.folder) and not x:FindFirstAncestorOfClass("Tool") and x.LocalTransparencyModifier < 1 then
									x.LocalTransparencyModifier = 1
								end
							end
							local move = math.clamp(hum.MoveDirection.Magnitude, 0, 1)
							for _, e in ipairs(d.ears) do
								local sway = math.sin(t * 2.2 + d.seed + e.side) * 0.07
								local flap = math.sin(t * 11 + d.seed) * 0.22 * move
								e.weld.C0 = e.pivot * CFrame.Angles(0.12 * move + flap, 0, (-0.2 + sway) * e.side) * CFrame.new(0, 0.95, 0)
							end
							if d.tail then
								local bob = math.abs(math.sin(t * (move > 0 and 11 or 3) + d.seed)) * (0.08 + 0.12 * move)
								d.tail.C0 = d.tailBase * CFrame.new(0, bob, 0)
							end
							if d.hop then
								local hop = move > 0 and math.abs(math.sin(t * 9 + d.seed)) * 0.9 * move or math.sin(t * 2 + d.seed) * 0.05
								local tilt = move > 0 and -0.12 * move or 0
								d.hop.C0 = CFrame.new(0, hop, 0) * d.hopBase * CFrame.Angles(tilt, 0, 0)
							end
						end
					end
				end
				for p in pairs(records) do
					if not p.Parent then
						clear(p)
					end
				end
			end)
			local sec = addSection(visualsTab, "Custom Models", "Models")
			sec:Toggle("Bunny", "turn into a cute bunny (rock hub users see it too)", function(on)
				cm.on = on
				if not on then
					clearAll()
				end
				notify("Bunny: " .. (on and "On" or "Off"), on and "hop hop" or "back to human")
			end)
			sec:Select("Model", "bunny model", { "Toy", "Sugar", "Real" }, cm.model, function(v)
				cm.model = v
			end)
			sec:Segmented("Target", { "Self", "All" }, cm.target, function(v)
				cm.target = v
				clearAll()
			end)
			local savedTurn = config["Custom Models/turn"]
			if type(savedTurn) == "number" then
				cm.turn = savedTurn
			end
			sec:Button("Rotate model", "if it faces the wrong way", function()
				cm.turn = (cm.turn + 90) % 360
				setConfig("Custom Models/turn", cm.turn)
			end)
			register("Custom Models/turn", function(v)
				if type(v) == "number" then
					cm.turn = v % 360
				end
			end, function()
				return cm.turn
			end, 0)
			stopBunnyModel = clearAll
		end
		do
			local av = { headless = false, korblox = false }
			local state = { char = nil, orig = nil, extra = {} }

			local function removeKorblox()
				local o = state.orig
				if o and o.part and o.part.Parent then
					pcall(function()
						o.part.MeshId = o.mesh
						o.part.TextureID = o.tex
					end)
				end
				for _, x in ipairs(state.extra) do
					x:Destroy()
				end
				table.clear(state.extra)
				state.orig = nil
				if state.char then
					for _, n in ipairs({ "RightUpperLeg", "RightLowerLeg", "RightFoot" }) do
						local pt = state.char:FindFirstChild(n)
						if pt then
							pt.LocalTransparencyModifier = 0
						end
					end
				end
				state.hide = nil
			end

			local function applyKorblox(char)
				removeKorblox()
				state.char = char
				local upperLeg = char:FindFirstChild("RightUpperLeg")
				if upperLeg then
					state.hide = { "RightLowerLeg", "RightFoot" }
					local o = { part = upperLeg, mesh = upperLeg.MeshId, tex = upperLeg.TextureID }
					local ok = pcall(function()
						upperLeg.MeshId = "rbxassetid://902942096"
						upperLeg.TextureID = "rbxassetid://902843398"
					end)
					if ok then
						state.orig = o
					else
						table.insert(state.hide, "RightUpperLeg")
						local legPart = Instance.new("Part")
						legPart.Name = "RockHubKorblox"
						legPart.CanCollide, legPart.CanQuery, legPart.CanTouch, legPart.Massless = false, false, false, true
						legPart.Size = upperLeg.Size
						legPart.CFrame = upperLeg.CFrame
						local m = Instance.new("SpecialMesh")
						m.MeshType = Enum.MeshType.FileMesh
						m.MeshId, m.TextureId = "rbxassetid://902942096", "rbxassetid://902843398"
						m.Parent = legPart
						local w = Instance.new("WeldConstraint")
						w.Part0, w.Part1 = upperLeg, legPart
						w.Parent = legPart
						legPart.Parent = char
						table.insert(state.extra, legPart)
					end
					return
				end
				local rightLeg = char:FindFirstChild("Right Leg")
				if rightLeg then
					for _, cm in ipairs(char:GetChildren()) do
						if cm:IsA("CharacterMesh") and cm.BodyPart == Enum.BodyPart.RightLeg then
							cm.Parent = nil
							table.insert(state.extra, {
								Destroy = function()
									cm.Parent = char
								end,
							})
						end
					end
					local m = Instance.new("SpecialMesh")
					do
						local meshObj = m
						local meshProps = {}
						meshProps[42163] = {
							"MeshType",
							function()
								return Enum.MeshType.FileMesh
							end,
						}
						meshProps[42155] = {
							"Name",
							function()
								return "RockHubKorblox"
							end,
						}
						local meshOrder = { 42155, 42163 }
						for meshIdx = 1, #meshOrder do
							local meshProp = meshProps[meshOrder[meshIdx]]
							meshObj[meshProp[1]] = meshProp[2]()
						end
					end
					m.MeshId, m.TextureId = "rbxassetid://101851696", "rbxassetid://101851254"
					m.Parent = rightLeg
					table.insert(state.extra, m)
				end
			end

			local function setHeadless(char, hidden)
				local head = char and char:FindFirstChild("Head")
				if not head then
					return
				end
				head.LocalTransparencyModifier = hidden and 1 or 0
				for _, d in ipairs(head:GetChildren()) do
					if d:IsA("Decal") then
						d.LocalTransparencyModifier = hidden and 1 or 0
					end
				end
			end

			local function hasKorblox(char)
				if state.char ~= char then
					return false
				end
				local upperLeg = char:FindFirstChild("RightUpperLeg")
				if upperLeg then
					if state.orig then
						return state.orig.part == upperLeg and upperLeg.MeshId == "rbxassetid://902942096"
					end
					for _, x in ipairs(state.extra) do
						if typeof(x) == "Instance" and x.Name == "RockHubKorblox" and x.Parent == char then
							local w = x:FindFirstChildOfClass("WeldConstraint")
							return w ~= nil and w.Part0 == upperLeg
						end
					end
					return false
				end
				local rightLeg = char:FindFirstChild("Right Leg")
				return rightLeg ~= nil and rightLeg:FindFirstChild("RockHubKorblox") ~= nil
			end

			local lastChar
			local nextCheck = 0
			connect(RunService.RenderStepped, function()
				local char = player.Character
				if not char then
					return
				end
				if av.headless then
					setHeadless(char, true)
				end
				if av.korblox then
					local now = os.clock()
					if lastChar ~= char or now >= nextCheck and not hasKorblox(char) then
						lastChar = char
						nextCheck = now + 0.3
						applyKorblox(char)
					elseif now >= nextCheck then
						nextCheck = now + 0.3
					end
					for _, n in ipairs(state.hide or {}) do
						local pt = char:FindFirstChild(n)
						if pt then
							pt.LocalTransparencyModifier = 1
						end
					end
				end
			end)
			local sec = addSection(visualsTab, "Avatar", "Models")
			sec:Toggle("Headless", "no head (only you see it)", function(on)
				av.headless = on
				if not on then
					setHeadless(player.Character, false)
				end
			end)
			sec:Toggle("Korblox", "Korblox Deathspeaker leg (only you see it)", function(on)
				av.korblox = on
				lastChar = nil
				if not on then
					removeKorblox()
				end
			end)

			stopAvatar = function()
				av.headless, av.korblox = false, false
				setHeadless(player.Character, false)
				removeKorblox()
			end
		end
		do
			local aura = {
				on = false,
				style = "Energy",
				custom = Color3.fromRGB(105, 205, 255),
				intensity = 55,
				size = 100,
			}
			local auraRoot
			local auraObjects = {}
			local emitters = {}
			local auraLight
			local auraHighlight
			local rainbowAt = 0

			local function track(inst)
				table.insert(auraObjects, inst)
				return inst
			end

			local function clear()
				for _, inst in ipairs(auraObjects) do
					if inst.Parent then
						inst:Destroy()
					end
				end
				table.clear(auraObjects)
				table.clear(emitters)
				auraRoot, auraLight, auraHighlight = nil, nil, nil
			end

			local function styleColor()
				if aura.style == "Flame" then
					return Color3.fromRGB(255, 92, 34)
				elseif aura.style == "Frost" then
					return Color3.fromRGB(125, 225, 255)
				elseif aura.style == "Void" then
					return Color3.fromRGB(145, 65, 255)
				elseif aura.style == "Rainbow" then
					return Color3.fromHSV(os.clock() * 0.15 % 1, 0.85, 1)
				elseif aura.style == "Custom" then
					return aura.custom
				end
				return Color3.fromRGB(105, 205, 255)
			end

			local function addEmitter(parent, secondary)
				local scale = aura.size / 100
				local rate = aura.intensity * (secondary and 0.18 or 0.42)
				local texture = "rbxasset://textures/particles/sparkles_main.dds"
				local speed = NumberRange.new(0.45, 1.5)
				local acceleration = Vector3.new(0, 1.2, 0)
				local lifetime = NumberRange.new(0.65, 1.25)
				local size
				if aura.style == "Flame" and not secondary then
					texture = "rbxasset://textures/particles/fire_main.dds"
					speed = NumberRange.new(1.2, 2.8)
					acceleration = Vector3.new(0, 3.5, 0)
					size = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0.7 * scale),
						NumberSequenceKeypoint.new(0.55, 1.5 * scale),
						NumberSequenceKeypoint.new(1, 0),
					})
				elseif aura.style == "Void" and not secondary then
					texture = "rbxasset://textures/particles/smoke_main.dds"
					speed = NumberRange.new(0.2, 0.8)
					acceleration = Vector3.new(0, 1.8, 0)
					lifetime = NumberRange.new(1, 1.8)
					size = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1.1 * scale),
						NumberSequenceKeypoint.new(0.65, 2.1 * scale),
						NumberSequenceKeypoint.new(1, 0),
					})
				elseif aura.style == "Frost" and not secondary then
					texture = "rbxasset://textures/particles/smoke_main.dds"
					speed = NumberRange.new(0.15, 0.65)
					acceleration = Vector3.new(0, -0.7, 0)
					lifetime = NumberRange.new(0.9, 1.6)
					size = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0.65 * scale),
						NumberSequenceKeypoint.new(0.7, 1.35 * scale),
						NumberSequenceKeypoint.new(1, 0),
					})
				else
					size = NumberSequence.new({
						NumberSequenceKeypoint.new(0, (secondary and 0.22 or 0.42) * scale),
						NumberSequenceKeypoint.new(0.5, (secondary and 0.13 or 0.7) * scale),
						NumberSequenceKeypoint.new(1, 0),
					})
				end
				local color = styleColor()
				local emitter = track(create("ParticleEmitter", {
					Name = secondary and "RockHubAuraSparks" or "RockHubAuraCore",
					Texture = texture,
					Rate = rate,
					Lifetime = lifetime,
					Speed = speed,
					Acceleration = acceleration,
					SpreadAngle = Vector2.new(180, 180),
					Rotation = NumberRange.new(0, 360),
					RotSpeed = NumberRange.new(-100, 100),
					LightEmission = aura.style == "Void" and 0.15 or 0.85,
					LightInfluence = 0,
					Size = size,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, secondary and 0.05 or 0.2),
						NumberSequenceKeypoint.new(0.75, 0.45),
						NumberSequenceKeypoint.new(1, 1),
					}),
					Color = ColorSequence.new(color),
					Parent = parent,
				}))
				table.insert(emitters, emitter)
			end

			local function build()
				clear()
				if not aura.on then
					return
				end
				local char = player.Character
				local root = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not root or not hum or hum.Health <= 0 then
					return
				end
				auraRoot = root
				local bottom = track(create("Attachment", { Name = "RockHubAuraBottom", Position = Vector3.new(0, -1.5, 0), Parent = root }))
				local center = track(create("Attachment", { Name = "RockHubAuraCenter", Position = Vector3.new(0, 0.45, 0), Parent = root }))
				addEmitter(bottom, false)
				addEmitter(center, true)
				local color = styleColor()
				auraLight = track(create("PointLight", {
					Name = "RockHubAuraLight",
					Color = color,
					Brightness = 0.8 + aura.intensity / 45,
					Range = 7 + aura.size / 30,
					Shadows = false,
					Parent = root,
				}))
				auraHighlight = track(create("Highlight", {
					Name = "RockHubAuraHighlight",
					Adornee = char,
					DepthMode = Enum.HighlightDepthMode.Occluded,
					FillColor = color,
					FillTransparency = 0.92,
					OutlineColor = color,
					OutlineTransparency = 0.35,
					Parent = char,
				}))
			end

			connect(player.CharacterAdded, function()
				if aura.on then
					task.delay(0.4, build)
				end
			end)
			connect(RunService.Heartbeat, function()
				if not aura.on then
					return
				end
				local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if not root then
					if auraRoot then
						clear()
					end
					return
				end
				if auraRoot ~= root or not auraRoot.Parent then
					build()
					return
				end
				local now = os.clock()
				if aura.style ~= "Rainbow" or now - rainbowAt < 0.06 then
					return
				end
				rainbowAt = now
				local hue = now * 0.16 % 1
				local c1 = Color3.fromHSV(hue, 0.9, 1)
				local c2 = Color3.fromHSV((hue + 0.16) % 1, 0.9, 1)
				local sequence = ColorSequence.new(c1, c2)
				for _, emitter in ipairs(emitters) do
					emitter.Color = sequence
				end
				auraLight.Color = c1
				auraHighlight.FillColor = c1
				auraHighlight.OutlineColor = c2
			end)

			local sec = addSection(visualsTab, "Auras", "Models")
			sec:Toggle("Aura", "particles and glow around your character", function(on)
				aura.on = on
				build()
				notify("Aura: " .. (on and "On" or "Off"), on and aura.style or "effect removed")
			end)
			sec:Select("Style", "right click - previous", { "Energy", "Flame", "Frost", "Void", "Rainbow", "Custom" }, aura.style, function(v)
				aura.style = v
				if aura.on then
					build()
				end
			end)
			sec:ColorPicker("Aura color", "used when Style = Custom", aura.custom, function(c)
				aura.custom = c
				if not loading then
					aura.style = "Custom"
				end
				if aura.on then
					build()
				end
			end)
			sec:Slider("Intensity", 10, 100, aura.intensity, function(v)
				aura.intensity = v
				if aura.on then
					build()
				end
			end, function(v)
				return v .. "%"
			end)
			sec:Slider("Size", 50, 200, aura.size, function(v)
				aura.size = v
				if aura.on then
					build()
				end
			end, function(v)
				return v .. "%"
			end)

			stopAura = function()
				aura.on = false
				clear()
			end
		end
		do
			local ob = {
				on = false,
				style = "Invoker",
				count = 3,
				speed = 100,
				radius = 100,
				custom = Color3.fromRGB(120, 200, 255),
			}
			local invokerColors = { Color3.fromRGB(90, 200, 255), Color3.fromRGB(190, 90, 255), Color3.fromRGB(255, 150, 50) }
			local folder
			local orbs = {}

			local function orbColor(i, t)
				if ob.style == "Invoker" then
					return invokerColors[(i - 1) % #invokerColors + 1]
				elseif ob.style == "Mono" then
					local v = 0.5 + 0.5 * math.sin(t * 2.5 + i * 1.3)
					local c = math.floor(120 + v * 135)
					return Color3.fromRGB(c, c, c)
				end
				return ob.custom
			end

			local function part(size, mat, color, transp, shape)
				local p = Instance.new("Part")
				do
					local partObj = p
					local partProps = {}
					partProps[60693] = {
						"Color",
						function()
							return color
						end,
					}
					partProps[30322] = {
						"Size",
						function()
							return size
						end,
					}
					partProps[52597] = {
						"Transparency",
						function()
							return transp or 0
						end,
					}
					partProps[25263] = {
						"Material",
						function()
							return mat
						end,
					}
					partProps[29939] = {
						"Shape",
						function()
							return shape or Enum.PartType.Ball
						end,
					}
					local partOrder = { 29939, 30322, 25263, 60693, 52597 }
					for partIdx = 1, #partOrder do
						local partProp = partProps[partOrder[partIdx]]
						partObj[partProp[1]] = partProp[2]()
					end
				end
				p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
				p.Parent = folder
				return p
			end

			local function clear()
				if folder then
					folder:Destroy()
				end
				folder = nil
				table.clear(orbs)
			end

			local function build()
				clear()
				folder = create("Folder", { Name = "RockHubOrbs", Parent = workspace.CurrentCamera })
				for i = 1, ob.count do
					local c = orbColor(i, 0)
					local basePart = part(Vector3.one * 0.62, Enum.Material.Neon, c, 0.35)
					local heart = part(Vector3.one * 0.3, Enum.Material.SmoothPlastic, Color3.new(1, 1, 1), 0.2)
					local halo = part(Vector3.one * 1.15, Enum.Material.ForceField, c, 0.55)
					local light = { Color = c }
					local a0 = create("Attachment", { Position = Vector3.new(0, 0.22, 0), Parent = basePart })
					local a1 = create("Attachment", { Position = Vector3.new(0, -0.22, 0), Parent = basePart })
					local trail = create("Trail", {
						Attachment0 = a0,
						Attachment1 = a1,
						Lifetime = 0.35,
						LightEmission = 0.3,
						LightInfluence = 0.5,
						FaceCamera = true,
						MinLength = 0.02,
						Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 1) }),
						WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) }),
						Color = ColorSequence.new(c),
						Parent = basePart,
					})
					local sparks = create("ParticleEmitter", {
						Texture = "rbxasset://textures/particles/sparkles_main.dds",
						Rate = 5,
						Lifetime = NumberRange.new(0.4, 0.8),
						Speed = NumberRange.new(0.3, 1),
						SpreadAngle = Vector2.new(180, 180),
						LightEmission = 0.3,
						LightInfluence = 0.5,
						Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.18), NumberSequenceKeypoint.new(1, 0) }),
						Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1) }),
						Color = ColorSequence.new(c),
						Parent = basePart,
					})
					orbs[i] = {
						core = basePart,
						heart = heart,
						halo = halo,
						light = light,
						trail = trail,
						sparks = sparks,
						pos = nil,
						color = c,
					}
				end
			end

			local gradStart2 = os.clock()
			connect(RunService.RenderStepped, function(dt)
				if not ob.on then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not hrp then
					if folder then
						clear()
					end
					return
				end
				if not folder or not folder.Parent or #orbs ~= ob.count then
					build()
				end
				local t = os.clock() - gradStart2
				local spd = 1.6 * ob.speed / 100
				local r = 1.35 * ob.radius / 100
				local center = hrp.CFrame * CFrame.new(0, 1.7, 1.25) * CFrame.Angles(math.rad(-25), 0, 0)
				local k = 1 - math.exp(-dt * 10)
				for i, o in ipairs(orbs) do
					local a = t * spd + (i - 1) * (math.pi * 2 / #orbs)
					local bob = math.sin(t * 2.2 + i * 1.7) * 0.18
					local target = (center * CFrame.new(math.cos(a) * r, bob, math.sin(a) * r * 0.55)).Position
					o.pos = o.pos and o.pos:Lerp(target, k) or target
					local pulse = 1 + math.sin(t * 4 + i) * 0.06
					local cf = CFrame.new(o.pos)
					o.core.CFrame = cf
					o.heart.CFrame = cf
					o.halo.CFrame = cf
					o.core.Size = Vector3.one * 0.62 * pulse
					o.halo.Size = Vector3.one * 1.15 * (2 - pulse)
					local c = orbColor(i, t)
					if c ~= o.color then
						o.color = c
						o.core.Color, o.halo.Color, o.light.Color = c, c, c
						o.trail.Color = ColorSequence.new(c)
						o.sparks.Color = ColorSequence.new(c)
					end
				end
			end)
			local sec = addSection(visualsTab, "Orbs", "Models")
			sec:Toggle("Orbs", "glowing orbs behind your back (only you see them)", function(on)
				ob.on = on
				if not on then
					clear()
				end
				notify("Orbs: " .. (on and "On" or "Off"), on and "quas wex exort" or "orbs gone")
			end)
			sec:Segmented("Style", { "Invoker", "Mono", "Custom" }, ob.style, function(v)
				ob.style = v
			end)
			sec:ColorPicker("Orb color", "used when Style = Custom", ob.custom, function(c)
				ob.custom = c
				if not loading then
					ob.style = "Custom"
				end
			end)
			sec:Slider("Count", 1, 6, ob.count, function(v)
				ob.count = v
			end)
			sec:Slider("Speed", 20, 300, ob.speed, function(v)
				ob.speed = v
			end, function(v)
				return v .. "%"
			end)
			sec:Slider("Radius", 50, 250, ob.radius, function(v)
				ob.radius = v
			end, function(v)
				return v .. "%"
			end)

			stopOrbs = function()
				ob.on = false
				clear()
			end
		end
		do
			local swatch = { on = false, count = 30, speed = 100 }
			local dirs = {
				Vector3.new(1, 0, 0),
				Vector3.new(-1, 0, 0),
				Vector3.new(0, 0, 1),
				Vector3.new(0, 0, -1),
				Vector3.new(0, 1, 0),
				Vector3.new(0, -1, 0),
			}
			local accentColor2 = Color3.new(1, 1, 1)
			local tint = Color3.fromRGB(170, 215, 255)
			local folder
			local worms = {}
			local rng = Random.new()

			local function clear()
				if folder then
					folder:Destroy()
				end
				folder = nil
				table.clear(worms)
			end

			local function newWorm()
				local head = Instance.new("Part")
				do
					local headObj = head
					local headProps = {}
					headProps[61142] = {
						"Size",
						function()
							return Vector3.one * 0.22
						end,
					}
					headProps[18088] = {
						"Material",
						function()
							return Enum.Material.Neon
						end,
					}
					headProps[17496] = {
						"Color",
						function()
							return accentColor2
						end,
					}
					headProps[56633] = {
						"Shape",
						function()
							return Enum.PartType.Ball
						end,
					}
					local headOrder = { 56633, 61142, 18088, 17496 }
					for headIdx = 1, #headOrder do
						local headProp = headProps[headOrder[headIdx]]
						headObj[headProp[1]] = headProp[2]()
					end
				end
				head.Anchored, head.CanCollide, head.CanQuery, head.CanTouch, head.CastShadow = true, false, false, false, false
				head.Parent = folder
				local a0 = create("Attachment", { Position = Vector3.new(0, 0.06, 0), Parent = head })
				local a1 = create("Attachment", { Position = Vector3.new(0, -0.06, 0), Parent = head })
				create("Trail", {
					Attachment0 = a0,
					Attachment1 = a1,
					Lifetime = rng:NextNumber(0.35, 0.7),
					LightEmission = 1,
					LightInfluence = 0,
					FaceCamera = true,
					MinLength = 0.05,
					Color = ColorSequence.new(accentColor2, tint),
					Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) }),
					WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.2) }),
					Parent = head,
				})
				return { head = head, pos = nil, dir = dirs[1], left = 0, spd = rng:NextNumber(22, 42) }
			end

			local function build()
				clear()
				folder = create("Folder", { Name = "RockHubSkyWorms", Parent = workspace.CurrentCamera })
				for i = 1, swatch.count do
					worms[i] = newWorm()
				end
			end

			local function turn(w, center, floorY)
				local offset = w.pos - center
				local options = {}
				for _, d in ipairs(dirs) do
					if d:Dot(w.dir) == 0 then
						local ok = true
						if d.X ~= 0 and math.abs(offset.X) > 96 and d.X * offset.X > 0 then
							ok = false
						end
						if d.Z ~= 0 and math.abs(offset.Z) > 96 and d.Z * offset.Z > 0 then
							ok = false
						end
						if d.Y > 0 and w.pos.Y > floorY + 40 then
							ok = false
						end
						if d.Y < 0 and w.pos.Y < floorY + 2 then
							ok = false
						end
						if ok then
							table.insert(options, d)
							if d.Y == 0 then
								table.insert(options, d)
							end
						end
					end
				end
				w.dir = #options > 0 and options[rng:NextInteger(1, #options)] or -w.dir
				w.left = rng:NextNumber(4, 22)
			end

			local function respawn(w, center, floorY)
				w.pos = center + Vector3.new(rng:NextNumber(-120, 120), 0, rng:NextNumber(-120, 120))
				w.pos = Vector3.new(w.pos.X, floorY + rng:NextNumber(2, 40), w.pos.Z)
				w.dir = dirs[rng:NextInteger(1, 4)]
				w.left = rng:NextNumber(4, 22)
				for _, d in ipairs(w.head:GetChildren()) do
					if d:IsA("Trail") then
						d:Clear()
					end
				end
			end

			connect(RunService.RenderStepped, function(dt)
				if not swatch.on then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not hrp then
					return
				end
				if not folder or not folder.Parent or #worms ~= swatch.count then
					build()
				end
				local center = hrp.Position
				local floorY = center.Y - 3
				dt = math.min(dt, 0.1)
				for _, w in ipairs(worms) do
					if not w.pos or (w.pos - center).Magnitude > 216 then
						respawn(w, center, floorY)
					end
					local step = w.spd * swatch.speed / 100 * dt
					while step > 0 do
						local s = math.min(step, w.left)
						w.pos += w.dir * s
						w.left -= s
						step -= s
						if w.left <= 0 then
							turn(w, center, floorY)
						end
					end
					w.head.CFrame = CFrame.new(w.pos)
				end
			end)
			local sec = addSection(visualsTab, "Sky Worms", "Models")
			sec:Toggle("Sky Worms", "rock hub exclusive - white signals run across the map (only you see them)", function(on)
				swatch.on = on
				if not on then
					clear()
				end
				notify("Sky Worms: " .. (on and "On" or "Off"), on and "the map is online" or "signal lost")
			end)
			sec:Slider("Count", 10, 60, swatch.count, function(v)
				swatch.count = v
			end)
			sec:Slider("Speed", 20, 300, swatch.speed, function(v)
				swatch.speed = v
			end, function(v)
				return v .. "%"
			end)

			stopSkyWorms = function()
				swatch.on = false
				clear()
			end
		end
		do
			local cursorList = {
				{ 11726322365, "Pink Heart" },
				{ 11754490336, "Heart Scope" },
				{ 12094859168, "White Heart" },
				{ 12094860445, "Mint Heart" },
				{ 11747999974, "Red Heart" },
				{ 12909937176, "Angel Heart" },
				{ 11767039760, "Heart Line" },
				{ 84069910734738, "Heart Sight" },
				{ 14128309111, "Heart Cross" },
				{ 11739569706, "Pixel Heart" },
				{ 12323570810, "Glow Heart" },
				{ 12146777431, "Soft Heart" },
				{ 11254520798, "Neon Pink" },
				{ 81102279303918, "Neon Rose" },
				{ 11716577756, "Pink Medic" },
				{ 12439641494, "Pink Scope" },
				{ 91638190237682, "Neon Green" },
				{ 1458996342, "Ice X" },
				{ 942455758, "Cyan Tri" },
				{ 5159914167, "Classic" },
				{ 29066471, "Red Dot" },
				{ 10891594364, "Glow Orb" },
				{ 13613212658, "Rainbow Star" },
				{ 13944218938, "Pink Star" },
				{ 13944215054, "White Star" },
				{ 130225909042821, "Purple Star" },
				{ 84232095638395, "Star Line" },
				{ 11893991373, "Kuromi" },
				{ 12030244945, "Hello Kitty" },
				{ 11768101227, "Gengar" },
				{ 130973865039213, "Kitty Pointer" },
				{ 108267553252298, "Pink Pointer" },
				{ 12818611757, "Blue Pointer" },
			}
			local sizes = { S = 28, M = 40, L = 56 }
			local cur = { on = false, id = nil, mode = "Always", size = "M" }

			local function img(id)
				return ("rbxthumb://type=Asset&id=%d&w=150&h=150"):format(id)
			end

			local cursorGui = create("ScreenGui", { Name = "RockHubCursor", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 2000 })
			pcall(function()
				cursorGui.Parent = gui.Parent
			end)
			local icon = create("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(sizes.M, sizes.M),
				ScaleType = Enum.ScaleType.Fit,
				Visible = false,
				ZIndex = 10,
				Parent = cursorGui,
			})
			local scale = create("UIScale", { Parent = icon })
			local hidden = false

			local function updateCursor()
				local char = player.Character
				local active = cur.on and cur.id ~= nil and (cur.mode == "Always" or char and char:FindFirstChild("Gun") ~= nil)
				if active then
					UserInputService.MouseIconEnabled = false
					hidden = true
					local m = UserInputService:GetMouseLocation()
					icon.Position = UDim2.fromOffset(m.X, m.Y)
					icon.Visible = true
				elseif hidden then
					hidden = false
					UserInputService.MouseIconEnabled = true
					icon.Visible = false
				end
			end

			pcall(function()
				RunService:UnbindFromRenderStep("RockHubCursor")
			end)
			RunService:BindToRenderStep("RockHubCursor", Enum.RenderPriority.Last.Value + 10, updateCursor)
			connect(UserInputService:GetPropertyChangedSignal("MouseIconEnabled"), function()
				if hidden and UserInputService.MouseIconEnabled then
					UserInputService.MouseIconEnabled = false
				end
			end)
			connect(UserInputService.InputBegan, function(input)
				if icon.Visible and input.UserInputType == Enum.UserInputType.MouseButton1 then
					scale.Scale = 0.75
					tween(scale, 0.25, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				end
			end)
			local page = cursorsTab.page
			cursorsTab.custom = true
			cursorsTab.title.Visible = false
			cursorsTab.desc.Visible = false
			page.ScrollingEnabled = false
			page.ScrollBarThickness = 0
			page.CanvasSize = UDim2.new()
			local cardColor = Color3.fromRGB(36, 36, 38)
			local cardHover = Color3.fromRGB(48, 48, 52)
			local footerColor = Color3.fromRGB(17, 17, 19)
			local bar = create("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 3, Parent = page })
			create("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = bar,
			})

			local function pill(text, order, cb)
				local w = TextService:GetTextSize(text, 13, Enum.Font.GothamMedium, Vector2.new(300, 40)).X + 26
				local b = create("TextButton", {
					Text = text,
					Font = Enum.Font.GothamMedium,
					TextSize = 13,
					TextColor3 = dimColor,
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(90, 90, 90),
					BackgroundTransparency = 0.85,
					Size = UDim2.fromOffset(w, 30),
					LayoutOrder = order,
					ZIndex = 4,
					Parent = bar,
				})
				addCorner(b, 9)
				connect(b.MouseButton1Click, cb)
				return function(on)
					tween(b, 0.2, { BackgroundTransparency = on and 0.35 or 0.85, TextColor3 = on and accentColor or dimColor })
				end
			end

			local refresh
			local setOnPill = pill("Cursor: Off", 1, function()
				cur.on = not cur.on
				setConfig("cursors.on", cur.on)
				refresh()
				notify("Cursor: " .. (cur.on and "On" or "Off"), cur.on and (cur.id and (cur.mode == "Gun" and "take the gun" or "enjoy") or "pick a cursor below") or "default cursor")
			end)
			local modePills, sizePills = {}, {}
			for i, m in ipairs({ "Always", "Gun" }) do
				modePills[m] = pill(m, 1 + i, function()
					cur.mode = m
					setConfig("cursors.mode", m)
					refresh()
				end)
			end
			for i, s in ipairs({ "S", "M", "L" }) do
				sizePills[s] = pill(s, 10 + i, function()
					cur.size = s
					setConfig("cursors.size", s)
					refresh()
				end)
			end
			local onBtn
			for _, c in ipairs(bar:GetChildren()) do
				if c:IsA("TextButton") and c.LayoutOrder == 1 then
					onBtn = c
				end
			end
			local grid = create("ScrollingFrame", {
				Position = UDim2.fromOffset(0, 42),
				Size = UDim2.new(1, 0, 1, -42),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 3,
				ScrollBarImageColor3 = dimColor,
				ScrollBarImageTransparency = 0.3,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(),
				ZIndex = 2,
				Parent = page,
			})
			create("UIPadding", {
				PaddingTop = UDim.new(0, 1),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 4),
				Parent = grid,
			})
			local layout = create("UIGridLayout", {
				CellSize = UDim2.new(0.25, -6, 0, 118),
				CellPadding = UDim2.fromOffset(8, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = grid,
			})
			connect(layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				grid.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 8)
			end)
			local strokes = {}
			for i, c in ipairs(cursorList) do
				local id, name = c[1], c[2]
				local card = create("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					LayoutOrder = i,
					ZIndex = 2,
					Parent = grid,
				})
				local thumb = create("Frame", { Size = UDim2.new(1, 0, 0, 88), BackgroundColor3 = cardColor, ZIndex = 2, Parent = card })
				addCorner(thumb, 8)
				strokes[id] = addStroke(thumb)
				local thumb2 = create("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(62, 62),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = img(id),
					ZIndex = 3,
					Parent = thumb,
				})
				local footer = create("Frame", {
					Position = UDim2.fromOffset(0, 93),
					Size = UDim2.new(1, 0, 1, -93),
					BackgroundColor3 = footerColor,
					ZIndex = 2,
					Parent = card,
				})
				addCorner(footer, 8)
				create("TextLabel", {
					Text = name:upper(),
					Font = Enum.Font.GothamBold,
					TextSize = 10,
					TextColor3 = accentColor,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(4, 0),
					Size = UDim2.new(1, -8, 1, 0),
					ZIndex = 3,
					Parent = footer,
				})
				connect(card.MouseEnter, function()
					tween(thumb, 0.15, { BackgroundColor3 = cardHover })
					tween(thumb2, 0.2, { Size = UDim2.fromOffset(72, 72) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				end)
				connect(card.MouseLeave, function()
					tween(thumb, 0.15, { BackgroundColor3 = cardColor })
					tween(thumb2, 0.2, { Size = UDim2.fromOffset(62, 62) })
				end)
				connect(card.MouseButton1Click, function()
					cur.id = id
					cur.on = true
					setConfig("cursors.id", id)
					setConfig("cursors.on", true)
					refresh()
					notify("Cursor", name .. (cur.mode == "Gun" and " - take the gun" or ""))
				end)
			end

			refresh = function()
				setOnPill(cur.on)
				if onBtn then
					onBtn.Text = "Cursor: " .. (cur.on and "On" or "Off")
				end
				for m, f in pairs(modePills) do
					f(cur.mode == m)
				end
				for s, f in pairs(sizePills) do
					f(cur.size == s)
				end
				for id, st in pairs(strokes) do
					local on = cur.id == id
					st.Color = on and accentColor or strokeColor
					st.Transparency = on and 0.1 or 0
				end
				if cur.id then
					icon.Image = img(cur.id)
				end
				icon.Size = UDim2.fromOffset(sizes[cur.size] or 40, sizes[cur.size] or 40)
			end

			refresh()
			register("cursors.on", function(v)
				if type(v) == "boolean" then
					cur.on = v
					refresh()
				end
			end, function()
				return cur.on
			end, false)
			register("cursors.id", function(v)
				if type(v) == "number" then
					cur.id = v
					refresh()
				end
			end, function()
				return cur.id
			end)
			register("cursors.mode", function(v)
				if v == "Gun" or v == "Always" then
					cur.mode = v
					refresh()
				end
			end, function()
				return cur.mode
			end, "Always")
			register("cursors.size", function(v)
				if sizes[v] then
					cur.size = v
					refresh()
				end
			end, function()
				return cur.size
			end, "M")

			stopCursor = function()
				pcall(function()
					RunService:UnbindFromRenderStep("RockHubCursor")
				end)
				cur.on = false
				if hidden then
					UserInputService.MouseIconEnabled = true
				end
				hidden = false
				cursorGui:Destroy()
			end
		end
		do
			local gunSkin = { on = false, model = "Green", size = 100, turn = 0 }
			local modelIds = { Green = 17437147124, Black = 9341070001, Classic = 13324755498 }
			local cache, loading2 = {}, {}
			local cur

			local function loadModel(name)
				if cache[name] ~= nil then
					return cache[name] or nil
				end
				if loading2[name] then
					return nil
				end
				loading2[name] = true
				task.spawn(function()
					local ok, objs = pcall(function()
						return game:GetObjects("rbxassetid://" .. modelIds[name])
					end)
					local root = ok and objs and objs[1]
					if root and not root:IsA("Model") then
						local m = Instance.new("Model")
						for _, o in ipairs(objs) do
							o.Parent = m
						end
						root = m
					end
					if root then
						for _, x in ipairs(root:GetDescendants()) do
							if x:IsA("BackpackItem") then
								local m = Instance.new("Model")
								m.Name = x.Name
								for _, c in ipairs(x:GetChildren()) do
									c.Parent = m
								end
								m.Parent = x.Parent
								x:Destroy()
							end
						end
						for _, x in ipairs(root:GetDescendants()) do
							if x:IsA("LuaSourceContainer") or x:IsA("Sound") or x:IsA("JointInstance") or x:IsA("WeldConstraint") or x:IsA("ClickDetector") or x:IsA("ProximityPrompt") or x:IsA("Humanoid") then
								x:Destroy()
							end
						end
						if not root:FindFirstChildWhichIsA("BasePart", true) then
							root = nil
						end
					end
					cache[name] = root or false
					loading2[name] = nil
					if not root then
						notify("Gun Skin", name .. " failed to load")
					end
				end)
				return nil
			end

			local function clear()
				if cur then
					if cur.model then
						cur.model:Destroy()
					end
					for p in pairs(cur.hidden) do
						if p.Parent then
							p.LocalTransparencyModifier = 0
						end
					end
				end
				cur = nil
			end

			local axes = { Vector3.xAxis, Vector3.yAxis, Vector3.zAxis }

			local function majorAxes(size)
				local list = { { 1, size.X }, { 2, size.Y }, { 3, size.Z } }
				table.sort(list, function(a, b)
					return a[2] > b[2]
				end)
				return axes[list[1][1]], axes[list[2][1]], list[1][2]
			end

			local function frame(pos, look, up)
				local right = look:Cross(up).Unit
				up = right:Cross(look).Unit
				return CFrame.fromMatrix(pos, right, up, -look)
			end

			local function build(tool, handle, template)
				clear()
				local m = template:Clone()
				local parts = {}
				for _, x in ipairs(m:GetDescendants()) do
					if x:IsA("BasePart") then
						x.Anchored, x.CanCollide, x.CanQuery, x.CanTouch, x.Massless, x.CastShadow = true, false, false, false, true, false
						table.insert(parts, x)
					end
				end
				local _, size = m:GetBoundingBox()
				local _, _, len = majorAxes(size)
				pcall(function()
					m:ScaleTo(m:GetScale() * (4.5 * gunSkin.size / 100) / math.max(len, 0.1))
				end)
				local bbCf, bbSize = m:GetBoundingBox()
				local modelLong, modelMid = majorAxes(bbSize)
				m.WorldPivot = frame(bbCf.Position, bbCf:VectorToWorldSpace(modelLong), bbCf:VectorToWorldSpace(modelMid))
				local handleLong, handleMid = majorAxes(handle.Size)
				local lookSign = gunSkin.turn % 2 == 1 and -1 or 1
				local upSign = gunSkin.turn >= 2 and -1 or 1
				local look = handle.CFrame:VectorToWorldSpace(handleLong) * lookSign
				local up = handle.CFrame:VectorToWorldSpace(handleMid) * upSign
				local _, _, modelLen = majorAxes(bbSize)
				m:PivotTo(frame(handle.Position + look * modelLen * 0.25, look, up))
				local offsets = {}
				for _, pt in ipairs(parts) do
					offsets[pt] = handle.CFrame:ToObjectSpace(pt.CFrame)
				end
				m.Name = "RockHubGunSkin"
				m.Parent = workspace.CurrentCamera
				cur = {
					tool = tool,
					handle = handle,
					model = m,
					offsets = offsets,
					hidden = {},
					key = gunSkin.model .. gunSkin.size .. gunSkin.turn,
				}
			end

			connect(RunService.RenderStepped, function()
				if not gunSkin.on then
					return
				end
				local char = player.Character
				local tool = char and char:FindFirstChild("Gun")
				local handle = tool and tool:FindFirstChild("Handle")
				if not handle then
					if cur then
						clear()
					end
					return
				end
				local key = gunSkin.model .. gunSkin.size .. gunSkin.turn
				if not cur or cur.tool ~= tool or cur.key ~= key or not cur.model.Parent then
					local template = loadModel(gunSkin.model)
					if not template then
						return
					end
					build(tool, handle, template)
				end
				local handleCf = handle.CFrame
				for pt, offset in pairs(cur.offsets) do
					pt.CFrame = handleCf * offset
				end
				for _, x in ipairs(tool:GetDescendants()) do
					if x:IsA("BasePart") and x.LocalTransparencyModifier < 1 then
						x.LocalTransparencyModifier = 1
						cur.hidden[x] = true
					end
				end
			end)
			local sec = addSection(visualsTab, "Gun Skin", "Models")
			sec:Toggle("AWM", "sniper rifle instead of the sheriff gun (only you see it)", function(on)
				gunSkin.on = on
				if not on then
					clear()
				end
				if on and not loading then
					showAlert("Sheriff only", "This feature only works when you are the Sheriff and hold the gun.", "Done")
				end
				notify("AWM: " .. (on and "On" or "Off"), on and "take out the gun" or "normal gun")
			end)
			sec:Select("Model", "AWM look", { "Green", "Black", "Classic" }, gunSkin.model, function(v)
				gunSkin.model = v
			end)
			sec:Slider("Size", 50, 200, gunSkin.size, function(v)
				gunSkin.size = v
			end, function(v)
				return v .. "%"
			end)
			local savedTurn = config["Gun Skin/turn"]
			if type(savedTurn) == "number" then
				gunSkin.turn = savedTurn
			end
			sec:Button("Rotate", "if the barrel points the wrong way", function()
				gunSkin.turn = (gunSkin.turn + 1) % 4
				setConfig("Gun Skin/turn", gunSkin.turn)
			end)
			register("Gun Skin/turn", function(v)
				if type(v) == "number" then
					gunSkin.turn = v % 4
				end
			end, function()
				return gunSkin.turn
			end, 0)

			stopAwm = function()
				gunSkin.on = false
				clear()
			end
		end
		do
			local skinCfg = {
				sel = { Knife = nil, Gun = nil },
				listType = "Knife",
				size = 100,
				glow = false,
				sparkles = false,
				trail = false,
				light = 60,
				enabled = true,
			}
			local skinRows = {
				{ "GhostK2018", "Ghost 2018", "K", "Legendary", 121944778, 2514800940, 1, 1, 1, 2513732969, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Biogun", "Biogun", "G", "Uncommon", 79401392, 4659589763, 1.5, 1.5, 1.5, 4659627458, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Skulls_K_2021", "Skulls 2021", "K", "Uncommon", 121944778, 7756610618, 1, 1, 1, 7800220325, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "AmericaGun", "America", "G", "Classic", 25298496, 164669251, 1.5, 1.5, 1.5, 164676043, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Frozen_K_2022", "Frozen 2022", "K", "Common", 121944778, 4528568803, 1, 1, 1, 11834404402, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe", "Gingerscythe (Rare)", "K", "Rare", 15397894467, 15397714781, 0.9733, 0.9733, 0.9733, 15683138101, 0, -0.9894, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Legendary", "Gingerscythe (Legendary)", "K", "Legendary", 15397894467, 15397484015, 0.9733, 0.9733, 0.9733, 15683140564, 0, -0.9894, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Jack", "Jack", "K", "Rare", 121944778, 315094945, 1.0005, 1, 1, 315099010, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Space", "Space", "K", "Rare", 957726558, 3183404232, 1, 1, 1, 3183607442, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Splash", "Splash", "K", "Legendary", 121944778, 235343795, 1, 1, 1, 235371439, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gifts_K_2019", "Gifts 2019", "K", "Common", 957726558, 4534828383, 1, 1, 1, 4534856285, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bones_K_2024", "Bones 2024", "K", "Uncommon", 6600901997, 89105172362040, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RandLuger", "Glitch2", "K", "Common", 121944778, 191784815, 1, 1, 1, 196751515, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Kool", "Yellow", "K", "Common", 121944778, 473621021, 1, 1, 1, 473625906, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "WebbedK", "Webbed", "K", "Common", 957726558, 4210410097, 1, 1, 1, 4210949599, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Witch_K_2022", "Witchbrew", "K", "Uncommon", 957726558, 11245959206, 1, 1, 1, 11254115609, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "PredatorKnife", "Predator", "K", "Legendary", 121944778, 199611278, 1, 1, 1, 235372015, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eyeball_K_2022", "Eyeball", "K", "Common", 121944778, 11217645677, 1, 1, 1, 11254065007, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Heart_K_2023", "Heart", "K", "Rare", 10855586895, 12248435132, 1, 1, 1, 12339327069, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Butterflies_G_2025", "Butterflies", "G", "Rare", 79401392, 124763121225655, 1.6, 1.6, 1.6, 135662872427976, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Tulip", "Tulip", "K", "Common", 121944778, 387468258, 1, 1, 1, 387874661, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sharky_K_2024", "Sharky", "K", "Rare", 6600901997, 18321899067, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ScratchBlue", "Scratch · ScratchBlue", "K", "Legendary", 121944778, 1311186323, 1, 1, 1, 1133316381, 0, -0.9885, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "MLG", "Shiny", "K", "Legendary", 121944778, 473623765, 1, 1, 1, 473626979, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Slate", "Slate", "K", "Common", 121944778, 161577504, 1, 1, 1, 198453556, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cherry", "Cherry", "K", "Common", 121944778, 155195316, 1, 1, 1, 6711852603, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Love", "Love", "K", "Common", 121944778, 192527236, 1, 1, 1, 196750845, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snoop", "Red", "K", "Uncommon", 121944778, 473621136, 1, 1, 1, 473626150, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Linked", "Linked", "K", "Common", 121944778, 172762850, 1, 1, 1, 198453528, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Elite", "Elite", "K", "Legendary", 121944778, 241077941, 1, 1, 1, 241095344, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ZombieK2018", "Zombie 2018", "K", "Uncommon", 121944778, 103728247210594, 1, 1, 1, 2513734908, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eyes_K_2020", "Watcher 2020", "K", "Common", 957726558, 5866358413, 1, 1, 1, 5866438542, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Aurora_K_2019", "Aurora 2019", "K", "Rare", 957726558, 4534823003, 1, 1, 1, 4534860689, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerbread_K_2022", "Gingerbread 2022", "K", "Rare", 121944778, 11802560347, 1, 1, 1, 11834399071, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SlimyK", "Slimy", "K", "Common", 957726558, 4210874138, 1, 1, 1, 4210932676, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Witched", "Witched", "K", "Legendary", 957726558, 4210410129, 1, 1, 1, 4210938270, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "MoltenKnife", "Molten", "K", "Rare", 121944778, 472483450, 1, 1, 1, 235371809, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "StickersX_K_2022", "Stickers 2022 · StickersX_K_2022", "K", "Common", 957726558, 11823434191, 1, 1, 1, 11834387858, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Moons", "Moons", "K", "Uncommon", 121944778, 531835087, 1, 1, 1, 531873154, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VampireK2018", "Vampire 2018", "K", "Rare", 121944778, 2513708625, 1, 1, 1, 2513734708, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "JD", "JD", "K", "Legendary", 121944778, 559676009, 1, 1, 1, 566867312, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pumpkin_K_2020", "Pumpkin 2020", "K", "Uncommon", 957726558, 5872477622, 1, 1, 1, 5872490600, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghosts_K_2023", "Ghosts 2023", "K", "Common", 121944778, 15037729398, 1, 1, 1, 15091326116, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Fireplace_K_2023", "Fireplace", "K", "Uncommon", 121944778, 15382624195, 1, 1, 1, 15635558021, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gift_K_2020", "Wrap", "K", "Uncommon", 121944778, 6121854102, 1, 1, 1, 6121854816, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Survivors_K_2022", "Makeshift", "K", "Rare", 121944778, 11218956882, 1, 1, 1, 11254180750, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Love_K_2023", "Love 2023", "K", "Common", 10855586895, 12248652835, 1, 1, 1, 12339328595, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Fade", "Fade", "K", "Legendary", 121944778, 288136894, 1, 1, 1, 315501640, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Branches", "Branches", "K", "Uncommon", 957726558, 4210409800, 1, 1, 1, 4210943691, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyAxeBlue", "Blue Swirly", "K", "Unique", 8293463844, 74192567120797, 0.0579, 0.0579, 0.0579, 9552048857, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Candle_K_2020", "Candle", "K", "Common", 957726558, 5872478022, 1, 1, 1, 5872491708, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wavy_K_2024", "Wavy", "K", "Common", 6600901997, 16846003250, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frostflame_K_2024", "Frostflame", "K", "Rare", 6600901997, 121019096457803, 1, 1, 1, 104988218477551, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Leaves_K_2023", "Leaves", "K", "Common", 6600901997, 15081802321, 1, 1, 1, 15091400883, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stickers_X_K_2024", "Stickers 2024 · Stickers_X_K_2024", "K", "Common", 6600901997, 109835260607049, 1, 1, 1, 83843575465564, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle4", "Sparkle4", "K", "Common", 121944778, 306917565, 1, 1, 1, 310712788, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wolf", "Wolf", "K", "Uncommon", 121944778, 531835092, 1, 1, 1, 531873487, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tailslide", "Tailslide", "K", "Common", 121944778, 240942385, 1, 1, 1, 305506822, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Squire", "Squire", "K", "Rare", 121944778, 243372276, 1, 1, 1, 315501560, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Clan", "Clan", "K", "Common", 121944778, 161495171, 1, 1, 1, 235366460, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghosts_K_2020", "Ghosts 2020", "K", "Uncommon", 957726558, 5866362606, 1, 1, 1, 5866442790, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Constellation", "Constellation · Constellation", "G", "Godly", 124598402927958, 79010754957272, 0.1007, 0.1007, 0.1007, 114197436469014, 0, -0.2701, 0.7265, 1, 0, 0, 0, 0.9999, 0.0125, 0, -0.0125, 0.9999 },
				{ "Ornaments_K_2020", "Ornaments 2020", "K", "Common", 957726558, 6121852598, 1, 1, 1, 6121853160, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bats", "Bats (Rare)", "K", "Rare", 121944778, 531836446, 1, 1, 1, 531873625, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stockings_K_2022", "Stockings 2022", "K", "Uncommon", 957726558, 11824212997, 1, 1, 1, 11834392930, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghastly_K_2023", "Ghastly", "K", "Rare", 121944778, 15029785979, 1, 1, 1, 15091407068, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cookie_K_2021", "Cookie", "K", "Uncommon", 121944778, 8275035982, 1, 1, 1, 8304752586, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Web", "Web", "K", "Legendary", 121944778, 315110729, 1, 1, 1, 315104004, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Santa_K_2018", "Santa 2018", "K", "Common", 121944778, 2659488082, 1, 1, 1, 2669637780, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandySwirl_K_2019", "Candy Swirl", "K", "Rare", 957726558, 4534829449, 1, 1, 1, 4534860226, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cane_K_2018", "Cane 2018", "K", "Rare", 121944778, 2659489980, 1, 1, 1, 2669638508, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Meltdown_K_2023", "Meltdown", "K", "Uncommon", 957726558, 15035536803, 1, 1, 1, 15091340751, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowy2017", "Snowy 2017", "K", "Rare", 121944778, 1268287181, 1, 1, 1, 1268705947, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Slashed_K_2020", "Slashed", "K", "Common", 957726558, 5929316036, 1, 1, 1, 5929317433, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GreenFire", "Green Fire", "K", "Legendary", 121944778, 1268253789, 1, 1, 1, 1268706374, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowflakes_K_2019", "Snowflakes 2019", "K", "Common", 121944778, 4534831727, 1, 1, 1, 4534855045, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Shaded", "Shaded", "K", "Common", 957726558, 4659587929, 1, 1, 1, 4659636085, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ZombifiedK", "Zombified", "K", "Uncommon", 121944778, 114781782298919, 1, 1, 1, 4210928053, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Ancient", "Gingerscythe (Ancient)", "K", "Ancient", 15395668244, 15409195246, 0.0638, 0.0638, 0.0638, 15683188776, 0, -0.22, 0.944, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Reaver_Godly", "Reaver (Godly)", "K", "Godly", 7774174974, 7774175135, 0.25, 0.2499, 0.25, 7791511648, 0, -0.9987, -0.0037, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Canes_K_2023", "Canes", "K", "Uncommon", 121944778, 15381447325, 1, 1, 1, 15635574962, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CamoKnife", "Camo", "K", "Uncommon", 121944778, 3183403069, 1, 1, 1, 3183606225, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SketchYT", "Sketchy", "K", "Common", 121944778, 539831264, 1, 1, 1, 546161470, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hunter_K_2022", "Hunter", "K", "Common", 121944778, 11246309889, 1, 1, 1, 11254154978, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "OverseerKnife", "Overseer", "K", "Legendary", 121944778, 198299790, 1, 1, 1, 198458910, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SilentNight_K_2020", "Silent Night", "K", "Rare", 957726558, 6121850778, 1, 1, 1, 6121851313, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Beach_K_2023", "Beach", "K", "Legendary", 6600901997, 13894391232, 1, 1, 1, 13944136198, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Clownfish_K_2024", "Clownfish", "K", "Common", 6600901997, 18321899540, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Moon_K_2021", "Moon", "K", "Common", 121944778, 7756612294, 1, 1, 1, 7800224197, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Skulls", "Skulls", "K", "Legendary", 957726558, 4210409968, 1, 1, 1, 4210915060, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sweetheart", "Sweetheart", "K", "Common", 121944778, 363142139, 1, 1, 1, 363150761, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Zombified_K_2022", "Zombified 2022", "K", "Rare", 121944778, 11218741536, 1, 1, 1, 11254182560, 0, -1.0087, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SnakebiteK", "Snakebite", "K", "Rare", 957726558, 4210409981, 1, 1, 1, 4210939388, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Waves_K_2024", "Waves 2024", "K", "Rare", 6600901997, 18321898887, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandyCorn_K_2022", "Candy Corn 2022", "K", "Common", 121944778, 11217550170, 1, 1, 1, 11254057417, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CottonCandy", "Cotton Candy", "K", "Legendary", 121944778, 435754345, 1, 1, 1, 435933179, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Static", "Static", "K", "Common", 121944778, 365566391, 1, 1, 1, 365568163, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bats_K_2020", "Bats 2020", "K", "Common", 957726558, 5930584000, 1, 1, 1, 5930729222, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Portal_K_2020", "Portal", "K", "Rare", 957726558, 5866364902, 1, 1, 1, 5866444722, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerbread_K_2019", "Gingerbread 2019", "K", "Uncommon", 957726558, 4534824961, 1, 1, 1, 4534856940, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GhostRbx_K_2022", "Ghostly", "K", "Uncommon", 121944778, 11117362816, 1, 1, 1, 11117375743, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Rose_K_2023", "Rose", "K", "Uncommon", 10855586895, 12238708500, 1, 1, 1, 12339325736, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "LMFAO", "Pink", "K", "Uncommon", 121944778, 473621215, 1, 1, 1, 473626473, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Swirl_K_2021", "Swirl", "K", "Rare", 121944778, 8294015413, 1, 1, 1, 8304757110, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Dew", "Black", "K", "Rare", 121944778, 473621267, 1, 1, 1, 473626646, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Holly_K_2018", "Holly", "K", "Uncommon", 121944778, 2664997532, 1, 1, 1, 2669638990, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ribbon_K_2023", "Ribbon", "K", "Common", 957726558, 15332484220, 1, 1, 1, 15635552019, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Chips", "Blue", "K", "Uncommon", 121944778, 473621164, 1, 1, 1, 473626317, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Candles_K_2024", "Candles", "K", "Common", 6600901997, 137012419503995, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wreaths_K_2024", "Wreaths", "K", "Uncommon", 6600901997, 100835235112831, 1, 1, 1, 78432760615312, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wrapped_K_2024", "Wrapped 2024", "K", "Uncommon", 6600901997, 73121682334065, 1, 1, 1, 72638846676083, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghosts_K_2024", "Ghosts 2024", "K", "Common", 6600901997, 128247285156176, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerbread2017", "Gingerbread 2017", "K", "Rare", 121944778, 1268295971, 1, 1, 1, 1268705527, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hearts", "Hearts", "K", "Common", 121944778, 363311795, 1, 1, 1, 363362737, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sweater_K_2018", "Sweater 2018", "K", "Uncommon", 121944778, 2664997385, 1, 1, 1, 2669640567, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Candied_K_2022", "Candied", "K", "Common", 121944778, 11802560748, 1, 1, 1, 11834384755, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cracks_K_2021", "Cracks", "K", "Common", 121944778, 7756612787, 1, 1, 1, 7800224981, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Aurora_K_2021", "Aurora 2021", "K", "Legendary", 121944778, 8275036346, 1, 1, 1, 8304750877, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "MummyK2018", "Mummy 2018", "K", "Uncommon", 121944778, 2513648136, 1, 1, 1, 2513733542, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle2", "Sparkle2", "K", "Common", 121944778, 306914370, 1, 1, 1, 310710191, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "PumpkinPie_K_2023", "Pumpkin Pie", "K", "Uncommon", 121944778, 15320084464, 1, 1, 1, 15413117611, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle9", "Sparkle9", "K", "Common", 121944778, 306919809, 1, 1, 1, 310715104, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Igloo_K_2024", "Igloo", "K", "Common", 6600901997, 126697433046307, 1, 1, 1, 73203940450745, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammer_Ancient", "Icecrusher (Ancient)", "K", "Ancient", 11848711686, 11850483027, 0.07, 0.07, 0.07, 11855274019, -0.0075, -1.0949, 0.0014, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Doritos", "Purple", "K", "Rare", 121944778, 473621310, 1, 1, 1, 473626740, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frostflame_G_2024", "Frostflame", "G", "Rare", 79401392, 76059118984667, 1.6, 1.6, 1.6, 114781759936576, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Grind", "Grind", "K", "Common", 121944778, 240937041, 1, 1, 1, 305503942, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Blossom", "Blossom", "K", "Common", 121944778, 363138170, 1, 1, 1, 363150561, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cane_K_2021", "Cane 2021", "K", "Common", 121944778, 8293557762, 1, 1, 1, 8304750295, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sandy", "Sandy", "K", "Common", 121944778, 365566396, 1, 1, 1, 365568056, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stainless", "Stainless", "K", "Common", 121944778, 91790701, 1, 1, 1, 235366771, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tiger", "Tiger", "K", "Uncommon", 957726558, 3183403283, 1, 1, 1, 3183606579, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Kraken_K_2024", "Kraken", "K", "Rare", 6600901997, 127474140762204, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Meadow_G_2025", "Meadow", "G", "Uncommon", 79401392, 107182071164823, 1.6, 1.6, 1.6, 107321881182350, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "PumpkinPatch", "Pumpkin", "K", "Common", 957726558, 4210409792, 1, 1, 1, 4210931354, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Fusion", "Fusion", "K", "Legendary", 121944778, 365566399, 1, 1, 1, 365569686, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Future", "Future", "K", "Uncommon", 121944778, 163926951, 1, 1, 1, 197639041, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ollie", "Ollie", "K", "Common", 121944778, 240941633, 1, 1, 1, 305504399, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ToxicK", "Toxic", "K", "Rare", 121944778, 2513648163, 1, 1, 1, 2513734535, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Dark_K_2023", "Darkknife", "K", "Rare", 121944778, 15081468336, 1, 1, 1, 15091343579, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Chromatic_K_2023", "Chromatic", "K", "Legendary", 6600901997, 12927939898, 1, 1, 1, 12965304445, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frostfade_K_2023", "Frostfade", "K", "Legendary", 6600901997, 15344578184, 1, 1, 1, 15635565488, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sub", "Sub", "K", "Common", 121944778, 545569636, 1, 1, 1, 546159250, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stickers_K_2021", "Stickers 2021 · Stickers_K_2021", "K", "Common", 121944778, 7757619418, 1, 1, 1, 7800229084, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hardened", "Hardened", "K", "Common", 957726558, 3183401814, 1, 1, 1, 3183605810, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Robot_K_2024", "Robot", "K", "Rare", 6600901997, 16833551908, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Spider_K_2023", "Spider 2023", "K", "Common", 957726558, 15091217506, 1, 1, 1, 15091399982, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Jellyfish_K_2024", "Jellyfish", "K", "Uncommon", 6600901997, 18321899333, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Circuit", "Circuit", "K", "Uncommon", 121944778, 155356565, 1, 1, 1, 235366945, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Infected_K_2022", "Infected 2022", "K", "Common", 121944778, 11217988441, 1, 1, 1, 11254175272, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "HotChocolate_K_2024", "Hot Chocolate", "K", "Common", 6600901997, 105940775587606, 1, 1, 1, 133307062463653, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "HauntedK", "Haunted", "K", "Common", 121944778, 2513648134, 1, 1, 1, 2513733741, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sweater", "Sweater", "K", "Uncommon", 121944778, 1268293368, 1, 1, 1, 1268704902, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Missing", "Missing", "K", "Uncommon", 121944778, 163625649, 1, 1, 1, 198455936, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sunny_G_2025", "Sunny", "G", "Rare", 79401392, 105937622090347, 1.6, 1.6, 1.6, 93906279038399, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Logcutter_K_2024", "Logcutter", "K", "Rare", 6600901997, 73375064666195, 1, 1, 1, 71088901904009, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Webs", "Webs", "K", "Uncommon", 121944778, 1133322612, 1, 1, 1, 1133325465, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Reindeer_K_2024", "Reindeer", "K", "Common", 6600901997, 121109734938655, 1, 1, 1, 109101361674956, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "DeepSea", "Deep Sea", "K", "Rare", 957726558, 4659571247, 1, 1, 1, 4659634072, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Noodle_K_2023", "Pool Noodle", "K", "Uncommon", 6600901997, 13895318303, 1, 1, 1, 13944133313, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Galaxy", "Galaxy", "K", "Rare", 121944778, 192367012, 1, 1, 1, 192480941, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Spring_K_2024", "Spring", "K", "Rare", 957726558, 16830850572, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Coal_K_2022", "Coal 2022", "K", "Common", 121944778, 11802560508, 1, 1, 1, 11834390120, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Leaf", "Leaf", "K", "Common", 957726558, 4659588788, 1, 1, 1, 4659636452, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Emerald", "Emerald", "K", "Legendary", 121944778, 173946596, 1, 1, 1, 198461276, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Starry_K_2021", "Starry 2021", "K", "Rare", 121944778, 8303534347, 1, 1, 1, 8304757707, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stockings_G_2024", "Stockings 2024", "G", "Common", 6600918074, 75065116268922, 0.0384, 0.0388, 0.0369, 76288270695961, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ginger_K_2018", "Ginger 2018", "K", "Legendary", 121944778, 2659488706, 1, 1, 1, 2669638742, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowfall_K_2023", "Snowfall", "K", "Common", 957726558, 15381549802, 1, 1, 1, 15635568751, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Brains", "Brains", "K", "Common", 121944778, 531864479, 1, 1, 1, 531873956, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Skool", "Skool", "K", "Common", 121944778, 178200933, 1, 1, 1, 295269977, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Valentine", "Valentine", "K", "Common", 121944778, 363139123, 1, 1, 1, 363362726, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frosty", "Frosty", "K", "Uncommon", 121944778, 1268375270, 1, 1, 1, 1268704507, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Giftbag_K_2020", "Gift Bag", "K", "Common", 957726558, 6121846201, 1, 1, 1, 6121847170, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandyCorn_K_2020", "Candy Corn 2020", "K", "Common", 957726558, 5866354929, 1, 1, 1, 5866435364, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frozen_K_2019", "Frozen 2019", "K", "Uncommon", 957726558, 4528568803, 1, 1, 1, 4534857523, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "OrangeMarble", "Orange Marble", "K", "Rare", 121944778, 531653125, 1, 1, 1, 531873011, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gifted", "Gifted", "K", "Uncommon", 121944778, 190131936, 1, 1, 1, 197627734, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Dungeon", "Dungeon", "K", "Rare", 957726558, 4210409814, 1, 1, 1, 4210920512, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle5", "Sparkle5", "K", "Common", 121944778, 306909649, 1, 1, 1, 310713235, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Godly", "Gingerscythe (Godly)", "K", "Godly", 15397282571, 15409017869, 0.0696, 0.0696, 0.0697, 15683175970, 0, -0.94, -0.063, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Rainbow", "Rainbow (Rare)", "K", "Rare", 121944778, 157019835, 1, 1, 1, 159747377, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cardboard", "Cardboard", "K", "Common", 121944778, 159435782, 1, 1, 1, 235366729, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Passion", "Passion", "K", "Common", 121944778, 363139004, 1, 1, 1, 363150334, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Rune", "Rune", "K", "Legendary", 121944778, 3183404423, 1, 1, 1, 3183607894, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bleached", "Bleached", "K", "Common", 121944778, 311711104, 1, 1, 1, 315500879, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "TravelerAxeRed", "Red Traveler's", "K", "Unique", 15057341638, 129174189928841, 0.0681, 0.0681, 0.0681, 15695405379, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Vines_K_2023", "Vines", "K", "Common", 957726558, 15037307112, 1, 1, 1, 15091325210, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowman_K_2021", "Snowman 2021", "K", "Uncommon", 121944778, 8275035798, 1, 1, 1, 8304753468, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghosts_K_2021", "Wraiths", "K", "Uncommon", 121944778, 7808358755, 1, 1, 1, 7808362279, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Krypto", "Krypto", "K", "Rare", 121944778, 155572642, 1, 1, 1, 198458841, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ElderwoodKnife", "Elderwood Blade", "K", "Godly", 11238166013, 11238176757, 0.07, 0.07, 0.07, 11254879631, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Reptile", "Reptile", "K", "Common", 121944778, 162671092, 1, 1, 1, 162672131, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowflake_K_2022", "Snowflake 2022", "K", "Uncommon", 957726558, 11823783274, 1, 1, 1, 11834397133, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eclipse_K_2023", "Eclipse", "K", "Uncommon", 121944778, 15081587332, 1, 1, 1, 15091404278, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Storm_K_2024", "Storm", "K", "Rare", 6600901997, 124972846638078, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Scratch", "Scratch · Scratch", "K", "Legendary", 121944778, 531835091, 1, 1, 1, 531873371, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SantasMagic", "Santa's Magic", "K", "Legendary", 957726558, 4535479726, 1, 1, 1, 4535483042, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Palms_K_2024", "Palms", "K", "Legendary", 6600901997, 18351264716, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Darkness_K_2022", "Darkness", "K", "Common", 121944778, 11217282454, 1, 1, 1, 11254081561, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Constellation_K_2024", "Nightstar", "K", "Legendary", 6600901997, 125699146017319, 1, 1, 1, 113979322866878, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Adurite", "Adurite", "K", "Uncommon", 121944778, 192482160, 1, 1, 1, 192492943, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Prism", "Prism", "K", "Common", 121944778, 297795989, 1, 1, 1, 306046703, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "MummyK", "Mummy", "K", "Uncommon", 121944778, 91472505507923, 1, 1, 1, 1133352032, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Marble_K_2023", "Marble", "K", "Uncommon", 6600901997, 12926768989, 1, 1, 1, 12965302237, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Steel_K_2023", "Steel", "K", "Uncommon", 957726558, 15028885294, 1, 1, 1, 15091405483, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SantasSpirit", "Santa's Spirit", "K", "Legendary", 957726558, 6123356424, 1, 1, 1, 6123357775, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Doge", "Doge", "K", "Uncommon", 121944778, 159758190, 1, 1, 1, 235371276, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "EliteBlue", "Blue Elite", "K", "Legendary", 121944778, 1269369946, 1, 1, 1, 1269374321, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "WitchBrew_K_2024", "Witch's Brew", "K", "Uncommon", 6600901997, 101625224396969, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Log", "Log", "K", "Common", 121944778, 365566383, 1, 1, 1, 365567962, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bunny", "Bunny", "K", "Common", 121944778, 387366668, 1, 1, 1, 387874365, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Combat", "Combat", "K", "Common", 121944778, 3183532466, 1, 1, 1, 3183604570, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Mistletoe_K_2022", "Mistletoe", "K", "Uncommon", 957726558, 11823994753, 1, 1, 1, 11834394793, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Nether", "Nether", "K", "Rare", 121944778, 166089996, 1, 1, 1, 197657098, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Starfish_K_2024", "Starfish", "K", "Common", 6600901997, 18321898656, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Brush", "Brush", "K", "Uncommon", 121944778, 5435976404, 1, 1, 1, 365568602, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "XmasStickers_K_2021", "Stickers 2021 · XmasStickers_K_2021", "K", "Common", 121944778, 8275034832, 1, 1, 1, 8304755417, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Monster_K_2024", "Monster", "K", "Uncommon", 6600901997, 136318121608837, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Fragile_K_2023", "Fragile", "K", "Common", 6600901997, 12936083164, 1, 1, 1, 12965294432, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RedFire", "Red Fire", "K", "Legendary", 121944778, 1269255990, 1, 1, 1, 1269256860, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GreenMarble", "Green Marble", "K", "Rare", 121944778, 110469751488021, 1, 1, 1, 1133366830, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerheart_K_2024", "Gingerheart", "K", "Uncommon", 6600901997, 77403934219171, 1, 1, 1, 115273559455814, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowglobe_K_2023", "Snowglobe", "K", "Rare", 121944778, 15382647009, 1, 1, 1, 15635576863, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Latte_K_2023", "Latte", "K", "Legendary", 121944778, 15319905553, 1, 1, 1, 15413114703, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wood_K_2023", "Wood", "K", "Common", 957726558, 15036170420, 1, 1, 1, 15091401811, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Magma_K_2021", "Magma 2021", "K", "Rare", 121944778, 7756613022, 1, 1, 1, 7800225996, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Goo", "Goo", "K", "Common", 121944778, 178402851, 1, 1, 1, 237336076, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wanwood", "Wanwood", "K", "Uncommon", 121944778, 159653725, 1, 1, 1, 192132094, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Trees_K_2020", "Trees", "K", "Common", 957726558, 75614417738235, 1, 1, 1, 6123336879, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gifts_K_2024", "Gifts 2024", "K", "Common", 6600901997, 80884642545249, 1, 1, 1, 129290011017110, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Lights_K_2019", "Lights 2019", "K", "Uncommon", 121944778, 4534825993, 1, 1, 1, 4534858185, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "TNL", "TNL", "K", "Common", 121944778, 201480146, 1, 1, 1, 201542790, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Elf2017", "Elf 2017", "K", "Common", 121944778, 1268702375, 1, 1, 1, 1268703023, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gothic_K_2021", "Gothic", "K", "Uncommon", 121944778, 7756611289, 1, 1, 1, 7800221141, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowflake_K_2018", "Snowflake 2018", "K", "Uncommon", 121944778, 2659487731, 1, 1, 1, 2669639913, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stalker", "Stalker", "K", "Uncommon", 121944778, 155313728, 1, 1, 1, 198455980, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hazard_K_2022", "Hazard", "K", "Uncommon", 121944778, 11217121434, 1, 1, 1, 11254083234, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "PotionK2018", "Potion 2018", "K", "Uncommon", 957726558, 2513648150, 1, 1, 1, 2513733987, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Marley", "Green", "K", "Common", 121944778, 473620972, 1, 1, 1, 473625785, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bells_K_2023", "Bells", "K", "Common", 121944778, 15382279697, 1, 1, 1, 15635570486, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Lovely", "Lovely", "K", "Common", 957726558, 4659572197, 1, 1, 1, 4659635584, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stars_K_2023", "Stars", "K", "Uncommon", 957726558, 15381316403, 1, 1, 1, 15635559978, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Present", "Present", "K", "Common", 121944778, 1268314631, 1, 1, 1, 1268699212, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Zombie_K_2023", "Zombie 2023", "K", "Uncommon", 957726558, 11218741536, 1, 1, 1, 15091339932, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Copper", "Copper", "K", "Common", 121944778, 3183401534, 1, 1, 1, 3183605392, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Vampire_K_2022", "Vampire 2022", "K", "Legendary", 121944778, 11215450234, 1, 1, 1, 11254125546, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Abstract", "Abstract", "K", "Rare", 121944778, 5437299417, 1, 1, 1, 365569428, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ornament2", "Ornament2", "K", "Common", 121944778, 331744472, 1, 1, 1, 331745341, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Arctic_K_2022", "Arctic", "K", "Legendary", 121944778, 11802561076, 1, 1, 1, 11834401547, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pine_K_2019", "Pine", "K", "Common", 957726558, 4534830880, 1, 1, 1, 4534855710, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Jigsaw", "Jigsaw", "K", "Uncommon", 121944778, 365566397, 1, 1, 1, 365569126, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Nova", "Nova", "K", "Rare", 121944778, 198766824, 1, 1, 1, 235371686, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Xbox", "Xbox", "K", "Common", 121944778, 450680781, 1, 1, 1, 439325100, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Zombie", "Zombie", "K", "Common", 121944778, 1782551901, 1, 1, 1, 1133331875, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Musical", "Musical", "K", "Rare", 121944778, 365566387, 1, 1, 1, 365569566, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sidewinder", "Sidewinder", "K", "Common", 121944778, 295302778, 1, 1, 1, 305503783, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stockings_K_2020", "Stockings 2020", "K", "Common", 957726558, 6123161536, 1, 1, 1, 6123335682, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Choco", "Choco", "K", "Common", 121944778, 386204101, 1, 1, 1, 387874991, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle10", "Sparkle10", "K", "Common", 121944778, 306921666, 1, 1, 1, 310715768, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle8", "Sparkle8", "K", "Common", 121944778, 306913268, 1, 1, 1, 310714407, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Korblox", "Korblox", "K", "Rare", 121944778, 313561541, 1, 1, 1, 315501501, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Aqua", "Aqua", "K", "Common", 121944778, 250006854, 1, 1, 1, 315501208, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Donut", "Donut", "K", "Uncommon", 121944778, 161529618, 1, 1, 1, 235366815, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Spectrum", "Spectrum", "K", "Rare", 121944778, 162718300, 1, 1, 1, 198458862, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Skull_K_2023", "Etched", "K", "Common", 957726558, 15029874889, 1, 1, 1, 15091321393, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SlimeK", "Slime", "K", "Common", 121944778, 2513648162, 1, 1, 1, 2513734227, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowman_K_2018", "Snowman 2018", "K", "Common", 121944778, 2659487396, 1, 1, 1, 2669640152, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GraveK", "Grave", "K", "Common", 2514683594, 2513648160, 1, 1, 1, 2513728474, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Coal_K_2021", "Coal 2021", "K", "Common", 121944778, 8275036203, 1, 1, 1, 8304751659, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sleigh_K_2024", "Sleigh", "K", "Rare", 6600901997, 85646229893233, 1, 1, 1, 74917318027165, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tree_K_2021", "Tree 2021", "K", "Uncommon", 121944778, 8275034131, 1, 1, 1, 8304756423, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Mummy_K_2020", "Mummy 2020", "K", "Uncommon", 121944778, 5866365511, 1, 1, 1, 5866447521, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Carved_K_2020", "Carved", "K", "Common", 957726558, 5866356691, 1, 1, 1, 5866436906, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Damp", "Damp", "K", "Rare", 121944778, 161673042, 1, 1, 1, 198461253, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frosted_K_2019", "Frosted", "K", "Common", 957726558, 4534831933, 1, 1, 1, 4534853444, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowman", "Snowman", "K", "Uncommon", 121944778, 5538532923, 1, 1, 1, 331745799, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Phantom", "Phantom", "K", "Common", 121944778, 1132701173, 1, 1, 1, 1133332075, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bio_K_2023", "Bio", "K", "Rare", 6600901997, 12926766355, 1, 1, 1, 12965298174, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ice", "Ice", "K", "Common", 121944778, 161313071, 1, 1, 1, 191976710, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandyCorn2019", "Candy Corn 2019", "K", "Common", 121944778, 4210409803, 1, 1, 1, 4210934082, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Denis", "Denis", "K", "Common", 121944778, 539825831, 1, 1, 1, 546161062, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Broken_K_2023", "Broken", "K", "Legendary", 10855586895, 12237805628, 1, 1, 1, 12339323856, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BatsK", "Bats (Common)", "K", "Common", 121944778, 2513648113, 1, 1, 1, 2513732731, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Coal", "Coal", "K", "Common", 121944778, 1268280806, 1, 1, 1, 1268699677, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Present_K_2023", "Present 2023", "K", "Common", 121944778, 15382053242, 1, 1, 1, 15635553149, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hive", "Hive", "K", "Uncommon", 121944778, 314921929, 1, 1, 1, 315501434, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Euro", "Euro", "K", "Common", 121944778, 240940193, 1, 1, 1, 305504173, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bones_K_2020", "Bones 2020", "K", "Rare", 957726558, 5872477763, 1, 1, 1, 5872492951, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Icecracker_K_2020", "Icecracker", "K", "Legendary", 957726558, 6121847917, 1, 1, 1, 6121848805, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle7", "Sparkle7", "K", "Common", 121944778, 306913560, 1, 1, 1, 310714089, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Corl", "Corl", "K", "Common", 121944778, 545392975, 1, 1, 1, 546161858, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle3", "Sparkle3", "K", "Common", 121944778, 306916804, 1, 1, 1, 310710694, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Carrot", "Carrot", "K", "Common", 121944778, 387418042, 1, 1, 1, 387874071, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Icicles_K_2018", "Icicles", "K", "Rare", 121944778, 2659488219, 1, 1, 1, 2669639638, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Glowy_K_2023", "Glowy", "K", "Uncommon", 121944778, 15091291377, 1, 1, 1, 15091403551, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tree2017", "Tree 2017", "K", "Uncommon", 121944778, 108294449974966, 1, 1, 1, 1268704124, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Santa", "Santa", "K", "Common", 121944778, 5359654461, 1, 1, 1, 331746096, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Coal_K_2018", "Coal 2018", "K", "Common", 121944778, 2669120347, 1, 1, 1, 2669638285, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Oily", "Oily", "K", "Common", 121944778, 314421009, 1, 1, 1, 315501170, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bats_K_2024", "Bats 2024", "K", "Common", 6600901997, 134605667915149, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Fanta", "Orange", "K", "Common", 121944778, 473621067, 1, 1, 1, 473626025, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Popsicle_K_2023", "Popsicle", "K", "Uncommon", 6600901997, 13884848877, 1, 1, 1, 13944131578, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ripper_K_2020", "Ripper", "K", "Legendary", 957726558, 5866360934, 1, 1, 1, 5866441301, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Witch", "Witch", "K", "Common", 121944778, 531836445, 1, 1, 1, 531873553, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Reaver_Ancient", "Reaver (Ancient)", "K", "Ancient", 7774148738, 7774148967, 0.2726, 0.2726, 0.2726, 7791640819, 0, -0.094, 0.0422, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Runic_K_2022", "Curse", "K", "Rare", 121944778, 11246439789, 1, 1, 1, 11254123390, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Midnight", "Midnight", "K", "Legendary", 121944778, 161367322, 1, 1, 1, 197664126, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Borders", "Borders", "K", "Common", 121944778, 155199285, 1, 1, 1, 198453499, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Toy_K_2023", "Toy", "K", "Common", 6600901997, 13884851371, 1, 1, 1, 13944128440, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ecto", "Ecto", "K", "Common", 121944778, 1132715027, 1, 1, 1, 1133331679, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Painted_K_2023", "Painted", "K", "Rare", 6600901997, 12935208652, 1, 1, 1, 12965311567, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Splatter", "Splatter", "K", "Common", 121944778, 16944380350, 1, 1, 1, 16964346058, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Plasmite", "Plasmite", "K", "Legendary", 121944778, 161369273, 1, 1, 1, 161369368, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Watcher_K_2021", "Watcher 2021", "K", "Rare", 121944778, 7756613596, 1, 1, 1, 7800227475, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Mummified", "Mummified", "K", "Common", 957726558, 4210409851, 1, 1, 1, 4210946577, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hazmat", "Hazmat", "K", "Uncommon", 121944778, 311358906, 1, 1, 1, 315501297, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stickers_K_2024", "Stickers 2024 · Stickers_K_2024", "K", "Common", 6600901997, 121348523107585, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ginger", "Ginger", "K", "Rare", 121944778, 5353674093, 1, 1, 1, 331744703, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eco", "Eco", "K", "Common", 121944778, 365566401, 1, 1, 1, 365567889, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Indy", "Indy", "K", "Common", 121944778, 240943629, 1, 1, 1, 305506951, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tree_K_2022", "Tree 2022", "K", "Rare", 957726558, 11803199540, 1, 1, 1, 11834400185, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Carrot_K_2023", "Carrot 2023", "K", "Uncommon", 6600901997, 12928323969, 1, 1, 1, 12965307410, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandyCorn_K_2024", "Candy Corn 2024", "K", "Common", 6600901997, 76315981363183, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerbread_K_2020", "Gingerbread 2020", "K", "Uncommon", 957726558, 6121849468, 1, 1, 1, 6121850031, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Traveler_K_2023", "Traveler", "K", "Legendary", 957726558, 15069923204, 1, 1, 1, 15091407901, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "HighTech", "High Tech", "K", "Uncommon", 957726558, 4659546595, 1, 1, 1, 4659635055, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bluesteel", "Bluesteel", "K", "Uncommon", 121944778, 157904876, 1, 1, 1, 159947939, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Lucky", "Lucky", "K", "Uncommon", 121944778, 365566400, 1, 1, 1, 365569265, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wrapped", "Wrapped", "K", "Uncommon", 121944778, 5366242489, 1, 1, 1, 331745500, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowman_K_2024", "Snowman 2024", "K", "Uncommon", 6600901997, 75066955538535, 1, 1, 1, 85751270338066, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowman_K_2022", "Snowman 2022", "K", "Common", 957726558, 11823641715, 1, 1, 1, 11834391469, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VoidRbx", "Void", "K", "Uncommon", 121944778, 11548074269, 1, 1, 1, 11548082732, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cursed_K_2024", "Cursed", "K", "Legendary", 6600901997, 137589393181339, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Spectral_K_2021", "Spectral", "K", "Legendary", 121944778, 7756613337, 1, 1, 1, 7800226793, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Graffiti", "Graffiti", "K", "Uncommon", 957726558, 4659573175, 1, 1, 1, 4659634630, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Moons_K_2024", "Moons 2024", "K", "Uncommon", 6600901997, 87244940102225, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pepper", "Brown", "K", "Common", 121944778, 473620934, 1, 1, 1, 473625645, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cheesy", "Cheesy", "K", "Uncommon", 121944778, 161425686, 1, 1, 1, 198455898, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Giftwrap_K_2021", "Giftwrap", "K", "Common", 121944778, 8275035514, 1, 1, 1, 8304754179, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Haunted_K_2021", "Haunted 2021", "K", "Common", 121944778, 7756611602, 1, 1, 1, 7800222135, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Floral_K_2023", "Floral", "K", "Rare", 6600901997, 13894957068, 1, 1, 1, 13944135218, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghosty", "Ghosty", "K", "Common", 121944778, 531835085, 1, 1, 1, 531873080, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Paper", "Paper", "K", "Uncommon", 121944778, 179035664, 1, 1, 1, 235366870, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Carrot_K_2024", "Carrot 2024", "K", "Uncommon", 6600901997, 16845528588, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bones", "Bones", "K", "Common", 121944778, 531836449, 1, 1, 1, 531873816, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "MagmaK", "Magma", "K", "Rare", 121944778, 1782168732, 1, 1, 1, 1133317890, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Zombie_K_2021", "Zombie 2021", "K", "Uncommon", 121944778, 7845697152, 1, 1, 1, 7800222975, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wraith_K_2022", "Wraith", "K", "Rare", 121944778, 11215449757, 1, 1, 1, 11254118399, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Melon", "Melon", "K", "Uncommon", 121944778, 311701292, 1, 1, 1, 315501369, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cavern_K_2019", "Cavern", "K", "Legendary", 957726558, 4534822092, 1, 1, 1, 4534861110, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Neon", "Neon", "K", "Common", 121944778, 159653652, 1, 1, 1, 159746637, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ornament1", "Ornament (Common)", "K", "Common", 121944778, 331744475, 1, 1, 1, 331745428, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eggs", "Egg", "K", "Common", 121944778, 386052294, 1, 1, 1, 387875405, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Roses", "Roses", "K", "Common", 121944778, 361630297, 1, 1, 1, 363352002, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frozen_K_2023", "Frozen 2023", "K", "Common", 121944778, 15382634403, 1, 1, 1, 15635556891, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle1", "Sparkle1", "K", "Common", 121944778, 306912202, 1, 1, 1, 310709709, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Checker", "Checker", "K", "Uncommon", 121944778, 160167441, 1, 1, 1, 198461230, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Summer_Stickers_K_2023", "Stickers 2023", "K", "Common", 6600901997, 13895498375, 1, 1, 1, 13944129977, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cane", "Cane", "K", "Rare", 121944778, 5359571109, 1, 1, 1, 331140746, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Jack_K_2022", "Lantern", "K", "Uncommon", 121944778, 11245572024, 1, 1, 1, 11254093910, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sorry", "Corrupt", "K", "Unique", 121944778, 162016526, 1, 1, 1, 197879343, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowflakes_K_2020", "Snowflakes 2020", "K", "Rare", 121944778, 137773102398455, 1, 1, 1, 6123338102, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Scarf_K_2023", "Scarf", "K", "Common", 121944778, 15414881863, 1, 1, 1, 15415482999, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Santa2017", "Santa 2017", "K", "Common", 121944778, 1268277801, 1, 1, 1, 1268703618, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Brains2019", "Brains 2019", "K", "Uncommon", 957726558, 4210409062, 1, 1, 1, 4210929184, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Vortex", "Vortex", "K", "Rare", 121944778, 235347825, 1, 1, 1, 235371508, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Stickers_K_2022", "Stickers 2022 · Stickers_K_2022", "K", "Common", 121944778, 11217750489, 1, 1, 1, 11254067158, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Elf", "Elf", "K", "Common", 121944778, 5364286895, 1, 1, 1, 331746317, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ribbons_K_2021", "Ribbons", "K", "Common", 121944778, 8275035072, 1, 1, 1, 8304754882, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sparkle6", "Sparkle6", "K", "Common", 121944778, 306915414, 1, 1, 1, 310713648, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RbxScary_K_2023", "Ghoulish", "K", "Common", 121944778, 114660299589667, 1, 1, 1, 14967668214, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Vampire", "Vampire", "K", "Uncommon", 121944778, 531835090, 1, 1, 1, 531873248, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Fragile_G_2023", "Fragile", "G", "Common", 79401392, 12942152157, 1.5, 1.5, 1.5, 12965349193, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GraveG", "Grave", "G", "Common", 2514719081, 2513648170, 1, 1, 1, 2513731746, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GreenCamo_K_2022", "Zombie Camo", "K", "Common", 121944778, 121944805, 1, 1, 1, 11254145154, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wrapped_G_2018", "Wrapped 2018", "G", "Common", 79401392, 124221082305936, 1.6, 1.6, 1.6, 2669787533, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Wraith_G_2022", "Wraith", "G", "Rare", 79401392, 83637468346183, 1.6, 1.6, 1.6, 11255504462, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Webs_G_2022", "Webs", "G", "Common", 79401392, 11255255382, 1.6, 1.6, 1.6, 11284147880, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "WebbedG", "Webbed", "G", "Common", 79401392, 130141624327731, 1.6, 1.6, 1.6, 4210936652, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Wavy_G_2024", "Wavy", "G", "Common", 79401392, 16846545641, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Vines_G_2023", "Vines", "G", "Common", 79401392, 15045930187, 1.6, 1.6, 1.6, 15091402817, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Vampire_G_2022", "Vampire 2022", "G", "Legendary", 79401392, 11228808312, 1.6, 1.6, 1.6, 11255503583, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Tree_G_2022", "Tree 2022", "G", "Rare", 79401392, 77983878883558, 1.6, 1.6, 1.6, 11834441321, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Traveler_G_2023", "Traveler", "G", "Legendary", 79401392, 89199801409332, 1.6, 1.6, 1.6, 15091344462, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "ToxicG", "Toxic", "G", "Rare", 79401392, 2513648169, 1.6, 1.6, 1.6, 2513742519, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Sweater_G_2018", "Sweater 2018", "G", "Uncommon", 79401392, 2664997267, 1.6, 1.6, 1.6, 2669787088, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Stockings_G_2022", "Stockings 2022", "G", "Uncommon", 79401392, 11831384378, 1.6, 1.6, 1.6, 11834440319, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "StickersX_G_2022", "Stickers 2022", "G", "Common", 79401392, 11830420444, 1.6, 1.6, 1.6, 11834432971, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Steel_G_2023", "Steel", "G", "Uncommon", 79401392, 15044112684, 1.6, 1.6, 1.6, 15091341552, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Stars_G_2023", "Stars", "G", "Uncommon", 79401392, 15383997060, 1.6, 1.6, 1.6, 15635574031, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Starry_G_2020", "Starry 2020", "G", "Common", 79401392, 5930583738, 1.6, 1.6, 1.6, 5930731295, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Starfish_G_2024", "Starfish", "G", "Common", 79401392, 18321970590, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Splat", "Splat", "G", "Common", 79401392, 3183406439, 1.6, 1.6, 1.6, 3183639522, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Spectral_G_2021", "Spectral", "G", "Legendary", 79401392, 7757802804, 1.6, 1.6, 1.6, 7800255531, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowman_G_2023", "Snowman 2023", "G", "Uncommon", 79401392, 15382659346, 1.6, 1.6, 1.6, 15635572427, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowman_G_2022", "Snowman 2022", "G", "Common", 79401392, 11830604534, 1.6, 1.6, 1.6, 11834436620, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowflakes_G_2019", "Snowflakes", "G", "Common", 79401392, 4534835479, 1.6, 1.6, 1.6, 4534866065, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowman_G_2018", "Snowman 2018", "G", "Common", 79401392, 2669119107, 1.6, 1.6, 1.6, 2669786846, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowflake_G_2023", "Snowflake 2023", "G", "Rare", 79401392, 15351058932, 1.6, 1.6, 1.6, 15635575718, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowflake_G_2022", "Snowflake 2022", "G", "Uncommon", 79401392, 11830940122, 1.6, 1.6, 1.6, 11834437796, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowflake_G_2018", "Snowflake 2018", "G", "Uncommon", 79401392, 2659487954, 1.6, 1.6, 1.6, 2669786515, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SnakebiteG", "Snakebite", "G", "Rare", 79401392, 109575851098597, 1.6, 1.6, 1.6, 4210925026, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SlimeG", "Slime", "G", "Common", 79401392, 2513648152, 1.6, 1.6, 1.6, 2513742319, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SilentNight_G_2020", "Silent Night", "G", "Rare", 79401392, 6121861331, 1.6, 1.6, 1.6, 6121862034, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Santa_G_2023", "Santa 2023", "G", "Common", 79401392, 15349904283, 1.6, 1.6, 1.6, 15635550625, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Santa_G_2018", "Elf 2018", "G", "Common", 79401392, 2664997044, 1.6, 1.6, 1.6, 2669785184, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Sandy_G_2024", "Sandy", "G", "Common", 79401392, 18323743340, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "RainbowGun", "Rainbow", "G", "Rare", 79401392, 3183408196, 1.6, 1.6, 1.6, 3183640145, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Pumpkin_G_2023", "Pumpkin", "G", "Common", 79401392, 15044730839, 1.6, 1.6, 1.6, 15091327743, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "PotionG2018", "Potion", "G", "Uncommon", 79401392, 2513648149, 1.6, 1.6, 1.6, 2513742133, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Predator", "Predator", "G", "Legendary", 79401392, 202773960, 1.6, 1.6, 1.6, 203810176, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Portal_G_2020", "Portal", "G", "Uncommon", 79401392, 5866372960, 1.6, 1.6, 1.6, 5866461926, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Popsicle_G_2024", "Popsicle", "G", "Uncommon", 79401392, 18321970792, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Pirate", "Pirate", "G", "Uncommon", 79401392, 78093206510643, 1.6, 1.6, 1.6, 3183639867, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Pine_G_2019", "Pine", "G", "Common", 79401392, 4534870630, 1.6, 1.6, 1.6, 4534871260, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Palms_G_2024", "Palms", "G", "Legendary", 79401392, 18321971106, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ornaments_G_2020", "Ornaments", "G", "Common", 79401392, 6121862915, 1.6, 1.6, 1.6, 6121863515, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Neon_G_2023", "Neon", "G", "Rare", 79401392, 15382654157, 1.6, 1.6, 1.6, 15635560825, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Mummy", "Mummy", "G", "Rare", 79401392, 315154445, 1.6, 1.6, 1.6, 315155591, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Moonlight_G_2022", "Moonlight", "G", "Uncommon", 79401392, 11254380241, 1.6, 1.6, 1.6, 11284143055, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Mistletoe_G_2022", "Mistletoe", "G", "Uncommon", 79401392, 11831277409, 1.6, 1.6, 1.6, 11834438982, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Latte_G_2023", "Latte", "G", "Legendary", 79401392, 15320206276, 1.6, 1.6, 1.6, 15413116029, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Infected_G_2022", "Infected", "G", "Common", 79401392, 11227996367, 1.6, 1.6, 1.6, 11255502768, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Icicles_G_2018", "Icicles", "G", "Rare", 79401392, 2659488496, 1.6, 1.6, 1.6, 2669786044, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Icedriller_G_2020", "Icedriller", "G", "Legendary", 79401392, 6121865669, 1.6, 1.6, 1.6, 6121866490, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "IceCamo_G_2021", "Ice Camo", "G", "Rare", 79401392, 8275032575, 1.6, 1.6, 1.6, 8304767724, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Holly_G_2018", "Holly", "G", "Uncommon", 79401392, 2664997622, 1.6, 1.6, 1.6, 2669786261, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Hazard_G_2022", "Hazard", "G", "Uncommon", 79401392, 11227146152, 1.6, 1.6, 1.6, 11255505449, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "HauntedG", "Haunted", "G", "Common", 79401392, 2513648133, 1.6, 1.6, 1.6, 2513741901, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingerbread_G_2022", "Gingerbread 2022", "G", "Rare", 79401392, 11810420546, 1.6, 1.6, 1.6, 11834442414, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingerbread_G_2021", "Gingerbread 2021", "G", "Uncommon", 79401392, 8275032201, 1.6, 1.6, 1.6, 8304772140, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingerbread_G_2020", "Gingerbread 2020", "G", "Uncommon", 79401392, 6121859173, 1.6, 1.6, 1.6, 6121860619, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ginger_G_2018", "Ginger 2018", "G", "Legendary", 79401392, 2659488834, 1.6, 1.6, 1.6, 2669785821, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gifts_G_2019", "Gifts", "G", "Common", 79401392, 4534835908, 1.6, 1.6, 1.6, 4534867381, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Giftbag_G_2020", "Gift Bag", "G", "Common", 79401392, 6121864116, 1.6, 1.6, 1.6, 6121864813, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gift_G_2020", "Wrap", "G", "Uncommon", 79401392, 6121866988, 1.6, 1.6, 1.6, 6121867603, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ghosts_G_2021", "Wraiths", "G", "Uncommon", 79401392, 7758397251, 1.6, 1.6, 1.6, 7800251557, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ghosts_G_2020", "Ghosts", "G", "Rare", 79401392, 5866372208, 1.6, 1.6, 1.6, 5866465099, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ghostfire_G_2022", "Ghostfire", "G", "Rare", 79401392, 11254634864, 1.6, 1.6, 1.6, 11284140034, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GhostG2018", "Ghost", "G", "Legendary", 79401392, 2513648114, 1.6, 1.6, 1.6, 2513741407, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ghastly_G_2023", "Ghastly", "G", "Rare", 79401392, 15045716708, 1.6, 1.6, 1.6, 15091342564, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Frozen_G_2023", "Frozen 2023", "G", "Common", 79401392, 15344638282, 1.6, 1.6, 1.6, 15635571468, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Frostfade_G_2023", "Frostfade", "G", "Legendary", 79401392, 15383614259, 1.6, 1.6, 1.6, 15635577623, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Frosted_G_2019", "Frosted", "G", "Common", 79401392, 4528661069, 1.6, 1.6, 1.6, 4534866678, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Floatie_G_2024", "Floatie", "G", "Uncommon", 79401392, 18321972013, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "FallCamo_G_2021", "Fall Camo", "G", "Uncommon", 79401392, 7758737021, 1.6, 1.6, 1.6, 7800257544, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Eyes_G_2020", "Watcher 2020", "G", "Common", 79401392, 5866372450, 1.6, 1.6, 1.6, 5866459380, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Elf_G_2023", "Elf 2023", "G", "Common", 79401392, 15349698419, 1.6, 1.6, 1.6, 15635569893, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "DefaultGun", "Default Gun", "G", "Common", 79401392, 91723031, 1.6, 1.6, 1.6, 197518111, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Darkness_G_2022", "Darkness", "G", "Common", 79401392, 11242038756, 1.6, 1.6, 1.6, 11255507374, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Dark_G_2023", "Darkgun", "G", "Rare", 79401392, 15082826256, 1.6, 1.6, 1.6, 15091406343, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cookie_G_2021", "Cookie", "G", "Uncommon", 79401392, 8275032831, 1.6, 1.6, 1.6, 8304771148, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Coal_G_2021", "Coal 2021", "G", "Common", 79401392, 8275033614, 1.6, 1.6, 1.6, 8304769409, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Coal_G_2022", "Coal 2022", "G", "Common", 79401392, 11809114380, 1.6, 1.6, 1.6, 11834434264, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Coal_G_2018", "Coal 2018", "G", "Common", 79401392, 2669120201, 1.6, 1.6, 1.6, 2669784920, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Clownfish_G_2024", "Clownfish", "G", "Common", 79401392, 18321972771, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cavern_G_2019", "Cavern", "G", "Legendary", 79401392, 128240852390197, 1.6, 1.6, 1.6, 4534875511, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cat_G_2021", "Cat", "G", "Common", 79401392, 7759004533, 1.6, 1.6, 1.6, 7800253444, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Carved_G_2020", "Carved", "G", "Common", 79401392, 5866372800, 1.6, 1.6, 1.6, 5866457985, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Carrot_G_2024", "Carrot", "G", "Uncommon", 79401392, 16856497935, 1.6, 1.6, 1.6, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Canes_G_2023", "Canes", "G", "Uncommon", 79401392, 15383886872, 1.6, 1.6, 1.6, 15635558982, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "CandySwirl_G_2019", "Candy Swirl", "G", "Rare", 79401392, 4534836730, 1.6, 1.6, 1.6, 4534874602, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cane_G_2018", "Cane 2018", "G", "Rare", 79401392, 2659489762, 1.6, 1.6, 1.6, 2669785546, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "CandyCorn_G_2022", "Candy Corn 2022", "G", "Common", 79401392, 11226919330, 1.6, 1.6, 1.6, 11255558166, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Candied_G_2022", "Candied", "G", "Common", 79401392, 11809753556, 1.6, 1.6, 1.6, 11834435627, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Brains_G_2022", "Brains", "G", "Uncommon", 79401392, 11254925304, 1.6, 1.6, 1.6, 11284145298, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Bones2019", "Bones", "G", "Uncommon", 79401392, 4210405561, 1.6, 1.6, 1.6, 4210926347, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "BatsG", "Bats", "G", "Common", 79401392, 2513648112, 1.6, 1.6, 1.6, 2513741174, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Apoc_G_2022", "Apocalypse", "G", "Common", 79401392, 11228269165, 1.6, 1.6, 1.6, 11255501940, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Arctic_G_2022", "Arctic", "G", "Legendary", 79401392, 85287913991189, 1.6, 1.6, 1.6, 11834443783, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Watcher_G_2021", "Watcher 2021", "G", "Rare", 79401392, 7757907850, 1.5, 1.5, 1.5, 7800256309, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Floral_G_2024", "Floral", "G", "Rare", 79401392, 18323742549, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Melon_G_2023", "Melon", "G", "Uncommon", 79401392, 13904908523, 1.5, 1.5, 1.5, 13944154336, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Starry_G_2021", "Starry 2021", "G", "Rare", 79401392, 8303507091, 1.5, 1.5, 1.5, 8304772774, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Toy_G_2023", "Toy", "G", "Common", 79401392, 13905642635, 1.5, 1.5, 1.5, 13944153112, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Camo", "Camo", "G", "Uncommon", 79401392, 160024546, 1.5, 1.5, 1.5, 160024789, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Star", "Star", "G", "Common", 79401392, 161642996, 1.5, 1.5, 1.5, 203807904, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GoldenGun", "Golden", "G", "Classic", 25298496, 134632723, 1.5, 1.5, 1.5, 147835357, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Wooden", "Wooden", "G", "Uncommon", 79401392, 84001524223260, 1.5, 1.5, 1.5, 238546356, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "iRevolver", "iRevolver", "G", "Rare", 79401392, 160219396, 1.5, 1.5, 1.5, 203809168, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Magma_G_2021", "Magma", "G", "Rare", 79401392, 7758322982, 1.5, 1.5, 1.5, 7800252572, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SnowmanGun", "Snowman", "G", "Uncommon", 79401392, 332496723, 1.5, 1.5, 1.5, 332497603, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Sketch", "Sketch", "G", "Uncommon", 79401392, 161976144, 1.5, 1.5, 1.5, 203808108, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "ElfGun", "Elf", "G", "Common", 79401392, 86899632763415, 1.5, 1.5, 1.5, 332767999, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ritual_G_2024", "Ritual", "G", "Rare", 79401392, 122499606241450, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SlouseClownGun", "Clown", "G", "Unique", 79401392, 4663058089, 1.5, 1.5, 1.5, 4659627976, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ornament2Gun", "Ornament2", "G", "Common", 79401392, 332496722, 1.5, 1.5, 1.5, 332497550, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "MummyG2018", "Mummy 2018", "G", "Uncommon", 79401392, 2513708668, 1.5, 1.5, 1.5, 2513741663, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "ZombifiedG", "Zombified", "G", "Uncommon", 79401392, 137443657929688, 1.5, 1.5, 1.5, 4210944924, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Aliens_G_2021", "Aliens", "G", "Common", 79401392, 94636545088559, 1.5, 1.5, 1.5, 7800250906, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "CaneGun", "Cane", "G", "Rare", 79401392, 112112286408164, 1.5, 1.5, 1.5, 332497187, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Bacon", "Bacon", "G", "Rare", 79401392, 178240361, 1.5, 1.5, 1.5, 238546467, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GingerGun", "Ginger", "G", "Rare", 79401392, 140264190350882, 1.5, 1.5, 1.5, 332497038, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Bats_G_2024", "Bats 2024", "G", "Common", 79401392, 127442391741629, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Lights_G_2019", "Lights 2019", "G", "Uncommon", 79401392, 4534840659, 1.5, 1.5, 1.5, 4534872673, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Molten", "Molten", "G", "Rare", 79401392, 160570263, 1.5, 1.5, 1.5, 203869308, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingerbread_G_2019", "Gingerbread 2019", "G", "Uncommon", 79401392, 4534842979, 1.5, 1.5, 1.5, 4534872116, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Galactic", "Galactic", "G", "Rare", 79401392, 173912996, 1.5, 1.5, 1.5, 173913533, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Engraved", "Engraved", "G", "Common", 79401392, 159670413, 1.5, 1.5, 1.5, 203807690, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SantaGun", "Santa", "G", "Common", 79401392, 76370731428901, 1.5, 1.5, 1.5, 332496861, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Nuke_G_2023", "Nuke", "G", "Rare", 79401392, 12936824008, 1.5, 1.5, 1.5, 12965335931, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "BluesteelGun", "Bluesteel", "G", "Uncommon", 79401392, 161420087, 1.5, 1.5, 1.5, 162668203, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ornament1Gun", "Ornament1", "G", "Common", 79401392, 332358313, 1.5, 1.5, 1.5, 332497144, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Bleed", "Rupture", "G", "Legendary", 79401392, 315010891, 1.5, 1.5, 1.5, 315100702, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Candleflame_G_2024", "Candleflame", "G", "Rare", 79401392, 115359559909377, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Marina", "Marina", "G", "Uncommon", 79401392, 159899596, 1.5, 1.5, 1.5, 203808190, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "XmasStickers_G_2021", "Stickers 2021 · XmasStickers_G_2021", "G", "Common", 79401392, 110585366732058, 1.6, 1.6, 1.6, 8304770115, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cracks_G_2021", "Cracks", "G", "Common", 79401392, 7758056748, 1.5, 1.5, 1.5, 7800254737, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Stickers_G_2021", "Stickers 2021 · Stickers_G_2021", "G", "Common", 79401392, 7758615144, 1.5, 1.5, 1.5, 7800257010, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "WrappedGun", "Wrapped", "G", "Uncommon", 79401392, 103005044438900, 1.5, 1.5, 1.5, 332497103, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Caution", "Caution", "G", "Uncommon", 79401392, 48737841, 1.5, 1.5, 1.5, 238546422, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "HL2", "HL2", "G", "Common", 79401392, 181689885, 1.5, 1.5, 1.5, 238546100, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "WaterBalloons_G_2024", "Balloons", "G", "Common", 79401392, 18323742698, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gun1", "Cowboy", "G", "Classic", 79401392, 79401500, 1.5, 1.5, 1.5, 144290769, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Sunset_G_2023", "Sun", "G", "Rare", 79401392, 13896017136, 1.5, 1.5, 1.5, 13944156090, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Nightfire", "Nightfire", "G", "Rare", 79401392, 4659577665, 1.5, 1.5, 1.5, 4659626966, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Frozen_G_2019", "Frozen 2019", "G", "Uncommon", 79401392, 4528661973, 1.5, 1.5, 1.5, 4534873956, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Summer_Stickers_G_2023", "Stickers 2023", "G", "Common", 79401392, 13905821320, 1.5, 1.5, 1.5, 13944151909, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ace", "Ace", "G", "Rare", 79401392, 178208194, 1.5, 1.5, 1.5, 238546577, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Asteroid", "Asteroid", "G", "Common", 79401392, 6394252363, 1.5, 1.5, 1.5, 476599365, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Mummy_G_2020", "Mummy 2020", "G", "Uncommon", 79401392, 5866372623, 1.5, 1.5, 1.5, 5866463755, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Night", "Night", "G", "Uncommon", 79401392, 159882296, 1.5, 1.5, 1.5, 159971385, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Splash_G", "Splash", "G", "Legendary", 79401392, 4659576260, 1.5, 1.5, 1.5, 4659626370, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "CandyCorn_G_2024", "Candy Corn 2024", "G", "Common", 79401392, 110799536201694, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Painted_G_2023", "Painted", "G", "Uncommon", 79401392, 12937817240, 1.5, 1.5, 1.5, 12965344675, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Spitfire", "Spitfire", "G", "Rare", 79401392, 159883934, 1.5, 1.5, 1.5, 159971321, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowman_G_2021", "Snowman 2021", "G", "Uncommon", 79401392, 8275033129, 1.5, 1.5, 1.5, 8304766932, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "VampireG2018", "Vampire 2018", "G", "Rare", 79401392, 2513708622, 1.5, 1.5, 1.5, 2513742751, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Imbued", "Imbued", "G", "Rare", 79401392, 156263287, 1.5, 1.5, 1.5, 162668312, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Pea", "Pea", "G", "Common", 79401392, 162911948, 1.5, 1.5, 1.5, 238545971, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Viper", "Viper", "G", "Legendary", 79401392, 159991281, 1.5, 1.5, 1.5, 160299600, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Universe", "Universe", "G", "Legendary", 79401392, 238542777, 1.5, 1.5, 1.5, 238546660, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "TreeGun", "Tree", "G", "Legendary", 79401392, 106909830955114, 1.5, 1.5, 1.5, 332497688, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Nutcracker", "Nutcracker", "G", "Uncommon", 79401392, 5538506180, 1.5, 1.5, 1.5, 332497657, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Infiltrator", "Infiltrator", "G", "Common", 79401392, 156265112, 1.5, 1.5, 1.5, 203806022, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Clown_G_2024", "Clown 2024", "G", "Uncommon", 79401392, 83300450889998, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "BigKill", "Big Kill", "G", "Common", 79401392, 159963965, 1.5, 1.5, 1.5, 162669041, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Aurora_G_2019", "Aurora 2019", "G", "Rare", 79401392, 70440729181948, 1.5, 1.5, 1.5, 4534875165, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "ZombieG2018", "Zombie", "G", "Uncommon", 79401392, 140056674605111, 1.5, 1.5, 1.5, 2513743298, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "RIP", "RIP", "G", "Common", 79401392, 4210409923, 1.5, 1.5, 1.5, 4210947993, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "CandyCorn_G_2020", "Candy Corn 2020", "G", "Common", 79401392, 5866371945, 1.5, 1.5, 1.5, 5866454590, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cold", "Cold", "G", "Common", 79401392, 161309663, 1.5, 1.5, 1.5, 161309889, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Leaves_G_2024", "Leaves", "G", "Uncommon", 79401392, 105437948088593, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Overseer", "Overseer", "G", "Legendary", 79401392, 162262248, 1.5, 1.5, 1.5, 175668680, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Stickers_G_2024", "Stickers 2024 · Stickers_G_2024", "G", "Common", 79401392, 89311097227409, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Sparkle", "Sparkle", "G", "Legendary", 79401392, 162976205, 1.5, 1.5, 1.5, 203869110, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Hacker", "Hacker", "G", "Rare", 79401392, 198413638, 1.5, 1.5, 1.5, 203819271, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cursed_G_2024", "Cursed", "G", "Legendary", 79401392, 134978959658778, 1.5, 1.5, 1.5, 0, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "LoveGun", "Love", "G", "Uncommon", 79401392, 159686237, 1.5, 1.5, 1.5, 203867650, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Iron", "Iron", "G", "Common", 79401392, 159707533, 1.5, 1.5, 1.5, 160201541, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Fallout", "Fallout", "G", "Common", 79401392, 172596465, 1.5, 1.5, 1.5, 175668592, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cola", "Soda", "G", "Uncommon", 79401392, 320398770, 1.5, 1.5, 1.5, 238546400, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gothic_G_2021", "Gothic", "G", "Uncommon", 79401392, 7758572472, 1.5, 1.5, 1.5, 7800253970, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Monster", "Monster", "G", "Rare", 79401392, 4210409812, 1.5, 1.5, 1.5, 4210941474, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Aid", "Juice", "G", "Common", 79401392, 7164849213, 1.5, 1.5, 1.5, 203807397, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Ripper_G_2020", "Ripper", "G", "Legendary", 79401392, 5866373797, 1.5, 1.5, 1.5, 5866460591, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Aurora_G_2021", "Aurora 2021", "G", "Legendary", 79401392, 96698273353001, 1.5, 1.5, 1.5, 8304766165, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Chromatic_G_2023", "Chromatic", "G", "Legendary", 79401392, 12937562728, 1.5, 1.5, 1.5, 12965339774, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Bit", "Bit", "G", "Common", 79401392, 178259396, 1.5, 1.5, 1.5, 238549030, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "News", "News", "G", "Common", 79401392, 178238688, 1.5, 1.5, 1.5, 238546032, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Cheddar", "Cheddar", "G", "Uncommon", 79401392, 160274812, 1.5, 1.5, 1.5, 203808317, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SawChroma", "Saw · SawChroma", "K", "Godly", 168119698, 3171086347, 0.5, 0.5, 0.55, 3187398132, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Knife1", "Splitter", "K", "Classic", 22771612, 22771560, 0.15, 0.15, 0.15, 143820641, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Icewing", "Icewing", "K", "Ancient", 3183449780, 2279588369, 0.085, 0.085, 0.085, 2669997196, -0.0001, -1, -0.1, 1, 0, 0, 0, 0.8625, -0.5061, 0, 0.5061, 0.8625 },
				{ "IceShard", "Ice Shard", "K", "Godly", 188539751, 188539820, 0.85, 0.85, 0.85, 1268710824, -0.0001, -0.0312, 1.071, 1, 0, 0, 0, -0.0842, 0.9965, 0, -0.9965, -0.0842 },
				{ "IceDragon", "Ice Dragon", "K", "Godly", 165708869, 165708903, 0.5, 0.5, 0.5, 585846454, -0.0001, -0.1514, 1.2029, 1, 0, 0, 0, 0.0802, 0.9968, 0, -0.9968, 0.0802 },
				{ "HeatChroma", "Heat · HeatChroma", "K", "Godly", 105333894, 3171194706, 0.3, 0.3, 0.3, 3187444849, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Heat", "Heat · Heat", "K", "Godly", 105333894, 105334003, 0.3, 0.3, 0.3, 3187444758, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Handsaw", "Handsaw", "K", "Godly", 54430772, 54430066, 0.4, 0.6, 0.53, 332042435, 0.0031, 0.0461, -0.803, -1, -0.0004, 0.0029, 0.0029, -0.0614, 0.9981, -0.0002, 0.9981, 0.0614 },
				{ "HallowsBlade", "Hallow's Blade", "K", "Godly", 179155055, 1132750758, 0.55, 0.55, 0.555, 1132775323, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyGunBronze", "Bronze Swirly", "G", "Unique", 8310911339, 113787938041112, 1, 1, 1, 9552063524, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingermint_KChroma", "Cookiecane", "K", "Godly", 11837984324, 11837984504, 0.0687, 0.0687, 0.0687, 11979596437, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GingerbladeChroma", "Gingerblade", "K", "Godly", 2248389833, 2248390749, 0.61, 0.61, 0.6095, 2672351679, -0.5814, 0.7932, -0.0418, 0.042, 0.6372, 0.7696, 0.0428, -0.7707, 0.6358, 0.9982, 0.0062, -0.0597 },
				{ "GhostKnife", "Ghost", "K", "Classic", 64131019, 64131051, 3, 2, 2, 144268841, -0.0001, -0.0054, -0.6642, 1, 0, 0, 0, 0.0068, -1, 0, 1, 0.0068 },
				{ "GemstoneChroma", "Gemstone · GemstoneChroma", "K", "Godly", 1626714161, 3183577898, 25, 25, 25, 3183657875, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gemstone", "Gemstone · Gemstone", "K", "Godly", 1626714161, 3183579677, 25, 25, 25, 3183657748, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frostsaber", "Frostsaber", "K", "Godly", 1192795322, 1192795941, 0.55, 0.55, 0.6, 1268934541, 0, -0.0706, 1.1513, 1, 0, 0, 0, -0.0286, 0.9996, 0, -0.9996, -0.0286 },
				{ "Frostbite", "Frostbite", "K", "Godly", 4528435571, 4528435630, 1.1, 1.1, 1.1, 4528373246, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Flames", "Flames", "K", "Godly", 238314098, 238314124, 0.6, 0.8, 0.73, 585873746, 0, 0.0027, 1.1242, 1, 0, 0, 0, 0.0654, 0.9979, 0, -0.9979, 0.0654 },
				{ "FangChroma", "Fang · FangChroma", "K", "Godly", 117500241, 0, 0.4, 0.4, 0.4, 3187397850, 0, -1, -0.1, 0.0872, 0, -0.9962, 0, 1, 0, 0.9962, 0, 0.0872 },
				{ "Fang", "Fang · Fang", "K", "Godly", 117500241, 117500388, 0.4, 0.4, 0.4, 3187397768, 0, -1, -0.1, 0.0872, 0, -0.9962, 0, 1, 0, 0.9962, 0, 0.0872 },
				{ "EternalCane", "Eternalcane", "K", "Godly", 3132923779, 4488374804, 0.95, 0.95, 0.95, 4488391411, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eternal4", "Eternal IV", "K", "Godly", 3132923779, 4999951444, 0.95, 0.95, 0.95, 4999958740, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eternal3", "Eternal III", "K", "Godly", 3132923779, 3279683257, 0.95, 0.95, 0.95, 3281170430, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eternal2", "Eternal II", "K", "Godly", 532155954, 2545251852, 0.5, 0.5, 0.5, 2545253030, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eternal", "Eternal", "K", "Godly", 532155954, 532156041, 0.45, 0.45, 0.45, 538706317, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyGunSilver", "Silver Swirly", "G", "Unique", 8310911339, 108720084988330, 1, 1, 1, 9552064240, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "DeathshardChroma", "Deathshard · DeathshardChroma", "K", "Godly", 62275962, 3167029738, 0.75, 0.75, 0.75, 3187397317, 0, -1, -0.1001, 0, 0, -1, 0, 1, 0, 1, 0, 0 },
				{ "Deathshard", "Deathshard · Deathshard", "K", "Godly", 62275962, 192567360, 0.75, 0.75, 0.75, 3175017717, 0, -1, -0.1, 0, 0, -1, 0, 1, 0, 1, 0, 0 },
				{ "Darksword", "Darksword", "K", "Godly", 15020899066, 15020899218, 0.08, 0.08, 0.08, 15080267070, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Clockwork", "Clockwork", "K", "Godly", 352571495, 352570357, 1.1, 1.6, 1.2, 360609441, 0.0002, 0.0291, 1.1578, 1, 0, 0, 0, -0.0018, 1, 0, -1, -0.0018 },
				{ "Chill", "Chill", "K", "Godly", 105329941, 105978218, 0.5, 0.5, 0.5, 332022166, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandyCorn", "CandyCorn", "K", "Common", 121944778, 1311187229, 1, 1, 1, 1133337797, 0, -0.9885, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandleflameChroma", "Candleflame", "K", "Godly", 7791364860, 7791364988, 0.065, 0.065, 0.065, 7806149582, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BonebladeChroma", "Boneblade", "K", "Godly", 1857106669, 2516324337, 0.7, 0.7, 0.7, 2513597845, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BlueSeer", "Blue Seer", "K", "Godly", 156092238, 3184062977, 0.7, 0.91, 1, 3184139996, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BloodKnife", "Blood", "K", "Classic", 51682254, 51941734, 0.5, 0.5, 0.3, 144307188, 0, -0.0504, -0.3497, 1, 0, 0, 0, -0.0392, -0.9992, 0, 0.9992, -0.0392 },
				{ "BattleAxe", "BattleAxe", "K", "Godly", 1084767698, 1084767901, 0.56, 0.56, 0.56, 1133237368, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Nightblade", "Nightblade", "K", "Godly", 103838505, 103838996, 0.7, 0.45, 0.5, 475478854, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "OrangeSeer", "Orange Seer", "K", "Godly", 156092238, 7443788709, 0.7, 0.91, 1, 3184139504, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Peppermint", "Peppermint", "K", "Godly", 6085025295, 6074789360, 0.07, 0.07, 0.07, 6076067750, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Phantom2022", "Phantom 2022", "K", "Godly", 121944778, 95338306077286, 1, 1, 1, 11229732037, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pixel", "Pixel", "K", "Godly", 361629844, 361630114, 3, 3, 3, 365347166, 0, -0.1546, 0.9239, 1, 0, 0, 0, 0, 1, 0, -1, 0 },
				{ "Prismatic", "Prismatic", "K", "Godly", 5355753728, 5355747943, 0.06, 0.0692, 0.06, 5360359935, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pumpking", "Pumpking", "K", "Godly", 94840342, 1133078553, 0.4, 0.4, 0.4, 1133082421, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "PurpleSeer", "Purple Seer", "K", "Godly", 156092238, 3184063317, 0.7, 0.91, 1, 3184140119, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RedSeer", "Red Seer", "K", "Godly", 156092238, 3184063443, 0.7, 0.91, 1, 3184139367, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Saw", "Saw · Saw", "K", "Godly", 168119698, 168119736, 0.5, 0.5, 0.55, 3187397991, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "YellowSeer", "Yellow Seer", "K", "Godly", 156092238, 7443776855, 0.7, 0.91, 1, 3184139648, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Xmas", "Xmas", "K", "Godly", 187852667, 187852629, 0.6, 0.6, 0.6, 332077449, -0.0001, -0.124, 1.1068, 1, 0, 0, 0, 0, 1, 0, -1, 0 },
				{ "WintersEdge", "Winter's Edge", "K", "Godly", 93108071, 93112631, 0.45, 0.45, 0.45, 1268708987, 0, -1, -0.1, 0, 0, -1, 0, 1, 0, 1, 0, 0 },
				{ "Virtual", "Virtual", "K", "Godly", 130101214, 386250868, 0.6, 0.6, 0.7, 386276987, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Turkey2023", "Turkey", "K", "Godly", 15320557481, 86999625612475, 0.056, 0.056, 0.056, 15413162319, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wrapped_K_2018", "Wrapped 2018", "K", "Common", 121944778, 2672196316, 1, 1, 1, 2669640357, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "AduriteGun", "Adurite", "G", "Uncommon", 79401392, 162812733, 1.5, 1.5, 1.5, 175668921, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "TimeKnife", "Prince", "K", "Classic", 70990583, 70990591, 0.5, 0.8, 0.5, 143917700, -0.0386, 0.0062, -0.9927, -0.0967, -0.0823, 0.9919, 0.9951, -0.0262, 0.0949, 0.0182, 0.9963, 0.0844 },
				{ "TidesChroma", "Tides · TidesChroma", "K", "Godly", 238314382, 3171168641, 0.7, 0.9, 0.7, 3187398906, 0, -0.2257, 1.0324, 1, 0.0025, 0, 0, -0.0191, 0.9998, 0.0025, -0.9998, -0.0191 },
				{ "Tides", "Tides · Tides", "K", "Godly", 238314382, 238314431, 0.7, 0.9, 0.7, 3187398809, 0, -0.226, 1.032, 1, 0, 0, 0, 0.048, 0.9988, 0, -0.9988, 0.048 },
				{ "TheSeer", "Seer · TheSeer", "K", "Godly", 156092238, 156092253, 0.7, 0.91, 1, 3184139765, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Spider", "Spider", "K", "Godly", 302165984, 315122091, 0.55, 0.57, 0.52, 315120760, 0, -0.15, 0.973, 1, 0, 0, 0, 0, 1, 0, -1, 0 },
				{ "Snowflake", "Snowflake", "K", "Godly", 582120569, 582120836, 0.6, 0.6, 0.6, 1268932977, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SlasherChroma", "Slasher · SlasherChroma", "K", "Godly", 283709822, 3171107559, 0.45, 0.45, 0.45, 3187398385, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Slasher", "Slasher · Slasher", "K", "Godly", 283709822, 313894904, 0.45, 0.45, 0.45, 3187398274, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ShadowKnife", "Shadow", "K", "Classic", 86297695, 86290910, 0.4, 0.2, 0.2, 144070096, 0, -0.0087, -0.703, 0.0033, 0, 1, 1, 0.0049, -0.0033, -0.0049, 1, 0 },
				{ "SeerChroma", "Seer · SeerChroma", "K", "Godly", 156092238, 3184059718, 1, 1, 1, 3184140321, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Scythe", "Batwing", "K", "Ancient", 305826272, 2511673515, 1, 1, 1, 375690925, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "AuroraKnife", "Australis", "K", "Godly", 16025287191, 97521579968070, 0.0753, 0.0753, 0.0753, 101343256002049, 0, -1.1615, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BattleAxe2", "BattleAxe II", "K", "Godly", 2397016406, 2521633652, 0.7357, 0.7357, 0.7357, 2513535503, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bioblade", "Bioblade", "K", "Godly", 4662600017, 4751538400, 0.0624, 0.0684, 0.066, 4751540097, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IcepiercerSilver", "Silver Icepiercer", "G", "Unique", 11868991644, 122077395445706, 0.0548, 0.0548, 0.0548, 12226843957, 0, -0.66, 0.2344, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Constellation_G_2024", "Nightsky", "G", "Legendary", 6600918074, 140562006976774, 0.0384, 0.0388, 0.0369, 94311965719769, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cookieblade", "Cookieblade", "K", "Godly", 6123168377, 6123168583, 1, 1, 1, 6121574620, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Eggblade", "Eggblade", "K", "Godly", 6596834762, 6596824396, 0.0686, 0.0686, 0.0686, 6607512359, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ElderwoodScythe", "Elderwood Scythe", "K", "Ancient", 4217523241, 4210044808, 0.0764, 0.0764, 0.0764, 4468593654, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "FlowerwoodKnife", "Flowerwood", "K", "Godly", 16883629972, 16895441338, 0.0792, 0.0792, 0.0792, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ghostblade", "Ghostblade", "K", "Godly", 4217554208, 4210531490, 0.0535, 0.0535, 0.0535, 4217586790, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hallowscythe", "Hallowscythe", "K", "Ancient", 5841877975, 5841879647, 0.0708, 0.0708, 0.0708, 5877016863, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Heartblade", "Heartblade", "K", "Godly", 6404140078, 6413074818, 1.1003, 1.1003, 1.1003, 6413214382, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sugar", "Sugar", "G", "Godly", 101086719, 72286618177616, 0.5, 0.5, 0.5, 3215356000, -0.1, 0.536, 1.079, -1, 0, 0, 0, -1, 0, 0, 0, 1 },
				{ "Iceflake", "Iceflake", "K", "Godly", 8231045240, 8231046270, 0.0675, 0.0675, 0.0675, 8304818186, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Logchopper", "Logchopper", "K", "Ancient", 4535643726, 4535641077, 1, 1, 1, 4528268775, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Nebula", "Nebula", "K", "Godly", 6596839942, 6256756879, 1.1522, 1.1522, 1.1522, 6598123521, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pearl_K", "Pearl", "K", "Godly", 18276861801, 74986100175804, 0.0697, 0.0697, 0.0697, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Plasmablade", "Plasmablade", "K", "Godly", 9702732853, 10015130416, 0.0018, 0.0016, 0.0017, 10014680882, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Rainbow_K", "Rainbow (Godly)", "K", "Godly", 12921240966, 12921241867, 0.0652, 0.0652, 0.0652, 12966184630, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sakura_K", "Sakura", "K", "Godly", 12307707430, 12307707797, 0.0741, 0.0741, 0.0741, 12339366064, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyAxe", "Swirly Axe", "K", "Ancient", 8293463844, 8293464070, 0.0579, 0.0579, 0.0579, 8304801000, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyBlade", "Swirly Blade", "K", "Godly", 8302964090, 8302965681, 0.0669, 0.0669, 0.0669, 8304805693, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VampiresEdge", "Vampire's Edge", "K", "Godly", 5841895234, 5842343736, 0.067, 0.067, 0.067, 5873256998, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammer", "Icecrusher (Rare)", "K", "Rare", 957726558, 11850788417, 1, 1, 1, 11855360152, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyAxeSilver", "Silver Swirly", "K", "Unique", 8293463844, 137014121340838, 0.0579, 0.0579, 0.0579, 9552051805, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Waves_K", "Waves", "K", "Godly", 13916938702, 13916939964, 0.0792, 0.0792, 0.0793, 13933066522, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "WraithKnife", "Spirit", "K", "Godly", 112444333460928, 131787177447081, 0.1047, 0.1047, 0.1047, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wrapped_G_2024", "Wrapped 2024", "G", "Uncommon", 6600918074, 137311445183389, 0.0384, 0.0388, 0.0369, 109929760056853, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ZombieBat", "Bat", "K", "Godly", 11182796403, 11192090515, 0.0741, 0.0741, 0.0741, 11229814357, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Wrapped_K_2022", "Wrapped 2022", "K", "Common", 121944778, 331744478, 1, 1, 1, 11834403282, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Amerilaser", "Amerilaser", "G", "Godly", 116657254, 445884341, 0.7, 0.7, 0.7, 446050753, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BaubleChroma", "Bauble", "G", "Godly", 107813118898769, 109913147403488, 0.0471, 0.0471, 0.0471, 137938731902685, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Blaster", "Blaster", "G", "Godly", 92656610, 90586029262535, 0.4, 0.45, 0.5, 386277381, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Blossom_G", "Blossom", "G", "Godly", 12322809632, 12322809917, 0.0476, 0.0441, 0.0438, 12339377105, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ChromaDarkbringer", "Darkbringer", "G", "Godly", 4730813852, 4728494788, 0.039, 0.039, 0.039, 4751507011, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ChromaLightbringer", "Lightbringer", "G", "Godly", 4730813852, 4728487789, 0.039, 0.039, 0.039, 4751507078, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ConstellationChroma", "Constellation · ConstellationChroma", "G", "Godly", 124598402927958, 123603327635244, 0.1012, 0.1012, 0.1012, 98517109155878, 0, -0.27, 0.727, 1, 0, 0, 0, 0.9999, 0.0125, 0, -0.0125, 0.9999 },
				{ "Darkshot", "Darkshot", "G", "Godly", 15027451531, 15027451643, 0.04, 0.04, 0.04, 15080280688, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Disint", "Laser (Classic)", "G", "Classic", 18265627, 18265614, 1, 1, 1, 54798135, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GingerLuger", "Ginger Luger", "G", "Godly", 95356090, 2674981863, 1.8, 1.8, 1.8, 2674983099, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingermint_G", "Gingermint", "G", "Godly", 11866444071, 11866444253, 0.0461, 0.0461, 0.0461, 11872179646, 0, -0.3283, 0.7857, 1, 0, 0, 0, 0.9997, 0.0246, 0, -0.0246, 0.9997 },
				{ "GreenLuger", "Green Luger", "G", "Godly", 95356090, 126534866, 1.8, 1.8, 1.8, 332044679, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Laser", "Laser · Laser", "G", "Godly", 130099641, 161254231, 0.5, 0.5, 0.5, 3187422496, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "LaserChroma", "Laser · LaserChroma", "G", "Godly", 130099641, 0, 0.5, 0.5, 0.5, 3187422628, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "LugerChroma", "Luger", "G", "Godly", 95356090, 0, 1.8, 1.8, 1.8, 3187399258, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Lugercane", "Lugercane", "G", "Godly", 95356090, 4535479829, 1.8, 1.8, 1.8, 4535482609, 0, -0.5, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ocean_G", "Ocean", "G", "Godly", 13928587755, 90484783616182, 0.0787, 0.0431, 0.0468, 13933165014, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Phaser", "Phaser", "G", "Classic", 69486593, 69486519, 0.8, 0.8, 0.8, 144325423, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Plasmabeam", "Plasmabeam", "G", "Godly", 9702755186, 10015208201, 0.0424, 0.0463, 0.0439, 10014717343, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Shark", "Shark · Shark", "G", "Godly", 118269783, 203858007, 0.3, 0.43, 0.4, 3187421705, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "SharkChroma", "Shark · SharkChroma", "G", "Godly", 118269783, 3171214838, 0.44, 0.44, 0.44, 3187421856, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Chick_K_2025", "Chick", "K", "Common", 121944778, 116056287470892, 1, 1, 1, 116361515042274, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyGunChroma", "Swirly Gun · SwirlyGunChroma", "G", "Godly", 8310911339, 8293539377, 1, 1, 1, 8311453396, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "TravelerGunChroma", "Traveler's Gun", "G", "Godly", 15090814396, 132537117087610, 0.0499, 0.0499, 0.0499, 15097920149, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "VampireAxe_Gold", "Vampire's Axe · VampireAxe_Gold", "K", "Unique", 92263601594064, 132843202397207, 0.0725, 0.0725, 0.0725, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VampireGunChroma", "Vampire's Gun · VampireGunChroma", "G", "Godly", 126591885289479, 104946799389637, 0.05, 0.05, 0.05, 0, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "WatergunChroma", "Watergun", "G", "Godly", 18280999342, 129036269962882, 0.0395, 0.0395, 0.0395, 18351465514, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "AuroraGun", "Borealis", "G", "Godly", 16070198638, 107873598804292, 0.0469, 0.0469, 0.0469, 108635848059846, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "SwirlyAxeBronze", "Bronze Swirly", "K", "Unique", 8293463844, 82459482426756, 0.0579, 0.0579, 0.0579, 9552050165, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyGunBlue", "Blue Swirly", "G", "Unique", 8310911339, 104958144059634, 1, 1, 1, 9552060741, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "FlowerwoodGun", "Flowerwood Gun", "G", "Godly", 16895099893, 16895448237, 0.0519, 0.0519, 0.0519, 0, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Decorated_K_2025", "Decorated", "K", "Uncommon", 121944778, 136070215876929, 1, 1, 1, 124860763249593, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hallowgun", "Hallowgun", "G", "Godly", 5841866437, 5841868338, 0.0408, 0.0408, 0.0408, 5877089721, -0.6954, -0.2885, -0.036, -0.0467, 0.056, -0.9973, 0, 0.9984, 0.056, 0.9989, 0.0026, -0.0466 },
				{ "IceHammer_Godly", "Icecrusher (Godly)", "K", "Godly", 11855737283, 11855737599, 0.07, 0.07, 0.07, 11855282546, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Icebeam", "Icebeam", "G", "Godly", 8310908064, 8231066536, 1, 1, 1.0002, 8305000161, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SwirlyAxeGold", "Gold Swirly", "K", "Unique", 8293463844, 76537714037540, 0.0579, 0.0579, 0.0579, 9552054920, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Turtle_K_2024", "Turtle", "K", "Uncommon", 6600901997, 127394910308086, 1, 1, 1, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Jinglegun", "Jinglegun", "G", "Godly", 6125843704, 6125843755, 1, 1, 1, 6121678262, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Makeshift", "Makeshift", "G", "Godly", 11158364935, 11274360089, 0.0546, 0.0546, 0.0546, 11229837140, -0.0028, -0.4133, 0.7372, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Celestial", "Celestial", "K", "Ancient", 109711282082830, 117556526686597, 0.0533, 0.0533, 0.0533, 136673966529736, 0, 0.0018, 0.2811, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Pearl_G", "Pearlshine", "G", "Godly", 18280804203, 136668364239627, 0.0431, 0.0431, 0.0431, 0, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Rainbow_G", "Rainbow Gun", "G", "Godly", 12921221200, 12921231088, 0.0519, 0.0519, 0.0519, 12966354606, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Spectre2022", "Spectre", "G", "Godly", 11165536294, 11165715120, 0.052, 0.052, 0.052, 11229779932, -0.0011, -0.5, 0.6295, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Stickers_X_G_2024", "Stickers 2024 · Stickers_X_G_2024", "G", "Common", 6600918074, 139997450438464, 0.0384, 0.0388, 0.0369, 91224254479440, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SwirlyGun", "Swirly Gun · SwirlyGun", "G", "Godly", 8310911339, 97363489382281, 1, 1, 1, 8305002569, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "VampireAxe_Purple", "Vampire's Axe · VampireAxe_Purple", "K", "Unique", 92263601594064, 125726996015099, 0.0725, 0.0725, 0.0725, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VampireGun", "Vampire's Gun · VampireGun", "G", "Godly", 126591885289479, 105399657891158, 0.0483, 0.0483, 0.0483, 0, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "WraithGun", "Soul", "G", "Godly", 79527507796407, 80102752403085, 0.0444, 0.0444, 0.0444, 0, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Infected", "Infected", "K", "Common", 121944778, 6978645136, 1, 1, 1, 200953094, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Forest_G_2024", "Forest", "G", "Uncommon", 79401392, 114741314080418, 1.6, 1.6, 1.6, 78199422065424, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Patrick", "Patrick", "K", "Common", 121944778, 7837986943, 1, 1, 1, 383476085, 0, -0.9885, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Dartbringer", "Dartbringer", "G", "Unique", 6689725889, 6689727175, 0.4426, 0.4258, 0.4258, 8626617523, 0.0352, -0.3793, 0.465, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SlouseClown", "Clown", "K", "Unique", 121944778, 197196512, 1, 1, 1, 315501118, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cane_G_2021", "Cane 2021", "G", "Common", 79401392, 8275031710, 1.5, 1.5, 1.5, 8304768700, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SharkSeeker", "SharkSeeker", "G", "Unique", 6967743598, 6689657395, 0.75, 0.75, 0.75, 6967771328, 0.1, -0.1, -0.5, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Iceblaster", "Iceblaster", "G", "Godly", 6125828567, 6120563948, 1, 1, 1, 6121579464, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "TravelerAxe", "Traveler's Axe", "K", "Ancient", 15057341638, 15057460725, 0.0681, 0.0681, 0.0681, 15070870271, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hallow", "Hallow's Edge", "K", "Godly", 179155055, 179155105, 0.57, 0.57, 0.57, 531878205, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RaygunSilver", "Silver Raygun", "G", "Unique", 115447220952926, 133327506424645, 0.0471, 0.0471, 0.0471, 71511736314707, 0.0009, -0.554, 0.7423, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "AmericaSword", "Old Glory", "K", "Godly", 262027449, 445805934, 0.6, 0.6, 0.6, 446047742, 0, 0.25, 1.9, 1, 0, 0, 0, 0.0767, 0.9971, 0, -0.9971, 0.0767 },
				{ "VampireAxe_Bronze", "Vampire's Axe · VampireAxe_Bronze", "K", "Unique", 92263601594064, 117917193798694, 0.0725, 0.0725, 0.0725, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tree", "Tree", "K", "Legendary", 121944778, 5838589224, 1, 1, 1, 331745577, 0, -1.0285, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Tree_K_2023", "Tree 2023", "K", "Rare", 957726558, 121944805, 1, 1, 1, 15635563249, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowy", "Snowy", "K", "Uncommon", 121944778, 5538538671, 1, 1, 1, 332011125, 0, -0.9885, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "EliteGreen", "Green Elite", "K", "Legendary", 121944778, 137946316996767, 1, 1, 1, 332754554, 0, -1.0285, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Apoc_K_2022", "Apocalypse", "K", "Common", 121944778, 11218500706, 1, 1, 1, 11254172968, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Alex", "Alex", "K", "Common", 121944778, 545604317, 1, 1, 1, 546159020, 0, -0.9885, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Combat2", "Combat II", "K", "Common", 121944778, 6932358967, 1, 1, 1, 4972196241, 0.0416, -1.1409, 0.0773, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BronzeVampiresEdge", "Bronze Vamp's Edge", "K", "Unique", 5841895234, 124129066234254, 0.067, 0.067, 0.067, 12253493272, 0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BlueVampiresEdge", "Blue Vamp's Edge", "K", "Unique", 5841895234, 116887066557099, 0.067, 0.067, 0.067, 12253491988, 0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GoldVampiresEdge", "Gold Vamp's Edge", "K", "Unique", 5841895234, 89466623295527, 0.067, 0.067, 0.067, 12253496571, 0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SilverVampiresEdge", "Silver Vamp's Edge", "K", "Unique", 5841895234, 93427229045342, 0.067, 0.067, 0.067, 12253494893, 0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Flora", "Flora", "G", "Godly", 108253816085047, 116621225933096, 0.0457, 0.0457, 0.0457, 139276091458016, 0, -0.5, 0.5, 0.9999, -0.0087, -0.0087, 0.0087, 1, 0, 0.0087, -0.0001, 1 },
				{ "Bloom", "Bloom", "K", "Godly", 73266355643345, 103489229144925, 0.079, 0.079, 0.079, 132419834610569, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bunnies_K_2025", "Bunnies", "K", "Legendary", 121944778, 104875261384354, 1, 1, 1, 90549252812333, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Carrots_K_2025", "Carrots", "K", "Common", 121944778, 137285542474252, 1, 1, 1, 76914260444878, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Potion", "Potion", "K", "Uncommon", 121944778, 1782402938, 1, 1, 1, 1133366632, 0, -0.9885, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Reaver_Legendary", "Reaver (Legendary)", "K", "Legendary", 121944778, 121291446597917, 1, 1, 1, 7791485669, 0, -1.0087, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Igloo_G_2024", "Igloo", "G", "Common", 79401392, 73071132008000, 1.6, 1.6, 1.6, 95517099886712, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Reaver", "Reaver (Rare)", "K", "Rare", 121944778, 118176521118205, 1, 1, 1, 7791484774, 0, -1.0087, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammer_Legendary", "Icecrusher (Legendary)", "K", "Legendary", 957726558, 11851776706, 1, 1, 1, 11855361567, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Icebreaker", "Icebreaker", "K", "Ancient", 6124173614, 6124173821, 0.9685, 0.9685, 0.9685, 6121572723, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VampireAxe", "Vampire's Axe (Ancient)", "K", "Ancient", 92263601594064, 73008954478338, 0.0725, 0.0725, 0.0725, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SwirlyGunGold", "Gold Swirly", "G", "Unique", 8310911339, 122072784662988, 1, 1, 1, 9552065167, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Minty", "Minty", "G", "Godly", 4528424409, 4528424475, 1.119, 1.119, 1.119, 4528291487, -0.0211, 0.2222, 0.772, -0.9998, 0, -0.0211, 0.0016, -0.9972, -0.075, -0.021, -0.075, 0.997 },
				{ "BlueHarvester", "Blue Harvester", "G", "Unique", 7775027413, 8266618476, 0.06, 0.05, 0.05, 8194219645, 0, -0.54, 0.4558, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ElderwoodGun", "Elderwood Revolver", "G", "Godly", 4210029922, 4210038158, 0.0298, 0.0298, 0.0298, 4468571736, -0.5676, -0.1243, -0.0424, -0.0003, 0.023, -0.9997, -0.0117, 0.9997, 0.023, 0.9999, 0.0117, 0 },
				{ "Candy", "Candy", "K", "Godly", 19040337, 19040326, 1.1, 1.4, 1.1, 332021011, 0, 0.866, -0.006, 0, 0, 1, 0, -1, 0, 1, 0, 0 },
				{ "ElderwoodGunSilver", "Silver Elderwood", "G", "Unique", 4210029922, 5357372620, 0.0407, 0.0456, 0.0406, 4468583758, -0.6706, -0.1995, -0.0658, 0.0161, 0.0001, -0.9999, 0.0208, 0.9998, 0.0005, 0.9997, -0.0208, 0.0161 },
				{ "ElderwoodKnifeBlue", "Blue Elderwood", "K", "Unique", 11238166013, 14741388867, 0.07, 0.07, 0.07, 11505913287, 0, -1.347, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SilverHallow", "Silver Hallow", "K", "Unique", 179155055, 104150976879041, 0.5, 0.5, 0.5, 2511341094, 0, -1.3549, 0.0348, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SilverIceblaster", "Silver Iceblaster", "G", "Unique", 6125828567, 6246950589, 1, 1, 1, 6404166698, -0.0085, -0.7, -0.546, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "SilverIcebreaker", "Silver Icebreaker", "K", "Unique", 6124173614, 6237992602, 1, 1, 1, 6404126280, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SilverHarvester", "Silver Harvester", "G", "Unique", 7775027413, 8266615645, 0.06, 0.05, 0.05, 8194217388, 0, -0.51, 0.4458, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BlueSugar", "Blue Sugar", "G", "Unique", 101086719, 3241860913, 0.6, 0.6, 0.6, 3215355152, -0.1, 0.5361, 1.0789, -1, 0, 0, 0, -1, 0, 0, 0, 1 },
				{ "LogchopperSilver", "Silver Logchopper", "K", "Unique", 4535643726, 9346155546, 1, 1, 1, 4753352581, -0.0051, -0.7237, 0.328, 0.9962, -0.0316, -0.0816, 0.0342, 0.9989, 0.031, 0.0806, -0.0336, 0.9962 },
				{ "MintySilver", "Silver Minty", "G", "Unique", 5216810177, 4753313914, 1.15, 1.15, 1.15, 4753346087, 0.0545, -0.2787, 0.5806, 0.9959, -0.0334, 0.0839, 0.0337, 0.9994, -0.0026, -0.0838, 0.0054, 0.9965 },
				{ "SilverCandy", "Silver Candy", "K", "Unique", 19040337, 97784569465604, 1, 1.3333, 1, 1520190188, 0, 0.866, -0.006, 0, 0, 1, 0, -1, 0, 1, 0, 0 },
				{ "ElderwoodGunBlue", "Blue Elderwood", "G", "Unique", 4210029922, 5827160585, 0.0407, 0.0456, 0.0406, 4468574885, -0.6706, -0.1995, -0.0658, 0.0161, 0.0001, -0.9999, 0.0208, 0.9998, 0.0005, 0.9997, -0.0208, 0.0161 },
				{ "ElderwoodGunBronze", "Bronze Elderwood", "G", "Unique", 4210029922, 5355144249, 0.0407, 0.0456, 0.0406, 4468585407, -0.6706, -0.1995, -0.0658, 0.0161, 0.0001, -0.9999, 0.0208, 0.9998, 0.0005, 0.9997, -0.0208, 0.0161 },
				{ "ElderwoodGunGold", "Gold Elderwood", "G", "Unique", 4210029922, 126940459873407, 0.0407, 0.0456, 0.0406, 4468584345, -0.6706, -0.1995, -0.0658, 0.0161, 0.0001, -0.9999, 0.0208, 0.9998, 0.0005, 0.9997, -0.0208, 0.0161 },
				{ "ElderwoodKnifeBronze", "Bronze Elderwood", "K", "Unique", 11238166013, 14741383535, 0.07, 0.07, 0.07, 11505914752, 0, -1.347, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ElderwoodKnifeGold", "Gold Elderwood", "K", "Unique", 11238166013, 14741358103, 0.07, 0.07, 0.07, 11505917850, 0, -1.347, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "ElderwoodKnifeSilver", "Silver Elderwood", "K", "Unique", 11238166013, 14741374486, 0.07, 0.07, 0.07, 11505916486, 0, -1.3468, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BronzeHallow", "Bronze Hallow", "K", "Unique", 179155055, 2518167440, 0.5, 0.5, 0.5, 2511342846, 0, -1.3549, 0.0348, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GoldHallow", "Gold Hallow", "K", "Unique", 179155055, 110453608575133, 0.5, 0.5, 0.5, 2511340308, 0, -1.3549, 0.0348, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RedHallow", "Red Hallow", "K", "Unique", 179155055, 73958132414440, 0.5, 0.5, 0.5, 2511343130, 0, -1.3549, 0.0348, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RaygunBronze", "Bronze Raygun", "G", "Unique", 115447220952926, 122251377901095, 0.0471, 0.0471, 0.0471, 138881346504998, 0.0009, -0.554, 0.7423, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RaygunRed", "Red Raygun", "G", "Unique", 115447220952926, 104160895526874, 0.0471, 0.0471, 0.0471, 132354489228618, 0.0009, -0.554, 0.7423, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BronzeIceblaster", "Bronze Iceblaster", "G", "Unique", 6125828567, 6246948951, 1, 1, 1, 6404167442, -0.0085, -0.7, -0.546, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "GoldIceblaster", "Gold Iceblaster", "G", "Unique", 6125828567, 6246949956, 1, 1, 1, 6404165933, -0.0085, -0.7, -0.546, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "RedIceblaster", "Red Iceblaster", "G", "Unique", 6125828567, 6246951385, 1, 1, 1, 6404168049, -0.0085, -0.7, -0.546, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "BronzeIcebreaker", "Bronze Icebreaker", "K", "Unique", 6124173614, 6237991982, 1, 1, 1, 6404127119, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GoldIcebreaker", "Gold Icebreaker", "K", "Unique", 6124173614, 6237993632, 1, 1, 1, 6404115112, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RedIcebreaker", "Red Icebreaker", "K", "Unique", 6124173614, 6237994207, 1, 1, 1, 6404129111, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BronzeHarvester", "Bronze Harvester", "G", "Unique", 7775027413, 8266617019, 0.06, 0.05, 0.05, 8194221072, 0, -0.52, 0.4158, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "GoldHarvester", "Gold Harvester", "G", "Unique", 7775027413, 8266613473, 0.06, 0.05, 0.05, 8194222523, 0, -0.52, 0.4258, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Harvester", "Harvester", "G", "Ancient", 7775027413, 7775245551, 0.06, 0.05, 0.05, 7800847534, 0, -0.5366, 0.4983, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SilverSugar", "Silver Sugar", "G", "Unique", 101086719, 80417567706028, 0.6, 0.6, 0.6, 3215355602, -0.1, 0.5361, 1.0789, -1, 0, 0, 0, -1, 0, 0, 0, 1 },
				{ "GoldSugar", "Gold Sugar", "G", "Unique", 101086719, 77907977694388, 0.6, 0.6, 0.6, 3215355797, -0.1, 0.5361, 1.0789, -1, 0, 0, 0, -1, 0, 0, 0, 1 },
				{ "BronzeSugar", "Bronze Sugar", "G", "Unique", 101086719, 6958436959, 0.6, 0.6, 0.6, 3215355397, -0.1, 0.5361, 1.0789, -1, 0, 0, 0, -1, 0, 0, 0, 1 },
				{ "LogchopperBlue", "Blue Logchopper", "K", "Unique", 4535643726, 4753303501, 1, 1, 1, 4753353471, 0, -0.9536, 0.3372, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "LogchopperBronze", "Bronze Logchopper", "K", "Unique", 4535643726, 7572081485, 0.96, 0.96, 0.96, 4753354123, 0, -0.9536, 0.3372, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "LogchopperGold", "Gold Logchopper", "K", "Unique", 4535643726, 108331174915822, 0.96, 0.96, 0.96, 4753354638, 0, -0.9536, 0.3372, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "MintyBronze", "Bronze Minty", "G", "Unique", 5216810177, 5211061190, 1.15, 1.15, 1.15, 4753348263, 0.0545, -0.2787, 0.5806, 0.9959, -0.0334, 0.0839, 0.0337, 0.9994, -0.0026, -0.0838, 0.0054, 0.9965 },
				{ "BlueCandy", "Blue Candy", "K", "Unique", 19040337, 3241832047, 1, 1.3333, 1, 1489495701, 0, 0.866, -0.006, 0, 0, 1, 0, -1, 0, 1, 0, 0 },
				{ "BronzeCandy", "Bronze Candy", "K", "Unique", 19040337, 122687610829006, 1, 1.3333, 1, 1520189487, 0, 0.866, -0.006, 0, 0, 1, 0, -1, 0, 1, 0, 0 },
				{ "GoldCandy", "Gold Candy", "K", "Unique", 19040337, 2885942815, 1, 1.3333, 1, 1520188792, 0, 0.866, -0.006, 0, 0, 1, 0, -1, 0, 1, 0, 0 },
				{ "Celestial_Silver", "Silver Celestial", "K", "Unique", 109711282082830, 119629165572031, 0.0533, 0.0533, 0.0533, 90241292303974, 0, 0.002, 0.281, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Constellation_Silver", "Silver Constellation", "G", "Unique", 124598402927958, 88000474566609, 0.1007, 0.1007, 0.1007, 100747436297625, 0, -0.27, 0.727, 1, 0, 0, 0, 0.9999, 0.0125, 0, -0.0125, 0.9999 },
				{ "IcepiercerRed", "Red Icepiercer", "G", "Unique", 11868991644, 12196203001, 0.0548, 0.0548, 0.0548, 12227133450, 0, -0.66, 0.234, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Blue", "Blue Gingerscythe", "K", "Unique", 15397282571, 125204450826311, 0.0696, 0.0696, 0.0697, 0, 0, -0.94, -0.063, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "TravelerAxeSilver", "Silver Traveler's", "K", "Unique", 15057341638, 125312600693078, 0.0681, 0.0681, 0.0681, 15695407742, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "VampireAxe_Silver", "Vampire's Axe · VampireAxe_Silver", "K", "Unique", 92263601594064, 78665201678229, 0.0725, 0.0725, 0.0725, 0, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Celestial_Bronze", "Bronze Celestial", "K", "Unique", 109711282082830, 118098317574486, 0.0533, 0.0533, 0.0533, 119399643874968, 0, 0.002, 0.281, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Celestial_Gold", "Gold Celestial", "K", "Unique", 109711282082830, 74186573010586, 0.0533, 0.0533, 0.0533, 104229967982042, 0, 0.002, 0.281, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Celestial_Red", "Red Celestial", "K", "Unique", 109711282082830, 91261836086535, 0.0533, 0.0533, 0.0533, 119157529694972, 0, 0.002, 0.281, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Constellation_Bronze", "Bronze Constellation", "G", "Unique", 124598402927958, 84518828644661, 0.1007, 0.1007, 0.1007, 112811587103866, 0, -0.27, 0.727, 1, 0, 0, 0, 0.9999, 0.0125, 0, -0.0125, 0.9999 },
				{ "Constellation_Gold", "Gold Constellation", "G", "Unique", 124598402927958, 129541547610095, 0.1007, 0.1007, 0.1007, 132975248521820, 0, -0.27, 0.727, 1, 0, 0, 0, 0.9999, 0.0125, 0, -0.0125, 0.9999 },
				{ "Constellation_Red", "Red Constellation", "G", "Unique", 124598402927958, 97613309386908, 0.1007, 0.1007, 0.1007, 85766514163212, 0, -0.27, 0.727, 1, 0, 0, 0, 0.9999, 0.0125, 0, -0.0125, 0.9999 },
				{ "Icepiercer", "Icepiercer", "G", "Ancient", 11868991644, 11869075814, 0.0548, 0.0548, 0.0548, 11874071041, 0, -0.5819, 0.0324, 1, 0, 0, 0, 0.9978, -0.0658, 0, 0.0658, 0.9978 },
				{ "IcepiercerBronze", "Bronze Icepiercer", "G", "Unique", 11868991644, 136041212037383, 0.0548, 0.0548, 0.0548, 12226920195, 0, -0.66, 0.234, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IcepiercerGold", "Gold Icepiercer", "G", "Unique", 11868991644, 89221956008018, 0.0548, 0.0548, 0.0548, 12226688172, 0, -0.66, 0.234, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammerGold", "Gold Icecrusher", "K", "Unique", 11848711686, 132842079563749, 0.0736, 0.0736, 0.0736, 12227137860, 0, -0.8, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Bronze", "Bronze Gingerscythe", "K", "Unique", 15397282571, 88640690300238, 0.0696, 0.0696, 0.0697, 0, 0, -0.94, -0.063, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammerBronze", "Bronze Icecrusher", "K", "Unique", 11848711686, 88591542566831, 0.0736, 0.0736, 0.0736, 12227148356, 0, -0.8, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "TravelerAxeBronze", "Bronze Traveler's", "K", "Unique", 15057341638, 87152090639814, 0.0681, 0.0681, 0.0681, 15695407020, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "TravelerAxeGold", "Gold Traveler's", "K", "Unique", 15057341638, 107837737026552, 0.0681, 0.0681, 0.0681, 15695408631, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "TreeGun2023", "Evergun", "G", "Godly", 15408863676, 83856783954564, 0.023, 0.023, 0.023, 15694357721, 0.0363, -0.4269, 0.9423, 0.9995, 0, 0.0305, 0, 1, 0, -0.0305, 0, 0.9995 },
				{ "TreeKnife2023", "Evergreen", "K", "Godly", 15408280573, 125133515152716, 0.0046, 0.0046, 0.0046, 15694357137, 0.0502, -1.7515, -0.0305, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscope", "Gingerscope", "G", "Ancient", 15374602183, 15409041564, 0.0842, 0.0842, 0.0842, 15666596216, 0, -0.4, 0.9, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscope_Blue", "Blue Gingerscope", "G", "Unique", 15374602183, 100142423147247, 0.0842, 0.0842, 0.0842, 0, 0, -0.42, 0.97, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscope_Bronze", "Bronze Gingerscope", "G", "Unique", 15374602183, 93684911189915, 0.0842, 0.0842, 0.0842, 0, 0, -0.42, 0.97, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscope_Gold", "Gold Gingerscope", "G", "Unique", 15374602183, 75888854860786, 0.0842, 0.0842, 0.0842, 0, 0, -0.42, 0.97, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscope_Silver", "Silver Gingerscope", "G", "Unique", 15374602183, 129527194826480, 0.0842, 0.0842, 0.0842, 0, 0, -0.42, 0.97, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SunsetGun", "Sunrise", "G", "Godly", 109742397574153, 71731808219690, 0.0458, 0.0458, 0.0458, 129480661108374, 0, -0.1086, 0.6442, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SunsetKnife", "Sunset", "K", "Godly", 137082284051764, 93782017269677, 0.074, 0.074, 0.074, 103526268515240, 0, -1.3352, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Synthwave", "Synthwave (Rare)", "K", "Rare", 6600901997, 139525295603551, 1, 1, 1, 84935740002917, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Synthwave_Ancient", "Synthwave (Ancient)", "K", "Ancient", 81344146777937, 84281380230931, 0.0741, 0.0741, 0.0741, 133828016595037, 0.0228, -0.64, 0.2496, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Synthwave_Godly", "Synthwave (Godly)", "K", "Godly", 132672824913652, 81048398253986, 0.0741, 0.0741, 0.0741, 116075729415230, -0.0142, -1.06, 0.0292, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Synthwave_Legendary", "Synthwave (Legendary)", "K", "Legendary", 6600901997, 115419740311345, 1, 1, 1, 132040985617451, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammerRed", "Red Icecrusher", "K", "Unique", 11848711686, 71714696554176, 0.0736, 0.0736, 0.0736, 12227186408, 0, -0.8, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "IceHammerSilver", "Silver Icecrusher", "K", "Unique", 11848711686, 108890976731643, 0.0736, 0.0736, 0.0736, 12227142478, 0, -0.8, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Gold", "Gold Gingerscythe", "K", "Unique", 15397282571, 87952488946515, 0.0696, 0.0696, 0.0697, 0, 0, -1.1001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerscythe_Silver", "Silver Gingerscythe", "K", "Unique", 15397282571, 110584978259893, 0.0696, 0.0696, 0.0697, 0, 0, -1.1001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Raygun", "Raygun", "G", "Godly", 115447220952926, 127881437685243, 0.0471, 0.0471, 0.0471, 139431943195380, 0.0009, -0.554, 0.7423, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "UFOs_K_2025", "UFOs", "K", "Common", 6600901997, 101182606016909, 1, 1, 1, 97641024072972, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Xeno_K_2025", "Xeno", "K", "Rare", 6600901997, 101379516858862, 1, 1, 1, 80492487454400, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "HauntedHouse_K_2025", "Haunted 2025", "K", "Common", 6600901997, 96264372471629, 1, 1, 1, 90194465176219, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "PumpkinPatch_K_2025", "Pumpkin 2025", "K", "Uncommon", 6600901997, 92052630861897, 1, 1, 1, 119626042140839, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Bats_K_2025", "Cats", "K", "Common", 6600901997, 116130292497156, 1, 1, 1, 140366567839959, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Energized_G_2025", "Energized", "G", "Legendary", 79401392, 96975375477860, 1.6, 1.6, 1.6, 114403390530326, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Hologram_G_2025", "Hologram", "G", "Rare", 79401392, 130121703557220, 1.6, 1.6, 1.6, 108751717527377, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Treats_G_2025", "Treats", "G", "Uncommon", 79401392, 121735248301175, 1.6, 1.6, 1.6, 76537883908961, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "CandyCorn_G_2025", "Candy Corn 2025", "G", "Common", 79401392, 88054952272755, 1.6, 1.6, 1.6, 129781304866793, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Eyes_G_2025", "Eyes", "G", "Uncommon", 79401392, 81682248459741, 1.6, 1.6, 1.6, 90751163516480, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Abduction_K_2025", "Abduction", "K", "Uncommon", 6600901997, 125213231050513, 1, 1, 1, 107510647616718, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Treats_K_2025", "Treats", "K", "Uncommon", 6600901997, 117148660034316, 1, 1, 1, 115298865715727, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "StickersH_K_2025", "Stickers 2025 · StickersH_K_2025", "K", "Common", 6600901997, 91672438499477, 1, 1, 1, 100461386281007, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "CandyCorn_K_2025", "Candy Corn 2025", "K", "Common", 6600901997, 84607607123689, 1, 1, 1, 86405207895194, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Hologram_K_2025", "Hologram", "K", "Rare", 6600901997, 139678078674313, 1, 1, 1, 77773918675860, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Energized_K_2025", "Energized", "K", "Legendary", 6600901997, 104379655242590, 1, 1, 1, 86258299490709, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "UFOs_G_2025", "UFOs", "G", "Common", 79401392, 81729797666928, 1.6, 1.6, 1.6, 84030107970606, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Fall_G_2025", "Fall", "G", "Common", 79401392, 72560612536240, 1.6, 1.6, 1.6, 78153346812503, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Xeno_G_2025", "Xeno", "G", "Rare", 79401392, 88277879999522, 1.6, 1.6, 1.6, 139755862211442, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "HeartWand", "Heart Wand · HeartWand", "K", "Godly", 77738838473091, 76246633927299, 0.0782, 0.0782, 0.0782, 118334707962654, 0, -0.8, 0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "RaygunGold", "Gold Raygun", "G", "Unique", 115447220952926, 128241054560504, 0.0471, 0.0471, 0.0471, 76250851065456, 0.0009, -0.554, 0.7423, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Treat", "Treat", "G", "Godly", 135790480817772, 86649236464456, 0.0538, 0.0538, 0.0538, 131626924640663, 0, 0, 0.6, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "XenoGun", "Xenoshot", "G", "Godly", 96867436912658, 103568875118220, 0.0534, 0.0534, 0.0534, 96859273002742, 0.0253, -0.0153, 0.8973, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "XenoKnife", "Xenoknife", "K", "Godly", 136619680236977, 113651973865393, 0.0784, 0.0784, 0.0784, 115021756767182, 0, -1.2953, 0.0848, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "StickersT2025", "Stickers 2025 · StickersT2025", "K", "Common", 6600901997, 113144896198208, 1, 1, 1, 115280072896190, -0.0224, -1.0551, 0.0453, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BaubleKnife", "Ornament (Godly)", "K", "Godly", 116508096109443, 135843404105980, 0.0731, 0.0731, 0.0731, 111092946728824, 0, -1.15, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Blizzard", "Blizzard · Blizzard", "G", "Godly", 77235373292363, 131115493735176, 0.043, 0.043, 0.043, 88928894807422, 0, -0.57, 0.75, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "BlizzardChroma", "Blizzard · BlizzardChroma", "G", "Godly", 77235373292363, 97280881789656, 0.0433, 0.0433, 0.0433, 139495852635932, 0, -0.32, 0.34, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Frozen_G_2025", "Frozen 2025", "G", "Legendary", 79401392, 87079980851460, 1.5, 1.5, 1.5, 90622014285727, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Frozen_K_2025", "Frozen 2025", "K", "Legendary", 6600901997, 103391577880162, 1, 1, 1, 108996627787763, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingerbread_G_2025", "Gingerbread 2025", "G", "Uncommon", 79401392, 77398327971959, 1.5, 1.5, 1.5, 74908113882525, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingerbread_K_2025", "Gingerbread 2025", "K", "Uncommon", 6600901997, 86777384953188, 1, 1, 1, 134478959354477, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Gingercookie_G_2025", "Gingercookie", "G", "Rare", 79401392, 112196863510306, 1.5, 1.5, 1.5, 99160839686845, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Gingercookie_K_2025", "Gingercookie", "K", "Rare", 6600901997, 77551638357810, 1, 1, 1, 111408683823094, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Lights_G_2025", "Lights 2025", "G", "Common", 79401392, 80557940854587, 1.5, 1.5, 1.5, 104258636970738, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Lights_K_2025", "Lights 2025", "K", "Common", 6600901997, 71217678785248, 1, 1, 1, 71228862432065, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Ornaments_K_2025", "Ornaments 2025", "K", "Uncommon", 6600901997, 128273296066714, 1, 1, 1, 132504094164819, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Peppermint_G_2025", "Peppermint", "G", "Common", 79401392, 107986046289088, 1.5, 1.5, 1.5, 73148873488539, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Peppermint_K_2025", "Peppermint 2025", "K", "Common", 6600901997, 120181028268113, 1, 1, 1, 84605926178412, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SnowDagger", "Snow Dagger", "K", "Godly", 140633396635861, 77812964601215, 0.0598, 0.0598, 0.0598, 95328449981238, 0, -1.15, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowball_G_2025", "Snowball", "G", "Common", 79401392, 81738515769034, 1.5, 1.5, 1.5, 104416405402940, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Snowcannon", "Snowcannon", "G", "Godly", 99836890880541, 122392330922281, 0.05, 0.05, 0.05, 129186939023729, 0, -0.32, 0.34, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Snowstorm", "Snowstorm · Snowstorm", "K", "Godly", 127534150487935, 84853425379784, 0.077, 0.077, 0.077, 70973050894155, 0, -1.26, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SnowstormChroma", "Snowstorm · SnowstormChroma", "K", "Godly", 86944837615327, 86253759560362, 0.077, 0.077, 0.077, 94202294092932, 0, -1.18, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Spearmint_G_2025", "Spearmint", "G", "Rare", 79401392, 125101257679057, 1.5, 1.5, 1.5, 81352860339620, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Spearmint_K_2025", "Spearmint", "K", "Rare", 6600901997, 73372556711687, 1, 1, 1, 98506456649552, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "StickersX_G_2025", "Stickers 2025", "G", "Common", 79401392, 123572826899313, 1.5, 1.5, 1.5, 127489830827583, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "StickersX_K_2025", "Stickers 2025 · StickersX_K_2025", "K", "Common", 6600901997, 130231206599976, 1, 1, 1, 102283625659356, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sweater_G_2025", "Sweater 2025", "G", "Uncommon", 79401392, 83785504897240, 1.5, 1.5, 1.5, 118557229750245, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Sweater_K_2025", "Sweater 2025", "K", "Uncommon", 6600901997, 134310239127931, 1, 1, 1, 102130993592804, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Penguin_K_2025", "Penguin", "K", "Common", 6600901997, 72734484939175, 1, 1, 1, 93320180084418, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "SweetChroma", "Sweet · SweetChroma", "K", "Godly", 88250692342609, 120707737118924, 0.0691, 0.0691, 0.0691, 90923771881248, 0, -1, 0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Cupid_K_2026", "Cupid", "K", "Legendary", 121944778, 91124699102770, 1, 1, 1, 123955324398353, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Heartbreak_G_2026", "Heartbreak", "G", "Rare", 79401392, 102957418708034, 1.6, 1.6, 1.6, 79235438948261, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Paws_G_2026", "Paws", "G", "Uncommon", 79401392, 108504597564281, 1.6, 1.6, 1.6, 120089556380493, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Blossom_K_2026", "Blossom 2026", "K", "Uncommon", 121944778, 139596499078847, 1, 1, 1, 110160120309916, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Strawberries_G_2026", "Strawberries", "G", "Common", 79401392, 103202994163470, 1.6, 1.6, 1.6, 128646835922561, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Hearts_K_2026", "Hearts 2026", "K", "Common", 121944778, 112048035793774, 1, 1, 1, 99939659856909, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Plaid_G_2026", "Plaid", "G", "Common", 79401392, 100185145262613, 1.6, 1.6, 1.6, 121681210724670, 0, -0.7, -0.3, 1, 0, 0, 0, 0, -1, 0, 1, 0 },
				{ "Starry_K_2026", "Starry 2026", "K", "Uncommon", 121944778, 98911990727243, 1, 1, 1, 130537925107449, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Strawberries_K_2026", "Strawberries", "K", "Common", 121944778, 75968382870233, 1, 1, 1, 73897192147749, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sweet_K_2026", "Yummy", "K", "Rare", 121944778, 139481558107907, 1, 1, 1, 113677688954146, 0, -1, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "HeartWandChroma", "Heart Wand · HeartWandChroma", "K", "Godly", 77738838473091, 78842905206144, 0.0782, 0.0782, 0.0782, 99154743764163, 0, -0.8, 0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
				{ "Sweet", "Sweet · Sweet", "K", "Godly", 88250692342609, 75844398224824, 0.0691, 0.0691, 0.0691, 126937716954396, 0, -1, 0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1 },
			}
			local rarityOrder = {
				Ancient = 1,
				Godly = 2,
				Unique = 3,
				Legendary = 4,
				Vintage = 5,
				Classic = 6,
				Rare = 7,
				Uncommon = 8,
				Common = 9,
			}
			local rarityColors = {
				Ancient = Color3.fromRGB(255, 190, 70),
				Godly = Color3.fromRGB(255, 90, 200),
				Unique = Color3.fromRGB(255, 230, 110),
				Legendary = Color3.fromRGB(255, 80, 80),
				Vintage = Color3.fromRGB(200, 170, 120),
				Classic = Color3.fromRGB(150, 210, 255),
				Rare = Color3.fromRGB(90, 150, 255),
				Uncommon = Color3.fromRGB(110, 220, 120),
				Common = Color3.fromRGB(170, 170, 170),
			}
			local skins = {}
			local skinsByKey = {}
			for _, e in ipairs(skinRows) do
				local s = {
					key = e[1],
					name = e[2],
					type = e[3] == "K" and "Knife" or "Gun",
					rarity = e[4],
					mesh = "rbxassetid://" .. e[5],
					tex = e[6] ~= 0 and "rbxassetid://" .. e[6] or "",
					scale = { e[7], e[8], e[9] },
					img = e[10],
					src = "tool",
					from = e[4],
					grip = e[11] and CFrame.new(e[11], e[12], e[13], e[14], e[15], e[16], e[17], e[18], e[19], e[20], e[21], e[22]) or nil,
				}
				table.insert(skins, s)
				skinsByKey[s.key] = s
			end
			table.sort(skins, function(a, b)
				local ra, rb = rarityOrder[a.rarity] or 10, rarityOrder[b.rarity] or 10
				if ra ~= rb then
					return ra < rb
				end
				return a.name < b.name
			end)
			local applied = {}

			local function restore(part)
				local a = applied[part]
				if not a then
					return
				end
				pcall(function()
					if a.mesh and a.orig then
						a.mesh.MeshId = a.orig.MeshId
						a.mesh.TextureId = a.orig.TextureId
						a.mesh.Scale = a.orig.Scale
					end
					if a.origColor then
						part.Color = a.origColor
						part.Material = a.origMat
					end
					if a.overlay then
						a.overlay:Destroy()
					end
					part.LocalTransparencyModifier = 0
				end)
				for _, f in ipairs(a.fx) do
					f:Destroy()
				end
				applied[part] = nil
			end

			local function restoreAll()
				for part in pairs(applied) do
					restore(part)
				end
			end

			local function makeTrailAtts(handle)
				local s = handle.Size
				local axis = s.X >= s.Y and s.X >= s.Z and Vector3.xAxis or (s.Y >= s.Z and Vector3.yAxis or Vector3.zAxis)
				local len = (s * axis).Magnitude / 2
				local a0 = create("Attachment", { Name = "RockHubTrail0", Position = axis * len * 0.9, Parent = handle })
				local a1 = create("Attachment", { Name = "RockHubTrail1", Position = -axis * len * 0.2, Parent = handle })
				return a0, a1
			end

			local function applyFx(a, handle)
				for _, f in ipairs(a.fx) do
					f:Destroy()
				end
				a.fx = {}
				local col = accentColor
				if skinCfg.glow then
					table.insert(a.fx, create("PointLight", {
						Name = "RockHubGlow",
						Color = col,
						Brightness = skinCfg.light / 25,
						Range = 9,
						Shadows = false,
						Parent = handle,
					}))
				end
				if skinCfg.sparkles then
					table.insert(a.fx, create("ParticleEmitter", {
						Name = "RockHubSparkles",
						Texture = "rbxasset://textures/particles/sparkles_main.dds",
						LightEmission = 1,
						Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 0) }),
						Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1) }),
						Lifetime = NumberRange.new(0.4, 0.8),
						Rate = 14,
						Speed = NumberRange.new(0.5, 1.5),
						SpreadAngle = Vector2.new(180, 180),
						Parent = handle,
					}))
				end
				if skinCfg.trail then
					local a0, a1 = makeTrailAtts(handle)
					table.insert(a.fx, a0)
					table.insert(a.fx, a1)
					table.insert(a.fx, create("Trail", {
						Name = "RockHubTrail",
						Attachment0 = a0,
						Attachment1 = a1,
						LightEmission = 1,
						Lifetime = 0.22,
						MinLength = 0.05,
						FaceCamera = true,
						Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1) }),
						WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) }),
						Parent = handle,
					}))
				end
			end

			local refScale = { tool = nil, display = nil }
			local K = 1

			local function updateK()
				if refScale.tool and refScale.display and refScale.display > 0 then
					K = refScale.tool / refScale.display
					setConfig("Skin Changer/K", K)
				end
			end

			register("Skin Changer/K", function(v)
				if type(v) == "number" and v > 0 then
					K = v
				end
			end, function()
				return K
			end, 1)

			local function scaleMag(part)
				if part:IsA("MeshPart") then
					local meshSize = part.MeshSize
					return meshSize.Magnitude > 0 and (part.Size / meshSize).Magnitude or nil
				end
				local specialMesh = part:FindFirstChildOfClass("SpecialMesh")
				return specialMesh and specialMesh.Scale.Magnitude or nil
			end

			local function calcScale(s, kind)
				local v = Vector3.new(s.scale[1], s.scale[2], s.scale[3])
				local origin = s.src or "display"
				if kind == "tool" and origin == "display" then
					v *= K
				elseif kind == "display" and origin == "tool" then
					v /= K
				end
				return v * (skinCfg.size / 100)
			end

			local function applySkin(part, weapon, isTool)
				local kind = isTool and "tool" or "display"
				if not applied[part] then
					local e = scaleMag(part)
					if e and e > 0 and refScale[kind] ~= e then
						refScale[kind] = e
						updateK()
					end
				end
				local s = skinsByKey[skinCfg.sel[weapon]]
				if not s then
					restore(part)
					return
				end
				local a = applied[part]
				if a and a.key == s.key and a.size == skinCfg.size then
					if a.mesh and not a.overlay and a.mesh.MeshId ~= s.mesh then
						a.key = nil
					else
						if a.overlay then
							part.LocalTransparencyModifier = 1
						end
						return
					end
				end
				if not a then
					a = { fx = {}, origColor = part.Color, origMat = part.Material }
					local specialMesh = part:FindFirstChildOfClass("SpecialMesh")
					if specialMesh and not part:IsA("MeshPart") then
						a.mesh = specialMesh
						a.orig = { MeshId = specialMesh.MeshId, TextureId = specialMesh.TextureId, Scale = specialMesh.Scale }
					end
					applied[part] = a
				end
				a.key, a.size = s.key, skinCfg.size
				if a.mesh and not (kind == "tool" and s.grip) then
					if a.overlay then
						a.overlay:Destroy()
						a.overlay = nil
						part.LocalTransparencyModifier = 0
					end
					a.mesh.MeshId = s.mesh
					a.mesh.TextureId = s.tex
					a.mesh.Scale = calcScale(s, kind)
					if s.color then
						part.Color = Color3.new(s.color[1], s.color[2], s.color[3])
						pcall(function()
							part.Material = Enum.Material[s.mat]
						end)
					end
				else
					if a.overlay then
						a.overlay:Destroy()
					end
					if a.mesh and a.orig then
						a.mesh.MeshId = a.orig.MeshId
						a.mesh.TextureId = a.orig.TextureId
						a.mesh.Scale = a.orig.Scale
					end
					local offset = CFrame.identity
					local tool = part.Parent
					if kind == "tool" and s.grip and tool and tool:IsA("Tool") then
						offset = tool.Grip * s.grip:Inverse()
					end
					local p = create("Part", {
						Name = "RockHubSkin",
						Size = Vector3.one * 0.2,
						Transparency = 0,
						CanCollide = false,
						CanTouch = false,
						CanQuery = false,
						Massless = true,
						Anchored = false,
						CFrame = part.CFrame * offset,
						Parent = part,
					})
					create("SpecialMesh", {
						MeshType = Enum.MeshType.FileMesh,
						MeshId = s.mesh,
						TextureId = s.tex,
						Scale = calcScale(s, kind),
						Parent = p,
					})
					if s.color then
						p.Color = Color3.new(s.color[1], s.color[2], s.color[3])
						pcall(function()
							p.Material = Enum.Material[s.mat]
						end)
					end
					create("WeldConstraint", { Part0 = part, Part1 = p, Parent = p })
					a.overlay = p
					part.LocalTransparencyModifier = 1
				end
				if isTool then
					applyFx(a, part)
				end
			end

			local function getHandles()
				local list = {}
				for _, container in ipairs({ player.Character, player:FindFirstChildOfClass("Backpack") }) do
					for _, tool in ipairs(container and container:GetChildren() or {}) do
						if tool:IsA("Tool") and (tool.Name == "Knife" or tool.Name == "Gun") then
							local h = tool:FindFirstChild("Handle")
							if h and h:IsA("BasePart") then
								table.insert(list, { h, tool.Name, true })
							end
						end
					end
				end
				return list
			end

			local function invalidate()
				for _, a in pairs(applied) do
					a.key = nil
				end
			end

			local lastScan = 0
			connect(RunService.Heartbeat, function()
				local now = os.clock()
				if skinCfg.enabled and now - lastScan > 0.5 then
					lastScan = now
					for _, t in ipairs(getHandles()) do
						pcall(applySkin, t[1], t[2], t[3])
					end
					for part in pairs(applied) do
						if not part:IsDescendantOf(game) then
							applied[part] = nil
						elseif not (part.Parent and part.Parent:IsA("Tool")) then
							restore(part)
						end
					end
				end
			end)
			local page = skinTab.page
			skinTab.custom = true
			skinTab.title.Visible = false
			skinTab.desc.Visible = false
			page.ScrollingEnabled = false
			page.ScrollBarThickness = 0
			page.CanvasSize = UDim2.new()
			local cardColor = Color3.fromRGB(36, 36, 38)
			local cardHover = Color3.fromRGB(48, 48, 52)
			local footerColor = Color3.fromRGB(17, 17, 19)
			local refresh

			local function pill(parent, text, x, h, size)
				local w = TextService:GetTextSize(text, size, Enum.Font.GothamMedium, Vector2.new(300, 40)).X + 30
				local b = create("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(90, 90, 90),
					BackgroundTransparency = 0.85,
					Position = UDim2.fromOffset(x, 0),
					Size = UDim2.fromOffset(w, h),
					ZIndex = 3,
					Parent = parent,
				})
				addCorner(b, 9)
				local d = create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0, 12, 0.5, 0),
					Size = UDim2.fromOffset(0, 0),
					BackgroundColor3 = accentColor,
					BorderSizePixel = 0,
					ZIndex = 4,
					Parent = b,
				})
				makeRound(d)
				local l = create("TextLabel", {
					Text = text,
					Font = Enum.Font.GothamMedium,
					TextSize = size,
					TextColor3 = dimColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(15, 0),
					Size = UDim2.new(1, -15, 1, 0),
					ZIndex = 4,
					Parent = b,
				})
				local o = { b = b, dot = d, lbl = l, w = w, on = false }

				o.set = function(on)
					o.on = on
					tween(b, 0.25, { BackgroundTransparency = on and 0.35 or 0.85 }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
					tween(d, 0.25, { Size = UDim2.fromOffset(on and 6 or 0, on and 6 or 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
					tween(l, 0.25, { TextColor3 = on and accentColor or dimColor, Position = UDim2.fromOffset(on and 21 or 15, 0) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				end

				connect(b.MouseEnter, function()
					if not o.on then
						tween(l, 0.15, { TextColor3 = textColor })
					end
				end)
				connect(b.MouseLeave, function()
					if not o.on then
						tween(l, 0.15, { TextColor3 = dimColor })
					end
				end)
				return o
			end

			local bar = create("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 3, Parent = page })
			local tabs2, x = {}, 0
			for _, sub in ipairs({ "Knife", "Gun" }) do
				local o = pill(bar, sub, x, 30, 13)
				tabs2[sub] = o
				x += o.w + 4
				connect(o.b.MouseButton1Click, function()
					if skinCfg.listType == sub then
						return
					end
					tabs2[skinCfg.listType].set(false)
					skinCfg.listType = sub
					o.set(true)
					refresh(true)
				end)
			end
			tabs2[skinCfg.listType].set(true)
			local toggleBtn = create("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundColor3 = Color3.fromRGB(90, 90, 90),
				BackgroundTransparency = 0.85,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -4, 0, 0),
				Size = UDim2.fromOffset(96, 30),
				ZIndex = 3,
				Parent = bar,
			})
			addCorner(toggleBtn, 9)
			local toggleLbl = create("TextLabel", {
				Text = "Skins",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = accentColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(12, 0),
				Size = UDim2.new(1, -50, 1, 0),
				ZIndex = 4,
				Parent = toggleBtn,
			})
			local switch = create("Frame", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -9, 0.5, 0),
				Size = UDim2.fromOffset(30, 16),
				BackgroundColor3 = accentColor,
				ZIndex = 4,
				Parent = toggleBtn,
			})
			makeRound(switch)
			local outline = addStroke(switch, accentColor)
			local knob = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0, 22, 0.5, 0),
				Size = UDim2.fromOffset(10, 10),
				BackgroundColor3 = bgColor,
				ZIndex = 5,
				Parent = switch,
			})
			makeRound(knob)

			local function setEnabled(on, byUser)
				skinCfg.enabled = on
				if on then
					for _, a in pairs(applied) do
						a.key = nil
					end
					lastScan = 0
				else
					restoreAll()
				end
				knob.Size = UDim2.fromOffset(15, 10)
				tween(knob, 0.35, {
					Position = UDim2.new(0, on and 22 or 8, 0.5, 0),
					Size = UDim2.fromOffset(10, 10),
					BackgroundColor3 = on and bgColor or dimColor,
				}, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				tween(switch, 0.25, { BackgroundColor3 = on and accentColor or bgColor })
				tween(outline, 0.25, { Color = on and accentColor or strokeColor })
				tween(toggleLbl, 0.25, { TextColor3 = on and accentColor or dimColor })
				tween(toggleBtn, 0.25, { BackgroundTransparency = on and 0.6 or 0.85 })
				if byUser then
					setConfig("Skin Changer/Enabled", on)
					notify("Skin Changer: " .. (on and "On" or "Off"), on and "skins equipped" or "default weapons")
				end
			end

			connect(toggleBtn.MouseButton1Click, function()
				setEnabled(not skinCfg.enabled, true)
			end)
			register("Skin Changer/Enabled", function(v)
				if type(v) == "boolean" then
					setEnabled(v)
				end
			end, function()
				return skinCfg.enabled
			end, true)
			local info = create("TextLabel", {
				Text = "",
				RichText = true,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = dimColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(2, 38),
				Size = UDim2.new(1, -4, 0, 20),
				ZIndex = 3,
				Parent = page,
			})
			local query = ""

			local function updateInfo()
				local knives, guns = 0, 0
				for _, s in ipairs(skins) do
					if s.type == "Knife" then
						knives += 1
					else
						guns += 1
					end
				end

				local function cur(weapon)
					local s = skinsByKey[skinCfg.sel[weapon]]
					return s and "<b><font color=\"#ffffff\">" .. s.name .. "</font></b>" or "default"
				end

				info.Text = ("%d knives · %d guns     knife: %s · gun: %s").format("%d knives · %d guns     knife: %s · gun: %s", knives, guns, cur("Knife"), cur("Gun"))
			end

			local searchBox = create("Frame", {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -4, 0, 35),
				Size = UDim2.fromOffset(170, 24),
				BackgroundColor3 = Color3.fromRGB(22, 22, 22),
				ZIndex = 3,
				Parent = page,
			})
			addCorner(searchBox, 8)
			local searchStroke = addStroke(searchBox)
			local searchInput = create("TextBox", {
				Text = "",
				PlaceholderText = "Search skins...",
				PlaceholderColor3 = mutedColor,
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = accentColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(10, 0),
				Size = UDim2.new(1, -16, 1, 0),
				ZIndex = 4,
				Parent = searchBox,
			})
			info.Size = UDim2.new(1, -190, 0, 20)
			connect(searchInput.Focused, function()
				tween(searchStroke, 0.2, { Color = Color3.fromRGB(120, 120, 120) })
			end)
			connect(searchInput.FocusLost, function()
				tween(searchStroke, 0.2, { Color = strokeColor })
			end)
			local grid = create("ScrollingFrame", {
				Position = UDim2.fromOffset(0, 66),
				Size = UDim2.new(1, 0, 1, -66),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 3,
				ScrollBarImageColor3 = dimColor,
				ScrollBarImageTransparency = 0.3,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(),
				ZIndex = 2,
				Parent = page,
			})
			create("UIPadding", {
				PaddingTop = UDim.new(0, 1),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 4),
				Parent = grid,
			})
			local layout = create("UIGridLayout", {
				CellSize = UDim2.new(0.25, -6, 0, 150),
				CellPadding = UDim2.fromOffset(8, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = grid,
			})
			local emptyLabel = create("TextLabel", {
				Text = "",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = mutedColor,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(20, 106),
				Size = UDim2.new(1, -40, 0, 60),
				ZIndex = 3,
				Parent = page,
			})

			local function updateCanvas()
				grid.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 8)
			end

			connect(layout:GetPropertyChangedSignal("AbsoluteContentSize"), updateCanvas)
			local cards = {}

			local function updateCard(c)
				local on = skinCfg.sel[c.s.type] == c.s.key
				c.stroke.Color = on and accentColor or strokeColor
				c.stroke.Transparency = on and 0.1 or 0
				tween(c.badge, 0.25, { Size = UDim2.fromOffset(on and 62 or 0, 15) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
			end

			local function selectSkin(s, c)
				skinCfg.sel[s.type] = skinCfg.sel[s.type] ~= s.key and s.key or nil
				setConfig("Skin Changer/Skins/" .. s.type, skinCfg.sel[s.type] or false)
				for _, item in ipairs(cards) do
					updateCard(item)
				end
				updateInfo()
				invalidate()
				lastScan = 0
				c.sc.Scale = 0.93
				tween(c.sc, 0.35, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				notify(s.type, skinCfg.sel[s.type] and s.name .. " equipped" or "default skin")
			end

			local function makeCard(s, order)
				local card = create("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					LayoutOrder = order,
					ZIndex = 2,
					Parent = grid,
				})
				local scale = create("UIScale", { Parent = card })
				local thumb = create("Frame", {
					Size = UDim2.new(1, 0, 0, 100),
					BackgroundColor3 = cardColor,
					ClipsDescendants = true,
					ZIndex = 2,
					Parent = card,
				})
				addCorner(thumb, 8)
				local st = addStroke(thumb)
				local thumb2 = create("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(84, 84),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = s.img ~= 0 and ("rbxthumb://type=Asset&id=%d&w=150&h=150"):format(s.img) or "",
					ZIndex = 3,
					Parent = thumb,
				})
				local badge = create("TextLabel", {
					Text = "EQUIPPED",
					Font = Enum.Font.GothamBold,
					TextSize = 9,
					TextColor3 = Color3.fromRGB(10, 10, 10),
					BackgroundColor3 = accentColor,
					Position = UDim2.fromOffset(6, 6),
					Size = UDim2.fromOffset(0, 15),
					ClipsDescendants = true,
					ZIndex = 5,
					Parent = thumb,
				})
				addCorner(badge, 5)
				local footer = create("Frame", {
					Position = UDim2.fromOffset(0, 106),
					Size = UDim2.new(1, 0, 1, -106),
					BackgroundColor3 = footerColor,
					ZIndex = 2,
					Parent = card,
				})
				addCorner(footer, 8)
				create("TextLabel", {
					Text = s.name:upper(),
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextColor3 = accentColor,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(6, 5),
					Size = UDim2.new(1, -12, 0, 15),
					ZIndex = 3,
					Parent = footer,
				})
				create("TextLabel", {
					Text = s.rarity,
					Font = Enum.Font.GothamMedium,
					TextSize = 10,
					TextColor3 = rarityColors[s.rarity] or dimColor,
					TextXAlignment = Enum.TextXAlignment.Center,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(6, 21),
					Size = UDim2.new(1, -12, 0, 12),
					ZIndex = 3,
					Parent = footer,
				})
				local c = { card = card, sc = scale, stroke = st, badge = badge, s = s }
				table.insert(cards, c)
				updateCard(c)
				connect(card.MouseEnter, function()
					tween(thumb, 0.15, { BackgroundColor3 = cardHover })
					tween(thumb2, 0.2, { Size = UDim2.fromOffset(94, 94) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				end)
				connect(card.MouseLeave, function()
					tween(thumb, 0.15, { BackgroundColor3 = cardColor })
					tween(thumb2, 0.2, { Size = UDim2.fromOffset(84, 84) })
				end)
				connect(card.MouseButton1Click, function()
					selectSkin(s, c)
				end)
			end

			local list, shown = {}, 0

			local function loadMore()
				local last = math.min(#list, shown + 32)
				for i = shown + 1, last do
					makeCard(list[i], i)
				end
				shown = last
				updateCanvas()
			end

			connect(grid:GetPropertyChangedSignal("CanvasPosition"), function()
				if shown < #list and grid.CanvasPosition.Y + grid.AbsoluteWindowSize.Y > grid.CanvasSize.Y.Offset - 300 then
					loadMore()
				end
			end)

			refresh = function(anim)
				for _, c in ipairs(cards) do
					c.card:Destroy()
				end
				table.clear(cards)
				list, shown = {}, 0
				for _, s in ipairs(skins) do
					if s.type == skinCfg.listType and (query == "" or s.name:lower():find(query, 1, true)) then
						table.insert(list, s)
					end
				end
				grid.CanvasPosition = Vector2.zero
				loadMore()
				emptyLabel.Text = #list == 0 and "nothing found" or ""
				updateInfo()
				if anim then
					grid.Position = UDim2.fromOffset(0, 78)
					tween(grid, 0.35, { Position = UDim2.fromOffset(0, 66) }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				end
			end

			connect(searchInput:GetPropertyChangedSignal("Text"), function()
				query = searchInput.Text:lower()
				refresh(false)
			end)
			for _, weapon in ipairs({ "Knife", "Gun" }) do
				register("Skin Changer/Skins/" .. weapon, function(v)
					if type(v) == "string" and skinsByKey[v] then
						skinCfg.sel[weapon] = v
						for _, c in ipairs(cards) do
							updateCard(c)
						end
						updateInfo()
					end
				end, function()
					return skinCfg.sel[weapon]
				end)
			end
			refresh(false)

			stopSkinChanger = function()
				restoreAll()
			end
		end
		do
			local bhop = { on = false, mode = "Hold Space", max = 60, gain = 8 }
			local hops = 0
			local landedAt = 0
			local lastJump = 0
			local inAir = false
			local baseFov

			local function resetBhop()
				hops = 0
				local cam = workspace.CurrentCamera
				if baseFov and cam then
					tween(cam, 0.3, { FieldOfView = baseFov })
				end
			end

			connect(RunService.Heartbeat, function()
				if not bhop.on then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum or hum.Health <= 0 then
					return
				end
				local moving = hum.MoveDirection.Magnitude > 0.1
				local want = bhop.mode == "Auto" and moving or bhop.mode == "Hold Space" and UserInputService:IsKeyDown(Enum.KeyCode.Space)
				local grounded = hum.FloorMaterial ~= Enum.Material.Air
				local now = os.clock()
				if grounded then
					if inAir then
						landedAt = now
					end
					inAir = false
					if want and moving then
						if now - lastJump > 0.2 then
							lastJump = now
							hops += 1
							hum:ChangeState(Enum.HumanoidStateType.Jumping)
						end
					elseif now - landedAt > 0.25 or not moving then
						if hops > 0 then
							resetBhop()
						end
					end
				else
					inAir = true
					if moving and hops > 0 then
						local speed = math.min(hum.WalkSpeed + hops * bhop.gain * 0.5, bhop.max)
						local dir = hum.MoveDirection.Unit
						local v = hrp.AssemblyLinearVelocity
						hrp.AssemblyLinearVelocity = Vector3.new(dir.X * speed, v.Y, dir.Z * speed)
						local cam = workspace.CurrentCamera
						if cam then
							baseFov = baseFov or cam.FieldOfView
							local k = math.clamp((speed - hum.WalkSpeed) / math.max(bhop.max - hum.WalkSpeed, 1), 0, 1)
							cam.FieldOfView = cam.FieldOfView + (baseFov + 12 * k - cam.FieldOfView) * 0.15
						end
					end
				end
			end)
			local sec = addSection(trollTab, "Bhop")
			sec:Toggle("Enable", "bunny hop - every jump makes you faster", function(on)
				bhop.on = on
				if not on then
					resetBhop()
				end
				notify("Bhop: " .. (on and "On" or "Off"), on and (bhop.mode == "Auto" and "just run" or "hold space and run") or "stopped")
			end)
			sec:Segmented("Mode", { "Hold Space", "Auto" }, bhop.mode, function(v)
				bhop.mode = v
			end)
			sec:Slider("Max speed", 30, 150, bhop.max, function(v)
				bhop.max = v
			end)
			sec:Slider("Gain per hop", 2, 20, bhop.gain, function(v)
				bhop.gain = v
			end)
		end
		do
			local spin = { on = false, speed = 10, dir = "Right" }
			local spinHum
			connect(RunService.Heartbeat, function(dt)
				if not spin.on then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = getHumanoid()
				if not hrp or not hum or hum.Health <= 0 then
					return
				end
				if hum.AutoRotate then
					hum.AutoRotate = false
				end
				spinHum = hum
				local w = spin.speed * 1.5 * (spin.dir == "Right" and -1 or 1)
				hrp.CFrame *= CFrame.Angles(0, w * dt, 0)
			end)

			local function stop()
				if spinHum and spinHum.Parent then
					spinHum.AutoRotate = true
				end
				spinHum = nil
			end

			local sec = addSection(trollTab, "Spin")
			sec:Toggle("Enable", "spin your character around", function(on)
				spin.on = on
				if not on then
					stop()
				end
				notify("Spin: " .. (on and "On" or "Off"), on and "weeee" or "stopped")
			end)
			sec:Slider("Speed", 1, 30, spin.speed, function(v)
				spin.speed = v
			end, function(v)
				return v .. "x"
			end)
			sec:Segmented("Direction", { "Left", "Right" }, spin.dir, function(v)
				spin.dir = v
			end)

			stopSpin = function()
				spin.on = false
				stop()
			end
		end
		do
			local hugAnimIds = { 125491951751014, 90892690280238, 88712283515515, 99919046918338, 127717306748023 }
			local hugState = { on = false, target = nil }
			local track, menuSeq2

			local function getHugAnimId()
				if menuSeq2 then
					return menuSeq2
				end
				for _, id in ipairs(hugAnimIds) do
					local ok, objs = pcall(function()
						return game:GetObjects("rbxassetid://" .. id)
					end)
					if ok and type(objs) == "table" then
						for _, o in ipairs(objs) do
							local list = o:GetDescendants()
							table.insert(list, 1, o)
							for _, a in ipairs(list) do
								if a:IsA("Animation") and a.AnimationId ~= "" then
									menuSeq2 = a.AnimationId
									return menuSeq2
								end
							end
						end
					end
				end
			end

			local function stopHugAnim()
				if track then
					pcall(function()
						track:Stop(0.25)
					end)
					track = nil
				end
			end

			local function playHugAnim()
				local hum = getHumanoid()
				if not hum then
					return
				end
				task.spawn(function()
					local id = getHugAnimId()
					if not id or not hugState.on then
						if not id then
							notify("Hug", "couldn't load the hug animation")
						end
						return
					end
					stopHugAnim()
					local anim = Instance.new("Animation")
					anim.AnimationId = id
					local animator = hum:FindFirstChildOfClass("Animator") or hum
					local ok, tr = pcall(function()
						return animator:LoadAnimation(anim)
					end)
					if ok and tr then
						tr.Priority = Enum.AnimationPriority.Action4
						tr.Looped = true
						tr:Play(0.25)
						track = tr
					end
				end)
			end

			local function findNearest(exclude)
				local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if not myRoot then
					return nil
				end
				local best, bestDist
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and p ~= exclude then
						local h = alive(p)
						if h then
							local d = (h.Position - myRoot.Position).Magnitude
							if not bestDist or d < bestDist then
								best, bestDist = p, d
							end
						end
					end
				end
				return best
			end

			connect(RunService.Heartbeat, function()
				if not hugState.on then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not hrp then
					return
				end
				local th = alive(hugState.target)
				if not th then
					hugState.target = findNearest()
					th = alive(hugState.target)
					if not th then
						return
					end
					notify("Hug", "hugging " .. hugState.target.DisplayName)
				end
				local front = th.CFrame * CFrame.new(0, 0, -1.4)
				hrp.CFrame = CFrame.lookAt(front.Position, Vector3.new(th.Position.X, front.Position.Y, th.Position.Z))
				hrp.AssemblyLinearVelocity = Vector3.zero
				if not track then
					playHugAnim()
				end
			end)
			local sec = addSection(trollTab, "Hug")
			sec:Toggle("Hug", "hug the nearest player - everyone sees it", function(on)
				hugState.on = on
				if on then
					hugState.target = findNearest()
					if hugState.target then
						notify("Hug", "hugging " .. hugState.target.DisplayName)
						playHugAnim()
					else
						notify("Hug", "nobody around")
					end
				else
					stopHugAnim()
					hugState.target = nil
				end
			end)
			sec:Button("Next player", "hug someone else", function()
				local list = {}
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and alive(p) then
						table.insert(list, p)
					end
				end
				if #list == 0 then
					notify("Hug", "nobody around")
					return
				end
				local i = table.find(list, hugState.target) or 0
				hugState.target = list[i % #list + 1]
				notify("Hug", "hugging " .. hugState.target.DisplayName)
			end)
			table.insert(connections, {
				Disconnect = function()
					stopHugAnim()
				end,
			})
		end
		do
			local activePad
			local loopThread
			local votesCast = 0

			local function getLobby()
				return workspace:FindFirstChild("RegularLobby") or workspace:FindFirstChild("Lobby")
			end

			local function getVotePad(i)
				local lobby = getLobby()
				if not lobby then
					return nil
				end
				return lobby:FindFirstChild("VotePad" .. i) or lobby:FindFirstChild("VotePad" .. i, true)
			end

			local function getPadCF(pad)
				if not pad then
					return nil
				end
				if pad:IsA("BasePart") then
					return pad.CFrame
				end
				if pad:IsA("Model") then
					return pad:GetPivot()
				end
				local part = pad:FindFirstChildWhichIsA("BasePart", true)
				return part and part.CFrame
			end

			local guisByAdornee = {}

			local function scanGuis()
				table.clear(guisByAdornee)
				local playerGui = player:FindFirstChildOfClass("PlayerGui")
				if not playerGui then
					return
				end
				for _, g in ipairs(playerGui:GetDescendants()) do
					if (g:IsA("SurfaceGui") or g:IsA("BillboardGui")) and g.Adornee then
						local list = guisByAdornee[g.Adornee] or {}
						guisByAdornee[g.Adornee] = list
						table.insert(list, g)
					end
				end
			end

			local function getPadGuis(pad)
				local out = {}
				for adornee, list in pairs(guisByAdornee) do
					if adornee == pad or adornee:IsDescendantOf(pad) then
						for _, g in ipairs(list) do
							table.insert(out, g)
						end
					end
				end
				local voteInfo = pad:FindFirstChild("VoteInfoGui", true)
				if voteInfo then
					table.insert(out, voteInfo)
				end
				return out
			end

			local function readPad(pad)
				if not pad then
					return nil, nil
				end
				local map, votes
				for _, g in ipairs(getPadGuis(pad)) do
					if g:IsA("LayerCollector") and not g.Enabled then
						continue
					end
					local box = g:FindFirstChild("Container", true) or g

					local function hex(name)
						local o = box:FindFirstChild(name, true)
						if o and (o:IsA("TextLabel") or o:IsA("TextButton")) and o.Text ~= "" then
							return o.Text
						end
					end

					map = map or hex("MapName")
					local v = hex("Votes")
					if v and (not votes or (tonumber(v:match("%d+")) or 0) > (tonumber(votes:match("%d+")) or 0)) then
						votes = v
					end
				end
				return map, votes
			end

			local function findPadImage(pad)
				local best, bestScore = nil, 0
				for _, d in ipairs(pad:GetDescendants()) do
					local img
					if d:IsA("ImageLabel") or d:IsA("ImageButton") then
						img = d.Image
					elseif d:IsA("Decal") or d:IsA("Texture") then
						img = d.Texture
					end
					if img and img ~= "" then
						local n = d.Name:lower()
						local score = (n:find("map") or n:find("thumb") or n:find("preview")) and 3 or ((n:find("image") or n:find("icon")) and 2 or 1)
						if score > bestScore then
							best, bestScore = img, score
						end
					end
				end
				return best
			end

			local cardColor = Color3.fromRGB(36, 36, 38)
			local cardHover = Color3.fromRGB(48, 48, 52)
			local footerColor = Color3.fromRGB(17, 17, 19)
			local page = voteTab.page
			voteTab.custom = true
			voteTab.title.Visible = false
			voteTab.desc.Visible = false
			page.ScrollingEnabled = false
			page.ScrollBarThickness = 0
			page.CanvasSize = UDim2.new()
			create("TextLabel", {
				Text = "Vote Dupe Map",
				Font = Enum.Font.GothamBold,
				TextSize = 18,
				TextColor3 = accentColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -110, 0, 22),
				Parent = page,
			})
			local statusLabel = create("TextLabel", {
				Text = "pick a map",
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = dimColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 22),
				Size = UDim2.new(1, -110, 0, 16),
				Parent = page,
			})

			local function setStatus(t)
				statusLabel.Text = t
			end

			local stopBtn = create("TextButton", {
				Text = "Stop",
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = mutedColor,
				BackgroundColor3 = elemColor,
				AutoButtonColor = false,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -8, 0, 4),
				Size = UDim2.fromOffset(80, 28),
				ZIndex = 2,
				Parent = page,
			})
			addCorner(stopBtn, 8)
			local stopStroke = addStroke(stopBtn)
			local stopScale = create("UIScale", { Parent = stopBtn })
			local grid = create("Frame", {
				Position = UDim2.fromOffset(0, 50),
				Size = UDim2.new(1, -8, 0, 172),
				BackgroundTransparency = 1,
				Parent = page,
			})
			create("UIGridLayout", {
				CellSize = UDim2.new(0.3333333333333333, -6, 0, 172),
				CellPadding = UDim2.fromOffset(8, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = grid,
			})
			local waitGroup = create("CanvasGroup", {
				Position = UDim2.fromOffset(0, 46),
				Size = UDim2.new(1, -8, 1, -46),
				BackgroundTransparency = 1,
				GroupTransparency = 1,
				Visible = false,
				ZIndex = 5,
				Parent = page,
			})
			local ring = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, -44),
				Size = UDim2.fromOffset(136, 136),
				BackgroundColor3 = panelColor,
				ZIndex = 6,
				Parent = waitGroup,
			})
			makeRound(ring)
			local ringStroke = create("UIStroke", { Color = accentColor, Thickness = 2, Parent = ring })
			local ringGradient = create("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(0.5, 0.85),
					NumberSequenceKeypoint.new(1, 0),
				}),
				Parent = ringStroke,
			})
			local mascot2 = create("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -10, 1, -10),
				BackgroundColor3 = Color3.fromRGB(22, 22, 22),
				ScaleType = Enum.ScaleType.Crop,
				Image = "",
				ZIndex = 7,
				Parent = ring,
			})
			makeRound(mascot2)
			create("TextLabel", {
				Text = "zzz",
				Font = Enum.Font.GothamBlack,
				TextSize = 22,
				TextColor3 = hoverColor,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ZIndex = 8,
				Parent = mascot2,
			})
			local waitLabel = create("TextLabel", {
				Text = "Waiting for map",
				Font = Enum.Font.GothamBold,
				TextSize = 20,
				TextColor3 = accentColor,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, 38),
				Size = UDim2.new(1, 0, 0, 24),
				ZIndex = 6,
				Parent = waitGroup,
			})
			local waitGradient = create("UIGradient", { Parent = waitLabel })
			local dotsFrame = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, 68),
				Size = UDim2.fromOffset(36, 12),
				BackgroundTransparency = 1,
				ZIndex = 6,
				Parent = waitGroup,
			})
			local dots = {}
			for i = 1, 3 do
				dots[i] = create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0, 6 + (i - 1) * 12, 0.5, 0),
					Size = UDim2.fromOffset(5, 5),
					BackgroundColor3 = accentColor,
					ZIndex = 6,
					Parent = dotsFrame,
				})
				makeRound(dots[i])
			end
			create("TextLabel", {
				Text = "round is on  ·  maps show up when voting starts",
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = dimColor,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, 86),
				Size = UDim2.new(1, 0, 0, 16),
				ZIndex = 6,
				Parent = waitGroup,
			})
			local waiting = false
			local waitScale = create("UIScale", { Parent = waitGroup })
			local gridScale = create("UIScale", { Parent = grid })

			local function setWaiting(on)
				if on == waiting then
					return
				end
				waiting = on
				if on then
					grid.Visible = false
					waitGroup.Visible = true
					waitScale.Scale = 0.92
					tween(waitScale, 0.45, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
					tween(waitGroup, 0.35, { GroupTransparency = 0 })
				else
					local t = tween(waitGroup, 0.2, { GroupTransparency = 1 })
					t.Completed:Connect(function()
						if not waiting then
							waitGroup.Visible = false
						end
					end)
					grid.Visible = true
					gridScale.Scale = 0.9
					tween(gridScale, 0.45, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				end
			end

			local animStart = os.clock()
			connect(RunService.RenderStepped, function()
				if not waitGroup.Visible or not main.Visible then
					return
				end
				local t = os.clock() - animStart
				ringGradient.Rotation = t * 140 % 360
				waitGradient.Color = shimmerSeq(t * 0.35)
				local bob = math.sin(t * 1.6) * 4
				ring.Position = UDim2.new(0.5, 0, 0.5, -44 + bob)
				for i, d in ipairs(dots) do
					local k = math.max(0, math.sin(t * 5 - i * 0.7))
					d.Position = UDim2.new(0, 6 + (i - 1) * 12, 0.5, -k * 5)
					d.BackgroundTransparency = 0.6 - k * 0.6
				end
			end)
			local cards = {}
			local relayout
			local desyncPaused = false

			local function pauseDesync2(on)
				if on and not desyncPaused then
					local char = player.Character
					pauseDesync(char and char:FindFirstChild("HumanoidRootPart"))
					desyncPaused = true
					if desync.on then
						notify("Desync paused", "turned off while you dupe map votes")
					end
				elseif not on and desyncPaused then
					resumeDesync()
					desyncPaused = false
					if desync.on then
						notify("Desync: On", "vote loop ended - desync is back")
					end
				end
			end

			local function stop(silent)
				local wasActive = activePad
				activePad = nil
				pauseDesync2(false)
				if loopThread then
					pcall(task.cancel, loopThread)
					loopThread = nil
				end
				relayout()
				if wasActive and not silent then
					setStatus("stopped  ·  " .. votesCast .. " votes cast")
					notify("Vote Dupe", "loop stopped")
				end
			end

			local function padVotes(i)
				local pad = getVotePad(i)
				if not pad then
					return false
				end
				local map, votes = readPad(pad)
				if not (map and votes) then
					return false
				end
				return true, tonumber(votes:match("%d+"))
			end

			local function endLoop(reason)
				if not activePad then
					return
				end
				activePad = nil
				pauseDesync2(false)
				local th = loopThread
				loopThread = nil
				if th and th ~= coroutine.running() then
					pcall(task.cancel, th)
				end
				relayout()
				setStatus(reason .. "  ·  " .. votesCast .. " votes cast")
				notify("Vote Dupe", reason .. " - loop stopped")
			end

			local function start(i)
				stop(true)
				activePad = i
				votesCast = 0
				pauseDesync2(true)
				relayout()
				local name = cards[i].map or "pad #" .. i
				setStatus("looping on " .. name)
				notify("Vote Dupe", "voting for " .. name)
				loopThread = task.spawn(function()
					local best, stale = nil, 0
					while activePad == i do
						scanGuis()
						local active, count = padVotes(i)
						if not active then
							endLoop("voting ended")
							return
						end
						best = best or count
						local char = player.Character
						local hum = char and char:FindFirstChildOfClass("Humanoid")
						local root = char and char:FindFirstChild("HumanoidRootPart")
						local target = getPadCF(getVotePad(i))
						if hum and hum.Health > 0 and root and target then
							root.CFrame = target + Vector3.new(0, 2.5, 0)
							local before = count
							local waitStart = os.clock()
							repeat
								RunService.Heartbeat:Wait()
								root.CFrame = target + Vector3.new(0, 2.5, 0)
								scanGuis()
								local _, c = padVotes(i)
								if c and before and c > before then
									break
								end
							until os.clock() - waitStart >= 0.4 or activePad ~= i
							if activePad ~= i then
								break
							end
							scanGuis()
							active, count = padVotes(i)
							if not active then
								endLoop("voting ended")
								return
							end
							if count and best and count <= best then
								stale += 1
								if stale >= 3 then
									endLoop("votes not counting")
									return
								end
							else
								stale = 0
								best = count or best
							end
							votesCast += 1
							setStatus("looping on " .. (cards[i].map or "pad #" .. i) .. "  ·  " .. votesCast .. " votes cast")
							if hum.Health > 0 then
								hum.Health = 0
							end
							local newChar = player.CharacterAdded:Wait()
							newChar:WaitForChild("HumanoidRootPart", 3)
							task.wait(0.12)
							local r = newChar:FindFirstChild("HumanoidRootPart")
							local padCF = getPadCF(getVotePad(i))
							if activePad == i and r and (not padCF or (r.Position - padCF.Position).Magnitude > 300) then
								endLoop("round started")
								return
							end
						elseif not hum or hum.Health <= 0 then
							local respawned = player.CharacterAdded:Wait()
							respawned:WaitForChild("HumanoidRootPart", 3)
							task.wait(0.12)
						else
							task.wait(0.2)
						end
					end
				end)
			end

			for i = 1, 3 do
				local card = create("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					LayoutOrder = i,
					ZIndex = 2,
					Parent = grid,
				})
				local cardScale = create("UIScale", { Parent = card })
				local thumb = create("Frame", { Size = UDim2.new(1, 0, 0, 112), BackgroundColor3 = cardColor, ZIndex = 2, Parent = card })
				addCorner(thumb, 8)
				local thumbStroke = addStroke(thumb)
				local ph = create("TextLabel", {
					Text = "?",
					Font = Enum.Font.GothamBlack,
					TextSize = 28,
					TextColor3 = hoverColor,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -18),
					ZIndex = 3,
					Parent = thumb,
				})
				local img = create("ImageLabel", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Crop,
					ImageColor3 = Color3.fromRGB(200, 200, 200),
					ImageTransparency = 1,
					ZIndex = 3,
					Parent = thumb,
				})
				addCorner(img, 8)
				local shade = create("Frame", {
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1),
					Size = UDim2.new(1, 0, 0, 44),
					BackgroundColor3 = Color3.new(0, 0, 0),
					BorderSizePixel = 0,
					ZIndex = 4,
					Parent = thumb,
				})
				addCorner(shade, 8)
				create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0.25), Parent = shade })
				local move = create("Frame", {
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -6, 0, 6),
					Size = UDim2.fromOffset(64, 16),
					BackgroundColor3 = accentColor,
					Visible = false,
					ZIndex = 5,
					Parent = thumb,
				})
				addCorner(move, 5)
				local runDot = create("Frame", {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 6, 0.5, 0),
					Size = UDim2.fromOffset(5, 5),
					BackgroundColor3 = bgColor,
					ZIndex = 6,
					Parent = move,
				})
				makeRound(runDot)
				create("TextLabel", {
					Text = "RUNNING",
					Font = Enum.Font.GothamBold,
					TextSize = 9,
					TextColor3 = bgColor,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(14, 0),
					Size = UDim2.new(1, -16, 1, 0),
					ZIndex = 6,
					Parent = move,
				})
				local votes = create("TextLabel", {
					Text = "<font color=\"#FFFFFF\"><b>-</b></font> <font color=\"#9A9A9A\">votes</font>",
					RichText = true,
					Font = Enum.Font.GothamMedium,
					TextSize = 12,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 8, 1, -5),
					Size = UDim2.new(1, -16, 0, 16),
					ZIndex = 5,
					Parent = thumb,
				})
				local footer = create("Frame", {
					Position = UDim2.fromOffset(0, 118),
					Size = UDim2.new(1, 0, 1, -118),
					BackgroundColor3 = footerColor,
					ZIndex = 2,
					Parent = card,
				})
				addCorner(footer, 8)
				local nameLabel = create("TextLabel", {
					Text = "LOADING...",
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextColor3 = accentColor,
					TextWrapped = true,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(6, 0),
					Size = UDim2.new(1, -12, 1, 0),
					ZIndex = 3,
					Parent = footer,
				})
				local c = {
					thumb = thumb,
					stroke = thumbStroke,
					img = img,
					ph = ph,
					run = move,
					runDot = runDot,
					votes = votes,
					name = nameLabel,
					hover = false,
				}
				cards[i] = c
				connect(card.MouseEnter, function()
					c.hover = true
					relayout()
				end)
				connect(card.MouseLeave, function()
					c.hover = false
					relayout()
				end)
				connect(card.MouseButton1Click, function()
					cardScale.Scale = 0.94
					tween(cardScale, 0.35, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
					if activePad == i then
						stop()
					else
						start(i)
					end
				end)
			end

			relayout = function()
				for i, c in ipairs(cards) do
					local on = activePad == i
					tween(c.thumb, 0.15, { BackgroundColor3 = c.hover and cardHover or cardColor })
					tween(c.stroke, 0.2, {
						Color = on and accentColor or (c.hover and hoverStroke or strokeColor),
						Thickness = on and 1.5 or 1,
					})
					tween(c.img, 0.2, { ImageColor3 = (on or c.hover) and accentColor or Color3.fromRGB(200, 200, 200) })
					if on and not c.run.Visible then
						c.run.Visible = true
						c.run.Size = UDim2.fromOffset(40, 16)
						tween(c.run, 0.3, { Size = UDim2.fromOffset(64, 16) }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
					elseif not on then
						c.run.Visible = false
					end
				end
				local exists = activePad ~= nil
				tween(stopBtn, 0.2, {
					BackgroundColor3 = exists and accentColor or elemColor,
					TextColor3 = exists and bgColor or mutedColor,
				})
				tween(stopStroke, 0.2, { Color = exists and accentColor or strokeColor })
			end

			relayout()
			connect(stopBtn.MouseButton1Click, function()
				stopScale.Scale = 0.85
				tween(stopScale, 0.35, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				if activePad then
					stop()
				else
					notify("Vote Dupe", "nothing is running")
				end
			end)
			connect(RunService.Heartbeat, function()
				if not activePad then
					return
				end
				local c = cards[activePad]
				c.runDot.BackgroundTransparency = 0.5 - 0.5 * math.cos(os.clock() * 6)
			end)

			local function setCardImage(c, image)
				if c.image == image then
					return
				end
				c.image = image
				c.img.Image = image or ""
				tween(c.img, 0.3, { ImageTransparency = image and 0 or 1 })
				c.ph.Visible = not image
			end

			task.spawn(function()
				while gui.Parent do
					pcall(function()
						local lobby = getLobby()
						scanGuis()
						local anyMap = false
						for i, c in ipairs(cards) do
							local pad = lobby and getVotePad(i)
							local map, votes
							if pad then
								map, votes = readPad(pad)
							end
							if map then
								anyMap = true
							end
							if not lobby then
								c.name.Text = "ROUND IS ON"
							elseif not pad then
								c.name.Text = "UNAVAILABLE"
							elseif map and map ~= c.map then
								c.map = map
								c.name.Text = map:upper()
								local initials = ""
								for w in map:gmatch("%S+") do
									initials ..= w:sub(1, 1):upper()
								end
								c.ph.Text = initials:sub(1, 3)
								setCardImage(c, findPadImage(pad))
							end
							if not pad then
								c.map = nil
								c.ph.Text = "?"
								setCardImage(c, nil)
							end
							c.votes.Text = ("<font color=\"#FFFFFF\"><b>%s</b></font> <font color=\"#9A9A9A\">votes</font>"):format(votes or "-")
						end
						if activePad and not padVotes(activePad) then
							endLoop("voting ended")
						end
						setWaiting(not anyMap and not activePad)
						if not activePad then
							setStatus(anyMap and "pick a map" or "round is on")
						end
					end)
					task.wait(0.5)
				end
			end)

			stopVoteDupe = function()
				stop(true)
			end
		end
		do
			local autoGrab = { on = false }
			local busy = false
			local lastDrop
			local gunHolders = {}

			local function has(name)
				return findTool(player, name)
			end

			local function dropPart(d)
				if d:IsA("BasePart") then
					return d
				end
				if d:IsA("Model") then
					return d.PrimaryPart or d:FindFirstChildWhichIsA("BasePart", true)
				end
			end

			local function findGunDrop()
				if lastDrop and lastDrop.Parent then
					return lastDrop
				end
				for _, d in ipairs(workspace:GetDescendants()) do
					if d.Name == "GunDrop" then
						local g = dropPart(d)
						if g then
							return g
						end
					end
				end
			end

			local function touch(hrp, g)
				if firetouchinterest then
					firetouchinterest(hrp, g, 0)
					firetouchinterest(hrp, g, 1)
				end
			end

			local function getMurdererPos()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and findTool(p, "Knife") then
						local c = p.Character
						local h = c and c:FindFirstChild("HumanoidRootPart")
						if h then
							return h.Position
						end
					end
				end
			end

			local function grabGun(gun, manual, deathPos)
				if busy then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum or hum.Health <= 0 then
					return
				end
				if not manual and inLobby(hrp.Position) then
					return
				end
				if has("Knife") then
					if manual then
						notify("Grab Gun", "murderer can't pick up the gun")
					end
					return
				end
				if has("Gun") then
					return
				end
				gun = gun or findGunDrop()
				if not gun and not deathPos then
					if manual then
						notify("Grab Gun", "no dropped gun right now")
					end
					return
				end
				busy = true
				local gradStart2 = os.clock()

				local function exists(g)
					return g and g.Parent and g or nil
				end

				while not exists(gun) and os.clock() - gradStart2 < 1.5 do
					gun = exists(lastDrop)
					if gun then
						break
					end
					RunService.Heartbeat:Wait()
				end
				if not exists(gun) or not hrp.Parent or hum.Health <= 0 then
					busy = false
					return
				end
				if not manual then
					local tw = os.clock()
					while os.clock() - tw < 3 do
						local pos = getMurdererPos()
						if not pos or not exists(gun) or (pos - gun.Position).Magnitude > 8 then
							break
						end
						RunService.Heartbeat:Wait()
					end
					if not exists(gun) then
						busy = false
						return
					end
				end
				pauseDesync(hrp)
				local savedCF = hrp.CFrame
				local gotGun = false
				local target

				local function onChild(c)
					if c.Name ~= "Gun" or gotGun then
						return
					end
					gotGun = true
					target = nil
					if hrp.Parent and hum.Health > 0 then
						hrp.CFrame = savedCF
						hrp.AssemblyLinearVelocity = Vector3.zero
					end
				end

				local backpack = player:FindFirstChildOfClass("Backpack")
				local arrowL = backpack and backpack.ChildAdded:Connect(onChild)
				local arrowR = char.ChildAdded:Connect(onChild)
				local stepConn = RunService.Stepped:Connect(function()
					if target and hrp.Parent then
						hrp.CFrame = target
						hrp.AssemblyLinearVelocity = Vector3.zero
					end
				end)
				touch(hrp, gun)
				RunService.Heartbeat:Wait()
				if not gotGun and has("Gun") then
					gotGun = true
				end
				if not gotGun then
					local retryStart = os.clock()
					while not gotGun and os.clock() - retryStart < 0.35 do
						gun = exists(gun) or exists(lastDrop)
						if not gun or not hrp.Parent or hum.Health <= 0 then
							break
						end
						target = gun.CFrame
						hrp.CFrame = target
						hrp.AssemblyLinearVelocity = Vector3.zero
						touch(hrp, gun)
						RunService.Heartbeat:Wait()
						if not gotGun and has("Gun") then
							onChild({ Name = "Gun" })
						end
					end
				end
				stepConn:Disconnect()
				if arrowL then
					arrowL:Disconnect()
				end
				arrowR:Disconnect()
				target = nil
				if hrp.Parent and hum.Health > 0 then
					hrp.CFrame = savedCF
					hrp.AssemblyLinearVelocity = Vector3.zero
				end
				busy = false
				resumeDesync()
				if gotGun then
					notify("Grab Gun", ("gun grabbed in %d ms"):format(math.floor((os.clock() - gradStart2) * 1000)))
				elseif manual then
					notify("Grab Gun", "couldn't grab it")
				end
			end

			connect(workspace.DescendantAdded, function(d)
				if d.Name ~= "GunDrop" then
					return
				end
				local g = dropPart(d)
				if not g then
					return
				end
				lastDrop = g
				if autoGrab.on and not busy then
					task.spawn(grabGun, g)
				end
			end)
			connect(RunService.Heartbeat, function()
				if not autoGrab.on then
					if next(gunHolders) then
						table.clear(gunHolders)
					end
					return
				end
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player then
						local char = p.Character
						local hrp = char and char:FindFirstChild("HumanoidRootPart")
						local hum = char and char:FindFirstChildOfClass("Humanoid")
						local alive = hrp and hum and hum.Health > 0
						if alive and findTool(p, "Gun") then
							gunHolders[p] = hrp.Position
						elseif gunHolders[p] then
							local pos = gunHolders[p]
							gunHolders[p] = nil
							if hum and hum.Health <= 0 and not busy then
								task.spawn(grabGun, nil, false, pos)
							end
						end
					end
				end
				for p in pairs(gunHolders) do
					if not p.Parent then
						gunHolders[p] = nil
					end
				end
			end)
			local sec = addSection(combatTab, "Auto Grab Gun")
			sec:Toggle("Enable", "sheriff dies - you grab the gun instantly", function(on)
				autoGrab.on = on
				if on then
					task.spawn(grabGun)
				end
				notify("Grab Gun: " .. (on and "On" or "Off"), on and "waiting for a dropped gun" or "disabled")
			end)
			sec:Button("Grab now", "take the dropped gun right now", function()
				grabGun(nil, true)
			end)
			if not firetouchinterest then
				sec:Button("No firetouchinterest", "executor lacks it - grab relies on teleport only", function() end)
			end
		end
		do
			local fling = { autoSheriff = false, busy = false, cancel = false, nextScan = 0, autoCharacter = nil, autoReadyAt = 0 }
			local flungCharacters = {}
			local roleCache, roleCacheAt = {}, 0
			local activeCleanup

			local function refreshRoles()
				if os.clock() - roleCacheAt < 1 then
					return
				end
				roleCacheAt = os.clock()
				local remote = game:GetService("ReplicatedStorage"):FindFirstChild("GetPlayerData", true)
				if not (remote and remote:IsA("RemoteFunction")) then
					return
				end
				local ok, data = pcall(remote.InvokeServer, remote)
				if not ok or type(data) ~= "table" then
					return
				end
				local nextRoles = {}
				for name, info in pairs(data) do
					if type(info) == "table" and type(info.Role) == "string" and not info.Dead and not info.Killed then
						nextRoles[name] = info.Role
					end
				end
				roleCache = nextRoles
			end

			local function hasRole(p, role)
				if role == "Murderer" and findTool(p, "Knife") then
					return true
				end
				if role == "Sheriff" and findTool(p, "Gun") then
					return true
				end
				local value = roleCache[p.Name]
				return role == "Murderer" and value == "Murderer" or role == "Sheriff" and (value == "Sheriff" or value == "Hero")
			end

			local function findRole(role)
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and hasRole(p, role) then
						local char = p.Character
						local hum = char and char:FindFirstChildOfClass("Humanoid")
						local root = char and char:FindFirstChild("HumanoidRootPart")
						if hum and hum.Health > 0 and root then
							return p
						end
					end
				end
				refreshRoles()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and hasRole(p, role) then
						local char = p.Character
						local hum = char and char:FindFirstChildOfClass("Humanoid")
						local root = char and char:FindFirstChild("HumanoidRootPart")
						if hum and hum.Health > 0 and root then
							return p
						end
					end
				end
			end

			local function impact(pos, color)
				local ring = create("Part", {
					Name = "RockHubFlingImpact",
					Anchored = true,
					CanCollide = false,
					CanQuery = false,
					CanTouch = false,
					CastShadow = false,
					Material = Enum.Material.Neon,
					Color = color,
					Transparency = 0.15,
					Shape = Enum.PartType.Cylinder,
					Size = Vector3.new(0.12, 1, 1),
					CFrame = CFrame.new(pos) * CFrame.Angles(0, 0, math.pi / 2),
					Parent = workspace,
				})
				tween(ring, 0.45, { Size = Vector3.new(0.12, 14, 14), Transparency = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Quint)
				game:GetService("Debris"):AddItem(ring, 0.5)
			end

			local function flingPlayer(target, role, manual)
				if fling.busy then
					if manual then
						notify("Role Fling", "another fling is already running")
					end
					return false
				end
				local char = player.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				local root = char and char:FindFirstChild("HumanoidRootPart")
				local targetChar = target and target.Character
				local targetHum = targetChar and targetChar:FindFirstChildOfClass("Humanoid")
				local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
				if not (root and hum and hum.Health > 0 and targetRoot and targetHum and targetHum.Health > 0) then
					if manual then
						notify("Role Fling", role:lower() .. " is not available")
					end
					return false
				end
				if targetHum.Sit then
					if manual then
						notify("Role Fling", target.DisplayName .. " is sitting")
					end
					return false
				end

				fling.busy, fling.cancel = true, false
				local desyncWasActive = desync.on or desync.force
				if desyncWasActive then
					pauseDesync(root)
				end
				local savedPivot = char:GetPivot()
				local savedAutoRotate = hum.AutoRotate
				local savedFallenHeight = workspace.FallenPartsDestroyHeight
				local savedSeatedEnabled = hum:GetStateEnabled(Enum.HumanoidStateType.Seated)
				local fallenHeightDisabled = false
				local wasAntiFling = charMods.antiFling == true
				local color = role == "Sheriff" and Color3.fromRGB(70, 150, 255) or Color3.fromRGB(255, 70, 70)
				local highlight = create("Highlight", {
					Name = "RockHubFlingTarget",
					Adornee = targetChar,
					DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
					FillColor = color,
					FillTransparency = 0.65,
					OutlineColor = accentColor,
					OutlineTransparency = 0,
					Parent = targetChar,
				})
				local marker = create("BillboardGui", {
					Name = "RockHubFlingMarker",
					Adornee = targetRoot,
					AlwaysOnTop = true,
					Size = UDim2.fromOffset(150, 30),
					StudsOffset = Vector3.new(0, 3.5, 0),
					Parent = gui,
				})
				create("TextLabel", {
					Text = "FLINGING  ↓",
					Font = Enum.Font.GothamBlack,
					TextSize = 14,
					TextColor3 = color,
					TextStrokeColor3 = Color3.new(),
					TextStrokeTransparency = 0.25,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Parent = marker,
				})
				local bodyVelocity = create("BodyVelocity", {
					Velocity = Vector3.zero,
					MaxForce = Vector3.new(9e9, 9e9, 9e9),
					Parent = root,
				})
				local cleaned = false

				local function cleanup()
					if cleaned then
						return
					end
					cleaned = true
					for _, inst in ipairs({ bodyVelocity, highlight, marker }) do
						if inst and inst.Parent then
							inst:Destroy()
						end
					end
					pcall(hum.SetStateEnabled, hum, Enum.HumanoidStateType.Seated, savedSeatedEnabled)
					if player.Character == char and root.Parent and hum.Health > 0 then
						pcall(function()
							for _ = 1, 6 do
								char:PivotTo(savedPivot * CFrame.new(0, 0.5, 0))
								for _, part in ipairs(char:GetChildren()) do
									if part:IsA("BasePart") then
										part.AssemblyLinearVelocity = Vector3.zero
										part.AssemblyAngularVelocity = Vector3.zero
									end
								end
								if (root.Position - savedPivot.Position).Magnitude < 25 then
									break
								end
								RunService.Heartbeat:Wait()
							end
							hum.AutoRotate = savedAutoRotate
							hum:ChangeState(Enum.HumanoidStateType.GettingUp)
						end)
					end
					if fallenHeightDisabled then
						pcall(function()
							workspace.FallenPartsDestroyHeight = savedFallenHeight
						end)
					end
					if wasAntiFling then
						charMods.antiFling = true
					end
					if desyncWasActive then
						resumeDesync()
					end
					fling.busy = false
					activeCleanup = nil
				end

				activeCleanup = cleanup
				if wasAntiFling then
					disableAntiFling()
				end
				hum.AutoRotate = false
				fallenHeightDisabled = pcall(function()
					workspace.FallenPartsDestroyHeight = 0 / 0
				end)
				if not fallenHeightDisabled then
					cleanup()
					if manual then
						notify("Role Fling", "executor cannot disable FallenPartsDestroyHeight")
					end
					return false
				end
				pcall(hum.SetStateEnabled, hum, Enum.HumanoidStateType.Seated, false)
				pcall(function()
					if sethiddenproperty then
						sethiddenproperty(player, "SimulationRadius", math.huge)
					end
				end)

				local started = os.clock()
				local lastPos = targetRoot.Position
				local launchOrigin = lastPos
				local launched = false
				local targetPart = targetRoot or targetChar:FindFirstChild("Head") or targetChar:FindFirstChildWhichIsA("BasePart")

				local function targetEscaped()
					if not targetPart.Parent then
						return false
					end
					lastPos = targetPart.Position
					local distance = (lastPos - launchOrigin).Magnitude
					local speed = targetPart.AssemblyLinearVelocity.Magnitude
					return lastPos.Y <= savedFallenHeight + 30 or distance > 350 or distance > 120 and speed > 200
				end

				-- Fling sequence adapted from K1LAS1K/Ultimate-Fling-GUI.
				local function flingPosition(pos, angle)
					local cf = CFrame.new(targetPart.Position) * pos * angle
					root.CFrame = cf
					char:PivotTo(cf)
					root.Velocity = Vector3.new(9e7, 9e8, 9e7)
					root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
				end

				local ok, err = pcall(function()
					local angle = 0
					while os.clock() - started < 2 and not fling.cancel do
						if not (root.Parent and hum.Health > 0 and targetPart.Parent and targetHum.Health > 0) then
							break
						end
						if targetEscaped() then
							launched = true
							break
						end
						local speed = targetPart.AssemblyLinearVelocity.Magnitude
						angle += 100
						local steps
						if speed < 50 then
							local lead = targetHum.MoveDirection * speed / 1.25
							local rotation = CFrame.Angles(math.rad(angle), 0, 0)
							steps = {
								{ CFrame.new(0, 1.5, 0) + lead, rotation },
								{ CFrame.new(0, -1.5, 0) + lead, rotation },
								{ CFrame.new(0, 1.5, 0) + lead, rotation },
								{ CFrame.new(0, -1.5, 0) + lead, rotation },
								{ CFrame.new(0, 1.5, 0) + targetHum.MoveDirection, rotation },
								{ CFrame.new(0, -1.5, 0) + targetHum.MoveDirection, rotation },
							}
						else
							local flat, quarter = CFrame.new(), CFrame.Angles(math.rad(90), 0, 0)
							steps = {
								{ CFrame.new(0, 1.5, targetHum.WalkSpeed), quarter },
								{ CFrame.new(0, -1.5, -targetHum.WalkSpeed), flat },
								{ CFrame.new(0, 1.5, targetHum.WalkSpeed), quarter },
								{ CFrame.new(0, -1.5, 0), quarter },
								{ CFrame.new(0, -1.5, 0), flat },
								{ CFrame.new(0, -1.5, 0), quarter },
								{ CFrame.new(0, -1.5, 0), flat },
							}
						end
						for _, step in ipairs(steps) do
							flingPosition(step[1], step[2])
							task.wait()
							if fling.cancel or targetEscaped() then
								launched = not fling.cancel
								break
							end
						end
						if launched then
							break
						end
					end
				end)
				cleanup()
				if ok and launched and lastPos then
					impact(lastPos, color)
				end
				if manual then
					if ok and launched then
						notify("Fling " .. role, target.DisplayName .. " flung down")
					elseif ok then
						notify("Role Fling", "target resisted the fling")
					else
						notify("Role Fling", "failed: " .. tostring(err))
					end
				end
				return ok and launched
			end

			local function flingRole(role, manual)
				local target = findRole(role)
				if not target then
					if manual then
						notify("Role Fling", role:lower() .. " not found")
					end
					return false
				end
				return flingPlayer(target, role, manual), target
			end

			connect(RunService.Heartbeat, function()
				if not fling.autoSheriff or fling.busy or os.clock() < fling.nextScan then
					return
				end
				fling.nextScan = os.clock() + 0.8
				local target = findRole("Sheriff")
				local char = target and target.Character
				local targetRoot = char and char:FindFirstChild("HumanoidRootPart")
				local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if not char or not targetRoot or not myRoot or flungCharacters[char] or inLobby(targetRoot.Position) or inLobby(myRoot.Position) then
					fling.autoCharacter = nil
					fling.autoReadyAt = 0
					return
				end
				if fling.autoCharacter ~= char then
					fling.autoCharacter = char
					fling.autoReadyAt = os.clock() + 2.5
					return
				end
				if os.clock() < fling.autoReadyAt or target.Character ~= char or not hasRole(target, "Sheriff") then
					return
				end
				fling.autoReadyAt = os.clock() + 2.5
				task.spawn(function()
					if flingPlayer(target, "Sheriff", false) then
						flungCharacters[char] = true
					end
				end)
			end)
			connect(Players.PlayerRemoving, function(p)
				if p.Character then
					flungCharacters[p.Character] = nil
				end
			end)

			local sec = addSection(combatTab, "Role Fling")
			sec:Toggle("Auto Fling Sheriff", "fling each sheriff down once per life", function(on)
				fling.autoSheriff = on
				fling.nextScan = 0
				fling.autoCharacter = nil
				fling.autoReadyAt = 0
				if not on then
					fling.cancel = true
				end
				notify("Auto Fling Sheriff: " .. (on and "On" or "Off"), on and "watching for the sheriff" or "disabled")
			end)
			sec:Button("Fling Sheriff", "fling the current sheriff down", function()
				flingRole("Sheriff", true)
			end)
			sec:Button("Fling Murderer", "fling the current murderer down", function()
				flingRole("Murderer", true)
			end)
			playerFlingAction = function(target)
				local role = hasRole(target, "Sheriff") and "Sheriff" or (hasRole(target, "Murderer") and "Murderer" or "Player")
				return flingPlayer(target, role, true)
			end

			stopRoleFling = function()
				fling.autoSheriff = false
				fling.cancel = true
				if activeCleanup then
					activeCleanup()
				end
			end
		end
		do
			local autoKill = false
			local killing = false
			local cancelKill = false
			local lastAutoKill = 0

			local function getTargets(sheriffOnly, origin, includeLobby)
				local list = {}
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player then
						local hrp = alive(p)
						if hrp and (includeLobby or not inLobby(hrp.Position)) then
							local gun = findTool(p, "Gun") ~= nil
							if not sheriffOnly or gun then
								table.insert(list, { p = p, gun = gun, d = (hrp.Position - origin).Magnitude })
							end
						end
					end
				end
				table.sort(list, function(a, b)
					if a.gun ~= b.gun then
						return a.gun
					end
					return a.d < b.d
				end)
				return list
			end

			local function getKnife(hum)
				local char = player.Character
				local knife = char and char:FindFirstChild("Knife")
				if knife then
					return knife
				end
				local backpack = player:FindFirstChildOfClass("Backpack")
				knife = backpack and backpack:FindFirstChild("Knife")
				if knife then
					hum:EquipTool(knife)
					for _ = 1, 10 do
						if knife.Parent == char then
							break
						end
						RunService.Heartbeat:Wait()
					end
					return knife
				end
			end

			local function hit(knife, char)
				pcall(function()
					knife:Activate()
				end)
				local handle = knife:FindFirstChild("Handle")
				if handle and firetouchinterest then
					for _, n in ipairs({ "HumanoidRootPart", "UpperTorso", "Torso", "Head" }) do
						local part = char:FindFirstChild(n)
						if part then
							firetouchinterest(handle, part, 0)
							firetouchinterest(handle, part, 1)
						end
					end
				end
			end

			local function makeStandIn(char)
				local old = char.Archivable
				char.Archivable = true
				local ok, clone = pcall(function()
					return char:Clone()
				end)
				char.Archivable = old
				if not ok or not clone then
					return
				end
				for _, d in ipairs(clone:GetDescendants()) do
					if d:IsA("LuaSourceContainer") or d:IsA("Sound") then
						d:Destroy()
					elseif d:IsA("BasePart") then
						d.Anchored = true
						d.CanCollide = false
						d.CanQuery = false
						d.CanTouch = false
					elseif d:IsA("Humanoid") then
						d.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
					end
				end
				clone.Name = "RockHubStandIn"
				clone.Parent = workspace.CurrentCamera
				return clone
			end

			local function hideChar(char, on)
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA("BasePart") or d:IsA("Decal") then
						d.LocalTransparencyModifier = on and 1 or 0
					end
				end
			end

			local function killAll(sheriffOnly, silent, onlyList)
				if killing then
					return
				end
				local hrp, hum, char = alive(player)
				if not hrp then
					return
				end
				if not findTool(player, "Knife") then
					if not silent then
						notify("Kill All", "you're not the murderer")
					end
					return
				end
				local list = getTargets(sheriffOnly, hrp.Position, onlyList ~= nil)
				if onlyList then
					local filtered = {}
					for _, e in ipairs(list) do
						if table.find(onlyList, e.p) then
							table.insert(filtered, e)
						end
					end
					list = filtered
				end
				if #list == 0 then
					if not silent then
						notify("Kill All", sheriffOnly and "no sheriff in the round" or "nobody to kill")
					end
					return
				end
				killing, cancelKill = true, false
				pauseDesync(hrp)
				local savedCF = hrp.CFrame
				local gradStart2 = os.clock()
				local cam = workspace.CurrentCamera
				local oldCamType, camCF = cam.CameraType, cam.CFrame
				local standIn = makeStandIn(char)
				cam.CameraType = Enum.CameraType.Scriptable
				cam.CFrame = camCF
				local knife = getKnife(hum)
				local target
				local stepConn = RunService.Stepped:Connect(function()
					cam.CFrame = camCF
					if hrp.Parent then
						hideChar(char, true)
						if target then
							hrp.CFrame = target
							hrp.AssemblyLinearVelocity = Vector3.zero
						end
					end
				end)
				local left = #list
				while left > 0 and os.clock() - gradStart2 < 2 do
					if cancelKill or hum.Health <= 0 or not hrp.Parent then
						break
					end
					left = 0
					for _, e in ipairs(list) do
						local th, _, targetChar = alive(e.p)
						if th and not cancelKill then
							left += 1
							local behind = th.CFrame * CFrame.new(0, 0, 1.4)
							target = CFrame.lookAt(behind.Position, th.Position)
							hrp.CFrame = target
							hrp.AssemblyLinearVelocity = Vector3.zero
							knife = knife and knife.Parent and knife or getKnife(hum)
							if knife then
								hit(knife, targetChar)
							end
							RunService.Heartbeat:Wait()
							if knife then
								hit(knife, targetChar)
							end
						end
					end
				end
				target = nil
				stepConn:Disconnect()
				if hrp.Parent and hum.Health > 0 then
					hrp.CFrame = savedCF
					hrp.AssemblyLinearVelocity = Vector3.zero
				end
				RunService.Heartbeat:Wait()
				if char.Parent then
					hideChar(char, false)
				end
				if standIn then
					standIn:Destroy()
				end
				cam.CameraType = oldCamType
				if hum.Parent then
					cam.CameraSubject = hum
				end
				local killed = 0
				for _, e in ipairs(list) do
					if not alive(e.p) then
						killed += 1
					end
				end
				killing = false
				resumeDesync()
				if not onlyList then
					notify("Kill All", ("killed %d/%d in %.2fs"):format(killed, #list, os.clock() - gradStart2))
				end
			end
			playerKnifeKill = function(target)
				killAll(false, false, { target })
			end

			connect(RunService.Heartbeat, function()
				if not autoKill or killing or os.clock() - lastAutoKill < 2 then
					return
				end
				local hrp = alive(player)
				if not hrp or inLobby(hrp.Position) or not findTool(player, "Knife") then
					return
				end
				lastAutoKill = os.clock()
				task.spawn(killAll, false, true)
			end)
			local shahedIds = { 120141614672192, 111443745475294, 16531510943 }
			local shahedFlip = { [120141614672192] = -1 }
			local soundIds = {
				engine = { 106621472307027, 117678889994053, 86747216998490 },
				boom = { 125127520917980, 7157159568, 9126102254 },
				rumble = { 1843024924, 9846227426, 138432031406888 },
				static = { 96891705634188, 83265726239905, 128865910652923 },
				fpv = { 114037851906101, 78411105609654, 122096583027065 },
			}
			local fpvIds = { 124994246147928, 129274863429961, 79445961621887 }
			local fpvFlip = {}
			local droneKind = "Shahed"
			local droneImpact = "Fling"
			local droneCache = {}
			local droneTemplate, droneLoading
			local soundCache = {}
			local soundsLoading = false
			local ContentProvider = game:GetService("ContentProvider")
			local SoundService = game:GetService("SoundService")

			local function getParts(m)
				local parts = {}
				for _, x in ipairs(m:GetDescendants()) do
					if x:IsA("BasePart") then
						table.insert(parts, x)
					end
				end
				return parts
			end

			local function buildShahed()
				local m = Instance.new("Model")
				local col = Color3.fromRGB(92, 96, 100)

				local function part(className, size, cf, color, shape)
					local p = Instance.new(className)
					p.Size, p.CFrame = size, cf
					p.Color = color or col
					p.Material = Enum.Material.SmoothPlastic
					if shape then
						p.Shape = shape
					end
					p.Parent = m
					return p
				end

				local rot90 = CFrame.Angles(0, math.rad(90), 0)
				part("Part", Vector3.new(9.6, 1.3, 1.3), CFrame.new(0, 0, 0.2) * rot90, nil, Enum.PartType.Cylinder)
				part("Part", Vector3.new(1.3, 1.3, 1.3), CFrame.new(0, 0, -4.6), nil, Enum.PartType.Ball)
				part("Part", Vector3.new(0.5, 0.9, 0.9), CFrame.new(0, 0, 5.2) * rot90, Color3.fromRGB(40, 40, 40), Enum.PartType.Cylinder)
				part("Part", Vector3.new(0.12, 3.2, 0.3), CFrame.new(0, 0, 5.5), Color3.fromRGB(30, 30, 30)).Name = "Prop"
				part("WedgePart", Vector3.new(0.25, 4.9, 7.5), CFrame.fromMatrix(Vector3.new(3.05, 0, 0.75), Vector3.new(0, -1, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0, 1)))
				part("WedgePart", Vector3.new(0.25, 4.9, 7.5), CFrame.fromMatrix(Vector3.new(-3.05, 0, 0.75), Vector3.new(0, 1, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, 1)))
				part("Part", Vector3.new(0.2, 1.8, 1.4), CFrame.new(5.45, 0.4, 3.9))
				part("Part", Vector3.new(0.2, 1.8, 1.4), CFrame.new(-5.45, 0.4, 3.9))
				m.WorldPivot = CFrame.new()
				return m
			end

			local function orientShahed(m, parts, id)
				local lo, hi = Vector3.one * math.huge, -Vector3.one * math.huge
				local boxes = {}
				for _, p in ipairs(parts) do
					local cf, h = p.CFrame, p.Size / 2
					local r = Vector3.new(math.abs(cf.RightVector.X) * h.X + math.abs(cf.UpVector.X) * h.Y + math.abs(cf.LookVector.X) * h.Z, math.abs(cf.RightVector.Y) * h.X + math.abs(cf.UpVector.Y) * h.Y + math.abs(cf.LookVector.Y) * h.Z, math.abs(cf.RightVector.Z) * h.X + math.abs(cf.UpVector.Z) * h.Y + math.abs(cf.LookVector.Z) * h.Z)
					lo, hi = lo:Min(cf.Position - r), hi:Max(cf.Position + r)
					table.insert(boxes, { cf.Position, r })
				end
				local size, center = hi - lo, (lo + hi) / 2
				local axis, sidebar2 = Vector3.xAxis, Vector3.zAxis
				if size.Z > size.X then
					axis, sidebar2 = Vector3.zAxis, Vector3.xAxis
				end
				local moment = 0
				for _, b in ipairs(boxes) do
					local a = b[2]:Dot(axis) * b[2]:Dot(sidebar2)
					moment += (b[1] - center):Dot(axis) * a
				end
				local sign = moment >= 0 and 1 or -1
				if shahedFlip[id] then
					sign = shahedFlip[id]
				end
				m.WorldPivot = CFrame.lookAt(center, center - axis * sign)
				return math.max(size.X, size.Z)
			end

			local function buildFpv()
				local m = Instance.new("Model")

				local function part(size, cf, color, shape, mat)
					local p = Instance.new("Part")
					p.Size, p.CFrame = size, cf
					p.Color = color
					p.Material = mat or Enum.Material.SmoothPlastic
					if shape then
						p.Shape = shape
					end
					p.Parent = m
					return p
				end

				local dark = Color3.fromRGB(28, 28, 30)
				part(Vector3.new(0.9, 0.25, 1.5), CFrame.new(), dark)
				for _, a in ipairs({ 45, 135, 225, 315 }) do
					local r = math.rad(a)
					local tip2 = Vector3.new(math.sin(r) * 1.45, 0, math.cos(r) * 1.45)
					part(Vector3.new(0.18, 0.1, 2.9), CFrame.lookAt(Vector3.zero, tip2) * CFrame.new(0, 0, -1.45), dark)
					part(Vector3.new(0.3, 0.32, 0.32), CFrame.new(tip2 + Vector3.new(0, 0.18, 0)) * CFrame.Angles(0, 0, math.rad(90)), Color3.fromRGB(60, 120, 70), Enum.PartType.Cylinder, Enum.Material.Metal)
					local prop = part(Vector3.new(0.04, 1.3, 1.3), CFrame.new(tip2 + Vector3.new(0, 0.36, 0)) * CFrame.Angles(0, 0, math.rad(90)), Color3.fromRGB(20, 20, 20), Enum.PartType.Cylinder)
					prop.Transparency = 0.55
					prop.Name = "Prop"
				end
				part(Vector3.new(0.6, 0.45, 1.1), CFrame.new(0, 0.38, 0.1), Color3.fromRGB(40, 90, 170))
				part(Vector3.new(0.35, 0.3, 0.3), CFrame.new(0, 0.25, -0.75), Color3.fromRGB(15, 15, 15))
				part(Vector3.new(2.2, 0.55, 0.55), CFrame.new(0, -0.4, -0.7) * CFrame.Angles(0, math.rad(90), 0), Color3.fromRGB(110, 90, 55), Enum.PartType.Cylinder, Enum.Material.Metal)
				part(Vector3.new(0.5, 0.5, 0.5), CFrame.new(0, -0.4, -1.8), Color3.fromRGB(200, 200, 190), Enum.PartType.Ball)
				m.WorldPivot = CFrame.new()
				return m
			end

			local function orientFpv(m, parts, id)
				local lo, hi = Vector3.one * math.huge, -Vector3.one * math.huge
				for _, p in ipairs(parts) do
					local cf, h = p.CFrame, p.Size / 2
					local r = Vector3.new(math.abs(cf.RightVector.X) * h.X + math.abs(cf.UpVector.X) * h.Y + math.abs(cf.LookVector.X) * h.Z, math.abs(cf.RightVector.Y) * h.X + math.abs(cf.UpVector.Y) * h.Y + math.abs(cf.LookVector.Y) * h.Z, math.abs(cf.RightVector.Z) * h.X + math.abs(cf.UpVector.Z) * h.Y + math.abs(cf.LookVector.Z) * h.Z)
					lo, hi = lo:Min(cf.Position - r), hi:Max(cf.Position + r)
				end
				local size, center = hi - lo, (lo + hi) / 2
				local best, bestScore, axis = nil, 0, Vector3.zAxis
				for _, p in ipairs(parts) do
					local sz = p.Size
					local longest = math.max(sz.X, sz.Y, sz.Z)
					local shortest = math.min(sz.X, sz.Y, sz.Z)
					local score = longest * longest * shortest / math.max(shortest, 0.05)
					if longest / math.max(shortest, 0.05) > 2.2 and score > bestScore then
						local cf = p.CFrame
						local longAxis = sz.X == longest and cf.RightVector or sz.Y == longest and cf.UpVector or cf.LookVector
						if math.abs(longAxis.Y) < 0.5 then
							best, bestScore = p, score
						end
					end
				end
				local sign = 1
				if best then
					local sz, cf = best.Size, best.CFrame
					local longAxis = sz.X == math.max(sz.X, sz.Y, sz.Z) and cf.RightVector or sz.Y == math.max(sz.X, sz.Y, sz.Z) and cf.UpVector or cf.LookVector
					axis = math.abs(longAxis.X) > math.abs(longAxis.Z) and Vector3.xAxis or Vector3.zAxis
					local half = math.max(sz.X, sz.Y, sz.Z) / 2
					local c = (cf.Position - center):Dot(axis)
					local endA, endB = c + half * math.abs(longAxis:Dot(axis)), c - half * math.abs(longAxis:Dot(axis))
					sign = math.abs(endA) >= math.abs(endB) and -1 or 1
				end
				if fpvFlip[id] then
					sign = fpvFlip[id]
				end
				m.WorldPivot = CFrame.lookAt(center, center - axis * sign)
				return math.max(size.X, size.Z)
			end

			local function pickSound(list)
				for _, id in ipairs(list) do
					local s = Instance.new("Sound")
					s.SoundId = "rbxassetid://" .. id
					s.Volume = 0
					s.Parent = SoundService
					local loaded = false
					local ok = pcall(function()
						ContentProvider:PreloadAsync({ s }, function(_, status)
							loaded = status == Enum.AssetFetchStatus.Success
						end)
					end)
					s:Destroy()
					if ok and loaded then
						return "rbxassetid://" .. id
					end
				end
				return "rbxassetid://" .. list[1]
			end

			local function ensureSounds()
				while soundsLoading do
					task.wait()
				end
				for key in pairs(soundIds) do
					if not soundCache[key] then
						soundsLoading = true
						for nextKey, list in pairs(soundIds) do
							if not soundCache[nextKey] then
								soundCache[nextKey] = pickSound(list)
							end
						end
						soundsLoading = false
						break
					end
				end
			end

			local function loadDrone(override)
				while droneLoading do
					task.wait(0.1)
				end
				local kind = override or droneKind
				ensureSounds()
				if droneCache[kind] then
					droneTemplate = droneCache[kind]
					return droneTemplate
				end
				droneLoading = true
				local isFpv = kind == "FPV"
				local m, usedId
				for _, id in ipairs(isFpv and fpvIds or shahedIds) do
					usedId = id
					local ok, objs = pcall(function()
						return game:GetObjects("rbxassetid://" .. id)
					end)
					if ok and objs and #objs > 0 then
						m = Instance.new("Model")
						for _, o in ipairs(objs) do
							o.Parent = m
						end
						for _, x in ipairs(m:GetDescendants()) do
							if x:IsA("LuaSourceContainer") or x:IsA("Sound") or x:IsA("ClickDetector") or x:IsA("ProximityPrompt") or x:IsA("Humanoid") or x:IsA("BillboardGui") then
								x:Destroy()
							end
						end
						if m:FindFirstChildWhichIsA("BasePart", true) then
							break
						end
						m:Destroy()
						m = nil
					end
				end
				local extent
				if m then
					extent = (isFpv and orientFpv or orientShahed)(m, getParts(m), usedId)
				elseif isFpv then
					m = buildFpv()
					extent = 4
				else
					m = buildShahed()
					extent = 11
				end
				pcall(function()
					m:ScaleTo(m:GetScale() * (isFpv and 3 or 5) / math.max(extent, 0.1))
				end)
				m.Archivable = true
				for _, x in ipairs(m:GetDescendants()) do
					x.Archivable = true
				end
				for _, p in ipairs(getParts(m)) do
					p.Anchored = true
					p.CanCollide = false
					p.CanQuery = false
					p.CanTouch = false
				end
				m.Name = "RockHubShahed"
				droneCache[kind] = m
				droneTemplate = droneCache[droneKind]
				droneLoading = false
				return m
			end

			local function playSound(key, parent, props)
				local soundId = soundCache[key]
				if not soundId then
					return
				end
				local s = Instance.new("Sound")
				s.SoundId = soundId
				for k, v in pairs(props) do
					s[k] = v
				end
				s.Parent = parent
				s:Play()
				if not s.IsLoaded then
					task.spawn(function()
						local deadline = os.clock() + 3
						while s.Parent and not s.IsLoaded and os.clock() < deadline do
							task.wait(0.05)
						end
						if s.Parent and not s.IsPlaying then
							s:Play()
						end
					end)
				end
				return s
			end

			local function shakeCamera(intensity, hideAfter)
				local name = "RockHubShahedShake" .. math.random(1000000)
				local gradStart2, last = os.clock(), CFrame.new()
				RunService:BindToRenderStep(name, Enum.RenderPriority.Camera.Value + 1, function()
					local cam = workspace.CurrentCamera
					local k = 1 - (os.clock() - gradStart2) / hideAfter
					if k <= 0 then
						cam.CFrame = cam.CFrame * last:Inverse()
						RunService:UnbindFromRenderStep(name)
						return
					end
					local a = intensity * k * k
					local offset = CFrame.Angles((math.random() - 0.5) * a, (math.random() - 0.5) * a, (math.random() - 0.5) * a * 0.5)
					cam.CFrame = cam.CFrame * last:Inverse() * offset
					last = offset
				end)
			end

			local function explode(pos)
				local fx = Instance.new("Part")
				fx.Anchored, fx.CanCollide, fx.CanQuery, fx.CanTouch = true, false, false, false
				fx.Transparency, fx.Size, fx.Position = 1, Vector3.one, pos
				fx.Parent = workspace.CurrentCamera
				local e = Instance.new("Explosion")
				e.Position, e.BlastPressure, e.BlastRadius = pos, 0, 0
				e.DestroyJointRadiusPercent = 0
				e.ExplosionType = Enum.ExplosionType.NoCraters
				e.Parent = workspace

				local function emit(props, n)
					local emitter = Instance.new("ParticleEmitter")
					emitter.Enabled = false
					for k, v in pairs(props) do
						emitter[k] = v
					end
					emitter.Parent = fx
					emitter:Emit(n)
				end

				emit({
					Texture = "rbxasset://textures/particles/fire_main.dds",
					Color = ColorSequence.new(Color3.fromRGB(255, 220, 120), Color3.fromRGB(255, 80, 20)),
					LightEmission = 1,
					Lifetime = NumberRange.new(0.35, 0.7),
					Speed = NumberRange.new(25, 55),
					SpreadAngle = Vector2.new(180, 180),
					Drag = 6,
					Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 6), NumberSequenceKeypoint.new(1, 14) }),
					Transparency = NumberSequence.new(0.1, 1),
				}, 60)
				emit({
					Texture = "rbxasset://textures/particles/smoke_main.dds",
					Color = ColorSequence.new(Color3.fromRGB(60, 55, 50), Color3.fromRGB(25, 25, 25)),
					Lifetime = NumberRange.new(2.5, 4.5),
					Speed = NumberRange.new(8, 22),
					SpreadAngle = Vector2.new(180, 180),
					Drag = 2,
					Acceleration = Vector3.new(0, 6, 0),
					Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 8), NumberSequenceKeypoint.new(1, 22) }),
					Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 1) }),
					RotSpeed = NumberRange.new(-40, 40),
					Rotation = NumberRange.new(0, 360),
				}, 35)
				emit({
					Texture = "rbxasset://textures/particles/sparkles_main.dds",
					Color = ColorSequence.new(Color3.fromRGB(255, 190, 90)),
					LightEmission = 1,
					Lifetime = NumberRange.new(0.6, 1.4),
					Speed = NumberRange.new(60, 110),
					SpreadAngle = Vector2.new(180, 180),
					Acceleration = Vector3.new(0, -60, 0),
					Size = NumberSequence.new(0.6, 0),
				}, 80)
				local light = Instance.new("PointLight")
				light.Color, light.Brightness, light.Range = Color3.fromRGB(255, 160, 70), 10, 60
				light.Parent = fx
				game:GetService("TweenService"):Create(light, TweenInfo.new(0.8), { Brightness = 0 }):Play()
				playSound("boom", fx, { Volume = 2, RollOffMinDistance = 20, RollOffMaxDistance = 1500 })
				playSound("rumble", fx, { Volume = 1.2, RollOffMinDistance = 60, RollOffMaxDistance = 3000 })
				local cam = workspace.CurrentCamera
				local d = (cam.CFrame.Position - pos).Magnitude
				if d < 200 then
					shakeCamera(0.06 * (1 - d / 200) + 0.01, 0.7)
				end
				game:GetService("Debris"):AddItem(fx, 7)
				game:GetService("Debris"):AddItem(e, 3)
			end

			local function showSignalLost(targetName, flightTime)
				local font = Enum.Font.Code
				local root = create("CanvasGroup", {
					Name = "RockHubSignalLost",
					Position = UDim2.fromOffset(0, -100),
					Size = UDim2.new(1, 0, 1, 200),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					ZIndex = 50,
					Parent = gui,
				})
				local content2 = create("Frame", {
					Position = UDim2.fromOffset(0, 100),
					Size = UDim2.new(1, 0, 1, -200),
					BackgroundTransparency = 1,
					ZIndex = 52,
					Parent = root,
				})

				local function label(props)
					do
						local defaults = {}
						defaults[63741] = {
							function()
								return props
							end,
							"BackgroundTransparency",
							function()
								return 1
							end,
						}
						defaults[49931] = {
							function()
								return props
							end,
							"Parent",
							function()
								return props.Parent or content2
							end,
						}
						defaults[17390] = {
							function()
								return props
							end,
							"TextColor3",
							function()
								return props.TextColor3 or Color3.fromRGB(235, 235, 235)
							end,
						}
						defaults[59406] = {
							function()
								return props
							end,
							"Font",
							function()
								return props.Font or font
							end,
						}
						defaults[4207] = {
							function()
								return props
							end,
							"ZIndex",
							function()
								return 53
							end,
						}
						local order = { 63741, 59406, 17390, 4207, 49931 }
						for j = 1, #order do
							local entry = defaults[order[j]]
							entry[1]()[entry[2]] = entry[3]()
						end
					end
					return create("TextLabel", props)
				end

				local bars = {}
				for i = 1, 42 do
					bars[i] = create("Frame", {
						Position = UDim2.new(0, 0, (i - 1) / 42, 0),
						Size = UDim2.new(1.3, 0, 0.023809523809523808, 1),
						BorderSizePixel = 0,
						ZIndex = 51,
						Visible = false,
						Parent = root,
					})
				end
				for i = 0, 59 do
					create("Frame", {
						Position = UDim2.new(0, 0, i / 60, 0),
						Size = UDim2.new(1, 0, 0, 1),
						BackgroundColor3 = Color3.new(0, 0, 0),
						BackgroundTransparency = 0.75,
						BorderSizePixel = 0,
						ZIndex = 55,
						Parent = root,
					})
				end
				local box = create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(380, 92),
					BackgroundTransparency = 1,
					Visible = false,
					ZIndex = 53,
					Parent = content2,
				})
				create("UIStroke", { Color = Color3.fromRGB(255, 255, 255), Thickness = 2, Parent = box })
				local titleLabel = label({ Size = UDim2.fromScale(1, 1), Text = "SIGNAL LOST", TextSize = 46, Parent = box })
				local noVideoLabel = label({
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, 0, 0.5, -58),
					Size = UDim2.fromOffset(300, 20),
					Text = "/!\\  NO VIDEO",
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 60, 50),
					Visible = false,
				})
				local subtitle = label({
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0.5, 58),
					Size = UDim2.fromOffset(500, 20),
					TextSize = 15,
					Visible = false,
					Text = targetName and "TARGET  " .. targetName:upper() .. "  -  HIT" or "NO TARGET",
					TextColor3 = targetName and Color3.fromRGB(120, 255, 140) or Color3.fromRGB(170, 170, 170),
				})
				local secs = math.floor(flightTime)
				local corners = {
					label({
						Position = UDim2.fromOffset(28, 22),
						Size = UDim2.fromOffset(300, 18),
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Left,
						Text = droneKind == "FPV" and "FPV KAMIKAZE   CAM 1" or "SHAHED-136   CAM 1",
					}),
					label({
						AnchorPoint = Vector2.new(1, 0),
						Position = UDim2.new(1, -28, 0, 22),
						Size = UDim2.fromOffset(300, 18),
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Right,
						Text = ("REC  00:%02d:%02d"):format(secs // 60, secs % 60),
						TextColor3 = Color3.fromRGB(255, 60, 50),
					}),
					label({
						Position = UDim2.new(0, 28, 1, -40),
						Size = UDim2.fromOffset(300, 18),
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Left,
						Text = "CH 5.8G   RSSI  0%",
					}),
					label({
						AnchorPoint = Vector2.new(1, 0),
						Position = UDim2.new(1, -28, 1, -40),
						Size = UDim2.fromOffset(300, 18),
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Right,
						Text = "LINK  --.-  dB",
					}),
				}
				for _, c in ipairs(corners) do
					c.Visible = false
				end
				local staticSound = playSound("static", workspace.CurrentCamera, { Volume = 0.8 })
				local gradStart2 = os.clock()
				local conn
				conn = RunService.RenderStepped:Connect(function()
					local t = os.clock() - gradStart2
					if t < 0.07 then
						return
					elseif t < 0.6 then
						root.BackgroundColor3 = Color3.new(0, 0, 0)
						for _, b in ipairs(bars) do
							local g = math.random()
							b.Visible = true
							b.BackgroundColor3 = Color3.new(g, g, g)
							b.BackgroundTransparency = math.random() * 0.35
							b.Position = UDim2.new(-math.random() * 0.3, 0, b.Position.Y.Scale, 0)
						end
					else
						if staticSound and staticSound.IsPlaying then
							staticSound:Stop()
						end
						box.Visible = true
						noVideoLabel.Visible = true
						subtitle.Visible = true
						for _, c in ipairs(corners) do
							c.Visible = true
						end
						for _, b in ipairs(bars) do
							b.Visible = math.random() < 0.03
							if b.Visible then
								local g = math.random() * 0.5
								b.BackgroundColor3 = Color3.new(g, g, g)
								b.BackgroundTransparency = 0.6
							end
						end
						local on = t * 2.2 % 1 < 0.62
						titleLabel.TextTransparency = on and 0 or 0.85
						noVideoLabel.TextTransparency = on and 0 or 0.6
						box.Position = UDim2.new(0.5, math.random() < 0.06 and math.random(-6, 6) or 0, 0.5, 0)
					end
				end)
				task.delay(2.15, function()
					TweenService:Create(root, TweenInfo.new(0.3), { GroupTransparency = 1 }):Play()
					task.wait(0.32)
					conn:Disconnect()
					root:Destroy()
					if staticSound then
						staticSound:Destroy()
					end
				end)
			end

			local function finishTarget(p)
				local t = os.clock()
				while killing and os.clock() - t < 2 do
					RunService.Heartbeat:Wait()
				end
				if alive(p) then
					killAll(false, true, { p })
				end
			end

			local droneBusy = false
			local desyncPaused = false

			local function launchDrone2()
				if droneBusy then
					return
				end
				local hrp, hum, char = alive(player)
				if not hrp then
					return
				end
				local impactMode = droneImpact
				if impactMode == "Kill" and not findTool(player, "Knife") then
					notify("Drone", "Kill impact requires the murderer knife")
					return
				end
				if not droneTemplate then
					notify("Shahed", "loading the drone...")
					loadDrone()
				end
				if not alive(player) then
					return
				end
				droneBusy = true
				pcall(function()
					hum:UnequipTools()
				end)
				local controls
				task.spawn(function()
					pcall(function()
						local c = require(player.PlayerScripts:WaitForChild("PlayerModule", 1)):GetControls()
						c:Disable()
						controls = c
					end)
				end)
				local oldWalkSpeed, oldJumpPower = hum.WalkSpeed, hum.JumpPower
				hum.WalkSpeed, hum.JumpPower = 0, 0
				local cam = workspace.CurrentCamera
				local oldCamType = cam.CameraType
				cam.CameraType = Enum.CameraType.Scriptable
				local oldMouse, oldIconEnabled = UserInputService.MouseBehavior, UserInputService.MouseIconEnabled
				local rp = RaycastParams.new()
				rp.FilterType = Enum.RaycastFilterType.Exclude
				rp.IgnoreWater = true
				local ignoreList = { cam, char }
				rp.FilterDescendantsInstances = ignoreList
				local look = cam.CFrame.LookVector
				local turn = math.atan2(-look.X, -look.Z)
				local pitch = 0.12
				pauseDesync(hrp)
				desyncPaused = true
				local pos = hrp.Position + Vector3.new(0, 1.5, 0)
				hideChar(char, true)
				local bank = 0
				local gradStart2 = os.clock()
				local isFpv = droneKind == "FPV"
				local drone = droneTemplate:Clone()
				local basePart = drone:FindFirstChildWhichIsA("BasePart", true)
				drone.Parent = cam
				local props = {}
				for _, d in ipairs(drone:GetDescendants()) do
					if d:IsA("BasePart") then
						local n = d.Name:lower()
						if n:find("prop") or n:find("blade") then
							table.insert(props, d)
						end
					end
				end
				local engine = playSound(isFpv and "fpv" or "engine", basePart, { Looped = true, Volume = 1, RollOffMinDistance = 15, RollOffMaxDistance = 700 })
				local osd, osdLabels
				if isFpv then
					osd = create("Frame", { Name = "RockHubShahedOsd", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = gui })
					osdLabels = {}

					local function o(key, anchor, pos2, align)
						osdLabels[key] = create("TextLabel", {
							AnchorPoint = anchor,
							Position = pos2,
							Size = UDim2.fromOffset(200, 18),
							BackgroundTransparency = 1,
							Font = Enum.Font.Code,
							TextSize = 16,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextStrokeTransparency = 0.3,
							TextXAlignment = align,
							Text = "",
							Parent = osd,
						})
					end

					o("bat", Vector2.new(0, 0), UDim2.fromOffset(30, 70), Enum.TextXAlignment.Left)
					o("time", Vector2.new(1, 0), UDim2.new(1, -30, 0, 70), Enum.TextXAlignment.Right)
					o("alt", Vector2.new(0, 1), UDim2.new(0, 30, 1, -80), Enum.TextXAlignment.Left)
					o("spd", Vector2.new(1, 1), UDim2.new(1, -30, 1, -80), Enum.TextXAlignment.Right)
					o("mode", Vector2.new(0.5, 0), UDim2.new(0.5, 0, 0, 70), Enum.TextXAlignment.Center)
					osdLabels.mode.Text = impactMode:upper() .. "   ACRO"
					osdLabels.mode.TextColor3 = impactMode == "Kill" and Color3.fromRGB(255, 80, 70) or Color3.fromRGB(110, 190, 255)
				end
				local hud2 = create("Frame", {
					Name = "RockHubShahedHud",
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, 0, 1, -24),
					Size = UDim2.fromOffset(0, 30),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = Color3.fromRGB(14, 14, 18),
					BackgroundTransparency = 0.25,
					Parent = gui,
				})
				create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = hud2 })
				create("UIPadding", { PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14), Parent = hud2 })
				local hint = create("TextLabel", {
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					Font = Enum.Font.GothamMedium,
					TextSize = 13,
					TextColor3 = Color3.fromRGB(235, 235, 240),
					Text = "",
					Parent = hud2,
				})
				local crosshair = create("Frame", {
					Name = "RockHubShahedCross",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(6, 6),
					BackgroundColor3 = Color3.fromRGB(255, 70, 60),
					Parent = gui,
				})
				create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = crosshair })
				local pip
				local preferredTouch = false
				pcall(function()
					preferredTouch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
				end)
				local touchDevice = UserInputService.TouchEnabled and (preferredTouch or not UserInputService.KeyboardEnabled)
				local mobileInput = {
					throttle = 0,
					yaw = 0,
					lookDelta = Vector2.zero,
					boost = false,
					up = false,
					down = false,
				}
				local mobileRoot
				local fpView, vWasDown = false, false

				local function closePip()
					if not pip then
						return
					end
					pip.frame:Destroy()
					if pip.rec then
						pip.rec:Destroy()
					end
					pip = nil
				end

				local function safeClone(obj)
					local old = obj.Archivable
					obj.Archivable = true
					local ok, c = pcall(function()
						return obj:Clone()
					end)
					obj.Archivable = old
					return ok and c or nil
				end

				local function openPip(p)
					closePip()
					local th, _, targetChar = alive(p)
					if not th then
						return
					end
					local frame = create("Frame", {
						Name = "RockHubShahedPip",
						AnchorPoint = Vector2.new(1, 1),
						Position = UDim2.new(1, -20, 1, -20),
						Size = UDim2.fromOffset(300, 190),
						BackgroundColor3 = Color3.fromRGB(10, 10, 12),
						BorderSizePixel = 0,
						Visible = false,
						Parent = gui,
					})
					create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = frame })
					create("UIStroke", { Color = Color3.fromRGB(255, 70, 60), Thickness = 1.5, Transparency = 0.2, Parent = frame })
					local viewport = create("ViewportFrame", {
						Position = UDim2.fromOffset(4, 4),
						Size = UDim2.new(1, -8, 1, -8),
						BackgroundColor3 = Color3.fromRGB(28, 32, 40),
						BorderSizePixel = 0,
						Ambient = Color3.fromRGB(150, 150, 155),
						LightColor = Color3.fromRGB(255, 250, 240),
						LightDirection = Vector3.new(-0.6, -1, -0.4),
						Parent = frame,
					})
					create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = viewport })
					local vpCam = create("Camera", { FieldOfView = 62, Parent = viewport })
					viewport.CurrentCamera = vpCam

					local function text(props2)
						do
							local ops = {}
							ops[5924] = {
								function()
									return props2
								end,
								"Parent",
								function()
									return props2.Parent or frame
								end,
							}
							ops[33396] = {
								function()
									return props2
								end,
								"TextSize",
								function()
									return props2.TextSize or 13
								end,
							}
							ops[27460] = {
								function()
									return props2
								end,
								"Font",
								function()
									return Enum.Font.Code
								end,
							}
							ops[46500] = {
								function()
									return props2
								end,
								"BackgroundTransparency",
								function()
									return 1
								end,
							}
							ops[31679] = {
								function()
									return props2
								end,
								"TextStrokeTransparency",
								function()
									return 0.4
								end,
							}
							ops[59609] = {
								function()
									return props2
								end,
								"ZIndex",
								function()
									return 4
								end,
							}
							local order = { 46500, 27460, 33396, 31679, 59609, 5924 }
							for j = 1, #order do
								local op = ops[order[j]]
								op[1]()[op[2]] = op[3]()
							end
						end
						return create("TextLabel", props2)
					end

					text({
						Position = UDim2.fromOffset(12, 9),
						Size = UDim2.new(1, -24, 0, 14),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						Text = "TARGET CAM  " .. p.DisplayName:upper(),
					})
					local stampLabel = text({
						AnchorPoint = Vector2.new(0, 1),
						Position = UDim2.new(0, 12, 1, -8),
						Size = UDim2.new(1, -24, 0, 14),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = Color3.fromRGB(255, 80, 70),
						Text = "",
					})
					local flash = create("Frame", {
						Size = UDim2.fromScale(1, 1),
						BackgroundColor3 = Color3.new(1, 1, 1),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 3,
						Parent = frame,
					})
					create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = flash })
					local lostLabel = text({
						Size = UDim2.fromScale(1, 1),
						TextSize = 22,
						TextColor3 = Color3.fromRGB(235, 235, 235),
						BackgroundColor3 = Color3.new(0, 0, 0),
						Text = "SIGNAL LOST",
						Visible = false,
					})
					lostLabel.BackgroundTransparency = 0
					create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = lostLabel })
					local scene = Instance.new("Model")
					local overlapParams = OverlapParams.new()
					overlapParams.FilterType = Enum.RaycastFilterType.Exclude
					local excludeList = { cam }
					for _, pl in ipairs(Players:GetPlayers()) do
						if pl.Character then
							table.insert(excludeList, pl.Character)
						end
					end
					overlapParams.FilterDescendantsInstances = excludeList
					local gotGun = 0
					for _, part in ipairs(workspace:GetPartBoundsInRadius(th.Position, 80, overlapParams)) do
						if gotGun >= 600 then
							break
						end
						if part.Transparency < 0.95 and not part:IsA("Terrain") then
							local c = safeClone(part)
							if c then
								for _, d in ipairs(c:GetDescendants()) do
									if not (d:IsA("Decal") or d:IsA("Texture") or d:IsA("SpecialMesh") or d:IsA("SurfaceAppearance")) then
										d:Destroy()
									end
								end
								c.Anchored = true
								c.Parent = scene
								gotGun += 1
							end
						end
					end
					scene.Parent = viewport
					local links = {}
					local charClone = safeClone(targetChar)
					if charClone then
						for _, d in ipairs(charClone:GetDescendants()) do
							if d:IsA("LuaSourceContainer") or d:IsA("Sound") then
								d:Destroy()
							elseif d:IsA("BasePart") then
								d.Anchored = true
							end
						end

						local function linkParts(a, b)
							for _, ca in ipairs(a:GetChildren()) do
								local cb = b:FindFirstChild(ca.Name)
								if cb then
									if ca:IsA("BasePart") and cb:IsA("BasePart") then
										table.insert(links, { ca, cb })
									end
									linkParts(ca, cb)
								end
							end
						end

						linkParts(targetChar, charClone)
						charClone.Parent = viewport
					end
					local droneCopy = droneTemplate:Clone()
					droneCopy.Parent = viewport
					local recLabel = create("TextLabel", {
						Name = "RockHubShahedRec",
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.new(0.5, 0, 0, 14),
						Size = UDim2.fromOffset(220, 18),
						BackgroundTransparency = 1,
						Font = Enum.Font.Code,
						TextSize = 15,
						TextColor3 = Color3.fromRGB(255, 70, 60),
						TextStrokeTransparency = 0.5,
						Text = "● REC  TARGET CAM",
						Parent = gui,
					})
					pip = {
						frame = frame,
						vf = viewport,
						p = p,
						hrp = th,
						vcam = vpCam,
						links = links,
						drone = droneCopy,
						stamp = stampLabel,
						flash = flash,
						lost = lostLabel,
						rec = recLabel,
						frames = {},
					}
				end

				local function recordFrame(droneCf)
					if not pip then
						return
					end
					if not alive(pip.p) then
						closePip()
						return
					end
					local now = os.clock()
					local cfs = table.create(#pip.links)
					for i, l in ipairs(pip.links) do
						cfs[i] = l[1].CFrame
					end
					table.insert(pip.frames, { t = now, drone = droneCf, cfs = cfs, tp = pip.hrp.Position })
					while #pip.frames > 2 and now - pip.frames[1].t > 3.2 do
						table.remove(pip.frames, 1)
					end
					pip.rec.TextTransparency = now * 2 % 1 < 0.6 and 0 or 0.7
				end

				local function playReplay(clip)
					if clip.rec then
						clip.rec:Destroy()
					end
					local frameCount2 = clip.frames
					if #frameCount2 < 2 then
						clip.frame:Destroy()
						return
					end

					local function applyFrame(f)
						for i, l in ipairs(clip.links) do
							if f.cfs[i] then
								l[2].CFrame = f.cfs[i]
							end
						end
						clip.drone:PivotTo(f.drone)
						local delta = f.drone.Position - f.tp
						local flatDist = Vector3.new(delta.X, 0, delta.Z)
						flatDist = flatDist.Magnitude > 0.1 and flatDist.Unit or Vector3.zAxis
						local camPos = f.tp - flatDist * 11 + Vector3.new(0, 5, 0)
						return CFrame.lookAt(camPos, f.tp + delta.Unit * 6 + Vector3.new(0, 1, 0))
					end

					local frame = clip.frame
					frame.Visible = true
					frame.Size = UDim2.fromOffset(0, 0)
					TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(300, 190) }):Play()
					local start, len = frameCount2[1].t, frameCount2[#frameCount2].t - frameCount2[1].t
					local camCf
					local cur = 1
					local playStart = os.clock()
					while true do
						local t = os.clock() - playStart
						if t > len then
							break
						end
						while cur < #frameCount2 and frameCount2[cur + 1].t - start <= t do
							cur += 1
						end
						local want = applyFrame(frameCount2[cur])
						camCf = camCf and camCf:Lerp(want, 0.25) or want
						clip.vcam.CFrame = camCf
						clip.stamp.Text = ("● REC  00:00:%05.2f   REPLAY"):format(t)
						RunService.RenderStepped:Wait()
					end
					local last = frameCount2[#frameCount2]
					clip.drone:Destroy()
					local fireball = create("Part", {
						Shape = Enum.PartType.Ball,
						Size = Vector3.one * 2,
						Anchored = true,
						Material = Enum.Material.Neon,
						Color = Color3.fromRGB(255, 150, 50),
						CFrame = CFrame.new(last.drone.Position),
						Parent = clip.vf,
					})
					clip.flash.BackgroundTransparency = 0
					TweenService:Create(clip.flash, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
					TweenService:Create(fireball, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = Vector3.one * 22, Color = Color3.fromRGB(70, 60, 55), Transparency = 0.4 }):Play()
					local shakeStart = os.clock()
					while os.clock() - shakeStart < 0.6 do
						local k = 1 - (os.clock() - shakeStart) / 0.6
						clip.vcam.CFrame = camCf * CFrame.Angles((math.random() - 0.5) * 0.08 * k, (math.random() - 0.5) * 0.08 * k, 0)
						RunService.RenderStepped:Wait()
					end
					clip.lost.Visible = true
					task.wait(0.9)
					TweenService:Create(frame, TweenInfo.new(0.2), { Size = UDim2.fromOffset(0, 0) }):Play()
					task.wait(0.22)
					frame:Destroy()
				end

				local keysDown = {}
				local done = false
				local connections2 = {}

				local function endFlight(exploded)
					for _, c in ipairs(connections2) do
						c:Disconnect()
					end
					RunService:UnbindFromRenderStep("RockHubShahedPilot")
					if engine then
						engine:Stop()
					end
					drone:Destroy()
					hud2:Destroy()
					if mobileRoot then
						mobileRoot:Destroy()
					end
					closePip()
					crosshair:Destroy()
					if osd then
						osd:Destroy()
					end
					UserInputService.MouseBehavior, UserInputService.MouseIconEnabled = oldMouse, oldIconEnabled
					local t = os.clock()
					while exploded and os.clock() - t < 2.45 or killing and os.clock() - t < 3 do
						if char.Parent then
							hideChar(char, true)
						end
						RunService.Heartbeat:Wait()
					end
					if char.Parent then
						hideChar(char, false)
					end
					if controls then
						task.spawn(pcall, function()
							controls:Enable()
						end)
					end
					hum.WalkSpeed, hum.JumpPower = oldWalkSpeed, oldJumpPower
					if desyncPaused then
						desyncPaused = false
						resumeDesync()
					end
					cam.CameraType = oldCamType == Enum.CameraType.Scriptable and Enum.CameraType.Custom or oldCamType
					if hum.Parent then
						cam.CameraSubject = hum
					end
					droneBusy = false
				end

				local function detonate(at)
					if done then
						return
					end
					done = true
					local best, bestDist = nil, 16
					for _, e in ipairs(getTargets(false, at, true)) do
						local th = alive(e.p)
						local d = th and (th.Position - at).Magnitude
						if d and d < bestDist then
							best, bestDist = e.p, d
						end
					end
					if pip and pip.p == best and best then
						local clip = pip
						pip = nil
						table.insert(clip.frames, {
							t = os.clock(),
							drone = CFrame.new(at),
							cfs = clip.frames[#clip.frames] and clip.frames[#clip.frames].cfs or {},
							tp = clip.hrp.Position,
						})
						task.delay(2.5, playReplay, clip)
					end
					if best then
						if impactMode == "Kill" then
							task.spawn(finishTarget, best)
						end
					end
					showSignalLost(best and best.DisplayName, os.clock() - gradStart2)
					explode(at)
					if best and impactMode == "Fling" and playerFlingAction then
						endFlight(false)
						task.spawn(playerFlingAction, best)
					else
						task.spawn(endFlight, true)
					end
				end

				local function abort()
					if done then
						return
					end
					done = true
					task.spawn(endFlight, false)
				end

				if touchDevice then
					mobileRoot = create("Frame", {
						Name = "RockHubDroneMobile",
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						Parent = gui,
					})
					local stickBase = create("Frame", {
						AnchorPoint = Vector2.new(0, 1),
						Position = UDim2.new(0, 24, 1, -28),
						Size = UDim2.fromOffset(136, 136),
						BackgroundColor3 = Color3.fromRGB(14, 14, 18),
						BackgroundTransparency = 0.28,
						Active = true,
						ZIndex = 20,
						Parent = mobileRoot,
					})
					create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = stickBase })
					create("UIStroke", { Color = accentColor, Thickness = 2, Transparency = 0.35, Parent = stickBase })
					local stickKnob = create("Frame", {
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromOffset(54, 54),
						BackgroundColor3 = accentColor,
						BackgroundTransparency = 0.08,
						ZIndex = 21,
						Parent = stickBase,
					})
					create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = stickKnob })
					local stickTouch

					local function resetStick()
						stickTouch = nil
						mobileInput.throttle, mobileInput.yaw = 0, 0
						stickKnob.Position = UDim2.fromScale(0.5, 0.5)
					end

					local function updateStick(input)
						local center = stickBase.AbsolutePosition + stickBase.AbsoluteSize / 2
						local delta = Vector2.new(input.Position.X, input.Position.Y) - center
						local radius = stickBase.AbsoluteSize.X * 0.36
						if delta.Magnitude > radius then
							delta = delta.Unit * radius
						end
						mobileInput.yaw = math.clamp(delta.X / radius, -1, 1)
						mobileInput.throttle = math.clamp(-delta.Y / radius, -1, 1)
						stickKnob.Position = UDim2.new(0.5, delta.X, 0.5, delta.Y)
					end

					table.insert(connections2, stickBase.InputBegan:Connect(function(input)
						if not stickTouch and input.UserInputType == Enum.UserInputType.Touch then
							stickTouch = input
							updateStick(input)
						end
					end))
					table.insert(connections2, UserInputService.InputChanged:Connect(function(input)
						if input == stickTouch then
							updateStick(input)
						end
					end))
					table.insert(connections2, UserInputService.InputEnded:Connect(function(input)
						if input == stickTouch then
							resetStick()
						end
					end))

					local lookPad = create("Frame", {
						Position = UDim2.fromScale(0.38, 0),
						Size = UDim2.new(0.62, 0, 1, -190),
						BackgroundTransparency = 1,
						Active = true,
						ZIndex = 19,
						Parent = mobileRoot,
					})
					create("TextLabel", {
						AnchorPoint = Vector2.new(1, 0),
						Position = UDim2.new(1, -18, 0, 18),
						Size = UDim2.fromOffset(130, 22),
						BackgroundTransparency = 1,
						Font = Enum.Font.GothamBold,
						Text = "DRAG TO AIM",
						TextSize = 12,
						TextColor3 = Color3.fromRGB(225, 225, 230),
						TextTransparency = 0.35,
						ZIndex = 20,
						Parent = lookPad,
					})
					local lookTouch
					table.insert(connections2, lookPad.InputBegan:Connect(function(input)
						if not lookTouch and input.UserInputType == Enum.UserInputType.Touch then
							lookTouch = input
						end
					end))
					table.insert(connections2, UserInputService.InputChanged:Connect(function(input)
						if input == lookTouch then
							mobileInput.lookDelta += Vector2.new(input.Delta.X, input.Delta.Y)
						end
					end))
					table.insert(connections2, UserInputService.InputEnded:Connect(function(input)
						if input == lookTouch then
							lookTouch = nil
						end
					end))

					local function controlButton(text, x, y, callback, holdKey)
						local button = create("TextButton", {
							AnchorPoint = Vector2.new(1, 1),
							Position = UDim2.new(1, x, 1, y),
							Size = UDim2.fromOffset(82, 54),
							BackgroundColor3 = Color3.fromRGB(18, 18, 23),
							BackgroundTransparency = 0.16,
							AutoButtonColor = false,
							Font = Enum.Font.GothamBold,
							Text = text,
							TextSize = 12,
							TextColor3 = Color3.fromRGB(245, 245, 248),
							ZIndex = 22,
							Parent = mobileRoot,
						})
						create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = button })
						create("UIStroke", { Color = text == "BOOM" and Color3.fromRGB(255, 75, 60) or accentColor, Thickness = 1.5, Transparency = 0.3, Parent = button })
						if holdKey then
							local heldInput
							table.insert(connections2, button.InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.Touch then
									heldInput = input
									mobileInput[holdKey] = true
									button.BackgroundColor3 = accentColor
								end
							end))
							table.insert(connections2, UserInputService.InputEnded:Connect(function(input)
								if input == heldInput then
									heldInput = nil
									mobileInput[holdKey] = false
									button.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
								end
							end))
						else
							table.insert(connections2, button.Activated:Connect(callback))
						end
					end

					controlButton("BOOST", -212, -92, nil, "boost")
					controlButton("UP", -122, -92, nil, "up")
					controlButton("DOWN", -32, -92, nil, "down")
					controlButton("VIEW", -212, -28, function()
						fpView = not fpView
					end)
					controlButton("BOOM", -122, -28, function()
						if os.clock() - gradStart2 > 0.5 then
							detonate(pos)
						end
					end)
					controlButton("EXIT", -32, -28, abort)
				end

				table.insert(connections2, UserInputService.InputBegan:Connect(function(input, gp)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if not gp and os.clock() - gradStart2 > 0.5 then
							detonate(pos)
						end
					elseif input.KeyCode == Enum.KeyCode.X then
						abort()
					elseif not gp then
						keysDown[input.KeyCode] = true
					end
				end))
				table.insert(connections2, UserInputService.InputEnded:Connect(function(input)
					keysDown[input.KeyCode] = nil
				end))
				table.insert(connections2, hum.Died:Connect(abort))
				local velocity = Vector3.zero

				local function votesCast(move)
					local hit2 = workspace:Spherecast(pos, 1.4, move, rp)
					for _ = 1, 8 do
						if not hit2 then
							break
						end
						local obj = hit2.Instance
						local m = obj:FindFirstAncestorOfClass("Model")
						local hitHum = m and m:FindFirstChildOfClass("Humanoid")
						if not (obj.Transparency >= 0.9 or not obj.CanCollide or hitHum) then
							break
						end
						table.insert(ignoreList, hitHum and m or obj)
						rp.FilterDescendantsInstances = ignoreList
						hit2 = workspace:Spherecast(pos, 1.4, move, rp)
					end
					return hit2
				end

				local function moveDrone(move)
					for _ = 1, 3 do
						if move.Magnitude < 0.001 then
							return
						end
						local hit2 = votesCast(move)
						if not hit2 then
							pos += move
							return
						end
						local n = hit2.Normal
						local travel = math.max(hit2.Distance - 0.05, 0)
						pos += move.Unit * travel + n * 0.02
						move -= move.Unit * travel
						move -= n * move:Dot(n)
						velocity -= n * math.min(velocity:Dot(n), 0)
					end
				end

				local groundParams = RaycastParams.new()
				groundParams.FilterType = Enum.RaycastFilterType.Exclude
				groundParams.FilterDescendantsInstances = { cam, char }
				local camCf = cam.CFrame

				local function keyDown(k)
					return UserInputService:IsKeyDown(k)
				end

				RunService:BindToRenderStep("RockHubShahedPilot", Enum.RenderPriority.Last.Value + 5, function(dt)
					if done then
						return
					end
					dt = math.min(dt, 0.05)
					if not touchDevice then
						UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
						UserInputService.MouseIconEnabled = false
					end
					cam.CameraType = Enum.CameraType.Scriptable
					local mouseDelta = touchDevice and mobileInput.lookDelta or UserInputService:GetMouseDelta()
					mobileInput.lookDelta = Vector2.zero
					local turn2 = 0
					if keyDown(Enum.KeyCode.A) then
						turn2 += 1
					end
					if keyDown(Enum.KeyCode.D) then
						turn2 -= 1
					end
					turn2 -= mobileInput.yaw
					local yawDelta = -mouseDelta.X * (touchDevice and 0.0045 or 0.0035) + turn2 * 1.8 * dt
					turn += yawDelta
					pitch = math.clamp(pitch - mouseDelta.Y * (touchDevice and 0.0045 or 0.0035), -1.45, 1.3)
					local v = keyDown(Enum.KeyCode.V)
					if v and not vWasDown then
						fpView = not fpView
					end
					vWasDown = v
					local rot = CFrame.Angles(0, turn, 0) * CFrame.Angles(pitch, 0, 0)
					local dir = rot.LookVector
					local speed = 0
					if keyDown(Enum.KeyCode.W) then
						speed = isFpv and (keyDown(Enum.KeyCode.LeftShift) and 150 or 90) or (keyDown(Enum.KeyCode.LeftShift) and 110 or 60)
					end
					if keyDown(Enum.KeyCode.S) then
						speed = isFpv and -30 or -25
					end
					if touchDevice and math.abs(mobileInput.throttle) > 0.04 then
						if mobileInput.throttle > 0 then
							speed = mobileInput.throttle * (isFpv and (mobileInput.boost and 150 or 90) or (mobileInput.boost and 110 or 60))
						else
							speed = mobileInput.throttle * (isFpv and 30 or 25)
						end
					end
					local vert, vel = 0, isFpv and 40 or 28
					if keyDown(Enum.KeyCode.Space) or mobileInput.up then
						vert += vel
					end
					if keyDown(Enum.KeyCode.LeftControl) or keyDown(Enum.KeyCode.Q) or mobileInput.down then
						vert -= vel
					end
					velocity = velocity:Lerp(dir * speed + Vector3.yAxis * vert, math.min(dt * (isFpv and 4.5 or 3), 1))
					bank += (math.clamp(yawDelta / math.max(dt, 0.001) * 0.35, -0.9, 0.9) - bank) * math.min(dt * 5, 1)
					local step = velocity * dt
					for _, e in ipairs(getTargets(false, pos, true)) do
						local th = alive(e.p)
						if th and (th.Position - pos).Magnitude < 6 then
							detonate(th.Position)
							return
						end
					end
					moveDrone(step)
					local cf = CFrame.new(pos) * rot
					local tilt = isFpv and -math.clamp(velocity:Dot(dir) / 150, -0.4, 1) * 0.45 or 0
					local visualCf = cf * CFrame.Angles(tilt, 0, bank * (isFpv and 1.2 or 1))
					drone:PivotTo(visualCf)
					local spinAxis = isFpv and visualCf.UpVector or visualCf.LookVector
					for _, prop in ipairs(props) do
						prop.CFrame = CFrame.new(prop.Position) * CFrame.fromAxisAngle(spinAxis, dt * 45) * (prop.CFrame - prop.Position)
					end
					if engine and isFpv then
						engine.PlaybackSpeed = 0.9 + velocity.Magnitude / 170
					end
					local camGoal
					if fpView then
						camGoal = isFpv and cf * CFrame.new(0, 0.45, -0.9) * CFrame.Angles(0.1, 0, bank * 0.6) or cf * CFrame.new(0, 0.3, -3) * CFrame.Angles(0, 0, bank * 0.5)
					else
						camGoal = isFpv and cf * CFrame.new(0, 0.8, 2.8) * CFrame.Angles(-0.1, 0, 0) or cf * CFrame.new(0, 1.1, 4) * CFrame.Angles(-0.08, 0, 0)
					end
					if osdLabels then
						local elapsed = os.clock() - gradStart2
						local g = workspace:Raycast(pos, Vector3.new(0, -400, 0), groundParams)
						osdLabels.bat.Text = ("BAT %.1fV"):format(16.8 - elapsed * 0.05)
						osdLabels.time.Text = ("%02d:%02d"):format(math.floor(elapsed / 60), math.floor(elapsed % 60))
						osdLabels.alt.Text = ("ALT %dm"):format(g and math.floor(g.Distance * 0.28) or 99)
						osdLabels.spd.Text = ("%d km/h"):format(math.floor(velocity.Magnitude * 0.28 * 3.6))
					end
					camCf = camCf:Lerp(camGoal, math.min(dt * (fpView and 25 or 12), 1))
					cam.CFrame = camCf
					local pipTarget, bestEta
					for _, e in ipairs(getTargets(false, pos, true)) do
						local th = alive(e.p)
						if th then
							local delta = th.Position - pos
							local closing = delta.Magnitude > 0.1 and velocity:Dot(delta.Unit) or 0
							if closing > 4 then
								local eta = delta.Magnitude / closing
								if not bestEta or eta < bestEta then
									pipTarget, bestEta = e.p, eta
								end
							end
						end
					end
					if pip and (pip.p ~= pipTarget or bestEta > 4.5) then
						closePip()
					end
					if not pip and pipTarget and bestEta < 3 then
						openPip(pipTarget)
					end
					if pip then
						recordFrame(visualCf)
					end
					local left = 45 - (os.clock() - gradStart2)
					if touchDevice then
						hint.Text = ("stick - fly  ·  drag - aim  ·  buttons - actions  ·  %ds"):format(math.max(0, math.ceil(left)))
					else
						hint.Text = ("mouse - aim  ·  W fly  ·  Shift fast  ·  S back  ·  Space/Ctrl up/down  ·  V view  ·  LMB boom  ·  X exit  ·  %ds"):format(math.max(0, math.ceil(left)))
					end
					if left <= 0 then
						detonate(pos)
					end
				end)
			end

			local function launchDroneSafe()
				local ok, err = xpcall(launchDrone2, debug.traceback)
				if ok then
					return
				end
				warn("[rockhub] Shahed: " .. tostring(err))
				notify("Shahed error", tostring(err):match("^[^\n]*"):sub(-110))
				droneBusy, droneLoading = false, false
				if desyncPaused then
					desyncPaused = false
					resumeDesync()
				end
				pcall(function()
					RunService:UnbindFromRenderStep("RockHubShahedPilot")
				end)
				for _, n in ipairs({ "RockHubShahedHud", "RockHubShahedCross", "RockHubShahedOsd", "RockHubShahedRec", "RockHubDroneMobile" }) do
					local g = gui:FindFirstChild(n)
					if g then
						g:Destroy()
					end
				end
				for _, d in ipairs(workspace.CurrentCamera:GetChildren()) do
					if d.Name == "RockHubShahed" then
						d:Destroy()
					end
				end
				UserInputService.MouseBehavior = Enum.MouseBehavior.Default
				UserInputService.MouseIconEnabled = true
				task.spawn(pcall, function()
					require(player.PlayerScripts.PlayerModule):GetControls():Enable()
				end)
				local char = player.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if char then
					hideChar(char, false)
				end
				if hum and hum.WalkSpeed == 0 then
					hum.WalkSpeed, hum.JumpPower = 16, 50
				end
				local cam = workspace.CurrentCamera
				cam.CameraType = Enum.CameraType.Custom
				if hum then
					cam.CameraSubject = hum
				end
			end

			local sec = addSection(combatTab, "Murderer")
			sec:Button("Kill All", "teleport to everyone and stab them", function()
				killAll(false)
			end)
			sec:Button("Kill Sheriff", "only the one with the gun", function()
				killAll(true)
			end)
			sec:Toggle("Auto Kill All", "you get the knife - everyone dies", function(on)
				autoKill = on
				lastAutoKill = 0
				notify("Auto Kill All: " .. (on and "On" or "Off"), on and "waiting for the knife" or "disabled")
			end)
			local droneSection = addSection(droneTab, "Drone")
			droneSection:Segmented("Type", { "Shahed", "FPV" }, droneKind, function(v)
				droneKind = v
				droneTemplate = droneCache[v]
			end)
			droneSection:Segmented("Impact", { "Kill", "Fling" }, droneImpact, function(v)
				droneImpact = v
			end)
			droneSection:Button("Launch Drone", "Kill needs the knife; Fling works for every role", function()
				task.spawn(launchDroneSafe)
			end)
		end
		do
			local shotArgs, isBlocked
			local lastPos, desyncUntil = {}, {}
			connect(RunService.Heartbeat, function()
				local now = os.clock()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player then
						local c = p.Character
						local h = c and c:FindFirstChild("HumanoidRootPart")
						if h then
							local prev = lastPos[p]
							local moved = prev and (h.Position - prev).Magnitude or 0
							if moved > 30 or h.AssemblyLinearVelocity.Magnitude > 150 then
								desyncUntil[p] = now + 1.5
							end
							lastPos[p] = h.Position
						else
							lastPos[p] = nil
						end
					end
				end
				for p in pairs(lastPos) do
					if not p.Parent then
						lastPos[p], desyncUntil[p] = nil, nil
					end
				end
			end)

			local function isDesyncing(p)
				return p and (desyncUntil[p] or 0) > os.clock()
			end

			local function expandHitbox(murdererRoot)
				if not murdererRoot or not murdererRoot.Parent then
					return function() end
				end
				local o = { size = murdererRoot.Size, transp = murdererRoot.Transparency, collide = murdererRoot.CanCollide }
				pcall(function()
					murdererRoot.CanCollide = false
					murdererRoot.Transparency = 1
					murdererRoot.Size = Vector3.one * 50
				end)
				local done = false
				return function()
					if done then
						return
					end
					done = true
					if murdererRoot.Parent then
						pcall(function()
							murdererRoot.Size = o.size
							murdererRoot.Transparency = o.transp
							murdererRoot.CanCollide = o.collide
						end)
					end
				end
			end

			local silentAim = {
				on = false,
				wallbang = true,
				pred = 100,
				part = "Torso",
				auto = true,
				quiet = true,
				mode = "Remote",
			}
			local busy = false
			local wallMisses = 0
			local forceAimUntil = 0
			local lastRedirect = 0
			local aimParams = RaycastParams.new()
			aimParams.FilterType = Enum.RaycastFilterType.Exclude
			local peekOffsets = {
				Vector3.new(0, 0, 4),
				Vector3.new(0, 0, -4),
				Vector3.new(4, 0, 0),
				Vector3.new(-4, 0, 0),
				Vector3.new(0, 5, 3),
				Vector3.new(0, 2, 2),
			}
			local quietOffsets = {
				Vector3.new(0, 4, 0),
				Vector3.new(0, 7, 0),
				Vector3.new(3, 0, 0),
				Vector3.new(-3, 0, 0),
				Vector3.new(3, 4, 0),
				Vector3.new(-3, 4, 0),
				Vector3.new(0, 0, -3),
				Vector3.new(0, 10, 0),
			}

			local function findQuietSpot(murdererRoot, myChar)
				local root = myChar and myChar:FindFirstChild("HumanoidRootPart")
				if not root then
					return nil
				end
				aimParams.FilterDescendantsInstances = { myChar, murdererRoot.Parent, workspace.CurrentCamera }
				local facing = CFrame.lookAt(root.Position, Vector3.new(murdererRoot.Position.X, root.Position.Y, murdererRoot.Position.Z))
				for _, offset in ipairs(quietOffsets) do
					local pos = (facing * CFrame.new(offset)).Position
					if not isBlocked(root.Position, pos) and not isBlocked(pos, murdererRoot.Position) then
						return CFrame.lookAt(pos, murdererRoot.Position)
					end
				end
			end

			local function getMuzzle()
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				return hrp and hrp:FindFirstChild("GunRaycastAttachment")
			end

			local function muzzlePos(fallback)
				local a = getMuzzle()
				return a and a.WorldPosition or fallback
			end

			shotArgs = function(origin, aimPos, fromOrigin)
				local a = getMuzzle()
				local from = not fromOrigin and a and a.WorldCFrame or CFrame.lookAt(origin, aimPos)
				local dir = aimPos - from.Position
				if dir.Magnitude < 0.01 then
					dir = Vector3.new(0, 0, -1)
				end
				return from, CFrame.lookAt(aimPos, aimPos + dir.Unit)
			end

			isBlocked = function(a, b, extraIgnore)
				local list = { workspace.CurrentCamera }
				for _, x in ipairs(extraIgnore or {}) do
					table.insert(list, x)
				end
				for _, pl in ipairs(Players:GetPlayers()) do
					if pl.Character then
						table.insert(list, pl.Character)
					end
				end
				local params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				for _ = 1, 8 do
					params.FilterDescendantsInstances = list
					local hit = workspace:Raycast(a, b - a, params)
					if not hit then
						return false
					end
					local pt = hit.Instance
					if pt.Transparency >= 0.9 or not pt.CanCollide then
						table.insert(list, pt)
					else
						return true
					end
				end
				return true
			end

			local function findWallbangSpot(murdererRoot, muzzle)
				local toMuzzle = muzzle - murdererRoot.Position
				toMuzzle = toMuzzle.Magnitude > 0.1 and toMuzzle.Unit or Vector3.new(0, 0, 1)
				for _, d in ipairs({ 3, 2, 5, 1.5 }) do
					local spot = murdererRoot.Position + toMuzzle * d + Vector3.new(0, 1, 0)
					if not isBlocked(spot, murdererRoot.Position) then
						return spot
					end
				end
				for _, offset in ipairs(peekOffsets) do
					local spot = (murdererRoot.CFrame * CFrame.new(offset)).Position
					if not isBlocked(spot, murdererRoot.Position) then
						return spot
					end
				end
				return murdererRoot.Position + Vector3.new(0, 3, 0)
			end

			local function reportWallbang(hit)
				if hit then
					wallMisses = 0
					return
				end
				wallMisses = wallMisses + 1
				if wallMisses == 2 then
					notify("WallBang", "missed twice through walls - send the shot log")
				end
			end

			local function getPeekCf(murdererRoot, myChar)
				if silentAim.quiet then
					local s = findQuietSpot(murdererRoot, myChar)
					if s then
						return s
					end
				end
				aimParams.FilterDescendantsInstances = { myChar, murdererRoot.Parent, workspace.CurrentCamera }
				for _, offset in ipairs(peekOffsets) do
					local pos = (murdererRoot.CFrame * CFrame.new(offset)).Position
					if not isBlocked(pos, murdererRoot.Position) then
						return CFrame.lookAt(pos, murdererRoot.Position)
					end
				end
				local behind = murdererRoot.CFrame * CFrame.new(0, 0, 3)
				return CFrame.lookAt(behind.Position, murdererRoot.Position)
			end

			local function getMurderer()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and findTool(p, "Knife") then
						local char = p.Character
						local hrp = char and char:FindFirstChild("HumanoidRootPart")
						local hum = char and char:FindFirstChildOfClass("Humanoid")
						if hrp and hum and hum.Health > 0 then
							return p, hrp
						end
					end
				end
			end

			local function findGunRemote(gun)
				local knifeLocal = gun:FindFirstChild("KnifeLocal")
				local cb = knifeLocal and knifeLocal:FindFirstChild("CreateBeam")
				local remote = cb and cb:FindFirstChild("RemoteFunction")
				if remote then
					return remote, "beam"
				end
				for _, d in ipairs(gun:GetDescendants()) do
					if (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) and d.Name:lower():find("shoot") then
						return d, "shoot"
					end
				end
			end

			local function equipGun()
				local char = player.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hum then
					return
				end
				local gun = char:FindFirstChild("Gun")
				if gun then
					return gun
				end
				local backpack = player:FindFirstChildOfClass("Backpack")
				gun = backpack and backpack:FindFirstChild("Gun")
				if not gun then
					return
				end
				hum:EquipTool(gun)
				for _ = 1, 10 do
					if gun.Parent == char then
						break
					end
					RunService.Heartbeat:Wait()
				end
				return gun
			end

			local function shootMurderer(manual)
				if busy then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum or hum.Health <= 0 then
					return
				end
				if not findTool(player, "Gun") then
					if manual then
						notify("Shoot Murderer", "you don't have the gun")
					end
					return
				end
				local _, murdererRoot = getMurderer()
				if not murdererRoot then
					if manual then
						notify("Shoot Murderer", "murderer not found")
					end
					return
				end
				local gun = equipGun()
				if not gun then
					return
				end
				if silentAim.mode == "Module" then
					forceAimUntil = os.clock() + 0.5
					pcall(function()
						gun:Activate()
					end)
					return
				end
				local gunRemote, kind = findGunRemote(gun)
				local tr = os.clock()
				while not gunRemote and os.clock() - tr < 1 do
					RunService.Heartbeat:Wait()
					gunRemote, kind = findGunRemote(gun)
				end
				if not gunRemote then
					notify("Shoot Murderer", "gun remote not found")
					return
				end
				busy = true
				pauseDesync(hrp)
				local savedCF = hrp.CFrame
				local cam = workspace.CurrentCamera
				local oldCamType = cam.CameraType
				local wallbang = silentAim.wallbang
				local pingMs = getPing() / 1000
				local murdererChar = murdererRoot.Parent
				local murderer = Players:GetPlayerFromCharacter(murdererChar)
				local desynced = isDesyncing(murderer)

				local function predictAim()
					if desynced then
						return murdererRoot.Position
					end
					local target = murdererRoot
					if silentAim.part == "Head" then
						target = murdererChar:FindFirstChild("Head") or murdererRoot
					else
						target = murdererChar:FindFirstChild("UpperTorso") or murdererChar:FindFirstChild("Torso") or murdererRoot
					end
					local v = murdererRoot.AssemblyLinearVelocity
					local lead = silentAim.pred / 1000
					return target.Position + Vector3.new(v.X, v.Y * 0.5, v.Z) * lead
				end

				local peekCf, holdConn
				local wbSpot
				if wallbang then
					local muzzle = muzzlePos(gun:FindFirstChild("Handle") and gun.Handle.Position or hrp.Position)
					if not isBlocked(muzzle, murdererRoot.Position) then
						wallbang = false
					else
						wbSpot = findWallbangSpot(murdererRoot, muzzle)
						wallbang = false
					end
				end
				if wallbang then
					cam.CameraType = Enum.CameraType.Scriptable
					peekCf = getPeekCf(murdererRoot, char)
					hrp.CFrame = peekCf
					hrp.AssemblyLinearVelocity = Vector3.zero
					holdConn = RunService.Stepped:Connect(function()
						if peekCf and hrp.Parent then
							if murdererRoot.Parent and not silentAim.quiet then
								peekCf = getPeekCf(murdererRoot, char)
							end
							hrp.CFrame = peekCf
							hrp.AssemblyLinearVelocity = Vector3.zero
						end
					end)
				end
				local recentFake = os.clock() - (desync.lastFakeAt or 0) < 0.6
				if wallbang and not recentFake then
					RunService.Heartbeat:Wait()
				end
				if recentFake then
					local waitUntil = (desync.lastFakeAt or 0) + math.clamp(pingMs / 2, 0.02, 0.2) + 0.05
					while os.clock() < waitUntil do
						RunService.Heartbeat:Wait()
					end
				end
				local aimPos = predictAim()
				local handle = gun:FindFirstChild("Handle")
				local origin = wbSpot or (handle and handle.Position or hrp.Position)
				local murdererHum = murdererChar and murdererChar:FindFirstChildOfClass("Humanoid")
				if murdererHum then
					task.spawn(function()
						local t = os.clock()
						while os.clock() - t < 1.2 do
							if murdererHum.Health <= 0 or not murdererHum.Parent then
								if wbSpot then
									reportWallbang(true)
								end
								notify("Silent Aimbot", "hit")
								return
							end
							RunService.Heartbeat:Wait()
						end
						if wbSpot then
							reportWallbang(false)
						end
						notify("Silent Aimbot", silentAim.auto and "miss" or "miss - try changing Prediction")
					end)
				end
				local restoreHitbox = expandHitbox(murdererRoot)
				task.delay(0.4, restoreHitbox)
				task.spawn(function()
					local ok, res = pcall(function()
						if kind == "beam" then
							return gunRemote:InvokeServer(1, aimPos, "AH2")
						elseif gunRemote:IsA("RemoteFunction") then
							return gunRemote:InvokeServer(shotArgs(origin, aimPos, wbSpot ~= nil))
						else
							gunRemote:FireServer(shotArgs(origin, aimPos, wbSpot ~= nil))
							return "(event, no reply)"
						end
					end)
					if not ok then
						warn("[rockhub] shot failed: " .. tostring(res))
					end
				end)
				if wallbang then
					local t = os.clock()
					local holdTime = math.clamp(pingMs / 2 + 0.03333333333333333, 0.05, 0.18)
					repeat
						RunService.Heartbeat:Wait()
					until os.clock() - t >= holdTime
					holdConn:Disconnect()
					if hrp.Parent and hum.Health > 0 then
						hrp.CFrame = savedCF
						hrp.AssemblyLinearVelocity = Vector3.zero
					end
					cam.CameraType = oldCamType
					cam.CameraSubject = hum
				end
				busy = false
				resumeDesync()
			end
			playerGunKill = function(target)
				if not target or not findTool(target, "Knife") then
					notify("Kill", "the sheriff can only shoot the murderer")
					return
				end
				shootMurderer(true)
			end

			local disabledScripts = {}

			local function disableGunScripts(gun)
				for _, d in ipairs(gun:GetDescendants()) do
					if d:IsA("LocalScript") and not d.Disabled then
						disabledScripts[d] = true
						d.Disabled = true
					end
				end
			end

			local function restoreGunScripts()
				for ls in pairs(disabledScripts) do
					if ls.Parent then
						ls.Disabled = false
					end
				end
				table.clear(disabledScripts)
			end

			table.insert(connections, {
				Disconnect = function()
					restoreGunScripts()
					for _, container in ipairs({ player.Character, player:FindFirstChildOfClass("Backpack") }) do
						local g = container and container:FindFirstChild("Gun")
						if g then
							pcall(function()
								g.ManualActivationOnly = false
							end)
						end
					end
				end,
			})
			local activatedConn, hookedGun
			connect(RunService.Heartbeat, function()
				local char = player.Character
				local gun = char and char:FindFirstChild("Gun")
				if silentAim.on and gun and silentAim.mode == "Remote" then
					disableGunScripts(gun)
				end
				if gun then
					local want = silentAim.on and silentAim.mode == "Native"
					if gun.ManualActivationOnly ~= want then
						gun.ManualActivationOnly = want
					end
				end
				if gun == hookedGun then
					return
				end
				if activatedConn then
					activatedConn:Disconnect()
					activatedConn = nil
				end
				hookedGun = gun
				if gun then
					activatedConn = gun.Activated:Connect(function()
						if silentAim.on and gui.Parent and silentAim.mode == "Module" and getMurderer() then
							local t = os.clock()
							task.delay(0.3, function()
								if silentAim.mode == "Module" and lastRedirect < t then
									silentAim.mode = "Remote"
									notify("Silent Aimbot", "switched to backup mode - shoot again")
								end
							end)
						end
						if silentAim.on and gui.Parent and silentAim.mode == "Remote" then
							if getMurderer() then
								task.spawn(shootMurderer, false)
							else
								task.spawn(function()
									local gunRemote, kind = findGunRemote(gun)
									if not gunRemote then
										return
									end
									local aimPos = player:GetMouse().Hit.Position
									local handle = gun:FindFirstChild("Handle")
									local origin = handle and handle.Position or aimPos
									pcall(function()
										if kind == "beam" then
											gunRemote:InvokeServer(1, aimPos, "AH2")
										elseif gunRemote:IsA("RemoteFunction") then
											gunRemote:InvokeServer(shotArgs(origin, aimPos))
										else
											gunRemote:FireServer(shotArgs(origin, aimPos))
										end
									end)
								end)
							end
						end
					end)
					table.insert(connections, activatedConn)
				end
			end)
			local nativeBusy = false

			local function nativeShot()
				if nativeBusy then
					return
				end
				local char = player.Character
				local gun = char and char:FindFirstChild("Gun")
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not gun or not hrp then
					return
				end
				local _, murdererRoot = getMurderer()
				if not murdererRoot then
					pcall(function()
						gun:Activate()
					end)
					return
				end
				local handle = gun:FindFirstChild("Handle")
				local muzzle = muzzlePos(handle and handle.Position or hrp.Position)
				if isBlocked(muzzle, murdererRoot.Position) and silentAim.wallbang then
					task.spawn(shootMurderer, false)
					return
				end
				nativeBusy = true
				local murdererChar = murdererRoot.Parent
				local target = murdererChar:FindFirstChild("UpperTorso") or murdererChar:FindFirstChild("Torso") or murdererRoot
				local v = murdererRoot.AssemblyLinearVelocity
				local lead = silentAim.pred / 1000
				local aimPos = target.Position + Vector3.new(v.X, v.Y * 0.5, v.Z) * lead
				local cam = workspace.CurrentCamera
				local locked = UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter
				if locked or not mousemoveabs then
					cam.CFrame = CFrame.lookAt(cam.CFrame.Position, aimPos)
					RunService.RenderStepped:Wait()
					cam.CFrame = CFrame.lookAt(cam.CFrame.Position, aimPos)
					pcall(function()
						gun:Activate()
					end)
				else
					local p = cam:WorldToViewportPoint(aimPos)
					local old = UserInputService:GetMouseLocation()
					mousemoveabs(p.X, p.Y)
					RunService.RenderStepped:Wait()
					RunService.RenderStepped:Wait()
					pcall(function()
						gun:Activate()
					end)
					RunService.RenderStepped:Wait()
					mousemoveabs(old.X, old.Y)
				end
				local murdererHum = murdererChar:FindFirstChildOfClass("Humanoid")
				if murdererHum then
					task.spawn(function()
						local t = os.clock()
						while os.clock() - t < 1.2 do
							if murdererHum.Health <= 0 or not murdererHum.Parent then
								notify("Silent Aimbot", "hit")
								return
							end
							RunService.Heartbeat:Wait()
						end
						notify("Silent Aimbot", "miss")
					end)
				end
				task.delay(0.15, function()
					nativeBusy = false
				end)
			end

			connect(UserInputService.InputBegan, function(input, gameProcessed)
				if gameProcessed or not silentAim.on or silentAim.mode ~= "Native" then
					return
				end
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				local char = player.Character
				if char and char:FindFirstChild("Gun") then
					task.spawn(nativeShot)
				end
			end)
			;(function()
				local ok, weaponService = pcall(function()
					return require(game:GetService("ReplicatedStorage"):WaitForChild("ClientServices", 5):WaitForChild("WeaponService", 5))
				end)
				if not ok or type(weaponService) ~= "table" then
					return
				end
				local oldMouse, oldTargetPos = weaponService.GetMouseTargetCFrame, weaponService.GetTargetPosition
				if type(oldMouse) ~= "function" then
					return
				end
				local bodyParts = { "UpperTorso", "Torso", "LowerTorso", "Head", "HumanoidRootPart", "RightUpperArm", "LeftUpperArm", "Right Arm", "Left Arm", "RightUpperLeg", "LeftUpperLeg", "Right Leg", "Left Leg" }
				local headFirst = { "Head", "UpperTorso", "Torso", "LowerTorso", "HumanoidRootPart", "RightUpperArm", "LeftUpperArm", "Right Arm", "Left Arm", "RightUpperLeg", "LeftUpperLeg", "Right Leg", "Left Leg" }
				local rayParams = RaycastParams.new()
				rayParams.FilterType = Enum.RaycastFilterType.Exclude
				local CollectionService = game:GetService("CollectionService")
				local passthrough, passthroughAt = {}, 0

				local function withPassthrough(...)
					if os.clock() - passthroughAt > 1 then
						passthroughAt = os.clock()
						passthrough = CollectionService:GetTagged("WeaponPassthrough")
					end
					local list = { ... }
					for _, x in ipairs(passthrough) do
						table.insert(list, x)
					end
					return list
				end

				local hist = {}
				connect(RunService.Heartbeat, function()
					if not silentAim.on then
						table.clear(hist)
						return
					end
					local _, murd = getMurderer()
					local now = os.clock()
					for h in pairs(hist) do
						if h ~= murd then
							hist[h] = nil
						end
					end
					if not murd then
						return
					end
					local list = hist[murd] or {}
					hist[murd] = list
					table.insert(list, { now, murd.Position })
					while #list > 2 and now - list[1][1] > 0.5 do
						table.remove(list, 1)
					end
				end)

				local function estimateVelocity(murdererRoot)
					local list = hist[murdererRoot]
					if not list or #list < 2 then
						return murdererRoot.AssemblyLinearVelocity
					end
					local a, b = list[1], list[#list]
					local dt = b[1] - a[1]
					if dt < 0.15 then
						return murdererRoot.AssemblyLinearVelocity
					end
					return (b[2] - a[2]) / dt
				end

				local function predictPos(murdererRoot, from)
					local murdererChar = murdererRoot.Parent
					if isDesyncing(Players:GetPlayerFromCharacter(murdererChar)) then
						return murdererRoot.Position
					end
					local v = estimateVelocity(murdererRoot)
					local lead = silentAim.auto and math.clamp(getPing() / 2000 + 0.1, 0, 0.45) or silentAim.pred / 1000
					local murdererHum = murdererChar:FindFirstChildOfClass("Humanoid")
					local airborne = murdererHum and murdererHum.FloorMaterial == Enum.Material.Air
					local dy = 0
					if airborne then
						local vy = murdererRoot.AssemblyLinearVelocity.Y
						dy = vy * lead - 0.5 * workspace.Gravity * lead * lead
						if dy < 0 then
							rayParams.FilterDescendantsInstances = withPassthrough(murdererChar, player.Character, workspace.CurrentCamera)
							local lookSign = workspace:Raycast(murdererRoot.Position, Vector3.new(0, -60, 0), rayParams)
							if lookSign then
								dy = math.max(dy, -(murdererRoot.Position.Y - lookSign.Position.Y - 3))
							end
						end
					end
					local leadOffset = Vector3.new(v.X * lead, dy, v.Z * lead)
					local fallbackAim
					rayParams.FilterDescendantsInstances = withPassthrough(player.Character, workspace.CurrentCamera)
					for _, n in ipairs(silentAim.part == "Head" and headFirst or bodyParts) do
						local part = murdererChar:FindFirstChild(n)
						if part and part:IsA("BasePart") then
							local target = part.Position + leadOffset
							fallbackAim = fallbackAim or target
							if not from then
								return target
							end
							local dir = target - from
							local hit = workspace:Raycast(from, dir.Unit * (dir.Magnitude + 2), rayParams)
							if not hit or hit.Instance:IsDescendantOf(murdererChar) then
								return target
							end
						end
					end
					return fallbackAim or murdererRoot.Position + leadOffset
				end

				local function watchHit(murdererChar, usedWallbang)
					local murdererHum = murdererChar and murdererChar:FindFirstChildOfClass("Humanoid")
					if not murdererHum then
						return
					end
					task.spawn(function()
						local t = os.clock()
						while os.clock() - t < 1.2 do
							if murdererHum.Health <= 0 or not murdererHum.Parent then
								if usedWallbang then
									reportWallbang(true)
								end
								notify("Silent Aimbot", "hit")
								return
							end
							RunService.Heartbeat:Wait()
						end
						if usedWallbang then
							reportWallbang(false)
						end
						notify("Silent Aimbot", silentAim.auto and "miss" or "miss - try changing Prediction")
					end)
				end

				local function canHit(origin, murdererChar, target)
					rayParams.FilterDescendantsInstances = withPassthrough(player.Character, workspace.CurrentCamera)
					local d = target - origin
					local hit = workspace:Raycast(origin, d.Unit * (d.Magnitude + 2), rayParams)
					return not hit or hit.Instance:IsDescendantOf(murdererChar)
				end

				local function anyPartVisible(murdererChar, origin)
					for _, n in ipairs(bodyParts) do
						local part = murdererChar:FindFirstChild(n)
						if part and part:IsA("BasePart") and canHit(origin, murdererChar, part.Position) then
							return true
						end
					end
					return false
				end

				local function rayBlocked(origin, to)
					rayParams.FilterDescendantsInstances = withPassthrough(player.Character, workspace.CurrentCamera)
					local d = to - origin
					if d.Magnitude < 0.05 then
						return false
					end
					return workspace:Raycast(origin, d, rayParams) ~= nil
				end

				local function findDirectSpot(murdererRoot, muzzle)
					local murdererChar = murdererRoot.Parent
					local toMuzzle = muzzle - murdererRoot.Position
					local base = math.atan2(toMuzzle.Z, toMuzzle.X)
					for _, dist in ipairs({ 3, 5, 7 }) do
						for k = 0, 11 do
							local angle = base + (k % 2 == 0 and 1 or -1) * math.ceil(k / 2) * (math.pi / 6)
							for _, h in ipairs({ 1.5, 3.5 }) do
								local p = murdererRoot.Position + Vector3.new(math.cos(angle) * dist, h, math.sin(angle) * dist)
								if canHit(p, murdererChar, murdererRoot.Position) and anyPartVisible(murdererChar, p) then
									return p
								end
							end
						end
					end
				end

				local function redirectAim(res)
					lastRedirect = os.clock()
					if not ((silentAim.on or os.clock() < forceAimUntil) and gui.Parent) then
						return res
					end
					if busy then
						local _, murd = getMurderer()
						local at = getMuzzle()
						if not murd or not at or typeof(res) ~= "CFrame" then
							return res
						end
						local aimPoint = predictPos(murd, at.WorldPosition)
						local aimDir = aimPoint - at.WorldPosition
						if aimDir.Magnitude < 0.01 then
							return res
						end
						return CFrame.lookAt(aimPoint, aimPoint + aimDir.Unit)
					end
					local fakeAt = desync.lastFakeAt or 0
					if os.clock() - fakeAt < 0.6 then
						local waitUntil = fakeAt + math.clamp(getPing() / 2000, 0.02, 0.25) + 0.05
						while os.clock() < waitUntil do
							RunService.Heartbeat:Wait()
						end
					end
					local _, murdererRoot = getMurderer()
					local char = player.Character
					local hrp = char and char:FindFirstChild("HumanoidRootPart")
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if not murdererRoot or not hrp or not hum then
						return res
					end
					local a = getMuzzle()
					local muzzle = a and a.WorldPosition or hrp.Position
					local usedWallbang = false
					local head = char:FindFirstChild("Head")
					local muzzleInWall = rayBlocked(head and head.Position or hrp.Position, muzzle) or rayBlocked(hrp.Position, muzzle)
					local bodyVisible = anyPartVisible(murdererRoot.Parent, muzzle)
					if not bodyVisible and not muzzleInWall and (murdererRoot.Position - muzzle).Magnitude < 6 then
						bodyVisible = true
					end
					local pathUsed = false
					if a then
						local murdererChar = murdererRoot.Parent
						local murd = murdererChar:FindFirstChildOfClass("Humanoid")
						local grounded = murd and murd.FloorMaterial ~= Enum.Material.Air
						local vel = estimateVelocity(murdererRoot)
						local flatVel = Vector3.new(vel.X, 0, vel.Z)
						if grounded and flatVel.Magnitude > 4 and (silentAim.wallbang or not muzzleInWall and bodyVisible) then
							local predicted = predictPos(murdererRoot, nil)
							local cur = (murdererChar:FindFirstChild("UpperTorso") or murdererChar:FindFirstChild("Torso") or murdererRoot).Position
							local line2 = predicted - cur
							local dir = line2.Magnitude > 0.5 and line2.Unit or flatVel.Unit
							local o = cur - dir * 5
							if (o - murdererRoot.Position).Magnitude >= 4 and canHit(o, murdererChar, cur) and canHit(o, murdererChar, predicted) then
								pathUsed = true
								usedWallbang = muzzleInWall or not bodyVisible
								local oldAttCf = a.CFrame
								a.WorldPosition = o
								task.defer(function()
									if a.Parent then
										a.CFrame = oldAttCf
									end
								end)
								muzzle = o
							end
						end
					end
					if not pathUsed and silentAim.wallbang and (muzzleInWall or not bodyVisible) and a then
						local p = findDirectSpot(murdererRoot, muzzle)
						if p then
							usedWallbang = true
							local oldAttCf = a.CFrame
							a.WorldPosition = p
							task.defer(function()
								if a.Parent then
									a.CFrame = oldAttCf
								end
							end)
							muzzle = p
						end
					end
					local aimPos = predictPos(murdererRoot, muzzle)
					watchHit(murdererRoot.Parent, usedWallbang)
					if typeof(res) == "Vector3" then
						return aimPos
					end
					local from = a and a.WorldPosition or muzzle
					local dir = aimPos - from
					if dir.Magnitude < 0.01 then
						dir = Vector3.new(0, 0, -1)
					end
					return CFrame.lookAt(aimPos, aimPos + dir.Unit)
				end

				local function safeRedirect(res)
					local ok2, r = pcall(redirectAim, res)
					if ok2 then
						return r
					end
					warn("[rockhub] aim redirect failed: " .. tostring(r))
					return res
				end

				weaponService.GetMouseTargetCFrame = function(...)
					return safeRedirect(oldMouse(...))
				end

				if type(oldTargetPos) == "function" then
					weaponService.GetTargetPosition = function(...)
						return safeRedirect(oldTargetPos(...))
					end
				end
				silentAim.mode = "Module"
				table.insert(connections, {
					Disconnect = function()
						weaponService.GetMouseTargetCFrame = oldMouse
						if oldTargetPos then
							weaponService.GetTargetPosition = oldTargetPos
						end
					end,
				})
			end)()
			local sec = addSection(combatTab, "Sheriff")
			sec:Toggle("Silent Aimbot", "shoot anywhere - the bullet hits the murderer", function(on)
				silentAim.on = on
				if not on then
					restoreGunScripts()
					local g = player.Character and player.Character:FindFirstChild("Gun")
					if g then
						g.ManualActivationOnly = false
					end
				end
				notify("Silent Aimbot: " .. (on and "On" or "Off"), on and "every shot goes to the murderer" or "disabled")
			end)
			local wallbangToggle = sec:Toggle("WallBang", "shots go straight through walls", function(on)
				silentAim.wallbang = on
				wallMisses = 0
			end)
			wallbangToggle.Set(true, true)
			local predSlider

			local function autoPredict()
				local v = math.clamp(math.floor((getPing() / 2 + 100) / 10 + 0.5) * 10, 0, 700)
				silentAim.pred = v
				if predSlider then
					predSlider.Set(v, true)
				end
			end

			local autoPredToggle = sec:Toggle("Auto prediction", "sets Prediction from your ping every second", function(on)
				silentAim.auto = on
				if on then
					autoPredict()
				end
			end)
			autoPredToggle.Set(true, true)
			predSlider = sec:Slider("Prediction", 0, 700, silentAim.pred, function(v)
				silentAim.pred = v
			end, function(v)
				return v .. "ms"
			end)
			local lastAutoPred = 0
			connect(RunService.Heartbeat, function()
				if not silentAim.auto or os.clock() - lastAutoPred < 1 then
					return
				end
				lastAutoPred = os.clock()
				autoPredict()
			end)
			local autoShoot = false
			local lastAutoKill = 0

			connect(RunService.Heartbeat, function()
				if not autoShoot or busy or os.clock() - lastAutoKill < 2 then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum or hum.Health <= 0 or inLobby(hrp.Position) then
					return
				end
				if not findTool(player, "Gun") or not getMurderer() then
					return
				end
				lastAutoKill = os.clock()
				task.spawn(shootMurderer, false)
			end)
			sec:Toggle("Auto Shoot Murderer", "you have the gun - the murderer gets shot", function(on)
				autoShoot = on
				lastAutoKill = 0
				notify("Auto Shoot: " .. (on and "On" or "Off"), on and "waiting for the gun" or "disabled")
			end)
			sec:Button("Shoot Murderer", "take out the gun and fire", function()
				shootMurderer(true)
			end)
		end
		do
			local on = false
			local lastPos = {}
			local dangerUntil = 0
			local warned = false
			local mode = "V2"
			local savedCF, oldCamType

			local function restore(hrp, hum)
				if hrp and hrp.Parent and savedCF then
					hrp.CFrame = savedCF
					hrp.AssemblyLinearVelocity = Vector3.zero
				end
				if savedCF then
					resumeDesync()
				end
				savedCF = nil
				local cam = workspace.CurrentCamera
				cam.CameraType = oldCamType or Enum.CameraType.Custom
				if hum then
					cam.CameraSubject = hum
				end
			end

			connect(RunService.Heartbeat, function()
				if not on then
					if desync.force then
						desync.force = false
					end
					desync.v2 = false
					if savedCF then
						local c = player.Character
						restore(c and c:FindFirstChild("HumanoidRootPart"), c and c:FindFirstChildOfClass("Humanoid"))
					end
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				local now = os.clock()
				if not hrp or not hum or hum.Health <= 0 or findTool(player, "Knife") or inLobby(hrp.Position) or char:FindFirstChild("Gun") then
					desync.force = false
					desync.v2 = false
					warned = false
					if savedCF then
						restore(hrp, hum)
					end
					return
				end
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player then
						local c = p.Character
						local murd = c and c:FindFirstChild("HumanoidRootPart")
						if murd and findTool(p, "Knife") then
							local pos = murd.Position
							if c:FindFirstChild("Knife") and (pos - hrp.Position).Magnitude < 20 then
								dangerUntil = math.max(dangerUntil, now + 0.8)
							end
							local prev = lastPos[p]
							if prev and (pos - prev).Magnitude > 25 and not inLobby(prev) and not inLobby(pos) then
								dangerUntil = now + 2
							end
							lastPos[p] = pos
						else
							lastPos[p] = nil
						end
					end
				end
				local danger = now < dangerUntil
				if mode == "V1" and danger and not warned then
					warned = true
					notify("Anti Kill All", "murderer is coming - you're untouchable")
				elseif not danger then
					warned = false
				end
				if mode == "V2" then
					local pos
					for _, p in ipairs(Players:GetPlayers()) do
						if p ~= player and findTool(p, "Knife") and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
							pos = p.Character.HumanoidRootPart.Position
						end
					end
					desync.murdererPos = pos
					desync.force = true
					desync.v2 = true
					return
				end
				desync.v2 = false
				desync.force = false
				if danger then
					if not savedCF then
						pauseDesync(hrp)
						savedCF = hrp.CFrame
						local cam = workspace.CurrentCamera
						oldCamType = cam.CameraType
						cam.CameraType = Enum.CameraType.Scriptable
					end
					hrp.CFrame = CFrame.new(savedCF.Position + Vector3.new(math.random(-30, 30), math.random(60, 90), math.random(-30, 30)))
					hrp.AssemblyLinearVelocity = Vector3.zero
				elseif savedCF then
					restore(hrp, hum)
				end
			end)
			local sec = addSection(combatTab, "Defense")
			sec:Toggle("Anti Kill All", "rock hub protection", function(v)
				on = v
				if not v then
					desync.force = false
				end
				notify("Anti Kill All: " .. (v and "On" or "Off"), v and "watching the murderer" or "disabled")
			end)
			sec:Segmented("Mode", { "V1", "V2" }, mode, function(v)
				mode = v
				desync.force = false
				if v ~= "V1" and savedCF then
					local c = player.Character
					restore(c and c:FindFirstChild("HumanoidRootPart"), c and c:FindFirstChildOfClass("Humanoid"))
				end
			end)
		end
		do
			local desyncCfg = { on = false, mode = "Random", radius = 80, interval = 30, tracer = true }
			local fakePos
			local nextPick = 0
			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude

			local function randomSpot(center, char)
				rayParams.FilterDescendantsInstances = { char, workspace.CurrentCamera }
				for _ = 1, 8 do
					local a = math.random() * math.pi * 2
					local d = desyncCfg.radius * (0.4 + 0.6 * math.random())
					local p = center + Vector3.new(math.cos(a) * d, 0, math.sin(a) * d)
					local hit = workspace:Raycast(p + Vector3.new(0, 40, 0), Vector3.new(0, -120, 0), rayParams)
					if hit then
						return hit.Position + Vector3.new(0, 3, 0)
					end
				end
				return center + Vector3.new(0, 0, desyncCfg.radius)
			end

			connect(RunService.Heartbeat, function()
				if not (desyncCfg.on or desync.force) or desync.pause > 0 then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum or hum.Health <= 0 then
					return
				end
				desync.gunHold = char:FindFirstChild("Gun") ~= nil
				if desync.gunHold then
					desync.fakeCF = nil
					return
				end
				local now = os.clock()
				local pos = hrp.Position
				if desync.force and desync.v2 then
					local best, bestDist
					for _ = 1, 6 do
						local dir = Vector3.new(math.random() * 2 - 1, (math.random() * 2 - 1) * 0.4, math.random() * 2 - 1)
						if dir.Magnitude < 0.05 then
							dir = Vector3.xAxis
						end
						local spot = pos + dir.Unit * (40 + math.random() * 60)
						local d = desync.murdererPos and (spot - desync.murdererPos).Magnitude or 999
						if d >= 40 and (not bestDist or d > bestDist) then
							best, bestDist = spot, d
						end
					end
					fakePos = best or pos + Vector3.new(0, 80, 0)
				elseif desyncCfg.mode == "Random" then
					if not fakePos or now >= nextPick then
						fakePos = randomSpot(pos, char)
						nextPick = now + desyncCfg.interval / 1000
					end
				elseif desyncCfg.mode == "Orbit" then
					local a = now * 3
					fakePos = pos + Vector3.new(math.cos(a) * desyncCfg.radius * 0.3, 0, math.sin(a) * desyncCfg.radius * 0.3)
				else
					fakePos = pos + Vector3.new(0, 200, 0)
				end
				local realCF = hrp.CFrame
				desync.real = realCF
				desync.lastFakeAt = os.clock()
				local sentPos = now * 40
				desync.fakeCF = CFrame.new(fakePos) * CFrame.Angles(sentPos * 1.3 + math.random() * 6.28, sentPos + math.random() * 6.28, sentPos * 0.7 + math.random() * 6.28)
				hrp.CFrame = desync.fakeCF
				if sethiddenproperty then
					pcall(sethiddenproperty, hrp, "NetworkIsSleeping", false)
				end
				local v = hrp.AssemblyLinearVelocity
				desync.realVel = v
				if v.Magnitude < 8 then
					local a = math.random() * math.pi * 2
					hrp.AssemblyLinearVelocity = Vector3.new(math.cos(a) * 12, 6, math.sin(a) * 12)
				end
			end)
			pcall(function()
				RunService:UnbindFromRenderStep("RockHubDesync")
			end)
			RunService:BindToRenderStep("RockHubDesync", Enum.RenderPriority.First.Value, function()
				if not desync.real then
					return
				end
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.CFrame = desync.real
					if desync.realVel then
						hrp.AssemblyLinearVelocity = desync.realVel
					end
				end
				desync.real, desync.realVel = nil, nil
			end)
			local vis = { char = nil, folder = nil, parts = {}, a0 = nil, a1 = nil }

			local function clearGhost()
				if vis.folder then
					vis.folder:Destroy()
				end
				vis.folder, vis.char = nil, nil
				table.clear(vis.parts)
			end

			local function buildGhost(char)
				clearGhost()
				vis.char = char
				vis.folder = create("Model", { Name = "RockHubDesyncGhost", Parent = workspace.CurrentCamera })
				for _, src in ipairs(char:GetChildren()) do
					if src:IsA("BasePart") and src.Name ~= "HumanoidRootPart" then
						local ok, g = pcall(function()
							return src:Clone()
						end)
						if ok and g then
							for _, c in ipairs(g:GetChildren()) do
								if not c:IsA("DataModelMesh") then
									c:Destroy()
								end
							end
							pcall(function()
								g.TextureID = ""
							end)
							g.Anchored, g.CanCollide, g.CanQuery, g.CanTouch, g.CastShadow = true, false, false, false, false
							g.Material = Enum.Material.ForceField
							g.Color = accentColor
							g.Transparency = 0.2
							g.Parent = vis.folder
							vis.parts[src] = g
						end
					end
				end
				create("Highlight", {
					Adornee = vis.folder,
					FillTransparency = 1,
					OutlineColor = accentColor,
					OutlineTransparency = 0.3,
					DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
					Parent = vis.folder,
				})

				local function makePoint()
					local pt = create("Part", {
						Anchored = true,
						CanCollide = false,
						CanQuery = false,
						CanTouch = false,
						Transparency = 1,
						Size = Vector3.new(0.1, 0.1, 0.1),
						Parent = vis.folder,
					})
					return create("Attachment", { Parent = pt }), pt
				end

				local a0, p0 = makePoint()
				local a1, p1 = makePoint()
				vis.p0, vis.p1 = p0, p1
				create("Beam", {
					Attachment0 = a0,
					Attachment1 = a1,
					FaceCamera = true,
					LightEmission = 1,
					LightInfluence = 0,
					Width0 = 0.14,
					Width1 = 0.14,
					Segments = 1,
					Color = ColorSequence.new(accentColor),
					Transparency = NumberSequence.new(0.15, 0.55),
					Parent = p0,
				})
			end

			pcall(function()
				RunService:UnbindFromRenderStep("RockHubDesyncVis")
			end)
			RunService:BindToRenderStep("RockHubDesyncVis", Enum.RenderPriority.First.Value + 1, function()
				local char = player.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not (desyncCfg.on or desync.force) or not desyncCfg.tracer or desync.pause > 0 or desync.gunHold or not hrp or not desync.fakeCF then
					if vis.folder then
						clearGhost()
					end
					return
				end
				if vis.char ~= char or not vis.folder or not vis.folder.Parent then
					buildGhost(char)
				end
				local fakeCF = desync.fakeCF
				local rootCf = hrp.CFrame
				for src, g in pairs(vis.parts) do
					if src.Parent then
						g.CFrame = fakeCF * rootCf:ToObjectSpace(src.CFrame)
					end
				end
				vis.p0.CFrame = rootCf
				vis.p1.CFrame = fakeCF
			end)
			table.insert(connections, {
				Disconnect = function()
					pcall(function()
						RunService:UnbindFromRenderStep("RockHubDesyncVis")
					end)
					clearGhost()
				end,
			})
			table.insert(connections, {
				Disconnect = function()
					pcall(function()
						RunService:UnbindFromRenderStep("RockHubDesync")
					end)
				end,
			})
			local sec = addSection(combatTab, "Desync")
			sec:Toggle("Enable", "rock hub exclusive", function(on)
				desyncCfg.on = on
				desync.on = on
				fakePos = nil
				if not on then
					desync.fakeCF = nil
				end
				notify("Desync: " .. (on and "On" or "Off"), on and "you're everywhere and nowhere" or "back to normal")
			end)
			local tracerToggle = sec:Toggle("Tracer", "show where others see you", function(on)
				desyncCfg.tracer = on
			end)
			tracerToggle.Set(true, true)
		end
		do
			local page = playersTab.page
			playersTab.custom = true
			local cards = {}
			local roleCache = {}
			local roleRemote
			local spectating
			local bangTarget, bangTrack
			local bangStarted = 0

			local function roleOf(p)
				if findTool(p, "Knife") then
					return "Murderer", Color3.fromRGB(255, 80, 80)
				end
				if findTool(p, "Gun") then
					return "Sheriff", Color3.fromRGB(80, 160, 255)
				end
				local role = roleCache[p.Name]
				if role == "Murderer" then
					return "Murderer", Color3.fromRGB(255, 80, 80)
				end
				if role == "Sheriff" or role == "Hero" then
					return role, Color3.fromRGB(80, 160, 255)
				end
				return "Innocent", dimColor
			end

			local function stopSpectate()
				spectating = nil
				local hum = getHumanoid()
				local cam = workspace.CurrentCamera
				if hum and cam then
					cam.CameraType = Enum.CameraType.Custom
					cam.CameraSubject = hum
				end
			end

			local function toggleSpectate(target)
				if spectating == target then
					stopSpectate()
					notify("Spectate", "back to your character")
					return
				end
				local char = target.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hum then
					notify("Spectate", "player is not alive")
					return
				end
				spectating = target
				workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				workspace.CurrentCamera.CameraSubject = hum
				notify("Spectate", target.DisplayName)
			end

			local function stopBang()
				bangTarget = nil
				if bangTrack then
					pcall(function()
						bangTrack:Stop(0.15)
						bangTrack:Destroy()
					end)
					bangTrack = nil
				end
			end

			local function toggleBang(target)
				if bangTarget == target then
					stopBang()
					notify("Bang", "stopped")
					return
				end
				local targetChar = target.Character
				local targetHum = targetChar and targetChar:FindFirstChildOfClass("Humanoid")
				local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
				local hum = getHumanoid()
				if not (targetHum and targetHum.Health > 0 and targetRoot and hum and hum.Health > 0) then
					notify("Bang", "player is not available")
					return
				end
				stopBang()
				bangTarget = target
				bangStarted = os.clock()
				local anim = Instance.new("Animation")
				anim.AnimationId = hum.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"
				local ok, track = pcall(function()
					return (hum:FindFirstChildOfClass("Animator") or hum):LoadAnimation(anim)
				end)
				anim:Destroy()
				if ok and track then
					track.Priority = Enum.AnimationPriority.Action4
					track.Looped = true
					track:Play(0.15)
					bangTrack = track
				end
				notify("Bang", target.DisplayName .. " - press again to stop")
			end

			connect(RunService.Heartbeat, function()
				if spectating then
					local char = spectating.Character
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if not hum or hum.Health <= 0 then
						stopSpectate()
					end
				end
				if not bangTarget then
					return
				end
				local myChar, targetChar = player.Character, bangTarget.Character
				local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
				local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
				local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
				local targetHum = targetChar and targetChar:FindFirstChildOfClass("Humanoid")
				if not (myRoot and myHum and myHum.Health > 0 and targetRoot and targetHum and targetHum.Health > 0) then
					stopBang()
					return
				end
				local pulse = math.sin((os.clock() - bangStarted) * 12) * 0.18
				myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 1.15 + pulse)
				myRoot.AssemblyLinearVelocity = Vector3.zero
			end)

			local function actionButton(parent, text, x, width, callback)
				local button = create("TextButton", {
					Text = text,
					Font = Enum.Font.GothamBold,
					TextSize = 9,
					TextColor3 = textColor,
					BackgroundColor3 = bgColor,
					AutoButtonColor = false,
					Position = UDim2.fromOffset(x, 54),
					Size = UDim2.fromOffset(width, 22),
					Parent = parent,
				})
				addCorner(button, 6)
				local stroke = addStroke(button)
				connect(button.MouseEnter, function()
					tween(button, 0.15, { BackgroundColor3 = hoverColor, TextColor3 = accentColor })
					tween(stroke, 0.15, { Color = accentColor })
				end)
				connect(button.MouseLeave, function()
					tween(button, 0.15, { BackgroundColor3 = bgColor, TextColor3 = textColor })
					tween(stroke, 0.15, { Color = strokeColor })
				end)
				connect(button.MouseButton1Click, function()
					task.spawn(callback)
				end)
				return button
			end

			local function refreshCards()
				for _, card in pairs(cards) do
					card.frame:Destroy()
				end
				table.clear(cards)
				local list = Players:GetPlayers()
				table.sort(list, function(a, b)
					return a.DisplayName:lower() < b.DisplayName:lower()
				end)
				local y = 48
				for _, target in ipairs(list) do
					if target == player then
						continue
					end
					local frame = create("Frame", {
						Position = UDim2.fromOffset(0, y),
						Size = UDim2.new(1, -8, 0, 84),
						BackgroundColor3 = panelColor,
						Parent = page,
					})
					addCorner(frame, 9)
					addStroke(frame)
					local avatar = create("ImageLabel", {
						Image = "",
						BackgroundColor3 = elemColor,
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, -8, 0.5, 0),
						Size = UDim2.fromOffset(66, 66),
						Parent = frame,
					})
					addCorner(avatar, 9)
					addStroke(avatar)
					create("TextLabel", {
						Text = target.DisplayName,
						Font = Enum.Font.GothamBold,
						TextSize = 14,
						TextColor3 = accentColor,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(12, 7),
						Size = UDim2.new(1, -240, 0, 17),
						Parent = frame,
					})
					create("TextLabel", {
						Text = "@" .. target.Name,
						Font = Enum.Font.Gotham,
						TextSize = 10,
						TextColor3 = mutedColor,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(12, 25),
						Size = UDim2.new(1, -240, 0, 14),
						Parent = frame,
					})
					local roleLabel = create("TextLabel", {
						Text = "Innocent",
						Font = Enum.Font.GothamBold,
						TextSize = 10,
						TextColor3 = dimColor,
						TextXAlignment = Enum.TextXAlignment.Right,
						BackgroundTransparency = 1,
						Position = UDim2.new(1, -218, 0, 10),
						Size = UDim2.fromOffset(130, 16),
						Parent = frame,
					})
					actionButton(frame, "FLING", 12, 54, function()
						if playerFlingAction then
							playerFlingAction(target)
						end
					end)
					actionButton(frame, "SPECTATE", 72, 68, function()
						toggleSpectate(target)
					end)
					actionButton(frame, "BANG", 146, 50, function()
						toggleBang(target)
					end)
					actionButton(frame, "KILL", 202, 48, function()
						if findTool(player, "Knife") and playerKnifeKill then
							playerKnifeKill(target)
						elseif findTool(player, "Gun") and playerGunKill then
							playerGunKill(target)
						else
							notify("Kill", "you need the knife or gun")
						end
					end)
					cards[target] = { frame = frame, role = roleLabel }
					task.spawn(function()
						local ok, image = pcall(Players.GetUserThumbnailAsync, Players, target.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
						if ok and frame.Parent then
							avatar.Image = image
						end
					end)
					y += 92
				end
				page.CanvasSize = UDim2.fromOffset(0, y + 8)
			end

			connect(Players.PlayerAdded, refreshCards)
			connect(Players.PlayerRemoving, function(leaving)
				if spectating == leaving then
					stopSpectate()
				end
				if bangTarget == leaving then
					stopBang()
				end
				task.defer(refreshCards)
			end)
			task.spawn(function()
				while gui.Parent do
					if currentTab == playersTab then
						if not roleRemote or not roleRemote.Parent then
							roleRemote = game:GetService("ReplicatedStorage"):FindFirstChild("GetPlayerData", true)
						end
						if roleRemote and roleRemote:IsA("RemoteFunction") then
							local ok, data = pcall(roleRemote.InvokeServer, roleRemote)
							if ok and type(data) == "table" then
								local nextRoles = {}
								for name, info in pairs(data) do
									if type(info) == "table" and type(info.Role) == "string" and not info.Dead and not info.Killed then
										nextRoles[name] = info.Role
									end
								end
								roleCache = nextRoles
							end
						end
						for target, card in pairs(cards) do
							if target.Parent and card.frame.Parent then
								local role, color = roleOf(target)
								card.role.Text = role
								card.role.TextColor3 = color
							end
						end
					end
					task.wait(1)
				end
			end)
			refreshCards()

			stopPlayersActions = function()
				stopSpectate()
				stopBang()
			end
		end
		do
			local baseSize = UDim2.new(0.55, 0, 0, 0)
			local bar = create("Frame", {
				Name = "Search",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 1, 10),
				Size = baseSize + UDim2.fromOffset(0, 32),
				BackgroundColor3 = bgColor,
				ZIndex = 20,
				Parent = main,
			})
			addCorner(bar, 10)
			local barStroke = create("UIStroke", { Color = accentColor, Transparency = 0.45, Thickness = 1, Parent = bar })
			addGradient(barStroke)
			local barScale = create("UIScale", { Parent = bar })
			local icon = create("Frame", {
				Position = UDim2.fromOffset(12, 9.5),
				Size = UDim2.fromOffset(13, 13),
				BackgroundTransparency = 1,
				ZIndex = 21,
				Parent = bar,
			})
			local ring = create("Frame", { Size = UDim2.fromOffset(9, 9), BackgroundTransparency = 1, ZIndex = 21, Parent = icon })
			makeRound(ring)
			local ringStroke = create("UIStroke", { Color = dimColor, Thickness = 1.5, Parent = ring })
			local handle = line(icon, 7.8, 7.8, 12, 12, 1.5, dimColor)
			handle.ZIndex = 21
			local iconScale = create("UIScale", { Parent = icon })
			local box = create("TextBox", {
				Text = "",
				PlaceholderText = "Search...",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = accentColor,
				PlaceholderColor3 = mutedColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(32, 0),
				Size = UDim2.new(1, -100, 1, 0),
				ZIndex = 21,
				Parent = bar,
			})
			local hint = create("TextLabel", {
				Text = "Ctrl  F",
				Font = Enum.Font.GothamBold,
				TextSize = 9,
				TextColor3 = dimColor,
				BackgroundColor3 = elemColor,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -8, 0.5, 0),
				Size = UDim2.fromOffset(46, 18),
				Visible = UserInputService.KeyboardEnabled,
				ZIndex = 21,
				Parent = bar,
			})
			addCorner(hint, 5)
			addStroke(hint)
			local resultLabel = create("TextLabel", {
				Text = "",
				Font = Enum.Font.GothamMedium,
				TextSize = 10,
				TextColor3 = dimColor,
				TextXAlignment = Enum.TextXAlignment.Right,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -12, 0.5, 0),
				Size = UDim2.fromOffset(80, 18),
				Visible = false,
				ZIndex = 21,
				Parent = bar,
			})

			local function countMatches(tab)
				if tab.custom then
					return 0
				end
				local n = 0
				for _, sec in ipairs(tab.sections) do
					for _, item in ipairs(sec.items) do
						if matchesSearch(item, sec, tab) then
							n += 1
						end
					end
				end
				return n
			end

			local function firstMatch(tab)
				for _, sec in ipairs(tab.sections) do
					if sec.card.Visible then
						for _, item in ipairs(sec.items) do
							if item.row.Visible then
								return item.row
							end
						end
					end
				end
			end

			local function flash(row)
				if not row then
					return
				end
				local st = create("UIStroke", { Color = accentColor, Thickness = 2, Parent = row })
				local glow = create("Frame", {
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = accentColor,
					BackgroundTransparency = 0.8,
					BorderSizePixel = 0,
					ZIndex = 3,
					Parent = row,
				})
				addCorner(glow, 7)
				task.delay(0.15, function()
					tween(glow, 0.9, { BackgroundTransparency = 1 })
					tween(st, 1.2, { Transparency = 1 })
				end)
				task.delay(1.4, function()
					st:Destroy()
					glow:Destroy()
				end)
			end

			local function apply()
				local q = box.Text:lower():gsub("^%s+", ""):gsub("%s+$", "")
				if q == "" then
					searchTerms = nil
					resultLabel.Visible = false
					hint.Visible = UserInputService.KeyboardEnabled and not box:IsFocused()
					for _, t in ipairs(tabs) do
						layoutTab(t)
					end
					return
				end
				local words = {}
				for w in q:gmatch("%S+") do
					table.insert(words, w)
				end
				searchTerms = words
				hint.Visible = false
				local total, best, bestCount = 0, nil, 0
				for _, t in ipairs(tabs) do
					local n = countMatches(t)
					total += n
					if n > bestCount then
						best, bestCount = t, n
					end
				end
				if currentTab and countMatches(currentTab) == 0 and best then
					selectTab(best)
				end
				for _, t in ipairs(tabs) do
					layoutTab(t)
				end
				if currentTab then
					currentTab.page.CanvasPosition = Vector2.zero
				end
				resultLabel.Visible = true
				resultLabel.Text = total == 0 and "nothing" or total .. " found"
				resultLabel.TextColor3 = total == 0 and Color3.fromRGB(255, 120, 120) or dimColor
			end

			connect(box:GetPropertyChangedSignal("Text"), apply)
			connect(box.Focused, function()
				tween(barStroke, 0.2, { Transparency = 0 })
				tween(ringStroke, 0.2, { Color = accentColor })
				tween(handle, 0.2, { BackgroundColor3 = accentColor })
				iconScale.Scale = 0.8
				tween(iconScale, 0.35, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				barScale.Scale = 0.97
				tween(barScale, 0.3, { Scale = 1 }, Enum.EasingDirection.Out, Enum.EasingStyle.Back)
				hint.Visible = false
			end)
			connect(box.FocusLost, function(enter)
				tween(barStroke, 0.2, { Transparency = 0.45 })
				tween(ringStroke, 0.2, { Color = dimColor })
				tween(handle, 0.2, { BackgroundColor3 = dimColor })
				if box.Text == "" then
					hint.Visible = UserInputService.KeyboardEnabled
				end
				if enter and searchTerms and currentTab then
					flash(firstMatch(currentTab))
				end
			end)
			connect(UserInputService.InputBegan, function(input)
				if input.UserInputType ~= Enum.UserInputType.Keyboard then
					return
				end
				local k = input.KeyCode
				if k == Enum.KeyCode.F and (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) or UserInputService:IsKeyDown(Enum.KeyCode.LeftSuper) or UserInputService:IsKeyDown(Enum.KeyCode.RightSuper)) then
					if not menuOpen then
						setMenuOpen(true)
					end
					task.defer(function()
						box:CaptureFocus()
					end)
					return
				end
				if k == Enum.KeyCode.Escape and (box:IsFocused() or box.Text ~= "") then
					box.Text = ""
					box:ReleaseFocus()
				end
			end)
		end
		selectTab(mainTab)
		for _, r in ipairs(registry) do
			local v = config[r.key]
			if v ~= nil then
				pcall(r.set, v)
			end
		end
		dirty = false
		loading = false

		_G.RockHubUnload = function()
			for _, c in ipairs(connections) do
				c:Disconnect()
			end
			table.clear(connections)
			keyListener = nil
			if stopShader then
				pcall(stopShader)
			end
			if stopEsp then
				pcall(stopEsp)
			end
			if stopSpin then
				pcall(stopSpin)
			end
			if stopRoleFling then
				pcall(stopRoleFling)
			end
			if stopPlayersActions then
				pcall(stopPlayersActions)
			end
			pcall(disableNoclip)
			pcall(disableAntiFling)
			if stopVoteDupe then
				pcall(stopVoteDupe)
			end
			if stopBunnyModel then
				pcall(stopBunnyModel)
			end
			if stopAvatar then
				pcall(stopAvatar)
			end
			if stopAura then
				pcall(stopAura)
			end
			if stopOrbs then
				pcall(stopOrbs)
			end
			if stopSkyWorms then
				pcall(stopSkyWorms)
			end
			if stopCursor then
				pcall(stopCursor)
			end
			if stopAwm then
				pcall(stopAwm)
			end
			if stopSkinChanger then
				pcall(stopSkinChanger)
			end
			if dirty then
				saveConfig()
			end
			if stopBackTrack then
				pcall(stopBackTrack)
			end
			if stopAnims then
				pcall(stopAnims)
			end
			if lobbyBrand then
				lobbyBrand:Destroy()
				lobbyBrand = nil
			end
			local hum = getHumanoid()
			if hum then
				if charMods.speed then
					hum.WalkSpeed = 16
				end
				if charMods.jump then
					hum.JumpPower = 50
				end
			end
			blur:Destroy()
			gui:Destroy()
			_G.RockHubUnload = nil
		end

		local TextService2 = game:GetService("TextService")

		local function playIntro()
			introPlaying = true
			gui.IgnoreGuiInset = true
			local overlay = create("Frame", {
				Name = "Intro",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 200,
				Parent = gui,
			})
			local center = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(420, 130),
				BackgroundTransparency = 1,
				Parent = overlay,
			})
			local introViewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(420, 130)
			create("UIScale", { Scale = math.clamp((introViewport.X - 24) / 420, 0.55, 1), Parent = center })
			local font = Enum.Font.GothamBlack
			local widths, total = {}, 0
			for i = 1, #"ROCK HUB" do
				local ch = ("ROCK HUB"):sub(i, i)
				local w = ch == " " and 16.099999999999998 or TextService2:GetTextSize(ch, 46, font, Vector2.new(200, 200)).X
				widths[i] = w
				total += w + (i < #"ROCK HUB" and 4 or 0)
			end
			local left = (420 - total) / 2
			local letters = {}
			local x = left
			for i = 1, #"ROCK HUB" do
				local ch = ("ROCK HUB"):sub(i, i)
				if ch ~= " " then
					local holder = create("Frame", {
						Position = UDim2.fromOffset(x, 14),
						Size = UDim2.fromOffset(widths[i], 56),
						BackgroundTransparency = 1,
						Parent = center,
					})
					local lbl = create("TextLabel", {
						Text = ch,
						Font = font,
						TextSize = 46,
						TextColor3 = accentColor,
						TextTransparency = 1,
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(0, -26),
						Size = UDim2.fromScale(1, 1),
						Parent = holder,
					})
					local scale = create("UIScale", { Scale = 1.6, Parent = lbl })
					table.insert(letters, { lbl = lbl, sc = scale, i = i })
				end
				x += widths[i] + 4
			end
			local bar = create("Frame", {
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 86),
				Size = UDim2.fromOffset(0, 2),
				BackgroundColor3 = strokeColor,
				BorderSizePixel = 0,
				Parent = center,
			})
			makeRound(bar)
			local fill = create("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = accentColor, BorderSizePixel = 0, Parent = bar })
			makeRound(fill)
			local grad = create("UIGradient", { Parent = fill })
			local status = create("TextLabel", {
				Text = "",
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = dimColor,
				TextTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(left, 96),
				Size = UDim2.fromOffset(total - 44, 16),
				Parent = center,
			})
			local percent = create("TextLabel", {
				Text = "0%",
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = textColor,
				TextTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Right,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(left + total - 44, 96),
				Size = UDim2.fromOffset(44, 16),
				Parent = center,
			})
			local startTime = os.clock()
			local animConn = connect(RunService.RenderStepped, function()
				local t = os.clock() - startTime
				for _, letter in ipairs(letters) do
					local v = 0.5 + 0.5 * math.sin(t * 3 - letter.i * 0.55)
					local c = math.floor(110 + v * 145)
					letter.lbl.TextColor3 = Color3.fromRGB(c, c, c)
				end
				grad.Color = shimmerSeq(t * 0.6)
			end)
			local progress = Instance.new("NumberValue")
			progress.Changed:Connect(function(v)
				percent.Text = math.floor(v * 100 + 0.5) .. "%"
			end)
			local easeOut, easeIn, easeInOut = Enum.EasingDirection.Out, Enum.EasingDirection.In, Enum.EasingDirection.InOut
			tween(overlay, 0.4, { BackgroundTransparency = 0.35 })
			tween(blur, 0.5, { Size = 24 })
			task.wait(0.3)
			for _, letter in ipairs(letters) do
				tween(letter.lbl, 0.55, { TextTransparency = 0, Position = UDim2.fromOffset(0, 0) }, easeOut, Enum.EasingStyle.Back)
				tween(letter.sc, 0.55, { Scale = 1 }, easeOut, Enum.EasingStyle.Back)
				task.wait(0.06)
			end
			task.wait(0.3)
			tween(bar, 0.45, { Size = UDim2.fromOffset(total, 2) }, easeOut, Enum.EasingStyle.Quint)
			tween(status, 0.3, { TextTransparency = 0 })
			tween(percent, 0.3, { TextTransparency = 0 })
			task.wait(0.35)
			local steps = {
				{ "loading interface", 0.3 },
				{ "loading movement", 0.55 },
				{ "loading visuals", 0.8 },
				{ "done", 1 },
			}
			for _, s in ipairs(steps) do
				if not gui.Parent then
					break
				end
				status.Text = s[1]
				tween(fill, 0.45, { Size = UDim2.fromScale(s[2], 1) }, easeInOut)
				tween(progress, 0.45, { Value = s[2] }, easeInOut)
				task.wait(0.5)
			end
			status.Text = "welcome, " .. player.DisplayName
			task.wait(0.6)
			for _, letter in ipairs(letters) do
				tween(letter.lbl, 0.35, { TextTransparency = 1, Position = UDim2.fromOffset(0, -18) }, easeIn)
				task.wait(0.03)
			end
			tween(status, 0.3, { TextTransparency = 1 })
			tween(percent, 0.3, { TextTransparency = 1 })
			tween(bar, 0.35, { Size = UDim2.fromOffset(0, 2) }, easeIn, Enum.EasingStyle.Quint)
			tween(fill, 0.3, { BackgroundTransparency = 1 })
			tween(overlay, 0.45, { BackgroundTransparency = 1 })
			task.wait(0.25)
			introPlaying = false
			if not gui.Parent then
				return
			end
			gui.IgnoreGuiInset = false
			pcall(function()
				gui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
				gui.ClipToDeviceSafeArea = true
			end)
			updateResponsiveScale()
			setMenuOpen(true)
			task.wait(0.4)
			animConn:Disconnect()
			progress:Destroy()
			overlay:Destroy()
		end

		task.spawn(playIntro)
	end)(...)
end)(...)