--жир жир жир 
--k3suu1 толстый
--скид паста паста круто круто
--k3suu1 лох

local ok, result = pcall(function()
	local index = {
		Renders = {},
		RenderMetadata = {},
		Connections = {},
		Keybinds = {},
		Folder = "mellstroyhook",
		Assets = "assets",
		Configs = "configs",
	}

	local tbl = {}
	local index2 = {}
	local index3 = {}
	index.__index = index
	index2.__index = index2
	index3.__index = index3
	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local GuiService = game:GetService("GuiService")
	local CoreGui = game:GetService("CoreGui")

	pcall(function()
		local localPlayer = game:GetService("Players").LocalPlayer
		if not localPlayer then
			return
		end
		local genv = type(getgenv) == "function" and getgenv() or _G
		local mellstroyAntiIdleConnection = genv.__MellstroyAntiIdleConnection

		if typeof(mellstroyAntiIdleConnection) == "RBXScriptConnection" then
			pcall(function()
				mellstroyAntiIdleConnection:Disconnect()
			end)
		end

		if type(getconnections) == "function" then
			pcall(function()
				for _, v in ipairs(getconnections(localPlayer.Idled)) do
					pcall(function()
						v:Disable()
					end)

					pcall(function()
						v:Disconnect()
					end)
				end
			end)
		end

		local VirtualUser = game:GetService("VirtualUser")

		genv.__MellstroyAntiIdleConnection = localPlayer.Idled:Connect(function()
			pcall(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.zero)
			end)
		end)

		genv.__MellstroyAntiIdleEnabled = true
	end)

	local executorName = "unknown"

	pcall(function()
		local flag = type(identifyexecutor) == "function" and identifyexecutor or type(getexecutorname) == "function" and getexecutorname

		if flag then
			local v = flag()

			if type(v) == "string" and v ~= "" then
				executorName = v
			end
		end
	end)

	local isDeltaExecutor = string.find(string.lower(executorName), "delta", 1, true) ~= nil

	pcall(function()
		if getgenv().__MellstroyForceDeltaMobile == true then
			isDeltaExecutor = true
			executorName = "Delta (layout test)"
		end
	end)

	index.ExecutorName = executorName
	index.IsDeltaExecutor = isDeltaExecutor
	index.DiscordInviteCode = "C2fy7qc2dx"
	index.DiscordInviteURL = "https://discord.gg/" .. index.DiscordInviteCode

	local function fn()
		local discordInviteURL = index.DiscordInviteURL
		local flag = type(setclipboard) == "function" and setclipboard or type(toclipboard) == "function" and toclipboard

		if type(flag) == "function" then
			if pcall(flag, discordInviteURL) then
				warn("[mellstroyhook] Discord invite copied: " .. discordInviteURL)
			end
		end

		local genv = type(getgenv) == "function" and getgenv() or nil

		if type(genv) == "table" then
			if genv.__MellstroyDiscordInviteAttempted then
				return
			end
			genv.__MellstroyDiscordInviteAttempted = true
		end

		local request_ = type(request) == "function" and request or type(http_request) == "function" and http_request or type(syn) == "table" and type(syn.request) == "function" and syn.request or type(http) == "table" and type(http.request) == "function" and http.request or type(fluxus) == "table" and type(fluxus.request) == "function" and fluxus.request or type(krnl) == "table" and type(krnl.request) == "function" and krnl.request
		local flag2 = false

		if type(request_) == "function" then
			pcall(function()
				local HttpService = game:GetService("HttpService")
				local json = HttpService:JSONEncode({ cmd = "INVITE_BROWSER", args = { code = index.DiscordInviteCode }, nonce = HttpService:GenerateGUID(false) })

				for i = 6463, 6472 do
					local ok, result = pcall(function()
						local v = request_({
							Url = "http://127.0.0.1:" .. i .. "/rpc?v=1",
							Method = "POST",
							Headers = { ["Content-Type"] = "application/json", Origin = "https://discord.com" },
							Body = json,
						})

						local flag3 = type(v) == "table"

						if flag3 then
							flag3 = tonumber(v.StatusCode or v.Status or v.status_code)
						end

						return flag3
					end)

					if ok and result and result >= 200 and result < 300 then
						flag2 = true
						break
					end
				end
			end)
		end
	end

	pcall(function()
		task.spawn(function()
			pcall(fn)
		end)
	end)

	index.FontFace = Font.fromEnum(Enum.Font.SourceSans)
	index.FontFaceBold = Font.fromEnum(Enum.Font.SourceSansBold)

	pcall(function()
		if type(isfile) ~= "function" or type(writefile) ~= "function" then
			return
		end
		local str = index.Folder .. "/fonts"

		if type(makefolder) == "function" then
			pcall(makefolder, index.Folder)
			pcall(makefolder, str)
		end

		local HttpService = game:GetService("HttpService")
		local str2 = "https://raw.githubusercontent.com/idanoob64/mm2/main/fonts/"

		local function fn2(arg, arg2)
			if type(arg2) ~= "string" then
				return false
			end

			if string.sub(arg, -4) == ".ttf" then
				local str3 = string.sub(arg2, 1, 4)
				return #arg2 >= 1000 and (str3 == string.char(0, 1, 0, 0) or str3 == "OTTO" or str3 == "ttcf")
			end

			local ok, result = pcall(function()
				return HttpService:JSONDecode(arg2)
			end)

			return ok and type(result) == "table" and type(result.name) == "string" and result.name ~= "" and type(result.faces) == "table" and #result.faces > 0
		end

		for _, v in ipairs({
			"Verdana.ttf",
			"Verdana-Bold.ttf",
			"Verdana.font.json",
			"TahomaXP.ttf",
			"TahomaXP.font.json",
			"ProggyTiny.ttf",
			"ProggyTiny.font.json",
		}) do
			pcall(function()
				local str3 = str .. "/" .. v
				if isfile(str3) then
					return
				end
				local response = game:HttpGet(str2 .. v)

				if fn2(v, response) then
					writefile(str3, response)
				end
			end)
		end
	end)

	local function fn2(arg, arg2)
		local v = getcustomasset or getsynasset
		local str = index.Folder .. "/fonts/" .. arg
		if type(isfile) ~= "function" or type(writefile) ~= "function" or type(v) ~= "function" or not isfile(str) then
			return nil
		end
		local ok, result = pcall(v, str)
		if not ok then
			return nil
		end
		local str2 = str .. ".font.json"

		local json = game:GetService("HttpService"):JSONEncode({
			name = "Juju " .. arg,
			faces = { { name = "Regular", weight = arg2, style = "normal", assetId = result } },
		})

		if not pcall(writefile, str2, json) then
			return nil
		end
		local ok2, result2 = pcall(v, str2)
		if not ok2 then
			return nil
		end
		local ok3, result3 = pcall(Font.new, result2, arg2 == 700 and Enum.FontWeight.Bold or Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
		return ok3 and result3 or nil
	end

	index.FontFace = fn2("Menu-Semibold.ttf", 600) or index.FontFace
	index.FontFaceBold = fn2("Menu-Bold.ttf", 700) or index.FontFaceBold

	tbl.RenderObject = function(arg, arg2, arg3, arg4)
		local instance = Instance.new(arg2)
		local flag = arg3 and typeof(arg3) == "table" and arg3.PreserveTextStyle == true

		if arg3 and typeof(arg3) == "table" then
			for k, v in pairs(arg3) do
				if k ~= "RenderTime" and k ~= "PreserveTextStyle" then
					instance[k] = v
				end
			end
		end

		if not flag and index.FontFace and (instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox")) then
			instance.FontFace = instance.RichText and type(instance.Text) == "string" and string.find(instance.Text, "<b>", 1, true) ~= nil and index.FontFaceBold or index.FontFace
			instance.TextSize = 13
		end

		local tbl2 = {}

		if instance:IsA("GuiObject") then
			tbl2.BackgroundTransparency = instance.BackgroundTransparency
		end

		if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
			tbl2.ImageTransparency = instance.ImageTransparency
		end

		if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
			tbl2.TextTransparency = instance.TextTransparency
			tbl2.TextStrokeTransparency = instance.TextStrokeTransparency
		end

		if instance:IsA("ScrollingFrame") then
			tbl2.ScrollBarImageTransparency = instance.ScrollBarImageTransparency
		end

		if instance:IsA("UIStroke") then
			tbl2.Transparency = instance.Transparency
		end

		index.RenderMetadata[instance] = {
			Hidden = arg4 == true,
			OpenProperties = next(tbl2) and tbl2 or nil,
			RenderTime = arg3 and tonumber(arg3.RenderTime) or nil,
		}

		instance.Destroying:Once(function()
			index.RenderMetadata[instance] = nil
		end)

		return instance
	end

	tbl.CreateConnection = function(arg, arg2, arg3)
		local connection = arg2:Connect(arg3)
		index.Connections[#index.Connections + 1] = connection
		return connection
	end

	tbl.MouseLocation = function(arg, arg2)
		if arg2 then
			return Vector2.new(arg2.Position.X, arg2.Position.Y)
		end
		local mouseLocation = UserInputService:GetMouseLocation()
		local guiInset = GuiService:GetGuiInset()
		return Vector2.new(mouseLocation.X - guiInset.X, mouseLocation.Y - guiInset.Y)
	end

	tbl.IsPointInGui = function(arg, arg2, arg3)
		if not arg2 or not arg2.Parent then
			return false
		end
		local absolutePosition = arg2.AbsolutePosition
		local absoluteSize = arg2.AbsoluteSize
		return arg3.X >= absolutePosition.X and arg3.X <= absolutePosition.X + absoluteSize.X and arg3.Y >= absolutePosition.Y and arg3.Y <= absolutePosition.Y + absoluteSize.Y
	end

	tbl.Serialise = function(arg, arg2)
		local str = ""

		for _, v in pairs(arg2) do
			str ..= v .. ", "
		end

		return str:sub(0, #str - 2)
	end

	tbl.Sort = function(arg, arg2, arg3)
		local tbl2 = {}

		for k, v in pairs(arg3) do
			if table.find(arg2, k) then
				tbl2[#tbl2 + 1] = v
			end
		end

		return tbl2
	end

	index.CreateWindow = function()
		local tbl2 = {
			Pages = {},
			CleanupCallbacks = {},
			Keybinds = {},
			KeybindConfig = {},
			ConfigControls = {},
			ConfigControlCounts = {},
			MobileBindings = {},
			KeybindListEnabled = true,
			WatermarkEnabled = true,
			Accent = Color3.fromRGB(145, 200, 64),
			OverlayAccent = Color3.fromRGB(100, 120, 255),
			OverlayFontFace = Font.fromEnum(Enum.Font.Arial),
			IsMobile = isDeltaExecutor,
			Enabled = true,
			Key = Enum.KeyCode.Insert,
			UnloadKey = Enum.KeyCode.End,
		}

		local v = getcustomasset or getsynasset
		local str = index.Folder .. "/fonts/Verdana.ttf"
		local str2 = index.Folder .. "/fonts/Verdana.font.json"

		if type(isfile) == "function" and type(writefile) == "function" and type(v) == "function" and isfile(str) then
			local ok, result = pcall(v, str)

			if ok then
				local json = game:GetService("HttpService"):JSONEncode({
					name = "Verdana",
					faces = { { name = "Regular", weight = 400, style = "normal", assetId = result } },
				})

				if pcall(writefile, str2, json) then
					local ok2, result2 = pcall(v, str2)

					if ok2 then
						local ok3, overlayFontFace = pcall(Font.new, result2, Enum.FontWeight.Regular, Enum.FontStyle.Normal)

						if ok3 then
							tbl2.OverlayFontFace = overlayFontFace
						end
					end
				end
			end
		end

		local ScreenGui = tbl:RenderObject("ScreenGui", {
			DisplayOrder = 9999,
			Enabled = true,
			IgnoreGuiInset = true,
			Parent = CoreGui,
			ResetOnSpawn = false,
			ZIndexBehavior = "Global",
		})

		local Frame = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = ScreenGui,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1),
		}, true)

		local obj = setmetatable({}, { __mode = "k" })
		local str3 = index.Folder .. "/" .. index.Configs .. "/keybinds.json"
		local tbl3 = { "Always", "Hold", "Toggle", "Off Hold" }
		local tbl4 = { Always = "always", Hold = "holding", Toggle = "toggled", ["Off Hold"] = "off hold" }

		local tbl5 = {
			MouseButton1 = "M1",
			MouseButton2 = "M2",
			MouseButton3 = "M3",
			LeftAlt = "LALT",
			RightAlt = "RALT",
			LeftControl = "LCTRL",
			RightControl = "RCTRL",
			LeftShift = "LSHIFT",
			RightShift = "RSHIFT",
			CapsLock = "CAPS",
			Backspace = "BACK",
			Delete = "DEL",
			Insert = "INS",
			PageUp = "PGUP",
			PageDown = "PGDN",
		}

		local CanvasGroup = tbl:RenderObject("CanvasGroup", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = 1,
			Parent = ScreenGui,
			Position = UDim2.fromOffset(18, 300),
			Size = UDim2.fromOffset(165, 22),
			Visible = false,
			ZIndex = 80,
		})

		local TextButton = tbl:RenderObject("TextButton", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.35,
			BorderSizePixel = 0,
			FontFace = tbl2.OverlayFontFace,
			Parent = CanvasGroup,
			Position = UDim2.fromOffset(0, 2),
			PreserveTextStyle = true,
			Size = UDim2.new(1, 0, 0, 20),
			Text = "keybinds",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 13,
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 1,
			ZIndex = 82,
		})

		tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FontFace = tbl2.OverlayFontFace,
			Parent = TextButton,
			Position = UDim2.fromOffset(1, 1),
			PreserveTextStyle = true,
			Size = UDim2.fromScale(1, 1),
			Text = "keybinds",
			TextColor3 = Color3.fromRGB(0, 0, 0),
			TextSize = 13,
			TextStrokeTransparency = 1,
			ZIndex = 83,
		})

		tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FontFace = tbl2.OverlayFontFace,
			Parent = TextButton,
			PreserveTextStyle = true,
			Size = UDim2.fromScale(1, 1),
			Text = "keybinds",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 13,
			TextStrokeTransparency = 1,
			ZIndex = 84,
		})

		tbl:RenderObject("Frame", {
			BackgroundColor3 = tbl2.OverlayAccent,
			BorderSizePixel = 0,
			Parent = CanvasGroup,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.new(1, 0, 0, 2),
			ZIndex = 85,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = CanvasGroup,
			Position = UDim2.fromOffset(0, 25),
			Size = UDim2.new(1, 0, 0, 0),
			ZIndex = 81,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = ScreenGui,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1),
			Visible = tbl2.IsMobile,
			ZIndex = 200,
		}, true)

		tbl:RenderObject("UIListLayout", {
			Parent = Frame2,
			FillDirection = "Vertical",
			HorizontalAlignment = "Center",
			Padding = UDim.new(0, 0),
			SortOrder = "LayoutOrder",
		})

		local v2 = tbl
		local renderObject = v2.RenderObject

		local frame = renderObject(v2, "Frame", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.35,
			BorderSizePixel = 0,
			Parent = ScreenGui,
			Position = tbl2.IsMobile and UDim2.new(1, -6, 0, 7) or UDim2.new(1, -8, 0, 10),
			Size = UDim2.fromOffset(tbl2.IsMobile and 180 or 280, 18),
			Visible = tbl2.WatermarkEnabled,
			ZIndex = 90,
		})

		tbl:RenderObject("Frame", {
			BackgroundColor3 = tbl2.OverlayAccent,
			BorderSizePixel = 0,
			Parent = frame,
			Position = UDim2.fromOffset(0, -2),
			Size = UDim2.new(1, 0, 0, 2),
			ZIndex = 93,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FontFace = tbl2.OverlayFontFace,
			Parent = frame,
			Position = UDim2.fromOffset(1, 1),
			PreserveTextStyle = true,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "mellstroyhook",
			TextColor3 = Color3.fromRGB(0, 0, 0),
			TextSize = tbl2.IsMobile and 10 or 12,
			TextStrokeTransparency = 1,
			TextXAlignment = "Center",
			ZIndex = 91,
		})

		local TextLabel2 = tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FontFace = tbl2.OverlayFontFace,
			Parent = frame,
			Position = UDim2.fromOffset(0, 0),
			PreserveTextStyle = true,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "mellstroyhook",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = tbl2.IsMobile and 10 or 12,
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
			TextStrokeTransparency = 1,
			TextXAlignment = "Center",
			ZIndex = 92,
		})

		tbl2.Watermark = frame
		tbl2.WatermarkText = TextLabel2
		tbl2.WatermarkTextShadow = TextLabel
		tbl2.KeybindList = CanvasGroup

		local function fn3()
			if type(isfile) ~= "function" or type(readfile) ~= "function" then
				return
			end
			local ok, result = pcall(isfile, str3)
			if not ok or not result then
				return
			end

			local ok2, keybindConfig = pcall(function()
				return game:GetService("HttpService"):JSONDecode(readfile(str3))
			end)

			if ok2 and type(keybindConfig) == "table" then
				tbl2.KeybindConfig = keybindConfig
				local listPosition = keybindConfig.__listPosition

				if type(listPosition) == "table" and type(listPosition.X) == "number" and type(listPosition.Y) == "number" then
					CanvasGroup.Position = UDim2.fromOffset(listPosition.X, listPosition.Y)
				end
			end
		end

		local n = 0

		local function fn4()
			n += 1
			local v3 = n
			local folder = index.Folder
			local str4 = folder .. "/" .. index.Configs

			task.delay(0.15, function()
				if v3 ~= n or type(writefile) ~= "function" then
					return
				end

				pcall(function()
					if type(makefolder) == "function" then
						pcall(makefolder, folder)
						pcall(makefolder, str4)
					end

					writefile(str3, game:GetService("HttpService"):JSONEncode(tbl2.KeybindConfig))
				end)
			end)
		end

		fn3()

		local function fn5(arg)
			if arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.MouseButton2 or arg.UserInputType == Enum.UserInputType.MouseButton3 then
				return arg.UserInputType
			end

			if arg.KeyCode and arg.KeyCode ~= Enum.KeyCode.Unknown then
				return arg.KeyCode
			end
			return nil
		end

		local n2 = 0

		local function fn6(arg)
			local visible = not tbl2.IsMobile and arg == true
			CanvasGroup.GroupTransparency = 0
			CanvasGroup.Visible = visible

			if not visible and n2 == 0 then
				for _, keybind in ipairs(tbl2.Keybinds) do
					keybind.Row.Visible = false
				end

				Frame2.Size = UDim2.new(1, 0, 0, 0)
				CanvasGroup.Size = UDim2.fromOffset(165, 25)
			end
		end

		local function fn7()
			local tbl6 = {}

			for _, keybind in ipairs(tbl2.Keybinds) do
				local active = (keybind.Owner == nil or keybind.Owner.State == true) and keybind.Active
				keybind.RowName.TextColor3 = Color3.fromRGB(255, 255, 255)
				keybind.RowMode.TextColor3 = Color3.fromRGB(255, 255, 255)

				if active then
					tbl6[#tbl6 + 1] = keybind
				end
			end

			local n3 = #tbl6
			n2 = n3

			if n3 > 0 then
				local tbl7 = {}

				for i, v3 in ipairs(tbl6) do
					tbl7[v3] = true
					v3.Row.LayoutOrder = i
					v3.Row.Visible = true
				end

				for _, keybind in ipairs(tbl2.Keybinds) do
					if not tbl7[keybind] then
						keybind.Row.Visible = false
					end
				end

				Frame2.Size = UDim2.new(1, 0, 0, n3 * 17)
				CanvasGroup.Size = UDim2.fromOffset(165, 25 + n3 * 17)
			end

			fn6(tbl2.KeybindListEnabled and n3 > 0)
		end

		tbl2.SetKeybindListVisible = function(arg, arg2)
			tbl2.KeybindListEnabled = arg2 == true
			fn7()
		end

		tbl2.SetWatermarkVisible = function(arg, arg2)
			tbl2.WatermarkEnabled = arg2 == true
			frame.Visible = tbl2.WatermarkEnabled
		end

		tbl2.WatermarkNextUpdate = 0

		tbl:CreateConnection(game:GetService("RunService").Heartbeat, function()
			local watermarkNextUpdate = tbl2.WatermarkNextUpdate
			if os.clock() < watermarkNextUpdate then
				return
			end
			tbl2.WatermarkNextUpdate = os.clock() + 0.25
			local localPlayer = game:GetService("Players").LocalPlayer
			local n3 = 0

			if localPlayer then
				local ok, result = pcall(localPlayer.GetNetworkPing, localPlayer)

				if ok and type(result) == "number" then
					n3 = math.max(math.floor(result * 1000 + 0.5), 0)
				end
			end

			local text = "mellstroyhook | " .. (localPlayer and localPlayer.Name or "unknown") .. " | " .. n3 .. "ms | " .. os.date("%H:%M")
			TextLabel2.Text = text
			TextLabel.Text = text

			task.defer(function()
				if frame.Parent and TextLabel2.Parent then
					frame.Size = UDim2.fromOffset(math.max(math.ceil(TextLabel2.TextBounds.X) + (tbl2.IsMobile and 14 or 30), tbl2.IsMobile and 180 or 280), 18)
				end
			end)
		end)

		local fn8 = nil

		fn8 = function(arg)
			local kind = typeof(arg)
			if kind == "Color3" then
				return { __type = "Color3", R = arg.R, G = arg.G, B = arg.B }
			end

			if kind == "table" then
				local tbl6 = {}

				for k, v3 in pairs(arg) do
					if type(k) == "string" or type(k) == "number" then
						tbl6[k] = fn8(v3)
					end
				end

				return tbl6
			end

			if kind == "boolean" or kind == "number" or kind == "string" then
				return arg
			end
			return nil
		end

		local fn9 = nil

		fn9 = function(arg)
			if type(arg) ~= "table" then
				return arg
			end

			if arg.__type == "Color3" then
				return Color3.new(math.clamp(tonumber(arg.R) or 0, 0, 1), math.clamp(tonumber(arg.G) or 0, 0, 1), math.clamp(tonumber(arg.B) or 0, 0, 1))
			end
			local tbl6 = {}

			for k, v3 in pairs(arg) do
				tbl6[k] = fn9(v3)
			end

			return tbl6
		end

		tbl2.RegisterConfigControl = function(arg, arg2, arg3, configKind)
			if not arg2 or arg3.Configurable == false or arg3.configurable == false then
				return arg2
			end
			local image = arg2.Page and arg2.Page.Image or "page"
			local name = arg2.Section and arg2.Section.Name or "section"
			local configId = arg3.ConfigId or arg3.configId or tostring(image) .. "|" .. tostring(name) .. "|" .. tostring(arg2.Name) .. "|" .. tostring(configKind)
			local n3 = (tbl2.ConfigControlCounts[configId] or 0) + 1
			tbl2.ConfigControlCounts[configId] = n3
			local configId2 = n3 == 1 and configId or configId .. "#" .. n3
			arg2.ConfigId = configId2
			arg2.ConfigKind = configKind
			tbl2.ConfigControls[configId2] = arg2
			return arg2
		end

		tbl2.GetConfigData = function()
			local tbl6 = {}

			for k, configControl in pairs(tbl2.ConfigControls) do
				if type(configControl.Get) == "function" then
					local ok, result = pcall(configControl.Get, configControl)

					if ok then
						tbl6[k] = fn8(result)
					end
				end
			end

			return { Version = 1, Controls = tbl6 }
		end

		tbl2.LoadConfigData = function(arg, arg2)
			local controls = type(arg2) == "table" and arg2.Controls
			if type(controls) ~= "table" then
				return false
			end

			for k, control in pairs(controls) do
				local v3 = tbl2.ConfigControls[k]

				if v3 and type(v3.Set) == "function" then
					pcall(v3.Set, v3, fn9(control))
				end
			end

			return true
		end

		tbl2.CloseKeybindPopup = function()
			if tbl2.KeybindPopup and tbl2.KeybindPopup.Frame then
				tbl2.KeybindPopup.Frame:Destroy()
			end

			tbl2.KeybindPopup = nil
		end

		tbl2.CreateKeybind = function(arg, arg2)
			local tbl6 = arg2 or {}
			local listeningBind = {}
			listeningBind.Id = tostring(tbl6.Id or tbl6.Name or #tbl2.Keybinds + 1)
			listeningBind.Name = tostring(tbl6.Name or "Keybind")
			listeningBind.Mode = "Toggle"
			listeningBind.Key = nil
			listeningBind.Active = false
			listeningBind.Toggled = tbl6.InitialToggled == true
			listeningBind.Owner = tbl6.Owner
			listeningBind.Listening = false
			listeningBind.MobileMode = tbl2.IsMobile and "Toggle" or nil

			listeningBind.Callback = tbl6.Callback or function()
			end

			local v3 = tbl2.KeybindConfig[listeningBind.Id]
			local mode = type(v3) == "table" and v3.Mode or nil
			local mode2 = tbl6.Mode or "Toggle"
			listeningBind.DesktopMode = table.find(tbl3, mode) and mode or table.find(tbl3, mode2) and mode2 or "Toggle"
			listeningBind.Mode = tbl2.IsMobile and "Toggle" or listeningBind.DesktopMode
			local v4 = tbl
			local renderObject2 = v4.RenderObject

			local textButton = renderObject2(v4, "TextButton", {
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = "X",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = tbl6.Parent,
				Position = tbl6.Position or UDim2.new(1, -8, 0.5, 0),
				Size = UDim2.fromOffset(0, 18),
				Text = "[-]",
				TextColor3 = Color3.fromRGB(117, 117, 117),
				TextSize = 13,
				TextStrokeTransparency = 0,
				ZIndex = 9,
			})

			local Frame4 = tbl:RenderObject("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = Frame2,
				Size = UDim2.new(1, -6, 0, 17),
				Visible = false,
				ZIndex = 82,
			})

			local TextLabel3 = tbl:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				FontFace = tbl2.OverlayFontFace,
				Parent = Frame4,
				Position = UDim2.fromOffset(5, 1),
				PreserveTextStyle = true,
				Size = UDim2.new(0.62, -4, 1, 0),
				Text = listeningBind.Name,
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 13,
				TextStrokeTransparency = 1,
				TextXAlignment = "Left",
				TextTruncate = "AtEnd",
				ZIndex = 83,
			})

			local TextLabel4 = tbl:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				FontFace = tbl2.OverlayFontFace,
				Parent = Frame4,
				Position = UDim2.fromOffset(4, 0),
				PreserveTextStyle = true,
				Size = UDim2.new(0.62, -4, 1, 0),
				Text = listeningBind.Name,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 13,
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
				TextStrokeTransparency = 1,
				TextXAlignment = "Left",
				TextTruncate = "AtEnd",
				ZIndex = 84,
			})

			local TextLabel5 = tbl:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				FontFace = tbl2.OverlayFontFace,
				Parent = Frame4,
				Position = UDim2.new(0.62, 1, 0, 1),
				PreserveTextStyle = true,
				Size = UDim2.new(0.38, -4, 1, 0),
				Text = "[toggled]",
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 13,
				TextStrokeTransparency = 1,
				TextXAlignment = "Right",
				ZIndex = 83,
			})

			local TextLabel6 = tbl:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				FontFace = tbl2.OverlayFontFace,
				Parent = Frame4,
				Position = UDim2.new(0.62, 0, 0, 0),
				PreserveTextStyle = true,
				Size = UDim2.new(0.38, -4, 1, 0),
				Text = "[toggled]",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 13,
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
				TextStrokeTransparency = 1,
				TextXAlignment = "Right",
				ZIndex = 84,
			})

			listeningBind.Button = textButton
			listeningBind.Row = Frame4
			listeningBind.RowName = TextLabel4
			listeningBind.RowNameShadow = TextLabel3
			listeningBind.RowMode = TextLabel6
			listeningBind.RowModeShadow = TextLabel5
			listeningBind.MobileVisible = tbl2.IsMobile and type(v3) == "table" and v3.Mobile == true or false

			if tbl2.IsMobile then
				local n3 = #tbl2.MobileBindings + 1
				local num = type(v3) == "table" and tonumber(v3.MobileX) or nil
				local num2 = type(v3) == "table" and tonumber(v3.MobileY) or nil
				local n4 = 0.02 + (n3 - 1) % 2 * 0.19
				local n5 = 0.9 - math.floor((n3 - 1) / 2) * 0.07
				listeningBind.MobileX = math.clamp(num or n4, 0, 0.92)
				listeningBind.MobileY = math.clamp(num2 or n5, 0.08, 0.92)
				local mobileHudFactor = tbl2.MobileHudFactor or 1
				local floor = math.floor

				local TextButton2 = tbl:RenderObject("TextButton", {
					AnchorPoint = Vector2.new(0, 0),
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(17, 17, 17),
					BackgroundTransparency = 0.08,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					FontFace = tbl2.OverlayFontFace,
					Parent = Frame3,
					Position = UDim2.fromScale(listeningBind.MobileX, listeningBind.MobileY),
					PreserveTextStyle = true,
					Size = UDim2.fromOffset(math.floor(114 * mobileHudFactor), floor(30 * mobileHudFactor)),
					Text = "",
					TextColor3 = Color3.fromRGB(225, 225, 225),
					TextSize = math.max(10, math.floor(12 * mobileHudFactor)),
					TextStrokeTransparency = 1,
					Visible = listeningBind.MobileVisible,
					ZIndex = 205,
				}, true)

				local TextLabel7 = tbl:RenderObject("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					FontFace = tbl2.OverlayFontFace,
					Parent = TextButton2,
					Position = UDim2.fromOffset(6, 0),
					PreserveTextStyle = true,
					Size = UDim2.new(1, -50, 1, 0),
					Text = listeningBind.Name,
					TextColor3 = Color3.fromRGB(225, 225, 225),
					TextSize = math.max(10, math.floor(12 * mobileHudFactor)),
					TextStrokeTransparency = 1,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					ZIndex = 208,
				}, true)

				local Frame5 = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(77, 77, 77),
					BorderSizePixel = 0,
					Parent = TextButton2,
					Position = UDim2.fromOffset(0, 0),
					Size = UDim2.new(1, 0, 0, 2),
					ZIndex = 207,
				}, true)

				local v5 = tbl
				local renderObject3 = v5.RenderObject
				local tbl7 = {}
				local colorSequence = ColorSequence.new
				local tbl8 = {}
				local v6 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 70))
				local v7 = ColorSequenceKeypoint.new(0.33, Color3.fromRGB(145, 200, 64))
				local v8 = ColorSequenceKeypoint.new(0.66, Color3.fromRGB(75, 130, 255))
				tbl8[1] = v6
				tbl8[2] = v7
				tbl8[3] = v8

				do
					local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 80, 255)))
					table.move(values, 1, values.n, 4, tbl8)
				end

				tbl7.Color = colorSequence(tbl8)
				tbl7.Parent = Frame5
				renderObject3(v5, "UIGradient", tbl7, true)

				local Frame6 = tbl:RenderObject("Frame", {
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(77, 77, 77),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 1,
					Parent = TextButton2,
					Position = UDim2.new(1, -7, 0.5, 1),
					Size = UDim2.fromOffset(6, 6),
					ZIndex = 207,
				}, true)

				local TextLabel8 = tbl:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					FontFace = tbl2.OverlayFontFace,
					Parent = TextButton2,
					Position = UDim2.new(1, -15, 0, 0),
					PreserveTextStyle = true,
					Size = UDim2.fromOffset(22, math.floor(30 * mobileHudFactor)),
					Text = "OFF",
					TextColor3 = Color3.fromRGB(125, 125, 125),
					TextSize = math.max(9, math.floor(10 * mobileHudFactor)),
					TextStrokeTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Right,
					ZIndex = 208,
				}, true)

				local TextButton3 = tbl:RenderObject("TextButton", {
					Active = true,
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Parent = TextButton2,
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(1, 1),
					Text = "",
					ZIndex = 209,
				}, true)

				listeningBind.MobileButton = TextButton2
				listeningBind.MobileTitle = TextLabel7
				listeningBind.MobileAccent = Frame5
				listeningBind.MobileState = Frame6
				listeningBind.MobileStatus = TextLabel8
				listeningBind.MobileHitbox = TextButton3
				tbl2.MobileBindings[#tbl2.MobileBindings + 1] = listeningBind
				local v9 = nil
				local v10 = nil
				local position = nil
				local flag = false
				local n6 = 9

				local function fn10(arg3)
					local absoluteSize = Frame3.AbsoluteSize
					local absoluteSize2 = TextButton2.AbsoluteSize
					if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
						return arg3
					end
					local n7 = absoluteSize.Y * arg3.Y.Scale + arg3.Y.Offset
					return UDim2.fromOffset(math.clamp(absoluteSize.X * arg3.X.Scale + arg3.X.Offset, 4, math.max(4, absoluteSize.X - absoluteSize2.X - 4)), math.clamp(n7, 4, math.max(4, absoluteSize.Y - absoluteSize2.Y - 4)))
				end

				local function fn11()
					local absoluteSize = Frame3.AbsoluteSize
					if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
						return
					end
					local absolutePosition = TextButton2.AbsolutePosition
					local absolutePosition2 = Frame3.AbsolutePosition
					listeningBind.MobileX = math.clamp((absolutePosition.X - absolutePosition2.X) / absoluteSize.X, 0, 1)
					listeningBind.MobileY = math.clamp((absolutePosition.Y - absolutePosition2.Y) / absoluteSize.Y, 0, 1)
					TextButton2.Position = UDim2.fromScale(listeningBind.MobileX, listeningBind.MobileY)
					listeningBind:Save()
				end

				listeningBind.FitMobile = function()
					if not listeningBind.MobileButton or not listeningBind.MobileButton.Parent then
						return
					end
					local mobileHudFactor2 = tbl2.MobileHudFactor or 1
					local floor2 = math.floor
					listeningBind.MobileButton.Size = UDim2.fromOffset(math.floor(114 * mobileHudFactor2), floor2(30 * mobileHudFactor2))
					listeningBind.MobileButton.TextSize = math.max(10, math.floor(12 * mobileHudFactor2))
					listeningBind.MobileButton.Position = fn10(UDim2.fromScale(listeningBind.MobileX, listeningBind.MobileY))

					task.defer(function()
						if listeningBind.MobileButton and listeningBind.MobileButton.Parent then
							local absoluteSize = Frame3.AbsoluteSize
							local absolutePosition = listeningBind.MobileButton.AbsolutePosition
							local absolutePosition2 = Frame3.AbsolutePosition

							if absoluteSize.X > 0 and absoluteSize.Y > 0 then
								listeningBind.MobileX = math.clamp((absolutePosition.X - absolutePosition2.X) / absoluteSize.X, 0, 1)
								listeningBind.MobileY = math.clamp((absolutePosition.Y - absolutePosition2.Y) / absoluteSize.Y, 0, 1)
								listeningBind.MobileButton.Position = UDim2.fromScale(listeningBind.MobileX, listeningBind.MobileY)
							end
						end
					end)
				end

				tbl:CreateConnection(TextButton3.InputBegan, function(arg3)
					local userInputType = arg3.UserInputType
					if userInputType ~= Enum.UserInputType.Touch and userInputType ~= Enum.UserInputType.MouseButton1 then
						return
					end
					v9 = arg3
					v10 = tbl:MouseLocation(arg3)
					position = TextButton2.Position
					flag = false
				end)

				tbl:CreateConnection(UserInputService.InputChanged, function(arg3)
					if not v9 then
						return
					end
					local flag2 = v9.UserInputType == Enum.UserInputType.Touch
					if flag2 and arg3 ~= v9 then
						return
					end

					if not flag2 and arg3.UserInputType ~= Enum.UserInputType.MouseMovement then
						return
					end
					local n7 = tbl:MouseLocation(arg3) - v10

					if not flag and n7.Magnitude >= n6 then
						flag = true
					end

					if flag then
						TextButton2.Position = fn10(UDim2.new(position.X.Scale, position.X.Offset + n7.X, position.Y.Scale, position.Y.Offset + n7.Y))
					end
				end)

				tbl:CreateConnection(UserInputService.InputEnded, function(arg3)
					local flag2 = not v9

					if not flag2 then
						flag2 = arg3 ~= v9

						if flag2 then
							flag2 = not (v9.UserInputType == Enum.UserInputType.MouseButton1 and arg3.UserInputType == Enum.UserInputType.MouseButton1)
						end
					end

					if flag2 then
						return
					end
					v9 = nil

					if flag then
						fn11()
					else
						local flag3 = not listeningBind.Active

						if flag3 and listeningBind.Owner and listeningBind.Owner.State ~= true and type(listeningBind.Owner.Set) == "function" then
							listeningBind.Owner:Set(true)
						end

						listeningBind:SetActive(flag3)
					end

					flag = false
				end)
			end

			listeningBind.Refresh = function()
				fn7()

				if listeningBind.MobileButton then
					local flag = listeningBind.Owner == nil or listeningBind.Owner.State == true
					local active = listeningBind.Active and flag
					local accent = tbl2.Accent
					listeningBind.MobileButton.Visible = listeningBind.MobileVisible
					listeningBind.MobileButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
					listeningBind.MobileAccent.BackgroundTransparency = 0
					listeningBind.MobileState.BackgroundColor3 = active and accent or Color3.fromRGB(77, 77, 77)
					listeningBind.MobileStatus.Text = active and "ON" or "OFF"
					listeningBind.MobileStatus.TextColor3 = active and accent or Color3.fromRGB(125, 125, 125)
					listeningBind.MobileTitle.TextColor3 = flag and Color3.fromRGB(235, 235, 235) or Color3.fromRGB(120, 120, 120)
				end
			end

			listeningBind.Matches = function(arg3, arg4)
				return listeningBind.Key ~= nil and (arg4.KeyCode == listeningBind.Key or arg4.UserInputType == listeningBind.Key)
			end

			listeningBind.Save = function()
				tbl2.KeybindConfig[listeningBind.Id] = {
					Mode = listeningBind.DesktopMode or listeningBind.Mode,
					KeyType = listeningBind.Key and (listeningBind.Key.EnumType == Enum.KeyCode and "KeyCode" or "UserInputType") or nil,
					Key = listeningBind.Key and listeningBind.Key.Name or nil,
					Mobile = listeningBind.MobileVisible == true,
					MobileX = listeningBind.MobileX,
					MobileY = listeningBind.MobileY,
				}

				fn4()
			end

			listeningBind.SetActive = function(arg3, arg4, arg5, arg6)
				local toggled = arg4 == true

				if listeningBind.Mode == "Toggle" then
					listeningBind.Toggled = toggled
				end

				if listeningBind.Active == toggled then
					listeningBind:Refresh()

					if arg6 and not arg5 then
						pcall(listeningBind.Callback, toggled, listeningBind)
					end

					return
				end

				listeningBind.Active = toggled
				listeningBind:Refresh()

				if not arg5 then
					pcall(listeningBind.Callback, toggled, listeningBind)
				end
			end

			listeningBind.SetKey = function(arg3, arg4, arg5, arg6)
				listeningBind.Key = typeof(arg4) == "EnumItem" and arg4 or nil
				local v5 = textButton
				local text = tbl2.IsMobile and (listeningBind.MobileVisible and "[HUD]" or "[+]")

				if not text then
					local key = listeningBind.Key

					if key then
						key = string.upper(tbl5[listeningBind.Key.Name] or listeningBind.Key.Name)
					end

					text = "[" .. (key or "-") .. "]"
				end

				v5.Text = text

				if not arg5 then
					listeningBind:Save()
				end

				if not arg6 then
					local flag = listeningBind.Mode == "Always" or listeningBind.Mode == "Off Hold"

					if listeningBind.Mode == "Toggle" then
						flag = listeningBind.Toggled
					end

					listeningBind:SetActive(flag, false, true)
				end

				fn7()
			end

			listeningBind.SetMobileVisible = function(arg3, arg4, arg5, arg6)
				if not tbl2.IsMobile then
					return
				end
				listeningBind.MobileVisible = arg4 == true
				local active = not listeningBind.MobileVisible and listeningBind.Mode ~= "Always" and listeningBind.Mode ~= "Off Hold" and listeningBind.Active
				local flag = false

				if active then
					listeningBind:SetActive(false)
					flag = true
				end

				textButton.Text = listeningBind.MobileVisible and "[HUD]" or "[+]"
				listeningBind:Refresh()

				if not arg6 and not flag then
					pcall(listeningBind.Callback, listeningBind.Active, listeningBind)
				end

				if not arg5 then
					listeningBind:Save()
				end
			end

			listeningBind.SetMode = function(arg3, mode3, arg4, arg5)
				if tbl2.IsMobile then
					mode3 = "Toggle"
				end

				if not table.find(tbl3, mode3) then
					return
				end
				listeningBind.Mode = mode3

				if not tbl2.IsMobile then
					listeningBind.DesktopMode = mode3
				end

				TextLabel6.Text = "[" .. tbl4[mode3] .. "]"
				TextLabel5.Text = TextLabel6.Text
				local flag = mode3 == "Always" or mode3 == "Off Hold"

				if mode3 == "Toggle" then
					flag = listeningBind.Toggled
				end

				local v5 = listeningBind
				local setActive = v5.SetActive

				if not arg5 then
					arg5 = listeningBind.Key == nil and mode3 ~= "Always"

					if arg5 then
						arg5 = not (tbl2.IsMobile and listeningBind.MobileVisible)
					end
				end

				setActive(v5, flag, arg5)

				if not arg4 then
					listeningBind:Save()
				end
			end

			listeningBind.BeginListening = function()
				if tbl2.ListeningBind and tbl2.ListeningBind ~= listeningBind then
					tbl2.ListeningBind:StopListening()
				end

				tbl2:CloseKeybindPopup()
				tbl2.ListeningBind = listeningBind
				listeningBind.Listening = true
				textButton.Text = "[...]"
				textButton.TextColor3 = Color3.fromRGB(235, 70, 70)
			end

			listeningBind.StopListening = function()
				listeningBind.Listening = false

				if tbl2.ListeningBind == listeningBind then
					tbl2.ListeningBind = nil
				end

				textButton.TextColor3 = Color3.fromRGB(117, 117, 117)
				listeningBind:SetKey(listeningBind.Key, true, true)
			end

			listeningBind.OpenModeMenu = function()
				tbl2:CloseKeybindPopup()
				local n3 = textButton.AbsolutePosition.Y + textButton.AbsoluteSize.Y

				local Frame5 = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(20, 20, 20),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 1,
					Parent = ScreenGui,
					Position = UDim2.fromOffset(math.max(2, textButton.AbsolutePosition.X - 92), n3),
					Size = UDim2.fromOffset(100, #tbl3 * 18 + 4),
					ZIndex = 100,
				})

				obj[Frame5] = true
				tbl:RenderObject("UIListLayout", { Parent = Frame5, Padding = UDim.new(0, 0), SortOrder = "LayoutOrder" })
				tbl:RenderObject("UIPadding", { Parent = Frame5, PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 2) })

				for i, v5 in ipairs(tbl3) do
					tbl:CreateConnection(tbl:RenderObject("TextButton", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = i,
						Parent = Frame5,
						Size = UDim2.new(1, 0, 0, 18),
						Text = "    " .. v5,
						TextColor3 = v5 == listeningBind.Mode and tbl2.Accent or Color3.fromRGB(205, 205, 205),
						TextSize = 13,
						TextXAlignment = "Left",
						ZIndex = 101,
					}).Activated, function()
						listeningBind:SetMode(v5)
						tbl2:CloseKeybindPopup()
					end)
				end

				tbl2.KeybindPopup = { Frame = Frame5, Bind = listeningBind }
			end

			tbl:CreateConnection(textButton.Activated, function()
				if tbl2.IsMobile then
					listeningBind:SetMobileVisible(not listeningBind.MobileVisible)
				else
					listeningBind:BeginListening()
				end
			end)

			tbl:CreateConnection(textButton.MouseButton2Click, function()
				if tbl2.IsMobile then
					return
				end

				if tbl2.KeybindPopup and tbl2.KeybindPopup.Bind == listeningBind then
					tbl2:CloseKeybindPopup()
				else
					listeningBind:OpenModeMenu()
				end
			end)

			tbl:CreateConnection(textButton.MouseEnter, function()
				if not listeningBind.Listening then
					textButton.TextColor3 = Color3.fromRGB(176, 176, 176)
				end
			end)

			tbl:CreateConnection(textButton.MouseLeave, function()
				if not listeningBind.Listening then
					textButton.TextColor3 = Color3.fromRGB(117, 117, 117)
				end
			end)

			tbl2.Keybinds[#tbl2.Keybinds + 1] = listeningBind
			index.Keybinds[#index.Keybinds + 1] = listeningBind
			local key

			if type(v3) == "table" and type(v3.Key) == "string" and (v3.KeyType == "KeyCode" or v3.KeyType == "UserInputType") then
				key = Enum[v3.KeyType][v3.Key]
			else
				key = nil

				if typeof(tbl6.Key) == "EnumItem" then
					key = tbl6.Key
				end
			end

			listeningBind:SetKey(key, true, true)
			listeningBind:SetMode(listeningBind.Mode, true, true)

			if tbl2.IsMobile then
				listeningBind:SetMobileVisible(listeningBind.MobileVisible, true, true)
			end

			fn7()
			return listeningBind, v3 ~= nil
		end

		local Frame4 = tbl:RenderObject("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(25, 25, 25),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Interactable = true,
			Parent = ScreenGui,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 658, 0, 558),
		})

		local UIScale = tbl:RenderObject("UIScale", { Parent = Frame4, Scale = 1 })
		local vector2 = Vector2.new(658, 558)
		local n3 = tbl2.IsMobile and 6 or 12

		local function fn10()
			local absolutePosition = Frame.AbsolutePosition
			local absoluteSize = Frame.AbsoluteSize

			if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
				absoluteSize = workspace.CurrentCamera
				absolutePosition = Vector2.zero
				absoluteSize = absoluteSize and absoluteSize.ViewportSize or Vector2.new(658, 558)
			end

			local n4 = absolutePosition + absoluteSize
			local max = math.max
			local y = absolutePosition.Y
			local vector22 = Vector2.new(math.max(0, absolutePosition.X), max(0, y))
			local y2 = n4.Y
			return vector22, Vector2.new(math.max(1, n4.X - vector22.X), math.max(1, y2 - vector22.Y)), absolutePosition, absoluteSize
		end

		local function fn11(arg)
			local v3, v4, v5 = fn10()
			local n4 = v4 - Vector2.new(n3 * 2, n3 * 2)
			local n5 = math.max(0.1, math.min(1, n4.X / vector2.X, n4.Y / vector2.Y))
			local v6

			if tbl2.IsMobile then
				local n6 = math.min(v4.X, v4.Y)
				local min = math.min
				local n7 = math.clamp(n6 / 760, 0.56, 0.82)
				v6 = min(n5, n7)
				tbl2.MobileHudFactor = math.clamp(n6 / 720, 0.82, 1.08)

				for _, mobileBinding in ipairs(tbl2.MobileBindings) do
					if type(mobileBinding.FitMobile) == "function" then
						mobileBinding:FitMobile()
					end
				end
			else
				v6 = n5
			end

			UIScale.Scale = math.min(v6, tbl2.UserMenuScale or 1)

			if arg then
				local n6 = v3 + v4 * 0.5
				Frame4.Position = UDim2.fromOffset(n6.X - v5.X, n6.Y - v5.Y)
			end
		end

		local function fn12(arg)
			local v3, v4, v5, v6 = fn10()
			local n4 = vector2 * UIScale.Scale * 0.5
			local n5 = v5.Y + v6.Y * arg.Y.Scale + arg.Y.Offset
			return UDim2.new(arg.X.Scale, math.clamp(v5.X + v6.X * arg.X.Scale + arg.X.Offset, v3.X + n4.X + n3, v3.X + v4.X - n4.X - n3) - v5.X - v6.X * arg.X.Scale, arg.Y.Scale, math.clamp(n5, v3.Y + n4.Y + n3, v3.Y + v4.Y - n4.Y - n3) - v5.Y - v6.Y * arg.Y.Scale)
		end

		fn11(true)
		local TextButton2 = nil

		if tbl2.IsMobile then
			TextButton2 = tbl:RenderObject("TextButton", {
				AnchorPoint = Vector2.new(0, 0),
				AutoButtonColor = false,
				BackgroundColor3 = Color3.fromRGB(17, 17, 17),
				BackgroundTransparency = 0.05,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 1,
				FontFace = tbl2.OverlayFontFace,
				Parent = ScreenGui,
				Position = UDim2.fromOffset(8, 58),
				PreserveTextStyle = true,
				Size = UDim2.fromOffset(42, 34),
				Text = "mh",
				TextColor3 = Color3.fromRGB(235, 235, 235),
				TextSize = 13,
				TextStrokeTransparency = 1,
				ZIndex = 300,
			}, true)

			tbl:RenderObject("Frame", {
				BackgroundColor3 = tbl2.Accent,
				BorderSizePixel = 0,
				Parent = TextButton2,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.new(1, 0, 0, 2),
				ZIndex = 302,
			}, true)

			local v3 = tbl
			local renderObject2 = v3.RenderObject
			local tbl6 = {}
			local colorSequence = ColorSequence.new
			local tbl7 = {}
			local v4 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 70))
			local v5 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(75, 130, 255))
			local new = ColorSequenceKeypoint.new
			local color = Color3.fromRGB
			tbl7[1] = v4
			tbl7[2] = v5

			do
				local values = table.pack(new(1, color(220, 80, 255)))
				table.move(values, 1, values.n, 3, tbl7)
			end

			tbl6.Color = colorSequence(tbl7)
			tbl6.Parent = TextButton2:FindFirstChildOfClass("Frame")
			renderObject2(v3, "UIGradient", tbl6, true)
			tbl2.MobileMenuButton = TextButton2
		end

		tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame4,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
		})

		local Frame5 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(60, 60, 60),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Parent = Frame4,
			Position = UDim2.new(0, 3, 0, 3),
			Size = UDim2.new(1, -6, 1, -6),
		})

		local Frame6 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame5,
			Position = UDim2.new(0, 0, 0, 4),
			Size = UDim2.new(0, 73, 1, -4),
		})

		local Frame7 = tbl:RenderObject("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame5,
			Position = UDim2.new(1, 0, 0, 4),
			Size = UDim2.new(1, -72, 1, -4),
		})

		local Frame8 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame5,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, 4),
		})

		tbl:RenderObject("UIListLayout", {
			Padding = UDim.new(0, 0),
			Parent = Frame6,
			FillDirection = "Vertical",
			HorizontalAlignment = "Left",
			VerticalAlignment = "Top",
		})

		tbl:RenderObject("UIPadding", { Parent = Frame6, PaddingTop = UDim.new(0, 9) })

		local Frame9 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(45, 45, 45),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame7,
			Position = UDim2.new(0, 1, 0, 0),
			Size = UDim2.new(1, -1, 1, 0),
		})

		local Frame10 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame8,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
		})

		local v3 = tbl
		local renderObject2 = v3.RenderObject
		local tbl6 = {}
		local colorSequence = ColorSequence.new
		local tbl7 = {}
		local v4 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 70))
		local v5 = ColorSequenceKeypoint.new(0.18, Color3.fromRGB(255, 205, 70))
		local v6 = ColorSequenceKeypoint.new(0.34, Color3.fromRGB(145, 200, 64))
		local v7 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 205, 190))
		local v8 = ColorSequenceKeypoint.new(0.66, Color3.fromRGB(75, 130, 255))
		local v9 = ColorSequenceKeypoint.new(0.82, Color3.fromRGB(185, 85, 255))
		tbl7[1] = v4
		tbl7[2] = v5
		tbl7[3] = v6
		tbl7[4] = v7
		tbl7[5] = v8
		tbl7[6] = v9

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 70, 120)))
			table.move(values, 1, values.n, 7, tbl7)
		end

		tbl6.Color = colorSequence(tbl7)
		tbl6.Parent = Frame10
		tbl6.Rotation = 0
		renderObject2(v3, "UIGradient", tbl6)

		local Frame11 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame9,
			Position = UDim2.new(0, 1, 0, 0),
			Size = UDim2.new(1, -1, 1, 0),
		})

		local Folder = tbl:RenderObject("Folder", { Parent = Frame11 })

		tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame11,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			Image = "rbxassetid://8547666218",
			ImageColor3 = Color3.fromRGB(12, 12, 12),
			ScaleType = "Tile",
			TileSize = UDim2.new(0, 8, 0, 8),
		})

		tbl2.SetPage = function(arg, arg2)
			for _, page in pairs(tbl2.Pages) do
				if page.Open and page ~= arg2 then
					page:Set(false)
				end
			end
		end

		local function fn13()
			local n4 = 0
			local tbl8 = {}

			local function fn14(arg)
				local tbl9 = {}

				if arg:IsA("GuiObject") then
					tbl9.BackgroundTransparency = arg.BackgroundTransparency
				end

				if arg:IsA("ImageLabel") or arg:IsA("ImageButton") then
					tbl9.ImageTransparency = arg.ImageTransparency
				end

				if arg:IsA("TextLabel") or arg:IsA("TextButton") or arg:IsA("TextBox") then
					tbl9.TextTransparency = arg.TextTransparency
					tbl9.TextStrokeTransparency = arg.TextStrokeTransparency
				end

				if arg:IsA("ScrollingFrame") then
					tbl9.ScrollBarImageTransparency = arg.ScrollBarImageTransparency
				end

				if arg:IsA("UIStroke") then
					tbl9.Transparency = arg.Transparency
				end

				return next(tbl9) and tbl9 or nil
			end

			local function fn15()
				local tbl9 = { Frame4 }

				for _, descendant in ipairs(Frame4:GetDescendants()) do
					tbl9[#tbl9 + 1] = descendant
				end

				for k in pairs(obj) do
					if k.Parent then
						tbl9[#tbl9 + 1] = k

						for _, descendant in ipairs(k:GetDescendants()) do
							tbl9[#tbl9 + 1] = descendant
						end
					end
				end

				return tbl9
			end

			return function(arg, arg2)
				n4 += 1
				local v10 = n4

				for _, v11 in ipairs(tbl8) do
					v11:Cancel()
				end

				table.clear(tbl8)
				local v11 = fn15()
				local n5 = 0

				for _, v12 in ipairs(v11) do
					local renderTime = index.RenderMetadata[v12]
					local parent = v12.Parent

					if parent then
						parent = not (renderTime and renderTime.Hidden)
					end

					if parent then
						local openProperties = renderTime and renderTime.OpenProperties or fn14(v12)

						if openProperties then
							local tbl9 = {}

							for k, openProperty in pairs(openProperties) do
								openProperty = arg and openProperty or 1
								tbl9[k] = openProperty
							end

							renderTime = renderTime and renderTime.RenderTime or 0.25
							local n6 = math.max(n5, renderTime)
							local ok, result = pcall(TweenService.Create, TweenService, v12, TweenInfo.new(renderTime, Enum.EasingStyle.Linear, arg and Enum.EasingDirection.Out or Enum.EasingDirection.In), tbl9)

							if ok then
								tbl8[#tbl8 + 1] = result
								result:Play()
								n5 = n6
							else
								n5 = n6
							end
						end
					end
				end

				task.delay(n5, function()
					if v10 ~= n4 then
						return
					end
					table.clear(tbl8)
					arg2()
				end)
			end
		end

		local v10 = fn13()

		tbl2.Fade = function(arg, enabled)
			tbl2.Enabled = enabled
			Frame4.Interactable = enabled

			for k in pairs(obj) do
				if k.Parent and k:IsA("GuiObject") then
					k.Interactable = enabled
				end
			end

			Frame4.Visible = true

			v10(enabled, function()
				if not tbl2.Enabled then
					Frame4.Visible = false
					tbl2:CloseKeybindPopup()
				end
			end)
		end

		if TextButton2 then
			tbl:CreateConnection(TextButton2.Activated, function()
				tbl2:Fade(not tbl2.Enabled)
			end)
		end

		tbl2.Unload = function()
			for _, cleanupCallback in ipairs(tbl2.CleanupCallbacks) do
				pcall(cleanupCallback)
			end

			ScreenGui:Remove()

			for _, connection in pairs(index.Connections) do
				connection:Disconnect()
			end

			index = nil
			tbl = nil
		end

		tbl2.ScreenGui = ScreenGui
		tbl2.MainFrame = Frame4
		tbl2.TabsHolder = Frame6
		tbl2.PagesHolder = Folder
		tbl2.MenuScale = UIScale
		tbl2.MobileBindLayer = Frame3
		local flag = false
		local v11 = nil
		local position = nil
		local flag2 = false
		local mouseLocation = nil
		local position2 = nil

		tbl:CreateConnection(TextButton.MouseButton1Down, function()
			flag2 = true
			mouseLocation = UserInputService:GetMouseLocation()
			position2 = CanvasGroup.Position
		end)

		local v12 = nil

		tbl:CreateConnection(UserInputService.InputBegan, function(arg)
			if arg.UserInputType ~= Enum.UserInputType.MouseButton1 and arg.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			local v13 = tbl:MouseLocation(arg)
			local absolutePosition = Frame4.AbsolutePosition

			if v13.X >= absolutePosition.X and v13.X <= absolutePosition.X + Frame4.AbsoluteSize.X and v13.Y >= absolutePosition.Y and v13.Y <= absolutePosition.Y + 18 then
				flag = true
				v12 = arg
				v11 = tbl:MouseLocation(arg)
				position = Frame4.Position
			end
		end)

		tbl:CreateConnection(UserInputService.InputChanged, function(arg)
			if flag and (v12 and v12.UserInputType == Enum.UserInputType.Touch and arg == v12 or v12 and v12.UserInputType == Enum.UserInputType.MouseButton1 and arg.UserInputType == Enum.UserInputType.MouseMovement) then
				local n4 = tbl:MouseLocation(arg) - v11
				local udim2 = UDim2.new(position.X.Scale, position.X.Offset + n4.X, position.Y.Scale, position.Y.Offset + n4.Y)
				Frame4.Position = fn12(udim2)
			end

			if flag2 and arg.UserInputType == Enum.UserInputType.MouseMovement then
				local n4 = UserInputService:GetMouseLocation() - mouseLocation
				CanvasGroup.Position = UDim2.fromOffset(position2.X.Offset + n4.X, position2.Y.Offset + n4.Y)
			end
		end)

		tbl:CreateConnection(UserInputService.InputEnded, function(arg)
			if arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.Touch then
				if not v12 or arg == v12 or arg.UserInputType == Enum.UserInputType.MouseButton1 then
					v12 = nil
					flag = false
				end

				if flag2 then
					flag2 = false
					tbl2.KeybindConfig.__listPosition = { X = CanvasGroup.Position.X.Offset, Y = CanvasGroup.Position.Y.Offset }
					fn4()
				end
			end
		end)

		tbl:CreateConnection(Frame:GetPropertyChangedSignal("AbsoluteSize"), function()
			fn11(true)
		end)

		tbl:CreateConnection(Frame:GetPropertyChangedSignal("AbsolutePosition"), function()
			fn11(true)
		end)

		tbl:CreateConnection(UserInputService.InputBegan, function(arg, arg2)
			local listeningBind = tbl2.ListeningBind

			if listeningBind then
				tbl2.SuppressMenuHotkeysUntil = os.clock() + 0.2
				local v13 = fn5(arg)

				if arg.KeyCode == Enum.KeyCode.Escape or arg.KeyCode == Enum.KeyCode.Backspace or arg.KeyCode == Enum.KeyCode.Delete or v13 == tbl2.Key or v13 == tbl2.UnloadKey then
					listeningBind:SetKey(nil)
				else
					if not v13 then
						return
					end
					listeningBind:SetKey(v13)
				end

				listeningBind:StopListening()
				return
			end

			if tbl2.KeybindPopup and (arg.UserInputType == Enum.UserInputType.MouseButton1 or arg.UserInputType == Enum.UserInputType.MouseButton2) then
				local v13 = tbl:MouseLocation(arg)

				if not tbl:IsPointInGui(tbl2.KeybindPopup.Frame, v13) then
					task.defer(function()
						tbl2:CloseKeybindPopup()
					end)
				end

				return
			end

			if arg2 or UserInputService:GetFocusedTextBox() then
				return
			end

			for _, keybind in ipairs(tbl2.Keybinds) do
				if keybind:Matches(arg) then
					if keybind.Mode == "Hold" then
						keybind:SetActive(true)
					elseif keybind.Mode == "Toggle" then
						keybind:SetActive(not keybind.Active)
					elseif keybind.Mode == "Off Hold" then
						keybind:SetActive(false)
					end
				end
			end
		end)

		tbl:CreateConnection(UserInputService.InputEnded, function(arg)
			for _, keybind in ipairs(tbl2.Keybinds) do
				if keybind:Matches(arg) then
					if keybind.Mode == "Hold" then
						keybind:SetActive(false)
					elseif keybind.Mode == "Off Hold" then
						keybind:SetActive(true)
					end
				end
			end
		end)

		tbl:CreateConnection(UserInputService.InputBegan, function(arg)
			local listeningBind = tbl2.ListeningBind

			if not listeningBind then
				listeningBind = os.clock() < (tbl2.SuppressMenuHotkeysUntil or 0)
			end

			if listeningBind then
				return
			end

			if arg.KeyCode and arg.KeyCode == tbl2.Key then
				tbl2.Enabled = not tbl2.Enabled
				tbl2:Fade(tbl2.Enabled)
			elseif arg.KeyCode and arg.KeyCode == tbl2.UnloadKey then
				tbl2:Unload()
			end
		end)

		return setmetatable(tbl2, index)
	end

	index.CreatePage = function(window, arg)
		local tbl2 = arg or {}
		local tbl3 = { Image = tbl2.image or tbl2.Image or tbl2.icon or tbl2.Icon }
		tbl3.Size = tbl2.size or tbl2.Size or UDim2.new(1, 0, 1, 0)
		tbl3.Open = false
		tbl3.Window = window

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Window.TabsHolder,
			Size = UDim2.new(1, 0, 0, 64),
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = false,
			ZIndex = 2,
			RenderTime = 0.15,
		})

		local ImageLabel = tbl:RenderObject("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = tbl3.Size,
			ZIndex = 2,
			Image = tbl3.Image,
			ImageColor3 = Color3.fromRGB(109, 109, 109),
		})

		local function fn3(imageColor3)
			ImageLabel.ImageColor3 = imageColor3
		end

		local TextButton = tbl:RenderObject("TextButton", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 0, 0, 1),
			Size = UDim2.new(1, 1, 1, -2),
			ZIndex = 2,
			RenderTime = 0.15,
		})

		local Frame4 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(0, 0, 0, 1),
			Size = UDim2.new(1, 0, 1, -2),
			ZIndex = 2,
			RenderTime = 0.15,
		})

		tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame4,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			Image = "rbxassetid://8509210785",
			ImageColor3 = Color3.fromRGB(12, 12, 12),
			ScaleType = "Tile",
			TileSize = UDim2.new(0, 8, 0, 8),
			ZIndex = 2,
		})

		local Frame5 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Window.PagesHolder,
			Position = UDim2.new(0, 20, 0, 20),
			Size = UDim2.new(1, -40, 1, -40),
			Visible = false,
		})

		local Frame6 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame5,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0.5, -10, 1, 0),
		})

		local Frame7 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame5,
			Position = UDim2.new(0.5, 10, 0, 0),
			Size = UDim2.new(0.5, -10, 1, 0),
		})

		tbl:RenderObject("UIListLayout", {
			Padding = UDim.new(0, 18),
			Parent = Frame6,
			FillDirection = "Vertical",
			HorizontalAlignment = "Left",
			VerticalAlignment = "Top",
		})

		tbl:RenderObject("UIListLayout", {
			Padding = UDim.new(0, 18),
			Parent = Frame7,
			FillDirection = "Vertical",
			HorizontalAlignment = "Left",
			VerticalAlignment = "Top",
		})

		tbl3.Page = Frame5
		tbl3.Left = Frame6
		tbl3.Right = Frame7

		tbl3.Set = function(arg2, open)
			tbl3.Open = open
			Frame5.Visible = tbl3.Open
			Frame2.Visible = tbl3.Open
			fn3(tbl3.Open and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(109, 109, 109))

			if tbl3.Open then
				tbl3.Window:SetPage(tbl3)
			end
		end

		tbl:CreateConnection(TextButton.Activated, function()
			if not tbl3.Open then
				tbl3:Set(true)
			end
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			fn3(Color3.fromRGB(204, 204, 204))
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			fn3(tbl3.Open and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(109, 109, 109))
		end)

		if #tbl3.Window.Pages == 0 then
			tbl3:Set(true)
		end

		tbl3.Window.Pages[#tbl3.Window.Pages + 1] = tbl3
		return setmetatable(tbl3, index2)
	end

	index2.CreateSection = function(arg, arg2)
		local tbl2 = arg2 or {}

		local tbl3 = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "New Section",
			Size = tbl2.size or tbl2.Size or 150,
			Side = tbl2.side or tbl2.Side or "Left",
			Content = {},
			Window = arg.Window,
			Page = arg,
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Parent = tbl3.Page[tbl3.Side],
			Size = UDim2.new(1, 0, 0, tbl3.Size),
			ZIndex = 2,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 2,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(23, 23, 23),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 2,
		})

		local Frame4 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(23, 23, 23),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 9, 0, -1),
			Size = UDim2.new(0, 0, 0, 2),
			ZIndex = 5,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 12, 0, 0),
			Size = UDim2.new(1, -26, 0, 15),
			ZIndex = 5,
			Font = "Code",
			RichText = true,
			Text = "<b>" .. tbl3.Name .. "</b>",
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local ImageLabel = tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Rotation = 180,
			Size = UDim2.new(1, -2, 0, 20),
			Visible = false,
			ZIndex = 4,
			Image = "rbxassetid://7783533907",
			ImageColor3 = Color3.fromRGB(23, 23, 23),
		})

		local ImageLabel2 = tbl:RenderObject("ImageLabel", {
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, -2, 0, 20),
			Visible = false,
			ZIndex = 4,
			Image = "rbxassetid://7783533907",
			ImageColor3 = Color3.fromRGB(23, 23, 23),
		})

		local TextButton = tbl:RenderObject("TextButton", {
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(1, -21, 0, 0),
			Size = UDim2.new(0, 15, 0, 14),
			Text = "",
			Visible = false,
			ZIndex = 4,
		})

		local TextButton2 = tbl:RenderObject("TextButton", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(1, -21, 1, -14),
			Size = UDim2.new(0, 15, 0, 14),
			Text = "",
			Visible = false,
			ZIndex = 4,
		})

		tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = TextButton,
			Position = UDim2.new(0, 4, 0, 4),
			Size = UDim2.new(0, 7, 0, 6),
			Visible = true,
			ZIndex = 4,
			Image = "rbxassetid://8548757311",
			ImageColor3 = Color3.fromRGB(205, 205, 205),
		})

		tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = TextButton2,
			Position = UDim2.new(0, 4, 0, 4),
			Size = UDim2.new(0, 7, 0, 6),
			Visible = true,
			ZIndex = 4,
			Image = "rbxassetid://8548723563",
			ImageColor3 = Color3.fromRGB(205, 205, 205),
		})

		local Frame5 = tbl:RenderObject("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Color3.fromRGB(45, 45, 45),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0, 6, 1, 0),
			Visible = false,
			ZIndex = 4,
		})

		tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(45, 45, 45),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 0, 0, -1),
			Size = UDim2.new(1, 0, 0, 1),
			ZIndex = 4,
		})

		local ScrollingFrame = tbl:RenderObject("ScrollingFrame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 4,
			AutomaticCanvasSize = "Y",
			BottomImage = "rbxassetid://7783554086",
			CanvasSize = UDim2.new(0, 0, 0, 0),
			MidImage = "rbxassetid://7783554086",
			ScrollBarImageColor3 = Color3.fromRGB(65, 65, 65),
			ScrollBarImageTransparency = 0,
			ScrollBarThickness = 5,
			TopImage = "rbxassetid://7783554086",
			VerticalScrollBarInset = "None",
		})

		tbl:RenderObject("UIListLayout", {
			Padding = UDim.new(0, 0),
			Parent = ScrollingFrame,
			FillDirection = "Vertical",
			HorizontalAlignment = "Center",
			VerticalAlignment = "Top",
		})

		tbl:RenderObject("UIPadding", { Parent = ScrollingFrame, PaddingTop = UDim.new(0, 15), PaddingBottom = UDim.new(0, 15) })
		Frame4.Size = UDim2.new(0, TextLabel.TextBounds.X + 6, 0, 2)
		tbl3.Holder = ScrollingFrame
		tbl3.Extra = Frame2

		tbl3.CloseContent = function()
			if tbl3.Content.Open then
				tbl3.Content:Close()
				tbl3.Content = {}
			end
		end

		tbl:CreateConnection(ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
			ImageLabel.Visible = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y
			ImageLabel2.Visible = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y
			Frame5.Visible = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y

			if ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y then
				TextButton.Visible = ScrollingFrame.CanvasPosition.Y > 5
				TextButton2.Visible = ScrollingFrame.CanvasPosition.Y + 5 < ScrollingFrame.AbsoluteCanvasSize.Y - ScrollingFrame.AbsoluteSize.Y
			end
		end)

		tbl:CreateConnection(ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"), function()
			if tbl3.Content.Open then
				tbl3.Content:Close()
				tbl3.Content = {}
			end

			TextButton.Visible = ScrollingFrame.CanvasPosition.Y > 1
			TextButton2.Visible = ScrollingFrame.CanvasPosition.Y + 1 < ScrollingFrame.AbsoluteCanvasSize.Y - ScrollingFrame.AbsoluteSize.Y
		end)

		tbl:CreateConnection(TextButton.Activated, function()
			ScrollingFrame.CanvasPosition = Vector2.new(0, math.clamp(ScrollingFrame.CanvasPosition.Y - 10, 0, ScrollingFrame.AbsoluteCanvasSize.Y - ScrollingFrame.AbsoluteSize.Y))
		end)

		tbl:CreateConnection(TextButton2.Activated, function()
			ScrollingFrame.CanvasPosition = Vector2.new(0, math.clamp(ScrollingFrame.CanvasPosition.Y + 10, 0, ScrollingFrame.AbsoluteCanvasSize.Y - ScrollingFrame.AbsoluteSize.Y))
		end)

		return setmetatable(tbl3, index3)
	end

	index3.CreateToggle = function(arg, arg2)
		local tbl2 = arg2 or {}

		local owner = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "New Toggle",
			State = tbl2.state or tbl2.State or tbl2.def or tbl2.Def or tbl2.default or tbl2.Default or false,
			Callback = tbl2.callback or tbl2.Callback or tbl2.callBack or tbl2.CallBack or function()
			end,
			Bindable = tbl2.Bindable == true or tbl2.bindable == true,
			EffectiveState = nil,
			Window = arg.Window,
			Page = arg.Page,
			Section = arg,
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = owner.Section.Holder,
			Size = UDim2.new(1, 0, 0, 18),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 20, 0, 5),
			Size = UDim2.new(0, 8, 0, 8),
			ZIndex = 3,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 0),
			Size = UDim2.new(1, -41, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = owner.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local TextButton = tbl:RenderObject("TextButton", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 5,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(77, 77, 77),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		local UIGradient = tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(140, 140, 140)),
			Enabled = true,
			Rotation = 90,
			Parent = Frame3,
		})

		owner.Get = function()
			return owner.State
		end

		owner.GetBindState = function()
			local bind = owner.Bind
			if not bind then
				return true
			end

			if owner.Window.IsMobile then
				return not bind.MobileVisible or bind.Active == true
			end

			if bind.Key == nil and bind.Mode ~= "Always" then
				return true
			end
			return bind.Active == true
		end

		owner.GetEffective = function()
			return owner.State == true and owner:GetBindState()
		end

		owner.ApplyEffective = function(arg3, arg4)
			local effective = owner:GetEffective()

			if arg4 or owner.EffectiveState ~= effective then
				owner.EffectiveState = effective
				owner.Callback(effective)
			end
		end

		owner.Set = function(arg3, arg4)
			owner.State = arg4 == true

			if not owner.State and owner.Window.IsMobile and owner.Bind and owner.Bind.Active then
				owner.Bind:SetActive(false, true)
			end

			Frame3.BackgroundColor3 = owner.State and owner.Window.Accent or Color3.fromRGB(77, 77, 77)
			owner:ApplyEffective(true)

			if owner.Bind then
				owner.Bind:Refresh()
			end
		end

		tbl:CreateConnection(TextButton.Activated, function()
			owner:Set(not owner:Get())
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(180, 180, 180))
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(140, 140, 140))
		end)

		if owner.Bindable and owner.Window.CreateKeybind then
			TextLabel.Size = UDim2.new(1, -96, 1, 0)
			local image = owner.Page and owner.Page.Image or "page"
			local window = owner.Window
			local createKeybind = window.CreateKeybind
			local tbl3 = {}
			local bindId = tbl2.BindId or tbl2.bindId

			if not bindId then
				local str = "|" .. owner.Section.Name .. "|" .. owner.Name
				bindId = tostring(image) .. str
			end

			tbl3.Id = bindId
			tbl3.Name = owner.Name
			tbl3.Owner = owner
			tbl3.Parent = Frame
			tbl3.Key = tbl2.Bind or tbl2.bind or tbl2.Keybind or tbl2.keybind
			tbl3.Mode = tbl2.BindMode or tbl2.bindMode or "Toggle"

			tbl3.Callback = function()
				owner:ApplyEffective(false)
			end

			owner.Bind = createKeybind(window, tbl3)
		end

		owner:Set(owner.State)
		owner.Window:RegisterConfigControl(owner, tbl2, "Toggle")
		return owner
	end

	index3.CreateSlider = function(arg, arg2)
		local tbl2 = arg2 or {}

		local tbl3 = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or nil,
			State = tbl2.state or tbl2.State or tbl2.def or tbl2.Def or tbl2.default or tbl2.Default or false,
			Min = tbl2.min or tbl2.Min or tbl2.minimum or tbl2.Minimum or 0,
			Max = tbl2.max or tbl2.Max or tbl2.maxmimum or tbl2.Maximum or 100,
			Ending = tbl2.ending or tbl2.Ending or tbl2.suffix or tbl2.Suffix or "",
			MaxText = tbl2.maxText or tbl2.MaxText or tbl2.maximumText or tbl2.MaximumText,
			Decimals = 1 / (tbl2.decimals or tbl2.Decimals or tbl2.tick or tbl2.Tick or 1),
			Callback = tbl2.callback or tbl2.Callback or tbl2.callBack or tbl2.CallBack or function()
			end,
			Holding = false,
			Window = arg.Window,
			Page = arg.Page,
			Section = arg,
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, (tbl3.Name and 24 or 13) + 5),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 40, 0, tbl3.Name and 18 or 5),
			Size = UDim2.new(1, -99, 0, 7),
			ZIndex = 3,
		})

		if tbl3.Name then
			tbl:RenderObject("TextLabel", {
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame,
				Position = UDim2.new(0, 41, 0, 4),
				Size = UDim2.new(1, -41, 0, 10),
				ZIndex = 3,
				Font = "Code",
				RichText = true,
				Text = tbl3.Name,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextSize = 9,
				TextStrokeTransparency = 1,
				TextXAlignment = "Left",
			})
		end

		local v = tbl
		local renderObject = v.RenderObject

		local tbl4 = {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
		}

		local isMobile = tbl3.Window.IsMobile

		if isMobile then
			isMobile = UDim2.new(0, 40, 0, tbl3.Name and 12 or 0)
		end

		tbl4.Position = isMobile or UDim2.fromScale(0, 0)
		tbl4.Size = tbl3.Window.IsMobile and UDim2.new(1, -99, 0, 18) or UDim2.new(1, 0, 1, 0)
		tbl4.Text = ""
		local textButton = renderObject(v, "TextButton", tbl4)

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(71, 71, 71),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		local Frame4 = tbl:RenderObject("Frame", {
			BackgroundColor3 = tbl3.Window.Accent,
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0, 0, 1, 0),
			ZIndex = 3,
		})

		local UIGradient = tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(175, 175, 175)),
			Enabled = true,
			Rotation = 270,
			Parent = Frame3,
		})

		local UIGradient2 = tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(175, 175, 175)),
			Enabled = true,
			Rotation = 90,
			Parent = Frame4,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame4,
			Position = UDim2.new(1, 0, 0.5, 1),
			Size = UDim2.new(0, 2, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 11,
			TextStrokeTransparency = 0.5,
			TextXAlignment = "Center",
			RenderTime = 0.15,
		})

		local v2 = nil
		local v3 = nil

		if tbl3.Window.IsMobile then
			local n = tbl3.Name and 10 or -2

			local function fn3(arg3, arg4)
				return tbl:RenderObject("TextButton", {
					Active = true,
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					FontFace = tbl3.Window.OverlayFontFace,
					Parent = Frame,
					Position = arg4,
					PreserveTextStyle = true,
					Size = UDim2.fromOffset(30, 22),
					Text = arg3,
					TextColor3 = Color3.fromRGB(180, 180, 180),
					TextSize = 13,
					TextStrokeTransparency = 1,
					ZIndex = 8,
				})
			end

			v2 = fn3("-", UDim2.fromOffset(10, n))
			v3 = fn3("+", UDim2.new(1, -50, 0, n))
			tbl3.MobileMinus = v2
			tbl3.MobilePlus = v3
		end

		tbl3.Set = function(arg3, arg4)
			local decimals = tbl3.Decimals
			local min = tbl3.Min
			local max = tbl3.Max
			tbl3.State = math.clamp(math.round(arg4 * tbl3.Decimals) / decimals, min, max)
			TextLabel.Text = "<b>" .. (tbl3.MaxText and tbl3.State >= tbl3.Max and tbl3.MaxText or tbl3.State .. tbl3.Ending) .. "</b>"
			Frame4.Size = UDim2.new(1 - (tbl3.Max - tbl3.State) / (tbl3.Max - tbl3.Min), 0, 1, 0)
			tbl3.Callback(tbl3:Get())
		end

		tbl3.Refresh = function(arg3, arg4)
			local v4 = tbl:MouseLocation(arg4)
			local v5 = tbl3
			local set = v5.Set
			local clamp = math.clamp
			local floor = math.floor
			local x = Frame3.AbsoluteSize.X
			local n = tbl3.Min + (tbl3.Max - tbl3.Min) * math.clamp(v4.X - Frame4.AbsolutePosition.X, 0, Frame3.AbsoluteSize.X) / x
			local decimals = tbl3.Decimals
			local min = tbl3.Min
			local max = tbl3.Max
			set(v5, clamp(floor(n * tbl3.Decimals) / decimals, min, max))
		end

		tbl3.Get = function()
			return tbl3.State
		end

		tbl3.Step = function(arg3, arg4)
			tbl3:Set(tbl3.State + arg4 / tbl3.Decimals)
		end

		local v4 = nil
		local v5 = nil
		local flag = false

		local function fn3()
			tbl3.Holding = false
			v4 = nil
			v5 = nil
			flag = false
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(175, 175, 175))
			UIGradient2.Color = UIGradient.Color
		end

		tbl:CreateConnection(textButton.InputBegan, function(arg3)
			local userInputType = arg3.UserInputType
			if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
				return
			end
			local v6 = tbl:MouseLocation(arg3)
			if v2 and tbl:IsPointInGui(v2, v6) or v3 and tbl:IsPointInGui(v3, v6) then
				return
			end
			v4 = arg3
			v5 = v6
			flag = false

			if userInputType == Enum.UserInputType.MouseButton1 then
				tbl3:Refresh(arg3)
			end

			tbl3.Holding = true
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(215, 215, 215))
			local color2 = Color3.fromRGB
			UIGradient2.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color2(215, 215, 215))
		end)

		tbl:CreateConnection(textButton.MouseEnter, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(215, 215, 215))
			local color2 = Color3.fromRGB
			UIGradient2.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color2(215, 215, 215))
		end)

		tbl:CreateConnection(textButton.MouseLeave, function()
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), tbl3.Holding and Color3.fromRGB(215, 215, 215) or Color3.fromRGB(175, 175, 175))
			UIGradient2.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), tbl3.Holding and Color3.fromRGB(215, 215, 215) or Color3.fromRGB(175, 175, 175))
		end)

		tbl:CreateConnection(UserInputService.InputChanged, function(arg3)
			if not tbl3.Holding or not v4 then
				return
			end

			if v4.UserInputType == Enum.UserInputType.Touch then
				if arg3 == v4 then
					local n = tbl:MouseLocation(arg3) - v5

					if not flag and n.Magnitude >= 6 then
						if math.abs(n.Y) > math.abs(n.X) then
							fn3()
							return
						end
						flag = true
					end

					if flag then
						tbl3:Refresh(arg3)
					end
				end
			elseif arg3.UserInputType == Enum.UserInputType.MouseMovement then
				tbl3:Refresh(arg3)
			end
		end)

		tbl:CreateConnection(UserInputService.InputEnded, function(arg3)
			if tbl3.Holding and v4 and (arg3 == v4 or v4.UserInputType == Enum.UserInputType.MouseButton1 and arg3.UserInputType == Enum.UserInputType.MouseButton1) then
				if v4.UserInputType == Enum.UserInputType.Touch and not flag then
					tbl3:Refresh(arg3)
				end

				fn3()
			end
		end)

		tbl3:Set(tbl3.State)
		tbl3.Window:RegisterConfigControl(tbl3, tbl2, "Slider")
		return tbl3
	end

	index3.CreateDropdown = function(arg, arg2)
		local tbl2 = arg2 or {}

		local tbl3 = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "New Dropdown",
			State = tbl2.state or tbl2.State or tbl2.def or tbl2.Def or tbl2.default or tbl2.Default or 1,
			Options = tbl2.options or tbl2.Options or tbl2.list or tbl2.List or { 1, 2, 3 },
			Callback = tbl2.callback or tbl2.Callback or tbl2.callBack or tbl2.CallBack or function()
			end,
			Content = { Open = false },
			Window = arg.Window,
			Page = arg.Page,
			Section = arg,
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, 39),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 40, 0, 15),
			Size = UDim2.new(1, -98, 0, 20),
			ZIndex = 3,
		})

		tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 4),
			Size = UDim2.new(1, -41, 0, 10),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = tbl3.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local TextButton = tbl:RenderObject("TextButton", {
			Active = true,
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Interactable = true,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 5,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(36, 36, 36),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220)),
			Enabled = true,
			Rotation = 270,
			Parent = Frame3,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(0, 8, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(155, 155, 155),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(1, -11, 0.5, -4),
			Size = UDim2.new(0, 7, 0, 6),
			Image = "rbxassetid://8532000591",
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			ZIndex = 3,
		})

		tbl3.Set = function(arg3, state)
			tbl3.State = state
			TextLabel.Text = tbl3.Options[tbl3:Get()]
			tbl3.Callback(tbl3:Get())

			if tbl3.Content.Open then
				tbl3.Content:Refresh(tbl3:Get())
			end
		end

		tbl3.Get = function()
			return tbl3.State
		end

		tbl3.Open = function()
			tbl3.Section:CloseContent()
			local tbl4 = {}
			local tbl5 = {}
			local v = nil
			local flag = false
			local n = math.max(tbl3.Window.MenuScale and tbl3.Window.MenuScale.Scale or 1, 0.001)
			local absolutePosition = tbl3.Section.Extra.AbsolutePosition
			local n2 = (Frame2.AbsolutePosition + Vector2.new(0, Frame2.AbsoluteSize.Y) - absolutePosition) / n + Vector2.new(0, 1)

			local Frame4 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = tbl3.Section.Extra,
				Position = UDim2.fromOffset(n2.X, n2.Y),
				Size = UDim2.new(1, -98, 0, 18 * #tbl3.Options + 2),
				ZIndex = 20,
			})

			local Frame5 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame4,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 20,
			})

			local Frame6 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(35, 35, 35),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame5,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 21,
			})

			for i, option in ipairs(tbl3.Options) do
				local Frame7 = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(35, 35, 35),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Frame6,
					Position = UDim2.new(0, 0, 0, 18 * (i - 1)),
					Size = UDim2.new(1, 0, 1 / #tbl3.Options, 0),
					ZIndex = 21,
				})

				local TextLabel2 = tbl:RenderObject("TextLabel", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Frame7,
					Position = UDim2.new(0, 8, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 22,
					Font = "Code",
					RichText = true,
					Text = tostring(option),
					TextColor3 = i == tbl3.State and tbl3.Window.Accent or Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextXAlignment = "Left",
				})

				local TextButton2 = tbl:RenderObject("TextButton", {
					Active = true,
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Interactable = true,
					Parent = Frame7,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					ZIndex = 23,
				})

				local flag2 = false

				local v2 = tbl:CreateConnection(TextButton2.InputBegan, function(arg3)
					local userInputType = arg3.UserInputType
					if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
						return
					end

					if flag2 or not tbl3.Content.Open then
						return
					end
					flag2 = true
					tbl3:Set(i)
					tbl3.Section:CloseContent()
				end)

				local v3 = tbl:CreateConnection(TextButton2.MouseEnter, function()
					Frame7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end)

				local v4 = tbl:CreateConnection(TextButton2.MouseLeave, function()
					Frame7.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				end)

				tbl5[#tbl5 + 1] = v2
				tbl5[#tbl5 + 1] = v3
				tbl5[#tbl5 + 1] = v4
				tbl4[#tbl4 + 1] = { i, TextLabel2, Frame7, TextButton2 }
			end

			tbl3.Content.Close = function()
				if flag then
					return
				end
				flag = true
				tbl3.Content.Open = false
				Frame3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)

				for _, v2 in ipairs(tbl5) do
					if v2 then
						v2:Disconnect()
					end
				end

				if v then
					v:Disconnect()
					v = nil
				end

				if Frame4 then
					Frame4:Destroy()
				end

				tbl3.Content.Refresh = function()
				end

				tbl5 = {}
				tbl4 = {}
			end

			tbl3.Content.Refresh = function()
				for _, v2 in pairs(tbl4) do
					v2[2].TextColor3 = v2[1] == tbl3.State and tbl3.Window.Accent or Color3.fromRGB(205, 205, 205)
				end
			end

			tbl3.Content.Open = true
			tbl3.Section.Content = tbl3.Content
			Frame3.BackgroundColor3 = Color3.fromRGB(46, 46, 46)

			v = tbl:CreateConnection(UserInputService.InputBegan, function(arg3, arg4)
				if arg4 or not tbl3.Content.Open then
					return
				end
				local userInputType = arg3.UserInputType
				if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
					return
				end
				local v2 = tbl:MouseLocation(arg3)

				if not tbl:IsPointInGui(Frame4, v2) and not tbl:IsPointInGui(Frame, v2) then
					tbl3.Section:CloseContent()
				end
			end)
		end

		tbl:CreateConnection(TextButton.Activated, function()
			if tbl3.Content.Open then
				tbl3.Section:CloseContent()
			else
				tbl3:Open()
			end
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			Frame3.BackgroundColor3 = tbl3.Content.Open and Color3.fromRGB(46, 46, 46) or Color3.fromRGB(36, 36, 36)
		end)

		tbl3:Set(tbl3.State)
		tbl3.Window:RegisterConfigControl(tbl3, tbl2, "Dropdown")
		return tbl3
	end

	index3.CreateMultibox = function(arg, arg2)
		local tbl2 = arg2 or {}

		local tbl3 = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "New Dropdown",
			State = tbl2.state or tbl2.State or tbl2.def or tbl2.Def or tbl2.default or tbl2.Default or { 1 },
			Options = tbl2.options or tbl2.Options or tbl2.list or tbl2.List or { 1, 2, 3 },
			Minimum = tbl2.min or tbl2.Min or tbl2.minimum or tbl2.Minimum or 0,
			Maximum = tbl2.max or tbl2.Max or tbl2.maximum or tbl2.Maximum or 1000,
			Callback = tbl2.callback or tbl2.Callback or tbl2.callBack or tbl2.CallBack or function()
			end,
			Content = { Open = false },
			Window = arg.Window,
			Page = arg.Page,
			Section = arg,
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, 39),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 40, 0, 15),
			Size = UDim2.new(1, -98, 0, 20),
			ZIndex = 3,
		})

		tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 4),
			Size = UDim2.new(1, -41, 0, 10),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = tbl3.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local TextButton = tbl:RenderObject("TextButton", {
			Active = true,
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Interactable = true,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 5,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(36, 36, 36),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220)),
			Enabled = true,
			Rotation = 270,
			Parent = Frame3,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(0, 8, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(155, 155, 155),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		tbl:RenderObject("ImageLabel", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(1, -11, 0.5, -4),
			Size = UDim2.new(0, 7, 0, 6),
			Image = "rbxassetid://8532000591",
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			ZIndex = 3,
		})

		tbl3.Set = function(arg3, state)
			table.sort(state)
			tbl3.State = state
			local options = tbl3.Options
			local v = tbl:Serialise(tbl:Sort(tbl3:Get(), options))
			TextLabel.Text = v == "" and "-" or v
			tbl3.Callback(tbl3:Get())

			if tbl3.Content.Open then
				tbl3.Content:Refresh(tbl3:Get())
			end
		end

		tbl3.Get = function()
			return tbl3.State
		end

		tbl3.Open = function()
			tbl3.Section:CloseContent()
			local tbl4 = {}
			local tbl5 = {}
			local v = nil
			local flag = false
			local n = math.max(tbl3.Window.MenuScale and tbl3.Window.MenuScale.Scale or 1, 0.001)
			local absolutePosition = tbl3.Section.Extra.AbsolutePosition
			local n2 = (Frame2.AbsolutePosition + Vector2.new(0, Frame2.AbsoluteSize.Y) - absolutePosition) / n + Vector2.new(0, 1)

			local Frame4 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = tbl3.Section.Extra,
				Position = UDim2.fromOffset(n2.X, n2.Y),
				Size = UDim2.new(1, -98, 0, 18 * #tbl3.Options + 2),
				ZIndex = 20,
			})

			local Frame5 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame4,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 20,
			})

			local Frame6 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(21, 21, 21),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame5,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 21,
			})

			for i, option in ipairs(tbl3.Options) do
				local Frame7 = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(35, 35, 35),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Frame6,
					Position = UDim2.new(0, 0, 0, 18 * (i - 1)),
					Size = UDim2.new(1, 0, 1 / #tbl3.Options, 0),
					ZIndex = 21,
				})

				local TextLabel2 = tbl:RenderObject("TextLabel", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Frame7,
					Position = UDim2.new(0, 8, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 22,
					Font = "Code",
					RichText = true,
					Text = tostring(option),
					TextColor3 = table.find(tbl3.State, i) and tbl3.Window.Accent or Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextXAlignment = "Left",
				})

				local TextButton2 = tbl:RenderObject("TextButton", {
					Active = true,
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Interactable = true,
					Parent = Frame7,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					ZIndex = 23,
				})

				local v2 = tbl:CreateConnection(TextButton2.InputBegan, function(arg3)
					local userInputType = arg3.UserInputType
					if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
						return
					end

					if not tbl3.Content.Open then
						return
					end
					local v2 = tbl3:Get()

					if table.find(v2, i) then
						if tbl3.Minimum <= #v2 - 1 then
							table.remove(v2, table.find(v2, i))
						end
					elseif #v2 + 1 <= tbl3.Maximum then
						table.insert(v2, i)
					end

					tbl3:Set(v2)
				end)

				local v3 = tbl:CreateConnection(TextButton2.MouseEnter, function()
					Frame7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end)

				local v4 = tbl:CreateConnection(TextButton2.MouseLeave, function()
					Frame7.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				end)

				tbl5[#tbl5 + 1] = v2
				tbl5[#tbl5 + 1] = v3
				tbl5[#tbl5 + 1] = v4
				tbl4[#tbl4 + 1] = { i, TextLabel2, Frame7, TextButton2 }
			end

			tbl3.Content.Close = function()
				if flag then
					return
				end
				flag = true
				tbl3.Content.Open = false
				Frame3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)

				for _, v2 in ipairs(tbl5) do
					if v2 then
						v2:Disconnect()
					end
				end

				if v then
					v:Disconnect()
					v = nil
				end

				if Frame4 then
					Frame4:Destroy()
				end

				tbl3.Content.Refresh = function()
				end

				tbl5 = {}
				tbl4 = {}
			end

			tbl3.Content.Refresh = function()
				for _, v2 in pairs(tbl4) do
					v2[2].TextColor3 = table.find(tbl3.State, v2[1]) and tbl3.Window.Accent or Color3.fromRGB(205, 205, 205)
				end
			end

			tbl3.Content.Open = true
			tbl3.Section.Content = tbl3.Content
			Frame3.BackgroundColor3 = Color3.fromRGB(46, 46, 46)

			v = tbl:CreateConnection(UserInputService.InputBegan, function(arg3, arg4)
				if arg4 or not tbl3.Content.Open then
					return
				end
				local userInputType = arg3.UserInputType
				if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
					return
				end
				local v2 = tbl:MouseLocation(arg3)

				if not tbl:IsPointInGui(Frame4, v2) and not tbl:IsPointInGui(Frame, v2) then
					tbl3.Section:CloseContent()
				end
			end)
		end

		tbl:CreateConnection(TextButton.Activated, function()
			if tbl3.Content.Open then
				tbl3.Section:CloseContent()
			else
				tbl3:Open()
			end
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			Frame3.BackgroundColor3 = tbl3.Content.Open and Color3.fromRGB(46, 46, 46) or Color3.fromRGB(36, 36, 36)
		end)

		tbl3:Set(tbl3.State)
		tbl3.Window:RegisterConfigControl(tbl3, tbl2, "Multibox")
		return tbl3
	end

	index3.CreateLegacyKeybind = function(arg, arg2)
		local tbl2 = arg2 or {}

		local tbl3 = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "New Toggle",
			State = tbl2.state or tbl2.State or tbl2.def or tbl2.Def or tbl2.default or tbl2.Default or nil,
			Mode = tbl2.mode or tbl2.Mode or "Hold",
			Callback = tbl2.callback or tbl2.Callback or tbl2.callBack or tbl2.CallBack or function()
			end,
			Active = false,
			Holding = false,
			Window = arg.Window,
			Page = arg.Page,
			Section = arg,
		}

		local tbl4 = {
			KeyCodes = {
				"Q",
				"W",
				"E",
				"R",
				"T",
				"Y",
				"U",
				"I",
				"O",
				"P",
				"A",
				"S",
				"D",
				"F",
				"G",
				"H",
				"J",
				"K",
				"L",
				"Z",
				"X",
				"C",
				"V",
				"B",
				"N",
				"M",
				"One",
				"Two",
				"Three",
				"Four",
				"Five",
				"Six",
				"Seveen",
				"Eight",
				"Nine",
				"0",
				"Insert",
				"Tab",
				"Home",
				"End",
				"LeftAlt",
				"LeftControl",
				"LeftShift",
				"RightAlt",
				"RightControl",
				"RightShift",
				"CapsLock",
			},
			Inputs = { "MouseButton1", "MouseButton2", "MouseButton3" },
			Shortened = {
				MouseButton1 = "M1",
				MouseButton2 = "M2",
				MouseButton3 = "M3",
				Insert = "INS",
				LeftAlt = "LA",
				LeftControl = "LC",
				LeftShift = "LS",
				RightAlt = "RA",
				RightControl = "RC",
				RightShift = "RS",
				CapsLock = "CL",
			},
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, 18),
			ZIndex = 3,
		})

		tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 0),
			Size = UDim2.new(1, -41, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = tbl3.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local TextButton = tbl:RenderObject("TextButton", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 0),
			Size = UDim2.new(1, -61, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(114, 114, 114),
			TextStrokeColor3 = Color3.fromRGB(15, 15, 15),
			TextSize = 9,
			TextStrokeTransparency = 0,
			TextXAlignment = "Right",
		})

		tbl3.Set = function(arg3, state)
			tbl3.State = state or {}
			tbl3.Active = false
			TextLabel.Text = "[" .. (#tbl3:Get() > 0 and tbl3:Shorten(tbl3:Get()[2]) or "-") .. "]"
			tbl3.Callback(tbl3:Get())
		end

		tbl3.Get = function()
			return tbl3.State
		end

		tbl3.Shorten = function(arg3, arg4)
			for k, v in pairs(tbl4.Shortened) do
				arg4 = string.gsub(arg4, k, v)
			end

			return arg4
		end

		tbl3.Change = function(arg3, arg4)
			if arg4.EnumType then
				if arg4.EnumType == Enum.KeyCode or arg4.EnumType == Enum.UserInputType then
					if table.find(tbl4.KeyCodes, arg4.Name) or table.find(tbl4.Inputs, arg4.Name) then
						local v = tbl3
						local set = v.Set
						local tbl5 = {}
						local str = arg4.EnumType == Enum.KeyCode and "KeyCode" or "UserInputType"
						local name = arg4.Name
						tbl5[1] = str
						tbl5[2] = name
						set(v, tbl5)
						return true
					end
				end
			end
		end

		tbl:CreateConnection(TextButton.Activated, function()
			tbl3.Holding = true
			TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		end)

		tbl:CreateConnection(TextButton.MouseButton2Click, function()
			tbl3:Set()
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			TextLabel.TextColor3 = Color3.fromRGB(164, 164, 164)
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			TextLabel.TextColor3 = tbl3.Holding and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(114, 114, 114)
		end)

		tbl:CreateConnection(UserInputService.InputBegan, function(arg3)
			if tbl3.Holding then
				if tbl3:Change(arg3.KeyCode.Name ~= "Unknown" and arg3.KeyCode or arg3.UserInputType) then
					tbl3.Holding = false
					TextLabel.TextColor3 = Color3.fromRGB(114, 114, 114)
				end
			end

			if tbl3:Get()[1] and tbl3:Get()[2] then
				if arg3.KeyCode == Enum[tbl3:Get()[1]][tbl3:Get()[2]] or arg3.UserInputType == Enum[tbl3:Get()[1]][tbl3:Get()[2]] then
					if tbl3.Mode == "Hold" then
						tbl3.Active = true
					elseif tbl3.Mode == "Toggle" then
						tbl3.Active = not tbl3.Active
					end
				end
			end
		end)

		tbl:CreateConnection(UserInputService.InputEnded, function(arg3)
			if tbl3:Get()[1] and tbl3:Get()[2] then
				if arg3.KeyCode == Enum[tbl3:Get()[1]][tbl3:Get()[2]] or arg3.UserInputType == Enum[tbl3:Get()[1]][tbl3:Get()[2]] then
					if tbl3.Mode == "Hold" then
						tbl3.Active = false
					end
				end
			end
		end)

		tbl3:Set(tbl3.State)
		return tbl3
	end

	index3.CreateKeybind = function(arg, arg2)
		local tbl2 = arg2 or {}
		local name = tbl2.Name or tbl2.name or "Keybind"

		local Frame = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = arg.Holder,
			Size = UDim2.new(1, 0, 0, 18),
			ZIndex = 3,
		})

		tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 0),
			Size = UDim2.new(1, -96, 1, 0),
			Text = name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 13,
			TextXAlignment = "Left",
			ZIndex = 3,
		})

		local state = tbl2.Key or tbl2.key or tbl2.State or tbl2.state

		if type(state) == "table" and type(state[1]) == "string" and type(state[2]) == "string" and Enum[state[1]] then
			state = Enum[state[1]][state[2]]
		end

		local image = arg.Page and arg.Page.Image or "page"
		local window = arg.Window
		local createKeybind = window.CreateKeybind
		local v = window
		local tbl3 = {}
		local bindId = tbl2.BindId or tbl2.bindId

		if not bindId then
			local str = "|" .. arg.Name .. "|" .. name
			bindId = tostring(image) .. str
		end

		tbl3.Id = bindId
		tbl3.Name = name
		tbl3.Parent = Frame
		tbl3.Key = state
		tbl3.Mode = tbl2.Mode or tbl2.mode or "Hold"
		tbl3.InitialActive = tbl2.Active == true or tbl2.active == true

		tbl3.Callback = tbl2.Callback or tbl2.callback or function()
		end

		local v2, v3 = createKeybind(v, tbl3)

		if arg.Window.IsMobile and not v2.MobileVisible then
			v2:SetMobileVisible(true)
		end

		if (v2.Key ~= nil or v2.Mode == "Always") and (v3 or state ~= nil) then
			pcall(v2.Callback, v2.Active, v2)
		end

		return v2
	end

	index3.CreateColorpicker = function(section, arg)
		local tbl2 = arg or {}
		local tbl3 = { Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "New Toggle" }
		tbl3.State = tbl2.state or tbl2.State or tbl2.def or tbl2.Def or tbl2.default or tbl2.Default or Color3.fromRGB(255, 255, 255)

		tbl3.Callback = tbl2.callback or tbl2.Callback or tbl2.callBack or tbl2.CallBack or function()
		end

		tbl3.Content = { Open = false }
		tbl3.Window = section.Window
		tbl3.Page = section.Page
		tbl3.Section = section

		if typeof(tbl3.State) ~= "Color3" then
			tbl3.State = Color3.fromRGB(255, 255, 255)
		end

		local Frame = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, 18),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(1, -38, 0, 4),
			Size = UDim2.new(0, 17, 0, 9),
			ZIndex = 3,
		})

		tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 0),
			Size = UDim2.new(1, -41, 1, 0),
			ZIndex = 3,
			Font = "Code",
			RichText = true,
			Text = tbl3.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local TextButton = tbl:RenderObject("TextButton", {
			Active = true,
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Interactable = true,
			Parent = Frame,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 5,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		local UIGradient = tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(140, 140, 140)),
			Enabled = true,
			Rotation = 90,
			Parent = Frame3,
		})

		tbl3.Set = function(arg2, state)
			if typeof(state) ~= "Color3" then
				return
			end
			tbl3.State = state
			Frame3.BackgroundColor3 = tbl3.State
			tbl3.Callback(tbl3:Get())

			if tbl3.Content.Open then
				tbl3.Content:Refresh(tbl3:Get())
			end
		end

		tbl3.Get = function()
			return tbl3.State
		end

		tbl3.Open = function()
			tbl3.Section:CloseContent()
			local tbl4 = {}
			local connection = nil
			local vector2 = Vector2.new(180, 175)
			local n = math.max(tbl3.Window.MenuScale and tbl3.Window.MenuScale.Scale or 1, 0.001)
			local page = tbl3.Page and tbl3.Page.Page or tbl3.Window.MainFrame or tbl3.Section.Extra
			local n2 = (Frame2.AbsolutePosition - page.AbsolutePosition) / n
			local n3 = Frame2.AbsoluteSize / n
			local n4 = page.AbsoluteSize / n
			local n5 = n2.X + n3.X - vector2.X
			local n6 = n2.Y + n3.Y + 1

			if n4.Y < n6 + vector2.Y then
				n6 = n2.Y - vector2.Y - 1
			end

			local n7 = math.clamp(n5, 0, math.max(n4.X - vector2.X, 0))
			local n8 = math.clamp(n6, 0, math.max(n4.Y - vector2.Y, 0))

			local Frame4 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = page,
				Position = UDim2.fromOffset(n7, n8),
				Size = UDim2.fromOffset(vector2.X, vector2.Y),
				ZIndex = 20,
			})

			local Frame5 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(60, 60, 60),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Parent = Frame4,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 20,
			})

			local Frame6 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame5,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 21,
			})

			local Frame7 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame6,
				Position = UDim2.new(0, 2, 0, 2),
				Size = UDim2.new(0, 152, 0, 152),
				ZIndex = 22,
			})

			local Frame8 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame6,
				Position = UDim2.new(1, -19, 0, 2),
				Size = UDim2.new(0, 17, 0, 152),
				ZIndex = 22,
			})

			local Frame9 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame6,
				Position = UDim2.new(0, 2, 1, -14),
				Size = UDim2.new(0, 152, 0, 12),
				ZIndex = 22,
			})

			local Frame10 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame7,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 23,
			})

			local new = NumberSequenceKeypoint.new

			tbl:RenderObject("UIGradient", {
				Parent = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Parent = Frame10,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 24,
				}),
				Rotation = 0,
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new(1, 1) }),
			})

			local new2 = NumberSequenceKeypoint.new

			tbl:RenderObject("UIGradient", {
				Parent = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Parent = Frame10,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 25,
				}),
				Rotation = 90,
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), new2(1, 0) }),
			})

			local Frame11 = tbl:RenderObject("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 1,
				Parent = Frame10,
				Size = UDim2.new(0, 7, 0, 7),
				ZIndex = 26,
			})

			tbl:RenderObject("Frame", {
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 1,
				Parent = Frame11,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 27,
			})

			tbl:RenderObject("TextButton", {
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Interactable = true,
				Parent = Frame10,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				ZIndex = 28,
			})

			local Frame12 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Parent = Frame8,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 23,
			})

			local v = tbl
			local renderObject = v.RenderObject
			local tbl5 = {}
			local colorSequence = ColorSequence.new
			local tbl6 = {}
			local v2 = ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1))
			local v3 = ColorSequenceKeypoint.new(0.16666666666666666, Color3.fromHSV(0.16666666666666666, 1, 1))
			local v4 = ColorSequenceKeypoint.new(0.33333333333333331, Color3.fromHSV(0.33333333333333331, 1, 1))
			local v5 = ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1))
			local v6 = ColorSequenceKeypoint.new(0.66666666666666663, Color3.fromHSV(0.66666666666666663, 1, 1))
			local v7 = ColorSequenceKeypoint.new(0.83333333333333337, Color3.fromHSV(0.83333333333333337, 1, 1))
			local new3 = ColorSequenceKeypoint.new
			local color = Color3.fromHSV
			tbl6[1] = v2
			tbl6[2] = v3
			tbl6[3] = v4
			tbl6[4] = v5
			tbl6[5] = v6
			tbl6[6] = v7

			do
				local values = table.pack(new3(1, color(1, 1, 1)))
				table.move(values, 1, values.n, 7, tbl6)
			end

			tbl5.Color = colorSequence(tbl6)
			tbl5.Parent = Frame12
			tbl5.Rotation = 90
			renderObject(v, "UIGradient", tbl5)

			local Frame13 = tbl:RenderObject("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 1,
				Parent = Frame12,
				Size = UDim2.new(1, 4, 0, 3),
				ZIndex = 26,
			})

			tbl:RenderObject("TextButton", {
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Interactable = true,
				Parent = Frame12,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				ZIndex = 28,
			})

			local Frame14 = tbl:RenderObject("Frame", {
				BackgroundColor3 = tbl3.State,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Parent = Frame9,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 23,
			})

			local new4 = NumberSequenceKeypoint.new

			tbl:RenderObject("UIGradient", {
				Parent = Frame14,
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new4(1, 0.8) }),
			})

			local n9, n10, n11 = tbl3.State:ToHSV()
			local str = nil
			local flag = false
			local flag2 = false

			local function fn3(arg2, arg3)
				local connection2 = arg2:Connect(arg3)
				tbl4[#tbl4 + 1] = connection2
				return connection2
			end

			local function fn4(arg2)
				return tbl:MouseLocation(arg2)
			end

			local function fn5(arg2, arg3)
				return tbl:IsPointInGui(arg2, arg3)
			end

			local function fn6(arg2)
				local absolutePosition = Frame10.AbsolutePosition
				local absoluteSize = Frame10.AbsoluteSize
				if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
					return
				end
				n10 = math.clamp((arg2.X - absolutePosition.X) / absoluteSize.X, 0, 1)
				n11 = 1 - math.clamp((arg2.Y - absolutePosition.Y) / absoluteSize.Y, 0, 1)
				flag2 = true
				tbl3:Set(Color3.fromHSV(n9, n10, n11))
				flag2 = false
			end

			local function fn7(arg2)
				local absolutePosition = Frame12.AbsolutePosition
				local absoluteSize = Frame12.AbsoluteSize
				if absoluteSize.Y <= 0 then
					return
				end
				n9 = math.clamp((arg2.Y - absolutePosition.Y) / absoluteSize.Y, 0, 1)
				flag2 = true
				tbl3:Set(Color3.fromHSV(n9, n10, n11))
				flag2 = false
			end

			tbl3.Content.Close = function()
				if flag then
					return
				end
				flag = true
				tbl3.Content.Open = false
				str = nil

				for _, v8 in ipairs(tbl4) do
					if v8 then
						v8:Disconnect()
					end
				end

				tbl4 = {}

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if Frame4 then
					Frame4:Destroy()
				end

				tbl3.Content.Refresh = function()
				end
			end

			tbl3.Content.Refresh = function(arg2, backgroundColor3)
				if flag or typeof(backgroundColor3) ~= "Color3" then
					return
				end

				if not flag2 then
					local v8, v9, v10 = backgroundColor3:ToHSV()

					if v9 > 0.001 then
						n9 = v8
					end

					n10 = v9
					n11 = v10
				end

				Frame10.BackgroundColor3 = Color3.fromHSV(n9, 1, 1)
				Frame11.Position = UDim2.new(n10, 0, 1 - n11, 0)
				Frame13.Position = UDim2.new(0.5, 0, n9, 0)
				Frame14.BackgroundColor3 = backgroundColor3
			end

			tbl3.Content.Open = true
			tbl3.Section.Content = tbl3.Content
			tbl3.Content:Refresh(tbl3.State)

			if tbl3.Page and tbl3.Page.Page then
				fn3(tbl3.Page.Page:GetPropertyChangedSignal("Visible"), function()
					if not tbl3.Page.Page.Visible and tbl3.Content.Open then
						tbl3.Section:CloseContent()
					end
				end)
			end

			fn3(UserInputService.InputChanged, function(arg2)
				if not tbl3.Content.Open or not str then
					return
				end

				if arg2.UserInputType ~= Enum.UserInputType.MouseMovement and arg2.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				local v8 = fn4(arg2)

				if str == "ValSat" then
					fn6(v8)
				elseif str == "Hue" then
					fn7(v8)
				end
			end)

			fn3(UserInputService.InputEnded, function(arg2)
				if arg2.UserInputType == Enum.UserInputType.MouseButton1 or arg2.UserInputType == Enum.UserInputType.Touch then
					str = nil
				end
			end)

			connection = UserInputService.InputBegan:Connect(function(input)
				if not tbl3.Content.Open then
					return
				end
				local userInputType = input.UserInputType
				if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
					return
				end
				local v8 = fn4(input)

				if fn5(Frame10, v8) then
					str = "ValSat"
					fn6(v8)
					return
				end

				if fn5(Frame12, v8) then
					str = "Hue"
					fn7(v8)
					return
				end

				if not fn5(Frame4, v8) and not fn5(Frame, v8) then
					tbl3.Section:CloseContent()
				end
			end)
		end

		tbl:CreateConnection(TextButton.Activated, function()
			if tbl3.Content.Open then
				tbl3.Section:CloseContent()
			else
				tbl3:Open()
			end
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(180, 180, 180))
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(140, 140, 140))
		end)

		tbl3:Set(tbl3.State)
		tbl3.Window:RegisterConfigControl(tbl3, tbl2, "Colorpicker")
		return tbl3
	end

	index3.CreateTextbox = function(section, arg)
		local tbl2 = arg or {}
		local tbl3 = { Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "Textbox" }
		tbl3.State = tostring(tbl2.state or tbl2.State or tbl2.default or tbl2.Default or "")
		tbl3.Placeholder = tbl2.placeholder or tbl2.Placeholder or ""
		tbl3.MaxLength = tbl2.maxLength or tbl2.MaxLength
		tbl3.Numeric = tbl2.numeric or tbl2.Numeric or false

		tbl3.Callback = tbl2.callback or tbl2.Callback or function()
		end

		tbl3.Window = section.Window
		tbl3.Page = section.Page
		tbl3.Section = section

		local Frame = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, 39),
			ZIndex = 3,
		})

		tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 41, 0, 2),
			Size = UDim2.new(1, -61, 0, 13),
			ZIndex = 3,
			Text = tbl3.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 40, 0, 17),
			Size = UDim2.new(1, -80, 0, 17),
			ZIndex = 3,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(36, 36, 36),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		local TextBox = tbl:RenderObject("TextBox", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClearTextOnFocus = false,
			Parent = Frame3,
			PlaceholderColor3 = Color3.fromRGB(105, 105, 105),
			PlaceholderText = tbl3.Placeholder,
			Position = UDim2.new(0, 5, 0, 0),
			Size = UDim2.new(1, -10, 1, 0),
			Text = "",
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextTruncate = "AtEnd",
			TextXAlignment = "Left",
			ZIndex = 4,
		})

		local function fn3(arg2)
			local str = tostring(arg2 or "")
			local v

			if tbl3.Numeric then
				v = string.gsub(str, "[^%d]", "")
			else
				v = str
			end

			local str2

			if type(tbl3.MaxLength) == "number" and tbl3.MaxLength >= 0 then
				str2 = string.sub(v, 1, tbl3.MaxLength)
			else
				str2 = v
			end

			return str2
		end

		tbl3.Set = function(arg2, arg3, arg4)
			tbl3.State = fn3(arg3)
			TextBox.Text = tbl3.State

			if not arg4 then
				tbl3.Callback(tbl3.State)
			end
		end

		tbl3.Get = function()
			return fn3(TextBox.Text)
		end

		tbl:CreateConnection(TextBox.Focused, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		end)

		tbl:CreateConnection(TextBox.FocusLost, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			tbl3:Set(TextBox.Text)
		end)

		if tbl3.Numeric or tbl3.MaxLength then
			tbl:CreateConnection(TextBox:GetPropertyChangedSignal("Text"), function()
				local v = fn3(TextBox.Text)

				if TextBox.Text ~= v then
					TextBox.Text = v
				end
			end)
		end

		tbl3:Set(tbl3.State, true)
		tbl3.Window:RegisterConfigControl(tbl3, tbl2, "Textbox")
		return tbl3
	end

	index3.CreateSearchList = function(section, arg)
		local tbl2 = arg or {}
		local tbl3 = { Name = tbl2.name or tbl2.Name or "Search list" }
		tbl3.State = tostring(tbl2.state or tbl2.State or "")
		tbl3.Options = tbl2.options or tbl2.Options or {}

		tbl3.Callback = tbl2.callback or tbl2.Callback or function()
		end

		tbl3.Height = math.max(120, tonumber(tbl2.height or tbl2.Height) or 470)
		tbl3.ShowSelectionLabel = tbl2.ShowSelectionLabel ~= false
		tbl3.BoldSelected = tbl2.BoldSelected == true
		tbl3.NoBullet = tbl2.NoBullet == true
		tbl3.Filtered = {}
		tbl3.Window = section.Window
		tbl3.Page = section.Page
		tbl3.Section = section
		local n = 18
		local n2 = math.max(12, tonumber(tbl2.poolSize or tbl2.PoolSize) or 26)

		local tbl4 = {
			Common = Color3.fromRGB(190, 190, 190),
			Uncommon = Color3.fromRGB(80, 210, 95),
			Rare = Color3.fromRGB(75, 125, 235),
			Legendary = Color3.fromRGB(150, 75, 225),
			Godly = Color3.fromRGB(235, 75, 75),
			Ancient = Color3.fromRGB(235, 155, 50),
			Unique = Color3.fromRGB(245, 205, 55),
			Vintage = Color3.fromRGB(245, 205, 55),
			Chroma = Color3.fromRGB(235, 75, 185),
			Secret = Color3.fromRGB(105, 105, 105),
			Unobtainable = Color3.fromRGB(150, 150, 150),
			Promotional = Color3.fromRGB(65, 200, 195),
			Immortal = Color3.fromRGB(255, 70, 190),
			Developer = Color3.fromRGB(255, 145, 45),
			Diamond = Color3.fromRGB(70, 220, 255),
			["Easter 2020"] = Color3.fromRGB(255, 125, 205),
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, tbl3.Height),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 20, 0, 0),
			Size = UDim2.new(1, -40, 0, 20),
			ZIndex = 3,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(36, 36, 36),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220)),
			Rotation = 270,
			Parent = Frame3,
		})

		local TextBox = tbl:RenderObject("TextBox", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClearTextOnFocus = false,
			Parent = Frame3,
			PlaceholderColor3 = Color3.fromRGB(110, 110, 110),
			PlaceholderText = "Search...",
			Position = UDim2.new(0, 7, 0, 0),
			Size = UDim2.new(1, -24, 1, 0),
			Text = "",
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Left",
			ZIndex = 5,
		})

		tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(1, -17, 0, 0),
			Size = UDim2.new(0, 13, 1, 0),
			Text = "⌕",
			TextColor3 = Color3.fromRGB(125, 125, 125),
			TextSize = 9,
			TextStrokeTransparency = 1,
			ZIndex = 4,
		})

		local Frame4 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 20, 0, 28),
			Size = UDim2.new(1, -40, 1, -70),
			ZIndex = 3,
		})

		local ScrollingFrame = tbl:RenderObject("ScrollingFrame", {
			Active = true,
			BackgroundColor3 = Color3.fromRGB(31, 31, 31),
			BorderSizePixel = 0,
			BottomImage = "rbxassetid://7783554086",
			CanvasSize = UDim2.new(),
			MidImage = "rbxassetid://7783554086",
			Parent = Frame4,
			Position = UDim2.new(0, 1, 0, 1),
			ScrollBarImageColor3 = Color3.fromRGB(75, 75, 75),
			ScrollBarThickness = 5,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = true,
			Size = UDim2.new(1, -2, 1, -2),
			TopImage = "rbxassetid://7783554086",
			VerticalScrollBarInset = "ScrollBar",
			ZIndex = 3,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 22, 1, -38),
			Size = UDim2.new(1, -44, 0, 16),
			Text = "",
			TextColor3 = Color3.fromRGB(155, 155, 155),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextTruncate = "AtEnd",
			TextXAlignment = "Left",
			ZIndex = 3,
		})

		TextLabel.Visible = tbl3.ShowSelectionLabel

		local TextLabel2 = tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 22, 1, -22),
			Size = UDim2.new(1, -44, 0, 16),
			Text = "",
			TextColor3 = Color3.fromRGB(155, 155, 155),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextTruncate = "AtEnd",
			TextXAlignment = "Left",
			ZIndex = 3,
		})

		local tbl5 = {}

		local function fn3(arg2)
			if type(arg2) == "table" then
				return tostring(arg2.Display or arg2.Name or arg2.Key or "")
			end
			return tostring(arg2)
		end

		local function fn4(arg2)
			if type(arg2) == "table" then
				return tostring(arg2.Key or arg2.Value or arg2.Name or "")
			end
			return tostring(arg2)
		end

		local function fn5(arg2)
			local str = tostring(arg2 or "")

			for _, option in ipairs(tbl3.Options) do
				if fn4(option) == str then
					return option
				end
			end
		end

		local function fn6()
			local n3 = math.max(1, math.floor(ScrollingFrame.CanvasPosition.Y / n) + 1)

			for i, v in ipairs(tbl5) do
				local n4 = n3 + i - 1
				local v2 = tbl3.Filtered[n4]
				v.Option = v2
				v.Frame.Visible = v2 ~= nil

				if v2 then
					local v3 = fn4(v2)
					local flag = type(v2) == "table"

					if flag then
						flag = tostring(v2.Rarity or "")
					end

					flag = flag or ""
					local flag2 = type(v2) ~= "table" or v2.Available ~= false
					v.Frame.Position = UDim2.new(0, 0, 0, (n4 - 1) * n)
					local flag3 = v3 == tbl3.State
					local str = tbl3.NoBullet and "" or "  •  "
					v.Title.RichText = false
					v.Title.Text = str .. fn3(v2)
					v.Title.FontFace = tbl3.BoldSelected and flag3 and index.FontFaceBold or index.FontFace
					v.Title.TextColor3 = v3 == tbl3.State and tbl3.Window.Accent or not flag2 and Color3.fromRGB(82, 82, 82) or tbl4[flag] or Color3.fromRGB(205, 205, 205)
					v.Frame.BackgroundColor3 = v3 == tbl3.State and Color3.fromRGB(43, 43, 43) or Color3.fromRGB(31, 31, 31)
					v.Accent.Visible = v3 == tbl3.State
					v.Accent.BackgroundColor3 = tbl3.Window.Accent
				end
			end
		end

		local function fn7(arg2)
			local v = string.gsub(string.gsub(string.lower(TextBox.Text or ""), "^%s+", ""), "%s+$", "")
			tbl3.Filtered = {}

			for _, option in ipairs(tbl3.Options) do
				local lower = string.lower
				local v2 = fn3(option)
				local v3 = fn4(option)
				local flag = type(option) == "table"

				if flag then
					flag = tostring(option.Rarity or "")
				end

				local v4 = lower(v2 .. " " .. v3 .. " " .. (flag or ""))

				if v == "" or string.find(v4, v, 1, true) then
					tbl3.Filtered[#tbl3.Filtered + 1] = option
				end
			end

			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #tbl3.Filtered * n)

			if arg2 then
				ScrollingFrame.CanvasPosition = Vector2.zero
			end

			fn6()
		end

		for i = 1, n2 do
			local Frame5 = tbl:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(31, 31, 31),
				BorderSizePixel = 0,
				Parent = ScrollingFrame,
				Size = UDim2.new(1, -5, 0, 18),
				Visible = false,
				ZIndex = 3,
			})

			local TextLabel3 = tbl:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = Frame5,
				Position = UDim2.fromOffset(7, 0),
				Size = UDim2.new(1, -11, 1, 0),
				Text = "",
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextSize = 9,
				TextStrokeTransparency = 1,
				TextTruncate = "AtEnd",
				TextXAlignment = "Left",
				ZIndex = 4,
			})

			local Frame6 = tbl:RenderObject("Frame", {
				BackgroundColor3 = tbl3.Window.Accent,
				BorderSizePixel = 0,
				Parent = Frame5,
				Position = UDim2.fromOffset(0, 1),
				Size = UDim2.new(0, 2, 1, -2),
				Visible = false,
				ZIndex = 5,
			})

			local TextButton = tbl:RenderObject("TextButton", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = Frame5,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				ZIndex = 5,
			})

			local tbl6 = { Frame = Frame5, Title = TextLabel3, Accent = Frame6, Button = TextButton }
			tbl5[i] = tbl6

			tbl:CreateConnection(TextButton.Activated, function()
				if tbl6.Option then
					tbl3:Set(fn4(tbl6.Option))
				end
			end)

			tbl:CreateConnection(TextButton.MouseEnter, function()
				local option = tbl6.Option

				if option then
					local state = tbl3.State
					option = fn4(tbl6.Option) ~= state
				end

				if option then
					tbl6.Frame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				end
			end)

			tbl:CreateConnection(TextButton.MouseLeave, fn6)
		end

		tbl3.Get = function()
			return tbl3.State
		end

		tbl3.Set = function(arg2, arg3, arg4)
			local v = fn5(arg3)
			if not v then
				return false
			end
			tbl3.State = fn4(v)

			if tbl3.ShowSelectionLabel then
				TextLabel.Text = "selected: " .. fn3(v)
			end

			fn6()

			if not arg4 then
				tbl3.Callback(tbl3.State, v)
			end

			return true
		end

		tbl3.SetOptions = function(arg2, arg3, arg4, arg5, arg6)
			local canvasPosition = ScrollingFrame.CanvasPosition
			tbl3.Options = type(arg3) == "table" and arg3 or {}
			fn7(arg6 == true)

			if arg6 ~= true then
				local v = ScrollingFrame
				local vector2 = Vector2.new
				local clamp = math.clamp
				local y = canvasPosition.Y
				local n3 = math.max(0, #tbl3.Filtered * n - ScrollingFrame.AbsoluteWindowSize.Y)
				v.CanvasPosition = vector2(0, clamp(y, 0, n3))
			end

			if not tbl3.Options[1] then
				tbl3.State = ""

				if tbl3.ShowSelectionLabel then
					TextLabel.Text = "selected: none"
				end

				TextLabel2.Text = "no captured skins"
				fn6()
				return
			end

			if not tbl3:Set(arg4 or tbl3.State, arg5) and tbl3.Options[1] then
				tbl3:Set(fn4(tbl3.Options[1]), arg5)
			end
		end

		tbl3.SetStatus = function(arg2, arg3, textColor3)
			TextLabel2.Text = tostring(arg3 or "")
			TextLabel2.TextColor3 = textColor3 or Color3.fromRGB(155, 155, 155)
		end

		tbl:CreateConnection(TextBox:GetPropertyChangedSignal("Text"), function()
			fn7(true)
		end)

		tbl:CreateConnection(ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"), fn6)
		local flag = false
		local holder = tbl3.Section.Holder
		local scrollingEnabled = nil

		tbl:CreateConnection(ScrollingFrame.MouseEnter, function()
			flag = true

			if holder and holder:IsA("ScrollingFrame") then
				scrollingEnabled = holder.ScrollingEnabled
				holder.ScrollingEnabled = false
			end
		end)

		tbl:CreateConnection(ScrollingFrame.MouseLeave, function()
			flag = false

			if holder and holder:IsA("ScrollingFrame") and scrollingEnabled ~= nil then
				holder.ScrollingEnabled = scrollingEnabled
				scrollingEnabled = nil
			end
		end)

		tbl:CreateConnection(UserInputService.InputChanged, function(arg2)
			if arg2.UserInputType ~= Enum.UserInputType.MouseWheel then
				return
			end
			local mouseLocation = UserInputService:GetMouseLocation()
			local absolutePosition = ScrollingFrame.AbsolutePosition
			local absoluteSize = ScrollingFrame.AbsoluteSize
			if not (flag or mouseLocation.X >= absolutePosition.X and mouseLocation.X <= absolutePosition.X + absoluteSize.X and mouseLocation.Y >= absolutePosition.Y and mouseLocation.Y <= absolutePosition.Y + absoluteSize.Y) or not ScrollingFrame.Visible then
				return
			end
			local z = arg2.Position.Z
			if z == 0 then
				return
			end
			local n3 = math.max(0, #tbl3.Filtered * n - ScrollingFrame.AbsoluteWindowSize.Y)
			ScrollingFrame.CanvasPosition = Vector2.new(0, math.clamp(ScrollingFrame.CanvasPosition.Y - z * n * 3, 0, n3))
		end)

		tbl:CreateConnection(TextBox.Focused, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
		end)

		tbl:CreateConnection(TextBox.FocusLost, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		end)

		fn7(true)

		if tbl3.State ~= "" then
			tbl3:Set(tbl3.State, true)
		elseif tbl3.Options[1] then
			tbl3:Set(fn4(tbl3.Options[1]), true)
		end

		tbl3.Window:RegisterConfigControl(tbl3, tbl2, "SearchList")
		return tbl3
	end

	index3.CreateButton = function(arg, arg2)
		local tbl2 = arg2 or {}

		local tbl3 = {
			Name = tbl2.name or tbl2.Name or tbl2.title or tbl2.Title or "Button",
			Callback = tbl2.callback or tbl2.Callback or function()
			end,
			Window = arg.Window,
			Page = arg.Page,
			Section = arg,
		}

		local Frame = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, 28),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 20, 0, 4),
			Size = UDim2.new(1, -40, 0, 20),
			ZIndex = 3,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(36, 36, 36),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 3,
		})

		local UIGradient = tbl:RenderObject("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220)),
			Rotation = 270,
			Parent = Frame3,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame3,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 3,
			RichText = true,
			Text = tbl3.Name,
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 9,
			TextStrokeTransparency = 1,
			TextXAlignment = "Center",
		})

		local TextButton = tbl:RenderObject("TextButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame2,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			ZIndex = 4,
		})

		tbl3.SetName = function(arg3, name)
			tbl3.Name = name
			TextLabel.Text = name
		end

		tbl3.Fire = function()
			tbl3.Callback()
		end

		tbl:CreateConnection(TextButton.Activated, function()
			tbl3:Fire()
		end)

		tbl:CreateConnection(TextButton.MouseEnter, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(245, 245, 245))
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			local color = Color3.fromRGB
			UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), color(220, 220, 220))
		end)

		return tbl3
	end

	index3.CreatePlayerList = function(section, arg)
		local tbl2 = arg or {}

		local tbl3 = {
			Callback = tbl2.callback or tbl2.Callback or function()
			end,
			Filter = tbl2.filter or tbl2.Filter,
			Height = tbl2.height or tbl2.Height or 420,
			IncludeLocalPlayer = tbl2.includeLocalPlayer or tbl2.IncludeLocalPlayer or false,
		}

		tbl3.PlayersService = tbl2.playersService or tbl2.PlayersService or game:GetService("Players")
		tbl3.GetPlayerColor = tbl2.getPlayerColor or tbl2.GetPlayerColor
		tbl3.Rows = {}
		tbl3.Selected = nil
		tbl3.Window = section.Window
		tbl3.Page = section.Page
		tbl3.Section = section

		local Frame = tbl:RenderObject("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = tbl3.Section.Holder,
			Size = UDim2.new(1, 0, 0, tbl3.Height),
			ZIndex = 3,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 20, 0, 0),
			Size = UDim2.new(1, -40, 1, 0),
			ZIndex = 3,
		})

		local ScrollingFrame = tbl:RenderObject("ScrollingFrame", {
			AutomaticCanvasSize = "Y",
			BackgroundColor3 = Color3.fromRGB(32, 32, 32),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			BottomImage = "rbxassetid://7783554086",
			CanvasSize = UDim2.new(0, 0, 0, 0),
			MidImage = "rbxassetid://7783554086",
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			ScrollBarImageColor3 = Color3.fromRGB(65, 65, 65),
			ScrollBarThickness = 5,
			Size = UDim2.new(1, -2, 1, -2),
			TopImage = "rbxassetid://7783554086",
			VerticalScrollBarInset = "None",
			ZIndex = 3,
		})

		tbl:RenderObject("UIListLayout", {
			Parent = ScrollingFrame,
			FillDirection = "Vertical",
			HorizontalAlignment = "Left",
			SortOrder = "LayoutOrder",
			VerticalAlignment = "Top",
		})

		local function fn3()
			for k, row in pairs(tbl3.Rows) do
				local flag = k == tbl3.Selected
				local getPlayerColor = tbl3.GetPlayerColor and tbl3.GetPlayerColor(k)
				row.Frame.BackgroundTransparency = flag and 0 or 1
				row.Title.TextTransparency = 0
				row.Title.TextColor3 = getPlayerColor or Color3.fromRGB(205, 205, 205)
				row.Title.FontFace = flag and index.FontFaceBold or index.FontFace
				row.Accent.Visible = false
			end
		end

		tbl3.Get = function()
			return tbl3.Selected
		end

		tbl3.GetPlayers = function()
			local tbl4 = {}

			for _, player in ipairs(tbl3.PlayersService:GetPlayers()) do
				if (tbl3.IncludeLocalPlayer or player ~= tbl3.PlayersService.LocalPlayer) and (not tbl3.Filter or tbl3.Filter(player)) then
					tbl4[#tbl4 + 1] = player
				end
			end

			table.sort(tbl4, function(arg2, arg3)
				local str = arg2.Name:lower()
				local str2 = arg3.Name:lower()
				if str == str2 then
					return arg2.Name:lower() < arg3.Name:lower()
				end
				return str < str2
			end)

			return tbl4
		end

		tbl3.Set = function(arg2, selected, arg3)
			if selected ~= nil and not tbl3.Rows[selected] then
				return false
			end
			tbl3.Selected = selected
			fn3()

			if not arg3 then
				tbl3.Callback(selected)
			end

			return true
		end

		tbl3.RefreshColors = function()
			fn3()
		end

		tbl3.Refresh = function()
			local selected = tbl3.Selected

			for _, row in pairs(tbl3.Rows) do
				row.Frame:Destroy()
			end

			table.clear(tbl3.Rows)
			local players = tbl3:GetPlayers()

			for i, player in ipairs(players) do
				local Frame3 = tbl:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(38, 38, 38),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = i,
					Parent = ScrollingFrame,
					Size = UDim2.new(1, -5, 0, 18),
					ZIndex = 3,
				})

				local TextLabel = tbl:RenderObject("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Parent = Frame3,
					Position = UDim2.new(0, 8, 0, 0),
					Size = UDim2.new(1, -10, 1, 0),
					ZIndex = 3,
					Text = player.DisplayName ~= "" and player.DisplayName ~= player.Name and player.Name .. " (" .. player.DisplayName .. ")" or player.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = "Left",
				})

				local Frame4 = tbl:RenderObject("Frame", {
					BackgroundColor3 = tbl3.Window.Accent,
					BorderSizePixel = 0,
					Parent = Frame3,
					Position = UDim2.fromOffset(0, 1),
					Size = UDim2.new(0, 2, 1, -2),
					Visible = false,
					ZIndex = 4,
				})

				local TextButton = tbl:RenderObject("TextButton", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Parent = Frame3,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					ZIndex = 4,
				})

				tbl3.Rows[player] = { Button = TextButton, Accent = Frame4, Frame = Frame3, Title = TextLabel }

				tbl:CreateConnection(TextButton.Activated, function()
					if tbl3.Window.Enabled then
						tbl3:Set(player)
					end
				end)

				tbl:CreateConnection(TextButton.MouseEnter, function()
					if tbl3.Window.Enabled and tbl3.Selected ~= player then
						Frame3.BackgroundTransparency = 0
						Frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					end
				end)

				tbl:CreateConnection(TextButton.MouseLeave, function()
					if tbl3.Selected ~= player then
						Frame3.BackgroundTransparency = 1
					end
				end)
			end

			if selected and tbl3.Rows[selected] then
				tbl3:Set(selected)
			else
				tbl3:Set(players[1])
			end
		end

		tbl:CreateConnection(tbl3.PlayersService.PlayerAdded, function()
			task.defer(function()
				tbl3:Refresh()
			end)
		end)

		tbl:CreateConnection(tbl3.PlayersService.PlayerRemoving, function(arg2)
			if tbl3.Selected == arg2 then
				tbl3.Selected = nil
			end

			task.defer(function()
				tbl3:Refresh()
			end)
		end)

		tbl3:Refresh()
		return tbl3
	end

	local mellstroyMenuWindow = getgenv().__MellstroyMenuWindow

	if mellstroyMenuWindow and type(mellstroyMenuWindow.Unload) == "function" then
		pcall(function()
			mellstroyMenuWindow:Unload()
		end)
	end

	local v = index:CreateWindow({})
	getgenv().__MellstroyMenuWindow = v

	v.CleanupCallbacks[#v.CleanupCallbacks + 1] = function()
		if getgenv().__MellstroyMenuWindow == v then
			getgenv().__MellstroyMenuWindow = nil
		end
	end

	local v2 = v:CreatePage({ Icon = "rbxassetid://15453302474" })
	local v3 = v:CreatePage({ Icon = "rbxassetid://15453313321" })
	local v4 = v:CreatePage({ Icon = "rbxassetid://15453335745" })
	local v5 = v:CreatePage({ Icon = "rbxassetid://15453344494" })
	local v6 = v:CreatePage({ Icon = "rbxassetid://15453349637" })
	local v7 = v:CreatePage({ Icon = "rbxassetid://15453354931" })
	local v8 = v:CreatePage({ Icon = "rbxassetid://15453359751" })
	local v9 = v:CreatePage({ Icon = "rbxassetid://15453364412" })
	local v10 = v2:CreateSection({ Name = "Weapon type", Size = 75, Side = "Left" })
	local v11 = v2:CreateSection({ Name = "Aimbot", Size = 180, Side = "Left" })
	local v12 = v2:CreateSection({ Name = "Other", Size = 165, Side = "Right" })
	local v13 = v3:CreateSection({ Name = "Anti Aim", Size = 90, Side = "Left" })
	local v14 = v4:CreateSection({ Name = "Coin farm", Size = 90, Side = "Left" })
	v14.Settings = v4:CreateSection({ Name = "Settings", Size = 90, Side = "Right" })
	v5:CreateSection({ Name = "Player ESP", Size = 330, Side = "Left" })
	v5:CreateSection({ Name = "Colored models", Size = 158, Side = "Left" })
	v5:CreateSection({ Name = "Other ESP", Size = 200, Side = "Right" })
	v5:CreateSection({ Name = "Effects", Size = 288, Side = "Right" })
	v6:CreateSection({ Name = "Movement", Size = 506, Side = "Left" })
	v6:CreateSection({ Name = "Misc", Size = 506, Side = "Right" })
	local v15 = v9:CreateSection({ Name = "Presets", Size = 506, Side = "Left" })
	local v16 = v9:CreateSection({ Name = "Settings", Size = 506, Side = "Right" })
	v8:CreateSection({ Name = "Players", Size = 506, Side = "Left" })
	local v17 = v8:CreateSection({ Name = "Information", Size = 104, Side = "Right" })
	v8:CreateSection({ Name = "Adjustments", Size = 220, Side = "Right" })
	v8:CreateSection({ Name = "Actions", Size = 106, Side = "Right" })
	local tbl2 = {}
	v17.Holder.AutomaticCanvasSize = Enum.AutomaticSize.None
	v17.Holder.CanvasSize = UDim2.new()
	v17.Holder.ScrollingEnabled = false
	v17.Holder.ScrollBarThickness = 0
	v17.Holder.CanvasPosition = Vector2.zero

	tbl2.Card = tbl:RenderObject("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = v17.Holder,
		Size = UDim2.new(1, 0, 0, 72),
		ZIndex = 4,
	})

	tbl2.Avatar = tbl:RenderObject("ImageLabel", {
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		BorderSizePixel = 1,
		Parent = tbl2.Card,
		Position = UDim2.fromOffset(18, 10),
		Size = UDim2.fromOffset(52, 52),
		Image = "",
		ZIndex = 5,
	})

	tbl2.Title = tbl:RenderObject("TextLabel", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = tbl2.Card,
		Position = UDim2.fromOffset(80, 7),
		Size = UDim2.new(1, -94, 0, 15),
		FontFace = index.FontFaceBold,
		Text = "No player selected",
		TextColor3 = Color3.fromRGB(225, 225, 225),
		TextSize = 10,
		TextStrokeTransparency = 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
	})

	tbl2.Subtitle = tbl:RenderObject("TextLabel", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = tbl2.Card,
		Position = UDim2.fromOffset(80, 23),
		Size = UDim2.new(1, -94, 0, 13),
		Text = "",
		TextColor3 = Color3.fromRGB(140, 140, 140),
		TextSize = 9,
		TextStrokeTransparency = 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
	})

	tbl2.Details = tbl:RenderObject("TextLabel", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = tbl2.Card,
		Position = UDim2.fromOffset(80, 39),
		Size = UDim2.new(1, -94, 0, 27),
		Text = "Select a player",
		TextColor3 = Color3.fromRGB(175, 175, 175),
		TextSize = 8,
		TextStrokeTransparency = 1,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = 5,
	})

	local function fn3()
		for _, child in ipairs(v17.Extra:GetChildren()) do
			if child:IsA("GuiObject") then
				child.Visible = false
			end
		end
	end

	fn3()
	tbl:CreateConnection(v17.Holder:GetPropertyChangedSignal("AbsoluteCanvasSize"), fn3)

	v16:CreateToggle({
		Name = "Watermark",
		State = true,
		Bindable = false,
		Callback = function(arg)
			v:SetWatermarkVisible(arg)
		end,
	})

	v16:CreateToggle({
		Name = "Keybind list",
		State = true,
		Bindable = false,
		Callback = function(arg)
			v:SetKeybindListVisible(arg)
		end,
	})

	v16:CreateSlider({
		Name = "Menu scale",
		State = 100,
		Min = 60,
		Max = 100,
		Decimals = 1,
		Suffix = "%",
		Configurable = false,
		Callback = function(arg)
			v.UserMenuScale = arg / 100

			if v.MenuScale then
				v.MenuScale.Scale = math.min(v.MenuScale.Scale, v.UserMenuScale)
			end
		end,
	})

	v16:CreateButton({
		Name = "Clear all binds",
		Callback = function()
			for _, keybind in ipairs(v.Keybinds) do
				keybind:SetKey(nil, true)
				keybind:SetMode("Toggle", true, true)
				keybind:SetActive(false, true)
				keybind:Save()
			end
		end,
	})

	local function fn4()
		local str = "default"
		local HttpService = game:GetService("HttpService")
		local v18 = nil

		local function fn5(arg)
			local mellstroyFeedback = getgenv().__MellstroyFeedback

			if mellstroyFeedback and not mellstroyFeedback.Unloaded and type(mellstroyFeedback.Notify) == "function" then
				mellstroyFeedback:Notify(arg)
			end
		end

		local function fn6(arg)
			local str2 = string.sub(string.gsub(tostring(arg or "default"), "[^%w_%-]", "_"), 1, 32)
			return str2 ~= "" and str2 or "default"
		end

		local function fn7()
			return index.Folder .. "/" .. index.Configs .. "/profile_" .. fn6(str) .. ".json"
		end

		local function fn8()
			local tbl3 = {}

			if type(listfiles) == "function" then
				pcall(function()
					for _, v19 in ipairs(listfiles(index.Folder .. "/" .. index.Configs)) do
						local v20 = string.match(v19, "profile_(.+)%.json$")

						if v20 then
							tbl3[#tbl3 + 1] = v20
						end
					end
				end)
			end

			if #tbl3 == 0 then
				tbl3[1] = str
			end

			table.sort(tbl3, function(arg, arg2)
				return string.lower(arg) < string.lower(arg2)
			end)

			return tbl3
		end

		local function fn9(arg)
			if v18 then
				v18:SetOptions(fn8(), str, true, arg == true)
			end
		end

		v18 = v15:CreateSearchList({
			Name = "Config list",
			Options = fn8(),
			State = str,
			Height = 270,
			PoolSize = 16,
			ShowSelectionLabel = false,
			NoBullet = true,
			Configurable = false,
			Callback = function(arg)
				str = fn6(arg)
			end,
		})

		v15:CreateTextbox({
			Name = "Config name",
			State = str,
			MaxLength = 32,
			Configurable = false,
			Callback = function(arg)
				str = fn6(arg)
			end,
		})

		v15:CreateButton({
			Name = "Load",
			Callback = function()
				local configNotFound = fn6(str)

				if type(readfile) ~= "function" or type(isfile) ~= "function" then
					warn("[mellstroyhook] executor does not support config files")
					fn5("config load is not supported")
					return
				end

				local v19 = fn7()
				local ok, result = pcall(isfile, v19)

				if not ok or not result then
					warn("[mellstroyhook] config not found: " .. v19)
					fn5("config not found: " .. configNotFound)
					return
				end

				local ok2, result2 = pcall(function()
					return HttpService:JSONDecode(readfile(v19))
				end)

				if not ok2 or not v:LoadConfigData(result2) then
					warn("[mellstroyhook] config load failed: " .. tostring(result2))
					fn5("invalid config: " .. configNotFound)
					return
				end

				fn5("config loaded: " .. configNotFound)
			end,
		})

		v15:CreateButton({
			Name = "Save",
			Callback = function()
				local configSaveFailed = fn6(str)

				if type(writefile) ~= "function" then
					warn("[mellstroyhook] executor does not support writefile")
					fn5("config save is not supported")
					return
				end

				local ok, result = pcall(function()
					if type(makefolder) == "function" then
						pcall(makefolder, index.Folder)
						pcall(makefolder, index.Folder .. "/" .. index.Configs)
					end

					local v19 = HttpService
					local jsonEncode = v19.JSONEncode
					local getConfigData = v.GetConfigData
					writefile(fn7(), jsonEncode(v19, getConfigData(v)))
				end)

				if not ok then
					warn("[mellstroyhook] config save failed: " .. tostring(result))
					fn5("config save failed: " .. configSaveFailed)
				else
					fn5("config saved: " .. configSaveFailed)
				end

				fn9()
			end,
		})

		v15:CreateButton({
			Name = "Delete",
			Callback = function()
				if type(delfile) ~= "function" or type(isfile) ~= "function" then
					warn("[mellstroyhook] executor does not support config files")
					return
				end
				local v19 = fn7()
				local ok, result = pcall(isfile, v19)

				if ok and result then
					local ok2, result2 = pcall(delfile, v19)

					if not ok2 then
						warn("[mellstroyhook] config delete failed: " .. tostring(result2))
					end
				end

				fn9(true)
			end,
		})

		v15:CreateButton({
			Name = "Import from clipboard",
			Callback = function()
				if type(getclipboard) ~= "function" then
					return
				end

				local ok, result = pcall(function()
					return HttpService:JSONDecode(getclipboard())
				end)

				if ok and type(result) == "table" then
					v:LoadConfigData(result)
				else
					warn("[mellstroyhook] clipboard does not contain a valid config")
				end
			end,
		})

		v15:CreateButton({
			Name = "Export to clipboard",
			Callback = function()
				if type(setclipboard) == "function" then
					pcall(setclipboard, HttpService:JSONEncode(v:GetConfigData()))
				end
			end,
		})
	end

	fn4()

	local function fn5()
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local mellstroySkinChanger = getgenv().__MellstroySkinChanger

		if mellstroySkinChanger then
			mellstroySkinChanger.Unloaded = true

			if type(mellstroySkinChanger.RestoreAvatar) == "function" then
				pcall(function()
					mellstroySkinChanger:RestoreAvatar()
				end)

				if MobileMinus and MobilePlus then
					tbl:CreateConnection(MobileMinus.Activated, function()
						Content:Step(-1)
					end)

					tbl:CreateConnection(MobilePlus.Activated, function()
						Content:Step(1)
					end)
				end
			end

			if type(mellstroySkinChanger.RestoreType) == "function" then
				pcall(function()
					mellstroySkinChanger:RestoreType()
				end)
			end
		end

		local v18 = v7:CreateSection({ Name = "Model customization", Size = 280, Side = "Left" })
		local v19 = v7:CreateSection({ Name = "Settings", Size = 208, Side = "Left" })
		local v20 = v7:CreateSection({ Name = "Weapon skin", Size = 506, Side = "Right" })

		local mellstroySkinChanger2 = {
			Enabled = false,
			CurrentType = "Knife",
			Selected = { Knife = "DefaultKnife", Gun = "DefaultGun" },
			Items = {},
			ItemsByType = { Knife = {}, Gun = {} },
			ItemByKey = {},
			TemplateCache = {},
			TemplateSource = {},
			CollectorSignatures = {},
			FailedAt = {},
			Applied = setmetatable({}, { __mode = "k" }),
			LoadGeneration = { Knife = 0, Gun = 0 },
			AvatarEnabled = false,
			AvatarTarget = "",
			AvatarGeneration = 0,
			AvatarVisualState = nil,
			CatalogLoaded = false,
			Unloaded = false,
		}

		local weapons = nil

		pcall(function()
			local database = game:GetService("ReplicatedStorage"):WaitForChild("Database", 20)
			database = database and database:WaitForChild("Sync", 20)

			if database and database:IsA("ModuleScript") then
				local module = require(database)

				if type(module) == "table" then
					weapons = module.Weapons
				end
			else
				database = database and database:WaitForChild("Item", 20)

				if database and database:IsA("ModuleScript") then
					weapons = require(database)
				end
			end
		end)

		if type(weapons) == "table" then
			local tbl3 = { Knife = {}, Gun = {} }

			for k, weapon in pairs(weapons) do
				local itemType = type(weapon) == "table" and weapon.ItemType

				if itemType == "Knife" or itemType == "Gun" then
					local str = tostring(weapon.ItemName or k)
					local v21 = string.lower(str)
					tbl3[itemType][v21] = (tbl3[itemType][v21] or 0) + 1
					local tbl4 = { Key = tostring(k), Name = str, Display = str, Type = itemType }
					local rarity = weapon.Chroma and "Chroma"

					if not rarity then
						rarity = tostring(weapon.Rarity or "Common")
					end

					tbl4.Rarity = rarity
					tbl4.ItemID = tostring(weapon.ItemID or "")
					tbl4.Image = tostring(weapon.Image or "")
					tbl4.Available = false
					mellstroySkinChanger2.Items[#mellstroySkinChanger2.Items + 1] = tbl4
					mellstroySkinChanger2.ItemsByType[itemType][#mellstroySkinChanger2.ItemsByType[itemType] + 1] = tbl4
					mellstroySkinChanger2.ItemByKey[tbl4.Key] = tbl4
				end
			end

			for _, item in ipairs(mellstroySkinChanger2.Items) do
				if tbl3[item.Type][string.lower(item.Name)] > 1 then
					item.Display = item.Name .. " [" .. item.Key .. "]"
				end
			end
		end

		for k, v21 in pairs(mellstroySkinChanger2.ItemsByType) do
			table.sort(v21, function(arg, arg2)
				local flag = arg.Key == (k == "Knife" and "DefaultKnife" or "DefaultGun")
				if flag ~= arg2.Key == (k == "Knife" and "DefaultKnife" or "DefaultGun") then
					return flag
				end
				return string.lower(arg.Display) < string.lower(arg2.Display)
			end)
		end

		local function fn6(arg)
			if arg:IsA("BasePart") then
				return true
			end
			return arg:FindFirstChildWhichIsA("BasePart", true) ~= nil
		end

		local function fn7(arg)
			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("LuaSourceContainer") or descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") or descendant:IsA("BindableEvent") or descendant:IsA("BindableFunction") or descendant:IsA("ClickDetector") or descendant:IsA("ProximityPrompt") or descendant:IsA("Humanoid") or descendant:IsA("AnimationController") or descendant:IsA("Sound") or descendant:IsA("JointInstance") or descendant:IsA("Constraint") then
					pcall(descendant.Destroy, descendant)
				end
			end
		end

		local tbl3 = {
			Head = true,
			HumanoidRootPart = true,
			Torso = true,
			UpperTorso = true,
			LowerTorso = true,
			["Left Arm"] = true,
			["Right Arm"] = true,
			["Left Leg"] = true,
			["Right Leg"] = true,
			LeftUpperArm = true,
			RightUpperArm = true,
			LeftUpperLeg = true,
			RightUpperLeg = true,
		}

		local function fn8(arg)
			local abs = math.abs
			local z = arg.Z
			return math.max(math.abs(arg.X), math.abs(arg.Y), abs(z))
		end

		local function fn9(arg, arg2, arg3)
			if #arg2 == 0 or #arg2 > 96 then
				return false, "invalid weapon part count"
			end

			if arg:FindFirstChildWhichIsA("Humanoid", true) then
				return false, "captured a character instead of a weapon"
			end
			local n = 0

			for _, v21 in ipairs(arg2) do
				if tbl3[v21.Name] then
					n += 1
				end

				local v22 = arg3:ToObjectSpace(v21.CFrame)
				if fn8(v21.Size) > 32 or v22.Position.Magnitude > 32 then
					return false, "weapon geometry exceeds 32 studs"
				end
				local specialMesh = v21:FindFirstChildWhichIsA("SpecialMesh")
				if specialMesh and fn8(specialMesh.Scale) > 32 then
					return false, "weapon mesh scale exceeds 32"
				end
			end

			if n >= 3 then
				return false, "captured avatar body parts"
			end
			return true
		end

		local function createModel(arg, arg2, arg3, arg4)
			local ok, result = pcall(arg.Clone, arg)
			if not ok or not result then
				return nil, "model is not clonable"
			end
			fn7(result)
			local tbl4 = {}

			if result:IsA("BasePart") then
				tbl4[1] = result
			else
				for _, descendant in ipairs(result:GetDescendants()) do
					if descendant:IsA("BasePart") then
						tbl4[#tbl4 + 1] = descendant
					end
				end
			end

			if #tbl4 == 0 then
				result:Destroy()
				return nil, "model has no parts"
			end
			local grip = result:IsA("Tool") and result.Grip or nil
			local isBasePart = result:IsA("BasePart") and result or result:FindFirstChild("Handle", true)

			if not isBasePart or not isBasePart:IsA("BasePart") then
				isBasePart = tbl4[1]
			end

			arg3 = typeof(arg3) == "CFrame" and arg3 or isBasePart.CFrame
			local v21, v22 = fn9(result, tbl4, arg3)
			if not v21 then
				result:Destroy()
				return nil, v22
			end
			local model = Instance.new("Model")
			model.Name = "SkinTemplate_" .. arg2.Key

			for _, v23 in ipairs(tbl4) do
				local v24 = arg3:ToObjectSpace(v23.CFrame)
				v23:SetAttribute("MellstroySkinSize", v23.Size)
				v23.Parent = model
				v23.CFrame = v24
				v23.Anchored = false
				v23.CanCollide = false
				v23.CanQuery = false
				v23.CanTouch = false
				v23.Massless = true
				v23.LocalTransparencyModifier = 0
				v23:SetAttribute("MellstroySkinRelative", v24)
			end

			if result ~= isBasePart and result.Parent ~= model then
				pcall(result.Destroy, result)
			end

			model.PrimaryPart = isBasePart
			model:SetAttribute("MellstroySkinKey", arg2.Key)

			if typeof(grip) == "CFrame" then
				model:SetAttribute("MellstroySkinGripReady", true)
				model:SetAttribute("MellstroySkinToolGrip", grip)
			elseif arg4 == "Target" then
				model:SetAttribute("MellstroySkinGripReady", true)
				model:SetAttribute("MellstroySkinUsesTargetGrip", true)
			else
				model:SetAttribute("MellstroySkinGripReady", false)
			end

			return model
		end

		local function fn10(arg, arg2)
			local v21 = string.lower(tostring(arg or ""))
			if v21 == "" then
				return nil
			end
			local v22 = ipairs
			local tbl4 = mellstroySkinChanger2.ItemsByType[arg2] or {}

			for _, v23 in v22(tbl4) do
				if string.lower(v23.Name) == v21 or string.lower(v23.Key) == v21 then
					return v23
				end
			end
		end

		local function fn11(arg)
			if not arg or not arg:IsA("Tool") then
				return nil
			end

			if arg.Name == "Knife" or arg:HasTag("Weapon_Knife") then
				return "Knife"
			end

			if arg.Name == "Gun" or arg:HasTag("Weapon_Gun") then
				return "Gun"
			end
		end

		local function fn12(arg, arg2, arg3, arg4, arg5, arg6)
			local v21 = mellstroySkinChanger2.ItemByKey[tostring(arg or "")]
			if not v21 or not arg2 or not fn6(arg2) then
				return false
			end

			if mellstroySkinChanger2.TemplateCache[v21.Key] and not arg4 then
				v21.GeometryAvailable = true
				v21.Available = mellstroySkinChanger2.TemplateCache[v21.Key]:GetAttribute("MellstroySkinGripReady") == true
				return false
			end

			local v22 = createModel(arg2, v21, arg5, arg6)
			if not v22 then
				return false
			end
			local v23 = mellstroySkinChanger2.TemplateCache[v21.Key]

			if v23 then
				pcall(v23.Destroy, v23)
			end

			mellstroySkinChanger2.TemplateCache[v21.Key] = v22
			mellstroySkinChanger2.TemplateSource[v21.Key] = arg3 or "MM2 developer model"
			mellstroySkinChanger2.FailedAt[v21.Key] = nil
			v21.GeometryAvailable = true
			v21.Available = v22:GetAttribute("MellstroySkinGripReady") == true
			return true
		end

		mellstroySkinChanger2.LoadCollectorCatalog = function(arg, arg2)
			if type(isfile) ~= "function" or type(readfile) ~= "function" then
				return 0
			end

			if mellstroySkinChanger2.CatalogLoaded and arg2 ~= true then
				return 0
			end
			mellstroySkinChanger2.CatalogLoaded = true

			local function fn13(arg3)
				local ok, result = pcall(isfile, arg3)
				if not ok or not result then
					return nil
				end

				local ok2, result2 = pcall(function()
					return game:GetService("HttpService"):JSONDecode(readfile(arg3))
				end)

				return ok2 and type(result2) == "table" and type(result2.captures) == "table" and result2 or nil
			end

			local tbl4 = {}
			local json = fn13("mellstroyhook/skin-data/skin-catalog.json")

			if json then
				tbl4[#tbl4 + 1] = json
			end

			local json2 = fn13("mellstroyhook/skin-data/skins.json")

			if json2 then
				tbl4[#tbl4 + 1] = json2
			end

			if #tbl4 == 0 then
				return 0
			end

			local function fn14(arg3)
				return type(arg3) == "table" and #arg3 >= 12 and CFrame.new(table.unpack(arg3, 1, 12)) or nil
			end

			local function fn15(arg3, arg4)
				return type(arg3) == "table" and #arg3 >= 3 and Vector3.new(arg3[1], arg3[2], arg3[3]) or arg4
			end

			local function fn16(arg3, arg4)
				return type(arg3) == "table" and #arg3 >= 3 and Color3.new(arg3[1], arg3[2], arg3[3]) or arg4
			end

			local function fn17(arg3)
				local match, v21 = tostring(arg3 or ""):match("^Enum%.([^.]+)%.(.+)$")

				local ok, result = pcall(function()
					return match and Enum[match][v21]
				end)

				return ok and result or nil
			end

			local function fn18(arg3)
				if type(arg3) ~= "table" then
					return arg3
				end
				local type_ = arg3.type
				local value = type_ and arg3.value or arg3
				if type_ == "Vector2" and #value >= 2 then
					return Vector2.new(value[1], value[2])
				end

				if type_ == "Vector3" and #value >= 3 then
					return Vector3.new(value[1], value[2], value[3])
				end

				if type_ == "CFrame" and #value >= 12 then
					return CFrame.new(table.unpack(value, 1, 12))
				end

				if type_ == "NumberRange" and #value >= 2 then
					return NumberRange.new(value[1], value[2])
				end
				return arg3
			end

			local function fn19(arg3)
				arg3 = type(arg3) == "table" and arg3.type == "NumberSequence" and arg3.value or arg3
				if type(arg3) ~= "table" or #arg3 == 0 then
					return nil
				end
				local tbl5 = {}

				for _, v21 in ipairs(arg3) do
					if type(v21) == "table" and #v21 >= 2 then
						tbl5[#tbl5 + 1] = NumberSequenceKeypoint.new(v21[1], v21[2], v21[3] or 0)
					end
				end

				return #tbl5 > 0 and NumberSequence.new(tbl5) or nil
			end

			local function fn20(arg3)
				local value = type(arg3) == "table" and arg3.type == "ColorSequence" and arg3.value or arg3
				if type(value) ~= "table" or #value == 0 then
					return nil
				end
				local tbl5 = {}

				for _, v21 in ipairs(value) do
					if type(v21) == "table" and #v21 >= 4 then
						tbl5[#tbl5 + 1] = ColorSequenceKeypoint.new(v21[1], Color3.new(v21[2], v21[3], v21[4]))
					end
				end

				return #tbl5 > 0 and ColorSequence.new(tbl5) or nil
			end

			local function fn21(arg3, arg4, arg5)
				if arg5 ~= nil then
					pcall(function()
						arg3[arg4] = arg5
					end)
				end
			end

			local function fn22(arg3)
				if type(arg3.parts) ~= "table" or #arg3.parts == 0 or #arg3.parts > 96 then
					return false
				end
				local v21, v22, v23 = ipairs(arg3.parts)
				local n = 0
				local v24 = table.pack(W_1())

				if v24[1] then
					if tbl3[tostring((v24[3]).name or "")] then
					end

					error("devirt: storing a non-empty VM table into a register (at 69:106)")
				end

				return n < 3
			end

			mellstroySkinChanger2.BuildSavedTemplate = function(arg3, arg4, arg5)
				local tool = arg5.tool and fn14(arg5.tool.grip)
				local flag = type(arg5.tool) == "table" and arg5.tool.useTargetGrip == true
				if not tool and not flag or not fn22(arg5) then
					return nil
				end
				local model = Instance.new("Model")
				model.Name = "SkinTemplate_" .. arg4.Key
				local tbl5 = {}
				local tbl6 = {}
				local v21, v22, v23 = ipairs(arg5.parts)
				local v24 = table.pack(W_1())

				if v24[1] then
					local v25 = v24[3]
					local ok, result = pcall(Instance.new, v25.class or "Part")

					if not ok or not result or not result:IsA("BasePart") then
						result = Instance.new("Part")
					end

					result.Name = tostring(v25.name or "Handle")
					error("devirt: storing a non-empty VM table into a register (at 35:811)")
				end

				for _, v25 in ipairs(tbl6) do
					local v26 = ipairs
					local visualChildren = v25.Data.visualChildren or {}

					for _, v27 in v26(visualChildren) do
						if v27.class == "Attachment" or v27.class == "SurfaceAppearance" or v27.class == "Decal" or v27.class == "Texture" or v27.class == "ParticleEmitter" or v27.class == "Trail" or v27.class == "Beam" or v27.class == "PointLight" or v27.class == "SpotLight" or v27.class == "SurfaceLight" then
							local ok, result = pcall(Instance.new, v27.class)

							if ok and result then
								result.Name = tostring(v27.name or v27.class)

								if result:IsA("Attachment") then
									fn21(result, "CFrame", fn14(v27.cframe))
								elseif result:IsA("SurfaceAppearance") then
									for k, v28 in pairs({
										colorMap = "ColorMap",
										metalnessMap = "MetalnessMap",
										normalMap = "NormalMap",
										roughnessMap = "RoughnessMap",
									}) do
										fn21(result, v28, v27[k])
									end

									fn21(result, "AlphaMode", fn17(v27.alphaMode))
									fn21(result, "Color", fn16(v27.color))
								elseif result:IsA("Decal") or result:IsA("Texture") then
									fn21(result, "Texture", v27.texture)
									fn21(result, "Color3", fn16(v27.color))
									fn21(result, "Transparency", tonumber(v27.transparency))
									fn21(result, "Face", fn17(v27.face))
								elseif result:IsA("ParticleEmitter") then
									for k, v28 in pairs({
										texture = "Texture",
										rate = "Rate",
										lifetime = "Lifetime",
										speed = "Speed",
										rotation = "Rotation",
										rotSpeed = "RotSpeed",
										spreadAngle = "SpreadAngle",
										acceleration = "Acceleration",
										drag = "Drag",
										lightEmission = "LightEmission",
										lightInfluence = "LightInfluence",
										brightness = "Brightness",
										orientation = "Orientation",
										shape = "Shape",
										shapeStyle = "ShapeStyle",
										shapeInOut = "ShapeInOut",
										emissionDirection = "EmissionDirection",
										squash = "Squash",
										timeScale = "TimeScale",
										zOffset = "ZOffset",
									}) do
										local v29 = v27[k]
										local v30

										if type(v29) == "string" and string.sub(v29, 1, 5) == "Enum." then
											v30 = fn17(v29)
										elseif k == "squash" then
											v30 = fn19(v29)
										else
											v30 = fn18(v29)
										end

										fn21(result, v28, v30)
									end

									fn21(result, "Color", fn20(v27.color))
									fn21(result, "Transparency", fn19(v27.transparency))
									fn21(result, "Size", fn19(v27.size))
								elseif result:IsA("Trail") or result:IsA("Beam") then
									for k, v28 in pairs({
										texture = "Texture",
										textureLength = "TextureLength",
										textureSpeed = "TextureSpeed",
										faceCamera = "FaceCamera",
										lightEmission = "LightEmission",
										lightInfluence = "LightInfluence",
										brightness = "Brightness",
										width0 = "Width0",
										width1 = "Width1",
										curveSize0 = "CurveSize0",
										curveSize1 = "CurveSize1",
										segments = "Segments",
										zOffset = "ZOffset",
										minLength = "MinLength",
										maxLength = "MaxLength",
										lifetime = "Lifetime",
									}) do
										fn21(result, v28, fn18(v27[k]))
									end

									fn21(result, "TextureMode", fn17(v27.textureMode))
									fn21(result, "Color", fn20(v27.color))
									fn21(result, "Transparency", fn19(v27.transparency))
								else
									for k, v28 in pairs({
										brightness = "Brightness",
										range = "Range",
										shadows = "Shadows",
										angle = "Angle",
									}) do
										fn21(result, v28, fn18(v27[k]))
									end

									fn21(result, "Face", fn17(v27.face))
									fn21(result, "Color", fn16(v27.color))
								end

								result.Parent = tbl5[tostring(v27.path or ""):match("^(.*)/[^/]+$")] or v25.Part
								tbl5[tostring(v27.path or "")] = result
							end
						end
					end
				end

				if not model.PrimaryPart then
					model:Destroy()
					return nil
				end
				model:SetAttribute("MellstroySkinKey", arg4.Key)
				model:SetAttribute("MellstroySkinGripReady", true)

				if tool then
					model:SetAttribute("MellstroySkinToolGrip", tool)
				else
					model:SetAttribute("MellstroySkinUsesTargetGrip", true)
				end

				return model
			end

			local tbl5 = {}

			for _, v21 in ipairs(tbl4) do
				for k, capture in pairs(v21.captures) do
					local flag = type(v21.knownItems) == "table" and v21.knownItems[tostring(k)] or nil
					local tbl6 = mellstroySkinChanger2.ItemByKey[tostring(k)]

					if not tbl6 then
						local v22 = ipairs
						local tbl7 = mellstroySkinChanger2.ItemsByType[tostring(capture.type or "")] or {}
						tbl6 = nil

						for _, v23 in v22(tbl7) do
							if string.lower(v23.Name) == string.lower(tostring(capture.name or k)) then
								if tbl6 then
									tbl6 = nil
									break
								else
									tbl6 = v23
								end
							end
						end
					end

					local str = tostring(capture.type or "")

					if not tbl6 and (str == "Knife" or str == "Gun") then
						tbl6 = {
							Key = tostring(k),
							Name = tostring(capture.name or k),
							Display = tostring(capture.name or k),
							Type = str,
							Rarity = tostring(type(flag) == "table" and flag.rarity or capture.rarity or "Common"),
							ItemID = tostring(type(flag) == "table" and flag.itemId or capture.itemId or ""),
							Image = tostring(type(flag) == "table" and flag.image or capture.image or ""),
							Available = false,
						}

						mellstroySkinChanger2.Items[#mellstroySkinChanger2.Items + 1] = tbl6
						mellstroySkinChanger2.ItemsByType[str][#mellstroySkinChanger2.ItemsByType[str] + 1] = tbl6
						mellstroySkinChanger2.ItemByKey[tbl6.Key] = tbl6
					end

					if tbl6 and type(capture.variants) == "table" then
						local v22 = nil
						local v23 = nil
						local v24 = nil

						for k2, variant in pairs(capture.variants) do
							local n = variant.sourceKind == "EquippedTool" and 200 or variant.sourceKind == "LutosysModel" and 180 or variant.sourceKind == "CreatorArchive" and 160 or variant.sourceKind == "LutosysDisplay" and 140 or variant.sourceKind == "CopycatModel" and 100 or nil

							if n and variant.sourceKind == "CopycatModel" and type(variant.tool.grip) == "table" then
								n += 50
							end

							if n then
								n += tonumber(variant.quality) or 0
							end

							if n and type(variant.tool) == "table" and (not v22 or n > v22) then
								v22 = n
								v23 = variant
								v24 = k2
							end
						end

						if v23 and (not tbl6.SavedVariantScore or v22 >= tbl6.SavedVariantScore) then
							local flag2 = mellstroySkinChanger2.TemplateCache[tbl6.Key] and not string.find(mellstroySkinChanger2.TemplateSource[tbl6.Key] or "", "MM2 equipped Tool", 1, true)

							if flag2 then
								flag2 = v22 > (tbl6.SavedVariantScore or -math.huge)
							end

							if flag2 then
								pcall(mellstroySkinChanger2.TemplateCache[tbl6.Key].Destroy, mellstroySkinChanger2.TemplateCache[tbl6.Key])
								mellstroySkinChanger2.TemplateCache[tbl6.Key] = nil
							end

							tbl6.SavedVariant = v23
							tbl6.SavedVariantSignature = v24
							tbl6.SavedVariantSource = v23.sourceKind
							tbl6.SavedVariantScore = v22
							tbl6.GeometryAvailable = true
							tbl6.Available = true
							tbl5[tbl6.Key] = true
						end
					end
				end
			end

			for k, v21 in pairs(mellstroySkinChanger2.ItemsByType) do
				table.sort(v21, function(arg3, arg4)
					local flag = arg3.Key == (k == "Knife" and "DefaultKnife" or "DefaultGun")
					if flag ~= arg4.Key == (k == "Knife" and "DefaultKnife" or "DefaultGun") then
						return flag
					end
					return string.lower(arg3.Display) < string.lower(arg4.Display)
				end)
			end

			local n = 0

			for k in pairs(tbl5) do
				n += 1
			end

			return n
		end

		mellstroySkinChanger2:LoadCollectorCatalog(true)

		local function fn13(arg)
			local character = arg and arg.Character
			if not character then
				return 0
			end
			local n = 0

			for _, v21 in ipairs({ "Knife", "Gun" }) do
				local attribute = arg:GetAttribute("Equipped" .. v21)
				local v22 = character:FindFirstChild("DisplayRef" .. v21)
				local value = v22 and v22:IsA("ObjectValue") and v22.Value

				if attribute and value and fn12(attribute, value, "MM2 holster display | " .. arg.Name, false) then
					n += 1
				end
			end

			for _, v21 in ipairs({ character, arg:FindFirstChildOfClass("Backpack") }) do
				if v21 then
					for _, child in ipairs(v21:GetChildren()) do
						local v22 = fn11(child)

						if v22 and not child:FindFirstChild("__MellstroySkinVisual") then
							local attribute = arg:GetAttribute("Equipped" .. v22)
							local flag = not string.find(attribute and mellstroySkinChanger2.TemplateSource[tostring(attribute)] or "", "equipped Tool", 1, true)

							if attribute and fn12(attribute, child, "MM2 equipped Tool | " .. arg.Name, flag) then
								n += 1
							end
						end
					end
				end
			end

			return n
		end

		local function fn14(arg, arg2)
			local lobby = workspace:FindFirstChild("Lobby")
			lobby = lobby and lobby:FindFirstChild(arg2)

			if lobby then
				lobby = lobby:FindFirstChildWhichIsA("MeshPart", true) or lobby:FindFirstChildWhichIsA("Part", true)
			end

			if not lobby then
				return false
			end
			local main = nil

			pcall(function()
				main = localPlayer.PlayerGui.CrossPlatform.ItemPackFrame.Container.ItemPack.Main
			end)

			local center = main and main:FindFirstChild(arg, true)
			center = center and center:FindFirstChild("Center")
			center = center and center:FindFirstChild("Item")
			center = center and center:FindFirstChild("ItemName")
			center = center and center:FindFirstChild("NameLabel")
			local v21 = fn10(center and center.Text, arg)
			return v21 and fn12(v21.Key, lobby, "MM2 developer shop display", false) or false
		end

		mellstroySkinChanger2.ScanDeveloperModels = function(arg, arg2)
			local v21 = mellstroySkinChanger2:LoadCollectorCatalog(arg2 == true)

			for _, player in ipairs(Players:GetPlayers()) do
				v21 += fn13(player)
			end

			if fn14("Knife", "KnifePrompt") then
				v21 += 1
			end

			if fn14("Gun", "GunPrompt") then
				v21 += 1
			end

			return v21
		end

		mellstroySkinChanger2.GetAvailableCount = function(arg, arg2)
			local v21 = ipairs
			arg2 = arg2 and mellstroySkinChanger2.ItemsByType[arg2] or mellstroySkinChanger2.Items
			local n = 0

			for _, v22 in v21(arg2) do
				if v22.Available then
					n += 1
				end
			end

			return n
		end

		mellstroySkinChanger2.GetAvailableItems = function(arg, arg2)
			local tbl4 = {}
			local v21 = ipairs
			local tbl5 = mellstroySkinChanger2.ItemsByType[arg2] or {}

			for _, v22 in v21(tbl5) do
				if v22.Available == true and (mellstroySkinChanger2.TemplateCache[v22.Key] or type(v22.SavedVariant) == "table") then
					tbl4[#tbl4 + 1] = v22
				end
			end

			return tbl4
		end

		mellstroySkinChanger2.GetTemplate = function(arg, arg2)
			if not arg2 then
				return nil, "unknown skin"
			end
			local v21 = mellstroySkinChanger2.TemplateCache[arg2.Key]

			if v21 and v21.Parent == nil then
				if v21:GetAttribute("MellstroySkinGripReady") == true then
					return v21, mellstroySkinChanger2.TemplateSource[arg2.Key] or "local model cache"
				end
				return nil, "geometry captured; equipped Tool grip is still missing"
			end

			if type(arg2.SavedVariant) == "table" then
				local ok, result = pcall(mellstroySkinChanger2.BuildSavedTemplate, mellstroySkinChanger2, arg2, arg2.SavedVariant)

				if ok and result then
					local str = tostring(arg2.SavedVariantSource or "")
					mellstroySkinChanger2.TemplateCache[arg2.Key] = result
					mellstroySkinChanger2.TemplateSource[arg2.Key] = str == "CopycatModel" and "copycat exact model | target grip" or string.sub(str, 1, 7) == "Lutosys" and "Lutosys MM2 model database | target grip" or str == "CreatorArchive" and "verified creator archive | target grip" or "collector equipped Tool | exact grip"
					mellstroySkinChanger2.CollectorSignatures[arg2.Key] = arg2.SavedVariantSignature
					return result, mellstroySkinChanger2.TemplateSource[arg2.Key]
				end

				if not ok then
					warn("[mellstroyhook] skipped invalid skin template " .. tostring(arg2.Key) .. ": " .. tostring(result))
				end
			end

			mellstroySkinChanger2:ScanDeveloperModels()
			local v22 = mellstroySkinChanger2.TemplateCache[arg2.Key]
			local v23 = mellstroySkinChanger2.TemplateSource[arg2.Key]
			if v22 and v22:GetAttribute("MellstroySkinGripReady") == true then
				mellstroySkinChanger2.FailedAt[arg2.Key] = nil
				return v22, v23 or "MM2 developer model"
			end
			mellstroySkinChanger2.FailedAt[arg2.Key] = os.clock()
			return nil, v22 and "geometry captured; equipped Tool grip is still missing" or "developer model is not streamed yet"
		end

		mellstroySkinChanger2.RestoreTool = function(arg, arg2)
			local v21 = mellstroySkinChanger2.Applied[arg2]

			if v21 then
				mellstroySkinChanger2.Applied[arg2] = nil

				if v21.Visual then
					pcall(v21.Visual.Destroy, v21.Visual)
				end

				if typeof(v21.Grip) == "CFrame" then
					pcall(function()
						arg2.Grip = v21.Grip
					end)
				end
			end

			local flag = false

			for _, child in ipairs(arg2:GetChildren()) do
				if child.Name == "__MellstroySkinVisual" or child:GetAttribute("MellstroySkinVisual") == true then
					pcall(child.Destroy, child)
					flag = true
				end
			end

			if v21 then
				for k, v22 in pairs(v21.Transparency) do
					if k and k.Parent then
						pcall(function()
							k.LocalTransparencyModifier = v22
						end)
					end
				end
			elseif flag then
				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.LocalTransparencyModifier = 0
					end
				end
			end
		end

		mellstroySkinChanger2.RestoreType = function(arg, arg2)
			for k, v21 in pairs(mellstroySkinChanger2.Applied) do
				if not arg2 or v21.Type == arg2 then
					mellstroySkinChanger2:RestoreTool(k)
				end
			end
		end

		mellstroySkinChanger2.ApplyTool = function(arg, parent, arg2, arg3, arg4)
			if mellstroySkinChanger2.Unloaded or not mellstroySkinChanger2.Enabled or not parent or not parent.Parent then
				return false
			end
			local handle = parent:FindFirstChild("Handle", true)
			if not handle or not handle:IsA("BasePart") then
				return false
			end
			mellstroySkinChanger2:RestoreTool(parent)
			local grip = parent.Grip
			local attribute = arg3:GetAttribute("MellstroySkinToolGrip")
			local cframe = CFrame.new()

			if typeof(attribute) == "CFrame" then
				if arg2 == "Gun" then
					cframe = grip * attribute:Inverse()
				else
					parent.Grip = attribute
				end
			end

			local clone = arg3:Clone()
			clone.Name = "__MellstroySkinVisual"
			clone:SetAttribute("MellstroySkinVisual", true)
			local tbl4 = {}

			for _, descendant in ipairs(parent:GetDescendants()) do
				if descendant:IsA("BasePart") and not descendant:IsDescendantOf(clone) then
					tbl4[descendant] = descendant.LocalTransparencyModifier
					descendant.LocalTransparencyModifier = 1
				end
			end

			for _, descendant in ipairs(clone:GetDescendants()) do
				if descendant:IsA("BasePart") then
					local attribute2 = descendant:GetAttribute("MellstroySkinRelative")
					local attribute3 = descendant:GetAttribute("MellstroySkinSize")

					if typeof(attribute3) == "Vector3" then
						descendant.Size = attribute3
					end

					descendant.CFrame = handle.CFrame * cframe * (typeof(attribute2) == "CFrame" and attribute2 or CFrame.new())
					descendant.Anchored = false
					descendant.CanCollide = false
					descendant.CanQuery = false
					descendant.CanTouch = false
					descendant.Massless = true
					descendant.LocalTransparencyModifier = 0
					local weldConstraint = Instance.new("WeldConstraint")
					weldConstraint.Name = "MellstroySkinWeld"
					weldConstraint.Part0 = handle
					weldConstraint.Part1 = descendant
					weldConstraint.Parent = descendant
				end
			end

			clone.Parent = parent
			mellstroySkinChanger2.Applied[parent] = { Visual = clone, Transparency = tbl4, Grip = grip, Type = arg2, Key = arg4.Key }
			return true
		end

		local v21 = nil

		local function fn15(arg, arg2)
			if v21 and mellstroySkinChanger2.CurrentType then
				v21:SetStatus(arg, arg2 == true and v.Accent or arg2 == false and Color3.fromRGB(235, 80, 80) or Color3.fromRGB(155, 155, 155))
			end
		end

		local function fn16(arg, arg2, arg3)
			arg = arg or mellstroySkinChanger2.CurrentType
			local availableItems = mellstroySkinChanger2:GetAvailableItems(arg)
			local str = mellstroySkinChanger2.Selected[arg]
			local v22 = mellstroySkinChanger2.ItemByKey[str]

			if not v22 or v22.Type ~= arg or not v22.Available then
				str = availableItems[1] and availableItems[1].Key or ""
				mellstroySkinChanger2.Selected[arg] = str
			end

			if v21 and mellstroySkinChanger2.CurrentType == arg then
				v21:SetOptions(availableItems, str, arg2 ~= false, arg3 == true)
			end

			return availableItems
		end

		local function fn17(arg)
			for _, v22 in ipairs({ localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack") }) do
				if v22 then
					for _, child in ipairs(v22:GetChildren()) do
						local v23 = fn11(child)

						if v23 then
							arg(child, v23)
						end
					end
				end
			end
		end

		mellstroySkinChanger2.RefreshType = function(arg, arg2)
			mellstroySkinChanger2.LoadGeneration[arg2] = mellstroySkinChanger2.LoadGeneration[arg2] + 1
			local v22 = mellstroySkinChanger2.LoadGeneration[arg2]
			mellstroySkinChanger2:RestoreType(arg2)
			if not mellstroySkinChanger2.Enabled then
				return
			end
			local v23 = mellstroySkinChanger2.ItemByKey[mellstroySkinChanger2.Selected[arg2]]

			if not v23 then
				if mellstroySkinChanger2.CurrentType == arg2 then
					fn15("selected skin is missing", false)
				end

				return
			end

			if mellstroySkinChanger2.CurrentType == arg2 then
				fn15("loading local model: " .. v23.Name .. "...")
			end

			task.spawn(function()
				local template = mellstroySkinChanger2:GetTemplate(v23)
				if mellstroySkinChanger2.Unloaded or v22 ~= mellstroySkinChanger2.LoadGeneration[arg2] then
					return
				end

				if not template then
					if mellstroySkinChanger2.CurrentType == arg2 then
						fn15("unavailable: " .. v23.Name, false)
					end

					return
				end

				local n = 0

				fn17(function(arg3, arg4)
					if arg4 == arg2 and mellstroySkinChanger2:ApplyTool(arg3, arg2, template, v23) then
						n += 1
					end
				end)

				if mellstroySkinChanger2.CurrentType == arg2 then
					fn15("loaded: " .. v23.Name, true)
				end
			end)
		end

		mellstroySkinChanger2.SetEnabled = function(arg, arg2)
			mellstroySkinChanger2.Enabled = arg2 == true

			if not mellstroySkinChanger2.Enabled then
				mellstroySkinChanger2:RestoreType()
				fn15("skin changer disabled")
				return
			end

			mellstroySkinChanger2:RefreshType("Knife")
			mellstroySkinChanger2:RefreshType("Gun")
		end

		mellstroySkinChanger2.SetSelected = function(arg, arg2, arg3)
			if not mellstroySkinChanger2.ItemByKey[arg3] or mellstroySkinChanger2.ItemByKey[arg3].Type ~= arg2 or mellstroySkinChanger2.ItemByKey[arg3].Available ~= true then
				return false
			end
			mellstroySkinChanger2.Selected[arg2] = arg3

			if mellstroySkinChanger2.Enabled then
				mellstroySkinChanger2:RefreshType(arg2)
			else
				local v22 = mellstroySkinChanger2.ItemByKey[arg3]
				fn15("selected: " .. v22.Name, v22.Available and true or nil)
			end

			return true
		end

		mellstroySkinChanger2.AvatarNotice = function(arg, arg2)
			local mellstroyFeedback = getgenv().__MellstroyFeedback

			if mellstroyFeedback and type(mellstroyFeedback.Notify) == "function" then
				mellstroyFeedback:Notify(arg2)
			else
				print("[mellstroyhook] " .. tostring(arg2))
			end
		end

		mellstroySkinChanger2.ResolveAvatarUserId = function(arg, arg2)
			local num = tonumber(arg2)
			if num and num > 0 then
				return math.floor(num)
			end

			if arg2 == "" then
				return nil
			end
			local ok, result = pcall(Players.GetUserIdFromNameAsync, Players, arg2)
			return ok and result or nil
		end

		mellstroySkinChanger2.RestoreAvatarVisual = function()
			local avatarVisualState = mellstroySkinChanger2.AvatarVisualState
			mellstroySkinChanger2.AvatarVisualState = nil
			if not avatarVisualState then
				return
			end

			if avatarVisualState.Donor then
				pcall(avatarVisualState.Donor.Destroy, avatarVisualState.Donor)
			end

			for k, hiddenPart in pairs(avatarVisualState.HiddenParts) do
				if k.Parent then
					pcall(function()
						k.LocalTransparencyModifier = hiddenPart
					end)
				end
			end

			for k, hiddenEffect in pairs(avatarVisualState.HiddenEffects) do
				if k.Parent then
					pcall(function()
						k.Enabled = hiddenEffect
					end)
				end
			end
		end

		mellstroySkinChanger2.ApplyAvatarModel = function(arg, arg2, arg3, arg4)
			mellstroySkinChanger2:RestoreAvatarVisual()

			local avatarVisualState = {
				Character = arg2,
				Donor = arg4,
				HiddenParts = {},
				HiddenEffects = {},
				RigJoints = {},
				DonorParts = {},
				Root = arg2:FindFirstChild("HumanoidRootPart"),
				DonorRoot = arg4:FindFirstChild("HumanoidRootPart"),
			}

			mellstroySkinChanger2.AvatarVisualState = avatarVisualState

			local function fn18(arg5)
				if arg5:IsA("AnimationConstraint") then
					local attachment0 = arg5.Attachment0
					local attachment1 = arg5.Attachment1
					if attachment0 and attachment1 and attachment0.Parent and attachment1.Parent and attachment0.Parent:IsA("BasePart") and attachment1.Parent:IsA("BasePart") then
						return attachment0.Parent, attachment1.Parent, attachment0.CFrame, attachment1.CFrame
					end
				elseif arg5:IsA("Motor6D") and arg5.Part0 and arg5.Part1 then
					return arg5.Part0, arg5.Part1, arg5.C0, arg5.C1
				end
			end

			local function fn19(arg5, arg6, arg7)
				return arg6.Name .. "\0" .. arg7.Name .. "\0" .. arg5.Name
			end

			local tbl4 = {}

			for _, descendant in ipairs(arg2:GetDescendants()) do
				if descendant:IsA("Motor6D") or descendant:IsA("AnimationConstraint") then
					local v22, v23 = fn18(descendant)

					if v22 and v23 then
						tbl4[fn19(descendant, v22, v23)] = descendant
					end
				end
			end

			arg4.Name = "MellstroyAvatarVisual"
			arg4:SetAttribute("MellstroyAvatarVisual", true)
			local humanoid = arg4:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.Name = "MellstroyAvatarRenderer"
					humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
					humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
					humanoid.NameDisplayDistance = 0
					humanoid.HealthDisplayDistance = 0
					humanoid.BreakJointsOnDeath = false
					humanoid.RequiresNeck = false
					humanoid.AutoRotate = false
					humanoid.PlatformStand = true
					humanoid.EvaluateStateMachine = false
					humanoid.WalkSpeed = 0
					humanoid.JumpPower = 0
				end)

				local animator = humanoid:FindFirstChildOfClass("Animator")

				if animator then
					animator:Destroy()
				end
			end

			for _, descendant in ipairs(arg4:GetDescendants()) do
				if descendant:IsA("BaseScript") then
					descendant:Destroy()
				elseif descendant:IsA("BasePart") then
					descendant.CanCollide = false
					descendant.CanQuery = false
					descendant.CanTouch = false
					descendant.Massless = true
					avatarVisualState.DonorParts[#avatarVisualState.DonorParts + 1] = descendant
					local flag = descendant.Parent == arg4 and arg2:FindFirstChild(descendant.Name)

					if flag and flag:IsA("BasePart") then
						descendant.Anchored = true
						descendant.CFrame = flag.CFrame
					else
						descendant.Anchored = false
					end

					if descendant == avatarVisualState.DonorRoot then
						descendant.Transparency = 1
					end
				elseif (descendant:IsA("Motor6D") or descendant:IsA("Constraint")) and descendant.Parent then
					if descendant:IsA("Motor6D") or descendant:IsA("AnimationConstraint") then
						local v22, v23, v24, v25 = fn18(descendant)

						if v22 and v23 then
							avatarVisualState.RigJoints[#avatarVisualState.RigJoints + 1] = {
								Part0 = v22,
								Part1 = v23,
								C0 = v24,
								C1Inverse = v25:Inverse(),
								Source = tbl4[fn19(descendant, v22, v23)],
							}
						end
					end

					pcall(function()
						descendant.Enabled = false
					end)
				end
			end

			local rigJoints = {}
			local tbl5 = {}
			local tbl6 = { [avatarVisualState.DonorRoot] = true }

			while #rigJoints < #avatarVisualState.RigJoints do
				local flag = false

				for _, rigJoint in ipairs(avatarVisualState.RigJoints) do
					if not tbl5[rigJoint] and tbl6[rigJoint.Part0] then
						tbl5[rigJoint] = true
						tbl6[rigJoint.Part1] = true
						rigJoints[#rigJoints + 1] = rigJoint
						flag = true
					end
				end

				if flag then
					continue
				end
				break
			end

			avatarVisualState.RigJoints = rigJoints

			for _, descendant in ipairs(arg2:GetDescendants()) do
				if descendant:IsA("BasePart") then
					local flag = descendant.Parent == arg2 and descendant ~= avatarVisualState.Root
					local flag2 = descendant:FindFirstAncestorOfClass("Accessory") ~= nil

					if flag or flag2 then
						avatarVisualState.HiddenParts[descendant] = descendant.LocalTransparencyModifier
						descendant.LocalTransparencyModifier = 1
					end
				elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") or descendant:IsA("Light") then
					if descendant:FindFirstAncestorOfClass("Accessory") then
						avatarVisualState.HiddenEffects[descendant] = descendant.Enabled
						descendant.Enabled = false
					end
				end
			end

			arg4.Parent = workspace.CurrentCamera or workspace
		end

		mellstroySkinChanger2.RestoreAvatar = function()
			mellstroySkinChanger2.AvatarGeneration = mellstroySkinChanger2.AvatarGeneration + 1
			mellstroySkinChanger2:RestoreAvatarVisual()
		end

		mellstroySkinChanger2.ApplyAvatar = function()
			if mellstroySkinChanger2.Unloaded or not mellstroySkinChanger2.AvatarEnabled then
				return
			end
			mellstroySkinChanger2.AvatarGeneration = mellstroySkinChanger2.AvatarGeneration + 1
			local avatarGeneration = mellstroySkinChanger2.AvatarGeneration
			local str = tostring(mellstroySkinChanger2.AvatarTarget or "")

			task.spawn(function()
				local v22 = mellstroySkinChanger2:ResolveAvatarUserId(str)
				if not v22 or mellstroySkinChanger2.Unloaded or avatarGeneration ~= mellstroySkinChanger2.AvatarGeneration then
					mellstroySkinChanger2:AvatarNotice("avatar target not found")
					return
				end
				local ok, result = pcall(Players.GetHumanoidDescriptionFromUserIdAsync or Players.GetHumanoidDescriptionFromUserId, Players, v22)
				if not ok or not result or mellstroySkinChanger2.Unloaded or avatarGeneration ~= mellstroySkinChanger2.AvatarGeneration then
					mellstroySkinChanger2:AvatarNotice("failed to load avatar " .. str)
					return
				end
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					result:Destroy()
					return
				end
				local ok2, result2 = pcall(Players.CreateHumanoidModelFromDescriptionAsync or Players.CreateHumanoidModelFromDescription, Players, result, humanoid.RigType)
				result:Destroy()

				if not ok2 or not result2 then
					warn("[mellstroyhook] avatar changer: " .. tostring(result2))
					mellstroySkinChanger2:AvatarNotice("failed to build avatar")
					return
				end

				if mellstroySkinChanger2.Unloaded or avatarGeneration ~= mellstroySkinChanger2.AvatarGeneration or localPlayer.Character ~= character then
					result2:Destroy()
					return
				end
				local ok3, result3 = pcall(mellstroySkinChanger2.ApplyAvatarModel, mellstroySkinChanger2, character, humanoid, result2)

				if ok3 then
					mellstroySkinChanger2:AvatarNotice("changed avatar to " .. str)
				else
					if result2.Parent then
						result2:Destroy()
					end

					warn("[mellstroyhook] avatar changer: " .. tostring(result3))
					mellstroySkinChanger2:AvatarNotice("failed to apply avatar")
				end
			end)
		end

		mellstroySkinChanger2.SetAvatarEnabled = function(arg, arg2)
			mellstroySkinChanger2.AvatarEnabled = arg2 == true

			if mellstroySkinChanger2.AvatarEnabled then
				mellstroySkinChanger2:ApplyAvatar()
			else
				mellstroySkinChanger2:RestoreAvatar()
			end
		end

		v18:CreateToggle({
			Name = "Enabled",
			State = false,
			Bindable = false,
			ConfigId = "SkinChangerEnabled",
			Callback = function(arg)
				mellstroySkinChanger2:SetEnabled(arg)
			end,
		})

		local v22 = v18:CreateDropdown({
			Name = "Weapon type",
			Options = { "Knife", "Gun" },
			State = 1,
			ConfigId = "SkinChangerWeaponType",
			Callback = function(arg)
				mellstroySkinChanger2.CurrentType = arg == 2 and "Gun" or "Knife"
				fn16(mellstroySkinChanger2.CurrentType, true, true)
				local v22 = mellstroySkinChanger2.ItemByKey[mellstroySkinChanger2.Selected[mellstroySkinChanger2.CurrentType]]
				fn15((mellstroySkinChanger2.Enabled and "loaded selection: " or "selected: ") .. (v22 and v22.Name or "no captured skins"))
			end,
		})

		v18:CreateButton({
			Name = "Rescan developer models",
			Callback = function()
				local v23 = mellstroySkinChanger2:ScanDeveloperModels()
				fn16(mellstroySkinChanger2.CurrentType, true, true)

				if mellstroySkinChanger2.Enabled then
					mellstroySkinChanger2:RefreshType(mellstroySkinChanger2.CurrentType)
				else
					fn15(tostring(mellstroySkinChanger2:GetAvailableCount(mellstroySkinChanger2.CurrentType)) .. " skins available" .. (v23 > 0 and " | updated" or ""), true)
				end
			end,
		})

		mellstroySkinChanger2:ScanDeveloperModels()

		v21 = v20:CreateSearchList({
			Name = "Skin list",
			Options = mellstroySkinChanger2:GetAvailableItems("Knife"),
			State = mellstroySkinChanger2.Selected.Knife,
			Height = 472,
			PoolSize = 28,
			ShowSelectionLabel = false,
			BoldSelected = true,
			NoBullet = true,
			Configurable = false,
			Callback = function(arg)
				mellstroySkinChanger2:SetSelected(mellstroySkinChanger2.CurrentType, arg)
			end,
		})

		mellstroySkinChanger2.AvatarTargetControl = v19:CreateTextbox({
			Name = "Avatar username / ID",
			State = "",
			Placeholder = "username or user id",
			MaxLength = 32,
			ConfigId = "AvatarChangerTarget",
			Callback = function(arg)
				mellstroySkinChanger2.AvatarTarget = tostring(arg or "")

				if mellstroySkinChanger2.AvatarEnabled and mellstroySkinChanger2.AvatarTarget ~= "" then
					mellstroySkinChanger2:ApplyAvatar()
				end
			end,
		})

		mellstroySkinChanger2.AvatarToggle = v19:CreateToggle({
			Name = "Avatar changer",
			State = false,
			Bindable = false,
			ConfigId = "AvatarChangerEnabled",
			Callback = function(arg)
				mellstroySkinChanger2:SetAvatarEnabled(arg)
			end,
		})

		v19:CreateButton({
			Name = "Apply avatar",
			Callback = function()
				if not mellstroySkinChanger2.AvatarEnabled then
					mellstroySkinChanger2.AvatarToggle:Set(true)
				else
					mellstroySkinChanger2:ApplyAvatar()
				end
			end,
		})

		v19:CreateButton({
			Name = "Restore avatar",
			Callback = function()
				mellstroySkinChanger2.AvatarToggle:Set(false)
			end,
		})

		v19:CreateButton({
			Name = "Download skins from GitHub",
			Callback = function()
				if mellstroySkinChanger2.DownloadingCatalog then
					return
				end
				mellstroySkinChanger2.DownloadingCatalog = true
				fn15("downloading skin pack...", true)

				task.spawn(function()
					local ok, result = pcall(function()
						if type(writefile) ~= "function" then
							error("executor does not support writefile")
						end

						if type(makefolder) == "function" then
							pcall(makefolder, index.Folder)
							pcall(makefolder, index.Folder .. "/skin-data")
						end

						local response = game:HttpGet("https://raw.githubusercontent.com/idanoob64/mm2/main/skin-data/skins.json", true)
						local data = game:GetService("HttpService"):JSONDecode(response)

						if type(data) ~= "table" or type(data.captures) ~= "table" then
							error("GitHub returned an invalid skin pack")
						end

						writefile("mellstroyhook/skin-data/skins.json", response)
						local v23 = mellstroySkinChanger2:LoadCollectorCatalog(true)
						fn16(mellstroySkinChanger2.CurrentType, true)

						if mellstroySkinChanger2.Enabled then
							mellstroySkinChanger2:RefreshType(mellstroySkinChanger2.CurrentType)
						end

						return v23
					end)

					mellstroySkinChanger2.DownloadingCatalog = false

					if ok then
						fn15("skin pack downloaded | " .. tostring(result) .. " new models loaded", true)
					else
						fn15("skin download failed", false)
						warn("[mellstroyhook] skin download failed: " .. tostring(result))
					end
				end)
			end,
		})

		v19:CreateButton({
			Name = "Clear model cache",
			Callback = function()
				mellstroySkinChanger2:RestoreType()

				for k, v23 in pairs(mellstroySkinChanger2.TemplateCache) do
					pcall(v23.Destroy, v23)
					mellstroySkinChanger2.TemplateCache[k] = nil
				end

				mellstroySkinChanger2.TemplateSource = {}
				mellstroySkinChanger2.CollectorSignatures = {}
				mellstroySkinChanger2.FailedAt = {}
				mellstroySkinChanger2:ScanDeveloperModels(true)
				fn16(mellstroySkinChanger2.CurrentType, true, true)
				fn15("skin and developer cache rebuilt", true)

				if mellstroySkinChanger2.Enabled then
					mellstroySkinChanger2:RefreshType(mellstroySkinChanger2.CurrentType)
				end
			end,
		})

		v:RegisterConfigControl({
			Name = "Skin selections",
			Page = v7,
			Section = v19,
			Get = function()
				return { Knife = mellstroySkinChanger2.Selected.Knife, Gun = mellstroySkinChanger2.Selected.Gun }
			end,
			Set = function(arg, arg2)
				if type(arg2) ~= "table" then
					return
				end

				for _, v23 in ipairs({ "Knife", "Gun" }) do
					local str = tostring(arg2[v23] or "")

					if mellstroySkinChanger2.ItemByKey[str] and mellstroySkinChanger2.ItemByKey[str].Type == v23 then
						mellstroySkinChanger2.Selected[v23] = str
					end
				end

				fn16(mellstroySkinChanger2.CurrentType, true, true)

				if mellstroySkinChanger2.Enabled then
					mellstroySkinChanger2:RefreshType("Knife")
					mellstroySkinChanger2:RefreshType("Gun")
				end
			end,
		}, { ConfigId = "SkinChangerSelections" }, "SkinChanger")

		local function fn18(arg)
			local v23 = fn11(arg)
			if not v23 or not mellstroySkinChanger2.Enabled then
				return
			end

			task.delay(0.15, function()
				if not mellstroySkinChanger2.Unloaded and arg.Parent then
					mellstroySkinChanger2:RefreshType(v23)
				end
			end)
		end

		local function fn19(arg)
			if not arg then
				return
			end
			tbl:CreateConnection(arg.ChildAdded, fn18)

			for _, child in ipairs(arg:GetChildren()) do
				fn18(child)
			end
		end

		fn19(localPlayer:FindFirstChildOfClass("Backpack"))
		fn19(localPlayer.Character)

		tbl:CreateConnection(localPlayer.CharacterAdded, function(arg)
			mellstroySkinChanger2:RestoreAvatarVisual()
			fn19(arg)

			if mellstroySkinChanger2.AvatarEnabled then
				task.delay(1, function()
					if not mellstroySkinChanger2.Unloaded and mellstroySkinChanger2.AvatarEnabled and localPlayer.Character == arg then
						mellstroySkinChanger2:ApplyAvatar()
					end
				end)
			end
		end)

		tbl:CreateConnection(game:GetService("RunService").RenderStepped, function()
			local avatarVisualState = mellstroySkinChanger2.AvatarVisualState
			if not mellstroySkinChanger2.AvatarEnabled or not avatarVisualState or avatarVisualState.Character ~= localPlayer.Character then
				return
			end

			for k in pairs(avatarVisualState.HiddenParts) do
				if k.Parent and k.LocalTransparencyModifier ~= 1 then
					k.LocalTransparencyModifier = 1
				end
			end

			for k in pairs(avatarVisualState.HiddenEffects) do
				if k.Parent and k.Enabled then
					k.Enabled = false
				end
			end

			if not avatarVisualState.Donor or not avatarVisualState.Donor.Parent then
				return
			end
			local currentCamera = workspace.CurrentCamera

			if currentCamera and avatarVisualState.Donor.Parent ~= currentCamera then
				avatarVisualState.Donor.Parent = currentCamera
			end

			if avatarVisualState.Root and avatarVisualState.Root.Parent and avatarVisualState.DonorRoot and avatarVisualState.DonorRoot.Parent then
				avatarVisualState.DonorRoot.CFrame = avatarVisualState.Root.CFrame

				for _, rigJoint in ipairs(avatarVisualState.RigJoints) do
					if rigJoint.Part0.Parent and rigJoint.Part1.Parent then
						rigJoint.Part1.CFrame = rigJoint.Part0.CFrame * rigJoint.C0 * (rigJoint.Source and rigJoint.Source.Parent and rigJoint.Source.Transform or CFrame.identity) * rigJoint.C1Inverse
					end
				end
			end

			local head = avatarVisualState.Character:FindFirstChild("Head")
			local flag = head and currentCamera and (currentCamera.CFrame.Position - head.Position).Magnitude < 1.25

			for _, donorPart in ipairs(avatarVisualState.DonorParts) do
				if donorPart.Parent and donorPart ~= avatarVisualState.DonorRoot then
					donorPart.CanCollide = false
					donorPart.CanTouch = false
					donorPart.CanQuery = false
					donorPart.LocalTransparencyModifier = flag and 1 or 0
				end
			end
		end)

		task.spawn(function()
			while not mellstroySkinChanger2.Unloaded do
				task.wait(8)

				if not mellstroySkinChanger2.Unloaded then
					if mellstroySkinChanger2:ScanDeveloperModels() > 0 and v21 then
						fn16(mellstroySkinChanger2.CurrentType, true)

						if mellstroySkinChanger2.Enabled then
							mellstroySkinChanger2:RefreshType("Knife")
							mellstroySkinChanger2:RefreshType("Gun")
						end
					end

					continue
				end

				break
			end
		end)

		getgenv().__MellstroySkinChanger = mellstroySkinChanger2

		v.CleanupCallbacks[#v.CleanupCallbacks + 1] = function()
			mellstroySkinChanger2.Unloaded = true
			mellstroySkinChanger2:RestoreAvatar()
			mellstroySkinChanger2:RestoreType()

			for _, v23 in pairs(mellstroySkinChanger2.TemplateCache) do
				pcall(v23.Destroy, v23)
			end

			if getgenv().__MellstroySkinChanger == mellstroySkinChanger2 then
				getgenv().__MellstroySkinChanger = nil
			end
		end

		v22:Set(v22:Get())
		fn15(tostring(mellstroySkinChanger2:GetAvailableCount("Knife")) .. " knife skins available", true)
	end

	fn5()
	local tbl3 = {}

	local function fn6()
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local v18 = Random.new()
		local flag = false
		local flag2 = false
		local flag3 = false
		local tbl4 = {}
		local tbl5 = nil
		local v19 = sethiddenproperty
		local flag4 = false
		local n = 1
		local v20 = nil
		local flag5 = false

		local function fn7(arg)
			if arg and not flag5 and type(getfflag) == "function" and type(setfflag) == "function" then
				local ok, result = pcall(getfflag, "S2PhysicsSenderRate")

				if ok then
					v20 = result
					flag5 = pcall(setfflag, "S2PhysicsSenderRate", "60")
				end
			elseif not arg and flag5 then
				pcall(setfflag, "S2PhysicsSenderRate", v20)
				v20 = nil
				flag5 = false
			end
		end

		local function fn8()
			local character = Players.LocalPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")

			if type(v19) == "function" and character and character.Parent then
				pcall(v19, character, "NetworkIsSleeping", false)
			end

			flag4 = false
			fn7(false)
		end

		local function fn9()
			local v21 = tbl5
			tbl5 = nil
			if not v21 or not v21.Root or not v21.Root.Parent then
				return
			end

			pcall(function()
				v21.Root.CFrame = v21.CFrame
				v21.Root.AssemblyLinearVelocity = v21.LinearVelocity
				v21.Root.Velocity = v21.LinearVelocity
				v21.Root.AssemblyAngularVelocity = v21.AngularVelocity
				v21.Root.RotVelocity = v21.AngularVelocity
			end)
		end

		local function fn10(arg)
			local flag6 = arg == true
			if flag == flag6 then
				return
			end
			flag = flag6

			if flag6 then
				fn7(true)
			else
				fn9()
				fn8()
			end
		end

		local function fn11()
			fn10((flag2 or flag3) and next(tbl4) == nil)
		end

		tbl3.SetSuppressed = function(arg, arg2, arg3)
			local str = tostring(arg2 or "Unknown")

			if arg3 == true then
				tbl4[str] = true
			else
				tbl4[str] = nil
			end

			fn11()
		end

		tbl3.IsSuppressed = function()
			return next(tbl4) ~= nil
		end

		tbl3.SetAutomatic = function(arg, arg2)
			flag3 = arg2 == true
			fn11()
		end

		tbl3.IsAutomatic = function()
			return flag3
		end

		tbl3.IsEnabled = function()
			return flag
		end

		tbl:CreateConnection(RunService.Heartbeat, function()
			if not flag then
				return
			end
			fn9()
			local character = Players.LocalPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoid or humanoid.Health <= 0 or not humanoidRootPart or not humanoidRootPart:IsA("BasePart") then
				return
			end

			tbl5 = {
				Root = humanoidRootPart,
				CFrame = humanoidRootPart.CFrame,
				LinearVelocity = humanoidRootPart.AssemblyLinearVelocity,
				AngularVelocity = humanoidRootPart.AssemblyAngularVelocity,
			}

			local nextNumber = v18.NextNumber
			local vector = Vector3.new(v18:NextNumber(-20000000, 20000000), v18:NextNumber(10000000, 20000000), nextNumber(v18, -20000000, 20000000))
			local rad = math.rad
			local nextInteger = v18.NextInteger
			local cframe = CFrame.Angles(math.rad(v18:NextInteger(0, 359)), math.rad(v18:NextInteger(0, 359)), rad(nextInteger(v18, 0, 359)))

			if not pcall(function()
				if type(v19) == "function" then
					flag4 = not flag4
					pcall(v19, humanoidRootPart, "NetworkIsSleeping", flag4)
				end

				humanoidRootPart.CFrame = CFrame.new(vector) * cframe
				n = -n
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(n * 0.05, 0, 0)
				error("devirt: storing a non-empty VM table into a register (at 37:25)")
			end) then
				fn9()
			end
		end)

		RunService:UnbindFromRenderStep("MellstroyhookVoidRenderRestore")
		RunService:BindToRenderStep("MellstroyhookVoidRenderRestore", Enum.RenderPriority.Camera.Value - 1, fn9)

		v13:CreateToggle({
			Name = "Void spam",
			State = false,
			Bindable = true,
			BindMode = "Hold",
			Callback = function(arg)
				flag2 = arg == true
				fn11()
			end,
		})

		v.CleanupCallbacks[#v.CleanupCallbacks + 1] = function()
			flag2 = false
			flag3 = false
			table.clear(tbl4)
			fn10(false)
			RunService:UnbindFromRenderStep("MellstroyhookVoidRenderRestore")
		end
	end

	fn6()
	local tbl4 = { Whitelist = false, DisableVisuals = false, HighPriority = false }
	local tbl5 = {}
	local v18 = nil
	local flag = false
	local tbl6 = {}

	local tbl7 = {
		Murder = Color3.fromRGB(255, 0, 0),
		Murderer = Color3.fromRGB(255, 0, 0),
		Sheriff = Color3.fromRGB(0, 0, 255),
	}

	local n = 0

	local function fn7(arg, arg2)
		if not arg then
			return false
		end
		local character = arg.Character
		local backpack = arg:FindFirstChildOfClass("Backpack")
		return character and character:FindFirstChild(arg2) ~= nil or backpack and backpack:FindFirstChild(arg2) ~= nil
	end

	local function fn8(arg)
		local v19 = arg and tbl6[arg.Name]
		if v19 ~= nil then
			return v19
		end

		if fn7(arg, "Knife") then
			return "Murderer"
		end

		if fn7(arg, "Gun") then
			return "Sheriff"
		end
		return nil
	end

	local function fn9(arg)
		return arg and tbl7[fn8(arg)] or nil
	end

	local function fn10(arg)
		n += 1
		table.clear(tbl6)

		if type(arg) == "table" then
			for k, v19 in pairs(arg) do
				if type(k) == "string" and type(v19) == "table" then
					tbl6[k] = v19.Role
				end
			end
		end

		if v18 then
			v18:RefreshColors()
		end
	end

	local function fn11(arg)
		local tbl8 = {}

		for k, v19 in pairs(arg) do
			tbl8[k] = v19
		end

		return tbl8
	end

	local function fn12(arg)
		if not arg then
			return tbl4
		end
		local v19 = tbl5[arg.UserId]

		if not v19 then
			v19 = fn11(tbl4)
			tbl5[arg.UserId] = v19
		end

		return v19
	end

	local function fn13(arg)
		return function(arg2)
			if flag then
				return
			end
			local v19 = v18 and v18:Get()

			if v19 then
				fn12(v19)[arg] = arg2
			end
		end
	end

	local function fn14(arg)
		return arg == "Murder" or arg == "Murderer"
	end

	local function fn15(arg)
		local v19 = fn8(game:GetService("Players").LocalPlayer)
		local v20 = fn8(arg)
		return (v19 == "Team1" or v19 == "Team2") and (v20 == "Team1" or v20 == "Team2") and v19 ~= v20
	end

	local function fn16(arg, arg2)
		local v19 = fn8(arg)
		if fn15(arg) then
			return true
		end

		if arg2 == "Revolver" then
			return fn14(v19)
		end

		if arg2 == "Knife" then
			return v19 == "Sheriff" or v19 == "Hero" or v19 == "Innocent"
		end
		return false
	end

	local mellstroySilentAimState = getgenv().__MellstroySilentAimState

	if type(mellstroySilentAimState) ~= "table" then
		mellstroySilentAimState = {}
		getgenv().__MellstroySilentAimState = mellstroySilentAimState
	end

	mellstroySilentAimState.Enabled = false
	mellstroySilentAimState.SelectedWeapon = "Revolver"
	mellstroySilentAimState.EquippedWeapon = nil
	mellstroySilentAimState.Weapon = "Revolver"
	mellstroySilentAimState.WeaponSettings = { Revolver = false, Knife = false }
	mellstroySilentAimState.MagicKnife = false
	mellstroySilentAimState.Wallbang = false
	mellstroySilentAimState.ForceNoSpread = false
	mellstroySilentAimState.RagebotVisibleCheck = true
	mellstroySilentAimState.LastRewrite = nil
	mellstroySilentAimState.TargetSamples = {}
	mellstroySilentAimState.Ragebot = false
	mellstroySilentAimState.AutoFarmCombat = false
	mellstroySilentAimState.RagebotFOV = 250
	mellstroySilentAimState.KnifeAura = false
	mellstroySilentAimState.KnifeAuraRange = 100
	mellstroySilentAimState.LastKnifeAuraStab = 0
	mellstroySilentAimState.RagebotHitboxes = { Head = true, Torso = true, Arms = true, Legs = true }
	mellstroySilentAimState.HitboxExpansion = { Revolver = 0, Knife = 0 }
	mellstroySilentAimState.LastRagebotShot = nil
	mellstroySilentAimState.LastRagebotFire = 0
	mellstroySilentAimState.RagebotFireInterval = 3.08
	mellstroySilentAimState.RagebotEquipDelay = 0.18
	mellstroySilentAimState.ShotHistory = {}

	mellstroySilentAimState.RecordShot = function(arg)
		if type(arg) ~= "table" then
			return
		end
		local shotHistory = mellstroySilentAimState.ShotHistory
		shotHistory[#shotHistory + 1] = arg

		while #shotHistory > 20 do
			table.remove(shotHistory, 1)
		end
	end

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService2 = game:GetService("UserInputService")
	local CollectionService = game:GetService("CollectionService")
	local n2 = 96
	local tbl8 = { "Revolver", "Knife" }

	if mellstroySilentAimState.CantShootSuppressConnection then
		mellstroySilentAimState.CantShootSuppressConnection:Disconnect()
		mellstroySilentAimState.CantShootSuppressConnection = nil
	end

	local function fn17()
		local character = Players.LocalPlayer.Character
		character = character and character:FindFirstChild("Gun")
		character = character and character:FindFirstChild("CantShoot")

		if character and character:IsA("BillboardGui") and character.Enabled then
			character.Enabled = false
		end
	end

	local v19 = tbl:CreateConnection(RunService.PreRender, fn17)
	mellstroySilentAimState.CantShootSuppressConnection = v19
	fn17()

	v.CleanupCallbacks[#v.CleanupCallbacks + 1] = function()
		v19:Disconnect()

		if mellstroySilentAimState.CantShootSuppressConnection == v19 then
			mellstroySilentAimState.CantShootSuppressConnection = nil
		end
	end

	mellstroySilentAimState.IsFiniteNumber = function(arg)
		return type(arg) == "number" and arg == arg and arg > -math.huge and arg < math.huge
	end

	mellstroySilentAimState.IsFiniteVector3 = function(arg)
		return typeof(arg) == "Vector3" and mellstroySilentAimState.IsFiniteNumber(arg.X) and mellstroySilentAimState.IsFiniteNumber(arg.Y) and mellstroySilentAimState.IsFiniteNumber(arg.Z)
	end

	mellstroySilentAimState.IsFiniteCFrame = function(arg)
		return typeof(arg) == "CFrame" and mellstroySilentAimState.IsFiniteVector3(arg.Position) and mellstroySilentAimState.IsFiniteVector3(arg.RightVector) and mellstroySilentAimState.IsFiniteVector3(arg.UpVector) and mellstroySilentAimState.IsFiniteVector3(arg.LookVector)
	end

	mellstroySilentAimState.GetClosestPointOnPart = function(arg, arg2, arg3)
		if not arg or not arg:IsA("BasePart") or not mellstroySilentAimState.IsFiniteVector3(arg2) then
			return nil
		end
		arg.CFrame:PointToObjectSpace(arg2)
		math.max(tonumber(arg3) or 0, 0)
		error("devirt: value LTable#313 in an expression (at 69:102)")
	end

	mellstroySilentAimState.GetClosestCharacterPoint = function(arg, arg2)
		if not arg or not mellstroySilentAimState.IsFiniteVector3(arg2) then
			return nil
		end
		local huge = math.huge
		local v20 = nil
		local v21 = nil

		for _, child in ipairs(arg:GetChildren()) do
			if child:IsA("BasePart") then
				local v22 = mellstroySilentAimState.GetClosestPointOnPart(child, arg2)
				local magnitude = v22 and (v22 - arg2).Magnitude or math.huge

				if mellstroySilentAimState.IsFiniteNumber(magnitude) and magnitude < huge then
					huge = magnitude
					v20 = v22
					v21 = child
				end
			end
		end

		return v20, v21
	end

	mellstroySilentAimState.GetGunShotOrigin = function()
		local character = Players.LocalPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChild("GunRaycastAttachment")
		if not character or not character:IsA("Attachment") then
			return nil
		end
		local worldCFrame = character.WorldCFrame
		return mellstroySilentAimState.IsFiniteCFrame(worldCFrame) and worldCFrame or nil
	end

	mellstroySilentAimState.IsPointVisible = function(arg, arg2, arg3)
		if not arg or not mellstroySilentAimState.IsFiniteVector3(arg2) or not mellstroySilentAimState.IsFiniteVector3(arg3) then
			return false
		end
		local filterDescendantsInstances = { Players.LocalPlayer.Character }

		for _, v20 in ipairs(CollectionService:GetTagged("WeaponPassthrough")) do
			filterDescendantsInstances[#filterDescendantsInstances + 1] = v20
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.IgnoreWater = true
		raycastParams.FilterDescendantsInstances = filterDescendantsInstances

		for i = 1, 12 do
			local n3 = arg3 - arg2
			if n3.Magnitude <= 0.05 then
				return true
			end
			local hit = workspace:Raycast(arg2, n3, raycastParams)
			if not hit then
				return true
			end

			if hit.Instance and hit.Instance:IsDescendantOf(arg) then
				return true
			end

			if not hit.Instance or not hit.Instance:IsA("BasePart") or hit.Instance.Transparency < 1 then
				return false
			end
			filterDescendantsInstances[#filterDescendantsInstances + 1] = hit.Instance
			raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			arg2 = hit.Position + n3.Unit * 0.01
		end

		return false
	end

	mellstroySilentAimState.BuildTeleportSegment = function(arg, arg2, arg3, arg4, arg5)
		if not mellstroySilentAimState.IsFiniteVector3(arg) or not mellstroySilentAimState.IsFiniteVector3(arg2) then
			return nil
		end
		local n3 = arg2 - arg
		local magnitude = n3.Magnitude
		local n4

		if mellstroySilentAimState.IsFiniteNumber(magnitude) and magnitude >= 0.05 then
			n4 = n3 / magnitude
		else
			n4 = nil

			if mellstroySilentAimState.IsFiniteVector3(arg3) then
				local magnitude2 = arg3.Magnitude
				local flag2 = mellstroySilentAimState.IsFiniteNumber(magnitude2) and magnitude2 >= 0.05
				n4 = nil

				if flag2 then
					n4 = arg3 / magnitude2
				end
			end
		end

		if not mellstroySilentAimState.IsFiniteVector3(n4) then
			return nil
		end
		local n5 = arg2 - n4 * (arg4 or 3)
		local n6 = arg2 + n4 * (arg5 or 3)
		if not mellstroySilentAimState.IsFiniteVector3(n5) or not mellstroySilentAimState.IsFiniteVector3(n6) then
			return nil
		end

		if math.abs(n4.Y) > 0.98 then
			error("devirt: storing a non-empty VM table into a register (at 35:140)")
		end

		error("devirt: storing a non-empty VM table into a register (at 35:137)")
	end

	mellstroySilentAimState.BuildRevolverWallbang = function(arg, arg2)
		local cframe = typeof(arg) == "CFrame" and arg or mellstroySilentAimState.IsFiniteVector3(arg) and CFrame.new(arg) or nil
		local position = cframe and cframe.Position
		if not mellstroySilentAimState.IsFiniteCFrame(cframe) or not mellstroySilentAimState.IsFiniteVector3(arg2) then
			return nil
		end
		local magnitude = (arg2 - position).Magnitude
		if not mellstroySilentAimState.IsFiniteNumber(magnitude) or magnitude < 0.05 then
			return nil
		end
		return cframe, CFrame.new(arg2), position, arg2
	end

	mellstroySilentAimState.GetRevolverBlinkOrigin = function(arg, arg2, arg3)
		local position = typeof(arg) == "CFrame" and arg.Position or arg
		if not mellstroySilentAimState.IsFiniteVector3(position) or not mellstroySilentAimState.IsFiniteVector3(arg2) or not arg3 then
			return nil
		end
		local n3 = arg2 - position
		if n3.Magnitude < 0.05 then
			return nil
		end
		local humanoidRootPart = arg3:FindFirstChild("HumanoidRootPart") or arg3.PrimaryPart
		local tbl9 = { n3.Unit }

		if humanoidRootPart then
			tbl9[#tbl9 + 1] = humanoidRootPart.CFrame.LookVector
			tbl9[#tbl9 + 1] = -humanoidRootPart.CFrame.LookVector
			tbl9[#tbl9 + 1] = humanoidRootPart.CFrame.RightVector
			tbl9[#tbl9 + 1] = -humanoidRootPart.CFrame.RightVector
		end

		error("devirt: storing a non-empty VM table into a register (at 35:127)")
	end

	mellstroySilentAimState.QueueRevolverWallbang = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
		if mellstroySilentAimState.WallbangBlinkBusy or typeof(arg) ~= "Instance" or not arg:IsA("RemoteEvent") or not arg2 or not mellstroySilentAimState.IsFiniteVector3(arg3) then
			return false
		end
		local character = Players.LocalPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local gunRaycastAttachment = humanoidRootPart and humanoidRootPart:FindFirstChild("GunRaycastAttachment")
		if not humanoid or humanoid.Health <= 0 or not humanoidRootPart or not gunRaycastAttachment or not gunRaycastAttachment:IsA("Attachment") then
			return false
		end
		local upperTorso = arg4

		if not upperTorso or not upperTorso:IsA("BasePart") or not upperTorso:IsDescendantOf(arg2) then
			upperTorso = arg2:FindFirstChild("UpperTorso") or arg2:FindFirstChild("Torso") or arg2:FindFirstChild("HumanoidRootPart")
		end

		local v20 = nil

		if upperTorso and upperTorso:IsA("BasePart") and mellstroySilentAimState.IsFiniteVector3(arg5) then
			v20 = upperTorso.CFrame:PointToObjectSpace(arg5)
		end

		local function fn18()
			if not upperTorso or not upperTorso.Parent or not upperTorso:IsDescendantOf(arg2) then
				return arg3
			end
			local position = v20 and upperTorso.CFrame:PointToWorldSpace(v20) or upperTorso.Position
			local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart") or arg2.PrimaryPart
			humanoidRootPart2 = humanoidRootPart2 and humanoidRootPart2.AssemblyLinearVelocity

			if not mellstroySilentAimState.IsFiniteVector3(humanoidRootPart2) or humanoidRootPart2.Magnitude > 80 then
				error("devirt: storing a non-empty VM table into a register (at 69:39)")
			end

			local getRevolverPredictionTime = mellstroySilentAimState.GetRevolverPredictionTime
			local finalPredictionTime = arg6

			if type(getRevolverPredictionTime) == "function" then
				local ok
				ok, finalPredictionTime = pcall(getRevolverPredictionTime)
				ok = ok and mellstroySilentAimState.IsFiniteNumber(finalPredictionTime)
				local v21 = arg6

				if not ok then
					finalPredictionTime = v21
				end
			end

			local getRevolverLead = mellstroySilentAimState.GetRevolverLead
			local flag2 = type(getRevolverLead) == "function" and getRevolverLead(humanoidRootPart2, finalPredictionTime, arg2)

			if not flag2 then
				flag2 = humanoidRootPart2 * math.clamp(tonumber(finalPredictionTime) or 0, 0, 0.3)
			end

			if type(arg7) == "table" then
				arg7.FinalPredictionTime = finalPredictionTime
				arg7.FinalPingMs = mellstroySilentAimState.NetworkPingMs
				arg7.FinalPingJitterMs = mellstroySilentAimState.NetworkPingJitterMs
			end

			local n3 = position + flag2
			return mellstroySilentAimState.IsFiniteVector3(n3) and n3 or arg3
		end

		arg3 = fn18()
		local v21 = mellstroySilentAimState.GetRevolverBlinkOrigin(gunRaycastAttachment.WorldCFrame, arg3, arg2)
		if not mellstroySilentAimState.IsFiniteCFrame(v21) then
			return false
		end
		mellstroySilentAimState.WallbangBlinkBusy = true

		task.spawn(function()
			local tbl9 = nil
			local cFrame = v21 * gunRaycastAttachment.CFrame:Inverse()
			local flag2 = true
			local connection = nil
			local tbl10

			local function fn19()
				local v22 = tbl10 or tbl9

				if v22 and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = v22.CFrame
					humanoidRootPart.AssemblyLinearVelocity = v22.LinearVelocity
					humanoidRootPart.AssemblyAngularVelocity = v22.AngularVelocity
					flag2 = true
				end
			end

			local function fn20()
				if not humanoidRootPart.Parent or not gunRaycastAttachment.Parent then
					return
				end

				if flag2 then
					tbl10 = {
						CFrame = humanoidRootPart.CFrame,
						LinearVelocity = humanoidRootPart.AssemblyLinearVelocity,
						AngularVelocity = humanoidRootPart.AssemblyAngularVelocity,
					}
				end

				humanoidRootPart.CFrame = cFrame
				error("devirt: storing a non-empty VM table into a register (at 35:17)")
			end

			local function fn21()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				fn19()
				pcall(RunService.UnbindFromRenderStep, RunService, "MellstroyhookWallbangRenderRestore")
				tbl3:SetSuppressed("WallbangBlink", false)
				mellstroySilentAimState.WallbangBlinkBusy = false
			end

			local ok, result = pcall(function()
				tbl3:SetSuppressed("WallbangBlink", true)

				tbl9 = {
					CFrame = humanoidRootPart.CFrame,
					LinearVelocity = humanoidRootPart.AssemblyLinearVelocity,
					AngularVelocity = humanoidRootPart.AssemblyAngularVelocity,
				}

				tbl10 = tbl9
				pcall(RunService.UnbindFromRenderStep, RunService, "MellstroyhookWallbangRenderRestore")
				RunService:BindToRenderStep("MellstroyhookWallbangRenderRestore", Enum.RenderPriority.Camera.Value - 1, fn19)
				connection = RunService.Heartbeat:Connect(fn20)
				fn20()

				for i = 1, 2 do
					RunService.Heartbeat:Wait()
				end

				if (gunRaycastAttachment.WorldPosition - v21.Position).Magnitude > 0.1 then
					fn20()
				end

				local worldCFrame = gunRaycastAttachment.WorldCFrame
				local v22 = fn18()
				arg:FireServer(worldCFrame, CFrame.new(v22))

				mellstroySilentAimState.LastWallbangBlink = {
					Time = os.clock(),
					OriginPosition = worldCFrame.Position,
					TargetPosition = v22,
					QueuedTargetPosition = arg3,
					RefreshDistance = (v22 - arg3).Magnitude,
					Target = arg2.Name,
				}

				if type(arg7) == "table" then
					arg7.ActualFireTime = os.clock()
					arg7.FinalOriginPosition = worldCFrame.Position
					arg7.FinalAimPosition = v22
					arg7.RefreshDistance = (v22 - arg3).Magnitude
				end

				task.delay(0.5, function()
					if type(arg7) ~= "table" then
						return
					end
					local humanoid2 = arg2 and arg2:FindFirstChildOfClass("Humanoid")
					arg7.HealthAfter = humanoid2 and humanoid2.Health or 0
					arg7.TargetPartAfter = upperTorso and upperTorso.Parent and upperTorso.Position or nil
				end)

				RunService.Heartbeat:Wait()
			end)

			fn21()

			if not ok then
				mellstroySilentAimState.LastWallbangError = tostring(result)
			end
		end)

		return true
	end

	local function fn18(arg)
		if not arg then
			return nil
		end
		return arg:FindFirstChild("HumanoidRootPart") or arg.PrimaryPart
	end

	mellstroySilentAimState.GetHitboxExpansionPadding = function(arg, arg2)
		if not arg or not arg:IsA("BasePart") then
			return 0
		end
		return math.max(tonumber(arg2) or 0, 0)
	end

	mellstroySilentAimState.RestoreExpandedHitbox = function(arg)
		local expandedHitboxes = mellstroySilentAimState.ExpandedHitboxes
		local v20 = expandedHitboxes and expandedHitboxes[arg]
		if not v20 then
			return
		end
		expandedHitboxes[arg] = nil

		if arg.Parent then
			pcall(function()
				arg.Size = v20.Size
				arg.CanCollide = v20.CanCollide
				arg.CanTouch = v20.CanTouch
				arg.CanQuery = v20.CanQuery
				arg.Massless = v20.Massless
			end)
		end
	end

	mellstroySilentAimState.RestoreAllExpandedHitboxes = function()
		local expandedHitboxes = mellstroySilentAimState.ExpandedHitboxes
		if type(expandedHitboxes) ~= "table" then
			return
		end
		local tbl9 = {}

		for k in pairs(expandedHitboxes) do
			tbl9[#tbl9 + 1] = k
		end

		for _, v20 in ipairs(tbl9) do
			mellstroySilentAimState.RestoreExpandedHitbox(v20)
		end
	end

	if mellstroySilentAimState.HitboxExpansionConnection then
		mellstroySilentAimState.HitboxExpansionConnection:Disconnect()
		mellstroySilentAimState.HitboxExpansionConnection = nil
	end

	if type(mellstroySilentAimState.ExpandedHitboxes) == "table" then
		for k, expandedHitboxe in pairs(mellstroySilentAimState.ExpandedHitboxes) do
			if typeof(k) == "Instance" and k.Parent and type(expandedHitboxe) == "table" then
				pcall(function()
					k.Size = expandedHitboxe.Size
					k.CanCollide = expandedHitboxe.CanCollide
					k.CanTouch = expandedHitboxe.CanTouch
					k.CanQuery = expandedHitboxe.CanQuery
					k.Massless = expandedHitboxe.Massless
				end)
			end
		end
	end

	mellstroySilentAimState.ExpandedHitboxes = {}

	mellstroySilentAimState.UpdateExpandedHitboxes = function()
	end

	v.CleanupCallbacks[#v.CleanupCallbacks + 1] = function()
		mellstroySilentAimState.RestoreAllExpandedHitboxes()
	end

	local function fn19(arg, arg2)
		if not mellstroySilentAimState.IsFiniteVector3(arg) then
			error("devirt: storing a non-empty VM table into a register (at 37:25)")
		end

		local magnitude = arg.Magnitude
		if magnitude > arg2 and magnitude > 0 then
			return arg.Unit * arg2
		end
		return arg
	end

	local function fn20(arg)
		if not mellstroySilentAimState.IsFiniteVector3(arg) then
			return false
		end
		local currentCamera = workspace.CurrentCamera
		if currentCamera and mellstroySilentAimState.IsFiniteCFrame(currentCamera.CFrame) then
			return (arg - currentCamera.CFrame.Position).Magnitude <= 100000
		end
		return arg.Magnitude <= 100000
	end

	local function fn21(arg, arg2)
		arg = arg and mellstroySilentAimState.TargetSamples[arg]
		if arg and mellstroySilentAimState.IsFiniteVector3(arg.StablePosition) then
			return arg.StablePosition
		end
		arg2 = arg2 and arg2.Position
		return fn20(arg2) and arg2 or nil
	end

	local function fn22()
		local now = os.clock()
		local tbl9 = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				local v20 = fn18(player.Character)
				local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

				if v20 and humanoid and humanoid.Health > 0 then
					tbl9[player] = true
					local position = v20.Position
					local v21 = fn20(position)
					local v22 = mellstroySilentAimState.TargetSamples[player]

					if not v22 then
						local tbl10 = { Position = v21 and position or nil }
						position = v21 and position or nil
						tbl10.StablePosition = position
						tbl10.Time = now
						v21 = v21 and fn19(v20.AssemblyLinearVelocity, 256)

						if v21 then
							tbl10.Velocity = v21
							error("devirt: storing a non-empty VM table into a register (at 69:134)")
						end

						error("devirt: storing a non-empty VM table into a register (at 69:127)")
					end

					if v21 then
						local n3 = math.max(now - v22.Time, 0.0041666666666666666)
						local n4 = position - (v22.Position or position)
						local n5 = n4 / n3
						local assemblyLinearVelocity = v20.AssemblyLinearVelocity

						if assemblyLinearVelocity.Magnitude < 0.05 and n4.Magnitude <= 32 then
							assemblyLinearVelocity = n5
						end

						if not (assemblyLinearVelocity.Magnitude > 256) then
							local velocity = v22.Velocity
							local n6 = 1 - math.exp(-16 * n3)
							local v23 = velocity:Lerp(assemblyLinearVelocity, n6)
							v22.Acceleration = v22.Acceleration:Lerp(fn19((v23 - velocity) / n3, 80), n6)
							v22.Velocity = v23
							v22.Position = position
							v22.StablePosition = position
							v22.Time = now
							v22.RejectedPosition = nil
							continue
						end

						error("devirt: storing a non-empty VM table into a register (at 69:169)")
					end

					error("devirt: storing a non-empty VM table into a register (at 69:155)")
				end
			end
		end

		for k in pairs(mellstroySilentAimState.TargetSamples) do
			if not tbl9[k] then
				mellstroySilentAimState.TargetSamples[k] = nil
			end
		end
	end

	if mellstroySilentAimState.TrackingConnection then
		mellstroySilentAimState.TrackingConnection:Disconnect()
	end

	mellstroySilentAimState.TrackingConnection = tbl:CreateConnection(RunService.Heartbeat, fn22)
	fn22()

	local function fn23()
		local ok, result = pcall(function()
			return Players.LocalPlayer:GetNetworkPing()
		end)

		if ok and type(result) == "number" and result == result then
			return math.clamp(result, 0, 0.5)
		end
		return 0.075
	end

	local function getRevolverPredictionTime()
		local now = os.clock()
		local v20 = fn23()
		local n3 = math.clamp(now - (mellstroySilentAimState.LastPingSampleTime or now), 0.0041666666666666666, 0.5)
		local smoothedNetworkPing = mellstroySilentAimState.SmoothedNetworkPing
		local networkPingJitter = mellstroySilentAimState.NetworkPingJitter or 0
		local smoothedNetworkPing2

		if not mellstroySilentAimState.IsFiniteNumber(smoothedNetworkPing) then
			smoothedNetworkPing2 = v20
		else
			local n4 = 1 - math.exp(-6 * n3)
			local n5

			if not (smoothedNetworkPing < v20) then
				n5 = n4
			else
				n5 = math.max(n4, 0.35)
			end

			smoothedNetworkPing2 = smoothedNetworkPing + (v20 - smoothedNetworkPing) * n5
			networkPingJitter += (math.abs(v20 - smoothedNetworkPing) - networkPingJitter) * (1 - math.exp(-4 * n3))
		end

		mellstroySilentAimState.LastPingSampleTime = now
		mellstroySilentAimState.RawNetworkPing = v20
		mellstroySilentAimState.SmoothedNetworkPing = smoothedNetworkPing2
		mellstroySilentAimState.NetworkPingJitter = networkPingJitter
		mellstroySilentAimState.NetworkPingMs = smoothedNetworkPing2 * 1000
		mellstroySilentAimState.NetworkPingJitterMs = networkPingJitter * 1000
		local revolverPredictionTime = math.clamp(smoothedNetworkPing2 * 0.5 + math.min(networkPingJitter * 0.35, 0.025) + 0.016666666666666666, 0.025, 0.3)
		mellstroySilentAimState.RevolverPingFactor = 0.5
		mellstroySilentAimState.RevolverPredictionTime = revolverPredictionTime
		return revolverPredictionTime
	end

	local function getRevolverLead(arg, arg2, arg3)
		if not mellstroySilentAimState.IsFiniteVector3(arg) then
			error("devirt: storing a non-empty VM table into a register (at 37:78)")
		end

		local n3 = math.clamp(tonumber(arg2) or 0, 0, 0.3)
		local n4 = arg * n3
		arg3 = arg3 and arg3:FindFirstChildOfClass("Humanoid")

		if arg3 and arg3.FloorMaterial == Enum.Material.Air then
			n4 += Vector3.new(0, -0.5 * workspace.Gravity * n3 * n3, 0)
		end

		local n5 = math.clamp(4 + n3 * 48, 4, 18)

		if n5 < n4.Magnitude then
			n4 = n4.Unit * n5
		end

		n4 = mellstroySilentAimState.IsFiniteVector3(n4) and n4
		if n4 then
			return n4
		end
		error("devirt: storing a non-empty VM table into a register (at 37:25)")
	end

	mellstroySilentAimState.GetRevolverPredictionTime = getRevolverPredictionTime
	mellstroySilentAimState.GetRevolverLead = getRevolverLead

	local function fn24(arg)
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return nil
		end
		local mouseLocation = UserInputService2:GetMouseLocation()
		local huge = mellstroySilentAimState.RagebotFOV == math.huge and math.huge

		if not huge then
			huge = math.max(tonumber(mellstroySilentAimState.RagebotFOV) or 0, 0)
		end

		local v20 = nil
		local v21 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if not (player == Players.LocalPlayer or fn12(player).Whitelist or not fn16(player, arg)) then
				local character = player.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local v22 = fn18(character)

				if not (not humanoid or humanoid.Health <= 0 or not v22) then
					local v23 = fn21(player, v22)

					if v23 then
						local v24, v25 = currentCamera:WorldToScreenPoint(v23)

						if v25 and v24.Z > 0 then
							local magnitude = (Vector2.new(v24.X, v24.Y) - mouseLocation).Magnitude
							local n3 = math.max(tonumber(mellstroySilentAimState.HitboxExpansion[arg]) or 0, 0)
							local n4 = math.max(v22.Size.X, v22.Size.Y, v22.Size.Z) * 0.5 + n3

							if n4 > 0 then
								local v26 = currentCamera:WorldToScreenPoint(v23 + currentCamera.CFrame.RightVector * n4)

								if v26.Z > 0 then
									magnitude = math.max(0, magnitude - (Vector2.new(v26.X, v26.Y) - Vector2.new(v24.X, v24.Y)).Magnitude)
								end
							end

							if magnitude < huge then
								huge = magnitude
								v20 = player
								v21 = v23
							end
						end
					end
				end
			end
		end

		return v20, v21
	end

	local function fn25(arg)
		local v20 = arg and fn18(arg.Character)
		if not v20 then
			return nil
		end
		local acceleration = mellstroySilentAimState.TargetSamples[arg]
		local v21 = fn21(arg, v20)
		local assemblyLinearVelocity = v20.AssemblyLinearVelocity
		assemblyLinearVelocity = mellstroySilentAimState.IsFiniteVector3(assemblyLinearVelocity) and assemblyLinearVelocity

		if assemblyLinearVelocity then
			if not (assemblyLinearVelocity.Magnitude > 80) then
				acceleration = acceleration and acceleration.Acceleration
				if acceleration then
					return v20, assemblyLinearVelocity, acceleration, v21
				end
				error("devirt: storing a non-empty VM table into a register (at 37:48)")
			end

			error("devirt: storing a non-empty VM table into a register (at 35:42)")
		end

		error("devirt: storing a non-empty VM table into a register (at 69:38)")
	end

	local function fn26(arg)
		local v20, v21, v22, v23 = fn25(arg)
		if not v20 or not v23 then
			return nil
		end
		local character = arg.Character
		local upperTorso = character and (character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart"))
		if not upperTorso or not upperTorso:IsA("BasePart") then
			return nil
		end
		local n3 = v23 + upperTorso.Position - v20.Position
		local v24 = getRevolverPredictionTime()
		local n4 = n3 + getRevolverLead(v21, v24, character)
		if not mellstroySilentAimState.IsFiniteVector3(n4) then
			return nil
		end
		return n4, v24, v21, upperTorso, n3
	end

	local function fn27(arg, arg2)
		if typeof(arg) ~= "Instance" then
			return false
		end
		local parent

		if arg2 == "Knife" then
			parent = arg.Parent and arg.Parent.Parent
		else
			parent = arg.Parent
		end

		if not parent or parent.Name ~= arg2 then
			return false
		end
		local localPlayer = Players.LocalPlayer
		local backpack = localPlayer and localPlayer:FindFirstChildOfClass("Backpack")
		return parent.Parent == localPlayer.Character or parent.Parent == backpack
	end

	local function fn28(arg)
		if arg.Name == "KnifeThrown" and fn27(arg, "Knife") then
			return "Knife"
		end

		if arg.Name == "Shoot" and fn27(arg, "Gun") then
			return "Revolver"
		end
		return nil
	end

	mellstroySilentAimState.Rewrite = function(arg, arg2)
		local v20 = fn28(arg)
		if not v20 then
			return false
		end

		if not (mellstroySilentAimState.Enabled and mellstroySilentAimState.WeaponSettings[v20]) then
			if v20 ~= "Revolver" or not mellstroySilentAimState.ForceNoSpread or arg2.n ~= 2 or not mellstroySilentAimState.IsFiniteCFrame(arg2[1]) then
				return false
			end
			local mouse = Players.LocalPlayer:GetMouse()
			mouse = mouse and mouse.Hit
			if not mellstroySilentAimState.IsFiniteCFrame(mouse) then
				return false
			end
			arg2[2] = CFrame.new(mouse.Position)
			return true, false
		end

		local flag2 = v20 == "Knife"
		mellstroySilentAimState.EquippedWeapon = v20
		local v21, position = fn24(v20)
		if not v21 then
			return false
		end
		local v22 = arg2[1]
		if arg2.n ~= 2 or not mellstroySilentAimState.IsFiniteCFrame(v22) or not mellstroySilentAimState.IsFiniteCFrame(arg2[2]) then
			return false
		end
		local v23 = nil
		local position2 = v22.Position
		local cframe, flag3, flag4, n3, v24, v25, flag5, v26, v27

		if flag2 then
			if mellstroySilentAimState.MagicKnife then
				local v28
				v28, v23 = mellstroySilentAimState.GetClosestCharacterPoint(v21.Character, v22.Position)
				if not v28 or not v23 then
					return false
				end
				position = v23.Position
				local parent = arg.Parent
				local knifeStabbed = parent and parent:FindFirstChild("KnifeStabbed")
				local handleTouched = parent and parent:FindFirstChild("HandleTouched")
				if not knifeStabbed or not knifeStabbed:IsA("RemoteEvent") or not handleTouched or not handleTouched:IsA("RemoteEvent") then
					return false
				end
				cframe = CFrame.new(position)
				knifeStabbed:FireServer()

				task.delay(0.03, function()
					if v23.Parent and handleTouched.Parent then
						handleTouched:FireServer(v23)
					end
				end)

				flag3 = true
				flag4 = true
				n3 = 0
				v24 = position
			else
				if not mellstroySilentAimState.IsFiniteVector3(position) then
					return false
				end
				n3 = math.clamp((position - v22.Position).Magnitude / n2, 0, 2.5)
				flag3 = false
				flag4 = false
				cframe = nil
				v24 = nil
			end

			v25 = nil
			flag5 = false
			v26 = nil
			v27 = v22
		else
			position, n3, v25, v23, v26 = fn26(v21)
			local wallbang = position and mellstroySilentAimState.Wallbang

			if wallbang then
				wallbang = not mellstroySilentAimState.IsPointVisible(v21.Character, v22.Position, v26 or position)
			end

			flag5 = false
			flag3 = false
			flag4 = false
			cframe = nil
			v24 = nil

			if wallbang then
				v27, cframe, position2, v24 = mellstroySilentAimState.BuildRevolverWallbang(v22, position)
				if not v27 or not cframe then
					return false
				end
				flag5 = true
				flag3 = true
			else
				v27 = v22
			end
		end

		if not mellstroySilentAimState.IsFiniteVector3(position) then
			return false
		end
		cframe = cframe or CFrame.new(position)
		v24 = v24 or position
		arg2[1] = v27
		arg2[2] = cframe
		local humanoid = v21.Character and v21.Character:FindFirstChildOfClass("Humanoid")

		mellstroySilentAimState.LastRewrite = {
			Time = os.clock(),
			Weapon = v20,
			Target = v21.Name,
			OriginPosition = v22.Position,
			RemoteOriginPosition = position2,
			AimPosition = position,
			BaseAimPosition = v26,
			RemoteEndpointPosition = v24,
			Hitbox = v23 and v23.Name or nil,
			TargetHealth = humanoid and humanoid.Health or nil,
			FlightTime = n3,
			TargetVelocity = v25,
			ThroughWall = flag3,
		}

		mellstroySilentAimState.LastRewrite.Kind = "manual"
		mellstroySilentAimState.RecordShot(mellstroySilentAimState.LastRewrite)
		if flag5 then
			mellstroySilentAimState.QueueRevolverWallbang(arg, v21.Character, position, v23, v26, n3, mellstroySilentAimState.LastRewrite)
			return true, true
		end
		return true, flag4
	end

	mellstroySilentAimState.TagFeedbackCall = function(arg, arg2)
		local mellstroyFeedback = getgenv().__MellstroyFeedback
		if not mellstroyFeedback or type(mellstroyFeedback.Tag) ~= "function" then
			return
		end

		if typeof(arg) == "Instance" and arg.Name == "HandleTouched" and fn27(arg, "Knife") then
			arg2 = arg2 and arg2[1]
			local model = typeof(arg2) == "Instance" and arg2:FindFirstAncestorOfClass("Model")
			local playerFromCharacter = model and Players:GetPlayerFromCharacter(model)

			if playerFromCharacter then
				mellstroyFeedback:Tag(playerFromCharacter, "Knife")
			end

			return
		end

		local v20 = fn28(arg)
		arg2 = arg2 and arg2[2]
		if not v20 or not mellstroySilentAimState.IsFiniteCFrame(arg2) then
			return
		end
		local position = arg2.Position
		local n3 = 10
		local v21 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				local character = player.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoid.Health > 0 then
					local magnitude = mellstroySilentAimState.GetClosestCharacterPoint(character, position)
					magnitude = magnitude and (magnitude - position).Magnitude

					if magnitude and magnitude < n3 then
						n3 = magnitude
						v21 = player
					end
				end
			end
		end

		if v21 then
			mellstroyFeedback:Tag(v21, v20)
		end
	end

	if not mellstroySilentAimState.HookInstalled then
		local v20 = nil

		local function fn29(arg, ...)
			local v21 = table.pack(...)
			local v22 = getnamecallmethod()
			local flag2 = type(checkcaller) == "function" and checkcaller()
			local flag3 = (mellstroySilentAimState.Enabled or mellstroySilentAimState.ForceNoSpread) and not flag2 and v22 == "FireServer"
			local flag4 = false

			if flag3 then
				local rewrite = mellstroySilentAimState.Rewrite

				if type(rewrite) == "function" then
					local ok, result, result2 = pcall(rewrite, arg, v21)
					flag4 = ok and result2 == true
				end
			end

			if v22 == "FireServer" then
				local tagFeedbackCall = mellstroySilentAimState.TagFeedbackCall

				if type(tagFeedbackCall) == "function" then
					pcall(tagFeedbackCall, arg, v21)
				end
			end

			if flag4 then
				return nil
			end

			if type(setnamecallmethod) == "function" then
				setnamecallmethod(v22)
			end

			return v20(arg, table.unpack(v21, 1, v21.n))
		end

		v20 = hookmetamethod
		v20 = v20(game, "__namecall", newcclosure(fn29))
		mellstroySilentAimState.OldNamecall = v20
		mellstroySilentAimState.HookInstalled = true
	end

	local tbl9 = { Revolver = "rbxassetid://197518111", Knife = "rbxassetid://584555920" }

	local function fn29(arg, arg2, arg3)
		local tbl10 = { State = 1, Open = false, Options = arg2 }
		local tbl11 = {}
		arg.Holder.ScrollingEnabled = false
		arg.Holder.ScrollBarThickness = 0
		arg.Holder.CanvasPosition = Vector2.zero
		local v20 = nil
		local n3 = 0
		local n4 = 0

		local function fn30(arg4, arg5)
			local now = os.clock()
			if v20 == arg4 and now - n3 < 0.75 then
				return
			end
			v20 = arg4
			n3 = now
			arg5()
		end

		local function fn31(arg4, arg5)
			n4 = os.clock()
			fn30(arg4, arg5)
		end

		local Frame = tbl:RenderObject("Frame", {
			Name = "SilentAimWeaponSelector",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = arg.Holder,
			Size = UDim2.new(1, 0, 0, 44),
			ZIndex = 7,
		})

		local Frame2 = tbl:RenderObject("Frame", {
			Name = "MainOutline",
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame,
			Position = UDim2.new(0, 1, 0, 0),
			Size = UDim2.new(1, -2, 0, 44),
			ZIndex = 8,
		})

		local Frame3 = tbl:RenderObject("Frame", {
			Name = "MainFrame",
			BackgroundColor3 = Color3.fromRGB(35, 35, 35),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame2,
			Position = UDim2.new(0, 1, 0, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 9,
		})

		tbl:RenderObject("Frame", {
			Name = "Selection",
			BackgroundColor3 = arg.Window.Accent,
			BorderSizePixel = 0,
			Parent = tbl:RenderObject("Frame", {
				Name = "SelectionOutline",
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BorderSizePixel = 0,
				Parent = Frame3,
				Position = UDim2.new(0, 29, 0.5, -4),
				Size = UDim2.fromOffset(8, 8),
				ZIndex = 10,
			}),
			Position = UDim2.fromOffset(1, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 11,
		})

		local TextLabel = tbl:RenderObject("TextLabel", {
			Name = "WeaponName",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(0, 50, 0, 0),
			Size = UDim2.new(1, -145, 1, 0),
			ZIndex = 10,
			Font = "Code",
			Text = "",
			TextColor3 = Color3.fromRGB(205, 205, 205),
			TextSize = 10,
			TextXAlignment = "Left",
		})

		local ImageLabel = tbl:RenderObject("ImageLabel", {
			Name = "WeaponIcon",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(1, -76, 0, 4),
			Size = UDim2.fromOffset(56, 34),
			ZIndex = 10,
			Image = "",
			ImageColor3 = Color3.fromRGB(155, 155, 155),
			ScaleType = Enum.ScaleType.Fit,
		})

		local ImageLabel2 = tbl:RenderObject("ImageLabel", {
			Name = "Arrow",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame3,
			Position = UDim2.new(1, -13, 0.5, -3),
			Size = UDim2.fromOffset(7, 6),
			ZIndex = 10,
			Image = "rbxassetid://8532000591",
			ImageColor3 = Color3.fromRGB(205, 205, 205),
		})

		local TextButton = tbl:RenderObject("TextButton", {
			Name = "SilentAimWeaponSelectorButton",
			Active = true,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Interactable = true,
			Parent = Frame3,
			Size = UDim2.fromScale(1, 1),
			Text = "",
			ZIndex = 12,
		})

		local Frame4 = tbl:RenderObject("Frame", {
			Name = "SilentAimWeaponPopup",
			BackgroundColor3 = Color3.fromRGB(12, 12, 12),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = arg.Extra,
			Position = UDim2.new(0, 0, 0, 61),
			Size = UDim2.new(1, 0, 0, #arg2 * 34 + 2),
			Visible = false,
			ZIndex = 15,
		})

		local Frame5 = tbl:RenderObject("Frame", {
			Name = "Rows",
			BackgroundColor3 = Color3.fromRGB(28, 28, 28),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = Frame4,
			Position = UDim2.fromOffset(1, 1),
			Size = UDim2.new(1, -2, 1, -2),
			ZIndex = 16,
		})

		local function fn32()
			for _, child in ipairs(arg.Extra:GetChildren()) do
				if child ~= Frame4 and child:IsA("GuiObject") then
					child.Visible = false
				end
			end
		end

		fn32()
		tbl:CreateConnection(arg.Holder:GetPropertyChangedSignal("AbsoluteCanvasSize"), fn32)
		tbl:CreateConnection(arg.Holder:GetPropertyChangedSignal("CanvasPosition"), fn32)

		for i, v21 in ipairs(arg2) do
			local Frame6 = tbl:RenderObject("Frame", {
				Name = v21,
				BackgroundColor3 = Color3.fromRGB(35, 35, 35),
				BorderSizePixel = 0,
				Parent = Frame5,
				Position = UDim2.new(0, 0, 0, (i - 1) * 34),
				Size = UDim2.new(1, 0, 0, 34),
				ZIndex = 16,
			})

			local Frame7 = tbl:RenderObject("Frame", {
				Name = "SelectionOutline",
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BorderSizePixel = 0,
				Parent = Frame6,
				Position = UDim2.new(0, 29, 0.5, -4),
				Size = UDim2.fromOffset(8, 8),
				ZIndex = 17,
			})

			local Frame8 = tbl:RenderObject("Frame", {
				Name = "Selection",
				BackgroundColor3 = Color3.fromRGB(65, 65, 65),
				BorderSizePixel = 0,
				Parent = Frame7,
				Position = UDim2.fromOffset(1, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 18,
			})

			tbl:RenderObject("TextLabel", {
				Name = "WeaponName",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = Frame6,
				Position = UDim2.new(0, 50, 0, 0),
				Size = UDim2.new(1, -125, 1, 0),
				ZIndex = 17,
				Font = "Code",
				Text = v21,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextSize = 10,
				TextXAlignment = "Left",
			})

			tbl:RenderObject("ImageLabel", {
				Name = "WeaponIcon",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = Frame6,
				Position = UDim2.new(1, -68, 0, 3),
				Size = UDim2.fromOffset(56, 28),
				ZIndex = 17,
				Image = tbl9[v21],
				ImageColor3 = Color3.fromRGB(135, 135, 135),
				ScaleType = Enum.ScaleType.Fit,
			})

			local TextButton2 = tbl:RenderObject("TextButton", {
				Name = "SilentAimWeaponOption" .. v21,
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Interactable = true,
				Parent = Frame6,
				Size = UDim2.fromScale(1, 1),
				Text = "",
				ZIndex = 19,
			})

			tbl11[i] = { Frame = Frame6, Square = Frame8, Button = TextButton2 }

			tbl:CreateConnection(TextButton2.MouseEnter, function()
				Frame6.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			end)

			tbl:CreateConnection(TextButton2.MouseLeave, function()
				Frame6.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			end)

			tbl:CreateConnection(TextButton2.Activated, function()
				fn31("Option" .. i, function()
					tbl10:Set(i)
					tbl10:SetOpen(false)
				end)
			end)
		end

		tbl10.Set = function(arg4, state)
			if not arg2[state] then
				return
			end
			tbl10.State = state
			local v21 = arg2[state]
			TextLabel.Text = v21
			ImageLabel.Image = tbl9[v21]

			for i, v22 in ipairs(tbl11) do
				v22.Square.BackgroundColor3 = i == state and arg.Window.Accent or Color3.fromRGB(65, 65, 65)
			end

			arg3(state)
		end

		tbl10.Get = function()
			return tbl10.State
		end

		tbl10.SetOpen = function(arg4, open)
			tbl10.Open = open
			Frame4.Visible = open
			ImageLabel2.Rotation = open and 180 or 0
			Frame3.BackgroundColor3 = open and Color3.fromRGB(42, 42, 42) or Color3.fromRGB(35, 35, 35)
		end

		tbl10.Close = function()
			tbl10:SetOpen(false)
		end

		local function fn33(arg4, arg5)
			local absolutePosition = arg4.AbsolutePosition
			local absoluteSize = arg4.AbsoluteSize
			return arg5.X >= absolutePosition.X and arg5.Y >= absolutePosition.Y and arg5.X <= absolutePosition.X + absoluteSize.X and arg5.Y <= absolutePosition.Y + absoluteSize.Y
		end

		tbl:CreateConnection(TextButton.MouseEnter, function()
			Frame3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
		end)

		tbl:CreateConnection(TextButton.MouseLeave, function()
			if not tbl10.Open then
				Frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			end
		end)

		tbl:CreateConnection(TextButton.Activated, function()
			fn31("Main", function()
				tbl10:SetOpen(not tbl10.Open)
			end)
		end)

		tbl:CreateConnection(UserInputService2.InputBegan, function(arg4)
			if arg4.UserInputType ~= Enum.UserInputType.MouseButton1 and arg4.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			local now = os.clock()
			local v21 = tbl:MouseLocation(arg4)

			task.defer(function()
				if now - 0.1 <= n4 then
					return
				end

				if fn33(TextButton, v21) then
					fn30("Main", function()
						tbl10:SetOpen(not tbl10.Open)
					end)

					return
				end

				if not tbl10.Open then
					return
				end

				for i, v22 in ipairs(tbl11) do
					if fn33(v22.Button, v21) then
						fn30("Option" .. i, function()
							tbl10:Set(i)
							tbl10:SetOpen(false)
						end)

						return
					end
				end

				tbl10:SetOpen(false)
			end)
		end)

		tbl10:Set(1)
		return tbl10
	end

	local v20 = nil
	local v21 = nil
	local flag2 = false
	local flag3 = false

	local function fn30()
		mellstroySilentAimState.Enabled = mellstroySilentAimState.WeaponSettings.Revolver or mellstroySilentAimState.WeaponSettings.Knife
	end

	local v22 = fn29(v10, tbl8, function(arg)
		local v22 = tbl8[arg]
		mellstroySilentAimState.SelectedWeapon = v22
		mellstroySilentAimState.Weapon = v22

		if v20 then
			flag2 = true
			v20:Set(mellstroySilentAimState.WeaponSettings[v22])
			flag2 = false
		end

		if v21 then
			flag3 = true
			v21:Set(mellstroySilentAimState.HitboxExpansion[v22] or 0)
			flag3 = false
		end
	end)

	v20 = v11:CreateToggle({
		Name = "Enable",
		State = false,
		Configurable = false,
		Callback = function(arg)
			if not flag2 then
				mellstroySilentAimState.WeaponSettings[mellstroySilentAimState.SelectedWeapon] = arg
			end

			fn30()
		end,
	})

	v:RegisterConfigControl({
		Name = "Weapon profiles",
		Page = v2,
		Section = v10,
		Get = function()
			return {
				Selected = mellstroySilentAimState.SelectedWeapon,
				Revolver = mellstroySilentAimState.WeaponSettings.Revolver,
				Knife = mellstroySilentAimState.WeaponSettings.Knife,
				RevolverHitbox = mellstroySilentAimState.HitboxExpansion.Revolver,
				KnifeHitbox = mellstroySilentAimState.HitboxExpansion.Knife,
			}
		end,
		Set = function(arg, arg2)
			if type(arg2) ~= "table" then
				return
			end
			mellstroySilentAimState.WeaponSettings.Revolver = arg2.Revolver == true
			mellstroySilentAimState.WeaponSettings.Knife = arg2.Knife == true
			mellstroySilentAimState.HitboxExpansion.Revolver = math.clamp(tonumber(arg2.RevolverHitbox) or 0, 0, 25)
			mellstroySilentAimState.HitboxExpansion.Knife = math.clamp(tonumber(arg2.KnifeHitbox) or 0, 0, 25)
			v22:Set((arg2.Selected == "Knife" and "Knife" or "Revolver") == "Knife" and 2 or 1)
			fn30()
		end,
	}, { ConfigId = "rage|weapon_profiles" }, "Profile")

	v11:CreateToggle({
		Name = "Ragebot",
		State = false,
		Callback = function(ragebot)
			mellstroySilentAimState.Ragebot = ragebot
		end,
	})

	v11:CreateSlider({
		Name = "FOV",
		State = 250,
		Min = 25,
		Max = 800,
		Decimals = 1,
		Suffix = "px",
		MaxText = "∞",
		Callback = function(arg)
			mellstroySilentAimState.RagebotFOV = arg >= 800 and math.huge or arg
		end,
	})

	local tbl10 = { "Head", "Torso", "Arms", "Legs" }

	v11:CreateMultibox({
		Name = "Hitboxes",
		State = { 1, 2, 3, 4 },
		Options = tbl10,
		Minimum = 1,
		Maximum = #tbl10,
		Callback = function(arg)
			for _, v23 in ipairs(tbl10) do
				mellstroySilentAimState.RagebotHitboxes[v23] = false
			end

			for _, v23 in ipairs(arg) do
				local v24 = tbl10[v23]

				if v24 then
					mellstroySilentAimState.RagebotHitboxes[v24] = true
				end
			end
		end,
	})

	v12:CreateToggle({
		Name = "Magic Knife",
		State = false,
		Callback = function(magicKnife)
			mellstroySilentAimState.MagicKnife = magicKnife
		end,
	})

	v21 = v11:CreateSlider({
		Name = "Hitbox expander",
		State = 0,
		Min = 0,
		Max = 25,
		Decimals = 1,
		Suffix = "st",
		Configurable = false,
		Callback = function(arg)
			if not flag3 then
				mellstroySilentAimState.HitboxExpansion[mellstroySilentAimState.SelectedWeapon] = arg
			end
		end,
	})

	v12:CreateToggle({
		Name = "Wallbang",
		State = false,
		Callback = function(wallbang)
			mellstroySilentAimState.Wallbang = wallbang
		end,
	})

	v12:CreateToggle({
		Name = "Force no spread",
		State = false,
		Callback = function(arg)
			mellstroySilentAimState.ForceNoSpread = arg == true
		end,
	})

	v12:CreateToggle({
		Name = "Visible check",
		State = true,
		Callback = function(ragebotVisibleCheck)
			mellstroySilentAimState.RagebotVisibleCheck = ragebotVisibleCheck
		end,
	})

	v12:CreateToggle({
		Name = "Knife aura",
		State = false,
		Callback = function(knifeAura)
			mellstroySilentAimState.KnifeAura = knifeAura
		end,
	})

	v12:CreateSlider({
		Name = "Knife range",
		State = 100,
		Min = 7,
		Max = 1000,
		Decimals = 1,
		Suffix = "st",
		MaxText = "∞",
		Callback = function(arg)
			mellstroySilentAimState.KnifeAuraRange = arg >= 1000 and math.huge or arg
		end,
	})

	local tbl11 = {
		Head = { "Head" },
		Torso = { "UpperTorso", "LowerTorso", "Torso", "HumanoidRootPart" },
		Arms = {
			"LeftUpperArm",
			"LeftLowerArm",
			"LeftHand",
			"RightUpperArm",
			"RightLowerArm",
			"RightHand",
			"Left Arm",
			"Right Arm",
		},
		Legs = {
			"LeftUpperLeg",
			"LeftLowerLeg",
			"LeftFoot",
			"RightUpperLeg",
			"RightLowerLeg",
			"RightFoot",
			"Left Leg",
			"Right Leg",
		},
	}

	local tbl12 = { Torso = 0, Head = 1, Arms = 2, Legs = 3 }

	local function fn31(arg)
		return fn14(fn8(arg)) or fn15(arg)
	end

	local function fn32()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return nil
		end
		local mouseLocation = UserInputService2:GetMouseLocation()
		local vector2 = Vector2.new(mouseLocation.X, mouseLocation.Y)
		local v23 = currentCamera:ScreenPointToRay(vector2.X, vector2.Y)
		local origin = v23.Origin
		local unit = v23.Direction.Unit
		local n3 = math.max(tonumber(mellstroySilentAimState.HitboxExpansion.Revolver) or 0, 0)
		local flag4 = mellstroySilentAimState.RagebotFOV == math.huge
		local ragebotFOV = mellstroySilentAimState.RagebotFOV
		local position = mellstroySilentAimState.GetGunShotOrigin()
		position = position and position.Position or origin
		local v24 = nil
		local v25 = nil
		local v26 = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if not (player == Players.LocalPlayer or fn12(player).Whitelist or not fn31(player)) then
				local character = player.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if not (not character or not humanoid or humanoid.Health <= 0) then
					local v27 = fn18(character)

					if v27 then
						for k, v28 in pairs(tbl11) do
							if mellstroySilentAimState.RagebotHitboxes[k] then
								for _, v29 in ipairs(v28) do
									local v30 = character:FindFirstChild(v29)

									if v30 and v30:IsA("BasePart") then
										local v31 = mellstroySilentAimState.GetHitboxExpansionPadding(v30, n3)
										local v32

										if flag4 then
											v32 = mellstroySilentAimState.GetClosestPointOnPart(v30, position, v31)
										else
											local n4 = math.max(0, (v30.Position - origin):Dot(unit))
											v32 = nil

											for i = 1, 5 do
												local v33 = mellstroySilentAimState.GetClosestPointOnPart(v30, origin + unit * n4, v31)

												if v33 then
													n4 = math.max(0, (v33 - origin):Dot(unit))
													v32 = v33
													continue
												end

												break
											end
										end

										if v32 then
											local v33 = mellstroySilentAimState.GetClosestPointOnPart(v30, v32)

											if v33 then
												local v34, v35 = currentCamera:WorldToScreenPoint(v32)

												if flag4 or v35 and v34.Z > 0 then
													local n4

													if flag4 then
														n4 = (v27.Position - position).Magnitude * 100 + (tbl12[k] or 10)
													else
														n4 = flag4
													end

													n4 = n4 or (Vector2.new(v34.X, v34.Y) - vector2).Magnitude
													local v36 = v33:Lerp(v30.Position, 0.08)

													if (mellstroySilentAimState.Wallbang or mellstroySilentAimState.AutoFarmCombat or not mellstroySilentAimState.RagebotVisibleCheck or mellstroySilentAimState.IsPointVisible(character, position, v36)) and mellstroySilentAimState.IsFiniteNumber(n4) and mellstroySilentAimState.IsFiniteVector3(v36) and n4 < ragebotFOV then
														ragebotFOV = n4
														v24 = v30
														v25 = player
														v26 = v36
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		return v24, v25, v26
	end

	tbl:CreateConnection(RunService.Heartbeat, function()
		if not mellstroySilentAimState.Ragebot and not mellstroySilentAimState.AutoFarmCombat then
			return
		end
		local now = os.clock()
		if now - (mellstroySilentAimState.LastRagebotFire or 0) < (mellstroySilentAimState.RagebotFireInterval or 3.08) then
			return
		end
		local v23, v24, v25 = fn32()
		if not v23 or not v24 or not mellstroySilentAimState.IsFiniteVector3(v25) then
			return
		end
		local position = v23.Position
		local v26, v27 = fn25(v24)
		local v28 = getRevolverPredictionTime()
		local finalAimPosition

		if mellstroySilentAimState.IsFiniteVector3(v27) then
			finalAimPosition = position + getRevolverLead(v27, v28, v24.Character)
		else
			finalAimPosition = position
		end

		if not mellstroySilentAimState.IsFiniteVector3(finalAimPosition) then
			return
		end
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		character = character and character:FindFirstChild("Gun")

		if not character and humanoid then
			mellstroySilentAimState.LastRagebotGun = nil
			mellstroySilentAimState.RagebotGunReadyAt = nil
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			backpack = backpack and backpack:FindFirstChild("Gun")

			if backpack and backpack:IsA("Tool") then
				humanoid:EquipTool(backpack)
			end

			return
		end

		if character ~= mellstroySilentAimState.LastRagebotGun then
			mellstroySilentAimState.LastRagebotGun = character
			mellstroySilentAimState.RagebotGunReadyAt = now + (mellstroySilentAimState.RagebotEquipDelay or 0.18)
			return
		end

		if now < (mellstroySilentAimState.RagebotGunReadyAt or 0) then
			return
		end
		character = character and character:FindFirstChild("Shoot")
		local v29 = mellstroySilentAimState.GetGunShotOrigin(finalAimPosition)
		if not v29 or not character or not character:IsA("RemoteEvent") then
			return
		end
		local wallbang = mellstroySilentAimState.Wallbang or mellstroySilentAimState.AutoFarmCombat
		local v30 = mellstroySilentAimState.IsPointVisible(v24.Character, v29.Position, position)
		if not wallbang and mellstroySilentAimState.RagebotVisibleCheck and not v30 then
			return
		end
		local cframe = CFrame.new(finalAimPosition)
		local position2 = v29.Position
		wallbang = wallbang and not v30
		local flag4 = false
		local v31, v32

		if wallbang then
			v31, cframe, position2, v32 = mellstroySilentAimState.BuildRevolverWallbang(v29, finalAimPosition)
			if not v31 or not cframe then
				return
			end
			flag4 = true
		else
			v31 = v29
			v32 = finalAimPosition
		end

		mellstroySilentAimState.LastRagebotFire = now
		local humanoid2 = v24.Character and v24.Character:FindFirstChildOfClass("Humanoid")

		mellstroySilentAimState.LastRagebotShot = {
			Time = now,
			Target = v24.Name,
			Hitbox = v23.Name,
			RawAimPosition = position,
			OriginPosition = v29.Position,
			RemoteOriginPosition = position2,
			AimPosition = finalAimPosition,
			RemoteEndpointPosition = v32,
			TargetHealth = humanoid2 and humanoid2.Health or nil,
			TargetVelocity = v27,
			PredictionTime = v28,
			PingMs = mellstroySilentAimState.NetworkPingMs,
			PingJitterMs = mellstroySilentAimState.NetworkPingJitterMs,
			ThroughWall = flag4,
		}

		mellstroySilentAimState.LastRagebotShot.Kind = "rage"
		mellstroySilentAimState.RecordShot(mellstroySilentAimState.LastRagebotShot)

		if flag4 then
			mellstroySilentAimState.QueueRevolverWallbang(character, v24.Character, finalAimPosition, v23, position, v28, mellstroySilentAimState.LastRagebotShot)
		else
			mellstroySilentAimState.LastRagebotShot.ActualFireTime = os.clock()
			mellstroySilentAimState.LastRagebotShot.FinalOriginPosition = position2
			mellstroySilentAimState.LastRagebotShot.FinalAimPosition = finalAimPosition
			character:FireServer(v31, cframe)

			task.delay(0.5, function()
				local lastRagebotShot = mellstroySilentAimState.LastRagebotShot
				if not lastRagebotShot or lastRagebotShot.Target ~= v24.Name then
					return
				end
				local humanoid3 = v24.Character and v24.Character:FindFirstChildOfClass("Humanoid")
				lastRagebotShot.HealthAfter = humanoid3 and humanoid3.Health or 0
				lastRagebotShot.TargetPartAfter = v23.Parent and v23.Position or nil
			end)
		end
	end)

	tbl:CreateConnection(RunService.Heartbeat, function()
		if not mellstroySilentAimState.KnifeAura and not mellstroySilentAimState.AutoFarmCombat then
			return
		end
		local now = os.clock()
		if now - (mellstroySilentAimState.LastKnifeAuraStab or 0) < 0.9 then
			return
		end
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local v23 = fn18(character)
		if not character or not humanoid or humanoid.Health <= 0 or not v23 then
			return
		end
		local knife = character:FindFirstChild("Knife")

		if not knife then
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			backpack = backpack and backpack:FindFirstChild("Knife")

			if backpack and backpack:IsA("Tool") then
				humanoid:EquipTool(backpack)
			end

			return
		end

		local events = knife:FindFirstChild("Events")
		local knifeStabbed = events and events:FindFirstChild("KnifeStabbed")
		local handleTouched = events and events:FindFirstChild("HandleTouched")
		if not knifeStabbed or not knifeStabbed:IsA("RemoteEvent") or not handleTouched or not handleTouched:IsA("RemoteEvent") then
			return
		end
		local tbl13 = {}
		local n3 = math.max(tonumber(mellstroySilentAimState.HitboxExpansion.Knife) or 0, 0)

		for _, player in ipairs(Players:GetPlayers()) do
			if not (player == localPlayer or fn12(player).Whitelist or not fn16(player, "Knife")) then
				local character2 = player.Character
				local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
				local v24 = fn18(character2)

				if humanoid2 and humanoid2.Health > 0 and v24 and (mellstroySilentAimState.AutoFarmCombat or (v24.Position - v23.Position).Magnitude <= mellstroySilentAimState.KnifeAuraRange + n3) then
					tbl13[#tbl13 + 1] = v24
				end
			end
		end

		if #tbl13 == 0 then
			return
		end
		mellstroySilentAimState.LastKnifeAuraStab = now
		knifeStabbed:FireServer()

		task.delay(0.03, function()
			if not mellstroySilentAimState.KnifeAura and not mellstroySilentAimState.AutoFarmCombat or not handleTouched.Parent then
				return
			end

			for _, v24 in ipairs(tbl13) do
				if v24.Parent then
					local mellstroyFeedback = getgenv().__MellstroyFeedback
					local playerFromCharacter = Players:GetPlayerFromCharacter(v24.Parent)

					if mellstroyFeedback and playerFromCharacter and type(mellstroyFeedback.Tag) == "function" then
						mellstroyFeedback:Tag(playerFromCharacter, "Knife")
					end

					handleTouched:FireServer(v24)
				end
			end
		end)
	end)

	local function fn33()
		local TweenService2 = game:GetService("TweenService")
		local MarketplaceService = game:GetService("MarketplaceService")
		local localPlayer = Players.LocalPlayer
		local n3 = 60
		local flag4 = false

		local function fn34(arg)
			local flag5 = arg == true
			if flag5 == flag4 then
				return
			end
			flag4 = flag5
			if type(setfpscap) ~= "function" then
				return
			end

			if flag5 then
				if type(getfpscap) == "function" then
					local ok, result = pcall(getfpscap)

					if ok and type(result) == "number" and result > 0 then
						n3 = result
					end
				end

				pcall(setfpscap, 5)
			else
				pcall(setfpscap, n3)
			end
		end

		local function fn35()
			local v23 = getcustomasset or getsynasset
			local str = index.Folder .. "/fonts/Verdana.ttf"
			local str2 = index.Folder .. "/fonts/Verdana.font.json"
			if type(isfile) ~= "function" or type(writefile) ~= "function" or type(v23) ~= "function" then
				return Font.fromEnum(Enum.Font.Arial)
			end

			if not isfile(str) then
				return Font.fromEnum(Enum.Font.Arial)
			end
			local ok, result = pcall(v23, str)
			if not ok then
				return Font.fromEnum(Enum.Font.Arial)
			end
			local json = game:GetService("HttpService"):JSONEncode({ name = "Verdana", faces = { { name = "Regular", weight = 400, style = "normal", assetId = result } } })
			if not pcall(writefile, str2, json) then
				return Font.fromEnum(Enum.Font.Arial)
			end
			local ok2, result2 = pcall(v23, str2)
			if not ok2 then
				return Font.fromEnum(Enum.Font.Arial)
			end
			local ok3, result3 = pcall(Font.new, result2, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			return ok3 and result3 or Font.fromEnum(Enum.Font.Arial)
		end

		local v23 = fn35()

		local tbl13 = {
			Enabled = false,
			Aggressive = false,
			NextUpdate = 0,
			OptimizedModels = setmetatable({}, { __mode = "k" }),
			ProfileData = nil,
		}

		local ok, profileData = pcall(function()
			return require(game:GetService("ReplicatedStorage").Modules.ProfileData)
		end)

		if ok and type(profileData) == "table" then
			tbl13.ProfileData = profileData
		end

		tbl13.Overlay = tbl:RenderObject("Frame", {
			Name = "MellstroyMemorySaver",
			Active = false,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Parent = v.ScreenGui,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1),
			Visible = false,
			ZIndex = 100,
		})

		tbl13.Title = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			FontFace = v23,
			Parent = tbl13.Overlay,
			Position = UDim2.fromScale(0.5, 0.44),
			Size = UDim2.fromOffset(500, 28),
			Text = "mellstroyhook | autofarm",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 18,
			ZIndex = 101,
		})

		tbl13.Balance = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			FontFace = v23,
			Parent = tbl13.Overlay,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(500, 22),
			Text = "current balance: ?",
			TextColor3 = Color3.fromRGB(190, 190, 190),
			TextSize = 14,
			ZIndex = 101,
		})

		tbl13.Status = tbl:RenderObject("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			FontFace = v23,
			Parent = tbl13.Overlay,
			Position = UDim2.fromScale(0.5, 0.55),
			Size = UDim2.fromOffset(600, 22),
			Text = "[ disabled ] autofarm is off",
			TextColor3 = Color3.fromRGB(150, 150, 150),
			TextSize = 13,
			ZIndex = 101,
		})

		tbl13.GetBalance = function(arg)
			local profileData2 = arg.ProfileData
			profileData2 = profileData2 and profileData2.Materials
			profileData2 = profileData2 and profileData2.Owned
			profileData2 = profileData2 and profileData2.Coins
			return type(profileData2) == "number" and math.floor(profileData2) or nil
		end

		tbl13.StripModel = function(arg, arg2, arg3)
			if not arg2 or not arg2.Parent then
				return false
			end
			arg.OptimizedModels[arg2] = true
			local descendants = arg2:GetDescendants()
			local flag5 = false

			for i = #descendants, 1, -1 do
				local v24 = descendants[i]

				if not (arg3 and (v24 == arg3 or v24:IsDescendantOf(arg3))) and (v24:IsA("BasePart") or v24:IsA("Decal") or v24:IsA("Texture") or v24:IsA("DataModelMesh") or v24:IsA("SurfaceAppearance") or v24:IsA("ParticleEmitter") or v24:IsA("Trail") or v24:IsA("Beam") or v24:IsA("Sound")) then
					flag5 = pcall(v24.Destroy, v24) or flag5
				end
			end

			return flag5
		end

		tbl13.OptimizeVisibleWorld = function(arg)
			if not arg.Enabled then
				return
			end
			local flag5 = false

			for _, child in ipairs(workspace:GetChildren()) do
				local coinContainer = child:FindFirstChild("CoinContainer", true)

				if child.Name == "Lobby" then
					flag5 = arg:StripModel(child, nil) or flag5
				elseif coinContainer then
					flag5 = arg:StripModel(child, coinContainer) or flag5
				end
			end

			if flag5 and type(collectgarbage) == "function" then
				pcall(collectgarbage, "collect")
			end
		end

		tbl13.SetEnabled = function(arg, arg2)
			local enabled = arg2 == true
			if arg.Enabled == enabled then
				return
			end
			arg.Enabled = enabled
			arg.Overlay.Visible = enabled
			pcall(RunService.Set3dRenderingEnabled, RunService, not enabled)

			if enabled then
				arg.NextUpdate = 0
				arg:OptimizeVisibleWorld()
			end
		end

		tbl13.Step = function(arg, arg2, arg3)
			if not arg.Enabled then
				return
			end
			arg.Status.Text = arg3 and arg2 or "[ disabled ] autofarm is off"
			local now = os.clock()
			if now < arg.NextUpdate then
				return
			end
			arg.NextUpdate = now + 0.5
			arg:PurgeGui()
			arg.Balance.Text = "current balance: " .. (arg:GetBalance() or "?")
			arg:OptimizeVisibleWorld()
		end

		tbl13.PurgeGui = function(arg)
			if not arg.Aggressive then
				return
			end
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")

			if playerGui then
				for _, child in ipairs(playerGui:GetChildren()) do
					pcall(child.Destroy, child)
				end
			end

			local v24 = ipairs
			local StarterGui = game:GetService("StarterGui")

			for _, child in v24(StarterGui:GetChildren()) do
				pcall(child.Destroy, child)
			end

			for _, player in ipairs(Players:GetPlayers()) do
				local character = player.Character

				if character then
					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("ShirtGraphic") or child:IsA("CharacterMesh") then
							pcall(child.Destroy, child)
						end
					end
				end
			end

			if not arg.StaticAssetsPurged then
				arg.StaticAssetsPurged = true
				local descendants = game:GetService("ReplicatedStorage"):GetDescendants()

				for i = #descendants, 1, -1 do
					local v25 = descendants[i]

					if v25:IsA("GuiObject") or v25:IsA("LayerCollector") or v25:IsA("BasePart") or v25:IsA("Decal") or v25:IsA("Texture") or v25:IsA("DataModelMesh") or v25:IsA("SurfaceAppearance") or v25:IsA("ParticleEmitter") or v25:IsA("Trail") or v25:IsA("Beam") or v25:IsA("Sound") or v25:IsA("Animation") then
						pcall(v25.Destroy, v25)
					end
				end
			end

			for _, child in ipairs(v.ScreenGui:GetChildren()) do
				if child ~= arg.Overlay and child ~= arg.PreservedStatus then
					pcall(child.Destroy, child)
				end
			end
		end

		tbl13.EnableOneClick = function(arg, preservedStatus)
			if arg.Aggressive then
				return
			end
			arg.Aggressive = true
			arg.PreservedStatus = preservedStatus

			pcall(function()
				game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
			end)

			for _, v24 in ipairs({ "Pages", "Keybinds", "KeybindConfig", "ConfigControls", "ConfigControlCounts" }) do
				if type(v[v24]) == "table" then
					table.clear(v[v24])
				end
			end

			arg:PurgeGui()
		end

		local v24 = tbl
		local renderObject = v24.RenderObject

		local textLabel = renderObject(v24, "TextLabel", {
			Name = "MellstroyCoinFarmStatus",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FontFace = v23,
			PreserveTextStyle = true,
			Parent = v.ScreenGui,
			Position = UDim2.fromScale(0.5, 0.62),
			Size = UDim2.fromOffset(v.IsMobile and 300 or 440, 20),
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = v.IsMobile and 11 or 13,
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
			TextStrokeTransparency = 0,
			TextXAlignment = "Center",
			Visible = false,
			ZIndex = 70,
		})

		local mellstroyCoinFarmState = {
			Enabled = false,
			Generation = 0,
			CurrentMap = nil,
			CurrentTween = nil,
			FinishedRound = false,
			Elite = false,
			BagLimit = 40,
			FallbackCount = 0,
			DisplayCount = 0,
			HasGuiCount = false,
			WaitingLobby = false,
			ResetRequested = false,
			NeedsFirstCoinTeleport = false,
			RoundRoot = nil,
			CombatActive = false,
			LastCombatTransition = 0,
			LobbyRoot = nil,
			LobbyCFrame = nil,
			LobbyAnchored = false,
			TweenSpeed = 48,
			TweenDelay = 0.5,
			IgnoredCoins = setmetatable({}, { __mode = "k" }),
		}

		getgenv().__MellstroyCoinFarmState = mellstroyCoinFarmState

		local function fn36()
			local currentTween = mellstroyCoinFarmState.CurrentTween
			mellstroyCoinFarmState.CurrentTween = nil

			if currentTween then
				pcall(function()
					currentTween:Cancel()
				end)
			end
		end

		local function fn37(arg)
			local combatActive = arg == true

			if mellstroyCoinFarmState.CombatActive ~= combatActive then
				mellstroyCoinFarmState.CombatActive = combatActive
				mellstroyCoinFarmState.LastCombatTransition = os.clock()
			end

			mellstroySilentAimState.AutoFarmCombat = combatActive
			local character = localPlayer.Character
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			character = character and character:FindFirstChild("Gun") ~= nil or backpack and backpack:FindFirstChild("Gun") ~= nil
			tbl3:SetAutomatic(combatActive and not character)
		end

		local function fn38(arg)
			local character = localPlayer.Character
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			return character and character:FindFirstChild(arg) ~= nil or backpack and backpack:FindFirstChild(arg) ~= nil
		end

		local function fn39()
			local lobbyRoot = mellstroyCoinFarmState.LobbyRoot

			if lobbyRoot and lobbyRoot.Parent then
				pcall(function()
					lobbyRoot.Anchored = mellstroyCoinFarmState.LobbyAnchored == true
				end)
			end

			mellstroyCoinFarmState.LobbyRoot = nil
			mellstroyCoinFarmState.LobbyCFrame = nil
			mellstroyCoinFarmState.LobbyAnchored = false
		end

		local function fn40()
			fn36()
			fn37(false)
			mellstroyCoinFarmState.WaitingLobby = true
			mellstroyCoinFarmState.NeedsFirstCoinTeleport = false
			mellstroyCoinFarmState.RoundRoot = nil
		end

		local function fn41()
			if not mellstroyCoinFarmState.Enabled or not mellstroyCoinFarmState.WaitingLobby then
				return
			end
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoid or humanoid.Health <= 0 or not character then
				return
			end

			if mellstroyCoinFarmState.LobbyRoot == character then
				character.Anchored = true
				character.CFrame = mellstroyCoinFarmState.LobbyCFrame
				error("devirt: storing a non-empty VM table into a register (at 37:79)")
			end

			fn39()
			mellstroyCoinFarmState.LobbyRoot = character
			mellstroyCoinFarmState.LobbyAnchored = character.Anchored
			error("devirt: value LTable#366 in an expression (at 35:39)")
		end

		local function fn42()
			textLabel.Visible = mellstroyCoinFarmState.Enabled and not tbl13.Enabled
			if not mellstroyCoinFarmState.Enabled then
				return
			end

			if mellstroyCoinFarmState.WaitingLobby or not mellstroyCoinFarmState.CurrentMap then
				textLabel.Text = "[ lobby ] waiting next round"
			elseif not mellstroyCoinFarmState.FinishedRound then
				local bagLimit = mellstroyCoinFarmState.BagLimit
				local bagLimit2 = mellstroyCoinFarmState.BagLimit
				textLabel.Text = string.format("[ %d / %d ] farming coins", math.clamp(math.floor(mellstroyCoinFarmState.DisplayCount), 0, bagLimit), bagLimit2)
			elseif fn38("Knife") or fn14(fn8(localPlayer)) then
				textLabel.Text = "[ ragebot ] killing everyone"
			else
				textLabel.Text = "[ ragebot ] killing murderer"
			end
		end

		local function fn43()
			for _, child in ipairs(workspace:GetChildren()) do
				if child:FindFirstChild("CoinContainer", true) then
					return child
				end
			end

			return nil
		end

		local function fn44(arg)
			if arg:IsA("BasePart") then
				return arg.CFrame
			end

			if arg:IsA("Model") then
				local ok2, result = pcall(arg.GetPivot, arg)
				return ok2 and result or nil
			end
			local basePart = arg:FindFirstChildWhichIsA("BasePart", true)
			if basePart then
				return basePart.CFrame
			end
			return nil
		end

		local function fn45(arg)
			if not arg or not arg.Parent then
				return false
			end
			local coinVisual = arg:FindFirstChild("CoinVisual", true)
			if not coinVisual then
				return true
			end
			local mainCoin = coinVisual:FindFirstChild("MainCoin", true)
			if mainCoin and mainCoin:IsA("BasePart") then
				return mainCoin.Transparency < 0.95
			end

			for _, descendant in ipairs(coinVisual:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant.Transparency < 0.95 then
					return true
				end
			end

			return not coinVisual:IsA("BasePart") or coinVisual.Transparency < 0.95
		end

		local function fn46(arg, arg2, arg3)
			arg = arg and arg:FindFirstChild("CoinContainer", true)
			if not arg then
				return nil
			end
			local huge = math.huge
			local v25 = nil
			local v26 = nil

			for _, descendant in ipairs(arg:GetDescendants()) do
				if not (descendant.Name ~= "Coin_Server" or mellstroyCoinFarmState.IgnoredCoins[descendant] or not arg3 and not fn45(descendant)) then
					local v27 = fn44(descendant)

					if v27 then
						local magnitude = (v27.Position - arg2.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v25 = descendant
							v26 = v27
						end
					end
				end
			end

			return v25, v26, huge
		end

		local function fn47()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			playerGui = playerGui and playerGui:FindFirstChild("MainGUI")
			if not playerGui then
				return nil
			end

			for _, v25 in ipairs({ "Game", "Lobby" }) do
				local coinBags = playerGui:FindFirstChild(v25)
				coinBags = coinBags and coinBags:FindFirstChild("CoinBags")
				coinBags = coinBags and coinBags:FindFirstChild("Container")
				coinBags = coinBags and coinBags:FindFirstChild("Coin")
				coinBags = coinBags and coinBags:FindFirstChild("Coins", true)

				if coinBags and (coinBags:IsA("TextLabel") or coinBags:IsA("TextButton")) then
					local tbl14 = {}

					for match in tostring(coinBags.Text):gmatch("%d+") do
						tbl14[#tbl14 + 1] = tonumber(match)
					end

					if tbl14[1] then
						return tbl14[1], tbl14[2]
					end
				end
			end

			return nil
		end

		local function fn48(currentMap)
			fn36()
			fn39()
			mellstroyCoinFarmState.CurrentMap = currentMap
			mellstroyCoinFarmState.FinishedRound = false
			mellstroyCoinFarmState.FallbackCount = 0
			mellstroyCoinFarmState.DisplayCount = 0
			mellstroyCoinFarmState.HasGuiCount = false
			mellstroyCoinFarmState.WaitingLobby = false
			mellstroyCoinFarmState.ResetRequested = false
			mellstroyCoinFarmState.NeedsFirstCoinTeleport = true
			mellstroyCoinFarmState.RoundRoot = nil
			mellstroyCoinFarmState.IgnoredCoins = setmetatable({}, { __mode = "k" })
			fn37(false)
			fn42()
		end

		local function fn49()
			if mellstroyCoinFarmState.FinishedRound then
				return
			end
			mellstroyCoinFarmState.FinishedRound = true
			fn36()

			if fn8(localPlayer) == "Innocent" and not fn38("Gun") then
				fn40()

				if not mellstroyCoinFarmState.ResetRequested then
					mellstroyCoinFarmState.ResetRequested = true
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character and character.Health > 0 then
						character.Health = 0
					end
				end

				fn42()
				return
			end

			fn37(true)
			fn42()
		end

		local function fn50()
			local v25, v26 = fn47()

			if type(v26) == "number" and v26 >= 40 then
				mellstroyCoinFarmState.BagLimit = v26
			end

			local displayCount

			if type(v25) == "number" then
				mellstroyCoinFarmState.HasGuiCount = true
				mellstroyCoinFarmState.DisplayCount = math.max(v25, mellstroyCoinFarmState.FallbackCount)
				displayCount = mellstroyCoinFarmState.DisplayCount
			elseif mellstroyCoinFarmState.HasGuiCount then
				mellstroyCoinFarmState.DisplayCount = math.max(mellstroyCoinFarmState.DisplayCount, mellstroyCoinFarmState.FallbackCount)
				displayCount = mellstroyCoinFarmState.DisplayCount
			else
				mellstroyCoinFarmState.DisplayCount = mellstroyCoinFarmState.FallbackCount
				displayCount = mellstroyCoinFarmState.FallbackCount
			end

			if displayCount >= mellstroyCoinFarmState.BagLimit then
				fn49()
				return true
			end
			return false
		end

		local function fn51(arg, arg2, arg3, arg4, arg5, arg6)
			local tween = TweenService2:Create(arg2, TweenInfo.new(math.max(arg5 / math.max(mellstroyCoinFarmState.TweenSpeed, 1), 0.05), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { CFrame = arg4 })
			mellstroyCoinFarmState.CurrentTween = tween
			local flag5 = false
			local v25 = nil

			local connection = tween.Completed:Connect(function(playbackState)
				v25 = playbackState
				flag5 = true
			end)

			tween:Play()
			local flag6

			while true do
				local flag7 = not flag5 and mellstroyCoinFarmState.Enabled and mellstroyCoinFarmState.Generation == arg6
				flag6 = false

				if flag7 then
					if mellstroyCoinFarmState.CurrentMap ~= arg or not arg2.Parent or arg2.Parent ~= localPlayer.Character then
						tween:Cancel()
						break
					elseif not fn45(arg3) then
						flag6 = (arg2.Position - arg4.Position).Magnitude <= 8
						tween:Cancel()
						break
					else
						RunService.Heartbeat:Wait()
						continue
					end
				end

				break
			end

			connection:Disconnect()

			if mellstroyCoinFarmState.CurrentTween == tween then
				mellstroyCoinFarmState.CurrentTween = nil
			end

			if (flag6 or v25 == Enum.PlaybackState.Completed) and mellstroyCoinFarmState.Enabled and mellstroyCoinFarmState.Generation == arg6 then
				task.wait(0.12)

				if not fn45(arg3) then
					mellstroyCoinFarmState.IgnoredCoins[arg3] = true
					mellstroyCoinFarmState.FallbackCount = mellstroyCoinFarmState.FallbackCount + 1

					if not mellstroyCoinFarmState.HasGuiCount then
						mellstroyCoinFarmState.DisplayCount = mellstroyCoinFarmState.FallbackCount
					end
				end

				task.wait(mellstroyCoinFarmState.TweenDelay)
			end
		end

		local function fn52(arg)
			task.spawn(function()
				local ok2, result = pcall(function()
					return MarketplaceService:UserOwnsGamePassAsync(localPlayer.UserId, 429957)
				end)

				if mellstroyCoinFarmState.Enabled and mellstroyCoinFarmState.Generation == arg and ok2 then
					mellstroyCoinFarmState.Elite = result == true
					mellstroyCoinFarmState.BagLimit = mellstroyCoinFarmState.Elite and 50 or 40
				end
			end)

			while mellstroyCoinFarmState.Enabled and mellstroyCoinFarmState.Generation == arg do
				local v25 = fn43()

				if v25 ~= mellstroyCoinFarmState.CurrentMap then
					if v25 then
						fn48(v25)
					else
						fn36()
						mellstroyCoinFarmState.CurrentMap = nil
						fn40()
					end
				end

				if not v25 and not mellstroyCoinFarmState.WaitingLobby then
					fn40()
				end

				if v25 and not mellstroyCoinFarmState.FinishedRound and not fn50() then
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					character = character and character:FindFirstChild("HumanoidRootPart")

					if humanoid and humanoid.Health > 0 and character and character:IsA("BasePart") then
						if mellstroyCoinFarmState.RoundRoot ~= character then
							fn36()
							mellstroyCoinFarmState.RoundRoot = character
							mellstroyCoinFarmState.NeedsFirstCoinTeleport = true
						end

						local v26, v27, v28 = fn46(v25, character, mellstroyCoinFarmState.NeedsFirstCoinTeleport)

						if v26 and v27 then
							if mellstroyCoinFarmState.NeedsFirstCoinTeleport then
								mellstroyCoinFarmState.NeedsFirstCoinTeleport = false
								character.Anchored = false
								error("devirt: storing a non-empty VM table into a register (at 69:156)")
							end

							fn51(v25, character, v26, v27, v28, arg)
							continue
						end

						task.wait(0.02)
						continue
					end

					task.wait(0.15)
					continue
				end

				task.wait(0.15)
			end
		end

		local function fn53(arg)
			local enabled = arg == true
			if mellstroyCoinFarmState.Enabled == enabled then
				return
			end
			mellstroyCoinFarmState.Enabled = enabled
			mellstroyCoinFarmState.Generation = mellstroyCoinFarmState.Generation + 1
			fn36()

			if enabled then
				mellstroyCoinFarmState.CurrentMap = nil
				mellstroyCoinFarmState.FinishedRound = false
				mellstroyCoinFarmState.FallbackCount = 0
				mellstroyCoinFarmState.DisplayCount = 0
				mellstroyCoinFarmState.HasGuiCount = false
				mellstroyCoinFarmState.WaitingLobby = false
				mellstroyCoinFarmState.ResetRequested = false
				mellstroyCoinFarmState.NeedsFirstCoinTeleport = false
				mellstroyCoinFarmState.RoundRoot = nil
				fn37(false)
				fn42()
				task.spawn(fn52, mellstroyCoinFarmState.Generation)
			else
				mellstroyCoinFarmState.CurrentMap = nil
				mellstroyCoinFarmState.FinishedRound = false
				mellstroyCoinFarmState.WaitingLobby = false
				mellstroyCoinFarmState.ResetRequested = false
				mellstroyCoinFarmState.NeedsFirstCoinTeleport = false
				mellstroyCoinFarmState.RoundRoot = nil
				fn37(false)
				fn39()
				fn42()
			end
		end

		tbl:CreateConnection(RunService.Heartbeat, function()
			fn41()
			fn42()
			tbl13:Step(textLabel.Text, mellstroyCoinFarmState.Enabled)
		end)

		v14:CreateToggle({ Name = "Enable", State = false, Bindable = true, BindMode = "Toggle", Callback = fn53 })
		v14:CreateToggle({ Name = "5 FPS", State = false, Callback = fn34 })

		v14:CreateToggle({
			Name = "Memory saver",
			State = false,
			Bindable = true,
			BindMode = "Toggle",
			Callback = function(arg)
				tbl13:SetEnabled(arg)
				fn42()
			end,
		})

		v14.Settings:CreateSlider({
			Name = "Tween speed",
			State = 48,
			Min = 10,
			Max = 100,
			Decimals = 1,
			Suffix = "st/s",
			Callback = function(tweenSpeed)
				mellstroyCoinFarmState.TweenSpeed = tweenSpeed
			end,
		})

		v14.Settings:CreateSlider({
			Name = "Coin delay",
			State = 0.5,
			Min = 0,
			Max = 2,
			Decimals = 0.05,
			Suffix = "s",
			Callback = function(tweenDelay)
				mellstroyCoinFarmState.TweenDelay = tweenDelay
			end,
		})

		local mellstroyAutofarmController = {
			Start = function(arg, arg2)
				tbl13:SetEnabled(true)

				if arg2 then
					tbl13:EnableOneClick(textLabel)
				end

				fn34(true)
				fn53(true)
				fn42()
			end,
			Stop = function()
				fn53(false)
				tbl13:SetEnabled(false)
				fn34(false)
				fn42()
			end,
			IsRunning = function()
				return mellstroyCoinFarmState.Enabled, tbl13.Enabled, flag4
			end,
		}

		getgenv().__MellstroyAutofarmController = mellstroyAutofarmController

		if getgenv().__MellstroyOneClickRequested then
			getgenv().__MellstroyOneClickRequested = nil

			task.defer(function()
				mellstroyAutofarmController:Start(true)
			end)
		end

		v.CleanupCallbacks[#v.CleanupCallbacks + 1] = function()
			fn53(false)
			fn34(false)
			tbl13:SetEnabled(false)

			if getgenv().__MellstroyAutofarmController == mellstroyAutofarmController then
				getgenv().__MellstroyAutofarmController = nil
			end

			textLabel.Visible = false
		end
	end

	fn33()
	local tbl13 = {}

	local function fn34()
		local character = Players.LocalPlayer.Character
		if not character then
			return nil
		end

		if character:FindFirstChild("Gun") then
			return "Revolver"
		end

		if character:FindFirstChild("Knife") then
			return "Knife"
		end
		return nil
	end

	local function fn35()
		mellstroySilentAimState.EquippedWeapon = fn34()
	end

	local function fn36(arg)
		for _, v23 in ipairs(tbl13) do
			v23:Disconnect()
		end

		table.clear(tbl13)

		if arg then
			tbl13[1] = tbl:CreateConnection(arg.ChildAdded, function(arg2)
				if arg2:IsA("Tool") then
					task.defer(fn35)
				end
			end)

			tbl13[2] = tbl:CreateConnection(arg.ChildRemoved, function(arg2)
				if arg2:IsA("Tool") then
					task.defer(fn35)
				end
			end)
		end

		task.defer(fn35)
	end

	tbl:CreateConnection(Players.LocalPlayer.CharacterAdded, fn36)
	fn36(Players.LocalPlayer.Character)
	error("devirt: storing a non-empty VM table into a register (at 37:902)")
end)

if not ok then
	warn("[mellstroyhook] " .. tostring(result))
end
