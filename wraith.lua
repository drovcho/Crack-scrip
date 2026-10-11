

local _getgenv = getgenv or getfenv
getgenv = _getgenv
local _env = _getgenv()

_env.LPH_NO_VIRTUALIZE = _env.LPH_NO_VIRTUALIZE or function(f)
    return f
end
local k3SplashReady = false
do
	local gui, img
	pcall(function()
		local holder = (gethui and gethui()) or game:GetService("CoreGui")
		local old = holder:FindFirstChild("K3SUU1_SPLASH")
		if old then pcall(function() old:Destroy() end) end
		gui = Instance.new("ScreenGui")
		gui.Name = "K3SUU1_SPLASH"
		gui.IgnoreGuiInset = true
		gui.ResetOnSpawn = false
		gui.DisplayOrder = 999999
		pcall(function() if type(protect_gui) == "function" then protect_gui(gui) end end)
		gui.Parent = holder
		img = Instance.new("ImageLabel")
		img.AnchorPoint = Vector2.new(0.5, 0.5)
		img.Position = UDim2.fromScale(0.5, 0.5)
		img.Size = UDim2.fromOffset(420, 420)
		img.BackgroundTransparency = 1
		img.BorderSizePixel = 0
		img.ImageTransparency = 1
		img.ScaleType = Enum.ScaleType.Fit
		img.Parent = gui
	end)
	task.spawn(function()
		local asset = nil
		pcall(function()
			local IMAGE_URL = "https://raw.githubusercontent.com/leakabeak-eng/cartinki/main/34046066-81c6-4168-ac31-8d91e4611bd3%20(1).png"
			local FILE_NAME = "k3suu1_splash.png"
			local _getasset = getcustomasset or getsynasset
			if type(_getasset) == "function" and type(isfile) == "function" then
				pcall(function()
					if isfile(FILE_NAME) then asset = _getasset(FILE_NAME) end
				end)
			end
			if not asset then
				local bytes = game:HttpGet(IMAGE_URL)
				if type(writefile) == "function" then writefile(FILE_NAME, bytes) end
				task.wait(0.2)
				if type(_getasset) == "function" then asset = _getasset(FILE_NAME) end
			end
		end)
		if asset and img and gui then
			pcall(function()
				img.Image = asset
				local TweenService = game:GetService("TweenService")
				local fadeIn = TweenService:Create(img, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0})
				fadeIn:Play()
				fadeIn.Completed:Wait()
			end)
			k3SplashReady = true
			task.wait(3)
			pcall(function()
				local TweenService = game:GetService("TweenService")
				local fadeOut = TweenService:Create(img, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 1})
				fadeOut:Play()
				fadeOut.Completed:Wait()
			end)
			pcall(function() gui:Destroy() end)
		else
			k3SplashReady = true
			if gui then pcall(function() gui:Destroy() end) end
		end
	end)
	local t0 = os.clock()
	while not k3SplashReady and os.clock() - t0 < 6 do task.wait(0.1) end
end

if true then
	local lib, v16, fn10, Players, ReplicatedStorage_, RunService, UserInputService_, Workspace, Lighting, HttpService
	local TeleportService, SoundService, CoreGui, localPlayer, fn11, fn12, fn13, fn14, fn15, str5
	local fn16, fn17, fn18, fn19, fn20, fn21, fn22, fn23, flag6, flag7
	local fn24, fn25, fn26, fn27, fn28, fn29, fn30, fn31, fn32, fn33
	local fn34, fn35, fn36, fn37, tbl5, fn38, fn39, flag8, flag9, fn40
	local fn41, fn42, fn43, fn44, fn45, flag10, fn46, fn47, fn48, v17
	local v18, v19, v20, v21, v22, v23, v24, v25, v26, v27
	local v28, v29, v30, v31, v32, v33, v34, v35, v36

	do
		local fn49, fn50

		do
			local VirtualInputManager

			do
				NL_EMBED = [=[--[[
                          Neverlose.cc UI Library
    Author: 4lpaca
	License: MIT
    Discord: https://arceney.win/discord
    Other-Projects: https://4lpaca.win
]]

do
	local Constant = 'L'..'P'..'H'..'_NO_VIRTUALIZE';
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end;
end;

cloneref = cloneref or function(i) return i end;
gethui = gethui or get_hidden_gui;
getcustomasset = getcustomasset or getsynasset;
getgenv = getgenv or getfenv;

local LOAD_ENV = LPH_NO_VIRTUALIZE(function()
	if game:GetService('RunService'):IsStudio() then
		local BaseWorkspace = game:GetService("ReplicatedFirst"):FindFirstChild('PRI_WORKSPACE') or Instance.new('Folder',game:GetService("ReplicatedFirst"));

		BaseWorkspace.Name = 'PRI\0.'..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)));

		local __get_path_c = function(path)
			return (string.find(path,'/',1,true) and string.split(path,'/')) or (string.find(path,'\\',1,true) and string.split(path,'\\')) or {path};
		end;

		local __get_path = function(path)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				block = block[v];
			end;

			return block;
		end;

		getgenv().readfile = function(path)
			local path : StringValue = __get_path(path);

			return path.Value;
		end;

		getgenv().isfile = function(path)
			local success , message = pcall(function()
				return __get_path(path);
			end);

			if success and not message:IsA("Folder") then
				return true;
			end;

			return false;
		end;

		getgenv().isfolder = function(path)
			local success , message = pcall(function()
				return __get_path(path);
			end);

			if success and message:IsA("Folder") then
				return true;
			end;

			return false;
		end;

		getgenv().writefile = function(path,content)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				local item = block:FindFirstChild(v);
				if not item then
					local c = Instance.new('StringValue',block);

					c.Name = tostring(v);
					c.Value = content;
				else
					if item:IsA('StringValue') and tostring(item) == v then
						item.Name = tostring(v);
						item.Value = content;
					end;

					block = item;
				end;
			end;
		end;

		getgenv().listfiles = function(path)
			local fold = __get_path(path);
			local pa = {};

			for i,v in next , fold:GetChildren() do
				if v:IsA('StringValue') then
					table.insert(pa,path..'/'..tostring(v));
				end;
			end;

			return pa;
		end;

		getgenv().makefolder = function(path)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				local item = block:FindFirstChild(v);
				if not item then
					local c = Instance.new('Folder',block);

					c.Name = tostring(v);
				else
					block = item;
				end;
			end;
		end;

		getgenv().delfile = function(path)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				local item = block:FindFirstChild(v);
				if item and item:IsA('StringValue') then
					item:Destroy();
				else
					block = item;
				end;
			end;
		end;
	end;
end)

LOAD_ENV();

writefile = writefile or getgenv().writefile;
makefolder = makefolder or getgenv().makefolder;
readfile = readfile or getgenv().readfile;
delfolder = delfolder or getgenv().delfolder;
delfile = delfile or getgenv().delfile;
listfiles = listfiles or getgenv().listfiles;
isfolder = isfolder or getgenv().isfolder;
isfile = isfile or getgenv().isfile;

local NeverLose = {};

NeverLose.BuiltInRegular = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Regular,Enum.FontStyle.Normal);
NeverLose.BuiltInBold = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Bold,Enum.FontStyle.Normal);
NeverLose.GlobalSignals = {};
NeverLose.UnloadEnabled = true;

local cloneref: cloneref = cloneref or function(f) return f end;
local TweenService: TweenService = cloneref(game:GetService('TweenService'));
local UserInputService: UserInputService = cloneref(game:GetService('UserInputService'));
local TextService: TextService = cloneref(game:GetService('TextService'));
local RunService: RunService = cloneref(game:GetService('RunService'));
local Players: Players = cloneref(game:GetService('Players'));
local HttpService: HttpService = cloneref(game:GetService('HttpService'));
local LocalPlayer: Player = Players.LocalPlayer;
local CoreGui: PlayerGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneref(game:FindFirstChild('CoreGui')) or cloneref(LocalPlayer.PlayerGui);
local Mouse: Mouse = LocalPlayer:GetMouse();
local CurrentCamera: Camera = cloneref(workspace.CurrentCamera);
local ProtectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function(s) return s; end;
local GlobalWindow = Instance.new('ScreenGui');
local ManualTween = TweenInfo.new(0.1);
local SlowyTween = TweenInfo.new(0.175);
local FastTween = TweenInfo.new(0.05);
local VSlowTween = TweenInfo.new(0.5,Enum.EasingStyle.Quint);
local Encryption = {};

NeverLose.UserProfile = Players:GetUserThumbnailAsync(LocalPlayer.UserId , Enum.ThumbnailType.HeadShot , Enum.ThumbnailSize.Size150x150)
NeverLose.RandomString = LPH_NO_VIRTUALIZE(function()
	return string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4));
end);

ProtectGui(GlobalWindow);

GlobalWindow.Name = NeverLose.RandomString();
GlobalWindow.IgnoreGuiInset = true;
GlobalWindow.ZIndexBehavior = Enum.ZIndexBehavior.Global;
GlobalWindow.ResetOnSpawn = false;
GlobalWindow.Parent = CoreGui;

NeverLose.Scales = {
	Small = UDim2.fromOffset(540,380),
	Mobile = UDim2.fromOffset(640,385),
	Default = UDim2.fromOffset(640 , 480),
	Large = UDim2.fromOffset(800 , 600)
};

NeverLose.IconColor = Color3.fromRGB(255, 255, 255);
NeverLose.ScreenGui = GlobalWindow;
NeverLose.Flags = {};
NeverLose.FlagTypes = {};
NeverLose.AccentColor = Color3.fromRGB(96, 76, 214);
NeverLose.MainColor = Color3.fromRGB(8, 8, 13);
NeverLose.RegisiteryColor = {};
NeverLose.NameRegisitry = {};
NeverLose.IsMosueOverOtherFrame = false;
NeverLose.GlobalLogo = "rbxassetid://120358385035996";
NeverLose.ImageColorMapping = "rbxassetid://4155801252";

if getcustomasset then
	local link = "https://github.com/4lpaca-pin/NeverLose/blob/main/assets/%s?raw=true";
	local dir = 'NLAssets';

	if not isfolder(dir) then
		makefolder(dir);
	end;

	pcall(function()
		if not isfile(dir..'/'..'logo.png') then
			local byte = game:HttpGet(string.format(link,'logo.png'));

			writefile(dir..'/'..'logo.png' , byte);
			task.wait();
		end;

		if isfile(dir..'/'..'logo.png') then
			NeverLose.GlobalLogo = getcustomasset(dir..'/'..'logo.png')
		end;
	end);

	pcall(function()
		if not isfile(dir..'/'..'saturation_value_gradient.png') then
			local byte = game:HttpGet(string.format(link,'saturation_value_gradient.png'));

			writefile(dir..'/'..'saturation_value_gradient.png' , byte);
			task.wait();
		end;

		if isfile(dir..'/'..'saturation_value_gradient.png') then
			NeverLose.ImageColorMapping = getcustomasset(dir..'/'..'saturation_value_gradient.png')
		end;
	end);
end;

function NeverLose:AddSignal(RBXSignal)
	if NeverLose.UnloadEnabled then
		table.insert(NeverLose.GlobalSignals,RBXSignal);
	end;

	return RBXSignal;
end;

function NeverLose:AddQuery(ItemRoot: Frame , Name : string)
	table.insert(NeverLose.NameRegisitry , {
		Root = ItemRoot,
		Idx = Name,
	});
end;

function Encryption.new(data: string)
	local bytes = {};
	local encrypt_seed = ((#data + 3782) % 111) + 1;

	string.gsub(data , '.', LPH_NO_VIRTUALIZE(function(dt)
		table.insert(bytes , tostring(dt:byte() + encrypt_seed));
	end));

	local concatbyte = table.concat(bytes,'?');

	table.clear(bytes);

	return "{"..tostring(encrypt_seed + 72667).."}?"..concatbyte;
end;

function Encryption.reverse(data: string)
	local main_data = string.split(data,'?');
	local seed_str = main_data[1]:gsub('{',''):gsub('}','');
	local seed = tonumber(seed_str) or 0;

	local ks = {};
	local real_seed = seed - 72667;

	for i,v in next , main_data do
		if i > 1 then
			local fake_byte = tonumber(v);
			table.insert(ks , string.char(fake_byte - real_seed))	
		end;
	end;

	local data = table.concat(ks);

	table.clear(ks);

	return data;
end;

do
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

	NeverLose.Base64Encode = LPH_NO_VIRTUALIZE(function(data)
		return ((data:gsub('.', function(x) 
			local r,b='',x:byte()
			for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
			return r;
		end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
			if (#x < 6) then return '' end
			local c=0
			for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
			return b:sub(c+1,c+1)
		end)..({ '', '==', '=' })[#data%3+1])
	end);

	NeverLose.Base64Decode = LPH_NO_VIRTUALIZE(function(data)
		data = string.gsub(data, '[^'..b..'=]', '')
		return (data:gsub('.', function(x)
			if (x == '=') then return '' end
			local r,f='',(b:find(x)-1)
			for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
			return r;
		end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
			if (#x ~= 8) then return '' end
			local c=0
			for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
			return string.char(c)
		end))
	end);
end;

NeverLose.LoadIcon = LPH_NO_VIRTUALIZE(function()
	NeverLose.RobloxIcon = {
		["3d-cube-arrow-left"] = "3d-cube-arrow-left",
		["amazon"] = "amazon",
		["arm-left"] = "arm-left",
		["arm-right"] = "arm-right",
		["arrow-curl-to-left"] = "arrow-curl-to-left",
		["arrow-curl-to-right"] = "arrow-curl-to-right",
		["arrow-down-to-line"] = "arrow-down-to-line",
		["arrow-large-down"] = "arrow-large-down",
		["arrow-large-left"] = "arrow-large-left",
		["arrow-large-right"] = "arrow-large-right",
		["arrow-large-up"] = "arrow-large-up",
		["arrow-right-from-portrait-rectangle"] = "arrow-right-from-portrait-rectangle",
		["arrow-right-to-portrait-rectangle"] = "arrow-right-to-portrait-rectangle",
		["arrow-rotate-down-dashed"] = "arrow-rotate-down-dashed",
		["arrow-rotate-right"] = "arrow-rotate-right",
		["arrow-rotate-right-dashed"] = "arrow-rotate-right-dashed",
		["arrow-small-down"] = "arrow-small-down",
		["arrow-small-left"] = "arrow-small-left",
		["arrow-small-right"] = "arrow-small-right",
		["arrow-small-up"] = "arrow-small-up",
		["arrow-spin-clockwise"] = "arrow-spin-clockwise",
		["arrow-spin-clockwise-10"] = "arrow-spin-clockwise-10",
		["arrow-spin-clockwise-15"] = "arrow-spin-clockwise-15",
		["arrow-spin-clockwise-30"] = "arrow-spin-clockwise-30",
		["arrow-spin-counter-clockwise-10"] = "arrow-spin-counter-clockwise-10",
		["arrow-spin-counter-clockwise-15"] = "arrow-spin-counter-clockwise-15",
		["arrow-spin-counter-clockwise-30"] = "arrow-spin-counter-clockwise-30",
		["arrow-thick-to-left"] = "arrow-thick-to-left",
		["arrow-thick-to-right"] = "arrow-thick-to-right",
		["arrow-up-from-landscape-rectangle"] = "arrow-up-from-landscape-rectangle",
		["arrow-up-right-from-square"] = "arrow-up-right-from-square",
		["arrow-wide-short-down"] = "arrow-wide-short-down",
		["arrow-wide-short-left"] = "arrow-wide-short-left",
		["arrow-wide-short-right"] = "arrow-wide-short-right",
		["arrow-wide-short-up"] = "arrow-wide-short-up",
		["arrows-small-directional"] = "arrows-small-directional",
		["audio-wave-dotted-line"] = "audio-wave-dotted-line",
		["backpack"] = "backpack",
		["beard"] = "beard",
		["bell"] = "bell",
		["bell-clock"] = "bell-clock",
		["bell-plus"] = "bell-plus",
		["bell-slash"] = "bell-slash",
		["belt"] = "belt",
		["binoculars"] = "binoculars",
		["book-closed"] = "book-closed",
		["bookmark"] = "bookmark",
		["bow-tie"] = "bow-tie",
		["building-store"] = "building-store",
		["bullet-flying"] = "bullet-flying",
		["butterfly-wings"] = "butterfly-wings",
		["calendar"] = "calendar",
		["calendar-plus"] = "calendar-plus",
		["calendar-star"] = "calendar-star",
		["camera-small"] = "camera-small",
		["caret-small-down"] = "caret-small-down",
		["caret-small-left"] = "caret-small-left",
		["caret-small-right"] = "caret-small-right",
		["caret-small-up"] = "caret-small-up",
		["chain-link"] = "chain-link",
		["chart-four-vertical-bars"] = "chart-four-vertical-bars",
		["chart-line"] = "chart-line",
		["chart-pie"] = "chart-pie",
		["chart-scatter-plot"] = "chart-scatter-plot",
		["chart-three-vertical-bars"] = "chart-three-vertical-bars",
		["check"] = "check",
		["check-large"] = "check-large",
		["check-small"] = "check-small",
		["chevron-large-down"] = "chevron-large-down",
		["chevron-large-down-to-line"] = "chevron-large-down-to-line",
		["chevron-large-left"] = "chevron-large-left",
		["chevron-large-left-to-line"] = "chevron-large-left-to-line",
		["chevron-large-right"] = "chevron-large-right",
		["chevron-large-right-to-line"] = "chevron-large-right-to-line",
		["chevron-large-up"] = "chevron-large-up",
		["chevron-large-up-to-line"] = "chevron-large-up-to-line",
		["chevron-small-down"] = "chevron-small-down",
		["chevron-small-down-to-line"] = "chevron-small-down-to-line",
		["chevron-small-left"] = "chevron-small-left",
		["chevron-small-left-to-line"] = "chevron-small-left-to-line",
		["chevron-small-right"] = "chevron-small-right",
		["chevron-small-right-to-line"] = "chevron-small-right-to-line",
		["chevron-small-up"] = "chevron-small-up",
		["chevron-small-up-to-line"] = "chevron-small-up-to-line",
		["circle-check"] = "circle-check",
		["circle-i"] = "circle-i",
		["circle-minus"] = "circle-minus",
		["circle-person"] = "circle-person",
		["circle-person-three-horizontal-bars-wrapping-right"] = "circle-person-three-horizontal-bars-wrapping-right",
		["circle-play"] = "circle-play",
		["circle-plus"] = "circle-plus",
		["circle-question"] = "circle-question",
		["circle-slash"] = "circle-slash",
		["circle-star"] = "circle-star",
		["circle-three-dots-horizontal"] = "circle-three-dots-horizontal",
		["circle-three-dots-vertical"] = "circle-three-dots-vertical",
		["circle-x"] = "circle-x",
		["clock"] = "clock",
		["clock-dashed"] = "clock-dashed",
		["clock-spin-reverse"] = "clock-spin-reverse",
		["clock-spin-reverse-dashed"] = "clock-spin-reverse-dashed",
		["clothes-hanger"] = "clothes-hanger",
		["cloud"] = "cloud",
		["cloud-arrow-down"] = "cloud-arrow-down",
		["code"] = "code",
		["compact-makeup-brush"] = "compact-makeup-brush",
		["compass"] = "compass",
		["controller-with-cog"] = "controller-with-cog",
		["crop"] = "crop",
		["crosshairs"] = "crosshairs",
		["crosshairs-slash"] = "crosshairs-slash",
		["cube-vertexes"] = "cube-vertexes",
		["curved-rectangle-megaphone"] = "curved-rectangle-megaphone",
		["diagonal-line-pattern"] = "diagonal-line-pattern",
		["diagonal-line-pattern-sticker"] = "diagonal-line-pattern-sticker",
		["diamond-simplified"] = "diamond-simplified",
		["discord"] = "discord",
		["disguise-nose-glasses"] = "disguise-nose-glasses",
		["document-circle-slash"] = "document-circle-slash",
		["document-list-heart"] = "document-list-heart",
		["door-open-arrow-to-bottom-right"] = "door-open-arrow-to-bottom-right",
		["dress"] = "dress",
		["dual-arrows-horizontal"] = "dual-arrows-horizontal",
		["dual-arrows-to-corners"] = "dual-arrows-to-corners",
		["dual-arrows-vertical"] = "dual-arrows-vertical",
		["envelope"] = "envelope",
		["eraser"] = "eraser",
		["eye"] = "eye",
		["eye-slash"] = "eye-slash",
		["eye-with-eyeliner"] = "eye-with-eyeliner",
		["eyebrows"] = "eyebrows",
		["eyelashes"] = "eyelashes",
		["face-winking"] = "face-winking",
		["facebook"] = "facebook",
		["file-box"] = "file-box",
		["fingerprint"] = "fingerprint",
		["flag"] = "flag",
		["flame"] = "flame",
		["folder"] = "folder",
		["fountain-pen-nib"] = "fountain-pen-nib",
		["four-bars-horizontal-center-aligned"] = "four-bars-horizontal-center-aligned",
		["four-bars-horizontal-chevron-left"] = "four-bars-horizontal-chevron-left",
		["four-bars-horizontal-chevron-right"] = "four-bars-horizontal-chevron-right",
		["four-bars-horizontal-justified-aligned"] = "four-bars-horizontal-justified-aligned",
		["four-bars-horizontal-left-aligned"] = "four-bars-horizontal-left-aligned",
		["four-bars-horizontal-right-aligned"] = "four-bars-horizontal-right-aligned",
		["frame-bubble-slash"] = "frame-bubble-slash",
		["frame-bubble-soundwave"] = "frame-bubble-soundwave",
		["frame-camera"] = "frame-camera",
		["frame-camera-center"] = "frame-camera-center",
		["frame-collapsed"] = "frame-collapsed",
		["frame-corners"] = "frame-corners",
		["frame-expanded"] = "frame-expanded",
		["frame-face"] = "frame-face",
		["frame-person-torso"] = "frame-person-torso",
		["frame-record"] = "frame-record",
		["frame-single-bar-horizontal"] = "frame-single-bar-horizontal",
		["frame-soundwave"] = "frame-soundwave",
		["frame-video-camera"] = "frame-video-camera",
		["gear"] = "gear",
		["generic-dpad"] = "generic-dpad",
		["gift-box"] = "gift-box",
		["gift-card"] = "gift-card",
		["glasses"] = "glasses",
		["globe-detailed"] = "globe-detailed",
		["globe-simplified"] = "globe-simplified",
		["globe-simplipfied-speech-bubble"] = "globe-simplipfied-speech-bubble",
		["grid"] = "grid",
		["guilded"] = "guilded",
		["hack-week"] = "hack-week",
		["hammer-code"] = "hammer-code",
		["hand-curved-arrow-left"] = "hand-curved-arrow-left",
		["hand-dual-arrows"] = "hand-dual-arrows",
		["hand-ellipse"] = "hand-ellipse",
		["hand-half-ellipse"] = "hand-half-ellipse",
		["hand-two-arrows-horizontal"] = "hand-two-arrows-horizontal",
		["hashtag"] = "hashtag",
		["hat-fedora"] = "hat-fedora",
		["hat-toque"] = "hat-toque",
		["head-blank"] = "head-blank",
		["head-blush"] = "head-blush",
		["head-female"] = "head-female",
		["head-freckles"] = "head-freckles",
		["head-lips"] = "head-lips",
		["head-male"] = "head-male",
		["headphones"] = "headphones",
		["headphones-arrow-up"] = "headphones-arrow-up",
		["headphones-arrow-up-lock"] = "headphones-arrow-up-lock",
		["headphones-slash"] = "headphones-slash",
		["headphones-x"] = "headphones-x",
		["headphones-x-lock"] = "headphones-x-lock",
		["heart"] = "heart",
		["house"] = "house",
		["image"] = "image",
		["image-stacked"] = "image-stacked",
		["instagram"] = "instagram",
		["jacket"] = "jacket",
		["key"] = "key",
		["key-alt"] = "key-alt",
		["key-apostrophe"] = "key-apostrophe",
		["key-arrow-down"] = "key-arrow-down",
		["key-arrow-right"] = "key-arrow-right",
		["key-arrow-up"] = "key-arrow-up",
		["key-asterisk"] = "key-asterisk",
		["key-backspace"] = "key-backspace",
		["key-caps-lock"] = "key-caps-lock",
		["key-caret"] = "key-caret",
		["key-comma"] = "key-comma",
		["key-command"] = "key-command",
		["key-control"] = "key-control",
		["key-grave-accent"] = "key-grave-accent",
		["key-period"] = "key-period",
		["key-return"] = "key-return",
		["key-shift"] = "key-shift",
		["key-space"] = "key-space",
		["key-tab"] = "key-tab",
		["language-characters"] = "language-characters",
		["leg-left"] = "leg-left",
		["leg-right"] = "leg-right",
		["lightning-bolt"] = "lightning-bolt",
		["linkedin"] = "linkedin",
		["lips"] = "lips",
		["lipstick"] = "lipstick",
		["list-bulleted"] = "list-bulleted",
		["location-pin"] = "location-pin",
		["location-pin-map"] = "location-pin-map",
		["lock-closed"] = "lock-closed",
		["lollipop"] = "lollipop",
		["magnifying-glass"] = "magnifying-glass",
		["magnifying-glass-minus"] = "magnifying-glass-minus",
		["magnifying-glass-plus"] = "magnifying-glass-plus",
		["mascara"] = "mascara",
		["megaphone"] = "megaphone",
		["memory-card"] = "memory-card",
		["messenger"] = "messenger",
		["microphone"] = "microphone",
		["microphone-slash"] = "microphone-slash",
		["microphone-text-box"] = "microphone-text-box",
		["microphone-triangle-exclamation"] = "microphone-triangle-exclamation",
		["minus"] = "minus",
		["minus-small"] = "minus-small",
		["mirror-standing"] = "mirror-standing",
		["moments"] = "moments",
		["moon"] = "moon",
		["mouse-button-left"] = "mouse-button-left",
		["mouse-button-right"] = "mouse-button-right",
		["mouse-scrollwheel"] = "mouse-scrollwheel",
		["music-note"] = "music-note",
		["nebula"] = "nebula",
		["necklace"] = "necklace",
		["nine-dots-grid"] = "nine-dots-grid",
		["ninja"] = "ninja",
		["nose"] = "nose",
		["page"] = "page",
		["paint-brush"] = "paint-brush",
		["paint-bucket"] = "paint-bucket",
		["pants"] = "pants",
		["pants-2d-text"] = "pants-2d-text",
		["paper-airplane"] = "paper-airplane",
		["parrot"] = "parrot",
		["pause-large"] = "pause-large",
		["pause-small"] = "pause-small",
		["pencil"] = "pencil",
		["pencil-square"] = "pencil-square",
		["person"] = "person",
		["person-arrow-from-bottom-right"] = "person-arrow-from-bottom-right",
		["person-check"] = "person-check",
		["person-circle-slash"] = "person-circle-slash",
		["person-climbing"] = "person-climbing",
		["person-clock"] = "person-clock",
		["person-falling"] = "person-falling",
		["person-graduate"] = "person-graduate",
		["person-jumping"] = "person-jumping",
		["person-magnifying-glass"] = "person-magnifying-glass",
		["person-photo-camera"] = "person-photo-camera",
		["person-play"] = "person-play",
		["person-play-clock"] = "person-play-clock",
		["person-plus"] = "person-plus",
		["person-racing"] = "person-racing",
		["person-running"] = "person-running",
		["person-standing"] = "person-standing",
		["person-standing-arrow-reverse"] = "person-standing-arrow-reverse",
		["person-standing-dual-arrows-vertical"] = "person-standing-dual-arrows-vertical",
		["person-standing-gear"] = "person-standing-gear",
		["person-swimming"] = "person-swimming",
		["person-teleport"] = "person-teleport",
		["person-trash-can"] = "person-trash-can",
		["person-walking"] = "person-walking",
		["person-with-smaller-person"] = "person-with-smaller-person",
		["phone"] = "phone",
		["phone-down"] = "phone-down",
		["phone-plus"] = "phone-plus",
		["phone-volume"] = "phone-volume",
		["phone-x"] = "phone-x",
		["photo-camera"] = "photo-camera",
		["photo-camera-face"] = "photo-camera-face",
		["photo-camera-slash"] = "photo-camera-slash",
		["picture-in-picture"] = "picture-in-picture",
		["pig"] = "pig",
		["pin"] = "pin",
		["pin-slash"] = "pin-slash",
		["play-large"] = "play-large",
		["play-small"] = "play-small",
		["plus-large"] = "plus-large",
		["plus-small"] = "plus-small",
		["premium"] = "premium",
		["ps-circle"] = "ps-circle",
		["ps-dpad-down"] = "ps-dpad-down",
		["ps-dpad-left"] = "ps-dpad-left",
		["ps-dpad-right"] = "ps-dpad-right",
		["ps-dpad-up"] = "ps-dpad-up",
		["ps-l1"] = "ps-l1",
		["ps-l2"] = "ps-l2",
		["ps-l3"] = "ps-l3",
		["ps-r1"] = "ps-r1",
		["ps-r2"] = "ps-r2",
		["ps-r3"] = "ps-r3",
		["ps-square"] = "ps-square",
		["ps-stick-left"] = "ps-stick-left",
		["ps-stick-right"] = "ps-stick-right",
		["ps-triagle"] = "ps-triagle",
		["ps-x"] = "ps-x",
		["ps4-options"] = "ps4-options",
		["ps4-share"] = "ps4-share",
		["ps4-touchpad"] = "ps4-touchpad",
		["ps5-options"] = "ps5-options",
		["ps5-share"] = "ps5-share",
		["ps5-touchpad"] = "ps5-touchpad",
		["pumpkin"] = "pumpkin",
		["purse"] = "purse",
		["rectangle-list"] = "rectangle-list",
		["rectangle-numbers-counting"] = "rectangle-numbers-counting",
		["rectangle-person-with-three-horizontal-lines"] = "rectangle-person-with-three-horizontal-lines",
		["robux"] = "robux",
		["rosette-seven-point"] = "rosette-seven-point",
		["rosette-ten-point"] = "rosette-ten-point",
		["seven-point-rosette"] = "seven-point-rosette",
		["shield-check"] = "shield-check",
		["shield-lock"] = "shield-lock",
		["shirt"] = "shirt",
		["shirt-2d-text"] = "shirt-2d-text",
		["shirt-pants"] = "shirt-pants",
		["shoe-left"] = "shoe-left",
		["shoe-right"] = "shoe-right",
		["shopping-basket"] = "shopping-basket",
		["shopping-basket-check"] = "shopping-basket-check",
		["shopping-cart"] = "shopping-cart",
		["shorts"] = "shorts",
		["sidebar"] = "sidebar",
		["signal-exclamation"] = "signal-exclamation",
		["six-dots-two-column-grid"] = "six-dots-two-column-grid",
		["skip-end-large"] = "skip-end-large",
		["skip-end-small"] = "skip-end-small",
		["skip-next-large"] = "skip-next-large",
		["skip-next-small"] = "skip-next-small",
		["skip-previous-large"] = "skip-previous-large",
		["skip-previous-small"] = "skip-previous-small",
		["skip-start-large"] = "skip-start-large",
		["skip-start-small"] = "skip-start-small",
		["smartphone-portrait"] = "smartphone-portrait",
		["speaker"] = "speaker",
		["speaker-slash"] = "speaker-slash",
		["speaker-triangle-exclamation"] = "speaker-triangle-exclamation",
		["speaker-x"] = "speaker-x",
		["speech-bubble-align-center"] = "speech-bubble-align-center",
		["speech-bubble-align-left"] = "speech-bubble-align-left",
		["speech-bubble-exclamation"] = "speech-bubble-exclamation",
		["speech-bubble-round"] = "speech-bubble-round",
		["square-bone"] = "square-bone",
		["square-books"] = "square-books",
		["square-check"] = "square-check",
		["square-code"] = "square-code",
		["square-dashed-person-standing"] = "square-dashed-person-standing",
		["square-dual-arrows-horizontal"] = "square-dual-arrows-horizontal",
		["square-dual-arrows-to-corner"] = "square-dual-arrows-to-corner",
		["square-face-sound"] = "square-face-sound",
		["square-face-waving-hand"] = "square-face-waving-hand",
		["square-face-winking"] = "square-face-winking",
		["square-minus"] = "square-minus",
		["square-person"] = "square-person",
		["squares-grid-plus"] = "squares-grid-plus",
		["squares-grid-qr"] = "squares-grid-qr",
		["stacked-squares-arrow-down-left"] = "stacked-squares-arrow-down-left",
		["stacked-squares-arrow-up-right"] = "stacked-squares-arrow-up-right",
		["stacked-squares-plus"] = "stacked-squares-plus",
		["star"] = "star",
		["stop-large"] = "stop-large",
		["stop-small"] = "stop-small",
		["studio"] = "studio",
		["sun"] = "sun",
		["sweater"] = "sweater",
		["sword"] = "sword",
		["tag-sparkle"] = "tag-sparkle",
		["teletype"] = "teletype",
		["tencent-qq"] = "tencent-qq",
		["text-b-bold"] = "text-b-bold",
		["text-box-microphone"] = "text-box-microphone",
		["text-h-subscript-1"] = "text-h-subscript-1",
		["text-h-subscript-2"] = "text-h-subscript-2",
		["text-h-subscript-3"] = "text-h-subscript-3",
		["text-i-italic"] = "text-i-italic",
		["text-s-strikethrough"] = "text-s-strikethrough",
		["text-u-underline"] = "text-u-underline",
		["text-uppercase-a-lowercase-a"] = "text-uppercase-a-lowercase-a",
		["text-x-subscript-2"] = "text-x-subscript-2",
		["text-x-superscript-2"] = "text-x-superscript-2",
		["three-bars-horizontal"] = "three-bars-horizontal",
		["three-bars-horizontal-chevron-left"] = "three-bars-horizontal-chevron-left",
		["three-bars-horizontal-narrowing"] = "three-bars-horizontal-narrowing",
		["three-bars-horizontal-triangles-vertical"] = "three-bars-horizontal-triangles-vertical",
		["three-bars-vertical-triangles-horizontal"] = "three-bars-vertical-triangles-horizontal",
		["three-chevrons-enlarging-down"] = "three-chevrons-enlarging-down",
		["three-chevrons-enlarging-up"] = "three-chevrons-enlarging-up",
		["three-dots-horizontal"] = "three-dots-horizontal",
		["three-dots-vertical"] = "three-dots-vertical",
		["three-horizontal-bars-wrapping-right"] = "three-horizontal-bars-wrapping-right",
		["three-people"] = "three-people",
		["three-ring-note"] = "three-ring-note",
		["three-sliders-horizontal"] = "three-sliders-horizontal",
		["three-stacked-squares-tilted"] = "three-stacked-squares-tilted",
		["thumb-down"] = "thumb-down",
		["thumb-up"] = "thumb-up",
		["tik-tok"] = "tik-tok",
		["tilt"] = "tilt",
		["torso"] = "torso",
		["trash-can"] = "trash-can",
		["triangle-exclamation"] = "triangle-exclamation",
		["trophy"] = "trophy",
		["tshirt"] = "tshirt",
		["tshirt-2d-text"] = "tshirt-2d-text",
		["tshirt-dual-arrows"] = "tshirt-dual-arrows",
		["twitch"] = "twitch",
		["twitter"] = "twitter",
		["two-arrows-down-and-up"] = "two-arrows-down-and-up",
		["two-arrows-from-center"] = "two-arrows-from-center",
		["two-arrows-left-right"] = "two-arrows-left-right",
		["two-arrows-loop-clockwise"] = "two-arrows-loop-clockwise",
		["two-arrows-loop-clockwise-1"] = "two-arrows-loop-clockwise-1",
		["two-arrows-loop-clockwise-infinity"] = "two-arrows-loop-clockwise-infinity",
		["two-arrows-spin-clockwise"] = "two-arrows-spin-clockwise",
		["two-arrows-spin-clockwise-plus"] = "two-arrows-spin-clockwise-plus",
		["two-arrows-switch-right"] = "two-arrows-switch-right",
		["two-arrows-to-center"] = "two-arrows-to-center",
		["two-folders"] = "two-folders",
		["two-location-pins-connecting-arrow"] = "two-location-pins-connecting-arrow",
		["two-makeup-brushes"] = "two-makeup-brushes",
		["two-people"] = "two-people",
		["two-people-speech-bubble"] = "two-people-speech-bubble",
		["two-stacked-squares"] = "two-stacked-squares",
		["two-switches-horizontal"] = "two-switches-horizontal",
		["verified-backplate"] = "verified-backplate",
		["verified-check"] = "verified-check",
		["verified-mono"] = "verified-mono",
		["video-camera"] = "video-camera",
		["video-camera-arrow-to-bottom-left"] = "video-camera-arrow-to-bottom-left",
		["video-camera-arrow-to-top-right"] = "video-camera-arrow-to-top-right",
		["video-camera-slash"] = "video-camera-slash",
		["video-camera-triangle-exclamation"] = "video-camera-triangle-exclamation",
		["video-camera-x"] = "video-camera-x",
		["wallet"] = "wallet",
		["we-chat"] = "we-chat",
		["whatsapp"] = "whatsapp",
		["x"] = "x",
		["x-small"] = "x-small",
		["xbox-a"] = "xbox-a",
		["xbox-a-pressed"] = "xbox-a-pressed",
		["xbox-a-unpressed"] = "xbox-a-unpressed",
		["xbox-b"] = "xbox-b",
		["xbox-dpad"] = "xbox-dpad",
		["xbox-dpad-down"] = "xbox-dpad-down",
		["xbox-dpad-left"] = "xbox-dpad-left",
		["xbox-dpad-right"] = "xbox-dpad-right",
		["xbox-dpad-up"] = "xbox-dpad-up",
		["xbox-lb"] = "xbox-lb",
		["xbox-lt"] = "xbox-lt",
		["xbox-menu"] = "xbox-menu",
		["xbox-rb"] = "xbox-rb",
		["xbox-rt"] = "xbox-rt",
		["xbox-stick-left"] = "xbox-stick-left",
		["xbox-stick-left-directional"] = "xbox-stick-left-directional",
		["xbox-stick-left-horizontal"] = "xbox-stick-left-horizontal",
		["xbox-stick-left-vertical"] = "xbox-stick-left-vertical",
		["xbox-stick-right"] = "xbox-stick-right",
		["xbox-stick-right-directional"] = "xbox-stick-right-directional",
		["xbox-stick-right-horizontal"] = "xbox-stick-right-horizontal",
		["xbox-stick-right-vertical"] = "xbox-stick-right-vertical",
		["xbox-view"] = "xbox-view",
		["xbox-x"] = "xbox-x",
		["xbox-y"] = "xbox-y",
		["xr-headset"] = "xr-headset",
		["youtube"] = "youtube"
	};
end);

NeverLose.IsMouseOverFrame = LPH_NO_VIRTUALIZE(function(self , Frame)
	if not Frame then
		return;
	end;

	if NeverLose.Global3DRenderMode then
		if Frame.GuiState == Enum.GuiState.Hover or Frame.GuiState == Enum.GuiState.Press then
			return true;
		end;

		return false;
	end;

	local AbsPos: Vector2, AbsSize: Vector2 = Frame.AbsolutePosition, Frame.AbsoluteSize;

	if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then
		return true;
	end;
end);

NeverLose.CreateSignal = LPH_NO_VIRTUALIZE(function(self , DefaultValue)
	local __cache = Instance.new('BindableEvent');
	local bind = {
		Value = DefaultValue,
		__event = __cache
	};

	function bind:GetValue()
		return bind.Value;
	end;

	function bind:SetValue(f)
		bind.Value = f;

		return __cache:Fire(f);
	end;

	function bind:Connect(f)
		local signal = __cache.Event:Connect(f);

		NeverLose:AddSignal(signal);

		return signal;
	end;

	return bind;
end);

NeverLose.SetIconMode = LPH_NO_VIRTUALIZE(function(self , Label: TextLabel , Icon: string)
	local useBold = string.lower(string.sub(Icon , -5)) == '-bold';

	if useBold then
		Label.Text = Icon:sub(1,-6);
		Label.FontFace = NeverLose.BuiltInBold;
	else
		Label.Text = Icon;
		Label.FontFace = NeverLose.BuiltInRegular;
	end;
end);

function NeverLose:GetIconFont(icon: string)
	local useBold = string.lower(string.sub(icon , -5)) == '-bold';

	if useBold then
		return NeverLose.BuiltInBold;
	end;

	return NeverLose.BuiltInRegular;
end;

function NeverLose:MoreThanHalfY(Value: number)
	return (NeverLose.ScreenGui.AbsoluteSize.Y / 2) < Value
end;

NeverLose.IsStudio = RunService:IsStudio();
NeverLose.IsMobile = UserInputService.TouchEnabled;

NeverLose.CreateInput = LPH_NO_VIRTUALIZE(function(self , Frame , Callback)
	local Button = Instance.new('ImageButton',Frame);

	Button.ZIndex = Frame.ZIndex + 10;
	Button.Size = UDim2.fromScale(1,1);
	Button.BackgroundTransparency = 1;
	Button.ImageTransparency = 1;
	Button.Image = "rbxasset://textuers/translateIcon.png";

	if Callback then
		local bth_signal = Button.MouseButton1Click:Connect(Callback);

		return Button , bth_signal;
	end;

	return Button;
end);

NeverLose.PlayAnimate = LPH_NO_VIRTUALIZE(function(Self , Info , Property)
	local Tween = TweenService:Create(Self , Info or TweenInfo.new(0.25) , Property);

	Tween:Play();

	return Tween;
end);

NeverLose.Drag = LPH_NO_VIRTUALIZE(function(InputFrame: Frame, MoveFrame: Frame, Speed : number)
	local dragToggle: boolean = false;
	local dragStart: Vector3 = nil;
	local startPos: UDim2 = nil;
	local Tween = TweenInfo.new(Speed);

	local updateInput = function(input)
		local delta = input.Position - dragStart;
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y);

		if NeverLose.Global3DRenderMode then
			NeverLose.PlayAnimate(MoveFrame,Tween,{
				Position = UDim2.fromScale(0.5,0.5)
			});
		else
			NeverLose.PlayAnimate(MoveFrame,Tween,{
				Position = position
			});
		end;
	end;

	NeverLose:AddSignal(InputFrame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true;
			dragStart = input.Position;
			startPos = MoveFrame.Position;

			local input_end;
			input_end = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false;

					input_end:Disconnect();
				end
			end)
		end
	end));

	NeverLose:AddSignal(UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end));
end);

NeverLose.Rounding = LPH_NO_VIRTUALIZE(function(num, numDecimalPlaces)
	local mult = 10 ^ (numDecimalPlaces or 0);
	return math.floor(num * mult + 0.5) / mult;
end);

NeverLose.ProcessParams = LPH_NO_VIRTUALIZE(function(self , Params , Fixed)
	Params = Params or {};

	local k = Params or {};

	for i,v in next , Fixed do
		k[i] = Params[i] or v;
	end;

	table.clear(Fixed);

	return k;
end);

NeverLose.EnabledBlur = true;
NeverLose.BlurModuleParent = workspace.CurrentCamera;

NeverLose.GetCalculatePosition = LPH_NO_VIRTUALIZE(function(planePos, planeNormal, rayOrigin, rayDirection)
	local n = planeNormal;
	local d = rayDirection;
	local v = rayOrigin - planePos;

	local num = (n.x * v.x) + (n.y * v.y) + (n.z * v.z);
	local den = (n.x * d.x) + (n.y * d.y) + (n.z * d.z);
	local a = -num / den;

	return rayOrigin + (a * rayDirection);
end);

NeverLose.CreateBlurModule = LPH_NO_VIRTUALIZE(function(self , Frame , Signal)
	if not NeverLose.EnabledBlur then
		return NeverLose:AddSignal(Instance.new('BindableEvent').Event:Connect(function() return "nl"; end));	
	end;

	local Part = Instance.new('Part',NeverLose.BlurModuleParent);
	local DepthOfField = Instance.new('DepthOfFieldEffect',cloneref(game:GetService('Lighting')));
	local BlockMesh = Instance.new("BlockMesh");

	BlockMesh.Parent = Part;

	Part.Material = Enum.Material.Glass;
	Part.Transparency = 1;
	Part.Reflectance = 1;
	Part.CastShadow = false;
	Part.Anchored = true;
	Part.CanCollide = false;
	Part.CanQuery = false;
	Part.CollisionGroup = NeverLose.RandomString();
	Part.Size = Vector3.new(1, 1, 1) * 0.01;
	Part.Color = Color3.fromRGB(0,0,0);

	DepthOfField.Enabled = true;
	DepthOfField.FarIntensity = 0;
	DepthOfField.FocusDistance = 0;
	DepthOfField.InFocusRadius = 1000;
	DepthOfField.NearIntensity = 1;
	DepthOfField.Name = NeverLose.RandomString();

	Part.Name = NeverLose.RandomString();

	local disconnect;

	local UpdateFunction = function()
		local IsWindowActive = Signal:GetValue();

		if IsWindowActive and not NeverLose.Global3DRenderMode then

			NeverLose.PlayAnimate(DepthOfField,TweenInfo.new(0.1),{
				NearIntensity = 1
			})

			NeverLose.PlayAnimate(Part,TweenInfo.new(0.1),{
				Transparency = 0.97,
				Size = Vector3.new(1, 1, 1) * 0.01;
			})

			Part.Parent = NeverLose.BlurModuleParent;
		else
			NeverLose.PlayAnimate(DepthOfField,TweenInfo.new(0.1),{
				NearIntensity = 0
			})

			NeverLose.PlayAnimate(Part,TweenInfo.new(0.1),{
				Size = Vector3.zero,
				Transparency = 1.5,
			})

			Part.Parent = nil;

			return false;
		end;

		if IsWindowActive then
			local corner0 = Frame.AbsolutePosition;
			local corner1 = corner0 + Frame.AbsoluteSize;

			local ray0 = CurrentCamera.ScreenPointToRay(CurrentCamera,corner0.X, corner0.Y, 1);
			local ray1 = CurrentCamera.ScreenPointToRay(CurrentCamera,corner1.X, corner1.Y, 1);

			local planeOrigin = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * (0.05 - CurrentCamera.NearPlaneZ);

			local planeNormal = CurrentCamera.CFrame.LookVector;

			local pos0 = NeverLose.GetCalculatePosition(planeOrigin, planeNormal, ray0.Origin, ray0.Direction);
			local pos1 = NeverLose.GetCalculatePosition(planeOrigin, planeNormal, ray1.Origin, ray1.Direction);

			pos0 = CurrentCamera.CFrame:PointToObjectSpace(pos0);
			pos1 = CurrentCamera.CFrame:PointToObjectSpace(pos1);

			local size   = pos1 - pos0;
			local center = (pos0 + pos1) / 2;

			BlockMesh.Offset = center
			BlockMesh.Scale  = size / 0.0101;
			Part.CFrame = CurrentCamera.CFrame;
		end;
	end;

	local rbxsignal = NeverLose:AddSignal(CurrentCamera:GetPropertyChangedSignal('CFrame'):Connect(UpdateFunction))
	local loopThread = NeverLose:AddSignal(UserInputService.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			pcall(UpdateFunction);
		end;
	end));

	local THREAD = task.spawn(function()
		while true do task.wait(0.1)
			pcall(UpdateFunction);
		end;
	end);

	disconnect = function()
		rbxsignal:Disconnect();
		loopThread:Disconnect();
		task.cancel(THREAD);
		Part:Destroy();
		DepthOfField:Destroy();
	end;

	Frame.Destroying:Connect(disconnect);

	return rbxsignal;
end);

local EmptyFunction = function() end;

function NeverLose:RollingEffect(parent)
	local UIGradient = Instance.new("UIGradient")

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.4), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = parent

	return UIGradient;
end;

function NeverLose:CreateShadow(parent , RollingEffect)
	local Shadow = {};

	local UIShadowSafe85 = Instance.new("UIStroke")
	local UIShadowSafe65 = Instance.new("UIStroke")
	local UIShadowSafe50 = Instance.new("UIStroke")
	local UIShadowSafe45 = Instance.new("UIStroke")

	UIShadowSafe85.Thickness = 6.000
	UIShadowSafe85.Transparency = 1
	UIShadowSafe85.Parent = parent

	UIShadowSafe65.Thickness = 5.000
	UIShadowSafe65.Transparency = 1
	UIShadowSafe65.Parent = parent

	UIShadowSafe50.Thickness = 4.000
	UIShadowSafe50.Transparency = 1
	UIShadowSafe50.Parent = parent

	UIShadowSafe45.Thickness = 3.000
	UIShadowSafe45.Transparency = 1
	UIShadowSafe45.Parent = parent

	local RollingEffectThread;
	local r1,r2,r3,r4;

	if RollingEffect then
		r1 = NeverLose:RollingEffect(UIShadowSafe85);
		r2 = NeverLose:RollingEffect(UIShadowSafe65);
		r3 = NeverLose:RollingEffect(UIShadowSafe50);
		r4 = NeverLose:RollingEffect(UIShadowSafe45);
	end;

	Shadow.Render = LPH_NO_VIRTUALIZE(function(self , value)
		if RollingEffectThread then
			task.cancel(RollingEffectThread);
			RollingEffectThread = nil;
		end;

		if value then
			NeverLose.PlayAnimate(UIShadowSafe85 , SlowyTween , {
				Transparency = 0.900
			})

			NeverLose.PlayAnimate(UIShadowSafe65 , SlowyTween , {
				Transparency = 0.900
			})

			NeverLose.PlayAnimate(UIShadowSafe50 , SlowyTween , {
				Transparency = 0.900
			})

			NeverLose.PlayAnimate(UIShadowSafe45 , SlowyTween , {
				Transparency = 0.900
			})

			if RollingEffect then
				RollingEffectThread = task.spawn(function()
					local level = 20;
					while true do task.wait(0.025)
						NeverLose.PlayAnimate(r1 , SlowyTween , {
							Rotation = r1.Rotation + level
						});

						NeverLose.PlayAnimate(r2 , SlowyTween , {
							Rotation = r2.Rotation + level
						});

						NeverLose.PlayAnimate(r3 , SlowyTween , {
							Rotation = r3.Rotation + level
						});

						NeverLose.PlayAnimate(r4 , SlowyTween , {
							Rotation = r4.Rotation + level
						});
					end;
				end);
			end;
		else
			NeverLose.PlayAnimate(UIShadowSafe85 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(UIShadowSafe65 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(UIShadowSafe50 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(UIShadowSafe45 , SlowyTween , {
				Transparency = 1
			})
		end;
	end);

	return Shadow;
end;

function NeverLose:CreateOptionWindow(Frame: Frame , Zindex)
	Zindex = Zindex or 9;

	local Window = {
		Signal = NeverLose:CreateSignal(false),
	};

	local OptionHandler = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")
	local UIStroke = Instance.new("UIStroke")
	local shadow = NeverLose:CreateShadow(OptionHandler);

	OptionHandler.Name = NeverLose.RandomString();
	OptionHandler.Parent = NeverLose.ScreenGui
	OptionHandler.AnchorPoint = Vector2.new(0, 0)
	OptionHandler.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	OptionHandler.BackgroundTransparency = 0.035
	OptionHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionHandler.BorderSizePixel = 0
	OptionHandler.ClipsDescendants = true
	OptionHandler.Position = UDim2.new(255,255,255,255)
	OptionHandler.Size = UDim2.new(0, 220, 0, 75)
	OptionHandler.ZIndex = Zindex + 9

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = OptionHandler

	UIListLayout.Parent = OptionHandler
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = OptionHandler

	NeverLose:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
		NeverLose.PlayAnimate(OptionHandler , SlowyTween , {
			Size = UDim2.new(0, 220, 0, UIListLayout.AbsoluteContentSize.Y - 1)
		})
	end)));

	NeverLose:AddSignal(OptionHandler:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
		if OptionHandler.BackgroundTransparency > 0.9 then
			OptionHandler.Visible = false;
			UIListLayout.Parent = nil;
			OptionHandler.Parent = nil;
		else
			OptionHandler.Visible = true;
			UIListLayout.Parent = OptionHandler

			if NeverLose.Global3DRenderMode then
				OptionHandler.Parent = NeverLose.GlobalSurfaceGui;
			else
				OptionHandler.Parent = NeverLose.ScreenGui;
			end;
		end
	end)));

	local FollowingThread;
	local SetPosition = LPH_NO_VIRTUALIZE(function()
		if NeverLose:MoreThanHalfY(Frame.AbsolutePosition.Y + 65) then
			OptionHandler.AnchorPoint = Vector2.new(0,1)
		else
			OptionHandler.AnchorPoint = Vector2.new(0,0)
		end;

		OptionHandler.Position = UDim2.fromOffset(Frame.AbsolutePosition.X + 18 , Frame.AbsolutePosition.Y + 65);
	end);

	Window.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if FollowingThread then
			task.cancel(FollowingThread);
			FollowingThread = nil;
		end;

		if value then
			SetPosition();

			NeverLose.PlayAnimate(OptionHandler , SlowyTween , {
				BackgroundTransparency = 0.035
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			})

			shadow:Render(true);

			if NeverLose.Global3DRenderMode then
				OptionHandler.Parent = NeverLose.GlobalSurfaceGui;
			else
				OptionHandler.Parent = NeverLose.ScreenGui;
			end;

			FollowingThread = task.spawn(function()
				while true do task.wait()
					SetPosition();
				end
			end)
		else
			NeverLose.PlayAnimate(OptionHandler , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			shadow:Render(false);
		end;
	end);

	Window.SetRender(false);
	Window.Signal:Connect(Window.SetRender)

	local Payback = NeverLose:RegisiterItem(OptionHandler , Window.Signal);

	Payback.Winbdow = Window;
	Payback.Root = OptionHandler;
	Payback.Signal = Window.Signal;

	return Payback;
end;

function NeverLose:CreateColorPicker(HandleFrame: Frame)
	local ZIndex = HandleFrame.ZIndex;

	local ColorPickerLib = {};

	local ColorPickerHandler = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local SaViMap = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local ColorZoneSelection = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local ColorMap = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local UICorner_4 = Instance.new("UICorner")
	local ColorMapSelection = Instance.new("Frame")
	local UIStroke_3 = Instance.new("UIStroke")
	local UICorner_5 = Instance.new("UICorner")
	local RGBLabel = Instance.new("TextLabel")
	local UICorner_6 = Instance.new("UICorner")
	local Shadow = NeverLose:CreateShadow(ColorPickerHandler);

	ColorPickerHandler.Name = NeverLose.RandomString();
	ColorPickerHandler.Parent = NeverLose.ScreenGui
	ColorPickerHandler.AnchorPoint = Vector2.new(0, 0)
	ColorPickerHandler.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	ColorPickerHandler.BackgroundTransparency = 0.035
	ColorPickerHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorPickerHandler.BorderSizePixel = 0
	ColorPickerHandler.ClipsDescendants = true
	ColorPickerHandler.Position = UDim2.new(255, 0, 255, 20)
	ColorPickerHandler.Size = UDim2.new(0, 200, 0, 240)
	ColorPickerHandler.ZIndex = ZIndex + 125

	NeverLose:AddSignal(ColorPickerHandler:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
		if ColorPickerHandler.BackgroundTransparency > 0.9 then
			ColorPickerHandler.Visible = false;
			ColorPickerHandler.Parent = nil
		else
			ColorPickerHandler.Visible = true;

			if NeverLose.Global3DRenderMode then
				ColorPickerHandler.Parent = NeverLose.GlobalSurfaceGui;
			else
				ColorPickerHandler.Parent = NeverLose.ScreenGui;
			end;
		end;
	end)));

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = ColorPickerHandler

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = ColorPickerHandler

	SaViMap.Name = NeverLose.RandomString();
	SaViMap.Parent = ColorPickerHandler
	SaViMap.AnchorPoint = Vector2.new(0.5, 0)
	SaViMap.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	SaViMap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SaViMap.BorderSizePixel = 0
	SaViMap.Position = UDim2.new(0.5, 0, 0, 5)
	SaViMap.Size = UDim2.new(0, 185, 0, 185)
	SaViMap.ZIndex = ZIndex + 126
	SaViMap.Image = NeverLose.ImageColorMapping 


	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = SaViMap

	ColorZoneSelection.Name = NeverLose.RandomString();
	ColorZoneSelection.Parent = SaViMap
	ColorZoneSelection.AnchorPoint = Vector2.new(0.5, 0.5)
	ColorZoneSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorZoneSelection.BackgroundTransparency = 1.000
	ColorZoneSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorZoneSelection.BorderSizePixel = 0
	ColorZoneSelection.Position = UDim2.new(0.5, 0, 0.5, 0)
	ColorZoneSelection.Size = UDim2.new(0, 10, 0, 10)
	ColorZoneSelection.ZIndex = ZIndex + 127

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = ColorZoneSelection

	UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
	UIStroke_2.Parent = ColorZoneSelection

	ColorMap.Name = NeverLose.RandomString();
	ColorMap.Parent = ColorPickerHandler
	ColorMap.AnchorPoint = Vector2.new(0.5, 0)
	ColorMap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorMap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorMap.BorderSizePixel = 0
	ColorMap.Position = UDim2.new(0.5, 0, 0, 200)
	ColorMap.Size = UDim2.new(1, -15, 0, 10)
	ColorMap.ZIndex = ZIndex + 126

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 153, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(203, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(50, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 101, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(50, 0, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
	UIGradient.Parent = ColorMap

	UICorner_4.CornerRadius = UDim.new(0, 3)
	UICorner_4.Parent = ColorMap

	ColorMapSelection.Name = NeverLose.RandomString();
	ColorMapSelection.Parent = ColorMap
	ColorMapSelection.AnchorPoint = Vector2.new(0.5, 0.5)
	ColorMapSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorMapSelection.BackgroundTransparency = 1.000
	ColorMapSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorMapSelection.BorderSizePixel = 0
	ColorMapSelection.Position = UDim2.new(0, 0, 0.5, 0)
	ColorMapSelection.Size = UDim2.new(0, 5, 1, 0)
	ColorMapSelection.ZIndex = ZIndex + 126

	UIStroke_3.Thickness = 2.000
	UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
	UIStroke_3.Parent = ColorMapSelection

	UICorner_5.CornerRadius = UDim.new(0, 3)
	UICorner_5.Parent = ColorMapSelection

	RGBLabel.Name = NeverLose.RandomString();
	RGBLabel.Parent = ColorPickerHandler
	RGBLabel.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
	RGBLabel.BackgroundTransparency = 0.750
	RGBLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RGBLabel.BorderSizePixel = 0
	RGBLabel.Position = UDim2.new(0, 10, 0, 217)
	RGBLabel.Size = UDim2.new(1, -20, 0, 15)
	RGBLabel.ZIndex = ZIndex + 127
	RGBLabel.Font = Enum.Font.GothamBold
	RGBLabel.Text = "#FFFFFF"
	RGBLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	RGBLabel.TextSize = 12.000
	RGBLabel.TextTransparency = 0.400
	RGBLabel.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = RGBLabel

	ColorPickerLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			ColorPickerHandler.Position = UDim2.new(0,HandleFrame.AbsolutePosition.X + 20 , 0 ,HandleFrame.AbsolutePosition.Y + 75);

			NeverLose.PlayAnimate(ColorPickerHandler,SlowyTween , {
				BackgroundTransparency = 0.035
			})

			NeverLose.PlayAnimate(UIStroke,SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(SaViMap,SlowyTween , {
				BackgroundTransparency = 0,
				ImageTransparency = 0
			})

			NeverLose.PlayAnimate(UIStroke_2,SlowyTween , {
				Transparency = 0
			})

			NeverLose.PlayAnimate(ColorMap,SlowyTween , {
				BackgroundTransparency = 0
			})

			NeverLose.PlayAnimate(UIStroke_3,SlowyTween , {
				Transparency = 0
			})

			NeverLose.PlayAnimate(RGBLabel,SlowyTween , {
				BackgroundTransparency = 0.750,
				TextTransparency = 0.400
			})

			Shadow:Render(true)
		else
			NeverLose.PlayAnimate(ColorPickerHandler,SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke,SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(SaViMap,SlowyTween , {
				BackgroundTransparency = 1,
				ImageTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke_2,SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(ColorMap,SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke_3,SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(RGBLabel,SlowyTween , {
				BackgroundTransparency = 1,
				TextTransparency = 1
			})

			Shadow:Render(false)
		end;
	end);

	ColorPickerLib.SetRender(false);
	ColorPickerLib.Root = ColorPickerHandler;
	ColorPickerLib.H = 1;
	ColorPickerLib.S = 1;
	ColorPickerLib.V = 1;
	ColorPickerLib.Callback = EmptyFunction;

	function ColorPickerLib:Update()
		local RealColor = Color3.fromHSV(ColorPickerLib.H , ColorPickerLib.S , ColorPickerLib.V);

		NeverLose.PlayAnimate(ColorZoneSelection,ManualTween,{
			Position = UDim2.fromScale(ColorPickerLib.S , 1 - ColorPickerLib.V)
		});

		NeverLose.PlayAnimate(SaViMap,ManualTween,{
			BackgroundColor3 = Color3.fromHSV(ColorPickerLib.H , 1 , 1)
		});

		NeverLose.PlayAnimate(ColorMapSelection,ManualTween,{
			Position = UDim2.fromScale(ColorPickerLib.H,0.5)
		});

		RGBLabel.Text = "#"..RealColor:ToHex();

		ColorPickerLib.Callback(RealColor);
	end;

	function ColorPickerLib:SetValue(Color)
		if typeof(Color) == 'string' then
			Color = Color3.fromHex(Color);
		end;

		local H , S , V = Color:ToHSV();

		ColorPickerLib.H = H;
		ColorPickerLib.S = S;
		ColorPickerLib.V = V;

		ColorPickerLib:Update();
	end;

	ColorPickerLib.IsHold = false;

	NeverLose:AddSignal(ColorPickerHandler.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = true;
		end;
	end));

	NeverLose:AddSignal(ColorPickerHandler.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = false;
		end;
	end));

	NeverLose:AddSignal(ColorMap.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or ColorPickerLib.IsHold) do task.wait()
				local ColorY = ColorMap.AbsolutePosition.X
				local ColorYM = ColorY + ColorMap.AbsoluteSize.X;
				local Value = math.clamp(Mouse.X, ColorY, ColorYM)
				local Code = ((Value - ColorY) / (ColorYM - ColorY));

				ColorPickerLib.H = Code;
				ColorPickerLib:Update();
			end;
		end;
	end)));

	NeverLose:AddSignal(SaViMap.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or ColorPickerLib.IsHold) do task.wait();
				local PosX = SaViMap.AbsolutePosition.X;
				local ScaleX = PosX + SaViMap.AbsoluteSize.X;
				local Value, PosY = math.clamp(Mouse.X, PosX, ScaleX), SaViMap.AbsolutePosition.Y;
				local ScaleY = PosY + SaViMap.AbsoluteSize.Y;
				local Vals = math.clamp(Mouse.Y, PosY, ScaleY);

				ColorPickerLib.S = (Value - PosX) / (ScaleX - PosX);
				ColorPickerLib.V = (1 - ((Vals - PosY) / (ScaleY - PosY)));
				ColorPickerLib:Update();
			end
		end
	end)));

	return ColorPickerLib;
end;

NeverLose.KeyEnum = {
	One = '1',
	Two = '2',
	Three = '3',
	Four = '4',
	Five = '5',
	Six = '6',
	Seven = '7',
	Eight = '8',
	Nine = '9',
	Zero = '0',
	['Minus'] = "-",
	['Plus'] = "+",
	BackSlash = "\\",
	Slash = "/",
	Period = '.',
	Semicolon = ';',
	Colon = ":",
	LeftControl = "LCtrl",
	RightControl = "RCtrl",
	LeftShift = "LShift",
	RightShift = "RShift",
	Return = "Enter",
	LeftBracket = "[",
	RightBracket = "]",
	Quote = "'",
	Comma = ",",
	Equals = "=",
	LeftSuper = "Super",
	RightSuper = "Super",
	LeftAlt = "LAlt",
	RightAlt = "RAlt",
	Escape = "Esc",
};

NeverLose.EnumReverse = {};

for i,v in next , NeverLose.KeyEnum do
	NeverLose.EnumReverse[v] = i;
end;

function NeverLose:KeyCodeToStr(K: Enum.KeyCode)
	if typeof(K) == 'string' then
		if NeverLose.KeyEnum[K] then
			return NeverLose.KeyEnum[K];
		end;

		return K;
	end;

	return (NeverLose.KeyEnum[K.Name] or K.Name);
end;

function NeverLose:StrToKeyCode(str: string)
	if NeverLose.EnumReverse[str] then
		return Enum.KeyCode[NeverLose.EnumReverse[str]];
	end;

	return Enum.KeyCode[str];
end;

function NeverLose:RegisiterHandler(Handler: Frame , Signal)
	local handle = {};
	local ZINdex = Handler.ZIndex;

	function handle:AddToggle(Config)
		Config = NeverLose:ProcessParams(Config , {
			Default = false,
			Flag = nil,
			Callback = EmptyFunction,
		});

		local Toggle = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Circle = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")

		Toggle.Name = NeverLose.RandomString();
		Toggle.Parent = Handler
		Toggle.BackgroundColor3 = Color3.fromRGB(10, 13, 21)
		Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.BorderSizePixel = 0
		Toggle.ClipsDescendants = true
		Toggle.Size = UDim2.new(0, 30, 0, 18)
		Toggle.ZIndex = ZINdex + 13
		Toggle.LayoutOrder = -(#Handler:GetChildren() + 5);

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = Toggle

		Circle.Name = NeverLose.RandomString();
		Circle.Parent = Toggle
		Circle.AnchorPoint = Vector2.new(0.5, 0.5)
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 0.500
		Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Circle.BorderSizePixel = 0
		Circle.Position = UDim2.new(0.300000012, 0, 0.5, 0)
		Circle.Size = UDim2.new(0, 16, 0, 16)
		Circle.ZIndex = ZINdex + 14

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = Circle

		local ToggleLib = {
			Root = Toggle	
		};

		ToggleLib.SetUI = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(Toggle,SlowyTween,{
					BackgroundTransparency = 0,
					BackgroundColor3 = NeverLose.AccentColor
				})

				NeverLose.PlayAnimate(Circle,SlowyTween,{
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0,
					Position = UDim2.new(0.7, 0, 0.5, 0)
				})
			else
				NeverLose.PlayAnimate(Toggle,SlowyTween,{
					BackgroundTransparency = 0,
					BackgroundColor3 = Color3.fromRGB(10, 13, 21)
				})

				NeverLose.PlayAnimate(Circle,SlowyTween,{
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.500,
					Position = UDim2.new(0.300000012, 0, 0.5, 0)
				})
			end;
		end);

		ToggleLib.SetVisible = LPH_NO_VIRTUALIZE(function(value)
			if value then
				ToggleLib.SetUI(Config.Default);
			else
				NeverLose.PlayAnimate(Toggle,SlowyTween,{
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(10, 13, 21)
				})

				NeverLose.PlayAnimate(Circle,SlowyTween,{
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.300000012, 0, 0.5, 0)
				})
			end;
		end);

		ToggleLib.SetUI(Config.Default);
		ToggleLib.SetVisible(Signal:GetValue());

		NeverLose:CreateInput(Toggle , LPH_NO_VIRTUALIZE(function()
			Config.Default = not Config.Default;

			ToggleLib.SetUI(Config.Default);

			Config.Callback(Config.Default)
		end))

		ToggleLib.Signal = Signal:Connect(ToggleLib.SetVisible);

		function ToggleLib:GetValue()
			return Config.Default;
		end;

		function ToggleLib:SetValue(v)
			Config.Default = v;

			if Signal:GetValue() then
				ToggleLib.SetUI(Config.Default);
			end;

			Config.Callback(Config.Default)
		end;

		if Config.Flag then
			NeverLose.Flags[Config.Flag] = ToggleLib;
			NeverLose.FlagTypes[Config.Flag] = "toggle";
		end;

		return ToggleLib;
	end;

	function handle:AddSlider(Config)
		Config = NeverLose:ProcessParams(Config , {
			Default = 50,
			Min = 0,
			Max = 10,
			Type = "",
			Rounding = 0,
			Nums = {},
			Flag = nil,
			Size = 125,
			Callback = EmptyFunction,
		});

		local SliderLib = {};

		SliderLib.GetSize = LPH_NO_VIRTUALIZE(function()
			return (Config.Default - Config.Min) / (Config.Max - Config.Min);
		end);

		local FullNumSize = TextService:GetTextSize(string.rep("0",(Config.Rounding + #tostring(Config.Max))+1)..tostring(Config.Type),10,Enum.Font.GothamMedium,Vector2.new(math.huge,math.huge));

		SliderLib.MaximumSize = FullNumSize.X;

		if Config.Nums then
			local nszie = 0;

			for i,ns in next , Config.Nums do
				local size = TextService:GetTextSize(string.rep("m",string.len(tostring(ns))),10,Enum.Font.GothamMedium,Vector2.new(math.huge,math.huge));

				if nszie < size.X then
					nszie = size.X;
				end
			end;

			if SliderLib.MaximumSize < nszie then
				SliderLib.MaximumSize = nszie;
			end;
		end;

		local Slider = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ValueFrame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ValueLabel = Instance.new("TextBox")
		local SlideMain = Instance.new("Frame")
		local SlideFrame = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local SlideMoving = Instance.new("Frame")
		local UICorner_4 = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local UICorner_5 = Instance.new("UICorner")
		local boxSize = 2;

		Slider.Name = NeverLose.RandomString();
		Slider.Parent = Handler
		Slider.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		Slider.BackgroundTransparency = 1.000
		Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider.BorderSizePixel = 0
		Slider.ClipsDescendants = false
		Slider.Size = UDim2.new(0, Config.Size, 0, 18)
		Slider.ZIndex = ZINdex + 13
		Slider.LayoutOrder = -(#Handler:GetChildren() + 5);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Slider

		ValueFrame.Name = NeverLose.RandomString();
		ValueFrame.Parent = Slider
		ValueFrame.AnchorPoint = Vector2.new(1, 0)
		ValueFrame.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.ClipsDescendants = true
		ValueFrame.Position = UDim2.new(1, 0, 0, 0)
		ValueFrame.Size = UDim2.new(0, SliderLib.MaximumSize + boxSize, 0, 18)
		ValueFrame.ZIndex = ZINdex + 13

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = ValueFrame

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = ValueFrame

		ValueLabel.Name = NeverLose.RandomString();
		ValueLabel.Parent = ValueFrame
		ValueLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.BackgroundTransparency = 1.000
		ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueLabel.BorderSizePixel = 0
		ValueLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ValueLabel.Size = UDim2.new(1, 0, 1, 0)
		ValueLabel.ZIndex = ZINdex + 14
		ValueLabel.Font = Enum.Font.GothamMedium
		ValueLabel.Text = tostring(Config.Default)..tostring(Config.Type);
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 10.000
		ValueLabel.ClearTextOnFocus = false;
		ValueLabel.TextTransparency = 0.350

		SlideMain.Name = NeverLose.RandomString();
		SlideMain.Parent = Slider
		SlideMain.AnchorPoint = Vector2.new(0, 0.5)
		SlideMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SlideMain.BackgroundTransparency = 1.000
		SlideMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SlideMain.BorderSizePixel = 0
		SlideMain.Position = UDim2.new(0, 0, 0.5, 0)
		SlideMain.Size = UDim2.new(1, -((SliderLib.MaximumSize + 11)), 0, 18)
		SlideMain.ZIndex = ZINdex + 13

		SlideFrame.Name = NeverLose.RandomString();
		SlideFrame.Parent = SlideMain
		SlideFrame.AnchorPoint = Vector2.new(0, 0.5)
		SlideFrame.BackgroundColor3 = Color3.fromRGB(30, 29, 36)
		SlideFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SlideFrame.BorderSizePixel = 0
		SlideFrame.Position = UDim2.new(0, 0, 0.5, 0)
		SlideFrame.Size = UDim2.new(1, 0, 0, 5)
		SlideFrame.ZIndex = ZINdex + 13

		UICorner_3.CornerRadius = UDim.new(1, 0)
		UICorner_3.Parent = SlideFrame

		SlideMoving.Name = NeverLose.RandomString();
		SlideMoving.Parent = SlideFrame
		SlideMoving.BackgroundColor3 = NeverLose.AccentColor
		SlideMoving.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SlideMoving.BorderSizePixel = 0
		SlideMoving.Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
		SlideMoving.ZIndex = ZINdex + 14

		UICorner_4.CornerRadius = UDim.new(1, 0)
		UICorner_4.Parent = SlideMoving

		Frame.Parent = SlideMoving
		Frame.AnchorPoint = Vector2.new(1, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(1, 5, 0.5, 0)
		Frame.Size = UDim2.new(0, 10, 0, 10)
		Frame.ZIndex = ZINdex + 15

		UICorner_5.CornerRadius = UDim.new(1, 0)
		UICorner_5.Parent = Frame

		local LoadText = LPH_NO_VIRTUALIZE(function()
			if Config.Nums[Config.Default] then
				ValueLabel.Text = Config.Nums[Config.Default]

			else
				ValueLabel.Text = tostring(Config.Default)..tostring(Config.Type);

			end;
		end);

		ValueLabel.FocusLost:Connect(LPH_NO_VIRTUALIZE(function()
			local OutVal = NeverLose:ParseInput(ValueLabel.Text , true);
			if OutVal then
				local rx = math.clamp(OutVal , Config.Min , Config.Max);
				local Value = NeverLose.Rounding(rx,Config.Rounding);

				if Value then
					Config.Default = Value;

					TweenService:Create(SlideMoving , ManualTween ,{
						Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
					}):Play();

					LoadText();

					Config.Callback(Config.Default)
				else
					LoadText();
				end;

			else
				LoadText()
			end;
		end));

		SliderLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(ValueFrame,SlowyTween,{
					BackgroundTransparency = 0,
					Size = UDim2.new(0, SliderLib.MaximumSize + boxSize, 0, 18)
				});

				NeverLose.PlayAnimate(UIStroke,SlowyTween,{
					Transparency = 0.650
				});

				NeverLose.PlayAnimate(ValueLabel,SlowyTween,{
					TextTransparency = 0.350
				});

				NeverLose.PlayAnimate(SlideFrame,SlowyTween,{
					BackgroundTransparency = 0
				});

				NeverLose.PlayAnimate(SlideMoving,SlowyTween,{
					BackgroundTransparency = 0,
					Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
				});

				NeverLose.PlayAnimate(Frame,SlowyTween,{
					BackgroundTransparency = 0
				});
			else
				NeverLose.PlayAnimate(ValueFrame,SlowyTween,{
					BackgroundTransparency = 1,
				});

				NeverLose.PlayAnimate(UIStroke,SlowyTween,{
					Transparency = 1
				});

				NeverLose.PlayAnimate(ValueLabel,SlowyTween,{
					TextTransparency = 1
				});

				NeverLose.PlayAnimate(SlideFrame,SlowyTween,{
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(SlideMoving,SlowyTween,{
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0)
				});

				NeverLose.PlayAnimate(Frame,SlowyTween,{
					BackgroundTransparency = 1
				});
			end;
		end);

		SliderLib.SetRender(Signal:GetValue());
		SliderLib.Signal = Signal:Connect(SliderLib.SetRender);

		local Update = function(Input)
			local SizeScale = math.clamp((((Input.Position.X) - SlideMain.AbsolutePosition.X) / SlideMain.AbsoluteSize.X), 0, 1);
			local Main = ((Config.Max - Config.Min) * SizeScale) + Config.Min;
			local Value = NeverLose.Rounding(Main,Config.Rounding);
			local PositionX = UDim2.fromScale(SizeScale, 1);
			local Size = ((Value - Config.Min) / (Config.Max - Config.Min)) + 0.02;

			Config.Default = Value;

			TweenService:Create(SlideMoving , ManualTween ,{
				Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
			}):Play();

			LoadText()


			Config.Callback(Value)
		end;

		local IsHold = false;

		do
			SlideMain.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					IsHold = true
					Update(Input)
				end
			end))

			SlideMain.InputEnded:Connect(LPH_NO_VIRTUALIZE(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if UserInputService.TouchEnabled then
						if not NeverLose:IsMouseOverFrame(SlideMain) then
							IsHold = false
						end;
					else
						IsHold = false
					end;
				end
			end))

			UserInputService.InputChanged:Connect(LPH_NO_VIRTUALIZE(function(Input)
				if IsHold then
					if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)  then
						if UserInputService.TouchEnabled then
							if not NeverLose:IsMouseOverFrame(SlideMain) then
								IsHold = false
							else
								Update(Input)
							end;
						else
							Update(Input)
						end;
					end;
				end;
			end));
		end;

		function SliderLib:GetValue()
			return Config.Default;
		end;

		function SliderLib:SetValue(v)
			Config.Default = v;

			if Signal:GetValue() then
				NeverLose.PlayAnimate(SlideMoving,SlowyTween,{
					BackgroundTransparency = 0,
					Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
				});
			end;

			LoadText()

			Config.Callback(Config.Default);
		end;

		if Config.Flag then
			NeverLose.Flags[Config.Flag] = SliderLib;
		end;

		return SliderLib;
	end;

	function handle:AddOption(GearIcon)
		local Option = Instance.new("Frame")
		local Icon = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")

		Option.Name = NeverLose.RandomString();
		Option.Parent = Handler
		Option.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
		Option.BackgroundTransparency = 1.000
		Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Option.BorderSizePixel = 0
		Option.ClipsDescendants = true
		Option.Size = UDim2.new(0, 20, 0, 18)
		Option.ZIndex = ZINdex + 13
		Option.LayoutOrder = -(#Handler:GetChildren() + 5);

		Icon.Name = NeverLose.RandomString();
		Icon.Parent = Option
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.ZIndex = ZINdex + 14
		Icon.FontFace = NeverLose.BuiltInBold
		Icon.Text = (GearIcon == 1 and 'gear') or (GearIcon == 2 and 'chevron-large-right') or "three-dots-horizontal";
		Icon.TextColor3 = Color3.fromRGB(223, 223, 223)
		Icon.TextSize = 16.000
		Icon.TextTransparency = 0.400
		Icon.TextWrapped = true

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Option

		local Window = NeverLose:CreateOptionWindow(Option , ZINdex + 13);
		local reciveSignal;

		Window.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 0.400
				})
			else
				NeverLose.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 1
				})
			end;
		end);

		Window.SetRender(Signal:GetValue());
		Signal:Connect(Window.SetRender);

		local bthg = NeverLose:CreateInput(Option , LPH_NO_VIRTUALIZE(function()
			if reciveSignal then
				reciveSignal:Disconnect();
				reciveSignal = nil;	
			end;

			Window.Signal:SetValue(true);

			reciveSignal = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not NeverLose:IsMouseOverFrame(Window.Root) and not NeverLose:IsMouseOverFrame(Option) then
						if reciveSignal then
							reciveSignal:Disconnect();
							reciveSignal = nil;	
						end;

						Window.Signal:SetValue(false);
					end
				end
			end)
		end));

		NeverLose:AddSignal(bthg.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(Option , SlowyTween , {
				BackgroundTransparency = 0.5
			})

			NeverLose.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.25
			})
		end)));

		NeverLose:AddSignal(bthg.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(Option , SlowyTween , {
				BackgroundTransparency = 1.000
			})

			NeverLose.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.400
			})
		end)));

		return Window;
	end;

	function handle:AddColorPicker(Config)
		Config = NeverLose:ProcessParams(Config , {
			Default = Color3.fromRGB(255, 255, 255),
			Callback  = EmptyFunction,
		});

		if typeof(Config.Default) == 'string' then
			Config.Default = Color3.fromHex(Config.Default:gsub('#',''));
		end;

		local ColorPickerLib = {};
		local ColorPicker = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ImageLabel = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")

		ColorPicker.Name = NeverLose.RandomString();
		ColorPicker.Parent = Handler
		ColorPicker.BackgroundColor3 = Config.Default;
		ColorPicker.BackgroundTransparency = 0
		ColorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorPicker.BorderSizePixel = 0
		ColorPicker.ClipsDescendants = true
		ColorPicker.Size = UDim2.new(0, 18, 0, 18)
		ColorPicker.ZIndex = ZINdex + 13
		ColorPicker.LayoutOrder = -(#Handler:GetChildren() + 5);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = ColorPicker

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = ColorPicker

		ImageLabel.Parent = ColorPicker
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.ZIndex = ZINdex + 11
		ImageLabel.Image = "rbxasset://textures/meshPartFallback.png"
		ImageLabel.ImageTransparency = 0.9
		ImageLabel.BackgroundTransparency = 1;
		ImageLabel.ScaleType = Enum.ScaleType.Crop

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = ImageLabel

		local BackendM = NeverLose:CreateColorPicker(ColorPicker);

		BackendM:SetValue(Config.Default)
		BackendM.Callback = function(color)
			ColorPicker.BackgroundColor3 = color;
			Config.Default = color;
			Config.Callback(Config.Default);
		end;

		local signal;
		NeverLose:CreateInput(ColorPicker , LPH_NO_VIRTUALIZE(function()
			if signal then
				signal:Disconnect();
				signal = nil;
			end;

			BackendM.SetRender(true);

			signal = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not NeverLose:IsMouseOverFrame(ColorPicker) and not NeverLose:IsMouseOverFrame(BackendM.Root) then
						if signal then
							signal:Disconnect();
							signal = nil;
						end;

						BackendM.SetRender(false);
					end;
				end;
			end)
		end));

		ColorPickerLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(ColorPicker , SlowyTween , {
					BackgroundTransparency = 0
				})

				NeverLose.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 0.650
				})

				NeverLose.PlayAnimate(ImageLabel , SlowyTween , {
					ImageTransparency = 0.9
				})
			else
				NeverLose.PlayAnimate(ColorPicker , SlowyTween , {
					BackgroundTransparency = 1
				})

				NeverLose.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 1
				})

				NeverLose.PlayAnimate(ImageLabel , SlowyTween , {
					ImageTransparency = 1
				})
			end;
		end);

		ColorPickerLib.SetRender(Signal:GetValue());
		Signal:Connect(ColorPickerLib.SetRender);

		function ColorPickerLib:GetValue()
			return Config.Default;
		end;

		function ColorPickerLib:SetValue(v)
			Config.Default = v;
			BackendM:SetValue(Config.Default)
		end;

		if Config.Flag then
			NeverLose.Flags[Config.Flag] = ColorPickerLib;
		end;

		return ColorPickerLib;
	end;

	function handle:AddKeybind(Config)
		Config = NeverLose:ProcessParams(Config,{
			Default = nil,
			Blacklist = {},
			Callback = EmptyFunction,
			Flag = nil
		});

		local KeybindLib = {};

		local Keybind = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ValueLabel = Instance.new("TextLabel")

		Keybind.Name = NeverLose.RandomString();
		Keybind.Parent = Handler
		Keybind.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind.BorderSizePixel = 0
		Keybind.ClipsDescendants = true
		Keybind.Size = UDim2.new(0, 45, 0, 18)
		Keybind.ZIndex = ZINdex + 13
		Keybind.LayoutOrder = -(#Handler:GetChildren() + 5);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Keybind

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Keybind

		ValueLabel.Name = NeverLose.RandomString();
		ValueLabel.Parent = Keybind
		ValueLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.BackgroundTransparency = 1.000
		ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueLabel.BorderSizePixel = 0
		ValueLabel.ClipsDescendants = true
		ValueLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ValueLabel.Size = UDim2.new(1, 0, 1, 0)
		ValueLabel.ZIndex = ZINdex + 14
		ValueLabel.Font = Enum.Font.GothamMedium
		ValueLabel.Text = NeverLose:KeyCodeToStr(Config.Default or "None")
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 10.000
		ValueLabel.TextTransparency = 0.500

		KeybindLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(Keybind,SlowyTween, {
					BackgroundTransparency = 0
				})

				NeverLose.PlayAnimate(UIStroke,SlowyTween, {
					Transparency = 0.650
				})

				NeverLose.PlayAnimate(ValueLabel,SlowyTween, {
					TextTransparency = 0.500
				})
			else
				NeverLose.PlayAnimate(Keybind,SlowyTween, {
					BackgroundTransparency = 1
				})

				NeverLose.PlayAnimate(UIStroke,SlowyTween, {
					Transparency = 1
				})

				NeverLose.PlayAnimate(ValueLabel,SlowyTween, {
					TextTransparency = 1
				})
			end;
		end);

		function KeybindLib:Update()
			local size = TextService:GetTextSize(ValueLabel.Text,ValueLabel.TextSize,ValueLabel.Font,Vector2.new(math.huge,math.huge));

			NeverLose.PlayAnimate(Keybind , SlowyTween , {
				Size = UDim2.new(0, size.X + 7, 0, 18)
			})
		end;

		local IsBlacklist = LPH_NO_VIRTUALIZE(function(v)
			return Config.Blacklist and (Config.Blacklist[v] or table.find(Config.Blacklist,v))
		end);

		KeybindLib:Update()

		KeybindLib.SetRender(Signal:GetValue());
		Signal:Connect(KeybindLib.SetRender);

		local IsBinding = false;
		NeverLose:CreateInput(Keybind , function()
			if IsBinding then
				return;
			end;

			IsBinding = true;

			ValueLabel.Text = "...";

			KeybindLib:Update();

			local Selected = nil;

			while not Selected do
				local Key = UserInputService.InputBegan:Wait();

				if Key.KeyCode ~= Enum.KeyCode.Unknown and not IsBlacklist(Key.KeyCode) and not IsBlacklist(Key.KeyCode.Name) then
					Selected = Key.KeyCode;
				else
					if Key.UserInputType == Enum.UserInputType.MouseButton1 and not IsBlacklist(Enum.UserInputType.MouseButton1) and not IsBlacklist("M1B") then
						Selected = "M1B";
					elseif Key.UserInputType == Enum.UserInputType.MouseButton2 and not IsBlacklist(Enum.UserInputType.MouseButton2) and not IsBlacklist("M2B") then
						Selected = "M2B";
					end;
				end;
			end;

			IsBinding = false;

			local KeyName = typeof(Selected) == "string" and Selected or Selected.Name;

			Config.Default = KeyName;
			KeybindLib.CurrentKey = KeyName;

			ValueLabel.Text = NeverLose:KeyCodeToStr(KeyName);

			KeybindLib:Update();
		end)

		KeybindLib.CurrentKey = Config.Default;

		local function kbMatch(input, cur)
			if not cur or cur == "None" or cur == "" then return false end;
			if typeof(cur) == "string" then
				if cur == "M1B" then return input.UserInputType == Enum.UserInputType.MouseButton1 end;
				if cur == "M2B" then return input.UserInputType == Enum.UserInputType.MouseButton2 end;
				return input.KeyCode.Name == cur;
			end;
			return input.KeyCode == cur;
		end;

		NeverLose:AddSignal(UserInputService.InputBegan:Connect(function(input, gpe)
			if gpe then return end;
			if IsBinding then return end;
			if kbMatch(input, KeybindLib.CurrentKey) then
				task.spawn(function() pcall(Config.Callback, true) end);
			end;
		end));

		NeverLose:AddSignal(UserInputService.InputEnded:Connect(function(input, gpe)
			if kbMatch(input, KeybindLib.CurrentKey) then
				task.spawn(function() pcall(Config.Callback, false) end);
			end;
		end));

		function KeybindLib:GetValue()
			return Config.Default;
		end;

		function KeybindLib:SetValue(v)
			Config.Default = v;
			KeybindLib.CurrentKey = v;
			ValueLabel.Text = NeverLose:KeyCodeToStr(v);
			KeybindLib:Update();
		end;

		if Config.Flag then
			NeverLose.Flags[Config.Flag] = KeybindLib;
		end;

		return KeybindLib;
	end;

	function handle:AddTextInput(Config)
		Config = NeverLose:ProcessParams(Config , {
			Default = "",
			Placeholder = "Placeholder",
			Callback = print,
			Flag = nil,
			Size = 100,
			Numeric = false,
		});

		local TextBoxLib = {};

		local TextInput = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local TextBox = Instance.new("TextBox")

		TextInput.Name = NeverLose.RandomString();
		TextInput.Parent = Handler
		TextInput.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		TextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextInput.BorderSizePixel = 0
		TextInput.ClipsDescendants = true
		TextInput.Size = UDim2.new(0, Config.Size, 0, 18)
		TextInput.ZIndex = ZINdex + 13
		TextInput.LayoutOrder = -(#Handler:GetChildren() + 5);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = TextInput

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = TextInput

		TextBox.Parent = TextInput
		TextBox.AnchorPoint = Vector2.new(0, 0.5)
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0, 5, 0.5, 0)
		TextBox.Size = UDim2.new(1, -5, 0, 17)
		TextBox.ZIndex = ZINdex + 14
		TextBox.ClearTextOnFocus = false
		TextBox.Font = Enum.Font.GothamMedium
		TextBox.PlaceholderText = Config.Placeholder
		TextBox.Text = tostring(Config.Default)
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 11.000
		TextBox.TextTransparency = 0.350
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		TextBoxLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(TextInput , SlowyTween ,{
					BackgroundTransparency = 0
				})	

				NeverLose.PlayAnimate(UIStroke , SlowyTween ,{
					Transparency = 0.650
				})	

				NeverLose.PlayAnimate(TextBox , SlowyTween ,{
					TextTransparency = 0.350
				})	
			else
				NeverLose.PlayAnimate(TextInput , SlowyTween ,{
					BackgroundTransparency = 1
				})	

				NeverLose.PlayAnimate(UIStroke , SlowyTween ,{
					Transparency = 1
				})	

				NeverLose.PlayAnimate(TextBox , SlowyTween ,{
					TextTransparency = 1
				})
			end;
		end);

		NeverLose:AddSignal(TextBox:GetPropertyChangedSignal('Text'):Connect(LPH_NO_VIRTUALIZE(function()
			local valout = NeverLose:ParseInput(TextBox.Text , Config.Numeric);

			if Config.Numeric then
				TextBox.Text = string.gsub(TextBox.Text , '[^0-9.]','')
			end;

			if valout then
				Config.Default = valout;
				Config.Callback(valout);
			end
		end)));

		TextBoxLib.SetRender(Signal:GetValue());
		Signal:Connect(TextBoxLib.SetRender);

		function TextBoxLib:GetValue()
			return Config.Default;
		end;

		function TextBoxLib:SetValue(v)
			Config.Default = v;
			TextBox.Text = tostring(v);
			Config.Callback(Config.Default);
		end;

		if Config.Flag then
			NeverLose.Flags[Config.Flag] = TextBoxLib;
		end;

		return TextBoxLib;
	end;

	function handle:AddDropdown(Config)
		Config = NeverLose:ProcessParams(Config , {
			Default = nil,
			Values = {},
			Multi = false,
			Callback = EmptyFunction,
			AutoUpdate = false,
			Flag = nil,
			Size = 100
		})

		Config.Default = NeverLose.ProcessDropdown(Config.Default);

		local Dropdown = Instance.new("Frame")
		local DropdownIcon = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local BasedLabel = Instance.new("TextLabel")

		Dropdown.Name = NeverLose.RandomString();
		Dropdown.Parent = Handler
		Dropdown.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Dropdown.BorderSizePixel = 0
		Dropdown.ClipsDescendants = true
		Dropdown.Size = UDim2.new(0, Config.Size, 0, 18)
		Dropdown.ZIndex = ZINdex + 13
		Dropdown.LayoutOrder = -(#Handler:GetChildren() + 5);

		DropdownIcon.Name = NeverLose.RandomString();
		DropdownIcon.Parent = Dropdown
		DropdownIcon.AnchorPoint = Vector2.new(1, 0.5)
		DropdownIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownIcon.BackgroundTransparency = 1.000
		DropdownIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DropdownIcon.BorderSizePixel = 0
		DropdownIcon.Position = UDim2.new(1, -2, 0.5, 0)
		DropdownIcon.Size = UDim2.new(0, 18, 0, 18)
		DropdownIcon.ZIndex = ZINdex + 14
		DropdownIcon.FontFace = NeverLose.BuiltInBold
		DropdownIcon.Text = "chevron-small-down"
		DropdownIcon.TextColor3 = Color3.fromRGB(223, 223, 223)
		DropdownIcon.TextSize = 16.000
		DropdownIcon.TextTransparency = 0.250
		DropdownIcon.TextWrapped = true

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Dropdown

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Dropdown

		BasedLabel.Name = NeverLose.RandomString();
		BasedLabel.Parent = Dropdown
		BasedLabel.AnchorPoint = Vector2.new(0, 0.5)
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.ClipsDescendants = true
		BasedLabel.Position = UDim2.new(0, 5, 0.5, 0)
		BasedLabel.Size = UDim2.new(1, -25, 0, 15)
		BasedLabel.ZIndex = ZINdex + 14
		BasedLabel.Font = Enum.Font.GothamMedium
		BasedLabel.Text = NeverLose.ParseDropdown(Config.Default);
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 12.000
		BasedLabel.TextTransparency = 0.5
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

		do
			local UIGradient = Instance.new("UIGradient")

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.85, 0.23), NumberSequenceKeypoint.new(1.00, 1.00)}
			UIGradient.Parent = BasedLabel;
		end;

		NeverLose:AddSignal(Dropdown.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
				TextTransparency = 0.200
			})
		end)));

		NeverLose:AddSignal(Dropdown.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
				TextTransparency = 0.5
			})
		end)));

		local DropdownLib = {
			OpenSignal = NeverLose:CreateSignal(false),
			Signals = {},
			Refuse = {},
		};

		DropdownLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(Dropdown , SlowyTween , {
					BackgroundTransparency = 0
				});

				NeverLose.PlayAnimate(DropdownIcon , SlowyTween , {
					TextTransparency = 0.250
				});

				NeverLose.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 0.650
				});

				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.5
				});
			else
				NeverLose.PlayAnimate(Dropdown , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(DropdownIcon , SlowyTween , {
					TextTransparency = 1
				});

				NeverLose.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 1
				});

				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				});
			end
		end);

		DropdownLib.SetRender(Signal:GetValue())
		Signal:Connect(DropdownLib.SetRender);
		DropdownLib.ExtentSize = 0;

		do
			local DropdownHandler = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local DropdownScrollFrame = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local Shadow = NeverLose:CreateShadow(DropdownHandler);

			DropdownHandler.Name = NeverLose.RandomString();
			DropdownHandler.Parent = NeverLose.ScreenGui;
			DropdownHandler.AnchorPoint = Vector2.new(0.5, 0)
			DropdownHandler.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
			DropdownHandler.BackgroundTransparency = 0.5
			DropdownHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownHandler.BorderSizePixel = 0
			DropdownHandler.ClipsDescendants = true
			DropdownHandler.Position = UDim2.new(255,255,255,255)
			DropdownHandler.Size = UDim2.new(0, 125, 0, 50)
			DropdownHandler.ZIndex = ZINdex + 125
			DropdownLib.BlockRoot = DropdownHandler;

			NeverLose:AddSignal(DropdownHandler:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
				if DropdownHandler.BackgroundTransparency > 0.9 then
					DropdownHandler.Visible = false;
					DropdownHandler.Parent = nil;
				else
					DropdownHandler.Visible = true;

					if NeverLose.Global3DRenderMode then
						DropdownHandler.Parent = NeverLose.GlobalSurfaceGui;
					else
						DropdownHandler.Parent = NeverLose.ScreenGui;
					end;
				end;
			end));

			UICorner.CornerRadius = UDim.new(0, 10)
			UICorner.Parent = DropdownHandler

			UIStroke.Transparency = 0.650
			UIStroke.Color = Color3.fromRGB(45, 48, 58)
			UIStroke.Parent = DropdownHandler

			DropdownScrollFrame.Name = NeverLose.RandomString();
			DropdownScrollFrame.Parent = DropdownHandler
			DropdownScrollFrame.Active = true
			DropdownScrollFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			DropdownScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownScrollFrame.BackgroundTransparency = 1.000
			DropdownScrollFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownScrollFrame.BorderSizePixel = 0
			DropdownScrollFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropdownScrollFrame.Size = UDim2.new(1, -5, 1, -5)
			DropdownScrollFrame.ZIndex = ZINdex + 127
			DropdownScrollFrame.ScrollBarThickness = 0

			DropdownLib.RootItem = DropdownScrollFrame;

			UIListLayout.Parent = DropdownScrollFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			NeverLose:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
				DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y)
				NeverLose.PlayAnimate(DropdownHandler , SlowyTween , {
					Size = UDim2.new(0, (Dropdown.AbsoluteSize.X + 5) + DropdownLib.ExtentSize, 0, math.min(UIListLayout.AbsoluteContentSize.Y + 5, 250));
				})
			end)));

			local SetPosition = LPH_NO_VIRTUALIZE(function()
				if NeverLose:MoreThanHalfY(Dropdown.AbsolutePosition.Y + 85) then
					DropdownHandler.AnchorPoint = Vector2.new(0.5,1)
				else
					DropdownHandler.AnchorPoint = Vector2.new(0.5,0)
				end;

				DropdownHandler.Position = UDim2.fromOffset(Dropdown.AbsolutePosition.X + (DropdownHandler.AbsoluteSize.X / 2), Dropdown.AbsolutePosition.Y + 85);

			end);

			DropdownLib.SetFrameRender = LPH_NO_VIRTUALIZE(function(value)
				DropdownLib.OpenSignal:SetValue(value);

				if value then
					Shadow:Render(true);

					DropdownHandler.Size = UDim2.new(0, (Dropdown.AbsoluteSize.X + 5) + DropdownLib.ExtentSize, 0, math.min(UIListLayout.AbsoluteContentSize.Y + 5, 250));

					SetPosition();

					NeverLose.PlayAnimate(DropdownHandler , SlowyTween , {
						BackgroundTransparency = 0.035
					})

					if Config.AutoUpdate then
						DropdownLib:Generate();
					end;
				else

					NeverLose.PlayAnimate(DropdownHandler , SlowyTween , {
						BackgroundTransparency = 1
					})

					Shadow:Render(false);
				end;
			end);

			DropdownLib.SetFrameRender(false);
		end;

		local SecureSignal;
		NeverLose:CreateInput(Dropdown , LPH_NO_VIRTUALIZE(function()
			if SecureSignal then
				SecureSignal:Disconnect();
				SecureSignal = nil;
			end;

			DropdownLib.SetFrameRender(true);
			NeverLose.IsMosueOverOtherFrame = true;

			SecureSignal = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not NeverLose:IsMouseOverFrame(DropdownLib.BlockRoot) and not NeverLose:IsMouseOverFrame(Dropdown) then
						if SecureSignal then
							SecureSignal:Disconnect();
							SecureSignal = nil;
						end;

						NeverLose.IsMosueOverOtherFrame = false;
						DropdownLib.SetFrameRender(false);
					end;
				end
			end)
		end))

		DropdownLib.IsMatch = LPH_NO_VIRTUALIZE(function(v1)
			if typeof(Config.Default) =='table' then
				if Config.Default[v1] or table.find(Config.Default , v1) then
					return true;
				end
			end

			if Config.Default == v1 then
				return true;
			end;
		end);

		function DropdownLib:Generate()
			for i,v in next , DropdownLib.RootItem:GetChildren() do
				if v:IsA('Frame') then
					v:Destroy();
				end;
			end;

			for i,v in next , DropdownLib.Signals do
				v:Disconnect();
			end;

			table.clear(DropdownLib.Signals);
			table.clear(DropdownLib.Refuse);

			local Lastone;
			for i,Value in next , Config.Values do
				local ItemFrame = Instance.new("Frame")
				local ItemLabel = Instance.new("TextLabel")
				local UICorner = Instance.new("UICorner")

				ItemFrame.Name = NeverLose.RandomString();
				ItemFrame.Parent = DropdownLib.RootItem
				ItemFrame.BackgroundColor3 = Color3.fromRGB(29, 31, 38)
				ItemFrame.BackgroundTransparency = 1.000
				ItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ItemFrame.BorderSizePixel = 0
				ItemFrame.Size = UDim2.new(1, 0, 0, 25)
				ItemFrame.ZIndex = ZINdex + 1258

				ItemLabel.Name = NeverLose.RandomString();
				ItemLabel.Parent = ItemFrame
				ItemLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ItemLabel.BackgroundTransparency = 1.000
				ItemLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ItemLabel.BorderSizePixel = 0
				ItemLabel.Position = UDim2.new(0, 15, 0, 4)
				ItemLabel.Size = UDim2.new(0,1, 0, 15)
				ItemLabel.ZIndex = ZINdex + 1258
				ItemLabel.Font = Enum.Font.GothamMedium
				ItemLabel.Text = tostring(Value);
				ItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				ItemLabel.TextSize = 13.000
				ItemLabel.TextTransparency = 0.200
				ItemLabel.TextXAlignment = Enum.TextXAlignment.Left

				UICorner.CornerRadius = UDim.new(0, 10)
				UICorner.Parent = ItemFrame
				local sizetext = TextService:GetTextSize(ItemLabel.Text , ItemLabel.TextSize,ItemLabel.Font,Vector2.new(math.huge,math.huge));

				DropdownLib.ExtentSize = math.max(DropdownLib.ExtentSize , sizetext.X);

				local MIcon , MarkItem = nil , nil;

				if Config.Multi then
					local Icon = Instance.new("TextLabel")

					Icon.Parent = ItemFrame;
					Icon.AnchorPoint = Vector2.new(0, 0.5)
					Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Icon.BackgroundTransparency = 1.000
					Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Icon.BorderSizePixel = 0
					Icon.Position = UDim2.new(0, 5, 0.5, 0)
					Icon.Size = UDim2.new(0, 20, 0, 20)
					Icon.ZIndex = ZINdex + 1259
					Icon.FontFace = NeverLose.BuiltInBold;
					Icon.Text = "check"
					Icon.TextColor3 = Color3.fromRGB(223, 223, 223)
					Icon.TextSize = 18.000
					Icon.TextTransparency = 1
					Icon.TextWrapped = true;

					local VisiblewOfMult = LPH_NO_VIRTUALIZE(function()
						if DropdownLib.IsMatch(Value) then
							NeverLose.PlayAnimate(ItemLabel , VSlowTween , {
								TextTransparency = 0.200,
								Position = UDim2.new(0, 30, 0, 4)
							})

							NeverLose.PlayAnimate(Icon , vs , {
								TextTransparency = 0.250
							})

							Lastone = ItemLabel;
						else

							NeverLose.PlayAnimate(Icon , SlowyTween , {
								TextTransparency = 1
							})

							NeverLose.PlayAnimate(ItemLabel , VSlowTween , {
								TextTransparency = 0.5,
								Position = UDim2.new(0, 15, 0, 4)
							})
						end;
					end);

					MIcon = Icon;
					MarkItem = VisiblewOfMult;
				else
					local DefaultVisible = LPH_NO_VIRTUALIZE(function()
						if DropdownLib.IsMatch(Value) then
							NeverLose.PlayAnimate(ItemLabel , SlowyTween , {
								TextTransparency = 0.200
							})

							Lastone = ItemLabel;
						else
							NeverLose.PlayAnimate(ItemLabel , SlowyTween , {
								TextTransparency = 0.5
							})
						end;
					end);

					MarkItem = DefaultVisible;
				end;

				MarkItem();

				table.insert(DropdownLib.Refuse , MarkItem)

				table.insert(DropdownLib.Signals,ItemFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(ItemFrame , SlowyTween , {
						BackgroundTransparency = 0.1
					})
				end)));

				table.insert(DropdownLib.Signals,ItemFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(ItemFrame , SlowyTween , {
						BackgroundTransparency = 1
					})
				end)));

				table.insert(DropdownLib.Signals , DropdownLib.OpenSignal:Connect(LPH_NO_VIRTUALIZE(function(val)
					if val then
						MarkItem();
					else
						NeverLose.PlayAnimate(ItemLabel , SlowyTween , {
							TextTransparency = 1
						})

						if MIcon then
							NeverLose.PlayAnimate(MIcon , SlowyTween , {
								TextTransparency = 1
							})
						end;
					end;
				end)));

				if Config.Multi then
					local _,bth_signal = NeverLose:CreateInput(ItemFrame , LPH_NO_VIRTUALIZE(function()
						Config.Default[Value] = not Config.Default[Value];

						MarkItem();

						BasedLabel.Text = NeverLose.ParseDropdown(Config.Default);

						Config.Callback(Config.Default);
					end));

					table.insert(DropdownLib.Signals , bth_signal);
				else
					local _,bth_signal = NeverLose:CreateInput(ItemFrame , LPH_NO_VIRTUALIZE(function()
						Config.Default = Value;

						for i,v in next , DropdownLib.Refuse do
							task.spawn(v);
						end;

						BasedLabel.Text = NeverLose.ParseDropdown(Config.Default);

						Config.Callback(Config.Default);
					end));

					table.insert(DropdownLib.Signals , bth_signal);
				end;
			end;
		end;

		DropdownLib:Generate();

		function DropdownLib:GetValue()
			return Config.Default;
		end;

		function DropdownLib:SetValue(v)
			Config.Default = v;

			BasedLabel.Text = NeverLose.ParseDropdown(Config.Default);

			for i,v in next , DropdownLib.Refuse do
				task.spawn(v);
			end;

			Config.Callback(Config.Default);
		end;

		function DropdownLib:SetValues(a)
			Config.Values = a;

			if not Config.AutoUpdate then
				DropdownLib:Generate();
			end;
		end;

		if Config.Flag then
			NeverLose.Flags[Config.Flag] = DropdownLib;
		end;

		return DropdownLib;
	end;

	return handle;
end;

NeverLose.ProcessDropdown = LPH_NO_VIRTUALIZE(function(value)
	if typeof(value) == 'table' then
		local data = {};

		for i,v in next , value do
			if typeof(v) == 'boolean' and typeof(i) ~= 'number' then
				data[i] = v;
			else
				data[v] = true;
			end;
		end;

		return data;
	else
		return value;
	end;
end);

NeverLose.ParseDropdown = LPH_NO_VIRTUALIZE(function(value)
	if not value then return 'Select'; end;

	local Out;

	if typeof(value) == 'table' then
		if #value > 0 then
			local x = {};

			for i,v in next , value do
				table.insert(x , tostring(v))
			end;

			Out = table.concat(x,' , ');

			table.clear(x);
		else
			local x = {};

			for i,v in next , value do
				if v == true then
					table.insert(x , tostring(i));
				end			
			end;

			Out = table.concat(x,' , ');

			table.clear(x)

			if not Out:byte() then
				Out = 'Select';
			end
		end;
	else
		Out = tostring(value or 'Select');
	end;

	return Out;
end);

function NeverLose:ParseInput(Value , Numeric)
	if not Value then
		return (Numeric and nil) or "";	
	end;

	if Numeric then
		local out = string.gsub(tostring(Value), '[^0-9.%-]', '')

		if tonumber(out) then
			return tonumber(out);
		end;

		return nil;
	end;

	return Value;
end;

function NeverLose:CreateToolTips(Container: Frame , Name: string , Content: string)
	local Tooltips = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local TooltipName = Instance.new("TextLabel")
	local TooltipContent = Instance.new("TextLabel")
	local Shadow = NeverLose:CreateShadow(Tooltips);

	Tooltips.Name = NeverLose.RandomString();
	Tooltips.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	Tooltips.BackgroundTransparency = 0.075
	Tooltips.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tooltips.BorderSizePixel = 0
	Tooltips.ClipsDescendants = true
	Tooltips.Position = UDim2.new(255,255,255,255)
	Tooltips.Size = UDim2.new(0,0,0,0)
	Tooltips.ZIndex = 130

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Tooltips

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = Tooltips

	TooltipName.Name = NeverLose.RandomString();
	TooltipName.Parent = Tooltips
	TooltipName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TooltipName.BackgroundTransparency = 1.000
	TooltipName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TooltipName.BorderSizePixel = 0
	TooltipName.Position = UDim2.new(0, 15, 0, 5)
	TooltipName.Size = UDim2.new(0, 1, 0, 20)
	TooltipName.ZIndex = 132
	TooltipName.Font = Enum.Font.GothamBold
	TooltipName.Text = Name
	TooltipName.TextColor3 = Color3.fromRGB(255, 255, 255)
	TooltipName.TextSize = 15.000
	TooltipName.TextXAlignment = Enum.TextXAlignment.Left

	TooltipContent.Name = NeverLose.RandomString();
	TooltipContent.Parent = Tooltips
	TooltipContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TooltipContent.BackgroundTransparency = 1.000
	TooltipContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TooltipContent.BorderSizePixel = 0
	TooltipContent.Position = UDim2.new(0, 15, 0, 30)
	TooltipContent.Size = UDim2.new(0, 1, 0, 15)
	TooltipContent.ZIndex = 132
	TooltipContent.Font = Enum.Font.GothamBold
	TooltipContent.Text = Content
	TooltipContent.TextColor3 = Color3.fromRGB(255, 255, 255)
	TooltipContent.TextSize = 12.000
	TooltipContent.TextTransparency = 0.650
	TooltipContent.TextXAlignment = Enum.TextXAlignment.Left
	TooltipContent.TextYAlignment = Enum.TextYAlignment.Top

	local ToolTip = {};

	ToolTip.Update = LPH_NO_VIRTUALIZE(function()
		local SizeName = TextService:GetTextSize(TooltipName.Text , TooltipName.TextSize , TooltipName.Font , Vector2.new(math.huge,math.huge));
		local SizeContent = TextService:GetTextSize(TooltipContent.Text , TooltipContent.TextSize , TooltipContent.Font , Vector2.new(math.huge,math.huge));

		local MaxX = math.max(SizeName.X , SizeContent.X) + 65;
		local MaxY = SizeName.Y + SizeContent.Y + 30;

		NeverLose.PlayAnimate(Tooltips,SlowyTween , {
			Size = UDim2.new(0,MaxX,0,MaxY)
		})
	end)

	NeverLose:AddSignal(Tooltips:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
		if Tooltips.BackgroundTransparency > 0.9 then
			Tooltips.Visible = false;
			Tooltips.Parent = nil;
		else
			Tooltips.Visible = true;

			if NeverLose.Global3DRenderMode then
				Tooltips.Parent = NeverLose.GlobalSurfaceGui;
			else
				Tooltips.Parent = NeverLose.ScreenGui;
			end;
		end
	end)));

	ToolTip.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			Tooltips.Position = UDim2.fromOffset(Container.AbsolutePosition.X + Container.AbsoluteSize.X , Container.AbsolutePosition.Y + (Container.AbsoluteSize.Y + 25));

			NeverLose.PlayAnimate(Tooltips , SlowyTween , {
				BackgroundTransparency = 0.075
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(TooltipName , SlowyTween , {
				TextTransparency = 0
			})

			NeverLose.PlayAnimate(TooltipContent , SlowyTween , {
				TextTransparency = 0.650
			})

			ToolTip.Update();
			Shadow:Render(true);
		else
			NeverLose.PlayAnimate(Tooltips , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(TooltipName , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(TooltipContent , SlowyTween , {
				TextTransparency = 1
			})

			Shadow:Render(false);
		end;
	end);

	ToolTip.SetRender(false);
	ToolTip.Update();

	local DelayThread;
	NeverLose:AddSignal(Container.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
		if DelayThread then
			task.cancel(DelayThread);
			DelayThread = nil;
		end;

		DelayThread = task.delay(1,ToolTip.SetRender,true);
	end)));

	NeverLose:AddSignal(Container.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
		if DelayThread then
			task.cancel(DelayThread);
			DelayThread = nil;
		end;

		ToolTip.SetRender(false);
		ToolTip.Update();
	end)))

	return ToolTip;
end;

function NeverLose:RegisiterItem(Frame: Frame , Signel)
	local idx = {};
	local LayerIndex = Frame.ZIndex;


	function idx:AddImage(Config)
		Config = Config or {}
		local BasedFrame = Instance.new("Frame")
		local Image = Instance.new("ImageLabel")
		local LineFrame = Instance.new("Frame")
		BasedFrame.Name = NeverLose.RandomString();
		BasedFrame.Parent = Frame
		BasedFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		BasedFrame.BackgroundTransparency = 1.000
		BasedFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedFrame.BorderSizePixel = 0
		BasedFrame.Size = Config.Size or UDim2.new(1, 0, 0, 120)
		BasedFrame.ZIndex = LayerIndex + 8
		NeverLose:AddQuery(BasedFrame , "Image");
		Image.Name = NeverLose.RandomString();
		Image.Parent = BasedFrame
		Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Image.BackgroundTransparency = 1.000
		Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Image.BorderSizePixel = 0
		Image.Position = UDim2.new(0, 0, 0, 0)
		Image.Size = UDim2.new(1, 0, 1, 0)
		Image.ZIndex = LayerIndex + 9
		Image.Image = Config.Image or "rbxasset://textures/ui/clb_robux_20@3x.png"
		Image.ScaleType = Config.ScaleType or Enum.ScaleType.Fit
		Image.ImageTransparency = Config.Transparency or 0
		LineFrame.Name = NeverLose.RandomString();
		LineFrame.Parent = BasedFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11
		return Image;
	end;

	function idx:AddColoredLabel(Name: string, Color: Color3)
		local BasedFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		BasedFrame.Name = NeverLose.RandomString();
		BasedFrame.Parent = Frame
		BasedFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		BasedFrame.BackgroundTransparency = 1.000
		BasedFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedFrame.BorderSizePixel = 0
		BasedFrame.Size = UDim2.new(1, 0, 0, 32)
		BasedFrame.ZIndex = LayerIndex + 8
		NeverLose:AddQuery(BasedFrame , Name);
		BasedLabel.Name = NeverLose.RandomString();
		BasedLabel.Parent = BasedFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.Position = UDim2.new(0, 11, 0, 6)
		BasedLabel.Size = UDim2.new(0, 1, 0, 18)
		BasedLabel.ZIndex = LayerIndex + 9
		BasedLabel.Font = Enum.Font.GothamBold
		BasedLabel.Text = Name
		BasedLabel.TextColor3 = Color or Color3.fromRGB(138, 116, 255)
		BasedLabel.TextSize = 16.000
		BasedLabel.TextTransparency = 0
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left
		LineFrame.Name = NeverLose.RandomString();
		LineFrame.Parent = BasedFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11
		return BasedLabel;
	end;

	function idx:AddLabel(Name: string,Warp: boolean)
		local BasedFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local BasedHandler = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local UICorner = Instance.new("UICorner")

		BasedFrame.Name = NeverLose.RandomString();
		BasedFrame.Parent = Frame
		BasedFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		BasedFrame.BackgroundTransparency = 1.000
		BasedFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedFrame.BorderSizePixel = 0
		BasedFrame.Size = UDim2.new(1, 0, 0, 30)
		BasedFrame.ZIndex = LayerIndex + 8

		NeverLose:AddQuery(BasedFrame , Name);

		BasedLabel.Name = NeverLose.RandomString();
		BasedLabel.Parent = BasedFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.Position = UDim2.new(0, 11, 0, 6)
		BasedLabel.Size = UDim2.new(0,1, 0, 15)
		BasedLabel.ZIndex = LayerIndex + 9
		BasedLabel.Font = Enum.Font.GothamMedium
		BasedLabel.Text = Name
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 13.000
		BasedLabel.TextTransparency = 0.35
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

		LineFrame.Name = NeverLose.RandomString();
		LineFrame.Parent = BasedFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		BasedHandler.Name = NeverLose.RandomString();
		BasedHandler.Parent = BasedFrame
		BasedHandler.AnchorPoint = Vector2.new(1, 0)
		BasedHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedHandler.BackgroundTransparency = 1.000
		BasedHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedHandler.BorderSizePixel = 0
		BasedHandler.Position = UDim2.new(1, -11, 0, 2)
		BasedHandler.Size = UDim2.new(1, -20, 0, 25)
		BasedHandler.ZIndex = LayerIndex + 12

		UIListLayout.Parent = BasedHandler
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Padding = UDim.new(0, 5)

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = BasedFrame

		local UpdateWarp = LPH_NO_VIRTUALIZE(function()
			local size = TextService:GetTextSize(BasedLabel.Text , BasedLabel.TextSize , BasedLabel.Font , Vector2.new(math.huge,math.huge));
			NeverLose.PlayAnimate(BasedFrame , SlowyTween , {
				Size = UDim2.new(1, 0, 0, size.Y + 13);
			})

			BasedLabel.Size = UDim2.new(1, -35, 1, 0)
			BasedLabel.TextYAlignment = Enum.TextYAlignment.Top;
		end);

		if Warp then
			UpdateWarp();
		end;

		local handle = NeverLose:RegisiterHandler(BasedHandler , Signel);

		handle.Root = BasedFrame;

		handle.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(BasedFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.35
				})

				NeverLose.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				})
			else
				NeverLose.PlayAnimate(BasedFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				})

				NeverLose.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				})
			end;
		end);

		function handle:SetVisible(val)
			BasedFrame.Visible = val;
		end;

		NeverLose:AddSignal(BasedFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(BasedFrame , SlowyTween , {
				BackgroundTransparency = 0.35
			});

			NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
				TextTransparency = 0.25
			})

		end)))

		NeverLose:AddSignal(BasedFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(BasedFrame , SlowyTween , {
				BackgroundTransparency = 1
			});

			NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
				TextTransparency = 0.35
			})
		end)))

		function handle:SetText(t)
			local oldtxt = BasedLabel.Text;

			BasedLabel.Text = t;

			if Warp and oldtxt ~= t then
				UpdateWarp();
			end;
		end;

		function handle:ToolTip(Content: string)
			handle.ToolTip = NeverLose:CreateToolTips(BasedFrame , Name , Content);

			return handle;
		end;

		handle.SetRender(Signel:GetValue());
		Signel:Connect(handle.SetRender);

		return handle;
	end;

	function idx:AddButton(Config)
		Config = NeverLose:ProcessParams(Config , {
			Icon = 'chevron-large-left',
			Name = "Button",
			Callback = EmptyFunction,
			ToolTip = nil,
		});

		local Button = {};
		local ButtonFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Icon = Instance.new("TextLabel")

		NeverLose:AddQuery(ButtonFrame , Config.Name);

		ButtonFrame.Name = NeverLose.RandomString();
		ButtonFrame.Parent = Frame
		ButtonFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		ButtonFrame.BackgroundTransparency = 1.000
		ButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ButtonFrame.BorderSizePixel = 0
		ButtonFrame.Size = UDim2.new(1, 0, 0, 30)
		ButtonFrame.ZIndex = LayerIndex + 8

		BasedLabel.Name = NeverLose.RandomString();
		BasedLabel.Parent = ButtonFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.Position = UDim2.new(0, 35, 0, 6)
		BasedLabel.Size = UDim2.new(0,1, 0, 15)
		BasedLabel.ZIndex = LayerIndex + 9
		BasedLabel.Font = Enum.Font.GothamMedium
		BasedLabel.Text = Config.Name;
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 13.000
		BasedLabel.TextTransparency = 0.200
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

		LineFrame.Name = NeverLose.RandomString();
		LineFrame.Parent = ButtonFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ButtonFrame

		Icon.Name = NeverLose.RandomString();
		Icon.Parent = ButtonFrame
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 11, 0, 5)
		Icon.Size = UDim2.new(0, 18, 0, 18)
		Icon.ZIndex = LayerIndex + 9
		Icon.FontFace = NeverLose.BuiltInBold
		Icon.Text = Config.Icon
		Icon.TextColor3 = Color3.fromRGB(223, 223, 223)
		Icon.TextSize = 16.000
		Icon.TextTransparency = 0.250
		Icon.TextWrapped = true

		function Button:SetText(t)
			BasedLabel.Text = t;
		end;

		function Button:SetIcon(t)
			Icon.Text = t
		end;

		local bth = NeverLose:CreateInput(ButtonFrame , LPH_NO_VIRTUALIZE(function()
			Config.Callback();
		end));

		NeverLose:AddSignal(bth.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(ButtonFrame , SlowyTween , {
				BackgroundTransparency = 0.35
			});
		end)))

		NeverLose:AddSignal(bth.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(ButtonFrame , SlowyTween , {
				BackgroundTransparency = 1
			});
		end)))

		Button.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(ButtonFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.200
				});

				NeverLose.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				});

				NeverLose.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 0.250
				});
			else
				NeverLose.PlayAnimate(ButtonFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				});

				NeverLose.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 1
				});
			end;
		end);

		if Config.ToolTip then
			Button.ToolTip = NeverLose:CreateToolTips(ButtonFrame , Config.Name , Config.ToolTip);
		end;

		Button.SetRender(Signel:GetValue())
		Signel:Connect(Button.SetRender);

		return Button;
	end;

	function idx:AddUserFrame(Name : string , Profile: string , Expires : string)
		local UserFrame = Instance.new("Frame")
		local UserLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local LogoImage = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local UserStatusLabel = Instance.new("TextLabel")

		UserFrame.Name = NeverLose.RandomString();
		UserFrame.Parent = Frame
		UserFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		UserFrame.BackgroundTransparency = 1.000
		UserFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserFrame.BorderSizePixel = 0
		UserFrame.Size = UDim2.new(1, 0, 0, 60)
		UserFrame.ZIndex = LayerIndex + 8

		UserLabel.Name = NeverLose.RandomString();
		UserLabel.Parent = UserFrame
		UserLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UserLabel.BackgroundTransparency = 1.000
		UserLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserLabel.BorderSizePixel = 0
		UserLabel.Position = UDim2.new(0, 65, 0, 10)
		UserLabel.Size = UDim2.new(1, -35, 0, 15)
		UserLabel.ZIndex = LayerIndex + 9
		UserLabel.Font = Enum.Font.GothamMedium
		UserLabel.Text = Name or 'User'
		UserLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		UserLabel.TextSize = 13.000
		UserLabel.TextTransparency = 0.200
		UserLabel.TextXAlignment = Enum.TextXAlignment.Left

		LineFrame.Name = NeverLose.RandomString();
		LineFrame.Parent = UserFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = UserFrame

		LogoImage.Name = NeverLose.RandomString();
		LogoImage.Parent = UserFrame
		LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogoImage.BackgroundTransparency = 1.000
		LogoImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogoImage.BorderSizePixel = 0
		LogoImage.Position = UDim2.new(0, 10, 0, 5)
		LogoImage.Size = UDim2.new(0, 45, 0, 45)
		LogoImage.ZIndex = LayerIndex + 9
		LogoImage.Image = Profile or "rbxasset://textures/ui/clb_robux_20@3x.png";
		LogoImage.ScaleType = Enum.ScaleType.Fit;

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = LogoImage

		UserStatusLabel.Name = NeverLose.RandomString();
		UserStatusLabel.Parent = UserFrame
		UserStatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UserStatusLabel.BackgroundTransparency = 1.000
		UserStatusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserStatusLabel.BorderSizePixel = 0
		UserStatusLabel.Position = UDim2.new(0, 65, 0, 25)
		UserStatusLabel.Size = UDim2.new(1, -35, 0, 15)
		UserStatusLabel.ZIndex = LayerIndex + 9
		UserStatusLabel.Font = Enum.Font.GothamMedium
		UserStatusLabel.Text = Expires or 'Never'
		UserStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		UserStatusLabel.TextSize = 13.000
		UserStatusLabel.TextTransparency = 0.200
		UserStatusLabel.TextXAlignment = Enum.TextXAlignment.Left

		local UserFrameItem = {};

		UserFrameItem.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				NeverLose.PlayAnimate(UserLabel,SlowyTween,{
					TextTransparency = 0.200
				})

				NeverLose.PlayAnimate(LineFrame,SlowyTween,{
					BackgroundTransparency = 0.650
				})

				NeverLose.PlayAnimate(LogoImage,SlowyTween,{
					ImageTransparency = 0
				})

				NeverLose.PlayAnimate(UserStatusLabel,SlowyTween,{
					TextTransparency = 0.200
				})
			else
				NeverLose.PlayAnimate(UserLabel,SlowyTween,{
					TextTransparency = 1
				})

				NeverLose.PlayAnimate(LineFrame,SlowyTween,{
					BackgroundTransparency = 1
				})

				NeverLose.PlayAnimate(LogoImage,SlowyTween,{
					ImageTransparency = 1
				})

				NeverLose.PlayAnimate(UserStatusLabel,SlowyTween,{
					TextTransparency = 1
				})
			end;
		end);

		UserFrameItem.SetRender(Signel:GetValue())
		Signel:Connect(UserFrameItem.SetRender);

		function UserFrameItem:SetUsername(name)
			UserLabel.Text = name or 'User'
		end;

		function UserFrameItem:SetProfile(Profile)
			LogoImage.Image = Profile or "rbxasset://textures/ui/clb_robux_20@3x.png";
		LogoImage.ScaleType = Enum.ScaleType.Fit;
		end;

		function UserFrameItem:SetExpires(Exp)
			UserStatusLabel.Text = Exp or 'Never';
		end;

		return UserFrameItem;
	end;

	return idx;
end;

function NeverLose:CreateWindow(Config)
	Config = NeverLose:ProcessParams(Config , {
		Logo = NeverLose.GlobalLogo,
		Name = "Neverlose",
		Content = "Counter-Strike 2",
		Size = UDim2.new(0, 640, 0, 480),
		ConfigFolder = "NeverLoseConfigs",
		Enable3DRenderer = false,
		Keybind = "Insert"
	});

	local Window = {
		Logo = Config.Logo,
		Name = Config.Name,
		Content = Config.Content,
		Size = Config.Size,
		ConfigFolder = Config.ConfigFolder,
		Signal = NeverLose:CreateSignal(true),
		Tabs = {},
		CurrentTab = 1,
		Keybind = Config.Keybind,
		Enable3DRenderer = Config.Enable3DRenderer
	};

	NeverLose.GlobalLogo = Window.Logo;

	local Logging = NeverLose:CreateLogger();
	if not isfolder(Window.ConfigFolder) then
		makefolder(Window.ConfigFolder);
	end;

	local WindowFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local LeftMenuFrame = Instance.new("Frame")
	local HeadFrame = Instance.new("Frame")
	local LogoImage = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local WindowName = Instance.new("TextLabel")
	local WindowContent = Instance.new("TextLabel")
	local LineFrame = Instance.new("Frame")
	local LeftScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local BottomFrame = Instance.new("Frame")
	local AccountProfile = Instance.new("ImageLabel")
	local UICorner_3 = Instance.new("UICorner")
	local AccountName = Instance.new("TextLabel")
	local ExpireLabel = Instance.new("TextLabel")
	local LineFrame_2 = Instance.new("Frame")
	local UserSettingButton = Instance.new("TextLabel")
	local RightMenuFrame = Instance.new("Frame")
	local UIStroke = Instance.new("UIStroke")
	local UICorner_4 = Instance.new("UICorner")
	local RightHeader = Instance.new("Frame")
	local LineFrame_3 = Instance.new("Frame")
	local ConfigFrame = Instance.new("Frame")
	local UIStroke_2 = Instance.new("UIStroke")
	local UICorner_5 = Instance.new("UICorner")
	local ConfigIcon = Instance.new("TextLabel")
	local LineFrame_4 = Instance.new("Frame")
	local ConfigName = Instance.new("TextLabel")
	local ConfigBthIcon = Instance.new("TextLabel")
	local SearchFrame = Instance.new("Frame")
	local SearchIcon = Instance.new("TextLabel")
	local SearchBox = Instance.new("TextBox")
	local TabContainer = Instance.new("Frame")

	WindowFrame.Name = NeverLose.RandomString();
	WindowFrame.Parent = NeverLose.ScreenGui;  Window.Root = WindowFrame;
	WindowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	WindowFrame.BackgroundColor3 = NeverLose.MainColor
	WindowFrame.BackgroundTransparency = 0.055
	WindowFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowFrame.BorderSizePixel = 0
	WindowFrame.ClipsDescendants = true
	WindowFrame.Position = UDim2.new(255, 0, 255, 0)
	WindowFrame.Size = Window.Size
	WindowFrame.Active = true;

	if not NeverLose.EnabledBlur then
		WindowFrame.BackgroundTransparency = 0.0255
	end;

	local renderParentWindow = LPH_NO_VIRTUALIZE(function()
		if Window.__3DRender then
			if WindowFrame.BackgroundTransparency > 0.9 then
				WindowFrame.Visible = false;
				WindowFrame.Parent = nil
			else
				WindowFrame.Visible = true;

				NeverLose.PlayAnimate(WindowFrame,VSlowTween , {
					Position = UDim2.fromScale(0.5,0.5);
				});

				WindowFrame.Parent = Window.SurfaceGui;
			end;
		else
			if WindowFrame.BackgroundTransparency > 0.9 then
				WindowFrame.Visible = false;
				WindowFrame.Parent = nil
			else
				WindowFrame.Visible = true;
				WindowFrame.Parent = NeverLose.ScreenGui


			end;
		end;
	end);

	NeverLose:AddSignal(WindowFrame:GetPropertyChangedSignal('BackgroundTransparency'):Connect(renderParentWindow))

	Window.SetRender = LPH_NO_VIRTUALIZE(function(self , value)
		if value then
			NeverLose.PlayAnimate(WindowFrame , SlowyTween , {
				BackgroundTransparency = (NeverLose.EnabledBlur and 0.055) or 0.0255,
				Size = Window.Size
			})

			NeverLose.PlayAnimate(LogoImage , SlowyTween , {
				ImageTransparency = 0
			})

			NeverLose.PlayAnimate(WindowName , SlowyTween , {
				TextTransparency = 0
			})

			NeverLose.PlayAnimate(WindowContent , SlowyTween , {
				TextTransparency = 0.650
			})

			NeverLose.PlayAnimate(LineFrame , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			NeverLose.PlayAnimate(AccountProfile , SlowyTween , {
				ImageTransparency = 0
			})

			NeverLose.PlayAnimate(AccountName , SlowyTween , {
				TextTransparency = 0
			})

			NeverLose.PlayAnimate(ExpireLabel , SlowyTween , {
				TextTransparency = 0.650
			})

			NeverLose.PlayAnimate(LineFrame_2 , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			NeverLose.PlayAnimate(UserSettingButton , SlowyTween , {
				TextTransparency = 0.5
			})

			NeverLose.PlayAnimate(RightMenuFrame , SlowyTween , {
				BackgroundTransparency = 0.600
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(LineFrame_3 , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			NeverLose.PlayAnimate(ConfigFrame , SlowyTween , {
				BackgroundTransparency = 0.750
			})

			NeverLose.PlayAnimate(UIStroke_2 , SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(ConfigIcon , SlowyTween , {
				TextTransparency = 0.250
			})

			NeverLose.PlayAnimate(LineFrame_4 , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			NeverLose.PlayAnimate(ConfigName , SlowyTween , {
				TextTransparency = 0.350
			})

			NeverLose.PlayAnimate(ConfigBthIcon , SlowyTween , {
				TextTransparency = 0.250
			})

			NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
				TextTransparency = 0.250
			})

			NeverLose.PlayAnimate(SearchBox , SlowyTween , {
				TextTransparency = 0.350
			})

			Window.Shadow:Render(true);
		else

			NeverLose.PlayAnimate(WindowFrame , SlowyTween , {
				BackgroundTransparency = 1,
				Size = Window.Size + UDim2.fromOffset(-15,-15)
			})

			NeverLose.PlayAnimate(LogoImage , SlowyTween , {
				ImageTransparency = 1
			})

			NeverLose.PlayAnimate(WindowName , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(WindowContent , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(LineFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(AccountProfile , SlowyTween , {
				ImageTransparency = 1
			})

			NeverLose.PlayAnimate(AccountName , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(ExpireLabel , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(LineFrame_2 , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UserSettingButton , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(RightMenuFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(LineFrame_3 , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(ConfigFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke_2 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(ConfigIcon , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(LineFrame_4 , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(ConfigName , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(ConfigBthIcon , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(SearchBox , SlowyTween , {
				TextTransparency = 1
			})

			Window.Shadow:Render(false);
		end;
	end);

	Window.Shadow = NeverLose:CreateShadow(WindowFrame);
	Window.Shadow:Render(false);

	task.delay(0.25,function()
		WindowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Window:SetRender(true);
		NeverLose:AddSignal(Window.Signal:Connect(LPH_NO_VIRTUALIZE(function(...)
			Window:SetRender(...);
		end)))
	end)

	if NeverLose.EnabledBlur then
		NeverLose:CreateBlurModule(WindowFrame,Window.Signal);
	end;

	do
		local Frame = Instance.new("Frame")

		Frame.Parent = WindowFrame
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(1, 0, 0, 50)
		Frame.ZIndex = 7
		Frame.BackgroundTransparency = 1;

		NeverLose.Drag(Frame , WindowFrame , 0.15)
	end

	UICorner.Parent = WindowFrame

	LeftMenuFrame.Name = NeverLose.RandomString();
	LeftMenuFrame.Parent = WindowFrame
	LeftMenuFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftMenuFrame.BackgroundTransparency = 1.000
	LeftMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftMenuFrame.BorderSizePixel = 0
	LeftMenuFrame.Size = UDim2.new(0, 175, 1, 0)

	HeadFrame.Name = NeverLose.RandomString();
	HeadFrame.Parent = LeftMenuFrame
	HeadFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HeadFrame.BackgroundTransparency = 1.000
	HeadFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeadFrame.BorderSizePixel = 0
	HeadFrame.Size = UDim2.new(1, 0, 0, 50)
	HeadFrame.ZIndex = 7

	LogoImage.Name = NeverLose.RandomString();
	LogoImage.Parent = HeadFrame
	LogoImage.AnchorPoint = Vector2.new(0, 0.5)
	LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoImage.BackgroundTransparency = 1.000
	LogoImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoImage.BorderSizePixel = 0
	LogoImage.Position = UDim2.new(0, 10, 0.5, 0)
	LogoImage.Size = UDim2.new(0, 35, 0, 35)
	LogoImage.AnchorPoint = Vector2.new(0.5, 0.5); LogoImage.Position = UDim2.new(0, 32, 0.5, 0); LogoImage.Size = UDim2.new(0, 56, 0, 56)
	LogoImage.ZIndex = 7
	LogoImage.Image = Window.Logo
	LogoImage.ScaleType = Enum.ScaleType.Fit;
	LogoImage.ImageColor3 = NeverLose.IconColor

	UICorner_2.CornerRadius = UDim.new(0, 7)
	UICorner_2.Parent = LogoImage

	WindowName.Name = NeverLose.RandomString();
	WindowName.Parent = HeadFrame
	WindowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.BackgroundTransparency = 1.000
	WindowName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowName.BorderSizePixel = 0
	WindowName.Position = UDim2.new(0, 70, 0, 10)
	WindowName.Size = UDim2.new(0, 260, 0, 30)
	WindowName.ZIndex = 7
	WindowName.Font = Enum.Font.GothamMedium
	WindowName.Text = string.upper(tostring(Window.Name or "WRAITH"))  Window.NameLabel = WindowName;
    local HeadSep = Instance.new("Frame")
    HeadSep.Name = NeverLose.RandomString();
    HeadSep.Parent = HeadFrame
    HeadSep.BackgroundColor3 = Color3.fromRGB(140, 142, 150)
    HeadSep.BackgroundTransparency = 0.600
    HeadSep.BorderColor3 = Color3.fromRGB(0, 0, 0)
    HeadSep.BorderSizePixel = 0
    HeadSep.Position = UDim2.new(0, 62, 0, 19)
    HeadSep.Size = UDim2.new(0, 1, 0, 14)
    HeadSep.ZIndex = 7
	WindowName.TextColor3 = NeverLose.AccentColor
	WindowName.TextSize = 24.000
	WindowName.TextXAlignment = Enum.TextXAlignment.Left
	local NameGrad = Instance.new("UIGradient")
	NameGrad.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(190, 180, 255), Color3.fromRGB(255, 255, 255))
	NameGrad.Parent = WindowName
	task.spawn(function()
		while WindowName and WindowName.Parent do
			NameGrad.Offset = Vector2.new(math.sin(tick() * 2) * 0.7, 0)
			task.wait(0.03)
		end
	end)

	WindowContent.Name = NeverLose.RandomString();
	WindowContent.Parent = HeadFrame
	WindowContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowContent.BackgroundTransparency = 1.000
	WindowContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowContent.BorderSizePixel = 0
	WindowContent.Position = UDim2.new(0, 55, 0, 34)
	WindowContent.Size = UDim2.new(0, 220, 0, 13)
	WindowContent.ZIndex = 7
	WindowContent.Font = Enum.Font.GothamBold
	WindowContent.Text = Window.Content
	WindowContent.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowContent.TextSize = 9.000
	WindowContent.TextTransparency = 0.650
	WindowContent.TextXAlignment = Enum.TextXAlignment.Left

	LineFrame.Name = NeverLose.RandomString();
	LineFrame.Parent = HeadFrame
	LineFrame.AnchorPoint = Vector2.new(0.5, 1)
	LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame.BackgroundTransparency = 0.650
	LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame.BorderSizePixel = 0
	LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
	LineFrame.Size = UDim2.new(1, -10, 0, 1)
	LineFrame.ZIndex = 5

	LeftScrollingFrame.Name = NeverLose.RandomString();
	LeftScrollingFrame.Parent = LeftMenuFrame
	LeftScrollingFrame.Active = true
	LeftScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
	LeftScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftScrollingFrame.BackgroundTransparency = 1.000
	LeftScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftScrollingFrame.BorderSizePixel = 0
	LeftScrollingFrame.Position = UDim2.new(0.5, 0, 0, 60)
	LeftScrollingFrame.Size = UDim2.new(1, -10, 1, -115)
	LeftScrollingFrame.ZIndex = 7
	LeftScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = LeftScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	NeverLose:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
		LeftScrollingFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y + 1)
	end)))

	BottomFrame.Name = NeverLose.RandomString();
	BottomFrame.Parent = LeftMenuFrame
	BottomFrame.AnchorPoint = Vector2.new(0, 1)
	BottomFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BottomFrame.BackgroundTransparency = 1.000
	BottomFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BottomFrame.BorderSizePixel = 0
	BottomFrame.Position = UDim2.new(0, 0, 1, 0)
	BottomFrame.Size = UDim2.new(1, 0, 0, 50)
	BottomFrame.ZIndex = 7

	AccountProfile.Name = NeverLose.RandomString();
	AccountProfile.Parent = BottomFrame
	AccountProfile.AnchorPoint = Vector2.new(0, 0.5)
	AccountProfile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AccountProfile.BackgroundTransparency = 1.000
	AccountProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AccountProfile.BorderSizePixel = 0
	AccountProfile.Position = UDim2.new(0, 10, 0.5, 0)
	AccountProfile.Size = UDim2.new(0, 35, 0, 35)
	AccountProfile.ZIndex = 7
	AccountProfile.Image = NeverLose.UserProfile or ""

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = AccountProfile

	AccountName.Name = NeverLose.RandomString();
	AccountName.Parent = BottomFrame
	AccountName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AccountName.BackgroundTransparency = 1.000
	AccountName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AccountName.BorderSizePixel = 0
	AccountName.Position = UDim2.new(0, 55, 0, 5)
	AccountName.Size = UDim2.new(0, 100, 0, 25)
	AccountName.ZIndex = 7
	AccountName.Font = Enum.Font.GothamBold
	AccountName.Text = ""
	AccountName.TextColor3 = Color3.fromRGB(255, 255, 255)
	AccountName.TextSize = 14.000
	AccountName.TextXAlignment = Enum.TextXAlignment.Left
	AccountName.TextTruncate = Enum.TextTruncate.SplitWord;

	ExpireLabel.Name = NeverLose.RandomString();
	ExpireLabel.Parent = BottomFrame
	ExpireLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExpireLabel.BackgroundTransparency = 1.000
	ExpireLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ExpireLabel.BorderSizePixel = 0
	ExpireLabel.Position = UDim2.new(0, 55, 0, 25)
	ExpireLabel.Size = UDim2.new(0, 200, 0, 15)
	ExpireLabel.ZIndex = 7
	ExpireLabel.Font = Enum.Font.GothamBold
	ExpireLabel.Text = "never"
	ExpireLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	ExpireLabel.TextSize = 10.000
	ExpireLabel.TextTransparency = 0.650
	ExpireLabel.TextXAlignment = Enum.TextXAlignment.Left

	LineFrame_2.Name = NeverLose.RandomString();
	LineFrame_2.Parent = BottomFrame
	LineFrame_2.AnchorPoint = Vector2.new(0.5, 0)
	LineFrame_2.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame_2.BackgroundTransparency = 0.650
	LineFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame_2.BorderSizePixel = 0
	LineFrame_2.Position = UDim2.new(0.5, 0, 0, 0)
	LineFrame_2.Size = UDim2.new(1, -10, 0, 1)
	LineFrame_2.ZIndex = 5

	UserSettingButton.Name = NeverLose.RandomString();
	UserSettingButton.Parent = BottomFrame
	UserSettingButton.AnchorPoint = Vector2.new(1, 0.5)
	UserSettingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingButton.BackgroundTransparency = 1.000
	UserSettingButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserSettingButton.BorderSizePixel = 0
	UserSettingButton.Position = UDim2.new(1, -7, 0.5, 0)
	UserSettingButton.Size = UDim2.new(0, 25, 0, 25)
	UserSettingButton.ZIndex = 7
	UserSettingButton.FontFace = NeverLose.BuiltInBold
	UserSettingButton.Text = "chevron-large-right"
	UserSettingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingButton.TextSize = 13.000
	UserSettingButton.TextTransparency = 0.5

	NeverLose:AddSignal(BottomFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
		NeverLose.PlayAnimate(UserSettingButton,SlowyTween , {
			TextTransparency = 0.25
		})		
	end)))

	NeverLose:AddSignal(BottomFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
		NeverLose.PlayAnimate(UserSettingButton,SlowyTween , {
			TextTransparency = 0.5
		})		
	end)))

	RightMenuFrame.Name = NeverLose.RandomString();
	RightMenuFrame.Parent = WindowFrame
	RightMenuFrame.BackgroundColor3 = NeverLose.MainColor
	RightMenuFrame.BackgroundTransparency = 0.600
	RightMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RightMenuFrame.BorderSizePixel = 0
	RightMenuFrame.ClipsDescendants = true
	RightMenuFrame.Position = UDim2.new(0, 176, 0, 0)
	RightMenuFrame.Size = UDim2.new(1, -176, 1, 0)
	RightMenuFrame.ZIndex = 8

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = RightMenuFrame

	UICorner_4.CornerRadius = UDim.new(0, 13)
	UICorner_4.Parent = RightMenuFrame

	RightHeader.Name = NeverLose.RandomString();
	RightHeader.Parent = RightMenuFrame
	RightHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RightHeader.BackgroundTransparency = 1.000
	RightHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RightHeader.BorderSizePixel = 0
	RightHeader.Size = UDim2.new(1, 0, 0, 50)
	RightHeader.ZIndex = 9

	LineFrame_3.Name = NeverLose.RandomString();
	LineFrame_3.Parent = RightHeader
	LineFrame_3.AnchorPoint = Vector2.new(0.5, 1)
	LineFrame_3.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame_3.BackgroundTransparency = 0.650
	LineFrame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame_3.BorderSizePixel = 0
	LineFrame_3.Position = UDim2.new(0.5, 0, 1, 0)
	LineFrame_3.Size = UDim2.new(1, -10, 0, 1)
	LineFrame_3.ZIndex = 9

	ConfigFrame.Name = NeverLose.RandomString();
	ConfigFrame.Parent = RightHeader
	ConfigFrame.AnchorPoint = Vector2.new(0, 0.5)
	ConfigFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 22)
	ConfigFrame.BackgroundTransparency = 0.750
	ConfigFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigFrame.BorderSizePixel = 0
	ConfigFrame.Position = UDim2.new(0, 10, 0.5, 0)
	ConfigFrame.Size = UDim2.new(0, 115, 0, 30)
	ConfigFrame.ZIndex = 9

	UIStroke_2.Transparency = 0.650
	UIStroke_2.Color = Color3.fromRGB(45, 48, 58)
	UIStroke_2.Parent = ConfigFrame

	UICorner_5.CornerRadius = UDim.new(0, 4)
	UICorner_5.Parent = ConfigFrame

	ConfigIcon.Name = NeverLose.RandomString();
	ConfigIcon.Parent = ConfigFrame
	ConfigIcon.AnchorPoint = Vector2.new(0, 0.5)
	ConfigIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigIcon.BackgroundTransparency = 1.000
	ConfigIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigIcon.BorderSizePixel = 0
	ConfigIcon.Position = UDim2.new(0, 2, 0.5, 0)
	ConfigIcon.Size = UDim2.new(0, 25, 0, 25)
	ConfigIcon.ZIndex = 9
	ConfigIcon.FontFace = NeverLose.BuiltInBold
	ConfigIcon.Text = "floppy-disk"
	ConfigIcon.TextColor3 = Color3.fromRGB(223, 223, 223)
	ConfigIcon.TextSize = 16.000
	ConfigIcon.TextTransparency = 0.250
	ConfigIcon.TextWrapped = true

	LineFrame_4.Name = NeverLose.RandomString();
	LineFrame_4.Parent = ConfigFrame
	LineFrame_4.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame_4.BackgroundTransparency = 0.650
	LineFrame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame_4.BorderSizePixel = 0
	LineFrame_4.Position = UDim2.new(0, 30, 0, 0)
	LineFrame_4.Size = UDim2.new(0, 1, 1, 0)

	ConfigName.Name = NeverLose.RandomString();
	ConfigName.Parent = ConfigFrame
	ConfigName.AnchorPoint = Vector2.new(0, 0.5)
	ConfigName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigName.BackgroundTransparency = 1.000
	ConfigName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigName.BorderSizePixel = 0
	ConfigName.Position = UDim2.new(0, 40, 0.5, 0)
	ConfigName.Size = UDim2.new(1, -7, 0, 15)
	ConfigName.ZIndex = 9
	ConfigName.Font = Enum.Font.GothamMedium
	ConfigName.Text = "Default"
	ConfigName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ConfigName.TextSize = 12.000
	ConfigName.TextTransparency = 0.350
	ConfigName.TextXAlignment = Enum.TextXAlignment.Left

	ConfigBthIcon.Name = NeverLose.RandomString();
	ConfigBthIcon.Parent = ConfigFrame
	ConfigBthIcon.AnchorPoint = Vector2.new(1, 0.5)
	ConfigBthIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigBthIcon.BackgroundTransparency = 1.000
	ConfigBthIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigBthIcon.BorderSizePixel = 0
	ConfigBthIcon.Position = UDim2.new(1, -2, 0.5, 0)
	ConfigBthIcon.Size = UDim2.new(0, 25, 0, 25)
	ConfigBthIcon.ZIndex = 9
	ConfigBthIcon.FontFace = NeverLose.BuiltInBold
	ConfigBthIcon.Text = "chevron-small-down"
	ConfigBthIcon.TextColor3 = Color3.fromRGB(223, 223, 223)
	ConfigBthIcon.TextSize = 16.000
	ConfigBthIcon.TextTransparency = 0.250
	ConfigBthIcon.TextWrapped = true

	SearchFrame.Name = NeverLose.RandomString();
	SearchFrame.Parent = RightHeader
	SearchFrame.AnchorPoint = Vector2.new(1, 0.5)
	SearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchFrame.BackgroundTransparency = 1.000
	SearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchFrame.BorderSizePixel = 0
	SearchFrame.ClipsDescendants = true
	SearchFrame.Position = UDim2.new(1, -10, 0.5, 0)
	SearchFrame.Size = UDim2.new(0, 30, 0, 30)
	SearchFrame.ZIndex = 12

	SearchIcon.Name = NeverLose.RandomString();
	SearchIcon.Parent = SearchFrame
	SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
	SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIcon.BackgroundTransparency = 1.000
	SearchIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchIcon.BorderSizePixel = 0
	SearchIcon.Position = UDim2.new(0, 2, 0.5, 0)
	SearchIcon.Size = UDim2.new(0, 25, 0, 25)
	SearchIcon.ZIndex = 12
	SearchIcon.FontFace = NeverLose.BuiltInBold
	SearchIcon.Text = "magnifying-glass"
	SearchIcon.TextColor3 = Color3.fromRGB(223, 223, 223)
	SearchIcon.TextSize = 14.000
	SearchIcon.TextTransparency = 0.45
	SearchIcon.TextWrapped = true

	SearchBox.Name = NeverLose.RandomString();
	SearchBox.Parent = SearchFrame
	SearchBox.AnchorPoint = Vector2.new(0, 0.5)
	SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.BackgroundTransparency = 1.000
	SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchBox.BorderSizePixel = 0
	SearchBox.Position = UDim2.new(0, 35, 0.5, 0)
	SearchBox.Size = UDim2.new(1, -35, 0, 25)
	SearchBox.ZIndex = 12
	SearchBox.ClearTextOnFocus = false
	SearchBox.Font = Enum.Font.GothamMedium
	SearchBox.PlaceholderText = "Search"
	SearchBox.Text = ""
	SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.TextSize = 13.000
	SearchBox.TextTransparency = 1
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left

	TabContainer.Name = NeverLose.RandomString();
	TabContainer.Parent = RightMenuFrame
	TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContainer.BackgroundTransparency = 1.000
	TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer.BorderSizePixel = 0
	TabContainer.ClipsDescendants = true
	TabContainer.Position = UDim2.new(0, 0, 0, 50)
	TabContainer.Size = UDim2.new(1, 0, 1, -50)
	TabContainer.ZIndex = 5

	do
		Window.Searching = false;
		local Input = NeverLose:CreateInput(SearchIcon , LPH_NO_VIRTUALIZE(function()
			Window.Searching = not Window.Searching;

			if Window.Searching then
				NeverLose.PlayAnimate(SearchFrame , VSlowTween , {
					Size = UDim2.new(0, 220, 0, 30)
				})

				NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.25
				})

				NeverLose.PlayAnimate(SearchBox , VSlowTween , {
					TextTransparency = 0.350
				})
			else
				NeverLose.PlayAnimate(SearchFrame , VSlowTween , {
					Size = UDim2.new(0, 30, 0, 30)
				})

				NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.45
				})

				NeverLose.PlayAnimate(SearchBox , SlowyTween , {
					TextTransparency = 1
				})

				SearchBox.Text = "";
			end;
		end));	

		local wati_for_finish = tick();
		local last_thread;
		local max_time = 0.2;

		NeverLose:AddSignal(SearchBox:GetPropertyChangedSignal('Text'):Connect(LPH_NO_VIRTUALIZE(function()
			if not SearchBox.Text:byte() then
				for i,v in next , NeverLose.NameRegisitry do
					v.Root.Visible = true;
				end;

				return;	
			end;

			wati_for_finish = tick();

			if last_thread then
				task.cancel(last_thread);
				last_thread = nil;
			end;

			last_thread = task.delay(max_time,function()
				if SearchBox.Text:byte() and (tick() - wati_for_finish) > max_time then
					for i,v in next , NeverLose.NameRegisitry do
						if string.find(string.lower(v.Idx) , string.lower(SearchBox.Text), 1, true) then
							v.Root.Visible = true;
						else
							v.Root.Visible = false;
						end;
					end;
				end;
			end);
		end)));

		NeverLose:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
				TextTransparency = 0.25
			})
		end)))

		NeverLose:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			if Window.Searching then
				NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.25
				})
			else
				NeverLose.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.45
				})
			end;
		end)));
	end;

	if Window.Enable3DRenderer then
		local Part = Instance.new('Part');

		Part.Name = NeverLose.RandomString();
		Part.Anchored = true;
		Part.Transparency = 1;
		Part.CanCollide = false;
		Part.CanTouch = false;
		Part.AudioCanCollide = false;
		Part.CollisionGroup = NeverLose.RandomString();
		Part.CFrame = CFrame.new(0,0,0);
		Part.Size = Vector3.zero;

		local SurfaceGui = Instance.new("SurfaceGui")

		SurfaceGui.Parent = NeverLose.ScreenGui;
		SurfaceGui.Adornee = Part;
		SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		SurfaceGui.AlwaysOnTop = true
		SurfaceGui.LightInfluence = 1.000
		SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
		SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize;
		SurfaceGui.PixelsPerStud = 40;

		Window.SurfaceGui = SurfaceGui;
		NeverLose.GlobalSurfaceGui = SurfaceGui;

		local PerfectScale = Vector2.new(1920 , 1080 + 300)

		Window.Load3DBlock = LPH_NO_VIRTUALIZE(function()
			if not Window.Signal:GetValue() then
				local _,OnScreen = CurrentCamera:WorldToViewportPoint(Part.Position);

				if OnScreen then
					NeverLose.PlayAnimate(Part,VSlowTween , {
						CFrame = CurrentCamera.CFrame * CFrame.new(0,0,-15) * CFrame.Angles(0,math.rad(180),0);
					});
				end;

				return
			end;

			local Dimensions = 50;

			local XY_Incom = Vector2.new(PerfectScale.X + 5, PerfectScale.Y * 1.35) / (Dimensions / 2);
			local PerfectDistance = XY_Incom.Magnitude;
			local SizeIndicator = PerfectDistance / 1.35;

			Part.Parent = NeverLose.BlurModuleParent or workspace;

			NeverLose.PlayAnimate(Part,VSlowTween , {
				CFrame = (CurrentCamera.CFrame * CFrame.new(0,0,-25)) * CFrame.Angles(0,math.rad(180),0);
			});

			Part.Size = Vector3.new(PerfectScale.X / SizeIndicator,PerfectScale.Y / SizeIndicator,0);
		end);

		function Window:Set3DRender(val)
			Window.__3DRender = val;
			NeverLose.Global3DRenderMode = val;

			if val then
				Window.Load3DBlock();
			else


				Part.Parent = nil;
			end;

			renderParentWindow();
		end;
	end;

	function Window:AddTabLabel(Name: string)
		local TabLabel = Instance.new("TextLabel")

		TabLabel.Name = NeverLose.RandomString()
		TabLabel.Parent = LeftScrollingFrame
		TabLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabLabel.BackgroundTransparency = 1.000
		TabLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabLabel.BorderSizePixel = 0
		TabLabel.Size = UDim2.new(1, -7, 0, 15)
		TabLabel.ZIndex = 8
		TabLabel.Font = Enum.Font.GothamMedium
		TabLabel.Text = Name
		TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabLabel.TextSize = 11.000
		TabLabel.TextTransparency = 0.500
		TabLabel.TextXAlignment = Enum.TextXAlignment.Left

		local SetRender = LPH_NO_VIRTUALIZE(function(val)
			if val then
				NeverLose.PlayAnimate(TabLabel , SlowyTween,{
					TextTransparency = 0.500
				})
			else
				NeverLose.PlayAnimate(TabLabel , SlowyTween,{
					TextTransparency = 1
				})
			end
		end)

		SetRender(Window.Signal:GetValue());

		return Window.Signal:Connect(SetRender);
	end;

	function Window:AddTab(Config)
		Config = NeverLose:ProcessParams(Config , {
			Icon = "crosshairs",
			Name = "Tab",
			Type = "Double"
		});

		local Tab = {
			Signal = NeverLose:CreateSignal(false);
		};

		local TabButton = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local TabIcon = Instance.new("TextLabel")
		local TabContentLabel = Instance.new("TextLabel")

		Tab.Idx = TabButton;

		TabButton.Name = NeverLose.RandomString();
		TabButton.Parent = LeftScrollingFrame
		TabButton.BackgroundColor3 = Color3.fromRGB(41, 45, 49)
		TabButton.BackgroundTransparency = 0.500
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(1, -1, 0, 30)
		TabButton.ZIndex = 8

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = TabButton

		TabIcon.Name = NeverLose.RandomString();
		TabIcon.Parent = TabButton
		TabIcon.AnchorPoint = Vector2.new(0, 0.5)
		TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabIcon.BackgroundTransparency = 1.000
		TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabIcon.BorderSizePixel = 0
		TabIcon.Position = UDim2.new(0, 2, 0.5, 0)
		TabIcon.Size = UDim2.new(0, 25, 0, 25)
		TabIcon.ZIndex = 9
		TabIcon.FontFace = NeverLose.BuiltInBold
		local _wasset = (type(getgenv().WraithIconFor) == "function") and getgenv().WraithIconFor(Config.Icon) or nil;
		if string.find(Config.Icon, "rbxassetid") then
			local img = Instance.new("ImageLabel");
			img.BackgroundTransparency = 1;
			img.Image = Config.Icon;
			img.Name = "WraithTabImg";
			img.ScaleType = Enum.ScaleType.Fit;
			img.Size = (Config.Name == "defense") and UDim2.new(0, 28, 0, 28) or (Config.Name == "target") and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 16, 0, 16);
			img.AnchorPoint = Vector2.new(0, 0.5);
			img.Position = (Config.Name == "defense") and UDim2.new(0, 0, 0.5, 0) or (Config.Name == "target") and UDim2.new(0, 4, 0.5, 0) or UDim2.new(0, 5, 0.5, 0);
			img.ZIndex = 9;
			img.Parent = TabButton;
			TabIcon.Text = "";
		elseif false then
			local _wimg = Instance.new("ImageLabel");
			_wimg.BackgroundTransparency = 1;
			_wimg.Image = _wasset;
			_wimg.Name = "WraithTabImg";
			_wimg.Size = (Config.Name == "defense") and UDim2.new(0, 28, 0, 28) or (Config.Name == "target") and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 16, 0, 16);
			_wimg.AnchorPoint = Vector2.new(0, 0.5);
			_wimg.Position = (Config.Name == "defense") and UDim2.new(0, 0, 0.5, 0) or (Config.Name == "target") and UDim2.new(0, 4, 0.5, 0) or UDim2.new(0, 5, 0.5, 0);
			_wimg.ScaleType = Enum.ScaleType.Fit;
			_wimg.Parent = TabButton;
			TabIcon.Text = "";
		else
			TabIcon.Font = Enum.Font.GothamBold;
			TabIcon.Text = string.upper(string.sub(tostring(Config.Name or "?"), 1, 1));
		end;
		TabIcon.TextColor3 = NeverLose.AccentColor
		TabIcon.TextSize = 16.000
		TabIcon.TextWrapped = true

		TabContentLabel.Name = NeverLose.RandomString();
		TabContentLabel.Parent = TabButton
		TabContentLabel.AnchorPoint = Vector2.new(0, 0.5)
		TabContentLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContentLabel.BackgroundTransparency = 1.000
		TabContentLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabContentLabel.BorderSizePixel = 0
		TabContentLabel.Position = UDim2.new(0, 30, 0.5, 0)
		TabContentLabel.Size = UDim2.new(1, -7, 0, 15)
		TabContentLabel.ZIndex = 9
		TabContentLabel.Font = Enum.Font.GothamMedium
		TabContentLabel.Text = Config.Name
		TabContentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabContentLabel.TextSize = 12.000
		TabContentLabel.TextXAlignment = Enum.TextXAlignment.Left

		local TabFrame = Instance.new("Frame")
		local LeftScroll = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local RightScroll = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		TabFrame.Name = NeverLose.RandomString();
		TabFrame.Parent = TabContainer
		TabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabFrame.BackgroundTransparency = 1.000
		TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabFrame.BorderSizePixel = 0
		TabFrame.ClipsDescendants = true
		TabFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabFrame.Size = UDim2.new(1, 0, 1, 0)
		TabFrame.Visible = true;

		LeftScroll.Name = NeverLose.RandomString();
		LeftScroll.Parent = TabFrame
		LeftScroll.Active = true
		LeftScroll.AnchorPoint = Vector2.new(0.5, 0.5)
		LeftScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LeftScroll.BackgroundTransparency = 1.000
		LeftScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LeftScroll.BorderSizePixel = 0
		LeftScroll.ClipsDescendants = false
		LeftScroll.Position = UDim2.new(0.25, 0, 0.5, 0)
		LeftScroll.Size = UDim2.new(0.5, 0, 1, -5)
		LeftScroll.ScrollBarThickness = 0

		UIListLayout.Parent = LeftScroll
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		NeverLose:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			LeftScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y + 1)
		end)))

		RightScroll.Name = NeverLose.RandomString();
		RightScroll.Parent = TabFrame
		RightScroll.Active = true
		RightScroll.AnchorPoint = Vector2.new(0.5, 0.5)
		RightScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		RightScroll.BackgroundTransparency = 1.000
		RightScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		RightScroll.BorderSizePixel = 0
		RightScroll.ClipsDescendants = false
		RightScroll.Position = UDim2.new(0.75, 0, 0.5, 0)
		RightScroll.Size = UDim2.new(0.5, 0, 1, -5)
		RightScroll.ScrollBarThickness = 0

		UIListLayout_2.Parent = RightScroll
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		if Config.Type == "Single" then
			UIListLayout_2:Destroy();
			RightScroll:Destroy();
			RightScroll = LeftScroll;
			UIListLayout_2 = UIListLayout;
			LeftScroll.Size = UDim2.new(1, 0, 1, -5);
			LeftScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
		else
			NeverLose:AddSignal(UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
				RightScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout_2.AbsoluteContentSize.Y + 1)
			end)))
		end;

		NeverLose:AddSignal(TabIcon:GetPropertyChangedSignal('TextTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if TabIcon.TextTransparency > 0.4 then
				UIListLayout.Parent = nil;
				UIListLayout_2.Parent = nil;
				TabFrame.Visible = false;
				TabFrame.Parent = nil
			else
				UIListLayout.Parent = LeftScroll;
				UIListLayout_2.Parent = RightScroll;
				TabFrame.Visible = true;
				TabFrame.Parent = TabContainer;
			end;
		end)));

		Tab.SetValue = LPH_NO_VIRTUALIZE(function(value)
			Tab.Signal:SetValue(value);

			if value then
				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.500
				})

				NeverLose.PlayAnimate(TabIcon , SlowyTween , {
					TextTransparency = 0,
					TextColor3 = NeverLose.AccentColor
				})
				local _ti = TabButton:FindFirstChild("WraithTabImg");
				if _ti then _ti.ImageColor3 = NeverLose.AccentColor end

				NeverLose.PlayAnimate(TabContentLabel , SlowyTween , {
					TextTransparency = 0
				})
			else
				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 1
				})

				NeverLose.PlayAnimate(TabIcon , SlowyTween , {
					TextTransparency = 0.5,
					TextColor3 = Color3.fromRGB(252, 252, 252)
				})
				local _ti2 = TabButton:FindFirstChild("WraithTabImg");
				if _ti2 then _ti2.ImageColor3 = Color3.fromRGB(252, 252, 252) end

				NeverLose.PlayAnimate(TabContentLabel , SlowyTween , {
					TextTransparency = 0.5
				})
			end;
		end);

		table.insert(Window.Tabs,Tab);

		if Window.Tabs[Window.CurrentTab] == Tab then
			Tab.SetValue(true)
		else
			Tab.SetValue(false);
		end;

		local over = NeverLose:CreateInput(TabButton,LPH_NO_VIRTUALIZE(function()
			for i,v in next , Window.Tabs do
				if v.Idx == TabButton then
					v.SetValue(true);
					Window.CurrentTab = i;
				else
					v.SetValue(false);
				end;
			end;
		end));

		NeverLose:AddSignal(over.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			if Window.Tabs[Window.CurrentTab] == Tab then
				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.500
				})
			else
				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.8
				})
			end;
		end)))

		NeverLose:AddSignal(over.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			if Window.Tabs[Window.CurrentTab] == Tab then
				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.500
				})
			else
				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 1
				})
			end;
		end)))

		Window.Signal:Connect(LPH_NO_VIRTUALIZE(function(value)
			if value then
				if Window.Tabs[Window.CurrentTab] == Tab then
					Tab.SetValue(true)
				else
					Tab.SetValue(false);
				end;
			else
				Tab.SetValue(false);

				NeverLose.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 1
				})

				NeverLose.PlayAnimate(TabIcon , SlowyTween , {
					TextTransparency = 1,
				})

				NeverLose.PlayAnimate(TabContentLabel , SlowyTween , {
					TextTransparency = 1
				})
			end;
		end));

		function Tab:AddSection(Config)
			Config = NeverLose:ProcessParams(Config , {
				Name = "SECTION",
				Position = 'left'
			});

			local SectionFrame = Instance.new("Frame")
			local SectionLabel = Instance.new("TextLabel")
			local SectionHandler = Instance.new("Frame")
			local UIStroke = Instance.new("UIStroke")
			local UICorner = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")

			SectionFrame.Name = NeverLose.RandomString();
			SectionFrame.Parent = (string.lower(Config.Position) == 'left' and LeftScroll) or RightScroll
			SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionFrame.BackgroundTransparency = 1.000
			SectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionFrame.BorderSizePixel = 0
			SectionFrame.ClipsDescendants = true
			SectionFrame.Size = UDim2.new(1, -5, 0, 0)
			SectionFrame.ZIndex = 9

			SectionLabel.Name = NeverLose.RandomString();
			SectionLabel.Parent = SectionFrame
			SectionLabel.AnchorPoint = Vector2.new(0.5, 0)
			SectionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionLabel.BackgroundTransparency = 1.000
			SectionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionLabel.BorderSizePixel = 0
			SectionLabel.Position = UDim2.new(0.5, 0, 0, 0)
			SectionLabel.Size = UDim2.new(1, -35, 0, 15)
			SectionLabel.ZIndex = 9
			SectionLabel.Font = Enum.Font.GothamMedium
			SectionLabel.Text = Config.Name
			SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionLabel.TextSize = 11.000
			SectionLabel.TextTransparency = 0.500
			SectionLabel.TextXAlignment = Enum.TextXAlignment.Left

			SectionHandler.Name = NeverLose.RandomString();
			SectionHandler.Parent = SectionFrame
			SectionHandler.AnchorPoint = Vector2.new(0.5, 0)
			SectionHandler.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
			SectionHandler.BackgroundTransparency = 0.500
			SectionHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionHandler.BorderSizePixel = 0
			SectionHandler.ClipsDescendants = true
			SectionHandler.Position = UDim2.new(0.5, 0, 0, 20)
			SectionHandler.Size = UDim2.new(1, -10, 1, -21)
			SectionHandler.ZIndex = 9

			UIStroke.Transparency = 0.650
			UIStroke.Color = Color3.fromRGB(45, 48, 58)
			UIStroke.Parent = SectionHandler

			UICorner.CornerRadius = UDim.new(0, 10)
			UICorner.Parent = SectionHandler

			UIListLayout.Parent = SectionHandler
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()


				if UIListLayout.AbsoluteContentSize.Y <= 1 then
					NeverLose.PlayAnimate(SectionFrame , VSlowTween , {
						Size = UDim2.new(1, -5, 0, 0)
					})
				else
					NeverLose.PlayAnimate(SectionFrame , VSlowTween , {
						Size = UDim2.new(1, -5, 0, UIListLayout.AbsoluteContentSize.Y + 19.5)
					})
				end;
			end));

			local Section = NeverLose:RegisiterItem(SectionHandler , Tab.Signal);

			Section.SetRender = LPH_NO_VIRTUALIZE(function(value)
				if value then
					NeverLose.PlayAnimate(SectionLabel,SlowyTween,{
						TextTransparency = 0.500
					})

					NeverLose.PlayAnimate(SectionHandler,SlowyTween,{
						BackgroundTransparency = 0.500
					})

					NeverLose.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.650
					})
				else
					NeverLose.PlayAnimate(SectionLabel,SlowyTween,{
						TextTransparency = 1
					})

					NeverLose.PlayAnimate(SectionHandler,SlowyTween,{
						BackgroundTransparency = 1
					})

					NeverLose.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 1
					})
				end;
			end);

			Section.SetRender(Tab.Signal:GetValue());
			Tab.Signal:Connect(Section.SetRender);

			return Section;
		end;

		return Tab;
	end;

	function Window:_InitConfig()
		local ConfigSignal = NeverLose:CreateSignal(false);
		local ConfigLib = {
			Signals = {},
		};

		local ConfigMenu = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local UIStroke = Instance.new("UIStroke")
		local InputFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local BasedHandler = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local TextInput = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke_2 = Instance.new("UIStroke")
		local TextBox = Instance.new("TextBox")
		local LoadConfig = Instance.new("Frame")
		local Icon = Instance.new("TextLabel")
		local UICorner_3 = Instance.new("UICorner")
		local UICorner_4 = Instance.new("UICorner")

		local shadow = NeverLose:CreateShadow(ConfigMenu);

		ConfigLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				ConfigMenu.Position = UDim2.fromOffset(ConfigFrame.AbsolutePosition.X + 110 , ConfigFrame.AbsolutePosition.Y + 96)

				NeverLose.PlayAnimate(ConfigMenu , SlowyTween , {
					BackgroundTransparency = 0.035,
					Position = UDim2.fromOffset(ConfigFrame.AbsolutePosition.X + 110 , ConfigFrame.AbsolutePosition.Y + 95)
				})	

				NeverLose.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 0.650
				})
				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.200
				})	

				NeverLose.PlayAnimate(UIStroke_2 , SlowyTween , {
					Transparency = 0.65
				})	

				NeverLose.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				})	
				NeverLose.PlayAnimate(TextInput , SlowyTween , {
					BackgroundTransparency = 0
				})	
				NeverLose.PlayAnimate(TextBox , SlowyTween , {
					TextTransparency = 0.350
				})	
				NeverLose.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 0.350
				})	

				NeverLose.PlayAnimate(ConfigBthIcon , SlowyTween , {
					Rotation = 180
				})	

				shadow:Render(true)
			else
				NeverLose.PlayAnimate(ConfigBthIcon , SlowyTween , {
					Rotation = 0
				})

				NeverLose.PlayAnimate(ConfigMenu , SlowyTween , {
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(ConfigFrame.AbsolutePosition.X + 110 , ConfigFrame.AbsolutePosition.Y + 96)
				})	

				NeverLose.PlayAnimate(UIStroke_2 , SlowyTween , {
					Transparency = 1
				})	

				NeverLose.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 1
				})
				NeverLose.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				})	
				NeverLose.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				})	
				NeverLose.PlayAnimate(TextInput , SlowyTween , {
					BackgroundTransparency = 1
				})	
				NeverLose.PlayAnimate(TextBox , SlowyTween , {
					TextTransparency = 1
				})	
				NeverLose.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 1
				})	

				shadow:Render(false)
			end;
		end);

		NeverLose:AddSignal(ConfigMenu:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if ConfigMenu.BackgroundTransparency > 0.9 then
				ConfigMenu.Visible = false;
				UIListLayout.Parent = nil;
				ConfigMenu.Parent = nil;
			else

				ConfigMenu.Visible = true;
				UIListLayout.Parent = ConfigMenu

				if NeverLose.Global3DRenderMode then
					ConfigMenu.Parent = NeverLose.GlobalSurfaceGui;
				else
					ConfigMenu.Parent = NeverLose.ScreenGui;
				end;
			end
		end)))

		ConfigMenu.Name = NeverLose.RandomString();
		ConfigMenu.Parent = NeverLose.ScreenGui;
		ConfigMenu.AnchorPoint = Vector2.new(0.5, 0)
		ConfigMenu.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		ConfigMenu.BackgroundTransparency = 0.035
		ConfigMenu.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ConfigMenu.BorderSizePixel = 0
		ConfigMenu.ClipsDescendants = true
		ConfigMenu.Position = UDim2.new(255,255,255,255)
		ConfigMenu.Size = UDim2.new(0, 220,0, 110)
		ConfigMenu.ZIndex = 151

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ConfigMenu

		UIListLayout.Parent = ConfigMenu
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 4)

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = ConfigMenu

		InputFrame.Name = NeverLose.RandomString();
		InputFrame.Parent = ConfigMenu
		InputFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		InputFrame.BackgroundTransparency = 1.000
		InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		InputFrame.BorderSizePixel = 0
		InputFrame.Size = UDim2.new(1, 0, 0, 30)
		InputFrame.ZIndex = 154

		BasedLabel.Name = NeverLose.RandomString();
		BasedLabel.Parent = InputFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.Position = UDim2.new(0, 11, 0, 6)
		BasedLabel.Size = UDim2.new(0,1, 0, 15)
		BasedLabel.ZIndex = 154
		BasedLabel.Font = Enum.Font.GothamMedium
		BasedLabel.Text = "Config"
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 13.000
		BasedLabel.TextTransparency = 0.200
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

		LineFrame.Name = NeverLose.RandomString();
		LineFrame.Parent = InputFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = 154

		BasedHandler.Name = NeverLose.RandomString();
		BasedHandler.Parent = InputFrame
		BasedHandler.AnchorPoint = Vector2.new(1, 0)
		BasedHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedHandler.BackgroundTransparency = 1.000
		BasedHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedHandler.BorderSizePixel = 0
		BasedHandler.Position = UDim2.new(1, -11, 0, 2)
		BasedHandler.Size = UDim2.new(1, -20, 0, 25)
		BasedHandler.ZIndex = 154

		UIListLayout_2.Parent = BasedHandler
		UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout_2.Padding = UDim.new(0, 5)

		NeverLose:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			if #ConfigLib.Signals <= 0 then
				NeverLose.PlayAnimate(ConfigMenu , SlowyTween , {
					Size = UDim2.new(0, 220,0, UIListLayout.AbsoluteContentSize.Y + 0);
				})
			else
				NeverLose.PlayAnimate(ConfigMenu , SlowyTween , {
					Size = UDim2.new(0, 220,0, UIListLayout.AbsoluteContentSize.Y + 5);
				})
			end;

		end)));

		TextInput.Name = NeverLose.RandomString();
		TextInput.Parent = BasedHandler
		TextInput.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		TextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextInput.BorderSizePixel = 0
		TextInput.ClipsDescendants = true
		TextInput.Size = UDim2.new(0, 100, 0, 18)
		TextInput.ZIndex = 154

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = TextInput

		UIStroke_2.Transparency = 0.650
		UIStroke_2.Color = Color3.fromRGB(45, 48, 58)
		UIStroke_2.Parent = TextInput

		TextBox.Parent = TextInput
		TextBox.AnchorPoint = Vector2.new(0, 0.5)
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0, 5, 0.5, 0)
		TextBox.Size = UDim2.new(1, -5, 0, 17)
		TextBox.ZIndex = 154
		TextBox.ClearTextOnFocus = false
		TextBox.Font = Enum.Font.GothamMedium
		TextBox.PlaceholderText = "Config Name ..."
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 11.000
		TextBox.TextTransparency = 0.350
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		LoadConfig.Name = NeverLose.RandomString();
		LoadConfig.Parent = BasedHandler
		LoadConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
		LoadConfig.BackgroundTransparency = 1.000
		LoadConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LoadConfig.BorderSizePixel = 0
		LoadConfig.ClipsDescendants = true
		LoadConfig.Size = UDim2.new(0, 20, 0, 18)
		LoadConfig.ZIndex = 153

		Icon.Name = NeverLose.RandomString();
		Icon.Parent = LoadConfig
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.ZIndex = 153
		Icon.FontFace = NeverLose.BuiltInBold
		Icon.Text = "plus-large"
		Icon.TextColor3 = Color3.fromRGB(223, 223, 223)
		Icon.TextSize = 16.000
		Icon.TextTransparency = 0.350
		Icon.TextWrapped = true

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = LoadConfig

		UICorner_4.CornerRadius = UDim.new(0, 10)
		UICorner_4.Parent = InputFrame

		local OpenButton = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")

		OpenButton.Name = NeverLose.RandomString();
		OpenButton.Parent = ConfigFrame
		OpenButton.AnchorPoint = Vector2.new(0, 0.5)
		OpenButton.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		OpenButton.BackgroundTransparency = 1.000
		OpenButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OpenButton.BorderSizePixel = 0
		OpenButton.Position = UDim2.new(0, 31, 0.5, 0)
		OpenButton.Size = UDim2.new(1, -31, 1, 0)
		OpenButton.ZIndex = 10
		OpenButton.Font = Enum.Font.SourceSans
		OpenButton.Text = ""
		OpenButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		OpenButton.TextSize = 14.000

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = OpenButton

		ConfigLib.SetRender(false);
		ConfigSignal:Connect(ConfigLib.SetRender);
		ConfigLib.UnsafeThread = nil;
		ConfigLib.SelectedConfig = "Default";

		local UpdateSize = LPH_NO_VIRTUALIZE(function()
			local size = TextService:GetTextSize(ConfigName.Text , ConfigName.TextSize,ConfigName.Font,Vector2.new(math.huge,math.huge));

			NeverLose.PlayAnimate(ConfigFrame,SlowyTween , {
				Size = UDim2.fromOffset(size.X + 75, 30)
			});
		end);

		UpdateSize();

		function ConfigLib:GetData(performance)
			local ikc = {};
			local cd = 0;
			for Flag,v in next, NeverLose.Flags do
				if NeverLose.FlagTypes[Flag] == "toggle" and v and v.GetValue then
					local ok, data = pcall(function()
						return v:GetValue();
					end);

					if ok and data == true then
						table.insert(ikc,{
							Idx = Flag,
							Value = true
						});
					end;
				end;

				if performance and cd % 35 == 1 then
					task.wait();
				end;

				cd += 1;
			end;

			return NeverLose.Base64Encode(Encryption.new(HttpService:JSONEncode(ikc)));
		end;

		function ConfigLib:LoadData(data)
			local coded = HttpService:JSONDecode(Encryption.reverse(NeverLose.Base64Decode(data)));
			local saved = {};

			for _,v in next, coded do
				if v and v.Idx and v.Value == true then
					saved[v.Idx] = true;
				end;
			end;

			-- Restore feature state only. Do not replay sliders/keybinds/colors/
			-- dropdowns/text inputs as executable state.
			for Flag,flag in next, NeverLose.Flags do
				if NeverLose.FlagTypes[Flag] == "toggle" and flag and flag.GetValue and flag.SetValue then
					local ok,current = pcall(function()
						return flag:GetValue();
					end);

					if ok and current == true and not saved[Flag] then
						pcall(function()
							flag:SetValue(false);
						end);
					end;
				end;
			end;

			for Flag in next, saved do
				if NeverLose.FlagTypes[Flag] == "toggle" then
					local flag = NeverLose.Flags[Flag];
					if flag and flag.SetValue then
						pcall(function()
							flag:SetValue(true);
						end);
					end;
				end;
			end;
		end;
		function ConfigLib:RefreshConfig()
			if not isfolder(Window.ConfigFolder) then
				makefolder(Window.ConfigFolder);
			end;
			
			if not isfile(Window.ConfigFolder..'/Default') then
				writefile(Window.ConfigFolder..'/Default',ConfigLib:GetData());
			end;
			
			for i,v in next,ConfigMenu:GetChildren() do
				if v:GetAttribute('ConfigItem') then
					v:Destroy();
				end;
			end;

			for i,v in next , ConfigLib.Signals do
				v:Disconnect();
			end

			table.clear(ConfigLib.Signals);

			local ConfigList = {};
			for i,v in next , listfiles(Window.ConfigFolder) do

				local name = string.sub(v , #Window.ConfigFolder + 2);

				table.insert(ConfigList , name)
			end;

			for i,ConfigNameStr in next , ConfigList do
				local ConfigItemFrame = Instance.new("Frame")
				local BasedHandler = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local DeleteConfig = Instance.new("Frame")
				local Icon = Instance.new("TextLabel")
				local UICorner = Instance.new("UICorner")
				local LoadConfig = Instance.new("Frame")
				local Icon_2 = Instance.new("TextLabel")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")
				local BasedLabel = Instance.new("TextLabel")
				local UIStroke = Instance.new("UIStroke")

				ConfigItemFrame.Name = NeverLose.RandomString();
				ConfigItemFrame.Parent = ConfigMenu
				ConfigItemFrame.BackgroundColor3 = Color3.fromRGB(21, 20, 27)
				ConfigItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ConfigItemFrame.BorderSizePixel = 0
				ConfigItemFrame.Size = UDim2.new(1, -10, 0, 30)
				ConfigItemFrame.ZIndex = 153
				ConfigItemFrame:SetAttribute('ConfigItem',true);

				BasedHandler.Name = NeverLose.RandomString();
				BasedHandler.Parent = ConfigItemFrame
				BasedHandler.AnchorPoint = Vector2.new(1, 0)
				BasedHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BasedHandler.BackgroundTransparency = 1.000
				BasedHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BasedHandler.BorderSizePixel = 0
				BasedHandler.Position = UDim2.new(1, -11, 0, 2)
				BasedHandler.Size = UDim2.new(1, -20, 0, 25)
				BasedHandler.ZIndex = 153

				UIListLayout.Parent = BasedHandler
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				UIListLayout.Padding = UDim.new(0, 5)

				DeleteConfig.Name = NeverLose.RandomString();
				DeleteConfig.Parent = BasedHandler
				DeleteConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
				DeleteConfig.BackgroundTransparency = 1.000
				DeleteConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DeleteConfig.BorderSizePixel = 0
				DeleteConfig.ClipsDescendants = true
				DeleteConfig.Size = UDim2.new(0, 20, 0, 18)
				DeleteConfig.ZIndex = 153

				Icon.Name = NeverLose.RandomString();
				Icon.Parent = DeleteConfig
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon.Size = UDim2.new(1, 0, 1, 0)
				Icon.ZIndex = 153
				Icon.FontFace = NeverLose.BuiltInBold
				Icon.Text = "trash-can"
				Icon.TextColor3 = Color3.fromRGB(223, 223, 223)
				Icon.TextSize = 16.000
				Icon.TextTransparency = 0.400
				Icon.TextWrapped = true

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = DeleteConfig

				LoadConfig.Name = NeverLose.RandomString();
				LoadConfig.Parent = BasedHandler
				LoadConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
				LoadConfig.BackgroundTransparency = 1.000
				LoadConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
				LoadConfig.BorderSizePixel = 0
				LoadConfig.ClipsDescendants = true
				LoadConfig.Size = UDim2.new(0, 20, 0, 18)
				LoadConfig.ZIndex = 153

				Icon_2.Name = NeverLose.RandomString();
				Icon_2.Parent = LoadConfig
				Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon_2.BackgroundTransparency = 1.000
				Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon_2.BorderSizePixel = 0
				Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon_2.Size = UDim2.new(1, 0, 1, 0)
				Icon_2.ZIndex = 153
				Icon_2.FontFace = NeverLose.BuiltInBold
				Icon_2.Text = "arrow-right-from-portrait-rectangle"
				Icon_2.TextColor3 = Color3.fromRGB(223, 223, 223)
				Icon_2.TextSize = 16.000
				Icon_2.TextTransparency = 0.400
				Icon_2.TextWrapped = true

				UICorner_2.CornerRadius = UDim.new(0, 4)
				UICorner_2.Parent = LoadConfig

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = ConfigItemFrame

				BasedLabel.Name = NeverLose.RandomString();
				BasedLabel.Parent = ConfigItemFrame
				BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BasedLabel.BackgroundTransparency = 1.000
				BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BasedLabel.BorderSizePixel = 0
				BasedLabel.Position = UDim2.new(0, 11, 0, 7)
				BasedLabel.Size = UDim2.new(0, 1, 0, 15)
				BasedLabel.ZIndex = 153
				BasedLabel.Font = Enum.Font.GothamMedium
				BasedLabel.Text = ConfigNameStr
				BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				BasedLabel.TextSize = 13.000
				BasedLabel.TextTransparency = 0.200
				BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

				UIStroke.Transparency = 0.500
				UIStroke.Color = Color3.fromRGB(45, 48, 58)
				UIStroke.Parent = ConfigItemFrame

				local Render = LPH_NO_VIRTUALIZE(function(rst)
					if rst then
						NeverLose.PlayAnimate(ConfigItemFrame,SlowyTween,{
							BackgroundTransparency = 0
						})

						NeverLose.PlayAnimate(Icon,SlowyTween,{
							TextTransparency = 0.400
						})

						NeverLose.PlayAnimate(Icon_2,SlowyTween,{
							TextTransparency = 0.400
						})

						NeverLose.PlayAnimate(BasedLabel,SlowyTween,{
							TextTransparency = 0.200
						})

						NeverLose.PlayAnimate(UIStroke,SlowyTween,{
							Transparency = 0.500
						})
					else
						NeverLose.PlayAnimate(ConfigItemFrame,SlowyTween,{
							BackgroundTransparency = 1
						})

						NeverLose.PlayAnimate(Icon,SlowyTween,{
							TextTransparency = 1
						})

						NeverLose.PlayAnimate(Icon_2,SlowyTween,{
							TextTransparency = 1
						})

						NeverLose.PlayAnimate(BasedLabel,SlowyTween,{
							TextTransparency = 1
						})

						NeverLose.PlayAnimate(UIStroke,SlowyTween,{
							Transparency = 1
						})
					end;
				end)

				Render(ConfigSignal:GetValue());
				table.insert(ConfigLib.Signals , ConfigSignal:Connect(Render));

				table.insert(ConfigLib.Signals , ConfigItemFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.25
					})
				end)));

				table.insert(ConfigLib.Signals , ConfigItemFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.500
					})
				end)));

				local deleter,signal = NeverLose:CreateInput(DeleteConfig,function()
					if ConfigNameStr == "Default" then
						Logging.new("trash-can","You can't delete default config!",3.5)
						return;
					end;
					
					delfile(Window.ConfigFolder..'/'..ConfigNameStr);

					UpdateSize();

					ConfigLib:RefreshConfig();

					Logging.new("trash-can",'Deleted '..tostring(ConfigNameStr),3.5)
				end);


				local _,load_signal = NeverLose:CreateInput(LoadConfig,function()
					local path = Window.ConfigFolder..'/'..ConfigNameStr;

					if isfile(path) then
						local data = readfile(path);

						pcall(function() ConfigLib:LoadData(data) end);

						ConfigLib.SelectedConfig = ConfigNameStr;
						ConfigName.Text = ConfigNameStr;

						UpdateSize();

						ConfigLib:RefreshConfig();

						Logging.new("folder",'Loaded '..tostring(ConfigNameStr),3.5)
					end
				end);

				table.insert(ConfigLib.Signals , signal);
				table.insert(ConfigLib.Signals , load_signal);

				table.insert(ConfigLib.Signals , deleter.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(Icon,SlowyTween,{
						TextTransparency = 0.2,
						TextColor3 = Color3.fromRGB(223, 125, 125)
					})
				end)))

				table.insert(ConfigLib.Signals , deleter.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(Icon,SlowyTween,{
						TextTransparency = 0.400,
						TextColor3 = Color3.fromRGB(223, 223, 223)
					})
				end)))

				table.insert(ConfigLib.Signals , LoadConfig.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(Icon_2,SlowyTween,{
						TextTransparency = 0.2,
						TextColor3 = NeverLose.AccentColor
					})
				end)))

				table.insert(ConfigLib.Signals , LoadConfig.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					NeverLose.PlayAnimate(Icon_2,SlowyTween,{
						TextTransparency = 0.400,
						TextColor3 = Color3.fromRGB(223, 223, 223)
					})
				end)))
			end;

			table.clear(ConfigList);
		end;
		
		task.delay(1,function()
			if ConfigLib.SelectedConfig == "Default" then
				local path = Window.ConfigFolder..'/Default';
				local ConfigNameStr = "Default";
				
				if isfile(path) then
					local data = readfile(path);

					pcall(function() ConfigLib:LoadData(data) end);

					ConfigLib.SelectedConfig = ConfigNameStr;
					ConfigName.Text = ConfigNameStr;

					UpdateSize();

					ConfigLib:RefreshConfig();

					Logging.new("folder","Loaded Default Config",3.5);
					
					task.spawn(function()
						while true do task.wait(5.75);
							if isfile(path) and ConfigLib.SelectedConfig == "Default" then
								writefile(Window.ConfigFolder..'/Default',ConfigLib:GetData(true));
							end;
						end;
					end);
				end;
			end;
		end);

		local hover_write = NeverLose:CreateInput(ConfigIcon,function()
			local path = Window.ConfigFolder..'/'..(ConfigLib.SelectedConfig or "Default");

			if isfile(path) then
				writefile(Window.ConfigFolder..'/'..(ConfigLib.SelectedConfig or "Default"),ConfigLib:GetData());

				Logging.new("folder",'Saved '..tostring(ConfigLib.SelectedConfig),3.5)
			end;
		end);

		NeverLose:AddSignal(hover_write.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(ConfigIcon,SlowyTween,{
				TextTransparency = 0.1
			})
		end)));

		NeverLose:AddSignal(hover_write.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(ConfigIcon,SlowyTween,{
				TextTransparency = 0.25
			})
		end)));


		local mv = NeverLose:CreateInput(LoadConfig , function()
			local cfg_name = TextBox.Text;

			if cfg_name and cfg_name:byte() and not cfg_name:find('/',1,true) and not cfg_name:find('\\',1,true) then
				cfg_name = string.sub(cfg_name , 1 , 24);

				writefile(Window.ConfigFolder..'/'..cfg_name,ConfigLib:GetData());
				ConfigLib.SelectedConfig = cfg_name;
				ConfigName.Text = cfg_name;

				Logging.new("folder",'Created '..tostring(cfg_name),3.5)

				TextBox.Text = "";

				UpdateSize();

				ConfigLib:RefreshConfig();
			end;
		end);

		NeverLose:AddSignal(mv.MouseEnter:Connect(function()
			NeverLose.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.1
			})
		end))

		NeverLose:AddSignal(mv.MouseLeave:Connect(function()
			NeverLose.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.35
			})
		end))

		ConfigLib:RefreshConfig();

		OpenButton.MouseButton1Click:Connect(LPH_NO_VIRTUALIZE(function()
			if ConfigLib.UnsafeThread then
				ConfigLib.UnsafeThread:Disconnect();
				ConfigLib.UnsafeThread = nil;
			end;

			ConfigSignal:SetValue(true);

			ConfigLib.UnsafeThread = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not NeverLose:IsMouseOverFrame(ConfigMenu) then
						if ConfigLib.UnsafeThread then
							ConfigLib.UnsafeThread:Disconnect();
							ConfigLib.UnsafeThread = nil;
						end;

						ConfigSignal:SetValue(false);
					end;
				end;
			end)
		end));

		return ConfigLib;
	end;

	Window:_InitConfig();

	local UserSettings = NeverLose:CreateOptionWindow(BottomFrame , BottomFrame.ZIndex + 13);
	local reciveSignal;
	NeverLose:CreateInput(BottomFrame , LPH_NO_VIRTUALIZE(function()
		if reciveSignal then
			reciveSignal:Disconnect();
			reciveSignal = nil;	
		end;

		UserSettings.Signal:SetValue(true);

		reciveSignal = UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if not NeverLose:IsMouseOverFrame(UserSettings.Root) and not NeverLose:IsMouseOverFrame(BottomFrame) and not NeverLose.IsMosueOverOtherFrame then
					if reciveSignal then
						reciveSignal:Disconnect();
						reciveSignal = nil;	
					end;

					UserSettings.Signal:SetValue(false);
				end
			end
		end);
	end))
	task.spawn(function()
		while task.wait(30) do
			pcall(function()
				writefile(Window.ConfigFolder..'/Default', ConfigLib:GetData());
			end);
		end;
	end);
	LocalPlayer.AncestryChanged:Connect(function()
		if not LocalPlayer.Parent then
			pcall(function()
				writefile(Window.ConfigFolder..'/Default', ConfigLib:GetData());
			end);
		end;
	end);

	Window.UserSettings = UserSettings;

	function Window:SetAccount(Config)
		Config = NeverLose:ProcessParams(Config , {
			Profile = NeverLose.UserProfile,
			Username = LocalPlayer.DisplayName,
			Expires = "Never",
		});

		AccountName.Text = Config.Username;
		AccountProfile.Image = Config.Profile;
		ExpireLabel.Text = Config.Expires;

		Window.Username = Config.Username or Window.Username;
		Window.Profile = Config.Profile or Window.Profile;
		Window.Expires = Config.Expires or Window.Expires;

		if Window.UserSettings.UserFrame then
			Window.UserSettings.UserFrame:SetUsername(Window.Username);
			Window.UserSettings.UserFrame:SetProfile(Window.Profile);
			Window.UserSettings.UserFrame:SetExpires(Window.Expires);
		else
			Window.UserSettings.UserFrame = UserSettings:AddUserFrame(Window.Username , Window.Profile , Window.Expires);
		end;
	end;

	function Window:SetSize(newsize)
		Window.Size = newsize;

		if Window.Signal:GetValue() then
			NeverLose.PlayAnimate(WindowFrame , VSlowTween , {
				Size = Window.Size
			})
		end
	end;

	Window:SetAccount();

	NeverLose:AddSignal(UserInputService.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(value,ISTYPING)
		if value.KeyCode == Window.Keybind or value.KeyCode.Name == Window.Keybind then
			if not ISTYPING then
				Window:ToggleInterface()
			end
		end;
	end)));

	function Window:ToggleInterface()
		Window.Signal:SetValue(not Window.Signal:GetValue());

		if Window.__3DRender then
			Window.Load3DBlock();
		end;
	end;

	function Window:Watermark()
		if NeverLose.__WatermarkCache then
			return NeverLose.__WatermarkCache;
		end;

		local Watermark_lb = {};
		local Watermark = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local Shadow = NeverLose:CreateShadow(Watermark);

		Watermark.Name = NeverLose.RandomString();
		Watermark.Parent = NeverLose.ScreenGui
		Watermark.AnchorPoint = Vector2.new(1, 0)
		Watermark.BackgroundColor3 = NeverLose.MainColor
		Watermark.BackgroundTransparency = 0.200
		Watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Watermark.BorderSizePixel = 0
		Watermark.ClipsDescendants = true
		Watermark.Position = UDim2.new(1, -10, 0, 10)
		Watermark.Size = UDim2.new(0, 120, 0, 30)
		Watermark.ZIndex = 16

		UICorner.CornerRadius = UDim.new(0, 25)
		UICorner.Parent = Watermark

		UIListLayout.Parent = Watermark
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right

		local empty_space = Instance.new('Frame');

		empty_space.Size = UDim2.fromOffset(15,0);
		empty_space.BackgroundTransparency = 1;
		empty_space.Parent = Watermark;
		empty_space.LayoutOrder = 5;

		Watermark:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if Watermark.BackgroundTransparency > 0.9 then
				Watermark.Visible = false;
				Watermark.Parent = nil;
			else
				Watermark.Parent = NeverLose.ScreenGui
				Watermark.Visible = true;
			end;
		end));

		UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			NeverLose.PlayAnimate(Watermark , SlowyTween , {
				Size = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 5, 0, 30)
			})
		end));

		NeverLose.__WatermarkCache = Watermark_lb;

		Shadow:Render(true);

		Watermark_lb.Renders = {};
		Watermark_lb.Status = true;

		function Watermark_lb:SetRender(value)
			Watermark_lb.Status = value;

			if value then
				NeverLose.PlayAnimate(Watermark,SlowyTween , {
					BackgroundTransparency = 0.200
				})

				Shadow:Render(true);

				for i,v in next , Watermark_lb.Renders do
					pcall(v,true);
				end;
			else
				NeverLose.PlayAnimate(Watermark,SlowyTween , {
					BackgroundTransparency = 1
				})

				Shadow:Render(false);

				for i,v in next , Watermark_lb.Renders do
					pcall(v,false);
				end;
			end
		end;

		function Watermark_lb:AddBlock(IconStr , Name)
			local InnerBlock = {};

			local Frame = Instance.new("Frame")
			local Content = Instance.new("TextLabel")
			local Icon = Instance.new("TextLabel")

			Frame.Parent = Watermark
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 50, 0, 30)

			Content.Name = NeverLose.RandomString();
			Content.Parent = Frame
			Content.AnchorPoint = Vector2.new(0, 0.5)
			Content.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
			Content.BackgroundTransparency = 1.000
			Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 35, 0.5, 0)
			Content.Size = UDim2.new(0, 1, 0, 25)
			Content.ZIndex = 17
			Content.Font = Enum.Font.GothamBold
			Content.Text = Name
			Content.TextColor3 = Color3.fromRGB(186, 186, 186)
			Content.TextSize = 15.000
			Content.TextTransparency = 0.200
			Content.TextXAlignment = Enum.TextXAlignment.Left

			Icon.Name = NeverLose.RandomString();
			Icon.Parent = Frame
			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0, 10, 0.5, 0)
			Icon.Size = UDim2.new(0, 20, 0, 20)
			Icon.ZIndex = 17
			Icon.FontFace = NeverLose.BuiltInBold;
			Icon.Text = IconStr
			Icon.TextColor3 = NeverLose.AccentColor
			Icon.TextSize = 18.000
			Icon.TextTransparency = 0.250
			Icon.TextWrapped = true

			InnerBlock.Update = LPH_NO_VIRTUALIZE(function(value)
				local size = TextService:GetTextSize(Content.Text , Content.TextSize,Content.Font,Vector2.new(math.huge,math.huge))

				if InnerBlock.Visible then
					NeverLose.PlayAnimate(Frame,VSlowTween,{
						Size = UDim2.new(0, size.X + 35, 0, 30)
					})
				else
					NeverLose.PlayAnimate(Frame,VSlowTween,{
						Size = UDim2.new(0, 0, 0, 30)
					})
				end;
			end);

			InnerBlock.Visible = true;

			InnerBlock.Update();

			function InnerBlock:SetVisible(v)
				InnerBlock.Visible = v;

				if Watermark_lb.Status then
					InnerBlock.SetRender(v);
				end;

				InnerBlock.Update();
			end;

			InnerBlock.SetRender = LPH_NO_VIRTUALIZE(function(value)
				if value and InnerBlock.Visible then
					NeverLose.PlayAnimate(Content,SlowyTween , {
						TextTransparency = 0.200
					})

					NeverLose.PlayAnimate(Icon,SlowyTween , {
						TextTransparency = 0.250
					})
				else

					NeverLose.PlayAnimate(Content,SlowyTween , {
						TextTransparency = 1
					})

					NeverLose.PlayAnimate(Icon,SlowyTween , {
						TextTransparency = 1
					})
				end;
			end);

			table.insert(Watermark_lb.Renders,InnerBlock.SetRender);

			function InnerBlock:SetText(t)
				Content.Text = t;

				InnerBlock.Update();
			end;

			function InnerBlock:Input(func)
				local c,s = NeverLose:CreateInput(Frame,func);

				return s;
			end;

			return InnerBlock;
		end;

		return Watermark_lb;
	end;

	Window:SetRender(false);

	return Window;
end;

function NeverLose:CreateNotification()
	if NeverLose.__Notification_Cache then
		return NeverLose.__Notification_Cache;
	end;

	local Notifier = {};
	local Notification = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Notification.Name = NeverLose.RandomString();
	Notification.Parent = NeverLose.ScreenGui;
	Notification.AnchorPoint = Vector2.new(1, 0)
	Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Notification.BackgroundTransparency = 1.000
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(1, -25, 0, 25)
	Notification.Size = UDim2.new(0, 25, 0, 25)

	UIListLayout.Parent = Notification
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 0)

	NeverLose.__Notification_Cache = Notifier;

	function Notifier.new(Config)
		Config = NeverLose:ProcessParams(Config , {
			Title = "Notification",
			Content = "Hello World!",
			Logo = NeverLose.GlobalLogo or "rbxasset://textures/ui/VerifiedBadgeNameIcon.png",
			Duration = 5,
		});

		if NeverLose.__WatermarkCache then
			NeverLose.PlayAnimate(Notification,SlowyTween , {
				Position = UDim2.new(1, -25, 0, 55)
			});
		end;

		local ContainerFrame = Instance.new("Frame")
		local NotifyFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local LogoImage = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local NotifyName = Instance.new("TextLabel")
		local NotifyContent = Instance.new("TextLabel");
		local shadow = NeverLose:CreateShadow(NotifyFrame , true);

		ContainerFrame.Name = NeverLose.RandomString();
		ContainerFrame.Parent = Notification
		ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainerFrame.BackgroundTransparency = 1.000
		ContainerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContainerFrame.BorderSizePixel = 0
		ContainerFrame.Size = UDim2.new(0, 0, 0, 100)

		NotifyFrame.Name = NeverLose.RandomString();
		NotifyFrame.Parent = ContainerFrame
		NotifyFrame.AnchorPoint = Vector2.new(1, 0)
		NotifyFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		NotifyFrame.BackgroundTransparency = 0.075
		NotifyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyFrame.BorderSizePixel = 0
		NotifyFrame.ClipsDescendants = true
		NotifyFrame.Position = UDim2.new(0, 750, 0, 0)
		NotifyFrame.Size = UDim2.new(0, 220, 0, 55)
		NotifyFrame.ZIndex = 130

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = NotifyFrame

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = NotifyFrame

		LogoImage.Name = NeverLose.RandomString();
		LogoImage.Parent = NotifyFrame
		LogoImage.AnchorPoint = Vector2.new(0, 0.5)
		LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogoImage.BackgroundTransparency = 1.000
		LogoImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogoImage.BorderSizePixel = 0
		LogoImage.Position = UDim2.new(0, 10, 0.5, 0)
		LogoImage.Size = UDim2.new(0, 30, 0, 30)
		LogoImage.ZIndex = 131
		LogoImage.Image = Config.Logo
		LogoImage.ImageColor3 = NeverLose.IconColor;

		UICorner_2.CornerRadius = UDim.new(0, 7)
		UICorner_2.Parent = LogoImage

		NotifyName.Name = NeverLose.RandomString();
		NotifyName.Parent = NotifyFrame
		NotifyName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyName.BackgroundTransparency = 1.000
		NotifyName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyName.BorderSizePixel = 0
		NotifyName.Position = UDim2.new(0, 50, 0, 7)
		NotifyName.Size = UDim2.new(0, 200, 0, 20)
		NotifyName.ZIndex = 132
		NotifyName.Font = Enum.Font.GothamBold
		NotifyName.Text = Config.Title
		NotifyName.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotifyName.TextSize = 17.000
		NotifyName.TextXAlignment = Enum.TextXAlignment.Left

		NotifyContent.Name = NeverLose.RandomString();
		NotifyContent.Parent = NotifyFrame
		NotifyContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyContent.BackgroundTransparency = 1.000
		NotifyContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyContent.BorderSizePixel = 0
		NotifyContent.Position = UDim2.new(0, 50, 0, 28)
		NotifyContent.Size = UDim2.new(0, 200, 0, 15)
		NotifyContent.ZIndex = 132
		NotifyContent.Font = Enum.Font.GothamBold
		NotifyContent.Text = Config.Content
		NotifyContent.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotifyContent.TextSize = 12.000
		NotifyContent.TextTransparency = 0.650
		NotifyContent.TextXAlignment = Enum.TextXAlignment.Left

		local Size1 = TextService:GetTextSize(NotifyName.Text,NotifyName.TextSize,NotifyName.Font,Vector2.new(math.huge,math.huge));
		local Size2 = TextService:GetTextSize(NotifyContent.Text,NotifyContent.TextSize,NotifyContent.Font,Vector2.new(math.huge,math.huge));

		local MainSize = math.max(Size1.X , Size2.X);

		NotifyFrame.Size = UDim2.new(0, MainSize + 65, 0, 55);

		shadow:Render(true)
		NeverLose.PlayAnimate(NotifyFrame , VSlowTween , {
			Position = UDim2.new(1, 0, 0, 0)
		})

		ContainerFrame.Size = UDim2.new(0, 0, 0, 65)

		task.delay(Config.Duration or 5 , LPH_NO_VIRTUALIZE(function()

			if NeverLose.__WatermarkCache then
				NeverLose.PlayAnimate(Notification,SlowyTween , {
					Position = UDim2.new(1, -25, 0, 55)
				});
			end;

			shadow:Render(false)

			NeverLose.PlayAnimate(NotifyFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(LogoImage , SlowyTween , {
				ImageTransparency = 1
			})

			NeverLose.PlayAnimate(NotifyName , SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(NotifyContent , SlowyTween , {
				TextTransparency = 1
			})

			task.wait(0.125);

			NeverLose.PlayAnimate(ContainerFrame , SlowyTween , {
				Size = UDim2.new(0, 0, 0, 0)
			})

			task.wait(0.125);

			ContainerFrame:Destroy();
		end))
	end;

	return Notifier;
end;

function NeverLose:CreateLogger()
	if NeverLose.__LogSystem then
		return 	NeverLose.__LogSystem;
	end;

	local Logging = {};
	local Log = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Log.Name = NeverLose.RandomString();
	Log.Parent = NeverLose.ScreenGui
	Log.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Log.BackgroundTransparency = 1.000
	Log.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Log.BorderSizePixel = 0
	Log.Position = UDim2.new(0, 25, 0, 5 + math.abs(NeverLose.ScreenGui.AbsolutePosition.Y))
	Log.Size = UDim2.new(0, 25, 0, 25)

	UIListLayout.Parent = Log
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 12)

	NeverLose.__LogSystem = Logging;

	function Logging.new(IconStr: string , Message: string , Duration: number)
		Duration = Duration or 3;
		Message = Message or "Log";
		IconStr = IconStr or "crosshairs";

		local LogFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local LogContent = Instance.new("TextLabel")
		local Line = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Icon = Instance.new("TextLabel")
		local Shadow = NeverLose:CreateShadow(LogFrame , true);

		LogFrame.Name = NeverLose.RandomString();
		LogFrame.Parent = Log
		LogFrame.AnchorPoint = Vector2.new(0.5, 0)
		LogFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		LogFrame.BackgroundTransparency =  1--0.075
		LogFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogFrame.BorderSizePixel = 0
		LogFrame.ClipsDescendants = true
		LogFrame.Position = UDim2.new(0,0,0,0)
		LogFrame.Size = UDim2.new(0, 0, 0, 20)
		LogFrame.ZIndex = 130

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = LogFrame

		UIStroke.Transparency = 1--0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = LogFrame

		LogContent.Name = NeverLose.RandomString();
		LogContent.Parent = LogFrame
		LogContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogContent.BackgroundTransparency = 1.000
		LogContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogContent.BorderSizePixel = 0
		LogContent.Position = UDim2.new(0, 25, 0, 2)
		LogContent.Size = UDim2.new(0, 200, 0, 15)
		LogContent.ZIndex = 132
		LogContent.Font = Enum.Font.GothamBold
		LogContent.Text = Message
		LogContent.TextColor3 = Color3.fromRGB(255, 255, 255)
		LogContent.TextSize = 12.000
		LogContent.TextTransparency = 1--0.250
		LogContent.TextXAlignment = Enum.TextXAlignment.Left

		Line.Name = NeverLose.RandomString();
		Line.Parent = LogFrame
		Line.AnchorPoint = Vector2.new(0, 0.5)
		Line.BackgroundColor3 = NeverLose.AccentColor
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BackgroundTransparency = 1 --0
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, -2, 0.5, 0)
		Line.Size = UDim2.new(0, 5, 1, 0)
		Line.ZIndex = 131

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = Line

		Icon.Name = NeverLose.RandomString();
		Icon.Parent = LogFrame
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 7, 0, 3)
		Icon.Size = UDim2.new(0, 15, 0, 15)
		Icon.ZIndex = 133
		Icon.FontFace = NeverLose.BuiltInBold
		Icon.Text = IconStr
		Icon.TextColor3 = Color3.fromRGB(223, 223, 223)
		Icon.TextSize = 13.000
		Icon.TextTransparency = 1--0.250
		Icon.TextWrapped = true

		local size = TextService:GetTextSize(LogContent.Text,LogContent.TextSize,LogContent.Font,Vector2.new(math.huge,math.huge));

		NeverLose.PlayAnimate(LogFrame , SlowyTween , {
			Size = UDim2.new(0, size.X + 35, 0, 20),
			BackgroundTransparency =  0.075
		});

		task.delay(0.15,LPH_NO_VIRTUALIZE(function()
			Shadow:Render(true);

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			});

			NeverLose.PlayAnimate(LogContent , SlowyTween , {
				TextTransparency = 0.25
			});

			NeverLose.PlayAnimate(Line , SlowyTween , {
				BackgroundTransparency = 0
			});

			NeverLose.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.25
			});

			task.wait(Duration + 0.1);

			Shadow:Render(false);

			NeverLose.PlayAnimate(LogFrame , SlowyTween , {
				BackgroundTransparency =  1
			});

			NeverLose.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			});

			NeverLose.PlayAnimate(LogContent , SlowyTween , {
				TextTransparency = 1
			});

			NeverLose.PlayAnimate(Line , SlowyTween , {
				BackgroundTransparency = 1
			});

			NeverLose.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 1
			});

			task.wait(0.25);

			LogFrame:Destroy();
		end))
	end;

	return Logging
end;

function NeverLose:CreateIndicator()
	local IndicatorFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	IndicatorFrame.Name = NeverLose.RandomString();
	IndicatorFrame.Parent = NeverLose.ScreenGui;
	IndicatorFrame.AnchorPoint = Vector2.new(0, 0.5)
	IndicatorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	IndicatorFrame.BackgroundTransparency = 1.000
	IndicatorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	IndicatorFrame.BorderSizePixel = 0
	IndicatorFrame.Position = UDim2.new(0, 15, 0.5, 0)
	IndicatorFrame.Size = UDim2.new(0, 100, 0, 100)
	IndicatorFrame.ZIndex = 15

	UIListLayout.Parent = IndicatorFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)

	local Indicators = {};

	Indicators.Color = {
		Red = Color3.fromRGB(255, 102, 105),
		Green = Color3.fromRGB(135, 255, 143),
		White = Color3.fromRGB(186, 186, 186),
	};

	Indicators.Root = IndicatorFrame;

	function Indicators.new(Config)
		Config = NeverLose:ProcessParams(Config , {
			Name = "Indicator",
			Icon = 'crosshairs',
			Color = 'Red',
		});

		local Indicator = {
			CurrentColor = Config.Color,	
			Visible = false,
		};

		local IndicatorItem = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Line = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")
		local Icon = Instance.new("TextLabel")
		local Content = Instance.new("TextLabel")
		local Shadow = NeverLose:CreateShadow(IndicatorItem);

		IndicatorItem.Name = NeverLose.RandomString();
		IndicatorItem.BackgroundColor3 = NeverLose.MainColor
		IndicatorItem.BackgroundTransparency = 1
		IndicatorItem.BorderColor3 = Color3.fromRGB(0, 0, 0)
		IndicatorItem.BorderSizePixel = 0
		IndicatorItem.ClipsDescendants = true
		IndicatorItem.Size = UDim2.new(0, 85, 0, 40)
		IndicatorItem.ZIndex = 16
		IndicatorItem.Visible = false;

		IndicatorItem:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if IndicatorItem.BackgroundTransparency > 0.9 then
				IndicatorItem.Parent = nil;
				IndicatorItem.Visible = false;
			else
				IndicatorItem.Parent = IndicatorFrame;
				IndicatorItem.Visible = true;
			end;
		end))

		UICorner.CornerRadius = UDim.new(0, 25)
		UICorner.Parent = IndicatorItem

		Line.Name = NeverLose.RandomString();
		Line.Parent = IndicatorItem
		Line.AnchorPoint = Vector2.new(0, 0.5)
		Line.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 2, 0.5, 0)
		Line.BackgroundTransparency = 1;
		Line.Size = UDim2.new(0, 3, 0.649999976, 0)
		Line.ZIndex = 17

		UICorner_2.CornerRadius = UDim.new(0, 25)
		UICorner_2.Parent = Line

		UIGradient.Rotation = 90
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient.Parent = Line

		Icon.Name = NeverLose.RandomString();
		Icon.Parent = IndicatorItem
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 10, 0.5, 0)
		Icon.Size = UDim2.new(0, 25, 0, 25)
		Icon.ZIndex = 17
		Icon.FontFace = NeverLose.BuiltInBold;
		Icon.Text = Config.Icon
		Icon.TextColor3 = Color3.fromRGB(186, 186, 186)
		Icon.TextSize = 21.000
		Icon.TextTransparency = 1
		Icon.TextWrapped = true

		Content.Name = NeverLose.RandomString();
		Content.Parent = IndicatorItem
		Content.AnchorPoint = Vector2.new(0, 0.5)
		Content.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
		Content.BackgroundTransparency = 1.000
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 40, 0.5, 0)
		Content.Size = UDim2.new(1, -40, 0, 25)
		Content.ZIndex = 17
		Content.Font = Enum.Font.GothamBold
		Content.Text = Config.Name
		Content.TextColor3 = Color3.fromRGB(186, 186, 186)
		Content.TextSize = 20.000
		Content.TextTransparency = 1
		Content.TextXAlignment = Enum.TextXAlignment.Left

		Indicator.Update = LPH_NO_VIRTUALIZE(function()
			local text = TextService:GetTextSize(Content.Text,Content.TextSize , Content.Font , Vector2.new(math.huge,math.huge));

			NeverLose.PlayAnimate(IndicatorItem , SlowyTween , {
				Size = UDim2.new(0, text.X + 60, 0, 40);
			})
		end);

		Indicator.SetRender = LPH_NO_VIRTUALIZE(function(self , value)
			Indicator.Visible = value;

			if value then
				NeverLose.PlayAnimate(IndicatorItem , SlowyTween , {
					BackgroundTransparency = 0.200
				});

				NeverLose.PlayAnimate(Line , SlowyTween , {
					BackgroundTransparency = 0,
					BackgroundColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				NeverLose.PlayAnimate(Icon , VSlowTween , {
					TextTransparency = 0.250,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				NeverLose.PlayAnimate(Content , VSlowTween , {
					TextTransparency = 0.2,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				Shadow:Render(true);
			else
				NeverLose.PlayAnimate(IndicatorItem , SlowyTween , {
					BackgroundTransparency = 1
				});

				NeverLose.PlayAnimate(Line , SlowyTween , {
					BackgroundTransparency = 1,
					BackgroundColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				NeverLose.PlayAnimate(Icon , VSlowTween , {
					TextTransparency = 1,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				NeverLose.PlayAnimate(Content , VSlowTween , {
					TextTransparency = 1,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				Shadow:Render(false);
			end;

			Indicator.Update();
		end);

		Indicator.Update();
		Indicator:SetRender(false);

		function Indicator:SetColor(new_color)
			Indicator.CurrentColor = new_color;

			if Indicator.Visible then
				Indicator:SetRender(true);
			end;
		end;

		function Indicator:SetText(name)
			Config.Name = name;

			Content.Text = Config.Name;

			Indicator.Update();
		end;

		return Indicator;
	end;

	return Indicators;
end;

function NeverLose:Unload()
	if not NeverLose.UnloadEnabled then
		return;	
	end;

	NeverLose.ScreenGui:Destroy();

	for i,v in next , NeverLose.GlobalSignals do
		pcall(v.Disconnect,v)
	end;
end;

return NeverLose;
]=]

				local genv = getgenv and getgenv() or _G

				if genv.WRAITH_HVH_LOADED then
					pcall(function()
						if genv.WRAITH_UNLOAD then
							genv.WRAITH_UNLOAD()
						end
					end)

					task.wait(0.25)

					if genv.WRAITH_HVH_LOADED then
						pcall(function()
							game:GetService("StarterGui"):SetCore("SendNotification", { Title = "wraith", Text = "already loaded", Duration = 3 })
						end)

						return
					end
				end

				genv.WRAITH_HVH_LOADED = true
				genv.WRAITH_SESSION_ID = tostring(math.random(1000000, 9000000))

				wraithSessionClosed = false

				wraithLogoutSession = function()
					pcall(function()
						if wraithSched and wraithSched.conn then
							wraithSched.conn:Disconnect()
							wraithSched.conn = nil
						end

						if wraithSched then
							wraithSched.jobs = {}
						end

						kickBrake = true
						wraithBringAllBusy = false
					end)

					return true
				end

				pcall(function()
					game:GetService("Players").LocalPlayer.Destroying:Connect(wraithLogoutSession)
				end)

				pcall(function()
					game:BindToClose(function()
						wraithLogoutSession()
						task.wait(0.5)
					end)
				end)

				pcall(function()
					game:GetService("Players").PlayerRemoving:Connect(function(player)
						if player == game:GetService("Players").LocalPlayer then
							wraithLogoutSession()
						end
					end)
				end)

				local tbl6 = _G_DUMP_PROTECT or {}

				local function fn51(arg)
					local v37 = table.create(arg)

					for i = 1, arg do
						local n25 = math.random(1, 63)
						v37[i] = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"):sub(n25, n25)
					end

					return table.concat(v37)
				end

				task.delay(2, function()
					pcall(function()
						for i = 1, 6 do
							getgenv()["_" .. fn51(math.random(16, 24))] = fn51(64)
						end

						for i = 1, 6 do
							tbl6[fn51(16)] = {
								FireServer = function()
								end,
								InvokeServer = function()
								end,
								Connect = function()
									return { Disconnect = function()
									end }
								end,
								Name = fn51(16),
								ClassName = "RemoteEvent",
							}
						end
					end)
				end)

				task.spawn(function()
					pcall(function()
						local hui = gethui and gethui() or game:GetService("CoreGui")
						local screenGui = Instance.new("ScreenGui")
						screenGui.Name = "WraithSplash"
						screenGui.IgnoreGuiInset = true
						screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
						screenGui.ResetOnSpawn = false

						if not pcall(function()
							screenGui.Parent = hui
						end) then
							screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
						end

						local color = Color3.fromRGB(96, 76, 214)
						local color2 = Color3.fromRGB(138, 116, 255)
						local imageLabel = Instance.new("ImageLabel")
						imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
						imageLabel.Size = UDim2.new(0, 96, 0, 96)
						imageLabel.Position = UDim2.new(0.5, 0, 0.5, -20)
						imageLabel.BackgroundTransparency = 1
						imageLabel.Image = "rbxassetid://124302285576089"
						imageLabel.ScaleType = Enum.ScaleType.Fit
						imageLabel.Parent = screenGui
						local frame2 = Instance.new("Frame")
						frame2.AnchorPoint = Vector2.new(0.5, 0.5)
						frame2.Size = UDim2.new(0, 0, 0, 0)
						frame2.Position = UDim2.new(0.5, 0, 0.5, 58)
						frame2.BackgroundTransparency = 1
						frame2.Parent = screenGui
						local tbl7 = {}

						for i = 1, 12 do
							local n25 = (i - 1) / 12 * 3.1415926535897931 * 2
							local frame3 = Instance.new("Frame")
							frame3.AnchorPoint = Vector2.new(0.5, 0.5)
							frame3.Size = UDim2.new(0, 5, 0, 5)
							frame3.Position = UDim2.new(0, math.cos(n25) * 26, 0, math.sin(n25) * 26)
							frame3.BackgroundColor3 = color
							frame3.BackgroundTransparency = 0.8
							frame3.BorderSizePixel = 0
							frame3.Parent = frame2
							local uiCorner = Instance.new("UICorner")
							uiCorner.CornerRadius = UDim.new(1, 0)
							uiCorner.Parent = frame3
							tbl7[i] = frame3
						end

						local now2 = tick()
						local connection = nil

						connection = game:GetService("RunService").RenderStepped:Connect(function()
							local n25 = tick() - now2

							pcall(function()
								local n26 = math.floor(n25 * 10) % 12

								for i, v37 in ipairs(tbl7) do
									local n27 = (i - 1 - n26) % 12
									v37.BackgroundTransparency = n27 < 4 and 0.1 + n27 * 0.2 or 0.8
									v37.BackgroundColor3 = n27 < 4 and color2 or color
								end
							end)

							if n25 > 1.6 then
								local imageTransparency = math.min(1, (n25 - 1.6) / 0.3)
								imageLabel.ImageTransparency = imageTransparency

								for _, v37 in ipairs(tbl7) do
									v37.BackgroundTransparency = 0.8 + imageTransparency * 0.2
								end
							end

							if n25 > 2 then
								pcall(function()
									connection:Disconnect()
								end)

								pcall(function()
									screenGui:Destroy()
								end)
							end
						end)

						task.delay(3, function()
							pcall(function()
								connection:Disconnect()
							end)

							pcall(function()
								screenGui:Destroy()
							end)
						end)
					end)
				end)

				task.wait(0.4)

				local tbl7 = {
					shield = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAANElEQVR42mNgGAWDFvwnEwxtC2geRKMWUNcCUi2haX6gaaajac6mafFB8/JptLQeBcMIAADtgAoTMfCZrwAAAABJRU5ErkJggg==",
					crosshair = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAVUlEQVR42mNgGHHgPxSMWoDVUGyAqobjsoyqwYEuRrYluDQSYylNIpIkPXSxgJgIJ1Yf0UkRlwVEJWOaWzC8IplUDVTNbFTLyXQpi+hSmo7WaDS3AACfYuIsdW6byQAAAABJRU5ErkJggg==",
					move = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAALklEQVR42mNgGAWjgCbgPxSQKkeyBdgMwic3asmoJQNowajhw8xwuhR2o4CuAADiGT7QlEMIMwAAAABJRU5ErkJggg==",
					eye = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAR0lEQVR42mNgGAWjgG7gPxZAE0NxAbINprp6QgoJyeG1BJ8CYoMFryU0tQCfRlIiF68DhnYQ0SUV0SUf0CUn060sGgXDAwAAe6WadMMxtvAAAAAASUVORK5CYII=",
					globe = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAXElEQVR42mNgGAXUAP/xAKobjE+cLMPR2cTKE204jI9LHS49RBtOrAVEW0Ks4WSpJ8X1ZPkCmwSpFuDVQxcLqAWGeRDRLBXRPB/QJSfTvCyiS2lKl/qALjXakAAALbYCG5I7FPUAAAAASUVORK5CYII=",
					music = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAOklEQVR42mNgGAWjgG7gPxKguQU0sew/AUA1C2gWbDQN/1ELCBpMEwsGLN3TPFMN7SCiWfIcrUtoCgBX1/8BZ+xzGwAAAABJRU5ErkJggg==",
					server = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAMUlEQVR42mNgGAUjD/ynEBBlASWOI0kR0a4i1wKa+4BmFtA0kkfzwWg+GM0Ho2A4AgAuuk7ACWMc7QAAAABJRU5ErkJggg==",
					gear = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAYUlEQVR42mNgGHHgPxSMcAvwGUKuHFaFMMX/8QBcekiyhBRAVlARChKKDcenmWILaJayqG4BJZFGVKTT3IIBiwNCGslORaTmA4rKJJrnYkKGUlQOERuhJFlC8+J6tMpEBgAxmU3PNQDhQgAAAABJRU5ErkJggg==",
					info = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAW0lEQVR42u1VQQoAMAjq/5/eXtCUtGCQV0uLoiIWDpwHbMIVnhJ3x8IE1I0szvDQoDoTlE9VwPBpjLx2SIcxkLpcA8pA2hJGw2EQXRVaz0XrwZPFR/7ByEf7Aheaf36QRgnOJAAAAABJRU5ErkJggg==",
				}

				local function fn52(arg, arg2)
					local tbl8 = {}

					for i = 1, 64 do
						tbl8[("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(i, i)] = i - 1
					end

					local tbl9 = {}
					local n25 = 0
					local n26 = 0

					for i = 1, #arg do
						if arg2 and i % 2000 == 0 then
							task.wait()
						end

						local str6 = arg:sub(i, i)

						if str6 ~= "=" then
							local v37 = tbl8[str6]

							if v37 then
								n25 = n25 * 64 + v37
								n26 += 6

								if n26 >= 8 then
									n26 -= 8
									tbl9[#tbl9 + 1] = string.char(math.floor(n25 / 2 ^ n26) % 256)
								end
							end

							continue
						end

						break
					end

					return table.concat(tbl9)
				end

				getgenv().WraithIcons = {}

				pcall(function()
					if not isfolder("WraithIconsV3") then
						makefolder("WraithIconsV3")
					end
				end)

				task.spawn(function()
					pcall(function()
						if not isfile("WraithIconsV3/blackhole.png") then
							writefile("WraithIconsV3/blackhole.png", fn52("iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAABXYElEQVR42u39eZBl133fCX7Ouevb8+W+V1bWXgVUYSeIleBOkZBIUZK12lKHNNPu9tgTPeEej91hOjw98ng84Wh3u8dLqBW2pVbLkmVJlChxJ0EQBAEUgCrUvmVW7nu+/d39nPnjvpeZBXABCgWSFnEjXtz3Xr58y/39zm87v9/3K7RSGiF49/jxPOS7wv8xVwCNfvcq/FhbgHePdxXgXRvw46wAGt6NAn6sg8B3bcCPvQV49/gxtwDv6sC7WcC7x4+vArwbAv44HyaA+CuoBLcUuDRorXfvA0KIzis0IKDz953CqBCIzt/S5/5qLhShtNJ/NZRAo3UqR41GKw26I+Tu87qrGt8p8NHpFRACRHpfiFTuQqQKI0RXMdLH71qAH668U0HrPYLXGq1E5wxKA537uqsgdKxB1yIgOsIXqbC7hZGu4KVAAkLqzuP0edl9LH7IFkK/vY8WSmv9X5T4OwJXqnsGrTRKpwLXSSpglXQErvYqSEfuetcAiO79rtC7RqArbARCgpR7zgKkQecxSCE6iiF2FOkdF6q+Mzpnpm90h97tDr3Nd3qfdFWngtZKkySpEqhkjxIoUIneeaw1KL33cdf0610DcMtyeJ3JlzoVrgBDitQaSJCGQBqpMkgpkIZOn5caaaRKcNsuQv9gjYl5Rz/xTn1xcavgleqY9ESTKFKhJ5ok0Z3n9K4ydBSiqwiq6wLUrtD33t+55oJdHy+6Zv7WFS+NXQUwpOicuwohMQyQhuo8Fh3lEe/MNRR3TAF+CGr3piy9Tldvkgo2SVLzniSaOFa7wk8g7txXMTuvV6pjIbqWQ3FrvKBeFwfuNf90fP8ewRvdVd+5333cvW+YGsPcfU4aKn2+YznuiGt4p4LAH7X0TXVXdJwKMon17i1RxLEmjjvPJ92/d5UiVZLu6ldd5VBdRdc7gdtuyqd3QuFu4CdUagGEEoikGyanJj8VuMQ0BYalMQwwLIFppivfNMEwBcoAZWikoTGMrhL8aIXcZjcjEj8qq16pjlDZEW4cqR0FiGNFHJEqQaR3LUKUCn7nFmuUVh1Ba3QCUajx2pp25+YHkjDUJJFEJemFkCIVlmFrLEfiupDNQ7EsKfZIXCdNI5WSRGG6uk1LYNnp2TAFiakxTYFpSpQpMczU7UhTI2UaXYofkTBAqE5PoPghqkE3b08SvSv8qCPsrqBjTRSl9+NIE0Xp35IoVZA43nUNQqQrPfA0tYqiUtE06wZBaIAwMG2JbQmyhkHRFOSEQcYQWIZAa4XWCoUmisGPIoJEUQ8EzQAyZSgOaPqHBb39klw2jRPQAsOQ2I7AtCSmCaaVKoFhC0xDYFiiEyeAFPJHopYglFL6h5nHdoO8rjmPY0giRRxqolh1hA1xqFKhd4QfdQUfKqJQkag0V48CxeZ6wsqKpu1Z2LZL1rFxhETEGiNR5ITAlRKlwI81dV/TbCcEkSLWqQswDYEtIGtA3jFwhcbbEsSxIJYJoaOgqCiMKUYPSIbHBblsurqlkFg2qVUwZaoIVqoYhtlxEZ1A8YetBD9UBdB612THUWfVR+lKj6KEOEzNdhwlhKEmCjVhqIiiJL0fKJTSCBTNWsLiXMJGxcS0svRlM7hCUNsOqW/GWApKWQPHhkak2IwTNpOYJgnC1FiuwC4I3JzAclJBaSlIMFCJgYgljoKMr3GbArcJsiXxA01oKtyRhPFjsP+4oH/Q6ASTAsuWWI7A6ihAah068YJJahGk+KEtwI4C/OA/XKk0oEvi1OSnK1wTdc+BJg4VQWeFh13hh4rAT0giDUJT3YyZuRFTb9r05nvosRyCmsfifJ1aNWZqPMv0tENixKy0Qubags1EoeyEohvT4yTkHY1tKiyhMdAIzU7RRxoCaUmEY6Jtk9g2iE0DHRnolsBsGKhNSXtNUK9qcGP2nYBT7zUYmRCdvQQD2xHYtsCyOhbBFrvWwBS3KsGdLAR9n9ftsQB3wAp8vy/VKcIorVOhd3x4FGnCICFOIPY7wg5SZQgCRRgkBKEi9BVBkACaZjXm6vmI9ZrB8EAvI0aWzcUKcyvbVBqCA/uLvPeBPD4xZ27WuFkPiUsZco6mYIQ4KsBQyU6BqLNDkGYAIjXRZieNMwywDIlldPy6bSBdA7ImImsgTAMzkoiqQXVRMntdE0aC4yfhgfdJhsbTINM0JY4rsbpBoy3foAQ7i/HNXEtxR13AD8ANdP19wo6pjyNN4CtAU9uOiMO0xu77miBIV3sYJPieIo4VUayZuegzd1OR7SkxKos0FhpcW1tEuSZDfQN88IleysWYL53e5OJGiK/bmLLGSG+RoObRbGwTqwQtNNIwMS0Lw3JASLRK0j0ElSqEIcE0JbZrkcnaZDI22YxBzjFwLYllSbANyJjYOUkhY2ApyfqCwdUzgnYVTj0iePgDBvlSqgiOk7oZy07/37QlpgGGyQ88LtiTBfwAzH7H5EexToO8SON7CVLC4k0fv5VQ7rfx2qng/SAh8BJ8L0Er2FgNOPu8T5DNsH+sjD1rcOHGVZbZYri0n/GeAT71qSw5I+IPv7jNQi3GSBThdh1vawWMAl6kabU30nqDjhFSgKHQRkIsQmLhoYwIbRhgWpiGi2FYaf7vuliuS6ZYoFDM0Vt06M0ZlF3IOQLDMdCOhZOV9BYltmGyumhy6eW0+PTYR0yO3iPRSmBYEteVWLbAsg0sW2IaGsN6nSX4KxED6LRcm0b5aTAXBwrPV5gmXDnrUdkOOXw8R7OZCtz34vTsK7QWXH+tzrmzTcRQL/vpRc6HnG6expc+U8X7KDk9PHaP4hMf7+Wlr3i8djVgIwlY2lxlafEKjeYKUdQGnSCEDTiAAUKgMRDCwTAK2GYR0zSRIiTRNVps4hltDNvFtLJp+mZaGE4GI1vA6SnS25tnrMdkJK8pZASmY2FYklzGpFA0sV2TpVmTCy8phscFT/2kSaEs0UriZmQaGzipNTA66WN3T+EHmAW8cy5AqW4+z06g53sJliW48HLA/EzIg49laTYiPC/G9xVeKyYIEqJQ8PI3N1naVuRGCpjXDNzNhIu8Qr/RQ78+iTvdS1G2ySQthBOz2QxZqnk0Io+g6RFs19FhgCVsDCwEoLRCi4TECIgMj1i2iYhBOJhGHtsskjV6cIVNrLapBnNUWUe6OVwrjyFlWua1LMgVsHoHKQ/2Mt5jMpFP6CkYGI6FbZtkM5Jij4k0TC6+LNhc1Tz2UZODx02SOHUJtiuxndQiGOZuVfGdVoI9DSHvjAKkwu/4/LAT2PkKw9BcOR9x9gWf938iS6sR024l+H5CuxUThgnNuuabX5qnIlwKfSWiKz4TwQAbzRuouI4Xt1lPlvEtkzzDOGGBstXLWD7PSD5Hf8Ek71i4roVjS0yR7u0jNaGOadUStjciNio+G55HhQYVo0LFqBIIjzBpkeiEjNlHr7sPG0G1fZ31aA5tmzhmEVMYmIaFZTuorIPo76Onf4jpPpPpAcjmbCzTIGNLMnmDcr9Jdcvk/GnF/iOSBx5zECKtGTiuxHbTLMHqVBVva0PpR8UFdAs86cpPiAKN7yvQmqWbMX/+hy2e/mtZpFTUqjGBp2g1I8JIUa1qvv75GzSsHJg25kzMQWuSYhwy753j1eoLtGjRLw9wd88D3HNogpFBFyeUePWYrVZIPY5oB4JYGZjCwpYGjmnQl7Hp6zMo9mhsR2EIRdiE6opmbc1nvrbBfLTKulmnKT38pIIX1jFUhon8MbJGkcXGS6wmczjZfixsHOHi2DmEA0neRPaNMtzfz/Ehg+EBC9uWuK6JmzEolQ0yGZNLZzSmBQ896eK6aVbguLvuIFWCtN/gnRri7QSBd94CdIs8UZQGfGGoCDqRfKsOv/3PGzz6IZv9hyRbGxFBoGg1YwI/ZmM94etfmSHK9BBFBs5Nj0fyd3Fx5UVKJxpsh1vMnzd5dOpB9udGyOc026rK9eUaq5WARhgQ6QhEhJAxwhBIUyANA4GBpTNkjR56rB56snmKPTalXonpxEQ6wQwMjJqmtV1jrbXBsvTYyGp8scH60hls5XBo9BPEfoXr21/DtxMsYSOQFNxRCtlhtBvQyiXYxWGOjpU5PmWSy1k4jkEmY5DNSsr9NmtL0GwknHooQy5vYNoCx+m4A6tTPrbS0vGPfgzQzU01xElq+qNQEQe7KZ0A/v3/3CKTlXzkpy3WVyPCIKHVivG8iLXlhGe+eo2adnDMQcorTe7LHeNM7Qu8uP0sI9ZhHpx4hEP9k2xWtrm+OcdMZYa6X8PNOBiWQUiVmAAtJVqK9CyMTpMHaEMihMQQNlmzSNEo0W8PMOiMk7dKxGZM5MZkXYe+OIO5FbC0uUClt049k2N+/QxrK5eY6v8YY7nDzCz9KRvxDLZdIBHgGmUGiscw8hY1uYLKFdk/uY97Dzj0lkwc2ySTNXBcg3KfSRhKvLZi8oBLLpfuJ9iO7KSKAtMCw3jd3oG+MyK786Vgnfr9NMeHMFSEgcZvJ5gmfOVPA156NuRX/lsX349pNhI8L8ZrR3ieYnuzxWe/uIBkkns8kz7X53xzmfOr3+TBoSfZ37uPerDNlaWbrHkLNNQa+0YGGB/u4dmz1yj178Ms9GFk8wjTJYlBaNHpAQghidJ6ROfs+SBshZI+Uit6jCxT7iH2ZfZhmgZrukLPmKCwPoSzVmWxNUN7oB9rSPDCxT9De70cH/wE1dXnmG+dxnZ6CPFJhGK4eJihsUNsept4RouBySOcms4yMSCwXZNcLnUJxZKFZRtIA0o9Fo6bKkAaGIqdvQRD3vku/jteB9A63aSJorSOH/ppxK+0Zu5Kwv/+Lzw+/HMOk4cUm+sxXjum2YgIvISXT2+y3a6yuTrI+61hZta+xoK7iAiynMg9Thi3uLj6Mhv+IrH0MISL6faSHx3CHRsmNCwsmUP7gsRL8Fs+Y0MZpIAb8xUcK1UEVNpdkngh9989wNUbq9S9GOlmiE2JNhUZ4XJAjnOXOUE7rvGat0m+r4+TcojNq1dwD0tGTx7gD7/8F6w0ljk18HOoxUvcaHwD084SGj5eEnD3/kNMTb2HCzcbNLhGbuwI906XOTghcDMW+ZxFJmuQzZtkO1bBzQicTDczMLDttHRsmgIp5TsVA4g7sPi7e/ZpLT/cU83z25p//8/auFmDj/91g8pmRLuV0GyEBF7CK6/VeOnFS7iZMT5ZOs6F1S/ytZVvc8h9mAPlg6w0Z7hRfZV2UkNKi3zvNIVDR8lNDSGUoD3v4W8kFHoG0L0J5G2sfAbLsgnamtiLkbFCBwGq3Sb2mkRtj4nhHKura7S9JkIphDSJRQ6RK2AUDISvudec4h63yAvVCyz1w4PD95K72mKhtsz00WOc3niRGbXJAesJvGuvMl/7IjlnhLbwaKuAfcUxJgbfx1LSphJ9m2zfMR44McbRQwLHtsjnTLKdWyZj4GYlTlbgZCSOI3EcY9cVmHd2G/mOugClOlu1YaoAga/w2gopNV/704Bn/zjh479uMTASs7UV0W4mBF7EzILHN16cp1lt85HS/cyufoXnll/h7vwHGSj0cWHzK2wHC0iZ5a57HsQbnESXe1DbIf6MhzBzDNzdQ899fcjRLPWqIN6MibZDgnqI9hKidkzsx6goQcUBgbdN4q/h1deQ8SYWEtvuJY5yPHTyMIWiw1deuElxbAg/Z9Pv2XzcnsSTa/ypd42R8inu8fu4sTjLYycO88zGWS6xybh8EP/c86w2TlPKjNGWDWpqix6jxN0DP8lmLmI1eJ588SgPnJrg8GGBY5kUClZqBXIGmayBm5GpInSUwN6JB+5sfcD4zGc+84/uRBagtSbZU/AJQ9KNG6VZXkz48u9EjB4yOfaQolmLaLcUvp9QqXicvlpnfWmd49YhVte+wfNrZ/jJUx/iY489wn9+8ffBWePuux7BOPA4uQdP0d5WxK/4ZM1ejv7sfn7x70/wi7/Rz8iwSXM+QTYVJ0bhg0cleivL4bLL0XyGE/kMx0s5DpSKjOTKZDKjmLl9KGuYREAUzNOoXcYUVcIwYHurAl4bKxQkIyUuFH3GrR6ezo1wpfkyV8s2I844y5VNHhw8xNL2BquFTe6/70EylYSVynV67H4kkmqyTd2f4cHCe/AyQzSCK2ys+GTcEuVejVLpppPo7kB22s13Oo932tLZaUG/wwog3lbwr5TuFHzoWIC04KPRfPWPfaoLJvd+BDKZiGo1od2O8Voh5xcD5meWGUmGSBo3eG37NNPZk9iGw0p0gWuz80wd+Tj3/tJH2AxNGt+sYlezHPiZad7z64N87GGH/UMGZy4rTj8Xs3wzorIQsPCaz+yFFgszDVZXWqxttqk2AkI/Jqc0+23Jw4M2j4zaHOsrU3SmiI0TGLlJVjfnuH79W2i1mW7Txopks0W+WGJ23MZw4RPRYb557kssjsaM5qdYbzR5/+Qhriwu0h71MZhCrK1TiebpsyfJmEUqqkHdu8EHyk+y5QzQjK+wvlynVBqgWAKtO93GOzfZOe/tUBYdJbgzVuCOBIFKd1q1QtKt247p14nm2pWQz/2rmKEpm0d+MmRzO6Jdi/FbEXOrPs9fqXE810BUbb707S8ynB8H5bPVWqWcHWbowQ8QHeihfb2Kue1y7NF+7v5QAccR1OuCKysJC8stajMtWktNlBdhGZIoUAgDbCetoWgpUZYkMgQRJq7tULZdxqXJMVdyogSOo3l1KebrN1qstOao175Os3qFjDtKoecAOs5SPrifzPumGVxx+NW2zW9+8z9ROXqIe8v3cG9J4WLzv51+DvvoJMbpBu2lZ1GEDOQP0tIxy94yD48Pct/IT/F79RksdY2c6OOpj+5ncEiTzdjkC1YnJjDIZg3cXFoldDJGxxV09gvuQG3A+MxnPvOP3m4dQCXp/n7q/+mUe9MNoGf+LKaxZDP9YEyuL6ZaUUReTK0acG4pYmN+Dn8x4vLceUp2L4n2aQfr5Jjm/l/+JNFQzNwXthgdHOapnx7hI49nCD145nzMt19d4/qzN6i8tIS50mQkkuzXGe6yS3z0UA+TbYfhtsWYbzHoScqthEEvYlR7JLUaflJjQXtcVJpzbUm1bXGq1+b9Uw52lGW7vQ83O0areY16/Tq5bJ5ws403WyM4OU5rPMPfyBzim6++wEZvFtseogebsulydXGW7N0TxEsxkb9AGHhkHBsZm9SlwwcPj8KazcZYEd3wqC3D0JSLaaTDKIaUuy3nhtx1C91GlZ3OZnGnFEDcftrXqfV36/2hr9BKM3cz5tKXBZmcZN/9Ac1QEXc2fBY2Am4sN2jfvEqrvoktJIiYKGgzWHiU3FP3cnH5CpUXJT/5U0d57MFeDEy+diXgyy+scOPb12m+usLktsuHS/t4amAfdw0M0p/LoImxBlq8eHmD+fYqK8Emm/4WG81NchnNUw+Ncf3lFZxqmyFP4zYbhNJnwVQ8t6nY2DL40P4S7xnPsrRhIqwppPC4svAVhgcL5CjSurJE88Qk2SNlnq4P8Rdnn0eMD2Hl8hzKl1hZDahRwR7uZ/vmdUZ6YkzRh+O4LK1fZ+K+Isebh1naWoWD/TRueoQtyfCUidCdBhFDvmEGoRsXCAmyqwDibWcB4rZ9fxJ3GjhDTeCpTkk3bfD44h95NE5bGPsVB54IqG8kRM2Q7YrHmRW4ee4C/uw1bEOiRUDotzkw+El4tJerMy8wGdzFxx+4myMPxnz5muLstU2q6zeQmwEnnSEeLE1wbKqPWRnx4uIScxtr1Oot/HaLemMFadVBBcSqTaJiFAqlBUpLDMdAKJfH7j5FdV3htxUyZyNGBxCjA1hNh4/ZeU4UHP7g7FXObzToH13klZt/hsUk+wffQ91SPP5/fx9HbvTR/vwF/m3zOkef+CDvzbj0o/n8+RdY6y/QfOkyVu0q1e2Yhw4/ScWb5eriHPdOvI+7snfzeecsveP7aJ6r8/BHyxw6IXEdm0LBJFewyOUlmayJmxO4jsRxjbTP0H77jaVvywV0W7njmE69P1WEJIL1jYRLX45whI17JMIqacLtEK8dsrQVMLcV0rh6ESvSICJa/hr7Bj+O+cgIN5a+ytPTj/PJk3ez4bX53ELIpas32bx2liN+iV/dfy/vPTXN5qDD2eIKX7x4jovnz9Oq36Rev0DkzWLrbbJRQpkCQ2KQcWOCfeYU+60pJp1heshjqIgri7OsttdpigphVCfZqmJVfMqTBV6VPgszTX5m/CBtr4rTO0mWXq4sfxVpxaiaydyZGtVj+3h/3wi1S4tcSmroiSGePCpZvJzj5twag/dPEi81Wa/NksQxh/ofYmi0wGoyQz4cZ1KUuZZsMjjSx/q1iOH9Jo5LGgQaaSvZ7nSS2OlV3MkK3q4CIG4vokx3+3a3esNI43tpX/65lyOia5LIlhTujkmihKgW0Gz43NjWbCwskywvYRrQjDcZKT2Kffc0r838Oe+f+hSfPjrFC6urvGZpNuZnqV2+xs8NneITp+7hen+Wz27O88Jrr3H9xVk2F16jGZ5l27tKEFXRWiNNG21KIkw8YdLSghaSUFjYRokRd4yTxbu5v3SCCbOXJAjYDlqQNbAyPhuXFilnC2xOZriwvMmvHDkK+6ucfzVPXkpmt59HWpJ8u0Sr3iaaHOdJ1c/ZhRus5STD+/KM9Re4+pyH2Cdp1zRhZZF6q8Jk/xEICpy99ipr8QqPFt5HGGiCUY2jTKrrCSPTEqnBtIx0CqnrAsw0XdxRBuPtxQK3bQHSEew9aV+UWoDATxXhzDMx5cBm247JHwO9HeK1Iyq1gNmtgObN6+h2E19vUbIPMHTqSS4sfoHH+z7Gw/lRvry0wmZvhrnZRbi6wt977HEG7pnkP9bqPHvmBbz5q0z1BixvP89S5TxKRbjSpWQPMVg+guscIGsfpugeoT97gOHCFP25CfLZAbSToyolqzqhqgRlZ4iH+07xUM8UbhKzGdXxY0Fza46C5zLxkTH0vpD3OeOsrC2z5ZWxqbPpzWCJAmWVZ+zeQfozvdhzAa3+TbJ9ZYYnXJqhy9bFKvaxLMFsBS/cJPIMHjh8H7V6k7ngFTLJAMfLB1lqNek7aLN+PSHfAz196S7gzhiakXYM7Z1T3Jse3s6xZzZQvPXCz87cXXffP528XFtNEBWwHEGUU8RaI9sRQaioehqvXkGELULZQEYGY3d/gEsrX+HB4lPc39vPN1bWYSjHpdPzjHst/t4vPMX58SyfP7OGvbmIuTFDI5rlW42bVFYb9Dn95O1h3OwUKhrjr336btSsJFjX9PdmyZQtjLIkdsBPVNqTpzRhTVNZD1leb3EmbDNa6Oep/nEeatzksyvXqSYG9bU5ql8SyP/qXv7F15p8tHiUefcFovgRIt1g+ohJY62Cd22F5x3BB+86zIXzp/mGaDD501nu+cUcs/99DkMH9B08SGG1ytLSZZY3jnHf6APMX7rBRe8lhiv7GSkWaSyG9E1muPZqm7EpgWkkRKEkimRnLE4SWxqzMzBrdIZe35YFeOt1gHRMO23tZqeXP/BTBbh4NsLdEDRjQXtUUcjFhFsebU+xvNlme20Z3aziNdc5MPFp5v3LTBXyfOqR+3j25TXyo6O8trLMYUvzd566i28dtbm+uc7533uFrFpifuvbLGxewfBMJnvvIZ+/h57CAxzpOcTjQ2MMx3lKx4rkPpqnfcRmbSCh1atxRl36Djj0HrQoH7Hpv99m8pEMJx8tcXy6jEhczm955PuK/NL7RzHsLPVaDzcWz9MX5yk8vo8rq5qfKPQSjBlsLibMLr1MpbnBylVJ2zQ4OT2Jnok4F1ZwSwWOPemyti1pzUZkpiR92mNm8TIqzPLBYw+RMUe5UP8W2aSHpqjgtobJHZC0agLDjukfSLeuzc48QWoN9kwsdwpF4jY7hzoQMfotmv90VLs7h58k6S5rHKXWYHMu5kg+y+mlCKMsUc0QP1S0g4RGo4FuN/Db2wwXHiAuZgjmVzjQ/0kuXFyid2ia17aXmDAF/+2jB3nukOKbF1fY/pMLRM1ZvrXwEobpM+qOUCydxHGPczg7xD19PeTH89QmXV41IWyE5L8S0d8WHHRK9LiS7WiOS/6rXNs8y3J1hgZVdA7yg70Mj+zj0Mgp7h25j6Ayxpl1k6dPlChFa3zOP8nNmfMczZYJToyxMd/Hvqs1XsmOUUgm2fCvotzrVK7nOXtsgvc/OM5LL1W5sdTi4fkcB34my+ppj7bMc20mJONmWNxaYbNa4b/7myc4/7+WWVy4zKAzwbq8TGnpLkYPCGYvhOw/qDBkQhSa6fRUrElisTMJrVUKi4PB23EBb9X8d2bvFTsDnXGc7rI2W4qwqskMSLYDzWAGks2QINK0fYXfqBE1a5iBwcCBx7i89pecGnmc6uI6+cEDbPcHZPyY/8vd4/zbLZ/AbtH6i3OsrVzm1GFFeWWS9eWY/r5HKFuDvLevl9xwiY2jeeZ6DPybdZyLHuNNyckDwwwcg1can+O3Xvhtnr34NWr12vf8bcVSifcefZL3TP4yydJP8Mj0JMLo4aXFHi6//AJj4nFm7xvmVHWEybUNZpJpnGCehr9M2ZhkbuM6B39phAMv5DlfbbGxrHj0kxYv7rfwNlx6pkepvLpIqc/g8voKy9+cwNk6yLrxKtPeYW46s9RXR5k6MMCqDlieCzlwRHYGYBVJLIljgZ10QTBEippym27gzQNE7HnJLXAsXbSOKAXpqWwpHCVQAjyZgiTEXkQQKYIgJmo18OubTPU9zkbrBkVRIhNY5HN5MqNl5uM1fn5smD+stJkvQPM/XiKpruKFF7l6SXBg/D7GHnuA8kaJ90yXedUxWRtzMFcaZL6xxYjvcGSkjxOPl3il/gL//R/9fU5f+urOz0incuWtP6xz4bTS1Gs1vvDCZ/nCC5/lxNR7+bXHfpNfeOB9GG6GV2Y1C8+/xuG7ylQeyXD/3ChzwTp5e5Dt9hLkq8y85HHuwRr3TPXx2tISFRkxZFrc91MZvvzPamT7+6nKIoeOF1m+tsXaVotxd5rZ8ALxQB9FI2Y+OM/A7GP0jedYvB6w//CegdhYkSQKlRg7MtCJQJu3Ny4kbyf67yJsdIEcuhYAYGMtppgxaUcJytUYSZKOd4WKMEwI2y3yukymMMXG+ksMuQeh1WJoaJqb0RbvGyxwOWnxmlSo1y7htItUW+fI64SscRK37xR/66EjPHVfkWdGYXPIxD2/RO7MHBNBgUPjo0zfV+K3Lv1T/sb/+iinL30VQxgYMm0JU2gSFXduSXpLYlQSo3SCEAJDGkhhcOHm8/zd3/sA/69v/2PuO2Ry1/QhJvpG2P78LLV+wfihXqadoxRyJ7GxaAXrJEGV5y4s09eTx1qP+fYzbZ6f0QzdZ5PtsTGdAtlyL8+/cIWl9XWWmtvcOzRBVozijA0wNvYoYcZkaWGWoUKeZiCpbim0ojMmzw7+QRcIo4uKpm8D8/fN8wWIvfn/LvaOSkDFOp360YrqJuRyFnUfhAPEMVGYEEbpLWk2GCk9wFrzEkW7H9kK2VceZ1v49OclRsPjuaiJs7GCv7LFdvgMyluiN3eUcv/9vFcN8dzz2/ye20bFMd5Xz3DXYcno+D4G+no4ctLkn3zl1/jnf/T3UInCkAaJTgWttUbccpX0G+5prUl0gtIJUhigNf+/L3yG/8eXf5FDBxIee+wo7oaifqmOdyLLyUKRjLGPnDVIEjeI1Rovv7pNrQG9wiJZbXDlXMy1eUXfAYuoLTFyWUzXwJAtrlebHJgs0CtGUKpFYhqMFO9iQ23Btk95oMTSTQVij9Dj7srXO65Y6dtDfJa7QeBbCAA7t12Api52j6ZVB9MyafoKHEiihDhK0jGwIMQKXazMEI3mHCVrkiHtMNg3zIq/zalMkS9trgIJ/o0FIpr4leuMFu+nWHiCT09OENkufzbUxm7EzP7F11Aarn1TMKUNHnlvnv/hC7/Of3ru32EaFghIVJLqb2f4Vr8Jiyd0d5czAQ2mYfHZ07/PP/nCr1Asmdx9cBj/dI3KiGTfPpdesxfbGsEWkCQVmu1Nqo0Ww4UiqpqgW4rWjEKXHMKmBsdCmBkMM2K1EpIpSvqdIiKMOfEBgdNTws2VWV5YYaS3wPp6B8mki3zSAcvqgmPpHfwjfXsK8Fbzf630niygi8mTzvR7TUHGMdOLbAriKG0JjxU0N1coyHG22ytkZQ+FsMCJ3n3cjGsc6e3jtdlZVu0YvbxCnHhUq2cpWHnypcf4ueMHwLT5rL3EoBlw44tfIOOUmHQH+dB0DweO9/HPnvtN/vzFf49pWMRJlF6QvYLfwUTVb7Ru32E6W3Ta3OIkwjQs/vLMH/Kvv/wPuOdYL71VQasdYR3KMmTnkWYfNlnsROMFW2wHTUpWlqCmKLgxlgdtbTDQ74BpICwXYSnqfkCgIvoLOYJam49OOjz0kEnW3sdGrYWrFDEW1a24U3vpuADFDk6i2gHI5HYVQLxlC6DUrfBtSmnCAKJAYtsG0pAoDbHSxEoTRTHB9jamWabSvEnOGGaMAqVyLzUiitLi+eo8wg/wNjYIdB0RrJLtuZ/HxvYzUs7wn+JlhntdFr7+DAU3x3sOHOTnHh6CQh8vVr/N73z1H6YmX8W3CPRWN6bZQcbc+xrNHsTIPQ87TyUqxpAmv/vM/5szlWe5f2oYvRDQGjEZdGwcawgpc1hKoCKPqu9jawkRrM5qVAgq1AwNOyAtDCtLIhSJ0tTDkKFCnmqzQbQMP/eoy76JDJ7n0Npu0VvOsr4cp24gUbsgWl34O8VuDKDfQQugO1irmj1Qa12UTpWWhIUW6ABMI31RrNK/tb0m+JJA+2jdJKdLHM71EvQqJgbKnNu4SeAa5MM2PaUsjfol7Mw4Uz0P8+hokd9vVMiMuzTPXMdvBhyZ3s9/9bfHuLZuEPcn/M5z/zeiJNn5nuL1GYzeNe3fO1jWb4x7urC0nTf6p1/67xg8oCiuSRo5QX/JJW+MYRlDZEQWYkXdbyK0Svc65mJkW6N8yZU5UImDYTqEMkIAvooYzOXxggbzMwn1Zc1TT9i4SZbtZY/hfpdKNY2z1A5AZlcB9kDeac1bZYGTO5Mcb8kFsAPArLqwraSgDkJIwnZCkoBIINQGCmi36sjIoRVXsIVJDznG+3vQvT6GFlzzNzBj6HdMjhzpJWxvMz72CX7jkWlmLcVcLkDcXKeytcjR4yf48NGDvPIHCbUkx7b7JV64+C2kNFK/3QH/Fjv+XHxnOevXL/XvYQ81KJVgSIOz10/zzfU/4YiRJZEx2QGTouzFNvbhigxK+bSaASpSYCaIRozR1EQNsLMGEhOwiA0BMiEMFeVcnjgOubxU489+V1Nw4fCxLOsLEcWsJNImgafY6WrvwuRq8XazgLegM3vQuFUn6NjVwrQZFC0IYwVCIIOEAEGiFH6jhZWUCKIKWdFDr87QM2qRKM3N9Q2aRkSWiNn5Kl/9xjfJuFN84un7ee8vwpfrTSacJpXZ6wSJ4OMfOc6+TD+fe77JXfcb/MFz/yb17WIXHbzr92+FhH5Lyc53+Yd05/QPT/825SxkTIHVY4NuEyXLZM0cQSvgZ//GGMUhTaAUuRB6tEJHESrWHfAJiZYGwgAVQdZyiLyA+doaq23Ji88E3PtAjiQU6DDBdh0a9VSr95p+tWP6NbfhAbpZwFvvBLkVoTsNCpNYk5Dmq6ZUyDAhVCahThtBhLZRKqAghxi3CoiSol21WfBWECjiZgM7V0Alm2RKJ5mWki9+pYnXF1G9uE6rXSNJPDb/c5PPvVBn+q4yXnmNZ1/+MqBRKrnVcesORs+bFrr4rhdRsJsZaDSnbzzHJov0Zk20C5YwsEQWiwymLXjlhRXWqk1kRpAJFVlfIbVCJR2ziUAYFlJKLGFiISHQzK1eZlZd4YUrDZycZGzKpbYaUipZ1GoKQafyp/Zc/x3wc/GWzYB8S+tDd03O3sQZ6EagWiMMCCKFocFMBElk4AsDPE2iAkg0edXH/r48LUOzupKwHqwjowiURBOT4HBw331kNkL+5EIbR20wZEoiQ9OnXGzVx9VGk3vvy3Gl9SJeq4mUBq9P8cXOuMr3tnL6ey/5N9QJpJC0200uV16m5IIyFULIFH9ASTATXjuzzWajjTYNikJQ31DU13wIA3SSoARIaWOaNrmMiYgUSidsV5eIkg0aosLNVcXUYYfqakQha9FsCEDtYh3rvVaZNwpfv2kFeHMlRC12P+QWC9BB3xZopNQEMZgK8lIS12Palg2BJqaFaRjkKTA2bdGIJfVmQCvZBt/DdHrQ2kO6E9y7b5glL+Ra0mT9fIW1xRbtwOeYfZgbfoOMY1M6BNcWznXy/Ncr8ffL+MVtbISLnXIywMWFV8hmwXLSCDMvC2iR4CUe2azEM2OUEJTzBrGAsL6GCnyEDlEiRhou+UyO/mGbOFRomRC02ngVjzCzzMyiR3nIQbUUphL4ngHJXvKL1/1irfcWO97UD3vrfcV7rrPuWIQuJYshJUhNYgqiNvTmXfRWQJxzCKni6zWkaVEyXEZPSaLYpDziMTKSwW/5ZLK9CC0p9BxiX0lwrRURJm0yDQhVgPRChp0BloXPRG+BsASLs7Pfc1RNvzmP9iaVQO96FmCxNoOVAxkLfBXSa+XwRTsVbgJtGeMYFuUsBBpa9QWmRhQD5YQgTpCGpNfJMz5p4kcKKQySOKYZBsRlh/VqlUQZOEaCoRRKSeJkl/lEdcxAetpT8BBv0QXcVhGxk2qJPfUBwwRFjMpoKtWIoR4HXQlxHRdnbAQvWUNp6HFcBg4aTPbafPvKOebm1nEsA+VmUDLH4NA+MjrkupdgRzGlxKYWbVPUJqGGQAv6BmxCGxrr228xstub6b/OXog3r/wAbWrENngVQZAEDJo56kkT28qlbsKKKZkuPY7BVjPEZJPzl2ssLjewMhKCHI/cV2LyQyatZoKUFrHS2FKisyVaIqBWUxSzFiJQCGEQRymKmtZ7fsMtncH6nQ4Cxc6H6lsKJwJhghYJOFCphpQzkpwykY2AwtAUUqb/k82YWJZBsx7hiRBH5NKNGkui7CJDA2WazZi1MMH1NTnDxUt8eo0e1pMmljbI9km0BBm+3ud3zq+r7iG+i2t8/eu+20/+Du9j5CVuAlurGnRMyXDYTGrkrR5iS9N2DPYXXIRpsl5rYusW40M2SsUoS1JQvUwfdRGJprqdugBTZEma2xC3oWSyuh2SyzsIHxAGnTme1/1IfaubfqcqgXrHsO6NmjtmUaeAh0JEhIagFSoIFMO9WfylOraOsbM5oiQg60rmXk348tltIqOBUAosB+mYiGyZvGlRbUFbRORCkCqd9ClZZbYSj5xwEJm0KNLjlneD/u92EbT43qH93mLRd3uNfqP2lPp7cCuwXvUZNjOE2qeiWxTMEnEWEivDPUMWm5FgbX0RUwb0FFKwCi2z9Lv9zF+LqPxFxFrDQ8sQW+RIohDT9zCKWTbqIcK1cIVEiu6uq97zdfTr/PJt7Qbqt7L2O9vnHVRuscu4IQ2JbSpCNLJosL4cc/hABholXJGlkC2QqATLECxvhiw3m2gRI7QA00SaJnYux/SYpubHxCrCaQtyeZOjR/tIIklbRWSljbJBeTBanLx11X+/6t73+bP+TiZf36ph3cRybGAK7wZstH2OO73MBvNI08QUNlHZoccucsiQvLYS4jcv4oc2Z17exMplMGSBQbdMO/a5/pJiXdVQhJgyjzYN3Bgo2rRVgpISxzDRiSROOvxEeq9x2nX84i1yQb9lF9DNrLsTKTv0Kp0B06yr8aOE/JjBzPWA8bLNZK5ETzjOcM90+g6SFOg5DNFxjNQKw7YQFlglh+lpi3qkkElCv5On2gxZnN8mkQFeEmBoE2lKmjWYzp/caVF/g/S0eJ05ELeadP2dnL/4HnqTFoG0VgAc77+H2YuQ1yYDjuCKv0zOzGFlskTlPKfcHDJJOLtUQbVnkDKD0E1EJkdRlRgsOuQKgoWFkIbRIBEhtsyAA66QOG5C7Er8NlhCkkRdToMuQdXeKofmdrq735IL2LUAeoc+rcuqJTo1xVJJ0G6FuP02kQjIY/LEiRzZVpGxvsM4dp5YJiit0lJpGIOKEEYqEela3FiQNE2JiGBqLIuVC6lthsSExDpOp2hjwXpNc7T3IYql4k4zxxt3cvT3Xeq3hgD6u1T/9A6lXKIS8vkCx3sf5syVkAcyeWbDZdoEuNLFHR5AS5v3lW0uNjQbW9cQcRuDHEpGYGcZ1r0cPOkyUspyc6tOXdSJRULGdtGZBMewyagIihAmIbmi2CF6T0knxC3xy+1O98m37Dj2LqIOtZoUKdOG1imzRqPuURpwaSRtvvB8m7vuyfATD1gcHBvCzZTw4ogkARKFoTRapd04SQi2LblqQNhrYIQaA0HvUBZTZvGVT6zaeHGC0ZBUVUifO8r77v4gAoGUxh4b9frrIb6L8MUb0sU3biLqrvh3PuOxk+8j8Ycxt3yGrICXqotIKySfGyAZK3GcAkO2xXMLPqJ1HtMqIxKBkc+TBBbT+R7axHgLsBJ4tHQVKV0UEdIxMUwTMw4QOY0fRtiWBKF2+AvTay52FiK3Od311uoA34lZq2OOpJRoBbmCRIceoRa4eYOrl7c4czXiyZ8wObW/QKZQotb2SAKZrnitUXGMYwuOH8giTLBcjZtPByAaKw6bNx3sjKStmigdUI9D2FbIDMyvaz598tdSEWr9hhqA+L5xgH7DJdPfMWHskEt2cu/3H/vrXD+t+fRPOWxN11nzVrEMi9zkAfJFwdN9/Xxr3efG8hWUv4RhjqMAUeqj1LbptV3mVmO2F3y2iAhUnaI9RoyHnc1hGBIrSTBzAl+l/f8yAcN+HVAE7JkMEm8ZTvC2CkE7xEp7USs6kyq2a1DIJaxvthma6CVUVb7xTJWz2zHTD9j0lUtseG0cw8KQCrRE64g4Usxe3aZnWCAyoAxJ6IO0IWMbKGGQkACKlo7xNhNylsnFrTb3Zz7Gg0cfJ1FJWozaG7KL773Tp99EAbj7P1JKEpVw76H3sM98mgPCZ/+HLFZFjWq4wdi+e/EGXSZeyxNtKT5/Y5mg+i1i0+H+ew6R7esjlBnuzfWyIT0KvsvCZoWWFeLriII9QFtVyOR60zRTg2FoglBRLGtkAqYhO9PBu0ARcscS305H0FvQmF2q1HTVSNElVaCDq5+ahOERi42lBrmRAolps9Te4s+/5bEaa1xTsO7XsBILx9BYOkscR0ilCUNBxoLIAXvAJNbQCAKKVh7LLJNIAz/epJFU2N4KyTY11WHN/HX4ux/7/6ZX4XWkjVq/sdvnu+b5r/Mbe2PFnRUmJb/61P+Ho45DKD3+h//mJn/wF88xMn4Y+9Q0ucWA33hkgtOtBssrp4mCFYQ7xqXLm9hjY/SHBsf6y6zECSPa4mqzSUOvI60SImkT2QluroghNYYQWLLDg5QIhFZYdsfiGmLHCiDFLuXtO+oCuiZmL4umBNGZYjWsNFQaGrPxaj6ho+gv9aF0lUvnQz73xwJPmKwHy6jIpCfrIBMbnSSIJCIRoL0I+gym3uOQ6TGpeB7DxSK2UyZCk8m7KNFksd6mNK/J3G3xytw2R+VD/J8+/I93OnduCZJ4fYXoO0Z/b6gF7E0SDMMkUTG//tF/yM8eeoLNrTqfnWvx7OJXMcw8+z7yCM2VDX5l+DBLmRYNvUhQfw3PsjB1Eae3n7Zl88FcDwtWyAB5VtfW2BaKTf865fw4jfYMdrkXw5Ip2ZQpkB3egjhIyS2czJ7V/7rZQHG7LkC/le0Q0UGn2FECvYdQMQ1M8kWLclGxttFgcKoHs2nT9i5xfTWiERlU1RoNP2a0mEPGGSxhots+gfJpL7eZPC5ZqUqsYpaGDJjoz1Iq9aBUlomDLoazwkyzibEY09tvsFUWPPfcNr906h/w6Sd+Le3hk+atG8E70vz+ZlK/7vea0iKOI37m8V/l7z/2GZ59psEXlkKub79MMdvH5NMfZWZuiV+IDzDf8viHv3WWZ7/9dZQMMJ1xXMOFQ1NMVdtM9vfy0kaNj9xfYNndxBN1fFNREg6VcJZMsRdTaixTYtgGxBpTgBdoMDWum8LECYM9I2G7pNZv3QXot9YV3GXOlkLv0qh2qNAMI9VcKSVTB00Wr1coTEr63AnC5ga1hedpNS7SMqpcq1U4fncvru5BJpKoVUOYAVszHq7UTN8jGTpcYC0O6B1VHDkyiJ0d4NuvvMJ26xyisM21Gx7lLYFzf5ZzGy0uvtbiH3z8t/iVD/4GcRJ1glTju1cB9Rs3A/ZeQ0Om81ZxEvHL7/8N/uFHf5uvf7NNez/0Ds8yUBjk0F//CDUv4P/cOEAzVHzuyixWfIHhQQOjZ5SMGiJ/6gR+1eNTxRG+UNnmSLbE3MwCbaPIVjRLX/EEzfpFQsvAMG0sk5SuJmsgI4UlBM1mjJ3VOM4e1DCxh7x6h+/+HYwBbgkE95IqdWjWTCOFORfA6LgDscdWvc3gwTzFZB94VdyGQWBtc2Z9hvGhImM9AxSdPF57Gytu0fZjZp/1GdsvGN5XwOt1OHeuxYg1ALkcRXeQmr/K0tZpzm2vYZ4NsCcc7GmH66vbvPaSx28+/W/52z/5j9FaolTa329Iczc2EK8r7Wqx2w7SGQxJm0sTEJK/8/Hf5G89/G+5dC5ku73JxbOXWU36KXzqAZK1Bk9ft0jKMeuDdWrbz2MUtihNDULUT+7gYYyDI/y8UeSSsrhZb7HfMPnaixuEjYBaRjBijrDevIiVH06voSmxLYnhGghPk7UkjZoiUwTLkrucxbJLTat3FOKtHsZn/tFn/pF4SzviotN9s5ekuTOx0kUJDdNBBq8ZcO0aTJ1yqd20kVEbQsGWniNou5ywj5OQsO+gybn5G+TcIsZQP3rRoPexAnZdsrQRkMzUOdk3ygW/iqrXaCdrSJ0QywGGVQ+5fptwKsP2pS1ajZC47vDLj36A/eMfZNtbYGHz+k71TgqJlEYHgq1zExKjs8ff7a/XWvP4qaf457/0uzxV+gUuvrDF3OYGy0VNfP8+krFehi7UOb4ArzZbfPH6DFcu/CVr4Ws0zIhGI4fbP8Un/uWjHF7TlLdcfntrjg/nR7ly5RrDA1O82niGscnHCWdOs2Vu4/TsZ6C/QKnkkM+Z2P056jOaIeWCTrCmNPumLYRMwSP30tEZZicIv50g8K30BLKT9++9pfx3ptnVXgOB4MDRHLHfZKMi6DmSoMNBykY/2aQPsks4+5o4wuFrzy4RJ22CjW2yhYj2XJvlb0QMjmp6J8tc1VVkPeSu6cMY7gHMuA8vqRFGM5zZ2mLgok9gKnLHB7ixtsL5hTWaKuAX3vsIf+eJz/EPP/mf+cQDn6av3IfSiiSJb72pmFjFKK3oKfTw4Xt+kn/1a/+J/+UTXyC/9ABfOb3E5d6QrQ/0k/vQBGORwV0vNZDzDf58bZVrm9dJ6t9iNbqCWy5hyWEMc4Cxv/EAd9kGk5cT/sX8Ve7tHaK+VSFbHGYluEIjm6G4CfPV53ELo1iZHBnXImMKtGshAd2W5G2TeqjoH5IIOmxmncxrZzz89pr7MNGiQ7Uq3pTp7wZGqdnp+H5TpiTKpk45b+wU4arYY3HwUMyFsxXuf7jI6kCN8foxpuMtznlf4Lf+9Ns8MfZeRkojrG6fZ6BowLZH0p9j6Y8bTP3tMmMTLnNjGa6urXDfg/vYPnmCY62Ar7zweZr+dVbtCS7P5pi2+zh7t0vf+iAXry/yB38i+diHyjxy0KK6+Sl+9r5P8bc+tsBC8Bpna2dZqM7iNergaXKiwIAzwaHBe7hr7H5KaoK1TfjiYoP2lEY+OkCvYdC3nOB8o83aYp3nW1ss+muEjSvUWleoqjqm3cNg+SiBLjH89Ae4KylT/3/W+VdzFylMjtHTkNglg6xr86XZV7hr6udYePn/ILENjFyZTNYhm7VwLIHKWFixIgksMlnJulb0Djqp0LpsInsKQvI2YYLM25ko7aJVyh0Mu5QCxuiYI8vSOK5BHCkOHclz/coWN673MnaqwNK313m89wMsrlzkta2vM+COcGhgmhu1fdyYn2fM78N+qo+ll7ZZebHI/inBuYNDvHhzkYfDMe66f5IrL2xTcMepxjO43hleMcs8vVCg31FsPjFIrw9fvfEKl26M8KH7Rnhisofnliy+cr2ffYMf5+l9H6dwLziTEGUhtiCKodmC9Qbc8ALiROLGOcqbiuyFGDXvs7ruc6VRYdFbpB5cp9W+SjPcwtchGbefnD2JdscZeuQRHigWOXGxyb++9irO8UkOJD3sHw+J6n38u7O/zdSxD6Ovn2MrmiObGYR8lmzGIJsxEbaJ4RoYvsZILOJQQY+m3JNK2uzyD5u72cDtYsWZ3bLpW8UK3oEwNTr06Sa7hMl2SplqmAbFHoejJyzOnF6ipzCGeWiG5asNHs1+gj8P/zUXN15g/8hPMVE8yIXKIpWNGYY2J9BjBa5+scrTv9zL3Xf38PzlLS7PrnL48DhftUrksvtptxdpqpv06Q3ORdN8pJLnLy9t4z1RphQOc23uVdZf2+b07Ajv6xukX5R56XKdF8+1ybswUnDoK9hkCxIrq5GAk0hcJYla6QbU0kbAhhexkbSpRgt44Qwt/yb1eJWq3yBjFejJT2HZ/eSmT3L4A4/wAdci+NY6/3TmedwTh5gW4xS3WzhuP//Hq/8BMTnN4JbFq6t/QSEzTOA4ZPI9FFyF65jojE3OkUQVSQ6TaiuhcFyQyUiUFh2cIDoYgl2yy9uFiNkJAt/6G3RHxLSCRO3OCnZRQ1SSUr3mixYb6zXWFxKKgxnW2KKvvR8jDtny5rGMAuPlcRa2ZmiKDTJ+kdJDo9SuxOzPFDh0QHLZF9y8uM6TvSXadw+yMLeNaHr4us525SYD+YNUlMOTMscrMzeIT/bRJ8tUN2ZZiyuc3tyg2dzghG1xwCpQb7a4tLHA+dV1rixXmFlscWOuwaXZCpdntjn8KHzh9E1e27zBSnie9da32Gy/SDWYpaVreBH88k/9FO9/5D5evaLY9/D7eeThB/hgQzPztTn+3fJZsvdN0xtNM1aHw6M9/NHlz7LZZ3Cveg8Xzv8bcBws4cLQCMXhMcaymlI5Q5J3GC0abK4buGsubWIOPiEZHLIwTIHtpgvMtASGnQZ/d0AB3mImKPa0JHcGFJVKhxZ3R8Y1ccr0ip0xmL1ZJdwUWIMap8el6A2x5s+y3VxmX98B4khRCVdIWj75viHEeJHmTcV9w1laPSZnVxvYsx6nJsosjQ+SLLZJfMnQRMJW7TqVdpmmNvhUcYTrs9epH+tjoH8cf32dINpgSbU401xirb1EWcdMKpf+WGOFTYLmOrXGHFuty6z7L3P6wnOsVy7SDq7T8G7SjNfxVQshLHJmP3lrilgN0M6UeN+TH+TJ7D7236jyx8+d53NinaHHDrM/P879OkMJi98/9xdsjAQ8WfoY17/1O1TMTXrtYVqqRe7IKco5h4mygZHPYGdMhgqS+RsmhZqL1xPxwActXCflILbsrgLIDonE21aA2/EhnXRQ786npZg17IyLd1PFKFLkHAMvjNlcDVENn9xBn3vHD3Flbp214CxRHHC4fIqN5iYNsYm9aZK5Z4T1lRYTmSz3HrM5syU5t7jIe+Is+f0lWgODeLMV9k9N0YivM7/0Ep4YoSFy/Oz4NN5mi5sDGntsmIxykK02Wgds0eJiOM/l6AYb8Tpx0sRUARmd4Ki0LB0HnSETJRHSxDaKZK0hnMwwZn6Cu++7i4mpk7yn5yQH1uDMy1f4ncUb3NyX5eBTR3j4YC8fKOSpVz2eW7+AdarA6NoJVl/4LHPxVUacw3i6ic5YFI7cw6jpMzCQhYzFQEbiOCZLl00ybYPc8Yh7HnRBdJhEbIllGZgWb5tFpIMT+Hag4vdMpyqRDo50HieKDoiBIAoTyiWLtVqTuGWwsbFBUAg4nj/FtfXrrDev0J8boeQMsubNEwU1Cl4P9skebr6yxSMTg3ihyZIZcmN5jadzvayNOlgT/Vz+8lUagSQQq/j+JTa8POsM818/MsTYZsK1ZsDWcA6rt4eMmSOvHcqigGsVCGzBBk2WqbBMg7qhCG1JXQkiM4e0B8hkpigUD9I3cBdHx+/jyfGHeG/+KGMtk2tXb/CnS9c4k/cpf2g/T/3CPt43keOeRoZnzm3xH8++RM9DA4wsDXPx2d9hObnCqHOUWMdU21V6Dh6nODjIVCbG6cmSy1gMFE28yGT7kkmiEo69XzI2YSFNkVqALgO5+R3IpG5PAW4vihRidwBP70EN6cLH3IIl1JkeKvdazC7XcaMsMxs3MCSc6HmY0Njk+tolJgoHSeKYbTagmjA8NM1irs7qt33eM95PPTBZNBtUVpv8dE+ZCz02zv4BwustTKtIoJsU8jNs1gNmm4McH+njI7YNm4pl26Y1mKdlmmTLOcr5HopxH6OZcSaz04yY0zy8/35+49Pvozo7yL6eAxwqHeF4+RB39x7gVH6MMXI0alVemr/OV6rzXOxRWPcMcOL9+3n6Q738/HscbnxJ87t/vsg3K5eYeOggfRfyvPz136MqZxizDhHoCMMyOX74AMbBYwwaPiN9WcycTTlrUeq12FiVNK4amIMRj348g22lBFIpp6CxQx8j3yZY9B4LoG9TCfYMiXSQKrrj4unouNiZY4sTsAwoFCxmF5pkI5uVYI2J3CAZOciVymu0wnUms0cJwzaeXOcucxiGh7gSLNJXyzGUK6Fjh3NUSNYjHgnzeB/OYO4bon2+jSuHuOfkIS7Ofp65xWvcCMpUrDHuLzh8aMShz85z8H19VHJZVk3Bpunh5TSxqxBZg0DE3Fxo4rg2tuMgbZOGCFmKq1xsr/NysMaVrE9luoB1cpwjjwzx4Y+UmZ7MIW4aPPM/b/PZZ27gHQ0ZKY+R+3YVU73A9eUbHHBPEoqAhq6Ss/pw9xeQvcMczCXYpQylrEE+a5IrWsxflGwvwvSjcPKBDBo61PO7hJKGkW7IvZ3jbcPFpxO5u7Nqt8QEGuiMMKvOPFsUabK2geXC4oKPwKQi1zhmnGC7tcZyPINAsS93kkawxZX18xTW8vSdOsDLq+c5Zg9CZFPQJt+Mtsj7NgdfTXi5ucnA48dQmwkXzq9hl4ZJxDLrG88yu7HFRX+AOgWO5w2evsvmgG3TnNEIXaSBS0VabLuSNVMxT8CCDJhLfOYJWDcSapaJ6C0weHSIvrsGOHaqh8cezjJ1Mkdj0+binzZ59n+/ycXWOqX3lpmK+oiev8zL1z7LzZVFDmXvQVomq/4co6W72NZLBCPHOFByGOq3cTImpZxJtmAihMGNFwwCnfDUz9iUyxaGSYdMUmLa3ULQ96GRexNr+o6whmndgYrtMoT6KWFE4Gv8dgrF3moltJsxrWZCox4R+TFXZpucP10nVFuUjAIn1DG+tviHrERzTNj7mMjczUztNM2oyvHRT1J/T4H2lYt8YvwDzFV9EhnycrHNB3smOFlp8bveCv5UH/b8NhvXrhHJFonaIGjcREcumdLdFHtPMZoZ4cS4w4lJg5xKaFRjmgmstRVVX+ELTWQl2HmJMg1ix8EumEQO3PU4fOhRi81A8vXXBEtfbLD45TXakY+ctsk5JtEriyTeDTaTeWpLcLzvFIn0uVg5zcNDn+RGNIPXHzB1/AnuG47I9WYp5AwKBYvefou1ZYPnfh/2P6T5+b+ZBQRuVuyyh9lg3iH2sLdtAfYOZmrEzrzg7vCogA6ABHs6t6NY01MwMbMmm0sWW605GmaN+4tPUGltsBReJ4gbTOXvwUtarGyfZzQ6RGXMYn72LCeGj7JZaTPuG5zPNfBLJT4le1mfW2bWjcn092L4ESJ2yRanOXxknI2Na3iti2y0r3FxY5sXlnzO1jVzgWTqfgedl/hIsv0mTr/LgVM2Rp/FFU+jxxXD9wuKQyZb52K+9DsVTv9vN1m6sUoyaZAfcLDna2y//AozW8+wUlnHqg/xwMgjJEaLb69/lSdHnobsEDeT8wweepgjvTAwmCGTMcnnLTI5g2KPydVXYH0x5sO/aDM8ZiEl2DvUcelewJ3iD7xjtHE7rGFhChUTBIrQV4Q+qRXwEjwvodVK8NqKZiOm1YgI/JiZ2YjXzntUt8/QaxU4bN7FmY1vMu9dZFAOcST7Huba52h5mxw4/PPMj7boWdvgvqEH2K5FlBLBjXyMUcrwCSPLza01vuQvE+YssrEirrawNbSiCMyIKNpEEyAMG2H1YGb6wS4jMllkzsXIuRiuhekKjIzBQ0cNwg3F9lyd9mKbhdU2ohhjDwgMT2HPNmmtzrPWnMFPGjhJD+O5Axztn2KxPcuzq1/lif6nODT2YT6/9ifkJic4Mr2PE5MJbs4lX7TI500KPQamafJH/ypmaAJ+9e+mI3NORuLYcmf1v93I/w2l4DuiSZ0dQsNMI35LCVQiUInGcgRKyU59oAsxZ6CTNDCcmlBYdo6Lc+9lc/E8Z9rPM9FznFgarPlXueQ9x6HsKRaB2et/zDHjZ1gZz/HMzWd5qPQQbWVxT2yxtQaftZscJcevZo/ywtYS55IKuuCgMZHNFokHphjEsNOau3RshGEg8dL2q1aAbjc6EzOCyFeIeoaVxZgLq1UKAw75MYWoebReWMOWEbXoJje2ZijKCUblfRwfO0zWlLy69QLnWy/zUM/DPDj+0/xl/RmMksPgwD4OjMY4WYds1iSbMXEdQaFocvMSNGqKT//XLo6bXjPL7LCIm28PGv4dtQDdI0kUcQc4OgpUxxJogkDjeymDqOcltFsx7aai2YxpNWN8L2CzljC7abNw8yZ6Y5lC2EMlWGMjmcMOBVPWEYLEpx5ucGTsI2xNlFhZO8tJ6yBFexCr2mQg18NGxqQa1TmedXFjOLu9yGW1RdMJkbQxowSRpLP2KoFsxiVBEuu0uxkpkKaBNAykELT8EEskZFGoegOvvkk7rOEnHpZpYsZZsnqE433HOT6wj4XmAu3CAqveOsFihvcf+Wt8O77MfOM0vUMnefi+PCPDFq5rkS9aFDpkkcWyyR//mxC3B3797+VRSuC6EtuWqd/vkEjfSQLhO64AXR6BOOzSyCSdwJA0MPQSfE/TbsV4XkoZ327FNJsJXjui0QhYqtvML9QRrSXC9Qb1SgWVTTAxcJoCQ2gqwSb7ig9iH7qP67Uz9LZCRgvHEK2EMQW9PUNsuJpANBkzc2QSwWxrg4veKmuqQmz4aOWDijBRJHGMTsDUJhLZKWtGKK0QKiGJfcKogY6DlG8gLpJnnF57jAO9I5wYHqfeCnih+RKvLpzln/zNTzL7mqbWnGa9r8q1pRcxzT7uv3+Uw4cllu2SL5jk8gYZV1LuN1m4rvnsf/D5b/5xnn0HbYBO4McdN/2v2w28czolRLpDpc007TMRKEQHYk6AkqAVWhkdhTE6k47pN1BoJmVAVjvMVw7gFRpk11Zhe40gjtiQW2SEJpfJMt98kf6za5ya/jAzmUVOr/0lY8VDNOUYxdUZDrglJsv9NGzNmogZ7R3hsDlKNfBZarVZaTbZ8uq0wy20VQeRECdtorCKQGMogaVsHFHGJouBC8LCNbOM9Jc4OtTLPeMjFCdt/sMXzvDljS+zzQpH81Os/OUgi3ngeI2N2QVEkuf4iREOHTKwLJt8PuUEzGQkbtbEcQ2++aU2D33A5sAxm9CHTMbo7P3r727636bw7jx9fOdQqusK1A6dTBzoTnqoCNoK31cpg6ivaDdTNtE0XYzwvYhmI2a9abBl2XitBu1rl2mtztMOahiWQ8bI4LUaWDFM9z4K+QlmvdeI1BZ9mWkKQZlyZDHl5BjKFcDNkrgWdtGmVJTIQFEc1PhGwDe+4JNYCYEXoxK1M1xqSnAdA9cWFBxJX8ag182AgErVI2adr4kXeXl2haK0mWCcR90nuZKJ4P46cUMxd3WLIycGuf8BF9s2yeatlBQyZ+C4koEhi8tnE775BY//6/9Yws2mGz27pv97RP13RgHuMCl955slHRj5OEoLQFGoCANFGJC6gg61vNdWBIFOXUA96TwX0fYVoRfTrIesRBZb0iFsNwkXbtBaWqbdqjI8MEDTq1CrLTFiTTHa8wRtIaioOdqygo2LG5bIhVmGZZZBu0CvW6S3VGS4aDExZVCaFLSaGooSbQtEUaeo4i2FrkNcFbRWDBotzXKlxfm1JV7bvMZG0CTT28Ng/yGGIhNZXWCosJ/l2CQ8WcNGcv38KsdODXLfgzlsS5LNmGTzJm4m9fu5nCSTM/mdf1nnE7+Q4/i9DioG25WYtkz9/ncr+NwB0y2UVvrtEkd/r3hAJXuJJRVhkBaLwqDDM+gleO2EjdU47W03EmqVVAn8IKbtxfiBJm5F1LZ9ViODppMnTCKaK3OY9Sp+dZvQbxOrJjJKKBuTlN2jWJk+qqzTUCtgKAwc7ChPJsriJhky2BRFjqLtUM5L8qbEscHICmJDUw8V9bqm2vBYa62zES4TiIhiKc/R8WmefGw/lfk8F2ZgtfYSSRJQsKfJ3a9oeyHnX7rJ3feWufehMrYtyWatlP8vI8lkDBxHMDhs8bXP+Tgu/OSvFPA9jesYqc+33hm//7qewHdE9rupodHNNTvgiCj0TjOBTAtFAvoGYfZKTKIlg6MSz5PUa+mOl23FNC2L3pxN2QuoVSustwVWcYiKUUJkhsj4bZJWnSTw2I4qbPhfIheUKNmH6TenUSqmbdZpyQ0qRotERZDEODKLCB1Eu4hR7CFT6CXXW8IsOciyQ+IYrP3li4TeDfoHxjg19ABPjB/myfcLrGMJ//J/rHLdu4RvNBh1TjD6hMV2vcbMxVUeeqyPu06WsExJJmd3hC9wXAPXkZR6DZYXYtqtkJ/8lV7CQOM4EsPqpHzvsPBTBRC8kzrQUQKdfhBgpWBye3DtBAIDKQVHT0ouvRZz5sWE8f0mg8PQrGuaDYFtKVqhomU6FDMWxSCiXU/76istk6ZfxM9kCVseVtBDEnkEUZ2V+ApGdJWsKGP7RTJRhqy2ibVPlGwDbTA8DBFgNj2S5gbx1DGKT+5D1H22Pvc81vWbFEoFRkeHwXTIjjdo5F3+4//U4KWNWRI0B0qnGHxQMDe3zdrcGo9+oJ/pA3kMKchkLNxMuvLdjMRxDNxMOlwxc6XBT/y1EqaZBnmmJdKVb6YTWO/0cUddwPdSJK1Vh1mkwzHccQdxkKKMh4EiCBKE0CzcVLz4jYgogkPHNX2DEUEQ02wktNoxrUDTjiQ61ogwJgliPD+h5Sf4nbQzDGOSRKCUIEkSwtgjDgNUFEKkEHHn/5WBjDRWpDBNG+PecbLvO4xsePgvXEevrFMezdGMLFAFfvED+znYV+DP/rjBt5fmKZRsjh4dJy4HnD+9hWO0efCJIr2DDqYUZDNWZ8UbOBmZ5vWuJJuXzM+0GRhymNjvkiiN7XSZwbgjzOA/9BjgDZmBVjtkk93sIAoVUdBhHu3wD2sUgad45fmEV1/SZLKSQ8cTBkZCtAjTwLCtqQYG7QiSSCP8CPyIOEwII0WQJEQJREmX31Du6VNQKBWnexRaI/M2crQXY6wfQwiYWUGvVXBcMLIOGysW5UKBX/3ZPsxVmz/53RZXvG0OHSlw5NgAV9cqXLu8yeGDguP35dJ2LVOQzaTpXXpLy7m2K3EzBipJEFLTP5S2eluOgWHpO1rn/6Gmgd9fCVKO4ZQMKaWdjzt7CFGgCYMEKTWVbcXLz2vOvyqRCPZNRQzti8iVIiQxXpBQjwRNZeAnkihU6CBBBxHaj1ChIokVKkrZTRI0ClC2iSpkED05rIKLFfjItSqi2kRITSgMWk0HIy5y8kAP9x52uPxixMtnY0qHYP90jlYTzl3cws21ufchm74hCwDXMXFdA9sV2E4qfNvuNnQY2DZYtsDNpLP+pi06DR7iB7byb90Ohnc82Hjj9rHaIZ7sjpPtcBAHaSUx8FOuHyE0m+sJ507D9XOSdk2QL0LfcEKhL8QtRNhuApbGNwRtYeAhCZUk6oysqUTtgjR3AC2MJMZqBxhND+HHRNqiHTp4LRdbuUwUMoxnTYKmYHYxQZQlwwctAl9xbbZOFDc4epfBxLSFYRgYUnYaNyWWK3CclDzDcgW23enlswWWDZYt0xq/3Wnu+CEIv6MAWr/pyaC3EwR8lxQx5cHpKkF6i6MOJX2UKkMYpEDKoKlVFXNXNdfOSTYXDPANHFdj5xRWPsbMRkgrRloJ2AptgTZS+HpBqgQ6UsSeImiD7xt4no2KXVxt0Wc7DGUlvfkEgaAZmwRZCRnNVjVgbd3DcgMOHIbxfQaGKRBaYttmKmBnV9C2IzvPSSwb7M52rmWlkb5ppS3dhvm6Kt+buY53SGQ/WBfwOiQmrXdp55JYd9hHFVGcVhGTDiN51zJEQULSaTMK/YSNdc3STcHaTYP2ugFtiSNSthIlINKktCwCYg2RTgs8WqS9dLaQZLWgaEBvAXr7NE4eIlvQSAxqkabhh9TqPlES0tOXMLFP0NdvYBgG6LRDJxVsWrixrU7L9s6KZ6egY1m7DZ07q17yOh7DO6gAb7Yj6AcZA3yn76iV2uHDU90J4yg971QSOx1Hcag6DFqqs3OgCXyoVjVba1BZE/hViWqAFUicRJI1JbmcIj8EdgGyWYGDQbglqdWgGSkaWtEUCS2l8IlJZIxlRpR6oH8AesqpaU9xqCSmZXQEyk5/fle4O40bdnd6V3QGZ1MUFcPszFTK74DqoH+wohCqQwQkfkgKcOsuokLFXQq67ri52uHMTVPINOqPY7WjJCpJO5C75Wc/1LTamlYzvfmtNN3UcdqrmH6eII4lSqTVR2kqHFeTzWpyeUE2k5pv2cEdooPLY5ppL75h7nbndMezd4RtdYI6KxW6acp0lMvq4CkZKdbQD/eK/xDSwDcVF3R5CGOFSgRxsktN38Ug6CpD935aX1A7sURKqKA6O5ApXFyiOjS3nY5lVBfyTu3xSinTGYgUvrZTyUxn73dNtmF2RrS75860rmmmRRyzc3/Hxxu7q15K+QMNuN+kAvzofKGdolFXYF3X0CkipdZBdWYPu1SqKZW92qFT7RBaJruPtRI7DGdpGfo7gMbv4B5yC/aB6CJydM5dMAajS+Pe6dgxO893z9Ls/J/ZfT95R12nuCMK8EOOAb7XT0xHy1R67qz0RO0KOtlDXq0SsUOqqHaE3n0PDd3BFZ2CPaoO+GsXIquLk7QDhdeZuzdSSM4dBZCSHcEanRHtvavcMDqwOV0AB6ML5PSjdn1/hC3A693CXtegEnZ6C1XczSI6f092x9F2yK338Bt2Zxe6vIc7K6mLfNJZB0J2kbf0rZagA8jQVYSu4LsoafIWRenCuP7oXtv/IhTgjYrQrSHcOoyamn21c79r8rsDKjtchx2x71WGHcEjQOhdMMw9SFyiqwhC7wg49eliFylVSuTO//3oX9M7HwT+AAoYmj3mvKsMapfMunt/p+6vO6u/I3S9h1qtmxHsdYEpB4LYxUHuKsEONt+ue+hmcali7ELo35Hf/2av5dsUndD6NnnHb/cL3UEluZXKVr9uQFXs4dXTu5R33QEVfeuH7GVg6aJvS3bNuOhaBql3MJIFr/Pvd+K3/aDrAFor/SMXAN7GRdjhzu369g6BhNozkdQdUr0FI7JDd5IqgN5jEfZiI7ODjrZzH/HOCO8HXwj60akD3HEt0nvRwPUtdHff6WLvnZLejQu4PQzW/0IO86/sL+tIbxf96Pv559fBiv+YHPKv5uq/TYX5MTykfmM97N3jx0kBeNcC/JgrgH53/f/YW4B31/+PvQt49/gxVoB31/+7FuDd48dXAcS7BuDH+vj/Aw/0AWzBb0cCAAAAAElFTkSuQmCC", true))
						end

						if isfile("WraithIconsV3/blackhole.png") then
							blackholeTexture = getcustomasset("WraithIconsV3/blackhole.png")
						end
					end)
				end)

				task.spawn(function()
					for k, v37 in pairs(tbl7) do
						pcall(function()
							local str6 = "WraithIconsV3/" .. k .. ".png"

							if not isfile(str6) then
								writefile(str6, fn52(v37, true))
							end

							if isfile(str6) then
								local v38 = k
								getgenv().WraithIcons[v38] = getcustomasset(str6)
							end
						end)

						task.wait()
					end
				end)

				task.spawn(function()
					for i = 1, 3 do
						task.wait(1)

						pcall(function()
							local character = LP.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if character then
								character:Move(Vector3.zero, false)
								character.AutoRotate = true
							end

							local playerModule = LP:FindFirstChild("PlayerModule") or LP:FindFirstChild("PlayerScripts") and LP.PlayerScripts:FindFirstChild("PlayerModule")

							if playerModule then
								local module = require(playerModule)
								module = module and module:GetControls()

								if module then
									module:Enable()
								end
							end
						end)
					end
				end)

				getgenv().WraithIconFor = function(arg)
					local wraithIcons = getgenv().WraithIcons
					return wraithIcons and wraithIcons[arg] or nil
				end

				lib = loadstring(NL_EMBED)()
				_G.NeverLose = lib

				v16 = lib:CreateWindow({
					Logo = "rbxassetid://124302285576089",
					Name = "WRAITH",
					Content = "",
					ConfigFolder = "WraithConfigs",
					Size = lib.Scales.Large,
					Keybind = "",
				})

				wraithNotifDuration = wraithNotifDuration or 3
				wraithNotifyEnabled = true

				fn10 = function(arg, arg2)
					pcall(function()
						if wraithNotifyEnabled == false then
							return
						end
						lib:CreateNotification().new({ Title = arg, Content = arg2, Duration = wraithNotifDuration or 3 })
					end)
				end

				Players = game:GetService("Players")
				ReplicatedStorage_ = game:GetService("ReplicatedStorage")
				RunService = game:GetService("RunService")
				UserInputService_ = game:GetService("UserInputService")
				Workspace = game:GetService("Workspace")
				Lighting = game:GetService("Lighting")
				game:GetService("TweenService")
				HttpService = game:GetService("HttpService")
				VirtualInputManager = game:GetService("VirtualInputManager")
				TeleportService = game:GetService("TeleportService")
				SoundService = game:GetService("SoundService")
				CoreGui = game:GetService("CoreGui")
				localPlayer = Players.LocalPlayer

				task.spawn(function()
					task.wait(1)

					pcall(function()
						local wraithHud3 = CoreGui:FindFirstChild("WraithHud3")

						if wraithHud3 then
							wraithHud3:Destroy()
						end

						local screenGui = Instance.new("ScreenGui")
						screenGui.Name = "WraithHud3"
						screenGui.IgnoreGuiInset = true
						screenGui.ResetOnSpawn = false
						screenGui.DisplayOrder = 999998
						screenGui.Parent = CoreGui
						local frame2 = Instance.new("Frame")
						frame2.Name = "Hud"
						frame2.AnchorPoint = Vector2.new(0.5, 0)
						frame2.Position = UDim2.new(0.5, 0, 0, 14)
						frame2.Size = UDim2.fromOffset(238, 34)
						frame2.BackgroundColor3 = Color3.fromRGB(16, 16, 24)
						frame2.BackgroundTransparency = 0.15
						frame2.BorderSizePixel = 0
						frame2.Parent = screenGui
						local uiCorner = Instance.new("UICorner")
						uiCorner.CornerRadius = UDim.new(0, 10)
						uiCorner.Parent = frame2
						local uiStroke = Instance.new("UIStroke")
						uiStroke.Color = Color3.fromRGB(126, 118, 190)
						uiStroke.Transparency = 0.45
						uiStroke.Thickness = 1
						uiStroke.Parent = frame2
						local uiGradient = Instance.new("UIGradient")
						local new = ColorSequenceKeypoint.new
						local color = Color3.fromRGB
						uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 26, 48)), new(1, color(16, 16, 24)) })
						uiGradient.Parent = frame2
						local imageLabel = Instance.new("ImageLabel")
						imageLabel.BackgroundTransparency = 1
						imageLabel.AnchorPoint = Vector2.new(0, 0.5)
						imageLabel.Position = UDim2.new(0, 9, 0.5, 0)
						imageLabel.Size = UDim2.fromOffset(24, 24)
						imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
						imageLabel.ImageTransparency = 0
						imageLabel.ScaleType = Enum.ScaleType.Fit
						imageLabel.Image = "rbxassetid://124302285576089"
						imageLabel.Parent = frame2
						local textLabel = Instance.new("TextLabel")
						textLabel.BackgroundTransparency = 1
						textLabel.AnchorPoint = Vector2.new(0, 0.5)
						textLabel.Position = UDim2.new(0, 38, 0.5, 0)
						textLabel.Size = UDim2.fromOffset(58, 18)
						textLabel.TextYAlignment = Enum.TextYAlignment.Center
						textLabel.Font = Enum.Font.GothamBold
						textLabel.Text = "wraith"
						textLabel.TextColor3 = Color3.fromRGB(229, 231, 241)
						textLabel.TextSize = 14
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						textLabel.Parent = frame2
						local uiGradient2 = Instance.new("UIGradient")
						local new2 = ColorSequenceKeypoint.new
						local color2 = Color3.fromRGB
						uiGradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(243, 246, 255)), new2(1, color2(190, 199, 255)) })
						uiGradient2.Parent = textLabel

						local function createFrame(arg)
							local frame3 = Instance.new("Frame")
							frame3.BackgroundColor3 = Color3.fromRGB(126, 118, 190)
							frame3.BackgroundTransparency = 0.34
							frame3.BorderSizePixel = 0
							frame3.AnchorPoint = Vector2.new(0, 0.5)
							frame3.Position = UDim2.new(0, arg, 0.5, 0)
							frame3.Size = UDim2.fromOffset(1, 14)
							frame3.Parent = frame2
							return frame3
						end

						local v37 = createFrame(98)
						local v38 = createFrame(170)
						local imageLabel2 = Instance.new("ImageLabel")
						imageLabel2.BackgroundTransparency = 1
						imageLabel2.AnchorPoint = Vector2.new(0, 0.5)
						imageLabel2.Position = UDim2.new(0, 108, 0.5, 0)
						imageLabel2.Size = UDim2.fromOffset(15, 15)
						imageLabel2.ScaleType = Enum.ScaleType.Fit
						imageLabel2.Image = "rbxassetid://112589113282360"
						imageLabel2.ImageColor3 = Color3.fromRGB(190, 199, 255)
						imageLabel2.Parent = frame2
						local textLabel2 = Instance.new("TextLabel")
						textLabel2.BackgroundTransparency = 1
						textLabel2.AnchorPoint = Vector2.new(0, 0.5)
						textLabel2.Position = UDim2.new(0, 127, 0.5, 0)
						textLabel2.Size = UDim2.fromOffset(44, 18)
						textLabel2.TextYAlignment = Enum.TextYAlignment.Center
						textLabel2.Font = Enum.Font.GothamMedium
						textLabel2.Text = "0Fps"
						textLabel2.TextColor3 = Color3.fromRGB(229, 231, 241)
						textLabel2.TextSize = 13
						textLabel2.TextXAlignment = Enum.TextXAlignment.Left
						textLabel2.Parent = frame2
						local imageLabel3 = Instance.new("ImageLabel")
						imageLabel3.BackgroundTransparency = 1
						imageLabel3.AnchorPoint = Vector2.new(0, 0.5)
						imageLabel3.Position = UDim2.new(0, 180, 0.5, 0)
						imageLabel3.Size = UDim2.fromOffset(15, 15)
						imageLabel3.ScaleType = Enum.ScaleType.Fit
						imageLabel3.Image = "rbxassetid://129826901381657"
						imageLabel3.ImageColor3 = Color3.fromRGB(190, 199, 255)
						imageLabel3.Parent = frame2
						local textLabel3 = Instance.new("TextLabel")
						textLabel3.BackgroundTransparency = 1
						textLabel3.AnchorPoint = Vector2.new(0, 0.5)
						textLabel3.Position = UDim2.new(0, 199, 0.5, 0)
						textLabel3.Size = UDim2.fromOffset(34, 18)
						textLabel3.TextYAlignment = Enum.TextYAlignment.Center
						textLabel3.Font = Enum.Font.GothamMedium
						textLabel3.Text = "0ms"
						textLabel3.TextColor3 = Color3.fromRGB(229, 231, 241)
						textLabel3.TextSize = 13
						textLabel3.TextXAlignment = Enum.TextXAlignment.Left
						textLabel3.Parent = frame2
						local flag11 = false
						local position = nil
						local position2 = nil
						local udim2 = nil

						frame2.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								flag11 = true
								position = input.Position
								position2 = frame2.Position
							end
						end)

						frame2.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								flag11 = false
							end
						end)

						UserInputService_.InputChanged:Connect(function(input)
							if not flag11 then
								return
							end

							if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
								return
							end
							local n25 = input.Position - position
							local currentCamera = Workspace.CurrentCamera
							local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)
							local x = frame2.AbsoluteSize.X
							local y = frame2.AbsoluteSize.Y
							local n26 = position2.X.Offset + n25.X
							local n27 = position2.Y.Offset + n25.Y
							local n28 = position2.X.Scale * viewportSize.X + n26 - frame2.AnchorPoint.X * x
							local n29 = position2.Y.Scale * viewportSize.Y + n27 - frame2.AnchorPoint.Y * y

							if n28 < 0 then
								n26 -= n28
							end

							if n29 < 0 then
								n27 -= n29
							end

							if n28 + x > viewportSize.X then
								n26 -= n28 + x - viewportSize.X
							end

							if viewportSize.Y < n29 + y then
								n27 -= n29 + y - viewportSize.Y
							end

							udim2 = UDim2.new(position2.X.Scale, n26, position2.Y.Scale, n27)
						end)

						RunService.RenderStepped:Connect(function(deltaTime)
							if not udim2 then
								return
							end
							local n25 = math.clamp(deltaTime * 18, 0, 1)
							local position3 = frame2.Position
							frame2.Position = UDim2.new(position3.X.Scale + (udim2.X.Scale - position3.X.Scale) * n25, position3.X.Offset + (udim2.X.Offset - position3.X.Offset) * n25, position3.Y.Scale + (udim2.Y.Scale - position3.Y.Scale) * n25, position3.Y.Offset + (udim2.Y.Offset - position3.Y.Offset) * n25)
						end)

						local n25 = 0
						local now2 = tick()
						local n26 = 0

						RunService.Heartbeat:Connect(function(deltaTime)
							n25 += 1
							n26 += deltaTime
							if tick() - now2 < 0.5 then
								return
							end
							local n27 = math.floor(n25 / (tick() - now2))
							n25 = 0
							now2 = tick()
							local n28 = 0

							pcall(function()
								n28 = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
							end)

							textLabel2.Text = string.format("%dFps", n27)
							textLabel3.Text = string.format("%dms", n28)

							pcall(function()
								local TextService = game:GetService("TextService")
								local x = TextService:GetTextSize(textLabel2.Text, textLabel2.TextSize, textLabel2.Font, Vector2.new(10000, 10000)).X
								local x2 = TextService:GetTextSize(textLabel3.Text, textLabel3.TextSize, textLabel3.Font, Vector2.new(10000, 10000)).X
								local x3 = TextService:GetTextSize(textLabel.Text, textLabel.TextSize, textLabel.Font, Vector2.new(10000, 10000)).X
								textLabel.Size = UDim2.fromOffset(x3 + 2, 18)
								local n29 = 38 + x3 + 12
								v37.Position = UDim2.new(0, n29, 0.5, 0)
								imageLabel2.Position = UDim2.new(0, n29 + 10, 0.5, 0)
								textLabel2.Size = UDim2.fromOffset(x + 2, 18)
								textLabel2.Position = UDim2.new(0, n29 + 29, 0.5, 0)
								local n30 = n29 + 29 + x + 12
								v38.Position = UDim2.new(0, n30, 0.5, 0)
								imageLabel3.Position = UDim2.new(0, n30 + 10, 0.5, 0)
								textLabel3.Size = UDim2.fromOffset(x2 + 2, 18)
								textLabel3.Position = UDim2.new(0, n30 + 29, 0.5, 0)
								frame2.Size = UDim2.fromOffset(n30 + 29 + x2 + 12, 34)
							end)

							uiGradient.Offset = Vector2.new(math.sin(n26 * 1.08) * 0.26, 0)
						end)
					end)
				end)

				task.spawn(function()
					task.wait(4)
					local texture = "rbxassetid://124302285576089"
					local color = Color3.fromRGB(170, 170, 170)

					local function fn53(arg)
						pcall(function()
							arg.Texture = texture
							arg.Color3 = color
							arg.Transparency = 0.5
							local parent = arg.Parent

							if parent and parent:IsA("BasePart") then
								local size = parent.Size
								local face = arg.Face
								local x, z

								if face == Enum.NormalId.Top or face == Enum.NormalId.Bottom then
									x = size.X
									z = size.Z
								elseif face == Enum.NormalId.Left or face == Enum.NormalId.Right then
									x = size.Z
									z = size.Y
								else
									x = size.X
									z = size.Y
								end

								if x and z and x > 0 and z > 0 and math.abs(x - z) > 0.05 then
									local n25 = math.min(x, z)

									if face == Enum.NormalId.Top or face == Enum.NormalId.Bottom then
										parent.Size = Vector3.new(n25, size.Y, n25)
									elseif face == Enum.NormalId.Left or face == Enum.NormalId.Right then
										parent.Size = Vector3.new(size.X, n25, n25)
									else
										parent.Size = Vector3.new(n25, n25, size.Z)
									end
								end
							end
						end)
					end

					local function fn54(arg)
						while arg and arg ~= Workspace do
							if arg.Name == "SpawnLocation" then
								return true
							end
							arg = arg.Parent
						end

						return false
					end

					pcall(function()
						for _, descendant in pairs(Workspace:GetDescendants()) do
							if descendant:IsA("Decal") and fn54(descendant) then
								fn53(descendant)
							end
						end
					end)

					Workspace.DescendantAdded:Connect(function(descendant)
						if descendant:IsA("Decal") and fn54(descendant) then
							fn53(descendant)
						end
					end)
				end)

				charObjsAny = function()
					local character = localPlayer.Character
					if not character then
						return nil
					end
					local findFirstChild = character.FindFirstChild
					return character, character:FindFirstChild("Humanoid"), findFirstChild(character, "HumanoidRootPart")
				end

				fn11 = function()
					local character = localPlayer.Character
					if not character then
						return nil
					end
					local v37 = wraithCharCache

					if v37 and v37.c == character and v37.h and v37.h.Parent and v37.r and v37.r.Parent then
						if v37.h.Health <= 0 then
							v37.c = nil
							v37.h = nil
							v37.r = nil
							return nil
						end

						return character, v37.h, v37.r
					end

					local humanoid = character:FindFirstChild("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
						return nil
					end

					if v37 then
						v37.c = character
						v37.h = humanoid
						v37.r = humanoidRootPart
					end

					return character, humanoid, humanoidRootPart
				end

				wraithOwnerOf = function(arg)
					if not arg then
						return nil
					end
					local partOwner = arg:FindFirstChild("PartOwner")
					if not partOwner then
						return nil
					end
					local str6 = tostring(partOwner.Value)
					if str6 == "" then
						return nil
					end
					return str6
				end

				wraithHeldByOther = function(arg)
					local v37 = wraithOwnerOf(arg)
					return v37 ~= nil and v37 ~= localPlayer.Name, v37
				end

				wraithKickBusyUntil = 0

				wraithSelfBusy = function()
					return tick() < (wraithKickBusyUntil or 0)
				end

				wraithCharCache = { t = 0, c = nil, h = nil, r = nil }
				wraithSched = wraithSched or { jobs = {}, conn = nil }

				wraithEvery = function(arg, arg2, arg3)
					wraithSched.jobs[arg] = { fn = arg3, interval = arg2 or 0.2, last = 0 }

					if not wraithSched.conn then
						wraithSched.conn = RunService.Heartbeat:Connect(function()
							local now2 = tick()
							local n25 = os.clock() + 0.002

							for _, job in pairs(wraithSched.jobs) do
								if now2 - job.last >= job.interval then
									job.last = now2

									if not pcall(job.fn) then
										job.interval = math.min(job.interval * 2, 5)
									end

									if not (n25 < os.clock()) then
										continue
									end
								else
									continue
								end

								break
							end
						end)
					end
				end

				wraithStopEvery = function(arg)
					wraithSched.jobs[arg] = nil
				end

				wraithScanCache = { t = 0, toys = {}, blobs = {} }

				wraithScanWorld = function()
					local now2 = tick()
					if now2 - wraithScanCache.t < 0.5 then
						return wraithScanCache
					end
					wraithScanCache.t = now2
					local toys_ = {}
					local blobs = {}

					for _, child in pairs(Workspace:GetChildren()) do
						if tostring(child.Name):match("SpawnedInToys") then
							for _, child2 in pairs(child:GetChildren()) do
								toys_[#toys_ + 1] = child2

								if child2.Name == "CreatureBlobman" then
									blobs[#blobs + 1] = child2
								end
							end
						end
					end

					wraithScanCache.toys = toys_
					wraithScanCache.blobs = blobs
					return wraithScanCache
				end

				wraithMarkKickBusy = function(arg)
					wraithKickBusyUntil = tick() + (arg or 1.5)
				end

				wraithDefenseBlocked = function()
					return false
				end

				wraithKickActive = function()
					if wraithSelfBusy() then
						return true
					end
					local flag11 = kickBrake == false

					if flag11 then
						flag11 = (kickEnd or 0) > tick()
					end

					if flag11 then
						return true
					end
					return false
				end

				wraithGrabbedInfo = { held = false, by = nil, weld = nil, since = 0 }

				wraithBindsChar = function(arg, arg2)
					if not (arg and arg2) then
						return false
					end

					local ok, result = pcall(function()
						if arg:IsA("Weld") or arg:IsA("WeldConstraint") or arg:IsA("Motor6D") or arg:IsA("RigidConstraint") then
							local part0 = arg.Part0
							local part1 = arg.Part1
							return part0 and part0:IsDescendantOf(arg2) or part1 and part1:IsDescendantOf(arg2)
						end

						if arg:IsA("AlignPosition") or arg:IsA("AlignOrientation") or arg:IsA("BallSocketConstraint") or arg:IsA("RopeConstraint") then
							local attachment0 = arg.Attachment0
							local attachment1 = arg.Attachment1
							attachment0 = attachment0 and attachment0.Parent
							attachment1 = attachment1 and attachment1.Parent
							return attachment0 and attachment0:IsDescendantOf(arg2) or attachment1 and attachment1:IsDescendantOf(arg2)
						end

						return false
					end)

					return ok and result or false
				end

				wraithDetectGrab = function()
					local character = localPlayer.Character
					if not character then
						return false
					end

					if wraithOnOwnBlob() then
						wraithGrabbedInfo = { held = false }
						return false, wraithGrabbedInfo
					end
					character:FindFirstChild("HumanoidRootPart")
					local tbl8 = { held = false, by = nil, weld = nil }
					local isHeld = localPlayer:FindFirstChild("IsHeld") or character:FindFirstChild("IsHeld")

					if isHeld and isHeld:IsA("BoolValue") and isHeld.Value then
						tbl8.held = true
					end

					for _, descendant in ipairs(character:GetDescendants()) do
						if (descendant:IsA("AlignPosition") or descendant:IsA("AlignOrientation") or descendant:IsA("BodyPosition") or descendant:IsA("BodyGyro") or descendant:IsA("BodyVelocity") or descendant:IsA("LinearVelocity") or descendant:IsA("VectorForce")) and descendant.Name:sub(1, 6) ~= "Wraith" then
							tbl8.held = true
							tbl8.weld = descendant
						end
					end

					local grabParts = Workspace:FindFirstChild("GrabParts")

					if grabParts then
						for _, descendant in ipairs(grabParts:GetDescendants()) do
							if descendant:IsA("WeldConstraint") or descendant:IsA("Weld") then
								local part0 = descendant.Part0
								local part1 = descendant.Part1

								if part0 and part0:IsDescendantOf(character) or part1 and part1:IsDescendantOf(character) then
									tbl8.held = true
									tbl8.weld = descendant
								end
							end
						end
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							local v37, v38 = wraithHeldByOther(child)

							if v37 then
								tbl8.held = true
								tbl8.by = v38
							end
						end
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							for _, child2 in ipairs(child:GetChildren()) do
								if child2:IsA("Weld") or child2:IsA("WeldConstraint") or child2:IsA("Motor6D") then
									local part0 = child2.Part0
									local part1 = child2.Part1

									if part0 and not part0:IsDescendantOf(character) or part1 and not part1:IsDescendantOf(character) then
										tbl8.held = true
										tbl8.weld = child2
									end
								end
							end

							for _, child2 in ipairs(child:GetChildren()) do
								if child2:IsA("Attachment") then
									for _, child3 in ipairs(child2:GetChildren()) do
										if child3:IsA("AlignPosition") or child3:IsA("AlignOrientation") then
											tbl8.held = true
											tbl8.weld = child3
										end
									end
								end
							end
						end
					end

					for _, child in pairs(Workspace:GetChildren()) do
						if tostring(child.Name):match("SpawnedInToys") then
							for _, child2 in pairs(child:GetChildren()) do
								if child2.Name == "CreatureBlobman" then
									for _, v37 in ipairs({ "LeftDetector", "RightDetector" }) do
										local v38 = child2:FindFirstChild(v37)

										if v38 then
											for _, descendant in ipairs(v38:GetDescendants()) do
												if wraithBindsChar(descendant, character) then
													tbl8.held = true
													tbl8.weld = descendant
												end
											end
										end
									end
								end
							end
						end
					end

					local humanoid = character:FindFirstChildOfClass("Humanoid")

					if humanoid and humanoid.SeatPart then
						local parent = humanoid.SeatPart.Parent
						local flag11 = parent and parent.Name == "CreatureBlobman"
						local flag12

						if flag11 then
							flag12 = not parent:IsDescendantOf(Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys") or Workspace)
						else
							flag12 = flag11
						end

						if flag12 then
							tbl8.held = true
						end
					end

					if tbl8.held and not wraithGrabbedInfo.held then
						tbl8.since = tick()
					else
						tbl8.since = wraithGrabbedInfo.since
					end

					wraithGrabbedInfo = tbl8
					return tbl8.held, tbl8
				end

				wraithColState = wraithColState or {}
				wraithColChar = wraithColChar or nil

				wraithColSnapshot = function(arg)
					local character = arg or localPlayer.Character
					if not character then
						return
					end
					wraithColChar = character
					wraithColState = {}

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							wraithColState[child.Name] = {
								col = child.CanCollide,
								touch = child.CanTouch,
								query = child.CanQuery,
								mass = child.Massless,
								grp = child.CollisionGroup,
								sz = child.Size,
								props = child.CustomPhysicalProperties,
							}
						end
					end
				end

				wraithColKeep = function()
					local character = localPlayer.Character
					if not character then
						return false
					end

					if wraithOnOwnBlob() then
						return false
					end

					if wraithColChar ~= character or not next(wraithColState) then
						wraithColSnapshot(character)
						return false
					end
					local flag11 = false

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							local v37 = wraithColState[child.Name]

							if v37 then
								if child.CanCollide ~= v37.col and not antiFlingNoClipOn then
									child.CanCollide = v37.col
									flag11 = true
								end

								if child.CanTouch ~= v37.touch then
									child.CanTouch = v37.touch
									flag11 = true
								end

								if child.CanQuery ~= v37.query then
									child.CanQuery = v37.query
									flag11 = true
								end

								if child.Massless ~= v37.mass then
									child.Massless = v37.mass
									flag11 = true
								end

								if child.CollisionGroup ~= v37.grp then
									pcall(function()
										child.CollisionGroup = v37.grp
									end)

									flag11 = true
								end

								if child.CustomPhysicalProperties ~= v37.props then
									pcall(function()
										child.CustomPhysicalProperties = v37.props
									end)

									flag11 = true
								end

								if (child.Size - v37.sz).Magnitude > 0.05 then
									pcall(function()
										child.Size = v37.sz
									end)

									flag11 = true
								end
							end
						end
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						if humanoidRootPart.AssemblyLinearVelocity.Magnitude > 700 then
							humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							flag11 = true
						end

						if humanoidRootPart.AssemblyAngularVelocity.Magnitude > 400 then
							humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							flag11 = true
						end
					end

					return flag11
				end

				wraithBreakTargetDefense = function(arg)
					if not arg then
						return
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")

					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("BasePart") then
							if child.Anchored then
								pcall(function()
									child.Anchored = false
								end)
							end

							if setNetworkOwner then
								pcall(function()
									setNetworkOwner:FireServer(child, child.CFrame)
								end)
							end
						end
					end

					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("AlignPosition") or descendant:IsA("AlignOrientation") or descendant:IsA("BodyPosition") or descendant:IsA("BodyGyro") or descendant:IsA("BodyVelocity") or descendant:IsA("LinearVelocity") or descendant:IsA("VectorForce") then
							if descendant.Name ~= "KickAlign" and descendant.Name ~= "KickRot" then
								pcall(function()
									descendant.Enabled = false
								end)

								pcall(function()
									descendant:Destroy()
								end)
							end
						end
					end

					local humanoid = arg:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid.PlatformStand = true
						end)

						pcall(function()
							humanoid.AutoRotate = false
						end)
					end
				end

				wraithGatherOwnParts = function()
					local character = localPlayer.Character
					if not character then
						return false
					end
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return false
					end

					if wraithOnOwnBlob() then
						return false
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if humanoid and humanoid.Health <= 0 then
						return false
					end

					local tbl8 = {
						Head = CFrame.new(0, 1.5, 0),
						Torso = CFrame.new(0, 0, 0),
						UpperTorso = CFrame.new(0, 0.2, 0),
						LowerTorso = CFrame.new(0, -0.6, 0),
						["Left Arm"] = CFrame.new(-1.5, 0, 0),
						["Right Arm"] = CFrame.new(1.5, 0, 0),
						["Left Leg"] = CFrame.new(-0.5, -2, 0),
						["Right Leg"] = CFrame.new(0.5, -2, 0),
					}

					local flag11 = false

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") and child ~= humanoidRootPart then
							local v37 = tbl8[child.Name]

							if v37 then
								local magnitude = (child.Position - humanoidRootPart.Position).Magnitude

								if magnitude > 14 and magnitude < 5000 then
									pcall(function()
										child.CFrame = humanoidRootPart.CFrame * v37
										child.AssemblyLinearVelocity = Vector3.zero
										child.AssemblyAngularVelocity = Vector3.zero
									end)

									flag11 = true
								end
							end
						end
					end

					return flag11
				end

				WRAITH_RIG = {
					Head = CFrame.new(0, 1.5, 0),
					Torso = CFrame.new(0, 0, 0),
					UpperTorso = CFrame.new(0, 0.2, 0),
					LowerTorso = CFrame.new(0, -0.6, 0),
					["Left Arm"] = CFrame.new(-1.5, 0, 0),
					["Right Arm"] = CFrame.new(1.5, 0, 0),
					["Left Leg"] = CFrame.new(-0.5, -2, 0),
					["Right Leg"] = CFrame.new(0.5, -2, 0),
					LeftUpperArm = CFrame.new(-1.5, 0.4, 0),
					LeftLowerArm = CFrame.new(-1.5, -0.5, 0),
					LeftHand = CFrame.new(-1.5, -1.2, 0),
					RightUpperArm = CFrame.new(1.5, 0.4, 0),
					RightLowerArm = CFrame.new(1.5, -0.5, 0),
					RightHand = CFrame.new(1.5, -1.2, 0),
					LeftUpperLeg = CFrame.new(-0.5, -1.4, 0),
					LeftLowerLeg = CFrame.new(-0.5, -2.4, 0),
					LeftFoot = CFrame.new(-0.5, -3, 0),
					RightUpperLeg = CFrame.new(0.5, -1.4, 0),
					RightLowerLeg = CFrame.new(0.5, -2.4, 0),
					RightFoot = CFrame.new(0.5, -3, 0),
				}

				wraithKillShurikenCollision = function()
					pcall(function()
						for _, child in ipairs(Workspace:GetChildren()) do
							if tostring(child.Name):match("SpawnedInToys") then
								for _, child2 in ipairs(child:GetChildren()) do
									if tostring(child2.Name):find("Shuriken") then
										for _, descendant in ipairs(child2:GetDescendants()) do
											if descendant:IsA("BasePart") then
												descendant.CanCollide = false
												descendant.CanTouch = false
											end
										end
									end
								end
							end
						end
					end)
				end

				wraithStickTo = function(arg, arg2, arg3)
					if not arg then
						return 0
					end
					local playerEvents = ReplicatedStorage_:FindFirstChild("PlayerEvents")
					playerEvents = playerEvents and playerEvents:FindFirstChild("StickyPartEvent")
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
					local spawnToyRemoteFunction = ReplicatedStorage_.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
					if not (playerEvents and setNetworkOwner and spawnToyRemoteFunction) then
						return 0
					end
					local v37, v38, v39 = fn11()
					if not v39 then
						return 0
					end
					local n25 = arg2 or 3
					local n26 = v39.CFrame * CFrame.new(0, 3, 0)

					for i = 1, n25 do
						pcall(function()
							spawnToyRemoteFunction:InvokeServer("NinjaShuriken", n26, Vector3.zero)
						end)

						task.wait(0.05)
					end

					task.wait(1)
					local v40 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					if not v40 then
						fn10("wraith", "break: no inventory folder")
						return 0
					end
					local tbl8 = {}
					local n27 = 0

					for i = 1, n25 do
						local ninjaShuriken = v40:FindFirstChild("NinjaShuriken")

						if ninjaShuriken then
							local stickyPart = ninjaShuriken:FindFirstChild("StickyPart")

							if stickyPart then
								ninjaShuriken.Name = "wstuck" .. tostring(i)

								pcall(function()
									setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
								end)

								pcall(function()
									local v41 = playerEvents
									local fireServer = v41.FireServer
									local v42 = arg3
									local cframe

									if arg3 then
										cframe = v42
									else
										cframe = CFrame.Angles(0, 0, 0)
									end

									fireServer(v41, stickyPart, arg, cframe)
								end)

								tbl8[#tbl8 + 1] = stickyPart
								n27 += 1
							end
						end

						task.wait(0.1)
					end

					if n27 == 0 then
						fn10("wraith", "break: no shurikens spawned")
						return 0
					end

					local tbl9 = {
						Vector3.new(1e12, 4e12, -2e12),
						Vector3.new(-3e12, 1e12, 5e12),
						Vector3.new(2e12, -5e12, 1e12),
						Vector3.new(6e12, -2e12, -4e12),
					}

					for _, v41 in ipairs(tbl8) do
						if v41 and v41.Parent then
							local now2 = tick()

							while true do
								pcall(function()
									setNetworkOwner:FireServer(v41, v41.CFrame)
								end)

								RunService.Heartbeat:Wait()
								local partOwner = v41:FindFirstChild("PartOwner")

								if partOwner then
									local name = localPlayer.Name
									partOwner = tostring(v41.PartOwner.Value) == name
								end

								if not (partOwner or tick() - now2 > 0.5) then
									continue
								end
								break
							end
						end
					end

					for i = 1, 45 do
						for i2, v41 in ipairs(tbl8) do
							if v41 and v41.Parent then
								local v42 = tbl9[(i2 - 1) % #tbl9 + 1]

								pcall(function()
									v41.AssemblyLinearVelocity = v42
									v41.AssemblyAngularVelocity = v42 * 0.01
								end)
							end
						end

						if arg and arg.Parent then
							pcall(function()
								setNetworkOwner:FireServer(arg, arg.CFrame)
								arg.AssemblyLinearVelocity = Vector3.new(0, 8e11, 0)
							end)
						end

						RunService.Heartbeat:Wait()
					end

					fn10("wraith", "break: launched " .. tostring(n27))
					return n27
				end

				wraithSelfFixT = 0

				wraithSelfFixLimbs = function()
					local character = localPlayer.Character
					if not character then
						return
					end
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if not (humanoidRootPart and humanoid) or humanoid.Health <= 0 then
						return
					end

					if humanoid.SeatPart then
						return
					end
					local flag11 = false

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") and child ~= humanoidRootPart then
							if (child.Position - humanoidRootPart.Position).Magnitude > 12 then
								flag11 = true
								break
							end
						end
					end

					if not flag11 then
						return
					end
					local cframe = CFrame.Angles
					local n25 = CFrame.new(humanoidRootPart.Position) * cframe(0, math.atan2(-humanoidRootPart.CFrame.LookVector.X, -humanoidRootPart.CFrame.LookVector.Z), 0)

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") and child ~= humanoidRootPart then
							local v37 = WRAITH_RIG[child.Name]

							if v37 then
								pcall(function()
									child.CFrame = n25 * v37
									child.AssemblyLinearVelocity = Vector3.zero
									child.AssemblyAngularVelocity = Vector3.zero
								end)
							end
						end
					end
				end

				wraithAntiFixT = 0

				wraithAntiFixation = function()
					if not wraithGate("antifix", 0.1) then
						return false
					end
					local character = localPlayer.Character
					if not character then
						return false
					end
					local isHeld = localPlayer:FindFirstChild("IsHeld")
					local flag11

					if isHeld and isHeld.Value then
						flag11 = true
					else
						flag11 = false

						for _, child in ipairs(character:GetChildren()) do
							if child:IsA("BasePart") then
								if child.Anchored then
									flag11 = true
									break
								else
									local partOwner = child:FindFirstChild("PartOwner")
									local flag12 = partOwner and tostring(partOwner.Value) ~= ""

									if flag12 then
										local name = localPlayer.Name
										flag12 = tostring(partOwner.Value) ~= name
									end

									if flag12 then
										flag11 = true
										break
									end
								end
							end
						end
					end

					if not flag11 then
						if not Workspace:FindFirstChild("GrabParts") then
							return false
						end
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if not (humanoidRootPart and humanoid) or humanoid.Health <= 0 then
						return false
					end

					if wraithOnOwnBlob() then
						return false
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
					local destroyGrabLine = grabEvents and grabEvents:FindFirstChild("DestroyGrabLine")
					local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
					local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")
					local flag12 = false
					local isHeld2 = localPlayer:FindFirstChild("IsHeld")

					if isHeld2 and isHeld2.Value then
						flag12 = true
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							local partOwner = child:FindFirstChild("PartOwner")
							local flag13 = partOwner and tostring(partOwner.Value) ~= ""

							if flag13 then
								local name = localPlayer.Name
								flag13 = tostring(partOwner.Value) ~= name
							end

							if flag13 then
								flag12 = true

								pcall(function()
									partOwner:Destroy()
								end)
							end

							if child.Anchored then
								flag12 = true

								pcall(function()
									child.Anchored = false
								end)
							end
						end
					end

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("AlignPosition") or descendant:IsA("AlignOrientation") or descendant:IsA("BodyPosition") or descendant:IsA("BodyGyro") or descendant:IsA("BodyVelocity") or descendant:IsA("LinearVelocity") or descendant:IsA("AngularVelocity") or descendant:IsA("VectorForce") or descendant:IsA("RopeConstraint") or descendant:IsA("BallSocketConstraint") then
							if descendant.Name ~= "KickAlign" and descendant.Name ~= "KickRot" then
								flag12 = true

								pcall(function()
									descendant.Enabled = false
								end)

								pcall(function()
									descendant:Destroy()
								end)
							end
						end
					end

					pcall(function()
						local grabParts = Workspace:FindFirstChild("GrabParts")
						if not grabParts then
							return
						end

						for _, descendant in ipairs(grabParts:GetDescendants()) do
							if descendant:IsA("WeldConstraint") or descendant:IsA("Weld") then
								local part0 = descendant.Part0
								local part1 = descendant.Part1

								if part0 and part0:IsDescendantOf(character) or part1 and part1:IsDescendantOf(character) then
									flag12 = true

									pcall(function()
										descendant.Enabled = false
									end)

									pcall(function()
										descendant:Destroy()
									end)
								end
							end
						end
					end)

					if not flag12 then
						return false
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") and setNetworkOwner then
							pcall(function()
								setNetworkOwner:FireServer(child, child.CFrame)
							end)
						end
					end

					if destroyGrabLine then
						pcall(function()
							destroyGrabLine:FireServer(humanoidRootPart)
						end)
					end

					if struggle then
						for i = 1, 3 do
							pcall(function()
								struggle:FireServer(localPlayer)
							end)
						end
					end

					pcall(function()
						ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
					end)

					if wraithGate("antifix_unrag", 0.4) then
						pcall(function()
							local ragdolled = humanoid:FindFirstChild("Ragdolled")

							if ragdolled and ragdolled.Value then
								ragdolled.Value = false
							end

							humanoid.PlatformStand = false

							if humanoid.WalkSpeed <= 0 then
								humanoid.WalkSpeed = 16
							end
						end)

						pcall(function()
							if ReplicatedStorage_.CharacterEvents:FindFirstChild("RagdollRemote") then
								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0)
							end
						end)
					end

					return true
				end

				wraithClaimState = setmetatable({}, { __mode = "k" })

				wraithOwnsPart = function(arg)
					local partOwner = arg:FindFirstChild("PartOwner")
					local flag11 = partOwner ~= nil
					local flag12

					if flag11 then
						local name = localPlayer.Name
						flag12 = tostring(partOwner.Value) == name
					else
						flag12 = flag11
					end

					return flag12
				end

				wraithClaimBody = function(arg)
					if not arg then
						return 0
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
					if not setNetworkOwner then
						return 0
					end
					local n25 = 0

					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("BasePart") then
							if wraithOwnsPart(child) then
								n25 += 1
							else
								pcall(function()
									setNetworkOwner:FireServer(child, child.CFrame)
								end)
							end
						end
					end

					return n25
				end

				wraithPinBody = function(arg, cFrame)
					if not (arg and cFrame) then
						return
					end
					local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")

					pcall(function()
						humanoidRootPart.CFrame = cFrame
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					end)

					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("BasePart") and child ~= humanoidRootPart then
							local v37 = WRAITH_RIG[child.Name]

							if v37 then
								local cFrame2 = cFrame * v37

								if wraithOwnsPart(child) then
									pcall(function()
										child.CFrame = cFrame2
										child.AssemblyLinearVelocity = Vector3.zero
										child.AssemblyAngularVelocity = Vector3.zero
									end)
								else
									if setNetworkOwner then
										pcall(function()
											setNetworkOwner:FireServer(child, cFrame2)
										end)
									end

									pcall(function()
										child.CFrame = cFrame2
										child.AssemblyLinearVelocity = Vector3.zero
									end)
								end
							end
						end
					end
				end

				wraithInputLagPulse = function(arg)
					if not arg then
						return
					end
					local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					local v37 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					local foodHamburger = v37 and v37:FindFirstChild("FoodHamburger")

					if not foodHamburger then
						pcall(function()
							ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("FoodHamburger", humanoidRootPart.CFrame * CFrame.new(0, -12, 0), Vector3.zero)
						end)

						task.wait(0.1)
						local v38 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
						foodHamburger = v38 and v38:FindFirstChild("FoodHamburger")
					end

					if not foodHamburger then
						return
					end
					local holdPart = foodHamburger:FindFirstChild("HoldPart")
					local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
					holdPart = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
					if not (holdItemRemoteFunction and holdPart) then
						return
					end

					pcall(function()
						for _, descendant in ipairs(foodHamburger:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
								descendant.Massless = true
							end
						end
					end)

					for i = 1, 12 do
						pcall(function()
							holdItemRemoteFunction:InvokeServer(foodHamburger, arg)
						end)

						pcall(function()
							holdPart:InvokeServer(foodHamburger, humanoidRootPart.CFrame, Vector3.zero)
						end)
					end
				end

				wraithClaimNear = function(arg, arg2)
					if not arg then
						return
					end
					local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
					if not setNetworkOwner then
						return
					end
					local head = arg:FindFirstChild("Head")
					local now2 = tick()

					while true do
						pcall(function()
							for _, child in pairs(arg:GetChildren()) do
								if child:IsA("BasePart") then
									setNetworkOwner:FireServer(child, child.CFrame)
								end
							end
						end)

						RunService.Heartbeat:Wait()
						local partOwner = head and head:FindFirstChild("PartOwner") or wraithPartOwned(humanoidRootPart)

						if not partOwner then
							partOwner = tick() - now2 > (arg2 or 1.2)
						end

						if not partOwner then
							continue
						end
						break
					end
				end

				wraithBlobGrabSpam = function(arg, arg2)
					if not (arg and arg.Parent) then
						return false
					end
					local seatPart
					seatPart, seatPart = fn11()
					seatPart = seatPart and seatPart.SeatPart
					seatPart = seatPart and seatPart.Parent
					if not (seatPart and seatPart.Name == "CreatureBlobman") then
						return false
					end
					local v37 = wraithBlobComponents(seatPart)
					if not v37 then
						return false
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
					local createGrabLine = grabEvents and grabEvents:FindFirstChild("CreateGrabLine")
					local n25 = arg2 or 6

					for i = 1, n25 do
						pcall(function()
							v37.grab:FireServer(v37.rD, arg, v37.rW)
						end)

						pcall(function()
							v37.grab:FireServer(v37.lD, arg, v37.lW)
						end)

						if setNetworkOwner then
							pcall(function()
								setNetworkOwner:FireServer(arg, arg.CFrame)
							end)
						end

						if createGrabLine then
							pcall(function()
								createGrabLine:FireServer(arg, Vector3.zero, arg.Position, false)
							end)
						end
					end

					return true
				end

				wraithForceRagdoll = function(arg)
					local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
					local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

					if ragdollRemote then
						for i = 1, 3 do
							pcall(function()
								ragdollRemote:FireServer(humanoidRootPart, 3)
							end)
						end
					end

					local humanoid = arg:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid.PlatformStand = true
						end)

						pcall(function()
							humanoid.Sit = false
						end)

						pcall(function()
							humanoid:ChangeState(Enum.HumanoidStateType.Physics)
						end)
					end
				end

				wraithClaimAllParts = function(arg)
					if not arg then
						return
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
					if not setNetworkOwner then
						return
					end

					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								setNetworkOwner:FireServer(descendant, descendant.CFrame)
							end)
						end
					end
				end

				wraithOnOwnBlob = function()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					humanoid = humanoid and humanoid.SeatPart
					humanoid = humanoid and humanoid.Parent
					if not (humanoid and humanoid.Name == "CreatureBlobman") then
						return false
					end
					local v37 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					if v37 and humanoid:IsDescendantOf(v37) then
						return true
					end
					return false
				end

				wraithStripForeignMovers = function(arg)
					local character = arg or localPlayer.Character
					if not character then
						return false
					end

					if wraithOnOwnBlob() then
						return false
					end

					if wraithDefenseBlocked() then
						return false
					end
					local flag11 = false

					pcall(function()
						local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
						local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")

						for _, child in ipairs(character:GetChildren()) do
							if child:IsA("BasePart") then
								local partOwner = child:FindFirstChild("PartOwner")
								local flag12 = partOwner and tostring(partOwner.Value) ~= ""

								if flag12 then
									local name = localPlayer.Name
									flag12 = tostring(partOwner.Value) ~= name
								end

								if flag12 then
									flag11 = true

									pcall(function()
										partOwner:Destroy()
									end)

									if setNetworkOwner then
										pcall(function()
											setNetworkOwner:FireServer(child, child.CFrame)
										end)
									end
								end

								if child.Anchored then
									flag11 = true

									pcall(function()
										child.Anchored = false
									end)
								end
							end
						end
					end)

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("AlignPosition") or descendant:IsA("AlignOrientation") or descendant:IsA("BodyPosition") or descendant:IsA("BodyGyro") or descendant:IsA("BodyVelocity") or descendant:IsA("BodyAngularVelocity") or descendant:IsA("LinearVelocity") or descendant:IsA("AngularVelocity") or descendant:IsA("VectorForce") or descendant:IsA("BallSocketConstraint") or descendant:IsA("RopeConstraint") then
							if not (descendant.Name:sub(1, 6) == "Wraith") then
								flag11 = true

								pcall(function()
									descendant.Enabled = false
								end)

								pcall(function()
									descendant.MaxForce = 0
								end)

								pcall(function()
									descendant.MaxTorque = 0
								end)

								pcall(function()
									descendant.MaxVelocity = 0
								end)

								pcall(function()
									descendant.Responsiveness = 0
								end)

								pcall(function()
									descendant.Attachment0 = nil
								end)

								pcall(function()
									descendant.Attachment1 = nil
								end)

								pcall(function()
									descendant:Destroy()
								end)
							end
						elseif descendant:IsA("Attachment") and (descendant.Name == "KickAtt0" or descendant.Name == "KickAtt1") then
							flag11 = true

							pcall(function()
								descendant:Destroy()
							end)
						end
					end

					local grabParts = Workspace:FindFirstChild("GrabParts")

					if grabParts then
						for _, descendant in ipairs(grabParts:GetDescendants()) do
							if descendant:IsA("WeldConstraint") or descendant:IsA("Weld") then
								local part0 = descendant.Part0
								local part1 = descendant.Part1

								if part0 and part0:IsDescendantOf(character) or part1 and part1:IsDescendantOf(character) then
									flag11 = true

									pcall(function()
										descendant.Enabled = false
									end)

									pcall(function()
										descendant:Destroy()
									end)
								end
							end
						end
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							if child.Anchored then
								pcall(function()
									child.Anchored = false
								end)
							end

							local partOwner = child:FindFirstChild("PartOwner")
							local flag12 = partOwner and tostring(partOwner.Value) ~= ""

							if flag12 then
								local name = localPlayer.Name
								flag12 = tostring(partOwner.Value) ~= name
							end

							if flag12 then
								flag11 = true

								pcall(function()
									partOwner.Value = ""
								end)

								pcall(function()
									ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(child, child.CFrame)
								end)

								pcall(function()
									ReplicatedStorage_.GrabEvents.DestroyGrabLine:FireServer(child)
								end)
							end
						end
					end

					return flag11
				end

				wraithStruggleSpam = function(arg)
					local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
					local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")
					if not struggle then
						return
					end
					arg = arg or 3

					for i = 1, arg do
						pcall(function()
							struggle:FireServer(localPlayer)
						end)
					end
				end

				wraithBreakGrab = function()
					local character = localPlayer.Character
					if not character then
						return
					end
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if wraithOnOwnBlob() then
						return
					end
					wraithStruggleSpam(3)

					pcall(function()
						wraithStripForeignMovers(character)
					end)

					for _, child in pairs(Workspace:GetChildren()) do
						if tostring(child.Name):match("SpawnedInToys") then
							for _, child2 in pairs(child:GetChildren()) do
								if child2.Name == "CreatureBlobman" then
									local blobmanSeatAndOwnerScript = child2:FindFirstChild("BlobmanSeatAndOwnerScript")
									local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

									if creatureDrop and humanoidRootPart then
										for _, v37 in ipairs({ "LeftDetector", "RightDetector" }) do
											local v38 = child2:FindFirstChild(v37)

											if v38 then
												local v39 = v38:FindFirstChild(v37 == "LeftDetector" and "LeftWeld" or "RightWeld")

												if v39 then
													pcall(function()
														creatureDrop:FireServer(v39, humanoidRootPart)
													end)

													pcall(function()
														creatureDrop:FireServer(v39)
													end)
												end

												for _, descendant in ipairs(v38:GetDescendants()) do
													if wraithBindsChar(descendant, character) then
														pcall(function()
															creatureDrop:FireServer(descendant, humanoidRootPart)
														end)

														pcall(function()
															creatureDrop:FireServer(descendant)
														end)
													end
												end
											end
										end
									end
								end
							end
						end
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							local partOwner = child:FindFirstChild("PartOwner")
							local flag11 = partOwner and tostring(partOwner.Value) ~= ""

							if flag11 then
								local name = localPlayer.Name
								flag11 = tostring(partOwner.Value) ~= name
							end

							if flag11 then
								pcall(function()
									ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(child, child.CFrame)
								end)
							end
						end
					end

					if humanoidRootPart then
						pcall(function()
							ReplicatedStorage_.GrabEvents.DestroyGrabLine:FireServer(humanoidRootPart)
						end)
					end

					local isHeld = localPlayer:FindFirstChild("IsHeld")

					if isHeld then
						pcall(function()
							isHeld.Value = false
						end)
					end

					if humanoid then
						humanoid.PlatformStand = false

						if humanoid.SeatPart then
							local parent = humanoid.SeatPart.Parent

							if parent and parent.Name == "CreatureBlobman" then
								humanoid.Sit = false
							end
						end

						for _, v37 in ipairs(humanoid:GetPlayingAnimationTracks()) do
							if v37.Animation and v37.Animation.AnimationId == "rbxassetid://7047322890" then
								v37:Stop()
							end
						end
					end
				end

				fn12 = function(arg)
					local isHeld = localPlayer:FindFirstChild("IsHeld") or arg:FindFirstChild("IsHeld")
					if isHeld and isHeld:IsA("BoolValue") and isHeld.Value then
						return true
					end

					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("BasePart") and wraithHeldByOther(child) then
							return true
						end
					end

					return false
				end

				fn13 = function()
					local character = localPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if not character then
						return nil
					end
					local huge = math.huge
					local v37 = nil

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer and player.Character then
							local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
							local humanoid = player.Character:FindFirstChild("Humanoid")

							if humanoidRootPart and humanoid and humanoid.Health > 0 then
								local inPlot = player:FindFirstChild("InPlot")

								if not (inPlot and inPlot.Value) then
									local magnitude = (humanoidRootPart.Position - character.Position).Magnitude

									if magnitude < huge then
										huge = magnitude
										v37 = player
									end
								end
							end
						end
					end

					return v37
				end

				fn14 = function()
					local tbl8 = {}

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer then
							table.insert(tbl8, player.DisplayName .. " (" .. player.Name .. ")")
						end
					end

					return tbl8
				end

				fn15 = function()
					local match = targetName

					if match then
						match = tostring(match):match("%((.+)%)%s*$") or tostring(match)
					end

					if (not match or match == "") and wraithMulti and #wraithMulti > 0 then
						match = wraithMulti[1]
					end

					if (not match or match == "") and targetDropdown then
						pcall(function()
							local value = targetDropdown:GetValue()

							if type(value) == "table" then
								for k, v37 in pairs(value) do
									if v37 == true then
										match = tostring(k):match("%((.+)%)%s*$") or tostring(k)
										break
									end
								end
							elseif type(value) == "string" then
								match = value:match("%((.+)%)%s*$") or value
							end
						end)
					end

					if match and match ~= "" then
						local v37 = Players:FindFirstChild(match)
						if v37 then
							return v37
						end
						local v38 = string.lower(match)

						for _, player in ipairs(Players:GetPlayers()) do
							if string.lower(player.Name) == v38 or string.lower(player.DisplayName) == v38 then
								return player
							end
						end
					end

					return nil
				end

				targetName = ""
				str5 = "Loop Grab+Ragdoll v1"
				loopMethodActive = false
				fn16 = nil

				fn17 = function(arg, arg2, ...)
					local ok, result = xpcall(arg2, function(arg3)
						return debug.traceback(tostring(arg3), 2)
					end, ...)

					if not ok then
						warn("[wraith][" .. tostring(arg) .. "] " .. tostring(result))
						fn10("wraith error", "[" .. tostring(arg) .. "] " .. tostring(result))
					end

					return ok
				end

				fn18 = function(cFrame)
					pcall(function()
						local v37, v38, v39 = fn11()
						if not v39 then
							return
						end
						v39.CFrame = cFrame
						v39.AssemblyLinearVelocity = Vector3.zero
						v39.AssemblyAngularVelocity = Vector3.zero

						pcall(function()
							ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
						end)
					end)
				end

				fn19 = function(arg)
					if arg and arg.Position.Y > -15 then
						return arg
					end

					local ok, result = pcall(function()
						local plots = Workspace:FindFirstChild("Plots")

						if plots then
							for _, child in pairs(plots:GetChildren()) do
								local plotBarrier = child:FindFirstChild("Barrier") and child.Barrier:FindFirstChild("PlotBarrier")
								if plotBarrier and plotBarrier:IsA("BasePart") then
									return plotBarrier.CFrame * CFrame.new(0, 6, 0)
								end
							end
						end

						return nil
					end)

					if ok and result then
						return result
					end
					return CFrame.new(0, 60, 0)
				end

				fn20 = function(arg, arg2, arg3)
					local v37 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					local v38 = nil

					pcall(function()
						local plotItems = Workspace:FindFirstChild("PlotItems")
						local playersInPlots = plotItems and plotItems:FindFirstChild("PlayersInPlots")

						if playersInPlots and playersInPlots:FindFirstChild(localPlayer.Name) then
							local plots = Workspace:FindFirstChild("Plots")

							if plots then
								for _, child in pairs(plots:GetChildren()) do
									local plotSign = child:FindFirstChild("PlotSign")
									plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

									if plotSign then
										for _, child2 in pairs(plotSign:GetChildren()) do
											if child2.Value == localPlayer.Name then
												v38 = plotItems:FindFirstChild(child.Name)
											end
										end
									end
								end
							end
						end
					end)

					local v39 = v38 or v37
					if not v39 then
						return nil
					end
					local v40 = nil

					local connection = v39.ChildAdded:Connect(function(child)
						if child.Name == arg then
							v40 = child
						end
					end)

					local connection2 = nil

					if v38 and v37 and v38 ~= v37 then
						connection2 = v37.ChildAdded:Connect(function(child)
							if child.Name == arg then
								v40 = child
							end
						end)
					end

					local cframe = arg2

					if not cframe then
						local v41, v42, v43 = fn11()
						cframe = v43 and v43.CFrame * CFrame.new(0, 14, 20) or CFrame.new(0, 50, 0)
					end

					pcall(function()
						local canSpawnToy = localPlayer:FindFirstChild("CanSpawnToy")

						if canSpawnToy then
							local now2 = tick()

							while not canSpawnToy.Value and tick() - now2 < 6 do
								task.wait(0.05)
							end
						end
					end)

					pcall(function()
						ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, cframe, arg3 or Vector3.zero)
					end)

					local now2 = tick()

					while not v40 and tick() - now2 < 2.5 do
						task.wait()
					end

					pcall(function()
						connection:Disconnect()
					end)

					if connection2 then
						pcall(function()
							connection2:Disconnect()
						end)
					end

					return v40
				end

				fn21 = function()
					for _, child in pairs(Workspace:GetChildren()) do
						if child.Name:match("SpawnedInToys") then
							for _, child2 in pairs(child:GetChildren()) do
								if child2.Name == "CreatureBlobman" then
									pcall(function()
										child2:Destroy()
									end)
								end
							end
						end
					end
				end

				fn22 = function()
					local creatureBlobman = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					creatureBlobman = creatureBlobman and creatureBlobman:FindFirstChild("CreatureBlobman")
					if creatureBlobman and creatureBlobman:FindFirstChild("VehicleSeat") then
						return creatureBlobman
					end

					for _, child in pairs(Workspace:GetChildren()) do
						if child.Name:match("SpawnedInToys") then
							local creatureBlobman2 = child:FindFirstChild("CreatureBlobman")
							if creatureBlobman2 and creatureBlobman2:FindFirstChild("VehicleSeat") then
								return creatureBlobman2
							end
						end
					end

					return nil
				end

				local function fn53(arg)
					pcall(function()
						local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

						if setNetworkOwner then
							for _, descendant in pairs(arg:GetDescendants()) do
								if descendant:IsA("BasePart") then
									setNetworkOwner:FireServer(descendant, descendant.CFrame)
								end
							end
						end
					end)
				end

				fn23 = function(arg)
					local v37, v38, v39 = fn11()
					if not (v38 and v39) then
						return false
					end
					local vehicleSeat = arg and arg:FindFirstChild("VehicleSeat")
					if not vehicleSeat then
						return false
					end

					if v38.SeatPart == vehicleSeat then
						return true
					end

					pcall(function()
						local occupant = vehicleSeat.Occupant

						if occupant and occupant ~= v38 then
							local parent = occupant.Parent
							local playerFromCharacter = game:GetService("Players"):GetPlayerFromCharacter(parent)
							parent = parent and parent:FindFirstChild("HumanoidRootPart")

							if parent then
								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(parent, 3)

								if playerFromCharacter then
									ReplicatedStorage_.CharacterEvents.Struggle:FireServer(playerFromCharacter)
								end

								task.wait(0.2)
							end

							pcall(function()
								occupant.Sit = false
							end)
						end
					end)

					for i = 1, 4 do
						v38.Sit = false

						pcall(function()
							v39.CFrame = vehicleSeat.CFrame * CFrame.new(0, 2, 0)
							v39.AssemblyLinearVelocity = Vector3.zero
							v39.AssemblyAngularVelocity = Vector3.zero
						end)

						RunService.Heartbeat:Wait()

						pcall(function()
							vehicleSeat:Sit(v38)
						end)

						local now2 = tick()

						while tick() - now2 < 0.4 do
							if v38.SeatPart == vehicleSeat then
								fn53(arg)

								pcall(function()
									local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

									if setNetworkOwner then
										setNetworkOwner:FireServer(v39, v39.CFrame)
									end

									local destroyGrabLine = ReplicatedStorage_.GrabEvents:FindFirstChild("DestroyGrabLine")

									if destroyGrabLine then
										destroyGrabLine:FireServer(v39)
									end
								end)

								return true
							end

							task.wait(0.05)
						end
					end

					return false
				end

				local function fn54(arg)
					local creatureDrop = nil
					local creatureRelease = nil
					local creatureGrab

					pcall(function()
						local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
						creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
						creatureRelease = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
					end)

					if not (creatureGrab and creatureDrop) then
						pcall(function()
							for _, descendant in ipairs(arg:GetDescendants()) do
								if descendant:IsA("RemoteEvent") then
									if descendant.Name == "CreatureGrab" then
										creatureGrab = creatureGrab or descendant
									elseif descendant.Name == "CreatureDrop" then
										creatureDrop = creatureDrop or descendant
									elseif descendant.Name == "CreatureRelease" then
										creatureRelease = creatureRelease or descendant
									end
								end
							end
						end)
					end

					local leftDetector = arg:FindFirstChild("LeftDetector")
					local rightDetector = arg:FindFirstChild("RightDetector")

					pcall(function()
						if not leftDetector then
							for _, descendant in ipairs(arg:GetDescendants()) do
								if descendant.Name == "LeftDetector" then
									local v37 = leftDetector

									if leftDetector then
										descendant = v37
									end

									leftDetector = descendant
								end
							end
						end

						if not rightDetector then
							for _, descendant in ipairs(arg:GetDescendants()) do
								if descendant.Name == "RightDetector" then
									rightDetector = rightDetector or descendant
								end
							end
						end
					end)

					local leftWeld = leftDetector and (leftDetector:FindFirstChild("LeftWeld") or leftDetector:FindFirstChild("RightWeld") or leftDetector:FindFirstChild("RigidConstraint") or leftDetector:FindFirstChildWhichIsA("Weld", true))
					local rightWeld

					if rightDetector then
						rightWeld = rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChild("LeftWeld") or rightDetector:FindFirstChild("RigidConstraint") or rightDetector:FindFirstChildWhichIsA("Weld", true)
					else
						rightWeld = rightDetector
					end

					if not (creatureGrab and creatureDrop and leftDetector and rightDetector and leftWeld and rightWeld) then
						return nil
					end
					return { grab = creatureGrab, drop = creatureDrop, release = creatureRelease, lD = leftDetector, rD = rightDetector, lW = leftWeld, rW = rightWeld }
				end

				flag6 = false
				flag7 = false
				local flag11 = false
				local v37 = nil
				autoSitActive = false
				autoSitPalletKeep = nil
				local tbl8 = {}
				fn24 = nil

				fn25 = function()
					local tbl9 = { alive = true }
					table.insert(tbl8, tbl9)
					return tbl9
				end

				wraithBringAllRestore = function()
					pcall(function()
						local currentCamera = Workspace.CurrentCamera

						if currentCamera then
							currentCamera.CameraType = Enum.CameraType.Custom
							local v38
							v38, v38 = fn11()

							if v38 then
								currentCamera.CameraSubject = v38
							end
						end
					end)

					pcall(function()
						local character = localPlayer.Character
						if not character then
							return
						end

						for _, descendant in ipairs(character:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = true

								if wraithBringVis and wraithBringVis[descendant] then
									descendant.Transparency = wraithBringVis[descendant]
								end
							elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
								if wraithBringVis and wraithBringVis[descendant] then
									descendant.Transparency = wraithBringVis[descendant]
								end
							end
						end

						wraithBringVis = nil
					end)

					pcall(function()
						local wraithBringCamBlock = Workspace:FindFirstChild("WraithBringCamBlock")

						if wraithBringCamBlock then
							wraithBringCamBlock:Destroy()
						end
					end)
				end

				wraithBringAllRun = function(arg)
					if wraithBringAllBusy then
						wraithBringAllBusy = false
						fn10("wraith", "bring all: stopped")
						return
					end

					wraithBringAllBusy = true
					fn10("wraith", "bring all: " .. (arg and "blobman" or "no blob"))
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

					local function fn55(arg2, arg3)
						return CFrame.new(arg2, arg3)
					end

					local function fn56(arg2)
						if not (arg2 and setNetworkOwner) then
							return false
						end
						local partOwner = arg2:FindFirstChild("PartOwner")

						if partOwner then
							local name = localPlayer.Name
							partOwner = tostring(partOwner.Value) == name
						end

						if partOwner then
							return true
						end
						local v38, v39, v40 = fn11()

						if v40 and (arg2.Position - v40.Position).Magnitude <= 30 then
							pcall(function()
								setNetworkOwner:FireServer(arg2, fn55(v40.Position, arg2.Position))
							end)
						end

						return false
					end

					local function fn57(arg2)
						local head = arg2.Character and arg2.Character:FindFirstChild("Head")
						local partOwner = head and head:FindFirstChild("PartOwner")

						if partOwner then
							local name = localPlayer.Name
							partOwner = tostring(partOwner.Value) == name
						end

						return partOwner
					end

					local function fn58(arg2)
						local inPlot = arg2:FindFirstChild("InPlot")
						if inPlot and inPlot.Value then
							return true
						end
						local plotItems = Workspace:FindFirstChild("PlotItems")
						plotItems = plotItems and plotItems:FindFirstChild("PlayersInPlots")
						return plotItems and plotItems:FindFirstChild(arg2.Name) ~= nil
					end

					local function fn59(arg2)
						local v38, v39, v40 = fn11()
						if not v40 then
							return
						end

						pcall(function()
							v40.CFrame = v40.CFrame - v40.CFrame.Position + arg2.Position

							if v39 and (not v39.SeatPart or tostring(v39.SeatPart.Parent) ~= "CreatureBlobman") then
								v39.Sit = false
							end
						end)
					end

					local function fn60(parent, position)
						local bringBody = parent:FindFirstChild("BringBody")

						if bringBody then
							bringBody.Position = position
						else
							local bodyPosition = Instance.new("BodyPosition")
							bodyPosition.Name = "BringBody"
							bodyPosition.Position = position
							bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							bodyPosition.D = 5000
							bodyPosition.P = 1500000
							bodyPosition.Parent = parent
						end
					end

					task.spawn(function()
						local v38, v39, v40 = fn11()
						if not v40 then
							wraithBringAllBusy = false
							return
						end
						local cFrame = v40.CFrame
						local currentCamera = Workspace.CurrentCamera
						local cframe = currentCamera and CFrame.lookAt(currentCamera.CFrame.Position + Vector3.new(-15, 15, 0), v40.Position)
						local v41 = nil

						if arg then
							local v42 = fn22()

							if not v42 then
								pcall(function()
									ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", v40.CFrame + Vector3.new(0, 5, 0), Vector3.new(0, 59.667, 0))
								end)

								for i = 1, 30 do
									task.wait(0.1)
									v42 = fn22()
									if not v42 then
										continue
									end
									break
								end
							end

							if v42 and fn23(v42) then
								fn53(v42)
								v41 = fn54(v42)
							end
						end

						while wraithBringAllBusy and bringAllOn do
							local v42 = cFrame

							if cframe and currentCamera then
								pcall(function()
									currentCamera.CameraType = Enum.CameraType.Scriptable
									currentCamera.CFrame = cframe
								end)
							end

							for _, player in ipairs(Players:GetPlayers()) do
								if wraithBringAllBusy then
									if player ~= localPlayer and not fn24(player) and player.Character and not fn58(player) then
										local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
										local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
										local ragdolled = humanoid and humanoid:FindFirstChild("Ragdolled")

										if humanoidRootPart and humanoid then
											wraithMarkKickBusy(2)

											for i = 0, 50 do
												if wraithBringAllBusy and bringAllOn then
													fn56(humanoidRootPart)

													if v41 then
														pcall(function()
															v41.grab:FireServer(v41.rD, humanoidRootPart, v41.rW)
														end)
													end

													if fn57(player) then
														if (not ragdolled or not ragdolled.Value) and (humanoidRootPart.Position - v42.Position).Magnitude > 10 then
															pcall(function()
																humanoidRootPart.CFrame = v42
															end)
														end

														fn60(humanoidRootPart, v42.Position)
														break
													else
														task.wait()

														if humanoidRootPart.Position.Y <= -12 then
															fn59(CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, -15)))
														else
															fn59(CFrame.new(humanoidRootPart.Position + Vector3.new(0, -10, -10)))
														end

														continue
													end
												end

												break
											end
										end
									end

									continue
								end

								break
							end

							fn59(v42)
							task.wait()
						end

						pcall(function()
							for _, player in ipairs(Players:GetPlayers()) do
								local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
								humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("BringBody")

								if humanoidRootPart then
									humanoidRootPart:Destroy()
								end
							end
						end)

						pcall(wraithBringAllRestore)
						fn59(cFrame)
						wraithBringAllBusy = false
						fn10("wraith", "bring all done")
					end)
				end

				local tbl9 = {}
				local tbl10 = {}
				local n25 = 0

				fn26 = function(arg, arg2)
					local now2 = tick()

					if now2 - n25 > 30 then
						n25 = now2

						for k, v38 in pairs(tbl10) do
							if now2 - v38 > 60 then
								tbl10[k] = nil
							end
						end
					end

					local now3 = tick()
					if arg2 <= now3 - (tbl10[arg] or 0) then
						tbl10[arg] = now3
						return true
					end
					return false
				end

				fn27 = function(parent, arg)
					local tbl11 = arg or {}
					local tbl12 = tbl9[parent]
					if tbl12 and tbl12.bp and tbl12.bp.Parent == parent then
						return tbl12
					end

					if tbl12 then
						pcall(function()
							if tbl12.bp and tbl12.bp.Parent then
								tbl12.bp:Destroy()
							end
						end)

						pcall(function()
							if tbl12.bg and tbl12.bg.Parent then
								tbl12.bg:Destroy()
							end
						end)
					end

					for _, child in pairs(parent:GetChildren()) do
						if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
							pcall(function()
								child:Destroy()
							end)
						end
					end

					local bodyPosition = Instance.new("BodyPosition")
					bodyPosition.MaxForce = Vector3.new(9e9, 9e9, 9e9)
					bodyPosition.P = tbl11.P or 40000
					bodyPosition.D = tbl11.D or 600
					bodyPosition.Position = parent.Position
					bodyPosition.Parent = parent
					local bodyGyro = Instance.new("BodyGyro")
					bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
					bodyGyro.D = 900
					bodyGyro.CFrame = tbl11.spinHold and parent.CFrame or CFrame.new(0, 0, 0)
					bodyGyro.Parent = parent
					local cframe = tbl11.hardRot and CFrame.new(parent.CFrame.XVector, parent.CFrame.YVector, parent.CFrame.ZVector) or nil

					tbl12 = {
						bp = bodyPosition,
						bg = bodyGyro,
						hrp = parent,
						spinHold = tbl11.spinHold,
						spinCF = tbl11.spinHold and parent.CFrame or nil,
						hardRot = tbl11.hardRot,
						spinRot = cframe,
					}

					tbl9[parent] = tbl12
					return tbl12
				end

				fn28 = function(arg, arg2, arg3, arg4)
					if not (arg and arg.bp and arg.bp.Parent == arg.hrp) then
						return
					end
					local n26 = 0

					pcall(function()
						n26 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
					end)

					local vector = Vector3.zero

					pcall(function()
						vector = arg2.AssemblyLinearVelocity or Vector3.zero
					end)

					arg.bp.Position = arg2.Position + vector * n26 * (arg4 or 2) + Vector3.new(0, arg3 or 5, 0)

					if arg.spinHold and arg.bg and arg.bg.Parent == arg.hrp and arg.spinCF then
						pcall(function()
							arg.bg.CFrame = arg.spinCF
						end)
					end

					if arg.hardRot and arg.spinRot and arg.hrp.Parent then
						pcall(function()
							local spinRot = arg.spinRot
							arg.hrp.CFrame = CFrame.new(arg.bp.Position) * spinRot
							arg.hrp.AssemblyAngularVelocity = Vector3.zero
						end)
					end
				end

				fn29 = function(arg)
					local v38 = tbl9[arg]

					if v38 then
						pcall(function()
							if v38.bp and v38.bp.Parent then
								v38.bp:Destroy()
							end
						end)

						pcall(function()
							if v38.bg and v38.bg.Parent then
								v38.bg:Destroy()
							end
						end)

						tbl9[arg] = nil
					end
				end

				fn30 = function(arg, arg2, arg3, arg4)
					local flag12 = false

					pcall(function()
						flag12 = arg:GetNetworkOwner() == localPlayer
					end)

					if not flag12 then
						pcall(function()
							arg2:FireServer(arg, arg.CFrame)
						end)

						return false
					end

					if fn26(arg3, arg4 or 0.2) then
						pcall(function()
							arg2:FireServer(arg, arg.CFrame)
						end)
					end

					return true
				end

				fn31 = function(arg)
					local tbl11 = { pallet = nil, sound = nil }
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
					local fn55 = nil

					fn55 = function()
						local partOwner = tbl11.sound and tbl11.sound.Parent and tbl11.sound:FindFirstChild("PartOwner")

						if partOwner then
							local name = localPlayer.Name
							partOwner = tostring(tbl11.sound.PartOwner.Value) == name
						end

						if partOwner then
							return
						end
						local PalletLightBrown = fn20("PalletLightBrown")
						if not PalletLightBrown then
							return
						end
						local soundPart = PalletLightBrown:FindFirstChild("SoundPart") or PalletLightBrown:WaitForChild("SoundPart", 2)
						if not soundPart then
							return
						end
						local now2 = tick()

						while true do
							if arg.alive and tick() - now2 < 0.15 then
								pcall(function()
									setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
								end)

								local partOwner2 = soundPart:FindFirstChild("PartOwner")

								if partOwner2 then
									local name = localPlayer.Name
									partOwner2 = tostring(partOwner2.Value) == name
								end

								if not partOwner2 then
									RunService.Heartbeat:Wait()
									continue
								end
							end

							break
						end

						pcall(function()
							soundPart.CFrame = CFrame.new(99000, 99000, 99000)
							soundPart.AssemblyLinearVelocity = Vector3.zero
						end)

						pcall(function()
							for _, descendant in pairs(PalletLightBrown:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.CanCollide = false
									descendant.CanQuery = false
									descendant.Transparency = descendant == soundPart and 0.5 or 1
								end
							end
						end)

						local v38 = tbl11
						tbl11.pallet = PalletLightBrown
						v38.sound = soundPart

						PalletLightBrown.Destroying:Once(function()
							if arg.alive then
								task.wait(0.1)
								pcall(fn55)
							end
						end)
					end

					fn55()
					return tbl11
				end

				fn32 = function(arg)
					if not (arg and arg.Parent) then
						return
					end
					local v38 = fn25()
					fn10("wraith", "input lag (super lock) on " .. tostring(arg.Name))
					local now2 = tick()

					while v38.alive and not flag6 and tick() - now2 < 2.5 do
						pcall(function()
							local v39, seatPart, v40 = fn11()
							seatPart = seatPart and seatPart.SeatPart
							seatPart = seatPart and seatPart.Parent
							if not (v40 and seatPart and seatPart.Name == "CreatureBlobman") then
								return
							end
							local blobmanSeatAndOwnerScript = seatPart:FindFirstChild("BlobmanSeatAndOwnerScript")
							if not blobmanSeatAndOwnerScript then
								return
							end
							local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
							local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
							if not (creatureGrab and creatureRelease) then
								return
							end
							local character = arg.Character
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
							local humanoid = character and character:FindFirstChild("Humanoid")
							if not (humanoidRootPart and humanoid and humanoid.Health > 0) then
								return
							end
							local rightDetector = seatPart:FindFirstChild("RightDetector")
							local rightWeld = rightDetector and (rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChildWhichIsA("Weld"))
							if not (rightDetector and rightWeld) then
								return
							end

							if (humanoidRootPart.Position - v40.Position).Magnitude > 30 then
								local cFrame = v40.CFrame
								v40.CFrame = humanoidRootPart.CFrame
								local now3 = tick()
								local flag12 = false

								while true do
									creatureGrab:FireServer(rightDetector, humanoidRootPart, rightWeld)
									creatureRelease:FireServer(rightWeld)
									task.wait()

									pcall(function()
										flag12 = humanoidRootPart:GetNetworkOwner() == localPlayer
									end)

									if tick() - now3 > 2.5 then
										break
									elseif flag12 then
										break
									end
								end

								if v40.Parent then
									v40.CFrame = cFrame
								end
							end

							creatureGrab:FireServer(rightDetector, humanoidRootPart, rightWeld)
							creatureRelease:FireServer(rightWeld)

							pcall(function()
								humanoid:ChangeState(Enum.HumanoidStateType.Seated)
							end)

							if wraithCanMove(humanoidRootPart) then
								humanoidRootPart.CFrame = rightDetector.CFrame
								humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
								humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

								task.spawn(function()
									pcall(function()
										for _, child in pairs(character:GetChildren()) do
											if child:IsA("BasePart") and child.Name ~= "Humanoid" then
												child.CanCollide = false
											end
										end
									end)
								end)
							end
						end)

						task.wait()
					end

					v38.alive = false
					fn10("wraith", "input lag done")
				end

				fn33 = nil

				fn34 = function(arg, arg2)
					if not (arg and arg.Character) then
						return
					end
					local v38, v39, v40 = fn11()
					if not v40 then
						return
					end
					local cFrame = v40.CFrame
					local character = arg.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

					if humanoidRootPart and setNetworkOwner then
						pcall(function()
							v40.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 3, 5)
							v40.AssemblyLinearVelocity = Vector3.zero
						end)

						local now2 = tick()

						while true do
							for _, child in ipairs(character:GetChildren()) do
								if child:IsA("BasePart") then
									pcall(function()
										setNetworkOwner:FireServer(child, child.CFrame)
									end)
								end
							end

							RunService.Heartbeat:Wait()
							if not (wraithPartOwned(humanoidRootPart) or tick() - now2 > 1.5) then
								continue
							end
							break
						end

						pcall(function()
							v40.CFrame = cFrame
							v40.AssemblyLinearVelocity = Vector3.zero
						end)

						task.wait(0.05)
					end

					fn33(arg, arg2, { offsetY = 15, offsetX = 6, noPallet = true })
				end

				ragdollHoldMode = "Drone"

				fn33 = function(arg, arg2, arg3)
					local tbl11 = arg3 or {}
					local offsetY = tbl11.offsetY or 15
					local superFast = tbl11.superFast or false
					local grabEvents = ReplicatedStorage_.GrabEvents
					local setNetworkOwner = grabEvents:FindFirstChild("SetNetworkOwner")
					local destroyGrabLine = grabEvents:FindFirstChild("DestroyGrabLine")
					local destroyToy = ReplicatedStorage_.MenuToys and ReplicatedStorage_.MenuToys:FindFirstChild("DestroyToy")
					local v38, v39, v40 = fn11()
					if not v40 then
						return
					end
					local v41 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					local cframe = CFrame.new(6, offsetY, 0)

					local function fn55(arg4)
						setNetworkOwner:FireServer(arg4, arg4.CFrame)
					end

					local function fn56(arg4)
						arg4.AssemblyLinearVelocity = Vector3.zero
						arg4.AssemblyAngularVelocity = Vector3.zero
					end

					local function fn57(arg4, arg5)
						return pcall(function()
						end)
					end

					local function fn58(arg4, arg5)
						local n26 = 0

						pcall(function()
							n26 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
						end)

						arg4.CFrame = CFrame.new(arg5.Position + arg5.Velocity * n26 * 5)
					end

					local PalletLightBrown = nil
					local connection = nil
					local fn59 = nil

					fn59 = function()
						PalletLightBrown = fn20("PalletLightBrown")
						if not PalletLightBrown then
							return
						end
						local soundPart = PalletLightBrown:FindFirstChild("SoundPart") or PalletLightBrown:WaitForChild("SoundPart", 3)
						if not soundPart then
							return
						end
						local now2 = tick()

						while true do
							pcall(function()
								fn55(soundPart)
							end)

							task.wait()
							local partOwner = soundPart:FindFirstChild("PartOwner")

							if partOwner then
								local name = localPlayer.Name
								partOwner = tostring(soundPart.PartOwner.Value) == name
							end

							if not (partOwner or tick() - now2 > 3) then
								continue
							end
							break
						end

						pcall(function()
							soundPart.CFrame = CFrame.new(99000, 99000, 99000)
							soundPart.AssemblyLinearVelocity = Vector3.zero
						end)

						pcall(function()
							for _, descendant in pairs(PalletLightBrown:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.CanCollide = false
									descendant.CanQuery = false

									if descendant.Name == "SoundPart" then
										descendant.Transparency = 0.5
									else
										descendant.Transparency = 1
									end
								end
							end
						end)

						PalletLightBrown.Name = "PalletForRagdoll"

						pcall(function()
							connection = PalletLightBrown.Destroying:Once(function()
								if arg2.alive and not flag6 then
									task.wait(0.1)

									if not tbl11.noPallet then
										fn59()
									end
								end
							end)
						end)
					end

					if not tbl11.noPallet then
						fn59()
					end

					local v42 = nil
					local v43 = nil
					local cframe2 = CFrame.new(0, 0, 0)
					local worldAnchor = arg2.worldAnchor

					if not worldAnchor then
						worldAnchor = v40.Position + Vector3.new(tbl11.offsetX or 6, tbl11.offsetY or 15, 0)
					end

					arg2.worldAnchor = worldAnchor
					local n26 = 0

					while true do
						if arg2.alive and not flag6 then
							RunService.RenderStepped:Wait()

							if not (not arg or not arg.Character or not arg.Character:FindFirstChild("HumanoidRootPart")) then
								local v44, v45, v46 = fn11()

								if v46 then
									local tbl12 = { Char = arg.Character, HRP = arg.Character:FindFirstChild("HumanoidRootPart") }
									local cFrame = v46.CFrame
									wraithMarkKickBusy(1)

									pcall(function()
										destroyGrabLine:FireServer(tbl12.HRP)
										RunService.RenderStepped:Wait()
										setNetworkOwner:FireServer(tbl12.HRP, tbl12.HRP.CFrame)
										destroyGrabLine:FireServer(tbl12.HRP)
										RunService.RenderStepped:Wait()
										setNetworkOwner:FireServer(tbl12.HRP, tbl12.HRP.CFrame)
										destroyGrabLine:FireServer(tbl12.HRP)
										RunService.RenderStepped:Wait()
										setNetworkOwner:FireServer(tbl12.HRP, tbl12.HRP.CFrame)
										destroyGrabLine:FireServer(tbl12.HRP)
										RunService.RenderStepped:Wait()
										setNetworkOwner:FireServer(tbl12.HRP, tbl12.HRP.CFrame)
									end)

									if (tbl12.HRP.Position - v46.Position).Magnitude >= 29 then
										arg2.nearClaim = false
									end

									if (tbl12.HRP.Position - v46.Position).Magnitude < 29 and tbl12.Char.Parent == Workspace and not arg2.nearClaim then
										arg2.nearClaim = true
										local head = tbl12.Char:FindFirstChild("Head")
										local now2 = tick()

										while true do
											pcall(function()
												fn55(tbl12.HRP)
											end)

											for _, child in pairs(tbl12.Char:GetChildren()) do
												if child:IsA("BasePart") then
													pcall(function()
														fn55(child)
													end)
												end
											end

											RunService.Heartbeat:Wait()
											if not (head and head:FindFirstChild("PartOwner") or wraithPartOwned(tbl12.HRP) or tick() - now2 > 1.2) then
												continue
											end
											break
										end
									end

									if (tbl12.HRP.Position - v46.Position).Magnitude >= 29 and tbl12.Char.Parent == Workspace then
										pcall(function()
											local currentCamera = Workspace.CurrentCamera

											if currentCamera then
												currentCamera.CameraType = Enum.CameraType.Custom

												if v45 then
													currentCamera.CameraSubject = v45
												end
											end

											if v45 then
												v45.PlatformStand = false
												v45.AutoRotate = true

												if v45.WalkSpeed <= 0 then
													v45.WalkSpeed = 16
												end
											end

											for _, child in ipairs(v44:GetChildren()) do
												if child:IsA("BasePart") then
													child.LocalTransparencyModifier = 0
												end
											end
										end)

										task.wait(superFast and 0.05 or 0.1)
										fn58(v46, tbl12.HRP)
										task.wait(superFast and 0.1 or 0.2)
										local head = tbl12.Char:FindFirstChild("Head")
										local now2 = tick()

										while true do
											pcall(function()
												fn55(tbl12.HRP)
											end)

											for _, child in pairs(tbl12.Char:GetChildren()) do
												if child:IsA("BasePart") then
													pcall(function()
														fn55(child)
													end)
												end
											end

											RunService.Heartbeat:Wait()
											if not (head and head:FindFirstChild("PartOwner") or wraithPartOwned(tbl12.HRP) or tick() - now2 > 1.5) then
												continue
											end
											break
										end

										v46.CFrame = cFrame
										task.wait(superFast and 0.1 or 0.2)
										local cFrame2 = v46.CFrame

										pcall(function()
											for _, child in pairs(tbl12.Char:GetChildren()) do
												if child:IsA("Part") and child.Name ~= "Humanoid" then
													child.CFrame = cFrame2 * cframe
												end
											end
										end)
									end

									if tbl12.HRP.Position.Y < v46.Position.Y + 4 and tbl12.Char.Parent == Workspace then
										local head = tbl12.Char:FindFirstChild("Head")

										if head then
											local now2 = tick()

											while true do
												pcall(function()
													fn55(tbl12.HRP)
												end)

												task.wait()
												if not (head:FindFirstChild("PartOwner") or tick() - now2 > 4) then
													continue
												end
												break
											end
										end

										v46.CFrame = cFrame

										pcall(function()
											local currentCamera = Workspace.CurrentCamera

											if currentCamera and currentCamera.CameraType == Enum.CameraType.Scriptable then
												currentCamera.CameraType = Enum.CameraType.Custom

												if v45 then
													currentCamera.CameraSubject = v45
												end
											end

											if v45 then
												v45.PlatformStand = false

												if v45.WalkSpeed <= 0 then
													v45.WalkSpeed = 16
												end
											end
										end)

										pcall(function()
											tbl12.HRP.CFrame = v46.CFrame * cframe
										end)
									end

									if not tbl11.noPallet and PalletLightBrown and PalletLightBrown.Parent and v41 and v41:FindFirstChild("PalletForRagdoll") then
										local soundPart = PalletLightBrown:FindFirstChild("SoundPart")

										if soundPart then
											pcall(function()
												if setNetworkOwner then
													setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
												end

												soundPart.AssemblyAngularVelocity = Vector3.zero
												soundPart.CFrame = tbl12.HRP.CFrame * CFrame.new(0, -1.5, 0)
												soundPart.AssemblyLinearVelocity = Vector3.new(0, 2500, 0)
											end)

											if tbl12.Char:FindFirstChildOfClass("Humanoid") and fn26("rk_pal_rag", 0.1) then
												pcall(function()
													ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(tbl12.HRP, 3)
												end)
											end
										end
									end

									if not arg2.spinInit then
										arg2.spinInit = true

										pcall(function()
											local cFrame2 = tbl12.HRP.CFrame
											cframe2 = CFrame.new(cFrame2.XVector, cFrame2.YVector, cFrame2.ZVector)
										end)
									end

									if v42 then
										pcall(function()
											v42:Destroy()
										end)

										v42 = nil
									end

									if v43 then
										pcall(function()
											v43:Destroy()
										end)

										v43 = nil
									end

									task.spawn(function()
										for _, child in pairs(tbl12.Char:GetChildren()) do
											if fn57(child, "AssemblyLinearVelocity") then
												fn56(child)

												pcall(function()
													child.Velocity = Vector3.zero
												end)
											end
										end
									end)

									local position

									if ragdollHoldMode == "Drone" then
										position = (v46.CFrame * CFrame.new(6, offsetY, 0)).Position
										arg2.worldAnchor = position
									else
										if not arg2.worldAnchor then
											arg2.worldAnchor = (v46.CFrame * CFrame.new(6, offsetY, 0)).Position
											arg2.selfAnchor = v46.CFrame
										end

										position = arg2.worldAnchor

										pcall(function()
											if arg2.selfAnchor and (v46.Position - arg2.selfAnchor.Position).Magnitude > 2 then
												v46.CFrame = arg2.selfAnchor
												v46.AssemblyLinearVelocity = Vector3.zero
												v46.AssemblyAngularVelocity = Vector3.zero
											end

											if v45 then
												v45.PlatformStand = false
											end
										end)
									end

									if v42 then
										v42.Position = position
									end

									pcall(function()
										local humanoid = tbl12.Char:FindFirstChildOfClass("Humanoid")

										if humanoid then
											humanoid.PlatformStand = true

											pcall(function()
												humanoid.Sit = false
											end)
										end

										local cFrame2 = CFrame.new(position) * cframe2

										if arg2.limbOffsets then
											for k in pairs(arg2.limbOffsets) do
												if not k.Parent then
													arg2.limbOffsets = nil
													break
												end
											end
										end

										if not arg2.limbOffsets or arg2.limbChar ~= tbl12.Char then
											arg2.limbChar = tbl12.Char
											arg2.limbOffsets = {}

											local tbl13 = {
												Head = CFrame.new(0, 1.5, 0),
												Torso = CFrame.new(0, 0, 0),
												UpperTorso = CFrame.new(0, 0.2, 0),
												LowerTorso = CFrame.new(0, -0.6, 0),
												["Left Arm"] = CFrame.new(-1.5, 0, 0),
												["Right Arm"] = CFrame.new(1.5, 0, 0),
												["Left Leg"] = CFrame.new(-0.5, -2, 0),
												["Right Leg"] = CFrame.new(0.5, -2, 0),
												LeftUpperArm = CFrame.new(-1.5, 0.4, 0),
												LeftLowerArm = CFrame.new(-1.5, -0.5, 0),
												LeftHand = CFrame.new(-1.5, -1.2, 0),
												RightUpperArm = CFrame.new(1.5, 0.4, 0),
												RightLowerArm = CFrame.new(1.5, -0.5, 0),
												RightHand = CFrame.new(1.5, -1.2, 0),
												LeftUpperLeg = CFrame.new(-0.5, -1.4, 0),
												LeftLowerLeg = CFrame.new(-0.5, -2.4, 0),
												LeftFoot = CFrame.new(-0.5, -3, 0),
												RightUpperLeg = CFrame.new(0.5, -1.4, 0),
												RightLowerLeg = CFrame.new(0.5, -2.4, 0),
												RightFoot = CFrame.new(0.5, -3, 0),
											}

											for _, child in pairs(tbl12.Char:GetChildren()) do
												if child:IsA("BasePart") and child ~= tbl12.HRP then
													arg2.limbOffsets[child] = tbl13[child.Name] or CFrame.new(0, 0, 0)
												end
											end
										end

										tbl12.HRP.CFrame = cFrame2
										tbl12.HRP.AssemblyLinearVelocity = Vector3.zero
										tbl12.HRP.AssemblyAngularVelocity = Vector3.zero

										for k, limbOffset in pairs(arg2.limbOffsets) do
											if k.Parent then
												k.CFrame = cFrame2 * limbOffset
												k.AssemblyLinearVelocity = Vector3.zero
												k.AssemblyAngularVelocity = Vector3.zero
											end
										end

										local now2 = tick()
										local flag12 = now2 - n26 > 0.05

										if flag12 then
											n26 = now2
										end

										pcall(function()
											wraithClaimBody(tbl12.Char)
										end)

										local n27 = CFrame.new(position) * cframe2

										pcall(function()
											setNetworkOwner:FireServer(tbl12.HRP, n27)
										end)

										if flag12 then
											pcall(function()
												destroyGrabLine:FireServer(tbl12.HRP)
												grabEvents.CreateGrabLine:FireServer(tbl12.HRP, Vector3.zero, position, false)
												setNetworkOwner:FireServer(tbl12.HRP, n27)
											end)
										end

										for _, child in pairs(tbl12.Char:GetChildren()) do
											if child:IsA("BasePart") then
												if flag12 then
													pcall(function()
														setNetworkOwner:FireServer(child, n27)
													end)
												end

												child.AssemblyLinearVelocity = Vector3.zero
												child.AssemblyAngularVelocity = Vector3.zero
												child.Velocity = Vector3.zero
												child.RotVelocity = Vector3.zero
											end
										end
									end)

									continue
								end
							end
						end

						break
					end

					if v42 then
						pcall(function()
							v42:Destroy()
						end)

						v42 = nil
					end

					if v43 then
						pcall(function()
							v43:Destroy()
						end)

						v43 = nil
					end

					if connection then
						pcall(function()
							connection:Disconnect()
						end)

						connection = nil
					end

					if PalletLightBrown and PalletLightBrown.Parent then
						pcall(function()
							if destroyToy then
								destroyToy:FireServer(PalletLightBrown)
							end
						end)

						pcall(function()
							PalletLightBrown:Destroy()
						end)
					end

					PalletLightBrown = nil

					if arg and arg.Character then
						local humanoidRootPart = arg.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							for _, child in pairs(humanoidRootPart:GetChildren()) do
								if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
									pcall(function()
										child:Destroy()
									end)
								end
							end

							pcall(fn56, humanoidRootPart)
						end
					end
				end

				local tbl11 = {}
				local n26 = 0

				fn35 = function()
					return n26 > 0
				end

				fn49 = function(arg)
					n26 += 1
					local thread = task.spawn(arg)
					tbl11[thread] = true

					task.spawn(function()
						while coroutine.status(thread) ~= "dead" do
							task.wait(0.5)
						end

						tbl11[thread] = nil
						n26 = math.max(0, n26 - 1)
						statsKicked = (statsKicked or 0) + 1
					end)

					return thread
				end

				fn50 = function()
					flag6 = true
					loopMethodActive = false
					flag11 = false
					flag7 = false

					for _, v38 in ipairs(tbl8) do
						v38.alive = false
					end

					tbl8 = {}
					wraithKickBusyUntil = 0

					for k in pairs(tbl11) do
						pcall(function()
							task.cancel(k)
						end)
					end

					tbl11 = {}

					if v37 then
						pcall(function()
							task.cancel(v37)
						end)

						v37 = nil
					end

					task.delay(0.5, function()
						flag6 = false
					end)

					fn10("wraith", "kicks stopped")
				end
			end

			do
				local tbl6 = {}
				local cframe = CFrame.new(4.12, -12.45, 15.3)
				local cframe2 = CFrame.new(-10.54, 8.21, -3.44)
				local cframe3 = CFrame.new(18.22, 0.15, -10.87)
				local cframe4 = CFrame.new(-5.3, -18.9, 2.11)
				local cframe5 = CFrame.new(0.45, 14.56, 12)
				local cframe6 = CFrame.new(12.78, -9.33, -14.2)
				local cframe7 = CFrame.new(-15.6, -2.1, 10.45)
				local cframe8 = CFrame.new(2.11, 20.34, -5.67)
				local cframe9 = CFrame.new(-12, 10, 15.12)
				local cframe10 = CFrame.new(15.4, 12.3, 0.45)
				local cframe11 = CFrame.new(-8.2, -10.45, -18.3)
				local cframe12 = CFrame.new(5.67, -2.5, 22.1)
				local cframe13 = CFrame.new(-20.1, 5.4, -8.9)
				local cframe14 = CFrame.new(10.12, 18.22, 5.3)
				local cframe15 = CFrame.new(-3.45, -15.12, -12)
				local cframe16 = CFrame.new(22.3, -5.67, 4.12)
				local cframe17 = CFrame.new(-14.2, 16.1, -2.11)
				local cframe18 = CFrame.new(7.89, -20.45, 0.15)
				local cframe19 = CFrame.new(0.15, 6.78, -20.1)
				local cframe20 = CFrame.new
				tbl6[1] = cframe
				tbl6[2] = cframe2
				tbl6[3] = cframe3
				tbl6[4] = cframe4
				tbl6[5] = cframe5
				tbl6[6] = cframe6
				tbl6[7] = cframe7
				tbl6[8] = cframe8
				tbl6[9] = cframe9
				tbl6[10] = cframe10
				tbl6[11] = cframe11
				tbl6[12] = cframe12
				tbl6[13] = cframe13
				tbl6[14] = cframe14
				tbl6[15] = cframe15
				tbl6[16] = cframe16
				tbl6[17] = cframe17
				tbl6[18] = cframe18
				tbl6[19] = cframe19

				do
					local values = table.pack(cframe20(-18.3, -8.2, 5.67))
					table.move(values, 1, values.n, 20, tbl6)
				end
			end

			fn36 = function()
				local v37 = fn25()
				local v38, v39, v40 = fn11()
				if not v40 then
					fn10("wraith", "kick all: no char")
					return
				end
				flag6 = false
				fn10("wraith", "kick all: starting")
				local v41 = fn19(v40.CFrame)
				local plotItems = Workspace:FindFirstChild("PlotItems")
				plotItems = plotItems and plotItems:FindFirstChild("PlayersInPlots")
				local flag11 = true

				task.spawn(function()
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local createGrabLine = grabEvents and grabEvents:FindFirstChild("CreateGrabLine")

					while true do
						local v42 = flag11
						local alive

						if flag11 then
							alive = createGrabLine
						else
							alive = v42
						end

						alive = alive and v37.alive

						if alive then
							pcall(function()
								local spawnLocation = Workspace:FindFirstChild("SpawnLocation") or Workspace:FindFirstChild("Spawn") or localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

								if spawnLocation then
									local random = math.random
									createGrabLine:FireServer(spawnLocation, CFrame.new(math.random(-2e9, 2e9), 0, random(-2e9, 2e9)))
								end
							end)

							task.wait(0.35)
							continue
						end

						break
					end
				end)

				task.wait(3)
				local tbl6 = {}
				local n25 = 0

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Character then
						local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local v42 = plotItems and player.Character:IsDescendantOf(plotItems)

							if fn24(player) then
								n25 += 1
							elseif not v42 then
								table.insert(tbl6, humanoidRootPart)
							end
						end
					end
				end

				if n25 > 0 then
					fn10("wraith", "kick all: пропущено друзей: " .. n25)
				end

				if #tbl6 == 0 then
					flag11 = false
					fn10("wraith", "kick all: no targets")
					return
				end

				local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
				local destroyGrabLine = ReplicatedStorage_.GrabEvents:FindFirstChild("DestroyGrabLine")

				for _, v42 in ipairs(tbl6) do
					if v37.alive and not flag6 then
						if not v42.Parent then
							continue
						else
							local v43, v44, v45 = fn11()

							if v45 then
								pcall(function()
									v45.CFrame = v42.CFrame
								end)

								task.wait(0.2)

								pcall(function()
									setNetworkOwner:FireServer(v42, v45.CFrame)
								end)

								task.wait(0.2)
								continue
							end
						end
					end

					break
				end

				local v42, v43, v44 = fn11()

				if v44 then
					pcall(function()
						v44.CFrame = v41
					end)
				end

				task.wait(0.3)
				local n26 = math.max(38, 5 * math.max(#tbl6, 1))
				local n27 = #tbl6

				for i, v45 in ipairs(tbl6) do
					if v37.alive and not flag6 then
						if v45.Parent then
							local n28 = i / math.max(n27, 1) * 3.1415926535897931 * 2
							local n29 = Vector3.new(0, 170, 0) + Vector3.new(math.cos(n28) * n26, 0, math.sin(n28) * n26)
							wraithGrabClaim(v45, nil)
							wraithServerMove(v45, CFrame.new(n29), Vector3.zero)

							pcall(function()
								destroyGrabLine:FireServer(v45)
							end)
						end

						continue
					end

					break
				end

				task.wait(15)
				flag11 = false
				v37.alive = false
				fn10("wraith", "kick all done")
			end

			fn37 = function()
				local n25 = 0
				local destroyToy = ReplicatedStorage_.MenuToys.DestroyToy

				while antiSnowballActive do
					pcall(function()
						local v37, v38, v39 = fn11()

						if v38 and v39 then
							local ragdolled = v38:FindFirstChild("Ragdolled")

							if ragdolled and ragdolled.Value or v38.PlatformStand then
								pcall(function()
									ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(v39, 0)
								end)

								v38.PlatformStand = false

								pcall(function()
									v38:ChangeState(Enum.HumanoidStateType.GettingUp)
								end)
							end
						end

						if v39 and tick() - n25 > 0.3 then
							n25 = tick()

							for _, child in pairs(Workspace:GetChildren()) do
								if child.Name:match("SpawnedInToys") and child.Name ~= localPlayer.Name .. "SpawnedInToys" then
									for _, child2 in pairs(child:GetChildren()) do
										if child2.Name == "BallSnowball" then
											local primaryPart = child2.PrimaryPart or child2:FindFirstChildWhichIsA("BasePart")

											if primaryPart and (primaryPart.Position - v39.Position).Magnitude < 25 then
												pcall(function()
													ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(primaryPart, primaryPart.CFrame)
												end)

												pcall(function()
													for _, descendant in pairs(child2:GetDescendants()) do
														if descendant:IsA("BasePart") then
															descendant.CanCollide = false
															descendant.CanTouch = false
															descendant.CanQuery = false
														end
													end
												end)

												pcall(function()
													destroyToy:FireServer(child2)
												end)

												pcall(function()
													child2:Destroy()
												end)
											end
										end
									end
								end
							end
						end
					end)

					task.wait(0.05)
				end
			end

			blackholeCustomActive = false
			blackholeHideOnDetect = true
			blackholeRef = nil
			blackholeColor = Color3.fromRGB(255, 255, 255)
			blackholeSize = 240
			blackholeAlpha = 0
			blackholeTexture = blackholeTexture or "rbxassetid://8656483322"
			blackholeHideNear = true

			bhNearHiddenSpot = function(arg)
				if not blackholeHideNear then
					return false
				end
				return arg.Magnitude < 25
			end

			blackholeTask = nil
			blackholeMonitorTask = nil
			tbl5 = {}
			bhDone = {}
			bhMarked = {}

			local function fn51(arg)
				pcall(function()
					if arg:IsA("BasePart") then
						arg.LocalTransparencyModifier = 1

						pcall(function()
							arg.Transparency = 1
						end)
					end

					for _, descendant in pairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.LocalTransparencyModifier = 1

							pcall(function()
								descendant.Transparency = 1
							end)
						end

						if descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
							descendant.Enabled = false
						end

						if descendant:IsA("Decal") or descendant:IsA("Texture") then
							descendant.Transparency = 1
						end

						if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") then
							descendant.Enabled = false
						end

						if descendant:IsA("Sound") then
							pcall(function()
								descendant:Stop()
							end)
						end
					end
				end)
			end

			bhGuessVictim = function(arg)
				local n25 = 60
				local v37 = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Character then
						local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local magnitude = (humanoidRootPart.Position - arg).Magnitude

							if magnitude < n25 then
								n25 = magnitude
								v37 = player
							end
						end
					end
				end

				return v37
			end

			local function fn52(arg)
				if tbl5[arg] or bhDone[arg] then
					return
				end
				tbl5[arg] = true

				if blackholeHideOnDetect then
					fn51(arg)
				end

				local isBasePart = arg:IsA("BasePart") and arg or arg:FindFirstChildWhichIsA("BasePart")
				if not isBasePart or bhNearHiddenSpot(isBasePart.Position) then
					return
				end
				local part2 = Instance.new("Part")
				part2.Anchored = true
				part2.CanCollide = false
				part2.Size = Vector3.one
				part2.Transparency = 1
				part2.Parent = Workspace
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Adornee = part2
				billboardGui.Size = UDim2.new(0, 240, 0, 240)
				billboardGui.AlwaysOnTop = true
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.BackgroundTransparency = 1
				imageLabel.Image = blackholeTexture

				pcall(function()
					imageLabel.ImageColor3 = blackholeColor
				end)

				imageLabel.Size = UDim2.new(1, 0, 1, 0)
				imageLabel.Parent = billboardGui
				billboardGui.Parent = part2
				local now2 = tick()
				local position = isBasePart.Position

				task.spawn(function()
					local rotation = math.random(0, 359)

					while true do
						if blackholeCustomActive and arg.Parent then
							local n25 = tick() - now2

							if not (n25 >= 10) then
								pcall(function()
									local isBasePart2 = arg:IsA("BasePart") and arg or arg:FindFirstChildWhichIsA("BasePart")

									if isBasePart2 then
										part2.CFrame = isBasePart2.CFrame
										position = isBasePart2.Position
									end

									local n26

									if n25 <= 4 then
										n26 = 1 + 0.28 * math.sin(n25 / 4 * 3.1415926535897931 * 2)
									else
										local n27 = math.clamp(1 - (n25 - 4) / 6, 0, 1)
										n26 = n27 * n27 * (3 - 2 * n27)
									end

									rotation = (rotation + 1.35) % 360
									imageLabel.Rotation = rotation
									imageLabel.Image = blackholeTexture
									imageLabel.ImageColor3 = blackholeColor
									imageLabel.ImageTransparency = (blackholeAlpha or 0) / 100
									local n27 = math.max(2, (blackholeSize or 240) * n26)
									billboardGui.Size = UDim2.new(0, n27, 0, n27)
								end)

								task.wait(0.025)
								continue
							end
						end

						break
					end

					pcall(function()
						billboardGui:Destroy()
					end)

					pcall(function()
						part2:Destroy()
					end)

					bhDone[arg] = true
				end)
			end

			fn38 = function()
				local connection = nil

				pcall(function()
					connection = Workspace.DescendantAdded:Connect(function(descendant)
						if not blackholeCustomActive then
							return
						end

						if descendant.Name:lower():find("blackhole") then
							task.defer(function()
								if blackholeCustomActive and descendant.Parent then
									fn52(descendant)
								end
							end)
						end
					end)
				end)

				while blackholeCustomActive do
					pcall(function()
						for _, child in pairs(Workspace:GetChildren()) do
							if child.Name:lower():find("blackhole") then
								fn52(child)
							end
						end
					end)

					task.wait(0.2)
				end

				if connection then
					pcall(function()
						connection:Disconnect()
					end)
				end

				tbl5 = {}
				bhDone = {}
				bhMarked = {}
			end

			fn39 = function()
				if blackholeObj then
					pcall(function()
						blackholeObj.bill:Destroy()
					end)

					pcall(function()
						blackholeObj.part:Destroy()
					end)

					blackholeObj = nil
				end
			end

			invAKActive = false
			invAKTask = nil
			joinAntiLag = true
			flag8 = false
			flag9 = false
			local flag11 = false

			local function fn53(disabled)
				pcall(function()
					localPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = disabled
				end)
			end

			fn40 = function()
				local v37 = fn53
				local v38 = flag8
				local v39

				if flag8 then
					v39 = v38
				else
					v39 = flag9
				end

				v37(v39 or flag11)
			end

			local function fn54(disabled)
				pcall(function()
					for _, child in pairs(localPlayer.PlayerScripts:GetChildren()) do
						if child:IsA("LocalScript") then
							local name = child.Name

							if name == "CharacterAndBeamMove" or name:find("Beam") or name:find("GrabLine") or name:find("Character") and name:find("Move") then
								child.Disabled = disabled
							end
						end
					end
				end)
			end

			fn41 = function(arg)
				flag11 = arg
				fn54(arg)

				if arg then
					pcall(function()
						for _, player in pairs(Players:GetPlayers()) do
							if player.Character and player.Character:FindFirstChild("GrabParts") then
								player.Character.GrabParts:Destroy()
							end
						end
					end)
				end
			end

			local n25 = 0

			fn42 = function()
				RunService.RenderStepped:Connect(function(deltaTime)
					if not autoAntiLagOn then
						return
					end

					if os.clock() - n25 < 2.5 or deltaTime <= 0 then
						return
					end
					n25 = os.clock()
					local n26 = math.floor(1 / deltaTime)

					if n26 < (autoAntiLagThreshold or 30) and not flag11 then
						fn10("wraith", "auto anti lag: low fps (" .. n26 .. ")")
						fn41(true)
					end
				end)
			end

			antiBurnV2Active = false
			antiBurnV2Conn = nil
			local flag12 = false
			local v37 = nil
			local cFrame = nil
			local v38 = nil

			local function fn55()
				if v37 and v37.Parent then
					return v37
				end
				local extinguishPart = nil

				pcall(function()
					local map = Workspace:FindFirstChild("Map")
					map = map and map:FindFirstChild("Hole")
					map = map and map:FindFirstChild("PoisonBigHole")
					extinguishPart = map and map:FindFirstChild("ExtinguishPart")
				end)

				if not extinguishPart then
					pcall(function()
						for _, descendant in ipairs(Workspace:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.Name == "ExtinguishPart" then
								extinguishPart = descendant
								break
							end
						end
					end)
				end

				if extinguishPart then
					v37 = extinguishPart
					cFrame = extinguishPart.CFrame
				end

				return extinguishPart
			end

			local function fn56()
				if v38 and v38.Parent then
					return v38
				end
				local v39 = nil
				local n26 = 0

				pcall(function()
					for _, descendant in ipairs(Workspace:GetDescendants()) do
						if descendant:IsA("BasePart") then
							local str6 = descendant.Name:lower()

							if str6:find("water") or str6:find("lake") or str6:find("river") or str6:find("pond") or descendant.Material == Enum.Material.Water then
								local n27 = descendant.Size.X * descendant.Size.Z * math.max(1, descendant.Size.Y)

								if n26 < n27 then
									n26 = n27
									v39 = descendant
								end
							end
						end
					end
				end)

				v38 = v39
				return v39
			end

			local function fn57(arg, arg2)
				pcall(function()
					local firePlayerPart = arg and arg:FindFirstChild("FirePlayerPart", true)

					if firePlayerPart then
						for _, child in ipairs(firePlayerPart:GetChildren()) do
							if child:IsA("Sound") then
								child:Stop()
							end

							if child:IsA("Light") or child:IsA("ParticleEmitter") then
								child.Enabled = false
							end
						end

						if firePlayerPart:FindFirstChild("CanBurn") then
							firePlayerPart.CanBurn.Value = false
						end
					end

					if arg2 and arg2:FindFirstChild("FireDebounce") then
						arg2.FireDebounce.Value = false
					end
				end)
			end

			local function fn58(arg)
				if flag12 then
					return
				end
				flag12 = true

				task.spawn(function()
					pcall(function()
						local humanoid = arg:FindFirstChild("Humanoid")
						local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
						if not (humanoid and humanoidRootPart) then
							return
						end
						arg.PrimaryPart = humanoidRootPart
						local fireDebounce = humanoid:FindFirstChild("FireDebounce") or humanoid:WaitForChild("FireDebounce", 5)
						local v39 = fn55()
						local setNetworkOwner = ReplicatedStorage_.GrabEvents and ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
						local n26 = tick() + 6

						while antiBurnV2Active and fireDebounce and fireDebounce.Value and tick() < n26 do
							if v39 and v39.Parent then
								pcall(function()
									if setNetworkOwner then
										setNetworkOwner:FireServer(v39, v39.CFrame)
									end

									v39.CFrame = humanoidRootPart.CFrame
								end)
							end

							fn57(arg, humanoid)
							task.wait(0.1)
						end

						if v39 and v39.Parent and cFrame then
							pcall(function()
								v39.CFrame = cFrame
							end)
						end

						if fireDebounce and fireDebounce.Value and antiBurnV2Active then
							local v40 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							local fireExtinguisher = v40 and v40:FindFirstChild("FireExtinguisher")

							if not fireExtinguisher then
								pcall(function()
									ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("FireExtinguisher", humanoidRootPart.CFrame * CFrame.new(0, 2, 2), Vector3.zero)
								end)

								local now2 = tick()

								while antiBurnV2Active and not fireExtinguisher and tick() - now2 < 2.5 do
									task.wait(0.05)
									local v41 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									fireExtinguisher = v41 and v41:FindFirstChild("FireExtinguisher")
								end
							end

							if fireExtinguisher and fireExtinguisher.Parent then
								local holdPart = fireExtinguisher:FindFirstChild("HoldPart") or fireExtinguisher:FindFirstChildWhichIsA("BasePart")

								if holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction") then
									pcall(function()
										holdPart.HoldItemRemoteFunction:InvokeServer(fireExtinguisher, arg)
									end)
								end

								local now2 = tick()

								while antiBurnV2Active and fireDebounce and fireDebounce.Value and tick() - now2 < 3 do
									pcall(function()
										for _, descendant in pairs(fireExtinguisher:GetDescendants()) do
											if descendant:IsA("RemoteEvent") then
												pcall(function()
													descendant:FireServer()
												end)
											end
										end
									end)

									pcall(function()
										VirtualInputManager:SendMouseButtonEvent(8, 8, 0, true, game, 1)
									end)

									task.wait(0.1)

									pcall(function()
										VirtualInputManager:SendMouseButtonEvent(8, 8, 0, false, game, 1)
									end)

									fn57(arg, humanoid)
								end

								pcall(function()
									if holdPart and holdPart:FindFirstChild("DropItemRemoteFunction") then
										holdPart.DropItemRemoteFunction:InvokeServer(fireExtinguisher, CFrame.new(0, 5000, 0), Vector3.zero)
									else
										ReplicatedStorage_.MenuToys.DestroyToy:FireServer(fireExtinguisher)
									end
								end)
							end
						end

						if fireDebounce and fireDebounce.Value and antiBurnV2Active then
							local v40 = fn56()

							if v40 then
								local cFrame2 = humanoidRootPart.CFrame

								pcall(function()
									arg:SetPrimaryPartCFrame(v40.CFrame + Vector3.new(0, 3, 0))
								end)

								local now2 = tick()

								while antiBurnV2Active and tick() - now2 < 0.8 do
									fn57(arg, humanoid)
									task.wait(0.1)
								end

								if arg.Parent and antiBurnV2Active then
									pcall(function()
										arg:SetPrimaryPartCFrame(cFrame2)
									end)
								end
							end
						end

						fn57(arg, humanoid)
					end)

					flag12 = false
				end)
			end

			fn43 = function(arg)
				if antiBurnV2Conn then
					pcall(function()
						antiBurnV2Conn:Disconnect()
					end)

					antiBurnV2Conn = nil
				end

				task.spawn(function()
					local humanoid = arg and arg:FindFirstChild("Humanoid") or arg and arg:WaitForChild("Humanoid", 10)
					if not humanoid then
						return
					end
					local fireDebounce = humanoid:FindFirstChild("FireDebounce") or humanoid:WaitForChild("FireDebounce", 10)
					if not fireDebounce then
						return
					end

					antiBurnV2Conn = fireDebounce.Changed:Connect(function(arg2)
						if arg2 and antiBurnV2Active then
							fn58(arg)
						end
					end)
				end)
			end
		end

		local v37, v38, v39, v40, v41, v42, v43, v44, v45

		do
			do
				local fn51

				do
					cocoPEActive = false
					cocoPETask = nil

					fn44 = function()
						local ok, result = pcall(function()
							return Workspace:WaitForChild("Slots", 5)
						end)

						if not ok or not result then
							fn10("wraith", "farm: no slots")
							return
						end
						fn10("wraith", "farm coins: started")
						local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

						while farmSlotsActive do
							task.wait(1)

							pcall(function()
								local character = localPlayer.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								if not character then
									return
								end
								local handle = nil

								for _, child in pairs(result:GetChildren()) do
									local slotHandle = child:FindFirstChild("SlotHandle")
									local handle2 = slotHandle and slotHandle:FindFirstChild("Handle")
									slotHandle = slotHandle and slotHandle:FindFirstChild("LightBall")
									if handle2 and slotHandle and slotHandle:IsA("BasePart") and slotHandle.Material == Enum.Material.Neon then
										handle = handle2
										break
									end
								end

								if not handle then
									local ok2, result2 = pcall(function()
										return Workspace.Slots.Slots.Screen.SlotGui.TimeLeftFrame.TimeText
									end)

									if not (ok2 and result2 and result2.Text == "0:00") then
										return
									end
									handle = Workspace.Slots.Slots.SlotHandle and Workspace.Slots.Slots.SlotHandle.Handle
									if not handle then
										return
									end
								end

								local cFrame = character.CFrame
								local now2 = tick()

								while farmSlotsActive and tick() - now2 < 6 do
									pcall(function()
										local character2 = localPlayer.Character
										local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart then
											return
										end
										humanoidRootPart.CFrame = handle.CFrame + Vector3.new(0, 5, 0)
										humanoidRootPart.AssemblyLinearVelocity = Vector3.zero

										if setNetworkOwner then
											setNetworkOwner:FireServer(handle, CFrame.new(humanoidRootPart.Position, handle.Position))
											setNetworkOwner:FireServer(handle, handle.CFrame)
										end
									end)

									task.wait(0.1)
								end

								local character2 = localPlayer.Character
								local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart then
									pcall(function()
										humanoidRootPart.CFrame = cFrame
									end)
								end
							end)
						end
					end

					claimPlotName = nil
					claimPlotActive = false
					claimPlotTask = nil
					local tbl6 = { "Pink House", "Spooky House", "Blue House", "Green House", "Chinese House" }

					fn45 = function()
						while claimPlotActive do
							task.wait(0.5)

							pcall(function()
								local plots = Workspace:FindFirstChild("Plots")
								if not plots or not claimPlotName then
									return
								end
								local v46 = nil

								for i, v47 in ipairs(tbl6) do
									if v47 == claimPlotName then
										v46 = i
									end
								end

								if not v46 then
									return
								end
								local v47 = plots:GetChildren()[v46]
								if not v47 or not v47:FindFirstChild("PlotSign") then
									return
								end
								local thisPlotsOwners = v47.PlotSign:FindFirstChild("ThisPlotsOwners")
								if not thisPlotsOwners then
									return
								end

								if #thisPlotsOwners:GetChildren() > 0 then
									local v48 = claimNotifyCd

									if tick() - v48 > 10 then
										claimNotifyCd = tick()
										fn10("wraith", "claim: plot occupied")
									end

									return
								end

								local plusGrabPart = v47.PlotSign:FindFirstChild("Sign") and v47.PlotSign.Sign:FindFirstChild("Plus") and v47.PlotSign.Sign.Plus:FindFirstChild("PlusGrabPart")
								if not plusGrabPart then
									return
								end
								local character = localPlayer.Character
								local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart then
									return
								end
								local cFrame = humanoidRootPart.CFrame
								local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
								local now2 = tick()

								while claimPlotActive and #thisPlotsOwners:GetChildren() <= 0 and tick() - now2 < 15 do
									pcall(function()
										humanoidRootPart.CFrame = plusGrabPart.CFrame * CFrame.new(-5, 0, -5)
										humanoidRootPart.AssemblyLinearVelocity = Vector3.zero

										for i = 1, 16 do
											ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(plusGrabPart, plusGrabPart.CFrame)
											ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(plusGrabPart, CFrame.new(humanoidRootPart.Position, plusGrabPart.Position))
										end
									end)

									task.wait(0.15)
								end

								pcall(function()
									humanoidRootPart.CFrame = cFrame
									humanoidRootPart.AssemblyLinearVelocity = assemblyLinearVelocity
								end)

								if #thisPlotsOwners:GetChildren() > 0 then
									fn10("wraith", "claim: " .. claimPlotName .. " done")
								else
									fn10("wraith", "claim: failed, retrying")
								end
							end)
						end
					end

					local tbl7 = {
						Shuriken = { NinjaShuriken = true },
						Kunai = { NinjaKunai = true },
						Plate = { AntiKickItem = true, AntiKick = true, Plate = true, PlateAntiKick = true },
						Pickaxe = { ToolPickaxe = true, Pickaxe = true },
					}

					local tbl8 = { Shuriken = true, Kunai = true, Plate = true, Pickaxe = true }

					fn51 = function(arg)
						local str6 = tostring(arg)

						for k, v46 in pairs(tbl7) do
							if tbl8[k] then
								if v46[str6] then
									return true
								end
								local str7 = str6:lower()

								for k2 in pairs(v46) do
									if str7:find(tostring(k2):lower(), 1, true) then
										return true
									end
								end
							end
						end

						return false
					end
				end

				local color = Color3.fromRGB(79, 66, 181)
				local fillTransparency = 0.4
				local flag11 = true
				local flag12 = false
				flag10 = false
				blobEspColor = Color3.fromRGB(96, 76, 214)
				local fn52 = nil

				local function fn53(adornee, name, fillColor, arg)
					pcall(function()
						local v46 = adornee:FindFirstChild(name)

						if v46 and v46:IsA("Highlight") then
							v46.FillColor = fillColor or v46.FillColor
							v46.OutlineColor = arg or fillColor or v46.OutlineColor
							v46.FillTransparency = fillTransparency
							return
						end

						if adornee:IsA("Model") and not adornee.PrimaryPart then
							pcall(function()
								adornee.PrimaryPart = adornee:FindFirstChildWhichIsA("BasePart")
							end)
						end

						local highlight = Instance.new("Highlight")
						highlight.Name = name
						highlight.Adornee = adornee
						highlight.FillTransparency = fillTransparency
						highlight.FillColor = fillColor or Color3.fromRGB(96, 76, 214)
						highlight.OutlineColor = arg or fillColor or Color3.fromRGB(96, 76, 214)
						highlight.OutlineTransparency = 0
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.Parent = adornee
					end)
				end

				local function fn54(arg, arg2)
					pcall(function()
						local v46 = arg:FindFirstChild(arg2)

						if v46 then
							v46:Destroy()
						end
					end)
				end

				wraithEvery("toyEspScan", 1, function()
					local flag13 = false

					if not flag12 then
						flag13 = flag10
					end

					if flag13 then
						pcall(fn52)
					end
				end)

				task.spawn(function()
					Workspace.DescendantAdded:Connect(function(descendant)
						local flag13 = false

						if not flag12 then
							flag13 = flag10
						end

						if not flag13 then
							return
						end
						local parent = descendant.Parent
						if not parent then
							return
						end
						local parent2 = parent.Parent
						if not (parent2 and tostring(parent2.Name):match("SpawnedInToys")) then
							return
						end

						task.defer(function()
							pcall(fn52)
						end)
					end)

					Workspace.ChildAdded:Connect(function(child)
						if not tostring(child.Name):match("SpawnedInToys") then
							return
						end

						child.ChildAdded:Connect(function(child2)
							local flag13 = false

							if not flag12 then
								flag13 = flag10
							end

							if not flag13 then
								return
							end

							pcall(function()
								child2:GetPropertyChangedSignal("Name"):Connect(function()
									task.defer(function()
										pcall(fn52)
									end)
								end)
							end)

							task.defer(function()
								pcall(fn52)
							end)
						end)
					end)

					for _, child in pairs(Workspace:GetChildren()) do
						if tostring(child.Name):match("SpawnedInToys") then
							child.ChildAdded:Connect(function(child2)
								local flag13 = false

								if not flag12 then
									flag13 = flag10
								end

								if not flag13 then
									return
								end

								pcall(function()
									child2:GetPropertyChangedSignal("Name"):Connect(function()
										task.defer(function()
											pcall(fn52)
										end)
									end)
								end)

								task.defer(function()
									pcall(fn52)
								end)
							end)
						end
					end
				end)

				ag2Active = false
				ag2Task = nil
				brkhsDone = false
				fbexpConn = nil
				antiAimOn = false
				antiAimMode = "Fake Lag"
				aaJitterYaw = 0
				aaFrame = 0
				wraithKickMarks = wraithKickMarks or {}
				claimNotifyCd = 0
				ag2GuardConns = ag2GuardConns or {}
				local v46 = nil

				ag2Stop = function()
					for _, v47 in pairs(ag2GuardConns) do
						pcall(function()
							v47:Disconnect()
						end)
					end

					ag2GuardConns = {}

					if v46 then
						pcall(function()
							v46:Disconnect()
						end)

						v46 = nil
					end

					for _, child in pairs(Workspace:GetChildren()) do
						if child.Name:match("SpawnedInToys") then
							local instrumentWoodwindOcarina = child:FindFirstChild("InstrumentWoodwindOcarina")

							if instrumentWoodwindOcarina then
								pcall(function()
									if ReplicatedStorage_.MenuToys and ReplicatedStorage_.MenuToys.DestroyToy then
										ReplicatedStorage_.MenuToys.DestroyToy:FireServer(instrumentWoodwindOcarina)
									end
								end)
							end
						end
					end
				end

				ag2Loop = function()
					local now2 = nil
					local name = nil
					local instrumentWoodwindOcarina

					while ag2Active do
						pcall(function()
							for _, child in pairs(Workspace.Plots:GetChildren()) do
								pcall(function()
									for _, child2 in pairs(child.PlotSign.ThisPlotsOwners:GetChildren()) do
										if child2.Value == localPlayer.Name then
											name = child.Name
										end
									end
								end)

								pcall(function()
									for _, child2 in pairs(child.PlotSign:GetChildren()) do
										if child2.Name == "Sign" then
											if child2.Screen.SurfaceGui.Frame.Visible and child2.Screen.SurfaceGui.Frame.PlayerDisplayName.Text == localPlayer.DisplayName then
												name = child.Name
											end
										end
									end
								end)
							end

							local v47 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							instrumentWoodwindOcarina = v47 and v47:FindFirstChild("InstrumentWoodwindOcarina") or name and Workspace.PlotItems:FindFirstChild(name) and Workspace.PlotItems[name]:FindFirstChild("InstrumentWoodwindOcarina")

							if instrumentWoodwindOcarina then
								if localPlayer.Character then
									for _, child in pairs(localPlayer.Character:GetChildren()) do
										local flag13 = child:FindFirstChild("PartOwner") and child.PartOwner.Value ~= ""

										if flag13 then
											local name2 = localPlayer.Name
											flag13 = tostring(child.PartOwner.Value) ~= name2
										end

										if flag13 then
											if instrumentWoodwindOcarina:FindFirstChild("HoldPart") and instrumentWoodwindOcarina.HoldPart:FindFirstChild("HoldItemRemoteFunction") then
												task.spawn(function()
													pcall(function()
														instrumentWoodwindOcarina.HoldPart.HoldItemRemoteFunction:InvokeServer(instrumentWoodwindOcarina, localPlayer.Character)
													end)
												end)

												pcall(function()
													ReplicatedStorage_.MenuToys.DestroyToy:FireServer(instrumentWoodwindOcarina)
												end)

												local humanoid = localPlayer.Character:FindFirstChild("Humanoid")

												if humanoid then
													humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
													humanoid.AutoRotate = true

													if humanoid.Sit then
														humanoid.Sit = false
													end
												end

												pcall(function()
													child.PartOwner.Value = ""
												end)
											end
										end
									end
								end
							else
								if localPlayer.Character and localPlayer:FindFirstChild("CanSpawnToy") and localPlayer.CanSpawnToy.Value and not now2 then
									now2 = tick()

									task.spawn(function()
										pcall(function()
											ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("InstrumentWoodwindOcarina", CFrame.new(100000, 100000, 100000), Vector3.zero)
										end)
									end)
								elseif now2 and tick() - now2 > 1 then
									local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

									if not (v48 and v48:FindFirstChild("InstrumentWoodwindOcarina")) then
										now2 = nil
									end
								end

								local flag13 = false

								if localPlayer.Character then
									for _, child in pairs(localPlayer.Character:GetChildren()) do
										local flag14 = child:FindFirstChild("PartOwner") and child.PartOwner.Value ~= ""

										if flag14 then
											local name2 = localPlayer.Name
											flag14 = tostring(child.PartOwner.Value) ~= name2
										end

										if flag14 then
											flag13 = true
										end
									end
								end

								if flag13 then
									pcall(function()
										ReplicatedStorage_.CharacterEvents.Struggle:FireServer(localPlayer)
									end)

									local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
									local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")

									if humanoid and humanoidRootPart then
										pcall(function()
											ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 1e-11)
										end)

										pcall(function()
											for _, v48 in ipairs(humanoid:GetPlayingAnimationTracks()) do
												if v48.Animation.AnimationId == "rbxassetid://7047322890" then
													v48:Stop()
												end
											end
										end)
									end
								end
							end

							local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")

							if humanoid and ag2Active then
								pcall(function()
									for _, v48 in ipairs(humanoid:GetPlayingAnimationTracks()) do
										if v48.Animation.AnimationId == "rbxassetid://7047322890" then
											v48:Stop()
										end
									end
								end)
							end
						end)

						task.wait()
					end
				end

				ffActive = false
				ffColor = Color3.fromRGB(96, 76, 214)

				fn46 = function(adornee)
					if not adornee then
						return
					end
					local wraithForceField = adornee:FindFirstChild("WraithForceField")

					if wraithForceField then
						wraithForceField:Destroy()
					end

					if ffActive then
						local highlight = Instance.new("Highlight")
						highlight.Name = "WraithForceField"
						highlight.Adornee = adornee
						highlight.FillColor = ffColor
						highlight.FillTransparency = 0.45
						highlight.OutlineColor = ffColor
						highlight.OutlineTransparency = 0
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.Parent = adornee
					end
				end

				fn52 = function()
					local function fn55(arg, arg2)
						local flag13 = false

						if flag12 then
							flag13 = fn51(arg.Name)
						end

						local flag14

						if flag13 then
							flag14 = not flag11 or not arg2
						else
							flag14 = flag13
						end

						if flag14 then
							fn53(arg, "WraithToyESP", color, color)
						else
							fn54(arg, "WraithToyESP")
						end

						if flag10 and (arg.Name == "CreatureBlobman" or arg.Name == "Gucci") then
							fn53(arg, "WraithBlobESP", blobEspColor, blobEspColor)
						else
							fn54(arg, "WraithBlobESP")
						end
					end

					for _, child in pairs(Workspace:GetChildren()) do
						if tostring(child.Name):match("SpawnedInToys") then
							local flag13 = child.Name == localPlayer.Name .. "SpawnedInToys"

							for _, child2 in pairs(child:GetChildren()) do
								fn55(child2, flag13)
							end
						end
					end

					local plotItems = Workspace:FindFirstChild("PlotItems")

					if plotItems then
						for _, child in pairs(plotItems:GetChildren()) do
							for _, child2 in pairs(child:GetChildren()) do
								fn55(child2, false)
							end
						end
					end
				end
			end

			local flag11 = false
			local tbl6 = {}

			fn47 = function()
				if flag11 then
					return
				end
				flag11 = true
				local cFrame = nil
				local n25 = 0
				local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
				local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")
				local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")
				local health = nil
				local n26 = 0
				local n27 = 0

				local function fn51(arg)
					pcall(function()
						local v46 = arg
						local humanoid

						if arg then
							humanoid = arg:FindFirstChildOfClass("Humanoid")
						else
							humanoid = v46
						end

						if not humanoid then
							return
						end

						if tbl6.health then
							pcall(function()
								tbl6.health:Disconnect()
							end)

							tbl6.health = nil
						end

						tbl6.health = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
							if not flag11 then
								return
							end
							local health2 = humanoid.Health

							if health2 and health2 > 0 and health2 < humanoid.MaxHealth then
								pcall(function()
									humanoid.Health = humanoid.MaxHealth
								end)
							end
						end)
					end)
				end

				fn51(localPlayer.Character)

				tbl6.hb = RunService.Heartbeat:Connect(function()
					local v46, v47, v48 = fn11()
					if not (v47 and v48) then
						health = nil
						return
					end
					local v49 = fn12(v46)

					if v49 then
						pcall(function()
							struggle:FireServer(localPlayer)
						end)

						pcall(function()
							ragdollRemote:FireServer(v48, 0)
						end)
					end

					local ragdolled = v47:FindFirstChild("Ragdolled")

					if ragdolled and ragdolled.Value or v47.PlatformStand then
						pcall(function()
							ragdollRemote:FireServer(v48, 0)
						end)

						pcall(function()
							struggle:FireServer(localPlayer)
						end)

						pcall(function()
							v47.PlatformStand = false
						end)
					end

					local now2 = tick()

					if health == nil then
						health = v47.Health
						n26 = now2
					elseif now2 - n26 >= 1.5 then
						if health - v47.Health >= 10 and (v49 or ragdolled and ragdolled.Value or v47.PlatformStand) and now2 - n27 > 2 then
							n27 = now2
							local n28 = cFrame
							local flag12 = not n28

							if flag12 then
								pcall(function()
									local plotItems = Workspace:FindFirstChild("PlotItems")
									plotItems = plotItems and plotItems:FindFirstChild("PlayersInPlots")

									if plotItems and plotItems:FindFirstChild(localPlayer.Name) then
										local plots = Workspace:FindFirstChild("Plots")

										if plots then
											for _, child in pairs(plots:GetChildren()) do
												local plotSign = child:FindFirstChild("PlotSign")
												plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

												if plotSign then
													for _, child2 in pairs(plotSign:GetChildren()) do
														if child2.Value == localPlayer.Name then
															local plotBarrier = child:FindFirstChild("Barrier") and child.Barrier:FindFirstChild("PlotBarrier")

															if plotBarrier and plotBarrier:IsA("BasePart") then
																n28 = plotBarrier.CFrame * CFrame.new(0, 6, 0)
															end
														end
													end
												end
											end
										end
									end
								end)
							end

							if flag12 then
								local spawnLocation = Workspace:FindFirstChild("SpawnLocation")

								if spawnLocation then
									n28 = spawnLocation.CFrame * CFrame.new(0, 5, 0)
								end
							end

							if n28 then
								pcall(function()
									v48.CFrame = n28 + Vector3.new(0, 2, 0)
									v48.AssemblyLinearVelocity = Vector3.zero
									v48.AssemblyAngularVelocity = Vector3.zero
								end)

								pcall(function()
									ragdollRemote:FireServer(v48, 0)
								end)

								pcall(function()
									struggle:FireServer(localPlayer)
								end)
							end
						end

						health = v47.Health
						n26 = now2
					end

					local position = v48.Position

					if (position.Y < -20 or position.Y > 4000 or math.abs(position.X) > 5000 or math.abs(position.Z) > 5000) and cFrame then
						pcall(function()
							v48.CFrame = cFrame + Vector3.new(0, 2, 0)
							v48.AssemblyLinearVelocity = Vector3.zero
							v48.AssemblyAngularVelocity = Vector3.zero
							v47.PlatformStand = false
						end)

						pcall(function()
							ragdollRemote:FireServer(v48, 0)
						end)

						pcall(function()
							struggle:FireServer(localPlayer)
						end)
					end

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer and player.Character then
							local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart and humanoidRootPart.Position.Y < v48.Position.Y and math.abs(humanoidRootPart.Position.X - v48.Position.X) < 6 and math.abs(humanoidRootPart.Position.Z - v48.Position.Z) < 6 and (v48.AssemblyLinearVelocity.Magnitude > 120 or fn12(v46)) then
								pcall(function()
									v48.Anchored = true
									v48.AssemblyLinearVelocity = Vector3.zero
									v48.AssemblyAngularVelocity = Vector3.zero
								end)

								pcall(function()
									struggle:FireServer(localPlayer)
								end)

								task.delay(0.5, function()
									pcall(function()
										if v48.Parent then
											v48.Anchored = false
										end
									end)
								end)

								break
							end
						end
					end

					local now3 = tick()

					if now3 - n25 > 0.5 then
						n25 = now3

						local ok, result = pcall(function()
							return not v49 and v47.FloorMaterial ~= Enum.Material.Air and v48.AssemblyLinearVelocity.Magnitude < 120 and v48.Position.Y > -5
						end)

						if ok and result then
							cFrame = v48.CFrame
						end
					end
				end)

				tbl6.ca = localPlayer.CharacterAdded:Connect(function(character)
					task.wait(0.3)
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						cFrame = humanoidRootPart.CFrame
					end

					fn51(character)
				end)
			end

			fn48 = function()
				flag11 = false

				for _, v46 in pairs(tbl6) do
					pcall(function()
						v46:Disconnect()
					end)
				end

				tbl6 = {}
			end

			local tbl7 = { real = nil, conns = {}, anchor = nil, hold = 0 }

			local function fn51()
				if not tbl7.real then
					return
				end
				local real = tbl7.real
				tbl7.real = nil
				local v46, v47, v48 = fn11()

				if v48 then
					pcall(function()
						v48.CFrame = real
					end)
				end
			end

			fakeLagFrames = fakeLagFrames or 4

			wraithAntiAimStop = function()
				for k, conn in pairs(tbl7.conns) do
					pcall(function()
						conn:Disconnect()
					end)

					tbl7.conns[k] = nil
				end

				fn51()
				tbl7.anchor = nil
				tbl7.hold = 0
			end

			wraithAntiAimStart = function()
				wraithAntiAimStop()
				tbl7.hold = 0

				tbl7.conns.step = RunService.Stepped:Connect(function()
					if not antiAimOn then
						return
					end
					local v46, v47, v48 = fn11()
					if not (v46 and v47 and v48) then
						tbl7.real = nil
						return
					end

					if v47.SeatPart then
						tbl7.real = nil
						return
					end

					if antiAimMode == "Aim Nearest" then
						tbl7.real = nil
						local v49 = fn13() or fn15()
						local humanoidRootPart = v49 and v49.Character and v49.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local vector = Vector3.new(humanoidRootPart.Position.X - v48.Position.X, 0, humanoidRootPart.Position.Z - v48.Position.Z)

							if vector.Magnitude > 0.1 then
								pcall(function()
									v48.CFrame = CFrame.new(v48.Position, v48.Position + vector)
								end)
							end
						end

						return
					end

					if v47.PlatformStand or v48.AssemblyLinearVelocity.Magnitude > 90 then
						tbl7.real = nil
						tbl7.hold = 0
						return
					end

					local n25 = math.clamp(math.floor(fakeLagFrames or 4), 1, 20)

					if not tbl7.anchor then
						tbl7.anchor = v48.CFrame
					end

					if (v48.Position - tbl7.anchor.Position).Magnitude > 25 then
						tbl7.anchor = v48.CFrame
						tbl7.hold = 0
						tbl7.real = nil
						return
					end

					tbl7.hold = tbl7.hold + 1

					if n25 <= tbl7.hold then
						tbl7.hold = 0
						tbl7.anchor = v48.CFrame
						tbl7.real = nil
						return
					end

					tbl7.real = v48.CFrame

					pcall(function()
						v48.CFrame = tbl7.anchor
					end)
				end)

				tbl7.conns.hb = RunService.Heartbeat:Connect(fn51)

				tbl7.conns.spawn = localPlayer.CharacterAdded:Connect(function()
					tbl7.real = nil
					tbl7.anchor = nil
					tbl7.hold = 0
				end)
			end

			Players.PlayerRemoving:Connect(function(player)
				local v46 = wraithKickMarks and wraithKickMarks[player.Name]

				if v46 and tick() - v46 < 45 then
					fn10("kick notify", player.Name .. " left the server (kicked)")
				end
			end)

			local v46 = v16:AddTab({ Icon = "rbxassetid://9405923687", Name = "main" })
			v16:AddTabLabel("COMBAT")
			v37 = v16:AddTab({ Icon = "rbxassetid://71309430456016", Name = "defense" })
			v38 = v16:AddTab({ Icon = "rbxassetid://139650104834071", Name = "target" })
			tabGrabs = v16:AddTab({ Icon = "rbxassetid://130473583552143", Name = "grabs" })
			v16:AddTabLabel("CLIENT")
			v39 = v16:AddTab({ Icon = "rbxassetid://123652566388954", Name = "movement" })
			v17 = v16:AddTab({ Icon = "rbxassetid://78134819718605", Name = "visuals" })
			v40 = v16:AddTab({ Icon = "rbxassetid://103941960626826", Name = "world" })
			v41 = v16:AddTab({ Icon = "rbxassetid://7059338404", Name = "audio" })
			v16:AddTabLabel("SYSTEM")
			v42 = v16:AddTab({ Icon = "rbxassetid://9692125126", Name = "server" })
			v18 = v16:AddTab({ Icon = "rbxassetid://5832745500", Name = "misc" })
			tabToys = v16:AddTab({ Icon = "rbxassetid://129082556946713", Name = "toys" })
			v19 = v16:AddTab({ Icon = "rbxassetid://17132521951", Name = "character" })
			v20 = v16:AddTab({ Icon = "rbxassetid://97636968119461", Name = "settings" })
			v43 = v46:AddSection({ Name = "PROFILE", Position = "left" })
			v44 = v46:AddSection({ Name = "CONTROLS", Position = "right" })
			v45 = v46:AddSection({ Name = "STATISTICS", Position = "right" })
		end

		statsKicked = 0
		tick()

		do
			local v46 = v45:AddLabel("kicked: 0")
			local v47 = v45:AddLabel("time: --:--:--")
			local v48 = v45:AddLabel("players: 0")
			v45:AddLabel("version: v1.0")
			wraithNotifyToggles = true

			wraithFlagNames = {
				AntiAim = "Anti Aim",
				AntiBananaSit = "Anti Banana Sit",
				AntiBananaSrc = "Anti Banana",
				AntiBlobman = "Anti Blobman",
				AntiBombRemote = "Anti Bomb",
				AntiBurnV2 = "Anti Burn",
				AntiDesync = "Anti Desync",
				AntiExplosion = "Anti Explosion",
				AntiFling = "Anti Fling",
				AntiInvis = "Anti Invis",
				AntiKickESP = "Anti Kick ESP",
				AntiKickESPEnemies = "Anti Kick ESP: enemies only",
				AntiKickHL = "Anti Kick ESP",
				AntiKickSrc = "Anti Kick",
				AntiLagBeams = "Anti Lag",
				AntiLoopKill = "Anti Loop Kill",
				AntiPaint = "Anti Paint",
				AntiPalletRagdoll = "Anti Pallet Ragdoll",
				AntiRagdollBlob = "Anti Ragdoll on Blob",
				AntiSnowball = "Anti Snowball",
				AntiSnowballV2 = "Anti Snowball v2",
				AntiSticky = "Anti Sticky",
				AntiVoid = "Anti Void",
				AutoAntiLag = "Auto Anti Lag",
				AutoBreakPCLD = "Auto Break PCLD",
				AutoExplosionToggle = "Loop Explode",
				AutoLeaveAntiBan = "Auto Leave",
				BlackholeHide = "Hide Blackhole on Detect",
				BlobmanESP = "Blobman ESP",
				BoxESP = "Box ESP",
				BringAllMode = "Bring All",
				BringHoldLoop = "Bring Holdables Loop",
				BypassRagdollTarget = "Ragdoll Target",
				ClaimPlot = "Claim Plot Toggle",
				CombatItemsESP = "Combat Items ESP",
				CombatItemsNames = "Combat Items Names",
				CounterAttackSrc = "Counter Attack",
				CounterAttacks = "Counter Attacks",
				CustomBlackholes = "Image Blackholes",
				DreamyNightShader = "Dreamy Night Shader",
				DualAuraWhitelist = "Whitelist Friends: Dual Aura",
				DualHandKickAura = "Dual Hand Kick Aura",
				DustEffect = "Dust Effect",
				ExpPredict = "Predict Movement",
				FakeLag = "Fake Lag",
				FarmSlots = "Farm Coins",
				FlyingReset = "Flying Reset",
				ForceField = "Self ESP",
				FreeCam = "Free Cam",
				Fullbright = "Fullbright",
				G_LoopGrab = "Loop Grab",
				G_Master = "Enable Grabs",
				GoToHome = "Go To Home",
				GrabLineColors = "Line Colors",
				GrabLineRainbow = "Line Rainbow",
				GrabSound = "Grab Sound",
				GucciAntiGrabSrc = "Gucci Anti Grab",
				InputLagTarget = "Input Lag Target",
				JerkOff = "Jerk Off",
				JoinAntiLag = "Join With Anti Lag",
				JumpCircle = "Jump Circle",
				KickAura1Hand = "Kick Aura 1 Hand",
				KickAura1Whitelist = "Whitelist Friends: Aura 1H",
				KickNotify = "Notify on Kick",
				KickSound = "Kick Sound",
				KillDodge = "Kill Dodge",
				LimbAutoRagdoll = "Auto Ragdoll Target",
				LoopBananaRagdoll = "Loop Banana Ragdoll",
				LoopMethod = "Loop Method",
				LoopTP = "Loop TP",
				NickBg = "Nick Background",
				NickStroke = "Nick Extras",
				NicknameESP = "Nickname ESP",
				NoBarrier = "No Barrier Collision",
				NoRagdollBlur = "Disable Ragdoll Blur",
				NotifEnabled = "Notifications Enabled",
				OceanColorOn = "Custom Ocean Color",
				PCLD = "PCLD ESP",
				PacketLagDetector = "Packet Lag Detector",
				PaleFrostShader = "Pale Frost Shader",
				Pencil = "pencil",
				RagdollPlayer = "Ragdoll Player",
				RagdollSound = "Ragdoll Sound",
				RealisticWater = "Realistic Water",
				RemoveAntiKick = "Remove Anti Kick",
				ResetBindOn = "Reset Bind",
				SafeMove = "Safe Move",
				ServerPosESP = "Server Position ESP",
				SkeletonESP = "Skeleton ESP",
				SmoothCam = "Smooth Camera",
				Snow = "Snow",
				SnowballRagdoll = "Snowball Ragdoll",
				Spectate = "Server Position ESP",
				TargetNotify = "Target Join/Leave Notify",
				TelekinesisAura = "Telekinesis Aura",
				TelekinesisShield = "Telekinesis Shield",
				Teleport = "Teleport Binder",
				ThirdPerson = "Third Person",
				TokyowamiShaders = "Tokyowami Shaders",
				ToyOrbitAura = "Toy Orbit",
				TraceHitmarker = "Trace Hitmarker",
				TraceRainbow = "Trace Rainbow",
				TraceToTarget = "Trace to Target",
				WR10 = "Spin",
				WR13 = "Infinite Jump",
				WR14 = "China Hat",
				WR16 = "Hat Rainbow",
				WR18 = "Trail",
				WR21 = "Trail Gradient",
				WR22 = "Trail Rainbow",
				WR26 = "Auto Delete Legs",
				WR27 = "Anti Grab",
				WR29 = "Anti Own",
				WR32 = "Line Rainbow",
				WR34 = "Anti Kick",
				WR36 = "Anti Input",
				WR41 = "L",
				WR43 = "PCLD ESP Soft",
				WR50 = "Packet Lag (stealth)",
				WR52 = "Server Lag Line",
				WaterWalk = "Water Walk",
				WhitelistFriends = "Whitelist Friends",
			}

			wraithFlagLabel = function(arg)
				return wraithFlagNames[arg] or arg
			end

			local function fn51(arg, arg2)
				pcall(function()
					if not arg then
						return
					end
					local textLabel

					if arg.Root and arg.Root.FindFirstChildOfClass then
						textLabel = arg.Root:FindFirstChildOfClass("TextLabel")
					else
						textLabel = nil

						if type(arg) == "userdata" then
							textLabel = arg
						end
					end

					if textLabel then
						textLabel.Text = tostring(arg2)
					end
				end)
			end

			task.spawn(function()
				while true do
					task.wait(1)

					pcall(function()
						fn51(v47, "time: " .. os.date("%H:%M:%S"))
						fn51(v46, "kicked: " .. tostring(statsKicked or 0))
						fn51(v48, "players: " .. tostring(#Players:GetPlayers()))
					end)
				end
			end)
		end

		v44:AddLabel("close menu key"):AddKeybind({
			Default = "RightControl",
			Flag = "WRMenuKey",
			Callback = function(arg)
				if arg then
					pcall(function()
						v16:ToggleInterface()
					end)
				end
			end,
		})

		joinAntiLagFile = "autoexec/anti lag.lua"
		joinAntiLagState = "wraith_join_antilag.txt"
		_jm = v44:AddLabel("Join With Anti Lag")

		_jmT = _jm:AddToggle({
			Default = false,
			Flag = "JoinAntiLag",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("JoinAntiLag") or "JoinAntiLag") .. ": " .. (arg and "on" or "off"))
					end
				end)

				pcall(function()
					if arg then
						if writefile then
							writefile(joinAntiLagFile, [[local FTAP_PLACES = { [6961824067] = true }
if not FTAP_PLACES[game.PlaceId] then
    return
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LP = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
if not LP then return end
if not game:IsLoaded() then game.Loaded:Wait() end

local function killBeamScripts()
    pcall(function()
        for _, sc in pairs(LP.PlayerScripts:GetChildren()) do
            if sc:IsA("LocalScript") then
                local nm = sc.Name
                if nm == "CharacterAndBeamMove" or nm:find("Beam") or nm:find("GrabLine") or (nm:find("Character") and nm:find("Move")) then
                    sc.Disabled = true
                end
            end
        end
    end)
end

local function killGrabParts()
    pcall(function()
        for _, plr in pairs(Players:GetPlayers()) do
            local ch = plr.Character
            local gp = ch and ch:FindFirstChild("GrabParts")
            if gp then gp:Destroy() end
        end
    end)
end

pcall(function()
    Lighting.GlobalShadows = false
    Lighting.ShadowSoftness = 0
    Lighting.FogEnd = 1e6
    if settings and settings() then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end)

killBeamScripts()
killGrabParts()

LP.CharacterAdded:Connect(function()
    task.wait(0.5)
    killBeamScripts()
    killGrabParts()
end)

task.spawn(function()
    while task.wait(1) do
        if not FTAP_PLACES[game.PlaceId] then break end
        killBeamScripts()
        killGrabParts()
    end
end)
]])
						end

						if writefile then
							writefile(joinAntiLagState, "1")
						end

						fn10("wraith", "anti lag.lua записан в autoexec")
					else
						if delfile and isfile and isfile(joinAntiLagFile) then
							delfile(joinAntiLagFile)
						end

						if writefile then
							writefile(joinAntiLagState, "0")
						end

						fn10("wraith", "anti lag.lua удалён")
					end
				end)
			end,
		})

		pcall(function()
			local flag11

			if isfile and isfile(joinAntiLagState) and readfile then
				flag11 = readfile(joinAntiLagState) == "1"
			else
				local v46 = isfile and isfile(joinAntiLagFile)
				flag11 = false

				if v46 then
					flag11 = true
				end
			end

			if flag11 and _jmT and _jmT.SetValue then
				_jmT:SetValue(true)
			end
		end)

		v44:AddButton({
			Name = "Reconnect",
			Callback = function()
				pcall(function()
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
				end)
			end,
		})

		v44:AddButton({
			Name = "Unload",
			Callback = function()
				pcall(function()
					lib:Unload()
				end)
			end,
		})

		v43:AddImage({ Image = lib.UserProfile, Size = UDim2.new(1, -16, 0, 170) })
		v43:AddLabel("Thanks for buying")
		v43:AddColoredLabel("WRAITH", Color3.fromRGB(138, 116, 255))
		v43:AddLabel("---------------------------------------")

		do
			local str6 = "?"

			task.spawn(function()
				pcall(function()
					local friendsAsync = Players:GetFriendsAsync(localPlayer.UserId)
					local n25 = 0

					while true do
						for i in ipairs(friendsAsync:GetCurrentPage()) do
							n25 += 1
						end

						if not friendsAsync.IsFinished then
							friendsAsync:AdvanceToNextPageAsync()
							continue
						end
						break
					end

					str6 = tostring(n25)
				end)
			end)

			v43:AddLabel("user: " .. localPlayer.Name)
			v43:AddLabel("display: " .. localPlayer.DisplayName)
			v43:AddLabel("id: " .. tostring(localPlayer.UserId))
			local v46 = v43:AddLabel("friends: ...")

			task.delay(3, function()
				pcall(function()
					v46:SetText("friends: " .. tostring(str6))
				end)
			end)
		end

		v43:AddLabel("account age: " .. tostring(localPlayer.AccountAge) .. "d")

		task.delay(2.5, function()
			pcall(function()
				fn10("wraith hvh", "welcome, " .. localPlayer.DisplayName .. " — good luck")
			end)
		end)

		v21 = v37:AddSection({ Name = "DEFENSE", Position = "left" })
		v22 = v37:AddSection({ Name = "RESCUE", Position = "left" })
		v23 = v37:AddSection({ Name = "EXTRA DEFENSE", Position = "right" })
		lagDef = v37:AddSection({ Name = "ANTI LAG", Position = "right" })
		antiOwnGroup = v37:AddSection({ Name = "ANTI OWN", Position = "right" })
		antiKickGroup = v37:AddSection({ Name = "ANTI KICK", Position = "right" })
		antiInputGroup = v37:AddSection({ Name = "ANTI INPUT", Position = "right" })
		gucciGroup = v37:AddSection({ Name = "GUCCI", Position = "right" })
		counterGroup = v37:AddSection({ Name = "COUNTER ATTACK", Position = "right" })
		v24 = v37:AddSection({ Name = "ADVANCED", Position = "right" })
		v25 = v38:AddSection({ Name = "TARGET SELECTION", Position = "left" })
		v26 = v38:AddSection({ Name = "KICK METHODS", Position = "right" })

		targetDropdown = v25:AddLabel("Target Player"):AddDropdown({
			Values = fn14(),
			Default = "",
			Flag = "TargetPlayer",
			Callback = function(arg)
				local tbl6 = {}

				if type(arg) == "table" then
					for k, v46 in pairs(arg) do
						if v46 then
							tbl6[#tbl6 + 1] = tostring(k):match("%((.+)%)%s*$") or tostring(k)
						end
					end

					table.sort(tbl6)
				elseif type(arg) == "string" and arg ~= "" then
					tbl6[1] = arg:match("%((.+)%)%s*$") or arg
				end

				wraithMulti = tbl6

				if #tbl6 > 0 then
					targetName = tbl6[1]
				end
			end,
		})

		wraithMulti = wraithMulti or {}
		wraithMultiIdx = 0

		wraithMultiNext = function()
			if #wraithMulti == 0 then
				return nil
			end

			for i = 1, #wraithMulti do
				wraithMultiIdx = wraithMultiIdx % #wraithMulti + 1
				local v46 = Players:FindFirstChild(wraithMulti[wraithMultiIdx])
				if v46 and v46 ~= localPlayer and v46.Character then
					return v46
				end
			end

			return nil
		end

		v25:AddButton({
			Name = "Refresh List",
			Callback = function()
				fn17("refresh_list", function()
					local v46 = fn14()

					if targetDropdown and type(targetDropdown.SetValues) == "function" then
						targetDropdown:SetValues(v46)
					end
				end)
			end,
		})

		wraithFriends = wraithFriends or {}

		do
			local function fn51()
				pcall(function()
					local ok, result = pcall(function()
						return localPlayer:GetFriendsOnline(true)
					end)

					if ok and type(result) == "table" then
						local whitelistedFriends = 0

						for _, v46 in ipairs(result) do
							local flag11 = type(v46) == "string" and v46
							local str6

							if flag11 then
								str6 = flag11
							else
								local flag12 = type(v46) == "table"

								if flag12 then
									str6 = tostring(v46.Name or "")
								else
									str6 = flag12
								end

								str6 = str6 or ""
							end

							if str6 ~= "" then
								wraithFriends[str6:lower()] = true
								whitelistedFriends += 1
							end
						end

						fn10("wraith", "whitelisted friends: " .. whitelistedFriends)
					end
				end)
			end

			whitelistFriendsOn = false
			local tbl6 = {}

			fn24 = function(arg)
				if not arg or arg == localPlayer then
					return false
				end
				local flag11 = wraithFriends

				if flag11 then
					flag11 = wraithFriends[arg.Name:lower()] == true

					if not flag11 then
						flag11 = wraithFriends[tostring(arg.DisplayName):lower()] == true
					end
				end

				if flag11 then
					return true
				end

				if not whitelistFriendsOn then
					return false
				end
				local flag12 = tbl6[arg.UserId]

				if flag12 == nil then
					flag12 = false

					pcall(function()
						flag12 = localPlayer:IsFriendsWith(arg.UserId)
					end)

					tbl6[arg.UserId] = flag12
				end

				return flag12
			end

			v25:AddLabel("Whitelist Friends"):AddToggle({
				Flag = "WhitelistFriends",
				Default = false,
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WhitelistFriends") or "WhitelistFriends") .. ": " .. (arg and "on" or "off"))
						end
					end)

					wraithFriends = wraithFriends or {}
					whitelistFriendsOn = arg and true or false
					tbl6 = {}

					if arg then
						fn51()
						fn10("wraith", "whitelist: all friends protected")
					else
						wraithFriends = {}
						fn10("wraith", "whitelist cleared")
					end
				end,
			})
		end

		v25:AddButton({
			Name = "Target Nearest Player",
			Callback = function()
				fn17("target_nearest", function()
					local v46 = fn13()

					if v46 then
						targetName = v46.Name
						fn10("wraith", "target: " .. v46.Name)
					else
						fn10("wraith", "no players found")
					end
				end)
			end,
		})

		do
			local Method = v26:AddLabel("Method")
			local v46 = nil
			local v47 = nil
			local v48 = nil
			local v49 = nil
			local v50 = nil
			inputLagTargetOn = false
			bypassRagdollTarget = false
			local v51 = nil

			methodDropdown = Method:AddDropdown({
				Values = {
					"Ragdoll Kick",
					"Bypass Kick",
					"Pallet Ragdoll",
					"Loop Kill",
					"Bring",
					"Lock",
					"Fling Target",
					"Input Lag",
					"Kick",
					"Loop Grab Kick",
					"Kick All",
					"Blob Kill",
					"Remove Gucci",
				},
				Default = "Ragdoll Kick",
				Flag = "KickMethod",
				Callback = function(arg)
					str5 = arg

					if v46 then
						pcall(function()
							v46:SetVisible(arg == "Ragdoll Kick")
						end)
					end

					if v47 then
						pcall(function()
							v47:SetVisible(arg == "Bypass Kick")
						end)
					end

					if v48 then
						pcall(function()
							v48:SetVisible(arg == "Bypass Kick" or arg == "Loop Grab Kick")
						end)
					end

					if v49 then
						pcall(function()
							v49:SetVisible(arg == "Bypass Kick" or arg == "Loop Grab Kick")
						end)
					end

					if v50 then
						pcall(function()
							v50:SetVisible(arg == "Bring")
						end)
					end

					if v51 then
						pcall(function()
							v51:SetVisible(arg == "Loop Grab Kick")
						end)
					end
				end,
			})

			ragdollMode = "Normal"
			ragdollHoldMode = "Drone"
			v46 = v26:AddLabel("Ragdoll Kick Mode")

			v46:AddDropdown({
				Values = { "Normal", "Super Fast", "Ownership" },
				Default = "Normal",
				Flag = "RagdollMode",
				Callback = function(arg)
					ragdollMode = arg
				end,
			})

			v47 = v26:AddLabel("Bypass Grab Mode")

			v47:AddDropdown({
				Values = { "Grab-Drop", "Grab-Release" },
				Default = "Grab-Drop",
				Flag = "LoopGrabMode",
				Callback = function(arg)
					bypassGrabMode = arg
				end,
			})

			v48 = v26:AddLabel("Input Lag Target")

			v48:AddToggle({
				Default = false,
				Flag = "InputLagTarget",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("InputLagTarget") or "InputLagTarget") .. ": " .. (arg and "on" or "off"))
						end
					end)

					inputLagTargetOn = arg
				end,
			})

			bringAllOn = false
			v50 = v26:AddLabel("Bring All")

			v50:AddToggle({
				Default = false,
				Flag = "BringAllMode",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("BringAllMode") or "BringAllMode") .. ": " .. (arg and "on" or "off"))
						end
					end)

					bringAllOn = arg

					if arg then
						wraithBringAllRun(false)
					else
						wraithBringAllBusy = false
					end
				end,
			})

			v49 = v26:AddLabel("Ragdoll Target")

			v49:AddToggle({
				Default = false,
				Flag = "BypassRagdollTarget",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("BypassRagdollTarget") or "BypassRagdollTarget") .. ": " .. (arg and "on" or "off"))
						end
					end)

					bypassRagdollTarget = arg
				end,
			})

			v51 = v26:AddLabel("Loop Grab Lock Height")

			v51:AddSlider({
				Flag = "LoopGrabHeight",
				Min = 0,
				Max = 50,
				Default = 23,
				Rounding = 0,
				Callback = function(arg)
					loopGrabHeight = arg
				end,
			})

			pcall(function()
				local str6 = methodDropdown and methodDropdown:GetValue() or "Ragdoll Kick"
				v46:SetVisible(str6 == "Ragdoll Kick")
				v47:SetVisible(str6 == "Bypass Kick")
				v48:SetVisible(str6 == "Bypass Kick" or str6 == "Loop Grab Kick")
				v49:SetVisible(str6 == "Bypass Kick" or str6 == "Loop Grab Kick")
				v50:SetVisible(str6 == "Bring")
				v51:SetVisible(str6 == "Loop Grab Kick")
			end)
		end

		v26:AddButton({
			Name = "Apply To Select",
			Callback = function()
				fn17("apply_method", function()
					local v46 = fn15() or fn13()
					if not v46 then
						fn10("wraith", "target not selected (dropdown / text / nearest)")
						return
					end
					targetName = v46.Name
					if fn35() then
						fn10("wraith", "kick busy — Stop All Kicks first")
						return
					end

					if methodDropdown then
						str5 = methodDropdown:GetValue() or str5
					end

					local str6 = " -> " .. v46.Name
					fn10("wraith", "apply: " .. tostring(str5) .. str6)

					fn49(function()
						fn17("kick_run", fn16)
					end)
				end)
			end,
		})

		v26:AddButton({
			Name = "Stop All Kicks",
			Callback = function()
				fn50()
				fn39()
				pcall(wraithBringAllRestore)
			end,
		})

		v26:AddLabel("Loop Method"):AddToggle({
			Default = false,
			Flag = "LoopMethod",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("LoopMethod") or "LoopMethod") .. ": " .. (arg and "on" or "off"))
					end
				end)

				if arg and fn35() then
					fn10("wraith", "kick busy — Stop All Kicks first")
					return
				end
				loopMethodActive = arg

				if arg then
					fn49(function()
						while loopMethodActive do
							fn17("loop_method", fn16)
							task.wait(1.5)
						end
					end)
				end
			end,
		})

		v27 = v38:AddSection({ Name = "AURAS", Position = "left" })
		v28 = v38:AddSection({ Name = "MASS & FOLLOWERS", Position = "right" })
		v29 = v39:AddSection({ Name = "MOVEMENT", Position = "left" })
		v30 = v39:AddSection({ Name = "POSITION", Position = "right" })
		v31 = v17:AddSection({ Name = "ESP", Position = "left" })
		v32 = v17:AddSection({ Name = "CAMERA", Position = "right" })
		v33 = v17:AddSection({ Name = "SHADERS", Position = "right" })
		ReplicatedStorage = ReplicatedStorage or game:GetService("ReplicatedStorage")
		v34 = v40:AddSection({ Name = "WORLD", Position = "left" })
		mapGroup = v40:AddSection({ Name = "MAP", Position = "right" })
		expGroup = tabToys:AddSection({ Name = "AUTO EXPLODE", Position = "left" })
		toyAnchorGroup = tabToys:AddSection({ Name = "ANCHOR OBJECTS", Position = "right" })
		toyBreakGroup = tabToys:AddSection({ Name = "BREAK PARTS", Position = "right" })
		toyOrbitGroup = tabToys:AddSection({ Name = "TOY ORBIT", Position = "left" })
		grabLineGroup = tabGrabs:AddSection({ Name = "LINE", Position = "left" })
		grabToolsGroup = tabGrabs:AddSection({ Name = "GRABS", Position = "right" })
		grabAuraGroup = tabGrabs:AddSection({ Name = "AURAS", Position = "right" })

		do
			local tbl6 = {
				Nebula = {
					Bk = "http://www.roblox.com/asset?id=135207744",
					Dn = "http://www.roblox.com/asset?id=135207662",
					Ft = "http://www.roblox.com/asset?id=135207770",
					Lf = "http://www.roblox.com/asset?id=135207615",
					Rt = "http://www.roblox.com/asset?id=135207695",
					Up = "http://www.roblox.com/asset?id=135207794",
				},
				Storm = {
					Bk = "rbxassetid://15502511288",
					Dn = "rbxassetid://15502508460",
					Ft = "rbxassetid://15502510289",
					Lf = "rbxassetid://15502507918",
					Rt = "rbxassetid://15502509398",
					Up = "rbxassetid://15502511911",
				},
				Sunset = {
					Bk = "rbxassetid://600830446",
					Dn = "rbxassetid://600831635",
					Ft = "rbxassetid://600832720",
					Lf = "rbxassetid://600886090",
					Rt = "rbxassetid://600833862",
					Up = "rbxassetid://600835177",
				},
				["Deep Space"] = {
					Bk = "http://www.roblox.com/asset/?id=159248188",
					Dn = "http://www.roblox.com/asset/?id=159248183",
					Ft = "http://www.roblox.com/asset/?id=159248187",
					Lf = "http://www.roblox.com/asset/?id=159248173",
					Rt = "http://www.roblox.com/asset/?id=159248192",
					Up = "http://www.roblox.com/asset/?id=159248176",
				},
				Crimson = {
					Bk = "http://www.roblox.com/asset/?id=401664839",
					Dn = "http://www.roblox.com/asset/?id=401664862",
					Ft = "http://www.roblox.com/asset/?id=401664960",
					Lf = "http://www.roblox.com/asset/?id=401664881",
					Rt = "http://www.roblox.com/asset/?id=401664901",
					Up = "http://www.roblox.com/asset/?id=401664936",
				},
				Galaxy = {
					Bk = "rbxassetid://15983968922",
					Dn = "rbxassetid://15983966825",
					Ft = "rbxassetid://15983965025",
					Lf = "rbxassetid://15983967420",
					Rt = "rbxassetid://15983966246",
					Up = "rbxassetid://15983964246",
				},
				Blossom = {
					Bk = "http://www.roblox.com/asset/?id=271042516",
					Dn = "http://www.roblox.com/asset/?id=271077243",
					Ft = "http://www.roblox.com/asset/?id=271042556",
					Lf = "http://www.roblox.com/asset/?id=271042310",
					Rt = "http://www.roblox.com/asset/?id=271042467",
					Up = "http://www.roblox.com/asset/?id=271077958",
				},
				Arctic = {
					Bk = "http://www.roblox.com/asset/?id=225469390",
					Dn = "http://www.roblox.com/asset/?id=225469395",
					Ft = "http://www.roblox.com/asset/?id=225469403",
					Lf = "http://www.roblox.com/asset/?id=225469450",
					Rt = "http://www.roblox.com/asset/?id=225469471",
					Up = "http://www.roblox.com/asset/?id=225469481",
				},
				Midnight = {
					Bk = "http://www.roblox.com/asset/?id=12064107",
					Dn = "http://www.roblox.com/asset/?id=12064152",
					Ft = "http://www.roblox.com/asset/?id=12064121",
					Lf = "http://www.roblox.com/asset/?id=12063984",
					Rt = "http://www.roblox.com/asset/?id=12064115",
					Up = "http://www.roblox.com/asset/?id=12064131",
				},
				Stylized = {
					Bk = "rbxassetid://18351376859",
					Dn = "rbxassetid://18351374919",
					Ft = "rbxassetid://18351376800",
					Lf = "rbxassetid://18351376469",
					Rt = "rbxassetid://18351376457",
					Up = "rbxassetid://18351377189",
				},
				Overcast = {
					Bk = "http://www.roblox.com/asset/?id=4498828382",
					Dn = "http://www.roblox.com/asset/?id=4498828812",
					Ft = "http://www.roblox.com/asset/?id=4498829917",
					Lf = "http://www.roblox.com/asset/?id=4498830911",
					Rt = "http://www.roblox.com/asset/?id=4498830417",
					Up = "http://www.roblox.com/asset/?id=4498831746",
				},
				Frostfall = {
					Bk = "http://www.roblox.com/asset/?id=155657655",
					Dn = "http://www.roblox.com/asset/?id=155674246",
					Ft = "http://www.roblox.com/asset/?id=155657609",
					Lf = "http://www.roblox.com/asset/?id=155657671",
					Rt = "http://www.roblox.com/asset/?id=155657619",
					Up = "http://www.roblox.com/asset/?id=155674931",
				},
				Default = {
					Bk = "rbxasset://textures/sky/sky512_bk.tex",
					Dn = "rbxasset://textures/sky/sky512_dn.tex",
					Ft = "rbxasset://textures/sky/sky512_ft.tex",
					Lf = "rbxasset://textures/sky/sky512_lf.tex",
					Rt = "rbxasset://textures/sky/sky512_rt.tex",
					Up = "rbxasset://textures/sky/sky512_up.tex",
				},
			}

			local tbl7 = nil
			skyReady = false

			local function fn51(arg)
				local v46 = tbl6[arg]
				if not v46 then
					return
				end
				local sky = Lighting:FindFirstChildOfClass("Sky")

				if sky and not tbl7 then
					tbl7 = {
						Bk = sky.SkyboxBk,
						Dn = sky.SkyboxDn,
						Ft = sky.SkyboxFt,
						Lf = sky.SkyboxLf,
						Rt = sky.SkyboxRt,
						Up = sky.SkyboxUp,
					}
				end

				if not sky then
					sky = Instance.new("Sky")
					sky.Parent = Lighting
				end

				sky.Name = "Sky"

				pcall(function()
					sky.SkyboxBk = v46.Bk
					sky.SkyboxDn = v46.Dn
					sky.SkyboxFt = v46.Ft
					sky.SkyboxLf = v46.Lf
					sky.SkyboxRt = v46.Rt
					sky.SkyboxUp = v46.Up
				end)
			end

			v33:AddLabel("Custom Skybox"):AddDropdown({
				Flag = "CustomSkybox",
				Values = {
					"Nebula",
					"Storm",
					"Sunset",
					"Deep Space",
					"Crimson",
					"Galaxy",
					"Blossom",
					"Arctic",
					"Midnight",
					"Stylized",
					"Overcast",
					"Frostfall",
					"Default",
				},
				Default = "Default",
				Callback = function(arg)
					if not skyReady then
						skyReady = true
						return
					end
					fn51(arg)
				end,
			})

			v33:AddButton({
				Name = "Restore Original Sky",
				Callback = function()
					local sky = Lighting:FindFirstChildOfClass("Sky")

					if sky and tbl7 then
						pcall(function()
							sky.SkyboxBk = tbl7.Bk
							sky.SkyboxDn = tbl7.Dn
							sky.SkyboxFt = tbl7.Ft
							sky.SkyboxLf = tbl7.Lf
							sky.SkyboxRt = tbl7.Rt
							sky.SkyboxUp = tbl7.Up
						end)

						fn10("wraith", "skybox restored")
					end
				end,
			})
		end

		v35 = v41:AddSection({ Name = "SOUNDS", Position = "left" })
		v36 = v42:AddSection({ Name = "SERVER", Position = "left" })
	end

	local v37, v38, v39, v40, v41, v42, v43, v44, v45, v46

	do
		local tbl6, n25, folder2, tbl7, flag11, tbl8, fn49, fn50

		do
			local tbl9

			do
				do
					local v47, tbl10, fn51

					do
						v37 = v18:AddSection({ Name = "ANTI AIM", Position = "left" })
						tpGroup = v18:AddSection({ Name = "TELEPORT", Position = "left" })
						bahGroup = v18:AddSection({ Name = "BRING HOLDABLES", Position = "right" })
						utilGroup = v18:AddSection({ Name = "UTILITY", Position = "left" })
						v38 = v18:AddSection({ Name = "FUN", Position = "right" })
						animGroup = v18:AddSection({ Name = "ANIMATIONS", Position = "right" })
						v47 = v17:AddSection({ Name = "COSMETICS", Position = "right" })
						snowGroup = v17:AddSection({ Name = "SNOW", Position = "right" })
						jumpRingOn = false
						tbl10 = {}

						do
							local n26 = 0
							JR_DECAL = "rbxassetid://71544661109805"
							local n27 = 3
							local n28 = 15
							local n29 = 2

							fn51 = function(arg)
								local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart then
									return
								end

								if tick() - n26 < 0.15 then
									return
								end
								n26 = tick()
								local raycastParams = RaycastParams.new()
								raycastParams.FilterType = Enum.RaycastFilterType.Exclude
								raycastParams.FilterDescendantsInstances = { arg }
								local hit = Workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -20, 0), raycastParams)
								if not hit then
									return
								end
								local part2 = Instance.new("Part")
								part2.Name = "JumpRing"
								part2.Anchored = true
								part2.CanCollide = false
								part2.CanTouch = false
								part2.CanQuery = false
								part2.CastShadow = false
								part2.Transparency = 1
								part2.Size = Vector3.new(15, 0.05, 15)
								part2.CFrame = CFrame.new(hit.Position + Vector3.new(0, 0.04, 0))
								part2.Parent = Workspace
								local surfaceGui = Instance.new("SurfaceGui")
								surfaceGui.Name = "RingGui"
								surfaceGui.Face = Enum.NormalId.Top
								surfaceGui.AlwaysOnTop = true
								surfaceGui.LightInfluence = 0
								surfaceGui.PixelsPerStud = 50
								surfaceGui.Parent = part2
								local imageLabel = Instance.new("ImageLabel")
								imageLabel.Name = "Ring"
								imageLabel.BackgroundTransparency = 1
								imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
								imageLabel.Position = UDim2.fromScale(0.5, 0.5)
								imageLabel.Size = UDim2.fromScale(n27 / n28, n27 / n28)
								imageLabel.Image = JR_DECAL
								imageLabel.ImageColor3 = jrColor or Color3.fromRGB(255, 255, 255)
								imageLabel.ImageTransparency = 0
								imageLabel.ScaleType = Enum.ScaleType.Stretch
								imageLabel.Parent = surfaceGui
								local TweenService = game:GetService("TweenService")
								local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

								pcall(function()
									TweenService:Create(imageLabel, tweenInfo, { Size = UDim2.fromScale(1, 1) }):Play()
								end)

								pcall(function()
									TweenService:Create(imageLabel, tweenInfo, { ImageTransparency = 1 }):Play()
								end)

								game:GetService("Debris"):AddItem(part2, n29 + 0.1)
							end
						end
					end

					do
						local function fn52(arg)
							if not arg then
								return
							end
							local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
							if not humanoid then
								return
							end

							tbl10[#tbl10 + 1] = humanoid.StateChanged:Connect(function(old, new)
								if not jumpRingOn then
									return
								end

								if new == Enum.HumanoidStateType.Jumping then
									pcall(fn51, arg)
								end
							end)
						end

						jrColor = Color3.fromRGB(255, 255, 255)
						local v48 = v47:AddLabel("Jump Circle")

						v48:AddToggle({
							Default = false,
							Flag = "JumpCircle",
							Callback = function(arg)
								pcall(function()
									if wraithNotifyToggles then
										fn10("wraith", (wraithFlagLabel and wraithFlagLabel("JumpCircle") or "JumpCircle") .. ": " .. (arg and "on" or "off"))
									end
								end)

								jumpRingOn = arg

								for _, v49 in ipairs(tbl10) do
									pcall(function()
										v49:Disconnect()
									end)
								end

								tbl10 = {}
								if not arg then
									return
								end
								fn52(localPlayer.Character)

								tbl10[#tbl10 + 1] = localPlayer.CharacterAdded:Connect(function(character)
									if jumpRingOn then
										task.wait(0.5)
										fn52(character)
									end
								end)
							end,
						})

						v48:AddColorPicker({
							Flag = "JumpCircleColor",
							Default = Color3.fromRGB(255, 255, 255),
							Callback = function(arg)
								jrColor = arg
							end,
						})

						v48:AddTextInput({
							Flag = "JumpCircleImage",
							Default = "",
							Placeholder = "image id",
							Callback = function(arg)
								local match = arg and tostring(arg):match("(%d+)")

								if match then
									JR_DECAL = "rbxassetid://" .. match
								elseif not arg or arg == "" then
									JR_DECAL = "rbxassetid://71544661109805"
								end
							end,
						})
					end
				end

				v39 = v17:AddSection({ Name = "SELF ESP", Position = "left" })
				v40 = v17:AddSection({ Name = "PCLD", Position = "left" })
				v41 = v17:AddSection({ Name = "NICKNAME", Position = "left" })
				v42 = v17:AddSection({ Name = "BOX & SKELETON", Position = "left" })
				v43 = v17:AddSection({ Name = "BLACKHOLE", Position = "right" })
				v44 = v17:AddSection({ Name = "CHINA HAT", Position = "right" })
				v45 = v17:AddSection({ Name = "TRAIL", Position = "right" })
				v46 = v17:AddSection({ Name = "TRACE", Position = "right" })
				flag11 = false
				tbl7 = {}
				tbl8 = {}
				tbl6 = {}
				n25 = 0
				folder2 = nil

				tbl9 = {
					PointsPerBodyPart = 6,
					MaxPoints = 70,
					CoreParticles = 55,
					SoftParticles = 35,
					GlowParticles = 12,
					MicroParticles = 28,
					WindX = 1.5,
					WindZ = 1.2,
					Fall = 1.5,
					EffectLifetime = 8,
				}

				do
					local colors = {}
					local color = Color3.fromRGB(255, 253, 255)
					local color2 = Color3.fromRGB(244, 239, 255)
					local color3 = Color3.fromRGB(232, 222, 249)
					local color4 = Color3.fromRGB(217, 201, 239)
					local color5 = Color3.fromRGB(199, 178, 229)
					local color6 = Color3.fromRGB
					colors[1] = color
					colors[2] = color2
					colors[3] = color3
					colors[4] = color4
					colors[5] = color5

					do
						local values = table.pack(color6(181, 157, 216))
						table.move(values, 1, values.n, 6, colors)
					end

					tbl9.Colors = colors
				end
			end

			do
				local createParticleEmitter

				do
					fn49 = function()
						if folder2 and folder2.Parent then
							return folder2
						end
						folder2 = Instance.new("Folder")
						folder2.Name = "LocalDeathEffects"
						folder2.Parent = Workspace
						return folder2
					end

					do
						local function fn51()
							return tbl9.Colors[math.random(1, #tbl9.Colors)]
						end

						local function fn52(arg)
							return Vector3.new((math.random() - 0.5) * arg, 0, (math.random() - 0.5) * arg)
						end

						createParticleEmitter = function(parent, arg)
							local attachment = Instance.new("Attachment")
							attachment.Parent = parent
							local particleEmitter = Instance.new("ParticleEmitter")
							particleEmitter.Parent = attachment
							particleEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
							particleEmitter.Rate = 0
							particleEmitter.Enabled = false
							particleEmitter.LightEmission = 1
							particleEmitter.LightInfluence = 0
							particleEmitter.Color = ColorSequence.new(fn51())

							pcall(function()
								particleEmitter.Shape = Enum.ParticleEmitterShape.Sphere
								particleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
							end)

							particleEmitter.SpreadAngle = Vector2.new(180, 180)
							particleEmitter.Rotation = NumberRange.new(0, 360)
							particleEmitter.RotSpeed = NumberRange.new(-25, 25)

							if arg == "Core" then
								particleEmitter.Lifetime = NumberRange.new(3.8, 6.5)
								particleEmitter.Speed = NumberRange.new(0.35, 1.8)
								particleEmitter.Drag = 4.5
								particleEmitter.Acceleration = fn52(tbl9.WindX * 2) + Vector3.new(0, -tbl9.Fall, 0)
								local numberSequence = NumberSequence.new
								local tbl10 = {}
								local v47 = NumberSequenceKeypoint.new(0, 0.035)
								local v48 = NumberSequenceKeypoint.new(0.1, 0.13)
								local v49 = NumberSequenceKeypoint.new(0.3, 0.19)
								local v50 = NumberSequenceKeypoint.new(0.65, 0.11)
								local new = NumberSequenceKeypoint.new
								local v51 = NumberSequenceKeypoint.new(0.9, 0.045)
								tbl10[1] = v47
								tbl10[2] = v48
								tbl10[3] = v49
								tbl10[4] = v50
								tbl10[5] = v51

								do
									local values = table.pack(new(1, 0))
									table.move(values, 1, values.n, 6, tbl10)
								end

								particleEmitter.Size = numberSequence(tbl10)
								local numberSequence2 = NumberSequence.new
								local tbl11 = {}
								local v52 = NumberSequenceKeypoint.new(0, 0.05)
								local v53 = NumberSequenceKeypoint.new(0.4, 0.08)
								local v54 = NumberSequenceKeypoint.new(0.72, 0.25)
								local new2 = NumberSequenceKeypoint.new
								tbl11[1] = v52
								tbl11[2] = v53
								tbl11[3] = v54

								do
									local values = table.pack(new2(1, 1))
									table.move(values, 1, values.n, 4, tbl11)
								end

								particleEmitter.Transparency = numberSequence2(tbl11)
							elseif arg == "Soft" then
								particleEmitter.Lifetime = NumberRange.new(4.5, 7)
								particleEmitter.Speed = NumberRange.new(0.2, 1.1)
								particleEmitter.Drag = 6
								particleEmitter.Acceleration = fn52(tbl9.WindX * 1.5) + Vector3.new(0, -0.9, 0)
								local numberSequence = NumberSequence.new
								local tbl10 = {}
								local v47 = NumberSequenceKeypoint.new(0, 0.08)
								local v48 = NumberSequenceKeypoint.new(0.2, 0.25)
								local v49 = NumberSequenceKeypoint.new(0.5, 0.21)
								local v50 = NumberSequenceKeypoint.new(0.8, 0.1)
								local new = NumberSequenceKeypoint.new
								tbl10[1] = v47
								tbl10[2] = v48
								tbl10[3] = v49
								tbl10[4] = v50

								do
									local values = table.pack(new(1, 0))
									table.move(values, 1, values.n, 5, tbl10)
								end

								particleEmitter.Size = numberSequence(tbl10)
								local numberSequence2 = NumberSequence.new
								local tbl11 = {}
								local v51 = NumberSequenceKeypoint.new(0, 0.55)
								local v52 = NumberSequenceKeypoint.new(0.2, 0.72)
								local v53 = NumberSequenceKeypoint.new(0.55, 0.8)
								local new2 = NumberSequenceKeypoint.new
								tbl11[1] = v51
								tbl11[2] = v52
								tbl11[3] = v53

								do
									local values = table.pack(new2(1, 1))
									table.move(values, 1, values.n, 4, tbl11)
								end

								particleEmitter.Transparency = numberSequence2(tbl11)
							elseif arg == "Glow" then
								particleEmitter.Lifetime = NumberRange.new(2.5, 4.5)
								particleEmitter.Speed = NumberRange.new(0.4, 2.4)
								particleEmitter.Drag = 5
								particleEmitter.Acceleration = fn52(tbl9.WindX * 2.5) + Vector3.new(0, -1.1, 0)
								local numberSequence = NumberSequence.new
								local tbl10 = {}
								local v47 = NumberSequenceKeypoint.new(0, 0.12)
								local v48 = NumberSequenceKeypoint.new(0.12, 0.34)
								local v49 = NumberSequenceKeypoint.new(0.3, 0.26)
								local v50 = NumberSequenceKeypoint.new(0.7, 0.12)
								local new = NumberSequenceKeypoint.new
								tbl10[1] = v47
								tbl10[2] = v48
								tbl10[3] = v49
								tbl10[4] = v50

								do
									local values = table.pack(new(1, 0))
									table.move(values, 1, values.n, 5, tbl10)
								end

								particleEmitter.Size = numberSequence(tbl10)
								local numberSequence2 = NumberSequence.new
								local tbl11 = {}
								local v51 = NumberSequenceKeypoint.new(0, 0.05)
								local v52 = NumberSequenceKeypoint.new(0.25, 0.2)
								local v53 = NumberSequenceKeypoint.new(0.65, 0.55)
								local new2 = NumberSequenceKeypoint.new
								tbl11[1] = v51
								tbl11[2] = v52
								tbl11[3] = v53

								do
									local values = table.pack(new2(1, 1))
									table.move(values, 1, values.n, 4, tbl11)
								end

								particleEmitter.Transparency = numberSequence2(tbl11)
							else
								particleEmitter.Lifetime = NumberRange.new(2.8, 5.5)
								particleEmitter.Speed = NumberRange.new(0.15, 1)
								particleEmitter.Drag = 7
								particleEmitter.Acceleration = fn52(tbl9.WindX * 3) + Vector3.new(0, -0.7, 0)
								local numberSequence = NumberSequence.new
								local tbl10 = {}
								local v47 = NumberSequenceKeypoint.new(0, 0.018)
								local v48 = NumberSequenceKeypoint.new(0.25, 0.045)
								local v49 = NumberSequenceKeypoint.new(0.7, 0.025)
								local new = NumberSequenceKeypoint.new
								tbl10[1] = v47
								tbl10[2] = v48
								tbl10[3] = v49

								do
									local values = table.pack(new(1, 0))
									table.move(values, 1, values.n, 4, tbl10)
								end

								particleEmitter.Size = numberSequence(tbl10)
								local numberSequence2 = NumberSequence.new
								local tbl11 = {}
								local v50 = NumberSequenceKeypoint.new(0, 0.1)
								local v51 = NumberSequenceKeypoint.new(0.7, 0.45)
								local new2 = NumberSequenceKeypoint.new
								tbl11[1] = v50
								tbl11[2] = v51

								do
									local values = table.pack(new2(1, 1))
									table.move(values, 1, values.n, 3, tbl11)
								end

								particleEmitter.Transparency = numberSequence2(tbl11)
							end

							return particleEmitter
						end
					end
				end

				do
					local function fn51(arg)
						local tbl10 = {}

						for _, descendant in ipairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" and descendant.Transparency < 1 and descendant.Size.Magnitude > 0.15 then
								tbl10[#tbl10 + 1] = descendant
							end
						end

						return tbl10
					end

					local function fn52(arg)
						local n26 = arg.Size * 0.45
						local vector = Vector3.new
						local x = n26.X
						local n27 = (math.random() - 0.5) * x * 2
						local y = n26.Y
						local z = n26.Z
						local v47 = vector(n27, (math.random() - 0.5) * y * 2, (math.random() - 0.5) * z * 2)
						return arg.CFrame:PointToWorldSpace(v47)
					end

					local function fn53(position)
						local part2 = Instance.new("Part")
						part2.Name = "DisintegrationPoint"
						part2.Size = Vector3.new(0.05, 0.05, 0.05)
						part2.Position = position
						part2.Transparency = 1
						part2.Anchored = true
						part2.CanCollide = false
						part2.CanTouch = false
						part2.CanQuery = false
						part2.CastShadow = false
						part2.Parent = fn49()
						createParticleEmitter(part2, "Core"):Emit(tbl9.CoreParticles)
						createParticleEmitter(part2, "Soft"):Emit(tbl9.SoftParticles)
						createParticleEmitter(part2, "Glow"):Emit(tbl9.GlowParticles)
						createParticleEmitter(part2, "Micro"):Emit(tbl9.MicroParticles)
						game:GetService("Debris"):AddItem(part2, tbl9.EffectLifetime)
					end

					local function fn54(arg)
						for _, descendant in ipairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") or descendant:IsA("Decal") or descendant:IsA("Texture") then
								pcall(function()
									descendant.LocalTransparencyModifier = 1
								end)
							end
						end
					end

					fn50 = function(arg)
						if not arg then
							return
						end

						if tbl6[arg] then
							return
						end
						tbl6[arg] = true

						task.delay(tbl9.EffectLifetime, function()
							tbl6[arg] = nil
						end)

						local v47 = fn51(arg)
						if #v47 == 0 then
							return
						end
						local tbl10 = {}

						for _, v48 in ipairs(v47) do
							for i = 1, tbl9.PointsPerBodyPart do
								if not (tbl9.MaxPoints <= #tbl10) then
									tbl10[#tbl10 + 1] = fn52(v48)
									continue
								end
								break
							end

							if not (tbl9.MaxPoints <= #tbl10) then
								continue
							end
							break
						end

						for i = #tbl10, 2, -1 do
							local n26 = math.random(i)
							local v48 = tbl10[i]
							tbl10[i] = tbl10[n26]
							tbl10[n26] = v48
						end

						for _, v48 in ipairs(tbl10) do
							pcall(fn53, v48)
						end

						fn54(arg)
					end
				end
			end
		end

		local v47, obj, fn51

		do
			do
				do
					local function fn52(arg)
						if not arg or tbl6[arg] then
							return
						end
						tbl6[arg] = true

						tbl7[#tbl7 + 1] = arg.Died:Connect(function()
							if not flag11 then
								return
							end
							local parent = arg.Parent

							if parent and parent:IsA("Model") then
								fn50(parent)
							end
						end)

						tbl7[#tbl7 + 1] = arg.HealthChanged:Connect(function(health)
							if not flag11 or health > 0 then
								return
							end
							local parent = arg.Parent

							if parent and parent:IsA("Model") then
								fn50(parent)
							end
						end)
					end

					v31:AddLabel("Dust Effect"):AddToggle({
						Default = false,
						Flag = "DustEffect",
						Callback = function(arg)
							pcall(function()
								if wraithNotifyToggles then
									fn10("wraith", (wraithFlagLabel and wraithFlagLabel("DustEffect") or "DustEffect") .. ": " .. (arg and "on" or "off"))
								end
							end)

							flag11 = arg

							for _, v48 in ipairs(tbl7) do
								pcall(function()
									v48:Disconnect()
								end)
							end

							tbl7 = {}
							tbl8 = {}
							tbl6 = {}

							if not arg then
								if folder2 then
									pcall(function()
										folder2:Destroy()
									end)

									folder2 = nil
								end

								return
							end

							fn49()

							for _, descendant in ipairs(Workspace:GetDescendants()) do
								if descendant:IsA("Humanoid") then
									fn52(descendant)
								end
							end

							tbl7[#tbl7 + 1] = Workspace.DescendantAdded:Connect(function(descendant)
								if flag11 and descendant:IsA("Humanoid") then
									fn52(descendant)
								end
							end)

							for _, player in ipairs(Players:GetPlayers()) do
								if player.Character then
									tbl8[player] = player.Character
								end
							end

							tbl7[#tbl7 + 1] = Players.PlayerAdded:Connect(function(player)
								if not flag11 then
									return
								end

								tbl7[#tbl7 + 1] = player.CharacterAdded:Connect(function(character)
									tbl8[player] = character
								end)
							end)

							for _, player in ipairs(Players:GetPlayers()) do
								tbl7[#tbl7 + 1] = player.CharacterAdded:Connect(function(character)
									tbl8[player] = character
								end)
							end

							tbl7[#tbl7 + 1] = Players.PlayerRemoving:Connect(function(player)
								if not flag11 then
									return
								end
								local character = player.Character or tbl8[player]
								tbl8[player] = nil

								if character then
									fn50(character)
								end
							end)

							tbl7[#tbl7 + 1] = RunService.Heartbeat:Connect(function()
								if not flag11 then
									return
								end

								if tick() < n25 then
									return
								end
								n25 = tick() + 0.5

								for _, player in ipairs(Players:GetPlayers()) do
									local character = player.Character

									if character then
										tbl8[player] = character
										local humanoid = character:FindFirstChildOfClass("Humanoid")

										if humanoid and humanoid.Health <= 0 then
											fn50(character)
										end
									end
								end
							end)
						end,
					})
				end
			end

			v47 = v17:AddSection({ Name = "ANTI KICK ESP", Position = "left" })
			akEspOn = false
			akEspColor = Color3.fromRGB(255, 80, 80)
			akEspFill = 0.55
			akEspEnemies = true
			obj = setmetatable({}, { __mode = "k" })

			do
				local tbl9 = { "Shuriken", "Kunai", "Plate", "Pickaxe", "Pallet" }

				fn51 = function(arg)
					for _, v48 in ipairs(tbl9) do
						if string.find(arg, v48, 1, true) then
							return true
						end
					end

					return false
				end
			end
		end

		do
			local function fn52()
				for k, v48 in pairs(obj) do
					pcall(function()
						if v48 then
							v48:Destroy()
						end
					end)

					obj[k] = nil
				end

				pcall(function()
					for _, descendant in ipairs(Workspace:GetDescendants()) do
						if descendant.Name == "WraithAKEsp" then
							descendant:Destroy()
						end
					end
				end)
			end

			local v48 = v47:AddLabel("Anti Kick ESP")

			v48:AddToggle({
				Default = false,
				Flag = "AntiKickESP2",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", "Anti Kick ESP: " .. (arg and "on" or "off"))
						end
					end)

					akEspOn = arg

					if not arg then
						fn52()
					end
				end,
			})

			v48:AddColorPicker({
				Flag = "AntiKickESP2Color",
				Default = Color3.fromRGB(255, 80, 80),
				Callback = function(fillColor)
					akEspColor = fillColor

					for _, v49 in pairs(obj) do
						pcall(function()
							v49.FillColor = fillColor
							v49.OutlineColor = fillColor
						end)
					end
				end,
			})
		end

		v47:AddLabel("Anti Kick ESP Fill"):AddSlider({
			Min = 0,
			Max = 100,
			Default = 55,
			Rounding = 0,
			Flag = "AntiKickESP2Fill",
			Callback = function(arg)
				akEspFill = arg / 100

				for _, v48 in pairs(obj) do
					pcall(function()
						v48.FillTransparency = akEspFill
					end)
				end
			end,
		})

		v47:AddLabel("Anti Kick ESP: enemies only"):AddToggle({
			Default = true,
			Flag = "AntiKickESP2Enemy",
			Callback = function(arg)
				akEspEnemies = arg
			end,
		})

		wraithEvery("akEsp", 0.6, function()
			if not akEspOn then
				return
			end

			pcall(function()
				local tbl9 = {}

				for _, child in ipairs(Workspace:GetChildren()) do
					local str6 = tostring(child.Name)

					if str6:match("SpawnedInToys") then
						if not (akEspEnemies and str6 == localPlayer.Name .. "SpawnedInToys") then
							for _, child2 in ipairs(child:GetChildren()) do
								if fn51(tostring(child2.Name)) then
									tbl9[child2] = true

									if not obj[child2] then
										local highlight = Instance.new("Highlight")
										highlight.Name = "WraithAKEsp"
										highlight.Adornee = child2
										highlight.FillColor = akEspColor
										highlight.OutlineColor = akEspColor
										highlight.FillTransparency = akEspFill
										highlight.OutlineTransparency = 0
										highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
										highlight.Parent = child2
										obj[child2] = highlight
									end
								end
							end
						end
					end
				end

				for k, v48 in pairs(obj) do
					if not k.Parent or not tbl9[k] then
						pcall(function()
							if v48 then
								v48:Destroy()
							end
						end)

						obj[k] = nil
					end
				end
			end)
		end)
	end

	do
		do
			local v47, fn49, flag11, tbl6, fillTransparency, n25, tbl7, fn50

			do
				v47 = v17:AddSection({ Name = "COMBAT ITEMS ESP", Position = "left" })

				local tbl8 = {
					Banana = {
						asset = 18383839594,
						color = Color3.fromRGB(255, 221, 51),
						match = { "banana" },
						skip = { "peel" },
					},
					Snowball = {
						asset = 13681767492,
						color = Color3.fromRGB(255, 255, 255),
						match = { "snowball" },
					},
					Shuriken = {
						asset = 106219288648232,
						color = Color3.fromRGB(205, 210, 215),
						match = { "shuriken" },
					},
					Kunai = {
						asset = 13626208096,
						color = Color3.fromRGB(125, 130, 135),
						match = { "kunai" },
					},
					Pickaxe = {
						asset = 4503278233,
						color = Color3.fromRGB(140, 95, 55),
						match = { "pickaxe" },
					},
				}

				for k, v48 in pairs(tbl8) do
					v48.label = k
				end

				ciNames = false

				fn49 = function(arg)
					if arg.icon then
						return arg.icon
					end
					return "rbxassetid://" .. tostring(arg.asset)
				end

				flag11 = false
				tbl6 = {}
				fillTransparency = 0.55
				n25 = 36
				tbl7 = {}

				fn50 = function(arg)
					local str6 = tostring(arg.Name):lower():gsub("%s+", "")

					for k, v48 in pairs(tbl8) do
						if tbl6[k] then
							local v49 = ipairs
							local skip = v48.skip or {}
							local flag12 = false

							for _, v50 in v49(skip) do
								if str6:find(v50, 1, true) then
									flag12 = true
									break
								end
							end

							if not flag12 then
								for _, v50 in ipairs(v48.match) do
									if str6:find(v50, 1, true) then
										return k, v48
									end
								end
							end
						end
					end

					return nil
				end
			end

			do
				local function fn51(arg)
					local v48 = tbl7[arg]
					if not v48 then
						return
					end

					pcall(function()
						if v48.hl then
							v48.hl:Destroy()
						end
					end)

					pcall(function()
						if v48.gui then
							v48.gui:Destroy()
						end
					end)

					pcall(function()
						if v48.nameGui then
							v48.nameGui:Destroy()
						end
					end)

					tbl7[arg] = nil
				end

				local function fn52()
					for k in pairs(tbl7) do
						fn51(k)
					end

					tbl7 = {}

					pcall(function()
						for _, descendant in ipairs(Workspace:GetDescendants()) do
							local str6 = tostring(descendant.Name)

							if str6 == "WraithCombatESP" or str6 == "WraithCombatIcon" or str6 == "WraithCombatName" then
								descendant:Destroy()
							end
						end
					end)
				end

				local function fn53(adornee, arg)
					if tbl7[adornee] then
						local v48 = tbl7[adornee]

						pcall(function()
							if v48.hl then
								v48.hl.FillColor = arg.color
								v48.hl.OutlineColor = arg.color
								v48.hl.FillTransparency = fillTransparency
							end

							if v48.gui then
								v48.gui.Size = UDim2.new(0, n25, 0, n25)
							end

							if v48.nameGui then
								v48.nameGui.Enabled = ciNames and true or false
							end
						end)

						return
					end

					local isBasePart = adornee:IsA("BasePart") and adornee or adornee:IsA("Model") and (adornee.PrimaryPart or adornee:FindFirstChildWhichIsA("BasePart"))
					if not isBasePart then
						return
					end
					local highlight = Instance.new("Highlight")
					highlight.Name = "WraithCombatESP"
					highlight.Adornee = adornee
					highlight.FillColor = arg.color
					highlight.OutlineColor = arg.color
					highlight.FillTransparency = fillTransparency
					highlight.OutlineTransparency = 0
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.Parent = adornee
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "WraithCombatIcon"
					billboardGui.Adornee = isBasePart
					billboardGui.Size = UDim2.new(0, n25, 0, n25)
					billboardGui.StudsOffset = Vector3.new(0, 2.2, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = isBasePart
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.BackgroundTransparency = 1
					imageLabel.Image = fn49(arg)
					imageLabel.Size = UDim2.new(1, 0, 1, 0)
					imageLabel.Parent = billboardGui
					local billboardGui2 = Instance.new("BillboardGui")
					billboardGui2.Name = "WraithCombatName"
					billboardGui2.Adornee = isBasePart
					billboardGui2.Size = UDim2.new(0, 130, 0, 20)
					billboardGui2.StudsOffset = Vector3.new(0, 3.6, 0)
					billboardGui2.AlwaysOnTop = true
					billboardGui2.Enabled = ciNames and true or false
					billboardGui2.Parent = isBasePart
					local textLabel = Instance.new("TextLabel")
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 14
					textLabel.TextColor3 = arg.color
					textLabel.TextStrokeTransparency = 0.4
					textLabel.Text = tostring(arg.label or "")
					textLabel.Parent = billboardGui2
					tbl7[adornee] = { hl = highlight, gui = billboardGui, img = imageLabel, nameGui = billboardGui2 }
				end

				local function fn54()
					local tbl8 = {}

					local function fn55(arg)
						if tbl8[arg] then
							return
						end
						local v48, v49 = fn50(arg)

						if v48 then
							tbl8[arg] = true
							fn53(arg, v49)
						end
					end

					for _, child in pairs(Workspace:GetChildren()) do
						local str6 = tostring(child.Name)

						if str6:match("SpawnedInToys") or str6 == "PlotItems" or str6 == "Debris" then
							for _, descendant in pairs(child:GetDescendants()) do
								if descendant:IsA("Model") or descendant:IsA("BasePart") then
									fn55(descendant)
								end
							end
						elseif child:IsA("Model") or child:IsA("BasePart") then
							fn55(child)
						end
					end

					for k in pairs(tbl7) do
						if not k.Parent or not tbl8[k] then
							fn51(k)
						end
					end
				end

				v47:AddLabel("Combat Items ESP"):AddToggle({
					Default = false,
					Flag = "CombatItemsESP",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("CombatItemsESP") or "CombatItemsESP") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag11 = arg

						if not arg then
							wraithStopEvery("combatESP")
							fn52()
							return
						end

						wraithEvery("combatESP", 1.2, function()
							if flag11 then
								fn54()
							end
						end)
					end,
				})

				v47:AddLabel("Combat Items: list"):AddDropdown({
					Flag = "CombatItemsList",
					Values = { "Banana", "Snowball", "Shuriken", "Kunai", "Pickaxe" },
					Default = { "Shuriken", "Kunai" },
					Multi = true,
					Callback = function(arg)
						if typeof(arg) ~= "table" then
							return
						end
						local tbl8 = {}

						for k, v48 in pairs(arg) do
							if typeof(k) == "string" then
								if v48 then
									tbl8[k] = true
								end
							elseif typeof(v48) == "string" then
								tbl8[v48] = true
							end
						end

						tbl6 = tbl8
						fn52()
					end,
				})
			end

			v47:AddLabel("Combat Items Fill"):AddSlider({
				Flag = "CombatItemsFill",
				Min = 0,
				Max = 100,
				Default = 55,
				Rounding = 0,
				Callback = function(arg)
					fillTransparency = arg / 100
				end,
			})

			v47:AddLabel("Combat Items Icon Size"):AddSlider({
				Flag = "CombatItemsIcon",
				Min = 16,
				Max = 80,
				Default = 36,
				Rounding = 0,
				Callback = function(arg)
					n25 = arg
				end,
			})

			_cin = v47:AddLabel("Combat Items Names")

			_cin:AddToggle({
				Default = false,
				Flag = "CombatItemsNames",
				Callback = function(enabled)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("CombatItemsNames") or "CombatItemsNames") .. ": " .. (enabled and "on" or "off"))
						end
					end)

					ciNames = enabled

					for _, v48 in pairs(tbl7) do
						pcall(function()
							if v48.nameGui then
								v48.nameGui.Enabled = enabled
							end
						end)
					end
				end,
			})

			tbl6 = { Shuriken = true, Kunai = true }
		end

		v26:AddLabel("Snowball Ragdoll"):AddToggle({
			Default = false,
			Flag = "SnowballRagdoll",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("SnowballRagdoll") or "SnowballRagdoll") .. ": " .. (arg and "on" or "off"))
					end
				end)

				flag7 = arg

				if arg then
					task.spawn(function()
						pcall(snowballRagdollRun)
					end)
				else
					task.spawn(function()
						pcall(function()
							local v47 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							if not v47 then
								return
							end
							local tbl6 = {}

							for _, child in pairs(v47:GetChildren()) do
								if child.Name == "BallSnowball" then
									tbl6[#tbl6 + 1] = child
								end
							end

							if #tbl6 == 0 then
								return
							end
							local character = fn15() or fn13()
							character = character and character.Character

							if character then
								character = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
							end

							for _, v48 in ipairs(tbl6) do
								if v48.Parent then
									local primaryPart = v48.PrimaryPart or v48:FindFirstChildWhichIsA("BasePart")

									if primaryPart and character and character.Parent then
										for i = 1, 4 do
											pcall(function()
												primaryPart.CFrame = character.CFrame * CFrame.new(math.random(-30, 30) / 100, math.random(-30, 30) / 100, math.random(-30, 30) / 100)
												primaryPart.AssemblyLinearVelocity = Vector3.zero
											end)

											RunService.Heartbeat:Wait()
										end
									end

									pcall(function()
										ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v48)
									end)

									task.wait(0.03)
								end
							end

							fn10("wraith", "snowball ragdoll: остатки потрачены (" .. #tbl6 .. ")")
						end)
					end)
				end
			end,
		})

		v25:AddLabel("Spectate"):AddToggle({
			Default = false,
			Flag = "Spectate",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("Spectate") or "Spectate") .. ": " .. (arg and "on" or "off"))
					end
				end)

				spectateSet(arg)
			end,
		})

		fcGroup = v17:AddSection({ Name = "FREE CAM", Position = "left" })

		do
			local v47 = fcGroup:AddLabel("Free Cam")
			local flag11 = false

			local v48 = v47:AddToggle({
				Default = false,
				Flag = "FreeCam",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("FreeCam") or "FreeCam") .. ": " .. (arg and "on" or "off"))
						end
					end)

					arg = arg and true
					flag11 = arg or false
					freeCamSet(flag11)
				end,
			})

			fcGroup:AddLabel("Free Cam Speed"):AddSlider({
				Min = 10,
				Max = 400,
				Default = 80,
				Rounding = 0,
				Flag = "FreeCamSpeed",
				Callback = function(speed)
					freeCamSpeed = speed

					if FC then
						FC.speed = speed
					end
				end,
			})

			v47:AddKeybind({
				Default = "N",
				Flag = "FreeCamKey",
				Callback = function(arg)
					if not arg then
						return
					end
					flag11 = not flag11
					local flag12 = false

					pcall(function()
						v48:SetValue(flag11)
						flag12 = true
					end)

					if not flag12 then
						freeCamSet(flag11)
					end
				end,
			})
		end

		do
			local function fn49()
				local destroyToy = ReplicatedStorage_.MenuToys.DestroyToy
				local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

				local function fn50(arg)
					pcall(function()
						local primaryPart = arg.PrimaryPart or arg:FindFirstChildWhichIsA("BasePart")
						local v47, v48, v49 = fn11()
						if not (primaryPart and v49) then
							return
						end
						local n25 = primaryPart.Position - v49.Position
						local magnitude = n25.Magnitude
						if magnitude > 120 then
							return
						end
						local assemblyLinearVelocity = primaryPart.AssemblyLinearVelocity
						local flag11 = assemblyLinearVelocity.Magnitude > 5 and assemblyLinearVelocity.Unit:Dot(-n25.Unit) > 0.4
						if magnitude > 25 and not flag11 then
							return
						end

						for _, descendant in pairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanTouch = false
								descendant.CanCollide = false
								descendant.CanQuery = false
							end
						end

						local now2 = tick()

						while true do
							pcall(function()
								setNetworkOwner:FireServer(primaryPart, primaryPart.CFrame)
							end)

							if wraithPartOwned(primaryPart) then
								break
							else
								RunService.Heartbeat:Wait()
								if not (tick() - now2 > 0.25) then
									continue
								end
								break
							end
						end

						pcall(function()
							primaryPart.AssemblyLinearVelocity = Vector3.zero
							primaryPart.AssemblyAngularVelocity = Vector3.zero
							primaryPart.CFrame = CFrame.new(v49.Position + Vector3.new(0, -3000, 0))
							setNetworkOwner:FireServer(primaryPart, primaryPart.CFrame)
						end)

						pcall(function()
							destroyToy:FireServer(arg)
						end)

						pcall(function()
							arg:Destroy()
						end)
					end)
				end

				local connection = Workspace.DescendantAdded:Connect(function(descendant)
					if not antiSnowV2Active then
						return
					end

					if descendant.Name == "BallSnowball" then
						local v47 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

						if not (v47 and descendant:IsDescendantOf(v47)) then
							fn50(descendant)
						end
					end
				end)

				while antiSnowV2Active do
					pcall(function()
						local v47, v48, v49 = fn11()

						if v48 and v49 then
							local ragdolled = v48:FindFirstChild("Ragdolled")

							if ragdolled and ragdolled.Value or v48.PlatformStand then
								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(v49, 0)
								v48.PlatformStand = false

								pcall(function()
									ragdolled.Value = false
								end)

								pcall(function()
									v48:ChangeState(Enum.HumanoidStateType.GettingUp)
								end)
							end

							for _, child in pairs(Workspace:GetChildren()) do
								if child.Name:match("SpawnedInToys") and child.Name ~= localPlayer.Name .. "SpawnedInToys" then
									for _, child2 in pairs(child:GetChildren()) do
										if child2.Name == "BallSnowball" then
											local primaryPart = child2.PrimaryPart or child2:FindFirstChildWhichIsA("BasePart")

											if primaryPart and (primaryPart.Position - v49.Position).Magnitude < 60 then
												fn50(child2)
											end
										end
									end
								end
							end

							for _, child in pairs(Workspace:GetChildren()) do
								if child.Name == "BallSnowball" then
									local primaryPart = child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")

									if primaryPart and (primaryPart.Position - v49.Position).Magnitude < 60 then
										fn50(child)
									end
								end
							end
						end
					end)

					task.wait(0.03)
				end

				pcall(function()
					connection:Disconnect()
				end)
			end

			v23:AddLabel("Anti Snowball v2"):AddToggle({
				Default = false,
				Flag = "AntiSnowballV2",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiSnowballV2") or "AntiSnowballV2") .. ": " .. (arg and "on" or "off"))
						end
					end)

					antiSnowV2Active = arg

					if arg then
						if not antiSnowV2Task then
							antiSnowV2Task = task.spawn(fn49)
						end
					elseif antiSnowV2Task then
						pcall(function()
							task.cancel(antiSnowV2Task)
						end)

						antiSnowV2Task = nil
					end
				end,
			})
		end

		v23:AddLabel("Anti Snowball"):AddToggle({
			Default = false,
			Flag = "AntiSnowball",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiSnowball") or "AntiSnowball") .. ": " .. (arg and "on" or "off"))
					end
				end)

				antiSnowballActive = arg

				if arg then
					if not antiSnowballTask then
						antiSnowballTask = task.spawn(fn37)
					end
				elseif antiSnowballTask then
					pcall(function()
						task.cancel(antiSnowballTask)
					end)

					antiSnowballTask = nil
				end
			end,
		})

		tpGroup:AddLabel("Loop TP"):AddToggle({
			Default = false,
			Flag = "LoopTP",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("LoopTP") or "LoopTP") .. ": " .. (arg and "on" or "off"))
					end
				end)

				loopTPActive = arg

				if arg then
					if not loopTPTask then
						loopTPTask = task.spawn(loopTPRun)
					end
				elseif loopTPTask then
					pcall(function()
						task.cancel(loopTPTask)
					end)

					loopTPTask = nil
				end
			end,
		})

		gucciPreRidePos = nil
		autoGucciActive = false
		autoGucciKind = "Auto Train"

		lagDef:AddLabel("Anti Lag"):AddToggle({
			Default = false,
			Flag = "AntiLagBeams",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiLagBeams") or "AntiLagBeams") .. ": " .. (arg and "on" or "off"))
					end
				end)

				fn41(arg)
			end,
		})

		lagDef:AddLabel("Auto Anti Lag"):AddToggle({
			Default = true,
			Flag = "AutoAntiLag",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AutoAntiLag") or "AutoAntiLag") .. ": " .. (arg and "on" or "off"))
					end
				end)

				autoAntiLagOn = arg

				if arg then
					if not autoAntiLagTask then
						autoAntiLagTask = task.spawn(fn42)
					end
				elseif autoAntiLagTask then
					pcall(function()
						task.cancel(autoAntiLagTask)
					end)

					autoAntiLagTask = nil
				end
			end,
		})

		lagDef:AddLabel("Auto Anti Lag FPS"):AddSlider({
			Min = 10,
			Max = 120,
			Default = 30,
			Rounding = 0,
			Callback = function(arg)
				autoAntiLagThreshold = arg
			end,
		})

		v23:AddLabel("Anti Burn"):AddToggle({
			Default = false,
			Flag = "AntiBurnV2",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiBurnV2") or "AntiBurnV2") .. ": " .. (arg and "on" or "off"))
					end
				end)

				antiBurnV2Active = arg

				if arg then
					fn43(localPlayer.Character)
				elseif antiBurnV2Conn then
					pcall(function()
						antiBurnV2Conn:Disconnect()
					end)

					antiBurnV2Conn = nil
				end
			end,
		})

		localPlayer.CharacterAdded:Connect(function(character)
			task.wait(0.3)

			if antiBurnV2Active then
				fn43(character)
			end
		end)

		v34:AddLabel("Farm Coins"):AddToggle({
			Default = false,
			Flag = "FarmSlots",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("FarmSlots") or "FarmSlots") .. ": " .. (arg and "on" or "off"))
					end
				end)

				farmSlotsActive = arg

				if arg then
					if not farmSlotsTask then
						farmSlotsTask = task.spawn(fn44)
					end
				elseif farmSlotsTask then
					pcall(function()
						task.cancel(farmSlotsTask)
					end)

					farmSlotsTask = nil
				end
			end,
		})

		v34:AddLabel("Claim Selected Plot"):AddDropdown({
			Values = { "Pink House", "Spooky House", "Blue House", "Green House", "Chinese House" },
			Default = "Pink House",
			Callback = function(arg)
				claimPlotName = arg
			end,
		})

		v34:AddLabel("Claim Plot Toggle"):AddToggle({
			Default = false,
			Flag = "ClaimPlot",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ClaimPlot") or "ClaimPlot") .. ": " .. (arg and "on" or "off"))
					end
				end)

				claimPlotActive = arg

				if arg then
					if not claimPlotTask then
						claimPlotTask = task.spawn(fn45)
					end
				elseif claimPlotTask then
					pcall(function()
						task.cancel(claimPlotTask)
					end)

					claimPlotTask = nil
				end
			end,
		})

		v31:AddLabel("Disable Ragdoll Blur"):AddToggle({
			Default = false,
			Flag = "NoRagdollBlur",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("NoRagdollBlur") or "NoRagdollBlur") .. ": " .. (arg and "on" or "off"))
					end
				end)

				setRagdollBlur(arg)
			end,
		})

		v31:AddLabel("Anti Invis"):AddToggle({
			Default = false,
			Flag = "AntiInvis",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiInvis") or "AntiInvis") .. ": " .. (arg and "on" or "off"))
					end
				end)

				antiInvisActive = arg

				if arg then
					task.spawn(function()
						while antiInvisActive do
							pcall(antiInvisScan)
							task.wait(1)
						end
					end)
				end
			end,
		})

		v24:AddLabel("Anti Fling"):AddToggle({
			Default = false,
			Flag = "AntiFling",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiFling") or "AntiFling") .. ": " .. (arg and "on" or "off"))
					end
				end)

				antiFlingActive = arg
			end,
		})

		antiFlingNoClipOn = false

		do
			local function fn49(arg)
				pcall(function()
					local v47 = fn11()
					if not v47 then
						return
					end

					for _, child in pairs(v47:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanCollide = arg and false or true
							child.AssemblyLinearVelocity = Vector3.zero
							child.AssemblyAngularVelocity = Vector3.zero
						end
					end
				end)
			end

			RunService.Heartbeat:Connect(function()
				if not antiFlingActive then
					return
				end

				if wraithDefenseBlocked() then
					return
				end

				pcall(function()
					local v47, v48, v49 = fn11()
					if not v49 then
						return
					end
					local assemblyLinearVelocity = v49.AssemblyLinearVelocity
					local assemblyAngularVelocity = v49.AssemblyAngularVelocity

					if assemblyLinearVelocity.Magnitude > 180 then
						v49.AssemblyLinearVelocity = assemblyLinearVelocity.Unit * 180
					end

					if assemblyAngularVelocity.Magnitude > 90 then
						v49.AssemblyAngularVelocity = assemblyAngularVelocity.Unit * 90
					end

					for _, child in ipairs(v47:GetChildren()) do
						if child:IsA("BasePart") then
							local assemblyLinearVelocity2 = child.AssemblyLinearVelocity

							if assemblyLinearVelocity2.Magnitude > 260 then
								child.AssemblyLinearVelocity = assemblyLinearVelocity2.Unit * 180
							end
						end
					end
				end)
			end)

			task.spawn(function()
				while true do
					task.wait(0.15)

					if antiFlingActive then
						pcall(function()
							local v47, v48, v49 = fn11()
							if not v47 then
								return
							end
							local flag11 = false

							if v49 then
								if v49.AssemblyLinearVelocity.Magnitude > 220 or v49.AssemblyAngularVelocity.Magnitude > 150 or v49.Position.Y < -20 then
									flag11 = true
								end
							end

							if flag11 and not antiFlingNoClipOn then
								antiFlingNoClipOn = true
								fn49(true)
							elseif not flag11 and antiFlingNoClipOn then
								antiFlingNoClipOn = false
								fn49(false)
							end
						end)
					elseif antiFlingNoClipOn then
						antiFlingNoClipOn = false
						fn49(false)
					end
				end
			end)

			localPlayer.CharacterAdded:Connect(function()
				task.wait(0.5)

				if antiFlingActive then
					fn49(true)
				end
			end)
		end

		v39:AddLabel("Self ESP"):AddToggle({
			Default = false,
			Flag = "ForceField",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ForceField") or "ForceField") .. ": " .. (arg and "on" or "off"))
					end
				end)

				ffActive = arg
				fn46(localPlayer.Character)
			end,
		})

		localPlayer.CharacterAdded:Connect(function(character)
			task.wait(0.3)

			if ffActive then
				fn46(character)
			end
		end)

		v39:AddLabel("Self ESP Color"):AddColorPicker({
			Default = Color3.fromRGB(96, 76, 214),
			Callback = function(arg)
				ffColor = arg

				if ffActive then
					fn46(localPlayer.Character)
				end
			end,
		})

		do
			local v47 = v31:AddLabel("Blobman ESP")

			v47:AddToggle({
				Default = false,
				Flag = "BlobmanESP",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("BlobmanESP") or "BlobmanESP") .. ": " .. (arg and "on" or "off"))
						end
					end)

					flag10 = arg

					if not arg then
						pcall(function()
							for _, descendant in ipairs(Workspace:GetDescendants()) do
								if descendant.Name == "WraithBlobESP" then
									descendant:Destroy()
								end
							end
						end)
					end
				end,
			})

			v47:AddColorPicker({
				Flag = "BlobmanESPColor",
				Default = Color3.fromRGB(96, 76, 214),
				Callback = function(fillColor)
					blobEspColor = fillColor

					pcall(function()
						for _, descendant in ipairs(Workspace:GetDescendants()) do
							if descendant.Name == "WraithBlobESP" and descendant:IsA("Highlight") then
								descendant.FillColor = fillColor
								descendant.OutlineColor = fillColor
							end
						end
					end)
				end,
			})
		end

		v43:AddLabel("Image Blackholes"):AddToggle({
			Default = false,
			Flag = "CustomBlackholes",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("CustomBlackholes") or "CustomBlackholes") .. ": " .. (arg and "on" or "off"))
					end
				end)

				blackholeCustomActive = arg

				if arg then
					if not blackholeMonitorTask then
						blackholeMonitorTask = task.spawn(fn38)
					end
				else
					if blackholeMonitorTask then
						pcall(function()
							task.cancel(blackholeMonitorTask)
						end)

						blackholeMonitorTask = nil
					end

					tbl5 = {}
					fn39()
				end
			end,
		})

		v43:AddLabel("Blackhole Color"):AddColorPicker({
			Flag = "BlackholeColor",
			Default = Color3.fromRGB(255, 255, 255),
			Callback = function(arg)
				blackholeColor = arg
			end,
		})

		v43:AddLabel("Blackhole Texture"):AddTextInput({
			Flag = "BlackholeTex",
			Default = "",
			Placeholder = "asset id или rbxassetid://",
			Callback = function(arg)
				if not arg or arg == "" then
					return
				end
				local str6 = tostring(arg):gsub("%s+", "")

				if str6:match("^rbxassetid://%d+$") or str6:match("^rbxasset://") or str6:match("^rbxthumb://") or str6:match("^http") then
					blackholeTexture = str6
					local match = str6:match("[?&]id=(%d+)") or str6:match("/library/(%d+)")

					if match then
						blackholeTexture = "rbxassetid://" .. match
					end

					return
				end

				local match = str6:match("(%d+)")

				if match then
					blackholeTexture = "rbxassetid://" .. match
				end
			end,
		})

		v43:AddLabel("Hide Blackhole on Detect"):AddToggle({
			Flag = "BlackholeHide",
			Default = true,
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("BlackholeHide") or "BlackholeHide") .. ": " .. (arg and "on" or "off"))
					end
				end)

				blackholeHideOnDetect = arg
			end,
		})

		v43:AddLabel("Blackhole Size"):AddSlider({
			Flag = "BlackholeSize",
			Min = 80,
			Max = 600,
			Default = 240,
			Rounding = 0,
			Callback = function(arg)
				blackholeSize = arg
			end,
		})

		v43:AddLabel("Blackhole Transparency"):AddSlider({
			Flag = "BlackholeAlpha",
			Min = 0,
			Max = 100,
			Default = 0,
			Rounding = 0,
			Callback = function(arg)
				blackholeAlpha = arg
			end,
		})

		v37:AddLabel("Anti Aim"):AddToggle({
			Default = false,
			Flag = "AntiAim",
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiAim") or "AntiAim") .. ": " .. (arg and "on" or "off"))
					end
				end)

				antiAimOn = arg

				if arg then
					wraithAntiAimStart()
				else
					wraithAntiAimStop()
				end
			end,
		})

		v37:AddLabel("Anti Aim Mode"):AddDropdown({
			Flag = "WR2",
			Values = { "Fake Lag", "Aim Nearest" },
			Default = "Fake Lag",
			Callback = function(arg)
				antiAimMode = arg

				if antiAimOn then
					wraithAntiAimStart()
				end
			end,
		})

		v37:AddLabel("Anti Aim Frames"):AddSlider({
			Flag = "WR3",
			Min = 1,
			Max = 20,
			Default = 4,
			Rounding = 0,
			Callback = function(arg)
				fakeLagFrames = arg
			end,
		})

		do
			local v47 = nil

			local function fn49()
				local ok, result = pcall(function()
					return Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
				end)

				return ok and result or nil
			end

			local function fn50()
				if v47 then
					return v47
				end
				local v48 = fn49()
				if not v48 then
					return {}
				end
				local tbl6 = {}

				for _, descendant in ipairs(v48:GetDescendants()) do
					if descendant:IsA("BasePart") then
						table.insert(tbl6, descendant)
					end
				end

				v47 = tbl6
				return tbl6
			end

			local function fn51(arg)
				local v48 = Enum.Material[arg]
				if not v48 then
					return
				end

				for _, v49 in ipairs(fn50()) do
					pcall(function()
						v49.Material = v48
					end)
				end
			end

			local function fn52(color)
				for _, v48 in ipairs(fn50()) do
					pcall(function()
						v48.Color = color
					end)
				end
			end

			oceanMaterialPick = "Water"
			oceanColorPick = Color3.fromRGB(0, 170, 255)

			v34:AddLabel("Ocean Material"):AddDropdown({
				Flag = "OceanMaterial",
				Values = { "Water", "Ice", "Neon", "Glass", "Slate", "Basalt" },
				Default = "Water",
				Callback = function(arg)
					oceanMaterialPick = arg
					fn51(arg)
				end,
			})

			local v48 = v34:AddLabel("Custom Ocean Color")

			v48:AddToggle({
				Default = false,
				Flag = "OceanColorOn",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("OceanColorOn") or "OceanColorOn") .. ": " .. (arg and "on" or "off"))
						end
					end)

					if arg then
						fn52(oceanColorPick)
					end
				end,
			})

			v48:AddColorPicker({
				Flag = "OceanColorPick",
				Default = Color3.fromRGB(0, 170, 255),
				Callback = function(arg)
					oceanColorPick = arg
					fn52(arg)
				end,
			})

			v34:AddButton({
				Name = "Refresh Ocean Cache",
				Callback = function()
					v47 = nil
					fn50()
					fn51(oceanMaterialPick)
					fn52(oceanColorPick)
					fn10("wraith", "ocean cache refreshed")
				end,
			})

			v34:AddLabel("Realistic Water"):AddToggle({
				Default = false,
				Flag = "RealisticWater",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("RealisticWater") or "RealisticWater") .. ": " .. (arg and "on" or "off"))
						end
					end)

					if not arg then
						return
					end
					local v49 = fn49()
					if not v49 then
						fn10("wraith", "realistic water: океан не найден")
						return
					end
					local terrain = Workspace.Terrain
					local n25 = 0

					for _, child in ipairs(v49:GetChildren()) do
						if child:IsA("Part") then
							pcall(function()
								local size = child.Size
								local cFrame = child.CFrame
								terrain:FillRegion(Region3.new(cFrame.Position - size / 2, cFrame.Position + size / 2):ExpandToGrid(4), 4, Enum.Material.Water)
								child:Destroy()
								n25 += 1
							end)
						end
					end

					v47 = nil
					fn10("wraith", "realistic water: залито " .. n25)
				end,
			})
		end
	end

	local tbl6, n25, fn49, v47, tbl7, fn50

	do
		local fn51, tbl8

		do
			tbl6 = {}
			n25 = 1

			fn49 = function()
				for _, v48 in ipairs(tbl6) do
					pcall(function()
						v48:Stop()
					end)
				end

				tbl6 = {}

				pcall(function()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character then
						for _, v48 in ipairs(character:GetPlayingAnimationTracks()) do
							if v48.Animation.AnimationId ~= "rbxassetid://7047322890" then
								v48:Stop()
							end
						end
					end
				end)
			end

			fn51 = function(arg, arg2, arg3)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					return
				end
				local animator = humanoid:FindFirstChildOfClass("Animator")

				if not animator then
					animator = Instance.new("Animator")
					animator.Parent = humanoid
				end

				fn49()

				pcall(function()
					local v48, v49, v50 = fn11()

					if v49 and v50 then
						v49.PlatformStand = false
						v49.Sit = false
						local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
						characterEvents = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

						if characterEvents then
							characterEvents:FireServer(v50, 0)
						end
					end
				end)

				pcall(function()
					for _, v48 in ipairs(humanoid:GetPlayingAnimationTracks()) do
						if v48.Animation and v48.Animation.AnimationId ~= "rbxassetid://7047322890" then
							v48:Stop(0)
						end
					end
				end)

				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://" .. tostring(arg)

				local ok, result = pcall(function()
					return animator:LoadAnimation(animation)
				end)

				if not ok or not result then
					fn10("wraith", "animation " .. tostring(arg) .. " unavailable")
					return
				end

				pcall(function()
					result.Priority = Enum.AnimationPriority.Action4
				end)

				if result.Priority ~= Enum.AnimationPriority.Action4 then
					result.Priority = Enum.AnimationPriority.Action
				end

				result.Looped = arg3 == nil
				result:Play(0.1, 1, (arg2 or 1) * n25)

				task.spawn(function()
					local now2 = tick()

					while result.Length == 0 and tick() - now2 < 3 do
						task.wait(0.05)
					end

					if result.Length == 0 then
						fn10("wraith", "animation " .. tostring(arg) .. " failed to load")
					elseif not result.IsPlaying then
						pcall(function()
							local v48 = result
							local play = v48.Play
							local v49 = arg2
							local n26

							if arg2 then
								n26 = v49
							else
								n26 = 1
							end

							play(v48, 0.1, 1, n26 * n25)
						end)
					end
				end)

				table.insert(tbl6, result)

				task.spawn(function()
					local n26 = 0

					while n26 < 6 and localPlayer.Character and tbl6[#tbl6] == result do
						task.wait(0.25)
						local flag11 = false

						pcall(function()
							flag11 = result.IsPlaying
						end)

						if not flag11 and result.Parent then
							pcall(function()
								result:Play(0, 1, (arg2 or 1) * n25)
							end)

							n26 += 1
						end
					end
				end)

				if arg3 then
					task.spawn(function()
						for i = 1, arg3 do
							if not (not result or not result.Parent) then
								pcall(function()
									result.TimePosition = 0
								end)

								task.wait(result.Length > 0 and result.Length or 1)
								continue
							end

							break
						end

						pcall(function()
							result:Stop()
						end)
					end)
				end
			end

			do
				local tbl9 = {
					{ "Head Throw", 35154961, 1, nil },
					{ "Floating Head", 121572214, 1, nil },
					{ "Crouch", 182724289, 1, nil },
					{ "Floor Crawl", 282574440, 1, nil },
					{ "Dino Walk", 204328711, 1, nil },
					{ "Jumping Jacks", 429681631, 1, nil },
					{ "Loop Head", 35154961, 1, 1000000 },
					{ "Hero Jump", 184574340, 1, 1 },
					{ "Faint", 181526230, 1, nil },
					{ "Floor Faint", 181525546, 1, 2 },
					{ "Super Faint", 181525546, 0.5, 40 },
					{ "Levitate", 313762630, 1, nil },
					{ "Float Sit", 179224234, 1, nil },
					{ "Weird Move", 215384594, 1, nil },
					{ "Clone Illusion", 215384594, 1, 10000000 },
					{ "Glitch Levitate", 313762630, 1, 10000000 },
					{ "Full Punch", 204062532, 1, 1 },
					{ "Bow Down", 204292303, 1, 3 },
					{ "Sword Slam", 204295235, 1, 1 },
					{ "Loop Slam", 204295235, 1, 10000 },
					{ "Mega Insane", 184574340, 0.5, 40 },
					{ "Super Punch", 126753849, 1, 3 },
					{ "Full Swing", 218504594, 1, 1 },
					{ "Arm Turbine", 259438880, 1, 1000 },
					{ "Barrel Roll", 136801964, 1, 1 },
					{ "Scared", 180612465, 1, 1 },
					{ "Insane", 33796059, 1, 100000000 },
					{ "Arm Detach", 33169583, 1, 1000000 },
					{ "Sword Slice", 35978879, 1, nil },
					{ "Insane Arms", 27432691, 1, 10000 },
				}

				tbl8 = {
					{ "Dab", 183412246, 1, 1 },
					{ "Spinner", 188632011, 1, 2 },
					{ "Moving Dance", 429703734, 1, 1 },
					{ "Spin Dance", 429730430, 1, 1 },
					{ "Moon Dance", 45834924, 1, 1 },
					{ "Spin Dance 2", 186934910, 1, 1 },
					{ "Thriller", 27789359, 1, 1 },
					{ "Robot", 30196114, 1, 1 },
					{ "Shuffle", 248263260, 1, 1 },
					{ "Groove", 33796059, 1, 1 },
					{ "Club", 28488254, 1, 1 },
					{ "Jump Dance", 52155728, 1, 1 },
				}

				local Emote = animGroup:AddLabel("Emote")
				local tbl10 = { "None" }

				for _, v48 in ipairs(tbl9) do
					table.insert(tbl10, v48[1])
				end

				Emote:AddDropdown({
					Flag = "WR5",
					Values = tbl10,
					Default = "None",
					Callback = function(arg)
						if arg == "None" then
							fn49()
							return
						end

						for _, v48 in ipairs(tbl9) do
							if v48[1] == arg then
								fn51(v48[2], v48[3], v48[4])
								return
							end
						end
					end,
				})
			end
		end

		do
			local Dance = animGroup:AddLabel("Dance")
			local tbl9 = { "None" }

			for _, v48 in ipairs(tbl8) do
				table.insert(tbl9, v48[1])
			end

			Dance:AddDropdown({
				Flag = "WR6",
				Values = tbl9,
				Default = "None",
				Callback = function(arg)
					if arg == "None" then
						fn49()
						return
					end

					for _, v48 in ipairs(tbl8) do
						if v48[1] == arg then
							fn51(v48[2], v48[3], v48[4])
							return
						end
					end
				end,
			})
		end

		v47 = nil
		tbl7 = {}

		do
			local function fn52()
				local tbl9 = {}

				for _, v48 in ipairs({ "ReplicatedFirst", "ReplicatedStorage" }) do
					local v49 = game:FindService(v48)

					if v49 then
						table.insert(tbl9, v49)
					end
				end

				table.insert(tbl9, Workspace)
				return tbl9
			end

			fn50 = function(arg)
				local v48 = fn52()

				for _, v49 in ipairs(v48) do
					pcall(function()
						local crouch

						if arg == "Crouch" then
							crouch = (v49:FindFirstChild("Animations") or v49) and v49:FindFirstChild("Animations") and v49.Animations:FindFirstChild("Crouch", true)
						elseif arg == "Fire Flail" then
							crouch = v49:FindFirstChild("CatchFire") and v49.CatchFire:FindFirstChild("FireFlailAnimation", true)
						elseif arg == "Flail" then
							crouch = v49:FindFirstChild("ThrowPlayers") and v49.ThrowPlayers:FindFirstChild("Flail", true)
						else
							crouch = nil

							if arg == "Type" then
								crouch = v49:FindFirstChild("Typing") and v49.Typing:FindFirstChild("Type", true)
							end
						end

						if crouch and crouch:IsA("Animation") then
							tbl7[arg] = crouch
						end
					end)
				end

				if tbl7[arg] then
					return tbl7[arg]
				end

				local tbl9 = {
					Crouch = { "Crouch", "Squat" },
					["Fire Flail"] = { "FireFlailAnimation", "FireFlail", "Flail" },
					Flail = { "Flail", "ThrowFlail" },
					Type = { "Type", "Typing", "Keyboard" },
				}

				local str6 = arg:lower()

				for _, v49 in ipairs(v48) do
					pcall(function()
						for _, descendant in ipairs(v49:GetDescendants()) do
							if descendant:IsA("Animation") then
								local str7 = tostring(descendant.Name):lower()
								local flag11 = str7 == str6 or str7:find(str6, 1, true) ~= nil
								local v50 = ipairs
								local tbl10 = tbl9[arg] or {}

								for _, v51 in v50(tbl10) do
									if str7 == v51:lower() or str7:find(v51:lower(), 1, true) then
										flag11 = true
									end
								end

								if flag11 then
									tbl7[arg] = descendant
									return
								end
							end
						end
					end)

					if not tbl7[arg] then
						continue
					end
					break
				end

				if tbl7[arg] then
					return tbl7[arg]
				end

				pcall(function()
					local ReplicatedFirst = game:GetService("ReplicatedFirst")

					for _, descendant in ipairs(ReplicatedFirst:GetDescendants()) do
						if descendant:IsA("Animation") then
							tbl7[arg] = descendant
							return
						end
					end
				end)

				return tbl7[arg]
			end
		end
	end

	do
		local function fn51()
			pcall(function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					for _, v48 in pairs(character:GetPlayingAnimationTracks()) do
						v48:Stop(0.1)
					end
				end
			end)

			if v47 then
				pcall(function()
					v47:Stop()
				end)

				v47 = nil
			end
		end

		local function fn52(arg)
			pcall(function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")
				if not character then
					return
				end
				local v48 = tbl7[arg] or fn50(arg)
				if not v48 or not v48:IsA("Animation") then
					fn10("wraith", "ftap emote: " .. tostring(arg) .. " not found")
					return
				end
				local animator = character:FindFirstChildOfClass("Animator") or Instance.new("Animator")

				if not animator.Parent then
					animator.Parent = character
				end

				fn51()
				v47 = animator:LoadAnimation(v48)
				v47.Looped = true
				v47.Priority = Enum.AnimationPriority.Action
				local v49 = v47
				local play = v49.Play
				local v50 = n25
				local n26

				if n25 then
					n26 = v50
				else
					n26 = 1
				end

				play(v49, 0.1, 1, n26)
				fn10("wraith", "ftap emote: " .. arg .. " (" .. tostring(v48.Name) .. ")")
			end)
		end

		animGroup:AddLabel("FTAP Emote"):AddDropdown({
			Flag = "WR_FTAP_POSE",
			Values = { "None", "Crouch", "Fire Flail", "Flail", "Type" },
			Default = "None",
			Callback = function(arg)
				if arg == "None" then
					fn51()
					return
				end
				fn52(arg)
			end,
		})
	end

	animGroup:AddLabel("Anim Speed"):AddSlider({
		Flag = "WR7",
		Min = 0.1,
		Max = 5,
		Default = 1,
		Rounding = 1,
		Callback = function(arg)
			n25 = arg

			for _, v48 in ipairs(tbl6) do
				pcall(function()
					v48:AdjustSpeed(n25)
				end)
			end
		end,
	})

	animGroup:AddButton({
		Name = "Stop Animations",
		Callback = function()
			fn49()
		end,
	})

	v24:AddLabel("Anti Loop Kill"):AddToggle({
		Default = false,
		Flag = "AntiLoopKill",
		Callback = function(arg)
			pcall(function()
				if wraithNotifyToggles then
					fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiLoopKill") or "AntiLoopKill") .. ": " .. (arg and "on" or "off"))
				end
			end)

			if arg then
				fn47()
			else
				fn48()
			end
		end,
	})

	do
		local flag11 = false
		local n26 = 20
		local n27 = 1

		v29:AddLabel("Spin Direction"):AddDropdown({
			Flag = "WR8",
			Values = { "Left", "Right" },
			Default = "Left",
			Callback = function(arg)
				n27 = arg == "Left" and 1 or -1
			end,
		})

		v29:AddLabel("Spin Speed"):AddSlider({
			Flag = "WR9",
			Min = 1,
			Max = 200,
			Default = 20,
			Rounding = 0,
			Callback = function(arg)
				n26 = arg
			end,
		})

		v29:AddLabel("Spin"):AddToggle({
			Flag = "WR10",
			Default = false,
			Callback = function(arg)
				pcall(function()
					if wraithNotifyToggles then
						fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR10") or "WR10") .. ": " .. (arg and "on" or "off"))
					end
				end)

				flag11 = arg
			end,
		})

		RunService.Heartbeat:Connect(function(deltaTime)
			if not flag11 then
				return
			end
			local v48, v49, v50 = fn11()
			if not v50 then
				return
			end
			v50.CFrame = v50.CFrame * CFrame.Angles(0, math.rad(n27 * n26 * 40 * deltaTime), 0)
		end)
	end

	do
		local flag11 = false
		local walkSpeed = 16
		local jumpPower = 0
		wraithJumpOrig = nil

		wraithJumpRemember = function(arg)
			if not arg then
				return
			end

			if wraithJumpOrig == nil then
				wraithJumpOrig = { up = arg.UseJumpPower, jp = arg.JumpPower, jh = arg.JumpHeight }
			end
		end

		wraithJumpRestore = function(arg)
			if not (arg and wraithJumpOrig) then
				return
			end

			pcall(function()
				arg.UseJumpPower = wraithJumpOrig.up

				if wraithJumpOrig.up then
					arg.JumpPower = wraithJumpOrig.jp
				else
					arg.JumpHeight = wraithJumpOrig.jh
				end
			end)
		end

		local flag12 = false

		xpcall(function()
			v29:AddLabel("Walk Speed"):AddSlider({
				Flag = "WR11",
				Min = 16,
				Max = 250,
				Default = 16,
				Rounding = 0,
				Callback = function(walkSpeed2)
					walkSpeed = walkSpeed2
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid.WalkSpeed = walkSpeed2
						end)
					end
				end,
			})

			v29:AddLabel("Jump Power"):AddSlider({
				Flag = "WR12",
				Min = 0,
				Max = 400,
				Default = 0,
				Rounding = 0,
				Callback = function(jumpPower2)
					jumpPower = jumpPower2
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						wraithJumpRemember(humanoid)

						if jumpPower2 > 0 then
							pcall(function()
								humanoid.UseJumpPower = true
								humanoid.JumpPower = jumpPower2
							end)
						else
							wraithJumpRestore(humanoid)
						end
					end
				end,
			})

			v29:AddLabel("Infinite Jump"):AddToggle({
				Flag = "WR13",
				Default = false,
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR13") or "WR13") .. ": " .. (arg and "on" or "off"))
						end
					end)

					flag12 = arg
				end,
			})

			task.spawn(function()
				while true do
					task.wait(1)
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						if jumpPower > 0 and humanoid.JumpPower ~= jumpPower then
							pcall(function()
								humanoid.UseJumpPower = true
								humanoid.JumpPower = jumpPower
							end)
						end
					end
				end
			end)

			local function fn51(character)
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if not (humanoid and humanoidRootPart) then
					return
				end

				humanoid.Jumping:Connect(function()
					if jumpPower > 50 then
						pcall(function()
							local z = humanoidRootPart.AssemblyLinearVelocity.Z
							humanoidRootPart.AssemblyLinearVelocity = Vector3.new(humanoidRootPart.AssemblyLinearVelocity.X, math.max(jumpPower, 50), z)
						end)
					end
				end)
			end

			if localPlayer.Character then
				fn51(localPlayer.Character)
			end

			localPlayer.CharacterAdded:Connect(fn51)

			wraithEvery("aiWatch", 2, function()
				if fastestAntiInputActive and antiInputRestart then
					pcall(antiInputRestart)
				end
			end)

			wraithEvery("wsKeep", 0.4, function()
				if walkSpeed <= 16 then
					return
				end
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoid.Health > 0 and humanoid.WalkSpeed ~= walkSpeed then
					pcall(function()
						humanoid.WalkSpeed = walkSpeed
					end)
				end
			end)

			RunService.Heartbeat:Connect(function(deltaTime)
				if walkSpeed <= 16 then
					return
				end
				local v48, v49, v50 = fn11()
				if not v50 then
					return
				end
				local n26 = (walkSpeed - 16) * deltaTime

				if v49.SeatPart then
					local parent = v49.SeatPart.Parent
					local humanoidRootPart = parent and (parent:FindFirstChild("HumanoidRootPart") or parent.PrimaryPart) or v50
					local currentCamera = Workspace.CurrentCamera
					local vector = Vector3.zero

					if currentCamera then
						local lookVector = currentCamera.CFrame.LookVector
						local rightVector = currentCamera.CFrame.RightVector
						local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)
						local vector3 = Vector3.new(rightVector.X, 0, rightVector.Z)
						vector = Vector3.zero

						if UserInputService_:IsKeyDown(Enum.KeyCode.W) then
							vector = Vector3.zero + vector2
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.S) then
							vector -= vector2
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.D) then
							vector += vector3
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.A) then
							vector -= vector3
						end
					end

					if vector.Magnitude > 0 then
						humanoidRootPart.CFrame = humanoidRootPart.CFrame + vector.Unit * n26
					end

					return
				end

				local moveDirection = v49.MoveDirection

				if moveDirection.Magnitude > 0 then
					v50.CFrame = v50.CFrame + moveDirection * n26
				end
			end)

			UserInputService_.JumpRequest:Connect(function()
				if flag12 then
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end)
					end
				end
			end)

			localPlayer.CharacterAdded:Connect(function(character)
				task.spawn(function()
					task.wait(0.1)
					local humanoid = character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						wraithJumpRemember(humanoid)

						if walkSpeed > 16 then
							pcall(function()
								humanoid.WalkSpeed = walkSpeed
							end)
						end

						if jumpPower > 0 then
							pcall(function()
								humanoid.UseJumpPower = true
								humanoid.JumpPower = jumpPower
							end)
						end
					end
				end)
			end)

			do
				local tbl8 = {}
				local transparency = 0.3
				local flag13 = false
				local color = Color3.fromRGB(0, 255, 255)

				local function fn52(arg)
					local v48 = tbl8[arg]

					if v48 then
						pcall(function()
							v48:Destroy()
						end)

						tbl8[arg] = nil
					end
				end

				local function fn53(parent)
					local head = parent and parent:FindFirstChild("Head")
					if not head then
						return
					end
					fn52(parent)
					local part2 = Instance.new("Part")
					part2.Name = "Hat"
					part2.Transparency = transparency
					part2.Color = color
					part2.Material = Enum.Material.Neon
					part2.CanCollide = false
					part2.CanTouch = false
					part2.CanQuery = false
					part2.Massless = true
					local specialMesh = Instance.new("SpecialMesh")
					specialMesh.MeshId = "rbxassetid://1033714"
					specialMesh.Scale = Vector3.new(2.25, 1.5, 2.25)
					specialMesh.Parent = part2
					local weldConstraint = Instance.new("WeldConstraint")
					weldConstraint.Part0 = head
					weldConstraint.Part1 = part2
					weldConstraint.Parent = part2
					part2.CFrame = head.CFrame * CFrame.new(0, 1.1, 0)
					part2.Parent = parent
					tbl8[parent] = part2
				end

				local tbl9 = {}
				local lifetime = 0.5
				local n26 = 0
				local flag14 = false
				local flag15 = false
				local color2 = Color3.fromRGB(0, 255, 255)
				local color3 = Color3.fromRGB(0, 86, 255)
				local color4 = Color3.fromRGB(255, 0, 0)

				local function fn54(arg)
					if tbl9[arg] then
						pcall(function()
							tbl9[arg]:Destroy()
						end)

						tbl9[arg] = nil
					end

					arg = arg and arg:FindFirstChild("HumanoidRootPart")

					if arg then
						local trailAttach0 = arg:FindFirstChild("TrailAttach0")
						local trailAttach1 = arg:FindFirstChild("TrailAttach1")

						if trailAttach0 then
							trailAttach0:Destroy()
						end

						if trailAttach1 then
							trailAttach1:Destroy()
						end
					end
				end

				local function fn55(parent)
					local humanoidRootPart = parent and parent:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					fn54(parent)
					local attachment = Instance.new("Attachment")
					attachment.Name = "TrailAttach0"
					attachment.Position = Vector3.new(0, 2, 0)
					attachment.Parent = humanoidRootPart
					local attachment2 = Instance.new("Attachment")
					attachment2.Name = "TrailAttach1"
					attachment2.Position = Vector3.new(0, -2, 0)
					attachment2.Parent = humanoidRootPart
					local trail = Instance.new("Trail")
					trail.Attachment0 = attachment
					trail.Attachment1 = attachment2
					trail.Lifetime = lifetime
					trail.LightEmission = 0.2
					trail.Enabled = true
					local new = NumberSequenceKeypoint.new
					trail.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, n26), new(1, 1) })

					if flag15 then
						trail.Color = ColorSequence.new(color3, color4)
					else
						trail.Color = ColorSequence.new(color2)
					end

					trail.Parent = parent
					tbl9[parent] = trail
				end

				local flag16 = false
				local flag17 = false

				v44:AddLabel("China Hat"):AddToggle({
					Flag = "WR14",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR14") or "WR14") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag16 = arg

						if arg then
							fn53(localPlayer.Character)
						else
							fn52(localPlayer.Character)
						end
					end,
				})

				v44:AddLabel("Hat Transparency"):AddSlider({
					Flag = "WR15",
					Min = 0,
					Max = 100,
					Default = 30,
					Rounding = 0,
					Callback = function(arg)
						transparency = arg / 100

						for _, v48 in pairs(tbl8) do
							if v48.Parent then
								v48.Transparency = transparency
							end
						end
					end,
				})

				v44:AddLabel("Hat Rainbow"):AddToggle({
					Flag = "WR16",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR16") or "WR16") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg
					end,
				})

				v44:AddLabel("Hat Color"):AddColorPicker({
					Flag = "WR17",
					Default = color,
					Callback = function(arg)
						color = arg

						for _, v48 in pairs(tbl8) do
							if v48.Parent then
								v48.Color = color
							end
						end
					end,
				})

				localPlayer.CharacterAdded:Connect(function(character)
					task.wait(0.5)

					if flag17 then
						pcall(function()
							fn55(character)
						end)
					end
				end)

				v45:AddLabel("Trail"):AddToggle({
					Flag = "WR18",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR18") or "WR18") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag17 = arg

						if arg then
							fn55(localPlayer.Character)
						else
							fn54(localPlayer.Character)
						end
					end,
				})

				v45:AddLabel("Trail Lifetime"):AddSlider({
					Flag = "WR19",
					Min = 1,
					Max = 30,
					Default = 5,
					Rounding = 0,
					Callback = function(arg)
						lifetime = arg / 10

						for _, v48 in pairs(tbl9) do
							if v48.Parent then
								v48.Lifetime = lifetime
							end
						end
					end,
				})

				v45:AddLabel("Trail Fade Start"):AddSlider({
					Flag = "WR20",
					Min = 0,
					Max = 100,
					Default = 0,
					Rounding = 0,
					Callback = function(arg)
						n26 = arg / 100

						for _, v48 in pairs(tbl9) do
							if v48.Parent then
								local new = NumberSequenceKeypoint.new
								v48.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, n26), new(1, 1) })
							end
						end
					end,
				})

				v45:AddLabel("Trail Gradient"):AddToggle({
					Flag = "WR21",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR21") or "WR21") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg

						for _, v48 in pairs(tbl9) do
							if v48.Parent then
								v48.Color = flag15 and ColorSequence.new(color3, color4) or ColorSequence.new(color2)
							end
						end
					end,
				})

				v45:AddLabel("Trail Rainbow"):AddToggle({
					Flag = "WR22",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR22") or "WR22") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg
					end,
				})

				v45:AddLabel("Trail Color"):AddColorPicker({
					Flag = "WR23",
					Default = color2,
					Callback = function(arg)
						color2 = arg

						if not flag15 then
							for _, v48 in pairs(tbl9) do
								if v48.Parent then
									v48.Color = ColorSequence.new(color2)
								end
							end
						end
					end,
				})

				v45:AddLabel("Trail Gradient 1"):AddColorPicker({
					Flag = "WR24",
					Default = color3,
					Callback = function(arg)
						color3 = arg

						if flag15 then
							for _, v48 in pairs(tbl9) do
								if v48.Parent then
									v48.Color = ColorSequence.new(color3, color4)
								end
							end
						end
					end,
				})

				v45:AddLabel("Trail Gradient 2"):AddColorPicker({
					Flag = "WR25",
					Default = color4,
					Callback = function(arg)
						color4 = arg

						if flag15 then
							for _, v48 in pairs(tbl9) do
								if v48.Parent then
									v48.Color = ColorSequence.new(color3, color4)
								end
							end
						end
					end,
				})

				localPlayer.CharacterAdded:Connect(function(character)
					task.spawn(function()
						local head = character:WaitForChild("Head", 5)
						local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
						task.wait(0.25)
						local v48 = flag16

						if not flag16 then
							head = v48
						end

						if head then
							fn53(character)
						end

						local v49 = flag17

						if not flag17 then
							humanoidRootPart = v49
						end

						if humanoidRootPart then
							fn55(character)
						end
					end)
				end)

				task.spawn(function()
					while true do
						task.wait(0.05)
						if next(tbl8) == nil and next(tbl9) == nil then
							continue
						end

						for k, v48 in pairs(tbl8) do
							if v48 and v48.Parent and k == localPlayer.Character then
								v48.Transparency = transparency
								v48.Color = flag13 and Color3.fromHSV(tick() % 6 / 6, 1, 1) or color
							end
						end

						for k, v48 in pairs(tbl9) do
							if v48 and v48.Parent and k == localPlayer.Character then
								v48.Lifetime = lifetime
								v48.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, n26), NumberSequenceKeypoint.new(1, 1) })
								if flag15 then
									v48.Color = ColorSequence.new(color3, color4)
									continue
								end
								v48.Color = ColorSequence.new(flag14 and Color3.fromHSV(tick() % 6 / 6, 1, 1) or color2)
							end
						end
					end
				end)
			end

			task.spawn(function()
				local str6 = ""

				while true do
					task.wait(4)

					pcall(function()
						if targetDropdown and not targetDropdown.open then
							local v48 = fn14()
							local str7 = table.concat(v48, ",")

							if str7 ~= str6 then
								str6 = str7
								local value = nil

								pcall(function()
									value = targetDropdown:GetValue()
								end)

								targetDropdown:SetValues(v48)

								if type(value) == "table" then
									pcall(function()
										targetDropdown:SetValue(value)
									end)
								end
							end
						end
					end)
				end
			end)

			Players.PlayerAdded:Connect(function()
				task.wait(1)
				local v48 = fn14()

				if targetDropdown and type(targetDropdown.refresh_options) == "function" then
					pcall(function()
						targetDropdown:SetValues(v48)
					end)
				end
			end)

			Players.PlayerRemoving:Connect(function()
				task.wait(1)
				local v48 = fn14()

				if targetDropdown and type(targetDropdown.refresh_options) == "function" then
					pcall(function()
						targetDropdown:SetValues(v48)
					end)
				end
			end)

			do
				local v48 = nil
				local flag13 = false
				dlLegsBusy = false
				dlLegsBusy = false

				local function fn52()
					if dlLegsBusy then
						return
					end
					dlLegsBusy = true

					task.spawn(function()
						pcall(function()
							local character = localPlayer.Character
							if not character then
								return
							end

							if character:FindFirstChild("Left Leg") and character:FindFirstChild("Right Leg") then
								local leftLeg = character:FindFirstChild("Left Leg")
								local rightLeg = character:FindFirstChild("Right Leg")
								local fallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
								local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
								if not torso then
									return
								end
								local cFrame = torso.CFrame
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
								local humanoid = character:FindFirstChild("Humanoid")
								if not humanoidRootPart or not humanoid then
									return
								end
								Workspace.FallenPartsDestroyHeight = -100

								task.delay(6, function()
									pcall(function()
										if Workspace.FallenPartsDestroyHeight == -100 then
											Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
										end
									end)
								end)

								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 2)
								task.wait(0.5)
								rightLeg.CFrame = CFrame.new(0, -10000, 0)
								leftLeg.CFrame = CFrame.new(0, -10000, 0)
								task.wait(0.3)
								torso.CFrame = CFrame.new(0, -9970, 0)
								task.wait(0.5)

								for i = 1, 6 do
									pcall(function()
										torso.CFrame = cFrame
										torso.AssemblyLinearVelocity = Vector3.zero
									end)

									RunService.Heartbeat:Wait()
								end

								task.wait(0.5)
								Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight

								pcall(function()
									if humanoid and humanoid.Health > 0 then
										humanoid.PlatformStand = false
										ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0)
									end
								end)

								task.spawn(function()
									if not character:FindFirstChild("Left Leg") and not character:FindFirstChild("Right Leg") then
										while character and character.Parent and humanoid and humanoid.Health > 0 do
											pcall(function()
												local controlsGui = localPlayer.PlayerGui:FindFirstChild("ControlsGui")

												if controlsGui and controlsGui:FindFirstChild("PCFrame") and controlsGui.PCFrame:FindFirstChild("Stand") then
													if controlsGui.PCFrame.Stand.Visible == false then
														humanoid.HipHeight = 2
													else
														humanoid.HipHeight = 0
													end
												end
											end)

											task.wait()
										end
									end
								end)
							end
						end)

						task.wait(0.5)
						dlLegsBusy = false
					end)
				end

				localPlayer.CharacterAdded:Connect(function()
					task.delay(1.5, function()
						if flag13 then
							fn52()
						end
					end)
				end)

				localPlayer.CharacterAdded:Connect(function(character)
					task.wait(0.2)
					fn46(character)
				end)

				v21:AddLabel("Auto Delete Legs"):AddToggle({
					Flag = "WR26",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR26") or "WR26") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if arg then
							fn52()
						end
					end,
				})

				v21:AddButton({
					Name = "Delete Legs",
					Callback = function()
						fn52()
					end,
				})

				antiGrabMode = "Default"
				antiGrabActive = false

				local function fn53()
					if v48 then
						v48:Disconnect()
						v48 = nil
					end

					local character = localPlayer.Character

					if character then
						for _, child in pairs(character:GetChildren()) do
							if child:IsA("BasePart") then
								child.Anchored = false
							end
						end
					end
				end

				gucciActive = false
				gucciLastSpawn = 0
				local thread = nil

				local function fn54()
					gucciActive = true

					if thread then
						pcall(function()
							task.cancel(thread)
						end)
					end

					thread = task.spawn(function()
						local now2 = nil
						local instrumentWoodwindOcarina = nil
						local name = nil

						while gucciActive do
							pcall(function()
								local v49 = localPlayer
								local plots = Workspace:FindFirstChild("Plots")

								if plots then
									for _, child in pairs(plots:GetChildren()) do
										local plotSign = child:FindFirstChild("PlotSign")
										local thisPlotsOwners = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

										if thisPlotsOwners then
											for _, child2 in pairs(thisPlotsOwners:GetChildren()) do
												if child2.Value == v49.Name then
													name = child.Name
												end
											end
										end

										if plotSign then
											for _, child2 in pairs(plotSign:GetChildren()) do
												if child2.Name == "Sign" then
													pcall(function()
														local frame2 = child2.Screen.SurfaceGui.Frame

														if frame2.Visible and frame2.PlayerDisplayName.Text == v49.DisplayName then
															name = child.Name
														end
													end)
												end
											end
										end
									end
								end

								local v50 = Workspace:FindFirstChild(v49.Name .. "SpawnedInToys")
								instrumentWoodwindOcarina = v50 and v50:FindFirstChild("InstrumentWoodwindOcarina")
								local plotItems = Workspace:FindFirstChild("PlotItems")

								if not instrumentWoodwindOcarina and name and plotItems and plotItems:FindFirstChild(name) then
									instrumentWoodwindOcarina = plotItems[name]:FindFirstChild("InstrumentWoodwindOcarina")
								end

								if instrumentWoodwindOcarina then
									local character = v49.Character

									if character then
										for _, child in pairs(character:GetChildren()) do
											local partOwner = child:FindFirstChild("PartOwner")

											if partOwner and partOwner.Value ~= "" then
												local holdPart = instrumentWoodwindOcarina:FindFirstChild("HoldPart")
												local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")

												if holdItemRemoteFunction then
													task.spawn(function()
														pcall(function()
															holdItemRemoteFunction:InvokeServer(instrumentWoodwindOcarina, character)
														end)
													end)

													pcall(function()
														ReplicatedStorage_.MenuToys.DestroyToy:FireServer(instrumentWoodwindOcarina)
													end)

													local humanoid = character:FindFirstChild("Humanoid")

													if humanoid then
														pcall(function()
															humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
														end)

														pcall(function()
															humanoid.AutoRotate = true
														end)
													end

													pcall(function()
														partOwner.Value = ""
													end)

													if humanoid and humanoid.Sit then
														humanoid.Sit = false
													end
												end
											end
										end
									end
								else
									local character = v49.Character
									local canSpawnToy = v49:FindFirstChild("CanSpawnToy")
									local flag14 = character and canSpawnToy and canSpawnToy.Value and not now2

									if flag14 then
										flag14 = tick() - (gucciLastSpawn or 0) > 5
									end

									if flag14 then
										now2 = tick()
										gucciLastSpawn = tick()

										task.spawn(function()
											pcall(function()
												ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("InstrumentWoodwindOcarina", CFrame.new(100000, 100000, 100000), Vector3.zero)
											end)
										end)
									else
										local flag15 = now2 and tick() - now2 > 1

										if flag15 then
											flag15 = not (v50 and v50:FindFirstChild("InstrumentWoodwindOcarina"))
										end

										if flag15 then
											now2 = nil
										end
									end

									local flag15 = false

									if character then
										for _, child in pairs(character:GetChildren()) do
											local partOwner = child:FindFirstChild("PartOwner")

											if partOwner and partOwner.Value ~= "" then
												flag15 = true
											end
										end
									end

									if flag15 then
										pcall(function()
											ReplicatedStorage_.CharacterEvents.Struggle:FireServer(v49)
										end)

										local humanoid = character and character:FindFirstChild("Humanoid")

										if humanoid then
											pcall(function()
												humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
											end)

											pcall(function()
												humanoid.AutoRotate = true
											end)

											pcall(function()
												humanoid.PlatformStand = false
											end)

											if humanoid.Sit then
												pcall(function()
													humanoid.Sit = false
												end)
											end

											local ragdolled = humanoid:FindFirstChild("Ragdolled")

											if ragdolled and ragdolled.Value then
												pcall(function()
													ragdolled.Value = false
												end)
											end

											for _, v51 in ipairs(humanoid:GetPlayingAnimationTracks()) do
												if v51.Animation and v51.Animation.AnimationId == "rbxassetid://7047322890" then
													pcall(function()
														v51:Stop()
													end)
												end
											end
										end
									end
								end

								local character = v49.Character
								local humanoid = character and character:FindFirstChild("Humanoid")

								if humanoid and gucciActive then
									if humanoid.PlatformStand then
										pcall(function()
											humanoid.PlatformStand = false
										end)
									end

									local ragdolled = humanoid:FindFirstChild("Ragdolled")

									if ragdolled and ragdolled.Value then
										pcall(function()
											ragdolled.Value = false
										end)
									end

									for _, v51 in ipairs(humanoid:GetPlayingAnimationTracks()) do
										if v51.Animation and v51.Animation.AnimationId == "rbxassetid://7047322890" then
											pcall(function()
												v51:Stop()
											end)
										end
									end
								end
							end)

							task.wait(0.05)
						end
					end)
				end

				local function fn55()
					gucciActive = false

					if thread then
						pcall(function()
							task.cancel(thread)
						end)

						thread = nil
					end

					pcall(function()
						local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

						if v49 then
							local instrumentWoodwindOcarina = v49:FindFirstChild("InstrumentWoodwindOcarina")

							if instrumentWoodwindOcarina then
								pcall(function()
									ReplicatedStorage_.MenuToys.DestroyToy:FireServer(instrumentWoodwindOcarina)
								end)
							end
						end
					end)
				end

				local tbl8 = {}
				local flag14 = false
				local tbl9 = {}
				agFlingCap = 120
				agRagdollNetT = 0
				agRagdollFlingT = 0

				agRagdollNetGate = function()
					local v49 = agRagdollNetT
					if tick() - v49 < 0.12 then
						return false
					end
					agRagdollNetT = tick()
					return true
				end

				agRagdollFlingGate = function()
					local v49 = agRagdollFlingT
					if tick() - v49 < 0.1 then
						return false
					end
					agRagdollFlingT = tick()
					return true
				end

				local n26 = 0

				local function fn56()
					for _, v49 in pairs(tbl9) do
						pcall(function()
							if v49 and v49.Parent then
								v49:Destroy()
							end
						end)
					end

					tbl9 = {}
				end

				agRagdollHardClear = function()
					local character = localPlayer.Character
					if not character then
						return
					end
					local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
					local destroyGrabLine = grabEvents and grabEvents:FindFirstChild("DestroyGrabLine")

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							if setNetworkOwner then
								pcall(function()
									setNetworkOwner:FireServer(child, child.CFrame)
								end)
							end

							if destroyGrabLine then
								pcall(function()
									destroyGrabLine:FireServer(child)
								end)
							end

							local partOwner = child:FindFirstChild("PartOwner")

							if partOwner and partOwner:IsA("StringValue") and partOwner.Value ~= localPlayer.Name then
								pcall(function()
									partOwner.Value = localPlayer.Name
								end)
							end

							local heldBy = child:FindFirstChild("HeldBy") or child:FindFirstChild("GrabbedBy")

							if heldBy then
								pcall(function()
									heldBy.Value = nil
								end)
							end
						end
					end

					pcall(function()
						wraithBindsChar(Workspace, character)
					end)

					local humanoid = character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
					local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

					if humanoid then
						pcall(function()
							humanoid.PlatformStand = false
						end)

						pcall(function()
							humanoid.Sit = false
						end)

						local ragdolled = humanoid:FindFirstChild("Ragdolled")

						if ragdolled then
							pcall(function()
								ragdolled.Value = false
							end)
						end

						pcall(function()
							humanoid:ChangeState(Enum.HumanoidStateType.Running)
						end)
					end

					if ragdollRemote and humanoidRootPart then
						pcall(function()
							ragdollRemote:FireServer(humanoidRootPart, 0)
						end)

						pcall(function()
							ragdollRemote:FireServer(humanoidRootPart, 0)
						end)
					end

					local isHeld = localPlayer:FindFirstChild("IsHeld")

					if isHeld then
						pcall(function()
							isHeld.Value = false
						end)
					end
				end

				local function fn57()
					flag14 = false
					pcall(fn56)
					n26 = 0

					for k, v49 in pairs(tbl8) do
						pcall(function()
							if k ~= "hb" and k ~= "ca" and k ~= "ih" then
								v49:Disconnect()
							end
						end)
					end

					pcall(function()
						if tbl8.hb then
							tbl8.hb:Disconnect()
						end
					end)

					pcall(function()
						if tbl8.ca then
							tbl8.ca:Disconnect()
						end
					end)

					pcall(function()
						if tbl8.ih then
							tbl8.ih:Disconnect()
						end
					end)

					tbl8 = {}
				end

				AG_LIMB_OFFSETS = {
					Head = CFrame.new(0, 1.5, 0),
					["Left Arm"] = CFrame.new(-1.5, 0, 0),
					["Right Arm"] = CFrame.new(1.5, 0, 0),
					["Left Leg"] = CFrame.new(-0.5, -2, 0),
					["Right Leg"] = CFrame.new(0.5, -2, 0),
					Torso = CFrame.new(),
				}

				agEscaping = false
				agHeldState = false
				local connection = nil
				local cFrame = nil

				local function fn58(arg)
					if arg and arg:IsA("BasePart") then
						arg.AssemblyLinearVelocity = Vector3.zero
						arg.AssemblyAngularVelocity = Vector3.zero
					end
				end

				local function fn59(arg, arg2)
					if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
						return
					end

					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("BasePart") then
							pcall(function()
								child.CanCollide = arg2 and true or false
							end)
						end
					end
				end

				local function fn60(arg, arg2)
					if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
						return false
					end
					local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return false
					end
					local torso = arg:FindFirstChild("Torso")
					if not torso then
						return false
					end
					local neck = torso:FindFirstChild("Neck")
					if neck and neck.Enabled == true then
						return false
					end

					for k, v49 in pairs(AG_LIMB_OFFSETS) do
						local v50 = arg:FindFirstChild(k)

						if v50 and v50:IsA("BasePart") then
							pcall(function()
								v50.CFrame = humanoidRootPart.CFrame * v49

								if arg2 then
									fn58(v50)
								end
							end)
						end
					end

					return true
				end

				agExtraEscape = function()
					local v49, v50, v51 = fn11()
					if not (v51 and v50) or v50.Health == 0 or agEscaping then
						return
					end
					local inPlot = localPlayer:FindFirstChild("InPlot")
					if inPlot and inPlot.Value then
						return
					end
					agEscaping = true
					local waypoints = Workspace:FindFirstChild("Waypoints")
					waypoints = waypoints and waypoints:FindFirstChild("TudorHouse")
					if not waypoints then
						agEscaping = false
						return
					end
					local TractorGreen = fn20("TractorGreen", waypoints.CFrame)
					if not TractorGreen then
						agEscaping = false
						return
					end
					local vehicleSeat = TractorGreen:WaitForChild("VehicleSeat", 1)

					if not vehicleSeat then
						agEscaping = false

						pcall(function()
							ReplicatedStorage_.MenuToys.DestroyToy:FireServer(TractorGreen)
						end)

						return
					end

					local now2 = tick()
					local flag15 = false
					v50.Sit = false
					vehicleSeat:Sit(v50)

					local connection2 = vehicleSeat.ChildAdded:Connect(function(child)
						if child.Name == "SeatWeld" then
							child.Enabled = false
							flag15 = true
							child:Destroy()
						end
					end)

					while true do
						RunService.Heartbeat:Wait()

						if flag15 then
							break
						elseif tick() - now2 > 0.7 then
							break
						end
					end

					pcall(function()
						connection2:Disconnect()
					end)

					v50.Sit = false
					agEscaping = false

					pcall(function()
						ReplicatedStorage_.MenuToys.DestroyToy:FireServer(TractorGreen)
					end)
				end

				local function fn61()
					if connection then
						pcall(function()
							connection:Disconnect()
						end)

						connection = nil
					end

					agHeldState = false
					local v49
					v49, v49 = fn11()

					if v49 then
						if antiGrabMode == "Anti-Kill" then
							task.delay(0.1, function()
								if v49.Parent then
									v49.Sit = false
								end
							end)
						end

						v49.AutoRotate = true
					end
				end

				local function fn62()
					local isHeld = localPlayer:FindFirstChild("IsHeld")
					local flag15 = not antiGrabActive

					if not flag15 then
						flag15 = not (isHeld and isHeld.Value)
					end

					if flag15 or agHeldState then
						return
					end
					local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
					local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")
					local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

					if struggle then
						pcall(function()
							struggle:FireServer(localPlayer)
						end)
					end

					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
					local torso = character and character:FindFirstChild("Torso")
					local neck = torso and torso:FindFirstChild("Neck")
					if not humanoid or not torso then
						return
					end
					humanoid.RequiresNeck = false
					fn58(humanoidRootPart or torso)
					cFrame = torso.CFrame
					agHeldState = true
					local flag16 = antiGrabMode == "Universal"
					local sit = antiGrabMode == "Anti-Kill"
					local flag17 = antiGrabMode == "No Ragdoll"

					if flag16 then
						task.spawn(agExtraEscape)
					end

					local now2 = tick()

					connection = RunService.Heartbeat:Connect(function(deltaTime)
						if struggle then
							pcall(function()
								struggle:FireServer(localPlayer)
							end)
						end

						if humanoidRootPart and not flag16 and not flag17 and ragdollRemote then
							pcall(function()
								ragdollRemote:FireServer(humanoidRootPart, sit and 0.11 or 0)
							end)
						end

						if flag16 then
							if tick() - now2 > 2 then
								task.spawn(agExtraEscape)
								now2 = tick()
							end
						end

						local moveDirection = humanoid.MoveDirection
						local n27 = 16

						if humanoid.WalkSpeed > 16 then
							n27 = humanoid.WalkSpeed
						end

						if moveDirection.Magnitude > 0 and cFrame then
							cFrame += moveDirection.Unit * n27 * deltaTime
							local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)

							if vector.Magnitude > 0 then
								local position = cFrame.Position
								cFrame = cFrame:Lerp(CFrame.lookAt(position, position + vector.Unit), 0.12)
							end
						end

						fn58(humanoidRootPart or torso)

						if cFrame then
							torso.CFrame = cFrame
						end

						humanoid.Sit = sit

						if fn26("ag_coll", 0.15) then
							task.spawn(fn59, character, false)
						end

						if (not neck or not neck.Enabled) and fn26("ag_limbs", 0.06) then
							task.spawn(fn60, character)
						end

						if fn26("ag_anim", 0.2) then
							for _, v49 in ipairs(humanoid:GetPlayingAnimationTracks()) do
								local animation = v49.Animation

								if animation and animation.AnimationId == "rbxassetid://7047322890" then
									v49:Stop()
								end
							end
						end

						if humanoidRootPart then
							local scream = humanoidRootPart:FindFirstChild("Scream")

							if scream then
								scream.Playing = false
							end
						end

						local isHeld2 = localPlayer:FindFirstChild("IsHeld")

						if not (isHeld2 and isHeld2.Value) or not antiGrabActive then
							agHeldState = false

							if sit then
								task.delay(0.1, function()
									if humanoid.Parent then
										humanoid.Sit = false
									end
								end)
							end

							humanoid.AutoRotate = true

							if connection then
								connection:Disconnect()
								connection = nil
							end
						end
					end)
				end

				task.spawn(function()
					while task.wait(0.08) do
						if antiGrabActive then
							local isHeld = localPlayer:FindFirstChild("IsHeld")

							if isHeld and isHeld.Value or agHeldState then
								pcall(fn62)
							end
						elseif agHeldState then
							pcall(fn61)
						end
					end
				end)

				local function fn63()
					if antiGrabMode == "Seatless Gucci" then
						fn54()
					end
				end

				local function fn64()
					fn53()
					fn55()
					fn57()
					fn61()
				end

				local v49 = nil

				local v50 = v21:AddLabel("Anti Grab"):AddToggle({
					Flag = "WR27",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR27") or "WR27") .. ": " .. (arg and "on" or "off"))
							end
						end)

						antiGrabActive = arg

						if v49 then
							pcall(function()
								v49:SetVisible(arg)
							end)
						end

						if arg then
							fn63()
						else
							fn64()
						end
					end,
				})

				v49 = v21:AddLabel("Anti Grab Method")

				v49:AddDropdown({
					Values = { "Default", "Universal", "Anti-Kill", "No Ragdoll", "Seatless Gucci" },
					Default = "Default",
					Flag = "WR30",
					Callback = function(arg)
						antiGrabMode = arg

						if antiGrabActive then
							fn64()
							fn63()
						end
					end,
				})

				pcall(function()
					v49:SetVisible(v50 and v50:GetValue() or false)
				end)
			end

			local tbl8 = { ocarinaSpawnAt = nil }

			wraithGrabbedParts = function()
				local character = localPlayer.Character
				if not character then
					return nil
				end
				local tbl9 = {}

				for _, child in ipairs(character:GetChildren()) do
					local partOwner = child:FindFirstChild("PartOwner")

					if partOwner and tostring(partOwner.Value) ~= "" then
						table.insert(tbl9, child)
					end
				end

				if localPlayer:FindFirstChild("IsHeld") and localPlayer.IsHeld.Value then
					if #tbl9 == 0 then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							table.insert(tbl9, humanoidRootPart)
						end
					end
				end

				return tbl9
			end

			wraithFindOcarina = function()
				local instrumentWoodwindOcarina = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
				instrumentWoodwindOcarina = instrumentWoodwindOcarina and instrumentWoodwindOcarina:FindFirstChild("InstrumentWoodwindOcarina")
				if instrumentWoodwindOcarina then
					return instrumentWoodwindOcarina
				end
				local plotItems = Workspace:FindFirstChild("PlotItems")
				local plots = Workspace:FindFirstChild("Plots")

				if plotItems and plots then
					for _, child in ipairs(plots:GetChildren()) do
						local plotSign = child:FindFirstChild("PlotSign")
						plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

						if plotSign then
							for _, child2 in ipairs(plotSign:GetChildren()) do
								if child2.Value ~= localPlayer.Name then
									continue
								end
								local instrumentWoodwindOcarina2 = plotItems:FindFirstChild(child.Name)
								instrumentWoodwindOcarina2 = instrumentWoodwindOcarina2 and instrumentWoodwindOcarina2:FindFirstChild("InstrumentWoodwindOcarina")
								if instrumentWoodwindOcarina2 then
									return instrumentWoodwindOcarina2
								end
							end
						end
					end
				end

				return nil
			end

			wraithEnsureOcarina = function()
				local v48 = wraithFindOcarina()
				if v48 then
					tbl8.ocarinaSpawnAt = nil
					return v48
				end
				local canSpawnToy = localPlayer:FindFirstChild("CanSpawnToy")

				if localPlayer.Character and canSpawnToy and canSpawnToy.Value and not tbl8.ocarinaSpawnAt then
					tbl8.ocarinaSpawnAt = tick()

					task.spawn(function()
						pcall(function()
							ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("InstrumentWoodwindOcarina", CFrame.new(100000, 100000, 100000), Vector3.zero)
						end)
					end)
				else
					local ocarinaSpawnAt = tbl8.ocarinaSpawnAt

					if ocarinaSpawnAt then
						local ocarinaSpawnAt2 = tbl8.ocarinaSpawnAt
						ocarinaSpawnAt = tick() - ocarinaSpawnAt2 > 1
					end

					if ocarinaSpawnAt then
						tbl8.ocarinaSpawnAt = nil
					end
				end

				return nil
			end

			wraithBreakHold = function(arg)
				local character = localPlayer.Character
				if not character then
					return false
				end
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				local v48 = wraithGrabbedParts()
				if not (v48 and #v48 > 0) then
					return false
				end
				local v49 = arg and wraithEnsureOcarina() or nil

				if v49 and v49:FindFirstChild("HoldPart") and v49.HoldPart:FindFirstChild("HoldItemRemoteFunction") then
					task.spawn(function()
						pcall(function()
							v49.HoldPart.HoldItemRemoteFunction:InvokeServer(v49, character)
						end)
					end)

					pcall(function()
						ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v49)
					end)

					if humanoid then
						pcall(function()
							humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
							humanoid.AutoRotate = true
						end)
					end
				end

				for _, v50 in ipairs(v48) do
					local partOwner = v50:FindFirstChild("PartOwner")

					if partOwner then
						pcall(function()
							partOwner.Value = ""
						end)
					end
				end

				pcall(function()
					local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")

					if characterEvents then
						if characterEvents:FindFirstChild("Struggle") then
							characterEvents.Struggle:FireServer(localPlayer)
						end

						if humanoidRootPart and characterEvents:FindFirstChild("RagdollRemote") then
							characterEvents.RagdollRemote:FireServer(humanoidRootPart, 1e-11)
						end
					end

					if localPlayer:FindFirstChild("IsHeld") then
						localPlayer.IsHeld.Value = false
					end

					if humanoid then
						if humanoid.Sit then
							humanoid.Sit = false
						end

						humanoid.PlatformStand = false

						for _, v50 in ipairs(humanoid:GetPlayingAnimationTracks()) do
							if v50.Animation and v50.Animation.AnimationId == "rbxassetid://7047322890" then
								v50:Stop()
							end
						end
					end
				end)

				return true
			end

			do
				local flag13 = false
				local thread = nil
				local v48 = antiOwnGroup:AddLabel("Anti Own")
				antiNetOwnType = "FoodHamburger"
				antiNetOwnDelay = 0.1
				antiNetOwnTransparency = 1

				v48:AddToggle({
					Flag = "WR29",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR29") or "WR29") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread then
							pcall(function()
								task.cancel(thread)
							end)

							thread = nil
						end

						if not arg then
							pcall(function()
								local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
								local v50 = v49 and v49:FindFirstChild(antiNetOwnType)

								if v50 then
									ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v50)
								end

								local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")
								grabEvents = grabEvents and grabEvents:FindFirstChild("EndGrabEarly")

								if grabEvents then
									grabEvents:Destroy()
								end
							end)

							return
						end

						thread = task.spawn(function()
							local v49 = nil
							local remoteEvent

							while flag13 do
								task.wait(antiNetOwnDelay)
								local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")

								if grabEvents and not remoteEvent then
									pcall(function()
										local endGrabEarly = grabEvents:FindFirstChild("EndGrabEarly")

										if endGrabEarly then
											endGrabEarly:Destroy()
										end

										remoteEvent = Instance.new("RemoteEvent")
										remoteEvent.Name = "EndGrabEarly"
										remoteEvent.Parent = grabEvents
									end)
								end

								local character = localPlayer.Character
								local humanoid = nil

								if character then
									humanoid = character:FindFirstChildOfClass("Humanoid")
								end

								if not (v49 and v49.Parent) then
									v49 = fn20(antiNetOwnType, CFrame.new(0, 1e20, 0))
								end

								if v49 and v49.Parent then
									local holdPart = v49:FindFirstChild("HoldPart") or v49:WaitForChild("HoldPart", 2)
									local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
									local dropItemRemoteFunction = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
									local rigidConstraint = holdPart and holdPart:FindFirstChild("RigidConstraint")

									pcall(function()
										for _, descendant in ipairs(v49:GetDescendants()) do
											if descendant:IsA("BasePart") then
												descendant.CanCollide = false

												if descendant:IsA("MeshPart") or descendant.Name == "Part" then
													descendant.Transparency = antiNetOwnTransparency
												end
											elseif descendant:IsA("Decal") then
												descendant.Transparency = antiNetOwnTransparency
											end
										end
									end)

									if character and humanoid and humanoid.Health > 0 and holdPart and holdItemRemoteFunction and dropItemRemoteFunction then
										task.spawn(function()
											pcall(function()
												local vector = Vector3.new
												dropItemRemoteFunction:InvokeServer(v49, CFrame.new(0, 1e20, 0), vector())
											end)
										end)

										task.spawn(function()
											pcall(function()
												holdItemRemoteFunction:InvokeServer(v49, character)
											end)
										end)

										if rigidConstraint then
											local leftArm = character:FindFirstChild("Left Arm")
											local rightArm = character:FindFirstChild("Right Arm")
											leftArm = leftArm and leftArm:FindFirstChild("LeftGripAttachment")
											rightArm = rightArm and rightArm:FindFirstChild("RightGripAttachment")
											local attachment1 = rigidConstraint.Attachment1

											if attachment1 and attachment1 ~= leftArm and attachment1 ~= rightArm then
												pcall(function()
													ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v49)
												end)

												v49 = nil
											end
										end
									else
										pcall(function()
											ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v49)
										end)

										v49 = nil
									end
								end
							end

							if v49 then
								pcall(function()
									ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v49)
								end)
							end

							if remoteEvent then
								pcall(function()
									remoteEvent:Destroy()
								end)
							end
						end)
					end,
				})
			end

			ANTI_OWN_ITEMS = {
				Hamburger = "FoodHamburger",
				Coconut = "FoodCoconut",
				["Cheese Pizza"] = "FoodPizzaCheese",
				["Pepperoni Pizza"] = "FoodPizzaPepperoni",
				Hotdog = "FoodHotdog",
				["Poison Mushroom"] = "FoodMushroomPoison",
				Bread = "FoodBread",
				["Dippy Egg"] = "FoodDippyEgg",
				Mayonnaise = "FoodMayonnaise",
				["French Fries"] = "FoodFrenchFries",
				["Meat Stick"] = "FoodMeatStick",
				Donut = "FoodDonut",
				["Pink Cake"] = "FoodCakePink",
				Banana = "FoodBanana",
				Banjo = "InstrumentGuitarBanjo",
				Violin = "InstrumentGuitarViolin",
				Ukulele = "InstrumentGuitarUkulele",
				Saxophone = "InstrumentWoodwindSaxophone",
				Ocarina = "InstrumentWoodwindOcarina",
				Vuvuzela = "InstrumentBrassVuvuzelaQwizik",
				Trumpet = "InstrumentBrassTrumpet",
				Bongos = "InstrumentDrumBongos",
				Snare = "InstrumentDrumSnare",
				Melodica = "InstrumentPianoMelodica",
				Microphone = "InstrumentVoiceMicrophone",
				["White Mug"] = "CupMugWhite",
				["Brown Mug"] = "CupMugBrown",
				Poop = "PoopPile",
				["Sparkle Poop"] = "PoopPileSparkle",
				Snowball = "BallSnowball",
				Shuriken = "NinjaShuriken",
				Kunai = "NinjaKunai",
				Plate = "FoodPlate",
				["Alarm Clock"] = "ClockAlarm",
				["Spooky Candle"] = "SpookyCandle1",
			}

			ANTI_OWN_NAMES = {}

			for k in pairs(ANTI_OWN_ITEMS) do
				table.insert(ANTI_OWN_NAMES, k)
			end

			table.sort(ANTI_OWN_NAMES)

			antiOwnGroup:AddLabel("Anti Own Toy"):AddDropdown({
				Values = ANTI_OWN_NAMES,
				Default = "Hamburger",
				Flag = "AntiNetOwnToy",
				Callback = function(arg)
					antiNetOwnType = ANTI_OWN_ITEMS[arg] or "FoodHamburger"
				end,
			})

			antiOwnGroup:AddLabel("Anti Own Delay"):AddSlider({
				Min = 1,
				Max = 100,
				Default = 10,
				Rounding = 0,
				Flag = "AntiNetOwnDelay",
				Callback = function(arg)
					antiNetOwnDelay = arg / 100
				end,
			})

			antiOwnGroup:AddLabel("Anti Own Transparency"):AddSlider({
				Min = 0,
				Max = 100,
				Default = 100,
				Rounding = 0,
				Flag = "AntiNetOwnTrans",
				Callback = function(arg)
					antiNetOwnTransparency = arg / 100
				end,
			})

			counterConns = counterConns or {}

			counterTrigger = counterTrigger or function()
			end

			counterCooldown = 0.5
			counterDuration = 2
			counterMaxParallel = 3
			counterRunning = 0

			do
				local flag13 = false
				rbBusy = false
				rbLast = 0
				local v48 = v22:AddLabel("Reset Bind")

				v48:AddToggle({
					Default = false,
					Flag = "ResetBindOn",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ResetBindOn") or "ResetBindOn") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg
					end,
				})

				v48:AddKeybind({
					Flag = "ResetBindKey",
					Callback = function(arg)
						if not arg or not flag13 then
							return
						end

						if rbBusy then
							return
						end

						if tick() - (rbLast or 0) < 2 then
							return
						end
						rbLast = tick()
						rbBusy = true

						task.delay(2, function()
							rbBusy = false
						end)

						fn17("reset_bind", function()
							local v49, v50 = fn11()
							if not v49 then
								return
							end

							if v50 then
								pcall(function()
									v50.Sit = false
								end)

								pcall(function()
									v50.PlatformStand = false
								end)

								pcall(function()
									v50.BreakJointsOnDeath = true
								end)

								pcall(function()
									v50.RequiresNeck = true
								end)
							end

							pcall(function()
								local head = v49:FindFirstChild("Head")

								if head then
									for _, descendant in ipairs(v49:GetDescendants()) do
										if descendant:IsA("Motor6D") or descendant:IsA("Weld") or descendant:IsA("WeldConstraint") then
											if descendant.Part0 == head or descendant.Part1 == head then
												descendant:Destroy()
											end
										end
									end

									head:Destroy()
								end
							end)

							pcall(function()
								if v50 then
									v50.Health = 0
								end
							end)

							fn10("wraith", "reset")
						end)
					end,
				})
			end

			do
				local flag13 = false
				local str6 = "Soft"
				local thread = nil
				adRakHooked = false
				adRakConns = {}

				local function fn52()
					local tbl9 = {}
					local v48 = nil

					for _, v49 in ipairs({ setfflag, setflag, setrbxflag }) do
						if typeof(v49) == "function" then
							v48 = v49
							break
						end
					end

					if v48 then
						for _, v49 in ipairs({
							{ "DebugSendDist", "100000" },
							{ "PhysicsSenderMaxBandwidthBps", "1000000000" },
							{ "S2PhysicsSenderRate", "120" },
							{ "PhysicsSenderMaxThrottleRatio", "0" },
							{ "NetworkOwnershipRadius", "100000" },
						}) do
							if pcall(function()
								v48(v49[1], v49[2])
							end) then
								table.insert(tbl9, v49[1])
							end
						end
					end

					pcall(function()
						if sethiddenproperty then
							sethiddenproperty(localPlayer, "SimulationRadius", math.huge)
							sethiddenproperty(localPlayer, "MaximumSimulationRadius", math.huge)
							table.insert(tbl9, "SimulationRadius")
						end
					end)

					if not adRakHooked then
						if pcall(function()
							local NetworkClient = game:GetService("NetworkClient")
							if not NetworkClient then
								return
							end

							for _, child in ipairs(NetworkClient:GetChildren()) do
								if child:IsA("ClientReplicator") then
									pcall(function()
										child:SetOutgoingKBPSLimit(9e9)
									end)

									table.insert(adRakConns, child)
									table.insert(tbl9, "ClientReplicator")
								end
							end

							table.insert(adRakConns, NetworkClient.ChildAdded:Connect(function(child)
								if child:IsA("ClientReplicator") then
									pcall(function()
										child:SetOutgoingKBPSLimit(9e9)
									end)
								end
							end))
						end) then
							adRakHooked = true
						end
					end

					pcall(function()
						if settings and settings() then
							local network = settings():FindFirstChild("Network")

							if network then
								pcall(function()
									network.IncomingReplicationLag = 0
								end)

								table.insert(tbl9, "IncomingReplicationLag")
							end
						end
					end)

					if #tbl9 == 0 then
						return false, "инжектор не дал доступ к сети"
					end
					return true, "raknet: " .. table.concat(tbl9, ", ")
				end

				adRakTick = function()
					pcall(function()
						if sethiddenproperty then
							sethiddenproperty(localPlayer, "SimulationRadius", math.huge)
						end
					end)

					pcall(function()
						local NetworkClient = game:GetService("NetworkClient")
						if not NetworkClient then
							return
						end

						for _, child in ipairs(NetworkClient:GetChildren()) do
							if child:IsA("ClientReplicator") then
								pcall(function()
									child:SetOutgoingKBPSLimit(9e9)
								end)
							end
						end
					end)
				end

				v24:AddLabel("Anti Desync"):AddToggle({
					Default = false,
					Flag = "AntiDesync",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiDesync") or "AntiDesync") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread then
							pcall(task.cancel, thread)
							thread = nil
						end

						if not arg then
							return
						end

						if str6 == "RakNet" then
							local v48, v49 = fn52()
							fn10("wraith", "anti desync raknet: " .. (v48 and v49 or "недоступно (" .. v49 .. "), работаю в Soft"))
						end

						thread = task.spawn(function()
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local n26 = 0
							local n27 = 0

							while flag13 do
								pcall(function()
									local v48, v49, v50 = fn11()
									if not (v48 and v49 and v50) then
										return
									end

									if wraithDefenseBlocked() then
										return
									end

									if fn12(v48) or v49.SeatPart then
										return
									end

									if v50.AssemblyLinearVelocity.Magnitude > 400 then
										v50.AssemblyLinearVelocity = Vector3.zero
									end

									if v50.AssemblyAngularVelocity.Magnitude > 250 then
										v50.AssemblyAngularVelocity = Vector3.zero
									end

									if setNetworkOwner and tick() - n27 > 0.4 then
										n27 = tick()

										for _, child in ipairs(v48:GetChildren()) do
											if child:IsA("BasePart") and wraithHeldByOther(child) then
												pcall(function()
													setNetworkOwner:FireServer(child, child.CFrame)
												end)
											end
										end
									end

									if tick() - n26 > 0.5 then
										n26 = tick()

										pcall(function()
											ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
										end)

										if str6 == "RakNet" then
											pcall(adRakTick)
										end
									end
								end)

								task.wait(0.1)
							end
						end)
					end,
				})

				v24:AddLabel("Anti Desync Mode"):AddDropdown({
					Flag = "AntiDesyncMode",
					Values = { "Soft", "RakNet" },
					Default = "Soft",
					Callback = function(arg)
						str6 = arg
					end,
				})
			end

			local connection = nil

			v21:AddLabel("Anti Explosion"):AddToggle({
				Default = false,
				Flag = "AntiExplosion",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiExplosion") or "AntiExplosion") .. ": " .. (arg and "on" or "off"))
						end
					end)

					antiExplosionActive = arg

					if arg then
						connection = Workspace.ChildAdded:Connect(function(child)
							if child.Name == "Part" and antiExplosionActive then
								local character = localPlayer.Character
								local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart and (child.Position - humanoidRootPart.Position).Magnitude <= 20 then
									humanoidRootPart.Anchored = true
									task.wait(0.01)
									local rightArm = character:FindFirstChild("Right Arm")

									if rightArm then
										local ragdollLimbPart = rightArm:FindFirstChild("RagdollLimbPart")

										if ragdollLimbPart then
											while ragdollLimbPart.CanCollide and antiExplosionActive do
												task.wait(0.001)
											end
										end
									end

									if antiExplosionActive then
										humanoidRootPart.Anchored = false
									end
								end
							end
						end)
					else
						if connection then
							connection:Disconnect()
							connection = nil
						end

						local character = localPlayer.Character

						if character then
							local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart then
								humanoidRootPart.Anchored = false
							end
						end
					end
				end,
			})

			do
				local flag13 = false
				local connection2 = nil

				local function fn52(arg)
					if connection2 then
						pcall(function()
							connection2:Disconnect()
						end)

						connection2 = nil
					end

					local humanoid = arg and arg:FindFirstChild("Humanoid")
					local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
					if not (humanoid and humanoidRootPart) then
						return
					end
					local fireDebounce = humanoid:FindFirstChild("FireDebounce")
					if not fireDebounce then
						return
					end
					arg.PrimaryPart = humanoidRootPart

					connection2 = fireDebounce.Changed:Connect(function(arg2)
						if arg2 then
						end
					end)
				end

				localPlayer.CharacterAdded:Connect(function(character)
					if flag13 then
						task.spawn(function()
							task.wait(0.2)

							if flag13 then
								fn52(character)
							end
						end)
					end
				end)
			end

			do
				local flag13 = false
				local connection2 = nil

				v21:AddLabel("Anti Void"):AddToggle({
					Default = false,
					Flag = "AntiVoid",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiVoid") or "AntiVoid") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							pcall(function()
								connection2:Disconnect()
							end)

							connection2 = nil
						end

						if not arg then
							return
						end
						local cFrame = nil
						local n26 = 0

						connection2 = RunService.Heartbeat:Connect(function()
							if not flag13 then
								return
							end

							pcall(function()
								local v48, v49, v50 = fn11()
								if not (v49 and v50) then
									return
								end
								local position = v50.Position
								local now2 = tick()

								if now2 - n26 > 0.5 and v49.FloorMaterial ~= Enum.Material.Air and position.Y > -10 and v50.AssemblyLinearVelocity.Magnitude < 100 and not fn12(v48) then
									cFrame = v50.CFrame
									n26 = now2
								end

								if position.Y < -25 then
									v50.CFrame = (cFrame or fn19(nil)) + Vector3.new(0, 3, 0)
									v50.AssemblyLinearVelocity = Vector3.zero
									v50.AssemblyAngularVelocity = Vector3.zero
									v49.PlatformStand = false

									pcall(function()
										ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(v50, 0)
									end)

									pcall(function()
										ReplicatedStorage_.CharacterEvents.Struggle:FireServer(localPlayer)
									end)
								end
							end)
						end)
					end,
				})
			end

			v21:AddLabel("Anti Sticky"):AddToggle({
				Default = false,
				Flag = "AntiSticky",
				Callback = function(disabled)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiSticky") or "AntiSticky") .. ": " .. (disabled and "on" or "off"))
						end
					end)

					local stickyPartsTouchDetection = localPlayer.PlayerScripts:FindFirstChild("StickyPartsTouchDetection")

					if stickyPartsTouchDetection then
						stickyPartsTouchDetection.Disabled = disabled
					end
				end,
			})

			local grabEvents = ReplicatedStorage_:FindFirstChild("GrabEvents")

			if grabEvents then
				local createGrabLine = grabEvents:FindFirstChild("CreateGrabLine")
				local extendGrabLine = grabEvents:FindFirstChild("ExtendGrabLine")

				if createGrabLine then
					createGrabLine:Clone()
				end

				if extendGrabLine then
					extendGrabLine:Clone()
				end
			end

			do
				local tbl9 = {}
				local tbl10 = {}

				local function fn52(arg)
					if not arg:IsA("BasePart") then
						return false
					end
					return string.lower(tostring(arg.Name)):find("paint", 1, true) ~= nil
				end

				local function fn53()
					for _, descendant in pairs(Workspace:GetDescendants()) do
						if fn52(descendant) then
							local clone = descendant:Clone()
							clone.Archivable = true
							local tbl11 = { clone = clone, parent = descendant.Parent }
							tbl9[descendant:GetDebugId()] = tbl11
							descendant:Destroy()
						end
					end
				end

				local function fn54()
					for _, v48 in pairs(tbl9) do
						if v48.clone and v48.parent then
							v48.clone.Parent = v48.parent
						end
					end

					tbl9 = {}
				end

				local function fn55()
					table.insert(tbl10, Workspace.DescendantAdded:Connect(function(descendant)
						if fn52(descendant) then
							task.defer(function()
								if descendant and descendant.Parent then
									local clone = descendant:Clone()
									clone.Archivable = true
									local tbl11 = { clone = clone, parent = descendant.Parent }
									tbl9[descendant:GetDebugId()] = tbl11
									descendant:Destroy()
								end
							end)
						end
					end))
				end

				local function fn56()
					for _, v48 in pairs(tbl10) do
						if v48.Connected then
							v48:Disconnect()
						end
					end

					tbl10 = {}
				end

				local function fn57(canTouch)
					local v48 = Workspace:FindFirstChild(localPlayer.Name)
					if not v48 then
						return
					end

					for _, child in pairs(v48:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanTouch = canTouch
						end
					end
				end

				v23:AddLabel("Anti Paint"):AddToggle({
					Default = false,
					Flag = "AntiPaint",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiPaint") or "AntiPaint") .. ": " .. (arg and "on" or "off"))
							end
						end)

						if arg then
							fn53()
							fn55()
							fn57(false)
						else
							fn54()
							fn56()
							fn57(true)
						end
					end,
				})
			end

			do
				local flag13 = false
				local thread = nil

				v21:AddLabel("Loop Ragdoll (Walk)"):AddToggle({
					Flag = "WR32",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR32") or "WR32") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread then
							pcall(task.cancel, thread)
							thread = nil
						end

						if not arg then
							task.spawn(function()
								local v48, v49, v50 = fn11()

								if v50 then
									local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
									local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

									if ragdollRemote then
										pcall(function()
											ragdollRemote:FireServer(v50, 0)
										end)
									end
								end
							end)

							return
						end

						thread = task.spawn(function()
							local tbl9 = {}

							local function fn52()
								local v48, v49, v50 = fn11()
								if not (v48 and v49 and v50) then
									return
								end
								local torso = v48:FindFirstChild("Torso")
								if not torso then
									return
								end

								for _, v51 in ipairs({ "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
									local v52 = v48:FindFirstChild(v51)

									if v52 and v52:IsA("BasePart") and not tbl9[v52] then
										local weldConstraint = Instance.new("WeldConstraint")
										weldConstraint.Part0 = torso
										weldConstraint.Part1 = v52
										weldConstraint.Parent = torso
										tbl9[v52] = weldConstraint
									end
								end
							end

							pcall(fn52)
							local n26 = 0
							local n27 = 18
							local y = nil

							pcall(function()
								local v48, v49, v50 = fn11()

								if v50 then
									y = v50.Position.Y
								end
							end)

							y = y or 20
							CFrame.new(0, 0, 0)

							local function fn53()
								local v48 = UserInputService:IsKeyDown(Enum.KeyCode.W)
								local v49 = UserInputService:IsKeyDown(Enum.KeyCode.S)
								local v50 = UserInputService:IsKeyDown(Enum.KeyCode.A)
								local v51 = UserInputService:IsKeyDown(Enum.KeyCode.D)
								local currentCamera = Workspace.CurrentCamera
								if not currentCamera then
									return Vector3.zero, v48 or v49 or v50 or v51
								end
								local lookVector = currentCamera.CFrame.LookVector
								local vector = Vector3.new(lookVector.X, 0, lookVector.Z)

								if vector.Magnitude < 0.1 then
									vector = Vector3.new(0, 0, -1)
								end

								local v52 = vector:Cross(Vector3.new(0, 1, 0))
								local vector2 = Vector3.zero

								if v48 then
									vector2 = Vector3.zero + vector
								end

								if v49 then
									vector2 -= vector
								end

								if v50 then
									vector2 -= v52
								end

								if v51 then
									vector2 += v52
								end

								return vector2.Magnitude > 0 and vector2.Unit or vector, v48 or v49 or v50 or v51
							end

							while flag13 do
								pcall(function()
									local v48, v49, v50 = fn11()
									if not (v48 and v49 and v50) then
										return
									end
									local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
									characterEvents = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

									if characterEvents and fn26("lr_rag", 0.15) then
										characterEvents:FireServer(v50, 3)
									end

									fn52()
									local v51, v52 = fn53()

									if v52 then
										pcall(function()
											local vector = Vector3.new(v51.X, 0, v51.Z)

											if vector.Magnitude > 0.05 then
												local unit = vector.Unit
												v50.CFrame = CFrame.lookAt(v50.Position, v50.Position + unit)
												v50.AssemblyLinearVelocity = Vector3.new(unit.X * n27, v50.AssemblyLinearVelocity.Y, unit.Z * n27)
											end

											v50.AssemblyAngularVelocity = Vector3.zero
										end)
									else
										pcall(function()
											local assemblyLinearVelocity = v50.AssemblyLinearVelocity
											v50.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X * 0.2, assemblyLinearVelocity.Y, assemblyLinearVelocity.Z * 0.2)
											v50.AssemblyAngularVelocity = Vector3.zero
											local currentCamera = Workspace.CurrentCamera

											if currentCamera then
												local lookVector = currentCamera.CFrame.LookVector
												local vector = Vector3.new(lookVector.X, 0, lookVector.Z)

												if vector.Magnitude > 0.05 then
													v50.CFrame = CFrame.lookAt(v50.Position, v50.Position + vector.Unit)
												end
											end
										end)
									end

									if v49.FloorMaterial ~= Enum.Material.Air and v50.Position.Y > -20 then
										y = v50.Position.Y
									end

									if v50.Position.Y < y - 30 then
										pcall(function()
											v50.CFrame = CFrame.new(v50.Position.X, y + 5, v50.Position.Z)
											v50.AssemblyLinearVelocity = Vector3.zero
											v50.AssemblyAngularVelocity = Vector3.zero

											pcall(function()
												ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
											end)
										end)
									end

									if tick() - n26 > 0.5 then
										n26 = tick()

										pcall(function()
											if not autoSitActive then
												return
											end

											if v49.SeatPart then
												return
											end
											local v53 = fn22()
											if not v53 then
												return
											end
											local vehicleSeat = v53:FindFirstChild("VehicleSeat") or v53:FindFirstChildWhichIsA("VehicleSeat", true)
											local humanoidRootPart = v53:FindFirstChild("HumanoidRootPart")

											if vehicleSeat and humanoidRootPart and (humanoidRootPart.Position - v50.Position).Magnitude < 25 then
												vehicleSeat:Sit(v49)
											end
										end)
									end
								end)

								task.wait(0.1)
							end

							for _, v48 in pairs(tbl9) do
								pcall(function()
									if v48 and v48.Parent then
										v48:Destroy()
									end
								end)
							end
						end)
					end,
				})
			end

			do
				local flag13 = false
				local thread = nil
				local connection2 = nil
				local str6 = "NinjaShuriken"

				local function fn52(arg)
					if not arg then
						return
					end
					local humanoid = arg:FindFirstChild("Humanoid")
					local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")

					if humanoid and humanoidRootPart then
						humanoid.AutoRotate = true
						humanoid.Sit = false
						humanoidRootPart.Velocity = Vector3.zero
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

						for _, child in pairs(arg:GetChildren()) do
							if child:IsA("BasePart") then
								child.CanCollide = true
								child.CanTouch = true
								child.CanQuery = true
								child.Velocity = Vector3.zero
								child.AssemblyLinearVelocity = Vector3.zero
								child.AssemblyAngularVelocity = Vector3.zero
							end
						end

						humanoid:ChangeState(Enum.HumanoidStateType.Running)
					end
				end

				local function fn53()
					local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					local destroyToy = ReplicatedStorage_.MenuToys.DestroyToy

					if v48 and destroyToy then
						for _, child in pairs(v48:GetChildren()) do
							if child.Name == "AntiKickItem" or child.Name == str6 then
								pcall(function()
									destroyToy:FireServer(child)
								end)
							end
						end
					end
				end

				local connection3 = nil

				local function fn54()
					if thread then
						pcall(task.cancel, thread)
						thread = nil
					end

					fn52(localPlayer.Character)

					if connection2 then
						connection2:Disconnect()
					end

					connection2 = localPlayer.CharacterAdded:Connect(function(character)
						task.wait(0.5)
						fn52(character)
					end)

					if connection3 then
						connection3:Disconnect()
					end

					connection3 = localPlayer.CharacterAdded:Connect(function()
						task.wait(1)

						if flag13 then
							fn53()
						end
					end)

					thread = task.spawn(function()
						local v48 = localPlayer
						local setNetworkOwner = ReplicatedStorage_:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
						local stickyPartEvent = ReplicatedStorage_:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
						local spawnToyRemoteFunction = ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction
						ReplicatedStorage_:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
						local canSpawnToy = v48:WaitForChild("CanSpawnToy")

						local function fn55()
							if v48.Character and v48.Character:FindFirstChild("HumanoidRootPart") then
								return v48.Character.HumanoidRootPart
							end
							return v48.CharacterAdded:Wait():WaitForChild("HumanoidRootPart", 5)
						end

						local function fn56()
							local plotItems = Workspace:FindFirstChild("PlotItems")
							plotItems = plotItems and plotItems:FindFirstChild("PlayersInPlots")
							return plotItems and plotItems:FindFirstChild(v48.Name) and true or false
						end

						local function fn57()
							if not fn56() then
								return false
							end
							local plots = Workspace:FindFirstChild("Plots")
							local plotItems = Workspace:FindFirstChild("PlotItems")
							if not (plots and plotItems) then
								return false
							end

							for _, child in pairs(plots:GetChildren()) do
								local plotSign = child:FindFirstChild("PlotSign")
								plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

								if plotSign then
									for _, child2 in pairs(plotSign:GetChildren()) do
										if child2.Value ~= v48.Name then
											continue
										end
										local v49 = plotItems:FindFirstChild(child.Name)
										if v49 then
											return true, v49
										end
									end
								end
							end

							return false
						end

						local highlight = nil

						local function fn58(adornee)
							if not adornee or not adornee.Parent then
								return
							end

							pcall(function()
								if not highlight or not highlight.Parent then
									highlight = Instance.new("Highlight")
									highlight.Name = "WraithBerryHL"
									highlight.FillTransparency = 0.6
									highlight.FillColor = Color3.fromRGB(96, 76, 214)
									highlight.OutlineColor = Color3.fromRGB(96, 76, 214)
									highlight.OutlineTransparency = 0
									highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
									highlight.Parent = gethui and gethui() or game:GetService("CoreGui")
								end

								highlight.Adornee = adornee
								highlight.Enabled = true
							end)
						end

						local function fn59()
							pcall(function()
								if highlight then
									highlight:Destroy()
									highlight = nil
								end
							end)
						end

						task.spawn(function()
							while flag13 do
								pcall(function()
									local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									local antiKickItem = nil

									if v49 then
										antiKickItem = v49:FindFirstChild("AntiKickItem") or v49:FindFirstChild(str6)
									end

									if not antiKickItem then
										local plotItems = Workspace:FindFirstChild("PlotItems")

										if plotItems then
											for _, child in ipairs(plotItems:GetChildren()) do
												local antiKickItem2 = child:FindFirstChild("AntiKickItem") or child:FindFirstChild(str6)
												if antiKickItem2 then
													antiKickItem = antiKickItem2
													break
												end
											end
										end
									end

									if antiKickItem then
										fn58(antiKickItem)
									elseif highlight then
										highlight.Enabled = false
									end
								end)

								task.wait(0.35)
							end

							fn59()
						end)

						local function fn60(arg)
							if not arg or not arg:FindFirstChild("StickyPart") then
								return
							end
							local v49 = fn55()
							if not v49 then
								return
							end

							if arg:FindFirstChild("SoundPart") then
								if not arg.SoundPart:FindFirstChild("PartOwner") or arg.SoundPart.PartOwner.Value ~= v48.Name then
									pcall(function()
										setNetworkOwner:FireServer(arg.SoundPart, arg.SoundPart.CFrame)
									end)
								end
							end

							local firePlayerPart = v49:FindFirstChild("FirePlayerPart") or v49:WaitForChild("FirePlayerPart", 5)

							if firePlayerPart then
								pcall(function()
									stickyPartEvent:FireServer(arg.StickyPart, firePlayerPart, CFrame.new(0, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966))
								end)
							end

							for _, child in pairs(arg:GetChildren()) do
								if child:IsA("BasePart") then
									child.CanTouch = false
									child.CanCollide = false
									child.CanQuery = false
									child.Transparency = 0.8
								end
							end

							fn58(arg)
						end

						local function fn61(arg)
							local now2 = tick()

							while not canSpawnToy.Value do
								if not flag13 or tick() - now2 > 5 then
									return nil
								end
								task.wait(0.1)
							end

							local v49 = fn55()

							if v49 then
								task.spawn(function()
									pcall(function()
										spawnToyRemoteFunction:InvokeServer(arg, v49.CFrame * CFrame.new(0, 12, 20), Vector3.zero)
									end)
								end)
							end

							local v50, v51 = fn57()
							local v52 = Workspace:FindFirstChild(v48.Name .. "SpawnedInToys")
							if v50 and v51 then
								return v51:WaitForChild(arg, 2)
							end

							if not fn56() and v52 then
								return v52:WaitForChild(arg, 2)
							end
							return nil
						end

						local function fn62()
							if not v48.Character or not v48.Character:FindFirstChild("Humanoid") or v48.Character.Humanoid.Health <= 0 then
								task.wait(0.5)
								fn53()
								return
							end

							local v49 = Workspace:FindFirstChild(v48.Name .. "SpawnedInToys")
							local antiKickItem

							if v49 then
								antiKickItem = v49:FindFirstChild("AntiKickItem") or v49:FindFirstChild(str6)
							else
								antiKickItem = v49
							end

							if fn56() then
								local v50, v51 = fn57()
								local plots = Workspace:FindFirstChild("Plots")

								if v50 and v51 and plots and plots:FindFirstChild(v51.Name) then
									local plotSign = plots[v51.Name]:FindFirstChild("PlotSign")
									local flag14 = false

									pcall(function()
										flag14 = plotSign and plotSign.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89
									end)

									if flag14 then
										antiKickItem = fn61(str6)
										if antiKickItem == nil then
											return
										end
										antiKickItem.Name = "AntiKickItem"
										fn60(antiKickItem)
									end
								end
							end

							if not antiKickItem then
								if fn56() then
									return
								end
								antiKickItem = fn61(str6)
								if antiKickItem == nil then
									return
								end
								antiKickItem.Name = "AntiKickItem"
							end

							while true do
								if antiKickItem and antiKickItem:FindFirstChild("StickyPart") and antiKickItem.StickyPart.CanTouch == true then
									fn60(antiKickItem)
									antiKickItem.Name = "AntiKickItem"
								end

								task.wait(0.3)
								if not (not antiKickItem or not flag13 or not antiKickItem:FindFirstChild("StickyPart") or antiKickItem.StickyPart.CanTouch == false or not v48.Character or not v48.Character:FindFirstChild("HumanoidRootPart") or (v48.Character.HumanoidRootPart.Position - antiKickItem.StickyPart.Position).Magnitude >= 20) then
									continue
								end
								break
							end

							if not antiKickItem or not antiKickItem:FindFirstChild("StickyPart") or not v48.Character or not v48.Character:FindFirstChild("HumanoidRootPart") or (v48.Character.HumanoidRootPart.Position - antiKickItem.StickyPart.Position).Magnitude >= 20 then
								fn53()
								return
							end

							pcall(function()
								while true do
									task.wait(0.05)
									if not (not flag13 or not v48.Character or not v48.Character:FindFirstChild("Humanoid") or not antiKickItem or not antiKickItem:FindFirstChild("StickyPart") or not antiKickItem.StickyPart:FindFirstChild("StickyWeld") or not antiKickItem.StickyPart.StickyWeld.Part1) then
										continue
									end
									break
								end

								if not antiKickItem or not antiKickItem:FindFirstChild("StickyPart") or v48.Character and v48.Character:FindFirstChild("Humanoid") and v48.Character.Humanoid.Health <= 0 or not antiKickItem.StickyPart:FindFirstChild("StickyWeld") or not antiKickItem.StickyPart.StickyWeld.Part1 then
									fn53()
								end
							end)
						end

						while flag13 do
							if not pcall(fn62) then
								task.wait(0.5)
							end

							task.wait(0.25)
						end

						fn53()
					end)
				end

				antiKickGroup:AddLabel("Anti Kick Item"):AddDropdown({
					Flag = "WR33",
					Values = { "Shuriken", "Kunai", "Pickaxe" },
					Default = "Shuriken",
					Callback = function(arg)
						str6 = ({ Shuriken = "NinjaShuriken", Kunai = "NinjaKunai", Pickaxe = "ToolPickaxe" })[arg] or "NinjaShuriken"
					end,
				})

				antiKickGroup:AddLabel("Anti Kick Shuriken"):AddToggle({
					Flag = "WR34",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR34") or "WR34") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if arg then
							fn54()
						else
							if thread then
								pcall(task.cancel, thread)
								thread = nil
							end

							if connection2 then
								connection2:Disconnect()
								connection2 = nil
							end

							fn52(localPlayer.Character)
							fn53()
						end
					end,
				})
			end

			do
				local tbl9 = {
					Coconut = "FoodCoconut",
					Banana = "FoodBanana",
					Fries = "FoodFrenchFries",
					MeatStick = "FoodMeatStick",
					Poop = "PoopPile",
					Donut = "FoodDonut",
					Cake = "FoodCakePink",
					Burger = "FoodHamburger",
					Pizza = "FoodPizzaCheese",
					Hotdog = "FoodHotdog",
					Mushroom = "FoodMushroomPoison",
					Banjo = "InstrumentGuitarBanjo",
					Violin = "InstrumentGuitarViolin",
					Ukulele = "InstrumentGuitarUkulele",
					Sax = "InstrumentWoodwindSaxophone",
					Vuvuzela = "InstrumentBrassVuvuzela",
					Bongos = "InstrumentDrumBongos",
					Mic = "InstrumentVoiceMicrophone",
					Pepperoni = "FoodPizzaPepperoni",
					Piano = "InstrumentPianoMelodica",
					Bread = "FoodBread",
					Egg = "FoodDippyEgg",
					Mayo = "FoodMayonnaise",
					WhiteMug = "CupMugWhite",
					Ocarina = "InstrumentWoodwindOcarina",
					SparklePoop = "PoopPileSparkle",
					BrownMug = "CupMugBrown",
					Trumpet = "InstrumentBrassTrumpet",
					Snare = "InstrumentDrumSnare",
				}

				local tbl10 = {}

				for k in pairs(tbl9) do
					table.insert(tbl10, k)
				end

				table.sort(tbl10)
				local flag13 = false
				antiInputRestart = nil
				local thread = nil
				local str6 = "FoodHamburger"

				antiInputGroup:AddLabel("Anti Input Toy"):AddDropdown({
					Flag = "WR35",
					Values = tbl10,
					Default = "Burger",
					Callback = function(arg)
						str6 = tbl9[arg] or arg
					end,
				})

				antiInputGroup:AddLabel("Anti Input"):AddToggle({
					Flag = "WR36",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR36") or "WR36") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread then
							pcall(task.cancel, thread)
							thread = nil
						end

						if not arg then
							return
						end

						antiInputRestart = function()
							if not flag13 then
								return
							end

							if thread and coroutine.status(thread) ~= "dead" then
								return
							end

							pcall(function()
								local wR36 = lib.Flags and lib.Flags.WR36

								if wR36 and wR36.SetValue then
									wR36:SetValue(false)
									task.wait(0.1)
									wR36:SetValue(true)
								end
							end)
						end

						thread = task.spawn(function()
							local spawnToyRemoteFunction = ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction
							local tbl11 = {}
							local flag14 = false

							local function fn52()
								return Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							end

							local function fn53()
								local v48 = fn52()
								v48 = v48 and v48:FindFirstChild(str6)
								if v48 and v48.Parent then
									return v48
								end
								return nil
							end

							local function fn54(arg2)
								if not arg2 then
									return
								end
								local character = localPlayer.Character
								local holdPart = arg2:FindFirstChild("HoldPart")
								local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
								if not (character and holdItemRemoteFunction) then
									return
								end

								pcall(function()
									for _, descendant in pairs(arg2:GetDescendants()) do
										if descendant:IsA("BasePart") then
											descendant.CanCollide = false
											descendant.Massless = true
										end
									end
								end)

								pcall(function()
									holdItemRemoteFunction:InvokeServer(arg2, character)
								end)
							end

							local function fn55(arg2)
								arg2 = arg2 and arg2:FindFirstChild("HoldPart")
								if not arg2 then
									return false
								end
								local holdingPlayer = arg2:FindFirstChild("HoldingPlayer")
								if holdingPlayer then
									return holdingPlayer.Value == localPlayer
								end
								local partOwner = arg2:FindFirstChild("PartOwner")
								if partOwner then
									local name = localPlayer.Name
									return tostring(partOwner.Value) == name
								end
								return true
							end

							local function fn56()
								if flag14 or not flag13 then
									return
								end
								flag14 = true
								local v48 = fn53()

								if not v48 then
									local v49, v50, v51 = fn11()

									if v51 then
										pcall(function()
											spawnToyRemoteFunction:InvokeServer(str6, v51.CFrame * CFrame.new(0, -12, 0), Vector3.zero)
										end)
									end

									local now2 = tick()

									while true do
										RunService.Heartbeat:Wait()
										v48 = fn53()
										if not (v48 or tick() - now2 > 0.35 or not flag13) then
											continue
										end
										break
									end
								end

								if v48 then
									fn54(v48)
								end

								flag14 = false
							end

							fn56()

							local function fn57()
								local v48 = fn52()
								if not v48 then
									return
								end

								tbl11[#tbl11 + 1] = v48.ChildRemoved:Connect(function(child)
									if not flag13 then
										return
									end

									if child.Name == str6 then
										task.defer(fn56)
									end
								end)

								tbl11[#tbl11 + 1] = v48.ChildAdded:Connect(function(child)
									if not flag13 then
										return
									end

									if child.Name == str6 then
										task.defer(function()
											fn54(child)
										end)
									end
								end)
							end

							fn57()

							tbl11[#tbl11 + 1] = Workspace.ChildAdded:Connect(function(child)
								if not flag13 then
									return
								end

								if child.Name == localPlayer.Name .. "SpawnedInToys" then
									task.defer(fn57)
								end
							end)

							tbl11[#tbl11 + 1] = localPlayer.CharacterAdded:Connect(function(character)
								if not flag13 then
									return
								end
								character:WaitForChild("HumanoidRootPart", 8)
								task.wait(0.2)
								fn56()
							end)

							local n26 = tick() + 0.5

							while flag13 do
								if not fn26("ai_tick", 0.05) then
									RunService.Heartbeat:Wait()
								end

								local v48 = fn53()

								if not v48 then
									fn56()
								elseif not fn55(v48) then
									fn54(v48)
								elseif n26 <= tick() then
									n26 = tick() + 0.5
									local holdPart = v48:FindFirstChild("HoldPart")
									local dropItemRemoteFunction = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
									local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
									local v49, v50, v51 = fn11()

									if dropItemRemoteFunction and holdItemRemoteFunction and v51 and localPlayer.Character then
										for i = 1, 3 do
											if flag13 then
												pcall(function()
													dropItemRemoteFunction:InvokeServer(v48, CFrame.new(v51.Position + Vector3.new(0, 4000, 0)), Vector3.zero)
												end)

												pcall(function()
													holdItemRemoteFunction:InvokeServer(v48, localPlayer.Character)
												end)

												continue
											end

											break
										end
									end
								end

								RunService.Heartbeat:Wait()
							end

							for _, v48 in ipairs(tbl11) do
								pcall(function()
									v48:Disconnect()
								end)
							end
						end)
					end,
				})
			end

			do
				local flag13 = false
				local tbl9 = {}
				local tbl10 = {}

				local tbl11 = {
					[Enum.KeyCode.W] = true,
					[Enum.KeyCode.A] = true,
					[Enum.KeyCode.S] = true,
					[Enum.KeyCode.D] = true,
					[Enum.KeyCode.Space] = true,
				}

				v30:AddLabel("Safe Move"):AddToggle({
					Default = false,
					Flag = "SafeMove",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("SafeMove") or "SafeMove") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if not arg then
							for _, v48 in pairs(tbl9) do
								pcall(function()
									v48:Disconnect()
								end)
							end

							tbl9 = {}
							tbl10 = {}
							local v48, v49, v50 = fn11()

							if v50 then
								pcall(function()
									v50.Anchored = false
								end)
							end

							return
						end

						tbl9.began = UserInputService_.InputBegan:Connect(function(input, gameProcessed)
							if gameProcessed then
								return
							end

							if tbl11[input.KeyCode] then
								tbl10[input.KeyCode] = true
							end
						end)

						tbl9.endedC = UserInputService_.InputEnded:Connect(function(input)
							if tbl11[input.KeyCode] then
								tbl10[input.KeyCode] = nil
							end
						end)

						local cFrame = nil

						tbl9.hb = RunService.Heartbeat:Connect(function()
							if not flag13 then
								return
							end
							local v48, v49, v50 = fn11()
							if not v50 then
								return
							end

							if fn35() or wraithDefenseBlocked() then
								pcall(function()
									v50.Anchored = false
								end)

								cFrame = nil
								return
							end

							local flag14 = false

							for _, v51 in pairs(tbl10) do
								if v51 then
									flag14 = true
									break
								end
							end

							if flag14 then
								cFrame = v50.CFrame

								if v50.Anchored then
									pcall(function()
										v50.Anchored = false
									end)
								end

								return
							end

							if not cFrame then
								cFrame = v50.CFrame
							end

							if v49.SeatPart then
								pcall(function()
									v50.AssemblyLinearVelocity = Vector3.zero
									v50.AssemblyAngularVelocity = Vector3.zero
								end)

								return
							end

							local magnitude = (v50.Position - cFrame.Position).Magnitude

							if magnitude > 0.6 and magnitude < 60 then
								for i = 1, 4 do
									pcall(function()
										v50.CFrame = cFrame
										v50.AssemblyLinearVelocity = Vector3.zero
										v50.AssemblyAngularVelocity = Vector3.zero
									end)

									RunService.Heartbeat:Wait()
								end
							elseif magnitude >= 60 then
								cFrame = v50.CFrame
							else
								pcall(function()
									v50.AssemblyLinearVelocity = Vector3.zero
									v50.AssemblyAngularVelocity = Vector3.zero
								end)
							end
						end)

						tbl9.charAdd = localPlayer.CharacterAdded:Connect(function()
							tbl10 = {}
						end)
					end,
				})
			end

			do
				local flag13 = false
				local v48 = nil

				local tbl9 = {
					Plot1 = Vector3.new(-533, -7, 90),
					Plot2 = Vector3.new(-483, -7, -164),
					Plot3 = Vector3.new(252, -7, 464),
					Plot4 = Vector3.new(509, 83, -339),
					Plot5 = Vector3.new(553, 123, -74),
				}

				local function fn52()
					local plots = Workspace:FindFirstChild("Plots")

					if plots then
						for _, child in pairs(plots:GetChildren()) do
							if child:FindFirstChild(localPlayer.Name) then
								return tbl9[child.Name] or Vector3.new(252, -7, 464)
							end
						end
					end

					return Vector3.new(252, -7, 464)
				end

				v30:AddLabel("Go To Home"):AddToggle({
					Default = false,
					Flag = "GoToHome",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("GoToHome") or "GoToHome") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if v48 then
							v48:Disconnect()
							v48 = nil
						end

						if not arg then
							return
						end
						local v49 = fn52()

						task.spawn(function()
							local v50, v51, v52 = fn11()

							if v52 then
								fn18(CFrame.new(v49))
							end
						end)
					end,
				})

				local flag14 = false
				local tbl10 = {}

				v30:AddLabel("Kill Dodge"):AddToggle({
					Default = false,
					Flag = "KillDodge",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("KillDodge") or "KillDodge") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg

						for _, v49 in pairs(tbl10) do
							pcall(function()
								v49:Disconnect()
							end)
						end

						tbl10 = {}
						if not arg then
							return
						end
						local v49 = fn52()

						local function fn53(arg2)
							local humanoidRootPart = arg2:WaitForChild("HumanoidRootPart")
							local humanoid = arg2:WaitForChild("Humanoid")

							tbl10.loop = RunService.Heartbeat:Connect(function()
								if not flag14 then
									return
								end
								local inPlot = localPlayer:FindFirstChild("InPlot")

								if not (inPlot and inPlot.Value) and humanoid.Health > 0 and humanoidRootPart.Parent then
									humanoidRootPart.CFrame = CFrame.new(v49)
									humanoidRootPart.Anchored = false
								end
							end)
						end

						if localPlayer.Character then
							task.spawn(fn53, localPlayer.Character)
						end

						tbl10.charAdd = localPlayer.CharacterAdded:Connect(function(character)
							task.spawn(fn53, character)
						end)
					end,
				})
			end

			do
				local flag13 = true
				local connection2 = nil

				v22:AddLabel("Flying Reset"):AddToggle({
					Default = true,
					Flag = "FlyingReset",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("FlyingReset") or "FlyingReset") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if not arg then
							return
						end
						local gameCorrectionEvents = ReplicatedStorage_:FindFirstChild("GameCorrectionEvents")
						gameCorrectionEvents = gameCorrectionEvents and gameCorrectionEvents:FindFirstChild("GameCorrectionsNotify")
						if not gameCorrectionEvents then
							return
						end
						local n26 = 0

						connection2 = gameCorrectionEvents.OnClientEvent:Connect(function(arg2)
							if flag13 and arg2 == "Flying" then
								if tick() - n26 < 1 then
									return
								end
								n26 = tick()
								local v48, v49 = fn11()
								if not v48 then
									return
								end
								local isHeld = localPlayer:FindFirstChild("IsHeld")
								if isHeld and isHeld.Value then
									return
								end

								for _, child in ipairs(v48:GetChildren()) do
									if child:IsA("BasePart") and wraithHeldByOther(child) then
										return
									end
								end

								if wraithDefenseBlocked() then
									return
								end

								pcall(function()
									if v49 then
										v49.BreakJointsOnDeath = true
										v49.RequiresNeck = true
									end

									local head = v48:FindFirstChild("Head")

									if head then
										for _, descendant in ipairs(v48:GetDescendants()) do
											if descendant:IsA("Motor6D") or descendant:IsA("Weld") or descendant:IsA("WeldConstraint") then
												if descendant.Part0 == head or descendant.Part1 == head then
													descendant:Destroy()
												end
											end
										end

										head:Destroy()
									end

									if v49 then
										v49.Health = 0
									end
								end)

								fn10("wraith", "flying warn: reset")
							end
						end)
					end,
				})
			end

			task.delay(2, function()
				pcall(function()
					local flyingReset = lib.Flags and lib.Flags.FlyingReset

					if flyingReset and flyingReset.SetValue then
						flyingReset:SetValue(true)
					end
				end)
			end)

			do
				local flag13 = false
				local thread = nil

				v22:AddLabel("Auto Break PCLD"):AddToggle({
					Default = false,
					Flag = "AutoBreakPCLD",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AutoBreakPCLD") or "AutoBreakPCLD") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread then
							pcall(task.cancel, thread)
							thread = nil
						end

						if not arg then
							return
						end

						thread = task.spawn(function()
							local flag14 = false

							local function fn52()
								flag14 = true
								local character = localPlayer.Character
								character = character and character:FindFirstChild("Humanoid")

								if character then
									character.Health = 0
								end

								task.wait(0.05)
								flag14 = false
							end

							fn52()
							localPlayer.CharacterAdded:Wait()
							task.wait(0.2)
							if not flag13 then
								return
							end
							fn52()
							localPlayer.CharacterAdded:Wait()
							task.wait(0.2)
							local flag15 = false

							while flag13 do
								local character = localPlayer.Character
								character = character and character:FindFirstChild("Humanoid")

								if character and character.Health > 0 then
									flag15 = false
								elseif not flag14 and not flag15 then
									localPlayer.CharacterAdded:Wait()
									task.wait(0.2)
									flag15 = true

									if flag13 then
										fn52()
									end
								end

								task.wait(0.1)
							end
						end)
					end,
				})
			end

			do
				local flag13 = false
				local tbl9 = {}
				local tbl10 = { "Left Arm", "Left Leg", "Right Arm", "Right Leg" }

				local function fn52()
					local v48, v49, v50 = fn11()
					if not v50 then
						return
					end

					task.spawn(function()
						v50.Anchored = true

						if v49 then
							pcall(function()
								v49:ChangeState(Enum.HumanoidStateType.Running)
								v49.Sit = false
								v49.PlatformStand = false
							end)
						end

						task.wait(0.01)

						if v48 then
							for _, v51 in ipairs(tbl10) do
								local ragdollLimbPart = v48:FindFirstChild(v51)
								ragdollLimbPart = ragdollLimbPart and ragdollLimbPart:FindFirstChild("RagdollLimbPart")

								if ragdollLimbPart then
									ragdollLimbPart.CanCollide = false
								end
							end
						end

						local rightArm = v48 and v48:FindFirstChild("Right Arm")
						rightArm = rightArm and rightArm:FindFirstChild("RagdollLimbPart")

						if rightArm then
							local n26 = tick() + 0.5

							while rightArm.CanCollide and flag13 and tick() < n26 do
								task.wait(0.001)
							end
						end

						if flag13 and v50.Parent then
							v50.Anchored = false
						end

						task.delay(0.5, function()
							local character = localPlayer.Character
							if not character then
								return
							end

							for _, v51 in ipairs(tbl10) do
								local ragdollLimbPart = character:FindFirstChild(v51)
								ragdollLimbPart = ragdollLimbPart and ragdollLimbPart:FindFirstChild("RagdollLimbPart")

								if ragdollLimbPart then
									ragdollLimbPart.CanCollide = true
								end
							end
						end)
					end)
				end

				v24:AddLabel("Anti Bomb"):AddToggle({
					Default = false,
					Flag = "AntiBombRemote",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiBombRemote") or "AntiBombRemote") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						for _, v48 in pairs(tbl9) do
							pcall(function()
								v48:Disconnect()
							end)
						end

						tbl9 = {}

						if not arg then
							local v48, v49, v50 = fn11()

							if v50 then
								v50.Anchored = false
							end

							return
						end

						local bombEvents = ReplicatedStorage_:FindFirstChild("BombEvents")
						bombEvents = bombEvents and bombEvents:FindFirstChild("BombExplode")

						if bombEvents then
							tbl9.remote = bombEvents.OnClientEvent:Connect(function(arg2, arg3)
								if not flag13 then
									return
								end
								local v48, v49, v50 = fn11()
								if not v50 then
									return
								end
								local n26 = 20

								if typeof(arg2) == "table" then
									if arg2.Radius then
										n26 = arg2.Radius + 10
									end

									arg3 = arg2.Position or arg3
								end

								if typeof(arg3) ~= "Vector3" then
									return
								end

								if (v50.Position - arg3).Magnitude <= n26 then
									fn52()
								end
							end)
						end

						tbl9.child = Workspace.ChildAdded:Connect(function(child)
							if not flag13 then
								return
							end

							if child.Name ~= "Part" then
								return
							end

							task.spawn(function()
								task.wait()
								local v48, v49, v50 = fn11()
								if not v50 then
									return
								end

								if child and child.Parent and child:IsA("BasePart") then
									if (child.Position - v50.Position).Magnitude <= 20 then
										fn52()
									end
								end
							end)
						end)
					end,
				})
			end

			do
				local flag13 = false
				local connection2 = nil
				local tbl9 = {}

				v24:AddLabel("Anti Pallet Ragdoll"):AddToggle({
					Default = false,
					Flag = "AntiPalletRagdoll",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiPalletRagdoll") or "AntiPalletRagdoll") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if not arg then
							tbl9 = {}
							return
						end

						connection2 = RunService.Heartbeat:Connect(function()
							if not flag13 then
								return
							end
							local v48, v49, v50 = fn11()
							if not (v48 and v49 and v50) then
								return
							end
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local overlapParams = OverlapParams.new()
							overlapParams.FilterType = Enum.RaycastFilterType.Exclude
							overlapParams.FilterDescendantsInstances = { v48 }

							local ok, result = pcall(function()
								return Workspace:GetPartBoundsInRadius(v50.Position, 60, overlapParams)
							end)

							if not ok or not result then
								return
							end
							local flag14 = false

							for _, v51 in ipairs(result) do
								local parent = v51 and v51.Parent

								if parent and (parent.Name == "PalletLightBrown" or parent.Name == "PalletForRagdoll") then
									local assemblyLinearVelocity = v51.AssemblyLinearVelocity
									local n26 = v50.Position - v51.Position

									if n26.Magnitude < 8 or assemblyLinearVelocity.Magnitude > 60 and n26.Magnitude > 0 and assemblyLinearVelocity.Unit:Dot(n26.Unit) > 0.4 then
										for _, child in ipairs(parent:GetChildren()) do
											if child:IsA("BasePart") then
												child.CanCollide = false
												child.CanTouch = false
												child.CanQuery = false
											end
										end

										if setNetworkOwner and fn26("apr_own_" .. tostring(parent:GetDebugId()), 0.15) then
											pcall(function()
												setNetworkOwner:FireServer(v51, v51.CFrame)
											end)
										end

										flag14 = true

										if wraithCanMove(v51) then
											pcall(function()
												v51.AssemblyLinearVelocity = Vector3.zero
												v51.AssemblyAngularVelocity = Vector3.zero
											end)
										end
									end
								end
							end

							if flag14 then
								local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")

								if characterEvents and characterEvents:FindFirstChild("RagdollRemote") and fn26("apr_rag", 0.12) then
									pcall(function()
										characterEvents.RagdollRemote:FireServer(v50, 0)
									end)
								end

								if v49.PlatformStand then
									v49.PlatformStand = false
								end
							end
						end)

						localPlayer.CharacterAdded:Once(function()
							tbl9 = {}
						end)
					end,
				})
			end

			anchorAirSince = nil
			local exclude = Enum.RaycastFilterType.Exclude
			RaycastParams.new().FilterType = exclude
			CFrame.new()
			Vector3.new()
			tdTractor = nil
			tdMain = nil
			tdSeat = nil
			tdBP = nil
			tdBG = nil
			tdConn = nil
			tdRot = CFrame.new()
			tdOffset = Vector3.new()
			local tbl9 = {}

			Workspace.DescendantAdded:Connect(function(descendant)
				if descendant.Name == "PlayerCharacterLocationDetector" and descendant:IsA("BasePart") then
					tbl9[descendant] = true
				end
			end)

			CFrame.Angles(1.5707963267948966, 0, 0)

			do
				local flag13 = false
				local connection2 = nil
				local thread = nil

				v24:AddLabel("Anti Blobman"):AddToggle({
					Default = false,
					Flag = "AntiBlobman",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiBlobman") or "AntiBlobman") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							pcall(function()
								connection2:Disconnect()
							end)

							connection2 = nil
						end

						if thread then
							pcall(function()
								task.cancel(thread)
							end)

							thread = nil
						end

						if not arg then
							fn10("wraith", "anti blobman: off")
							return
						end

						local function fn52(arg2)
							local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							return v48 and arg2:IsDescendantOf(v48)
						end

						local function fn53(arg2)
							if not (arg2 and arg2.Parent) then
								return
							end

							if fn52(arg2) then
								return
							end

							for _, v48 in ipairs({ "RightDetector", "LeftDetector" }) do
								local v49 = arg2:FindFirstChild(v48)

								if v49 then
									for _, descendant in ipairs(v49:GetDescendants()) do
										pcall(function()
											if descendant:IsA("AlignPosition") then
												if descendant.Enabled then
													descendant.Enabled = false
												end

												if descendant.MaxForce ~= 0 then
													descendant.MaxForce = 0
												end

												if descendant.Responsiveness ~= 0 then
													descendant.Responsiveness = 0
												end
											elseif descendant:IsA("AlignOrientation") then
												if descendant.Enabled then
													descendant.Enabled = false
												end

												if descendant.MaxTorque ~= 0 then
													descendant.MaxTorque = 0
												end
											elseif descendant:IsA("Weld") or descendant:IsA("WeldConstraint") then
												local part0 = descendant.Part0
												local part1 = descendant.Part1
												local character = localPlayer.Character

												if character then
													character = part0 and part0:IsDescendantOf(character) or part1 and part1:IsDescendantOf(character)
												end

												if character then
													descendant.Enabled = false
													descendant:Destroy()
												end
											end
										end)
									end
								end
							end
						end

						thread = task.spawn(function()
							while flag13 do
								pcall(function()
									for _, child in ipairs(Workspace:GetChildren()) do
										if tostring(child.Name):match("SpawnedInToys") then
											for _, child2 in ipairs(child:GetChildren()) do
												if child2.Name == "CreatureBlobman" then
													fn53(child2)
												end
											end
										end
									end
								end)

								task.wait(0.12)
							end
						end)

						connection2 = Workspace.DescendantAdded:Connect(function(descendant)
							if not flag13 then
								return
							end

							if descendant.Name == "CreatureBlobman" then
								task.delay(0.1, function()
									pcall(fn53, descendant)
								end)
							end
						end)

						fn10("wraith", "anti blobman: on")
					end,
				})
			end

			do
				local flag13 = false
				local thread = nil

				v24:AddLabel("Anti Banana Sit"):AddToggle({
					Default = false,
					Flag = "AntiBananaSit",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiBananaSit") or "AntiBananaSit") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread then
							pcall(task.cancel, thread)
							thread = nil
						end

						if not arg then
							return
						end

						thread = task.spawn(function()
							while flag13 do
								local v48, v49, v50 = fn11()

								if v49 and v50 then
									pcall(function()
										v49.Sit = true
										v49:ChangeState(Enum.HumanoidStateType.Running)
										local currentCamera = Workspace.CurrentCamera

										if currentCamera then
											local lookVector = currentCamera.CFrame.LookVector
											v50.CFrame = CFrame.new(v50.Position, v50.Position + Vector3.new(lookVector.X, 0, lookVector.Z))
										end
									end)
								end

								task.wait()
							end
						end)
					end,
				})
			end

			do
				local flag13 = false
				local connection2 = nil
				local tbl10 = {}

				v24:AddLabel("Anti Ragdoll on Blob"):AddToggle({
					Default = false,
					Flag = "AntiRagdollBlob",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiRagdollBlob") or "AntiRagdollBlob") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							pcall(function()
								connection2:Disconnect()
							end)

							connection2 = nil
						end

						if not arg then
							for _, v48 in pairs(tbl10) do
								pcall(function()
									if v48 and v48.Parent then
										v48:Destroy()
									end
								end)
							end

							tbl10 = {}
							return
						end

						local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
						local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")
						local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")

						connection2 = RunService.Heartbeat:Connect(function()
							if not flag13 then
								return
							end

							pcall(function()
								local v48, v49, v50 = fn11()
								if not (v48 and v49 and v50) then
									return
								end
								local seatPart = v49.SeatPart
								local flag14 = seatPart and seatPart.Parent and (seatPart.Parent.Name == "CreatureBlobman" or seatPart.Parent.Name == "Gucci")
								local flag15 = false

								if flag14 then
									flag15 = true
								end

								local ragdolled = v49:FindFirstChild("Ragdolled")

								if not (ragdolled and ragdolled.Value) then
								end

								fn12(v48)

								if flag15 then
									pcall(function()
										if seatPart and seatPart:IsA("VehicleSeat") and not v49.Sit then
											seatPart:Sit(v49)
										end
									end)

									pcall(function()
										v49.Sit = true
									end)

									pcall(function()
										v49.PlatformStand = false
									end)

									if ragdollRemote and fn26("arb_rag", 0.15) then
										ragdollRemote:FireServer(v50, 3)
									end

									if struggle and fn26("arb_str", 0.5) then
										struggle:FireServer(localPlayer)
									end

									for _, child in pairs(v48:GetChildren()) do
										local partOwner = child:FindFirstChild("PartOwner")
										local flag16 = partOwner and partOwner.Value ~= ""

										if flag16 then
											local name = localPlayer.Name
											flag16 = tostring(partOwner.Value) ~= name
										end

										if flag16 then
											partOwner.Value = ""
										end
									end

									pcall(function()
										ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
									end)

									if v50.AssemblyLinearVelocity.Magnitude > 120 then
										v50.AssemblyLinearVelocity = Vector3.zero
										v50.AssemblyAngularVelocity = Vector3.zero
									end

									pcall(function()
										if not v49.SeatPart then
											local v51 = fn22()

											if v51 then
												local vehicleSeat = v51:FindFirstChild("VehicleSeat") or v51:FindFirstChildWhichIsA("VehicleSeat", true)
												local humanoidRootPart = v51:FindFirstChild("HumanoidRootPart")

												if vehicleSeat and humanoidRootPart and (humanoidRootPart.Position - v50.Position).Magnitude < 25 and fn26("arb_resit", 0.3) then
													pcall(function()
														vehicleSeat:Sit(v49)
													end)
												end
											end
										end
									end)

									pcall(function()
										local torso = v48:FindFirstChild("Torso")

										if torso then
											for _, v51 in ipairs({ "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
												local v52 = v48:FindFirstChild(v51)

												if v52 and v52:IsA("BasePart") and not tbl10[v52] then
													local weldConstraint = Instance.new("WeldConstraint")
													weldConstraint.Part0 = torso
													weldConstraint.Part1 = v52
													weldConstraint.Parent = torso
													tbl10[v52] = weldConstraint
												end
											end
										end
									end)
								else
									pcall(function()
										for _, v51 in pairs(tbl10) do
											if v51 and v51.Parent then
												v51:Destroy()
											end
										end

										tbl10 = {}
									end)
								end
							end)
						end)
					end,
				})
			end

			local thread = nil

			v24:AddLabel("Telekinesis Shield"):AddToggle({
				Default = false,
				Flag = "TelekinesisShield",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TelekinesisShield") or "TelekinesisShield") .. ": " .. (arg and "on" or "off"))
						end
					end)

					telekinesisActive = arg

					if thread then
						pcall(task.cancel, thread)
						thread = nil
					end

					if not arg then
						return
					end

					thread = task.spawn(function()
						local grabEvents2 = ReplicatedStorage_:FindFirstChild("GrabEvents")
						local setNetworkOwner = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")
						local overlapParams = OverlapParams.new()

						pcall(function()
							overlapParams.FilterType = Enum.RaycastFilterType.Exclude
						end)

						overlapParams.MaxParts = 200

						while telekinesisActive do
							local v48, v49, v50 = fn11()

							if v50 and setNetworkOwner then
								pcall(function()
									overlapParams.FilterDescendantsInstances = { v48 }
								end)

								local partBoundsInRadius = Workspace:GetPartBoundsInRadius(v50.Position, 60, overlapParams)

								for _, partBoundsInRadiu in ipairs(partBoundsInRadius) do
									if telekinesisActive then
										if partBoundsInRadiu:IsA("BasePart") and not partBoundsInRadiu.Anchored and not partBoundsInRadiu:IsDescendantOf(v48) then
											if (partBoundsInRadiu.Position - v50.Position).Magnitude <= 60 then
												local assemblyLinearVelocity = ((partBoundsInRadiu.Position - v50.Position).Unit + Vector3.new(0, 0.2, 0)).Unit * 100

												pcall(function()
													setNetworkOwner:FireServer(partBoundsInRadiu, partBoundsInRadiu.CFrame)
													partBoundsInRadiu.AssemblyLinearVelocity = assemblyLinearVelocity
													local random = math.random
													partBoundsInRadiu.AssemblyAngularVelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), random(-10, 10))
												end)
											end
										end

										continue
									end

									break
								end
							end

							task.wait(0.1)
						end
					end)
				end,
			})

			snowballRagdollRun = function()
				local v48 = fn15() or fn13()
				if not v48 then
					fn10("wraith", "snowball ragdoll: no target")
					return
				end
				fn10("wraith", "snowball ragdoll on " .. v48.Name)
				local spawnToyRemoteFunction = ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction
				local now2 = nil

				while flag7 do
					if not pcall(function()
						if not v48 or not v48.Parent or not v48.Character then
							local v49 = fn15() or fn13()

							if v49 then
								v48 = v49
								now2 = nil
							else
								now2 = now2 or tick()
							end
						else
							now2 = nil
						end

						local character = v48 and v48.Character
						local upperTorso

						if character then
							upperTorso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
						else
							upperTorso = character
						end

						character = character and character:FindFirstChildOfClass("Humanoid")

						if upperTorso and character and character.Health > 0 then
							local n26 = 0

							pcall(function()
								local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

								if v49 then
									for _, child in pairs(v49:GetChildren()) do
										if child.Name == "BallSnowball" then
											n26 += 1
										end
									end
								end
							end)

							if n26 > 5 then
								local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

								if v49 then
									local n27 = 0

									for _, child in pairs(v49:GetChildren()) do
										if not (n27 >= 3) then
											if child.Name == "BallSnowball" then
												pcall(function()
													ReplicatedStorage_.MenuToys.DestroyToy:FireServer(child)
												end)

												n27 += 1
											end

											continue
										end

										break
									end
								end
							end

							if n26 < 8 then
								task.spawn(function()
									pcall(function()
										local vector = Vector3.new(math.random(-30, 30) / 100, math.random(-30, 30) / 100, math.random(-30, 30) / 100)
										spawnToyRemoteFunction:InvokeServer("BallSnowball", upperTorso.CFrame * CFrame.new(vector), Vector3.zero)
									end)
								end)
							end

							pcall(function()
								local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

								if v49 then
									for _, child in pairs(v49:GetChildren()) do
										if child.Name == "BallSnowball" and child.Parent then
											local primaryPart = child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")

											if primaryPart and upperTorso and upperTorso.Parent then
												local vector = Vector3.new(math.random(-30, 30) / 100, math.random(-30, 30) / 100, math.random(-30, 30) / 100)
												primaryPart.CFrame = upperTorso.CFrame * CFrame.new(vector)
												primaryPart.AssemblyLinearVelocity = Vector3.zero
												primaryPart.AssemblyAngularVelocity = Vector3.zero
											end
										end
									end
								end
							end)

							task.wait(0.08)
						else
							task.wait(0.25)
						end
					end) then
						task.wait(0.2)
					end

					if now2 and tick() - now2 > 20 then
						fn10("wraith", "snowball ragdoll: цель не найдена 20с, стоп")
						flag7 = false
						break
					end
				end
			end

			do
				local function fn52()
					local v48 = fn25()
					local v49 = fn15() or fn13()
					if not v49 then
						fn10("wraith", "ragdoll kick: no target")
						return
					end
					local v50, v51, v52 = fn11()
					if not v52 then
						fn10("wraith", "ragdoll kick: no char")
						return
					end
					flag6 = false

					if ragdollMode == "Ownership" then
						fn10("wraith", "ragdoll kick (ownership) on " .. v49.Name)
						fn34(v49, v48)
					elseif ragdollMode == "Super Fast" then
						fn10("wraith", "ragdoll kick (super fast) on " .. v49.Name)
						fn33(v49, v48, { offsetY = 20, superFast = true })
					else
						fn10("wraith", "ragdoll kick v2 on " .. v49.Name)
						fn33(v49, v48, { offsetY = 15 })
					end

					v48.alive = false
					fn10("wraith", "ragdoll kick done")
				end

				local function fn53(arg)
					local v48 = fn25()
					if not arg or arg == localPlayer then
						return
					end
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not (humanoid and humanoidRootPart) then
						fn10("wraith", "bypass kick: no char")
						return
					end
					local seatPart = humanoid.SeatPart
					local flag13 = seatPart and seatPart.Parent and seatPart.Parent.Name == "CreatureBlobman"
					local flag14 = false

					if not flag13 then
						local v49 = fn22()

						if not v49 then
							pcall(function()
								ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", humanoidRootPart.CFrame + Vector3.new(0, 5, 0), Vector3.new(0, 59.667, 0))
							end)

							for i = 1, 25 do
								task.wait(0.1)
								v49 = fn22()
								if not v49 then
									continue
								end
								break
							end

							flag14 = true
						end

						if not v49 then
							fn10("wraith", "bypass kick: нет блобмана")
							return
						end
						fn23(v49)
						task.wait(0.15)
						local humanoid2 = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
						seatPart = humanoid2 and humanoid2.SeatPart
					end

					if not (seatPart and seatPart.Parent) then
						fn10("wraith", "bypass kick: не сел на блоба")
						return
					end
					local parent = seatPart.Parent
					local character2 = arg.Character
					if not character2 then
						fn10("wraith", "bypass kick: no target char")
						return
					end
					local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
					if not (humanoid2 and humanoidRootPart2) then
						return
					end
					local leftDetector = parent:FindFirstChild("LeftDetector")
					local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
					local rightDetector = parent:FindFirstChild("RightDetector")
					local rightWeld

					if rightDetector then
						rightWeld = rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChildWhichIsA("Weld")
					else
						rightWeld = rightDetector
					end

					local blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
					local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
					if not (leftDetector and leftWeld and creatureGrab and creatureDrop) then
						fn10("wraith", "bypass kick: нет remote'ов блоба")
						return
					end
					flag6 = false
					fn10("wraith", "bypass kick on " .. arg.Name)
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
					local grabEvents2 = ReplicatedStorage_.GrabEvents
					local cFrame = humanoidRootPart.CFrame
					local humanoidRootPart3

					if parent then
						humanoidRootPart3 = parent:FindFirstChild("HumanoidRootPart") or parent.PrimaryPart
					else
						humanoidRootPart3 = parent
					end

					local v49 = humanoidRootPart

					if humanoidRootPart3 then
					end

					local n26 = cFrame * CFrame.new(0, 18, 0)

					local function fn54(cFrame2)
						for i = 1, 6 do
							if humanoidRootPart3 and humanoidRootPart3.Parent then
								humanoidRootPart3.CFrame = cFrame2
								humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
								humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero
							end

							RunService.Heartbeat:Wait()
						end
					end

					local function fn55()
						local character3 = localPlayer.Character
						character3 = character3 and character3:FindFirstChildOfClass("Humanoid")
						if character3 and character3.SeatPart == seatPart then
							return true
						end
						return fn23(parent)
					end

					fn54(humanoidRootPart2.CFrame * CFrame.new(0, 0, 4))
					fn55()
					local now2 = tick()

					while true do
						pcall(function()
							if setNetworkOwner then
								setNetworkOwner:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
							end

							if creatureGrab and leftDetector then
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
							end

							grabEvents2.CreateGrabLine:FireServer(humanoidRootPart2, Vector3.zero, humanoidRootPart2.Position, false)
						end)

						RunService.Heartbeat:Wait()
						if not (wraithPartOwned(humanoidRootPart2) or tick() - now2 > 0.6) then
							continue
						end
						break
					end

					if not wraithPartOwned(humanoidRootPart2) then
						pcall(function()
							wraithClaimNear(character2, 1.2)
						end)
					end

					local v50 = nil

					if bypassRagdollTarget then
						task.spawn(function()
							pcall(function()
								v50 = fn31(v48)
							end)
						end)
					end

					task.wait(0.05)

					while true do
						local flag15 = v48.alive and not flag6 and arg and arg.Parent and humanoid2 and humanoid2.Health > 0

						if flag15 then
							flag15 = tick() < (kickEnd or math.huge)
						end

						if flag15 then
							wraithMarkKickBusy(1)
							fn55()
							character2 = arg.Character
							humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
							humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")

							if humanoidRootPart2 and humanoid2 then
								pcall(function()
									for i = 1, 14 do
										creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)

										if rightDetector and rightWeld then
											creatureGrab:FireServer(rightDetector, humanoidRootPart2, rightWeld)
										end
									end

									if setNetworkOwner then
										setNetworkOwner:FireServer(humanoidRootPart2, n26)
									end

									pcall(function()
										grabEvents2.CreateGrabLine:FireServer(humanoidRootPart2, Vector3.zero, n26.Position, false)
									end)

									wraithPinBody(character2, n26)

									if inputLagTargetOn and fn26("byp_ilag", 3) then
										task.spawn(function()
											pcall(function()
												wraithInputLagPulse(character2)
											end)
										end)
									end

									humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero

									if setNetworkOwner then
										setNetworkOwner:FireServer(humanoidRootPart2, n26)
									end

									if bypassGrabMode == "Grab-Release" then
										creatureDrop:FireServer(leftWeld, humanoidRootPart2)
									else
										creatureDrop:FireServer(leftWeld, humanoidRootPart2)
										creatureDrop:FireServer(leftWeld, humanoidRootPart2)

										pcall(function()
											grabEvents2.DestroyGrabLine:FireServer(humanoidRootPart2)
										end)
									end

									if v49 and v49.Parent then
										v49.CFrame = cFrame
										v49.AssemblyLinearVelocity = Vector3.zero
									end
								end)

								if bypassRagdollTarget and fn26("byp_rag", 0.08) then
									pcall(function()
										ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart2, 3)
										local humanoid3 = character2:FindFirstChildOfClass("Humanoid")

										if humanoid3 then
											humanoid3.PlatformStand = true
										end
									end)

									if v50 and v50.sound and v50.sound.Parent and fn26("byp_pal", 0.1) then
										pcall(function()
											local sound2 = v50.sound
											sound2.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -2.2, 0)
											sound2.AssemblyLinearVelocity = Vector3.new(0, 9000, 0)
										end)
									end
								end

								pcall(function()
									wraithClaimBody(character2)
								end)

								task.wait(0.06)
								continue
							end
						end

						break
					end

					if v50 and v50.pallet and v50.pallet.Parent then
						pcall(function()
							ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v50.pallet)
						end)
					end

					pcall(function()
						fn19(cFrame)
					end)

					if flag14 then
						pcall(fn21)
					end

					v48.alive = false
					fn10("wraith", "bypass kick done")
				end

				local flag13 = false
				local thread2 = nil

				spectateSet = function(arg)
					flag13 = arg

					if thread2 then
						pcall(function()
							task.cancel(thread2)
						end)

						thread2 = nil
					end

					local currentCamera = Workspace.CurrentCamera

					if not arg then
						pcall(function()
							currentCamera.CameraType = Enum.CameraType.Custom
							local v48
							v48, v48 = fn11()

							if v48 then
								currentCamera.CameraSubject = v48
							end
						end)

						return
					end

					local v48 = fn15() or fn13()
					if not v48 then
						fn10("wraith", "spectate: no target")
						return
					end
					fn10("wraith", "spectating " .. v48.Name)

					thread2 = task.spawn(function()
						while flag13 do
							pcall(function()
								local character = v48.Character
								character = character and character:FindFirstChild("Humanoid")

								if character then
									currentCamera.CameraType = Enum.CameraType.Custom
									currentCamera.CameraSubject = character
								end
							end)

							task.wait(0.5)
						end

						pcall(function()
							currentCamera.CameraType = Enum.CameraType.Custom
							local v49
							v49, v49 = fn11()

							if v49 then
								currentCamera.CameraSubject = v49
							end
						end)
					end)
				end

				local flag14 = false
				freeCamSpeed = freeCamSpeed or 80

				local tbl10 = {
					conns = {},
					saved = nil,
					speed = 45,
					vel = Vector3.zero,
					look = Vector2.zero,
					yaw = 0,
					pitch = 0,
				}

				local function fn54()
					pcall(function()
						game:GetService("ContextActionService"):UnbindAction("wraithFreecamSink")
					end)

					for k, conn in pairs(tbl10.conns) do
						pcall(function()
							conn:Disconnect()
						end)

						tbl10.conns[k] = nil
					end
				end

				freeCamSet = function(arg)
					local currentCamera = Workspace.CurrentCamera
					if not currentCamera then
						return
					end
					local flag15 = arg and true or false
					if flag15 == flag14 then
						return
					end
					flag14 = flag15

					if not flag15 then
						fn54()

						pcall(function()
							currentCamera.CameraType = tbl10.saved and tbl10.saved.camType or Enum.CameraType.Custom
							currentCamera.FieldOfView = tbl10.saved and tbl10.saved.fov or 70
							local v48
							v48, v48 = fn11()

							if v48 then
								currentCamera.CameraSubject = v48
								v48.WalkSpeed = tbl10.saved and tbl10.saved.ws or 16
								v48.JumpPower = tbl10.saved and tbl10.saved.jp or 50
								v48.AutoRotate = true
							end

							UserInputService_.MouseBehavior = Enum.MouseBehavior.Default
							UserInputService_.MouseIconEnabled = true
						end)

						tbl10.saved = nil
						tbl10.vel = Vector3.zero
						tbl10.look = Vector2.zero
						fn10("wraith", "free cam: off (unfc)")
						return
					end

					local v48, v49 = fn11()

					tbl10.saved = {
						camType = currentCamera.CameraType,
						fov = currentCamera.FieldOfView,
						ws = v49 and v49.WalkSpeed or 16,
						jp = v49 and v49.JumpPower or 50,
					}

					pcall(function()
						currentCamera.CameraType = Enum.CameraType.Scriptable

						if v49 then
							v49.WalkSpeed = 0
							v49.JumpPower = 0
						end
					end)

					local cFrame = currentCamera.CFrame
					local v50, v51 = cFrame:ToEulerAnglesYXZ()
					local v52 = tbl10
					tbl10.pitch = v50
					v52.yaw = v51
					tbl10.look = Vector2.zero
					tbl10.vel = Vector3.zero
					local position = cFrame.Position

					pcall(function()
						game:GetService("ContextActionService"):BindActionAtPriority("wraithFreecamSink", function()
							return Enum.ContextActionResult.Sink
						end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Q, Enum.KeyCode.E, Enum.KeyCode.Space)
					end)

					tbl10.conns.input = UserInputService_.InputChanged:Connect(function(input)
						if not flag14 then
							return
						end

						if input.UserInputType == Enum.UserInputType.MouseMovement then
							if UserInputService_:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
								tbl10.look = tbl10.look + Vector2.new(input.Delta.X, input.Delta.Y)
							end
						elseif input.UserInputType == Enum.UserInputType.MouseWheel then
							tbl10.speed = math.clamp(tbl10.speed * (input.Position.Z > 0 and 1.25 or 0.8), 2, 900)
						end
					end)

					tbl10.conns.render = RunService.RenderStepped:Connect(function(deltaTime)
						if not flag14 then
							return
						end
						UserInputService_.MouseBehavior = UserInputService_:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and Enum.MouseBehavior.LockCurrentPosition or Enum.MouseBehavior.Default

						if tbl10.look.Magnitude > 0 then
							tbl10.yaw = tbl10.yaw - tbl10.look.X * 0.0045
							tbl10.pitch = math.clamp(tbl10.pitch - tbl10.look.Y * 0.0045, -1.4, 1.4)
							tbl10.look = Vector2.zero
						end

						local cframe = CFrame.fromEulerAnglesYXZ(tbl10.pitch, tbl10.yaw, 0)
						local vector = Vector3.zero

						if UserInputService_:IsKeyDown(Enum.KeyCode.W) then
							vector = Vector3.zero + Vector3.new(0, 0, -1)
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.S) then
							vector += Vector3.new(0, 0, 1)
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.A) then
							vector += Vector3.new(-1, 0, 0)
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.D) then
							vector += Vector3.new(1, 0, 0)
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.E) or UserInputService_:IsKeyDown(Enum.KeyCode.Space) then
							vector += Vector3.new(0, 1, 0)
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.Q) then
							vector += Vector3.new(0, -1, 0)
						end

						local v53 = UserInputService_:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService_:IsKeyDown(Enum.KeyCode.RightShift)
						local n26 = 1

						if v53 then
							n26 = 4
						end

						if UserInputService_:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService_:IsKeyDown(Enum.KeyCode.RightControl) then
							n26 = 0.25
						end

						local vector2 = Vector3.zero

						if vector.Magnitude > 0 then
							vector2 = cframe:VectorToWorldSpace(vector.Unit) * (freeCamSpeed or tbl10.speed) * n26
						end

						tbl10.vel = tbl10.vel:Lerp(vector2, math.clamp(deltaTime * 12, 0, 1))
						position += tbl10.vel * deltaTime
						currentCamera.CameraType = Enum.CameraType.Scriptable
						currentCamera.CFrame = CFrame.new(position) * cframe
						local v54, v55, v56 = fn11()

						if v56 then
							v56.AssemblyLinearVelocity = Vector3.new(0, math.min(v56.AssemblyLinearVelocity.Y, 0), 0)
						end
					end)

					fn10("wraith", "free cam (fc): WASD / E / Q, RMB = look, Shift = fast, Ctrl = slow, wheel = speed")
				end

				loopTPRun = function()
					local v48, v49, v50 = fn11()
					if not v50 then
						return
					end
					local cFrame = v50.CFrame

					while loopTPActive do
						pcall(function()
							local v51, v52, v53 = fn11()

							if v53 and cFrame then
								local random = math.random
								v53.CFrame = cFrame * CFrame.new(math.random(-1000, 1000), 0, random(-1000, 1000))
								v53.AssemblyLinearVelocity = Vector3.zero
								v53.AssemblyAngularVelocity = Vector3.zero

								pcall(function()
									ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
								end)
							end
						end)

						task.wait(0.05)
					end

					pcall(function()
						local v51, v52, v53 = fn11()

						if v53 and cFrame and v53.Parent then
							v53.CFrame = cFrame
						end
					end)
				end

				gucciTrainRun = function()
					if autoGucciKind and autoGucciKind ~= "Auto Train" then
						gucciVehicleLoop()
						return
					end
					local v48 = RunService
					local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
					local humanoid = character:WaitForChild("Humanoid", 10)
					local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
					if not (humanoid and humanoidRootPart) then
						return
					end
					local cFrame = humanoidRootPart.CFrame
					local position = humanoidRootPart.Position
					local connection2 = nil
					local n26 = 0

					local function fn55()
						local map = Workspace:FindFirstChild("Map")
						map = map and map:FindFirstChild("AlwaysHereTweenedObjects")
						return map and map:FindFirstChild("Train")
					end

					local function fn56()
						local v49 = fn55()
						if not v49 then
							return false
						end
						local v50 = nil

						for _, descendant in ipairs(v49:GetDescendants()) do
							if descendant:IsA("Seat") then
								v50 = descendant
								break
							end
						end

						if not v50 then
							return false
						end
						position = humanoidRootPart.Position

						pcall(function()
							humanoidRootPart.CFrame = v50.CFrame + Vector3.new(0, 2, 0)
						end)

						pcall(function()
							v50:Sit(humanoid)
						end)

						task.delay(0.2, function()
							pcall(function()
								fn18(cFrame)
							end)
						end)

						if connection2 then
							pcall(function()
								connection2:Disconnect()
							end)
						end

						connection2 = v48.Heartbeat:Connect(function()
							if not (humanoidRootPart and humanoid) then
								return
							end

							pcall(function()
								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0)
							end)

							if n26 > 0 then
								pcall(function()
									humanoidRootPart.CFrame = CFrame.new(position)
								end)

								n26 -= 1
							end
						end)

						humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
							if humanoid.Jump and humanoid.Sit then
								n26 = 15
								position = humanoidRootPart.Position
							end
						end)

						return true
					end

					if not fn56() then
						fn10("wraith", "gucci train: no train on map")
						return
					end
					fn10("wraith", "gucci train: riding")

					while autoGucciActive do
						pcall(function()
							local v49 = fn11()

							if v49 and v49 ~= character then
								character = v49
								humanoid = v49:FindFirstChild("Humanoid")
								humanoidRootPart = v49:FindFirstChild("HumanoidRootPart")

								if humanoid and humanoidRootPart then
									fn56()
								end
							end

							if not fn55() then
								if connection2 then
									pcall(function()
										connection2:Disconnect()
									end)

									connection2 = nil
								end

								local n27 = 0

								while true do
									if autoGucciActive and n27 < 25 then
										task.wait(0.2)
										n27 += 1
										if not fn55() then
											continue
										end
									end

									break
								end

								if autoGucciActive and fn55() then
									fn56()
								end
							end
						end)

						task.wait(0.5)
					end

					if connection2 then
						pcall(function()
							connection2:Disconnect()
						end)
					end
				end

				gucciVehicleLoop = function()
					local str6 = ({
						["Auto Tractor"] = "TractorGreen",
						["Auto Blobman"] = "CreatureBlobman",
						Gucci = "CreatureBlobman",
					})[autoGucciKind] or "CreatureBlobman"

					local flag15 = autoGucciKind == "Gucci"
					local destroyToy = ReplicatedStorage_.MenuToys and ReplicatedStorage_.MenuToys:FindFirstChild("DestroyToy")
					local setNetworkOwner = ReplicatedStorage_.GrabEvents and ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
					local cframe = CFrame.new(0, -950, 0)

					local function fn55(arg)
						pcall(function()
							if not (arg and arg.Parent) then
								return
							end
							local tbl11 = {}

							for _, descendant in pairs(arg:GetDescendants()) do
								if descendant:IsA("BasePart") then
									table.insert(tbl11, descendant)
								end
							end

							for _, v48 in ipairs(tbl11) do
								if setNetworkOwner then
									pcall(function()
										setNetworkOwner:FireServer(v48, v48.CFrame)
									end)
								end
							end

							if #tbl11 > 0 then
								local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart") or tbl11[1]

								pcall(function()
									humanoidRootPart.CFrame = cframe
								end)

								for _, v48 in ipairs(tbl11) do
									pcall(function()
										v48.Anchored = true
										v48.AssemblyLinearVelocity = Vector3.zero
										v48.AssemblyAngularVelocity = Vector3.zero
									end)
								end
							end
						end)
					end

					local function fn56()
						local v48, v49, v50 = fn11()
						if not (v49 and v50) then
							return nil
						end
						local v51 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

						if v51 then
							for _, child in pairs(v51:GetChildren()) do
								if child.Name == str6 and child.Parent then
									pcall(function()
										if destroyToy then
											destroyToy:FireServer(child)
										end
									end)
								end
							end
						end

						local v52 = fn20(str6, v50.CFrame * CFrame.new(5, 5, 20), Vector3.new(0, 59.667, 0))
						if not v52 then
							return nil
						end
						local vehicleSeat = v52:FindFirstChild("VehicleSeat") or v52:FindFirstChildWhichIsA("VehicleSeat", true)
						if not vehicleSeat then
							return nil
						end

						pcall(function()
							vehicleSeat:Sit(v49)
						end)

						local characterEvents = ReplicatedStorage_:FindFirstChild("CharacterEvents")
						local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")

						task.spawn(function()
							local n26 = tick() + 3

							while autoGucciActive and tick() < n26 do
								if ragdollRemote then
									pcall(function()
										ragdollRemote:FireServer(v50, 0)
									end)
								end

								task.wait()
							end
						end)

						local now2 = tick()

						while autoGucciActive and v52.Parent and vehicleSeat.Occupant ~= v49 and tick() - now2 < 5 do
							task.wait()
						end

						if not (v52 and v52.Parent) then
							return nil
						end

						pcall(function()
							v49:ChangeState(Enum.HumanoidStateType.Jumping)
						end)

						task.wait(0.2)
						fn55(v52)
						return v52
					end

					local v48 = fn56()

					if autoGucciActive and flag15 then
						task.wait(0.5)

						pcall(function()
							local v49, v50, v51 = fn11()

							if v51 and gucciPreRidePos then
								v51.CFrame = gucciPreRidePos
								v51.AssemblyLinearVelocity = Vector3.zero
								v51.AssemblyAngularVelocity = Vector3.zero
							end
						end)

						autoGucciActive = false

						pcall(function()
							if lib.Flags and lib.Flags.GucciTrain then
								lib.Flags.GucciTrain:SetValue(false)
							end
						end)

						return
					end

					local flag16 = false
					local v49 = nil

					while autoGucciActive do
						local v50, v51, v52 = fn11()

						if not (v50 and v52) then
							task.wait(0.5)
							flag16 = false
							v49 = nil
						else
							if v49 ~= v50 then
								flag16 = false
								v49 = v50
							end

							if flag16 then
								task.wait(0.5)
							else
								if v48 and v48.Parent then
									fn55(v48)
								else
									v48 = fn56()
								end

								flag16 = true
							end
						end
					end
				end

				antiInvisScan = function()
					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer and player.Character then
							local flag15 = false

							pcall(function()
								for _, child in pairs(player.Character:GetChildren()) do
									if child:IsA("BasePart") and child.Transparency >= 0.9 and child.Name ~= "HumanoidRootPart" then
										flag15 = true
										break
									end
								end
							end)

							if flag15 then
								pcall(function()
									for _, child in pairs(player.Character:GetChildren()) do
										if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
											child.Transparency = math.min(child.Transparency, 0.55)
										end
									end

									if not player.Character:FindFirstChild("WraithInvisMark") then
										local highlight = Instance.new("Highlight")
										highlight.Name = "WraithInvisMark"
										highlight.Adornee = player.Character
										highlight.FillColor = Color3.fromRGB(255, 80, 80)
										highlight.FillTransparency = 0.5
										highlight.OutlineColor = Color3.fromRGB(255, 80, 80)
										highlight.OutlineTransparency = 0
										highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
										highlight.Parent = player.Character
									end
								end)
							end
						end
					end
				end

				wraithPartOwned = function(arg)
					if not arg then
						return false
					end
					local partOwner = arg:FindFirstChild("PartOwner")
					if partOwner then
						local name = localPlayer.Name
						return tostring(partOwner.Value) == name
					end
					return false
				end

				wraithCanMove = function(arg)
					if not arg then
						return false
					end
					local partOwner = arg:FindFirstChild("PartOwner")
					if not partOwner then
						return true
					end
					local name = localPlayer.Name
					return tostring(partOwner.Value) == name
				end

				wraithBlobHand = function(arg)
					local v48, seatPart = fn11()
					seatPart = seatPart and seatPart.SeatPart
					seatPart = seatPart and seatPart.Parent
					local blobmanSeatAndOwnerScript = seatPart and seatPart:FindFirstChild("BlobmanSeatAndOwnerScript")
					if not blobmanSeatAndOwnerScript then
						return nil
					end
					local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
					local rightDetector = seatPart:FindFirstChild(arg == "left" and "LeftDetector" or "RightDetector") or seatPart:FindFirstChild("RightDetector") or seatPart:FindFirstChild("LeftDetector")
					local rightWeld = rightDetector and (rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChild("LeftWeld") or rightDetector:FindFirstChildWhichIsA("Weld"))
					if not (creatureGrab and creatureDrop and rightDetector and rightWeld) then
						return nil
					end
					return { grab = creatureGrab, drop = creatureDrop, det = rightDetector, weld = rightWeld, blob = seatPart }
				end

				wraithGrabClaim = function(arg, arg2)
					if not (arg and arg.Parent) then
						return false
					end
					local grabEvents2 = ReplicatedStorage_:FindFirstChild("GrabEvents")
					if not grabEvents2 then
						return false
					end
					local createGrabLine = grabEvents2:FindFirstChild("CreateGrabLine")
					local setNetworkOwner = grabEvents2:FindFirstChild("SetNetworkOwner")

					pcall(function()
						if arg2 and arg2.grab then
							arg2.grab:FireServer(arg2.det, arg, arg2.weld)
						end

						if createGrabLine then
							createGrabLine:FireServer(arg, Vector3.zero, arg.Position, false)
						end

						if setNetworkOwner then
							setNetworkOwner:FireServer(arg, arg.CFrame)
						end
					end)

					return wraithPartOwned(arg)
				end

				wraithServerMove = function(arg, cFrame, arg2)
					if not (arg and arg.Parent) then
						return false
					end

					if not wraithCanMove(arg) then
						return false
					end
					local grabEvents2 = ReplicatedStorage_:FindFirstChild("GrabEvents")
					grabEvents2 = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")

					pcall(function()
						arg.CFrame = cFrame
						local v48 = arg
						local v49 = arg2
						local vector

						if arg2 then
							vector = v49
						else
							vector = Vector3.zero
						end

						v48.AssemblyLinearVelocity = vector
						arg.AssemblyAngularVelocity = Vector3.zero

						if grabEvents2 then
							grabEvents2:FireServer(arg, cFrame)
						end
					end)

					return true
				end

				wraithVoidKillBurst = function(arg, arg2, arg3, arg4)
					local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
					if not (humanoid and humanoidRootPart) then
						return false
					end
					local now2 = tick()
					local n26 = 0
					local exitTo = nil

					while true do
						if not (tick() - now2 < (arg3 or 1.5)) then
							exitTo = 1
							break
						elseif arg4 and (not arg4.alive or flag6) then
							exitTo = 1
							break
						elseif not (arg.Parent and humanoidRootPart.Parent) then
							exitTo = 1
							break
						else
							wraithGrabClaim(humanoidRootPart, arg2)

							if wraithCanMove(humanoidRootPart) then
								pcall(function()
									humanoid:TakeDamage(math.max(humanoid.MaxHealth, 1000))
									humanoid.Health = 0
									humanoid:ChangeState(Enum.HumanoidStateType.Dead)
								end)

								local random = math.random
								local cframe = CFrame.new(math.random(-350, 350), -1300, random(-350, 350))
								wraithServerMove(humanoidRootPart, cframe, Vector3.new(0, -1200, 0))

								if tick() - n26 > 0.08 then
									n26 = tick()

									for _, child in ipairs(arg:GetChildren()) do
										if child:IsA("BasePart") and child ~= humanoidRootPart then
											wraithGrabClaim(child, nil)
											local random2 = math.random
											wraithServerMove(child, cframe * CFrame.new(math.random(-3, 3), math.random(-3, 3), random2(-3, 3)), Vector3.new(0, -1200, 0))
										end
									end
								end
							end

							if not (humanoid.Health <= 0) then
								task.wait()
								continue
							end
						end

						break
					end

					if exitTo == 1 then
						return humanoid and humanoid.Health <= 0 or false
					end
					return true
				end

				wraithLoopKillStart = function(arg, arg2)
					local n26 = 100000
					local vector = Vector3.new(6, -18.5, 0)

					local tbl11 = {
						part = nil,
						attach = function(arg3, cFrame)
							arg3:detach()
							local part2 = Instance.new("Part")
							part2.Name = "CameraAnchor"
							part2.Size = Vector3.new(0.2, 0.2, 0.2)
							part2.Transparency = 1
							part2.Anchored = true
							part2.CanCollide = false
							part2.CFrame = cFrame
							part2.Parent = Workspace
							arg3.part = part2
							local currentCamera = Workspace.CurrentCamera
							currentCamera.CameraType = Enum.CameraType.Custom
							currentCamera.CameraSubject = part2
						end,
						detach = function(arg3)
							if arg3.part then
								pcall(function()
									arg3.part:Destroy()
								end)

								arg3.part = nil
							end

							local currentCamera = Workspace.CurrentCamera
							local character = localPlayer.Character

							if character and character:FindFirstChildOfClass("Humanoid") then
								currentCamera.CameraSubject = character:FindFirstChildOfClass("Humanoid")
							else
								currentCamera.CameraType = Enum.CameraType.Custom
							end
						end,
					}

					local function fn55(arg3)
						local character = arg3 and arg3.Character
						character = character and character:FindFirstChild("HumanoidRootPart")
						return not character or character.Position.Y > n26
					end

					local function fn56(arg3)
						for _, descendant in ipairs(arg3:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
							end
						end
					end

					local function fn57()
						local character = localPlayer.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							character:SetAttribute("OriginalPosition", humanoidRootPart:GetPivot())
						end
					end

					local function fn58()
						local character = localPlayer.Character
						return character and character:GetAttribute("OriginalPosition") or nil
					end

					local function fn59()
						local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
						return v48 and v48:FindFirstChild("CreatureBlobman") or nil
					end

					local function fn60()
						local v48 = fn59()
						if v48 then
							return v48
						end

						pcall(function()
							local spawnToyRemoteFunction = ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction

							if spawnToyRemoteFunction and localPlayer.Character then
								spawnToyRemoteFunction:InvokeServer("CreatureBlobman", localPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5), Vector3.new(0, -15, 0))
							end
						end)

						for i = 1, 30 do
							task.wait(0.1)
							local v49 = fn59()
							if v49 then
								return v49
							end
						end

						return nil
					end

					local function fn61(parent, arg3)
						if not (parent and arg3) or arg3.Health <= 0 then
							return
						end
						local v48 = fn60()

						if v48 and v48:FindFirstChild("BlobmanSeatAndOwnerScript") then
							local creatureDrop = v48.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

							if creatureDrop then
								for _, descendant in ipairs(arg3.Parent:GetDescendants()) do
									if descendant:IsA("Weld") or descendant:IsA("BallSocketConstraint") then
										pcall(function()
											creatureDrop:FireServer(descendant, descendant)
										end)
									end
								end
							end
						end

						arg3.Sit = false
						arg3:ChangeState(Enum.HumanoidStateType.Running)
						arg3:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
						arg3:ChangeState(Enum.HumanoidStateType.GettingUp)
						local playerFromCharacter = Players:GetPlayerFromCharacter(arg3.Parent)

						if playerFromCharacter and playerFromCharacter:FindFirstChild("IsHeld") then
							pcall(function()
								playerFromCharacter.IsHeld.Value = false
							end)
						end

						local ragdolled = arg3:FindFirstChild("Ragdolled")

						if ragdolled then
							pcall(function()
								ragdolled.Value = false
							end)
						end

						local bodyVelocity = Instance.new("BodyVelocity")
						local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
						bodyVelocity.MaxForce = Vector3.new(10000000, -10000000, 10000000)
						bodyVelocity.P = 1000000
						local random = math.random
						bodyVelocity.Velocity = Vector3.new(math.random(-500, 50), -50, random(-50, 50))
						bodyAngularVelocity.MaxTorque = Vector3.new(-10000000, -10000000, -10000000)
						bodyAngularVelocity.P = 1000000
						local random2 = math.random
						bodyAngularVelocity.AngularVelocity = Vector3.new(math.random(-500, 300), math.random(-300, 300), random2(-500, 500))
						bodyVelocity.Parent = parent
						bodyAngularVelocity.Parent = parent
						arg3.BreakJointsOnDeath = false
						arg3:ChangeState(Enum.HumanoidStateType.Dead)

						task.delay(2, function()
							if bodyVelocity.Parent then
								bodyVelocity:Destroy()
							end

							if bodyAngularVelocity.Parent then
								bodyAngularVelocity:Destroy()
							end
						end)
					end

					local fallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight

					local function fn62()
						if not arg2.alive then
							return
						end
						local v48 = fn58()
						if not v48 then
							return
						end
						local connection2 = nil

						connection2 = RunService.Heartbeat:Connect(function()
							connection2:Disconnect()
							local character = localPlayer.Character

							if character and character:FindFirstChild("HumanoidRootPart") then
								pcall(function()
									character:PivotTo(v48)
								end)

								pcall(function()
									Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
								end)

								character:SetAttribute("SavingOriginalPos", false)
							end

							tbl11:detach()
						end)
					end

					if not arg or arg == localPlayer then
						fn10("wraith", "loop kill: выбери цель (не себя)")
						arg2.alive = false
						return
					end

					local character = localPlayer.Character

					if character then
						character:SetAttribute("SavingOriginalPos", false)
						character:SetAttribute("OriginalPosition", nil)
					end

					local connection2 = nil

					connection2 = RunService.Heartbeat:Connect(function()
						local flag15 = arg2.alive and not flag6

						if flag15 then
							flag15 = tick() < (kickEnd or math.huge)
						end

						if not flag15 then
							connection2:Disconnect()
							tbl11:detach()

							pcall(function()
								Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
							end)

							local character2 = localPlayer.Character

							if character2 then
								character2:SetAttribute("SavingOriginalPos", false)
								character2:SetAttribute("OriginalPosition", nil)
							end

							arg2.alive = false
							return
						end

						if not (arg and arg.Parent) or arg == localPlayer then
							return
						end
						local character2 = arg.Character
						if not character2 or character2 == localPlayer.Character then
							return
						end
						local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
						local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")
						local head = character2 and character2:FindFirstChild("Head")
						if not (humanoidRootPart and humanoid and head) then
							return
						end

						if fn55(arg) then
							return
						end
						local dead = Enum.HumanoidStateType.Dead
						if humanoid:GetState() == dead then
							return
						end
						local character3 = localPlayer.Character
						local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
						if not (character3 and humanoidRootPart2) then
							return
						end
						wraithMarkKickBusy(1)

						if not character3:GetAttribute("SavingOriginalPos") then
							if (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude < 25 then
								return
							end
							fn57()
						end

						character3:SetAttribute("SavingOriginalPos", true)

						pcall(function()
							Workspace.FallenPartsDestroyHeight = (0/0)
						end)

						local v48 = fn58()

						if v48 then
							tbl11:attach(v48)
						end

						pcall(function()
							humanoidRootPart2:PivotTo(CFrame.new(humanoidRootPart.Position + vector))
						end)

						fn56(character2)

						pcall(function()
							ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
						end)

						task.wait(0.05)

						pcall(function()
							ReplicatedStorage_.GrabEvents.DestroyGrabLine:FireServer(humanoidRootPart)
						end)

						task.wait(0.05)
						local partOwner = head:FindFirstChild("PartOwner")

						if partOwner and partOwner.Value == localPlayer.Name then
							task.wait(0.05)
							fn61(humanoidRootPart, humanoid)
						end

						fn62()
					end)
				end

				wraithBlobKillStart = function(arg, arg2)
					task.spawn(function()
						local v48 = localPlayer

						local function fn55(arg3, arg4, arg5)
							local v49 = arg3:FindFirstChild(arg4)
							local v50

							if v49 then
								v50 = v49
							else
								v50 = arg3:WaitForChild(arg4, arg5 or 3)
							end

							return v50
						end

						local function fn56(arg3)
							pcall(function()
								ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(arg3, arg3.CFrame)
							end)
						end

						local function fn57(arg3, arg4, arg5, arg6)
							local v49 = arg3:FindFirstChild(arg5 .. "Detector")
							if not v49 then
								return
							end
							local blobmanSeatAndOwnerScript = arg3:FindFirstChild("BlobmanSeatAndOwnerScript")
							if not blobmanSeatAndOwnerScript then
								return
							end

							pcall(function()
								if arg6 == "Default" then
									blobmanSeatAndOwnerScript.CreatureGrab:FireServer(v49, arg4, v49[arg5 .. "Weld"])
								elseif arg6 == "DDrop" then
									blobmanSeatAndOwnerScript.CreatureDrop:FireServer(v49[arg5 .. "Weld"])
								elseif arg6 == "Release" then
									blobmanSeatAndOwnerScript.CreatureRelease:FireServer(v49[arg5 .. "Weld"], arg4)
								end
							end)
						end

						local now2 = tick()
						local exitTo = nil
						local parent, character

						while true do
							local flag15 = arg2.alive and not flag6
							parent = nil

							if flag15 then
								character = v48.Character
								character = character and character:FindFirstChildOfClass("Humanoid")

								if character and character.SeatPart then
									exitTo = 2
									break
								elseif not (tick() - now2 > 5) then
									task.wait()
									continue
								end
							else
								exitTo = 1
								break
							end

							break
						end

						if exitTo ~= 1 then
							if exitTo ~= 2 then
								fn10("wraith", "blob kill: сядь на блобмана")
								arg2.alive = false
								return
							end

							parent = character.SeatPart.Parent
						end

						local flag15 = true

						while true do
							if flag15 and arg2.alive and not flag6 and task.wait() then
								if not (tick() > (kickEnd or math.huge)) then
									wraithMarkKickBusy(1.5)
									local character2 = v48.Character

									if character2 then
										local humanoidRootPart = fn55(character2, "HumanoidRootPart")
										local humanoid = fn55(character2, "Humanoid")

										if humanoidRootPart and humanoid then
											if not humanoid.SeatPart then
												fn10("wraith", "blob kill: слез с блоба, стоп")
												break
											elseif humanoid.SeatPart.Parent ~= parent then
												fn10("wraith", "blob kill: сменил блоба, стоп")
												break
											else
												local v49 = arg
												local parent2 = arg

												if v49 then
													parent2 = v49.Parent
												end

												if parent2 then
													local character3 = v49.Character

													if character3 then
														local humanoid2 = fn55(character3, "Humanoid", 2)
														local humanoidRootPart2 = fn55(character3, "HumanoidRootPart", 2)

														if humanoid2 and humanoidRootPart2 then
															if humanoid2.Health == 0 then
																local result = v49.CharacterAdded:Wait()
																humanoid2 = fn55(result, "Humanoid", 2)
																humanoidRootPart2 = fn55(result, "HumanoidRootPart", 2)
																task.wait(0.15)
															end

															if humanoid2 and humanoidRootPart2 and flag15 and parent and parent.Parent then
																local leftDetector = parent:FindFirstChild("LeftDetector")
																local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

																if leftDetector and leftWeld then
																	while true do
																		if leftWeld.Attachment0 ~= humanoidRootPart2:FindFirstChild("RootAttachment") and flag15 and arg2.alive and not flag6 then
																			local cFrame = humanoidRootPart.CFrame
																			local now3 = tick()

																			while humanoid2.SeatPart and tick() - now3 < 2 do
																				task.spawn(fn56, humanoidRootPart2)
																				task.wait()
																			end

																			for i = 1, 4 do
																				if not humanoid.SeatPart then
																					flag15 = false
																					break
																				else
																					humanoidRootPart.CFrame = humanoidRootPart2.CFrame - Vector3.new(0, 10, 0)
																					fn57(parent, humanoidRootPart2, "Left", "Default")
																					task.wait(0.05)
																					fn57(parent, humanoidRootPart2, "Left", "Release")

																					pcall(function()
																						humanoid2.Health = 0
																					end)

																					task.wait()
																				end
																			end

																			if flag15 then
																				humanoidRootPart.CFrame = cFrame
																				if humanoidRootPart2 and humanoidRootPart2.Parent then
																					continue
																				end
																			end
																		end

																		break
																	end
																end
															end
														end
													end

													continue
												end
											end
										end
									end
								end
							end

							break
						end

						arg2.alive = false
						fn10("wraith", "blob kill: stopped")
					end)
				end

				bypassGrabMode = bypassGrabMode or "Grab-Drop"
				loopGrabHeight = loopGrabHeight or 23

				local function fn55(arg)
					local v48, seatPart = fn11()
					seatPart = seatPart and seatPart.SeatPart
					if not arg then
						return
					end

					if not (seatPart and seatPart.Parent and seatPart.Parent.Name == "CreatureBlobman") then
						fn10("wraith", "loop grab kick: сядь на CreatureBlobman")
						return
					end
					local v49 = fn25()
					fn10("wraith", "loop kick (grab + blob) on " .. arg.Name)
					local grabEvents2 = ReplicatedStorage_:WaitForChild("GrabEvents")
					local parent = seatPart.Parent
					local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart") or parent.PrimaryPart
					local blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
					local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
					local rightDetector = parent:FindFirstChild("RightDetector")
					local rightWeld

					if rightDetector then
						rightWeld = rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChildWhichIsA("Weld")
					else
						rightWeld = rightDetector
					end

					if not humanoidRootPart then
						v49.alive = false
						return
					end
					local cFrame = humanoidRootPart.CFrame
					local v50 = nil

					if bypassRagdollTarget then
						task.spawn(function()
							pcall(function()
								v50 = fn31(v49)
							end)
						end)
					end

					local character = arg.Character
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart2 and humanoidRootPart then
						local now2 = tick()

						while tick() - now2 < 0.35 do
							if not (not v49.alive or flag6) then
								humanoidRootPart.CFrame = humanoidRootPart2.CFrame
								humanoidRootPart.AssemblyLinearVelocity = Vector3.zero

								pcall(function()
									if creatureGrab and rightDetector then
										creatureGrab:FireServer(rightDetector, humanoidRootPart2, rightWeld)
									end

									grabEvents2.CreateGrabLine:FireServer(humanoidRootPart2, Vector3.zero, humanoidRootPart2.Position, false)
									grabEvents2.SetNetworkOwner:FireServer(humanoidRootPart2, humanoidRootPart.CFrame)
								end)

								RunService.Heartbeat:Wait()
								continue
							end

							break
						end

						humanoidRootPart.CFrame = cFrame
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						task.wait(0.05)
					end

					local n26 = 0

					while true do
						local flag15 = v49.alive and not flag6
						local flag16

						if flag15 then
							flag16 = tick() < (kickEnd or math.huge)
						else
							flag16 = flag15
						end

						if flag16 then
							if arg and arg.Parent and arg.Character then
								wraithMarkKickBusy(1)
								local character2 = arg.Character
								local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
								character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

								if humanoidRootPart3 and character2 and character2.Health > 0 and humanoidRootPart then
									humanoidRootPart.CFrame = cFrame
									humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
									local cFrame2 = cFrame * CFrame.new(0, loopGrabHeight or 23, 0)
									humanoidRootPart3.CFrame = cFrame2
									humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero

									if bypassRagdollTarget and fn26("lgk_rag", 0.08) then
										pcall(function()
											ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart3, 3)
											character2.PlatformStand = true
										end)

										if v50 and v50.sound and v50.sound.Parent and fn26("lgk_pal", 0.1) then
											pcall(function()
												v50.sound.CFrame = humanoidRootPart3.CFrame * CFrame.new(0, -2.2, 0)
												v50.sound.AssemblyLinearVelocity = Vector3.new(0, 9000, 0)
											end)
										end
									end

									if tick() - n26 > 0.05 then
										n26 = tick()

										pcall(function()
											character2.PlatformStand = true
											character2.Sit = true
											grabEvents2.SetNetworkOwner:FireServer(humanoidRootPart3, cFrame2)

											if rightDetector then
												local rightWeld2 = rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChildWhichIsA("Weld")

												if rightWeld2 and creatureDrop then
													creatureDrop:FireServer(rightWeld2)
												end
											end

											grabEvents2.DestroyGrabLine:FireServer(humanoidRootPart3)

											if rightDetector and creatureGrab then
												creatureGrab:FireServer(rightDetector, humanoidRootPart3, rightWeld)
											end

											grabEvents2.CreateGrabLine:FireServer(humanoidRootPart3, Vector3.zero, humanoidRootPart3.Position, false)
										end)
									end
								else
									humanoidRootPart.CFrame = cFrame
									humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
								end

								RunService.Heartbeat:Wait()
								continue
							end
						end

						break
					end

					if v50 and v50.pallet and v50.pallet.Parent then
						pcall(function()
							ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v50.pallet)
						end)
					end

					if humanoidRootPart then
						humanoidRootPart.CFrame = cFrame
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					end

					v49.alive = false
				end

				fn16 = function(arg)
					if methodDropdown then
						pcall(function()
							str5 = methodDropdown:GetValue() or str5
						end)
					end

					local v48 = arg or fn15()
					if not v48 then
						return
					end

					if fn24(v48) then
						fn10("wraith", v48.Name .. " is whitelisted")
						return
					end
					local v49 = str5
					kickEnd = tick() + 3600
					wraithMarkKickBusy(3)

					task.spawn(function()
						while true do
							local v50 = kickEnd

							if tick() < v50 and not flag6 then
								wraithMarkKickBusy(1.5)
								task.wait(0.5)
								continue
							end

							break
						end
					end)

					if v48 then
						wraithKickMarks[v48.Name] = tick()
					end

					if v49 == "Bring" and bringAllOn then
						wraithBringAllRun(false)
						return
					end

					if v49 == "Ragdoll Kick" then
						fn52()
						return
					end

					if v49 == "Kick All" then
						fn36()
						return
					end

					if v49 == "Bring" then
						local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
						local humanoid = character:WaitForChild("Humanoid")
						local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
						local seatPart = humanoid.SeatPart
						if not seatPart then
							return
						end
						local parent = seatPart.Parent
						local humanoidRootPart2 = (v48.Character or v48.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
						local leftDetector = parent:WaitForChild("LeftDetector")
						local leftWeld = leftDetector:WaitForChild("LeftWeld")
						local creatureGrab = parent.BlobmanSeatAndOwnerScript:WaitForChild("CreatureGrab")
						local cFrame = humanoidRootPart.CFrame
						local tbl11 = {}

						for _, descendant in pairs(character:GetDescendants()) do
							if descendant:IsA("BasePart") then
								tbl11[descendant] = descendant.Transparency
								descendant.Transparency = 1
							end
						end

						local currentCamera = Workspace.CurrentCamera
						local cFrame2 = currentCamera.CFrame
						currentCamera.CameraType = Enum.CameraType.Scriptable
						currentCamera.CFrame = cFrame2
						humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -7, 2.5)
						task.wait(0.1)
						local now2 = tick()

						while tick() - now2 < 1.2 do
							pcall(function()
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
							end)

							task.wait(0.08)
						end

						task.delay(0.1, function()
							pcall(function()
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
							end)
						end)

						task.delay(0.2, function()
							humanoidRootPart.CFrame = cFrame

							for k, v50 in pairs(tbl11) do
								if k and k.Parent then
									k.Transparency = v50
								end
							end

							currentCamera.CameraType = Enum.CameraType.Custom
							currentCamera.CameraSubject = humanoid
						end)
					elseif v49 == "Kick" then
						local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
						local humanoid = character:WaitForChild("Humanoid")
						local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
						local seatPart = humanoid.SeatPart

						if seatPart then
							local parent = seatPart.Parent
							local humanoidRootPart2 = (v48.Character or v48.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
							local leftDetector = parent:WaitForChild("LeftDetector")
							local leftWeld = leftDetector:WaitForChild("LeftWeld")
							local creatureGrab = parent.BlobmanSeatAndOwnerScript:WaitForChild("CreatureGrab")
							local creatureDrop = parent.BlobmanSeatAndOwnerScript:WaitForChild("CreatureDrop")
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local v50 = fn19(humanoidRootPart.CFrame)
							humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, 3)
							task.wait(0.3)

							for i = 1, 6 do
								pcall(function()
									creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
								end)

								task.wait(0.08)
							end

							pcall(function()
								creatureDrop:FireServer(leftWeld, humanoidRootPart2)
							end)

							task.wait(0.15)

							pcall(function()
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
							end)

							pcall(function()
								setNetworkOwner:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
							end)

							local bodyPosition = Instance.new("BodyPosition")
							bodyPosition.Position = Vector3.new(0, 600, 0)
							bodyPosition.MaxForce = Vector3.new(1e9, 1e9, 1e9)
							bodyPosition.D = 200
							bodyPosition.Parent = humanoidRootPart2
							task.wait(0.8)
							wraithServerMove(humanoidRootPart2, CFrame.new(0, -950, 0), Vector3.new(0, -900, 0))

							pcall(function()
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
							end)

							bodyPosition:Destroy()
							humanoidRootPart.CFrame = v50
						else
							fn10("wraith", "kick: sit on a blobman first")
						end
					elseif v49 == "Blob Kill" then
						local v50 = fn25()
						fn10("wraith", "blob kill on " .. tostring(v48.Name))
						wraithBlobKillStart(v48, v50)
					elseif v49 == "Lock" then
						local v50 = fn25()
						local grabEvents2 = ReplicatedStorage_:WaitForChild("GrabEvents")
						local setNetworkOwner = grabEvents2:FindFirstChild("SetNetworkOwner")
						local createGrabLine = grabEvents2:FindFirstChild("CreateGrabLine")
						local destroyGrabLine = grabEvents2:FindFirstChild("DestroyGrabLine")
						fn10("wraith", "lock on " .. v48.Name)
						local v51 = nil

						while true do
							local flag15 = v50.alive and not flag6

							if flag15 then
								flag15 = tick() < (kickEnd or math.huge)
							end

							if flag15 then
								wraithMarkKickBusy(1)
								local v52, v53, v54 = fn11()

								if not v54 then
									task.wait(0.2)
									continue
								else
									local character = v48 and v48.Character
									local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
									local head = character and character:FindFirstChild("Head")
									local humanoid = character and character:FindFirstChildOfClass("Humanoid")

									if character and humanoidRootPart then
										if not (humanoid and humanoid.Health <= 0) then
											if (humanoidRootPart.Position - v54.Position).Magnitude > 30 and humanoidRootPart.Position.Y > -10 then
												fn18(humanoidRootPart.CFrame * CFrame.new(0, 0, 2))
											end

											pcall(function()
												fn30(humanoidRootPart, setNetworkOwner, "lock_own", 0.1)
											end)

											if not v51 or v51.hrp ~= humanoidRootPart then
												if v51 then
													fn29(v51.hrp)
												end

												v51 = fn27(humanoidRootPart, { P = 40000, D = 600, spinHold = true })
											end

											fn28(v51, v54, 18, 1.5)

											pcall(function()
												humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
												humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
											end)

											local part1 = nil

											pcall(function()
												local grabParts = Workspace:FindFirstChild("GrabParts")
												grabParts = grabParts and grabParts:FindFirstChild("GrabPart")
												grabParts = grabParts and grabParts:FindFirstChild("WeldConstraint")
												part1 = grabParts and grabParts.Part1
											end)

											if part1 and part1.Parent and head and not part1:IsDescendantOf(character) then
												local cFrame = head.CFrame * CFrame.new(0, 0, -2.5)

												if setNetworkOwner then
													pcall(function()
														setNetworkOwner:FireServer(part1, cFrame)
													end)
												end

												pcall(function()
													part1.CanCollide = false
													part1.CFrame = cFrame
													part1.AssemblyLinearVelocity = Vector3.zero
													part1.AssemblyAngularVelocity = Vector3.zero
												end)

												if createGrabLine and fn26("lock_line", 0.1) then
													pcall(function()
														createGrabLine:FireServer(part1, Vector3.zero, cFrame.Position, false)
													end)
												end
											end

											RunService.Heartbeat:Wait()
											continue
										end
									end
								end
							end

							break
						end

						if v51 then
							fn29(v51.hrp)
						end

						pcall(function()
							local grabParts = Workspace:FindFirstChild("GrabParts")
							grabParts = grabParts and grabParts:FindFirstChild("GrabPart")
							local weldConstraint = grabParts and grabParts:FindFirstChild("WeldConstraint")
							weldConstraint = weldConstraint and weldConstraint.Part1

							if weldConstraint and destroyGrabLine then
								destroyGrabLine:FireServer(weldConstraint)
							end
						end)

						v50.alive = false
						fn10("wraith", "lock ended")
					elseif v49 == "Input Lag" then
						fn32(v48)
					elseif v49 == "Pallet Ragdoll" then
						if not v48 or not v48.Character then
							return
						end
						local grabEvents2 = ReplicatedStorage_:WaitForChild("GrabEvents")
						local cframe = CFrame.new(0, 800000, 0)
						ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("PalletLightBrown", cframe, Vector3.zero)
						local palletLightBrown

						while true do
							palletLightBrown = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys") and Workspace[localPlayer.Name .. "SpawnedInToys"]:FindFirstChild("PalletLightBrown")
							RunService.Heartbeat:Wait()
							if not (palletLightBrown or not v48) then
								continue
							end
							break
						end

						if not palletLightBrown then
							return
						end
						local soundPart = palletLightBrown:FindFirstChild("SoundPart")
						if not soundPart then
							return
						end
						soundPart.CanCollide = false
						soundPart.Anchored = false

						local function fn56(arg2)
							grabEvents2.SetNetworkOwner:FireServer(arg2, arg2.CFrame)
							grabEvents2.CreateGrabLine:FireServer(arg2, Vector3.zero, arg2.Position, false)
							grabEvents2.DestroyGrabLine:FireServer(arg2)
						end

						fn56(soundPart)

						while true do
							if v48 and v48.Parent and v48.Character then
								for i = 1, 20 do
									RunService.Heartbeat:Wait()
								end

								if not (not v48 or not v48.Parent or not v48.Character) then
									local head = v48.Character:FindFirstChild("Head")

									if head then
										local position = head.Position
										soundPart.CFrame = CFrame.new(position.X, position.Y + 0.2, position.Z)
										soundPart.AssemblyLinearVelocity = Vector3.zero
										soundPart.AssemblyAngularVelocity = Vector3.new(1000, 1000, 1000)
										fn56(soundPart)
										soundPart.CanCollide = true

										for i = 1, 3 do
											RunService.Heartbeat:Wait()
										end

										soundPart.CanCollide = false
										soundPart.CFrame = cframe
										soundPart.AssemblyAngularVelocity = Vector3.zero
									end

									continue
								end
							end

							break
						end

						if palletLightBrown then
							pcall(function()
								ReplicatedStorage_.MenuToys.DestroyToy:FireServer(palletLightBrown)
							end)

							if palletLightBrown.Parent then
								palletLightBrown:Destroy()
							end
						end
					elseif v49 == "Loop Kill" then
						local character = v48.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")
						if not (humanoidRootPart and humanoid and humanoid.Health ~= 0) then
							return
						end
						local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
						if not setNetworkOwner then
							return
						end
						fn10("wraith", "kill on " .. v48.Name)
						local now2 = tick()

						while true do
							pcall(function()
								setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
							end)

							RunService.Heartbeat:Wait()
							if not (wraithPartOwned(humanoidRootPart) or tick() - now2 > 1.5) then
								continue
							end
							break
						end

						pcall(function()
							humanoid.BreakJointsOnDeath = false
							humanoid.Sit = false
							humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						end)

						local cframe = CFrame.new(0, 9e9, 0)

						for i = 1, 25 do
							pcall(function()
								setNetworkOwner:FireServer(humanoidRootPart, cframe)
								humanoidRootPart.CFrame = cframe
								humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 9e9, 0)
							end)

							RunService.Heartbeat:Wait()
						end

						fn10("wraith", "kill done")
					elseif v49 == "Fling Target" then
						local humanoidRootPart = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
						local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
						if not (humanoidRootPart and humanoidRootPart2) then
							return
						end
						wraithFlingBusyUntil = tick() + 9
						local grabEvents2 = ReplicatedStorage_.GrabEvents
						local setNetworkOwner = grabEvents2:FindFirstChild("SetNetworkOwner")
						grabEvents2:FindFirstChild("DestroyGrabLine")
						local createGrabLine = grabEvents2:FindFirstChild("CreateGrabLine")
						local stickyPartEvent = ReplicatedStorage_.PlayerEvents and ReplicatedStorage_.PlayerEvents:FindFirstChild("StickyPartEvent")
						local currentCamera = Workspace.CurrentCamera
						local cFrame = humanoidRootPart2.CFrame
						local n26 = humanoidRootPart.Position - humanoidRootPart2.Position

						if n26.Magnitude < 1 then
							local lookVector = currentCamera and currentCamera.CFrame.LookVector or Vector3.new(1, 0, 0)
							n26 = Vector3.new(lookVector.X, 0, lookVector.Z)

							if n26.Magnitude < 0.1 then
								n26 = Vector3.new(1, 0, 0)
							end
						end

						local unit = Vector3.new(n26.X, 0, n26.Z).Unit
						local flag15 = currentCamera.CameraType == Enum.CameraType.Scriptable
						local cFrame2 = currentCamera.CFrame

						pcall(function()
							currentCamera.CameraType = Enum.CameraType.Scriptable
						end)

						pcall(function()
							currentCamera.CFrame = cFrame2
						end)

						pcall(function()
							fn18(humanoidRootPart.CFrame * CFrame.new(0, 0, 2))
						end)

						local now2 = tick()

						while tick() - now2 < 1.2 do
							if humanoidRootPart and humanoidRootPart.Parent then
								wraithGrabClaim(humanoidRootPart, wraithBlobHand())
								if not wraithPartOwned(humanoidRootPart) then
									task.wait(0.05)
									continue
								end
							end

							break
						end

						for i = 1, 3 do
							if humanoidRootPart and humanoidRootPart.Parent then
								pcall(function()
									if createGrabLine then
										createGrabLine:FireServer(humanoidRootPart, Vector3.zero, humanoidRootPart.Position, false)
									end

									if setNetworkOwner then
										setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
									end

									if not wraithCanMove(humanoidRootPart) then
										return
									end
									local bodyVelocity = Instance.new("BodyVelocity")
									bodyVelocity.Name = "WraithFling"
									bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyVelocity.Velocity = unit * 90000 + Vector3.new(0, 20000, 0)
									bodyVelocity.P = 9e9
									bodyVelocity.Parent = humanoidRootPart
									game:GetService("Debris"):AddItem(bodyVelocity, 0.06)
								end)

								task.wait(0.15)

								pcall(function()
									local ninjaShuriken = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									ninjaShuriken = ninjaShuriken and ninjaShuriken:FindFirstChild("NinjaShuriken") or fn20("NinjaShuriken")
									local stickyPart

									if ninjaShuriken then
										stickyPart = ninjaShuriken:FindFirstChild("StickyPart") or ninjaShuriken:WaitForChild("StickyPart", 2)
									else
										stickyPart = ninjaShuriken
									end

									if stickyPart then
										local now3 = tick()

										while true do
											pcall(function()
												setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
											end)

											task.wait()
											local partOwner = stickyPart:FindFirstChild("PartOwner")

											if partOwner then
												local name = localPlayer.Name
												partOwner = tostring(stickyPart.PartOwner.Value) == name
											end

											if not (partOwner or tick() - now3 > 3) then
												continue
											end
											break
										end

										if stickyPartEvent then
											pcall(function()
												stickyPartEvent:FireServer(stickyPart, humanoidRootPart, CFrame.new(5.3e9, 5.3e9, 5.3e9))
											end)
										end
									end
								end)

								task.wait(0.35)

								pcall(function()
									if humanoidRootPart and humanoidRootPart.Parent then
										if createGrabLine then
											createGrabLine:FireServer(humanoidRootPart, Vector3.zero, humanoidRootPart.Position, false)
										end

										if setNetworkOwner then
											setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
										end

										wraithServerMove(humanoidRootPart, humanoidRootPart.CFrame + unit * 800, Vector3.zero)
									end
								end)

								task.wait(0.3)
								continue
							end

							break
						end

						pcall(function()
							fn18(cFrame)
						end)

						task.wait(0.25)

						pcall(function()
							if not flag15 then
								currentCamera.CameraType = Enum.CameraType.Custom
							end

							currentCamera.CFrame = cFrame2
						end)

						fn10("wraith", "fling target x3 done")
					elseif v49 == "Bypass Kick" then
						fn53(v48, true)
					elseif v49 == "Remove Gucci" then
						if not v48 or v48 == localPlayer then
							return
						end
						local v50, v51, v52 = fn11()
						if not (v52 and v51) then
							return
						end
						local character = v48.Character

						if character then
							character:FindFirstChild("HumanoidRootPart")
						end

						character = character and character:FindFirstChildOfClass("Humanoid")
						if not character then
							fn10("wraith", "remove gucci: no target humanoid")
							return
						end
						local seatPart = character.SeatPart
						local cFrame = v52.CFrame

						local function fn56(arg2)
							if not (arg2 and arg2.Parent) then
								return false
							end
							local v53, v54, v55 = fn11()
							if not (v55 and v54) then
								return false
							end

							pcall(function()
								arg2:SetAttribute("broken", false)
							end)

							local connection2 = RunService.Stepped:Connect(function()
								if v55 and v55.Parent and arg2 and arg2.Parent then
									v55.CFrame = arg2.CFrame
									v55.AssemblyLinearVelocity = Vector3.zero
								end
							end)

							local now2 = tick()

							while tick() - now2 < 1 do
								if v54.SeatPart ~= arg2 then
									pcall(function()
										arg2:Sit(v54)
									end)

									task.wait()
									continue
								end

								break
							end

							pcall(function()
								connection2:Disconnect()
							end)

							if v54.SeatPart == arg2 then
								task.wait(0.25)
								v54.Sit = false
								v54.Jump = true
								task.wait(0.05)
								v55.CFrame = cFrame
								v55.AssemblyLinearVelocity = Vector3.zero
								return true
							end

							v55.CFrame = cFrame
							return false
						end

						local removeGucci

						if seatPart then
							removeGucci = 0

							if fn56(seatPart) then
								removeGucci = 1
							end
						else
							local v53 = Workspace:FindFirstChild(v48.Name .. "SpawnedInToys")
							removeGucci = 0

							if v53 then
								local n26 = 0

								for _, child in ipairs(v53:GetChildren()) do
									if not flag6 then
										local vehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat", true) or child:FindFirstChildWhichIsA("Seat", true)

										if vehicleSeat then
											if fn56(vehicleSeat) then
												n26 += 1
											end

											task.wait(0.2)
										end

										continue
									end

									break
								end

								removeGucci = n26
							end
						end

						fn10("wraith", "remove gucci: " .. removeGucci)
					elseif v49 == "Loop Grab Kick" then
						fn55(v48)
					elseif v49 == "Orbit Blob Kick" then
						local spawnToyRemoteFunction = ReplicatedStorage_:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
						local grabEvents2 = ReplicatedStorage_:WaitForChild("GrabEvents")
						local destroyGrabLine = grabEvents2:FindFirstChild("DestroyGrabLine")
						grabEvents2:FindFirstChild("SetNetworkOwner")
						local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
						local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
						local humanoid = character:WaitForChild("Humanoid")

						local function fn56()
							for _, child in pairs(Workspace:GetChildren()) do
								if child.Name:match("SpawnedInToys") then
									local creatureBlobman = child:FindFirstChild("CreatureBlobman")
									if creatureBlobman and creatureBlobman:FindFirstChild("VehicleSeat") then
										return creatureBlobman
									end
								end
							end

							return nil
						end

						local function fn57()
							for _, child in pairs(Workspace:GetChildren()) do
								if child.Name:match("SpawnedInToys") then
									for _, child2 in pairs(child:GetChildren()) do
										if child2.Name == "CreatureBlobman" then
											pcall(function()
												child2:Destroy()
											end)
										end
									end
								end
							end
						end

						local function fn58(arg2)
							fn10("Orbit Kick", arg2)
						end

						fn57()
						task.wait(0.2)

						pcall(function()
							spawnToyRemoteFunction:InvokeServer("CreatureBlobman", CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, 0)), Vector3.new(0, 59.667, 0))
						end)

						local v50 = nil

						for i = 1, 30 do
							task.wait(0.1)
							v50 = fn56()
							if not v50 then
								continue
							end
							break
						end

						if not v50 then
							fn58("failed to spawn Blobman")
							return
						end
						local vehicleSeat = v50:FindFirstChild("VehicleSeat")
						if not vehicleSeat then
							fn58("Blobman has no seat")
							return
						end
						humanoid.Sit = false
						humanoidRootPart.CFrame = vehicleSeat.CFrame + Vector3.new(0, 2, 0)
						task.wait(0.05)
						vehicleSeat:Sit(humanoid)
						task.wait(0.15)
						local blobmanSeatAndOwnerScript = v50:FindFirstChild("BlobmanSeatAndOwnerScript")
						local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
						local leftDetector = v50:FindFirstChild("LeftDetector")
						local rightDetector = v50:FindFirstChild("RightDetector")
						local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
						local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
						if not (creatureGrab and creatureDrop and leftDetector and rightDetector and leftWeld and rightWeld) then
							fn58("no grab/drop remotes found")
							return
						end
						local humanoidRootPart2 = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart2 then
							fn58("target has no character")
							return
						end
						local humanoidRootPart3 = v50:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart3 then
							fn58("Blobman has no root part")
							return
						end

						pcall(function()
							humanoidRootPart3.CFrame = CFrame.new(humanoidRootPart2.Position + Vector3.new(0, 3, 0))
						end)

						task.wait(0.05)

						for i = 1, 10 do
							pcall(function()
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
								creatureGrab:FireServer(rightDetector, humanoidRootPart2, rightWeld)
							end)

							task.wait(0.005)
						end

						local vector = Vector3.new(0, 10, 0)
						local now2 = tick()
						wraithGrabClaim(humanoidRootPart2, nil)
						wraithServerMove(humanoidRootPart2, CFrame.new(Vector3.new(0, 10, 0)), Vector3.zero)
						local n26 = 0

						while tick() < math.huge and humanoidRootPart2 and humanoidRootPart2.Parent do
							if humanoid.SeatPart ~= vehicleSeat then
								humanoid.Sit = false

								pcall(function()
									humanoidRootPart.CFrame = vehicleSeat.CFrame + Vector3.new(0, 2, 0)
								end)

								task.wait(0.02)

								pcall(function()
									vehicleSeat:Sit(humanoid)
								end)
							end

							local now3 = tick()
							n26 += 9.5 * math.min(now3 - now2, 0.033)
							local vector2 = Vector3.new(math.cos(n26) * 25, 10, math.sin(n26) * 25)
							local vector3 = Vector3.new(vector.X - vector2.X, 0, vector.Z - vector2.Z)

							if vector3.Magnitude > 0 then
								vector3 = vector3.Unit
							end

							pcall(function()
								humanoidRootPart3.CFrame = CFrame.lookAt(vector2, vector2 + vector3)
							end)

							if (humanoidRootPart2.Position - Vector3.new(0, 10, 0)).Magnitude > 8 then
								wraithServerMove(humanoidRootPart2, CFrame.new(Vector3.new(0, 10, 0)), Vector3.zero)
							end

							pcall(function()
								creatureGrab:FireServer(leftDetector, humanoidRootPart2, leftWeld)
								creatureGrab:FireServer(rightDetector, humanoidRootPart2, rightWeld)
								creatureDrop:FireServer(leftWeld, humanoidRootPart2)
								creatureDrop:FireServer(rightWeld, humanoidRootPart2)

								if destroyGrabLine then
									destroyGrabLine:FireServer(humanoidRootPart2)
								end
							end)

							task.wait(0.016)
							now2 = now3
						end

						if humanoidRootPart2 and humanoidRootPart2.Parent then
							for i = 1, 50 do
								if destroyGrabLine then
									pcall(function()
										destroyGrabLine:FireServer(humanoidRootPart2)
									end)
								end

								pcall(function()
									humanoidRootPart2.Velocity = Vector3.new(99999, 99999, 99999)
								end)

								task.wait(0.0001)
							end
						end

						fn57()

						pcall(function()
							humanoid.Sit = false
						end)
					end
				end
			end

			do
				local flag13 = false
				local thread2 = nil

				v26:AddLabel("Remove Anti Kick"):AddToggle({
					Default = false,
					Flag = "RemoveAntiKick",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", "Remove Anti Kick: " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread2 then
							pcall(function()
								task.cancel(thread2)
							end)

							thread2 = nil
						end

						if not arg then
							return
						end

						thread2 = task.spawn(function()
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local destroyToy = ReplicatedStorage_.MenuToys:FindFirstChild("DestroyToy")

							while flag13 do
								pcall(function()
									local v48 = fn15()
									if not v48 or v48 == localPlayer then
										return
									end
									local v49 = Workspace:FindFirstChild(v48.Name .. "SpawnedInToys")
									if not v49 then
										return
									end

									for _, child in ipairs(v49:GetChildren()) do
										if flag13 then
											local str6 = tostring(child.Name)

											if str6:find("Shuriken") or str6:find("Kunai") or str6:find("Plate") or str6:find("Pickaxe") or str6:find("Pallet") then
												local stickyPart = child:FindFirstChild("StickyPart") or child:FindFirstChild("SoundPart") or child:FindFirstChildWhichIsA("BasePart")

												if stickyPart and setNetworkOwner then
													local now2 = tick()

													while true do
														pcall(function()
															setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
														end)

														RunService.Heartbeat:Wait()
														local partOwner = stickyPart:FindFirstChild("PartOwner")
														local flag14

														if partOwner then
															local name = localPlayer.Name
															flag14 = tostring(stickyPart.PartOwner.Value) == name
														else
															flag14 = partOwner
														end

														flag14 = flag14 or tick() - now2 > 0.5
														if not flag14 then
															continue
														end
														break
													end
												end

												for _, descendant in ipairs(child:GetDescendants()) do
													if descendant:IsA("BasePart") then
														pcall(function()
															descendant.CanCollide = false
															descendant.CanTouch = false
															descendant.CFrame = CFrame.new(0, -4000, 0)
															descendant.AssemblyLinearVelocity = Vector3.new(0, -3000, 0)
														end)
													end
												end

												if destroyToy then
													pcall(function()
														destroyToy:FireServer(child)
													end)
												end

												RunService.Heartbeat:Wait()
											end

											continue
										end

										break
									end
								end)

								task.wait(0.8)
							end
						end)
					end,
				})
			end

			do
				local tbl10 = { friends = {}, busy = {} }

				local function fn52(arg)
					if fn24(arg) then
						return true
					end
					local flag13 = tbl10.friends[arg.UserId]

					if flag13 == nil then
						flag13 = false

						pcall(function()
							flag13 = localPlayer:IsFriendsWith(arg.UserId)
						end)

						tbl10.friends[arg.UserId] = flag13
					end

					return flag13
				end

				local function fn53()
					local grabEvents2 = ReplicatedStorage_:FindFirstChild("GrabEvents")

					return {
						SetNet = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner"),
						CreateLine = grabEvents2 and grabEvents2:FindFirstChild("CreateGrabLine"),
						DestroyLine = grabEvents2 and grabEvents2:FindFirstChild("DestroyGrabLine"),
					}
				end

				local function fn54()
					local v48, v49, v50 = fn11()
					local seatPart = v49 and v49.SeatPart
					seatPart = seatPart and seatPart.Parent
					if not (v48 and v50 and seatPart) then
						return nil
					end
					local blobmanSeatAndOwnerScript = seatPart:FindFirstChild("BlobmanSeatAndOwnerScript")
					local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
					blobmanSeatAndOwnerScript = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
					local leftDetector = seatPart:FindFirstChild("LeftDetector")
					local rightDetector = seatPart:FindFirstChild("RightDetector")
					local leftWeld = leftDetector and (leftDetector:FindFirstChild("LeftWeld") or leftDetector:FindFirstChildWhichIsA("Weld"))
					local rightWeld = rightDetector and (rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChildWhichIsA("Weld"))
					if not (creatureGrab and creatureDrop and leftDetector and rightDetector and leftWeld and rightWeld) then
						return nil
					end

					return {
						blob = seatPart,
						root = v50,
						hum = v49,
						grab = creatureGrab,
						drop = creatureDrop,
						release = blobmanSeatAndOwnerScript,
						left = { det = leftDetector, weld = leftWeld },
						right = { det = rightDetector, weld = rightWeld },
					}
				end

				local function fn55(arg, arg2)
					local v48, v49, v50 = fn11()
					if not v50 then
						return {}
					end
					local tbl11 = {}

					for _, player in ipairs(Players:GetPlayers()) do
						local flag13 = player ~= localPlayer

						if flag13 then
							flag13 = not (arg2 and fn52(player))
						end

						if flag13 then
							local character = player.Character
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
							local head = character and character:FindFirstChild("Head")
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")

							if humanoidRootPart and head and humanoid and humanoid.Health > 0 then
								local magnitude = (humanoidRootPart.Position - v50.Position).Magnitude

								if magnitude <= arg then
									table.insert(tbl11, { plr = player, char = character, hrp = humanoidRootPart, head = head, hum = humanoid, dist = magnitude })
								end
							end
						end
					end

					table.sort(tbl11, function(arg3, arg4)
						return arg3.dist < arg4.dist
					end)

					return tbl11
				end

				local function fn56(arg, arg2, arg3, arg4)
					if tbl10.busy[arg.plr] then
						return
					end
					tbl10.busy[arg.plr] = true

					task.spawn(function()
						pcall(function()
							if not (arg3.grab and arg3.drop and arg.hrp and arg.hrp.Parent) then
								return
							end
							local v48 = arg4
							local setNet

							if arg4 then
								setNet = arg4.SetNet
							else
								setNet = v48
							end

							local tbl11 = {}

							if arg2 then
								tbl11[1] = arg2
							else
								if arg3.left then
									tbl11[#tbl11 + 1] = arg3.left
								end

								if arg3.right then
									tbl11[#tbl11 + 1] = arg3.right
								end
							end

							if #tbl11 == 0 then
								return
							end
							local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
							local n26 = humanoidRootPart and humanoidRootPart.CFrame * CFrame.new(6, 8, -4)
							local position = n26 and n26.Position or arg.hrp.Position + Vector3.new(0, 8, 0)

							for i = 1, 4 do
								if not (arg.hrp and arg.hrp.Parent) then
									return
								end

								for _, v49 in ipairs(tbl11) do
									arg3.grab:FireServer(v49.det, arg.hrp, v49.weld)
								end

								task.wait(0.05)
							end

							for _, v49 in ipairs(tbl11) do
								arg3.drop:FireServer(v49.weld, arg.hrp)
							end

							task.wait(0.1)
							if not (arg.hrp and arg.hrp.Parent) then
								return
							end

							for _, v49 in ipairs(tbl11) do
								arg3.grab:FireServer(v49.det, arg.hrp, v49.weld)
							end

							if setNet then
								setNet:FireServer(arg.hrp, arg.hrp.CFrame)
							end

							local bodyPosition = Instance.new("BodyPosition")
							bodyPosition.Position = position
							bodyPosition.MaxForce = Vector3.new(9e9, 9e9, 9e9)
							bodyPosition.P = 40000
							bodyPosition.D = 300
							bodyPosition.Parent = arg.hrp
							local now2 = tick()

							while tick() - now2 < 0.8 do
								if arg.hrp and arg.hrp.Parent then
									bodyPosition.Position = position

									if setNet then
										pcall(function()
											setNet:FireServer(arg.hrp, CFrame.new(position))
										end)
									end

									RunService.Heartbeat:Wait()
									continue
								end

								break
							end

							pcall(function()
								bodyPosition:Destroy()
							end)

							if arg.hrp and arg.hrp.Parent then
								local position2 = arg.hrp.Position

								for i = 1, 26 do
									if arg.hrp and arg.hrp.Parent then
										local z = position2.Z
										local cframe = CFrame.new(position2.X + math.random(-45, 45), position2.Y + math.random(10, 70), z + math.random(-45, 45))

										pcall(function()
											if setNet then
												setNet:FireServer(arg.hrp, cframe)
											end

											arg.hrp.CFrame = cframe
											arg.hrp.AssemblyLinearVelocity = Vector3.zero
											arg.hrp.AssemblyAngularVelocity = Vector3.zero
										end)

										for _, v49 in ipairs(tbl11) do
											pcall(function()
												arg3.grab:FireServer(v49.det, arg.hrp, v49.weld)
											end)
										end

										if i % 4 == 0 then
											for _, v49 in ipairs(tbl11) do
												pcall(function()
													arg3.drop:FireServer(v49.weld, arg.hrp)
												end)
											end
										end

										RunService.Heartbeat:Wait()
										continue
									end

									break
								end

								pcall(function()
									if setNet then
										setNet:FireServer(arg.hrp, CFrame.new(position))
									end

									arg.hrp.CFrame = CFrame.new(position)
									arg.hrp.AssemblyLinearVelocity = Vector3.zero
								end)
							end
						end)

						tbl10.busy[arg.plr] = nil
					end)
				end

				local function fn57(arg)
					local n26 = 0
					local n27 = 0

					return function()
						if not arg.active() then
							return
						end
						local now2 = tick()
						if now2 - n26 < 0.15 then
							return
						end
						n26 = now2
						local v48 = fn54()
						if not v48 then
							return
						end
						local v49 = fn53()
						local whitelist = arg.whitelist
						local v50 = fn55(arg.radius(), whitelist())
						n27 += 1

						for _, v51 in ipairs(v50) do
							if arg.hands == 2 then
								fn56(v51, nil, v48, v49)
							else
								fn56(v51, v48.right or v48.left, v48, v49)
							end
						end
					end
				end

				local flag13 = false
				local n26 = 20
				local flag14 = true
				local connection2 = nil

				v27:AddLabel("Dual Kick Aura Radius"):AddSlider({
					Min = 5,
					Max = 50,
					Default = 20,
					Rounding = 0,
					Flag = "DualAuraRadius",
					Callback = function(arg)
						n26 = arg
					end,
				})

				v27:AddLabel("Whitelist Friends: Dual Aura"):AddToggle({
					Default = true,
					Flag = "DualAuraWhitelist",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("DualAuraWhitelist") or "DualAuraWhitelist") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg
					end,
				})

				local v48 = fn57({
					hands = 2,
					active = function()
						return flag13
					end,
					radius = function()
						return n26
					end,
					whitelist = function()
						return flag14
					end,
				})

				v27:AddLabel("Dual Hand Kick Aura"):AddToggle({
					Default = false,
					Flag = "DualHandKickAura",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("DualHandKickAura") or "DualHandKickAura") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if not arg then
							return
						end

						if not fn54() then
							fn10("wraith", "dual hand aura: sit on a CreatureBlobman first")
						end

						connection2 = RunService.Heartbeat:Connect(v48)
					end,
				})

				local flag15 = false
				local n27 = 20
				local flag16 = true
				local connection3 = nil

				v27:AddLabel("Kick Aura 1H Radius"):AddSlider({
					Min = 5,
					Max = 50,
					Default = 20,
					Rounding = 0,
					Flag = "KickAura1Radius",
					Callback = function(arg)
						n27 = arg
					end,
				})

				v27:AddLabel("Whitelist Friends: Aura 1H"):AddToggle({
					Default = true,
					Flag = "KickAura1Whitelist",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("KickAura1Whitelist") or "KickAura1Whitelist") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag16 = arg
					end,
				})

				local v49 = fn57({
					hands = 1,
					active = function()
						return flag15
					end,
					radius = function()
						return n27
					end,
					whitelist = function()
						return flag16
					end,
				})

				v27:AddLabel("Kick Aura 1 Hand"):AddToggle({
					Default = false,
					Flag = "KickAura1Hand",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("KickAura1Hand") or "KickAura1Hand") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg

						if connection3 then
							connection3:Disconnect()
							connection3 = nil
						end

						if not arg then
							return
						end

						if not fn54() then
							fn10("wraith", "1 hand aura: sit on a CreatureBlobman first")
						end

						connection3 = RunService.Heartbeat:Connect(v49)
					end,
				})
			end

			do
				local tbl10 = {}
				local cframe = CFrame.new(4.12, -12.45, 15.3)
				local cframe2 = CFrame.new(-10.54, 8.21, -3.44)
				local cframe3 = CFrame.new(18.22, 0.15, -10.87)
				local cframe4 = CFrame.new(-5.3, -18.9, 2.11)
				local cframe5 = CFrame.new(0.45, 14.56, 12)
				local cframe6 = CFrame.new(12.78, -9.33, -14.2)
				local cframe7 = CFrame.new(-15.6, -2.1, 10.45)
				local cframe8 = CFrame.new(2.11, 20.34, -5.67)
				local cframe9 = CFrame.new(-12, 10, 15.12)
				local cframe10 = CFrame.new(15.4, 12.3, 0.45)
				local cframe11 = CFrame.new(-8.2, -10.45, -18.3)
				local cframe12 = CFrame.new(5.67, -2.5, 22.1)
				local cframe13 = CFrame.new(-20.1, 5.4, -8.9)
				local cframe14 = CFrame.new(10.12, 18.22, 5.3)
				local cframe15 = CFrame.new(-3.45, -15.12, -12)
				local cframe16 = CFrame.new(22.3, -5.67, 4.12)
				local cframe17 = CFrame.new(-14.2, 16.1, -2.11)
				local cframe18 = CFrame.new(7.89, -20.45, 0.15)
				local cframe19 = CFrame.new(0.15, 6.78, -20.1)
				local cframe20 = CFrame.new
				tbl10[1] = cframe
				tbl10[2] = cframe2
				tbl10[3] = cframe3
				tbl10[4] = cframe4
				tbl10[5] = cframe5
				tbl10[6] = cframe6
				tbl10[7] = cframe7
				tbl10[8] = cframe8
				tbl10[9] = cframe9
				tbl10[10] = cframe10
				tbl10[11] = cframe11
				tbl10[12] = cframe12
				tbl10[13] = cframe13
				tbl10[14] = cframe14
				tbl10[15] = cframe15
				tbl10[16] = cframe16
				tbl10[17] = cframe17
				tbl10[18] = cframe18
				tbl10[19] = cframe19

				do
					local values = table.pack(cframe20(-18.3, -8.2, 5.67))
					table.move(values, 1, values.n, 20, tbl10)
				end
			end

			do
				local flag13 = false
				local thread2 = nil

				v28:AddLabel("L"):AddToggle({
					Flag = "WR41",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR41") or "WR41") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if thread2 then
							pcall(task.cancel, thread2)
							thread2 = nil
						end

						if not arg then
							return
						end

						thread2 = task.spawn(function()
							while flag13 do
								local v48 = fn15() or fn13()

								if not v48 or not v48.Parent or not v48.Character then
									task.wait(0.5)
								else
									local humanoidRootPart = v48.Character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart then
										pcall(function()
											local character = localPlayer.Character
											character = character and character:FindFirstChild("HumanoidRootPart")
											if not character then
												return
											end
											local tetracubeJ = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
											tetracubeJ = tetracubeJ and tetracubeJ:FindFirstChild("TetracubeJ")

											if not tetracubeJ then
												ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("TetracubeJ", character.CFrame * CFrame.new(0, 5, 5), Vector3.zero)
												local v49 = Workspace:WaitForChild(localPlayer.Name .. "SpawnedInToys", 5)
												tetracubeJ = v49 and v49:WaitForChild("TetracubeJ", 3)
											end

											if not tetracubeJ then
												return
											end
											local soundPart = tetracubeJ:FindFirstChild("SoundPart") or tetracubeJ.PrimaryPart or tetracubeJ:FindFirstChildWhichIsA("BasePart")
											if not soundPart then
												return
											end

											for _, descendant in pairs(tetracubeJ:GetDescendants()) do
												if descendant:IsA("BasePart") then
													descendant.CanCollide = false

													pcall(function()
														descendant.Massless = true
													end)
												end
											end

											local setNetworkOwner = ReplicatedStorage_:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

											for _, descendant in pairs(tetracubeJ:GetDescendants()) do
												if descendant:IsA("BasePart") then
													setNetworkOwner:FireServer(descendant, descendant.CFrame)
												end
											end

											soundPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 3, -2)
											soundPart.AssemblyLinearVelocity = Vector3.zero
											soundPart.AssemblyAngularVelocity = Vector3.zero
										end)
									end

									task.wait(0.05)
								end
							end
						end)
					end,
				})
			end

			do
				local flag13 = false
				local tbl10 = {}

				v28:AddLabel("Target Join/Leave Notify"):AddToggle({
					Default = false,
					Flag = "TargetNotify",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TargetNotify") or "TargetNotify") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						for _, v48 in pairs(tbl10) do
							pcall(function()
								v48:Disconnect()
							end)
						end

						tbl10 = {}
						if not arg then
							return
						end

						if targetName == "" then
							fn10("Target Notify", "select a target first")
							return
						end

						tbl10.removing = Players.PlayerRemoving:Connect(function(player)
							if flag13 and player.Name == targetName then
								fn10("Target Notify", player.Name .. " left the server")
							end
						end)

						tbl10.added = Players.PlayerAdded:Connect(function(player)
							if flag13 and player.Name == targetName then
								fn10("Target Notify", player.Name .. " joined the server")
							end
						end)
					end,
				})
			end

			Players.PlayerAdded:Connect(function(player)
				task.delay(1, function()
					if targetName and targetName ~= "" and player.Name == targetName then
						fn10("wraith", "target rejoin: " .. player.Name .. " (" .. tostring(player.UserId) .. ") is back on the server")
					end
				end)
			end)

			do
				local flag13 = false
				local tbl10 = {}
				local tbl11 = { "partesp", "playercharacterlocationdetector" }
				local color = Color3.fromRGB(255, 255, 255)

				local function fn52(arg)
					if not arg:IsA("BasePart") then
						return false
					end

					for _, v48 in pairs(tbl11) do
						if string.lower(arg.Name) == string.lower(v48) then
							return true
						end
					end

					return false
				end

				bhNearHiddenSpot = function(arg)
					if not blackholeHideNear then
						return false
					end
					return arg.Magnitude < 25
				end

				local function fn53(adornee)
					if tbl10[adornee] then
						return
					end

					if adornee:IsA("BasePart") and bhNearHiddenSpot(adornee.Position) then
						return
					end
					local boxHandleAdornment = Instance.new("BoxHandleAdornment")
					boxHandleAdornment.Adornee = adornee
					boxHandleAdornment.AlwaysOnTop = true
					boxHandleAdornment.ZIndex = 5
					boxHandleAdornment.Color3 = color
					boxHandleAdornment.Transparency = 0.5
					boxHandleAdornment.Size = adornee.Size
					boxHandleAdornment.Parent = CoreGui
					tbl10[adornee] = boxHandleAdornment

					adornee.AncestryChanged:Connect(function(child, parent)
						if not parent and tbl10[adornee] then
							tbl10[adornee]:Destroy()
							tbl10[adornee] = nil
						end
					end)
				end

				local function fn54()
					for _, v48 in pairs(tbl10) do
						if v48 then
							v48:Destroy()
						end
					end

					tbl10 = {}
				end

				local function fn55()
					for _, descendant in pairs(Workspace:GetDescendants()) do
						if flag13 and fn52(descendant) then
							fn53(descendant)
						end
					end
				end

				wraithEvery("pcldRestore", 1.5, function()
					if flag13 then
						pcall(function()
							for k, v48 in pairs(tbl10) do
								if k and k.Parent and k:IsA("BasePart") then
									local v49 = bhNearHiddenSpot(k.Position)

									if v48 then
										v48.Visible = not v49
									end
								end
							end

							for _, descendant in pairs(Workspace:GetDescendants()) do
								if fn52(descendant) and not tbl10[descendant] and descendant:IsA("BasePart") and not bhNearHiddenSpot(descendant.Position) then
									fn53(descendant)
								end
							end
						end)
					end
				end)

				local v48 = v40:AddLabel("PCLD ESP")

				v48:AddToggle({
					Default = false,
					Flag = "PCLD",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("PCLD") or "PCLD") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if arg then
							fn55()

							Workspace.DescendantAdded:Connect(function(descendant)
								if flag13 and fn52(descendant) then
									fn53(descendant)
								end
							end)
						else
							fn54()
						end
					end,
				})

				v48:AddColorPicker({
					Flag = "WR42",
					Default = color,
					Callback = function(arg)
						color = arg

						for _, v49 in pairs(tbl10) do
							if v49 then
								v49.Color3 = color
							end
						end
					end,
				})
			end

			do
				local flag13 = false
				local color = Color3.fromRGB(210, 180, 255)
				local transparency = 0.65
				local lineThickness = 0.03
				local n26 = 1.5
				local n27 = 700
				local tbl10 = {}
				local tbl11 = { partesp = true, playercharacterlocationdetector = true }

				local function fn52(arg)
					return arg:IsA("BasePart") and tbl11[string.lower(arg.Name)] == true
				end

				local tbl12 = {}

				local function fn53(arg)
					local v48 = tbl10[arg]

					if v48 then
						pcall(function()
							v48:Destroy()
						end)

						tbl10[arg] = nil
					end

					local v49 = tbl12[arg]

					if v49 then
						pcall(function()
							v49:Destroy()
						end)

						tbl12[arg] = nil
					end
				end

				local function fn54(arg)
					if tbl10[arg] then
						return
					end
					local part2 = Instance.new("Part")
					part2.Name = "WraithPCLDGhost"
					part2.Anchored = true
					part2.CanCollide = false
					part2.CanTouch = false
					part2.CanQuery = false
					part2.Transparency = 1
					part2.Size = arg.Size
					part2.CFrame = arg.CFrame
					part2.Parent = Workspace
					local selectionBox = Instance.new("SelectionBox")
					selectionBox.Adornee = part2
					selectionBox.Color3 = color
					selectionBox.Transparency = transparency
					selectionBox.LineThickness = lineThickness
					selectionBox.Parent = CoreGui
					tbl10[arg] = selectionBox
					tbl12[arg] = part2

					arg.AncestryChanged:Connect(function(child, parent)
						if not parent and tbl10[arg] then
							fn53(arg)
						end
					end)
				end

				pcldAlpha = 0.12

				local function fn55(arg)
					local currentCamera = Workspace.CurrentCamera
					if not currentCamera then
						return
					end
					pcldAlpha = 1 - math.exp(-18 * math.clamp(arg or 0.016, 0.001, 0.1))
					local position = currentCamera.CFrame.Position

					for k, v48 in pairs(tbl10) do
						if k and k.Parent then
							local v49 = tbl12[k]

							if v49 then
								v49.CFrame = v49.CFrame:Lerp(k.CFrame, pcldAlpha)
								v49.Size = k.Size
							end

							local magnitude = (k.Position - position).Magnitude
							v48.Visible = magnitude > n26 and magnitude < n27
							v48.Color3 = color
							v48.Transparency = transparency
							v48.LineThickness = lineThickness
						else
							fn53(k)
						end
					end
				end

				local connection2 = nil
				local connection3 = nil
				local v48 = v40:AddLabel("PCLD ESP Soft")

				v48:AddToggle({
					Flag = "WR43",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR43") or "WR43") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if connection3 then
							connection3:Disconnect()
							connection3 = nil
						end

						if not arg then
							for k in pairs(tbl10) do
								fn53(k)
							end

							tbl10 = {}

							for _, v49 in pairs(tbl12) do
								pcall(function()
									v49:Destroy()
								end)
							end

							tbl12 = {}

							for _, child in ipairs(Workspace:GetChildren()) do
								if child.Name == "WraithPCLDGhost" then
									pcall(function()
										child:Destroy()
									end)
								end
							end

							for _, child in ipairs(CoreGui:GetChildren()) do
								if child:IsA("SelectionBox") and child.Adornee == nil then
									pcall(function()
										child:Destroy()
									end)
								end
							end

							return
						end

						for _, descendant in ipairs(Workspace:GetDescendants()) do
							if fn52(descendant) then
								fn54(descendant)
							end
						end

						connection2 = Workspace.DescendantAdded:Connect(function(descendant)
							if flag13 and fn52(descendant) then
								task.defer(fn54, descendant)
							end
						end)

						connection3 = RunService.RenderStepped:Connect(function(deltaTime)
							fn55(deltaTime)
						end)
					end,
				})

				v48:AddColorPicker({
					Flag = "WR44",
					Default = color,
					Callback = function(arg)
						color = arg
					end,
				})

				v40:AddLabel("PCLD Transparency"):AddSlider({
					Flag = "WR45",
					Min = 0,
					Max = 100,
					Default = 65,
					Rounding = 0,
					Type = "%",
					Callback = function(arg)
						transparency = arg / 100
					end,
				})

				v40:AddLabel("PCLD Thickness"):AddSlider({
					Flag = "WR46",
					Min = 1,
					Max = 10,
					Default = 3,
					Rounding = 0,
					Callback = function(arg)
						lineThickness = arg / 100
					end,
				})

				v40:AddLabel("PCLD Max Distance"):AddSlider({
					Flag = "WR47",
					Min = 50,
					Max = 1000,
					Default = 700,
					Rounding = 0,
					Type = "st",
					Callback = function(arg)
						n27 = arg
					end,
				})
			end

			do
				local flag13 = false
				local flag14 = false
				local color = Color3.fromRGB(255, 255, 255)
				local n26 = 1
				local screenGui = Instance.new("ScreenGui")
				screenGui.Name = "WraithBoxSkeletonESP"
				screenGui.IgnoreGuiInset = true
				screenGui.ResetOnSpawn = false
				screenGui.DisplayOrder = 999994
				screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
				local tbl10 = {}

				local tbl11 = {
					{ "Head", "UpperTorso" },
					{ "UpperTorso", "LowerTorso" },
					{ "UpperTorso", "LeftUpperArm" },
					{ "LeftUpperArm", "LeftLowerArm" },
					{ "LeftLowerArm", "LeftHand" },
					{ "UpperTorso", "RightUpperArm" },
					{ "RightUpperArm", "RightLowerArm" },
					{ "RightLowerArm", "RightHand" },
					{ "LowerTorso", "LeftUpperLeg" },
					{ "LeftUpperLeg", "LeftLowerLeg" },
					{ "LeftLowerLeg", "LeftFoot" },
					{ "LowerTorso", "RightUpperLeg" },
					{ "RightUpperLeg", "RightLowerLeg" },
					{ "RightLowerLeg", "RightFoot" },
				}

				local tbl12 = {
					{ "Head", "Torso" },
					{ "Torso", "Left Arm" },
					{ "Torso", "Right Arm" },
					{ "Torso", "Left Leg" },
					{ "Torso", "Right Leg" },
				}

				local function createFrame(arg)
					local frame2 = Instance.new("Frame", arg)
					frame2.AnchorPoint = Vector2.new(0.5, 0.5)
					frame2.BackgroundColor3 = color
					frame2.BorderSizePixel = 0
					frame2.Visible = false
					return frame2
				end

				local function fn52(arg)
					local v48 = tbl10[arg]
					if v48 then
						return v48
					end
					local folder2 = Instance.new("Folder", screenGui)
					folder2.Name = arg.Name
					local tbl13 = {}

					for i = 1, 24 do
						tbl13[i] = createFrame(folder2)
					end

					local tbl14 = { folder = folder2, lines = tbl13 }
					tbl10[arg] = tbl14
					return tbl14
				end

				local function fn53(arg)
					if arg then
						for _, line in pairs(arg.lines) do
							line.Visible = false
						end
					end
				end

				local function fn54(arg, arg2, arg3, arg4)
					local n27 = arg3.X - arg2.X
					local n28 = arg3.Y - arg2.Y
					arg.Size = UDim2.fromOffset(math.sqrt(n27 * n27 + n28 * n28), math.max(1, arg4 or n26))
					arg.Position = UDim2.fromOffset((arg2.X + arg3.X) / 2, (arg2.Y + arg3.Y) / 2)
					arg.Rotation = math.deg(math.atan2(n28, n27))
					arg.BackgroundColor3 = color
					arg.Visible = true
				end

				local function fn55(arg, arg2)
					local v48, v49 = arg:WorldToViewportPoint(arg2)
					if v49 and v48.Z > 0 then
						local z = v48.Z
						return Vector2.new(v48.X, v48.Y), z
					end
				end

				RunService.RenderStepped:Connect(function()
					if not flag13 and not flag14 then
						for _, v48 in pairs(tbl10) do
							fn53(v48)
						end

						return
					end

					local currentCamera = Workspace.CurrentCamera
					if not currentCamera then
						return
					end

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer then
							local v48 = fn52(player)
							local character = player.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

							if not character or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
								fn53(v48)
							else
								local n27 = 1

								if flag13 then
									local ok, result, result2 = pcall(function()
										return character:GetBoundingBox()
									end)

									if ok and result and result2 then
										local n28 = result2.X / 2
										local n29 = result2.Y / 2
										local n30 = result2.Z / 2
										local flag15 = false
										local x = nil
										local x2 = nil
										local y = nil
										local y2 = nil

										for _, v49 in ipairs({ -1, 1 }) do
											for _, v50 in ipairs({ -1, 1 }) do
												for _, v51 in ipairs({ -1, 1 }) do
													local v52 = fn55(currentCamera, (result * CFrame.new(v49 * n28, v50 * n29, v51 * n30)).Position)

													if v52 then
														if not flag15 then
															x = v52.X
															x2 = v52.X
															y = v52.Y
															y2 = v52.Y
															flag15 = true
														else
															if v52.X < x then
																x = v52.X
															end

															if x2 < v52.X then
																x2 = v52.X
															end

															if v52.Y < y then
																y = v52.Y
															end

															if v52.Y > y2 then
																y2 = v52.Y
															end
														end
													end
												end
											end
										end

										if flag15 then
											local vector2 = Vector2.new(x, y)
											local vector22 = Vector2.new(x2, y)
											local vector23 = Vector2.new(x2, y2)
											local vector24 = Vector2.new(x, y2)
											fn54(v48.lines[1], vector2, vector22, n26)
											fn54(v48.lines[2], vector22, vector23, n26)
											fn54(v48.lines[3], vector23, vector24, n26)
											fn54(v48.lines[4], vector24, vector2, n26)
											n27 = 5
										end
									end
								end

								if flag14 then
									local tbl13 = {}

									for _, child in pairs(character:GetChildren()) do
										if child:IsA("BasePart") then
											local v49 = fn55(currentCamera, child.Position)

											if v49 then
												tbl13[child.Name] = v49
											end
										end
									end

									local upperTorso = tbl13.UpperTorso and tbl11 or tbl12

									for _, v49 in pairs(upperTorso) do
										local v50 = tbl13[v49[1]]
										local v51 = tbl13[v49[2]]

										if v50 and v51 then
											fn54(v48.lines[n27], v50, v51, n26)
											n27 += 1
										end
									end
								end

								for i = n27, #v48.lines do
									v48.lines[i].Visible = false
								end
							end
						end
					end
				end)

				Players.PlayerRemoving:Connect(function(player)
					if tbl10[player] then
						tbl10[player].folder:Destroy()
						tbl10[player] = nil
					end
				end)

				v42:AddLabel("Box ESP"):AddToggle({
					Default = false,
					Flag = "BoxESP",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("BoxESP") or "BoxESP") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if not arg then
							for _, v48 in pairs(tbl10) do
								fn53(v48)
							end
						end
					end,
				})

				v42:AddLabel("Skeleton ESP"):AddToggle({
					Default = false,
					Flag = "SkeletonESP",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("SkeletonESP") or "SkeletonESP") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg

						if not arg then
							for _, v48 in pairs(tbl10) do
								fn53(v48)
							end
						end
					end,
				})

				v42:AddLabel("Color"):AddColorPicker({
					Default = color,
					Callback = function(arg)
						color = arg
					end,
				})

				v42:AddLabel("Thickness"):AddSlider({
					Min = 1,
					Max = 4,
					Default = 1,
					Rounding = 0,
					Flag = "ESPThickness",
					Callback = function(arg)
						n26 = arg
					end,
				})
			end

			do
				local flag13 = false
				local color = Color3.fromRGB(168, 85, 247)
				local flag14 = false
				local flag15 = false
				local image = "rbxassetid://124302285576089"
				local billboardGui = nil
				traceHitmarkerSize = 42
				local v48 = nil
				local v49 = nil
				local v50 = nil
				local v51 = nil
				local connection2 = nil

				local function fn52()
					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					if billboardGui then
						pcall(function()
							billboardGui.Enabled = false
						end)
					end

					if v48 then
						pcall(function()
							if v48.Destroy then
								v48:Destroy()
							elseif v48.Remove then
								v48:Remove()
							end
						end)

						v48 = nil
					end

					if v49 then
						pcall(function()
							if v49.Destroy then
								v49:Destroy()
							elseif v49.Remove then
								v49:Remove()
							end
						end)

						v49 = nil
					end

					if v50 then
						pcall(function()
							v50:Destroy()
						end)

						v50 = nil
					end

					if v51 then
						pcall(function()
							v51:Destroy()
						end)

						v51 = nil
					end
				end

				local v52 = v46:AddLabel("Trace to Target")

				v52:AddToggle({
					Default = false,
					Flag = "TraceToTarget",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TraceToTarget") or "TraceToTarget") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg
						fn52()
						if not arg then
							return
						end

						if not pcall(function()
							Drawing.new("Line"):Remove()
						end) then
							fn10("Trace", "Drawing API is not available")
							return
						end

						local line = Drawing.new("Line")
						line.Transparency = 1
						line.ZIndex = 999
						local line2 = Drawing.new("Line")
						line2.Transparency = 0.55
						line2.ZIndex = 998
						v48 = line
						v49 = line2

						if not billboardGui then
							billboardGui = Instance.new("BillboardGui")
							billboardGui.Size = UDim2.new(0, traceHitmarkerSize, 0, traceHitmarkerSize)
							billboardGui.AlwaysOnTop = true
							billboardGui.Enabled = false
							billboardGui.Parent = CoreGui
							local imageLabel = Instance.new("ImageLabel")
							imageLabel.BackgroundTransparency = 1
							imageLabel.Image = image
							imageLabel.Size = UDim2.new(1, 0, 1, 0)
							imageLabel.Parent = billboardGui
						end

						local v53 = nil
						local humanoidRootPart = nil
						local n26 = 0
						local v54 = nil
						local v55 = nil
						local color2 = nil
						local n27 = 0

						connection2 = RunService.RenderStepped:Connect(function()
							if tick() - n27 < 0.033 then
								return
							end
							n27 = tick()
							if not flag13 then
								fn52()
								return
							end
							local now2 = tick()
							local flag16 = now2 - n26 > 0.2 or not humanoidRootPart or not humanoidRootPart.Parent

							if not flag16 then
								flag16 = not (v53 and v53.Parent and v53.Character and v53.Character.Parent)
							end

							if flag16 then
								n26 = now2
								v53 = fn15()
								humanoidRootPart = v53 and v53.Character and v53.Character:FindFirstChild("HumanoidRootPart") or nil
							end

							local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
							local v56 = humanoidRootPart
							local flag17 = humanoidRootPart

							if v56 then
								flag17 = not v56.Parent
							end

							if flag17 then
								humanoidRootPart = nil
								v56 = nil
							end

							if not (humanoidRootPart2 and v56) then
								line.Visible = false
								line2.Visible = false
								return
							end

							local currentCamera = Workspace.CurrentCamera

							if not currentCamera then
								line.Visible = false
								line2.Visible = false
								return
							end

							local v57 = currentCamera:WorldToViewportPoint(humanoidRootPart2.Position)
							local v58 = currentCamera:WorldToViewportPoint(v56.Position)
							local visible = v57.Z > 0 and v58.Z > 0
							line.Visible = visible
							line2.Visible = visible

							if billboardGui then
								local v59 = visible and flag15

								if billboardGui.Enabled ~= v59 then
									billboardGui.Enabled = v59
								end

								if v59 then
									if v54 ~= traceHitmarkerSize then
										v54 = traceHitmarkerSize
										billboardGui.Size = UDim2.new(0, traceHitmarkerSize, 0, traceHitmarkerSize)
									end

									if v55 ~= v56 then
										v55 = v56
										billboardGui.Adornee = v56
									end

									if color2 ~= line.Color then
										color2 = line.Color
										billboardGui.ImageLabel.ImageColor3 = line.Color
									end

									billboardGui.ImageLabel.Rotation = (billboardGui.ImageLabel.Rotation + 2) % 360
								end
							end

							if visible then
								local color3 = flag14 and Color3.fromHSV(tick() % 3 / 3, 0.7, 1) or color
								local thickness = 2 + math.sin(tick() * 8) * 1
								line.From = Vector2.new(v57.X, v57.Y)
								line.To = Vector2.new(v58.X, v58.Y)
								line.Color = color3
								line.Thickness = thickness
								line2.From = Vector2.new(v57.X, v57.Y)
								line2.To = Vector2.new(v58.X, v58.Y)
								line2.Color = color3
								line2.Thickness = thickness + 4
							end
						end)
					end,
				})

				v52:AddColorPicker({
					Flag = "WR48",
					Default = Color3.fromRGB(168, 85, 247),
					Callback = function(arg)
						color = arg
					end,
				})

				v52:AddTextInput({
					Flag = "WR48t",
					Default = "",
					Placeholder = "hitmarker image id",
					Callback = function(arg)
						arg = arg and arg:match("(%d+)")

						if arg then
							image = "rbxassetid://" .. arg

							if billboardGui then
								billboardGui.ImageLabel.Image = image
							end
						end
					end,
				})

				v46:AddLabel("Trace Rainbow"):AddToggle({
					Default = false,
					Flag = "TraceRainbow",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TraceRainbow") or "TraceRainbow") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg
					end,
				})

				v46:AddLabel("Trace Hitmarker"):AddToggle({
					Default = false,
					Flag = "TraceHitmarker",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TraceHitmarker") or "TraceHitmarker") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg

						if not arg and billboardGui then
							pcall(function()
								billboardGui.Enabled = false
							end)
						end
					end,
				})

				v46:AddLabel("Trace Hitmarker Size"):AddSlider({
					Flag = "TraceHitmarkerSize",
					Min = 10,
					Max = 200,
					Default = 42,
					Rounding = 0,
					Callback = function(arg)
						traceHitmarkerSize = arg

						if billboardGui then
							billboardGui.Size = UDim2.new(0, arg, 0, arg)
						end
					end,
				})
			end

			do
				local flag13 = false
				local tbl10 = {}
				local fredokaOne = Enum.Font.FredokaOne
				local textSize = 16
				local color = Color3.fromRGB(138, 116, 255)
				local flag14 = true
				local flag15 = false
				local flag16 = true

				local tbl11 = {
					Rounded = Enum.Font.FredokaOne,
					Gotham = Enum.Font.GothamBold,
					Code = Enum.Font.Code,
					Arcade = Enum.Font.Arcade,
					Source = Enum.Font.SourceSansBold,
				}

				local function fn52(arg)
					if arg == localPlayer then
						return
					end

					if arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") then
						local humanoidRootPart = arg.Character.HumanoidRootPart
						if humanoidRootPart:FindFirstChild("WraithNameESP") then
							return
						end
						local billboardGui = Instance.new("BillboardGui")
						billboardGui.Name = "WraithNameESP"
						billboardGui.Adornee = humanoidRootPart
						billboardGui.Size = UDim2.new(0, 140, 0, 40)
						billboardGui.StudsOffset = Vector3.new(0, 3, 0)
						billboardGui.AlwaysOnTop = true
						billboardGui.Parent = humanoidRootPart
						local frame2 = Instance.new("Frame")
						frame2.Size = UDim2.new(1, 0, 1, 0)
						frame2.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
						frame2.BackgroundTransparency = flag15 and 0.35 or 1
						frame2.BorderSizePixel = 0
						frame2.Parent = billboardGui
						local uiCorner = Instance.new("UICorner")
						uiCorner.CornerRadius = UDim.new(0, 6)
						uiCorner.Parent = frame2
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, 0, 0.55, 0)
						textLabel.Position = UDim2.new(0, 0, 0, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.Text = "@" .. arg.Name
						textLabel.Font = fredokaOne
						textLabel.TextSize = textSize
						textLabel.TextColor3 = color
						textLabel.TextStrokeTransparency = flag14 and 0.35 or 1
						textLabel.Parent = frame2

						if flag16 then
							local textLabel2 = Instance.new("TextLabel")
							textLabel2.Size = UDim2.new(1, 0, 0.45, 0)
							textLabel2.Position = UDim2.new(0, 0, 0.55, 0)
							textLabel2.BackgroundTransparency = 1
							textLabel2.Font = Enum.Font.Gotham
							textLabel2.TextSize = math.max(10, textSize - 5)
							textLabel2.TextColor3 = Color3.fromRGB(135, 255, 143)
							textLabel2.Parent = frame2

							task.spawn(function()
								while billboardGui.Parent do
									task.wait(0.4)
									local humanoid = arg.Character and arg.Character:FindFirstChildOfClass("Humanoid")

									if humanoid and textLabel2.Parent then
										textLabel2.Text = tostring(math.floor(humanoid.Health)) .. " hp"
									end
								end
							end)
						end
					end
				end

				local function fn53()
					for _, player in pairs(Players:GetPlayers()) do
						if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
							local wraithNameESP = player.Character.HumanoidRootPart:FindFirstChild("WraithNameESP")

							if wraithNameESP then
								wraithNameESP:Destroy()
							end
						end
					end
				end

				v41:AddLabel("Nick Font"):AddDropdown({
					Flag = "NickFont",
					Values = { "Rounded", "Gotham", "Code", "Arcade", "Source" },
					Default = "Rounded",
					Callback = function(arg)
						fredokaOne = tbl11[arg] or Enum.Font.FredokaOne
						fn53()

						if flag13 then
							for _, player in pairs(Players:GetPlayers()) do
								fn52(player)
							end
						end
					end,
				})

				v41:AddLabel("Nick Size"):AddSlider({
					Flag = "NickSize",
					Min = 10,
					Max = 30,
					Default = 16,
					Rounding = 0,
					Callback = function(arg)
						textSize = arg
						fn53()

						if flag13 then
							for _, player in pairs(Players:GetPlayers()) do
								fn52(player)
							end
						end
					end,
				})

				v41:AddLabel("Nick Color"):AddColorPicker({
					Flag = "NickColor",
					Default = Color3.fromRGB(138, 116, 255),
					Callback = function(arg)
						color = arg
						fn53()

						if flag13 then
							for _, player in pairs(Players:GetPlayers()) do
								fn52(player)
							end
						end
					end,
				})

				v41:AddLabel("Nick Extras"):AddToggle({
					Flag = "NickStroke",
					Default = true,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("NickStroke") or "NickStroke") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg
					end,
				})

				v41:AddLabel("Nick Background"):AddToggle({
					Flag = "NickBg",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("NickBg") or "NickBg") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg
					end,
				})

				v41:AddLabel("Nickname ESP"):AddToggle({
					Default = false,
					Flag = "NicknameESP",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("NicknameESP") or "NicknameESP") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						for _, v48 in pairs(tbl10) do
							pcall(function()
								v48:Disconnect()
							end)
						end

						tbl10 = {}
						if not arg then
							fn53()
							return
						end

						for _, player in pairs(Players:GetPlayers()) do
							fn52(player)

							table.insert(tbl10, player.CharacterAdded:Connect(function()
								task.wait(0.5)

								if flag13 then
									fn52(player)
								end
							end))
						end

						table.insert(tbl10, Players.PlayerAdded:Connect(function(player)
							table.insert(tbl10, player.CharacterAdded:Connect(function()
								task.wait(0.5)

								if flag13 then
									fn52(player)
								end
							end))
						end))
					end,
				})
			end

			do
				local flag13 = false
				local n26 = 0.5
				local connection2 = nil
				local cFrame = nil

				v32:AddLabel("Smoothness"):AddSlider({
					Min = 10,
					Max = 90,
					Default = 50,
					Rounding = 0,
					Flag = "SmoothCamAmount",
					Callback = function(arg)
						n26 = arg / 100
					end,
				})

				v32:AddLabel("Smooth Camera"):AddToggle({
					Default = false,
					Flag = "SmoothCam",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("SmoothCam") or "SmoothCam") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if not arg then
							return
						end
						local currentCamera = Workspace.CurrentCamera
						if not currentCamera then
							return
						end
						cFrame = currentCamera.CFrame

						connection2 = RunService.RenderStepped:Connect(function()
							if not flag13 then
								return
							end
							local currentCamera2 = Workspace.CurrentCamera
							if not currentCamera2 then
								return
							end
							local cFrame2 = currentCamera2.CFrame
							local clamp = math.clamp
							local v48 = n26
							local n27

							if n26 then
								n27 = v48
							else
								n27 = 0.25
							end

							local v49 = clamp(1 - n27, 0.05, 1)
							local v50 = cFrame.Position:Lerp(cFrame2.Position, v49)
							cFrame = CFrame.new(v50)
							local n28 = cFrame2 - cFrame2.Position
							currentCamera2.CFrame = CFrame.new(v50) * n28
						end)
					end,
				})
			end

			do
				local tbl10 = {}
				local tbl11 = {}
				local v48 = nil
				local tbl12 = {}

				local function fn52()
					for _, v49 in ipairs(tbl12) do
						pcall(function()
							v49:Destroy()
						end)
					end

					tbl12 = {}
				end

				v33:AddLabel("Pale Frost Shader"):AddToggle({
					Default = false,
					Flag = "PaleFrostShader",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("PaleFrostShader") or "PaleFrostShader") .. ": " .. (arg and "on" or "off"))
							end
						end)

						if arg then
							local v49 = v48
							local tbl13

							if v48 then
								tbl13 = v49
							else
								tbl13 = {
									ClockTime = Lighting.ClockTime,
									GeographicLatitude = Lighting.GeographicLatitude,
									Brightness = Lighting.Brightness,
									Ambient = Lighting.Ambient,
									OutdoorAmbient = Lighting.OutdoorAmbient,
									FogColor = Lighting.FogColor,
									FogStart = Lighting.FogStart,
									FogEnd = Lighting.FogEnd,
									EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
									EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
									GlobalShadows = Lighting.GlobalShadows,
									ExposureCompensation = Lighting.ExposureCompensation,
								}
							end

							v48 = tbl13

							pcall(function()
								for _, child in ipairs(Lighting:GetChildren()) do
									if child:IsA("PostEffect") or child:IsA("Atmosphere") then
										child.Enabled = false
									end
								end

								Lighting.ClockTime = 0
								Lighting.GeographicLatitude = 85
								Lighting.Brightness = 1.1
								Lighting.Ambient = Color3.fromRGB(150, 170, 200)
								Lighting.OutdoorAmbient = Color3.fromRGB(190, 210, 235)
								Lighting.FogColor = Color3.fromRGB(240, 245, 255)
								Lighting.FogStart = 120
								Lighting.FogEnd = 800
								Lighting.EnvironmentDiffuseScale = 1
								Lighting.EnvironmentSpecularScale = 1
								Lighting.GlobalShadows = true
								Lighting.ExposureCompensation = 0.6
								local atmosphere = Instance.new("Atmosphere")
								atmosphere.Name = "WraithPaleFrostAtm"
								atmosphere.Density = 0.8
								atmosphere.Offset = 0.9
								atmosphere.Color = Color3.fromRGB(235, 242, 255)
								atmosphere.Decay = Color3.fromRGB(190, 205, 225)
								atmosphere.Glare = 0.05
								atmosphere.Haze = 10
								atmosphere.Parent = Lighting
								tbl12[#tbl12 + 1] = atmosphere
								local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
								colorCorrectionEffect.Name = "WraithPaleFrostCC"
								colorCorrectionEffect.Brightness = 0.02
								colorCorrectionEffect.Contrast = 0.15
								colorCorrectionEffect.Saturation = -0.65
								colorCorrectionEffect.TintColor = Color3.fromRGB(235, 242, 255)
								colorCorrectionEffect.Parent = Lighting
								tbl12[#tbl12 + 1] = colorCorrectionEffect
								local bloomEffect = Instance.new("BloomEffect")
								bloomEffect.Name = "WraithPaleFrostBloom"
								bloomEffect.Intensity = 0.85
								bloomEffect.Size = 56
								bloomEffect.Threshold = 0.7
								bloomEffect.Parent = Lighting
								tbl12[#tbl12 + 1] = bloomEffect
								local depthOfFieldEffect = Instance.new("DepthOfFieldEffect")
								depthOfFieldEffect.Name = "WraithPaleFrostDOF"
								depthOfFieldEffect.FarIntensity = 0.5
								depthOfFieldEffect.FocusDistance = 50
								depthOfFieldEffect.InFocusRadius = 30
								depthOfFieldEffect.NearIntensity = 0
								depthOfFieldEffect.Parent = Lighting
								tbl12[#tbl12 + 1] = depthOfFieldEffect
								local sunRaysEffect = Instance.new("SunRaysEffect")
								sunRaysEffect.Name = "WraithPaleFrostRays"
								sunRaysEffect.Intensity = 0.12
								sunRaysEffect.Spread = 0.85
								sunRaysEffect.Parent = Lighting
								tbl12[#tbl12 + 1] = sunRaysEffect
							end)
						else
							fn52()

							pcall(function()
								for _, child in ipairs(Lighting:GetChildren()) do
									if child:IsA("PostEffect") or child:IsA("Atmosphere") then
										child.Enabled = true
									end
								end

								if v48 then
									for k, v49 in pairs(v48) do
										pcall(function()
											Lighting[k] = v49
										end)
									end
								end
							end)
						end
					end,
				})

				v33:AddLabel("Dreamy Night Shader"):AddToggle({
					Default = false,
					Flag = "DreamyNightShader",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("DreamyNightShader") or "DreamyNightShader") .. ": " .. (arg and "on" or "off"))
							end
						end)

						if arg then
							if #tbl10 == 0 then
								local blurEffect = Instance.new("BlurEffect")
								blurEffect.Size = 6
								blurEffect.Parent = Lighting
								local bloomEffect = Instance.new("BloomEffect")
								bloomEffect.Intensity = 1.6
								bloomEffect.Size = 90
								bloomEffect.Threshold = 1.4
								bloomEffect.Parent = Lighting
								local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
								colorCorrectionEffect.Brightness = 0.15
								colorCorrectionEffect.Contrast = -0.1
								colorCorrectionEffect.Saturation = 0.25
								colorCorrectionEffect.TintColor = Color3.fromRGB(210, 220, 255)
								colorCorrectionEffect.Parent = Lighting
								local sunRaysEffect = Instance.new("SunRaysEffect")
								sunRaysEffect.Intensity = 0.05
								sunRaysEffect.Spread = 0.6
								sunRaysEffect.Parent = Lighting
								local atmosphere = Instance.new("Atmosphere")
								atmosphere.Density = 0.45
								atmosphere.Offset = 0.1
								atmosphere.Color = Color3.fromRGB(180, 190, 255)
								atmosphere.Decay = Color3.fromRGB(120, 130, 180)
								atmosphere.Glare = 0.2
								atmosphere.Haze = 2
								atmosphere.Parent = Lighting
								tbl10 = { blurEffect, bloomEffect, colorCorrectionEffect, sunRaysEffect, atmosphere }
							end

							tbl11.ClockTime = Lighting.ClockTime
							tbl11.Brightness = Lighting.Brightness
							Lighting.ClockTime = 0
							Lighting.Brightness = 0.5

							for _, v49 in pairs(tbl10) do
								pcall(function()
									v49.Enabled = true
								end)
							end
						else
							for _, v49 in pairs(tbl10) do
								pcall(function()
									v49.Enabled = false
								end)
							end

							if tbl11.ClockTime then
								Lighting.ClockTime = tbl11.ClockTime
							end

							if tbl11.Brightness then
								Lighting.Brightness = tbl11.Brightness
							end
						end
					end,
				})
			end

			do
				local tbl10 = {}
				local tbl11 = nil

				v33:AddLabel("Tokyowami Shaders"):AddToggle({
					Default = false,
					Flag = "TokyowamiShaders",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TokyowamiShaders") or "TokyowamiShaders") .. ": " .. (arg and "on" or "off"))
							end
						end)

						if arg then
							if tbl11 then
								return
							end

							tbl11 = {
								Brightness = Lighting.Brightness,
								ClockTime = Lighting.ClockTime,
								FogColor = Lighting.FogColor,
								FogEnd = Lighting.FogEnd,
								FogStart = Lighting.FogStart,
								Ambient = Lighting.Ambient,
								OutdoorAmbient = Lighting.OutdoorAmbient,
								ColorShift_Top = Lighting.ColorShift_Top,
								ColorShift_Bottom = Lighting.ColorShift_Bottom,
								ExposureCompensation = Lighting.ExposureCompensation,
								ShadowSoftness = Lighting.ShadowSoftness,
							}

							local bloomEffect = Instance.new("BloomEffect")
							bloomEffect.Intensity = 0.1
							bloomEffect.Threshold = 0
							bloomEffect.Size = 100
							bloomEffect.Parent = Lighting
							local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
							colorCorrectionEffect.Name = "WraithInari"
							colorCorrectionEffect.Saturation = 0.05
							colorCorrectionEffect.TintColor = Color3.fromRGB(255, 224, 219)
							colorCorrectionEffect.Parent = Lighting
							local sunRaysEffect = Instance.new("SunRaysEffect")
							sunRaysEffect.Intensity = 0.05
							sunRaysEffect.Parent = Lighting
							local blurEffect = Instance.new("BlurEffect")
							blurEffect.Size = 1
							blurEffect.Parent = Lighting
							local sky = Instance.new("Sky")
							sky.Name = "WraithSunset"
							sky.SkyboxUp = "rbxassetid://323493360"
							sky.SkyboxLf = "rbxassetid://323494252"
							sky.SkyboxBk = "rbxassetid://323494035"
							sky.SkyboxFt = "rbxassetid://323494130"
							sky.SkyboxDn = "rbxassetid://323494368"
							sky.SunAngularSize = 14
							sky.SkyboxRt = "rbxassetid://323494067"
							sky.Parent = Lighting
							tbl10 = { bloomEffect, colorCorrectionEffect, sunRaysEffect, blurEffect, sky }
							Lighting.Brightness = 2.14
							Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
							Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
							Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
							Lighting.ClockTime = 6.7
							Lighting.FogColor = Color3.fromRGB(94, 76, 106)
							Lighting.FogEnd = 1000
							Lighting.FogStart = 0
							Lighting.ExposureCompensation = 0.24
							Lighting.ShadowSoftness = 0
							Lighting.Ambient = Color3.fromRGB(59, 33, 27)
						else
							for _, v48 in pairs(tbl10) do
								pcall(function()
									v48:Destroy()
								end)
							end

							tbl10 = {}

							if tbl11 then
								for k, v48 in pairs(tbl11) do
									pcall(function()
										Lighting[k] = v48
									end)
								end

								tbl11 = nil
							end
						end
					end,
				})
			end

			v34:AddLabel("FOV"):AddSlider({
				Min = 1,
				Max = 120,
				Default = 70,
				Rounding = 0,
				Flag = "FOV",
				Callback = function(fieldOfView)
					Workspace.CurrentCamera.FieldOfView = fieldOfView
				end,
			})

			v34:AddLabel("Third Person"):AddToggle({
				Default = false,
				Flag = "ThirdPerson",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ThirdPerson") or "ThirdPerson") .. ": " .. (arg and "on" or "off"))
						end
					end)

					flag11 = arg

					if arg then
						localPlayer.CameraMode = Enum.CameraMode.Classic
						localPlayer.CameraMaxZoomDistance = 1000
						localPlayer.CameraMinZoomDistance = 0.5

						task.spawn(function()
							local currentCamera = Workspace.CurrentCamera
							local v48, v49, v50 = fn11()
							if not (currentCamera and v50) then
								return
							end
							local now2 = tick()

							while true do
								if flag11 and tick() - now2 < 1.2 then
									local cameraSubject = currentCamera.CameraSubject
									local head = cameraSubject and cameraSubject:IsA("Humanoid") and cameraSubject.Parent and cameraSubject.Parent:FindFirstChild("Head")
									local head2

									if head then
										head2 = head
									else
										head2 = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
									end

									if head2 then
										local magnitude = (currentCamera.CFrame.Position - head2.Position).Magnitude
										local n26 = magnitude + (14 - magnitude) * math.clamp(RunService.RenderStepped:Wait() * 6, 0, 1)

										pcall(function()
											currentCamera.CFrame = CFrame.new(head2.Position - currentCamera.CFrame.LookVector * n26, head2.Position)
										end)

										if not (math.abs(n26 - 14) < 0.4) then
											continue
										end
									end
								end

								break
							end
						end)
					else
						localPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
						localPlayer.CameraMaxZoomDistance = 0.5
						localPlayer.CameraMinZoomDistance = 0.5
					end
				end,
			})

			v34:AddLabel("No Barrier Collision"):AddToggle({
				Default = false,
				Flag = "NoBarrier",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("NoBarrier") or "NoBarrier") .. ": " .. (arg and "on" or "off"))
						end
					end)

					local plots = Workspace:FindFirstChild("Plots")

					if plots then
						for _, child in pairs(plots:GetChildren()) do
							local barrier = child:FindFirstChild("Barrier")

							if barrier then
								for _, descendant in pairs(barrier:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.CanCollide = not arg
									end
								end
							end
						end
					end
				end,
			})

			local flag13
			flag13 = false
			local color
			color = Color3.fromRGB(250, 252, 255)
			local n26
			n26 = 180
			local n27
			n27 = 0.34
			local n28
			n28 = 7
			local n29
			n29 = 0
			local n30
			n30 = 320
			local n31
			n31 = 70

			do
				local str6 = "Classic"
				local folder2 = nil
				local tbl10 = {}

				local tbl11 = {
					Classic = { "rbxasset://textures/particles/sparkles_main.dds" },
					["Snowflake 1"] = { "rbxasset://textures/particles/smoke_main.dds" },
				}

				local function fn52()
					if folder2 then
						folder2:Destroy()
					end

					folder2 = nil
					table.clear(tbl10)
				end

				local function fn53()
					if folder2 and folder2.Parent and #tbl10 == 3 then
						return
					end
					fn52()
					folder2 = Instance.new("Folder")
					folder2.Name = "WraithHugeSnowZone"
					folder2.Parent = Workspace
					local classic = tbl11[str6] or tbl11.Classic

					for i = 1, 3 do
						local part2 = Instance.new("Part")
						part2.Name = "SnowZoneLayer" .. i
						part2.Anchored = true
						part2.Transparency = 1
						part2.CanCollide = false
						part2.CanTouch = false
						part2.CanQuery = false
						part2.Size = Vector3.new(n30, 2, n30)
						part2.Parent = folder2
						local particleEmitter = Instance.new("ParticleEmitter")
						particleEmitter.Name = "WraithSnowLayer" .. i
						particleEmitter.Texture = classic[(i - 1) % #classic + 1]
						particleEmitter.EmissionDirection = Enum.NormalId.Bottom
						particleEmitter.SpreadAngle = Vector2.new(180, 180)
						particleEmitter.Lifetime = NumberRange.new(7 + i, 12 + i)
						particleEmitter.Drag = 2.1
						particleEmitter.Rotation = NumberRange.new(-180, 180)
						particleEmitter.RotSpeed = NumberRange.new(-55, 55)
						particleEmitter.LightEmission = 0.55
						particleEmitter.LightInfluence = 0.06
						particleEmitter.LockedToPart = false
						particleEmitter.Parent = part2

						tbl10[i] = {
							part = part2,
							emitter = particleEmitter,
							offset = Vector3.new((i - 2) * n30 * 0.18, (i - 1) * 6, (i % 2 == 0 and 1 or -1) * n30 * 0.12),
							phase = math.random() * 10,
						}
					end
				end

				local function fn54()
					if not flag13 then
						fn52()
						return
					end
					fn53()
					local classic = tbl11[str6] or tbl11.Classic

					for k, v48 in pairs(tbl10) do
						local emitter = v48.emitter
						v48.part.Size = Vector3.new(n30, 2, n30)
						emitter.Enabled = true
						emitter.Texture = classic[(k - 1) % #classic + 1]
						emitter.Rate = math.max(2, n26 / #tbl10) * ({ 1, 0.65, 0.38 })[k]
						emitter.Color = ColorSequence.new(color)
						emitter.Speed = NumberRange.new(n28 * 0.45, n28 * (1.05 + k * 0.08))
						emitter.Acceleration = Vector3.new(n29 * (0.7 + k * 0.15), -n28 * 0.92, 0)
						local n32 = n27 * ({ 1, 0.72, 0.48 })[k]
						local numberSequence = NumberSequence.new
						local tbl12 = {}
						local v49 = NumberSequenceKeypoint.new(0, 0)
						local v50 = NumberSequenceKeypoint.new(0.13, n32)
						local v51 = NumberSequenceKeypoint.new(0.86, n32 * 0.86)
						local new = NumberSequenceKeypoint.new
						tbl12[1] = v49
						tbl12[2] = v50
						tbl12[3] = v51

						do
							local values = table.pack(new(1, 0))
							table.move(values, 1, values.n, 4, tbl12)
						end

						emitter.Size = numberSequence(tbl12)
						local numberSequence2 = NumberSequence.new
						local tbl13 = {}
						local v52 = NumberSequenceKeypoint.new(0, 1)
						local v53 = NumberSequenceKeypoint.new(0.16, 0.08)
						local v54 = NumberSequenceKeypoint.new(0.86, 0.22)
						local new2 = NumberSequenceKeypoint.new
						tbl13[1] = v52
						tbl13[2] = v53
						tbl13[3] = v54

						do
							local values = table.pack(new2(1, 1))
							table.move(values, 1, values.n, 4, tbl13)
						end

						emitter.Transparency = numberSequence2(tbl13)
					end
				end

				snowLastT = 0

				RunService.RenderStepped:Connect(function()
					if flag13 then
						local v48 = snowLastT
						if tick() - v48 < 0.033 then
							return
						end
						snowLastT = tick()
						fn53()
						local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
						local currentCamera = Workspace.CurrentCamera
						local position = humanoidRootPart and humanoidRootPart.Position or currentCamera and currentCamera.CFrame.Position

						if position then
							local now2 = tick()

							for _, v49 in pairs(tbl10) do
								v49.part.Size = Vector3.new(n30, 2, n30)
								local vector = Vector3.new(math.sin(now2 * 0.22 + v49.phase) * n30 * 0.08, 0, math.cos(now2 * 0.2 + v49.phase) * n30 * 0.08)
								local offset = v49.offset
								v49.part.Position = position + Vector3.new(0, n31, 0) + offset + vector
							end
						end
					end
				end)

				local function fn55(arg)
					local map = Workspace:FindFirstChild("Map")
					map = map and map:FindFirstChild("AlwaysHereTweenedObjects")
					map = map and map:FindFirstChild(arg)

					if not map then
						for _, descendant in ipairs(Workspace:GetDescendants()) do
							if descendant.Name == arg then
								map = descendant
								break
							end
						end
					end

					return map
				end

				local function fn56(arg, arg2)
					local v48 = fn55(arg)
					if not v48 then
						fn10("wraith", arg2 .. ": object not found on this map")
						return
					end
					local object = v48:FindFirstChild("Object") or v48
					local objectModel = object:FindFirstChild("ObjectModel") or object
					local body

					if objectModel:IsA("BasePart") then
						body = objectModel
					else
						body = objectModel:FindFirstChild("Body")

						if not (body and body:IsA("BasePart")) then
							body = objectModel:FindFirstChildWhichIsA("BasePart", true)
						end
					end

					if not body then
						fn10("wraith", arg2 .. ": no part")
						return
					end
					fn10("wraith", arg2 .. ": breaking")
					wraithStickTo(body, 3)

					pcall(function()
						local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

						for i = 1, 60 do
							if setNetworkOwner then
								setNetworkOwner:FireServer(body, body.CFrame)
							end

							RunService.Heartbeat:Wait()
						end

						local objectModelAttachment = body:FindFirstChild("ObjectModelAttachment")

						if objectModelAttachment then
							objectModelAttachment:Destroy()
						end

						local followThisPart = v48:FindFirstChild("FollowThisPart") or object:FindFirstChild("FollowThisPart")

						if followThisPart then
							local alignPosition = followThisPart:FindFirstChild("AlignPosition")
							local alignOrientation = followThisPart:FindFirstChild("AlignOrientation")

							if alignPosition then
								alignPosition.Attachment0 = nil
							end

							if alignOrientation then
								alignOrientation.Attachment0 = nil
							end
						end
					end)

					fn10("wraith", arg2 .. " broken")
				end

				mapGroup:AddButton({
					Name = "Break Outer UFO",
					Callback = function()
						task.spawn(function()
							pcall(fn56, "OuterUFO", "Outer UFO")
						end)
					end,
				})

				mapGroup:AddButton({
					Name = "Break Inner UFO",
					Callback = function()
						task.spawn(function()
							pcall(fn56, "InnerUFO", "Inner UFO")
						end)
					end,
				})

				mapGroup:AddButton({
					Name = "Break CaveCart",
					Callback = function()
						task.spawn(function()
							pcall(fn56, "CaveCart", "CaveCart")
						end)
					end,
				})

				mapGroup:AddButton({
					Name = "Break Train",
					Callback = function()
						task.spawn(function()
							pcall(fn56, "Train", "Train")
						end)
					end,
				})

				mapGroup:AddButton({
					Name = "Break Plots",
					Callback = function()
						task.spawn(function()
							local plots = Workspace:FindFirstChild("Plots")
							if not plots then
								fn10("wraith", "plots: not found")
								return
							end
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local tbl12 = {}
							local tbl13 = {}
							local tbl14 = {}

							for _, descendant in ipairs(plots:GetDescendants()) do
								if descendant:IsA("BasePart") then
									local str7 = tostring(descendant.Name)

									if str7 == "PlotBarrier" then
										tbl12[#tbl12 + 1] = descendant
									elseif str7:find("Door") then
										tbl13[#tbl13 + 1] = descendant
									elseif str7:find("Wall") or str7:find("Fence") then
										tbl14[#tbl14 + 1] = descendant
									end
								end
							end

							for _, v48 in ipairs(tbl12) do
								pcall(function()
									v48.CanCollide = false
									v48.CanTouch = false
									v48.CanQuery = false
									v48.Transparency = 1
								end)
							end

							for _, v48 in ipairs(tbl13) do
								pcall(function()
									v48.CanCollide = false
									v48.Anchored = false

									if setNetworkOwner then
										setNetworkOwner:FireServer(v48, v48.CFrame)
									end
								end)
							end

							for _, v48 in ipairs(tbl14) do
								pcall(function()
									v48.CanCollide = false

									if setNetworkOwner then
										setNetworkOwner:FireServer(v48, v48.CFrame)
									end
								end)
							end

							local n32 = 0

							for _, v48 in ipairs(tbl13) do
								if not (n32 >= 6) then
									n32 += 1

									task.spawn(function()
										local now2 = tick()

										while tick() - now2 < 1.2 do
											pcall(function()
												if setNetworkOwner then
													setNetworkOwner:FireServer(v48, v48.CFrame)
												end

												v48.AssemblyLinearVelocity = Vector3.new(math.random(-1, 1) * 5e11, 8e11, math.random(-1, 1) * 5e11)
												v48.AssemblyAngularVelocity = Vector3.new(3e9, 3e9, 3e9)
											end)

											RunService.Heartbeat:Wait()
										end
									end)

									continue
								end

								break
							end

							pcall(function()
								local plotItems = Workspace:FindFirstChild("PlotItems")
								local playersInPlots = plotItems and plotItems:FindFirstChild("PlayersInPlots")

								if playersInPlots then
									for _, child in ipairs(playersInPlots:GetChildren()) do
										if child.Name ~= localPlayer.Name then
											pcall(function()
												child:Destroy()
											end)
										end
									end
								end
							end)

							fn10("wraith", string.format("plots broken: %d barriers, %d doors, %d walls", #tbl12, #tbl13, #tbl14))
						end)
					end,
				})

				grabBeamColor0 = Color3.fromRGB(255, 255, 255)
				grabBeamColor1 = Color3.fromRGB(255, 255, 255)
				grabBeamColorOn = false
				grabBeamRainbow = false
				grabBeamHue = 0
				grabBeamTex = ""
				local connection2 = nil

				local function fn57()
					local grabParts = Workspace:FindFirstChild("GrabParts")
					if not grabParts then
						return nil
					end
					return grabParts:FindFirstChildWhichIsA("Beam", true)
				end

				local function fn58()
					pcall(function()
						local v48 = fn57()
						if not v48 then
							return
						end

						if grabBeamColorOn and not grabBeamRainbow then
							v48.Color = ColorSequence.new(grabBeamColor0, grabBeamColor1)
						end

						if grabBeamTex ~= "" then
							v48.Texture = grabBeamTex
						end
					end)
				end

				Workspace.ChildAdded:Connect(function(child)
					if child.Name ~= "GrabParts" then
						return
					end

					if not (grabBeamColorOn or grabBeamTex ~= "") then
						return
					end
					task.wait(0.05)
					pcall(fn58)
				end)

				wraithEvery("grabtune", 0.25, function()
					pcall(function()
						local grabParts = Workspace:FindFirstChild("GrabParts")
						grabParts = grabParts and grabParts:FindFirstChild("DragPart")
						if not grabParts then
							return
						end
						local alignPosition = grabParts:FindFirstChild("AlignPosition")
						local alignOrientation = grabParts:FindFirstChild("AlignOrientation")

						if alignPosition and alignPosition.Responsiveness ~= MasslessSense then
							alignPosition.Responsiveness = MasslessSense
							alignPosition.MaxForce = math.huge
							alignPosition.MaxVelocity = math.huge
						end

						if alignOrientation and alignOrientation.Responsiveness ~= MasslessSense then
							alignOrientation.Responsiveness = MasslessSense
							alignOrientation.MaxTorque = math.huge
						end
					end)
				end)

				wraithEvery("grabline", 0.3, function()
					if not (grabBeamColorOn or grabBeamTex ~= "") then
						return
					end
					pcall(fn58)
				end)

				grabLineGroup:AddLabel("Line Colors"):AddToggle({
					Default = false,
					Flag = "GrabLineColors",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("GrabLineColors") or "GrabLineColors") .. ": " .. (arg and "on" or "off"))
							end
						end)

						grabBeamColorOn = arg
						fn58()
					end,
				})

				grabLineGroup:AddLabel("Line Start"):AddColorPicker({
					Flag = "GrabLineC0",
					Default = Color3.fromRGB(255, 255, 255),
					Callback = function(arg)
						grabBeamColor0 = arg
						fn58()
					end,
				})

				grabLineGroup:AddLabel("Line End"):AddColorPicker({
					Flag = "GrabLineC1",
					Default = Color3.fromRGB(255, 255, 255),
					Callback = function(arg)
						grabBeamColor1 = arg
						fn58()
					end,
				})

				grabLineGroup:AddLabel("Line Rainbow"):AddToggle({
					Default = false,
					Flag = "GrabLineRainbow",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("GrabLineRainbow") or "GrabLineRainbow") .. ": " .. (arg and "on" or "off"))
							end
						end)

						grabBeamRainbow = arg

						if connection2 then
							pcall(function()
								connection2:Disconnect()
							end)

							connection2 = nil
						end

						if not arg then
							return
						end

						connection2 = RunService.Heartbeat:Connect(function(deltaTime)
							grabBeamHue = (grabBeamHue + deltaTime * 0.5) % 1
							local color2 = Color3.fromHSV(grabBeamHue, 1, 1)

							pcall(function()
								local v48 = fn57()

								if v48 then
									v48.Color = ColorSequence.new(color2, color2)
								end
							end)
						end)
					end,
				})

				grabLineGroup:AddLabel("Line Texture"):AddTextInput({
					Flag = "GrabLineTex",
					Default = "",
					Placeholder = "asset id",
					Callback = function(arg)
						arg = arg and tostring(arg):match("(%d+)")
						grabBeamTex = arg and "rbxassetid://" .. arg or ""
						fn58()
					end,
				})

				grabToolsGroup:AddButton({
					Name = "Free Gamepass Reach",
					Callback = function()
						fn17("free_reach", function()
							local fartherReach = localPlayer:FindFirstChild("FartherReach")

							if fartherReach then
								pcall(function()
									fartherReach:Destroy()
								end)
							end

							local boolValue = Instance.new("BoolValue")
							boolValue.Name = "FartherReach"
							boolValue.Value = true
							boolValue.Parent = localPlayer

							pcall(function()
								local furtherReachBoughtNotifier = ReplicatedStorage_.GamepassEvents:FindFirstChild("FurtherReachBoughtNotifier")

								if furtherReachBoughtNotifier and getconnections then
									for _, v48 in ipairs(getconnections(furtherReachBoughtNotifier.OnClientEvent)) do
										pcall(v48.Function)
									end
								end
							end)

							fn10("wraith", "free reach: on")
						end)
					end,
				})

				tkAuraOn = false
				local thread2 = nil

				grabAuraGroup:AddLabel("Telekinesis Aura"):AddToggle({
					Default = false,
					Flag = "TelekinesisAura",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("TelekinesisAura") or "TelekinesisAura") .. ": " .. (arg and "on" or "off"))
							end
						end)

						tkAuraOn = arg

						if thread2 then
							pcall(function()
								task.cancel(thread2)
							end)

							thread2 = nil
						end

						if not arg then
							pcall(function()
								for _, player in pairs(Players:GetPlayers()) do
									local character = player.Character

									if character then
										character = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
									end

									if character then
										local hellAuraPos = character:FindFirstChild("HellAuraPos")
										local hellAuraGyro = character:FindFirstChild("HellAuraGyro")

										if hellAuraPos then
											hellAuraPos:Destroy()
										end

										if hellAuraGyro then
											hellAuraGyro:Destroy()
										end
									end
								end
							end)

							return
						end

						thread2 = task.spawn(function()
							while tkAuraOn do
								if not wraithDefenseBlocked() then
									pcall(function()
										local v48, v49, v50 = fn11()
										if not v50 then
											return
										end
										local currentCamera = Workspace.CurrentCamera
										if not currentCamera then
											return
										end

										for _, player in pairs(Players:GetPlayers()) do
											if player ~= localPlayer and player.Character and not fn24(player) then
												local character = player.Character
												local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

												if torso and (torso.Position - v50.Position).Magnitude <= 25 then
													ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(torso, v50.CFrame)

													for _, descendant in ipairs(character:GetDescendants()) do
														if descendant:IsA("BasePart") then
															descendant.CanCollide = false
														end
													end

													local hellAuraPos = torso:FindFirstChild("HellAuraPos") or Instance.new("BodyPosition")
													hellAuraPos.Name = "HellAuraPos"
													hellAuraPos.MaxForce = Vector3.new(100000, 100000, 100000)
													hellAuraPos.D = 500
													hellAuraPos.P = 50000
													hellAuraPos.Parent = torso
													local hellAuraGyro = torso:FindFirstChild("HellAuraGyro") or Instance.new("BodyGyro")
													hellAuraGyro.Name = "HellAuraGyro"
													hellAuraGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
													hellAuraGyro.D = 500
													hellAuraGyro.P = 50000
													hellAuraGyro.Parent = torso
													hellAuraPos.Position = v50.Position + currentCamera.CFrame.LookVector * 15 + Vector3.new(0, 5, 0)
													hellAuraGyro.CFrame = CFrame.new(torso.Position, v50.Position)
												end
											end
										end
									end)
								end

								task.wait(0.05)
							end
						end)
					end,
				})

				fullbrightOn = false
				local tbl12 = nil

				v31:AddLabel("Fullbright"):AddToggle({
					Default = false,
					Flag = "Fullbright",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("Fullbright") or "Fullbright") .. ": " .. (arg and "on" or "off"))
							end
						end)

						fullbrightOn = arg

						pcall(function()
							if arg then
								if not tbl12 then
									tbl12 = {
										Brightness = Lighting.Brightness,
										ClockTime = Lighting.ClockTime,
										FogEnd = Lighting.FogEnd,
										GlobalShadows = Lighting.GlobalShadows,
										Ambient = Lighting.Ambient,
										OutdoorAmbient = Lighting.OutdoorAmbient,
									}
								end

								Lighting.Brightness = 2
								Lighting.ClockTime = 14
								Lighting.FogEnd = 100000
								Lighting.GlobalShadows = false
								Lighting.Ambient = Color3.fromRGB(178, 178, 178)
								Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
							elseif tbl12 then
								Lighting.Brightness = tbl12.Brightness
								Lighting.ClockTime = tbl12.ClockTime
								Lighting.FogEnd = tbl12.FogEnd
								Lighting.GlobalShadows = tbl12.GlobalShadows
								Lighting.Ambient = tbl12.Ambient
								Lighting.OutdoorAmbient = tbl12.OutdoorAmbient
							end
						end)
					end,
				})

				task.spawn(function()
					while true do
						task.wait(1)

						if fullbrightOn then
							pcall(function()
								if Lighting.Brightness ~= 2 then
									Lighting.Brightness = 2
								end

								if Lighting.GlobalShadows then
									Lighting.GlobalShadows = false
								end

								if Lighting.ClockTime ~= 14 then
									Lighting.ClockTime = 14
								end
							end)
						end
					end
				end)

				SvcRS = game:GetService("ReplicatedStorage")
				SvcWS = game:GetService("Workspace")
				SvcRun = game:GetService("RunService")
				SvcInput = game:GetService("UserInputService")
				SvcDebris = game:GetService("Debris")
				SvcPlayers = game:GetService("Players")
				SvcTween = game:GetService("TweenService")
				SvcCtx = game:GetService("ContextActionService")
				SvcLight = game:GetService("Lighting")
				Me = SvcPlayers.LocalPlayer
				Cam = SvcWS.CurrentCamera
				GrabFolder = SvcRS:WaitForChild("GrabEvents")
				EvSetOwner = GrabFolder:WaitForChild("SetNetworkOwner")
				EvDestroyLine = GrabFolder:WaitForChild("DestroyGrabLine")
				EvCreateLine = GrabFolder:WaitForChild("CreateGrabLine")
				EvExtendLine = GrabFolder:WaitForChild("ExtendGrabLine")
				FnSpawnToy = SvcRS:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
				EvDestroyToy = SvcRS:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
				ToysFolder = SvcWS:WaitForChild(Me.Name .. "SpawnedInToys")

				LocalChar = function()
					return Me.Character
				end

				LocalRoot = function()
					local v48 = LocalChar()
					return v48 and v48:FindFirstChild("HumanoidRootPart")
				end

				GrabbedPart = function()
					local grabParts = SvcWS:FindFirstChild("GrabParts")
					local grabPart = grabParts and grabParts:FindFirstChild("GrabPart")
					grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
					return grabPart and grabPart.Part1 or nil
				end

				GrabbedChar = function()
					local v48 = GrabbedPart()
					return v48 and v48.Parent or nil
				end

				InPlot = function(arg)
					local plotItems = SvcWS:FindFirstChild("PlotItems")
					plotItems = plotItems and plotItems:FindFirstChild("PlayersInPlots")
					return plotItems and plotItems:FindFirstChild(arg.Name) ~= nil
				end

				PlayerList = function()
					local tbl13 = {}

					for _, player in ipairs(SvcPlayers:GetPlayers()) do
						if player ~= Me then
							table.insert(tbl13, player.DisplayName .. " (@" .. player.Name .. ")")
						end
					end

					if #tbl13 == 0 then
						table.insert(tbl13, "No players")
					end

					return tbl13
				end

				DoSpawnToy = function(arg, arg2)
					local v48 = LocalRoot()
					if not v48 then
						return nil
					end
					return FnSpawnToy:InvokeServer(arg, arg2 or v48.CFrame * CFrame.new(5, 5, 20), Vector3.zero)
				end

				ClaimOwner = function(arg)
					local v48 = LocalRoot()

					if v48 and arg and arg:IsA("BasePart") then
						EvSetOwner:FireServer(arg, v48.CFrame)
					end
				end

				plr = plr or localPlayer
				LocalPlayer = LocalPlayer or localPlayer
				UserInputService = UserInputService or UserInputService_
				cons = cons or {}
				DestroyToy = DestroyToy or game:GetService("ReplicatedStorage"):WaitForChild("MenuToys"):WaitForChild("DestroyToy")

				spawntoy = function(arg, arg2)
					local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
					return ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, arg2 or humanoidRootPart and humanoidRootPart.CFrame * CFrame.new(5, 5, 20) or CFrame.new(), Vector3.zero)
				end

				sno = function(arg)
					local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart and arg and arg:IsA("BasePart") then
						pcall(function()
							ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(arg, humanoidRootPart.CFrame)
						end)
					end
				end

				GrabOptions = {
					"Throw on Release",
					"Noclip Grab",
					"Ragdoll Grab",
					"Unweld Grab",
					"Kill Grab",
					"Kick Grab",
					"Loop Grab",
					"Anchor Grab",
					"Massless Grab",
					"Invisible Grab",
					"Heavy Objects Grab",
					"Trigger Bot",
					"Extend Line",
				}

				GrabEnabled = {}
				GrabMasterOn = false
				ThrowConn = nil
				ThrowForce = 750
				_G.strength = ThrowForce
				UnweldConn = nil
				SpinActive = false
				SpinConn = nil
				SpinSpeed = 20
				AnchorCoro = nil
				AnchorParts = {}
				AnchorConns = {}
				MasslessSense = 30
				MasslessConn = nil
				TBReady = true
				TBLastTarget = nil
				TBLastHit = 0
				TBConn = nil
				TBDist = 20
				TBThrottle = 0.008
				TBLastCheck = 0
				TBMemory = 0.1
				TBPreDelay = 1e-05
				TBPostDelay = 0.05
				TBRayPrms = RaycastParams.new()
				TBRayPrms.FilterType = Enum.RaycastFilterType.Exclude
				local flag14 = false
				lineDistanceV = 11
				increaseLineExtendV = 7
				infLineExtendT = false
				local connection3 = nil
				local connection4 = nil
				kg_Players = game:GetService("Players")
				kg_ReplicatedStorage = game:GetService("ReplicatedStorage")
				kg_UserInputService = game:GetService("UserInputService")
				kg_RunService = game:GetService("RunService")
				kg_plr = kg_Players.LocalPlayer
				kg_camera = workspace.CurrentCamera
				kg_GrabEvents = kg_ReplicatedStorage:WaitForChild("GrabEvents")
				kg_CreateGrabLine = kg_GrabEvents:WaitForChild("CreateGrabLine")
				kg_SetNetworkOwner = kg_GrabEvents:WaitForChild("SetNetworkOwner")
				kg_DestroyGrabLine = kg_GrabEvents:WaitForChild("DestroyGrabLine")
				kg_Active = false
				kg_FKeyActive = false
				kg_fAttackTarget = nil
				kg_fAttackConn = nil
				kg_mainThread = nil
				kg_inputConn = nil
				lg_Players = game:GetService("Players")
				lg_ReplicatedStorage = game:GetService("ReplicatedStorage")
				lg_UserInputService = game:GetService("UserInputService")
				lg_RunService = game:GetService("RunService")
				lg_plr = lg_Players.LocalPlayer
				lg_SetNetworkOwner = lg_ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
				lg_Active = false
				lg_FTargetActive = false
				lg_fGrabConn = nil
				lg_mainThread = nil
				lg_inputConn = nil

				IsDescOf = function(arg, arg2)
					local parent = arg.Parent

					while parent do
						if parent == arg2 then
							return true
						end
						parent = parent.Parent
					end

					return false
				end

				CleanConns = function(arg)
					for _, v48 in ipairs(arg) do
						if v48 and v48.Connected then
							v48:Disconnect()
						end
					end

					table.clear(arg)
				end

				MakeAnchorHighlight = function(parent)
					local highlight = Instance.new("Highlight")
					highlight.DepthMode = Enum.HighlightDepthMode.Occluded
					highlight.FillTransparency = 1
					highlight.Name = "GrabAnchorHL"
					highlight.OutlineColor = Color3.new(0, 0, 1)
					highlight.OutlineTransparency = 0.5
					highlight.Parent = parent
					return highlight
				end

				MakeMovers = function(parent, position, cFrame)
					local bodyPosition = Instance.new("BodyPosition")
					bodyPosition.P = 15000
					bodyPosition.D = 200
					bodyPosition.MaxForce = Vector3.new(5000000, 5000000, 5000000)
					bodyPosition.Position = position
					bodyPosition.Parent = parent
					local bodyGyro = Instance.new("BodyGyro")
					bodyGyro.P = 15000
					bodyGyro.D = 200
					bodyGyro.MaxTorque = Vector3.new(5000000, 5000000, 5000000)
					bodyGyro.CFrame = cFrame
					bodyGyro.Parent = parent
				end

				ApplyThrow = function(arg)
					if ThrowConn then
						ThrowConn:Disconnect()
						ThrowConn = nil
					end

					if not arg then
						return
					end

					ThrowConn = SvcWS.ChildAdded:Connect(function(child)
						if child.Name ~= "GrabParts" then
							return
						end
						local grabPart = child:FindFirstChild("GrabPart")
						local weldConstraint = grabPart and grabPart:FindFirstChild("WeldConstraint")
						weldConstraint = weldConstraint and weldConstraint.Part1
						if not weldConstraint then
							return
						end
						local bodyVelocity = Instance.new("BodyVelocity", weldConstraint)

						child:GetPropertyChangedSignal("Parent"):Connect(function()
							if child.Parent then
								return
							end
							local v48 = SvcInput
							local mouseButton2 = Enum.UserInputType.MouseButton2

							if v48:GetLastInputType() == mouseButton2 then
								bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyVelocity.Velocity = Cam.CFrame.LookVector * ThrowForce
								SvcDebris:AddItem(bodyVelocity, 1)
							else
								bodyVelocity:Destroy()
							end
						end)
					end)
				end

				ApplyNoclip = function(arg)
					if getgenv().ConnNoclipGrab then
						getgenv().ConnNoclipGrab:Disconnect()
						getgenv().ConnNoclipGrab = nil
					end

					if not arg then
						local v48 = GrabbedChar()

						if v48 then
							for _, descendant in ipairs(v48:GetDescendants()) do
								if descendant:IsA("BasePart") and not descendant.Anchored then
									descendant.CanCollide = true
								end
							end
						end

						return
					end

					local heartbeat2 = SvcRun.Heartbeat

					getgenv().ConnNoclipGrab = heartbeat2:Connect(function()
						local v48 = GrabbedChar()
						if not v48 then
							return
						end

						for _, descendant in ipairs(v48:GetDescendants()) do
							if descendant:IsA("BasePart") and not descendant.Anchored then
								descendant.CanCollide = false
							end
						end
					end)
				end

				ApplyRagdoll = function(arg)
					RagdollGrabOn = arg

					if cons.rgarab1 then
						pcall(function()
							cons.rgarab1:Disconnect()
						end)

						cons.rgarab1 = nil
					end

					if not arg then
						pcall(function()
							local ragdoll = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							ragdoll = ragdoll and ragdoll:FindFirstChild("ragdoll")

							if ragdoll then
								DestroyToy:FireServer(ragdoll)
							end
						end)

						return
					end

					task.spawn(function()
						local PalletLightBrown = fn20("PalletLightBrown")
						if not PalletLightBrown then
							fn10("wraith", "ragdoll grab: pallet fail")
							return
						end
						PalletLightBrown.Name = "ragdoll"
						local soundPart = PalletLightBrown:FindFirstChild("SoundPart") or PalletLightBrown:WaitForChild("SoundPart", 2)
						if not soundPart then
							return
						end
						local now2 = tick()

						while true do
							sno(soundPart)
							RunService.Heartbeat:Wait()
							local partOwner = soundPart:FindFirstChild("PartOwner")

							if partOwner then
								local name = localPlayer.Name
								partOwner = tostring(soundPart.PartOwner.Value) == name
							end

							if not (partOwner or tick() - now2 > 1 or not RagdollGrabOn) then
								continue
							end
							break
						end

						pcall(function()
							for _, descendant in ipairs(PalletLightBrown:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.CanCollide = false
									descendant.Transparency = 1
								end
							end
						end)

						while RagdollGrabOn do
							pcall(function()
								local grabParts = Workspace:FindFirstChild("GrabParts")
								local grabPart = grabParts and grabParts:FindFirstChild("GrabPart")
								grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
								grabPart = grabPart and grabPart.Part1
								grabPart = grabPart and grabPart.Parent
								local humanoidRootPart = grabPart and grabPart:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart and soundPart.Parent then
									sno(soundPart)
									soundPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -1.5, 0)
									soundPart.AssemblyLinearVelocity = Vector3.new(0, 2500, 0)

									pcall(function()
										ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 3)
									end)
								end
							end)

							task.wait(0.1)
						end
					end)
				end

				ApplyUnweld = function(arg)
					if UnweldConn then
						UnweldConn:Disconnect()
						UnweldConn = nil
					end

					if not arg then
						return
					end

					UnweldConn = workspace.ChildAdded:Connect(function(child)
						if child.Name ~= "GrabParts" then
							return
						end
						local grabPart = child:FindFirstChild("GrabPart")
						grabPart = grabPart and grabPart:FindFirstChildOfClass("WeldConstraint")
						local part1 = grabPart and grabPart.Part1
						if not part1 or not part1:IsA("BasePart") or part1.Anchored then
							return
						end
						task.wait(0.01)

						pcall(function()
							part1.CFrame = CFrame.new(part1.Position.X, -9999, part1.Position.Z)
						end)
					end)
				end

				ApplyKill = function(arg)
					KillOnGrab = arg
				end

				ApplySpin = function(arg)
					SpinActive = arg

					if SpinConn then
						SpinConn:Disconnect()
						SpinConn = nil
					end

					if not arg then
						return
					end

					SpinConn = SvcWS.ChildAdded:Connect(function(child)
						if child.Name ~= "GrabParts" or not child:FindFirstChild("GrabPart") then
							return
						end
						local dragPart = SvcWS.GrabParts and SvcWS.GrabParts:FindFirstChild("DragPart")

						if dragPart then
							local alignOrientation = dragPart:FindFirstChild("AlignOrientation")

							if alignOrientation then
								alignOrientation:Destroy()
							end
						end

						local weldConstraint = child.GrabPart:FindFirstChild("WeldConstraint")
						weldConstraint = weldConstraint and weldConstraint.Part1
						if not weldConstraint then
							return
						end

						while SvcWS:FindFirstChild("GrabParts") and SpinActive do
							weldConstraint.AssemblyAngularVelocity = Vector3.new(0, SpinSpeed, 0)
							task.wait()
						end
					end)
				end

				ApplyHeavy = function(arg)
					SetForce = function(maxForce)
						local replicatedFirst = game:FindFirstChild("ReplicatedFirst")
						local grabParts = replicatedFirst and replicatedFirst:FindFirstChild("GrabParts")

						if grabParts and grabParts:FindFirstChild("DragPart") then
							local dragPart = grabParts.DragPart

							if dragPart:FindFirstChild("AlignPosition") then
								dragPart.AlignPosition.MaxForce = maxForce
							end

							if dragPart:FindFirstChild("AlignOrientation") then
								dragPart.AlignOrientation.MaxTorque = maxForce
							end
						end

						local grabParts2 = workspace:FindFirstChild("GrabParts")

						if grabParts2 and grabParts2:FindFirstChild("DragPart") then
							local dragPart = grabParts2.DragPart

							if dragPart:FindFirstChild("AlignPosition") then
								dragPart.AlignPosition.MaxForce = maxForce
							end

							if dragPart:FindFirstChild("AlignOrientation") then
								dragPart.AlignOrientation.MaxTorque = maxForce
							end
						end
					end

					SetForce(arg and math.huge or 60000)
				end

				AnchorLoop = function()
					while true do
						pcall(function()
							local grabParts = SvcWS:FindFirstChild("GrabParts")
							if not grabParts then
								return
							end
							local grabPart = grabParts:FindFirstChild("GrabPart")
							if not grabPart then
								return
							end
							local weldConstraint = grabPart:FindFirstChild("WeldConstraint")
							if not weldConstraint or not weldConstraint.Part1 then
								return
							end
							local primaryPart = weldConstraint.Part1.Parent and weldConstraint.Part1.Parent.PrimaryPart
							if not primaryPart then
								return
							end

							if IsDescOf(primaryPart, SvcWS.Map) then
								return
							end

							for _, child in pairs(SvcPlayers:GetChildren()) do
								if child.Character and IsDescOf(primaryPart, child.Character) then
									return
								end
							end

							if not table.find(AnchorParts, primaryPart) then
								MakeAnchorHighlight(primaryPart.Parent)
								table.insert(AnchorParts, primaryPart)

								local connection5 = primaryPart.Parent.DescendantAdded:Connect(function(descendant)
									if descendant.Name ~= "PartOwner" then
										return
									end
									local grabAnchorHL = primaryPart.Parent:FindFirstChild("GrabAnchorHL")
									if not grabAnchorHL then
										return
									end
									grabAnchorHL.OutlineColor = descendant.Value ~= Me.Name and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
								end)

								table.insert(AnchorConns, connection5)
							end

							for _, child in ipairs(primaryPart:GetChildren()) do
								if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
									child:Destroy()
								end
							end

							while SvcWS:FindFirstChild("GrabParts") do
								task.wait()
							end

							MakeMovers(primaryPart, primaryPart.Position, primaryPart.CFrame)
						end)

						task.wait()
					end
				end

				ReleaseAllAnchor = function()
					for _, v48 in ipairs(AnchorParts) do
						if v48 then
							local bodyPosition = v48:FindFirstChild("BodyPosition")
							local bodyGyro = v48:FindFirstChild("BodyGyro")
							local grabAnchorHL = v48.Parent and v48.Parent:FindFirstChild("GrabAnchorHL")

							if bodyPosition then
								bodyPosition:Destroy()
							end

							if bodyGyro then
								bodyGyro:Destroy()
							end

							if grabAnchorHL then
								grabAnchorHL:Destroy()
							end
						end
					end

					CleanConns(AnchorConns)
					table.clear(AnchorParts)
				end

				ApplyAnchor = function(arg)
					if arg then
						if not AnchorCoro or coroutine.status(AnchorCoro) == "dead" then
							AnchorCoro = coroutine.create(AnchorLoop)
							coroutine.resume(AnchorCoro)
						end
					else
						if AnchorCoro and coroutine.status(AnchorCoro) ~= "dead" then
							coroutine.close(AnchorCoro)
							AnchorCoro = nil
						end

						ReleaseAllAnchor()
					end
				end

				ApplyMassless = function(arg)
					if MasslessConn then
						MasslessConn:Disconnect()
						MasslessConn = nil
					end

					if not arg then
						return
					end

					MasslessConn = SvcWS.ChildAdded:Connect(function(child)
						if child.Name ~= "GrabParts" then
							return
						end
						local dragPart = child:FindFirstChild("DragPart")
						if not dragPart then
							return
						end
						local alignPosition = dragPart:FindFirstChild("AlignPosition")
						local alignOrientation = dragPart:FindFirstChild("AlignOrientation")
						if not (alignPosition and alignOrientation) then
							return
						end

						pcall(function()
							alignPosition.Responsiveness = MasslessSense
							alignPosition.MaxForce = math.huge
							alignPosition.MaxVelocity = math.huge
							alignOrientation.Responsiveness = MasslessSense
							alignOrientation.MaxTorque = math.huge
						end)
					end)
				end

				TBFindTarget = function()
					local v48 = LocalChar()
					if not v48 or not v48:FindFirstChild("HumanoidRootPart") then
						return
					end

					if SvcWS:FindFirstChild("GrabParts") then
						return
					end
					local position = Cam.CFrame.Position
					local lookVector = Cam.CFrame.LookVector
					TBRayPrms.FilterDescendantsInstances = { v48, SvcWS.Terrain }
					local hit = nil

					for _, v49 in ipairs({ lookVector, (lookVector + Vector3.new(0, 0.075, 0)).Unit, (lookVector + Vector3.new(0, -0.075, 0)).Unit }) do
						hit = SvcWS:Raycast(position, v49 * 1000, TBRayPrms)
						if not hit then
							continue
						end
						break
					end

					if not hit then
						return
					end
					local model = hit.Instance:FindFirstAncestorOfClass("Model")
					if not model or model == v48 then
						return
					end
					local humanoid = model:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
					if not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
						return
					end

					if TBDist < (v48.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude then
						return
					end
					return model
				end

				ApplyTriggerBot = function(arg)
					if TBConn then
						TBConn:Disconnect()
						TBConn = nil
					end

					if not arg then
						return
					end

					TBConn = SvcRun.Heartbeat:Connect(function()
						if not TBReady then
							return
						end

						if SvcInput:GetFocusedTextBox() then
							return
						end
						local v48 = TBLastCheck
						if tick() - v48 < TBThrottle then
							return
						end
						TBLastCheck = tick()
						local v49 = TBFindTarget()

						if v49 then
							TBLastTarget = v49
							TBLastHit = tick()
						else
							local flag15 = TBLastTarget

							if flag15 then
								local v50 = TBLastHit
								flag15 = tick() - v50 > TBMemory
							end

							if flag15 then
								TBLastTarget = nil
							end
						end

						local v50 = LocalChar()
						local humanoidRootPart = TBLastTarget and TBLastTarget:FindFirstChild("HumanoidRootPart")
						if not (TBLastTarget and v50 and v50:FindFirstChild("HumanoidRootPart") and humanoidRootPart) then
							return
						end

						if (v50.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude > TBDist then
							TBLastTarget = nil
							return
						end
						TBReady = false

						task.spawn(function()
							task.wait(TBPreDelay)
							pcall(mouse1press)
							local now2 = tick()

							while true do
								task.wait(0.02)
								if not (not SvcWS:FindFirstChild("GrabParts") or tick() - now2 > 1.6) then
									continue
								end
								break
							end

							task.wait(TBPostDelay)
							TBReady = true
							TBLastTarget = nil
						end)
					end)
				end

				ApplyInvisLine = function(invisLine)
					flag14 = invisLine
					_G.InvisLine = invisLine or nil

					if invisLine then
						task.spawn(function()
							while flag14 do
								pcall(function()
									local grabParts = Workspace:FindFirstChild("GrabParts")

									if grabParts then
										for _, descendant in ipairs(grabParts:GetDescendants()) do
											if descendant:IsA("Beam") then
												descendant.Enabled = false
												descendant.Transparency = NumberSequence.new(1)
											elseif descendant:IsA("BasePart") then
												descendant.Transparency = 1
											elseif descendant:IsA("Trail") or descendant:IsA("ParticleEmitter") then
												descendant.Enabled = false
											end
										end
									end
								end)

								RunService.Heartbeat:Wait()
							end
						end)
					end
				end

				startExtendLine = function()
					stopExtendLine()
					local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
					character:WaitForChild("HumanoidRootPart")
					character:WaitForChild("Humanoid")

					connection3 = UserInputService.InputChanged:Connect(function(input)
						if not infLineExtendT then
							return
						end

						if input.UserInputType == Enum.UserInputType.MouseWheel then
							if lineDistanceV < 11 then
								lineDistanceV = 11
							end

							if input.Position.Z > 0 then
								lineDistanceV = lineDistanceV + increaseLineExtendV
							elseif input.Position.Z < 0 then
								lineDistanceV = lineDistanceV - increaseLineExtendV
							end
						end
					end)

					connection4 = workspace.ChildAdded:Connect(function(child)
						if not infLineExtendT then
							return
						end

						if child.Name ~= "GrabParts" or not child:IsA("Model") then
							return
						end
						local v48 = child
						local dragPart = v48:WaitForChild("DragPart")
						local clone = dragPart:Clone()
						clone.Name = "DragPart1"
						local dragAttach = clone:FindFirstChild("DragAttach")

						if clone:FindFirstChild("AlignPosition") and dragAttach then
							clone.AlignPosition.Attachment1 = dragAttach
						end

						clone.Parent = v48
						local currentCamera = workspace.CurrentCamera
						lineDistanceV = (clone.Position - currentCamera.CFrame.Position).Magnitude

						if clone:FindFirstChild("AlignOrientation") then
							clone.AlignOrientation.Enabled = false
						end

						if dragPart:FindFirstChild("AlignPosition") then
							dragPart.AlignPosition.Enabled = false
						end

						task.spawn(function()
							while v48.Parent and infLineExtendT do
								clone.Position = currentCamera.CFrame.Position + currentCamera.CFrame.LookVector * lineDistanceV
								RunService.RenderStepped:Wait()
							end

							lineDistanceV = 11
						end)
					end)
				end

				stopExtendLine = function()
					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					lineDistanceV = 11
				end

				ApplyExtendLine = function(arg)
					infLineExtendT = arg

					if arg then
						startExtendLine()
					else
						stopExtendLine()
					end
				end

				ApplyLoopGrab = function(arg)
					pcall(GRABCB_LoopGrab, arg)
				end

				ApplyKickGrab = function(arg)
					pcall(GRABCB_KickGrab, arg)
				end

				local tbl13 = {
					["Throw on Release"] = ApplyThrow,
					["Noclip Grab"] = ApplyNoclip,
					["Ragdoll Grab"] = ApplyRagdoll,
					["Unweld Grab"] = ApplyUnweld,
					["Kill Grab"] = ApplyKill,
					["Kick Grab"] = ApplyKickGrab,
					["Loop Grab"] = ApplyLoopGrab,
					["Heavy Objects Grab"] = ApplyHeavy,
					["Anchor Grab"] = ApplyAnchor,
					["Massless Grab"] = ApplyMassless,
					["Invisible Grab"] = ApplyInvisLine,
					["Trigger Bot"] = ApplyTriggerBot,
					["Extend Line"] = ApplyExtendLine,
				}

				SvcWS.ChildAdded:Connect(function(child)
					if not KillOnGrab then
						return
					end

					if not (child:IsA("Model") and child.Name == "GrabParts") then
						return
					end
					task.wait(0.05)
					local grabPart = child:FindFirstChild("GrabPart")
					grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
					local part1 = grabPart and grabPart.Part1
					if not part1 or part1.Parent == Me.Character then
						return
					end
					local humanoid = part1.Parent:FindFirstChildOfClass("Humanoid")
					if not humanoid then
						return
					end

					pcall(function()
						local parent = part1.Parent
						local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
						if not setNetworkOwner then
							return
						end
						local random = math.random
						local cframe = CFrame.new(math.random(-300, 300), -2000, random(-300, 300))
						local tbl14 = {}

						for _, v48 in ipairs({ "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "Head" }) do
							local v49 = parent:FindFirstChild(v48)

							if v49 and v49:IsA("BasePart") then
								tbl14[#tbl14 + 1] = v49
							end
						end

						local now2 = tick()

						while true do
							for _, v48 in ipairs(tbl14) do
								pcall(function()
									setNetworkOwner:FireServer(v48, v48.CFrame)
								end)
							end

							RunService.Heartbeat:Wait()
							if not (tick() - now2 > 0.5) then
								continue
							end
							break
						end

						for i = 1, 20 do
							for _, v48 in ipairs(tbl14) do
								pcall(function()
									setNetworkOwner:FireServer(v48, cframe)
									v48.CFrame = cframe
									v48.AssemblyLinearVelocity = Vector3.new(0, -3000, 0)
									v48.AssemblyAngularVelocity = Vector3.zero
								end)
							end

							RunService.Heartbeat:Wait()
						end

						humanoid.Health = 0
					end)
				end)

				GRABCB_LoopGrab = function(arg)
					if not arg then
						getgenv().LoopGrabActive = false
						getgenv().FTargetGrabActive = false

						if getgenv().fGrabConnection then
							getgenv().fGrabConnection:Disconnect()
							getgenv().fGrabConnection = nil
						end

						if getgenv().LoopGrabInputConnection then
							getgenv().LoopGrabInputConnection:Disconnect()
							getgenv().LoopGrabInputConnection = nil
						end

						return
					end

					if getgenv().LoopGrabActive then
						return
					end
					getgenv().LoopGrabActive = true
					local Players2 = game:GetService("Players")
					local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
					local UserInputService_2 = game:GetService("UserInputService")
					local RunService2 = game:GetService("RunService")
					local localPlayer2 = Players2.LocalPlayer
					local setNetworkOwner = ReplicatedStorage_2:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

					task.spawn(function()
						while getgenv().LoopGrabActive do
							local grabParts = workspace:FindFirstChild("GrabParts")

							if not grabParts then
								task.wait()
							else
								local grabPart = grabParts:FindFirstChild("GrabPart")
								grabPart = grabPart and grabPart:FindFirstChildOfClass("WeldConstraint")
								local part1 = grabPart and grabPart.Part1

								if part1 then
									local v48 = nil

									for _, player in ipairs(Players2:GetPlayers()) do
										if player.Character and part1:IsDescendantOf(player.Character) then
											v48 = player
											break
										else
											v48 = nil
										end
									end

									while getgenv().LoopGrabActive and workspace:FindFirstChild("GrabParts") do
										if v48 then
											local humanoidRootPart = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
											local head = v48.Character and v48.Character:FindFirstChild("Head")
											local humanoidRootPart2 = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart and humanoidRootPart2 and head then
												pcall(function()
													setNetworkOwner:FireServer(humanoidRootPart, CFrame.lookAt(humanoidRootPart2.Position, humanoidRootPart.Position))
												end)
											end
										elseif part1.Parent then
											local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart then
												pcall(function()
													setNetworkOwner:FireServer(part1, CFrame.lookAt(humanoidRootPart.Position, part1.Position))
												end)
											end
										end

										task.wait()
									end
								end

								task.wait()
							end
						end
					end)

					if game.PlaceId == 6961824067 then
						local grabEvents2 = game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents")
						local endGrabEarly = grabEvents2:FindFirstChild("EndGrabEarly")

						if endGrabEarly then
							endGrabEarly:Destroy()
						end

						Instance.new("RemoteEvent", grabEvents2).Name = "EndGrabEarly"
					end

					getgenv().FTargetGrabActive = false
					getgenv().fGrabConnection = nil

					getCenterTarget = function()
						local currentCamera = workspace.CurrentCamera
						local vector2 = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2)
						local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart then
							return nil
						end
						local huge = math.huge
						local v48 = nil

						for _, player in ipairs(Players2:GetPlayers()) do
							if player ~= localPlayer2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local humanoidRootPart2 = player.Character.HumanoidRootPart

								if (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= 25 then
									local v49, v50 = currentCamera:WorldToViewportPoint(humanoidRootPart2.Position)

									if v50 then
										local magnitude = (Vector2.new(v49.X, v49.Y) - vector2).Magnitude

										if magnitude < huge then
											huge = magnitude
											v48 = player
										end
									end
								end
							end
						end

						return v48
					end

					if getgenv().LoopGrabInputConnection then
						getgenv().LoopGrabInputConnection:Disconnect()
						getgenv().LoopGrabInputConnection = nil
					end

					local inputBegan = UserInputService_2.InputBegan

					getgenv().LoopGrabInputConnection = inputBegan:Connect(function(arg2, arg3)
						if arg3 then
							return
						end

						if not getgenv().LoopGrabActive then
							return
						end

						if arg2.KeyCode == Enum.KeyCode.F then
							if getgenv().FTargetGrabActive then
								getgenv().FTargetGrabActive = false

								if getgenv().fGrabConnection then
									getgenv().fGrabConnection:Disconnect()
									getgenv().fGrabConnection = nil
								end
							else
								local v48 = getCenterTarget()

								if v48 then
									getgenv().FTargetGrabActive = true
									local currentCamera = workspace.CurrentCamera
									local renderStepped = RunService2.RenderStepped

									getgenv().fGrabConnection = renderStepped:Connect(function()
										if not getgenv().FTargetGrabActive or not v48 or not v48.Character then
											getgenv().FTargetGrabActive = false

											if getgenv().fGrabConnection then
												getgenv().fGrabConnection:Disconnect()
												getgenv().fGrabConnection = nil
											end

											return
										end

										local humanoidRootPart = v48.Character:FindFirstChild("HumanoidRootPart")
										local head = v48.Character:FindFirstChild("Head")
										local humanoidRootPart2 = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart and humanoidRootPart2 and head then
											setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)

											if head:FindFirstChild("PartOwner") then
												local cframe = CFrame.new(currentCamera.CFrame.Position + currentCamera.CFrame.LookVector * 23)
												humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
												humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
												humanoidRootPart.CFrame = cframe
												setNetworkOwner:FireServer(humanoidRootPart, cframe)
											end
										end
									end)
								end
							end
						end
					end)
				end

				GRABCB_KickGrab = function(arg)
					if not arg then
						getgenv().KickGrabActive = false
						getgenv().FKeyAttackActive = false

						if getgenv().FKeyInputConnection then
							getgenv().FKeyInputConnection:Disconnect()
							getgenv().FKeyInputConnection = nil
						end

						return
					end

					if getgenv().KickGrabActive then
						return
					end
					getgenv().KickGrabActive = true
					getgenv().FKeyAttackActive = false
					local Players2 = game:GetService("Players")
					local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
					local UserInputService_2 = game:GetService("UserInputService")
					local RunService2 = game:GetService("RunService")
					local localPlayer2 = Players2.LocalPlayer
					local currentCamera = workspace.CurrentCamera
					local grabEvents2 = ReplicatedStorage_2:WaitForChild("GrabEvents")
					local createGrabLine = grabEvents2:WaitForChild("CreateGrabLine")
					local setNetworkOwner = grabEvents2:WaitForChild("SetNetworkOwner")
					local destroyGrabLine = grabEvents2:WaitForChild("DestroyGrabLine")

					task.spawn(function()
						while getgenv().KickGrabActive do
							local grabParts = workspace:FindFirstChild("GrabParts")

							if not grabParts then
								task.wait()
							else
								local grabPart = grabParts:FindFirstChild("GrabPart")
								grabPart = grabPart and grabPart:FindFirstChildOfClass("WeldConstraint")
								grabPart = grabPart and grabPart.Part1

								if grabPart then
									local v48 = nil

									for _, player in ipairs(Players2:GetPlayers()) do
										if player.Character and grabPart:IsDescendantOf(player.Character) then
											v48 = player
											break
										else
											v48 = nil
										end
									end

									if not v48 then
										task.wait()
									else
										while getgenv().KickGrabActive and workspace:FindFirstChild("GrabParts") do
											if v48 then
												local humanoidRootPart = v48.Character and v48.Character:FindFirstChild("HumanoidRootPart")
												local head = v48.Character and v48.Character:FindFirstChild("Head")
												local humanoidRootPart2 = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

												if humanoidRootPart and humanoidRootPart2 and head then
													pcall(function()
														setNetworkOwner:FireServer(humanoidRootPart, CFrame.lookAt(humanoidRootPart2.Position, humanoidRootPart.Position))
													end)

													task.wait()

													pcall(function()
														destroyGrabLine:FireServer(head)
													end)
												end
											end

											task.wait()
										end

										task.wait()
									end

									continue
								end

								task.wait()
							end
						end
					end)

					getScreenCenterTarget = function()
						local vector2 = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2)
						local v48 = currentCamera:ViewportPointToRay(vector2.X, vector2.Y)
						local raycastParams = RaycastParams.new()
						raycastParams.FilterType = Enum.RaycastFilterType.Exclude

						if localPlayer2.Character then
							raycastParams.FilterDescendantsInstances = { localPlayer2.Character }
						end

						local hit = workspace:Raycast(v48.Origin, v48.Direction * 1000, raycastParams)

						if hit and hit.Instance then
							for _, player in ipairs(Players2:GetPlayers()) do
								if player ~= localPlayer2 and player.Character and hit.Instance:IsDescendantOf(player.Character) then
									return player
								end
							end
						end

						return nil
					end

					local v48 = nil
					local connection5 = nil

					stopFKeyAttack = function()
						getgenv().FKeyAttackActive = false
						v48 = nil

						if connection5 then
							connection5:Disconnect()
							connection5 = nil
						end
					end

					startFKeyAttack = function(arg2)
						getgenv().FKeyAttackActive = true
						v48 = arg2

						connection5 = RunService2.RenderStepped:Connect(function()
							if not getgenv().FKeyAttackActive or not v48 then
								stopFKeyAttack()
								return
							end
							local character = localPlayer2.Character
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
							local character2 = v48.Character
							local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
							if not humanoidRootPart or not humanoidRootPart2 then
								return
							end
							local cFrame = currentCamera.CFrame
							local n32 = cFrame.Position + cFrame.LookVector * 20

							pcall(function()
								humanoidRootPart2.CFrame = CFrame.new(n32)
							end)

							local cframe = CFrame.new(-0.090301513671875, 0.41909456253051758, 0.49999809265136719, 0.39632707834243774, 0, -0.91810941696166992, -1.0944717132588266e-07, 1, -4.7245869438938826e-08, 0.91810941696166992, 5.9604644775390625e-08, 0.39632707834243774)

							pcall(function()
								createGrabLine:FireServer(humanoidRootPart2, cframe)
								setNetworkOwner:FireServer(humanoidRootPart2, CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart2.Position))
								destroyGrabLine:FireServer(humanoidRootPart2)
							end)
						end)
					end

					local inputBegan = UserInputService_2.InputBegan

					getgenv().FKeyInputConnection = inputBegan:Connect(function(arg2, arg3)
						if arg3 then
							return
						end

						if arg2.KeyCode ~= Enum.KeyCode.F then
							return
						end

						if getgenv().FKeyAttackActive then
							stopFKeyAttack()
							return
						end
						local v49 = getScreenCenterTarget()
						if not v49 then
							return
						end
						local character = localPlayer2.Character
						character = character and character:FindFirstChild("HumanoidRootPart")
						local character2 = v49.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
						if not character or not character2 then
							return
						end

						if (character.Position - character2.Position).Magnitude > 25 then
							return
						end
						startFKeyAttack(v49)
					end)

					if game.PlaceId ~= 6961824067 then
						return
					end
					local grabEvents3 = game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents")
					grabEvents3:WaitForChild("EndGrabEarly"):Destroy()
					Instance.new("RemoteEvent", grabEvents3).Name = "EndGrabEarly"
				end

				grabToolsGroup:AddLabel("Enable Grabs"):AddToggle({
					Default = false,
					Flag = "G_Master",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("G_Master") or "G_Master") .. ": " .. (arg and "on" or "off"))
							end
						end)

						GrabMasterOn = arg

						for k, v48 in pairs(GrabEnabled) do
							local v49 = tbl13[k]

							if v49 then
								pcall(v49, arg and v48)
							end
						end
					end,
				})

				grabToolsGroup:AddLabel("Active Grabs"):AddDropdown({
					Values = GrabOptions,
					Default = {},
					Multi = true,
					Flag = "G_Modes",
					Callback = function(arg)
						if type(arg) ~= "table" then
							return
						end

						for _, v48 in ipairs(GrabOptions) do
							local flag15 = arg[v48] == true

							if flag15 ~= GrabEnabled[v48] == true then
								GrabEnabled[v48] = flag15

								if GrabMasterOn then
									local v49 = tbl13[v48]

									if v49 then
										pcall(v49, flag15)
									end
								end
							end
						end
					end,
				})

				grabToolsGroup:AddLabel("Loop Grab"):AddToggle({
					Default = false,
					Flag = "G_LoopGrab",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("G_LoopGrab") or "G_LoopGrab") .. ": " .. (arg and "on" or "off"))
							end
						end)

						pcall(GRABCB_LoopGrab, arg)
					end,
				})

				grabToolsGroup:AddButton({
					Name = "Release Anchors",
					Callback = function()
						pcall(ReleaseAllAnchor)
						fn10("wraith", "anchors released")
					end,
				})

				_expTarget = nil
				_expDropUpdate = false
				AutoExplosionEnabled = false
				ExplosionType = "BombMissile"
				ExplosionInterval = 0
				PredictMovement = false
				ExplosionAmount = 3
				SpawnSpeed = 0
				SetupSpeed = 0
				ExplosionColorEnabled = false
				ExplosionColor = Color3.fromRGB(255, 0, 0)
				RainbowExplosionEnabled = false
				ExplosionBrightness = 10
				origexplosionpresets = {}
				origbrightnessvals = {}
				origsizevals = {}
				origspeedvals = {}
				origlifetimevals = {}
				origdensityvals = {}
				ParticleSize = 1
				ParticleSpeed = 1
				ParticleLifetime = 1
				ParticleDensity = 1
				ParticleTransparency = 0
				TransparentExplosionEnabled = false
				PulseColorEnabled = false
				PulseColorA = Color3.fromRGB(255, 80, 0)
				PulseColorB = Color3.fromRGB(0, 120, 255)
				PulseSpeed = 5
				StrobeEnabled = false
				StrobeIntensity = 5
				InvertColorEnabled = false
				BlendMode = "Default"
				SpawnToyRF = ReplicatedStorage_:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
				DeleteToyRE = ReplicatedStorage_:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
				BuyToy = ReplicatedStorage_:WaitForChild("MenuToys"):WaitForChild("BuyToyRemoteFunction")
				BombEvents = ReplicatedStorage_:WaitForChild("BombEvents")
				SetNetworkOwner = ReplicatedStorage_:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

				HitboxNames = {
					BombMissile = "PartHitDetector",
					BombDarkMatter = "PartHitDetector",
					FireworkMissile = "PartHitDetector",
					BombBalloon = "Balloon",
					PresentBig = "Box",
					PresentSmall = "Box",
				}

				SetupParts = {
					BombMissile = "Body",
					BombDarkMatter = "Pyramid",
					FireworkMissile = "Hitbox",
					BombBalloon = "Balloon",
					PresentBig = "Box",
					PresentSmall = "Box",
				}

				InitializeExplosionPresets = function()
					if ReplicatedStorage_:FindFirstChild("ExplosionMaker") and ReplicatedStorage_.ExplosionMaker:FindFirstChild("ParticlePresets") then
						for _, child in ipairs(ReplicatedStorage_.ExplosionMaker.ParticlePresets:GetChildren()) do
							if child:IsA("ParticleEmitter") then
								origexplosionpresets[child] = child.Color
								origbrightnessvals[child] = child.Brightness
								origsizevals[child] = child.Size
								origspeedvals[child] = child.Speed
								origlifetimevals[child] = child.Lifetime
								origdensityvals[child] = child.Rate
							end
						end
					end
				end

				GetParticles = function()
					if not ReplicatedStorage_:FindFirstChild("ExplosionMaker") or not ReplicatedStorage_.ExplosionMaker:FindFirstChild("ParticlePresets") then
						return {}
					end
					out = {}

					for _, child in ipairs(ReplicatedStorage_.ExplosionMaker.ParticlePresets:GetChildren()) do
						if child:IsA("ParticleEmitter") then
							table.insert(out, child)
						end
					end

					return out
				end

				InvertColor = function(arg)
					return Color3.new(1 - arg.R, 1 - arg.G, 1 - arg.B)
				end

				ApplyExplosionColor = function()
					for _, v48 in ipairs(GetParticles()) do
						local colorSequence

						if RainbowExplosionEnabled then
							local colorSequence2 = ColorSequence.new
							local tbl14 = {}
							local v49 = ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0))
							local v50 = ColorSequenceKeypoint.new(0.25, Color3.new(0, 1, 0))
							local v51 = ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 1))
							local v52 = ColorSequenceKeypoint.new(0.75, Color3.new(1, 1, 0))
							tbl14[1] = v49
							tbl14[2] = v50
							tbl14[3] = v51
							tbl14[4] = v52

							do
								local values = table.pack(ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0)))
								table.move(values, 1, values.n, 5, tbl14)
							end

							colorSequence = colorSequence2(tbl14)
						elseif ExplosionColorEnabled then
							c = InvertColorEnabled and InvertColor(ExplosionColor) or ExplosionColor
							colorSequence = ColorSequence.new(c)
						else
							colorSequence = origexplosionpresets[v48]
						end

						v48.Color = colorSequence
					end
				end

				ApplyExplosionBrightness = function()
					for _, v48 in ipairs(GetParticles()) do
						if ExplosionBrightness == 10 then
							v48.Brightness = origbrightnessvals[v48]
						else
							v48.Brightness = origbrightnessvals[v48] * 2 * (ExplosionBrightness - 9)
						end
					end
				end

				ApplyParticleSize = function()
					for _, v48 in ipairs(GetParticles()) do
						orig = origsizevals[v48]

						if orig then
							kps = orig.Keypoints
							newkps = {}

							for _, v49 in ipairs(kps) do
								table.insert(newkps, NumberSequenceKeypoint.new(v49.Time, v49.Value * ParticleSize, v49.Envelope))
							end

							v48.Size = NumberSequence.new(newkps)
						end
					end
				end

				ApplyParticleSpeed = function()
					for _, v48 in ipairs(GetParticles()) do
						orig = origspeedvals[v48]

						if orig then
							kps = orig.Keypoints
							newkps = {}

							for _, v49 in ipairs(kps) do
								table.insert(newkps, NumberSequenceKeypoint.new(v49.Time, v49.Value * ParticleSpeed, v49.Envelope))
							end

							v48.Speed = NumberRange.new(orig.Min * ParticleSpeed, orig.Max * ParticleSpeed)
						end
					end
				end

				ApplyParticleLifetime = function()
					for _, v48 in ipairs(GetParticles()) do
						orig = origlifetimevals[v48]

						if orig then
							v48.Lifetime = NumberRange.new(orig.Min * ParticleLifetime, orig.Max * ParticleLifetime)
						end
					end
				end

				ApplyParticleDensity = function()
					for _, v48 in ipairs(GetParticles()) do
						orig = origdensityvals[v48]

						if orig then
							v48.Rate = orig * ParticleDensity
						end
					end
				end

				ApplyParticleTransparency = function()
					for _, v48 in ipairs(GetParticles()) do
						if TransparentExplosionEnabled then
							v48.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, ParticleTransparency), NumberSequenceKeypoint.new(1, 1) })
						else
							local new = NumberSequenceKeypoint.new
							v48.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new(1, 1) })
						end
					end
				end

				ApplyBlendMode = function()
					for _, v48 in ipairs(GetParticles()) do
						pcall(function()
							v48.LightEmission = BlendMode == "Additive" and 1 or 0
						end)
					end
				end

				PulseColorLoop = function()
					t = 0

					while PulseColorEnabled do
						local v48 = PulseSpeed
						t = t + task.wait(0.05) * v48
						alpha = (math.sin(t) + 1) / 2
						blended = Color3.new(PulseColorA.R + (PulseColorB.R - PulseColorA.R) * alpha, PulseColorA.G + (PulseColorB.G - PulseColorA.G) * alpha, PulseColorA.B + (PulseColorB.B - PulseColorA.B) * alpha)

						for _, v49 in ipairs(GetParticles()) do
							v49.Color = ColorSequence.new(blended)
						end
					end
				end

				StrobeBrightnessLoop = function()
					while StrobeEnabled do
						for _, v48 in ipairs(GetParticles()) do
							base = origbrightnessvals[v48] or 1
							v48.Brightness = base * StrobeIntensity * (math.random() > 0.5 and 1 or 0.1)
						end

						task.wait(0.05)
					end

					ApplyExplosionBrightness()
				end

				GetSpawnedToys = function()
					return Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
				end

				ExpGetPlayerList = function()
					list = {}

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer then
							table.insert(list, player.DisplayName .. " (@" .. player.Name .. ")")
						end
					end

					table.sort(list, function(arg, arg2)
						return arg:lower() < arg2:lower()
					end)

					return list
				end

				ExpExtractUsername = function(arg)
					return arg and arg:match("@([%w_]+)")
				end

				ExpGetPlayerByName = function(arg)
					if not arg or arg == "" then
						return nil
					end
					return Players:FindFirstChild(arg)
				end

				expTrackLast = {}

				ExpPredictPos = function(arg)
					if not arg then
						return nil
					end
					local now2 = tick()
					local v48 = expTrackLast[arg]
					local assemblyLinearVelocity = arg.AssemblyLinearVelocity
					local flag15 = v48 and now2 - v48.t > 0.001
					local vector = Vector3.zero

					if flag15 then
						vector = (assemblyLinearVelocity - v48.v) / math.min(now2 - v48.t, 0.25)
					end

					expTrackLast[arg] = { t = now2, v = assemblyLinearVelocity, p = arg.Position }
					local n32 = 0.1

					pcall(function()
						n32 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
					end)

					local magnitude = assemblyLinearVelocity.Magnitude
					local n33 = n32 + 0.06

					if magnitude > 300 then
						n33 += 0.1
					elseif magnitude > 120 then
						n33 += 0.06
					end

					local n34 = math.clamp(n33, 0.05, 0.85)
					local n35 = arg.Position + assemblyLinearVelocity * n34 + vector * 0.5 * n34 * n34

					if magnitude > 60 then
						n35 += (assemblyLinearVelocity.Magnitude > 1 and assemblyLinearVelocity.Unit or Vector3.zero) * math.min(magnitude * 0.02, 12)
					end

					if assemblyLinearVelocity.Y < -40 then
						n35 += Vector3.new(0, assemblyLinearVelocity.Y * n34 * 0.35, 0)
					end

					return n35
				end

				ExpGetTargetHRP = function()
					if not _expTarget then
						return nil, nil
					end
					p = ExpGetPlayerByName(_expTarget)
					if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
						return p.Character.HumanoidRootPart, p
					end
					return nil, nil
				end

				ExpRefreshDropdown = function()
					_expDropUpdate = true

					pcall(function()
						ExplosionPlayerDropdown:SetValues(ExpGetPlayerList())
					end)

					_expDropUpdate = false
				end

				GetPlayerCharacterLocal = function()
					if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						return localPlayer.Character
					end
					return nil
				end

				LookAt = function(arg, arg2)
					dir = (arg2 - arg).Unit
					right = dir:Cross(Vector3.new(0, 1, 0))
					up = right:Cross(dir)
					return CFrame.fromMatrix(arg, right, up)
				end

				SetNetworkOwnership = function(arg)
					if not arg then
						return
					end

					if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						pcall(function()
							SetNetworkOwner:FireServer(arg, LookAt(localPlayer.Character.HumanoidRootPart.Position, arg.Position))
						end)
					end
				end

				SpawNoneBomb = function()
					char = GetPlayerCharacterLocal()

					if char then
						pos = char.HumanoidRootPart.Position

						pcall(function()
							SpawnToyRF:InvokeServer(ExplosionType, CFrame.new(pos + Vector3.new(0, 5, 0)), Vector3.zero)
							BuyToy:InvokeServer(ExplosionType)
						end)
					end
				end

				GetAllBombs = function()
					toys = GetSpawnedToys()
					if not toys then
						return {}
					end
					bombs = {}

					for _, child in pairs(toys:GetChildren()) do
						if child.Name == ExplosionType then
							table.insert(bombs, child)
						end
					end

					return bombs
				end

				SetupBomb = function(arg)
					if not arg or not arg.PrimaryPart then
						return
					end
					hitPart = arg:FindFirstChild(SetupParts[arg.Name])
					if not hitPart then
						return
					end
					SetNetworkOwnership(hitPart)
					task.wait(0.05)

					pcall(function()
						for _, child in pairs(arg.PrimaryPart:GetChildren()) do
							if child:IsA("BodyVelocity") or child.Name == "Stable" then
								child:Destroy()
							end
						end

						bodyVel = Instance.new("BodyVelocity")
						bodyVel.Velocity = Vector3.zero
						bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						bodyVel.Name = "Stable"
						bodyVel.Parent = arg.PrimaryPart
						local random = math.random
						arg:PivotTo(CFrame.new(math.random(-500, 500), 10000, random(-500, 500)))
					end)
				end

				ExplodeBomb = function(arg, arg2)
					if not arg or not arg2 then
						return
					end
					hitbox = arg:FindFirstChild(HitboxNames[arg.Name])

					if hitbox then
						targetPos = arg2.Position

						if PredictMovement then
							targetPos = ExpPredictPos(arg2) or targetPos
						end

						pcall(function()
							BombEvents.BombExplode:FireServer({ Hitbox = hitbox, PositionPart = arg2 }, targetPos)
						end)
					end
				end

				DeleteAllBombs = function()
					for _, v48 in pairs(GetAllBombs()) do
						pcall(function()
							DeleteToyRE:FireServer(v48)
						end)
					end
				end

				AutoExplosionLoop = function()
					while AutoExplosionEnabled do
						local v48, v49 = ExpGetTargetHRP()
						targetHRP = v48
						targetPlayer = v49

						if not targetPlayer then
							AutoExplosionEnabled = false
							break
						elseif not targetHRP then
							task.wait(0.2)
						else
							DeleteAllBombs()
							task.wait(0.1)

							while true do
								local v50 = ExplosionAmount

								if #GetAllBombs() < v50 and AutoExplosionEnabled then
									task.spawn(SpawNoneBomb)
									task.wait(SpawnSpeed)
									task.wait(0.02)
									continue
								end

								break
							end

							task.wait(0.15)

							for _, v50 in pairs(GetAllBombs()) do
								if AutoExplosionEnabled then
									task.spawn(function()
										SetupBomb(v50)
									end)

									task.wait(SetupSpeed)
									continue
								end

								break
							end

							task.wait(0.2)
							local v50, v51 = ExpGetTargetHRP()
							targetHRP = v50
							targetPlayer = v51

							if targetHRP and targetPlayer then
								for _, v52 in pairs(GetAllBombs()) do
									if AutoExplosionEnabled then
										task.spawn(function()
											ExplodeBomb(v52, targetHRP)
										end)

										task.wait(0.01)
										continue
									end

									break
								end
							end

							task.wait(0.15)
							DeleteAllBombs()
							task.wait(ExplosionInterval)
						end
					end
				end

				_expDrop = expGroup:AddLabel("Explode Target"):AddDropdown({
					Values = ExpGetPlayerList(),
					Default = "",
					Flag = "ExpTarget",
					Callback = function(arg)
						_expTarget = ExpExtractUsername(arg)
					end,
				})

				expGroup:AddButton({
					Name = "Refresh Players",
					Callback = function()
						ExpRefreshDropdown()
					end,
				})

				task.spawn(function()
					local function fn59()
						pcall(function()
							if _expDrop and type(_expDrop.SetValues) == "function" then
								_expDrop:SetValues(ExpGetPlayerList())
							end
						end)
					end

					Players.PlayerAdded:Connect(function()
						task.wait(0.6)
						fn59()
					end)

					Players.PlayerRemoving:Connect(function()
						task.wait(0.6)
						fn59()
					end)

					while true do
						task.wait(8)
						fn59()
					end
				end)

				expGroup:AddLabel("Bomb Type"):AddDropdown({
					Values = { "Missile", "Firework", "Void", "Balloon", "Present" },
					Default = "Missile",
					Flag = "ExpType",
					Callback = function(arg)
						if arg == "Missile" then
							ExplosionType = "BombMissile"
						elseif arg == "Firework" then
							ExplosionType = "FireworkMissile"
						elseif arg == "Void" then
							ExplosionType = "BombDarkMatter"
						elseif arg == "Balloon" then
							ExplosionType = "BombBalloon"
						else
							ExplosionType = "PresentBig"
						end
					end,
				})

				expGroup:AddLabel("Bomb Amount"):AddSlider({
					Min = 1,
					Max = 15,
					Default = 3,
					Rounding = 0,
					Flag = "ExpAmount",
					Callback = function(arg)
						ExplosionAmount = arg
					end,
				})

				expGroup:AddLabel("Explosion Interval"):AddSlider({
					Min = 0,
					Max = 5,
					Default = 0,
					Rounding = 1,
					Flag = "ExpInterval",
					Callback = function(arg)
						ExplosionInterval = arg
					end,
				})

				expGroup:AddLabel("Spawn Speed"):AddSlider({
					Min = 0,
					Max = 100,
					Default = 0,
					Rounding = 0,
					Flag = "ExpSpawnSpeed",
					Callback = function(arg)
						SpawnSpeed = arg / 100
					end,
				})

				expGroup:AddLabel("Setup Speed"):AddSlider({
					Min = 0,
					Max = 100,
					Default = 0,
					Rounding = 0,
					Flag = "ExpSetupSpeed",
					Callback = function(arg)
						SetupSpeed = arg / 100
					end,
				})

				expGroup:AddLabel("Predict Movement"):AddToggle({
					Default = false,
					Flag = "ExpPredict",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ExpPredict") or "ExpPredict") .. ": " .. (arg and "on" or "off"))
							end
						end)

						PredictMovement = arg
					end,
				})

				expGroup:AddLabel("Loop Explode"):AddToggle({
					Default = false,
					Flag = "AutoExplosionToggle",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AutoExplosionToggle") or "AutoExplosionToggle") .. ": " .. (arg and "on" or "off"))
							end
						end)

						AutoExplosionEnabled = arg

						if arg then
							if not _expTarget then
								AutoExplosionEnabled = false
								fn10("wraith", "explode: select a target first")
								return
							end

							task.spawn(AutoExplosionLoop)
						else
							task.wait(0.3)
							pcall(DeleteAllBombs)
						end
					end,
				})

				expGroup:AddButton({
					Name = "Delete All Bombs",
					Callback = function()
						pcall(DeleteAllBombs)
					end,
				})

				loopBananaOn = false
				local thread3 = nil

				v26:AddLabel("Loop Banana Ragdoll"):AddToggle({
					Default = false,
					Flag = "LoopBananaRagdoll",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("LoopBananaRagdoll") or "LoopBananaRagdoll") .. ": " .. (arg and "on" or "off"))
							end
						end)

						loopBananaOn = arg

						if thread3 then
							pcall(function()
								task.cancel(thread3)
							end)

							thread3 = nil
						end

						if not arg then
							pcall(function()
								local foodBanana = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
								foodBanana = foodBanana and foodBanana:FindFirstChild("FoodBanana")

								if foodBanana then
									local soundPart = foodBanana:FindFirstChild("SoundPart")
									soundPart = soundPart and soundPart:FindFirstChild("AlignPosition")

									if soundPart then
										soundPart:Destroy()
									end

									ReplicatedStorage_.MenuToys.DestroyToy:FireServer(foodBanana)
								end
							end)

							return
						end

						thread3 = task.spawn(function()
							local v48 = fn15() or fn13()

							if not v48 then
								fn10("wraith", "loop banana: no target")
								loopBananaOn = false
								return
							end

							fn10("wraith", "loop banana ragdoll on " .. v48.Name)
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local destroyToy = ReplicatedStorage_.MenuToys:FindFirstChild("DestroyToy")
							local holdEvents = ReplicatedStorage_:FindFirstChild("HoldEvents") or ReplicatedStorage_:WaitForChild("HoldEvents", 5)
							local spawnToyRemoteFunction = ReplicatedStorage_.MenuToys:FindFirstChild("SpawnToyRemoteFunction")

							local function fn59()
								if not Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys") then
									return nil
								end
								local v49, v50, v51 = fn11()
								if not v51 then
									return nil
								end

								pcall(function()
									spawnToyRemoteFunction:InvokeServer("FoodBanana", v51.CFrame * CFrame.new(0, 3, 0), Vector3.zero)
								end)

								local now2 = tick()
								local foodBanana

								while true do
									RunService.Heartbeat:Wait()
									foodBanana = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									foodBanana = foodBanana and foodBanana:FindFirstChild("FoodBanana")
									if not (foodBanana and foodBanana.Parent or tick() - now2 > 2 or not loopBananaOn) then
										continue
									end
									break
								end

								return foodBanana
							end

							while loopBananaOn do
								task.wait()
								local character = v48 and v48.Character
								character = character and character:FindFirstChild("Left Leg")

								if character then
									local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

									if v49 then
										local foodBanana = v49:FindFirstChild("FoodBanana")
										local soundPart = foodBanana and foodBanana:FindFirstChild("SoundPart")

										if not soundPart then
											for _, child in pairs(v49:GetChildren()) do
												if child.Name == "FoodBanana" then
													pcall(function()
														destroyToy:FireServer(child)
													end)
												end
											end

											foodBanana = fn59()

											if foodBanana then
												soundPart = foodBanana:FindFirstChild("SoundPart") or foodBanana:WaitForChild("SoundPart", 3)
												local holdPart = foodBanana:FindFirstChild("HoldPart") or foodBanana:WaitForChild("HoldPart", 3)

												if holdPart then
													local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")

													if holdItemRemoteFunction then
														pcall(function()
															holdItemRemoteFunction:InvokeServer(foodBanana, localPlayer.Character)
														end)
													end
												end

												if holdEvents and holdEvents:FindFirstChild("Use") then
													pcall(function()
														holdEvents.Use:FireServer(foodBanana)
													end)

													local now2 = tick()

													while foodBanana.Parent and foodBanana:FindFirstChild("EdiblePart") and loopBananaOn and tick() - now2 < 2.5 do
														RunService.Heartbeat:Wait()
													end

													pcall(function()
														holdEvents.Use:FireServer(foodBanana)
													end)
												end

												if holdPart then
													local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")

													if dropItemRemoteFunction and localPlayer.Character then
														pcall(function()
															dropItemRemoteFunction:InvokeServer(foodBanana, localPlayer.Character:GetPivot() * CFrame.new(0, 15, -10), Vector3.zero)
														end)
													end
												end

												if soundPart then
													local now2 = tick()

													while true do
														pcall(function()
															setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
														end)

														RunService.Heartbeat:Wait()
														local partOwner = soundPart:FindFirstChild("PartOwner")

														if partOwner then
															local name = localPlayer.Name
															partOwner = tostring(soundPart.PartOwner.Value) == name
														end

														if not (partOwner or tick() - now2 > 1 or not loopBananaOn) then
															continue
														end
														break
													end

													if not soundPart:FindFirstChild("AlignPosition") then
														local attachment = Instance.new("Attachment")
														attachment.Parent = soundPart
														local alignPosition = Instance.new("AlignPosition")
														alignPosition.Responsiveness = 100
														alignPosition.Attachment0 = attachment
														alignPosition.Parent = soundPart
													end
												end
											end
										end

										if foodBanana and soundPart then
											local alignPosition = soundPart:FindFirstChild("AlignPosition")
											local leftFootAttachment = character:FindFirstChild("LeftFootAttachment") or character:FindFirstChildWhichIsA("Attachment")

											if alignPosition and leftFootAttachment then
												alignPosition.Attachment1 = leftFootAttachment
											elseif not alignPosition then
												pcall(function()
													destroyToy:FireServer(foodBanana)
												end)
											end
										end
									end
								end
							end
						end)
					end,
				})

				toyOrbitOn = false
				toyOrbitRadius = 15
				toyOrbitSpeed = 2
				toyOrbitHeight = 4
				toyOrbitRange = 25
				toyOrbitMax = 8
				local connection5 = nil
				local thread4 = nil
				local tbl14 = {}
				local n32 = 0
				toyOrbitShape = "Circle"

				local function fn59(arg, arg2, arg3)
					local n33 = arg2 * 3.1415926535897931 * 2

					if arg == "Square" then
						local n34 = arg2 * 4
						local n35 = math.floor(n34) % 4
						local n36 = n34 - math.floor(n34)
						local n37, n38

						if n35 == 0 then
							n37 = -arg3 + 2 * arg3 * n36
							n38 = -arg3
						elseif n35 == 1 then
							n38 = -arg3 + 2 * arg3 * n36
							n37 = arg3
						elseif n35 == 2 then
							n37 = arg3 - 2 * arg3 * n36
							n38 = arg3
						else
							n37 = -arg3
							n38 = arg3 - 2 * arg3 * n36
						end

						return Vector3.new(n37, 0, n38)
					end

					if arg == "Triangle" then
						local n34 = arg2 * 3
						local n35 = math.floor(n34) % 3
						local n36 = n34 - math.floor(n34)
						local tbl15 = {}
						local vector = Vector3.new(0, 0, -arg3)
						local vector2 = Vector3.new(arg3 * 0.866, 0, arg3 * 0.5)
						local vector3 = Vector3.new
						tbl15[1] = vector
						tbl15[2] = vector2

						do
							local values = table.pack(vector3(-arg3 * 0.866, 0, arg3 * 0.5))
							table.move(values, 1, values.n, 3, tbl15)
						end

						return tbl15[n35 + 1]:Lerp(tbl15[(n35 + 1) % 3 + 1], n36)
					end

					if arg == "Star" then
						local n34 = math.floor(arg2 * 10) % 2 == 0 and arg3 or arg3 * 0.45
						return Vector3.new(math.cos(n33) * n34, 0, math.sin(n33) * n34)
					end

					if arg == "Helix" then
						return Vector3.new(math.cos(n33) * arg3, math.sin(n33 * 3) * arg3 * 0.35, math.sin(n33) * arg3)
					end

					if arg == "Line" then
						return Vector3.new(-arg3 + arg2 * arg3 * 2, 0, 0)
					end
					return Vector3.new(math.cos(n33) * arg3, 0, math.sin(n33) * arg3)
				end

				local function fn60()
					local v48, v49, v50 = fn11()
					if not v50 then
						return
					end
					local grabParts = Workspace:FindFirstChild("GrabParts")
					if not grabParts then
						return
					end
					local grabPart = grabParts:FindFirstChild("GrabPart")
					local weldConstraint = grabPart and grabPart:FindFirstChild("WeldConstraint")
					weldConstraint = weldConstraint and weldConstraint.Part1
					if not weldConstraint then
						return
					end

					if localPlayer.Character and weldConstraint:IsDescendantOf(localPlayer.Character) then
						return
					end

					if Players:GetPlayerFromCharacter(weldConstraint.Parent) then
						return
					end
					local model = weldConstraint:FindFirstAncestorOfClass("Model") or weldConstraint.Parent
					if not model or tbl14[model] then
						return
					end
					local parent = model.Parent
					if not (parent and tostring(parent.Name):match("SpawnedInToys")) then
						return
					end

					if model.Name == "CreatureBlobman" then
						return
					end
					tbl14[model] = { part = weldConstraint, owned = false, cur = weldConstraint.Position }
					fn10("wraith", "orbit: +" .. tostring(model.Name))
				end

				local function fn61()
					for _, v48 in pairs(tbl14) do
						pcall(function()
							local part2 = v48.part

							if part2 and part2.Parent then
								part2.CanCollide = true
								part2.AssemblyLinearVelocity = Vector3.zero
							end
						end)
					end

					tbl14 = {}
				end

				orbitArm = nil

				toyOrbitGroup:AddLabel("Toy Orbit"):AddToggle({
					Default = false,
					Flag = "ToyOrbitAura",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ToyOrbitAura") or "ToyOrbitAura") .. ": " .. (arg and "on" or "off"))
							end
						end)

						toyOrbitOn = arg

						if connection5 then
							pcall(function()
								connection5:Disconnect()
							end)

							connection5 = nil
						end

						if thread4 then
							pcall(function()
								task.cancel(thread4)
							end)

							thread4 = nil
						end

						if not arg then
							fn61()
							return
						end
						tbl14 = {}
						orbitArm = true

						thread4 = task.spawn(function()
							while toyOrbitOn do
								pcall(fn60)
								task.wait(0.15)
							end
						end)

						connection5 = RunService.Heartbeat:Connect(function(deltaTime)
							if not toyOrbitOn then
								return
							end
							local v48, v49, v50 = fn11()
							if not v50 then
								return
							end
							local n33 = toyOrbitSpeed or 0

							if n33 <= 0 then
								n33 = 0.001
							end

							n32 = (n32 + deltaTime * n33 * 0.35) % 1
							local tbl15 = {}

							for k, v51 in pairs(tbl14) do
								if k.Parent and v51.part and v51.part.Parent then
									tbl15[#tbl15 + 1] = { m = k, d = v51 }
								else
									tbl14[k] = nil
								end
							end

							local n34 = #tbl15
							if n34 == 0 then
								return
							end
							local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
							local n35 = math.clamp(deltaTime * 14, 0, 1)

							for i, v51 in ipairs(tbl15) do
								local d = v51.d
								local part2 = d.part
								local n36 = (n32 + (i - 1) / n34) % 1
								local n37 = v50.Position + Vector3.new(0, toyOrbitHeight, 0) + fn59(toyOrbitShape, n36, toyOrbitRadius, n32)

								if setNetworkOwner and fn26("orb_own_" .. tostring(i), 0.4) then
									pcall(function()
										setNetworkOwner:FireServer(part2, part2.CFrame)
									end)
								end

								d.cur = (d.cur or part2.Position):Lerp(n37, n35)

								pcall(function()
									part2.CanCollide = false
									part2.CFrame = CFrame.new(d.cur)
									part2.AssemblyLinearVelocity = Vector3.zero
									part2.AssemblyAngularVelocity = Vector3.zero
								end)
							end
						end)
					end,
				})

				toyOrbitGroup:AddLabel("Orbit Shape"):AddDropdown({
					Values = { "Circle", "Square", "Triangle", "Star", "Helix", "Line" },
					Default = "Circle",
					Flag = "ToyOrbitShape",
					Callback = function(arg)
						toyOrbitShape = arg
					end,
				})

				toyOrbitGroup:AddLabel("Orbit Radius"):AddSlider({
					Min = 0,
					Max = 500,
					Default = 15,
					Rounding = 0,
					Flag = "ToyOrbitRadius",
					Callback = function(arg)
						toyOrbitRadius = arg
					end,
				})

				toyOrbitGroup:AddLabel("Orbit Speed"):AddSlider({
					Min = 0,
					Max = 500,
					Default = 4,
					Rounding = 0,
					Flag = "ToyOrbitSpeed",
					Callback = function(arg)
						toyOrbitSpeed = arg
					end,
				})

				toyOrbitGroup:AddLabel("Orbit Height"):AddSlider({
					Min = 0,
					Max = 500,
					Default = 4,
					Rounding = 0,
					Flag = "ToyOrbitHeight",
					Callback = function(arg)
						toyOrbitHeight = arg
					end,
				})

				wraithEvery("orbitWatch", 2, function()
					if not toyOrbitOn then
						return
					end

					if connection5 and thread4 then
						return
					end

					pcall(function()
						local toyOrbitAura = lib.Flags and lib.Flags.ToyOrbitAura

						if toyOrbitAura and toyOrbitAura.SetValue then
							toyOrbitAura:SetValue(false)
							task.wait(0.1)
							toyOrbitAura:SetValue(true)
						end
					end)
				end)

				toyOrbitGroup:AddButton({
					Name = "Release Toys",
					Callback = function()
						fn61()
						fn10("wraith", "orbit: released")
					end,
				})

				serverPosOn = false
				local tbl15 = { history = {}, parts = {}, localCF = {}, conns = {}, vis = 0, idle = 0, smooth = nil }

				local tbl16 = {
					color = Color3.fromRGB(160, 150, 255),
					transparency = 0.12,
					thickness = 0.09,
					cornerFrac = 0.22,
					minCorner = 0.26,
					sphereScale = 1.9,
					width = 1.9,
					depth = 1.3,
					heightR6 = 5.4,
					headExtra = 3,
					yOffset = -0.35,
					zOffset = -0.05,
					historyLifetime = 2.5,
					idleTimeout = 0.55,
					moveThreshold = 1.5,
					fadeIn = 4.5,
					fadeOut = 2.2,
				}

				local function fn62()
					local ok, result = pcall(function()
						return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
					end)

					if not ok or not result then
						return 0
					end
					return math.clamp(result, 0, 500)
				end

				local function fn63(arg)
					local history = tbl15.history
					if #history == 0 then
						return nil
					end

					if #history == 1 then
						return history[1].cf
					end

					if arg <= history[1].time then
						return history[1].cf
					end

					if history[#history].time <= arg then
						return history[#history].cf
					end

					for i = #history, 2, -1 do
						if history[i - 1].time <= arg and history[i].time >= arg then
							local v48 = history[i - 1]
							local v49 = history[i]
							local n33 = v49.time - v48.time
							if n33 <= 0 then
								return v49.cf
							end
							local n34 = (arg - v48.time) / n33
							local v50 = v48.cf:Lerp(v49.cf, n34)
							return CFrame.new(v48.cf.Position:Lerp(v49.cf.Position, n34)) * (v50 - v50.Position)
						end
					end

					return history[#history].cf
				end

				local function fn64()
					for _, part2 in ipairs(tbl15.parts) do
						if part2 and part2.Parent then
							part2:Destroy()
						end
					end

					table.clear(tbl15.parts)
					table.clear(tbl15.localCF)
				end

				local function createPart(shape, size)
					local part2 = Instance.new("Part")
					part2.Name = "WraithServerPos"
					part2.Shape = shape
					part2.Size = size
					part2.Anchored = true
					part2.CanCollide = false
					part2.CanQuery = false
					part2.CanTouch = false
					part2.CastShadow = false
					part2.Massless = true
					part2.Material = Enum.Material.Neon
					part2.Color = tbl16.color
					part2.Transparency = 1
					part2.Parent = Workspace
					return part2
				end

				local function fn65(arg, arg2)
					table.insert(tbl15.parts, arg)
					table.insert(tbl15.localCF, arg2)
				end

				local function fn66(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
					local vector = Vector3.new(arg * arg4 + arg7, arg2 * arg5 + arg8, arg3 * arg6 + arg9)
					local v48 = fn65
					local v49 = createPart(Enum.PartType.Cylinder, Vector3.new(arg10, arg11, arg11))
					local v50 = table.pack(CFrame.new(Vector3.new(arg * (arg4 - arg10 * 0.5) + arg7, vector.Y, vector.Z)))
					v48(v49, table.unpack(v50, 1, v50.n))
					fn65(createPart(Enum.PartType.Cylinder, Vector3.new(arg10, arg11, arg11)), CFrame.new(Vector3.new(vector.X, arg2 * (arg5 - arg10 * 0.5) + arg8, vector.Z)) * CFrame.Angles(0, 0, 1.5707963267948966))
					fn65(createPart(Enum.PartType.Cylinder, Vector3.new(arg10, arg11, arg11)), CFrame.new(Vector3.new(vector.X, vector.Y, arg3 * (arg6 - arg10 * 0.5) + arg9)) * CFrame.Angles(0, 1.5707963267948966, 0))
					local cframe = CFrame.new
					fn65(createPart(Enum.PartType.Ball, Vector3.new(arg12, arg12, arg12)), cframe(vector))
				end

				local function fn67()
					fn64()
					local v48, v49, v50 = fn11()
					if not (v48 and v49 and v50) then
						return
					end
					local heightR6 = tbl16.heightR6

					if v49.RigType ~= Enum.HumanoidRigType.R6 then
						local max = math.max
						local hipHeight = v49.HipHeight or 2
						local headExtra = tbl16.headExtra
						heightR6 = max(hipHeight, 2) + headExtra
					end

					local vector = Vector3.new(tbl16.width, heightR6, tbl16.depth)
					local n33 = vector * 0.5
					local thickness = tbl16.thickness
					local n34 = thickness * tbl16.sphereScale
					local n35 = math.max(tbl16.minCorner, tbl16.cornerFrac * math.min(vector.X, vector.Y, vector.Z))

					for _, v51 in ipairs({ -1, 1 }) do
						for _, v52 in ipairs({ -1, 1 }) do
							for _, v53 in ipairs({ -1, 1 }) do
								fn66(v51, v52, v53, n33.X, n33.Y, n33.Z, 0, tbl16.yOffset, tbl16.zOffset, n35, thickness, n34)
							end
						end
					end
				end

				local function fn68()
					for _, conn in ipairs(tbl15.conns) do
						pcall(function()
							conn:Disconnect()
						end)
					end

					table.clear(tbl15.conns)
					fn64()
					table.clear(tbl15.history)
					tbl15.smooth = nil
					tbl15.vis = 0
				end

				local function fn69()
					fn68()
					fn67()

					tbl15.conns[#tbl15.conns + 1] = localPlayer.CharacterAdded:Connect(function()
						task.wait(1)

						if serverPosOn then
							fn67()
						end
					end)

					tbl15.conns[#tbl15.conns + 1] = RunService.Heartbeat:Connect(function(deltaTime)
						if not serverPosOn then
							return
						end
						local v48, v49, v50 = fn11()
						if not v50 then
							return
						end
						table.insert(tbl15.history, { time = tick(), cf = v50.CFrame })
						local historyLifetime = tbl16.historyLifetime
						local n33 = tick() - historyLifetime

						while #tbl15.history > 0 and tbl15.history[1].time < n33 do
							table.remove(tbl15.history, 1)
						end

						if tbl16.moveThreshold < v50.AssemblyLinearVelocity.Magnitude then
							tbl15.idle = 0
						else
							tbl15.idle = tbl15.idle + deltaTime
						end

						local n34 = tbl15.idle < tbl16.idleTimeout and 1 or 0
						tbl15.vis = math.clamp(tbl15.vis + (n34 - tbl15.vis) * math.min(1, (n34 > tbl15.vis and tbl16.fadeIn or tbl16.fadeOut) * deltaTime), 0, 1)
						local v51 = fn63(tick() - fn62() / 1000)
						if not v51 then
							return
						end

						if not tbl15.smooth then
							tbl15.smooth = v51
						else
							tbl15.smooth = tbl15.smooth:Lerp(v51, math.clamp(deltaTime * 12, 0, 1))
						end

						local transparency = math.clamp(tbl16.transparency + (1 - 1 - (1 - tbl15.vis) ^ 3) * (1 - tbl16.transparency), 0, 1)

						for i, part2 in ipairs(tbl15.parts) do
							if part2.Parent then
								part2.Transparency = transparency
								local v52 = tbl15.localCF[i]

								if v52 then
									part2.CFrame = tbl15.smooth * v52
								end
							end
						end
					end)
				end

				local v48 = v40:AddLabel("Server Position ESP")

				v48:AddToggle({
					Default = false,
					Flag = "ServerPosESP",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("ServerPosESP") or "ServerPosESP") .. ": " .. (arg and "on" or "off"))
							end
						end)

						serverPosOn = arg

						if arg then
							fn69()
						else
							fn68()
						end
					end,
				})

				v48:AddColorPicker({
					Flag = "ServerPosColor",
					Default = Color3.fromRGB(160, 150, 255),
					Callback = function(color2)
						tbl16.color = color2

						for _, part2 in ipairs(tbl15.parts) do
							if part2.Parent then
								part2.Color = color2
							end
						end
					end,
				})

				limbGroup = tabGrabs:AddSection({ Name = "LIMB REMOVAL", Position = "left" })
				limbAutoRagdoll = true

				local function fn70()
					local grabParts = Workspace:FindFirstChild("GrabParts")
					grabParts = grabParts and grabParts:FindFirstChild("GrabPart")
					grabParts = grabParts and grabParts:FindFirstChild("WeldConstraint")
					return grabParts and grabParts.Part1 and grabParts.Part1.Parent or nil
				end

				local function fn71(arg)
					local v49 = fn70()
					if not v49 then
						fn10("wraith", "limb: сначала захвати цель")
						return
					end
					local v50 = v49:FindFirstChild(arg)
					local humanoid = v49:FindFirstChildOfClass("Humanoid")
					local torso = v49:FindFirstChild("Torso")
					if not (v50 and humanoid and torso) then
						fn10("wraith", "limb: нет " .. arg)
						return
					end
					local ragdolled = humanoid:FindFirstChild("Ragdolled")

					if limbAutoRagdoll then
						local humanoidRootPart = v49:FindFirstChild("HumanoidRootPart")
						local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

						if humanoidRootPart then
							local PalletLightBrown = fn20("PalletLightBrown")
							local soundPart

							if PalletLightBrown then
								soundPart = PalletLightBrown:FindFirstChild("SoundPart") or PalletLightBrown:WaitForChild("SoundPart", 1)
							else
								soundPart = PalletLightBrown
							end

							if soundPart then
								local now2 = tick()

								while true do
									if setNetworkOwner then
										pcall(function()
											setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
										end)
									end

									RunService.Heartbeat:Wait()
									local partOwner = soundPart:FindFirstChild("PartOwner")

									if partOwner then
										local name = localPlayer.Name
										partOwner = tostring(soundPart.PartOwner.Value) == name
									end

									if not (partOwner or tick() - now2 > 0.8) then
										continue
									end
									break
								end

								pcall(function()
									for _, descendant in ipairs(PalletLightBrown:GetDescendants()) do
										if descendant:IsA("BasePart") then
											descendant.CanCollide = false
											descendant.CanQuery = false
											descendant.Transparency = 1
										end
									end
								end)
							end

							local now2 = tick()

							while true do
								pcall(function()
									ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 3)
								end)

								if soundPart and soundPart.Parent then
									pcall(function()
										soundPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -2.2, 0)
										soundPart.AssemblyLinearVelocity = Vector3.new(0, 9000, 0)
									end)
								end

								RunService.Heartbeat:Wait()
								if not (ragdolled and ragdolled.Value or tick() - now2 > 1.5) then
									continue
								end
								break
							end

							if PalletLightBrown then
								task.delay(0.6, function()
									pcall(function()
										ReplicatedStorage_.MenuToys.DestroyToy:FireServer(PalletLightBrown)
									end)
								end)
							end
						end
					end

					if ragdolled and not ragdolled.Value then
						fn10("wraith", "limb: цель не в регдолле")
						return
					end
					local cFrame = torso.CFrame
					local fallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
					Workspace.FallenPartsDestroyHeight = -100
					v50.CFrame = CFrame.new(0, -1000, 0)
					task.wait(0.1)
					torso.CFrame = CFrame.new(0, -950, 0)
					task.wait()
					torso.CFrame = cFrame
					task.wait(0.2)
					Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
					fn10("wraith", "limb: " .. arg .. " removed")
				end

				limbGroup:AddLabel("Auto Ragdoll Target"):AddToggle({
					Default = true,
					Flag = "LimbAutoRagdoll",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("LimbAutoRagdoll") or "LimbAutoRagdoll") .. ": " .. (arg and "on" or "off"))
							end
						end)

						limbAutoRagdoll = arg
					end,
				})

				for _, v49 in ipairs({ "Left Leg", "Right Leg", "Left Arm", "Right Arm" }) do
					limbGroup:AddLabel("Remove " .. v49):AddKeybind({
						Flag = "LimbRM_" .. v49:gsub(" ", ""),
						Callback = function(arg)
							if not arg then
								return
							end

							fn17("limbrm", function()
								fn71(v49)
							end)
						end,
					})
				end

				gucciAntiGrabOn = false
				gucciType = "CreatureBlobman"
				local n33 = 0
				local v49 = nil

				local function fn72(arg)
					if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
						return nil
					end

					for _, child in pairs(arg:GetChildren()) do
						if child:IsA("BasePart") and child.CanQuery and child.Name ~= "Button" then
							return child
						end
					end

					return nil
				end

				local function fn73()
					n33 += 1

					if v49 then
						local v50 = v49
						v49 = nil
						pcall(v50)
					end
				end

				local function fn74()
					n33 += 1
					local v50 = n33
					local v51 = nil
					local seat = nil
					local v52 = nil
					local v53 = nil
					local connection6 = nil

					local function fn75()
						if connection6 then
							pcall(function()
								connection6:Disconnect()
							end)

							connection6 = nil
						end

						if v51 then
							pcall(function()
								ReplicatedStorage_.MenuToys.DestroyToy:FireServer(v51)
							end)

							v51 = nil
						end

						seat = nil
						v52 = nil
						v53 = nil
					end

					v49 = fn75

					local function fn76(descendant)
						pcall(function()
							if descendant:IsA("BasePart") then
								descendant.Transparency = 1
								descendant.CanCollide = false
							elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
								descendant.Transparency = 1
							elseif descendant.Name == "ItemSpawnSound" then
								descendant:Destroy()
							end
						end)
					end

					local isHeld = localPlayer:FindFirstChild("IsHeld")

					while gucciAntiGrabOn and v50 == n33 and task.wait() do
						local character = localPlayer.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")

						if not humanoid or humanoid.Health == 0 then
							localPlayer.CharacterAdded:Wait()
							task.wait(0.16)
						else
							local ragdolled = humanoid:FindFirstChild("Ragdolled")

							if humanoidRootPart and ragdolled and not (isHeld and isHeld.Value) and not ragdolled.Value and humanoid.Health > 0 then
								if humanoid.Sit then
									humanoid.Sit = false
								end

								local v54 = gucciType
								local flag15 = v51 and v51.Parent and seat and seat.Parent and v53 == v54
								local flag16 = false

								if flag15 then
									local occupant = seat.Occupant

									if occupant == nil or occupant == humanoid then
										flag16 = true
									end
								end

								if not flag16 then
									fn75()

									if v54 == "Train" then
										local map = Workspace:FindFirstChild("Map")
										map = map and map:FindFirstChild("AlwaysHereTweenedObjects")
										map = map and map:FindFirstChild("Train")
										map = map and map:FindFirstChild("Object")
										map = map and map:FindFirstChild("ObjectModel")

										if map then
											v51 = map
											seat = v51:FindFirstChildWhichIsA("Seat")
											v52 = nil
											v53 = v54
										end
									else
										v51 = fn20(v54, CFrame.new(100000, 500000, 0))
										seat = v51 and v51:WaitForChild("VehicleSeat", 1.25)
										v52 = seat and fn72(v51) or nil
										v53 = v54

										if v51 then
											for _, descendant in pairs(v51:GetDescendants()) do
												fn76(descendant)
											end

											connection6 = v51.DescendantAdded:Connect(fn76)
										end
									end
								end

								if seat and seat.Parent then
									local v55 = seat
									local v56 = v51

									pcall(function()
										v55.Transparency = 1
										v55.CanCollide = false
									end)

									local flag17 = false
									local now2 = tick()

									v55.ChildAdded:Once(function(child)
										if child.Name == "SeatWeld" then
											child.Enabled = false
											child:Destroy()
											flag17 = true
										end
									end)

									local flag18 = true
									local ragdollRemote = ReplicatedStorage_.CharacterEvents:FindFirstChild("RagdollRemote")

									task.defer(function()
										while humanoid and humanoid.Health > 0 and flag18 and task.wait() do
											if ragdollRemote and humanoidRootPart then
												pcall(function()
													ragdollRemote:FireServer(humanoidRootPart, 0)
												end)
											end
										end
									end)

									pcall(function()
										v55:Sit(humanoid)
									end)

									while true do
										task.wait()

										if not (humanoid.Health <= 0 or not humanoidRootPart.Parent or not v56 or not v56.Parent or not v55.Parent) then
											if not (isHeld and isHeld.Value or ragdolled.Value or flag17 or tick() - now2 > 0.75) then
												continue
											end
										end

										break
									end

									flag18 = false

									if flag17 then
										humanoid.Sit = false
									end
								end
							end
						end
					end

					fn75()
				end

				gucciGroup:AddLabel("Gucci Anti Grab"):AddToggle({
					Default = false,
					Flag = "GucciAntiGrabSrc",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("GucciAntiGrabSrc") or "GucciAntiGrabSrc") .. ": " .. (arg and "on" or "off"))
							end
						end)

						gucciAntiGrabOn = arg

						if arg then
							task.spawn(fn74)
						else
							fn73()
						end
					end,
				})

				gucciGroup:AddLabel("Gucci Type"):AddDropdown({
					Values = { "CreatureBlobman", "TractorGreen", "Train" },
					Default = "CreatureBlobman",
					Flag = "GucciTypeSrc",
					Callback = function(arg)
						gucciType = arg
					end,
				})

				counterAttackOn = false
				counterMethodSrc = "Fling"
				local connection6 = nil

				local function fn75(arg, arg2)
					if not arg:IsA("StringValue") or arg.Name ~= "PartOwner" then
						return
					end
					local v50 = Players:FindFirstChild(arg.Value)
					if not v50 or v50 == localPlayer then
						return
					end

					if not counterAttackOn then
						return
					end

					if fn24(v50) then
						return
					end
					local character = v50.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

					if counterMethodSrc == "Kill" then
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")

						if humanoidRootPart and setNetworkOwner then
							for i = 1, 12 do
								pcall(function()
									setNetworkOwner:FireServer(humanoidRootPart, CFrame.new(0, -2000, 0))
									humanoidRootPart.CFrame = CFrame.new(0, -2000, 0)
									humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, -3000, 0)
								end)

								RunService.Heartbeat:Wait()
							end
						end

						if humanoid then
							pcall(function()
								humanoid.Health = 0
							end)
						end
					elseif counterMethodSrc == "Void" then
						if humanoidRootPart and setNetworkOwner then
							for i = 1, 15 do
								pcall(function()
									setNetworkOwner:FireServer(humanoidRootPart, CFrame.new(0, -3000, 0))
									humanoidRootPart.CFrame = CFrame.new(0, -3000, 0)
								end)

								RunService.Heartbeat:Wait()
							end
						end
					elseif counterMethodSrc == "Grab" then
						if humanoidRootPart then
							pcall(function()
								ReplicatedStorage_.GrabEvents.CreateGrabLine:FireServer(humanoidRootPart, Vector3.zero, humanoidRootPart.Position, false)

								if setNetworkOwner then
									setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
								end
							end)
						end
					elseif counterMethodSrc == "Fling" then
						if humanoidRootPart and arg2 and setNetworkOwner then
							pcall(function()
								setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
								humanoidRootPart.AssemblyLinearVelocity = arg2.CFrame.LookVector * 100 + Vector3.new(0, 25, 0)
							end)
						end
					elseif counterMethodSrc == "Delete Limbs" then
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")
						local ragdolled = humanoid and humanoid:FindFirstChild("Ragdolled")
						local torso = character and character:FindFirstChild("Torso")
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
						if not (humanoid and torso and humanoidRootPart2) then
							return
						end

						if ragdolled and not ragdolled.Value then
							local now2 = tick()

							while true do
								pcall(function()
									ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart2, 3)
								end)

								RunService.Heartbeat:Wait()
								if not (ragdolled.Value or tick() - now2 > 1.2) then
									continue
								end
								break
							end
						end

						local tbl17

						if counterLimbCA == "All" then
							tbl17 = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }
						elseif counterLimbCA == "Legs" then
							tbl17 = { "Left Leg", "Right Leg" }
						elseif counterLimbCA == "Arms" then
							tbl17 = { "Left Arm", "Right Arm" }
						else
							tbl17 = { counterLimbCA }
						end

						local cFrame = torso.CFrame
						local fallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
						Workspace.FallenPartsDestroyHeight = -100

						for _, v51 in ipairs(tbl17) do
							local v52 = character:FindFirstChild(v51)

							if v52 then
								pcall(function()
									if setNetworkOwner then
										setNetworkOwner:FireServer(v52, v52.CFrame)
									end

									v52.CFrame = CFrame.new(0, -1000, 0)
								end)
							end
						end

						task.wait(0.1)

						pcall(function()
							torso.CFrame = CFrame.new(0, -950, 0)
						end)

						task.wait()

						pcall(function()
							torso.CFrame = cFrame
						end)

						task.wait(0.2)
						Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
					elseif counterMethodSrc == "Teleport to Spawn" then
						if humanoidRootPart and setNetworkOwner then
							pcall(function()
								setNetworkOwner:FireServer(humanoidRootPart, CFrame.new(0, 10, 0))
								humanoidRootPart.CFrame = CFrame.new(0, 10, 0)
							end)
						end
					end

					fn10("wraith", "counter: " .. counterMethodSrc .. " -> " .. v50.Name)
				end

				local function fn76(arg)
					local v50, v51, v52 = fn11()
					arg = arg and arg:FindFirstChild("Head")
					if not arg then
						return
					end

					if connection6 then
						pcall(function()
							connection6:Disconnect()
						end)
					end

					connection6 = arg.ChildAdded:Connect(function(child)
						fn75(child, v52)
					end)
				end

				counterGroup:AddLabel("Counter Attack"):AddToggle({
					Default = false,
					Flag = "CounterAttackSrc",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("CounterAttackSrc") or "CounterAttackSrc") .. ": " .. (arg and "on" or "off"))
							end
						end)

						counterAttackOn = arg

						if arg then
							fn76(localPlayer.Character)
						end
					end,
				})

				counterGroup:AddLabel("Counter Method"):AddDropdown({
					Values = { "Fling", "Kill", "Void", "Grab", "Delete Limbs", "Teleport to Spawn" },
					Default = "Fling",
					Flag = "CounterMethodSrc",
					Callback = function(arg)
						counterMethodSrc = arg
					end,
				})

				counterLimbCA = "All"

				counterGroup:AddLabel("Counter Limb"):AddDropdown({
					Values = { "All", "Legs", "Arms", "Left Leg", "Right Leg", "Left Arm", "Right Arm" },
					Default = "All",
					Flag = "CounterLimbCA",
					Callback = function(arg)
						counterLimbCA = arg
					end,
				})

				if localPlayer.Character then
					task.defer(fn76, localPlayer.Character)
				end

				localPlayer.CharacterAdded:Connect(function(character)
					task.wait()

					if counterAttackOn then
						fn76(character)
					end
				end)

				antiBananaOn = false

				v21:AddLabel("Anti Banana"):AddToggle({
					Default = false,
					Flag = "AntiBananaSrc",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", "Anti Banana: " .. (arg and "on" or "off"))
							end
						end)

						antiBananaOn = arg
					end,
				})

				task.spawn(function()
					while task.wait(0.1) do
						if antiBananaOn then
							pcall(function()
								local v50, v51, v52 = fn11()
								if not v52 then
									return
								end
								local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
								local destroyToy = ReplicatedStorage_.MenuToys:FindFirstChild("DestroyToy")
								if not setNetworkOwner then
									return
								end
								local v53 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

								for _, child in ipairs(Workspace:GetChildren()) do
									if tostring(child.Name):match("SpawnedInToys") and child ~= v53 then
										for _, child2 in ipairs(child:GetChildren()) do
											if tostring(child2.Name):find("Banana") then
												local primaryPart = child2.PrimaryPart or child2:FindFirstChild("SoundPart") or child2:FindFirstChildWhichIsA("BasePart")

												if primaryPart and (primaryPart.Position - v52.Position).Magnitude <= 10 then
													local now2 = tick()

													while true do
														pcall(function()
															setNetworkOwner:FireServer(primaryPart, primaryPart.CFrame)
														end)

														RunService.Heartbeat:Wait()
														local partOwner = primaryPart:FindFirstChild("PartOwner")

														if partOwner then
															local name = localPlayer.Name
															partOwner = tostring(primaryPart.PartOwner.Value) == name
														end

														if not (partOwner or tick() - now2 > 0.6) then
															continue
														end
														break
													end

													for i = 1, 10 do
														pcall(function()
															for _, descendant in ipairs(child2:GetDescendants()) do
																if descendant:IsA("BasePart") then
																	descendant.CanCollide = false
																	descendant.CanTouch = false
																	descendant.CFrame = CFrame.new(0, -4000, 0)
																	descendant.AssemblyLinearVelocity = Vector3.new(0, -3000, 0)
																end
															end

															setNetworkOwner:FireServer(primaryPart, CFrame.new(0, -4000, 0))
														end)

														RunService.Heartbeat:Wait()
													end

													if destroyToy then
														pcall(function()
															destroyToy:FireServer(child2)
														end)
													end

													fn10("wraith", "anti banana: voided")
												end
											end
										end
									end
								end
							end)
						end
					end
				end)

				autoLeaveOn = false
				local connection7 = nil

				v22:AddLabel("Auto Leave"):AddToggle({
					Default = false,
					Flag = "AutoLeaveAntiBan",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AutoLeaveAntiBan") or "AutoLeaveAntiBan") .. ": " .. (arg and "on" or "off"))
							end
						end)

						autoLeaveOn = arg

						if connection7 then
							pcall(function()
								connection7:Disconnect()
							end)

							connection7 = nil
						end

						if not arg then
							return
						end
						local tbl17 = {}
						local gameCorrectionEvents = ReplicatedStorage_:FindFirstChild("GameCorrectionEvents")
						local gameCorrectionsNotify = gameCorrectionEvents and gameCorrectionEvents:FindFirstChild("GameCorrectionsNotify")
						if not gameCorrectionsNotify then
							fn10("wraith", "auto leave: no notify remote")
							return
						end

						connection7 = gameCorrectionsNotify.OnClientEvent:Connect(function(arg2)
							if not autoLeaveOn then
								return
							end

							if arg2 == "Flying" then
								local now2 = os.clock()
								table.insert(tbl17, now2)

								for i = #tbl17, 1, -1 do
									if now2 - tbl17[i] > 1 then
										table.remove(tbl17, i)
									end
								end

								if #tbl17 >= 3 then
									pcall(function()
										localPlayer:Kick("wraith safety: disconnected to prevent a ban")
									end)
								end
							end
						end)
					end,
				})

				antiKickSrcOn = false

				akSet = {
					Highlight = false,
					HighlightFill = Color3.new(1, 0, 0),
					HighlightOutl = Color3.new(1, 1, 1),
					HighlightFT = 0.5,
					HighlightOT = 0,
					Transparency = 0.9,
				}

				local NinjaShuriken = nil

				local function fn77()
					if NinjaShuriken then
						pcall(function()
							ReplicatedStorage_.MenuToys.DestroyToy:FireServer(NinjaShuriken)
						end)

						NinjaShuriken = nil
					end
				end

				local function fn78()
					if not (NinjaShuriken and NinjaShuriken.Parent) then
						return nil, nil
					end
					local stickyPart = NinjaShuriken:FindFirstChild("StickyPart")
					if not stickyPart then
						return nil, nil
					end
					return stickyPart, stickyPart:FindFirstChild("StickyWeld")
				end

				local function fn79(arg)
					if not (NinjaShuriken and NinjaShuriken.Parent) or NinjaShuriken.Name ~= "ShurikenRSC" then
						return false
					end
					local v50, v51 = fn78()
					if not (v50 and v51) then
						return false
					end
					return v51.Part1 == arg
				end

				local function fn80()
					if not (NinjaShuriken and NinjaShuriken.Parent) then
						return
					end
					local shurHighlight = NinjaShuriken:FindFirstChild("ShurHighlight")

					if not shurHighlight then
						shurHighlight = Instance.new("Highlight")
						shurHighlight.Name = "ShurHighlight"
						shurHighlight.Adornee = NinjaShuriken
						shurHighlight.Parent = NinjaShuriken
					end

					pcall(function()
						shurHighlight.Enabled = akSet.Highlight
						shurHighlight.FillColor = akSet.HighlightFill
						shurHighlight.OutlineColor = akSet.HighlightOutl
						shurHighlight.FillTransparency = akSet.HighlightFT
						shurHighlight.OutlineTransparency = akSet.HighlightOT
					end)

					for _, child in ipairs(NinjaShuriken:GetChildren()) do
						if child:IsA("BasePart") then
							pcall(function()
								if child:IsA("MeshPart") or child.Name == "Part" then
									child.Transparency = akSet.Transparency
								end

								child.CanCollide = false
								child.CanQuery = false
							end)
						end
					end
				end

				local function fn81(arg)
					if not (NinjaShuriken and NinjaShuriken.Parent) then
						fn77()
						NinjaShuriken = fn20("NinjaShuriken", arg.CFrame + Vector3.new(0, 15, 0))
						if not NinjaShuriken then
							return false
						end
					end

					local stickyPart = NinjaShuriken:WaitForChild("StickyPart", 1.5)
					if not stickyPart then
						fn77()
						return false
					end
					local stickyWeld = stickyPart:WaitForChild("StickyWeld", 1.5)
					if not stickyWeld then
						fn77()
						return false
					end
					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")
					local now2 = tick()

					while true do
						if setNetworkOwner then
							pcall(function()
								setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
							end)
						end

						RunService.Heartbeat:Wait()
						local partOwner = stickyPart:FindFirstChild("PartOwner")

						if partOwner then
							local name = localPlayer.Name
							partOwner = tostring(stickyPart.PartOwner.Value) == name
						end

						if not (partOwner or tick() - now2 > 1) then
							continue
						end
						break
					end

					local partOwner = stickyPart:FindFirstChild("PartOwner")

					if partOwner then
						local name = localPlayer.Name
						partOwner = tostring(stickyPart.PartOwner.Value) == name
					end

					if not partOwner then
						fn77()
						return false
					end
					NinjaShuriken.Name = "ShurikenRSC"

					task.spawn(function()
						local touchInterest = stickyPart:WaitForChild("TouchInterest", 2.5)

						if touchInterest then
							pcall(function()
								touchInterest:Destroy()
							end)
						end
					end)

					local playerEvents = ReplicatedStorage_:FindFirstChild("PlayerEvents")
					playerEvents = playerEvents and playerEvents:FindFirstChild("StickyPartEvent")

					if playerEvents then
						pcall(function()
							playerEvents:FireServer(stickyPart, arg, CFrame.new(0, -0.3, 0) * CFrame.Angles(1.5707963267948966, 0, 0))
						end)
					end

					local now3 = tick()

					while true do
						RunService.Heartbeat:Wait()

						if stickyWeld.Part1 == arg then
							break
						else
							if not (not stickyWeld.Parent or not arg.Parent or not stickyPart.Parent or not NinjaShuriken or not NinjaShuriken.Parent) then
								local v50
								v50, v50 = fn11()

								if not (not v50 or v50.Health == 0) then
									if not (tick() - now3 > 0.5) then
										continue
									end
								end
							end

							break
						end
					end

					return stickyWeld.Parent ~= nil
				end

				antiKickGroup:AddLabel("Anti Kick"):AddToggle({
					Default = false,
					Flag = "AntiKickSrc",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiKickSrc") or "AntiKickSrc") .. ": " .. (arg and "on" or "off"))
							end
						end)

						antiKickSrcOn = arg
						fn10("wraith", "anti kick: " .. (arg and "on" or "off"))

						if not arg then
							fn77()
						end
					end,
				})

				local v50 = antiKickGroup:AddLabel("Anti Kick ESP")

				v50:AddToggle({
					Default = false,
					Flag = "AntiKickHL",
					Callback = function(highlight)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("AntiKickHL") or "AntiKickHL") .. ": " .. (highlight and "on" or "off"))
							end
						end)

						akSet.Highlight = highlight
						fn80()
					end,
				})

				v50:AddColorPicker({
					Flag = "AntiKickHLFill",
					Default = Color3.new(1, 0, 0),
					Callback = function(highlightFill)
						akSet.HighlightFill = highlightFill
						fn80()
					end,
				})

				antiKickGroup:AddLabel("Anti Kick ESP Outline"):AddColorPicker({
					Flag = "AntiKickHLOut",
					Default = Color3.new(1, 1, 1),
					Callback = function(highlightOutl)
						akSet.HighlightOutl = highlightOutl
						fn80()
					end,
				})

				antiKickGroup:AddLabel("Anti Kick ESP Fill"):AddSlider({
					Min = 0,
					Max = 100,
					Default = 50,
					Rounding = 0,
					Flag = "AntiKickHLFT",
					Callback = function(arg)
						akSet.HighlightFT = arg / 100
						fn80()
					end,
				})

				antiKickGroup:AddLabel("Anti Kick Transparency"):AddSlider({
					Min = 0,
					Max = 100,
					Default = 90,
					Rounding = 0,
					Flag = "AntiKickTrans",
					Callback = function(arg)
						akSet.Transparency = arg / 100
						fn80()
					end,
				})

				task.spawn(function()
					while task.wait(0.05) do
						if antiKickSrcOn then
							local v51, v52, v53 = fn11()

							if v53 and v52 then
								local ragdollTouchedHitbox = v53:FindFirstChild("RagdollTouchedHitbox")

								if ragdollTouchedHitbox and v52.Health > 0 then
									local inPlot = localPlayer:FindFirstChild("InPlot")
									local inOwnedPlot = localPlayer:FindFirstChild("InOwnedPlot")

									if inPlot and inPlot.Value then
										while inPlot.Value and (not inOwnedPlot or not inOwnedPlot.Value) do
											task.wait()
										end
									end

									if (fn79(ragdollTouchedHitbox) or fn81(ragdollTouchedHitbox)) and NinjaShuriken and NinjaShuriken.Parent then
										fn80()
									end
								end
							end
						elseif NinjaShuriken then
							fn77()
						end
					end
				end)

				playerEspGroup = v17:AddSection({ Name = "PLAYER ESP", Position = "left" })
				playerEspOn = false
				playerEspColor = Color3.fromRGB(120, 170, 255)
				playerEspFill = 0.65
				playerEspNames = true
				playerEspDist = true
				playerEspHealth = true
				playerEspMaxDist = 1000
				local obj = setmetatable({}, { __mode = "k" })

				local function fn82()
					for k, v51 in pairs(obj) do
						pcall(function()
							if v51.hl then
								v51.hl:Destroy()
							end

							if v51.gui then
								v51.gui:Destroy()
							end
						end)

						obj[k] = nil
					end

					pcall(function()
						for _, descendant in ipairs(Workspace:GetDescendants()) do
							if descendant.Name == "WraithPlayerEsp" or descendant.Name == "WraithPlayerTag" then
								descendant:Destroy()
							end
						end
					end)
				end

				local function fn83(arg, adornee)
					local humanoidRootPart = adornee:FindFirstChild("HumanoidRootPart")
					local head = adornee:FindFirstChild("Head")
					if not (humanoidRootPart and head) then
						return nil
					end
					local highlight = Instance.new("Highlight")
					highlight.Name = "WraithPlayerEsp"
					highlight.Adornee = adornee
					highlight.FillColor = playerEspColor
					highlight.OutlineColor = playerEspColor
					highlight.FillTransparency = playerEspFill
					highlight.OutlineTransparency = 0
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.Parent = adornee
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "WraithPlayerTag"
					billboardGui.Adornee = head
					billboardGui.Size = UDim2.new(0, 200, 0, 40)
					billboardGui.StudsOffset = Vector3.new(0, 2.6, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = head
					local textLabel = Instance.new("TextLabel")
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 13
					textLabel.TextColor3 = playerEspColor
					textLabel.TextStrokeTransparency = 0.4
					textLabel.Text = arg.Name
					textLabel.Parent = billboardGui
					return { hl = highlight, gui = billboardGui, lbl = textLabel }
				end

				local v51 = playerEspGroup:AddLabel("Player ESP")

				v51:AddToggle({
					Default = false,
					Flag = "PlayerESP",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", "Player ESP: " .. (arg and "on" or "off"))
							end
						end)

						playerEspOn = arg

						if not arg then
							fn82()
						end
					end,
				})

				v51:AddColorPicker({
					Flag = "PlayerESPColor",
					Default = Color3.fromRGB(120, 170, 255),
					Callback = function(fillColor)
						playerEspColor = fillColor

						for _, v52 in pairs(obj) do
							pcall(function()
								v52.hl.FillColor = fillColor
								v52.hl.OutlineColor = fillColor
								v52.lbl.TextColor3 = fillColor
							end)
						end
					end,
				})

				playerEspGroup:AddLabel("Player ESP Fill"):AddSlider({
					Min = 0,
					Max = 100,
					Default = 65,
					Rounding = 0,
					Flag = "PlayerESPFill",
					Callback = function(arg)
						playerEspFill = arg / 100

						for _, v52 in pairs(obj) do
							pcall(function()
								v52.hl.FillTransparency = playerEspFill
							end)
						end
					end,
				})

				playerEspGroup:AddLabel("Player ESP Names"):AddToggle({
					Default = true,
					Flag = "PlayerESPNames",
					Callback = function(arg)
						playerEspNames = arg
					end,
				})

				playerEspGroup:AddLabel("Player ESP Distance"):AddToggle({
					Default = true,
					Flag = "PlayerESPDist",
					Callback = function(arg)
						playerEspDist = arg
					end,
				})

				playerEspGroup:AddLabel("Player ESP Health"):AddToggle({
					Default = true,
					Flag = "PlayerESPHealth",
					Callback = function(arg)
						playerEspHealth = arg
					end,
				})

				playerEspGroup:AddLabel("Player ESP Max Distance"):AddSlider({
					Min = 50,
					Max = 5000,
					Default = 1000,
					Rounding = 0,
					Flag = "PlayerESPMaxDist",
					Callback = function(arg)
						playerEspMaxDist = arg
					end,
				})

				wraithEvery("playerEsp", 0.25, function()
					if not playerEspOn then
						return
					end

					pcall(function()
						local v52, v53, v54 = fn11()

						for _, player in ipairs(Players:GetPlayers()) do
							if player ~= localPlayer then
								local character = player.Character
								local humanoid = character and character:FindFirstChildOfClass("Humanoid")
								local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
								local v55 = obj[player]
								local flag15 = character and humanoid and humanoidRootPart and humanoid.Health > 0

								if flag15 and v54 then
									if playerEspMaxDist < (humanoidRootPart.Position - v54.Position).Magnitude then
										flag15 = false
									end
								end

								if flag15 then
									if not v55 or not v55.hl or not v55.hl.Parent or v55.hl.Adornee ~= character then
										if v55 then
											pcall(function()
												if v55.hl then
													v55.hl:Destroy()
												end

												if v55.gui then
													v55.gui:Destroy()
												end
											end)
										end

										v55 = fn83
										v55 = v55(player, character)
										obj[player] = v55
									end

									if v55 then
										local tbl17 = { player.Name }

										if not playerEspNames then
											tbl17 = {}
										end

										if playerEspHealth and humanoid then
											tbl17[#tbl17 + 1] = string.format("%d hp", math.floor(humanoid.Health))
										end

										if playerEspDist and v54 then
											tbl17[#tbl17 + 1] = string.format("%dm", math.floor((humanoidRootPart.Position - v54.Position).Magnitude))
										end

										v55.lbl.Text = table.concat(tbl17, "  |  ")
										v55.gui.Enabled = #tbl17 > 0
									end
								elseif v55 then
									pcall(function()
										if v55.hl then
											v55.hl:Destroy()
										end

										if v55.gui then
											v55.gui:Destroy()
										end
									end)

									obj[player] = nil
								end
							end
						end
					end)
				end)

				Players.PlayerRemoving:Connect(function(player)
					local v52 = obj[player]

					if v52 then
						pcall(function()
							if v52.hl then
								v52.hl:Destroy()
							end

							if v52.gui then
								v52.gui:Destroy()
							end
						end)

						obj[player] = nil
					end
				end)

				snowGroup:AddLabel("Snow"):AddToggle({
					Default = false,
					Flag = "Snow",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("Snow") or "Snow") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag13 = arg
						fn54()
					end,
				})

				snowGroup:AddLabel("Particle"):AddDropdown({
					Values = { "Classic", "Snowflake 1" },
					Default = "Classic",
					Flag = "SnowParticle",
					Callback = function(arg)
						str6 = arg
						fn52()
						fn54()
					end,
				})

				snowGroup:AddLabel("Color"):AddColorPicker({
					Default = color,
					Callback = function(arg)
						color = arg
						fn54()
					end,
				})

				snowGroup:AddLabel("Density"):AddSlider({
					Min = 20,
					Max = 1200,
					Default = 180,
					Rounding = 0,
					Flag = "SnowDensity",
					Callback = function(arg)
						n26 = arg
						fn54()
					end,
				})

				snowGroup:AddLabel("Size"):AddSlider({
					Min = 5,
					Max = 220,
					Default = 70,
					Rounding = 0,
					Flag = "SnowSize",
					Callback = function(arg)
						n27 = arg / 100
						fn54()
					end,
				})

				snowGroup:AddLabel("Speed"):AddSlider({
					Min = 1,
					Max = 30,
					Default = 7,
					Rounding = 0,
					Flag = "SnowSpeed",
					Callback = function(arg)
						n28 = arg
						fn54()
					end,
				})

				snowGroup:AddLabel("Wind"):AddSlider({
					Min = -25,
					Max = 25,
					Default = 0,
					Rounding = 0,
					Flag = "SnowWind",
					Callback = function(arg)
						n29 = arg
						fn54()
					end,
				})

				snowGroup:AddLabel("Area"):AddSlider({
					Min = 120,
					Max = 650,
					Default = 320,
					Rounding = 0,
					Flag = "SnowArea",
					Callback = function(arg)
						n30 = arg
						fn54()
					end,
				})
			end

			snowGroup:AddLabel("Height"):AddSlider({
				Min = 25,
				Max = 140,
				Default = 70,
				Rounding = 0,
				Flag = "SnowHeight",
				Callback = function(arg)
					n31 = arg
				end,
			})

			do
				local flag14 = false
				local flag15 = false
				local flag16 = false
				local flag17 = false
				local volume = 1.8

				local tbl10 = {
					Skeet = 83717596220569,
					Fatality = 115982072912004,
					Bell = 139452805868562,
					Click = 87437544236708,
					UwU = 124356179581089,
					Neverlose = 8679627751,
					Hitmarker = 4817809188,
				}

				local str6 = "Skeet"
				local str7 = "Fatality"
				local str8 = "Hitmarker"

				local function fn52()
					return tbl10[str6] or tbl10.Skeet
				end

				local function fn53(position, arg)
					local flag18 = position ~= nil and position ~= Vector3.zero
					local part2 = nil
					local v48 = SoundService

					if flag18 then
						part2 = Instance.new("Part")
						part2.Name = "WraithCleanSoundEmitter"
						part2.Anchored = true
						part2.CanCollide = false
						part2.Transparency = 1
						part2.Size = Vector3.one
						part2.Position = position
						part2.Parent = Workspace
						v48 = part2
					end

					local sound2 = Instance.new("Sound")
					sound2.Name = "WraithCleanBypassSound"
					sound2.SoundId = "rbxassetid://" .. (arg or fn52())
					sound2.Volume = volume

					if flag18 then
						sound2.RollOffMaxDistance = 350
					end

					sound2.Parent = v48
					sound2:Play()

					task.spawn(function()
						sound2.Ended:Wait()

						pcall(function()
							sound2:Destroy()
						end)

						if part2 and part2.Parent then
							pcall(function()
								part2:Destroy()
							end)
						end
					end)
				end

				local function fn54(arg)
					if not arg:IsA("Sound") then
						return
					end

					if string.lower(arg.Name) == "ragdollhit" then
						arg.Played:Connect(function()
							if not flag14 then
								return
							end

							pcall(function()
								arg.Volume = 0
							end)

							pcall(function()
								arg:Stop()
							end)

							local parent = arg.Parent
							local isBasePart = parent and parent:IsA("BasePart")
							local vector = Vector3.zero

							if isBasePart then
								vector = parent.Position
							end

							fn53(vector, tbl10[str6])
						end)
					end
				end

				local function fn55(arg)
					for _, descendant in pairs(arg:GetDescendants()) do
						if descendant:IsA("Sound") and string.lower(descendant.Name) == "ragdollhit" then
							fn54(descendant)
						end
					end
				end

				pcall(function()
					fn55(Workspace)
					fn55(SoundService)
				end)

				Workspace.DescendantAdded:Connect(function(descendant)
					if descendant:IsA("Sound") then
						fn54(descendant)
					end

					if flag15 or flag17 then
						if string.lower(descendant.Name):find("blackholekick", 1, true) then
							task.wait(0.01)
							local position

							if descendant:IsA("BasePart") then
								position = descendant.Position
							elseif descendant:IsA("Model") and descendant.PrimaryPart then
								position = descendant.PrimaryPart.Position
							else
								position = nil

								if descendant:IsA("Model") then
									local basePart = descendant:FindFirstChildWhichIsA("BasePart", true)
									position = nil

									if basePart then
										position = basePart.Position
									end
								end
							end

							if not position and descendant.Parent and descendant.Parent:IsA("BasePart") then
								position = descendant.Parent.Position
							end

							if flag15 and position then
								fn53(position, tbl10[str7])
							end

							if flag17 then
								local v48 = nil

								if position then
									local huge = math.huge
									v48 = nil

									for _, player in ipairs(Players:GetPlayers()) do
										local character = player.Character
										character = character and character:FindFirstChild("HumanoidRootPart")

										if character then
											local magnitude = (character.Position - position).Magnitude

											if magnitude < huge and magnitude < 60 then
												huge = magnitude
												v48 = player
											end
										end
									end
								end

								if v48 then
									if not wraithKickSeen then
										wraithKickSeen = {}
									end

									local n32 = wraithKickSeen[v48.Name] or 0

									if tick() - n32 > 1 then
										wraithKickSeen[v48.Name] = tick()
										fn10("Kick Detected", v48.Name .. " kicked")
									end
								end
							end
						end
					end
				end)

				SoundService.DescendantAdded:Connect(function(descendant)
					if descendant:IsA("Sound") then
						fn54(descendant)
					end
				end)

				local n32 = 0

				Workspace.DescendantAdded:Connect(function(descendant)
					if not flag16 then
						return
					end
					local v48 = string.lower(descendant.Name)

					if flag16 and (v48 == "grabparts" or v48 == "grabpart" or v48:find("grabparts", 1, true)) then
						local position

						if descendant:IsA("BasePart") then
							position = descendant.Position
						elseif descendant:IsA("Model") then
							position = descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart", true)
							position = position and position.Position
						end

						local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

						if position and humanoidRootPart and (position - humanoidRootPart.Position).Magnitude <= 30 and tick() - n32 > 0.25 then
							n32 = tick()
							fn53(nil, tbl10[str8])
						end
					end
				end)

				v35:AddLabel("Ragdoll Sound"):AddToggle({
					Default = false,
					Flag = "RagdollSound",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("RagdollSound") or "RagdollSound") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg
					end,
				})

				v35:AddLabel("Kick Sound"):AddToggle({
					Default = false,
					Flag = "KickSound",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("KickSound") or "KickSound") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg
					end,
				})

				v35:AddLabel("Grab Sound"):AddToggle({
					Default = false,
					Flag = "GrabSound",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("GrabSound") or "GrabSound") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag16 = arg
					end,
				})

				v35:AddLabel("Ragdoll Sound"):AddDropdown({
					Values = { "Skeet", "Fatality", "Bell", "Click", "UwU", "Neverlose", "Hitmarker" },
					Default = "Skeet",
					Flag = "RagdollSoundSelect",
					Callback = function(arg)
						str6 = arg
					end,
				})

				v35:AddLabel("Kick Sound"):AddDropdown({
					Values = { "Skeet", "Fatality", "Bell", "Click", "UwU", "Neverlose", "Hitmarker" },
					Default = "Fatality",
					Flag = "KickSoundSelect",
					Callback = function(arg)
						str7 = arg
					end,
				})

				v35:AddLabel("Grab Sound"):AddDropdown({
					Values = { "Skeet", "Fatality", "Bell", "Click", "UwU", "Neverlose", "Hitmarker" },
					Default = "Hitmarker",
					Flag = "GrabSoundSelect",
					Callback = function(arg)
						str8 = arg
					end,
				})

				v35:AddLabel("Volume"):AddSlider({
					Min = 1,
					Max = 50,
					Default = 18,
					Rounding = 0,
					Flag = "SoundVolume",
					Callback = function(arg)
						volume = arg / 10
					end,
				})

				v35:AddLabel("Notify on Kick"):AddToggle({
					Default = false,
					Flag = "KickNotify",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("KickNotify") or "KickNotify") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag17 = arg
					end,
				})
			end

			flag8 = flag8 or false

			do
				local thread2 = nil
				local n32 = 5000

				v36:AddLabel("Packet Lag Strength"):AddSlider({
					Min = 10,
					Max = 10000,
					Default = 5000,
					Rounding = 0,
					Flag = "WR51",
					Callback = function(arg)
						n32 = arg
					end,
				})

				v36:AddLabel("Packet Lag (stealth)"):AddToggle({
					Flag = "WR50",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR50") or "WR50") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag8 = arg
						fn40()

						if thread2 then
							pcall(task.cancel, thread2)
							thread2 = nil
						end

						if not arg then
							return
						end

						thread2 = task.spawn(function()
							local grabEvents2 = ReplicatedStorage_:WaitForChild("GrabEvents")
							local extendGrabLine = grabEvents2:WaitForChild("ExtendGrabLine")

							while flag8 do
								pcall(function()
									extendGrabLine:FireServer(string.rep("Balls Balls Balls Balls", n32))
								end)

								pcall(function()
									local createGrabLine = grabEvents2:FindFirstChild("CreateGrabLine")

									if createGrabLine then
										local spawnLocation = Workspace:FindFirstChild("SpawnLocation") or localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

										if spawnLocation then
											for i = 1, 25 do
												local random = math.random
												createGrabLine:FireServer(spawnLocation, CFrame.new(math.random(-2e9, 2e9), 0, random(-2e9, 2e9)))
											end
										end
									end
								end)

								task.wait(0.8)
							end
						end)
					end,
				})
			end

			do
				local flag14 = false
				local tbl10 = {}
				local n32 = 5120
				local n33 = 30
				local n34 = 0

				local function fn52(arg)
					for _, v48 in ipairs(arg) do
						if typeof(v48) == "Instance" then
							if v48:IsA("Player") then
								return v48
							end

							if v48:IsA("Model") then
								local playerFromCharacter = Players:GetPlayerFromCharacter(v48)
								if playerFromCharacter then
									return playerFromCharacter
								end
							end

							if v48:IsA("BasePart") or v48:IsA("Tool") then
								local model = v48:FindFirstAncestorOfClass("Model")

								if model then
									local playerFromCharacter = Players:GetPlayerFromCharacter(model)
									if playerFromCharacter then
										return playerFromCharacter
									end
									continue
								end
							end
						end
					end

					return localPlayer
				end

				local function fn53(arg)
					if #arg <= 80 then
						return arg
					end
					return arg:sub(1, 80) .. "... (+" .. #arg - 80 .. " chars)"
				end

				local function fn54(arg)
					local tbl11 = {}
					local n35 = 0

					for _, v48 in pairs(arg) do
						n35 += 1

						if n35 <= 5 then
							table.insert(tbl11, tostring(v48))
						end
					end

					return "table[" .. n35 .. "] { " .. table.concat(tbl11, ", ") .. " ... }"
				end

				local function fn55(arg)
					local tbl11 = {}
					local tbl12 = {}

					for _, v48 in ipairs(arg) do
						local str6

						if typeof(v48) == "string" then
							str6 = "str:" .. fn53(v48)
						elseif typeof(v48) == "Instance" then
							str6 = "inst:" .. v48.ClassName .. "(" .. v48.Name .. ")"
						elseif typeof(v48) == "table" then
							str6 = "tbl:" .. fn54(v48)
						else
							str6 = typeof(v48) .. ":" .. tostring(v48)
						end

						tbl11[str6] = (tbl11[str6] or 0) + 1
					end

					for k, v48 in pairs(tbl11) do
						if v48 > 1 then
							table.insert(tbl12, k .. " x" .. v48)
						else
							table.insert(tbl12, k)
						end
					end

					return tbl12
				end

				local function fn56(arg, arg2, ...)
					if not flag14 then
						return
					end
					local tbl11 = { ... }
					local n35 = 0

					for _, v48 in ipairs(tbl11) do
						if typeof(v48) == "string" then
							n35 += #v48
						end
					end

					if n35 < n32 then
						return
					end

					if tick() - n34 < n33 then
						return
					end
					n34 = tick()
					local v48 = fn52(tbl11)
					local displayName = v48.DisplayName
					local str6

					if v48 == localPlayer then
						str6 = displayName .. " (You)"
					else
						str6 = displayName
					end

					local v49 = fn55(tbl11)
					fn10(string.format("[%s] %s", arg, arg2), string.format("Player: %s | Size: %.3f MB | %s", str6, n35 / 1048576, table.concat(v49, " ; ")))
				end

				local fn57 = nil

				fn57 = function(arg)
					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("RemoteEvent") and child.Name == "RelayClientAnimation" and child.Parent and child.Parent.Name == "BlobmanAnimations" then
							table.insert(tbl10, child.OnClientEvent:Connect(function(...)
								fn56("Blob", child.Parent.Parent.Name, ...)
							end))
						end

						fn57(child)
					end
				end

				local fn58 = nil

				fn58 = function(arg)
					table.insert(tbl10, arg.ChildAdded:Connect(function(child)
						if not flag14 then
							return
						end
						fn57(child)
						fn58(child)
					end))

					for _, child in ipairs(arg:GetChildren()) do
						fn58(child)
					end
				end

				local function fn59()
					if #tbl10 > 0 then
						return
					end

					pcall(function()
						table.insert(tbl10, ReplicatedStorage_:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine").OnClientEvent:Connect(function(...)
							fn56("Grab", "ExtendGrabLine", ...)
						end))
					end)

					pcall(function()
						fn57(Workspace)
						fn58(Workspace)
					end)
				end

				local function fn60()
					for _, v48 in ipairs(tbl10) do
						pcall(function()
							v48:Disconnect()
						end)
					end

					tbl10 = {}
				end

				v36:AddLabel("Packet Lag Detector"):AddToggle({
					Default = false,
					Flag = "PacketLagDetector",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("PacketLagDetector") or "PacketLagDetector") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg

						if arg then
							fn59()
							fn10("wraith", "packet detector active")
						else
							fn60()
							fn10("wraith", "packet detector off")
						end
					end,
				})
			end

			flag9 = flag9 or false

			do
				local thread2 = nil
				local n32 = 120

				v36:AddLabel("Lag Intensity"):AddSlider({
					Flag = "LagLineIntensity",
					Min = 10,
					Max = 300,
					Default = 120,
					Rounding = 0,
					Callback = function(arg)
						n32 = arg
					end,
				})

				v36:AddLabel("Server Lag Line"):AddToggle({
					Flag = "WR52",
					Default = false,
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WR52") or "WR52") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag9 = arg
						fn40()

						if thread2 then
							pcall(task.cancel, thread2)
							thread2 = nil
						end

						if not arg then
							return
						end

						thread2 = task.spawn(function()
							while flag9 do
								pcall(function()
									local grabEvents2 = ReplicatedStorage_:WaitForChild("GrabEvents")
									local createGrabLine = grabEvents2:WaitForChild("CreateGrabLine")
									local destroyGrabLine = grabEvents2:FindFirstChild("DestroyGrabLine")
									local v48, v49, v50 = fn11()

									if v48 then
										if not v48:FindFirstChild("Torso") then
											v48:FindFirstChild("UpperTorso")
										end
									end

									local clamp = math.clamp
									local floor = math.floor
									local v51 = n32
									local n33

									if n32 then
										n33 = v51
									else
										n33 = 120
									end

									local v52 = clamp(floor(n33 / 4), 3, 60)
									local grabEvents3 = ReplicatedStorage_:FindFirstChild("GrabEvents")
									local setNetworkOwner = grabEvents3 and grabEvents3:FindFirstChild("SetNetworkOwner")
									local n34 = v52 * 3
									local now2 = os.clock()
									local n35 = 0

									for _, player in ipairs(Players:GetPlayers()) do
										if flag9 then
											if player ~= localPlayer and player.Character then
												local torso = player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso") or player.Character:FindFirstChild("HumanoidRootPart")

												if torso then
													for i = 1, v52 do
														if not (not flag9 or n35 >= n34) then
															n35 += 1

															pcall(function()
																createGrabLine:FireServer(torso, torso.CFrame, torso.Position, false)

																if destroyGrabLine then
																	destroyGrabLine:FireServer(torso)
																end
															end)

															if os.clock() - now2 > 0.002 then
																now2 = os.clock()
																RunService.Heartbeat:Wait()

																if setNetworkOwner and v50 and v50.Parent then
																	pcall(function()
																		setNetworkOwner:FireServer(v50, v50.CFrame)
																	end)
																end
															end

															continue
														end

														break
													end

													if not (n35 >= n34) then
														continue
													end
												else
													continue
												end
											else
												continue
											end
										end

										break
									end
								end)

								local v48, v49, v50 = fn11()

								if v50 then
									pcall(function()
										ReplicatedStorage_.GrabEvents.SetNetworkOwner:FireServer(v50, v50.CFrame)
										ReplicatedStorage_.GrabEvents.DestroyGrabLine:FireServer(v50)
									end)
								end

								task.wait(0.5)
							end
						end)
					end,
				})
			end

			do
				local flag14 = false
				local v48 = nil
				local n32 = 3
				local n33 = 0

				local function fn52()
					n33 += 1
					local v49 = n33

					if v48 then
						pcall(function()
							v48:Stop()
						end)

						v48 = nil
					end

					local humanoid = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
					if not humanoid then
						return
					end
					local animator = humanoid:FindFirstChildOfClass("Animator")

					if not animator then
						animator = Instance.new("Animator")
						animator.Parent = humanoid
					end

					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://168268306"
					v48 = animator:LoadAnimation(animation)
					v48.Priority = Enum.AnimationPriority.Action
					v48.Looped = true
					v48:Play(0.15, 1, n32)

					task.spawn(function()
						local v50 = v48

						while flag14 and v49 == n33 and v50 do
							task.wait(0.3)

							if v50 and not v50.IsPlaying then
								pcall(function()
									v50:Play(0.15, 1, n32)
								end)
							end

							pcall(function()
								if v50.Speed ~= n32 then
									v50:AdjustSpeed(n32)
								end
							end)
						end
					end)
				end

				local function fn53()
					n33 += 1
					flag14 = false

					if v48 then
						pcall(function()
							v48:Stop(0.15)
						end)

						v48 = nil
					end
				end

				v38:AddLabel("Jerk Off"):AddToggle({
					Default = false,
					Flag = "JerkOff",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("JerkOff") or "JerkOff") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag14 = arg

						if arg then
							fn52()
						else
							fn53()
						end
					end,
				})

				v38:AddLabel("Jerk Off Speed"):AddSlider({
					Min = 1,
					Max = 8,
					Default = 3,
					Rounding = 1,
					Flag = "JerkOffSpeed",
					Callback = function(arg)
						n32 = arg

						if v48 then
							pcall(function()
								v48:AdjustSpeed(arg)
							end)
						end
					end,
				})
			end

			local flag14 = false

			v38:AddLabel("Ragdoll Player"):AddToggle({
				Default = false,
				Flag = "RagdollPlayer",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("RagdollPlayer") or "RagdollPlayer") .. ": " .. (arg and "on" or "off"))
						end
					end)

					flag14 = arg

					task.spawn(function()
						local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart then
							return
						end

						if arg then
							pcall(function()
								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 3)
							end)
						else
							pcall(function()
								ReplicatedStorage_.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0)
							end)

							pcall(function()
								local humanoid = character:FindFirstChildOfClass("Humanoid")

								if humanoid then
									humanoid.PlatformStand = false
									humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
								end
							end)
						end
					end)
				end,
			})

			do
				local flag15 = false
				local connection2 = nil

				utilGroup:AddLabel("Fake Lag"):AddToggle({
					Default = false,
					Flag = "FakeLag",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("FakeLag") or "FakeLag") .. ": " .. (arg and "on" or "off"))
							end
						end)

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						flag15 = arg

						if arg then
							connection2 = RunService.Heartbeat:Connect(function()
								local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart then
									return
								end

								if math.random(1, 5) == 1 then
									humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(math.random(-6, 6) / 10, 0, math.random(-6, 6) / 10)
								end

								if math.random(1, 60) == 1 then
									humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(math.random(-12, 12) / 10, 0, math.random(-12, 12) / 10)
								end
							end)
						end
					end,
				})
			end

			do
				local flag15 = false

				local function fn52(canCollide)
					pcall(function()
						for _, descendant in ipairs(Workspace:GetDescendants()) do
							local str6 = descendant.Name:lower()

							if str6:find("ocean") or str6:find("water") then
								if descendant:IsA("BasePart") then
									descendant.CanCollide = canCollide
								elseif descendant:IsA("Model") or descendant:IsA("Folder") then
									for _, descendant2 in pairs(descendant:GetDescendants()) do
										if descendant2:IsA("BasePart") then
											descendant2.CanCollide = canCollide
										end
									end
								end
							end
						end
					end)
				end

				utilGroup:AddLabel("Water Walk"):AddToggle({
					Default = false,
					Flag = "WaterWalk",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("WaterWalk") or "WaterWalk") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg
						fn52(arg)
					end,
				})
			end

			do
				local flag15 = false
				pencilNext = 0
				local thread2 = nil
				local connection2 = nil

				local function fn52()
					local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					if not v48 then
						return nil
					end
					local toolPencil = v48:FindFirstChild("ToolPencil")
					if toolPencil then
						return toolPencil
					end
					local v49, v50, v51 = fn11()

					if v51 then
						pcall(function()
							ReplicatedStorage_.MenuToys.SpawnToyRemoteFunction:InvokeServer("ToolPencil", CFrame.new(v51.CFrame.Position) + Vector3.new(0, 0, 15), Vector3.zero)
						end)
					end

					return nil
				end

				local function fn53()
					pcall(function()
						local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
						if not v48 then
							return
						end
						local toolPencil = v48:FindFirstChild("ToolPencil")

						if not toolPencil then
							toolPencil = fn52()
							if not toolPencil then
								return
							end
						end

						local character = localPlayer.Character
						if not character then
							return
						end
						local torso = character:FindFirstChild("Torso")
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if not (torso and humanoidRootPart) then
							return
						end
						local stickyPart = toolPencil:FindFirstChild("StickyPart")
						local soundPart = toolPencil:FindFirstChild("SoundPart")

						if stickyPart then
							local stickyWeld = stickyPart:FindFirstChild("StickyWeld")

							if not stickyWeld or stickyWeld.Part1 ~= torso then
								if ((soundPart and soundPart.CFrame.Position or Vector3.zero) - humanoidRootPart.CFrame.Position).Magnitude > 20 then
									pcall(function()
										ReplicatedStorage_.MenuToys.DestroyToy:FireServer(toolPencil)
									end)
								else
									pcall(function()
										ReplicatedStorage_.PlayerEvents.StickyPartEvent:FireServer(stickyPart, torso, CFrame.new(0, -1, 0) * CFrame.Angles(0, 3.1415926535897931, 0))
									end)

									for _, child in pairs(toolPencil:GetChildren()) do
										if child:IsA("BasePart") then
											child.CanQuery = false
											child.CanCollide = false
											child.CanTouch = false
										end
									end
								end
							end
						end
					end)
				end

				utilGroup:AddLabel("pencil"):AddToggle({
					Default = false,
					Flag = "Pencil",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("Pencil") or "Pencil") .. ": " .. (arg and "on" or "off"))
							end
						end)

						flag15 = arg

						if arg then
							if connection2 then
								pcall(function()
									connection2:Disconnect()
								end)
							end

							connection2 = localPlayer.CharacterAdded:Connect(function()
								task.wait(1)

								if flag15 then
									fn53()
								end
							end)

							thread2 = task.spawn(function()
								local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

								if not (v48 and v48:FindFirstChild("ToolPencil")) then
									fn52()
									local now2 = tick()
									local v49

									while true do
										task.wait(0.1)
										v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
										if not (v49 and v49:FindFirstChild("ToolPencil") or tick() - now2 > 4 or not flag15) then
											continue
										end
										break
									end

									local flag16 = flag15

									if flag15 then
										flag16 = not (v49 and v49:FindFirstChild("ToolPencil"))
									end

									if flag16 then
										fn52()
										local now3 = tick()

										while true do
											task.wait(0.1)
											local v50 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
											if not (v50 and v50:FindFirstChild("ToolPencil") or tick() - now3 > 4 or not flag15) then
												continue
											end
											break
										end
									end
								end

								for i = 1, 6 do
									if flag15 then
										fn53()
										task.wait(0.05)
										continue
									end

									break
								end

								if flag15 then
									fn10("wraith", "pencil ready")
								end

								local n32 = 0

								while flag15 do
									local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

									if not (v49 and v49:FindFirstChild("ToolPencil")) then
										n32 += 1

										if n32 >= 2 then
											fn52()
											task.wait(0.6)
											n32 = 0
										end
									else
										fn53()
										n32 = 0
									end

									task.wait(0.25)
								end
							end)
						else
							if thread2 then
								pcall(function()
									task.cancel(thread2)
								end)

								thread2 = nil
							end

							if connection2 then
								pcall(function()
									connection2:Disconnect()
								end)

								connection2 = nil
							end

							local v48 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

							if v48 then
								local toolPencil = v48:FindFirstChild("ToolPencil")

								if toolPencil then
									pcall(function()
										ReplicatedStorage_.MenuToys.DestroyToy:FireServer(toolPencil)
									end)
								end
							end
						end
					end,
				})
			end

			do
				local v48 = v19:AddSection({ Name = "LIMBS", Position = "left" })
				local v49 = v19:AddSection({ Name = "ACCESSORIES", Position = "right" })
				local v50 = v19:AddSection({ Name = "COLORS", Position = "left" })
				local v51 = v19:AddSection({ Name = "EXTRA", Position = "right" })
				local tbl10 = {}
				local tbl11 = {}

				local function fn52(limbRemoved)
					pcall(function()
						local v52 = fn11()
						if not v52 then
							return
						end
						local v53 = v52:FindFirstChild(limbRemoved)
						if not v53 or tbl10[v53] then
							return
						end
						local v54 = nil

						for _, descendant in ipairs(v52:GetDescendants()) do
							if descendant:IsA("Motor6D") and descendant.Part1 == v53 then
								v54 = descendant
								break
							else
								v54 = nil
							end
						end

						if v54 then
							v54.Parent = nil
						end

						pcall(function()
							v53.Parent = nil
						end)

						tbl10[v53] = v54
						fn10("wraith", "limb removed: " .. limbRemoved)
					end)
				end

				local function fn53()
					pcall(function()
						local v52 = fn11()
						if not v52 then
							return
						end

						for k, v53 in pairs(tbl10) do
							if k and not k.Parent then
								k.Parent = v52
							end

							if v53 and v53.Part0 and v53.Part0.Parent then
								v53.Parent = v53.Part0
							end
						end

						tbl10 = {}
						fn10("wraith", "all limbs restored")
					end)
				end

				local function fn54(arg)
					pcall(function()
						local v52 = fn11()
						if not v52 then
							return
						end
						local n32 = 0

						for _, descendant in ipairs(v52:GetDescendants()) do
							if arg == "all" then
								if descendant:IsA("Accessory") or descendant:IsA("Hat") then
									tbl11[descendant] = true

									pcall(function()
										descendant.Parent = nil
									end)

									n32 += 1
								elseif descendant:IsA("Tool") then
									tbl11[descendant] = true

									pcall(function()
										descendant.Parent = nil
									end)

									n32 += 1
								end
							elseif arg == "hats" then
								if descendant:IsA("Accessory") then
									tbl11[descendant] = true

									pcall(function()
										descendant.Parent = nil
									end)

									n32 += 1
								elseif descendant:IsA("Hat") then
									tbl11[descendant] = true

									pcall(function()
										descendant.Parent = nil
									end)

									n32 += 1
								end
							elseif arg == "tools" then
								if descendant:IsA("Tool") then
									tbl11[descendant] = true

									pcall(function()
										descendant.Parent = nil
									end)

									n32 += 1
								end
							elseif arg == "face" then
								if descendant:IsA("Decal") and descendant.Parent then
									if descendant.Parent.Name == "Head" then
										tbl11[descendant] = true

										pcall(function()
											descendant.Parent = nil
										end)

										n32 += 1
									end
								end
							end
						end

						fn10("wraith", "removed: " .. tostring(n32))
					end)
				end

				local function fn55()
					pcall(function()
						local v52 = fn11()
						if not v52 then
							return
						end

						for k in pairs(tbl11) do
							if k and not k.Parent then
								pcall(function()
									k.Parent = v52
								end)
							end
						end

						tbl11 = {}
						fn10("wraith", "accessories restored")
					end)
				end

				v48:AddLabel("Limbs")

				v48:AddButton({
					Name = "Remove ALL Limbs",
					Callback = function()
						for _, v52 in ipairs({ "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
							fn52(v52)
						end
					end,
				})

				v48:AddButton({
					Name = "Remove Left Arm",
					Callback = function()
						fn52("Left Arm")
					end,
				})

				v48:AddButton({
					Name = "Remove Right Arm",
					Callback = function()
						fn52("Right Arm")
					end,
				})

				v48:AddButton({
					Name = "Remove Left Leg",
					Callback = function()
						fn52("Left Leg")
					end,
				})

				v48:AddButton({
					Name = "Remove Right Leg",
					Callback = function()
						fn52("Right Leg")
					end,
				})

				v48:AddButton({
					Name = "Restore All Limbs",
					Callback = function()
						fn53()
					end,
				})

				v49:AddLabel("Accessories")

				v49:AddButton({
					Name = "Remove ALL Accessories",
					Callback = function()
						fn54("all")
					end,
				})

				v49:AddButton({
					Name = "Remove Hats",
					Callback = function()
						fn54("hats")
					end,
				})

				v49:AddButton({
					Name = "Remove Face",
					Callback = function()
						fn54("face")
					end,
				})

				v49:AddButton({
					Name = "Restore All Accessories",
					Callback = function()
						fn55()
					end,
				})

				local function fn56(arg, torsoColor3)
					pcall(function()
						local character = localPlayer.Character
						if not character then
							return
						end
						local bodyColors = character:FindFirstChildOfClass("BodyColors")

						if bodyColors then
							if arg == "Torso" then
								bodyColors.TorsoColor3 = torsoColor3
							elseif arg == "Head" then
								bodyColors.HeadColor3 = torsoColor3
							elseif arg == "Left Arm" then
								bodyColors.LeftArmColor3 = torsoColor3
							elseif arg == "Right Arm" then
								bodyColors.RightArmColor3 = torsoColor3
							elseif arg == "Left Leg" then
								bodyColors.LeftLegColor3 = torsoColor3
							else
								bodyColors.RightLegColor3 = torsoColor3
							end
						end

						local v52 = character:FindFirstChild(arg)

						if v52 and v52:IsA("BasePart") then
							v52.Color = torsoColor3
						end
					end)
				end

				local function fn57(arg, arg2)
					v50:AddLabel(arg):AddColorPicker({
						Default = Color3.fromRGB(255, 255, 255),
						Callback = function(arg3)
							fn56(arg2, arg3)
						end,
					})
				end

				fn57("Torso", "Torso")
				fn57("Head", "Head")
				fn57("Left Arm", "Left Arm")
				fn57("Right Arm", "Right Arm")
				fn57("Left Leg", "Left Leg")
				fn57("Right Leg", "Right Leg")
				local tbl12 = {}

				local function fn58(arg, transparency)
					pcall(function()
						local character = localPlayer.Character
						if not character then
							return
						end
						local v52 = character:FindFirstChild(arg)

						if v52 and v52:IsA("BasePart") then
							if tbl12[v52] == nil then
								tbl12[v52] = v52.Transparency
							end

							v52.Transparency = transparency
						end
					end)
				end

				v51:AddLabel("Head Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0,
					Rounding = 1,
					Flag = "CharTranspHead",
					Callback = function(arg)
						fn58("Head", arg)
					end,
				})

				v51:AddLabel("Torso Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0,
					Rounding = 1,
					Flag = "CharTranspTorso",
					Callback = function(arg)
						fn58("Torso", arg)
					end,
				})

				v51:AddLabel("Left Arm Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0,
					Rounding = 1,
					Flag = "CharTranspLArm",
					Callback = function(arg)
						fn58("Left Arm", arg)
					end,
				})

				v51:AddLabel("Right Arm Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0,
					Rounding = 1,
					Flag = "CharTranspRArm",
					Callback = function(arg)
						fn58("Right Arm", arg)
					end,
				})

				v51:AddLabel("Left Leg Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0,
					Rounding = 1,
					Flag = "CharTranspLLeg",
					Callback = function(arg)
						fn58("Left Leg", arg)
					end,
				})

				v51:AddLabel("Right Leg Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0,
					Rounding = 1,
					Flag = "CharTranspRLeg",
					Callback = function(arg)
						fn58("Right Leg", arg)
					end,
				})

				v51:AddButton({
					Name = "Reset Transparencies",
					Callback = function()
						pcall(function()
							if not localPlayer.Character then
								return
							end

							for k, v52 in pairs(tbl12) do
								if k and k.Parent then
									k.Transparency = v52
								end
							end

							tbl12 = {}
						end)
					end,
				})
			end

			do
				local v48 = v20:AddSection({ Name = "THEME", Position = "left" })
				local v49 = v20:AddSection({ Name = "WINDOW", Position = "right" })
				local v50 = v20:AddSection({ Name = "BACKGROUND", Position = "left" })
				local v51 = v20:AddSection({ Name = "NOTIFY", Position = "right" })
				local v52 = v20:AddSection({ Name = "CONFIGS & THEMES", Position = "left" })
				local color2 = Color3.fromRGB(96, 76, 214)
				local color3 = Color3.fromRGB(8, 8, 13)
				local color4 = Color3.fromRGB(255, 255, 255)
				local color5 = Color3.fromRGB(25, 27, 33)

				local function fn52(arg, arg2)
					if type(arg) ~= "userdata" or type(arg2) ~= "userdata" then
						return arg == arg2
					end
					return math.abs(arg.R - arg2.R) < 0.02 and math.abs(arg.G - arg2.G) < 0.02 and math.abs(arg.B - arg2.B) < 0.02
				end

				local function fn53(arg, color6)
					pcall(function()
						if type(color6) ~= "userdata" then
							return
						end

						for _, descendant in ipairs(lib.ScreenGui:GetDescendants()) do
							if descendant:IsA("UIStroke") and fn52(descendant.Color, arg) then
								descendant.Color = color6
							end

							if descendant:IsA("UIGradient") then
								local keypoints = descendant.Color and descendant.Color.Keypoints

								if keypoints and #keypoints > 0 and fn52(keypoints[1].Value, arg) then
									descendant.Color = ColorSequence.new(color6)
								end
							end

							if descendant:IsA("GuiObject") then
								if fn52(descendant.BackgroundColor3, arg) then
									descendant.BackgroundColor3 = color6
								end

								if fn52(descendant.TextColor3, arg) then
									descendant.TextColor3 = color6
								end

								if fn52(descendant.BorderColor3, arg) then
									descendant.BorderColor3 = color6
								end

								if fn52(descendant.ImageColor3, arg) then
									descendant.ImageColor3 = color6
								end
							end
						end
					end)
				end

				local function fn54(arg)
					local function fn55()
						for _, v53 in ipairs(arg) do
							fn53(v53[1], v53[2])
						end
					end

					fn55()
				end

				local function fn55(textColor3)
					local function fn56()
						pcall(function()
							for _, descendant in ipairs(lib.ScreenGui:GetDescendants()) do
								if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
									descendant.TextColor3 = textColor3
								end
							end
						end)
					end

					fn56()

					pcall(function()
						wraithThemeWatermark(color2, color5, textColor3)
					end)

					color4 = textColor3
				end

				wraithThemeLogo = function(imageColor3)
					pcall(function()
						if not imageColor3 then
							return
						end

						if math.abs(imageColor3.R - 0.37647058823529411) < 0.02 and math.abs(imageColor3.G - 0.29803921568627451) < 0.02 and math.abs(imageColor3.B - 0.83921568627450982) < 0.02 then
							imageColor3 = Color3.fromRGB(255, 255, 255)
						end

						for _, descendant in ipairs(lib.ScreenGui:GetDescendants()) do
							if descendant:IsA("ImageLabel") and descendant.Image == lib.GlobalLogo then
								descendant.ImageColor3 = imageColor3
							end
						end

						if v16 and v16.NameLabel and v16.NameLabel.Parent then
							v16.NameLabel.TextColor3 = imageColor3
						end
					end)
				end

				wraithThemeWatermark = function(color6, backgroundColor3, textColor3)
					pcall(function()
						local wraithHud3 = CoreGui:FindFirstChild("WraithHud3")
						wraithHud3 = wraithHud3 and wraithHud3:FindFirstChild("Hud")
						if not wraithHud3 then
							return
						end

						if backgroundColor3 then
							wraithHud3.BackgroundColor3 = backgroundColor3
						end

						local uiStroke = wraithHud3:FindFirstChildOfClass("UIStroke")

						if uiStroke and color6 then
							uiStroke.Color = color6
						end

						local uiGradient = wraithHud3:FindFirstChildOfClass("UIGradient")

						if uiGradient and backgroundColor3 then
							local new = ColorSequenceKeypoint.new
							uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, backgroundColor3:Lerp(Color3.new(1, 1, 1), 0.1)), new(1, backgroundColor3) })
						end

						local flag15 = color6 and math.abs(color6.R - 0.37647058823529411) < 0.02 and math.abs(color6.G - 0.29803921568627451) < 0.02 and math.abs(color6.B - 0.83921568627450982) < 0.02

						for _, descendant in ipairs(wraithHud3:GetDescendants()) do
							if descendant:IsA("TextLabel") and textColor3 then
								descendant.TextColor3 = textColor3
							elseif descendant:IsA("Frame") and color6 then
								descendant.BackgroundColor3 = color6
							elseif descendant:IsA("ImageLabel") and color6 and descendant.Name ~= "BrandIcon" then
								descendant.ImageColor3 = flag15 and Color3.fromRGB(190, 199, 255) or color6
							end
						end
					end)
				end

				local function fn56(backgroundColor3)
					local function fn57()
						pcall(function()
							local v53 = color5

							for _, descendant in ipairs(lib.ScreenGui:GetDescendants()) do
								if descendant:IsA("Frame") or descendant:IsA("ScrollingFrame") then
									if descendant.BackgroundTransparency < 1 then
										local backgroundColor32 = descendant.BackgroundColor3

										if fn52(backgroundColor32, v53) or fn52(backgroundColor32, Color3.fromRGB(20, 22, 27)) or fn52(backgroundColor32, Color3.fromRGB(25, 27, 33)) or fn52(backgroundColor32, Color3.fromRGB(10, 13, 21)) or fn52(backgroundColor32, Color3.fromRGB(45, 48, 58)) or fn52(backgroundColor32, color3) then
											descendant.BackgroundColor3 = backgroundColor3
										end
									end
								end
							end
						end)
					end

					fn57()

					pcall(function()
						wraithThemeWatermark(color2, backgroundColor3, color4)
					end)

					color5 = backgroundColor3
				end

				local function fn57(accentColor, mainColor)
					pcall(function()
						wraithThemeWatermark(accentColor, mainColor, color4)
					end)

					pcall(function()
						wraithThemeLogo(accentColor)
					end)

					pcall(function()
						if type(accentColor) ~= "userdata" or type(mainColor) ~= "userdata" then
							return
						end
					end)

					local v53 = fn54
					local tbl10 = {}
					local tbl11 = { color2, accentColor }
					local tbl12 = { color3, mainColor }
					local tbl13 = { Color3.fromRGB(96, 76, 214), accentColor }
					local tbl14 = { Color3.fromRGB(138, 116, 255), accentColor }
					local tbl15 = { Color3.fromRGB(190, 180, 255), accentColor }
					local tbl16 = { Color3.fromRGB(8, 8, 13), mainColor }
					local tbl17 = { Color3.fromRGB(25, 27, 33), mainColor }
					local tbl18 = { Color3.fromRGB(10, 13, 21), mainColor }
					tbl10[1] = tbl11
					tbl10[2] = tbl12
					tbl10[3] = tbl13
					tbl10[4] = tbl14
					tbl10[5] = tbl15
					tbl10[6] = tbl16
					tbl10[7] = tbl17
					tbl10[8] = tbl18
					v53(tbl10)
					color2 = accentColor
					color3 = mainColor
					lib.AccentColor = accentColor
					lib.MainColor = mainColor

					pcall(function()
						if v16 and v16.Root and v16.Root.Parent then
							v16.Root.BackgroundColor3 = mainColor
						end

						if v16 and v16.NameLabel and v16.NameLabel.Parent then
							v16.NameLabel.TextColor3 = accentColor
						end
					end)
				end

				local tbl10 = {
					["Default (purple)"] = { acc = Color3.fromRGB(96, 76, 214), main = Color3.fromRGB(8, 8, 13) },
					["Blood Red"] = { acc = Color3.fromRGB(220, 40, 40), main = Color3.fromRGB(12, 4, 4) },
					["Cyber Blue"] = { acc = Color3.fromRGB(45, 140, 255), main = Color3.fromRGB(4, 8, 14) },
					["Midnight Purple"] = { acc = Color3.fromRGB(150, 80, 255), main = Color3.fromRGB(7, 4, 13) },
					Gold = { acc = Color3.fromRGB(255, 190, 50), main = Color3.fromRGB(11, 9, 3) },
					Emerald = { acc = Color3.fromRGB(45, 220, 125), main = Color3.fromRGB(2, 10, 6) },
					Pink = { acc = Color3.fromRGB(255, 85, 175), main = Color3.fromRGB(13, 4, 11) },
					["Mono White"] = { acc = Color3.fromRGB(235, 235, 235), main = Color3.fromRGB(30, 30, 35) },
				}

				v48:AddLabel("Preset Theme"):AddDropdown({
					Values = {
						"Default (purple)",
						"Blood Red",
						"Cyber Blue",
						"Midnight Purple",
						"Gold",
						"Emerald",
						"Pink",
						"Mono White",
					},
					Default = "Default (purple)",
					Flag = "ThemePreset",
					Callback = function(arg)
						local v53 = tbl10[arg]

						if v53 then
							fn57(v53.acc, v53.main)
						end
					end,
				})

				v48:AddLabel("Accent Color"):AddColorPicker({
					Default = color2,
					Callback = function(accentColor)
						fn53(color2, accentColor)
						fn53(Color3.fromRGB(96, 76, 214), accentColor)
						fn53(Color3.fromRGB(138, 116, 255), accentColor)
						fn53(Color3.fromRGB(190, 180, 255), accentColor)
						color2 = accentColor
						lib.AccentColor = accentColor

						pcall(function()
							if v16 and v16.NameLabel and v16.NameLabel.Parent then
								v16.NameLabel.TextColor3 = accentColor
							end
						end)
					end,
				})

				v48:AddLabel("Main Color"):AddColorPicker({
					Default = color3,
					Callback = function(mainColor)
						fn53(color3, mainColor)
						fn53(Color3.fromRGB(8, 8, 13), mainColor)
						fn53(Color3.fromRGB(25, 27, 33), mainColor)
						fn53(Color3.fromRGB(10, 13, 21), mainColor)
						color3 = mainColor
						lib.MainColor = mainColor

						pcall(function()
							if v16 and v16.Root and v16.Root.Parent then
								v16.Root.BackgroundColor3 = mainColor
							end
						end)
					end,
				})

				v48:AddLabel("Text Color"):AddColorPicker({
					Default = color4,
					Callback = function(arg)
						fn55(arg)
					end,
				})

				v48:AddLabel("Panel Color"):AddColorPicker({
					Default = color5,
					Callback = function(arg)
						fn56(arg)
					end,
				})

				v48:AddButton({
					Name = "Reset Theme Colors",
					Callback = function()
						local color6 = Color3.fromRGB
						fn57(Color3.fromRGB(96, 76, 214), color6(8, 8, 13))
						fn55(Color3.fromRGB(255, 255, 255))
						fn56(Color3.fromRGB(20, 22, 27))
					end,
				})

				local tbl11 = { W = lib.Scales.Large.X.Offset or 800, H = lib.Scales.Large.Y.Offset or 600 }

				local function fn58()
					pcall(function()
						v16:SetSize(UDim2.fromOffset(tbl11.W, tbl11.H))
					end)
				end

				local str6 = "WRAITH"

				local function fn59()
					pcall(function()
						local fontFace = nil

						for _, v53 in ipairs({ "rbxasset://fonts/families/GothamSSm.json", "rbxasset://fonts/families/Gotham.json" }) do
							local ok

							ok, fontFace = pcall(function()
								return Font.new(v53, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
							end)

							if not (ok and fontFace) then
								fontFace = nil
								continue
							end
							break
						end

						if not fontFace then
							return
						end

						for _, descendant in ipairs(lib.ScreenGui:GetDescendants()) do
							if (descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and (descendant.Text == str6 or descendant.Text == "WRAITH") then
								descendant.FontFace = fontFace
							end
						end
					end)
				end

				task.delay(1, fn59)
				task.delay(3, fn59)
				task.delay(6, fn59)

				v49:AddLabel("Window Title"):AddTextInput({
					Flag = "WinTitle",
					Default = "WRAITH",
					Callback = function(text)
						if not text or text == "" then
							return
						end

						pcall(function()
							for _, descendant in ipairs(lib.ScreenGui:GetDescendants()) do
								if descendant:IsA("TextLabel") and (descendant.Text == string.upper(str6) or descendant.Text == "WRAITH") then
									descendant.Text = text
								end

								local isTextButton = descendant:IsA("TextButton")
								local flag15

								if isTextButton then
									flag15 = descendant.Text == string.upper(str6) or descendant.Text == "WRAITH"
								else
									flag15 = isTextButton
								end

								if flag15 then
									descendant.Text = text
								end
							end

							if v16 and v16.NameLabel and v16.NameLabel.Parent then
								v16.NameLabel.Text = text
							end

							str6 = text
							fn59()
						end)
					end,
				})

				v49:AddLabel("Window Scale"):AddDropdown({
					Values = { "Small", "Mobile", "Default", "Large" },
					Default = "Large",
					Flag = "WinScale",
					Callback = function(arg)
						local default = lib.Scales[arg] or lib.Scales.Default
						tbl11.W = default.X.Offset
						tbl11.H = default.Y.Offset
						fn58()
					end,
				})

				v49:AddLabel("Window Width"):AddSlider({
					Min = 400,
					Max = 1200,
					Default = 800,
					Rounding = 0,
					Flag = "WinW",
					Callback = function(w)
						tbl11.W = w
						fn58()
					end,
				})

				v49:AddLabel("Window Height"):AddSlider({
					Min = 300,
					Max = 900,
					Default = 600,
					Rounding = 0,
					Flag = "WinH",
					Callback = function(h)
						tbl11.H = h
						fn58()
					end,
				})

				local imageLabel = nil
				local tbl12 = { ID = "", Transparency = 0.35, Zoom = 1, OffsetX = 0, OffsetY = 0, ScaleType = "Stretch" }

				local function fn60()
					pcall(function()
						if not (imageLabel and imageLabel.Parent) then
							return
						end
						local root = type(v16) == "table" and v16.Root
						root = root and imageLabel.Parent == root
						imageLabel.Image = "rbxassetid://" .. tbl12.ID
						imageLabel.ImageTransparency = tbl12.Transparency
						imageLabel.ScaleType = Enum.ScaleType[tbl12.ScaleType] or Enum.ScaleType.Stretch
						imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
						imageLabel.Position = UDim2.new(0.5, tbl12.OffsetX or 0, 0.5, tbl12.OffsetY or 0)
						imageLabel.Size = UDim2.new(1, 0, 1, 0)
						imageLabel.ZIndex = 1
						local uiScale = imageLabel:FindFirstChildOfClass("UIScale")

						if not uiScale then
							uiScale = Instance.new("UIScale")
							uiScale.Parent = imageLabel
						end

						uiScale.Scale = root and (tbl12.Zoom or 1) or 1
					end)
				end

				local function fn61()
					pcall(function()
						if imageLabel and imageLabel.Parent then
							fn60()
							return
						end
						local root = type(v16) == "table" and v16.Root
						imageLabel = Instance.new("ImageLabel")
						imageLabel.Name = "WraithBgImage"
						imageLabel.BackgroundTransparency = 1
						imageLabel.BorderSizePixel = 0
						imageLabel.ZIndex = 1
						imageLabel.Parent = root or lib.ScreenGui
						fn60()
					end)
				end

				v50:AddLabel("Image ID"):AddTextInput({
					Flag = "BgID",
					Default = "",
					Placeholder = "example: 17132521951",
					Callback = function(arg)
						local match = tostring(arg or ""):match("%d+")

						if match and #match > 3 then
							tbl12.ID = match
							fn61()
							fn10("wraith", "bg id applied: " .. match)
						end
					end,
				})

				v50:AddButton({
					Name = "Apply Background",
					Callback = function()
						fn61()
						fn10("wraith", "bg applied")
					end,
				})

				v50:AddButton({
					Name = "Remove Background",
					Callback = function()
						pcall(function()
							if imageLabel then
								imageLabel:Destroy()
								imageLabel = nil
							end
						end)
					end,
				})

				v50:AddLabel("Background Transparency"):AddSlider({
					Min = 0,
					Max = 1,
					Default = 0.35,
					Rounding = 1,
					Flag = "BgTransp",
					Callback = function(transparency)
						tbl12.Transparency = transparency
						fn60()
					end,
				})

				v50:AddLabel("Background Zoom"):AddSlider({
					Min = 0.5,
					Max = 2.5,
					Default = 1,
					Rounding = 1,
					Flag = "BgZoom",
					Callback = function(zoom)
						tbl12.Zoom = zoom
						fn60()
					end,
				})

				v50:AddLabel("Background Offset X"):AddSlider({
					Min = -400,
					Max = 400,
					Default = 0,
					Rounding = 0,
					Flag = "BgOffX",
					Callback = function(offsetX)
						tbl12.OffsetX = offsetX
						fn60()
					end,
				})

				v50:AddLabel("Background Offset Y"):AddSlider({
					Min = -300,
					Max = 300,
					Default = 0,
					Rounding = 0,
					Flag = "BgOffY",
					Callback = function(offsetY)
						tbl12.OffsetY = offsetY
						fn60()
					end,
				})

				v50:AddLabel("Scale Type"):AddDropdown({
					Values = { "Stretch", "Fit", "Slice", "Crop" },
					Default = "Stretch",
					Flag = "BgScale",
					Callback = function(scaleType)
						tbl12.ScaleType = scaleType
						fn60()
					end,
				})

				v51:AddLabel("Notify Duration"):AddSlider({
					Min = 1,
					Max = 10,
					Default = 3,
					Rounding = 0,
					Flag = "NotifDur",
					Callback = function(arg)
						wraithNotifDuration = arg
					end,
				})

				v51:AddLabel("Notifications Enabled"):AddToggle({
					Default = true,
					Flag = "NotifEnabled",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("NotifEnabled") or "NotifEnabled") .. ": " .. (arg and "on" or "off"))
							end
						end)

						wraithNotifyEnabled = arg
					end,
				})

				local str7 = "default"
				local str8 = "WraithHVH"

				local function fn62()
					pcall(function()
						if makefolder and isfolder and not isfolder("WraithHVH") then
							makefolder("WraithHVH")
						end
					end)
				end

				cfgUiReady = false

				local function fn63()
					local tbl13 = {}

					pcall(function()
						local flags = lib.Flags or {}
						local flagTypes = NeverLose.FlagTypes or {}

						-- Save only feature toggles that are ON.
						for k, flag15 in pairs(flags) do
							if k ~= "TargetPlayer" and k ~= "CfgPick" and k ~= "CfgName"
								and flagTypes[k] == "toggle" then

								local ok, result = pcall(function()
									return flag15:GetValue()
								end)

								if ok and result == true then
									tbl13[k] = true
								end
							end
						end
					end)

					return tbl13
				end
				local function fn64(arg)
					if arg ~= "config" then
						return
					end
					fn62()
					local v53 = str7
					local str9

					if str7 then
						str9 = v53
					else
						str9 = "default"
					end

					local saved = str9:gsub("[^%w_%-]", "_")
					local v54 = fn63()

					if pcall(function()
						local json = HttpService:JSONEncode(v54)
						writefile(str8 .. "/" .. saved .. ".json", json)
					end) then
						fn10("wraith", "saved: " .. saved)
					else
						fn10("wraith", "save failed: " .. saved)
					end
				end

				local function fn65(arg)
					if type(arg) ~= "table" then
						return
					end

					local flags = lib.Flags or {}
					local flagTypes = NeverLose.FlagTypes or {}

					-- Turn off currently active features that were NOT active
					-- when this config was saved.
					for k, flag in pairs(flags) do
						if flagTypes[k] == "toggle" and flag and flag.GetValue and flag.SetValue then
							local ok, current = pcall(function()
								return flag:GetValue()
							end)

							if ok and current == true and arg[k] ~= true then
								pcall(function()
									flag:SetValue(false)
								end)
							end
						end
					end

					-- Turn on only the feature toggles present in the saved config.
					for k, value in pairs(arg) do
						if flagTypes[k] == "toggle" and value == true then
							local flag = flags[k]
							if flag and flag.SetValue then
								pcall(function()
									flag:SetValue(true)
								end)
							end
						end
					end
				end
				local function fn66(arg)
					if arg ~= "config" then
						return
					end
					local notFound = (str7 or "default"):gsub("[^%w_%-]", "_")
					local str9 = str8 .. "/" .. notFound .. ".json"
					if not (isfile and isfile(str9)) then
						fn10("wraith", "not found: " .. notFound)
						return
					end

					local ok, result = pcall(function()
						return HttpService:JSONDecode(readfile(str9))
					end)

					if not ok or type(result) ~= "table" then
						fn10("wraith", "corrupt: " .. notFound)
						return
					end
					fn65(result)
					fn10("wraith", "loaded: " .. notFound)
				end

				local function fn67()
					local tbl13 = {}

					pcall(function()
						if not (listfiles and isfolder and isfolder("WraithHVH")) then
							return
						end

						for _, v53 in ipairs(listfiles("WraithHVH")) do
							local match = tostring(v53):match("([^/\\]+)%.json$")

							if match then
								table.insert(tbl13, match)
							end
						end
					end)

					table.sort(tbl13)
					return tbl13
				end

				v52:AddLabel("Config Name"):AddTextInput({
					Flag = "CfgName",
					Default = "default",
					Placeholder = "name",
					Callback = function(arg)
						if arg and arg ~= "" then
							str7 = arg
						end
					end,
				})

				cfgListDropdown = v52:AddLabel("Saved Configs"):AddDropdown({
					Values = {},
					Default = "",
					Flag = "CfgPick",
					Callback = function(arg)
						if not cfgUiReady then
							return
						end

						if arg and arg ~= "" then
							str7 = arg
						end
					end,
				})

				local function fn68()
					pcall(function()
						if cfgListDropdown and type(cfgListDropdown.SetValues) == "function" then
							cfgListDropdown:SetValues(fn67())
						end
					end)
				end

				task.delay(3, function()
					cfgUiReady = true
				end)

				v52:AddButton({
					Name = "Save",
					Callback = function()
						fn64("config")
						fn68()
					end,
				})

				v52:AddButton({
					Name = "Load",
					Callback = function()
						fn66("config")
					end,
				})

				v52:AddButton({
					Name = "Delete",
					Callback = function()
						pcall(function()
							local deleted = (str7 or "default"):gsub("[^%w_%-]", "_")

							if delfile then
								pcall(function()
									delfile(str8 .. "/" .. deleted .. ".json")
								end)
							end

							fn10("wraith", "deleted: " .. deleted)
							fn68()
						end)
					end,
				})

				v52:AddButton({ Name = "Refresh", Callback = fn68 })
			end

			do
				local thread2 = nil
				anchorHumSaved = {}
				local tbl10 = {}
				local tbl11 = {}

				local function fn52(arg)
					local v48 = tbl10[arg]
					if not v48 then
						return false
					end

					pcall(function()
						if v48.bp and v48.bp.Parent then
							v48.bp:Destroy()
						end

						if v48.bg and v48.bg.Parent then
							v48.bg:Destroy()
						end

						if v48.hl and v48.hl.Parent then
							v48.hl:Destroy()
						end

						if v48.hardAnchor and arg and arg.Parent then
							arg.Anchored = v48.wasAnchored and true or false

							if v48.wasCollide ~= nil then
								arg.CanCollide = v48.wasCollide
							end
						end
					end)

					tbl10[arg] = nil
					tbl11[arg] = nil
					return true
				end

				local function fn53()
					for k in pairs(tbl10) do
						fn52(k)
					end

					tbl10 = {}
					tbl11 = {}
				end

				local function fn54()
					if thread2 then
						return
					end

					thread2 = task.spawn(function()
						ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

						while true do
							local flag15 = false

							for k, v48 in pairs(tbl10) do
								if not k or not k.Parent or not k:IsDescendantOf(Workspace) then
									fn52(k)
								else
									pcall(function()
										if not k.Anchored then
											k.Anchored = true
										end

										if k.CFrame ~= v48.anchorCF then
											k.CFrame = v48.anchorCF
										end

										k.AssemblyLinearVelocity = Vector3.zero
										k.AssemblyAngularVelocity = Vector3.zero

										if v48.wasCollide ~= nil and k.CanCollide ~= v48.wasCollide then
											k.CanCollide = v48.wasCollide
										end

										if k.CanQuery ~= true then
											k.CanQuery = true
										end
									end)
								end

								flag15 = true
							end

							if flag15 then
								RunService.Heartbeat:Wait()
								continue
							end
							break
						end

						thread2 = nil
					end)
				end

				ANCHOR_MAX_PARTS = 60

				local function fn55(arg)
					local model = arg:FindFirstAncestorOfClass("Model")

					if model then
						if Players:GetPlayerFromCharacter(model) then
							return model, true
						end
					end

					local tbl12 = {
						Map = true,
						Plots = true,
						Terrain = true,
						Camera = true,
						World = true,
						Baseplate = true,
						Ignore = true,
						Debris = true,
						AlwaysHereTweenedObjects = true,
						GrabParts = true,
					}

					local parent = arg.Parent
					local v48 = nil

					while true do
						if parent and parent ~= Workspace and parent ~= game then
							if parent:IsA("Model") then
								if not tbl12[parent.Name] then
									local n32 = 0

									for _, descendant in ipairs(parent:GetDescendants()) do
										if descendant:IsA("BasePart") then
											n32 += 1
											if not (ANCHOR_MAX_PARTS < n32) then
												continue
											end
										else
											continue
										end

										break
									end

									if not (ANCHOR_MAX_PARTS < n32) then
										local str6 = tostring(parent.Parent and parent.Parent.Name or "")

										if str6:match("SpawnedInToys") or str6 == "PlotItems" or parent.Parent == Workspace then
											v48 = parent
											break
										else
											v48 = parent
											if not tbl12[parent.Name] then
												parent = parent.Parent
												continue
											end
										end
									end
								end
							elseif not tbl12[parent.Name] then
								parent = parent.Parent
								continue
							end
						end

						break
					end

					if v48 and v48:IsA("Model") then
						return v48, false
					end
					return arg, false
				end

				local function fn56(arg)
					local tbl12 = {}

					if arg:IsA("BasePart") then
						tbl12[1] = arg
					else
						for _, descendant in ipairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") then
								tbl12[#tbl12 + 1] = descendant
							end
						end
					end

					return tbl12
				end

				local function fn57(arg)
					if tbl10[arg] then
						return
					end

					local tbl12 = {
						anchorCF = arg.CFrame,
						anchorPos = arg.Position,
						wasAnchored = arg.Anchored,
						wasCollide = arg.CanCollide,
					}

					local setNetworkOwner = ReplicatedStorage_.GrabEvents:FindFirstChild("SetNetworkOwner")

					if setNetworkOwner then
						pcall(function()
							setNetworkOwner:FireServer(arg, arg.CFrame)
						end)
					end

					pcall(function()
						arg.Anchored = true
						arg.CanQuery = true
						arg.CanTouch = true
					end)

					tbl12.hardAnchor = arg.Anchored
					tbl10[arg] = tbl12
					tbl11[arg] = arg.Position
				end

				local function fn58()
					local v48, v49, v50 = fn11()
					if not v50 then
						return
					end
					local unitRay = localPlayer:GetMouse().UnitRay
					local raycastParams = RaycastParams.new()
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
					raycastParams.FilterDescendantsInstances = { v48 }
					local hit = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 200, raycastParams)
					hit = hit and hit.Instance
					if not (hit and hit:IsA("BasePart")) then
						fn10("wraith", "anchor: наведись на объект")
						return
					end
					local v51 = fn55(hit)
					local tbl12 = fn56(v51)
					if #tbl12 == 0 then
						return
					end

					if ANCHOR_MAX_PARTS < #tbl12 then
						v51 = hit
						tbl12 = { hit }
						fn10("wraith", "anchor: объект слишком большой, якорю одну деталь")
					end

					local flag15 = false

					for _, v52 in ipairs(tbl12) do
						if tbl10[v52] then
							flag15 = true
							break
						end
					end

					if flag15 then
						for _, v52 in ipairs(tbl12) do
							fn52(v52)
						end

						local ws = anchorHumSaved[v51] and anchorHumSaved[v51].ws
						local jp = anchorHumSaved[v51] and anchorHumSaved[v51].jp
						anchorHumSaved[v51] = nil

						pcall(function()
							local humanoid = v51:FindFirstChildOfClass("Humanoid")

							if humanoid then
								humanoid.PlatformStand = false

								if ws then
									humanoid.WalkSpeed = ws
								else
									humanoid.WalkSpeed = 16
								end

								if jp then
									humanoid.JumpPower = jp
								end

								humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
							end
						end)

						pcall(function()
							local wraithAnchorESP = v51:FindFirstChild("WraithAnchorESP")

							if wraithAnchorESP then
								wraithAnchorESP:Destroy()
							end
						end)

						fn10("wraith", "anchor: снят (" .. v51.Name .. ")")
						return
					end

					if (hit.Position - v50.Position).Magnitude > 31 then
						fn10("wraith", "anchor: слишком далеко")
						return
					end

					pcall(function()
						local humanoid = v51:FindFirstChildOfClass("Humanoid")

						if humanoid then
							anchorHumSaved[v51] = { ws = humanoid.WalkSpeed, jp = humanoid.JumpPower }
							humanoid.WalkSpeed = 0
							humanoid.JumpPower = 0
							humanoid.PlatformStand = true
							humanoid:ChangeState(Enum.HumanoidStateType.Physics)
						end
					end)

					for _, v52 in ipairs(tbl12) do
						fn57(v52)
					end

					pcall(function()
						if not v51:FindFirstChild("WraithAnchorESP") then
							local highlight = Instance.new("Highlight")
							highlight.Name = "WraithAnchorESP"
							highlight.Adornee = v51
							highlight.FillColor = Color3.fromRGB(255, 255, 255)
							highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							highlight.FillTransparency = 1
							highlight.OutlineTransparency = 0
							highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
							highlight.Parent = v51
						end
					end)

					fn54()
					fn10("wraith", "anchor: поставлен (" .. v51.Name .. ", частей: " .. #tbl12 .. ")")
				end

				toyAnchorGroup:AddButton({
					Name = "Anchor / Unanchor Object",
					Callback = function()
						fn17("anchor_toggle", fn58)
					end,
				})

				breakPartMode = "Decollide"
				breakPartColor = Color3.fromRGB(255, 255, 255)

				local tbl12 = {
					Decollide = CFrame.new(1e15, 1e15, 1e15),
					Kickable = CFrame.new(0, -600033344, 12212311, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				}

				local function fn59(adornee, arg)
					if not (adornee and adornee:IsA("BasePart")) then
						return
					end
					local highlight = Instance.new("Highlight")
					highlight.Name = "TargetHighlight"
					highlight.Adornee = adornee
					highlight.FillColor = Color3.fromRGB(0, 0, 0)
					highlight.FillTransparency = 0.92
					highlight.OutlineColor = breakPartColor or Color3.fromRGB(255, 255, 255)
					highlight.OutlineTransparency = 0
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.Parent = adornee

					if arg then
						local connection2 = nil

						connection2 = arg.AncestryChanged:Connect(function(child, parent)
							if not parent then
								if highlight and highlight.Parent then
									highlight:Destroy()
								end

								if connection2 then
									connection2:Disconnect()
									connection2 = nil
								end
							end
						end)
					else
						Debris:AddItem(highlight, 3)
					end
				end

				local function fn60()
					local touchEnabled = UserInputService_.TouchEnabled
					local mouse = localPlayer:GetMouse()
					if not touchEnabled and mouse and mouse.Target then
						return mouse.Target
					end
					local currentCamera = Workspace.CurrentCamera
					if not currentCamera then
						return nil
					end
					local viewportSize = currentCamera.ViewportSize
					local v48 = currentCamera:ViewportPointToRay(viewportSize.X / 2, viewportSize.Y / 2)
					local raycastParams = RaycastParams.new()
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
					local character = localPlayer.Character
					local v49 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					raycastParams.FilterDescendantsInstances = { character, v49 }
					local hit = Workspace:Raycast(v48.Origin, v48.Direction * 1000, raycastParams)
					return hit and hit.Instance
				end

				local function fn61(arg)
					if not (arg and arg:IsA("BasePart")) then
						fn10("wraith", "break part: наведись на деталь")
						return
					end
					local grabEvents2 = ReplicatedStorage_:FindFirstChild("GrabEvents")
					local setNetworkOwner = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")
					local playerEvents = ReplicatedStorage_:FindFirstChild("PlayerEvents")
					playerEvents = playerEvents and playerEvents:FindFirstChild("StickyPartEvent")

					if ReplicatedStorage_.MenuToys then
						ReplicatedStorage_.MenuToys:FindFirstChild("DestroyToy")
					end

					if not (setNetworkOwner and playerEvents) then
						return
					end
					local v48, v49, v50 = fn11()
					if not v50 then
						return
					end
					local NinjaShuriken = fn20("NinjaShuriken", CFrame.new(v50.Position) * CFrame.new(5, 0, 20), Vector3.new())
					if not NinjaShuriken then
						fn10("wraith", "break part: сюрикен не заспавнился")
						return
					end
					fn59(arg, NinjaShuriken)
					local stickyPart = NinjaShuriken:WaitForChild("StickyPart", 1)
					if not stickyPart then
						fn10("wraith", "break part: no sticky part")
						return
					end
					local now2 = tick()

					while true do
						pcall(function()
							setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
						end)

						RunService.Heartbeat:Wait()
						local partOwner = stickyPart:FindFirstChild("PartOwner")
						local flag15

						if partOwner then
							local name = localPlayer.Name
							flag15 = tostring(stickyPart.PartOwner.Value) == name
						else
							flag15 = partOwner
						end

						flag15 = flag15 or tick() - now2 > 2
						if not flag15 then
							continue
						end
						break
					end

					pcall(function()
						for _, descendant in ipairs(NinjaShuriken:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
								descendant.CanTouch = false
							end
						end
					end)

					pcall(function()
						playerEvents:FireServer(stickyPart, arg, tbl12[breakPartMode] or tbl12.Decollide)
					end)

					fn10("wraith", "break part: " .. tostring(arg.Name))
				end

				toyBreakGroup:AddLabel("Break Part Mode"):AddDropdown({
					Default = "Decollide",
					Values = { "Decollide", "Kickable" },
					Flag = "BreakPartMode",
					Callback = function(arg)
						breakPartMode = arg
					end,
				})

				local v48 = toyBreakGroup:AddLabel("Break Part")

				v48:AddKeybind({
					Flag = "BreakPartKey",
					Callback = function(arg)
						if not arg then
							return
						end

						fn17("break_part", function()
							fn61(fn60())
						end)
					end,
				})

				v48:AddColorPicker({
					Flag = "BreakPartColor",
					Default = Color3.fromRGB(255, 255, 255),
					Callback = function(arg)
						breakPartColor = arg
					end,
				})

				bahMode = "Normal"
				bahDelay = 0.03
				bahRun = false
				bahLoop = false
				local connection2 = nil

				local function fn62()
					local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return CFrame.new(0, 5000, 0)
					end
					local random = math.random
					return humanoidRootPart.CFrame * CFrame.new(math.random(-3, 3), 1.5, random(-3, 3))
				end

				local function fn63(arg)
					if not (arg and arg.Parent) then
						return
					end
					local holdPart = arg:FindFirstChild("HoldPart")
					if not holdPart then
						return
					end
					local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")
					local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")
					if not (holdItemRemoteFunction and dropItemRemoteFunction) then
						return
					end

					task.spawn(function()
						pcall(function()
							holdItemRemoteFunction:InvokeServer(arg, localPlayer.Character)
						end)

						pcall(function()
							dropItemRemoteFunction:InvokeServer(arg, fn62(), Vector3.zero)
						end)
					end)
				end

				local function fn64()
					local character = localPlayer.Character
					local n32 = 0

					for _, descendant in ipairs(Workspace:GetDescendants()) do
						local isModel = descendant:IsA("Model")

						if isModel then
							isModel = not (character and descendant:IsDescendantOf(character))
						end

						if isModel then
							local holdPart = descendant:FindFirstChild("HoldPart")

							if holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction") and holdPart:FindFirstChild("DropItemRemoteFunction") then
								fn63(descendant)
								n32 += 1
							end
						end
					end

					return n32
				end

				local function fn65()
					local tbl13 = {}
					local character = localPlayer.Character

					for _, descendant in ipairs(Workspace:GetDescendants()) do
						local isModel = descendant:IsA("Model")

						if isModel then
							isModel = not (character and descendant:IsDescendantOf(character))
						end

						if isModel then
							local holdPart = descendant:FindFirstChild("HoldPart")

							if holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction") and holdPart:FindFirstChild("DropItemRemoteFunction") then
								tbl13[#tbl13 + 1] = descendant
							end
						end
					end

					return tbl13
				end

				local function fn66()
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not (character and humanoidRootPart) then
						return 0
					end
					local v49 = fn65()
					local n32 = bahDelay or 0.03
					local n33 = 0

					for i = 1, #v49 do
						if bahRun then
							local v50 = v49[i]
							local parent = v50 and v50.Parent

							if parent then
								parent = not (localPlayer.Character and v50:IsDescendantOf(localPlayer.Character))
							end

							if parent then
								local holdPart = v50:FindFirstChild("HoldPart")

								if holdPart then
									local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")
									local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")

									if holdItemRemoteFunction and dropItemRemoteFunction then
										if pcall(function()
											holdItemRemoteFunction:InvokeServer(v50, character)
										end) then
											pcall(function()
												dropItemRemoteFunction:InvokeServer(v50, humanoidRootPart.CFrame * CFrame.new(0, 1.5, 0), Vector3.zero)
											end)

											n33 += 1
										end

										if n32 > 0 then
											task.wait(n32)
										end
									end
								end
							end

							continue
						end

						break
					end

					return n33
				end

				bahGroup:AddLabel("Bring Mode"):AddDropdown({
					Default = "Normal",
					Values = { "Normal", "Instant" },
					Flag = "BringHoldMode",
					Callback = function(arg)
						bahMode = arg
					end,
				})

				bahGroup:AddLabel("Bring Delay"):AddSlider({
					Flag = "BringHoldDelay",
					Min = 0,
					Max = 50,
					Default = 3,
					Rounding = 0,
					Callback = function(arg)
						bahDelay = arg / 100
					end,
				})

				bahGroup:AddLabel("Bring Holdables"):AddKeybind({
					Flag = "BringHoldKey",
					Callback = function(arg)
						if not arg then
							return
						end

						if bahMode == "Instant" then
							fn10("wraith", "bring holdables: " .. fn64())
							return
						end

						if bahRun then
							return
						end
						bahRun = true

						task.spawn(function()
							local bringHoldables = fn66()
							bahRun = false
							fn10("wraith", "bring holdables: " .. bringHoldables)
						end)
					end,
				})

				bahGroup:AddButton({
					Name = "Break All Holdables",
					Callback = function()
						fn17("break_holdables", function()
							local character = localPlayer.Character
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
							if not (character and humanoidRootPart) then
								return
							end
							local breakHoldables = 0

							for _, descendant in ipairs(Workspace:GetDescendants()) do
								if descendant:IsA("Model") and not descendant:IsDescendantOf(character) then
									local holdPart = descendant:FindFirstChild("HoldPart")
									local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
									holdPart = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")

									if holdItemRemoteFunction and holdPart then
										breakHoldables += 1

										task.spawn(function()
											pcall(function()
												holdItemRemoteFunction:InvokeServer(descendant, character)
											end)

											pcall(function()
												local random = math.random
												holdPart:InvokeServer(descendant, CFrame.new(math.random(-400, 400), -3000, random(-400, 400)), Vector3.zero)
											end)

											for _, descendant2 in pairs(descendant:GetDescendants()) do
												if descendant2:IsA("BasePart") then
													pcall(function()
														descendant2.CanCollide = false
														descendant2.CanTouch = false
														descendant2.CanQuery = false
														descendant2.Transparency = 1
														descendant2.Massless = true
														descendant2.Anchored = true
														descendant2.CFrame = CFrame.new(0, -1000, 0)
													end)
												end

												if descendant2:IsA("TouchTransmitter") then
													pcall(function()
														descendant2:Destroy()
													end)
												end
											end

											local holdPart2 = descendant:FindFirstChild("HoldPart")

											if holdPart2 then
												for _, child in pairs(holdPart2:GetChildren()) do
													if child:IsA("RemoteFunction") or child:IsA("RemoteEvent") then
														pcall(function()
															child:Destroy()
														end)
													end
												end
											end
										end)
									end
								end
							end

							fn10("wraith", "break holdables: " .. breakHoldables)
						end)
					end,
				})

				bahGroup:AddLabel("Bring Holdables Loop"):AddToggle({
					Default = false,
					Flag = "BringHoldLoop",
					Callback = function(arg)
						pcall(function()
							if wraithNotifyToggles then
								fn10("wraith", (wraithFlagLabel and wraithFlagLabel("BringHoldLoop") or "BringHoldLoop") .. ": " .. (arg and "on" or "off"))
							end
						end)

						bahLoop = arg

						if connection2 then
							pcall(function()
								connection2:Disconnect()
							end)

							connection2 = nil
						end

						if not arg then
							bahRun = false
							return
						end

						if bahMode == "Instant" then
							connection2 = Workspace.DescendantAdded:Connect(function(descendant)
								if not bahLoop then
									return
								end

								if descendant:IsA("Model") then
									task.spawn(function()
										local holdPart = descendant:WaitForChild("HoldPart", 2)

										if holdPart and bahLoop and holdPart:FindFirstChild("HoldItemRemoteFunction") then
											fn63(descendant)
										end
									end)
								end
							end)

							fn64()
							return
						end

						task.spawn(function()
							while bahLoop do
								bahRun = true
								fn66()
								bahRun = false
								task.wait(0.05)
							end
						end)
					end,
				})

				toyAnchorGroup:AddLabel("Anchor Object Key"):AddKeybind({
					Flag = "AnchorPartKey",
					Callback = function(arg)
						if not arg then
							return
						end
						fn17("anchor_toggle", fn58)
					end,
				})

				toyAnchorGroup:AddButton({
					Name = "Release All Anchors",
					Callback = function()
						fn17("anchor_release_all", function()
							fn53()
							fn10("wraith", "anchor: все сняты")
						end)
					end,
				})
			end

			local flag15 = false

			tpGroup:AddLabel("Teleport Binder"):AddToggle({
				Default = false,
				Flag = "Teleport",
				Callback = function(arg)
					pcall(function()
						if wraithNotifyToggles then
							fn10("wraith", (wraithFlagLabel and wraithFlagLabel("Teleport") or "Teleport") .. ": " .. (arg and "on" or "off"))
						end
					end)

					flag15 = arg
				end,
			})

			tpMoveSpeed = 1500

			tpGroup:AddLabel("Teleport Key"):AddKeybind({
				Flag = "WR54",
				Callback = function(arg)
					if not arg then
						return
					end

					if not flag15 then
						return
					end
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end

					if tpMoveBusy then
						return
					end
					tpMoveBusy = true
					local n32 = localPlayer:GetMouse().Hit.Position + Vector3.new(0, 3, 0)

					task.spawn(function()
						pcall(function()
							local position = humanoidRootPart.Position
							local n33 = math.clamp(math.floor((n32 - position).Magnitude / math.max(tpMoveSpeed or 1500, 1) / 60), 1, 90)

							for i = 1, n33 do
								if humanoidRootPart and humanoidRootPart.Parent then
									local n34 = humanoidRootPart.CFrame - humanoidRootPart.CFrame.Position
									humanoidRootPart.CFrame = CFrame.new(position:Lerp(n32, i / n33)) * n34
									humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
									RunService.Heartbeat:Wait()
									continue
								end

								break
							end

							if humanoidRootPart and humanoidRootPart.Parent then
								local n34 = humanoidRootPart.CFrame - humanoidRootPart.CFrame.Position
								humanoidRootPart.CFrame = CFrame.new(n32) * n34
								humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
								humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							end

							pcall(function()
								ReplicatedStorage_.GameCorrectionEvents.StopAllVelocity:FireServer()
							end)
						end)

						tpMoveBusy = false
					end)
				end,
			})

			utilGroup:AddButton({
				Name = "Reconnect",
				Callback = function()
					TeleportService:Teleport(game.PlaceId, localPlayer)
				end,
			})
		end, function(arg)
			warn("[wraith build error] " .. tostring(arg))

			pcall(function()
				lib:CreateNotification().new({ Title = "wraith", Content = "build error: " .. tostring(arg), Duration = 8 })
			end)
		end)
	end

	task.spawn(function()
		pcall(function()
			print([[██╗    ██╗██████╗  █████╗ ██╗████████╗██╗  ██╗    ██╗  ██╗██╗   ██╗██╗  ██╗
██║    ██║██╔══██╗██╔══██╗██║╚══██╔══╝██║  ██║    ██║  ██║██║   ██║██║  ██║
██║ █╗ ██║██████╔╝███████║██║   ██║   ███████║    ███████║██║   ██║███████║
██║███╗██║██╔══██╗██╔══██║██║   ██║   ██╔══██║    ██╔══██║╚██╗ ██╔╝██╔══██║
╚███╔███╔╝██║  ██║██║  ██║██║   ██║   ██║  ██║    ██║  ██║ ╚████╔╝ ██║  ██║
 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝
   t.me/cracksk3suu1  |  by k3suu1  |  crack executed
]])

			print("==== [wraith] loaded — welcome, " .. tostring(localPlayer and localPlayer.DisplayName or "?") .. " ====")
		end)
	end)

	fn10("wraith HvH", "beta build loaded · t.me/cracksk3suu1")

	task.delay(1.5, function()
		if not (type(setfflag) == "function" or type(getfflag) == "function") then
			pcall(function()
				fn10("wraith", "RakNet fflag API (setfflag/getfflag) not found - anti desync falls back to ownership filter")
			end)
		end
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if input.KeyCode == Enum.KeyCode.Escape then
			task.spawn(function()
				pcall(function()
					local configLib = lib.ConfigLib or v16 and v16.ConfigLib

					if configLib and configLib.Save then
						configLib:Save()
					end
				end)

				pcall(function()
					writefile(v16.ConfigFolder .. "/Default", lib.ConfigLib and lib.ConfigLib.GetData and lib.ConfigLib:GetData() or "")
				end)

				fn10("wraith", "config saved")
			end)
		end
	end)

	task.spawn(function()
		pcall(function()
			if type(openurl) == "function" then
				openurl("https://t.me/cracksk3suu1")
			end
		end)

		pcall(function()
			if type(setclipboard) == "function" then
				setclipboard("https://t.me/cracksk3suu1")
			end
		end)
	end)

end
