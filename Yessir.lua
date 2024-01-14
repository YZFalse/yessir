local githubRequest = function(str)
	return game:HttpGet("https://raw.githubusercontent.com/"..str)
end
local NEVERLOSE = loadstring(githubRequest("3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/main/source.lua"))()
local Whitelist = loadstring(githubRequest("MOONCoreDev/whitelists/main/mainwhitelist.lua"))()
local WhitelistData = {
	Name = game.Players.LocalPlayer.Name,
	Ranks = 0,
	isWhitelist = false
}

local function randomString(str,str2)
	str1 = str or 10
	stra = str2 or 100
	local randomlength = math.random(str1,stra)
	local array = {}

	for i = 1, randomlength do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end
if identifyexecutor():find("Fluxus") and isfile(".hwid") == false then
	writefile(".hwid",FLUX_ID)
elseif (not identifyexecutor():find("Fluxus")) and isfile(".hwid2") == false then
	writefile(".hwid2",randomString(10,20))
end
local HWID = {
	Flux = FLUX_ID,
	Normal = (not identifyexecutor():find("Fluxus") and readfile(".hwid2"))
}

local getexecutormen = function()
	if identifyexecutor():find("Fluxus") then
		return FLUX_ID
	else
		return readfile(".hwid2")
	end
end
function SendEMBED(url, embed)
	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json"
	}
	local data = {
		["embeds"] = {
			{
				["title"] = embed.title,
				["description"] = embed.description,
				["color"] = embed.color,
				["fields"] = embed.fields,
				["footer"] = {
					["text"] = embed.footer.text
				}
			}
		}
	}
	local body = http:JSONEncode(data)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body
	})
end
local request_bot = "https://discord.com/api/webhooks/1176115951163428944/P_YeJ0o1kXEnvOfO2gsMUYRUU40KQsJGFLEU5UUyq6rqo6e9B7IHJh-w9HJTF_jwSnc1"
local emblend = {
	["title"] = "Whitelist Request",
	["description"] = "Request Detected",
	["color"] = 65280,
	["fields"] = {
		{
			["name"] = "Username",
			["value"] = game.Players.LocalPlayer.Name
		},
		{
			["name"] = "Display Name",
			["value"] = game.Players.LocalPlayer.DisplayName
		},
		{
			["name"] = "UserId",
			["value"] = game.Players.LocalPlayer.UserId
		},
		{
			["name"] = "Executor Hwid",
			["value"] = getexecutormen()
		},
		{
			["name"] = "Roblox HWID",
			["value"] = game:GetService("RbxAnalyticsService"):GetClientId()
		},
		{
			["name"] = "Version",
			["value"] = "Testing Version"
		}
	},
	["footer"] = {
		["text"] = "Powered By Totally Not Exploiters"
	}
}
SendEMBED(request_bot, emblend)
local loadscript = function()

-- Change Theme --
NEVERLOSE:Theme("original") -- [ dark , nightly , original ]
------------------
local players = game:GetService('Players')
local lplr = players.LocalPlayer
local RelChar = lplr.Character
local workspace = game.Workspace
local cam = workspace.Camera
local lastCF, stop, heartbeatConnection
local Window = NEVERLOSE:AddWindow(randomString(10,10),"VERSION ???")
local bloxfruits = {}
local Notification = NEVERLOSE:Notification()
local usingNotification = true

Notification.MaxNotifications = 6
local createnotification = function(title, text, delay)
	--icon = icon or "info"
	title = title or "Notification"
	text = text or "Test Notification"
	delay = delay
	if usingNotification then
		Notification:Notify("info", title, text, delay)
	end
end
local createwarning = function(title, text, delay)
	title = title or "Notification"
	text = text or "Test Notification"
	delay = delay
	if usingNotification then
		Notification:Notify("warning", title, text, delay)
	end
end

Window:AddTabLabel('Main')
local createTab = function(name,icon)
	return Window:AddTab(name,icon)
end
local infoteb = Window:AddTab('Info','earth')
local lighting = game.Lighting
local TOD = lighting.TimeOfDay
local MoonStates = "/5"
local MoonData = {
	["MoonStart"] = false,
	["AlmostFull"] = false,
	["Full"] = false,
	["Revert1"] = false,
	["Revert2"] = false,
	["Revert3"] = false,
	["Revert4"] = false
}
if TOD:find("17:45") and lighting.Sky.MoonTextureId:find("9709143733") then
	MoonData["MoonStart"] = true
	MoonStates = "3/5"
end
if TOD:find("17:45") and lighting.Sky.MoonTextureId:find("9709149052") then
	MoonData["AlmostFull"] = true
	MoonData["MoonStart"] = false
	MoonStates = "4/5"
end
if TOD:find("17:45") and lighting.Sky.MoonTextureId:find("9709149431") then
	MoonData["Full"] = true
	MoonData["AlmostFull"] = false
	MoonStates = "5/5 | Full Moon"
end
local replistorage = game:GetService("ReplicatedStorage")
local AddPointStats = function(stats,val)
	stats = stats
	val = val or 1
	replistorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AddPoint",stats,val)
end
local RemotesComm = {
	["CommF_"] = replistorage.Remotes["CommF_"],
	["CommE"] = replistorage.Remotes["CommE"]
}
local CombatTab = Window:AddTab('Combat','ads') -- [ads , list , folder , earth , locked , home , mouse , user]
local BlatantTab = createTab("Blatant","list")
local BlatantSec = BlatantTab:AddSection("Blatant","left")
BlatantSec:AddLabel("We're sorry, Blatant Tab currently doesn't have any features, We're going to add some features in the Future, Please Stay tune.")
local RenderTab = createTab("Render","user")
local UtilityTab = createTab("Utility","folder")
local WorldTab = createTab("World","earth")
local mainstats = UtilityTab:AddSection("Auto Stats", "left")
local removeshake = RenderTab:AddSection("Remove Camerashake","left")
local pvpcamera = RenderTab:AddSection("PVP Camera","right")
local AntiSeaEvent = WorldTab:AddSection("Anti SeaEvent","left")
local RaidKillaura = WorldTab:AddSection("Raid Aura","right")
local SettingsUI = createTab("Settings","list")
local Credits = createTab("Credits","user")
local Credits2 = Credits:AddSection("Credits","left")
local notificationR = SettingsUI:AddSection("Notifications","left")
local Example = UtilityTab:AddSection('AnticheatBypass',"left")
local SpeedBoater = UtilityTab:AddSection("SpeedBoats", "right")
local FastAttack = CombatTab:AddSection("FastAttack", "left")
local AutoHomePoint = UtilityTab:AddSection("Auto Home Point","left")
local WaterWalker = WorldTab:AddSection("Walk on Water","right")
local Style = UtilityTab:AddSection("Buy Fighting style", "right")
local AutoAbility = UtilityTab:AddSection("Auto Ability", "left")
local ChangeTeam = UtilityTab:AddSection("Change Team","right")
local BuyBone = UtilityTab:AddSection("Random Surprise", "right")
local Changelog = createTab("Changelogs","list")
local CLS = Changelog:AddSection("Updated","left")
local Settings = {
	['FastAttack'] = CombatTab:AddSection('FastAttack Settings', 'right')
}
local Style2 = {
	--['Buy Style'] = Misc:AddSection("Select Fighting style", "right")
}
coderunning = {}
local run = function(code, name)
	code()
	table.insert(coderunning, name)
end

run(function()
	bloxfruits = {
		["CameraShaker"] = require(game.ReplicatedStorage.Util.CameraShaker),
		["CombatFramework"] = require(lplr.PlayerScripts.CombatFramework)
	}
end,"Blox_Fruits.table")

run(function()
	local function start()
		heartbeatConnection = game:GetService('RunService').Heartbeat:Connect(function()
			if stop then
				return 
			end 
			lastCF = lplr.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame
		end)
		lplr.Character:FindFirstChildOfClass('Humanoid').RootPart:GetPropertyChangedSignal('CFrame'):Connect(function()
			stop = true
			lplr.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame = lastCF
			game:GetService('RunService').Heartbeat:Wait()
			stop = false
		end)
		lplr.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
			heartbeatConnection:Disconnect()
		end)
	end
	local AnticheatBypassConnect
	Example:AddToggle("AnticheatBypass",false,function(val)
		if val then
			AnticheatBypassConnect = lplr.CharacterAdded:Connect(function(character)
				repeat 
					game:GetService('RunService').Heartbeat:Wait() 
				until character:FindFirstChildOfClass('Humanoid')
				repeat 
					game:GetService('RunService').Heartbeat:Wait() 
				until character:FindFirstChildOfClass('Humanoid').RootPart
				start()
			end)
			start()
		else
			heartbeatConnection:Disconnect()
			heartbeatConnection = nil
			AnticheatBypassConnect:Disconnect()
			AnticheatBypassConnect = nil
		end
	end)
end, "AnticheatBypass")

run(function() 
	local speedValue = 375
	--SpeedBoater:AddLabel("Speed Boats")
	SpeedBoater:AddDropdown('Speed',{100,150,200,250,300,350,355,360,375},360,function(val)
		speedValue = val
	end)
	SpeedBoater:AddButton('Set Boats Speed',function()
		for i,v in pairs(game.Workspace.Boats:GetChildren()) do
			v.VehicleSeat.MaxSpeed = speedValue
		end
	end)
end, "SpeedBoats")

run(function()
	local AutoHomePointEnabled = false
	AutoHomePoint:AddToggle("AutoHomePoint",false,function(val)
		AutoHomePointEnabled = val
		if AutoHomePointEnabled then
			while AutoHomePointEnabled do
				task.wait()
				RemotesComm["CommF_"]:InvokeServer("SetSpawnPoint")
			end
		end
	end)
end,"Auto_HomePoint")

run(function() 
	local FastAttackEnabled = false
	local SuperFastMode = false
	local BigGustavo = false
	local cdDelay = 0.175
	local SuperFastMode = true
	local CbFw = debug.getupvalues(bloxfruits["CombatFramework"])
	local CbFw2 = CbFw[2]
	function GetCurrentBlade() 
		local p13 = CbFw2.activeController
		local ret = p13.blades[1]
		if not ret then return end
		while ret.Parent ~= lplr.Character do ret = ret.Parent end
		return ret
	end
	function AttackNoCD()
		local AC = CbFw2.activeController
		for i = 1, 1 do
			local bladehit = require(replistorage.CombatFramework.RigLib).getBladeHits(lplr.Character,{lplr.Character.HumanoidRootPart},60)
			local cac = {}
			local hash = {}
			if IgnorePlayer then
				for k, v in pairs(bladehit) do
					if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
						if v.Parent:IsA("Model") and not v.Parent:IsDescendantOf(game.Workspace.Characters) and not v.Parent:IsDescendantOf(game.Workspace.NPCs) then
							table.insert(cac, v.Parent.HumanoidRootPart)
							hash[v.Parent] = true
						end
					end
				end
			else
				for k, v in pairs(bladehit) do
					if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
						if v.Parent:IsA("Model") and v.Parent:IsDescendantOf(game.Workspace.NPCs) then
							return
						else
							table.insert(cac, v.Parent.HumanoidRootPart)
							hash[v.Parent] = true
						end
					end
				end
			end
			bladehit = cac
			if #bladehit > 0 then
				local u8 = debug.getupvalue(AC.attack, 5)
				local u9 = debug.getupvalue(AC.attack, 6)
				local u7 = debug.getupvalue(AC.attack, 4)
				local u10 = debug.getupvalue(AC.attack, 7)
				local u12 = (u8 * 798405 + u7 * 727595) % u9
				local u13 = u7 * 798405
				(function()
					u12 = (u12 * u9 + u13) % 1099511627776
					u8 = math.floor(u12 / u9)
					u7 = u12 - u8 * u9
				end)()
				u10 = u10 + 1
				debug.setupvalue(AC.attack, 5, u8)
				debug.setupvalue(AC.attack, 6, u9)
				debug.setupvalue(AC.attack, 4, u7)
				debug.setupvalue(AC.attack, 7, u10)
				pcall(function()
					for k, v in pairs(AC.animator.anims.basic) do
						v:Play()
					end
				end)
				if lplr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
					replistorage.RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
					replistorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
					replistorage.RigControllerEvent:FireServer("hit", bladehit, i, "")
				end
			end
		end
	end
	local waitFunction
	FastAttack:AddToggle('FastAttack',false,function(val)
		FastAttackEnabled = val
		if FastAttackEnabled then
			Settings['FastAttack']:Show()
			if SuperFastMode then 
				waitFunction=task.wait
			else
				waitFunction=wait
			end
			while FastAttackEnabled do
				waitFunction(cdDelay)
				AttackNoCD()
			end
		else
			Settings['FastAttack']:Hide()
		end
	end)
	Settings['FastAttack']:Hide()
	FastAttack:AddToggle('Super Fast Mode',false,function(val)
		SuperFastMode = val
		if SuperFastMode then
			createwarning("WARNING", "Super Fast Mode Sometime Can Kick you please trying to use it without getting kick",10)
		end
	end)
	local DelayValue = {0, 0.05, 0.08, 0.10, 0.15, 0.175}
	function cdCheck()
		return cdDelay == 0 or cdDelay == 0.05 or cdDelay == 0.08 or cdDelay == 0.10
	end
	Settings['FastAttack']:AddDropdown('Cooldown',DelayValue,0.175,function(val)
		cdDelay = val
		if cdCheck() then
			createwarning("WARNING", "YOU CAN GET KICK AFTER STARTED FROM 0.08 - 0 PLEASE USE IT WITHOUT GETTING KICK",7)
		end
	end)
	Settings['FastAttack']:AddToggle('Ignore Player',false,function(val)
		IgnorePlayer = val
		if IgnorePlayer then
			createwarning("Ignore Players", "If you turn this on it won't attack players",10)
		end
	end)
end, "Fast Attack")

run(function()
	WaterWalker:AddToggle("Walk on water",false,function(val)
		if val then
			workspace.Map["WaterBase-Plane"].Size = Vector3.new(2048, 114, 2048)
		else
			workspace.Map["WaterBase-Plane"].Size = Vector3.new(2048, 80, 2048)
		end
	end)
end,"Water_Walker.real")

run(function()
	AntiSeaEvent:AddToggle("Anti SeaEvent",false,function(val)
		if val then
			workspace.Map["WaterBase-Plane"].Size = Vector3.new(2048, 700, 2048)
			workspace.Map['WaterBase-Plane'].CollisionGroupId = 1
		else
			workspace.Map["WaterBase-Plane"].Size = Vector3.new(2048, 80, 2048)
			workspace.Map["WaterBase-Plane"].CollisionGroupId = 0
		end
	end)
	AntiSeaEvent:AddToggle("Anti SeaEvent Attack",false,function(val)
		if val then
			workspace.Map["WaterBase-Plane"].Size = Vector3.new(2048, 500, 2048)
			workspace.Map['WaterBase-Plane'].CollisionGroupId = 1
		else
			workspace.Map["WaterBase-Plane"].Size = Vector3.new(2048, 80, 2048)
			workspace.Map["WaterBase-Plane"].CollisionGroupId = 0
		end
	end)
end,"AntiSeaEvent")

run(function()
	local AutoStatsMelee = false
	local AutoStatsDefense = false
	local AutoStatsSword = false
	local AutoStatsGun = false
	local AutoStatsFruit = false
	mainstats:AddToggle("Melee",false,function(val)
		AutoStatsMelee = val
		if AutoStatsMelee then
			while AutoStatsMelee do
				task.wait()
				AddPointStats("Melee",1)
			end
		end
	end)
	mainstats:AddToggle("Defense",false,function(val)
		AutoStatsDefense = val
		if AutoStatsDefense then
			while AutoStatsDefense do
				task.wait()
				AddPointStats("Defense",1)
			end
		end
	end)
	mainstats:AddToggle("Sword",false,function(val)
		AutoStatsSword = val
		if AutoStatsSword then
			while AutoStatsSword do
				task.wait()
				AddPointStats("Sword",1)
			end
		end
	end)
	mainstats:AddToggle("Gun",false,function(val)
		AutoStatsGun = val
		if AutoStatsGun then
			while AutoStatsGun do
				task.wait()
				AddPointStats("Gun",1)
			end
		end
	end)
	mainstats:AddToggle("Fruit",false,function(val)
		AutoStatsFruit = val
		if AutoStatsFruit then
			while AutoStatsFruit do
				task.wait()
				AddPointStats("Demon Fruit",1)
			end
		end
	end)
end,"AutoStats")

run(function()
	local y = debug.getupvalues(bloxfruits["CombatFramework"])[2]
	removeshake:AddButton("Remove Camera Shake",function()
		bloxfruits["CameraShaker"]:Stop()
	end)
end,"Remove_Shaking")

run(function()
	local PVPCam = false
	pvpcamera:AddToggle("PVP Camera",false,function(val)
		PVPCam = val
		if PVPCam then
			task.spawn(function()
				repeat
					task.wait(0.1)
					cam.CameraType = Enum.CameraType.Track
				until (not PVPCam)
			end)
		else
			cam.CameraType = Enum.CameraType.Custom
		end
	end)
end,"PvpCam")

run(function()
	notificationR:AddToggle("Notifications",true,function(val)
		usingNotification = val
	end)
end,"Settings")

run(function()
	Credits2:AddLabel("catsus - UI")
	Credits2:AddLabel("YZFloppa - FastAttack,Remove Camerashake,AnticheatBypass(Suck)")
	Credits2:AddLabel("Monia - Auto Stats,Walk on Water,Raid Killaura,SetTeam, Auto Homepoint and more")
end,"Credits")

run(function()
	local AutoAbilityEnabled = false
	local AutoV4Enabled = false
	AutoAbility:AddToggle("Auto Ability",false,function(val)
		AutoAbilityEnabled = val
		if AutoAbilityEnabled then
			repeat
				task.wait()
				RemotesComm["CommE"]:FireServer("ActivateAbility")
			until not AutoAbilityEnabled
		end
	end)
	local AutoV4Connect
	AutoAbility:AddToggle("Auto V4",false,function(val)
		AutoV4Enabled = val
		if AutoV4Enabled then
			task.spawn(function()
				repeat
					task.wait()
					if lplr.Character then
						lplr.Backpack.Awakening.RemoteFunction:InvokeServer(true)
					end
				until (not AutoV4Enabled)
				AutoV4Connect = lplr.CharacterAdded:Connect(function()
					task.wait()
					lplr.Backpack.Awakening.RemoteFunction:InvokeServer(true)
				end)
			end)
		else
			AutoV4Connect:Disconnect()
			AutoV4Connect = nil
		end
	end)
end, "Auto Ability")

run(function()
	local real = RemotesComm["CommF_"]
	BuyBone:AddButton("Buy Random Surprise",function()
		real:InvokeServer("Bones","Buy",1,1)
	end)
	local Surprise_MotherFucker = false
	BuyBone:AddToggle("Auto Random Surprise",false,function(val)
		Surprise_MotherFucker = val
		if Surprise_MotherFucker then
			while Surprise_MotherFucker do
				task.wait()
				real:InvokeServer("Bones","Buy",1,1)
			end
		end
	end)
end, "Bones")

run(function()
	local KillauraRaid = false
	RaidKillaura:AddToggle("Killaura",false,function(val)
		KillauraRaid = val
		if KillauraRaid then
			while KillauraRaid do
				wait(0.5)
				for i,enemy in pairs(workspace.Enemies:GetChildren()) do
					enemy.Humanoid.Health = 0
				end
			end
		end
	end)
end,"Raid_Killaura")

run(function()
	ChangeTeam:AddButton("Marines",function()
		RemotesComm["CommF_"]:InvokeServer("SetTeam","Marines")
	end)
	ChangeTeam:AddButton("Pirates",function()
		RemotesComm["CommF_"]:InvokeServer("SetTeam","Pirates")
	end)
end,"ChangeTeam")

local BringBoatExploit = UtilityTab:AddSection("Bring Boat Exploit","left")
local AntiBusy = RenderTab:AddSection("Anti Busy","right")
--
local AttackExploit = UtilityTab:AddSection("Fruit Exploit","right")
local BoatFreezer = UtilityTab:AddSection("Boat Freezer","left")
local AutoCollectEmber = UtilityTab:AddSection("Auto Ember","right")
--]]

run(function()
	local AutoAzureEmber = false
	local AutoEmberConnection
	AutoCollectEmber:AddToggle("Auto Collect Ember",false,function(val)
		AutoAzureEmber = val
		if AutoAzureEmber then
			task.spawn(function()
				repeat
					task.wait()
					replistorage.Modules.Net["RE/CollectBlueEmber"]:FireServer()
					AutoEmberConnection = workspace.ChildAdded:Connect(function(str)
						if str.Name == "EmberTemplate" then
							replistorage.Modules.Net["RE/CollectBlueEmber"]:FireServer()
						end
					end)
				until (not AutoAzureEmber)
			end)
		else
			AutoEmberConnection:Disconnect()
			AutoEmberConnection = nil
		end
	end)
end,"AutoEmber")

run(function()
	local AB_Toggle = false
	AntiBusy:AddToggle("Anti Busy",false,function(val)
		AB_Toggle = val
		if AB_Toggle then
			while AB_Toggle do
				task.wait()
				lplr.Character.Busy.Value = false
			end
		end
	end)
end,"AntiBusy")

--
run(function()
	local ExploitMode = {"Drag", "Around", "Stuck", "Water", "Fling", "Eternal Void", "CFrame"}
	local SelectMode = "Drag"
	local Types = {"Character", "Backpack"}
	local TypeAttack = "Character"
	local KitsuneExploit = false
	local TrexExploit = false
  
	local Kitsune = "Kitsune-Kitsune"
	local Trex = "T-Rex-T-Rex"
	
	local function KitsuneAttack(val1, val, val2)
		val1 = val1 or "Backpack"
		val = val or Vector3.new(0.000001, 0, 0.000001)
		val2 = val2 or 1
		lplr[val1][Kitsune].LeftClickRemote:FireServer(val, val2, true)
	end

	local function TrexAttack(val1, val, val2)
		val1 = val1 or "Backpack"
		val = val or Vector3.new(0.000001, 0, 0.000001)
		val2 = val2 or 1
		lplr[val1][Trex].LeftClickRemote:FireServer(val, val2)
	end
  
	AttackExploit:AddDropdown("Mode", ExploitMode, "Drag", function(val)
		SelectMode = val
	end)
	AttackExploit:AddDropdown("Type", Types, "Character", function(val)
		TypeAttack = val
	end)
	local getAttackMode = function()
		if SelectMode == "Drag" then
			return lplr.Character.HumanoidRootPart.Position
		elseif SelectMode == "Around" then
			return Vector3.new(9e9,9e9,9e9)
		elseif SelectMode == "Stuck" then
			return Vector3.new(0.000001, 0, 0.000001)
		elseif SelectMode == "Water" then
			return Vector3.new(0,-500,0)
		elseif SelectMode == "Fling" then
			return Vector3.new(0, 9e9, 0)
		elseif SelectMode == "Eternal Void" then
			return Vector3.new(9e9, -9e9, 9e9)
		elseif SelectMode == "CFrame" then
			return CFrame.new(9e9, 9e9, 9e9)
		end
	end
	AttackExploit:AddToggle("Trex Exploit", false, function(val)
		TrexExploit = val
		if TrexExploit and TypeAttack == "Backpack" then
			local pack = lplr:FindFirstChild("Backpack")
			local function fake()
				local dog = pack:FindFirstChild(Trex)
				if dog then
					TrexAttack("Backpack", getAttackMode(), 1)
					TrexAttack("Backpack", getAttackMode(), 4)
				end
			end
			
			pack:GetPropertyChangedSignal("Parent"):Connect(fake)
			
			repeat task.wait()
				fake()
			until not TrexExploit
		elseif TrexExploit and TypeAttack == "Character" then
			local character = lplr.Character or lplr.CharacterAdded:Wait()
			
			local function add()
				character = lplr.Character or lplr.CharacterAdded:Wait()
			end
			
			local function rem()
				character = nil
			end
			
			lplr.CharacterAdded:Connect(add)
			lplr.CharacterRemoving:Connect(rem)
			
			repeat
				task.wait()
				if character then
					local dog = character:FindFirstChild(Trex)
					if dog then
						TrexAttack(TypeAttack, getAttackMode(), 1)
						TrexAttack(TypeAttack, getAttackMode(), 4)
					end
				end
			until not TrexExploit
		end
	end)
	AttackExploit:AddToggle("Trex The Destroy Of Sea Creatures", false, function(val)
		TrexExploit = val
		if TrexExploit and TypeAttack == "Backpack" then
			local pack = lplr:FindFirstChild("Backpack")
			local function fake()
				local dog = pack:FindFirstChild(Trex)
				if dog then
					TrexAttack("Backpack", getAttackMode(), 4)
				end
			end
			
			pack:GetPropertyChangedSignal("Parent"):Connect(fake)
			
			repeat task.wait()
				fake()
			until not TrexExploit
		elseif TrexExploit and TypeAttack == "Character" then
			local character = lplr.Character or lplr.CharacterAdded:Wait()
			
			local function add()
				character = lplr.Character or lplr.CharacterAdded:Wait()
			end
			
			local function rem()
				character = nil
			end
			
			lplr.CharacterAdded:Connect(add)
			lplr.CharacterRemoving:Connect(rem)
			
			repeat
				task.wait()
				if character then
					local dog = character:FindFirstChild(Trex)
					if dog then
						TrexAttack(TypeAttack, getAttackMode(), 4)
					end
				end
			until not TrexExploit
		end
	end)
	AttackExploit:AddToggle("Kitsune Exploit", false, function(val)
		KitsuneExploit = val
		if KitsuneExploit and TypeAttack == "Backpack" then
			local pack = lplr:FindFirstChild("Backpack")
			local function fake()
				local cat = pack:FindFirstChild(Kitsune)
				if cat then
					KitsuneAttack("Backpack", getAttackMode(), 4)
				end
			end
			
			pack:GetPropertyChangedSignal("Parent"):Connect(fake)
			
			repeat task.wait()
				fake()
			until not KitsuneExploit
		elseif KitsuneExploit and TypeAttack == "Character" then
			local character = lplr.Character or lplr.CharacterAdded:Wait()
			
			local function add()
				character = lplr.Character or lplr.CharacterAdded:Wait()
			end
			
			local function rem()
				character = nil
			end
			
			lplr.CharacterAdded:Connect(add)
			lplr.CharacterRemoving:Connect(rem)
			
			repeat
				task.wait()
				if character then
					local cat = character:FindFirstChild(Kitsune)
					if cat then
						KitsuneAttack(TypeAttack, getAttackMode(), 4)
					end
				end
			until not KitsuneExploit
		end
	end)
end, "Fruit Exploit")

run(function()
	local FreezerBoat = false
	local isSit = function()
		return lplr.Character.Humanoid.Sit == true
	end
	local AccesoriesDropdown = {"Holiday Cloak","Leviathan Shield","Kitsune Mask","Kitsune Ribbon"}
	local AccesoriesSelected = "Leviathan Shield"
	BoatFreezer:AddDropdown("Accesories",AccesoriesDropdown,AccesoriesSelected,function(val)
		AccesoriesSelected = val
	end)
	BoatFreezer:AddButton("Freeze",function()
		if not isSit() then
			Notification:Notify("warning", "Boat Freezer", "Please sit on the boat.", 7)
		else
			RemotesComm["CommF_"]:InvokeServer("LoadItem",AccesoriesSelected)
		end
	end)
	local FreezerBoatModule = BoatFreezer:AddToggle("Boat Freezer",false,function(val)
		FreezerBoat = val
		if FreezerBoat then
			task.spawn(function()
				if (not isSit()) then
					Notification:Notify("warning", "Boat Freezer", "Please sit on the boat.", 7)
				else
					repeat
						task.wait()
						RemotesComm["CommF_"]:InvokeServer("LoadItem",AccesoriesSelected)
					until (not FreezerBoat)
				end
			end)
		end
	end)
end,"BoatFreezer")

--]]

run(function()
	local _AAA = ""
	local __AAA = function(_)
		local ___ = RemotesComm["CommF_"]
		___:InvokeServer("Buy".._)
	end
	local _A_ = function(_)
		local ___ = RemotesComm["CommF_"]
		___:InvokeServer("BlackbeardRewards",_,"2")
	end
	local A_A = {"Dark Step","Electro","Fishman Karate","Dragon Breath","Superhuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","Godhuman","Sanguine Art"}
	Style:AddDropdown("Select Melee",A_A,nil,function(_A_)
		_AAA = _A_
	end)
	Style:AddButton("Buy Melee",function()
		if _AAA == "Sanguine Art" then
			__AAA("SanguineArt")
		elseif _AAA == "Electro" then
			__AAA("Electro")
		elseif _AAA == "Dark Step" then
			__AAA("BlackLeg")
		elseif _AAA == "Fishman Karate" then
			__AAA("FishmanKarate")
		elseif _AAA == "Sharkman Karate" then
			__AAA("SharkmanKarate")
		elseif _AAA == "Dragon Breath" then
			_A_("DragonClaw")
		elseif _AAA == "Dragon Talon" then
			__AAA("DragonTalon")
		elseif _AAA == "Superhuman" then
			__AAA("Superhuman")
		elseif _AAA == "Electric Claw" then
			__AAA("ElectricClaw")
		elseif _AAA == "Death Step" then
			__AAA("DeathStep")
		elseif _AAA == "Godhuman" then
			__AAA("Godhuman")
		end
	end)
end,"Style")

run(function()
	local BringBoatFromSomeone = function(BoatName)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local boatModel = workspace.Boats[BoatName]
		local seatPart = boatModel:WaitForChild("VehicleSeat")
		seatPart.CFrame = CFrame.new(humanoidRootPart.Position)
	end
	local BoatsData = {}
	for i,v in pairs(workspace.Boats:GetChildren()) do
		table.insert(BoatsData, v.Name)
	end
	local insertTable = function(name,tsst)
		return table.insert(name,tsst)
	end
	local BringBoatSelected = ""
	local BringTest = BringBoatExploit:AddDropdown("Bring Boat",BoatsData,nil,function(val)
		BringBoatSelected = val
	end)
	BringBoatExploit:AddButton("Bring Boat",function()
		BringBoatFromSomeone(BringBoatSelected)
	end)
	BringBoatExploit:AddButton("Refresh",function()
		table.clear(BoatsData)
		task.wait(0.01)
		for i,v in pairs(workspace.Boats:GetChildren()) do
			insertTable(BoatsData, v.Name)
		end
		BringTest:Refresh(BoatsData)
	end)
end,"BringBoatExploit")

run(function()
	local addLog = function(text)
		return CLS:AddLabel(text)
	end
	addLog("[+] Added Auto Ember")
	addLog("[*] Changed "..randomString(5,5))
end,"changelogs")

run(function()
	local maininfo = infoteb:AddSection('Status','left')
	local detection = infoteb:AddSection('Detection','right')
	detection:AddToggle('FullMoonDetector',true,function(val)
		if val then
			if MoonData["Full"] then
				Notification:Notify("warning", "Detector", "Full Moon has been Appeared.", 10)
			end
		end
	end)
	local MoonStatus = maininfo:AddLabel('Current Moon: '..MoonStates)
	while task.wait() do
		MoonStatus:Text('Current Moon: '..MoonStates)
	end
end,'InfoBF')

run(function()
	local getexecutorman = function()
		if identifyexecutor():find("Fluxus") then
			return FLUX_ID
		else
			return readfile(".hwid2")
		end
	end
	function SendMessageEMBED(url, embed)
		local http = game:GetService("HttpService")
		local headers = {
			["Content-Type"] = "application/json"
		}
		local data = {
			["embeds"] = {
				{
					["title"] = embed.title,
					["description"] = embed.description,
					["color"] = embed.color,
					["fields"] = embed.fields,
					["footer"] = {
						["text"] = embed.footer.text
					}
				}
			}
		}
		local body = http:JSONEncode(data)
		local response = request({
			Url = url,
			Method = "POST",
			Headers = headers,
			Body = body
		})
	end
	local discord_url = "https://discord.com/api/webhooks/1176115947413700698/yuGRWLVaJ3cfM3pkgjJNIONUpWLF8qeYr06l5_PtXA8VN3-u043mGYqpPc5xlMZlcfTX"
	local embed = {
		["title"] = "Execution Detected",
		["description"] = "Detected Executed",
		["color"] = 65280,
		["fields"] = {
			{
				["name"] = "Username",
				["value"] = game.Players.LocalPlayer.Name
			},
			{
				["name"] = "Display Name",
				["value"] = game.Players.LocalPlayer.DisplayName
			},
			{
				["name"] = "UserId",
				["value"] = game.Players.LocalPlayer.UserId
			},
			{
				["name"] = "Executor Hwid",
				["value"] = getexecutorman()
			},
			{
				["name"] = "Roblox HWID",
				["value"] = game:GetService("RbxAnalyticsService"):GetClientId()
			},
			{
				["name"] = "Version",
				["value"] = "Testing Version"
			}
		},
		["footer"] = {
			["text"] = "Powered By Totally Not Exploiters"
		}
	}
	SendMessageEMBED(discord_url, embed)
end,"Execution")

end

local selfplr = game.Players.LocalPlayer
if identifyexecutor():find("Fluxus") and Whitelist.Flux[HWID.Flux] then
	shared.Whitelist1 = true
	loadscript()
elseif identifyexecutor():find("Fluxus") and Whitelist.Flux[readfile(".hwid")] then
	shared.Whitelist1 = true
	loadscript()
elseif identifyexecutor():find("Fluxus") and shared.Whitelist1 and (not Whitelist.Flux[HWID.Flux]) then
	selfplr:Kick("is broza for real trying to do the zaza?💀💀💀💀")
elseif identifyexecutor():find("Fluxus") and (not Whitelist.Flux[HWID.Flux]) then
	selfplr:Kick("broza isn't the owner.")
elseif identifyexecutor():find("Fluxus") and (not shared.Whitelist1) then
	selfplr:Kick("broza isn't the owner.")
elseif identifyexecutor():find("Fluxus") and (not shared.Whitelist1) and (not Whitelist.Flux[HWID.Flux]) then
	selfplr:Kick("broza isn't the owner.")
elseif identifyexecutor():find("Fluxus") and (not shared.Whitelist1) and (not Whitelist.Flux[readfile(".hwid")]) then
	selfplr:Kick("broza isn't the owner.")
end
if (not identifyexecutor():find("Fluxus")) and Whitelist.Normal[HWID.Normal] then
	shared.FrWhitelist = true
	loadscript()
elseif (not identifyexecutor():find("Fluxus") and not Whitelist.Normal[HWID.Normal]) then
	selfplr:Kick("broza isn't the owner.")
elseif (not identifyexecutor():find("Fluxus")) and (not Whitelist.Normal[HWID.Normal]) then
	selfplr:Kick("broza isn't the owner.")
elseif (not identifyexecutor():find("Fluxus")) and (not shared.FrWhitelist) then
	selfplr:Kick("broza isn't the owner.")
elseif (not identifyexecutor():find("Fluxus")) and shared.FrWhitelist and (not Whitelist.Normal[HWID.Normal]) then
	selfplr:Kick("is broza for real trying to do the zaza?💀💀💀💀")
end

if identifyexecutor():find("Fluxus") and (not shared.Whitelist1) and (not Whitelist.Flux[HWID.Flux]) then
	selfplr:Kick("is broza for real trying to do the zaza?💀💀💀💀")
elseif identifyexecutor():find("Fluxus") and shared.Whitelist1 and Whitelist.Flux[readfile(".hwid")] and (not Whitelist.Flux[HWID.Flux]) then
	selfplr:Kick("is broza for real trying to do the zaza?💀💀💀💀")
elseif (not identifyexecutor():find("Fluxus")) and (not shared.FrWhitelist) and  Whitelist.Normal[HWID.Normal] then
	selfplr:Kick("is broza for real trying to do the zaza?💀💀💀💀")
elseif (not identifyexecutor():find("Fluxus")) and shared.FrWhitelist and (not Whitelist.Normal[HWID.Normal]) then
	selfplr:Kick("is broza for real trying to do the zaza?💀💀💀💀")
end