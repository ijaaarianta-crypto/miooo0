-- HAJA HUB V10.1 FINAL EXPORT

📂 [SERVICE: CommonUtils]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CharacterUtil
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:15
-- Luau version 6, Types version 3
-- Time taken: 0.006409 seconds

local Players_upvr = game:GetService("Players")
local module_upvr = {
	LOCAL_PLAYER = "LOCAL_PLAYER";
	ON_LOCAL_PLAYER = "ON_LOCAL_PLAYER";
	CHARACTER_ADDED = "CHARACTER_ADDED";
	ON_CHARACTER = "ON_CHARACTER";
	CHARACTER_CHILD_ADDED = "CHARACTER_CHILD_ADDED";
}
local module_upvr_2 = {
	_connectionUtil = require(script.Parent:WaitForChild("ConnectionUtil")).new();
	_boundEvents = {};
	getLocalPlayer = function() -- Line 53, Named "getLocalPlayer"
		--[[ Upvalues[1]:
			[1]: Players_upvr (readonly)
		]]
		return Players_upvr.LocalPlayer
	end;
}
function module_upvr_2.onLocalPlayer(arg1) -- Line 57
	--[[ Upvalues[3]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	local any_getLocalPlayer_result1 = module_upvr_2.getLocalPlayer()
	if any_getLocalPlayer_result1 then
		arg1(any_getLocalPlayer_result1)
	end
	module_upvr_2._connectionUtil:trackConnection(module_upvr.LOCAL_PLAYER, Players_upvr:GetPropertyChangedSignal("LocalPlayer"):Connect(function() -- Line 66
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (copied, readonly)
			[2]: module_upvr (copied, readonly)
		]]
		local any_getLocalPlayer_result1_2 = module_upvr_2.getLocalPlayer()
		assert(any_getLocalPlayer_result1_2)
		module_upvr_2._getOrCreateBoundEvent(module_upvr.LOCAL_PLAYER):Fire(any_getLocalPlayer_result1_2)
	end))
	return module_upvr_2._getOrCreateBoundEvent(module_upvr.LOCAL_PLAYER).Event:Connect(arg1)
end
function module_upvr_2.getCharacter() -- Line 77
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local any_getLocalPlayer_result1_3 = module_upvr_2.getLocalPlayer()
	if not any_getLocalPlayer_result1_3 then
		return nil
	end
	return any_getLocalPlayer_result1_3.Character
end
function module_upvr_2.onCharacter(arg1) -- Line 85
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	module_upvr_2._connectionUtil:trackConnection(module_upvr.ON_LOCAL_PLAYER, module_upvr_2.onLocalPlayer(function(arg1_2) -- Line 89
		--[[ Upvalues[3]:
			[1]: module_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: module_upvr (copied, readonly)
		]]
		local any_getCharacter_result1 = module_upvr_2.getCharacter()
		if any_getCharacter_result1 then
			arg1(any_getCharacter_result1)
		end
		module_upvr_2._connectionUtil:trackConnection(module_upvr.CHARACTER_ADDED, arg1_2.CharacterAdded:Connect(function(arg1_3) -- Line 98
			--[[ Upvalues[2]:
				[1]: module_upvr_2 (copied, readonly)
				[2]: module_upvr (copied, readonly)
			]]
			assert(arg1_3)
			module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_ADDED):Fire(arg1_3)
		end))
	end))
	return module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_ADDED).Event:Connect(arg1)
end
function module_upvr_2.getChild(arg1, arg2) -- Line 110
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local any_getCharacter_result1_2 = module_upvr_2.getCharacter()
	if not any_getCharacter_result1_2 then
		return nil
	end
	local SOME = any_getCharacter_result1_2:FindFirstChild(arg1)
	if SOME and SOME:IsA(arg2) then
		return SOME
	end
	return nil
end
function module_upvr_2.onChild(arg1, arg2, arg3) -- Line 122
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	module_upvr_2._connectionUtil:trackConnection(module_upvr.ON_CHARACTER, module_upvr_2.onCharacter(function(arg1_4) -- Line 126
		--[[ Upvalues[5]:
			[1]: module_upvr_2 (copied, readonly)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: arg3 (readonly)
			[5]: module_upvr (copied, readonly)
		]]
		local any_getChild_result1 = module_upvr_2.getChild(arg1, arg2)
		if any_getChild_result1 then
			arg3(any_getChild_result1)
		end
		module_upvr_2._connectionUtil:trackConnection(module_upvr.CHARACTER_CHILD_ADDED, arg1_4.ChildAdded:Connect(function(arg1_5) -- Line 135
			--[[ Upvalues[4]:
				[1]: arg1 (copied, readonly)
				[2]: arg2 (copied, readonly)
				[3]: module_upvr_2 (copied, readonly)
				[4]: module_upvr (copied, readonly)
			]]
			if arg1_5.Name == arg1 and arg1_5:IsA(arg2) then
				module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_CHILD_ADDED..arg1..arg2):Fire(arg1_5)
			end
		end))
	end))
	return module_upvr_2._getOrCreateBoundEvent(module_upvr.CHARACTER_CHILD_ADDED..arg1..arg2).Event:Connect(arg3)
end
function module_upvr_2._getOrCreateBoundEvent(arg1) -- Line 149
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	if not module_upvr_2._boundEvents[arg1] then
		module_upvr_2._boundEvents[arg1] = Instance.new("BindableEvent")
	end
	return module_upvr_2._boundEvents[arg1]
end
return module_upvr_2
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.ConnectionUtil
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:16
-- Luau version 6, Types version 3
-- Time taken: 0.002624 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 25
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1._connections = {}
	return setmetatable_result1
end
function module_upvr.trackConnection(arg1, arg2, arg3) -- Line 33
	if arg1._connections[arg2] then
		arg1._connections[arg2]()
	end
	arg1._connections[arg2] = function() -- Line 38
		--[[ Upvalues[1]:
			[1]: arg3 (readonly)
		]]
		arg3:Disconnect()
	end
end
function module_upvr.trackBoundFunction(arg1, arg2, arg3) -- Line 41
	if arg1._connections[arg2] then
		arg1._connections[arg2]()
	end
	arg1._connections[arg2] = arg3
end
function module_upvr.disconnect(arg1, arg2) -- Line 48
	if arg1._connections[arg2] then
		arg1._connections[arg2]()
		arg1._connections[arg2] = nil
	end
end
function module_upvr.disconnectAll(arg1) -- Line 55
	for _, v in pairs(arg1._connections) do
		v()
	end
	arg1._connections = {}
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.FlagUtil
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:16
-- Luau version 6, Types version 3
-- Time taken: 0.001018 seconds

return {
	getUserFlag = function(arg1) -- Line 11, Named "getUserFlag"
		local pcall_result1, pcall_result2 = pcall(function() -- Line 12
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return UserSettings():IsUserFeatureEnabled(arg1)
		end)
		return pcall_result1 and pcall_result2
	end;
}
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CameraWrapper
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:16
-- Luau version 6, Types version 3
-- Time taken: 0.003989 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local ConnectionUtil_upvr = require(script.Parent.ConnectionUtil)
function module_upvr.new() -- Line 39
	--[[ Upvalues[2]:
		[1]: ConnectionUtil_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	return setmetatable({
		_camera = game.Workspace.CurrentCamera;
		_callbacks = {};
		_connectionUtil = ConnectionUtil_upvr.new();
		_enabled = false;
	}, module_upvr)
end
function module_upvr._connectCallbacks(arg1) -- Line 52
	arg1._camera = game.Workspace.CurrentCamera
	if not arg1._camera then
	else
		for var4, var5 in arg1._callbacks do
			arg1._connectionUtil:trackConnection(var4, arg1._camera:GetPropertyChangedSignal(var4):Connect(var5))
			var5()
		end
	end
end
function module_upvr.Enable(arg1) -- Line 65
	if arg1._enabled then
	else
		arg1._enabled = true
		arg1._cameraChangedConnection = game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line 72
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:_connectCallbacks()
		end)
		arg1:_connectCallbacks()
	end
end
function module_upvr.Disable(arg1) -- Line 79
	if not arg1._enabled then
	else
		arg1._enabled = false
		if arg1._cameraChangedConnection then
			arg1._cameraChangedConnection:Disconnect()
			arg1._cameraChangedConnection = nil
		end
		arg1._connectionUtil:disconnectAll()
	end
end
function module_upvr.Connect(arg1, arg2, arg3) -- Line 94
	arg1._callbacks[arg2] = arg3
	if not arg1._camera then
	else
		arg1._connectionUtil:trackConnection(arg2, arg1._camera:GetPropertyChangedSignal(arg2):Connect(arg3))
	end
end
function module_upvr.Disconnect(arg1, arg2) -- Line 104
	arg1._connectionUtil:disconnect(arg2)
	arg1._callbacks[arg2] = nil
end
function module_upvr.getCamera(arg1) -- Line 110
	return arg1._camera
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CameraWrapper.spec
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:17
-- Luau version 6, Types version 3
-- Time taken: 0.002405 seconds

local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local it_upvr = JestGlobals.it
local CameraWrapper_upvr = require(script.Parent.CameraWrapper)
local expect_upvr = JestGlobals.expect
local waitForEvents_upvr = require(CorePackages.Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents
JestGlobals.describe("CameraWrapper", function() -- Line 12
	--[[ Upvalues[4]:
		[1]: it_upvr (readonly)
		[2]: CameraWrapper_upvr (readonly)
		[3]: expect_upvr (readonly)
		[4]: waitForEvents_upvr (readonly)
	]]
	it_upvr("should instantiate", function() -- Line 13
		--[[ Upvalues[2]:
			[1]: CameraWrapper_upvr (copied, readonly)
			[2]: expect_upvr (copied, readonly)
		]]
		expect_upvr(CameraWrapper_upvr.new()).never.toBeNil()
	end)
	it_upvr("should return updated camera", function() -- Line 19
		--[[ Upvalues[3]:
			[1]: CameraWrapper_upvr (copied, readonly)
			[2]: expect_upvr (copied, readonly)
			[3]: waitForEvents_upvr (copied, readonly)
		]]
		local any_new_result1 = CameraWrapper_upvr.new()
		any_new_result1:Enable()
		local Camera = Instance.new("Camera")
		Camera.Parent = game.Workspace
		expect_upvr(any_new_result1:getCamera()).toBe(game.Workspace.CurrentCamera)
		expect_upvr(any_new_result1:getCamera()).never.toBe(Camera)
		game.Workspace.CurrentCamera = Camera
		waitForEvents_upvr()
		expect_upvr(any_new_result1:getCamera()).toBe(game.Workspace.CurrentCamera)
		expect_upvr(any_new_result1:getCamera()).toBe(Camera)
	end)
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.ConnectionUtil.spec
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:17
-- Luau version 6, Types version 3
-- Time taken: 0.004923 seconds

local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local it_upvr = JestGlobals.it
local ConnectionUtil_upvr = require(script.Parent.ConnectionUtil)
local expect_upvr = JestGlobals.expect
local Signal_upvr = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
JestGlobals.describe("ConnectionUtil", function() -- Line 13
	--[[ Upvalues[4]:
		[1]: it_upvr (readonly)
		[2]: ConnectionUtil_upvr (readonly)
		[3]: expect_upvr (readonly)
		[4]: Signal_upvr (readonly)
	]]
	it_upvr("should instantiate", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: ConnectionUtil_upvr (copied, readonly)
			[2]: expect_upvr (copied, readonly)
		]]
		expect_upvr(ConnectionUtil_upvr.new()).never.toBeNil()
	end)
	it_upvr("should track a connection", function() -- Line 20
		--[[ Upvalues[3]:
			[1]: ConnectionUtil_upvr (copied, readonly)
			[2]: Signal_upvr (copied, readonly)
			[3]: expect_upvr (copied, readonly)
		]]
		local any_new_result1_2 = Signal_upvr.new()
		local var11_upvw = ""
		ConnectionUtil_upvr.new():trackConnection("Signal", any_new_result1_2:Connect(function(arg1) -- Line 27
			--[[ Upvalues[1]:
				[1]: var11_upvw (read and write)
			]]
			var11_upvw = arg1
		end))
		any_new_result1_2:fire("Testing")
		expect_upvr(var11_upvw).toBe("Testing")
	end)
	it_upvr("should disconnect from signal", function() -- Line 36
		--[[ Upvalues[3]:
			[1]: ConnectionUtil_upvr (copied, readonly)
			[2]: Signal_upvr (copied, readonly)
			[3]: expect_upvr (copied, readonly)
		]]
		local any_new_result1_5 = ConnectionUtil_upvr.new()
		local any_new_result1_6 = Signal_upvr.new()
		local var16_upvw = ""
		any_new_result1_5:trackConnection("Signal", any_new_result1_6:Connect(function(arg1) -- Line 43
			--[[ Upvalues[1]:
				[1]: var16_upvw (read and write)
			]]
			var16_upvw = arg1
		end))
		any_new_result1_5:disconnect("Signal")
		any_new_result1_6:fire("Testing")
		expect_upvr(var16_upvw).toBe("")
	end)
	it_upvr("should disconnect from all", function() -- Line 53
		--[[ Upvalues[3]:
			[1]: ConnectionUtil_upvr (copied, readonly)
			[2]: Signal_upvr (copied, readonly)
			[3]: expect_upvr (copied, readonly)
		]]
		local any_new_result1_3 = ConnectionUtil_upvr.new()
		local any_new_result1_4 = Signal_upvr.new()
		local var21_upvw = ""
		local var22_upvw = ""
		local var23_upvw = ""
		any_new_result1_3:trackConnection("Signal", any_new_result1_4:Connect(function(arg1) -- Line 65
			--[[ Upvalues[1]:
				[1]: var21_upvw (read and write)
			]]
			var21_upvw = arg1
		end))
		any_new_result1_3:trackConnection("Signal1", Signal_upvr.new():Connect(function(arg1) -- Line 71
			--[[ Upvalues[1]:
				[1]: var22_upvw (read and write)
			]]
			var22_upvw = arg1
		end))
		any_new_result1_3:trackConnection("Signal2", Signal_upvr.new():Connect(function(arg1) -- Line 77
			--[[ Upvalues[1]:
				[1]: var23_upvw (read and write)
			]]
			var23_upvw = arg1
		end))
		any_new_result1_3:disconnectAll()
		any_new_result1_4:fire("TestingPrimary")
		any_new_result1_4:fire("TestingSecondary")
		any_new_result1_4:fire("TestingTertiary")
		expect_upvr(var21_upvw).toBe("")
		expect_upvr(var22_upvw).toBe("")
		expect_upvr(var23_upvw).toBe("")
	end)
	it_upvr("should call manual disconnect", function() -- Line 92
		--[[ Upvalues[2]:
			[1]: ConnectionUtil_upvr (copied, readonly)
			[2]: expect_upvr (copied, readonly)
		]]
		local any_new_result1 = ConnectionUtil_upvr.new()
		local var29_upvw = ""
		any_new_result1:trackBoundFunction("Manual", function() -- Line 96
			--[[ Upvalues[1]:
				[1]: var29_upvw (read and write)
			]]
			var29_upvw = "Disconnected"
		end)
		any_new_result1:disconnect("Manual")
		expect_upvr(var29_upvw).toBe("Disconnected")
	end)
end)
--------------------
📂 [SERVICE: StarterPlayerScripts]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.ArrowScript
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:53
-- Luau version 6, Types version 3
-- Time taken: 0.035334 seconds

local RunService_upvr = game:GetService("RunService")
local UserInputService_upvr = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentCamera_upvr = workspace.CurrentCamera
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local Bindables = ReplicatedStorage:WaitForChild("Bindables")
local SubmitAimDirection_upvr = RemoteEvents:WaitForChild("SubmitAimDirection")
local PowerChanged_upvr = Bindables:WaitForChild("PowerChanged")
local var10_upvw
local var11_upvw
local var12_upvw = 3
local var13_upvw = false
local var14_upvw = 0
local var15_upvw
local var16_upvw
local tbl_2_upvr = {
	dir = Vector3.new(0, 0, -1);
	alpha = 0;
	time = os.clock();
}
local function bindVisibilityEnforcer_upvr(arg1) -- Line 54, Named "bindVisibilityEnforcer"
	local function enforce_upvr(arg1_2) -- Line 55, Named "enforce"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if not arg1:GetAttribute("ForceHidden") then
		else
			if arg1_2:IsA("BasePart") then
				arg1_2.LocalTransparencyModifier = 1
				return
			end
			if arg1_2:IsA("Decal") or arg1_2:IsA("Texture") then
				arg1_2.Transparency = 1
				return
			end
			if arg1_2:IsA("ParticleEmitter") or arg1_2:IsA("Trail") or arg1_2:IsA("Beam") then
				arg1_2.Enabled = false
				return
			end
			if arg1_2:IsA("Highlight") then
				arg1_2.Enabled = false
			end
		end
	end
	for _, v in ipairs(arg1:GetDescendants()) do
		enforce_upvr(v)
	end
	arg1.DescendantAdded:Connect(enforce_upvr)
	arg1:GetAttributeChangedSignal("ForceHidden"):Connect(function() -- Line 77
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: enforce_upvr (readonly)
		]]
		if arg1:GetAttribute("ForceHidden") then
			for _, v_2 in ipairs(arg1:GetDescendants()) do
				enforce_upvr(v_2)
			end
		end
	end)
end
local function _(arg1) -- Line 87, Named "forceUnhideCharacter"
	for _, v_3 in ipairs(arg1:GetDescendants()) do
		if v_3:IsA("BasePart") or v_3:IsA("MeshPart") or v_3:IsA("Union") then
			v_3.LocalTransparencyModifier = 0
		elseif v_3:IsA("Decal") or v_3:IsA("Texture") then
			v_3.Transparency = 0
		elseif v_3:IsA("ParticleEmitter") or v_3:IsA("Trail") or v_3:IsA("Beam") then
			v_3.Enabled = true
		elseif v_3:IsA("Highlight") then
			v_3.Enabled = true
		end
	end
end
local function enableGhostEffects_upvr(arg1) -- Line 101, Named "enableGhostEffects"
	for _, v_4 in ipairs(arg1:GetDescendants()) do
		if v_4:IsA("ParticleEmitter") then
			v_4.Enabled = true
			v_4:Emit(v_4:GetAttribute("Burst") or 5)
		elseif v_4:IsA("Trail") or v_4:IsA("Beam") then
			v_4.Enabled = true
		end
	end
end
local function setCharacterVisible_upvr(arg1, arg2) -- Line 113, Named "setCharacterVisible"
	if not arg1 then
	else
		for _, v_6 in ipairs(arg1:GetDescendants()) do
			local var48
			if var48 then
				if arg2 then
					var48 = 0
				else
					var48 = 1
				end
				v_6.LocalTransparencyModifier = var48
			elseif v_6:IsA("Decal") or v_6:IsA("Texture") then
				if arg2 then
				else
				end
				v_6.Transparency = 1
			elseif v_6:IsA("ParticleEmitter") or v_6:IsA("Trail") or v_6:IsA("Beam") then
				v_6.Enabled = arg2
			elseif v_6:IsA("Highlight") then
				v_6.Enabled = arg2
			end
		end
	end
end
local tbl_upvr = {}
local function _(arg1, arg2) -- Line 134, Named "setCharacterHidden"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 52 start (CF ANALYSIS FAILED)
	if not arg1 then return end
	local ipairs_result1_2, ipairs_result2_2, ipairs_result3_2 = ipairs(arg1:GetDescendants())
	-- KONSTANTERROR: [0] 1. Error Block 52 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [141] 111. Error Block 44 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [141] 111. Error Block 44 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 74 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [141.7]
	local function INLINED() -- Internal function, doesn't exist in bytecode
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return nil
	end
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return nil
	end
	if nil or INLINED() or INLINED_2() then
		if arg2 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil == nil then
			end
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil ~= nil then
				-- KONSTANTWARNING: GOTO [141] #111
			end
		end
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		if nil or nil then
			if arg2 then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil == nil then
				end
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil ~= nil then
					-- KONSTANTWARNING: GOTO [141] #111
				end
			end
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x3)
			if nil or nil or nil then
				if arg2 then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					if nil == nil then
					end
				else
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					if nil ~= nil then
						-- KONSTANTWARNING: GOTO [141] #111
					end
				end
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil then
					if arg2 then
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						if nil == nil then
						end
					else
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						if nil ~= nil then
						end
					end
				end
			end
		end
	end
	-- KONSTANTERROR: [9] 8. Error Block 74 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 191, Named "lockThirdPerson"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	if arg1 then
		LocalPlayer_upvr.CameraMinZoomDistance = 8
		LocalPlayer_upvr.CameraMaxZoomDistance = 19
	else
		LocalPlayer_upvr.CameraMinZoomDistance = 0
		LocalPlayer_upvr.CameraMaxZoomDistance = 20
	end
end
local function makeGhostFromCharacter_upvr(arg1) -- Line 202, Named "makeGhostFromCharacter"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local clone = arg1:Clone()
	clone.Name = "AimGhost_"..LocalPlayer_upvr.Name
	clone.Parent = workspace.CurrentCamera
	for _, v_5 in ipairs(clone:GetDescendants()) do
		if v_5:IsA("BasePart") then
			v_5.Anchored = true
			v_5.CanCollide = false
			v_5.Massless = true
		elseif v_5:IsA("Script") or v_5:IsA("LocalScript") then
			v_5:Destroy()
		end
	end
	return clone
end
local function _() -- Line 221, Named "getFlatCameraDir"
	--[[ Upvalues[1]:
		[1]: CurrentCamera_upvr (readonly)
	]]
	local LookVector = CurrentCamera_upvr.CFrame.LookVector
	local vector3 = Vector3.new(LookVector.X, 0, LookVector.Z)
	if vector3.Magnitude < 0.001 then
		return Vector3.new(0, 0, -1)
	end
	return vector3.Unit
end
local HidePower_upvr = Bindables:WaitForChild("HidePower")
local function stopAiming_upvr() -- Line 232, Named "stopAiming"
	--[[ Upvalues[9]:
		[1]: var13_upvw (read and write)
		[2]: PowerChanged_upvr (readonly)
		[3]: var12_upvw (read and write)
		[4]: var11_upvw (read and write)
		[5]: var10_upvw (read and write)
		[6]: var15_upvw (read and write)
		[7]: LocalPlayer_upvr (readonly)
		[8]: setCharacterVisible_upvr (readonly)
		[9]: HidePower_upvr (readonly)
	]]
	var13_upvw = false
	PowerChanged_upvr:Fire(var12_upvw)
	if var11_upvw then
		var11_upvw:Disconnect()
		var11_upvw = nil
	end
	if var10_upvw then
		var10_upvw:Destroy()
		var10_upvw = nil
	end
	if var15_upvw then
		var15_upvw:Destroy()
		var15_upvw = nil
	end
	local Character = LocalPlayer_upvr.Character
	if Character then
		setCharacterVisible_upvr(Character, true)
	end
	HidePower_upvr:Fire()
end
local Arrow_upvr = ReplicatedStorage:WaitForChild("Models"):WaitForChild("Arrow")
local ArrowsFolder_upvr = workspace:WaitForChild("ArrowsFolder")
local var65_upvw = 0
local function startAiming_upvr() -- Line 260, Named "startAiming"
	--[[ Upvalues[20]:
		[1]: var13_upvw (read and write)
		[2]: var15_upvw (read and write)
		[3]: LocalPlayer_upvr (readonly)
		[4]: UserInputService_upvr (readonly)
		[5]: var16_upvw (read and write)
		[6]: setCharacterVisible_upvr (readonly)
		[7]: var12_upvw (read and write)
		[8]: makeGhostFromCharacter_upvr (readonly)
		[9]: enableGhostEffects_upvr (readonly)
		[10]: var10_upvw (read and write)
		[11]: Arrow_upvr (readonly)
		[12]: ArrowsFolder_upvr (readonly)
		[13]: var11_upvw (read and write)
		[14]: RunService_upvr (readonly)
		[15]: stopAiming_upvr (readonly)
		[16]: CurrentCamera_upvr (readonly)
		[17]: tbl_2_upvr (readonly)
		[18]: var65_upvw (read and write)
		[19]: var14_upvw (read and write)
		[20]: SubmitAimDirection_upvr (readonly)
	]]
	if var13_upvw then
	else
		if var15_upvw then
			var15_upvw:Destroy()
			var15_upvw = nil
		end
		local Character_2 = LocalPlayer_upvr.Character
		if not Character_2 then return end
		while not LocalPlayer_upvr:GetAttribute("IsPenguin") and os.clock() - os.clock() < 2 do
			task.wait()
		end
		if not LocalPlayer_upvr:GetAttribute("IsPenguin") then return end
		local class_Humanoid = Character_2:FindFirstChildOfClass("Humanoid")
		if class_Humanoid then
			class_Humanoid.AutoRotate = false
		end
		UserInputService_upvr.MouseBehavior = Enum.MouseBehavior.Default
		var16_upvw = Character_2
		setCharacterVisible_upvr(var16_upvw, false)
		var12_upvw = 3
		var13_upvw = true
		LocalPlayer_upvr.CameraMinZoomDistance = 8
		LocalPlayer_upvr.CameraMaxZoomDistance = 19
		var15_upvw = makeGhostFromCharacter_upvr(Character_2)
		enableGhostEffects_upvr(var15_upvw)
		var10_upvw = Arrow_upvr:Clone()
		var10_upvw.Name = "LocalAimArrow"
		var10_upvw.Parent = ArrowsFolder_upvr
		var10_upvw.Color = LocalPlayer_upvr:GetAttribute("arrowColor")
		local Size_upvr = var10_upvw.Size
		local X_upvr = Size_upvr.X
		var11_upvw = RunService_upvr.RenderStepped:Connect(function(arg1) -- Line 307
			--[[ Upvalues[15]:
				[1]: var13_upvw (copied, read and write)
				[2]: var10_upvw (copied, read and write)
				[3]: var15_upvw (copied, read and write)
				[4]: var16_upvw (copied, read and write)
				[5]: setCharacterVisible_upvr (copied, readonly)
				[6]: LocalPlayer_upvr (copied, readonly)
				[7]: stopAiming_upvr (copied, readonly)
				[8]: CurrentCamera_upvr (copied, readonly)
				[9]: var12_upvw (copied, read and write)
				[10]: tbl_2_upvr (copied, readonly)
				[11]: var65_upvw (copied, read and write)
				[12]: var14_upvw (copied, read and write)
				[13]: SubmitAimDirection_upvr (copied, readonly)
				[14]: X_upvr (readonly)
				[15]: Size_upvr (readonly)
			]]
			local var81
			if not var13_upvw or not var10_upvw or not var15_upvw then
			else
				if var16_upvw then
					setCharacterVisible_upvr(var16_upvw, false)
				end
				if LocalPlayer_upvr.Character ~= var16_upvw then
					stopAiming_upvr()
					return
				end
				local var83 = LocalPlayer_upvr.Character
				if var83 then
					var81 = "HumanoidRootPart"
					var83 = LocalPlayer_upvr.Character:FindFirstChild(var81)
				end
				if not var83 then return end
				local Position_2 = var83.Position
				var81 = var13_upvw
				if var81 then
					var81 = var16_upvw
					if var81 then
						var81 = var16_upvw:FindFirstChildOfClass("Humanoid")
						if var81 and var81.AutoRotate then
							var81.AutoRotate = false
						end
					end
				end
				local LookVector_2 = CurrentCamera_upvr.CFrame.LookVector
				local vector3_2 = Vector3.new(LookVector_2.X, 0, LookVector_2.Z)
				if vector3_2.Magnitude < 0.001 then
					var81 = Vector3.new(0, 0, -1)
				else
					var81 = vector3_2.Unit
				end
				var15_upvw:PivotTo(CFrame.lookAt(Position_2 + Vector3.new(0, 0.05000, 0), Position_2 + Vector3.new(0, 0.05000, 0) + var81))
				local clamped_2 = math.clamp((var12_upvw - 1) / 9, 0, 1)
				tbl_2_upvr.dir = var81
				tbl_2_upvr.alpha = clamped_2
				tbl_2_upvr.time = os.clock()
				var65_upvw += arg1
				if 0.1 <= var65_upvw then
					var65_upvw = 0
					var14_upvw += 1
					SubmitAimDirection_upvr:FireServer({
						dir = tbl_2_upvr.dir;
						alpha = tbl_2_upvr.alpha;
						time = tbl_2_upvr.time;
						seq = var14_upvw;
					})
				end
				local var89 = X_upvr + clamped_2 * 15
				var10_upvw.Size = Vector3.new(var89, Size_upvr.Y, Size_upvr.Z)
				local var90 = Position_2 + var81 * (-0.5 + var89 / 2)
				var10_upvw:PivotTo(CFrame.lookAt(var90, var90 + var81))
			end
		end)
	end
end
UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 375
	--[[ Upvalues[3]:
		[1]: var13_upvw (read and write)
		[2]: var12_upvw (read and write)
		[3]: PowerChanged_upvr (readonly)
	]]
	if arg2 or not var13_upvw then
	else
		if arg1.KeyCode == Enum.KeyCode.E then
			var12_upvw = math.clamp(var12_upvw + 1, 1, 10)
		elseif arg1.KeyCode == Enum.KeyCode.Q then
			var12_upvw = math.clamp(var12_upvw - 1, 1, 10)
		end
		PowerChanged_upvr:Fire(var12_upvw)
	end
end)
Bindables:WaitForChild("Power").Event:Connect(function(arg1) -- Line 387
	--[[ Upvalues[2]:
		[1]: var12_upvw (read and write)
		[2]: PowerChanged_upvr (readonly)
	]]
	if arg1 == "Increase" then
		var12_upvw = math.clamp(var12_upvw + 1, 1, 10)
	else
		var12_upvw = math.clamp(var12_upvw - 1, 1, 10)
	end
	PowerChanged_upvr:Fire(var12_upvw)
end)
RemoteEvents:WaitForChild("StartAiming").OnClientEvent:Connect(function(arg1) -- Line 398
	--[[ Upvalues[2]:
		[1]: startAiming_upvr (readonly)
		[2]: PowerChanged_upvr (readonly)
	]]
	startAiming_upvr()
	PowerChanged_upvr:Fire(3)
end)
RemoteEvents:WaitForChild("RequestAim").OnClientEvent:Connect(function() -- Line 403
	--[[ Upvalues[4]:
		[1]: var14_upvw (read and write)
		[2]: SubmitAimDirection_upvr (readonly)
		[3]: tbl_2_upvr (readonly)
		[4]: stopAiming_upvr (readonly)
	]]
	var14_upvw += 1
	local tbl = {
		dir = tbl_2_upvr.dir or Vector3.new(0, 0, -1);
		alpha = tbl_2_upvr.alpha or 0;
	}
	local time = tbl_2_upvr.time
	if not time then
		time = os.clock()
	end
	tbl.time = time
	tbl.seq = var14_upvw
	SubmitAimDirection_upvr:FireServer(tbl)
	stopAiming_upvr()
end)
LocalPlayer_upvr:GetAttributeChangedSignal("IsPenguin"):Connect(function() -- Line 417
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	if LocalPlayer_upvr:GetAttribute("IsPenguin") then
		LocalPlayer_upvr.CameraMode = Enum.CameraMode.Classic
		LocalPlayer_upvr.CameraMinZoomDistance = 8
		LocalPlayer_upvr.CameraMaxZoomDistance = 19
	else
		LocalPlayer_upvr.CameraMinZoomDistance = 0
		LocalPlayer_upvr.CameraMaxZoomDistance = 20
	end
end)
LocalPlayer_upvr.CharacterAdded:Connect(function(arg1) -- Line 433
	--[[ Upvalues[10]:
		[1]: var13_upvw (read and write)
		[2]: stopAiming_upvr (readonly)
		[3]: bindVisibilityEnforcer_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
		[5]: CurrentCamera_upvr (readonly)
		[6]: var11_upvw (read and write)
		[7]: var10_upvw (read and write)
		[8]: var15_upvw (read and write)
		[9]: var16_upvw (read and write)
		[10]: setCharacterVisible_upvr (readonly)
	]]
	if var13_upvw then
		stopAiming_upvr()
	end
	bindVisibilityEnforcer_upvr(arg1)
	if LocalPlayer_upvr:GetAttribute("IsPenguin") then
		LocalPlayer_upvr.CameraMode = Enum.CameraMode.Classic
		LocalPlayer_upvr.CameraMinZoomDistance = 8
		LocalPlayer_upvr.CameraMaxZoomDistance = 19
		CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
		CurrentCamera_upvr.CameraSubject = arg1:WaitForChild("Humanoid")
	end
	if var11_upvw then
		var11_upvw:Disconnect()
		var11_upvw = nil
	end
	if var10_upvw then
		var10_upvw:Destroy()
		var10_upvw = nil
	end
	if var15_upvw then
		var15_upvw:Destroy()
		var15_upvw = nil
	end
	var16_upvw = arg1
	task.wait()
	setCharacterVisible_upvr(arg1, true)
end)
RunService_upvr.Heartbeat:Connect(function() -- Line 466
	--[[ Upvalues[3]:
		[1]: var13_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: stopAiming_upvr (readonly)
	]]
	if var13_upvw and not LocalPlayer_upvr:GetAttribute("IsPenguin") then
		stopAiming_upvr()
	end
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayEffects
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:53
-- Luau version 6, Types version 3
-- Time taken: 0.003653 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local function setEmittersEnabled_upvr(arg1, arg2) -- Line 5, Named "setEmittersEnabled"
	for _, v in ipairs(arg1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = arg2
		end
	end
end
ReplicatedStorage.RemoteEvents:WaitForChild("PlayWinEffects").OnClientEvent:Connect(function(arg1) -- Line 13
	--[[ Upvalues[1]:
		[1]: setEmittersEnabled_upvr (readonly)
	]]
	if not arg1 then
	else
		if not arg1.Parent then
			arg1:GetPropertyChangedSignal("Parent"):Wait()
		end
		setEmittersEnabled_upvr(arg1, true)
		task.wait(5)
		if arg1 and arg1.Parent then
			setEmittersEnabled_upvr(arg1, false)
		end
	end
end)
ReplicatedStorage.RemoteEvents:WaitForChild("PlaySplashEffects").OnClientEvent:Connect(function(arg1) -- Line 33
	--[[ Upvalues[1]:
		[1]: setEmittersEnabled_upvr (readonly)
	]]
	if not arg1 then
	else
		if not arg1.Parent then
			arg1:GetPropertyChangedSignal("Parent"):Wait()
		end
		setEmittersEnabled_upvr(arg1, true)
		task.wait(5)
		if arg1 and arg1.Parent then
			setEmittersEnabled_upvr(arg1, false)
		end
	end
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.TextScript
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:54
-- Luau version 6, Types version 3
-- Time taken: 0.005847 seconds

local tbl_upvr = {Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157), Color3.new(0.00392156862745098, 0.6352941176470588, 1), Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353), BrickColor.new("Bright violet").Color, BrickColor.new("Bright orange").Color, BrickColor.new("Bright yellow").Color, BrickColor.new("Light reddish violet").Color, BrickColor.new("Brick yellow").Color}
local function GetNameValue_upvr(arg1) -- Line 18, Named "GetNameValue"
	local var4
	for i = 1, #arg1 do
		local var5 = #arg1 - i + 1
		local var6
		if #arg1 % 2 == 1 then
			var5 -= 1
		end
		if 2 <= var5 % 4 then
			var6 = -var6
		end
		var4 += var6
	end
	return var4
end
local function _(arg1) -- Line 34, Named "ComputeNameColor"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: GetNameValue_upvr (readonly)
	]]
	return tbl_upvr[GetNameValue_upvr(arg1) % #tbl_upvr + 1]
end
local Players_upvr = game:GetService("Players")
local TitleDefinitions_upvr = require(game.ReplicatedStorage.Modules.TitleDefinitions)
game:GetService("TextChatService").OnIncomingMessage = function(arg1) -- Line 39
	--[[ Upvalues[4]:
		[1]: Players_upvr (readonly)
		[2]: TitleDefinitions_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: GetNameValue_upvr (readonly)
	]]
	local TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties")
	if arg1.Metadata == "Roblox.Team.Success.NowInTeam" then
		TextChatMessageProperties_2.Text = ' '
		return TextChatMessageProperties_2
	end
	if not arg1.TextSource then
		return TextChatMessageProperties_2
	end
	local any_GetPlayerByUserId_result1_2 = Players_upvr:GetPlayerByUserId(arg1.TextSource.UserId)
	if not any_GetPlayerByUserId_result1_2 then
		return TextChatMessageProperties_2
	end
	local var18 = ""
	local EquippedTitle = any_GetPlayerByUserId_result1_2:GetAttribute("EquippedTitle")
	if EquippedTitle ~= "NONE" then
		local var20 = TitleDefinitions_upvr.Definitions[EquippedTitle]
		if var20 then
			var18 = string.format("<font color='rgb(%d,%d,%d)'>[%s]</font> ", var20.Color.R * 255, var20.Color.G * 255, var20.Color.B * 255, var20.Name)
		end
	end
	local var21 = tbl_upvr[GetNameValue_upvr(any_GetPlayerByUserId_result1_2.Name) % #tbl_upvr + 1]
	TextChatMessageProperties_2.PrefixText = var18..string.format("<font color='rgb(%d,%d,%d)'>%s</font>:", var21.R * 255, var21.G * 255, var21.B * 255, any_GetPlayerByUserId_result1_2.DisplayName)
	return TextChatMessageProperties_2
end
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.CameraControlScript
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:54
-- Luau version 6, Types version 3
-- Time taken: 0.004013 seconds

local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local CurrentCamera_upvr = workspace.CurrentCamera
local any_GetControls_result1_upvr = require(LocalPlayer_upvr.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local function _(arg1) -- Line 8, Named "bindCamera"
	--[[ Upvalues[1]:
		[1]: CurrentCamera_upvr (readonly)
	]]
	if not arg1 then
	else
		local Humanoid = arg1:WaitForChild("Humanoid", 5)
		if not Humanoid then return end
		CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
		CurrentCamera_upvr.CameraSubject = Humanoid
	end
end
LocalPlayer_upvr.CharacterAdded:Connect(function(arg1) -- Line 19
	--[[ Upvalues[3]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: any_GetControls_result1_upvr (readonly)
	]]
	if not arg1 then
	else
		local Humanoid_2 = arg1:WaitForChild("Humanoid", 5)
		if not Humanoid_2 then
		else
			CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
			CurrentCamera_upvr.CameraSubject = Humanoid_2
		end
	end
	if LocalPlayer_upvr:GetAttribute("IsPenguin") then
		any_GetControls_result1_upvr:Disable()
	else
		any_GetControls_result1_upvr:Enable()
	end
end)
LocalPlayer_upvr:GetAttributeChangedSignal("IsPenguin"):Connect(function() -- Line 30
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: CurrentCamera_upvr (readonly)
		[3]: any_GetControls_result1_upvr (readonly)
	]]
	local Character = LocalPlayer_upvr.Character
	if not Character then
	else
		if not Character then
		else
			local Humanoid_3 = Character:WaitForChild("Humanoid", 5)
			if not Humanoid_3 then
			else
				CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
				CurrentCamera_upvr.CameraSubject = Humanoid_3
			end
		end
		if LocalPlayer_upvr:GetAttribute("IsPenguin") then
			any_GetControls_result1_upvr:Disable()
			return
		end
		any_GetControls_result1_upvr:Enable()
	end
end)
task.spawn(function() -- Line 43
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: CurrentCamera_upvr (readonly)
	]]
	while true do
		local var11
		var11 = 0.5
		task.wait(var11)
		var11 = LocalPlayer_upvr
		var11 = var11.Character
		if var11 then
			var11 = var11.Character:FindFirstChild("Humanoid")
		end
		if var11 and CurrentCamera_upvr.CameraSubject ~= var11 then
			CurrentCamera_upvr.CameraSubject = var11
		end
	end
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.UIAnimationController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:55
-- Luau version 6, Types version 3
-- Time taken: 0.003036 seconds

local CollectionService = game:GetService("CollectionService")
local module_upvr = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("UIAnimator"))
task.wait(1)
local function _(arg1) -- Line 7, Named "connectFrame"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 8
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: module_upvr (copied, readonly)
		]]
		if arg1.Visible then
			module_upvr:PopOpen(arg1)
		else
			module_upvr:PopClose(arg1)
		end
	end)
end
for _, v_upvr in ipairs(CollectionService:GetTagged("MainFrame")) do
	v_upvr:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 8
		--[[ Upvalues[2]:
			[1]: v_upvr (readonly)
			[2]: module_upvr (readonly)
		]]
		if v_upvr.Visible then
			module_upvr:PopOpen(v_upvr)
		else
			module_upvr:PopClose(v_upvr)
		end
	end)
end
CollectionService:GetInstanceAddedSignal("MainFrame"):Connect(function(arg1) -- Line 23
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 8
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: module_upvr (copied, readonly)
		]]
		if arg1.Visible then
			module_upvr:PopOpen(arg1)
		else
			module_upvr:PopClose(arg1)
		end
	end)
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.JoinScript
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:55
-- Luau version 6, Types version 3
-- Time taken: 0.002086 seconds

local RBXSystem_upvr = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXSystem")
local time_result1_upvr = time()
local function DisplayMessage_upvr(arg1) -- Line 10, Named "DisplayMessage"
	--[[ Upvalues[2]:
		[1]: RBXSystem_upvr (readonly)
		[2]: time_result1_upvr (readonly)
	]]
	local function _() -- Line 11, Named "Show"
		--[[ Upvalues[2]:
			[1]: RBXSystem_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		RBXSystem_upvr:DisplaySystemMessage(arg1)
	end
	if 1 < time() - time_result1_upvr then
		RBXSystem_upvr:DisplaySystemMessage(arg1)
	else
		coroutine.wrap(function() -- Line 18
			--[[ Upvalues[3]:
				[1]: time_result1_upvr (copied, readonly)
				[2]: RBXSystem_upvr (copied, readonly)
				[3]: arg1 (readonly)
			]]
			task.wait((1) - (workspace:GetServerTimeNow() - time_result1_upvr))
			RBXSystem_upvr:DisplaySystemMessage(arg1)
		end)()
	end
end
game:GetService("ReplicatedStorage").RemoteEvents.PlayerGameStatusMessage.OnClientEvent:Connect(function(arg1, arg2) -- Line 25
	--[[ Upvalues[1]:
		[1]: DisplayMessage_upvr (readonly)
	]]
	if arg1 then
		DisplayMessage_upvr(arg1.DisplayName.." has "..arg2.." the game")
	end
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PromptFavorite
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:56
-- Luau version 6, Types version 3
-- Time taken: 0.000971 seconds

local AvatarEditorService_upvr = game:GetService("AvatarEditorService")
game:GetService("ReplicatedStorage").RemoteEvents.PromptFavorite.OnClientEvent:Connect(function() -- Line 7
	--[[ Upvalues[1]:
		[1]: AvatarEditorService_upvr (readonly)
	]]
	AvatarEditorService_upvr:PromptSetFavorite(game.PlaceId, Enum.AvatarItemType.Asset, true)
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PromptGroupJoinScript
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:56
-- Luau version 6, Types version 3
-- Time taken: 0.001459 seconds

local GroupService_upvr = game:GetService("GroupService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
game:GetService("ReplicatedStorage").RemoteEvents.PromptGroupJoin.OnClientEvent:Connect(function() -- Line 8
	--[[ Upvalues[2]:
		[1]: GroupService_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local pcall_result1, pcall_result2 = pcall(function() -- Line 9
		--[[ Upvalues[1]:
			[1]: GroupService_upvr (copied, readonly)
		]]
		return GroupService_upvr:PromptJoinAsync(5268948)
	end)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 19. Error Block 5 start (CF ANALYSIS FAILED)
	print("Already a member")
	do
		return
	end
	-- KONSTANTERROR: [25] 19. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [30] 23. Error Block 6 start (CF ANALYSIS FAILED)
	warn("Prompt failed:", pcall_result2)
	-- KONSTANTERROR: [30] 23. Error Block 6 end (CF ANALYSIS FAILED)
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.GuiUnlockFirstPersonV2
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:56
-- Luau version 6, Types version 3
-- Time taken: 0.006863 seconds

-- KONSTANTERROR: [0] 1. Error Block 27 start (CF ANALYSIS FAILED)
local CollectionService_upvr = game:GetService("CollectionService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui_upvr = LocalPlayer:WaitForChild("PlayerGui")
local function createUnlockOverlay_upvr() -- Line 16, Named "createUnlockOverlay"
	--[[ Upvalues[1]:
		[1]: PlayerGui_upvr (readonly)
	]]
	local MouseUnlockOverlay_2 = PlayerGui_upvr:FindFirstChild("MouseUnlockOverlay")
	if not MouseUnlockOverlay_2 then
		MouseUnlockOverlay_2 = Instance.new("ScreenGui", PlayerGui_upvr)
		MouseUnlockOverlay_2.Name = "MouseUnlockOverlay"
	end
	local TextButton = Instance.new("TextButton")
	TextButton.BackgroundTransparency = 1
	TextButton.Size = UDim2.new(0, 0, 0, 0)
	TextButton.Modal = true
	TextButton.Parent = MouseUnlockOverlay_2
end
local function _() -- Line 30, Named "removeUnlockOverlay"
	--[[ Upvalues[1]:
		[1]: PlayerGui_upvr (readonly)
	]]
	local MouseUnlockOverlay = PlayerGui_upvr:FindFirstChild("MouseUnlockOverlay")
	if MouseUnlockOverlay then
		MouseUnlockOverlay:Destroy()
	end
end
local function isActuallyVisible_upvr(arg1) -- Line 38, Named "isActuallyVisible"
	--[[ Upvalues[1]:
		[1]: PlayerGui_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 32 start (CF ANALYSIS FAILED)
	if not arg1:IsDescendantOf(PlayerGui_upvr) then
		return false
	end
	if arg1:IsA("ScreenGui") then
		if not arg1.Enabled then
			do
				return false
			end
			-- KONSTANTWARNING: GOTO [23] #20
		end
	elseif not arg1.Visible then
		return false
	end
	-- KONSTANTERROR: [0] 1. Error Block 32 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 20. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 20. Error Block 9 end (CF ANALYSIS FAILED)
end
local function _() -- Line 66, Named "isAnyModalVisible"
	--[[ Upvalues[2]:
		[1]: CollectionService_upvr (readonly)
		[2]: isActuallyVisible_upvr (readonly)
	]]
	for _, v in ipairs(CollectionService_upvr:GetTagged("UnlockFirstPerson")) do
		if isActuallyVisible_upvr(v) then
			return true
		end
	end
	return false
end
local function onModalVisibilityChanged_upvr() -- Line 76, Named "onModalVisibilityChanged"
	--[[ Upvalues[4]:
		[1]: CollectionService_upvr (readonly)
		[2]: isActuallyVisible_upvr (readonly)
		[3]: createUnlockOverlay_upvr (readonly)
		[4]: PlayerGui_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local ipairs_result1, ipairs_result2_2, ipairs_result3_2 = ipairs(CollectionService_upvr:GetTagged("UnlockFirstPerson"))
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 14. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 14. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 14 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [15.6]
	if nil then
		-- KONSTANTWARNING: GOTO [18] #16
	end
	-- KONSTANTERROR: [9] 8. Error Block 14 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 84, Named "wireModalSignals"
	--[[ Upvalues[1]:
		[1]: onModalVisibilityChanged_upvr (readonly)
	]]
	if arg1:IsA("ScreenGui") then
		arg1:GetPropertyChangedSignal("Enabled"):Connect(onModalVisibilityChanged_upvr)
	else
		arg1:GetPropertyChangedSignal("Visible"):Connect(onModalVisibilityChanged_upvr)
	end
end
local var22
for _, _ in ipairs(CollectionService_upvr:GetTagged("UnlockFirstPerson")) do
	var22 = _:IsA("ScreenGui")
	if var22 then
		var22 = _:GetPropertyChangedSignal("Enabled"):Connect
		var22(onModalVisibilityChanged_upvr)
	else
		var22 = _:GetPropertyChangedSignal("Visible"):Connect
		var22(onModalVisibilityChanged_upvr)
	end
end
CollectionService_upvr:GetInstanceAddedSignal("UnlockFirstPerson"):Connect(function(arg1) -- Line 98
	--[[ Upvalues[1]:
		[1]: onModalVisibilityChanged_upvr (readonly)
	]]
	if arg1:IsA("ScreenGui") then
		arg1:GetPropertyChangedSignal("Enabled"):Connect(onModalVisibilityChanged_upvr)
	else
		arg1:GetPropertyChangedSignal("Visible"):Connect(onModalVisibilityChanged_upvr)
	end
end)
LocalPlayer.CharacterAdded:Connect(function() -- Line 103
	--[[ Upvalues[4]:
		[1]: CollectionService_upvr (readonly)
		[2]: isActuallyVisible_upvr (readonly)
		[3]: createUnlockOverlay_upvr (readonly)
		[4]: PlayerGui_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local ipairs_result1_4, ipairs_result2_4, ipairs_result3 = ipairs(CollectionService_upvr:GetTagged("UnlockFirstPerson"))
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 14. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 14. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 14 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [15.6]
	if nil then
		-- KONSTANTWARNING: GOTO [18] #16
	end
	-- KONSTANTERROR: [9] 8. Error Block 14 end (CF ANALYSIS FAILED)
end)
local ipairs_result1_3, ipairs_result2, ipairs_result3_5 = ipairs(CollectionService_upvr:GetTagged("UnlockFirstPerson"))
-- KONSTANTERROR: [0] 1. Error Block 27 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [100] 81. Error Block 10 start (CF ANALYSIS FAILED)
-- KONSTANTERROR: [100] 81. Error Block 10 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [94] 75. Error Block 21 start (CF ANALYSIS FAILED)
-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [100.16]
if nil then
	-- KONSTANTWARNING: GOTO [103] #83
end
-- KONSTANTERROR: [94] 75. Error Block 21 end (CF ANALYSIS FAILED)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.UITween
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:57
-- Luau version 6, Types version 3
-- Time taken: 0.005477 seconds

local TweenService_upvr = game:GetService("TweenService")
local CollectionService_upvr = game:GetService("CollectionService")
local TweenInfo_new_result1_upvr = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tbl_upvr = {}
local function setInteractable_upvr(arg1, arg2) -- Line 15, Named "setInteractable"
	arg1.Active = arg2
	arg1.Selectable = arg2
	arg1.AutoButtonColor = arg2
	for _, v in ipairs(arg1:GetDescendants()) do
		if v:IsA("GuiButton") then
			v.Active = arg2
			v.Selectable = arg2
			v.AutoButtonColor = arg2
		end
	end
end
local function tweenOut_upvr(arg1) -- Line 29, Named "tweenOut"
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: setInteractable_upvr (readonly)
		[3]: TweenService_upvr (readonly)
		[4]: TweenInfo_new_result1_upvr (readonly)
	]]
	if not tbl_upvr[arg1] then
		tbl_upvr[arg1] = {
			Position = arg1.Position;
		}
	end
	setInteractable_upvr(arg1, false)
	TweenService_upvr:Create(arg1, TweenInfo_new_result1_upvr, {
		Position = arg1.Position + UDim2.fromScale(1.2, 0);
	}):Play()
end
local function tweenIn_upvr(arg1) -- Line 45, Named "tweenIn"
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: setInteractable_upvr (readonly)
		[3]: TweenService_upvr (readonly)
		[4]: TweenInfo_new_result1_upvr (readonly)
	]]
	local var16 = tbl_upvr[arg1]
	if not var16 then
	else
		setInteractable_upvr(arg1, true)
		TweenService_upvr:Create(arg1, TweenInfo_new_result1_upvr, {
			Position = var16.Position;
		}):Play()
	end
end
local var18_upvw
local function onFrameVisibilityChanged_upvr(arg1) -- Line 56, Named "onFrameVisibilityChanged"
	--[[ Upvalues[4]:
		[1]: var18_upvw (read and write)
		[2]: CollectionService_upvr (readonly)
		[3]: tweenIn_upvr (readonly)
		[4]: tweenOut_upvr (readonly)
	]]
	if not arg1.Visible then
		if var18_upvw == arg1 then
			var18_upvw = nil
			for _, v_2 in ipairs(CollectionService_upvr:GetTagged("FocusableUI")) do
				if v_2 ~= arg1 then
					tweenIn_upvr(v_2)
				end
			end
		end
	else
		var18_upvw = arg1
		for _, v_4 in ipairs(CollectionService_upvr:GetTagged("FocusableUI")) do
			if v_4 ~= arg1 and v_4.Visible then
				tweenOut_upvr(v_4)
			end
		end
	end
end
for _, v_3_upvr in ipairs(CollectionService_upvr:GetTagged("FocusableUI")) do
	v_3_upvr:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 81
		--[[ Upvalues[2]:
			[1]: onFrameVisibilityChanged_upvr (readonly)
			[2]: v_3_upvr (readonly)
		]]
		onFrameVisibilityChanged_upvr(v_3_upvr)
	end)
end
CollectionService_upvr:GetInstanceAddedSignal("FocusableUI"):Connect(function(arg1) -- Line 80, Named "trackFrame"
	--[[ Upvalues[1]:
		[1]: onFrameVisibilityChanged_upvr (readonly)
	]]
	arg1:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 81
		--[[ Upvalues[2]:
			[1]: onFrameVisibilityChanged_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		onFrameVisibilityChanged_upvr(arg1)
	end)
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.TopBarScript
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:57
-- Luau version 6, Types version 3
-- Time taken: 0.001139 seconds

local any_new_result1_upvr = require(game:GetService("ReplicatedStorage").Icon).new()
any_new_result1_upvr:setImage(106070320169447):setLabel(" Music"):setCaption("Toggles the background music on/off")
any_new_result1_upvr.toggled:Connect(function(arg1) -- Line 8
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	if arg1 then
		any_new_result1_upvr:setImage(71608760356021)
	else
		any_new_result1_upvr:setImage(106070320169447)
	end
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.RbxCharacterSounds
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:58
-- Luau version 6, Types version 3
-- Time taken: 0.018650 seconds

local Players_upvr = game:GetService("Players")
local function _(arg1) -- Line 12, Named "loadFlag"
	local pcall_result1_3, pcall_result2_3 = pcall(function() -- Line 13
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return UserSettings():IsUserFeatureEnabled(arg1)
	end)
	return pcall_result1_3 and pcall_result2_3
end
local var13_upvr = "UserSoundsUseRelativeVelocity2"
local pcall_result1, pcall_result2_2 = pcall(function() -- Line 13
	--[[ Upvalues[1]:
		[1]: var13_upvr (readonly)
	]]
	return UserSettings():IsUserFeatureEnabled(var13_upvr)
end)
local var18_upvr = "UserNewCharacterSoundsApi3"
function var13_upvr() -- Line 13
	--[[ Upvalues[1]:
		[1]: var18_upvr (readonly)
	]]
	return UserSettings():IsUserFeatureEnabled(var18_upvr)
end
local pcall_result1_2, pcall_result2 = pcall(var13_upvr)
local var17_upvr = pcall_result1_2 and pcall_result2
pcall_result2 = pcall
local var19_upvr = "UserFixCharSoundsEmitters"
function var18_upvr() -- Line 13
	--[[ Upvalues[1]:
		[1]: var19_upvr (readonly)
	]]
	return UserSettings():IsUserFeatureEnabled(var19_upvr)
end
pcall_result2 = pcall_result2(var18_upvr)
local pcall_result2_result1, var16_result2 = pcall_result2(var18_upvr)
pcall_result2_result1 = {}
local var22_upvr = pcall_result2_result1
var16_result2 = {}
local var23 = var16_result2
var19_upvr = "rbxasset://sounds/action_footsteps_plastic.mp3"
var23.SoundId = var19_upvr
var19_upvr = true
var23.Looped = var19_upvr
var22_upvr.Climbing = var23
var23 = {}
local var24 = var23
var19_upvr = "rbxasset://sounds/uuhhh.mp3"
var24.SoundId = var19_upvr
var22_upvr.Died = var24
var24 = {}
local var25 = var24
var19_upvr = "rbxasset://sounds/action_falling.ogg"
var25.SoundId = var19_upvr
var19_upvr = true
var25.Looped = var19_upvr
var22_upvr.FreeFalling = var25
var25 = {}
local var26 = var25
var19_upvr = "rbxasset://sounds/action_get_up.mp3"
var26.SoundId = var19_upvr
var22_upvr.GettingUp = var26
var26 = {}
local var27 = var26
var19_upvr = "rbxasset://sounds/action_jump.mp3"
var27.SoundId = var19_upvr
var22_upvr.Jumping = var27
var27 = {}
local var28 = var27
var19_upvr = "rbxasset://sounds/action_jump_land.mp3"
var28.SoundId = var19_upvr
var22_upvr.Landing = var28
var28 = {}
local var29 = var28
var19_upvr = "rbxasset://sounds/action_footsteps_plastic.mp3"
var29.SoundId = var19_upvr
var19_upvr = true
var29.Looped = var19_upvr
var19_upvr = 1.85
var29.Pitch = var19_upvr
var22_upvr.Running = var29
var29 = {}
local var30 = var29
var19_upvr = "rbxasset://sounds/impact_water.mp3"
var30.SoundId = var19_upvr
var22_upvr.Splash = var30
var30 = {}
local var31 = var30
var19_upvr = "rbxasset://sounds/action_swim.mp3"
var31.SoundId = var19_upvr
var19_upvr = true
var31.Looped = var19_upvr
var19_upvr = 1.6
var31.Pitch = var19_upvr
var22_upvr.Swimming = var31
var31 = {}
local var32_upvr = var31
var19_upvr = {}
local var33 = var19_upvr
var33.AssetId = "rbxasset://sounds/action_footsteps_plastic.mp3"
var33.Looping = true
var32_upvr.Climbing = var33
var33 = {}
local var34 = var33
var34.AssetId = "rbxasset://sounds/uuhhh.mp3"
var32_upvr.Died = var34
var34 = {}
local var35 = var34
var35.AssetId = "rbxasset://sounds/action_falling.ogg"
var35.Looping = true
var32_upvr.FreeFalling = var35
var35 = {}
local var36 = var35
var36.AssetId = "rbxasset://sounds/action_get_up.mp3"
var32_upvr.GettingUp = var36
var36 = {}
local var37 = var36
var37.AssetId = "rbxasset://sounds/action_jump.mp3"
var32_upvr.Jumping = var37
var37 = {}
local var38 = var37
var38.AssetId = "rbxasset://sounds/action_jump_land.mp3"
var32_upvr.Landing = var38
var38 = {}
local var39 = var38
var39.AssetId = "rbxasset://sounds/action_footsteps_plastic.mp3"
var39.Looping = true
var39.PlaybackSpeed = 1.85
var32_upvr.Running = var39
var39 = {}
local var40 = var39
var40.AssetId = "rbxasset://sounds/impact_water.mp3"
var32_upvr.Splash = var40
var40 = {}
local map = var40
map.AssetId = "rbxasset://sounds/action_swim.mp3"
map.Looping = true
map.PlaybackSpeed = 1.6
var32_upvr.Swimming = map
function map(arg1, arg2, arg3, arg4, arg5) -- Line 96
	return (arg1 - arg2) * (arg5 - arg4) / (arg3 - arg2) + arg4
end
local function getRelativeVelocity_upvr(arg1, arg2) -- Line 100, Named "getRelativeVelocity"
	if not arg1 then
		return arg2
	end
	local var42
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var42 = arg1.GroundSensor
		return var42
	end
	if var42 and (not arg1.ActiveController:IsA("GroundController") or not INLINED()) then
		var42 = arg1.ActiveController:IsA("ClimbController")
		if var42 then
			var42 = arg1.ClimbSensor
		end
	end
	if var42 and var42.SensedPart then
		return arg2 - var42.SensedPart:GetVelocityAtPosition(arg1.RootPart.Position)
	end
	return arg2
end
local function _(arg1, arg2) -- Line 117, Named "playSound"
	--[[ Upvalues[1]:
		[1]: var17_upvr (readonly)
	]]
	if not arg2 then
		arg1.TimePosition = 0
	end
	if var17_upvr and arg1:IsA("AudioPlayer") then
		arg1:Play()
	else
		arg1.Playing = true
	end
end
local function _(arg1) -- Line 128, Named "stopSound"
	--[[ Upvalues[1]:
		[1]: var17_upvr (readonly)
	]]
	if var17_upvr and arg1:IsA("AudioPlayer") then
		arg1:Stop()
	else
		arg1.Playing = false
	end
end
local function _(arg1, arg2) -- Line 136, Named "playSoundIf"
	--[[ Upvalues[1]:
		[1]: var17_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 16. Error Block 8 start (CF ANALYSIS FAILED)
	arg1:Play()
	do
		return
	end
	-- KONSTANTERROR: [19] 16. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 19. Error Block 9 start (CF ANALYSIS FAILED)
	arg1.Playing = arg2
	-- KONSTANTERROR: [23] 19. Error Block 9 end (CF ANALYSIS FAILED)
end
local function _(arg1, arg2) -- Line 148, Named "setSoundLooped"
	--[[ Upvalues[1]:
		[1]: var17_upvr (readonly)
	]]
	if var17_upvr and arg1:IsA("AudioPlayer") then
		arg1.Looping = arg2
	else
		arg1.Looped = arg2
	end
end
local function _(arg1) -- Line 156, Named "shallowCopy"
	local module = {}
	for i, v in pairs(arg1) do
		module[i] = v
	end
	return module
end
local var51_upvr = pcall_result1 and pcall_result2_2
local SoundService_upvr = game:GetService("SoundService")
local var53_upvr = pcall_result2_result1 and var16_result2
local RunService_upvr = game:GetService("RunService")
local any_new_result1_upvr = require(script:WaitForChild("AtomicBinding")).new({
	humanoid = "Humanoid";
	rootPart = "HumanoidRootPart";
}, function(arg1) -- Line 164, Named "initializeSoundSystem"
	--[[ Upvalues[9]:
		[1]: var51_upvr (readonly)
		[2]: var17_upvr (readonly)
		[3]: SoundService_upvr (readonly)
		[4]: var53_upvr (readonly)
		[5]: Players_upvr (readonly)
		[6]: var32_upvr (readonly)
		[7]: var22_upvr (readonly)
		[8]: getRelativeVelocity_upvr (readonly)
		[9]: RunService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 3 end (CF ANALYSIS FAILED)
end)
local tbl_upvr = {}
local function characterAdded_upvr(arg1) -- Line 410, Named "characterAdded"
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	any_new_result1_upvr:bindRoot(arg1)
end
local function characterRemoving_upvr(arg1) -- Line 414, Named "characterRemoving"
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	any_new_result1_upvr:unbindRoot(arg1)
end
local function playerAdded(arg1) -- Line 418
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: any_new_result1_upvr (readonly)
		[3]: characterAdded_upvr (readonly)
		[4]: characterRemoving_upvr (readonly)
	]]
	local var58 = tbl_upvr[arg1]
	if not var58 then
		var58 = {}
		tbl_upvr[arg1] = var58
	end
	if arg1.Character then
		any_new_result1_upvr:bindRoot(arg1.Character)
	end
	table.insert(var58, arg1.CharacterAdded:Connect(characterAdded_upvr))
	table.insert(var58, arg1.CharacterRemoving:Connect(characterRemoving_upvr))
end
for _, v_3 in ipairs(Players_upvr:GetPlayers()) do
	task.spawn(playerAdded, v_3)
end
Players_upvr.PlayerAdded:Connect(playerAdded)
Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 432, Named "playerRemoving"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: any_new_result1_upvr (readonly)
	]]
	local var61 = tbl_upvr[arg1]
	if var61 then
		for _, v_2 in ipairs(var61) do
			v_2:Disconnect()
		end
		tbl_upvr[arg1] = nil
	end
	if arg1.Character then
		any_new_result1_upvr:unbindRoot(arg1.Character)
	end
end)
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:59
-- Luau version 6, Types version 3
-- Time taken: 0.001599 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 12
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.cameras = require(script:WaitForChild("CameraModule"))
	setmetatable_result1.controls = require(script:WaitForChild("ControlModule"))
	return setmetatable_result1
end
function module_upvr.GetCameras(arg1) -- Line 19
	return arg1.cameras
end
function module_upvr.GetControls(arg1) -- Line 23
	return arg1.controls
end
function module_upvr.GetClickToMoveController(arg1) -- Line 27
	return arg1.controls:GetClickToMoveController()
end
return module_upvr.new()
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerScriptsLoader
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:18
-- Luau version 6, Types version 3
-- Time taken: 0.000431 seconds

require(script.Parent:WaitForChild("PlayerModule"))
--------------------
📂 [SERVICE: ControlModule]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Keyboard
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:10
-- Luau version 6, Types version 3
-- Time taken: 0.009224 seconds

local zero_vector3_upvr = Vector3.new()
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new(arg1) -- Line 22
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.forwardValue = 0
	setmetatable_result1.backwardValue = 0
	setmetatable_result1.leftValue = 0
	setmetatable_result1.rightValue = 0
	setmetatable_result1.jumpEnabled = true
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.Enable(arg1, arg2) -- Line 37
	--[[ Upvalues[1]:
		[1]: zero_vector3_upvr (readonly)
	]]
	if arg2 == arg1.enabled then
		return true
	end
	arg1.forwardValue = 0
	arg1.backwardValue = 0
	arg1.leftValue = 0
	arg1.rightValue = 0
	arg1.moveVector = zero_vector3_upvr
	arg1.jumpRequested = false
	arg1:UpdateJump()
	if arg2 then
		arg1:BindContextActions()
		arg1:ConnectFocusEventListeners()
	else
		arg1._connectionUtil:disconnectAll()
	end
	arg1.enabled = arg2
	return true
end
function setmetatable_result1_2_upvr.UpdateMovement(arg1, arg2) -- Line 64
	--[[ Upvalues[1]:
		[1]: zero_vector3_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Cancel then
		arg1.moveVector = zero_vector3_upvr
	else
		arg1.moveVector = Vector3.new(arg1.leftValue + arg1.rightValue, 0, arg1.forwardValue + arg1.backwardValue)
	end
end
function setmetatable_result1_2_upvr.UpdateJump(arg1) -- Line 72
	arg1.isJumping = arg1.jumpRequested
end
local ContextActionService_upvr = game:GetService("ContextActionService")
function setmetatable_result1_2_upvr.BindContextActions(arg1) -- Line 76
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:BindActionAtPriority("moveForwardAction", function(arg1_2, arg2, arg3) -- Line 82
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var7
		if arg2 == Enum.UserInputState.Begin then
			var7 = -1
		else
			var7 = 0
		end
		arg1.forwardValue = var7
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward)
	ContextActionService_upvr:BindActionAtPriority("moveBackwardAction", function(arg1_3, arg2, arg3) -- Line 88
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var9
		if arg2 == Enum.UserInputState.Begin then
			var9 = 1
		else
			var9 = 0
		end
		arg1.backwardValue = var9
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward)
	ContextActionService_upvr:BindActionAtPriority("moveLeftAction", function(arg1_4, arg2, arg3) -- Line 94
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var11
		if arg2 == Enum.UserInputState.Begin then
			var11 = -1
		else
			var11 = 0
		end
		arg1.leftValue = var11
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft)
	ContextActionService_upvr:BindActionAtPriority("moveRightAction", function(arg1_5, arg2, arg3) -- Line 100
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var13
		if arg2 == Enum.UserInputState.Begin then
			var13 = 1
		else
			var13 = 0
		end
		arg1.rightValue = var13
		arg1:UpdateMovement(arg2)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight)
	ContextActionService_upvr:BindActionAtPriority("jumpAction", function(arg1_6, arg2, arg3) -- Line 106
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local jumpEnabled = arg1.jumpEnabled
		if jumpEnabled then
			if arg2 ~= Enum.UserInputState.Begin then
				jumpEnabled = false
			else
				jumpEnabled = true
			end
		end
		arg1.jumpRequested = jumpEnabled
		arg1:UpdateJump()
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump)
	arg1._connectionUtil:trackBoundFunction("moveForwardAction", function() -- Line 125
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveForwardAction")
	end)
	arg1._connectionUtil:trackBoundFunction("moveBackwardAction", function() -- Line 126
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveBackwardAction")
	end)
	arg1._connectionUtil:trackBoundFunction("moveLeftAction", function() -- Line 127
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveLeftAction")
	end)
	arg1._connectionUtil:trackBoundFunction("moveRightAction", function() -- Line 128
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("moveRightAction")
	end)
	arg1._connectionUtil:trackBoundFunction("jumpAction", function() -- Line 129
		--[[ Upvalues[1]:
			[1]: ContextActionService_upvr (copied, readonly)
		]]
		ContextActionService_upvr:UnbindAction("jumpAction")
	end)
end
local UserInputService_upvr = game:GetService("UserInputService")
function setmetatable_result1_2_upvr.ConnectFocusEventListeners(arg1) -- Line 132
	--[[ Upvalues[2]:
		[1]: zero_vector3_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
	]]
	local function onFocusReleased() -- Line 133
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: zero_vector3_upvr (copied, readonly)
		]]
		arg1.moveVector = zero_vector3_upvr
		arg1.forwardValue = 0
		arg1.backwardValue = 0
		arg1.leftValue = 0
		arg1.rightValue = 0
		arg1.jumpRequested = false
		arg1:UpdateJump()
	end
	arg1._connectionUtil:trackConnection("textBoxFocusReleased", UserInputService_upvr.TextBoxFocusReleased:Connect(onFocusReleased))
	arg1._connectionUtil:trackConnection("textBoxFocused", UserInputService_upvr.TextBoxFocused:Connect(function(arg1_7) -- Line 143, Named "onTextFocusGained"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1.jumpRequested = false
		arg1:UpdateJump()
	end))
	arg1._connectionUtil:trackConnection("windowFocusReleased", UserInputService_upvr.WindowFocused:Connect(onFocusReleased))
end
return setmetatable_result1_2_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.ClickToMoveDisplay
KONSTANTERROR: After: Unknown constant type 251
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VehicleController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:11
-- Luau version 6, Types version 3
-- Time taken: 0.008097 seconds

local ContextActionService_upvr = game:GetService("ContextActionService")
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new(arg1) -- Line 27
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.enabled = false
	setmetatable_result1.vehicleSeat = nil
	setmetatable_result1.throttle = 0
	setmetatable_result1.steer = 0
	setmetatable_result1.acceleration = 0
	setmetatable_result1.decceleration = 0
	setmetatable_result1.turningRight = 0
	setmetatable_result1.turningLeft = 0
	setmetatable_result1.vehicleMoveVector = Vector3.new(0, 0, 0)
	setmetatable_result1.autoPilot = {}
	setmetatable_result1.autoPilot.MaxSpeed = 0
	setmetatable_result1.autoPilot.MaxSteeringAngle = 0
	return setmetatable_result1
end
function module_upvr.BindContextActions(arg1) -- Line 51
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:BindActionAtPriority("throttleAccel", function(arg1_2, arg2, arg3) -- Line 53
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnThrottleAccel(arg1_2, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonR2)
	ContextActionService_upvr:BindActionAtPriority("throttleDeccel", function(arg1_3, arg2, arg3) -- Line 57
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnThrottleDeccel(arg1_3, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonL2)
	ContextActionService_upvr:BindActionAtPriority("arrowSteerRight", function(arg1_4, arg2, arg3) -- Line 62
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnSteerRight(arg1_4, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Right)
	ContextActionService_upvr:BindActionAtPriority("arrowSteerLeft", function(arg1_5, arg2, arg3) -- Line 66
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnSteerLeft(arg1_5, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Left)
end
function module_upvr.Enable(arg1, arg2, arg3) -- Line 72
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 5. Error Block 3 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [8] 5. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 6. Error Block 4 start (CF ANALYSIS FAILED)
	arg1.enabled = arg2
	arg1.vehicleMoveVector = Vector3.new(0, 0, 0)
	-- KONSTANTERROR: [9] 6. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_upvr.OnThrottleAccel(arg1, arg2, arg3, arg4) -- Line 98
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.acceleration = 0
	else
		arg1.acceleration = -1
	end
	arg1.throttle = arg1.acceleration + arg1.decceleration
end
function module_upvr.OnThrottleDeccel(arg1, arg2, arg3, arg4) -- Line 107
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.decceleration = 0
	else
		arg1.decceleration = 1
	end
	arg1.throttle = arg1.acceleration + arg1.decceleration
end
function module_upvr.OnSteerRight(arg1, arg2, arg3, arg4) -- Line 116
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.turningRight = 0
	else
		arg1.turningRight = 1
	end
	arg1.steer = arg1.turningRight + arg1.turningLeft
end
function module_upvr.OnSteerLeft(arg1, arg2, arg3, arg4) -- Line 125
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.turningLeft = 0
	else
		arg1.turningLeft = -1
	end
	arg1.steer = arg1.turningRight + arg1.turningLeft
end
function module_upvr.Update(arg1, arg2, arg3, arg4) -- Line 135
	-- KONSTANTERROR: Failed to generate AST for function `Update`:
K:0: attempt to index nil with 'reads'
Traceback:
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K

end
function module_upvr.ComputeThrottle(arg1, arg2) -- Line 161
	if arg2 ~= Vector3.new(0, 0, 0) then
		return -arg2.Z
	end
	return 0
end
function module_upvr.ComputeSteer(arg1, arg2) -- Line 170
	if arg2 ~= Vector3.new(0, 0, 0) then
		return -math.atan2(-arg2.x, -arg2.z) * 57.29577951308232 / arg1.autoPilot.MaxSteeringAngle
	end
	return 0
end
function module_upvr.SetupAutoPilot(arg1) -- Line 179
	arg1.autoPilot.MaxSpeed = arg1.vehicleSeat.MaxSpeed
	arg1.autoPilot.MaxSteeringAngle = 35
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchThumbstick
KONSTANTERROR: After: invalid argument #1 to 'create' (size out of range)
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.ClickToMoveController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:12
-- Luau version 6, Types version 3
-- Time taken: 0.147695 seconds

local pcall_result1, pcall_result2 = pcall(function() -- Line 10
	return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding")
end)
local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 14
	return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2")
end)
local UserInputService_upvr = game:GetService("UserInputService")
local Players_upvr = game:GetService("Players")
local Workspace_upvr = game:GetService("Workspace")
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI")
local var11_upvw = true
local var12_upvw = true
local var13_upvw = false
local var14_upvw = 1
local var15_upvw = 8
local tbl_4_upvr = {
	[Enum.KeyCode.W] = true;
	[Enum.KeyCode.A] = true;
	[Enum.KeyCode.S] = true;
	[Enum.KeyCode.D] = true;
	[Enum.KeyCode.Up] = true;
	[Enum.KeyCode.Down] = true;
}
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local module_upvr = require(script.Parent:WaitForChild("ClickToMoveDisplay"))
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local tbl_6_upvr = {}
if not any_getUserFlag_result1_upvr then
	local function FindCharacterAncestor_upvr(arg1) -- Line 65, Named "FindCharacterAncestor"
		--[[ Upvalues[1]:
			[1]: FindCharacterAncestor_upvr (readonly)
		]]
		if arg1 then
			local class_Humanoid = arg1:FindFirstChildOfClass("Humanoid")
			if class_Humanoid then
				return arg1, class_Humanoid
			end
			return FindCharacterAncestor_upvr(arg1.Parent)
		end
	end
	tbl_6_upvr.FindCharacterAncestor = FindCharacterAncestor_upvr
	local function findPlayerHumanoid_upvr(arg1, arg2, arg3) -- Line 77, Named "Raycast"
		--[[ Upvalues[3]:
			[1]: Workspace_upvr (readonly)
			[2]: FindCharacterAncestor_upvr (readonly)
			[3]: findPlayerHumanoid_upvr (readonly)
		]]
		local var32 = arg3
		if not var32 then
			var32 = {}
		end
		local var33 = var32
		local any_FindPartOnRayWithIgnoreList_result1, any_FindPartOnRayWithIgnoreList_result2_2, any_FindPartOnRayWithIgnoreList_result3_2, any_FindPartOnRayWithIgnoreList_result4_2 = Workspace_upvr:FindPartOnRayWithIgnoreList(arg1, var33)
		if any_FindPartOnRayWithIgnoreList_result1 then
			if arg2 then
				local var38
				if any_FindPartOnRayWithIgnoreList_result1.CanCollide == false then
					if any_FindPartOnRayWithIgnoreList_result1 then
						local class_Humanoid_2 = any_FindPartOnRayWithIgnoreList_result1:FindFirstChildOfClass("Humanoid")
						if class_Humanoid_2 then
							var38 = class_Humanoid_2
						else
							local _, FindCharacterAncestor_result2 = FindCharacterAncestor_upvr(any_FindPartOnRayWithIgnoreList_result1.Parent)
							var38 = FindCharacterAncestor_result2
						end
					else
						var38 = nil
					end
					if var38 == nil then
						table.insert(var33, any_FindPartOnRayWithIgnoreList_result1)
						return findPlayerHumanoid_upvr(arg1, arg2, var33)
					end
				end
			end
			return any_FindPartOnRayWithIgnoreList_result1, any_FindPartOnRayWithIgnoreList_result2_2, any_FindPartOnRayWithIgnoreList_result3_2, any_FindPartOnRayWithIgnoreList_result4_2
		end
		return nil, nil
	end
	tbl_6_upvr.Raycast = findPlayerHumanoid_upvr
end
FindCharacterAncestor_upvr = {}
local var42_upvr = FindCharacterAncestor_upvr
function findPlayerHumanoid_upvr(arg1) -- Line 99, Named "findPlayerHumanoid"
	--[[ Upvalues[1]:
		[1]: var42_upvr (readonly)
	]]
	local var43 = arg1
	if var43 then
		var43 = arg1.Character
	end
	if var43 then
		local var44 = var42_upvr[arg1]
		if var44 and var44.Parent == var43 then
			return var44
		end
		var42_upvr[arg1] = nil
		local class_Humanoid_7 = var43:FindFirstChildOfClass("Humanoid")
		if class_Humanoid_7 then
			var42_upvr[arg1] = class_Humanoid_7
		end
		return class_Humanoid_7
	end
end
local var46_upvw
local var47_upvw
local function _() -- Line 123, Named "GetCharacter"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local var48 = LocalPlayer_upvr
	if var48 then
		var48 = LocalPlayer_upvr.Character
	end
	return var48
end
local var49_upvw
local var50_upvw
local CollectionService_upvr = game:GetService("CollectionService")
local function UpdateIgnoreTag_upvr(arg1) -- Line 127, Named "UpdateIgnoreTag"
	--[[ Upvalues[6]:
		[1]: var47_upvw (read and write)
		[2]: var49_upvw (read and write)
		[3]: var50_upvw (read and write)
		[4]: var46_upvw (read and write)
		[5]: LocalPlayer_upvr (readonly)
		[6]: CollectionService_upvr (readonly)
	]]
	if arg1 == var47_upvw then
	else
		if var49_upvw then
			var49_upvw:Disconnect()
			var49_upvw = nil
		end
		if var50_upvw then
			var50_upvw:Disconnect()
			var50_upvw = nil
		end
		var47_upvw = arg1
		local tbl_5 = {}
		local var57 = LocalPlayer_upvr
		if var57 then
			var57 = LocalPlayer_upvr.Character
		end
		tbl_5[1] = var57
		var46_upvw = tbl_5
		if var47_upvw ~= nil then
			for _, v_7 in ipairs(CollectionService_upvr:GetTagged(var47_upvw)) do
				table.insert(var46_upvw, v_7)
			end
			var49_upvw = CollectionService_upvr:GetInstanceAddedSignal(var47_upvw):Connect(function(arg1_2) -- Line 147
				--[[ Upvalues[1]:
					[1]: var46_upvw (copied, read and write)
				]]
				table.insert(var46_upvw, arg1_2)
			end)
			var50_upvw = CollectionService_upvr:GetInstanceRemovedSignal(var47_upvw):Connect(function(arg1_3) -- Line 151
				--[[ Upvalues[1]:
					[1]: var46_upvw (copied, read and write)
				]]
				for i_8 = 1, #var46_upvw do
					if var46_upvw[i_8] == arg1_3 then
						var46_upvw[i_8] = var46_upvw[#var46_upvw]
						table.remove(var46_upvw)
						return
					end
				end
			end)
		end
	end
end
local function _() -- Line 163, Named "getIgnoreList"
	--[[ Upvalues[2]:
		[1]: var46_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	if var46_upvw then
		return var46_upvw
	end
	var46_upvw = {}
	assert(var46_upvw, "")
	local var64 = LocalPlayer_upvr
	if var64 then
		var64 = LocalPlayer_upvr.Character
	end
	table.insert(var46_upvw, var64)
	return var46_upvw
end
local function _(arg1, arg2) -- Line 173, Named "minV"
	return Vector3.new(math.min(arg1.X, arg2.X), math.min(arg1.Y, arg2.Y), math.min(arg1.Z, arg2.Z))
end
local function _(arg1, arg2) -- Line 176, Named "maxV"
	return Vector3.new(math.max(arg1.X, arg2.X), math.max(arg1.Y, arg2.Y), math.max(arg1.Z, arg2.Z))
end
local function getCollidableExtentsSize_upvr(arg1) -- Line 179, Named "getCollidableExtentsSize"
	if arg1 == nil or arg1.PrimaryPart == nil then return end
	assert(arg1, "")
	assert(arg1.PrimaryPart, "")
	for _, v in pairs(arg1:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide then
			local vector3 = Vector3.new(v.Size.X / 2, v.Size.Y / 2, v.Size.Z / 2)
			for _, v_2 in ipairs({Vector3.new(vector3.X, vector3.Y, vector3.Z), Vector3.new(vector3.X, vector3.Y, -vector3.Z), Vector3.new(vector3.X, -vector3.Y, vector3.Z), Vector3.new(vector3.X, -vector3.Y, -vector3.Z), Vector3.new(-vector3.X, vector3.Y, vector3.Z), Vector3.new(-vector3.X, vector3.Y, -vector3.Z), Vector3.new(-vector3.X, -vector3.Y, vector3.Z), Vector3.new(-vector3.X, -vector3.Y, -vector3.Z)}) do
				local var81 = arg1.PrimaryPart.CFrame:Inverse() * v.CFrame * v_2
				local const_vector = Vector3.new(math.huge, math.huge, math.huge)
				local const_vector_2 = Vector3.new((-math.huge), (-math.huge), (-math.huge))
				local var84
			end
		end
	end
	local var85 = Vector3.new(math.max(const_vector_2.X, var81.X), math.max(const_vector_2.Y, var81.Y), math.max(const_vector_2.Z, var81.Z)) - Vector3.new(math.min(const_vector.X, var81.X), math.min(const_vector.Y, var81.Y), math.min(const_vector.Z, var81.Z))
	if var85.X < 0 or var85.Y < 0 or var85.Z < 0 then
		return nil
	end
	return var85
end
local var86_upvr = pcall_result1 and pcall_result2
local var87_upvr = pcall_result1_2 and pcall_result2_2
local PathfindingService_upvr = game:GetService("PathfindingService")
local function Pather_upvr(arg1, arg2, arg3) -- Line 214, Named "Pather"
	--[[ Upvalues[15]:
		[1]: var13_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: var42_upvr (readonly)
		[4]: var14_upvw (read and write)
		[5]: var86_upvr (readonly)
		[6]: getCollidableExtentsSize_upvr (readonly)
		[7]: var87_upvr (readonly)
		[8]: PathfindingService_upvr (readonly)
		[9]: var11_upvw (read and write)
		[10]: module_upvr (readonly)
		[11]: var15_upvw (read and write)
		[12]: any_getUserFlag_result1_upvr (readonly)
		[13]: RaycastParams_new_result1_upvr (readonly)
		[14]: var46_upvw (read and write)
		[15]: Workspace_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 112 start (CF ANALYSIS FAILED)
	local module_upvr_2 = {}
	local var141
	if arg3 ~= nil then
		local _ = arg3
	else
	end
	module_upvr_2.Cancelled = false
	module_upvr_2.Started = false
	module_upvr_2.Finished = Instance.new("BindableEvent")
	module_upvr_2.PathFailed = Instance.new("BindableEvent")
	module_upvr_2.PathComputing = false
	module_upvr_2.PathComputed = false
	module_upvr_2.OriginalTargetPoint = arg1
	module_upvr_2.TargetPoint = arg1
	module_upvr_2.TargetSurfaceNormal = arg2
	module_upvr_2.DiedConn = nil
	module_upvr_2.SeatedConn = nil
	module_upvr_2.BlockedConn = nil
	module_upvr_2.TeleportedConn = nil
	module_upvr_2.CurrentPoint = 0
	module_upvr_2.HumanoidOffsetFromPath = Vector3.new(0, 0, 0)
	module_upvr_2.CurrentWaypointPosition = nil
	module_upvr_2.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
	module_upvr_2.CurrentWaypointPlaneDistance = 0
	module_upvr_2.CurrentWaypointNeedsJump = false
	module_upvr_2.CurrentHumanoidPosition = Vector3.new(0, 0, 0)
	module_upvr_2.CurrentHumanoidVelocity = 0
	module_upvr_2.NextActionMoveDirection = Vector3.new(0, 0, 0)
	module_upvr_2.NextActionJump = false
	module_upvr_2.Timeout = 0
	local var143 = LocalPlayer_upvr
	var141 = var143
	if var141 then
		var141 = var143.Character
	end
	if var141 then
		local var144 = var42_upvr[var143]
		if var144 and var144.Parent == var141 then
		else
			var42_upvr[var143] = nil
			local class_Humanoid_8 = var141:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_8 then
				var42_upvr[var143] = class_Humanoid_8
			end
		end
	else
	end
	module_upvr_2.Humanoid = nil
	module_upvr_2.OriginPoint = nil
	module_upvr_2.AgentCanFollowPath = false
	module_upvr_2.DirectPath = false
	module_upvr_2.DirectPathRiseFirst = false
	module_upvr_2.stopTraverseFunc = nil
	module_upvr_2.setPointFunc = nil
	module_upvr_2.pointList = nil
	if module_upvr_2.Humanoid then
		local RootPart_2 = module_upvr_2.Humanoid.RootPart
		local var147
	end
	if RootPart_2 then
		var141 = RootPart_2.CFrame
		module_upvr_2.OriginPoint = var141.Position
		var141 = 5
		var147 = module_upvr_2.Humanoid
		local SeatPart = var147.SeatPart
		if SeatPart then
			var147 = SeatPart:IsA("VehicleSeat")
			if var147 then
				var147 = SeatPart:FindFirstAncestorOfClass("Model")
				if var147 then
					var147.PrimaryPart = SeatPart
					if true then
						var141 = var14_upvw * var147:GetExtentsSize().Y
						module_upvr_2.AgentCanFollowPath = true
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						module_upvr_2.DirectPath = true
					end
					var147.PrimaryPart = var147.PrimaryPart
					-- KONSTANTWARNING: GOTO [282] #200
				end
				-- KONSTANTWARNING: GOTO [282] #200
			end
		end
		var147 = nil
		local var150
		if var86_upvr then
			local var151 = LocalPlayer_upvr
			if var151 then
				var151 = LocalPlayer_upvr.Character
			end
			if var151 ~= nil then
				var147 = getCollidableExtentsSize_upvr(var151)
			end
		end
		if var147 == nil then
			var151 = LocalPlayer_upvr
			local var152 = var151
			if var152 then
				var152 = LocalPlayer_upvr.Character
			end
			var147 = var152:GetExtentsSize()
		end
		assert(var147, "")
		var141 = var14_upvw * var147.Y
		if 0 >= module_upvr_2.Humanoid.JumpPower then
		else
		end
		module_upvr_2.AgentCanFollowPath = true
		module_upvr_2.DirectPath = var13_upvw
		module_upvr_2.DirectPathRiseFirst = module_upvr_2.Humanoid.Sit
		var147 = var87_upvr
		if var147 then
			var147 = PathfindingService_upvr
			var147 = var147:CreatePath({
				AgentRadius = var14_upvw * 0.5 * math.sqrt(var147.X * var147.X + var147.Z * var147.Z);
				AgentHeight = var141;
				AgentCanJump = true;
				AgentCanClimb = true;
			})
			module_upvr_2.pathResult = var147
		else
			var147 = PathfindingService_upvr
			local tbl = {}
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			tbl.AgentRadius = var14_upvw * 0.5 * math.sqrt(var147.X * var147.X + var147.Z * var147.Z)
			tbl.AgentHeight = var141
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			tbl.AgentCanJump = true
			var147 = var147:CreatePath(tbl)
			module_upvr_2.pathResult = var147
		end
	end
	function module_upvr_2.Cleanup(arg1_18) -- Line 332
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		if module_upvr_2.stopTraverseFunc then
			module_upvr_2.stopTraverseFunc()
			module_upvr_2.stopTraverseFunc = nil
		end
		if module_upvr_2.BlockedConn then
			module_upvr_2.BlockedConn:Disconnect()
			module_upvr_2.BlockedConn = nil
		end
		if module_upvr_2.DiedConn then
			module_upvr_2.DiedConn:Disconnect()
			module_upvr_2.DiedConn = nil
		end
		if module_upvr_2.SeatedConn then
			module_upvr_2.SeatedConn:Disconnect()
			module_upvr_2.SeatedConn = nil
		end
		if module_upvr_2.TeleportedConn then
			module_upvr_2.TeleportedConn:Disconnect()
			module_upvr_2.TeleportedConn = nil
		end
		module_upvr_2.Started = false
	end
	function module_upvr_2.Cancel(arg1_19) -- Line 361
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		module_upvr_2.Cancelled = true
		module_upvr_2:Cleanup()
	end
	function module_upvr_2.IsActive(arg1_20) -- Line 366
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		local AgentCanFollowPath = module_upvr_2.AgentCanFollowPath
		if AgentCanFollowPath then
			AgentCanFollowPath = module_upvr_2.Started
			if AgentCanFollowPath then
				AgentCanFollowPath = not module_upvr_2.Cancelled
			end
		end
		return AgentCanFollowPath
	end
	function module_upvr_2.OnPathInterrupted(arg1_21) -- Line 370
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		module_upvr_2.Cancelled = true
		module_upvr_2:OnPointReached(false)
	end
	function module_upvr_2.ComputePath(arg1_22) -- Line 376
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		if module_upvr_2.OriginPoint then
			if module_upvr_2.PathComputed or module_upvr_2.PathComputing then return end
			module_upvr_2.PathComputing = true
			if module_upvr_2.AgentCanFollowPath then
				local var156
				if module_upvr_2.DirectPath then
					var156 = {}
					if not module_upvr_2.DirectPathRiseFirst or not Enum.PathWaypointAction.Jump then
					end
					var156[1] = PathWaypoint.new(module_upvr_2.OriginPoint, Enum.PathWaypointAction.Walk)
					var156[2] = PathWaypoint.new(module_upvr_2.TargetPoint, Enum.PathWaypointAction.Walk)
					module_upvr_2.pointList = var156
					var156 = true
					module_upvr_2.PathComputed = var156
				else
					var156 = module_upvr_2
					var156.pathResult:ComputeAsync(module_upvr_2.OriginPoint, module_upvr_2.TargetPoint)
					var156 = module_upvr_2.pathResult:GetWaypoints()
					module_upvr_2.pointList = var156
					var156 = module_upvr_2.pathResult.Blocked
					var156 = var156:Connect(function(arg1_23) -- Line 390
						--[[ Upvalues[1]:
							[1]: module_upvr_2 (copied, readonly)
						]]
						module_upvr_2:OnPathBlocked(arg1_23)
					end)
					module_upvr_2.BlockedConn = var156
					if module_upvr_2.pathResult.Status ~= Enum.PathStatus.Success then
						var156 = false
					else
						var156 = true
					end
					module_upvr_2.PathComputed = var156
				end
			end
			module_upvr_2.PathComputing = false
		end
	end
	function module_upvr_2.IsValidPath(arg1_24) -- Line 398
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		module_upvr_2:ComputePath()
		local PathComputed_2 = module_upvr_2.PathComputed
		if PathComputed_2 then
			PathComputed_2 = module_upvr_2.AgentCanFollowPath
		end
		return PathComputed_2
	end
	module_upvr_2.Recomputing = false
	function module_upvr_2.OnPathBlocked(arg1_25, arg2_8) -- Line 404
		--[[ Upvalues[3]:
			[1]: module_upvr_2 (readonly)
			[2]: var11_upvw (copied, read and write)
			[3]: module_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var159
		if module_upvr_2.CurrentPoint > arg2_8 then
			var159 = false
		else
			var159 = true
		end
		if not var159 or module_upvr_2.Recomputing then
		else
			module_upvr_2.Recomputing = true
			if module_upvr_2.stopTraverseFunc then
				module_upvr_2.stopTraverseFunc()
				module_upvr_2.stopTraverseFunc = nil
			end
			module_upvr_2.OriginPoint = module_upvr_2.Humanoid.RootPart.CFrame.p
			module_upvr_2.pathResult:ComputeAsync(module_upvr_2.OriginPoint, module_upvr_2.TargetPoint)
			module_upvr_2.pointList = module_upvr_2.pathResult:GetWaypoints()
			if 0 < #module_upvr_2.pointList then
				module_upvr_2.HumanoidOffsetFromPath = module_upvr_2.pointList[1].Position - module_upvr_2.OriginPoint
			end
			if module_upvr_2.pathResult.Status ~= Enum.PathStatus.Success then
			else
			end
			module_upvr_2.PathComputed = true
			if var11_upvw then
				local any_CreatePathDisplay_result1_4, any_CreatePathDisplay_result2 = module_upvr.CreatePathDisplay(module_upvr_2.pointList)
				module_upvr_2.stopTraverseFunc = any_CreatePathDisplay_result1_4
				module_upvr_2.setPointFunc = any_CreatePathDisplay_result2
			end
			if module_upvr_2.PathComputed then
				module_upvr_2.CurrentPoint = 1
				module_upvr_2:OnPointReached(true)
			else
				module_upvr_2.PathFailed:Fire()
				module_upvr_2:Cleanup()
			end
			module_upvr_2.Recomputing = false
		end
	end
	local function OnRenderStepped(arg1_26, arg2_9) -- Line 440
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: var15_upvw (copied, read and write)
		]]
		if module_upvr_2.Started then
			if not module_upvr_2.Cancelled then
				module_upvr_2.Timeout += arg2_9
				if var15_upvw < module_upvr_2.Timeout then
					module_upvr_2:OnPointReached(false)
					return
				end
				module_upvr_2.CurrentHumanoidPosition = module_upvr_2.Humanoid.RootPart.Position + module_upvr_2.HumanoidOffsetFromPath
				module_upvr_2.CurrentHumanoidVelocity = module_upvr_2.Humanoid.RootPart.Velocity
				while module_upvr_2.Started and module_upvr_2:IsCurrentWaypointReached() do
					module_upvr_2:OnPointReached(true)
				end
				if module_upvr_2.Started then
					module_upvr_2.NextActionMoveDirection = module_upvr_2.CurrentWaypointPosition - module_upvr_2.CurrentHumanoidPosition
					if 0.000001 < module_upvr_2.NextActionMoveDirection.Magnitude then
						module_upvr_2.NextActionMoveDirection = module_upvr_2.NextActionMoveDirection.Unit
					else
						module_upvr_2.NextActionMoveDirection = Vector3.new(0, 0, 0)
					end
					if module_upvr_2.CurrentWaypointNeedsJump then
						module_upvr_2.NextActionJump = true
						module_upvr_2.CurrentWaypointNeedsJump = false
						return
					end
					module_upvr_2.NextActionJump = false
				end
			end
		end
	end
	module_upvr_2.OnRenderStepped = OnRenderStepped
	function module_upvr_2.IsCurrentWaypointReached(arg1_27) -- Line 478
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		local var162 = false
		if module_upvr_2.CurrentWaypointPlaneNormal ~= Vector3.new(0, 0, 0) then
			if module_upvr_2.CurrentWaypointPlaneNormal:Dot(module_upvr_2.CurrentHumanoidPosition) - module_upvr_2.CurrentWaypointPlaneDistance >= math.max(1, 0.0625 * -module_upvr_2.CurrentWaypointPlaneNormal:Dot(module_upvr_2.CurrentHumanoidVelocity)) then
				var162 = false
			else
				var162 = true
			end
		else
			var162 = true
		end
		if var162 then
			module_upvr_2.CurrentWaypointPosition = nil
			module_upvr_2.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
			module_upvr_2.CurrentWaypointPlaneDistance = 0
		end
		return var162
	end
	function module_upvr_2.OnPointReached(arg1_28, arg2_10) -- Line 504
		--[[ Upvalues[1]:
			[1]: module_upvr_2 (readonly)
		]]
		if arg2_10 and not module_upvr_2.Cancelled then
			if module_upvr_2.setPointFunc then
				module_upvr_2.setPointFunc(module_upvr_2.CurrentPoint)
			end
			local var163 = module_upvr_2.CurrentPoint + 1
			if #module_upvr_2.pointList < var163 then
				if module_upvr_2.stopTraverseFunc then
					module_upvr_2.stopTraverseFunc()
				end
				module_upvr_2.Finished:Fire()
				module_upvr_2:Cleanup()
			else
				local var164 = module_upvr_2.pointList[module_upvr_2.CurrentPoint]
				local var165 = module_upvr_2.pointList[var163]
				local any_GetState_result1_3 = module_upvr_2.Humanoid:GetState()
				local var167 = true
				if any_GetState_result1_3 ~= Enum.HumanoidStateType.FallingDown then
					var167 = true
					if any_GetState_result1_3 ~= Enum.HumanoidStateType.Freefall then
						if any_GetState_result1_3 ~= Enum.HumanoidStateType.Jumping then
							var167 = false
						else
							var167 = true
						end
					end
				end
				if var167 then
					local var168
					if var165.Action ~= Enum.PathWaypointAction.Jump then
						var168 = false
					else
						var168 = true
					end
					if not var168 and 1 < module_upvr_2.CurrentPoint then
						local var169 = var164.Position - module_upvr_2.pointList[module_upvr_2.CurrentPoint - 1].Position
						local var170 = var165.Position - var164.Position
						if Vector2.new(var169.x, var169.z).Unit:Dot(Vector2.new(var170.x, var170.z).Unit) >= 0.996 then
							var168 = false
						else
							var168 = true
						end
					end
					if var168 then
						module_upvr_2.Humanoid.FreeFalling:Wait()
						wait(0.1)
					end
				end
				module_upvr_2:MoveToNextWayPoint(var164, var165, var163)
			end
		end
		module_upvr_2.PathFailed:Fire()
		module_upvr_2:Cleanup()
	end
	function module_upvr_2.MoveToNextWayPoint(arg1_29, arg2_11, arg3_3, arg4) -- Line 567
		--[[ Upvalues[2]:
			[1]: module_upvr_2 (readonly)
			[2]: var87_upvr (copied, readonly)
		]]
		module_upvr_2.CurrentWaypointPlaneNormal = arg2_11.Position - arg3_3.Position
		local var171
		if not var87_upvr or arg3_3.Label ~= "Climb" then
			var171 = Vector3.new(module_upvr_2.CurrentWaypointPlaneNormal.X, 0, module_upvr_2.CurrentWaypointPlaneNormal.Z)
			module_upvr_2.CurrentWaypointPlaneNormal = var171
		end
		var171 = module_upvr_2.CurrentWaypointPlaneNormal
		var171 = 0.000001
		if var171 < var171.Magnitude then
			var171 = module_upvr_2.CurrentWaypointPlaneNormal.Unit
			module_upvr_2.CurrentWaypointPlaneNormal = var171
			var171 = module_upvr_2.CurrentWaypointPlaneNormal:Dot(arg3_3.Position)
			module_upvr_2.CurrentWaypointPlaneDistance = var171
		else
			var171 = Vector3.new(0, 0, 0)
			module_upvr_2.CurrentWaypointPlaneNormal = var171
			var171 = 0
			module_upvr_2.CurrentWaypointPlaneDistance = var171
		end
		if arg3_3.Action ~= Enum.PathWaypointAction.Jump then
			var171 = false
		else
			var171 = true
		end
		module_upvr_2.CurrentWaypointNeedsJump = var171
		var171 = arg3_3.Position
		module_upvr_2.CurrentWaypointPosition = var171
		module_upvr_2.CurrentPoint = arg4
		var171 = 0
		module_upvr_2.Timeout = var171
	end
	local function Start(arg1_30, arg2_12) -- Line 599
		--[[ Upvalues[3]:
			[1]: module_upvr_2 (readonly)
			[2]: module_upvr (copied, readonly)
			[3]: var11_upvw (copied, read and write)
		]]
		if not module_upvr_2.AgentCanFollowPath then
			module_upvr_2.PathFailed:Fire()
		else
			if module_upvr_2.Started then return end
			module_upvr_2.Started = true
			module_upvr.CancelFailureAnimation()
			if var11_upvw and (arg2_12 == nil or arg2_12) then
				local any_CreatePathDisplay_result1, any_CreatePathDisplay_result2_2 = module_upvr.CreatePathDisplay(module_upvr_2.pointList, module_upvr_2.OriginalTargetPoint)
				module_upvr_2.stopTraverseFunc = any_CreatePathDisplay_result1
				module_upvr_2.setPointFunc = any_CreatePathDisplay_result2_2
			end
			if 0 < #module_upvr_2.pointList then
				module_upvr_2.HumanoidOffsetFromPath = Vector3.new(0, module_upvr_2.pointList[1].Position.Y - module_upvr_2.OriginPoint.Y, 0)
				module_upvr_2.CurrentHumanoidPosition = module_upvr_2.Humanoid.RootPart.Position + module_upvr_2.HumanoidOffsetFromPath
				module_upvr_2.CurrentHumanoidVelocity = module_upvr_2.Humanoid.RootPart.Velocity
				module_upvr_2.SeatedConn = module_upvr_2.Humanoid.Seated:Connect(function(arg1_31, arg2_13) -- Line 626
					--[[ Upvalues[1]:
						[1]: module_upvr_2 (copied, readonly)
					]]
					module_upvr_2:OnPathInterrupted()
				end)
				module_upvr_2.DiedConn = module_upvr_2.Humanoid.Died:Connect(function() -- Line 627
					--[[ Upvalues[1]:
						[1]: module_upvr_2 (copied, readonly)
					]]
					module_upvr_2:OnPathInterrupted()
				end)
				module_upvr_2.TeleportedConn = module_upvr_2.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() -- Line 628
					--[[ Upvalues[1]:
						[1]: module_upvr_2 (copied, readonly)
					]]
					module_upvr_2:OnPathInterrupted()
				end)
				module_upvr_2.CurrentPoint = 1
				module_upvr_2:OnPointReached(true)
				return
			end
			module_upvr_2.PathFailed:Fire()
			if module_upvr_2.stopTraverseFunc then
				module_upvr_2.stopTraverseFunc()
			end
		end
	end
	module_upvr_2.Start = Start
	var141 = module_upvr_2.TargetPoint
	var141 = any_getUserFlag_result1_upvr
	local var177
	if var141 then
		var141 = RaycastParams_new_result1_upvr
		if var46_upvw then
		else
			var46_upvw = {}
			var147 = var46_upvw
			var177 = ""
			assert(var147, var177)
			var147 = var46_upvw
			var177 = LocalPlayer_upvr
			if var177 then
				var177 = LocalPlayer_upvr.Character
			end
			table.insert(var147, var177)
		end
		var141.FilterDescendantsInstances = var46_upvw
		var141 = Workspace_upvr
		var147 = Vector3.new(-0, -50, -0)
		var141 = var141:Raycast(var141 + module_upvr_2.TargetSurfaceNormal * 1.5, var147, RaycastParams_new_result1_upvr)
		if var141 then
			module_upvr_2.TargetPoint = var141.Position
			-- KONSTANTWARNING: GOTO [460] #333
		end
	else
		var141 = Ray.new
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		var141 = var141(var141 + module_upvr_2.TargetSurfaceNormal * 1.5, Vector3.new(0, -50, 0))
		var147 = var141
		if var46_upvw then
		else
			var46_upvw = {}
			assert(var46_upvw, "")
			local var178 = LocalPlayer_upvr
			if var178 then
				var178 = LocalPlayer_upvr.Character
			end
			table.insert(var46_upvw, var178)
		end
		local any_FindPartOnRayWithIgnoreList_result1_4, any_FindPartOnRayWithIgnoreList_result2_4 = Workspace_upvr:FindPartOnRayWithIgnoreList(var147, var46_upvw)
		if any_FindPartOnRayWithIgnoreList_result1_4 then
			module_upvr_2.TargetPoint = any_FindPartOnRayWithIgnoreList_result2_4
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 112 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [460] 333. Error Block 63 start (CF ANALYSIS FAILED)
	var141 = module_upvr_2:ComputePath
	var141()
	do
		return module_upvr_2
	end
	-- KONSTANTERROR: [460] 333. Error Block 63 end (CF ANALYSIS FAILED)
end
local function _() -- Line 664, Named "CheckAlive"
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var42_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var181 = LocalPlayer_upvr
	local var182 = var181
	if var182 then
		var182 = var181.Character
	end
	if var182 then
		local var183 = var42_upvr[var181]
		if var183 and var183.Parent == var182 then
			local _ = var183
		else
			var42_upvr[var181] = nil
			local class_Humanoid_5 = var182:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_5 then
				var42_upvr[var181] = class_Humanoid_5
			end
		end
	else
	end
	var181 = false
	local var186 = var181
	if nil ~= nil then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if 0 >= nil.Health then
			var186 = false
		else
			var186 = true
		end
	end
	return var186
end
local function GetEquippedTool_upvr(arg1) -- Line 669, Named "GetEquippedTool"
	if arg1 ~= nil then
		for _, v_3 in pairs(arg1:GetChildren()) do
			if v_3:IsA("Tool") then
				return v_3
			end
		end
	end
end
local var192_upvw
local var193_upvw
local var194_upvw
local function CleanupPath() -- Line 684
	--[[ Upvalues[3]:
		[1]: var192_upvw (read and write)
		[2]: var193_upvw (read and write)
		[3]: var194_upvw (read and write)
	]]
	if var192_upvw then
		var192_upvw:Cancel()
		var192_upvw = nil
	end
	if var193_upvw then
		var193_upvw:Disconnect()
		var193_upvw = nil
	end
	if var194_upvw then
		var194_upvw:Disconnect()
		var194_upvw = nil
	end
end
local function HandleMoveTo_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 702, Named "HandleMoveTo"
	--[[ Upvalues[6]:
		[1]: var192_upvw (read and write)
		[2]: var193_upvw (read and write)
		[3]: var194_upvw (read and write)
		[4]: GetEquippedTool_upvr (readonly)
		[5]: var12_upvw (read and write)
		[6]: module_upvr (readonly)
	]]
	if var192_upvw then
		if var192_upvw then
			var192_upvw:Cancel()
			var192_upvw = nil
		end
		if var193_upvw then
			var193_upvw:Disconnect()
			var193_upvw = nil
		end
		if var194_upvw then
			var194_upvw:Disconnect()
			var194_upvw = nil
		end
	end
	var192_upvw = arg1
	arg1:Start(arg5)
	var193_upvw = arg1.Finished.Event:Connect(function() -- Line 709
		--[[ Upvalues[6]:
			[1]: var192_upvw (copied, read and write)
			[2]: var193_upvw (copied, read and write)
			[3]: var194_upvw (copied, read and write)
			[4]: arg3 (readonly)
			[5]: GetEquippedTool_upvr (copied, readonly)
			[6]: arg4 (readonly)
		]]
		if var192_upvw then
			var192_upvw:Cancel()
			var192_upvw = nil
		end
		if var193_upvw then
			var193_upvw:Disconnect()
			var193_upvw = nil
		end
		if var194_upvw then
			var194_upvw:Disconnect()
			var194_upvw = nil
		end
		if arg3 then
			local GetEquippedTool_upvr_result1 = GetEquippedTool_upvr(arg4)
			if GetEquippedTool_upvr_result1 then
				GetEquippedTool_upvr_result1:Activate()
			end
		end
	end)
	var194_upvw = arg1.PathFailed.Event:Connect(function() -- Line 718
		--[[ Upvalues[7]:
			[1]: var192_upvw (copied, read and write)
			[2]: var193_upvw (copied, read and write)
			[3]: var194_upvw (copied, read and write)
			[4]: arg5 (readonly)
			[5]: var12_upvw (copied, read and write)
			[6]: module_upvr (copied, readonly)
			[7]: arg2 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
		var192_upvw:Cancel()
		var192_upvw = nil
		-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 8. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [8] 8. Error Block 3 end (CF ANALYSIS FAILED)
	end)
end
local function _(arg1) -- Line 730, Named "ShowPathFailedFeedback"
	--[[ Upvalues[3]:
		[1]: var192_upvw (read and write)
		[2]: var12_upvw (read and write)
		[3]: module_upvr (readonly)
	]]
	if var192_upvw and var192_upvw:IsActive() then
		var192_upvw:Cancel()
	end
	if var12_upvw then
		module_upvr.PlayFailureAnimation()
	end
	module_upvr.DisplayFailureWaypoint(arg1)
end
local StarterGui_upvr = game:GetService("StarterGui")
function OnTap(arg1, arg2, arg3) -- Line 740
	--[[ Upvalues[17]:
		[1]: Workspace_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: var42_upvr (readonly)
		[4]: any_getUserFlag_result1_upvr (readonly)
		[5]: var46_upvw (read and write)
		[6]: RaycastParams_new_result1_upvr (readonly)
		[7]: StarterGui_upvr (readonly)
		[8]: Players_upvr (readonly)
		[9]: var192_upvw (read and write)
		[10]: var193_upvw (read and write)
		[11]: var194_upvw (read and write)
		[12]: Pather_upvr (readonly)
		[13]: HandleMoveTo_upvr (readonly)
		[14]: var12_upvw (read and write)
		[15]: module_upvr (readonly)
		[16]: tbl_6_upvr (readonly)
		[17]: GetEquippedTool_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 176 start (CF ANALYSIS FAILED)
	local var200 = LocalPlayer_upvr
	local var201 = var200
	if var201 then
		var201 = var200.Character
	end
	if var201 then
		local var202 = var42_upvr[var200]
		if var202 and var202.Parent == var201 then
			local _ = var202
		else
			var42_upvr[var200] = nil
			local class_Humanoid_4 = var201:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_4 then
				var42_upvr[var200] = class_Humanoid_4
			end
		end
	else
	end
	-- KONSTANTERROR: [0] 1. Error Block 176 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [37] 31. Error Block 166 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if 0 >= nil.Health then
	else
	end
	-- KONSTANTERROR: [37] 31. Error Block 166 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 850, Named "DisconnectEvent"
	if arg1 then
		arg1:Disconnect()
	end
end
local module_upvr_4 = require(script.Parent:WaitForChild("Keyboard"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr_4)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new(arg1) -- Line 861
	--[[ Upvalues[2]:
		[1]: module_upvr_4 (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr_4.new(arg1), setmetatable_result1_2_upvr)
	setmetatable_result1.fingerTouches = {}
	setmetatable_result1.numUnsunkTouches = 0
	setmetatable_result1.mouse2DownTime = tick()
	setmetatable_result1.mouse2DownPos = Vector2.new()
	setmetatable_result1.mouse2UpTime = tick()
	setmetatable_result1.keyboardMoveVector = Vector3.new(0, 0, 0)
	setmetatable_result1.tapConn = nil
	setmetatable_result1.inputBeganConn = nil
	setmetatable_result1.inputChangedConn = nil
	setmetatable_result1.inputEndedConn = nil
	setmetatable_result1.humanoidDiedConn = nil
	setmetatable_result1.characterChildAddedConn = nil
	setmetatable_result1.onCharacterAddedConn = nil
	setmetatable_result1.characterChildRemovedConn = nil
	setmetatable_result1.renderSteppedConn = nil
	setmetatable_result1.menuOpenedConnection = nil
	setmetatable_result1.preferredInputChangedConnection = nil
	setmetatable_result1.running = false
	setmetatable_result1.wasdEnabled = false
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.DisconnectEvents(arg1) -- Line 892
	local tapConn = arg1.tapConn
	if tapConn then
		tapConn:Disconnect()
	end
	local inputBeganConn = arg1.inputBeganConn
	if inputBeganConn then
		inputBeganConn:Disconnect()
	end
	local inputChangedConn = arg1.inputChangedConn
	if inputChangedConn then
		inputChangedConn:Disconnect()
	end
	local inputEndedConn = arg1.inputEndedConn
	if inputEndedConn then
		inputEndedConn:Disconnect()
	end
	local humanoidDiedConn_2 = arg1.humanoidDiedConn
	if humanoidDiedConn_2 then
		humanoidDiedConn_2:Disconnect()
	end
	local characterChildAddedConn = arg1.characterChildAddedConn
	if characterChildAddedConn then
		characterChildAddedConn:Disconnect()
	end
	local onCharacterAddedConn = arg1.onCharacterAddedConn
	if onCharacterAddedConn then
		onCharacterAddedConn:Disconnect()
	end
	local renderSteppedConn = arg1.renderSteppedConn
	if renderSteppedConn then
		renderSteppedConn:Disconnect()
	end
	local characterChildRemovedConn = arg1.characterChildRemovedConn
	if characterChildRemovedConn then
		characterChildRemovedConn:Disconnect()
	end
	local menuOpenedConnection = arg1.menuOpenedConnection
	if menuOpenedConnection then
		menuOpenedConnection:Disconnect()
	end
	local preferredInputChangedConnection = arg1.preferredInputChangedConnection
	if preferredInputChangedConnection then
		preferredInputChangedConnection:Disconnect()
	end
end
function setmetatable_result1_2_upvr.OnTouchBegan(arg1, arg2, arg3) -- Line 906
	if arg1.fingerTouches[arg2] == nil then
		if not arg3 then
			arg1.numUnsunkTouches += 1
		end
	end
	arg1.fingerTouches[arg2] = arg3
end
function setmetatable_result1_2_upvr.OnTouchChanged(arg1, arg2, arg3) -- Line 913
	if arg1.fingerTouches[arg2] == nil then
		arg1.fingerTouches[arg2] = arg3
		if not arg3 then
			arg1.numUnsunkTouches += 1
		end
	end
end
function setmetatable_result1_2_upvr.OnTouchEnded(arg1, arg2, arg3) -- Line 922
	if arg1.fingerTouches[arg2] ~= nil then
		if arg1.fingerTouches[arg2] == false then
			arg1.numUnsunkTouches -= 1
		end
	end
	arg1.fingerTouches[arg2] = nil
end
function setmetatable_result1_2_upvr.OnPreferredInputChanged(arg1) -- Line 929
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
	]]
	local Character_4 = LocalPlayer_upvr.Character
	local var224
	if Character_4 then
		if UserInputService_upvr.PreferredInput ~= Enum.PreferredInput.Touch then
			var224 = false
		else
			var224 = true
		end
		for _, v_4 in pairs(Character_4:GetChildren()) do
			if v_4:IsA("Tool") then
				v_4.ManualActivationOnly = var224
			end
		end
	end
end
local GuiService_upvr = game:GetService("GuiService")
function setmetatable_result1_2_upvr.OnCharacterAdded(arg1, arg2) -- Line 941
	--[[ Upvalues[7]:
		[1]: UserInputService_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: var192_upvw (read and write)
		[4]: var193_upvw (read and write)
		[5]: var194_upvw (read and write)
		[6]: module_upvr (readonly)
		[7]: GuiService_upvr (readonly)
	]]
	arg1:DisconnectEvents()
	arg1.inputBeganConn = UserInputService_upvr.InputBegan:Connect(function(arg1_32, arg2_14) -- Line 944
		--[[ Upvalues[6]:
			[1]: arg1 (readonly)
			[2]: tbl_4_upvr (copied, readonly)
			[3]: var192_upvw (copied, read and write)
			[4]: var193_upvw (copied, read and write)
			[5]: var194_upvw (copied, read and write)
			[6]: module_upvr (copied, readonly)
		]]
		if arg1_32.UserInputType == Enum.UserInputType.Touch then
			arg1:OnTouchBegan(arg1_32, arg2_14)
		end
		if arg1.wasdEnabled then
			if arg2_14 == false and arg1_32.UserInputType == Enum.UserInputType.Keyboard and tbl_4_upvr[arg1_32.KeyCode] then
				if var192_upvw then
					var192_upvw:Cancel()
					var192_upvw = nil
				end
				if var193_upvw then
					var193_upvw:Disconnect()
					var193_upvw = nil
				end
				if var194_upvw then
					var194_upvw:Disconnect()
					var194_upvw = nil
				end
				module_upvr.CancelFailureAnimation()
			end
		end
		if arg1_32.UserInputType == Enum.UserInputType.MouseButton2 then
			arg1.mouse2DownTime = tick()
			arg1.mouse2DownPos = arg1_32.Position
		end
	end)
	arg1.inputChangedConn = UserInputService_upvr.InputChanged:Connect(function(arg1_33, arg2_15) -- Line 961
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_33.UserInputType == Enum.UserInputType.Touch then
			arg1:OnTouchChanged(arg1_33, arg2_15)
		end
	end)
	arg1.inputEndedConn = UserInputService_upvr.InputEnded:Connect(function(arg1_34, arg2_16) -- Line 967
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var192_upvw (copied, read and write)
		]]
		if arg1_34.UserInputType == Enum.UserInputType.Touch then
			arg1:OnTouchEnded(arg1_34, arg2_16)
		end
		local var236
		if arg1_34.UserInputType == var236 then
			var236 = tick()
			arg1.mouse2UpTime = var236
			local Position = arg1_34.Position
			var236 = var192_upvw
			if not var236 then
				if arg1.keyboardMoveVector.Magnitude > 0 then
					var236 = false
				else
					var236 = true
				end
			end
			if arg1.mouse2UpTime - arg1.mouse2DownTime < 0.25 and (Position - arg1.mouse2DownPos).magnitude < 5 and var236 then
				OnTap({Position})
			end
		end
	end)
	arg1.tapConn = UserInputService_upvr.TouchTap:Connect(function(arg1_35, arg2_17) -- Line 984
		if not arg2_17 then
			OnTap(arg1_35, nil, true)
		end
	end)
	arg1.menuOpenedConnection = GuiService_upvr.MenuOpened:Connect(function() -- Line 990
		--[[ Upvalues[3]:
			[1]: var192_upvw (copied, read and write)
			[2]: var193_upvw (copied, read and write)
			[3]: var194_upvw (copied, read and write)
		]]
		if var192_upvw then
			var192_upvw:Cancel()
			var192_upvw = nil
		end
		if var193_upvw then
			var193_upvw:Disconnect()
			var193_upvw = nil
		end
		if var194_upvw then
			var194_upvw:Disconnect()
			var194_upvw = nil
		end
	end)
	local function OnCharacterChildAdded_upvr(arg1_36) -- Line 994, Named "OnCharacterChildAdded"
		--[[ Upvalues[2]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if UserInputService_upvr.PreferredInput == Enum.PreferredInput.Touch and arg1_36:IsA("Tool") then
			arg1_36.ManualActivationOnly = true
		end
		if arg1_36:IsA("Humanoid") then
			local humanoidDiedConn = arg1.humanoidDiedConn
			if humanoidDiedConn then
				humanoidDiedConn:Disconnect()
			end
			arg1.humanoidDiedConn = arg1_36.Died:Connect(function() -- Line 1002
			end)
		end
	end
	arg1.characterChildAddedConn = arg2.ChildAdded:Connect(function(arg1_37) -- Line 1010
		--[[ Upvalues[1]:
			[1]: OnCharacterChildAdded_upvr (readonly)
		]]
		OnCharacterChildAdded_upvr(arg1_37)
	end)
	arg1.characterChildRemovedConn = arg2.ChildRemoved:Connect(function(arg1_38) -- Line 1013
		--[[ Upvalues[1]:
			[1]: UserInputService_upvr (copied, readonly)
		]]
		if UserInputService_upvr.PreferredInput == Enum.PreferredInput.Touch and arg1_38:IsA("Tool") then
			arg1_38.ManualActivationOnly = false
		end
	end)
	for _, v_5 in pairs(arg2:GetChildren()) do
		OnCharacterChildAdded_upvr(v_5)
	end
	arg1.preferredInputChangedConnection = UserInputService_upvr:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line 1024
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnPreferredInputChanged()
	end)
end
function setmetatable_result1_2_upvr.Start(arg1) -- Line 1029
	arg1:Enable(true)
end
function setmetatable_result1_2_upvr.Stop(arg1) -- Line 1033
	arg1:Enable(false)
end
function setmetatable_result1_2_upvr.CleanupPath(arg1) -- Line 1037
	--[[ Upvalues[3]:
		[1]: var192_upvw (read and write)
		[2]: var193_upvw (read and write)
		[3]: var194_upvw (read and write)
	]]
	if var192_upvw then
		var192_upvw:Cancel()
		var192_upvw = nil
	end
	if var193_upvw then
		var193_upvw:Disconnect()
		var193_upvw = nil
	end
	if var194_upvw then
		var194_upvw:Disconnect()
		var194_upvw = nil
	end
end
function setmetatable_result1_2_upvr.Enable(arg1, arg2, arg3, arg4) -- Line 1041
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var192_upvw (read and write)
		[3]: var193_upvw (read and write)
		[4]: var194_upvw (read and write)
		[5]: UserInputService_upvr (readonly)
		[6]: module_upvr_4 (readonly)
	]]
	if arg2 then
		if not arg1.running then
			if LocalPlayer_upvr.Character then
				arg1:OnCharacterAdded(LocalPlayer_upvr.Character)
			end
			arg1.onCharacterAddedConn = LocalPlayer_upvr.CharacterAdded:Connect(function(arg1_40) -- Line 1047
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1:OnCharacterAdded(arg1_40)
			end)
			arg1.running = true
		end
		arg1.touchJumpController = arg4
		if arg1.touchJumpController then
			arg1.touchJumpController:Enable(arg1.jumpEnabled)
			-- KONSTANTWARNING: GOTO [116] #84
		end
	else
		if arg1.running then
			arg1:DisconnectEvents()
			if var192_upvw then
				var192_upvw:Cancel()
				var192_upvw = nil
			end
			if var193_upvw then
				var193_upvw:Disconnect()
				var193_upvw = nil
			end
			if var194_upvw then
				var194_upvw:Disconnect()
				var194_upvw = nil
			end
			if UserInputService_upvr.PreferredInput == Enum.PreferredInput.Touch then
				local Character = LocalPlayer_upvr.Character
				if Character then
					for _, v_6 in pairs(Character:GetChildren()) do
						if v_6:IsA("Tool") then
							v_6.ManualActivationOnly = false
						end
					end
				end
			end
			arg1.running = false
		end
		if arg1.touchJumpController and not arg1.jumpEnabled then
			arg1.touchJumpController:Enable(true)
		end
		arg1.touchJumpController = nil
	end
	module_upvr_4.Enable(arg1, arg2)
	if not arg2 or not arg3 then
	end
	arg1.wasdEnabled = false
	arg1.enabled = arg2
end
function setmetatable_result1_2_upvr.OnRenderStepped(arg1, arg2) -- Line 1086
	--[[ Upvalues[1]:
		[1]: var192_upvw (read and write)
	]]
	arg1.isJumping = false
	if var192_upvw then
		var192_upvw:OnRenderStepped(arg2)
		if var192_upvw then
			arg1.moveVector = var192_upvw.NextActionMoveDirection
			arg1.moveVectorIsCameraRelative = false
			if var192_upvw.NextActionJump then
				arg1.isJumping = true
				-- KONSTANTWARNING: GOTO [43] #31
			end
		else
			arg1.moveVector = arg1.keyboardMoveVector
			arg1.moveVectorIsCameraRelative = true
		end
	else
		arg1.moveVector = arg1.keyboardMoveVector
		arg1.moveVectorIsCameraRelative = true
	end
	if arg1.jumpRequested then
		arg1.isJumping = true
	end
end
function setmetatable_result1_2_upvr.UpdateMovement(arg1, arg2) -- Line 1121
	if arg2 == Enum.UserInputState.Cancel then
		arg1.keyboardMoveVector = Vector3.new(0, 0, 0)
	elseif arg1.wasdEnabled then
		arg1.keyboardMoveVector = Vector3.new(arg1.leftValue + arg1.rightValue, 0, arg1.forwardValue + arg1.backwardValue)
	end
end
function setmetatable_result1_2_upvr.UpdateJump(arg1) -- Line 1130
end
function setmetatable_result1_2_upvr.SetShowPath(arg1, arg2) -- Line 1135
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = arg2
end
function setmetatable_result1_2_upvr.GetShowPath(arg1) -- Line 1139
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	return var11_upvw
end
function setmetatable_result1_2_upvr.SetWaypointTexture(arg1, arg2) -- Line 1143
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetWaypointTexture(arg2)
end
function setmetatable_result1_2_upvr.GetWaypointTexture(arg1) -- Line 1147
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetWaypointTexture()
end
function setmetatable_result1_2_upvr.SetWaypointRadius(arg1, arg2) -- Line 1151
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetWaypointRadius(arg2)
end
function setmetatable_result1_2_upvr.GetWaypointRadius(arg1) -- Line 1155
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetWaypointRadius()
end
function setmetatable_result1_2_upvr.SetEndWaypointTexture(arg1, arg2) -- Line 1159
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetEndWaypointTexture(arg2)
end
function setmetatable_result1_2_upvr.GetEndWaypointTexture(arg1) -- Line 1163
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetEndWaypointTexture()
end
function setmetatable_result1_2_upvr.SetWaypointsAlwaysOnTop(arg1, arg2) -- Line 1167
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetWaypointsAlwaysOnTop(arg2)
end
function setmetatable_result1_2_upvr.GetWaypointsAlwaysOnTop(arg1) -- Line 1171
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.GetWaypointsAlwaysOnTop()
end
function setmetatable_result1_2_upvr.SetFailureAnimationEnabled(arg1, arg2) -- Line 1175
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	var12_upvw = arg2
end
function setmetatable_result1_2_upvr.GetFailureAnimationEnabled(arg1) -- Line 1179
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	return var12_upvw
end
function setmetatable_result1_2_upvr.SetIgnoredPartsTag(arg1, arg2) -- Line 1183
	--[[ Upvalues[1]:
		[1]: UpdateIgnoreTag_upvr (readonly)
	]]
	UpdateIgnoreTag_upvr(arg2)
end
function setmetatable_result1_2_upvr.GetIgnoredPartsTag(arg1) -- Line 1187
	--[[ Upvalues[1]:
		[1]: var47_upvw (read and write)
	]]
	return var47_upvw
end
function setmetatable_result1_2_upvr.SetUseDirectPath(arg1, arg2) -- Line 1191
	--[[ Upvalues[1]:
		[1]: var13_upvw (read and write)
	]]
	var13_upvw = arg2
end
function setmetatable_result1_2_upvr.GetUseDirectPath(arg1) -- Line 1195
	--[[ Upvalues[1]:
		[1]: var13_upvw (read and write)
	]]
	return var13_upvw
end
function setmetatable_result1_2_upvr.SetAgentSizeIncreaseFactor(arg1, arg2) -- Line 1199
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	var14_upvw = arg2 / 100 + 1
end
function setmetatable_result1_2_upvr.GetAgentSizeIncreaseFactor(arg1) -- Line 1203
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	return (var14_upvw - 1) * 100
end
function setmetatable_result1_2_upvr.SetUnreachableWaypointTimeout(arg1, arg2) -- Line 1207
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	var15_upvw = arg2
end
function setmetatable_result1_2_upvr.GetUnreachableWaypointTimeout(arg1) -- Line 1211
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	return var15_upvw
end
function setmetatable_result1_2_upvr.SetUserJumpEnabled(arg1, arg2) -- Line 1215
	arg1.jumpEnabled = arg2
	if arg1.touchJumpController then
		arg1.touchJumpController:Enable(arg2)
	end
end
function setmetatable_result1_2_upvr.GetUserJumpEnabled(arg1) -- Line 1222
	return arg1.jumpEnabled
end
function setmetatable_result1_2_upvr.MoveTo(arg1, arg2, arg3, arg4) -- Line 1226
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Pather_upvr (readonly)
		[3]: HandleMoveTo_upvr (readonly)
	]]
	local Character_2 = LocalPlayer_upvr.Character
	if Character_2 == nil then
		return false
	end
	local Pather_result1 = Pather_upvr(arg2, Vector3.new(0, 1, 0), arg4)
	if Pather_result1 then
		if Pather_result1:IsValidPath() then
			HandleMoveTo_upvr(Pather_result1, arg2, nil, Character_2, arg3)
			return true
		end
	end
	return false
end
return setmetatable_result1_2_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.PathDisplay
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:13
-- Luau version 6, Types version 3
-- Time taken: 0.008657 seconds

local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local module_upvr = {
	spacing = 8;
	image = "rbxasset://textures/Cursors/Gamepad/Pointer.png";
	imageSize = Vector2.new(2, 2);
}
local tbl_upvw_2 = {}
local tbl_upvw = {}
local Model_upvr = Instance.new("Model")
Model_upvr.Name = "PathDisplayPoints"
local Part = Instance.new("Part")
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
Part.Name = "PathDisplayAdornee"
Part.CFrame = CFrame.new(0, 0, 0)
Part.Parent = Model_upvr
local tbl_upvr = {}
local var10_upvw = 30
for i = 1, var10_upvw do
	local ImageHandleAdornment = Instance.new("ImageHandleAdornment")
	ImageHandleAdornment.Archivable = false
	ImageHandleAdornment.Adornee = Part
	ImageHandleAdornment.Image = module_upvr.image
	ImageHandleAdornment.Size = module_upvr.imageSize
	tbl_upvr[i] = ImageHandleAdornment
end
local function _() -- Line 41, Named "retrieveFromPool"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: var10_upvw (read and write)
	]]
	local _1 = tbl_upvr[1]
	if not _1 then
		return nil
	end
	tbl_upvr[1] = tbl_upvr[var10_upvw]
	tbl_upvr[var10_upvw] = nil
	var10_upvw -= 1
	return _1
end
local function _(arg1) -- Line 52, Named "returnToPool"
	--[[ Upvalues[2]:
		[1]: var10_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	var10_upvw += 1
	tbl_upvr[var10_upvw] = arg1
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI")
local function renderPoint_upvr(arg1, arg2) -- Line 57, Named "renderPoint"
	--[[ Upvalues[5]:
		[1]: var10_upvw (read and write)
		[2]: tbl_upvr (readonly)
		[3]: any_getUserFlag_result1_upvr (readonly)
		[4]: RaycastParams_new_result1_upvr (readonly)
		[5]: Model_upvr (readonly)
	]]
	local var14
	if var14 == 0 then
		var14 = nil
		return var14
	end
	local _1_2 = tbl_upvr[1]
	if not _1_2 then
		var14 = nil
	else
		tbl_upvr[1] = tbl_upvr[var10_upvw]
		tbl_upvr[var10_upvw] = nil
		var10_upvw -= 1
		var14 = _1_2
	end
	if any_getUserFlag_result1_upvr then
		RaycastParams_new_result1_upvr.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
		local workspace_Raycast_result1 = workspace:Raycast(arg1 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0), RaycastParams_new_result1_upvr)
		if not workspace_Raycast_result1 then
			return nil
		end
		var14.CFrame = CFrame.lookAlong(workspace_Raycast_result1.Position, workspace_Raycast_result1.Normal)
		var14.Parent = Model_upvr
		return var14
	end
	local workspace_FindPartOnRayWithIgnoreList_result1, workspace_FindPartOnRayWithIgnoreList_result2, workspace_FindPartOnRayWithIgnoreList_result3 = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg1 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0)), {game.Players.LocalPlayer.Character, workspace.CurrentCamera})
	if not workspace_FindPartOnRayWithIgnoreList_result1 then
		return nil
	end
	var14.CFrame = CFrame.new(workspace_FindPartOnRayWithIgnoreList_result2, workspace_FindPartOnRayWithIgnoreList_result2 + workspace_FindPartOnRayWithIgnoreList_result3)
	var14.Parent = Model_upvr
	return var14
end
function module_upvr.setCurrentPoints(arg1) -- Line 89
	--[[ Upvalues[1]:
		[1]: tbl_upvw_2 (read and write)
	]]
	if typeof(arg1) == "table" then
		tbl_upvw_2 = arg1
	else
		tbl_upvw_2 = {}
	end
end
function module_upvr.clearRenderedPath() -- Line 97
	--[[ Upvalues[4]:
		[1]: tbl_upvw (read and write)
		[2]: var10_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: Model_upvr (readonly)
	]]
	for _, v in ipairs(tbl_upvw) do
		v.Parent = nil
		var10_upvw += 1
		tbl_upvr[var10_upvw] = v
	end
	tbl_upvw = {}
	Model_upvr.Parent = nil
end
function module_upvr.renderPath() -- Line 106
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: tbl_upvw_2 (read and write)
		[3]: tbl_upvw (read and write)
		[4]: renderPoint_upvr (readonly)
		[5]: Model_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 21 start (CF ANALYSIS FAILED)
	module_upvr.clearRenderedPath()
	local var27
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var27 = #tbl_upvw_2
		return var27 == 0
	end
	if not var27 or INLINED() then return end
	var27 = #tbl_upvw_2
	local const_number = 0
	tbl_upvw[1] = renderPoint_upvr(tbl_upvw_2[var27], true)
	local var29 = tbl_upvw
	local _1_3 = var29[1]
	-- KONSTANTERROR: [0] 1. Error Block 21 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 24. Error Block 6 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [25] 24. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [35] 33. Error Block 28 start (CF ANALYSIS FAILED)
	local var31 = var29 - _1_3
	local magnitude = var31.magnitude
	if magnitude < const_number then
		var27 -= 1
	else
		local renderPoint_result1 = renderPoint_upvr(_1_3 + var31.unit * (const_number - magnitude), false)
		if renderPoint_result1 then
			tbl_upvw[#tbl_upvw + 1] = renderPoint_result1
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	-- KONSTANTERROR: [35] 33. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 25. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [61.263163]
	-- KONSTANTERROR: [26] 25. Error Block 7 end (CF ANALYSIS FAILED)
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchJump
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:13
-- Luau version 6, Types version 3
-- Time taken: 0.011718 seconds

local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local module_upvr_2 = require(CommonUtils:WaitForChild("CharacterUtil"))
local tbl_upvr = {
	HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED";
	HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER";
	HUMANOID_JUMP_HEIGHT = "HUMANOID_JUMP_HEIGHT";
	HUMANOID = "HUMANOID";
	JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED";
	MENU_OPENED = "MENU_OPENED";
}
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
local module_upvr_3 = require(CommonUtils:WaitForChild("ConnectionUtil"))
function setmetatable_result1_upvr.new() -- Line 51
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: module_upvr_3 (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.parentUIFrame = nil
	setmetatable_result1.jumpButton = nil
	setmetatable_result1.externallyEnabled = false
	setmetatable_result1.isJumping = false
	setmetatable_result1._active = false
	setmetatable_result1._connectionUtil = module_upvr_3.new()
	return setmetatable_result1
end
function setmetatable_result1_upvr._reset(arg1) -- Line 65
	arg1.isJumping = false
	arg1.touchObject = nil
	if arg1.jumpButton then
		arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end
end
local GuiService_upvr = game:GetService("GuiService")
function setmetatable_result1_upvr.EnableButton(arg1, arg2) -- Line 76
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: GuiService_upvr (readonly)
	]]
	if arg2 == arg1._active then
	else
		if arg2 then
			if not arg1.jumpButton then
				arg1:Create()
			end
			arg1.jumpButton.Visible = true
			arg1._connectionUtil:trackConnection(tbl_upvr.JUMP_INPUT_ENDED, arg1.jumpButton.InputEnded:Connect(function(arg1_2) -- Line 91
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				if arg1_2 == arg1.touchObject then
					arg1:_reset()
				end
			end))
			arg1._connectionUtil:trackConnection(tbl_upvr.MENU_OPENED, GuiService_upvr.MenuOpened:Connect(function() -- Line 101
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				if arg1.touchObject then
					arg1:_reset()
				end
			end))
		else
			if arg1.jumpButton then
				arg1.jumpButton.Visible = false
			end
			arg1._connectionUtil:disconnect(tbl_upvr.JUMP_INPUT_ENDED)
			arg1._connectionUtil:disconnect(tbl_upvr.MENU_OPENED)
		end
		arg1:_reset()
		arg1._active = arg2
	end
end
function setmetatable_result1_upvr.UpdateEnabled(arg1) -- Line 118
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local any_getChild_result1 = module_upvr_2.getChild("Humanoid", "Humanoid")
	if any_getChild_result1 and arg1.externallyEnabled then
		if any_getChild_result1.UseJumpPower and 0 < any_getChild_result1.JumpPower or not any_getChild_result1.UseJumpPower and 0 < any_getChild_result1.JumpHeight then
			if any_getChild_result1:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
				arg1:EnableButton(true)
				return
			end
		end
	end
	arg1:EnableButton(false)
end
function setmetatable_result1_upvr._setupConfigurations(arg1) -- Line 127
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: tbl_upvr (readonly)
	]]
	local function update_upvr() -- Line 128, Named "update"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:UpdateEnabled()
	end
	arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID, module_upvr_2.onChild("Humanoid", "Humanoid", function(arg1_3) -- Line 133
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: tbl_upvr (copied, readonly)
			[3]: update_upvr (readonly)
		]]
		arg1:UpdateEnabled()
		arg1:_reset()
		arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID_JUMP_POWER, arg1_3:GetPropertyChangedSignal("JumpPower"):Connect(update_upvr))
		arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID_JUMP_HEIGHT, arg1_3:GetPropertyChangedSignal("JumpHeight"):Connect(update_upvr))
		arg1._connectionUtil:trackConnection(tbl_upvr.HUMANOID_STATE_ENABLED_CHANGED, arg1_3.StateEnabledChanged:Connect(function(arg1_4, arg2) -- Line 146
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			if arg1_4 == Enum.HumanoidStateType.Jumping and arg2 ~= arg1._active then
				arg1:UpdateEnabled()
			end
		end))
	end))
end
function setmetatable_result1_upvr.Enable(arg1, arg2, arg3) -- Line 158
	if arg3 then
		arg1.parentUIFrame = arg3
	end
	if arg1.externallyEnabled == arg2 then
	else
		arg1.externallyEnabled = arg2
		arg1:UpdateEnabled()
		if arg2 then
			arg1:_setupConfigurations()
			return
		end
		arg1._connectionUtil:disconnectAll()
	end
end
function setmetatable_result1_upvr.Create(arg1) -- Line 175
	if not arg1.parentUIFrame then
	else
		if arg1.jumpButton then
			arg1.jumpButton:Destroy()
			arg1.jumpButton = nil
		end
		if arg1.absoluteSizeChangedConn then
			arg1.absoluteSizeChangedConn:Disconnect()
			arg1.absoluteSizeChangedConn = nil
		end
		arg1.jumpButton = Instance.new("ImageButton")
		arg1.jumpButton.Name = "JumpButton"
		arg1.jumpButton.Visible = false
		arg1.jumpButton.BackgroundTransparency = 1
		arg1.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
		arg1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		arg1.jumpButton.ImageRectSize = Vector2.new(144, 144)
		local function ResizeJumpButton() -- Line 198
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local x = arg1.parentUIFrame.AbsoluteSize.x
			local var15
			if math.min(x, arg1.parentUIFrame.AbsoluteSize.y) > var15 then
				x = false
			else
				x = true
			end
			if x then
				var15 = 70
			else
				var15 = 120
			end
			arg1.jumpButton.Size = UDim2.new(0, var15, 0, var15)
			if not x or not UDim2.new(1, -(var15 * 1.5 - 10), 1, -var15 - 20) then
			end
			arg1.jumpButton.Position = UDim2.new(1, -(var15 * 1.5 - 10), 1, -var15 * 1.75)
		end
		ResizeJumpButton()
		arg1.absoluteSizeChangedConn = arg1.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeJumpButton)
		arg1.touchObject = nil
		arg1.jumpButton.InputBegan:connect(function(arg1_5) -- Line 212
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1.touchObject or arg1_5.UserInputType ~= Enum.UserInputType.Touch or arg1_5.UserInputState ~= Enum.UserInputState.Begin then
			else
				arg1.touchObject = arg1_5
				arg1.jumpButton.ImageRectOffset = Vector2.new(146, 146)
				arg1.isJumping = true
			end
		end)
		arg1.jumpButton.Parent = arg1.parentUIFrame
	end
end
return setmetatable_result1_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Gamepad
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:13
-- Luau version 6, Types version 3
-- Time taken: 0.009160 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local ContextActionService_upvr = game:GetService("ContextActionService")
local None_upvr = Enum.UserInputType.None
local module_upvr = require(script.Parent:WaitForChild("BaseCharacterController"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new(arg1) -- Line 23
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: None_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.forwardValue = 0
	setmetatable_result1.backwardValue = 0
	setmetatable_result1.leftValue = 0
	setmetatable_result1.rightValue = 0
	setmetatable_result1.activeGamepad = None_upvr
	setmetatable_result1.gamepadConnectedConn = nil
	setmetatable_result1.gamepadDisconnectedConn = nil
	return setmetatable_result1
end
function setmetatable_result1_upvr.Enable(arg1, arg2) -- Line 39
	--[[ Upvalues[1]:
		[1]: None_upvr (readonly)
	]]
	if arg2 == arg1.enabled then
		return true
	end
	arg1.forwardValue = 0
	arg1.backwardValue = 0
	arg1.leftValue = 0
	arg1.rightValue = 0
	arg1.moveVector = Vector3.new(0, 0, 0)
	arg1.isJumping = false
	if arg2 then
		arg1.activeGamepad = arg1:GetHighestPriorityGamepad()
		if arg1.activeGamepad ~= None_upvr then
			arg1:BindContextActions()
			arg1:ConnectGamepadConnectionListeners()
		else
			return false
		end
	else
		arg1:UnbindContextActions()
		arg1:DisconnectGamepadConnectionListeners()
		arg1.activeGamepad = None_upvr
	end
	arg1.enabled = arg2
	return true
end
function setmetatable_result1_upvr.GetHighestPriorityGamepad(arg1) -- Line 75
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: None_upvr (readonly)
	]]
	local var14
	for _, v in pairs(UserInputService_upvr:GetConnectedGamepads()) do
		if v.Value < var14.Value then
			var14 = v
		end
	end
	return var14
end
function setmetatable_result1_upvr.BindContextActions(arg1) -- Line 86
	--[[ Upvalues[2]:
		[1]: None_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg1.activeGamepad == None_upvr then
		return false
	end
	ContextActionService_upvr:BindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	ContextActionService_upvr:BindActionAtPriority("jumpAction", function(arg1_2, arg2, arg3) -- Line 93
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var16
		if arg2 ~= Enum.UserInputState.Begin then
			var16 = false
		else
			var16 = true
		end
		arg1.isJumping = var16
		return Enum.ContextActionResult.Sink
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
	ContextActionService_upvr:BindActionAtPriority("moveThumbstick", function(arg1_3, arg2, arg3) -- Line 98
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 == Enum.UserInputState.Cancel then
			arg1.moveVector = Vector3.new(0, 0, 0)
			return Enum.ContextActionResult.Sink
		end
		if arg1.activeGamepad ~= arg3.UserInputType then
			return Enum.ContextActionResult.Pass
		end
		if arg3.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
		if 0.2 < arg3.Position.magnitude then
			arg1.moveVector = Vector3.new(arg3.Position.X, 0, -arg3.Position.Y)
		else
			arg1.moveVector = Vector3.new(0, 0, 0)
		end
		return Enum.ContextActionResult.Sink
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
	return true
end
function setmetatable_result1_upvr.UnbindContextActions(arg1) -- Line 127
	--[[ Upvalues[2]:
		[1]: None_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg1.activeGamepad ~= None_upvr then
		ContextActionService_upvr:UnbindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	end
	ContextActionService_upvr:UnbindAction("moveThumbstick")
	ContextActionService_upvr:UnbindAction("jumpAction")
end
function setmetatable_result1_upvr.OnNewGamepadConnected(arg1) -- Line 135
	--[[ Upvalues[1]:
		[1]: None_upvr (readonly)
	]]
	local any_GetHighestPriorityGamepad_result1_2 = arg1:GetHighestPriorityGamepad()
	if any_GetHighestPriorityGamepad_result1_2 == arg1.activeGamepad then
	else
		if any_GetHighestPriorityGamepad_result1_2 == None_upvr then
			warn("Gamepad:OnNewGamepadConnected found no connected gamepads")
			arg1:UnbindContextActions()
			return
		end
		if arg1.activeGamepad ~= None_upvr then
			arg1:UnbindContextActions()
		end
		arg1.activeGamepad = any_GetHighestPriorityGamepad_result1_2
		arg1:BindContextActions()
	end
end
function setmetatable_result1_upvr.OnCurrentGamepadDisconnected(arg1) -- Line 162
	--[[ Upvalues[2]:
		[1]: None_upvr (readonly)
		[2]: ContextActionService_upvr (readonly)
	]]
	if arg1.activeGamepad ~= None_upvr then
		ContextActionService_upvr:UnbindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	end
	local any_GetHighestPriorityGamepad_result1 = arg1:GetHighestPriorityGamepad()
	if arg1.activeGamepad ~= None_upvr and any_GetHighestPriorityGamepad_result1 == arg1.activeGamepad then
		warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.")
		arg1:UnbindContextActions()
		arg1.activeGamepad = None_upvr
	else
		if any_GetHighestPriorityGamepad_result1 == None_upvr then
			arg1:UnbindContextActions()
			arg1.activeGamepad = None_upvr
			return
		end
		arg1.activeGamepad = any_GetHighestPriorityGamepad_result1
		ContextActionService_upvr:BindActivate(arg1.activeGamepad, Enum.KeyCode.ButtonR2)
	end
end
function setmetatable_result1_upvr.ConnectGamepadConnectionListeners(arg1) -- Line 187
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	arg1.gamepadConnectedConn = UserInputService_upvr.GamepadConnected:Connect(function(arg1_4) -- Line 188
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnNewGamepadConnected()
	end)
	arg1.gamepadDisconnectedConn = UserInputService_upvr.GamepadDisconnected:Connect(function(arg1_5) -- Line 192
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1.activeGamepad == arg1_5 then
			arg1:OnCurrentGamepadDisconnected()
		end
	end)
end
function setmetatable_result1_upvr.DisconnectGamepadConnectionListeners(arg1) -- Line 200
	if arg1.gamepadConnectedConn then
		arg1.gamepadConnectedConn:Disconnect()
		arg1.gamepadConnectedConn = nil
	end
	if arg1.gamepadDisconnectedConn then
		arg1.gamepadDisconnectedConn:Disconnect()
		arg1.gamepadDisconnectedConn = nil
	end
end
return setmetatable_result1_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.BaseCharacterController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:14
-- Luau version 6, Types version 3
-- Time taken: 0.002166 seconds

local module_upvr_2 = {}
module_upvr_2.__index = module_upvr_2
local zero_vector3_upvr = Vector3.new()
local module_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("ConnectionUtil"))
function module_upvr_2.new() -- Line 33
	--[[ Upvalues[3]:
		[1]: module_upvr_2 (readonly)
		[2]: zero_vector3_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr_2)
	setmetatable_result1.enabled = false
	setmetatable_result1.moveVector = zero_vector3_upvr
	setmetatable_result1.moveVectorIsCameraRelative = true
	setmetatable_result1.isJumping = false
	setmetatable_result1._connectionUtil = module_upvr.new()
	return setmetatable_result1
end
function module_upvr_2.GetMoveVector(arg1) -- Line 45
	return arg1.moveVector
end
function module_upvr_2.IsMoveVectorCameraRelative(arg1) -- Line 49
	return arg1.moveVectorIsCameraRelative
end
function module_upvr_2.GetIsJumping(arg1) -- Line 53
	return arg1.isJumping
end
function module_upvr_2.Enable(arg1, arg2) -- Line 59
	error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
	return false
end
return module_upvr_2
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VRNavigation
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.DynamicThumbstick
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------
📂 [SERVICE: CameraModule]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ClassicCamera
KONSTANTERROR: After: Corrupted bytecode. If the `luau_load` is able to load this bytecode, then this is a bug
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUtils
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRBaseCamera
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:01
-- Luau version 6, Types version 3
-- Time taken: 0.027196 seconds

local pcall_result1, pcall_result2 = pcall(function() -- Line 17
	return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2")
end)
local VRService_upvr = game:GetService("VRService")
local Lighting_upvr = game:GetService("Lighting")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local module_upvr_3 = require(script.Parent:WaitForChild("CameraInput"))
local module_upvr_2 = require(script.Parent:WaitForChild("BaseCamera"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr_2)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 41
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr_2.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.gamepadZoomLevels = {0, 7}
	setmetatable_result1.headScale = 1
	setmetatable_result1:SetCameraToSubjectDistance(7)
	setmetatable_result1.VRFadeResetTimer = 0
	setmetatable_result1.VREdgeBlurTimer = 0
	setmetatable_result1.gamepadResetConnection = nil
	setmetatable_result1.needsReset = true
	setmetatable_result1.recentered = false
	setmetatable_result1:Reset()
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.Reset(arg1) -- Line 67
	arg1.stepRotateTimeout = 0
end
function setmetatable_result1_2_upvr.GetModuleName(arg1) -- Line 71
	return "VRBaseCamera"
end
function setmetatable_result1_2_upvr.GamepadZoomPress(arg1) -- Line 75
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	module_upvr_2.GamepadZoomPress(arg1)
	arg1:GamepadReset()
	arg1:ResetZoom()
end
function setmetatable_result1_2_upvr.GamepadReset(arg1) -- Line 83
	arg1.stepRotateTimeout = 0
	arg1.needsReset = true
end
local module_upvr = require(script.Parent:WaitForChild("ZoomController"))
function setmetatable_result1_2_upvr.ResetZoom(arg1) -- Line 88
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetZoomParameters(arg1.currentSubjectDistance, 0)
	module_upvr.ReleaseSpring()
end
local var13_upvw = pcall_result1 and pcall_result2
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
function setmetatable_result1_2_upvr.OnEnabledChanged(arg1) -- Line 93
	--[[ Upvalues[6]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr_3 (readonly)
		[3]: VRService_upvr (readonly)
		[4]: var13_upvw (read and write)
		[5]: LocalPlayer_upvr (readonly)
		[6]: Lighting_upvr (readonly)
	]]
	module_upvr_2.OnEnabledChanged(arg1)
	if arg1.enabled then
		arg1.gamepadResetConnection = module_upvr_3.gamepadReset:Connect(function() -- Line 97
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:GamepadReset()
		end)
		arg1.thirdPersonOptionChanged = VRService_upvr:GetPropertyChangedSignal("ThirdPersonFollowCamEnabled"):Connect(function() -- Line 102
			--[[ Upvalues[2]:
				[1]: var13_upvw (copied, read and write)
				[2]: arg1 (readonly)
			]]
			if var13_upvw then
				arg1:Reset()
			elseif not arg1:IsInFirstPerson() then
				arg1:Reset()
			end
		end)
		arg1.vrRecentered = VRService_upvr.UserCFrameChanged:Connect(function(arg1_2, arg2) -- Line 113
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1_2 == Enum.UserCFrame.Floor then
				arg1.recentered = true
			end
		end)
	else
		if arg1.inFirstPerson then
			arg1:GamepadZoomPress()
		end
		if arg1.thirdPersonOptionChanged then
			arg1.thirdPersonOptionChanged:Disconnect()
			arg1.thirdPersonOptionChanged = nil
		end
		if arg1.vrRecentered then
			arg1.vrRecentered:Disconnect()
			arg1.vrRecentered = nil
		end
		if arg1.cameraHeadScaleChangedConn then
			arg1.cameraHeadScaleChangedConn:Disconnect()
			arg1.cameraHeadScaleChangedConn = nil
		end
		if arg1.gamepadResetConnection then
			arg1.gamepadResetConnection:Disconnect()
			arg1.gamepadResetConnection = nil
		end
		arg1.VREdgeBlurTimer = 0
		arg1:UpdateEdgeBlur(LocalPlayer_upvr, 1)
		local VRFade = Lighting_upvr:FindFirstChild("VRFade")
		if VRFade then
			VRFade.Brightness = 0
		end
	end
end
function setmetatable_result1_2_upvr.OnCurrentCameraChanged(arg1) -- Line 155
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	module_upvr_2.OnCurrentCameraChanged(arg1)
	if arg1.cameraHeadScaleChangedConn then
		arg1.cameraHeadScaleChangedConn:Disconnect()
		arg1.cameraHeadScaleChangedConn = nil
	end
	local CurrentCamera = workspace.CurrentCamera
	if CurrentCamera then
		arg1.cameraHeadScaleChangedConn = CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function() -- Line 167
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnHeadScaleChanged()
		end)
		arg1:OnHeadScaleChanged()
	end
end
function setmetatable_result1_2_upvr.OnHeadScaleChanged(arg1) -- Line 172
	local HeadScale = workspace.CurrentCamera.HeadScale
	for i, v in arg1.gamepadZoomLevels do
		arg1.gamepadZoomLevels[i] = v * HeadScale / arg1.headScale
	end
	arg1:SetCameraToSubjectDistance(arg1:GetCameraToSubjectDistance() * HeadScale / arg1.headScale)
	arg1.headScale = HeadScale
end
function setmetatable_result1_2_upvr.GetVRFocus(arg1, arg2, arg3) -- Line 188
	arg1.cameraTranslationConstraints = Vector3.new(arg1.cameraTranslationConstraints.x, math.min(1, arg1.cameraTranslationConstraints.y + arg3), arg1.cameraTranslationConstraints.z)
	return CFrame.new(Vector3.new(arg2.x, (arg1.lastCameraFocus or arg2).y, arg2.z):Lerp(arg2 + Vector3.new(0, arg1:GetCameraHeight(), 0), arg1.cameraTranslationConstraints.y))
end
function setmetatable_result1_2_upvr.StartFadeFromBlack(arg1) -- Line 204
	--[[ Upvalues[2]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: Lighting_upvr (readonly)
	]]
	if UserGameSettings_upvr.VignetteEnabled == false then
	else
		if not Lighting_upvr:FindFirstChild("VRFade") then
			local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
			ColorCorrectionEffect.Name = "VRFade"
			ColorCorrectionEffect.Parent = Lighting_upvr
		end
		ColorCorrectionEffect.Brightness = -1
		arg1.VRFadeResetTimer = 0.1
	end
end
function setmetatable_result1_2_upvr.UpdateFadeFromBlack(arg1, arg2) -- Line 219
	--[[ Upvalues[1]:
		[1]: Lighting_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local VRFade_2 = Lighting_upvr:FindFirstChild("VRFade")
	local VRFadeResetTimer = arg1.VRFadeResetTimer
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 23. Error Block 4 start (CF ANALYSIS FAILED)
	VRFadeResetTimer.Brightness = math.min(VRFadeResetTimer.Brightness + arg2 * 10, 0)
	do
		return
	end
	-- KONSTANTERROR: [32] 23. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 32. Error Block 8 start (CF ANALYSIS FAILED)
	if VRFade_2 then
		VRFade_2.Brightness = 0
	end
	-- KONSTANTERROR: [45] 32. Error Block 8 end (CF ANALYSIS FAILED)
end
local RunService_upvr = game:GetService("RunService")
function setmetatable_result1_2_upvr.StartVREdgeBlur(arg1, arg2) -- Line 235
	--[[ Upvalues[3]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: VRService_upvr (readonly)
	]]
	if UserGameSettings_upvr.VignetteEnabled == false then
	else
		if not workspace.CurrentCamera:FindFirstChild("VRBlurPart") then
			local Part_upvw = Instance.new("Part")
			Part_upvw.Name = "VRBlurPart"
			Part_upvw.Parent = workspace.CurrentCamera
			Part_upvw.CanTouch = false
			Part_upvw.CanCollide = false
			Part_upvw.CanQuery = false
			Part_upvw.Anchored = true
			Part_upvw.Size = Vector3.new(0.43999, 0.46999, 1)
			Part_upvw.Transparency = 1
			Part_upvw.CastShadow = false
			RunService_upvr.RenderStepped:Connect(function(arg1_3) -- Line 255
				--[[ Upvalues[2]:
					[1]: VRService_upvr (copied, readonly)
					[2]: Part_upvw (read and write)
				]]
				local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
				local var33 = (workspace.CurrentCamera.CFrame) * (CFrame.new(any_GetUserCFrame_result1.p * workspace.CurrentCamera.HeadScale) * (any_GetUserCFrame_result1 - any_GetUserCFrame_result1.p))
				Part_upvw.CFrame = var33 * CFrame.Angles(0, math.pi, 0) + (var33.LookVector) * (1.05 * workspace.CurrentCamera.HeadScale)
				Part_upvw.Size = Vector3.new(0.43999, 0.46999, 1) * workspace.CurrentCamera.HeadScale
			end)
		end
		local VRBlurScreen = arg2.PlayerGui:FindFirstChild("VRBlurScreen")
		local var35
		if VRBlurScreen then
			var35 = VRBlurScreen:FindFirstChild("VRBlur")
			local var36
		end
		if not var35 then
			if not var36 then
				local SurfaceGui = Instance.new("SurfaceGui")
				if not SurfaceGui then
					SurfaceGui = Instance.new("ScreenGui")
				end
				var36 = SurfaceGui
			end
			var36.Name = "VRBlurScreen"
			var36.Parent = arg2.PlayerGui
			var36.Adornee = Part_upvw
			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Name = "VRBlur"
			ImageLabel.Parent = var36
			ImageLabel.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			ImageLabel.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Active = true
			ImageLabel.ScaleType = Enum.ScaleType.Stretch
		end
		ImageLabel.Visible = true
		ImageLabel.ImageTransparency = 0
		arg1.VREdgeBlurTimer = 0.14
	end
end
function setmetatable_result1_2_upvr.UpdateEdgeBlur(arg1, arg2, arg3) -- Line 304
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local VRBlurScreen_2 = arg2.PlayerGui:FindFirstChild("VRBlurScreen")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 11. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 11. Error Block 3 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_2_upvr.GetCameraHeight(arg1) -- Line 329
	if not arg1.inFirstPerson then
		return 0.25881904510252074 * arg1.currentSubjectDistance
	end
	return 0
end
function setmetatable_result1_2_upvr.GetSubjectCFrame(arg1) -- Line 336
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera_3 = workspace.CurrentCamera
	local var41 = CurrentCamera_3
	if var41 then
		var41 = CurrentCamera_3.CameraSubject
	end
	if not var41 then
		return module_upvr_2.GetSubjectCFrame(arg1)
	end
	local var42
	if var42 then
		if var41:GetState() ~= Enum.HumanoidStateType.Dead then
			var42 = false
		else
			var42 = true
		end
		if var42 and var41 == arg1.lastSubject then
			local lastSubjectCFrame = arg1.lastSubjectCFrame
		end
	end
	if lastSubjectCFrame then
		arg1.lastSubjectCFrame = lastSubjectCFrame
	end
	return lastSubjectCFrame
end
function setmetatable_result1_2_upvr.GetSubjectPosition(arg1) -- Line 362
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local CurrentCamera_2 = game.Workspace.CurrentCamera
	local var45 = CurrentCamera_2
	if var45 then
		var45 = CurrentCamera_2.CameraSubject
	end
	if var45 then
		local var46
		if var46 then
			if var45:GetState() ~= Enum.HumanoidStateType.Dead then
				var46 = false
			else
				var46 = true
			end
			if var46 and var45 == arg1.lastSubject then
				local lastSubjectPosition = arg1.lastSubjectPosition
				-- KONSTANTWARNING: GOTO [57] #41
			end
		else
			var46 = var45:IsA("VehicleSeat")
			if var46 then
				var46 = var45.CFrame.p
				-- KONSTANTWARNING: GOTO [57] #41
			end
		end
	else
		var46 = nil
		return var46
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 41. Error Block 16 start (CF ANALYSIS FAILED)
	arg1.lastSubjectPosition = var46 + var45.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	do
		return var46 + var45.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
	end
	-- KONSTANTERROR: [57] 41. Error Block 16 end (CF ANALYSIS FAILED)
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt")
function setmetatable_result1_2_upvr.getRotation(arg1, arg2) -- Line 391
	--[[ Upvalues[3]:
		[1]: module_upvr_3 (readonly)
		[2]: UserGameSettings_upvr (readonly)
		[3]: any_getUserFlag_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local any_getRotation_result1 = module_upvr_3.getRotation(arg2)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 18 start (CF ANALYSIS FAILED)
	if any_getUserFlag_result1_upvr then
		return any_getRotation_result1.X
	end
	do
		return any_getRotation_result1.X * 40 * arg2
	end
	-- KONSTANTERROR: [10] 9. Error Block 18 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_2_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseOcclusion
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera
KONSTANTERROR: After: Unknown constant type 128
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController
KONSTANTERROR: After: buffer access out of bounds
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.TransparencyController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:04
-- Luau version 6, Types version 3
-- Time taken: 0.017889 seconds

local tbl_2_upvr = {"BasePart", "Decal", "Beam", "ParticleEmitter", "Trail", "Fire", "Smoke", "Sparkles", "Explosion"}
local pcall_result1, pcall_result2 = pcall(function() -- Line 27
	return UserSettings():IsUserFeatureEnabled("UserHideCharacterParticlesInFirstPerson")
end)
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 38
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.transparencyDirty = false
	setmetatable_result1.enabled = false
	setmetatable_result1.lastTransparency = nil
	setmetatable_result1.descendantAddedConn = nil
	setmetatable_result1.descendantRemovingConn = nil
	setmetatable_result1.toolDescendantAddedConns = {}
	setmetatable_result1.toolDescendantRemovingConns = {}
	setmetatable_result1.cachedParts = {}
	return setmetatable_result1
end
function module_upvr.HasToolAncestor(arg1, arg2) -- Line 54
	if arg2.Parent == nil then
		return false
	end
	assert(arg2.Parent, "")
	local children = arg2.Parent:IsA("Tool")
	if not children then
		children = arg1:HasToolAncestor(arg2.Parent)
	end
	return children
end
local var8_upvw = pcall_result1 and pcall_result2
function module_upvr.IsValidPartToModify(arg1, arg2) -- Line 60
	--[[ Upvalues[2]:
		[1]: var8_upvw (read and write)
		[2]: tbl_2_upvr (readonly)
	]]
	if var8_upvw then
		for i, v in tbl_2_upvr do
			if arg2:IsA(v) then
				return not arg1:HasToolAncestor(arg2)
			end
		end
	elseif arg2:IsA("BasePart") or arg2:IsA("Decal") then
		i = arg2
		return not arg1:HasToolAncestor(i)
	end
	return false
end
function module_upvr.CachePartsRecursive(arg1, arg2) -- Line 76
	if arg2 then
		if arg1:IsValidPartToModify(arg2) then
			arg1.cachedParts[arg2] = true
			arg1.transparencyDirty = true
		end
		for _, v_2 in pairs(arg2:GetChildren()) do
			arg1:CachePartsRecursive(v_2)
		end
	end
end
function module_upvr.TeardownTransparency(arg1) -- Line 88
	for i_3, _ in pairs(arg1.cachedParts) do
		i_3.LocalTransparencyModifier = 0
	end
	arg1.cachedParts = {}
	arg1.transparencyDirty = true
	arg1.lastTransparency = nil
	if arg1.descendantAddedConn then
		arg1.descendantAddedConn:disconnect()
		arg1.descendantAddedConn = nil
	end
	if arg1.descendantRemovingConn then
		arg1.descendantRemovingConn:disconnect()
		arg1.descendantRemovingConn = nil
	end
	for i_4, v_4 in pairs(arg1.toolDescendantAddedConns) do
		v_4:Disconnect()
		arg1.toolDescendantAddedConns[i_4] = nil
	end
	for i_5, v_5 in pairs(arg1.toolDescendantRemovingConns) do
		v_5:Disconnect()
		arg1.toolDescendantRemovingConns[i_5] = nil
	end
end
function module_upvr.SetupTransparency(arg1, arg2) -- Line 114
	arg1:TeardownTransparency()
	if arg1.descendantAddedConn then
		arg1.descendantAddedConn:disconnect()
	end
	arg1.descendantAddedConn = arg2.DescendantAdded:Connect(function(arg1_2) -- Line 118
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		if arg1:IsValidPartToModify(arg1_2) then
			arg1.cachedParts[arg1_2] = true
			arg1.transparencyDirty = true
		elseif arg1_2:IsA("Tool") then
			if arg1.toolDescendantAddedConns[arg1_2] then
				arg1.toolDescendantAddedConns[arg1_2]:Disconnect()
			end
			arg1.toolDescendantAddedConns[arg1_2] = arg1_2.DescendantAdded:Connect(function(arg1_3) -- Line 126
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				arg1.cachedParts[arg1_3] = nil
				if arg1_3:IsA("BasePart") or arg1_3:IsA("Decal") then
					arg1_3.LocalTransparencyModifier = 0
				end
			end)
			if arg1.toolDescendantRemovingConns[arg1_2] then
				arg1.toolDescendantRemovingConns[arg1_2]:disconnect()
			end
			arg1.toolDescendantRemovingConns[arg1_2] = arg1_2.DescendantRemoving:Connect(function(arg1_4) -- Line 134
				--[[ Upvalues[2]:
					[1]: arg2 (copied, readonly)
					[2]: arg1 (copied, readonly)
				]]
				wait()
				if arg2 and arg1_4 and arg1_4:IsDescendantOf(arg2) and arg1:IsValidPartToModify(arg1_4) then
					arg1.cachedParts[arg1_4] = true
					arg1.transparencyDirty = true
				end
			end)
		end
	end)
	if arg1.descendantRemovingConn then
		arg1.descendantRemovingConn:disconnect()
	end
	arg1.descendantRemovingConn = arg2.DescendantRemoving:connect(function(arg1_5) -- Line 146
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1.cachedParts[arg1_5] then
			arg1.cachedParts[arg1_5] = nil
			arg1_5.LocalTransparencyModifier = 0
		end
	end)
	arg1:CachePartsRecursive(arg2)
end
function module_upvr.Enable(arg1, arg2) -- Line 157
	if arg1.enabled ~= arg2 then
		arg1.enabled = arg2
	end
end
function module_upvr.SetSubject(arg1, arg2) -- Line 163
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg2 and arg2:IsA("Humanoid") then
		local var35
	end
	if arg2 and arg2:IsA("VehicleSeat") and arg2.Occupant then
		var35 = arg2.Occupant.Parent
		local var36 = var35
	end
	if var36 then
		arg1:SetupTransparency(var36)
	else
		arg1:TeardownTransparency()
	end
end
local module_upvr_2 = require(script.Parent:WaitForChild("CameraUtils"))
local VRService_upvr = game:GetService("VRService")
function module_upvr.Update(arg1, arg2) -- Line 178
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: VRService_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	if CurrentCamera_2 then
		local var56
		if arg1.enabled then
			var56 = CurrentCamera_2.Focus.p - CurrentCamera_2.CoordinateFrame.p
			local magnitude_2 = var56.magnitude
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var56 = 1 - (magnitude_2 - 0.5) / 1.5
				return var56
			end
			if magnitude_2 >= 2 or not INLINED_2() then
				var56 = 0
			end
			if var56 < 0.5 then
				var56 = 0
			end
			if arg1.lastTransparency and var56 < 1 and arg1.lastTransparency < 0.95 then
				local var58 = 2.8 * arg2
				var56 = arg1.lastTransparency + math.clamp(var56 - arg1.lastTransparency, -var58, var58)
			else
				arg1.transparencyDirty = true
			end
			var56 = math.clamp(module_upvr_2.Round(var56, 2), 0, 1)
			if arg1.transparencyDirty or arg1.lastTransparency ~= var56 then
				for i_6, _ in pairs(arg1.cachedParts) do
					if VRService_upvr.VREnabled and VRService_upvr.AvatarGestures then
						if i_6.Parent:IsA("Accessory") and ({
							[Enum.AccessoryType.Hat] = true;
							[Enum.AccessoryType.Hair] = true;
							[Enum.AccessoryType.Face] = true;
							[Enum.AccessoryType.Eyebrow] = true;
							[Enum.AccessoryType.Eyelash] = true;
						})[i_6.Parent.AccessoryType] or i_6.Name == "Head" then
							i_6.LocalTransparencyModifier = var56
						else
							i_6.LocalTransparencyModifier = 0
						end
					else
						i_6.LocalTransparencyModifier = var56
					end
				end
				arg1.transparencyDirty = false
				arg1.lastTransparency = var56
			end
		end
	end
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUI
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:04
-- Luau version 6, Types version 3
-- Time taken: 0.001813 seconds

local var1_upvw = false
local module_upvr = {}
function module_upvr.setCameraModeToastEnabled(arg1) -- Line 10
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: module_upvr (readonly)
	]]
	if not arg1 and not var1_upvw then
	else
		if not var1_upvw then
			var1_upvw = true
		end
		if not arg1 then
			module_upvr.setCameraModeToastOpen(false)
		end
	end
end
local StarterGui_upvr = game:GetService("StarterGui")
function module_upvr.setCameraModeToastOpen(arg1) -- Line 24
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: StarterGui_upvr (readonly)
	]]
	assert(var1_upvw)
	if arg1 then
		StarterGui_upvr:SetCore("SendNotification", {
			Title = "Camera Control Enabled";
			Text = "Right click to toggle";
			Duration = 3;
		})
	end
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRCamera
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:04
-- Luau version 6, Types version 3
-- Time taken: 0.034976 seconds

local Players_upvr = game:GetService("Players")
local VRService_upvr = game:GetService("VRService")
local module_upvr = require(script.Parent:WaitForChild("VRBaseCamera"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new() -- Line 28
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.lastUpdate = tick()
	setmetatable_result1.focusOffset = CFrame.new()
	setmetatable_result1:Reset()
	setmetatable_result1.controlModule = require(Players_upvr.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
	setmetatable_result1.savedAutoRotate = true
	return setmetatable_result1
end
function setmetatable_result1_upvr.Reset(arg1) -- Line 41
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1.needsReset = true
	arg1.needsBlackout = true
	arg1.motionDetTime = 0
	arg1.blackOutTimer = 0
	arg1.lastCameraResetPosition = nil
	module_upvr.Reset(arg1)
end
function setmetatable_result1_upvr.Update(arg1, arg2) -- Line 50
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	local LocalPlayer = Players_upvr.LocalPlayer
	if arg1.lastUpdate == nil or 1 < arg2 then
		arg1.lastCameraTransform = nil
	end
	arg1:UpdateFadeFromBlack(arg2)
	arg1:UpdateEdgeBlur(LocalPlayer, arg2)
	local any_GetSubjectPosition_result1 = arg1:GetSubjectPosition()
	if arg1.needsBlackout then
		arg1:StartFadeFromBlack()
		arg1.blackOutTimer += math.clamp(arg2, 0.0001, 0.1)
		if 0.1 < arg1.blackOutTimer and game:IsLoaded() then
			arg1.needsBlackout = false
			arg1.needsReset = true
			local var23
		end
	end
	if any_GetSubjectPosition_result1 and LocalPlayer and workspace.CurrentCamera then
		local any_GetVRFocus_result1_3 = arg1:GetVRFocus(any_GetSubjectPosition_result1, arg2)
		if arg1:IsInFirstPerson() then
			if VRService_upvr.AvatarGestures then
				local any_UpdateImmersionCamera_result1_2, any_UpdateImmersionCamera_result2 = arg1:UpdateImmersionCamera(arg2, var23, any_GetVRFocus_result1_3, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
				var23 = any_UpdateImmersionCamera_result1_2
				any_GetVRFocus_result1_3 = any_UpdateImmersionCamera_result2
				local var27 = any_GetVRFocus_result1_3
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				local any_UpdateFirstPersonTransform_result1, any_UpdateFirstPersonTransform_result2_2 = arg1:UpdateFirstPersonTransform(arg2, var23, var27, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
				var23 = any_UpdateFirstPersonTransform_result1
				var27 = any_UpdateFirstPersonTransform_result2_2
			end
		elseif VRService_upvr.ThirdPersonFollowCamEnabled then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local any_UpdateThirdPersonFollowTransform_result1_2, any_UpdateThirdPersonFollowTransform_result2 = arg1:UpdateThirdPersonFollowTransform(arg2, var23, var27, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
			var23 = any_UpdateThirdPersonFollowTransform_result1_2
			var27 = any_UpdateThirdPersonFollowTransform_result2
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local any_UpdateThirdPersonComfortTransform_result1_2, any_UpdateThirdPersonComfortTransform_result2_2 = arg1:UpdateThirdPersonComfortTransform(arg2, var23, var27, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
			var23 = any_UpdateThirdPersonComfortTransform_result1_2
			var27 = any_UpdateThirdPersonComfortTransform_result2_2
		end
		arg1.lastCameraTransform = var23
		arg1.lastCameraFocus = var27
	end
	arg1.lastUpdate = tick()
	return var23, var27
end
function setmetatable_result1_upvr.GetAvatarFeetWorldYValue(arg1) -- Line 112
	local CameraSubject = workspace.CurrentCamera.CameraSubject
	if not CameraSubject then
		return nil
	end
	if CameraSubject:IsA("Humanoid") and CameraSubject.RootPart then
		local RootPart = CameraSubject.RootPart
		return RootPart.Position.Y - RootPart.Size.Y / 2 - CameraSubject.HipHeight
	end
	return nil
end
function setmetatable_result1_upvr.UpdateFirstPersonTransform(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 127
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	if arg1.needsReset then
		arg1:StartFadeFromBlack()
		arg1.needsReset = false
	end
	if 0.01 < (arg5 - arg6).magnitude then
		arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
	end
	local p = arg4.p
	local any_GetCameraLookVector_result1 = arg1:GetCameraLookVector()
	return CFrame.new(p - 0.5 * arg1:CalculateNewLookVectorFromArg(Vector3.new(any_GetCameraLookVector_result1.X, 0, any_GetCameraLookVector_result1.Z).Unit, Vector2.new(arg1:getRotation(arg2), 0)), p), arg4
end
function setmetatable_result1_upvr.UpdateImmersionCamera(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 153
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	local CurrentCamera = workspace.CurrentCamera
	local Character = Players_upvr.LocalPlayer.Character
	local any_GetHumanoid_result1_3 = arg1:GetHumanoid()
	local var41
	if not any_GetHumanoid_result1_3 then
		return CurrentCamera.CFrame, CurrentCamera.Focus
	end
	local HumanoidRootPart_2 = Character:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart_2 then
		return CurrentCamera.CFrame, CurrentCamera.Focus
	end
	arg1.characterOrientation = HumanoidRootPart_2:FindFirstChild("CharacterAlignOrientation")
	if not arg1.characterOrientation then
		local RootAttachment = HumanoidRootPart_2:FindFirstChild("RootAttachment")
		if not RootAttachment then return end
		arg1.characterOrientation = Instance.new("AlignOrientation")
		arg1.characterOrientation.Name = "CharacterAlignOrientation"
		arg1.characterOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
		arg1.characterOrientation.Attachment0 = RootAttachment
		arg1.characterOrientation.RigidityEnabled = true
		arg1.characterOrientation.Parent = HumanoidRootPart_2
	end
	if arg1.characterOrientation.Enabled == false then
		arg1.characterOrientation.Enabled = true
	end
	if arg1.needsReset then
		arg1.needsReset = false
		arg1.savedAutoRotate = any_GetHumanoid_result1_3.AutoRotate
		any_GetHumanoid_result1_3.AutoRotate = false
		if arg1.NoRecenter then
			arg1.NoRecenter = false
			VRService_upvr:RecenterUserHeadCFrame()
		end
		arg1:StartFadeFromBlack()
	elseif any_GetHumanoid_result1_3.Sit then
		if 0.01 < (arg1:GetSubjectCFrame().Position - CurrentCamera.CFrame.Position).Magnitude then
			arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
			-- KONSTANTWARNING: GOTO [341] #221
		end
	else
		arg1.characterOrientation.CFrame = CurrentCamera.CFrame * arg1.controlModule:GetEstimatedVRTorsoFrame()
		if 0 < arg1.controlModule.inputMoveVector.Magnitude then
			arg1.motionDetTime = 0.1
		end
		if 0 < arg1.controlModule.inputMoveVector.Magnitude or 0 < arg1.motionDetTime then
			arg1.motionDetTime -= arg2
			arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
			local any_GetUserCFrame_result1_2 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
			local HumanoidRootPart = Character.HumanoidRootPart
			local LookVector = HumanoidRootPart.CFrame.LookVector
			local _ = arg6 - (CurrentCamera.CFrame * (any_GetUserCFrame_result1_2.Rotation + any_GetUserCFrame_result1_2.Position * CurrentCamera.HeadScale) * CFrame.new(0, -0.7 * HumanoidRootPart.Size.Y / 2, 0) - Vector3.new(LookVector.X, 0, LookVector.Z).Unit * HumanoidRootPart.Size.Y * 0.125).Position + CurrentCamera.CFrame.Position
		else
		end
		local any_getRotation_result1_2 = arg1:getRotation(arg2)
		if 0 < math.abs(any_getRotation_result1_2) then
			local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
			local var50 = any_GetUserCFrame_result1.Rotation + any_GetUserCFrame_result1.Position * CurrentCamera.HeadScale
			local var51 = (CurrentCamera.CFrame.Rotation + Vector3.new(CurrentCamera.CFrame.Position.X, arg6.Y, CurrentCamera.CFrame.Position.Z)) * var50
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [341] 221. Error Block 30 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	do
		return CFrame.new(var51.Position) * CFrame.Angles(0, -math.rad(any_getRotation_result1_2 * 90), 0) * var51.Rotation * var50:Inverse(), CFrame.new(var51.Position) * CFrame.Angles(0, -math.rad(any_getRotation_result1_2 * 90), 0) * var51.Rotation * var50:Inverse() * CFrame.new(0, 0, -0.5)
	end
	-- KONSTANTERROR: [341] 221. Error Block 30 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_upvr.UpdateThirdPersonComfortTransform(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 265
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var61
	if var61 < 0.5 then
		var61 = 0.5
	end
	if arg5 ~= nil then
		local var62
		if arg1.lastCameraFocus ~= nil then
			var62 = true
			if 0.01 >= (arg5 - arg6).magnitude then
				if 0.01 >= arg1.controlModule:GetMoveVector().magnitude then
					var62 = false
				else
					var62 = true
				end
			end
			if var62 then
				arg1.motionDetTime = 0.1
			end
			arg1.motionDetTime -= arg2
			if 0 < arg1.motionDetTime then
				local var63
			end
			if true and not arg1.needsReset then
				var63 = arg1.lastCameraFocus
				arg1.VRCameraFocusFrozen = true
				return arg3, var63
			end
			local var64 = true
			if arg1.lastCameraResetPosition ~= nil then
				if 1 >= (arg6 - arg1.lastCameraResetPosition).Magnitude then
					var64 = false
				else
					var64 = true
				end
			end
			if 0 < math.abs(arg1:getRotation(arg2)) then
			end
			local var66
			if arg1.VRCameraFocusFrozen and var64 or arg1.needsReset then
				VRService_upvr:RecenterUserHeadCFrame()
				arg1.VRCameraFocusFrozen = false
				arg1.needsReset = false
				arg1.lastCameraResetPosition = arg6
				arg1:ResetZoom()
				arg1:StartFadeFromBlack()
				local any_GetHumanoid_result1_4 = arg1:GetHumanoid()
				local function INLINED_2() -- Internal function, doesn't exist in bytecode
					var66 = any_GetHumanoid_result1_4.Torso.CFrame.lookVector
					return var66
				end
				if not any_GetHumanoid_result1_4.Torso or not INLINED_2() then
					var66 = Vector3.new(1, 0, 0)
				end
				local var68 = var63.Position - Vector3.new(var66.X, 0, var66.Z) * var61
			end
		end
	end
	return CFrame.new(var68, Vector3.new(var63.Position.X, var68.Y, var63.Position.Z)), var63
end
function setmetatable_result1_upvr.UpdateThirdPersonFollowTransform(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 332
	--[[ Upvalues[2]:
		[1]: VRService_upvr (readonly)
		[2]: Players_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	local any_GetCameraToSubjectDistance_result1 = arg1:GetCameraToSubjectDistance()
	local any_GetVRFocus_result1_2 = arg1:GetVRFocus(arg6, arg2)
	local var72
	if arg1.needsReset then
		arg1.needsReset = false
		VRService_upvr:RecenterUserHeadCFrame()
		arg1:ResetZoom()
		arg1:StartFadeFromBlack()
	end
	if arg1.recentered then
		local any_GetSubjectCFrame_result1 = arg1:GetSubjectCFrame()
		if not any_GetSubjectCFrame_result1 then
			return CurrentCamera_2.CFrame, CurrentCamera_2.Focus
		end
		var72 = any_GetVRFocus_result1_2 * any_GetSubjectCFrame_result1.Rotation * CFrame.new(0, 0, any_GetCameraToSubjectDistance_result1)
		arg1.focusOffset = any_GetVRFocus_result1_2:ToObjectSpace(var72)
		arg1.recentered = false
		return var72, any_GetVRFocus_result1_2
	end
	local any_ToWorldSpace_result1 = any_GetVRFocus_result1_2:ToWorldSpace(arg1.focusOffset)
	local controlModule = arg1.controlModule
	if 0.01 < (arg5 - arg6).magnitude or 0 < controlModule:GetMoveVector().magnitude then
		local any_GetEstimatedVRTorsoFrame_result1 = controlModule:GetEstimatedVRTorsoFrame()
		local var77 = CurrentCamera_2.CFrame * (any_GetEstimatedVRTorsoFrame_result1.Rotation + any_GetEstimatedVRTorsoFrame_result1.Position * CurrentCamera_2.HeadScale)
		local LookVector_2 = var77.LookVector
		var72 = any_ToWorldSpace_result1:Lerp(CFrame.new((CurrentCamera_2.CFrame.Position) + (any_GetVRFocus_result1_2.Position - Vector3.new(LookVector_2.X, 0, LookVector_2.Z).Unit * any_GetCameraToSubjectDistance_result1) - var77.Position) * any_ToWorldSpace_result1.Rotation, 0.01)
	else
		var72 = any_ToWorldSpace_result1
	end
	local any_getRotation_result1 = arg1:getRotation(arg2)
	if 0 < math.abs(any_getRotation_result1) then
		var72 = any_GetVRFocus_result1_2 * CFrame.Angles(0, -any_getRotation_result1, 0) * any_GetVRFocus_result1_2:ToObjectSpace(var72)
	end
	arg1.focusOffset = any_GetVRFocus_result1_2:ToObjectSpace(var72)
	local var80 = var72 * CFrame.new(0, 0, -any_GetCameraToSubjectDistance_result1)
	if 0.01 < (var80.Position - CurrentCamera_2.Focus.Position).Magnitude then
		arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
	end
	return var72, var80
end
function setmetatable_result1_upvr.LeaveFirstPerson(arg1) -- Line 410
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.LeaveFirstPerson(arg1)
	arg1.needsReset = true
	if arg1.VRBlur then
		arg1.VRBlur.Visible = false
	end
	if arg1.characterOrientation then
		arg1.characterOrientation.Enabled = false
	end
	local any_GetHumanoid_result1_2 = arg1:GetHumanoid()
	if any_GetHumanoid_result1_2 then
		any_GetHumanoid_result1_2.AutoRotate = arg1.savedAutoRotate
	end
end
return setmetatable_result1_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraToggleStateController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:05
-- Luau version 6, Types version 3
-- Time taken: 0.005652 seconds

local module_upvr_2 = require(script.Parent:WaitForChild("CameraUI"))
module_upvr_2.setCameraModeToastEnabled(false)
local module_upvr = require(script.Parent:WaitForChild("CameraInput"))
local var4_upvw = false
local var5_upvw = false
local tick_result1_upvw = tick()
local var7_upvw = false
local var8_upvw = false
local module_upvr_3 = require(script.Parent:WaitForChild("CameraUtils"))
return function(arg1) -- Line 20
	--[[ Upvalues[8]:
		[1]: module_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: tick_result1_upvw (read and write)
		[5]: module_upvr_2 (readonly)
		[6]: var7_upvw (read and write)
		[7]: var8_upvw (read and write)
		[8]: module_upvr_3 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_getTogglePan_result1 = module_upvr.getTogglePan()
	if arg1 and any_getTogglePan_result1 ~= var4_upvw then
		var5_upvw = true
	end
	if var4_upvw ~= any_getTogglePan_result1 or 3 < tick() - tick_result1_upvw then
		local var11 = any_getTogglePan_result1
		if var11 then
			if tick() - tick_result1_upvw >= 3 then
			else
			end
		end
		module_upvr_2.setCameraModeToastOpen(true)
		if any_getTogglePan_result1 then
			var5_upvw = false
		end
		tick_result1_upvw = tick()
		var4_upvw = any_getTogglePan_result1
	end
	if arg1 ~= var7_upvw then
		if arg1 then
			var8_upvw = module_upvr.getTogglePan()
			module_upvr.setTogglePan(true)
		elseif not var5_upvw then
			module_upvr.setTogglePan(var8_upvw)
		end
	end
	if arg1 then
		if module_upvr.getTogglePan() then
			module_upvr_3.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png")
			module_upvr_3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
			module_upvr_3.setRotationTypeOverride(Enum.RotationType.CameraRelative)
		else
			module_upvr_3.restoreMouseIcon()
			module_upvr_3.restoreMouseBehavior()
			module_upvr_3.setRotationTypeOverride(Enum.RotationType.CameraRelative)
		end
	elseif module_upvr.getTogglePan() then
		module_upvr_3.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png")
		module_upvr_3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
		module_upvr_3.setRotationTypeOverride(Enum.RotationType.MovementRelative)
	elseif module_upvr.getHoldPan() then
		module_upvr_3.restoreMouseIcon()
		module_upvr_3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
		module_upvr_3.setRotationTypeOverride(Enum.RotationType.MovementRelative)
	else
		module_upvr_3.restoreMouseIcon()
		module_upvr_3.restoreMouseBehavior()
		module_upvr_3.restoreRotationType()
	end
	var7_upvw = arg1
end
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Invisicam
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraInput
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Poppercam
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.OrbitalCamera
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.LegacyCamera
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:07
-- Luau version 6, Types version 3
-- Time taken: 0.002966 seconds

local module_upvr = require(script.Parent:WaitForChild("BaseCamera"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 21
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.cameraType = Enum.CameraType.Fixed
	setmetatable_result1.lastUpdate = tick()
	setmetatable_result1.lastDistanceToSubject = nil
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.GetModuleName(arg1) -- Line 31
	return "LegacyCamera"
end
function setmetatable_result1_2_upvr.SetCameraToSubjectDistance(arg1, arg2) -- Line 36
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.SetCameraToSubjectDistance(arg1, arg2)
end
local Players_upvr = game:GetService("Players")
local module_upvr_2 = require(script.Parent:WaitForChild("CameraInput"))
function setmetatable_result1_2_upvr.Update(arg1, arg2) -- Line 40
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return nil, nil
	end
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 3 start (CF ANALYSIS FAILED)
	local CurrentCamera = workspace.CurrentCamera
	-- KONSTANTERROR: [6] 6. Error Block 3 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_2_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.MouseLockController
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:08
-- Luau version 6, Types version 3
-- Time taken: 0.014296 seconds

local Players_upvr = game:GetService("Players")
local ContextActionService_upvr = game:GetService("ContextActionService")
local UserInputService_upvr = game:GetService("UserInputService")
local GameSettings_upvr = UserSettings().GameSettings
local module_upvr_2 = require(script.Parent:WaitForChild("CameraUtils"))
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new() -- Line 33
	--[[ Upvalues[4]:
		[1]: module_upvr (readonly)
		[2]: GameSettings_upvr (readonly)
		[3]: Players_upvr (readonly)
		[4]: UserInputService_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr)
	setmetatable_result1_upvr.isMouseLocked = false
	setmetatable_result1_upvr.savedMouseCursor = nil
	setmetatable_result1_upvr.boundKeys = {Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift}
	setmetatable_result1_upvr.mouseLockToggledEvent = Instance.new("BindableEvent")
	local BoundKeys = script:FindFirstChild("BoundKeys")
	if not BoundKeys or not BoundKeys:IsA("StringValue") then
		if BoundKeys then
			BoundKeys:Destroy()
		end
		local StringValue = Instance.new("StringValue")
		assert(StringValue, "")
		StringValue.Name = "BoundKeys"
		StringValue.Value = "LeftShift,RightShift"
		StringValue.Parent = script
	end
	if StringValue then
		StringValue.Changed:Connect(function(arg1) -- Line 58
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnBoundKeysObjectChanged(arg1)
		end)
		setmetatable_result1_upvr:OnBoundKeysObjectChanged(StringValue.Value)
	end
	GameSettings_upvr.Changed:Connect(function(arg1) -- Line 65
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		if arg1 == "ControlMode" or arg1 == "ComputerMovementMode" then
			setmetatable_result1_upvr:UpdateMouseLockAvailability()
		end
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() -- Line 72
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMouseLockAvailability()
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() -- Line 77
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMouseLockAvailability()
	end)
	UserInputService_upvr:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line 81
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMouseLockAvailability()
	end)
	setmetatable_result1_upvr:UpdateMouseLockAvailability()
	return setmetatable_result1_upvr
end
function module_upvr.GetIsMouseLocked(arg1) -- Line 90
	return arg1.isMouseLocked
end
function module_upvr.GetBindableToggleEvent(arg1) -- Line 94
	return arg1.mouseLockToggledEvent.Event
end
function module_upvr.GetMouseLockOffset(arg1) -- Line 98
	return Vector3.new(1.75, 0, 0)
end
function module_upvr.UpdateMouseLockAvailability(arg1) -- Line 102
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: GameSettings_upvr (readonly)
		[3]: UserInputService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 36 start (CF ANALYSIS FAILED)
	if Players_upvr.LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable then
	else
	end
	if GameSettings_upvr.ControlMode ~= Enum.ControlMode.MouseLockSwitch then
		-- KONSTANTWARNING: GOTO [25] #17
	end
	-- KONSTANTERROR: [0] 1. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 16. Error Block 39 start (CF ANALYSIS FAILED)
	if GameSettings_upvr.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove then
		-- KONSTANTWARNING: GOTO [34] #23
	end
	-- KONSTANTERROR: [24] 16. Error Block 39 end (CF ANALYSIS FAILED)
end
function module_upvr.OnBoundKeysObjectChanged(arg1, arg2) -- Line 115
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	arg1.boundKeys = {}
	local _, _, _ = string.gmatch(arg2, "[^%s,]+")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 2 start (CF ANALYSIS FAILED)
	local _, pairs_result2, _ = pairs(Enum.KeyCode:GetEnumItems())
	-- KONSTANTERROR: [10] 8. Error Block 2 end (CF ANALYSIS FAILED)
end
function module_upvr.OnMouseLockToggled(arg1) -- Line 130
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	arg1.isMouseLocked = not arg1.isMouseLocked
	if arg1.isMouseLocked then
		local CursorImage = script:FindFirstChild("CursorImage")
		if CursorImage and CursorImage:IsA("StringValue") and CursorImage.Value then
			module_upvr_2.setMouseIconOverride(CursorImage.Value)
		else
			if CursorImage then
				CursorImage:Destroy()
			end
			local StringValue_2 = Instance.new("StringValue")
			assert(StringValue_2, "")
			StringValue_2.Name = "CursorImage"
			StringValue_2.Value = "rbxasset://textures/MouseLockedCursor.png"
			StringValue_2.Parent = script
			module_upvr_2.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
		end
	else
		module_upvr_2.restoreMouseIcon()
	end
	arg1.mouseLockToggledEvent:Fire()
end
function module_upvr.DoMouseLockSwitch(arg1, arg2, arg3, arg4) -- Line 155
	if arg3 == Enum.UserInputState.Begin then
		arg1:OnMouseLockToggled()
		return Enum.ContextActionResult.Sink
	end
	return Enum.ContextActionResult.Pass
end
local Value_upvr = Enum.ContextActionPriority.Medium.Value
function module_upvr.BindContextActions(arg1) -- Line 163
	--[[ Upvalues[2]:
		[1]: ContextActionService_upvr (readonly)
		[2]: Value_upvr (readonly)
	]]
	ContextActionService_upvr:BindActionAtPriority("MouseLockSwitchAction", function(arg1_2, arg2, arg3) -- Line 164
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1:DoMouseLockSwitch(arg1_2, arg2, arg3)
	end, false, Value_upvr, unpack(arg1.boundKeys))
end
function module_upvr.UnbindContextActions(arg1) -- Line 169
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:UnbindAction("MouseLockSwitchAction")
end
function module_upvr.IsMouseLocked(arg1) -- Line 173
	local enabled = arg1.enabled
	if enabled then
		enabled = arg1.isMouseLocked
	end
	return enabled
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserFixStuckShiftLock")
function module_upvr.EnableMouseLock(arg1, arg2) -- Line 177
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: any_getUserFlag_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 16. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 16. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [34] 24. Error Block 12 start (CF ANALYSIS FAILED)
	if arg1.isMouseLocked then
		arg1.mouseLockToggledEvent:Fire()
	end
	arg1.isMouseLocked = false
	-- KONSTANTERROR: [34] 24. Error Block 12 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 31. Error Block 10 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 31. Error Block 10 end (CF ANALYSIS FAILED)
end
return module_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRVehicleCamera
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:08
-- Luau version 6, Types version 3
-- Time taken: 0.001211 seconds

-- Global Warnings[1]:
---- 1. KONSTANTWARNING: A SETGLOBAL instruction specified an invalid constant.

-- KONSTANTERROR: Failed to generate AST for unnamed function:
assertion failed!
Traceback:
K
K
K
K
K
K
K
K
K
K
K
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseCamera
KONSTANTERROR: After: K:0: attempt to index nil with 'debug_name'
K
K
K
K
K
K
K

--------------------
📂 [SERVICE: ZoomController]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:03
-- Luau version 6, Types version 3
-- Time taken: 0.029455 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local Players = game:GetService("Players")
local module = require(script.Parent.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil"))
local any_getUserFlag_result1_upvr_2 = module.getUserFlag("UserRaycastUpdateAPI")
local any_getUserFlag_result1_upvr_3 = module.getUserFlag("UserCurrentCameraUpdate2")
local var22_upvr = "UserPlayerConnectionMemoryLeak"
local any_getUserFlag_result1_upvr = module.getUserFlag(var22_upvr)
if any_getUserFlag_result1_upvr_3 then
	var22_upvr = require(script.Parent.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("CameraWrapper")).new()
else
	var22_upvr = nil
end
if any_getUserFlag_result1_upvr_3 then
	local _
else
end
if any_getUserFlag_result1_upvr_3 then
	var22_upvr:Enable()
end
local tan_upvr = math.tan
local rad_upvr = math.rad
local new_upvr = Ray.new
local RaycastParams_new_result1_upvr = RaycastParams.new()
RaycastParams_new_result1_upvr.IgnoreWater = true
RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Exclude
local RaycastParams_new_result1_upvr_2 = RaycastParams.new()
RaycastParams_new_result1_upvr_2.IgnoreWater = true
local Include_upvr = Enum.RaycastFilterType.Include
RaycastParams_new_result1_upvr_2.FilterType = Include_upvr
if any_getUserFlag_result1_upvr then
	Include_upvr = require(script.Parent.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("ConnectionUtil")).new()
else
	Include_upvr = nil
end
local function _(arg1) -- Line 42, Named "getTotalTransparency"
	return 1 - (1 - arg1.Transparency) * (1 - arg1.LocalTransparencyModifier)
end
local function _(arg1, arg2) -- Line 46, Named "eraseFromEnd"
	for i = #arg1, arg2 + 1, -1 do
		arg1[i] = nil
	end
end
if any_getUserFlag_result1_upvr_3 then
	local var32_upvw
	local var33_upvw
	local function updateProjection() -- Line 56
		--[[ Upvalues[5]:
			[1]: var22_upvr (readonly)
			[2]: rad_upvr (readonly)
			[3]: var32_upvw (read and write)
			[4]: tan_upvr (readonly)
			[5]: var33_upvw (read and write)
		]]
		local any_getCamera_result1_2 = var22_upvr:getCamera()
		local ViewportSize_2 = any_getCamera_result1_2.ViewportSize
		var32_upvw = tan_upvr(rad_upvr(any_getCamera_result1_2.FieldOfView) / 2) * 2
		var33_upvw = ViewportSize_2.X / ViewportSize_2.Y * var32_upvw
	end
	var22_upvr:Connect("FieldOfView", updateProjection)
	var22_upvr:Connect("ViewportSize", updateProjection)
	local any_getCamera_result1 = var22_upvr:getCamera()
	local ViewportSize = any_getCamera_result1.ViewportSize
	var32_upvw = tan_upvr(rad_upvr(any_getCamera_result1.FieldOfView) / 2) * 2
	local var38_upvw = var32_upvw
	var33_upvw = ViewportSize.X / ViewportSize.Y * var38_upvw
	local NearPlaneZ_upvw = var22_upvr:getCamera().NearPlaneZ
	var22_upvr:Connect("NearPlaneZ", function() -- Line 72
		--[[ Upvalues[2]:
			[1]: NearPlaneZ_upvw (read and write)
			[2]: var22_upvr (readonly)
		]]
		NearPlaneZ_upvw = var22_upvr:getCamera().NearPlaneZ
	end)
	-- KONSTANTWARNING: GOTO [213] #159
end
local CurrentCamera_upvw = game.Workspace.CurrentCamera
local function updateProjection() -- Line 78
	--[[ Upvalues[5]:
		[1]: CurrentCamera_upvw (read and write)
		[2]: rad_upvr (readonly)
		[3]: var38_upvw (read and write)
		[4]: tan_upvr (readonly)
		[5]: var33_upvw (read and write)
	]]
	local ViewportSize_4 = CurrentCamera_upvw.ViewportSize
	var38_upvw = tan_upvr(rad_upvr(CurrentCamera_upvw.FieldOfView) / 2) * 2
	var33_upvw = ViewportSize_4.X / ViewportSize_4.Y * var38_upvw
end
CurrentCamera_upvw:GetPropertyChangedSignal("FieldOfView"):Connect(updateProjection)
CurrentCamera_upvw:GetPropertyChangedSignal("ViewportSize"):Connect(updateProjection)
local ViewportSize_5 = CurrentCamera_upvw.ViewportSize
var38_upvw = tan_upvr(rad_upvr(CurrentCamera_upvw.FieldOfView) / 2) * 2
local var44_upvw = var38_upvw
var33_upvw = ViewportSize_5.X / ViewportSize_5.Y * var44_upvw
NearPlaneZ_upvw = CurrentCamera_upvw.NearPlaneZ
local var45_upvw = NearPlaneZ_upvw
CurrentCamera_upvw:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() -- Line 92
	--[[ Upvalues[2]:
		[1]: var45_upvw (read and write)
		[2]: CurrentCamera_upvw (read and write)
	]]
	var45_upvw = CurrentCamera_upvw.NearPlaneZ
end)
local tbl_upvw = {}
local tbl_upvr = {}
local function _() -- Line 101, Named "refreshIgnoreList"
	--[[ Upvalues[2]:
		[1]: tbl_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	local var53 = 1
	tbl_upvw = {}
	for _, v in pairs(tbl_upvr) do
		tbl_upvw[var53] = v
		var53 += 1
	end
end
local function playerAdded(arg1) -- Line 110
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvw (read and write)
		[3]: any_getUserFlag_result1_upvr (readonly)
		[4]: Include_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local function characterAdded(arg1_2) -- Line 111
		--[[ Upvalues[3]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		tbl_upvr[arg1] = arg1_2
		local var69 = 1
		tbl_upvw = {}
		for _, v_2 in pairs(tbl_upvr) do
			tbl_upvw[var69] = v_2
			var69 += 1
		end
	end
	local function characterRemoving() -- Line 115
		--[[ Upvalues[3]:
			[1]: tbl_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		tbl_upvr[arg1] = nil
		local var77 = 1
		tbl_upvw = {}
		for _, v_3 in pairs(tbl_upvr) do
			tbl_upvw[var77] = v_3
			var77 += 1
		end
	end
	if any_getUserFlag_result1_upvr then
		Include_upvr:trackConnection(`{arg1.UserId}CharacterAdded`, arg1.CharacterAdded:Connect(characterAdded))
		Include_upvr:trackConnection(`{arg1.UserId}CharacterRemoving`, arg1.CharacterRemoving:Connect(characterRemoving))
	else
		arg1.CharacterAdded:Connect(characterAdded)
		arg1.CharacterRemoving:Connect(characterRemoving)
	end
	if arg1.Character then
		tbl_upvr[arg1] = arg1.Character
		tbl_upvw = {}
		for _, v_4 in pairs(tbl_upvr) do
			tbl_upvw[1] = v_4
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local var84
		end
	end
end
Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(function(arg1) -- Line 133, Named "playerRemoving"
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvw (read and write)
		[3]: any_getUserFlag_result1_upvr (readonly)
		[4]: Include_upvr (readonly)
	]]
	tbl_upvr[arg1] = nil
	local var89 = 1
	tbl_upvw = {}
	for _, v_5 in pairs(tbl_upvr) do
		tbl_upvw[var89] = v_5
		var89 += 1
	end
	if any_getUserFlag_result1_upvr then
		v_5 = arg1.UserId
		Include_upvr:disconnect(`{v_5}CharacterAdded`)
		v_5 = arg1.UserId
		Include_upvr:disconnect(`{v_5}CharacterRemoving`)
	end
end)
for _, v_6 in ipairs(Players:GetPlayers()) do
	playerAdded(v_6)
	local var96
end
tbl_upvw = {}
local var97_upvw = tbl_upvw
for _, v_7 in pairs(tbl_upvr) do
	var97_upvw[1] = v_7
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local var101
end
tbl_upvr = nil
local var102_upvw = tbl_upvr
local var103_upvw
if any_getUserFlag_result1_upvr_3 then
	var101 = "CameraSubject"
	nil(var101, function() -- Line 173
		--[[ Upvalues[2]:
			[1]: var22_upvr (readonly)
			[2]: var103_upvw (read and write)
		]]
		local CameraSubject_2 = var22_upvr:getCamera().CameraSubject
		if CameraSubject_2 and CameraSubject_2:IsA("Humanoid") then
			var103_upvw = CameraSubject_2.RootPart
		else
			if CameraSubject_2 and CameraSubject_2:IsA("BasePart") then
				var103_upvw = CameraSubject_2
				return
			end
			var103_upvw = nil
		end
	end)
else
	CurrentCamera_upvw:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line 184
		--[[ Upvalues[2]:
			[1]: CurrentCamera_upvw (read and write)
			[2]: var103_upvw (read and write)
		]]
		local CameraSubject = CurrentCamera_upvw.CameraSubject
		if CameraSubject:IsA("Humanoid") then
			var103_upvw = CameraSubject.RootPart
		else
			if CameraSubject:IsA("BasePart") then
				var103_upvw = CameraSubject
				return
			end
			var103_upvw = nil
		end
	end)
end
local function _(arg1) -- Line 196, Named "canOcclude"
	--[[ Upvalues[1]:
		[1]: var102_upvw (read and write)
	]]
	local var110 = false
	if 1 - (1 - arg1.Transparency) * (1 - arg1.LocalTransparencyModifier) < 0.25 then
		var110 = arg1.CanCollide
		if var110 then
			var110 = false
			if var102_upvw ~= (arg1:GetRootPart() or arg1) then
				var110 = not arg1:IsA("TrussPart")
			end
		end
	end
	return var110
end
local tbl_upvr_2 = {Vector2.new(0.4, 0), Vector2.new(-0.4, 0), Vector2.new(0, -0.4), Vector2.new(0, 0.4), Vector2.new(0, 0.2)}
local function getCollisionPoint_upvr(arg1, arg2) -- Line 224, Named "getCollisionPoint"
	--[[ Upvalues[4]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
		[2]: RaycastParams_new_result1_upvr (readonly)
		[3]: var97_upvw (read and write)
		[4]: new_upvr (readonly)
	]]
	-- KONSTANTERROR: Failed to generate AST for function `getCollisionPoint`:
assertion failed!
Traceback:
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K

end
local function queryPoint_upvr(arg1, arg2, arg3, arg4) -- Line 262, Named "queryPoint"
	--[[ Upvalues[7]:
		[1]: var97_upvw (read and write)
		[2]: var45_upvw (read and write)
		[3]: any_getUserFlag_result1_upvr_2 (readonly)
		[4]: RaycastParams_new_result1_upvr (readonly)
		[5]: var102_upvw (read and write)
		[6]: RaycastParams_new_result1_upvr_2 (readonly)
		[7]: new_upvr (readonly)
	]]
	-- KONSTANTERROR: Failed to generate AST for function `queryPoint`:
assertion failed!
Traceback:
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K

end
local function queryViewport_upvr(arg1, arg2) -- Line 365, Named "queryViewport"
	--[[ Upvalues[7]:
		[1]: CurrentCamera_upvw (read and write)
		[2]: any_getUserFlag_result1_upvr_3 (readonly)
		[3]: var22_upvr (readonly)
		[4]: var33_upvw (read and write)
		[5]: var44_upvw (read and write)
		[6]: var45_upvw (read and write)
		[7]: queryPoint_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("queryViewport")
	local lookVector = arg1.lookVector
	local var121
	if any_getUserFlag_result1_upvr_3 then
		lookVector = var22_upvr:getCamera()
	else
		lookVector = CurrentCamera_upvw
	end
	CurrentCamera_upvw = lookVector
	local ViewportSize_3 = CurrentCamera_upvw.ViewportSize
	var121 = math.huge
	for i_9 = 0, 1 do
		for i_10 = 0, 1 do
			local queryPoint_result1, queryPoint_result2 = queryPoint_upvr(arg1.p + var45_upvw * ((arg1.rightVector) * ((i_9 - 0.5) * var33_upvw) + (arg1.upVector) * ((i_10 - 0.5) * var44_upvw)), -lookVector, arg2, CurrentCamera_upvw:ViewportPointToRay(ViewportSize_3.x * i_9, ViewportSize_3.y * i_10).Origin)
			if queryPoint_result2 < math.huge then
			end
			if queryPoint_result1 < var121 then
				var121 = queryPoint_result1
			end
		end
	end
	debug.profileend()
	return var121, queryPoint_result2
end
local min_upvr = math.min
local function testPromotion_upvr(arg1, arg2, arg3) -- Line 408, Named "testPromotion"
	--[[ Upvalues[4]:
		[1]: getCollisionPoint_upvr (readonly)
		[2]: min_upvr (readonly)
		[3]: queryPoint_upvr (readonly)
		[4]: tbl_upvr_2 (readonly)
	]]
	debug.profilebegin("testPromotion")
	local p = arg1.p
	debug.profilebegin("extrapolate")
	for i_11 = 0, min_upvr(1.25, arg3.rotVelocity.magnitude + (getCollisionPoint_upvr(p, arg3.posVelocity * 1.25) - p).Magnitude / arg3.posVelocity.magnitude), 0.0625 do
		local any_extrapolate_result1 = arg3.extrapolate(i_11)
		if arg2 <= queryPoint_upvr(any_extrapolate_result1.p, -any_extrapolate_result1.lookVector, arg2) then
			return false
		end
	end
	debug.profileend()
	debug.profilebegin("testOffsets")
	for _, v_8 in ipairs(tbl_upvr_2) do
		local getCollisionPoint_result1 = getCollisionPoint_upvr(p, arg1.rightVector * v_8.x + arg1.upVector * v_8.y)
		if queryPoint_upvr(getCollisionPoint_result1, (p + -arg1.lookVector * arg2 - getCollisionPoint_result1).Unit, arg2) == math.huge then
			return false
		end
	end
	debug.profileend()
	debug.profileend()
	return true
end
return function(arg1, arg2, arg3) -- Line 457, Named "Popper"
	--[[ Upvalues[4]:
		[1]: var102_upvw (read and write)
		[2]: var103_upvw (read and write)
		[3]: queryViewport_upvr (readonly)
		[4]: testPromotion_upvr (readonly)
	]]
	debug.profilebegin("popper")
	local var135
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var135 = var103_upvw:GetRootPart()
		return var135
	end
	if not var103_upvw or not INLINED() then
		var135 = var103_upvw
	end
	var102_upvw = var135
	var135 = arg2
	local queryViewport_upvr_result1, queryViewport_upvr_result2 = queryViewport_upvr(arg1, arg2)
	if queryViewport_upvr_result2 < var135 then
		var135 = queryViewport_upvr_result2
	end
	if queryViewport_upvr_result1 < var135 and testPromotion_upvr(arg1, arg2, arg3) then
		var135 = queryViewport_upvr_result1
	end
	var102_upvw = nil
	debug.profileend()
	return var135
end
--------------------
📂 [SERVICE: PlayerModule]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:59
-- Luau version 6, Types version 3
-- Time taken: 0.029253 seconds

local tbl_upvr_3 = {}
tbl_upvr_3.__index = tbl_upvr_3
local tbl_2_upvr = {"CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock"}
local tbl_upvr = {"ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode"}
local Players_upvr = game:GetService("Players")
local UserInputService_upvr = game:GetService("UserInputService")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local CommonUtils = script.Parent:WaitForChild("CommonUtils")
local module = require(CommonUtils:WaitForChild("FlagUtil"))
local module_upvr_7 = require(script:WaitForChild("CameraUtils"))
if not Players_upvr.LocalPlayer then
	return {}
end
assert(Players_upvr.LocalPlayer, "Strict typing check")
local PlayerScripts = Players_upvr.LocalPlayer:WaitForChild("PlayerScripts")
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
local any_getUserFlag_result1_upvr_2 = module.getUserFlag("UserPlayerConnectionMemoryLeak")
local module_upvr_10 = require(script:WaitForChild("TransparencyController"))
local module_upvr_2 = require(CommonUtils:WaitForChild("ConnectionUtil"))
local module_upvr_8 = require(script:WaitForChild("MouseLockController"))
local RunService_upvr = game:GetService("RunService")
function tbl_upvr_3.new() -- Line 144
	--[[ Upvalues[11]:
		[1]: module_upvr_10 (readonly)
		[2]: any_getUserFlag_result1_upvr_2 (readonly)
		[3]: module_upvr_2 (readonly)
		[4]: tbl_upvr_3 (readonly)
		[5]: Players_upvr (readonly)
		[6]: module_upvr_8 (readonly)
		[7]: RunService_upvr (readonly)
		[8]: tbl_2_upvr (readonly)
		[9]: tbl_upvr (readonly)
		[10]: UserGameSettings_upvr (readonly)
		[11]: UserInputService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tbl = {}
	local any_new_result1 = module_upvr_10.new()
	tbl.activeTransparencyController = any_new_result1
	if any_getUserFlag_result1_upvr_2 then
		any_new_result1 = module_upvr_2.new()
	else
		any_new_result1 = nil
	end
	tbl.connectionUtil = any_new_result1
	local setmetatable_result1 = setmetatable(tbl, tbl_upvr_3)
	setmetatable_result1.activeCameraController = nil
	setmetatable_result1.activeOcclusionModule = nil
	setmetatable_result1.activeMouseLockController = nil
	setmetatable_result1.currentComputerCameraMovementMode = nil
	setmetatable_result1.cameraSubjectChangedConn = nil
	setmetatable_result1.cameraTypeChangedConn = nil
	for var50, v in pairs(Players_upvr:GetPlayers()) do
		setmetatable_result1:OnPlayerAdded(v)
		local var46_upvr
	end
	Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 167
		--[[ Upvalues[1]:
			[1]: var46_upvr (readonly)
		]]
		var46_upvr:OnPlayerAdded(arg1)
	end)
	if any_getUserFlag_result1_upvr_2 then
		Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 172
			--[[ Upvalues[1]:
				[1]: var46_upvr (readonly)
			]]
			var46_upvr:OnPlayerRemoving(arg1)
		end)
	end
	var46_upvr.activeTransparencyController:Enable(true)
	var46_upvr.activeMouseLockController = module_upvr_8.new()
	assert(var46_upvr.activeMouseLockController, "Strict typing check")
	local any_GetBindableToggleEvent_result1 = var46_upvr.activeMouseLockController:GetBindableToggleEvent()
	if any_GetBindableToggleEvent_result1 then
		function var50() -- Line 184
			--[[ Upvalues[1]:
				[1]: var46_upvr (readonly)
			]]
			var46_upvr:OnMouseLockToggled()
		end
		any_GetBindableToggleEvent_result1:Connect(var50)
	end
	var46_upvr:ActivateCameraController()
	var46_upvr:ActivateOcclusionModule(Players_upvr.LocalPlayer.DevCameraOcclusionMode)
	var46_upvr:OnCurrentCameraChanged()
	RunService_upvr:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(arg1) -- Line 192
		--[[ Upvalues[1]:
			[1]: var46_upvr (readonly)
		]]
		var46_upvr:Update(arg1)
	end)
	for _, v_2_upvr in pairs(tbl_2_upvr) do
		Players_upvr.LocalPlayer:GetPropertyChangedSignal(v_2_upvr):Connect(function() -- Line 196
			--[[ Upvalues[2]:
				[1]: var46_upvr (readonly)
				[2]: v_2_upvr (readonly)
			]]
			var46_upvr:OnLocalPlayerCameraPropertyChanged(v_2_upvr)
		end)
		local var56_upvr
	end
	for _, v_3_upvr in pairs(tbl_upvr) do
		UserGameSettings_upvr:GetPropertyChangedSignal(v_3_upvr):Connect(function() -- Line 202
			--[[ Upvalues[2]:
				[1]: var56_upvr (readonly)
				[2]: v_3_upvr (readonly)
			]]
			var56_upvr:OnUserGameSettingsPropertyChanged(v_3_upvr)
		end)
		local var61_upvr
	end
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line 206
		--[[ Upvalues[1]:
			[1]: var61_upvr (readonly)
		]]
		var61_upvr:OnCurrentCameraChanged()
	end)
	UserInputService_upvr:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line 209
		--[[ Upvalues[1]:
			[1]: var61_upvr (readonly)
		]]
		var61_upvr:OnPreferredInputChanged()
	end)
	return var61_upvr
end
function tbl_upvr_3.GetCameraMovementModeFromSettings(arg1) -- Line 216
	--[[ Upvalues[4]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr_7 (readonly)
		[3]: UserInputService_upvr (readonly)
		[4]: UserGameSettings_upvr (readonly)
	]]
	local var64
	if Players_upvr.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		var64 = module_upvr_7
		var64 = Enum.ComputerCameraMovementMode.Classic
		return var64.ConvertCameraModeEnumToStandard(var64)
	end
	local var65
	var64 = nil
	if UserInputService_upvr.PreferredInput == Enum.PreferredInput.Touch then
		var65 = module_upvr_7.ConvertCameraModeEnumToStandard(Players_upvr.LocalPlayer.DevTouchCameraMode)
		var64 = module_upvr_7.ConvertCameraModeEnumToStandard(UserGameSettings_upvr.TouchCameraMovementMode)
	else
		var65 = module_upvr_7.ConvertCameraModeEnumToStandard(Players_upvr.LocalPlayer.DevComputerCameraMode)
		var64 = module_upvr_7.ConvertCameraModeEnumToStandard(UserGameSettings_upvr.ComputerCameraMovementMode)
	end
	if var65 == Enum.DevComputerCameraMovementMode.UserChoice then
		return var64
	end
	return var65
end
local module_upvr_5 = require(script:WaitForChild("Poppercam"))
local module_upvr_4 = require(script:WaitForChild("Invisicam"))
local tbl_3_upvr = {}
function tbl_upvr_3.ActivateOcclusionModule(arg1, arg2) -- Line 241
	--[[ Upvalues[4]:
		[1]: module_upvr_5 (readonly)
		[2]: module_upvr_4 (readonly)
		[3]: tbl_3_upvr (readonly)
		[4]: Players_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	local var69
	if arg2 == Enum.DevCameraOcclusionMode.Zoom then
		var69 = module_upvr_5
	elseif arg2 == Enum.DevCameraOcclusionMode.Invisicam then
		var69 = module_upvr_4
	else
		warn("CameraScript ActivateOcclusionModule called with unsupported mode")
		return
	end
	arg1.occlusionMode = arg2
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 17. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 17. Error Block 9 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [30] 21. Error Block 38 start (CF ANALYSIS FAILED)
	if not arg1.activeOcclusionModule:GetEnabled() then
		arg1.activeOcclusionModule:Enable(true)
	end
	do
		return
	end
	-- KONSTANTERROR: [30] 21. Error Block 38 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [43] 30. Error Block 13 start (CF ANALYSIS FAILED)
	arg1.activeOcclusionModule = tbl_3_upvr[var69]
	-- KONSTANTERROR: [43] 30. Error Block 13 end (CF ANALYSIS FAILED)
end
function tbl_upvr_3.ShouldUseVehicleCamera(arg1) -- Line 320
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera_5 = workspace.CurrentCamera
	local var77
	if not CurrentCamera_5 then
		return false
	end
	local CameraType_3 = CurrentCamera_5.CameraType
	local var80 = true
	var77 = Enum.CameraType.Custom
	if CameraType_3 ~= var77 then
		var77 = Enum.CameraType.Follow
		if CameraType_3 ~= var77 then
			var80 = false
		else
			var80 = true
		end
	end
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		var77 = CurrentCamera_5.CameraSubject:IsA("VehicleSeat")
		return var77
	end
	if not CurrentCamera_5.CameraSubject or not INLINED_2() then
		var77 = false
	end
	if arg1.occlusionMode == Enum.DevCameraOcclusionMode.Invisicam then
	else
	end
	if var77 then
		if var80 then
		end
	end
	return true
end
local module_upvr_3 = require(script:WaitForChild("LegacyCamera"))
local VRService_upvr = game:GetService("VRService")
local module_upvr_9 = require(script:WaitForChild("VRCamera"))
local module_upvr_6 = require(script:WaitForChild("ClassicCamera"))
local module_upvr_13 = require(script:WaitForChild("OrbitalCamera"))
local module_upvr = require(script:WaitForChild("VRVehicleCamera"))
local module_upvr_12 = require(script:WaitForChild("VehicleCamera"))
local tbl_upvr_2 = {}
local any_getUserFlag_result1_upvr = module.getUserFlag("UserPSFixCameraControllerReset")
function tbl_upvr_3.ActivateCameraController(arg1) -- Line 336
	--[[ Upvalues[9]:
		[1]: module_upvr_3 (readonly)
		[2]: VRService_upvr (readonly)
		[3]: module_upvr_9 (readonly)
		[4]: module_upvr_6 (readonly)
		[5]: module_upvr_13 (readonly)
		[6]: module_upvr (readonly)
		[7]: module_upvr_12 (readonly)
		[8]: tbl_upvr_2 (readonly)
		[9]: any_getUserFlag_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 104 start (CF ANALYSIS FAILED)
	local CameraType = workspace.CurrentCamera.CameraType
	if CameraType == Enum.CameraType.Scriptable then
		if arg1.activeCameraController then
			arg1.activeCameraController:Enable(false)
			arg1.activeCameraController = nil
		end
		return
	end
	if CameraType == Enum.CameraType.Custom then
		-- KONSTANTWARNING: GOTO [76] #48
	end
	-- KONSTANTERROR: [0] 1. Error Block 104 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 24. Error Block 98 start (CF ANALYSIS FAILED)
	if CameraType == Enum.CameraType.Track then
		-- KONSTANTWARNING: GOTO [76] #48
	end
	-- KONSTANTERROR: [36] 24. Error Block 98 end (CF ANALYSIS FAILED)
end
function tbl_upvr_3.OnCameraSubjectChanged(arg1) -- Line 442
	local CurrentCamera = workspace.CurrentCamera
	local var92
	if CurrentCamera then
		var92 = CurrentCamera.CameraSubject
	else
		var92 = nil
	end
	if arg1.activeTransparencyController then
		arg1.activeTransparencyController:SetSubject(var92)
	end
	if arg1.activeOcclusionModule then
		arg1.activeOcclusionModule:OnCameraSubjectChanged(var92)
	end
	arg1:ActivateCameraController()
end
function tbl_upvr_3.OnCameraTypeChanged(arg1, arg2) -- Line 457
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: module_upvr_7 (readonly)
	]]
	if arg2 == Enum.CameraType.Scriptable and UserInputService_upvr.MouseBehavior == Enum.MouseBehavior.LockCenter then
		module_upvr_7.restoreMouseBehavior()
	end
	arg1:ActivateCameraController()
end
function tbl_upvr_3.OnCurrentCameraChanged(arg1) -- Line 469
	local CurrentCamera_4_upvr = game.Workspace.CurrentCamera
	if not CurrentCamera_4_upvr then
	else
		if arg1.cameraSubjectChangedConn then
			arg1.cameraSubjectChangedConn:Disconnect()
		end
		if arg1.cameraTypeChangedConn then
			arg1.cameraTypeChangedConn:Disconnect()
		end
		arg1.cameraSubjectChangedConn = CurrentCamera_4_upvr:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line 481
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnCameraSubjectChanged()
		end)
		arg1.cameraTypeChangedConn = CurrentCamera_4_upvr:GetPropertyChangedSignal("CameraType"):Connect(function() -- Line 485
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: CurrentCamera_4_upvr (readonly)
			]]
			arg1:OnCameraTypeChanged(CurrentCamera_4_upvr.CameraType)
		end)
		arg1:OnCameraSubjectChanged()
		arg1:OnCameraTypeChanged(CurrentCamera_4_upvr.CameraType)
	end
end
function tbl_upvr_3.OnLocalPlayerCameraPropertyChanged(arg1, arg2) -- Line 493
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 21. Error Block 34 start (CF ANALYSIS FAILED)
	if Players_upvr.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
		arg1:ActivateCameraController()
		return
	end
	warn("Unhandled value for property player.CameraMode: ", Players_upvr.LocalPlayer.CameraMode)
	do
		return
	end
	-- KONSTANTERROR: [33] 21. Error Block 34 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [56] 36. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [56] 36. Error Block 12 end (CF ANALYSIS FAILED)
end
function tbl_upvr_3.OnUserGameSettingsPropertyChanged(arg1, arg2) -- Line 535
	if arg2 == "ComputerCameraMovementMode" or arg2 == "TouchCameraMovementMode" then
		arg1:ActivateCameraController()
	end
end
function tbl_upvr_3.OnPreferredInputChanged(arg1) -- Line 541
	arg1:ActivateCameraController()
end
local module_upvr_11 = require(script:WaitForChild("CameraInput"))
function tbl_upvr_3.Update(arg1, arg2) -- Line 551
	--[[ Upvalues[1]:
		[1]: module_upvr_11 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg1.activeCameraController then
		arg1.activeCameraController:UpdateMouseBehavior()
		local any_Update_result1_2, any_Update_result2_2 = arg1.activeCameraController:Update(arg2)
		if arg1.activeOcclusionModule then
			local any_Update_result1, any_Update_result2 = arg1.activeOcclusionModule:Update(arg2, any_Update_result1_2, any_Update_result2_2)
			any_Update_result1_2 = any_Update_result1
		end
		local CurrentCamera_2 = game.Workspace.CurrentCamera
		CurrentCamera_2.CFrame = any_Update_result1_2
		CurrentCamera_2.Focus = any_Update_result2
		if arg1.activeTransparencyController then
			arg1.activeTransparencyController:Update(arg2)
		end
		if module_upvr_11.getInputEnabled() then
			module_upvr_11.resetInputForFrameEnd()
		end
	end
end
function tbl_upvr_3.OnCharacterAdded(arg1, arg2, arg3) -- Line 577
	if arg1.activeOcclusionModule then
		arg1.activeOcclusionModule:CharacterAdded(arg2, arg3)
	end
end
function tbl_upvr_3.OnCharacterRemoving(arg1, arg2, arg3) -- Line 583
	if arg1.activeOcclusionModule then
		arg1.activeOcclusionModule:CharacterRemoving(arg2, arg3)
	end
end
function tbl_upvr_3.OnPlayerAdded(arg1, arg2) -- Line 589
	--[[ Upvalues[1]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
	arg1.connectionUtil:trackConnection(`{arg2.UserId}CharacterAdded`, arg2.CharacterAdded:Connect(function(arg1_2) -- Line 593
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1:OnCharacterAdded(arg1_2, arg2)
	end))
	arg1.connectionUtil:trackConnection(`{arg2.UserId}CharacterRemoving`, arg2.CharacterRemoving:Connect(function(arg1_3) -- Line 596
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1:OnCharacterRemoving(arg1_3, arg2)
	end))
	do
		return
	end
	-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [46] 34. Error Block 4 start (CF ANALYSIS FAILED)
	arg2.CharacterAdded:Connect(function(arg1_4) -- Line 601
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1:OnCharacterAdded(arg1_4, arg2)
	end)
	arg2.CharacterRemoving:Connect(function(arg1_5) -- Line 604
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1:OnCharacterRemoving(arg1_5, arg2)
	end)
	-- KONSTANTERROR: [46] 34. Error Block 4 end (CF ANALYSIS FAILED)
end
function tbl_upvr_3.OnPlayerRemoving(arg1, arg2) -- Line 610
	if arg1.connectionUtil then
		arg1.connectionUtil:disconnect(`{arg2.UserId}CharacterAdded`)
		arg1.connectionUtil:disconnect(`{arg2.UserId}CharacterRemoving`)
	end
end
function tbl_upvr_3.OnMouseLockToggled(arg1) -- Line 618
	if arg1.activeMouseLockController and arg1.activeCameraController then
		arg1.activeCameraController:SetIsMouseLocked(arg1.activeMouseLockController:GetIsMouseLocked())
		arg1.activeCameraController:SetMouseLockOffset(arg1.activeMouseLockController:GetMouseLockOffset())
	end
end
tbl_upvr_3.new()
return {}
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:09
-- Luau version 6, Types version 3
-- Time taken: 0.044229 seconds

local module_upvr_3 = {}
module_upvr_3.__index = module_upvr_3
local Players_upvr = game:GetService("Players")
local UserInputService_upvr = game:GetService("UserInputService")
local GuiService_upvr = game:GetService("GuiService")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local VRService_upvr = game:GetService("VRService")
local module_upvr_7 = require(script:WaitForChild("Keyboard"))
local module_upvr_8 = require(script:WaitForChild("Gamepad"))
local module_upvr_4 = require(script:WaitForChild("DynamicThumbstick"))
local pcall_result1, pcall_result2 = pcall(function() -- Line 41
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local module_upvr_2 = require(script:WaitForChild("TouchThumbstick"))
local module_upvr_5 = require(script:WaitForChild("ClickToMoveController"))
local Value_upvr = Enum.ContextActionPriority.Medium.Value
local tbl_upvr = {
	[Enum.TouchMovementMode.DPad] = module_upvr_4;
	[Enum.DevTouchMovementMode.DPad] = module_upvr_4;
	[Enum.TouchMovementMode.Thumbpad] = module_upvr_4;
	[Enum.DevTouchMovementMode.Thumbpad] = module_upvr_4;
	[Enum.TouchMovementMode.Thumbstick] = module_upvr_2;
	[Enum.DevTouchMovementMode.Thumbstick] = module_upvr_2;
	[Enum.TouchMovementMode.DynamicThumbstick] = module_upvr_4;
	[Enum.DevTouchMovementMode.DynamicThumbstick] = module_upvr_4;
	[Enum.TouchMovementMode.ClickToMove] = module_upvr_5;
	[Enum.DevTouchMovementMode.ClickToMove] = module_upvr_5;
	[Enum.TouchMovementMode.Default] = module_upvr_4;
	[Enum.ComputerMovementMode.Default] = module_upvr_7;
	[Enum.ComputerMovementMode.KeyboardMouse] = module_upvr_7;
	[Enum.DevComputerMovementMode.KeyboardMouse] = module_upvr_7;
	[Enum.DevComputerMovementMode.Scriptable] = nil;
	[Enum.ComputerMovementMode.ClickToMove] = module_upvr_5;
	[Enum.DevComputerMovementMode.ClickToMove] = module_upvr_5;
}
local module_upvr_6 = require(script:WaitForChild("VehicleController"))
local RunService_upvr = game:GetService("RunService")
function module_upvr_3.new() -- Line 84
	--[[ Upvalues[8]:
		[1]: module_upvr_3 (readonly)
		[2]: Players_upvr (readonly)
		[3]: module_upvr_6 (readonly)
		[4]: Value_upvr (readonly)
		[5]: RunService_upvr (readonly)
		[6]: UserGameSettings_upvr (readonly)
		[7]: GuiService_upvr (readonly)
		[8]: UserInputService_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr_3)
	setmetatable_result1_upvr.controllers = {}
	setmetatable_result1_upvr.activeControlModule = nil
	setmetatable_result1_upvr.activeController = nil
	setmetatable_result1_upvr.touchJumpController = nil
	setmetatable_result1_upvr.moveFunction = Players_upvr.LocalPlayer.Move
	setmetatable_result1_upvr.humanoid = nil
	setmetatable_result1_upvr.controlsEnabled = true
	setmetatable_result1_upvr.humanoidSeatedConn = nil
	setmetatable_result1_upvr.vehicleController = nil
	setmetatable_result1_upvr.touchControlFrame = nil
	setmetatable_result1_upvr.currentTorsoAngle = 0
	setmetatable_result1_upvr.inputMoveVector = Vector3.new(0, 0, 0)
	setmetatable_result1_upvr.vehicleController = module_upvr_6.new(Value_upvr)
	Players_upvr.LocalPlayer.CharacterAdded:Connect(function(arg1) -- Line 109
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnCharacterAdded(arg1)
	end)
	Players_upvr.LocalPlayer.CharacterRemoving:Connect(function(arg1) -- Line 110
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnCharacterRemoving(arg1)
	end)
	if Players_upvr.LocalPlayer.Character then
		setmetatable_result1_upvr:OnCharacterAdded(Players_upvr.LocalPlayer.Character)
	end
	RunService_upvr:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(arg1) -- Line 115
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnRenderStepped(arg1)
	end)
	UserGameSettings_upvr:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() -- Line 119
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMovementMode()
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() -- Line 122
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMovementMode()
	end)
	UserGameSettings_upvr:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() -- Line 126
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMovementMode()
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() -- Line 129
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMovementMode()
	end)
	setmetatable_result1_upvr.playerGui = nil
	setmetatable_result1_upvr.touchGui = nil
	setmetatable_result1_upvr.playerGuiAddedConn = nil
	GuiService_upvr:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() -- Line 138
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMovementMode()
		setmetatable_result1_upvr:UpdateActiveControlModuleEnabled()
	end)
	UserInputService_upvr:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line 143
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateMovementMode()
	end)
	setmetatable_result1_upvr.playerGui = Players_upvr.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	if not setmetatable_result1_upvr.playerGui then
		setmetatable_result1_upvr.playerGuiAddedConn = Players_upvr.LocalPlayer.ChildAdded:Connect(function(arg1) -- Line 149
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			if arg1:IsA("PlayerGui") then
				setmetatable_result1_upvr.playerGui = arg1
				setmetatable_result1_upvr.playerGuiAddedConn:Disconnect()
				setmetatable_result1_upvr.playerGuiAddedConn = nil
				setmetatable_result1_upvr:UpdateMovementMode()
			end
		end)
	end
	setmetatable_result1_upvr:UpdateMovementMode()
	return setmetatable_result1_upvr
end
function module_upvr_3.GetMoveVector(arg1) -- Line 167
	if arg1.activeController then
		return arg1.activeController:GetMoveVector()
	end
	return Vector3.new(0, 0, 0)
end
local function _(arg1) -- Line 174, Named "NormalizeAngle"
	arg1 = (arg1 + 12.566370614359172) % (-math.pi*2)
	local var30 = arg1
	if math.pi < var30 then
		var30 -= (-math.pi*2)
	end
	return var30
end
local function _(arg1, arg2) -- Line 182, Named "AverageAngle"
	local var31 = (arg2 - arg1 + 12.566370614359172) % (-math.pi*2)
	if math.pi < var31 then
		var31 -= (-math.pi*2)
	end
	local var32 = (arg1 + var31 / 2 + 12.566370614359172) % (-math.pi*2)
	if math.pi < var32 then
		var32 -= (-math.pi*2)
	end
	return var32
end
function module_upvr_3.GetEstimatedVRTorsoFrame(arg1) -- Line 187
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
	local _, any_ToEulerAnglesYXZ_result2, _ = any_GetUserCFrame_result1:ToEulerAnglesYXZ()
	local var37
	if not VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or not VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		arg1.currentTorsoAngle = -any_ToEulerAnglesYXZ_result2
	else
		local var38 = any_GetUserCFrame_result1.Position - VRService_upvr:GetUserCFrame(Enum.UserCFrame.LeftHand).Position
		local _ = any_GetUserCFrame_result1.Position - VRService_upvr:GetUserCFrame(Enum.UserCFrame.RightHand).Position
		local _ = -math.atan2(var38.X, var38.Z)
		var37 = _.Z
		var37 = -math.atan2(_.X, var37) - _
		var37 = (var37 + 12.566370614359172) % (-math.pi*2)
		if math.pi < var37 then
			var37 -= (-math.pi*2)
		end
		var37 = _ + var37 / 2
		var37 = (var37 + 12.566370614359172) % (-math.pi*2)
		if math.pi < var37 then
			var37 -= (-math.pi*2)
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if math.pi < (-any_ToEulerAnglesYXZ_result2 - arg1.currentTorsoAngle + 12.566370614359172) % (-math.pi*2) then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		end
		local var41 = (-any_ToEulerAnglesYXZ_result2 - arg1.currentTorsoAngle + 12.566370614359172) % (-math.pi*2) - (-math.pi*2)
		local var42 = (var37 - arg1.currentTorsoAngle + 12.566370614359172) % (-math.pi*2)
		if math.pi < var42 then
			var42 -= (-math.pi*2)
		end
		var42 = false
		local var43 = var42
		if (-math.pi/2) < var42 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if var42 >= (math.pi/2) then
				var43 = false
			else
				var43 = true
			end
		end
		if not var43 then
		end
		local minimum = math.min(var41, var41)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local maximum = math.max(var41, var41)
		local var46 = 0
		if 0 < minimum then
			var46 = minimum
		elseif maximum < 0 then
			var46 = maximum
		end
		arg1.currentTorsoAngle = var46 + arg1.currentTorsoAngle
	end
	return CFrame.new(any_GetUserCFrame_result1.Position) * CFrame.fromEulerAnglesYXZ(0, -arg1.currentTorsoAngle, 0)
end
function module_upvr_3.GetActiveController(arg1) -- Line 231
	return arg1.activeController
end
local module_upvr = require(script:WaitForChild("TouchJump"))
function module_upvr_3.UpdateActiveControlModuleEnabled(arg1) -- Line 236
	--[[ Upvalues[7]:
		[1]: Players_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
		[3]: module_upvr_5 (readonly)
		[4]: module_upvr_2 (readonly)
		[5]: module_upvr_4 (readonly)
		[6]: module_upvr (readonly)
		[7]: GuiService_upvr (readonly)
	]]
	local function _() -- Line 238
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: Players_upvr (copied, readonly)
		]]
		arg1.activeController:Enable(false)
		if arg1.touchJumpController then
			arg1.touchJumpController:Enable(false)
		end
		if arg1.moveFunction then
			arg1.moveFunction(Players_upvr.LocalPlayer, Vector3.new(0, 0, 0), true)
		end
	end
	if not arg1.activeController then
	else
		if not arg1.controlsEnabled then
			arg1.activeController:Enable(false)
			if arg1.touchJumpController then
				arg1.touchJumpController:Enable(false)
			end
			if arg1.moveFunction then
				arg1.moveFunction(Players_upvr.LocalPlayer, Vector3.new(0, 0, 0), true)
			end
			return
		end
		if not GuiService_upvr.TouchControlsEnabled and UserInputService_upvr.PreferredInput == Enum.PreferredInput.Touch and (arg1.activeControlModule == module_upvr_5 or arg1.activeControlModule == module_upvr_2 or arg1.activeControlModule == module_upvr_4) then
			arg1.activeController:Enable(false)
			if arg1.touchJumpController then
				arg1.touchJumpController:Enable(false)
			end
			if arg1.moveFunction then
				arg1.moveFunction(Players_upvr.LocalPlayer, Vector3.new(0, 0, 0), true)
			end
			return
		end
		;(function() -- Line 249
			--[[ Upvalues[7]:
				[1]: arg1 (readonly)
				[2]: UserInputService_upvr (copied, readonly)
				[3]: module_upvr_5 (copied, readonly)
				[4]: module_upvr_2 (copied, readonly)
				[5]: module_upvr_4 (copied, readonly)
				[6]: module_upvr (copied, readonly)
				[7]: Players_upvr (copied, readonly)
			]]
			if arg1.touchControlFrame and UserInputService_upvr.PreferredInput == Enum.PreferredInput.Touch and (arg1.activeControlModule == module_upvr_5 or arg1.activeControlModule == module_upvr_2 or arg1.activeControlModule == module_upvr_4) then
				if not arg1.controllers[module_upvr] then
					arg1.controllers[module_upvr] = module_upvr.new()
				end
				arg1.touchJumpController = arg1.controllers[module_upvr]
				arg1.touchJumpController:Enable(true, arg1.touchControlFrame)
			elseif arg1.touchJumpController then
				arg1.touchJumpController:Enable(false)
			end
			local var50
			if arg1.activeControlModule == module_upvr_5 then
				if Players_upvr.LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.UserChoice then
					var50 = false
				else
					var50 = true
				end
				arg1.activeController:Enable(true, var50, arg1.touchJumpController)
			else
				if arg1.touchControlFrame then
					var50 = arg1.touchControlFrame
					arg1.activeController:Enable(true, var50)
					return
				end
				arg1.activeController:Enable(true)
			end
		end)()
	end
end
function module_upvr_3.Enable(arg1, arg2) -- Line 307
	if arg2 == nil then
		local var51 = true
	end
	if arg1.controlsEnabled == var51 then
	else
		arg1.controlsEnabled = var51
		if not arg1.activeController then return end
		arg1:UpdateActiveControlModuleEnabled()
	end
end
function module_upvr_3.Disable(arg1) -- Line 322
	arg1:Enable(false)
end
function module_upvr_3.SelectComputerMovementModule(arg1) -- Line 328
	--[[ Upvalues[7]:
		[1]: UserInputService_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: module_upvr_8 (readonly)
		[4]: module_upvr_7 (readonly)
		[5]: UserGameSettings_upvr (readonly)
		[6]: module_upvr_5 (readonly)
		[7]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	do
		return nil, false
	end
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_upvr_3.SelectTouchModule(arg1) -- Line 371
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: UserGameSettings_upvr (readonly)
	]]
	local var52
	local DevTouchMovementMode = Players_upvr.LocalPlayer.DevTouchMovementMode
	if DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		var52 = tbl_upvr[UserGameSettings_upvr.TouchMovementMode]
	else
		if DevTouchMovementMode == Enum.DevTouchMovementMode.Scriptable then
			return nil, true
		end
		var52 = tbl_upvr[DevTouchMovementMode]
	end
	return var52, true
end
local function getGamepadRightThumbstickPosition_upvr() -- Line 384, Named "getGamepadRightThumbstickPosition"
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	for _, v in pairs(UserInputService_upvr:GetGamepadState(Enum.UserInputType.Gamepad1)) do
		if v.KeyCode == Enum.KeyCode.Thumbstick2 then
			return v.Position
		end
	end
	return Vector3.new(0, 0, 0)
end
local Workspace_upvr = game:GetService("Workspace")
function module_upvr_3.calculateRawMoveVector(arg1, arg2, arg3) -- Line 394
	--[[ Upvalues[3]:
		[1]: Workspace_upvr (readonly)
		[2]: VRService_upvr (readonly)
		[3]: getGamepadRightThumbstickPosition_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera = Workspace_upvr.CurrentCamera
	if not CurrentCamera then
		return arg3
	end
	local var61
	if VRService_upvr.VREnabled and arg2.RootPart then
		local any_GetEstimatedVRTorsoFrame_result1 = arg1:GetEstimatedVRTorsoFrame()
		if (CurrentCamera.Focus.Position - var61.Position).Magnitude < 3 then
			var61 *= any_GetEstimatedVRTorsoFrame_result1
		else
			var61 = CurrentCamera.CFrame * (any_GetEstimatedVRTorsoFrame_result1.Rotation + any_GetEstimatedVRTorsoFrame_result1.Position * CurrentCamera.HeadScale)
		end
	end
	if arg2:GetState() == Enum.HumanoidStateType.Swimming then
		if VRService_upvr.VREnabled then
			local vector3 = Vector3.new(arg3.X, 0, arg3.Z)
			if vector3.Magnitude < 0.01 then
				return Vector3.new(0, 0, 0)
			end
			local _, any_ToEulerAnglesYXZ_result2_2, _ = var61:ToEulerAnglesYXZ()
			return CFrame.fromEulerAnglesYXZ(-getGamepadRightThumbstickPosition_upvr().Y * 1.3962634015954636, math.atan2(-vector3.X, -vector3.Z) + any_ToEulerAnglesYXZ_result2_2, 0).LookVector
		end
		return var61:VectorToWorldSpace(vector3)
	end
	local _, _, _, any_GetComponents_result4, any_GetComponents_result5, any_GetComponents_result6, _, _, any_GetComponents_result9, _, _, any_GetComponents_result12 = var61:GetComponents()
	local var79
	if any_GetComponents_result9 < 1 and -1 < any_GetComponents_result9 then
		var79 = any_GetComponents_result12
		local _ = any_GetComponents_result6
	else
		var79 = any_GetComponents_result4
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local squareroot = math.sqrt(var79 * var79 + (-any_GetComponents_result5 * math.sign(any_GetComponents_result9)) * (-any_GetComponents_result5 * math.sign(any_GetComponents_result9)))
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	return Vector3.new((var79 * vector3.X + -any_GetComponents_result5 * math.sign(any_GetComponents_result9) * vector3.Z) / squareroot, 0, (var79 * vector3.Z - -any_GetComponents_result5 * math.sign(any_GetComponents_result9) * vector3.X) / squareroot)
end
function module_upvr_3.OnRenderStepped(arg1, arg2) -- Line 453
	--[[ Upvalues[3]:
		[1]: module_upvr_8 (readonly)
		[2]: VRService_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var88
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	var88 = arg1.activeController.enabled
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 6. Error Block 3 start (CF ANALYSIS FAILED)
	var88 = arg1.humanoid
	-- KONSTANTERROR: [8] 6. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 22. Error Block 41 start (CF ANALYSIS FAILED)
	if 0 < var88.magnitude then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [38.4]
		nil:CleanupPath()
	else
		nil:OnRenderStepped(arg2)
		var88 = nil:GetMoveVector()
		local any_IsMoveVectorCameraRelative_result1 = nil:IsMoveVectorCameraRelative()
	end
	local var90
	if arg1.vehicleController then
		if arg1.activeControlModule ~= module_upvr_8 then
			var90 = false
		else
			var90 = true
		end
		local any_Update_result1, _ = arg1.vehicleController:Update(var88, any_IsMoveVectorCameraRelative_result1, var90)
		var88 = any_Update_result1
	end
	if any_IsMoveVectorCameraRelative_result1 then
		var88 = arg1:calculateRawMoveVector(arg1.humanoid, var88)
	end
	arg1.inputMoveVector = var88
	if VRService_upvr.VREnabled then
		var88 = arg1:updateVRMoveVector(var88)
	end
	arg1.moveFunction(Players_upvr.LocalPlayer, var88, false)
	local any_GetIsJumping_result1 = arg1.activeController:GetIsJumping()
	if not any_GetIsJumping_result1 then
		any_GetIsJumping_result1 = arg1.touchJumpController
		if any_GetIsJumping_result1 then
			any_GetIsJumping_result1 = arg1.touchJumpController:GetIsJumping()
		end
	end
	arg1.humanoid.Jump = any_GetIsJumping_result1
	-- KONSTANTERROR: [33] 22. Error Block 41 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [119] 83. Error Block 25 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [119] 83. Error Block 25 end (CF ANALYSIS FAILED)
end
function module_upvr_3.updateVRMoveVector(arg1, arg2) -- Line 502
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	local var95
	if (CurrentCamera_2.Focus.Position - CurrentCamera_2.CFrame.Position).Magnitude < 5 then
		var95 = true
	end
	if arg2.Magnitude == 0 and var95 and VRService_upvr.AvatarGestures and arg1.humanoid and not arg1.humanoid.Sit then
		local any_GetUserCFrame_result1_2 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
		local var97 = (CurrentCamera_2.CFrame * (any_GetUserCFrame_result1_2.Rotation + any_GetUserCFrame_result1_2.Position * CurrentCamera_2.HeadScale) * CFrame.new(0, -0.7 * arg1.humanoid.RootPart.Size.Y / 2, 0)).Position - arg1.humanoid.RootPart.CFrame.Position
		return Vector3.new(var97.x, 0, var97.z)
	end
	return arg2
end
function module_upvr_3.OnHumanoidSeated(arg1, arg2, arg3) -- Line 527
	--[[ Upvalues[1]:
		[1]: Value_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 7. Error Block 12 start (CF ANALYSIS FAILED)
	if not arg1.vehicleController then
		arg1.vehicleController = arg1.vehicleController.new(Value_upvr)
	end
	arg1.vehicleController:Enable(true, arg3)
	do
		return
	end
	-- KONSTANTERROR: [7] 7. Error Block 12 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 20. Error Block 10 start (CF ANALYSIS FAILED)
	if arg1.vehicleController then
		arg1.vehicleController:Enable(false, arg3)
	end
	-- KONSTANTERROR: [26] 20. Error Block 10 end (CF ANALYSIS FAILED)
end
function module_upvr_3.OnCharacterAdded(arg1, arg2) -- Line 542
	arg1.humanoid = arg2:FindFirstChildOfClass("Humanoid")
	while not arg1.humanoid do
		arg2.ChildAdded:wait()
		arg1.humanoid = arg2:FindFirstChildOfClass("Humanoid")
	end
	if arg1.humanoidSeatedConn then
		arg1.humanoidSeatedConn:Disconnect()
		arg1.humanoidSeatedConn = nil
	end
	arg1.humanoidSeatedConn = arg1.humanoid.Seated:Connect(function(arg1_2, arg2_2) -- Line 553
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnHumanoidSeated(arg1_2, arg2_2)
	end)
	arg1:UpdateMovementMode()
end
function module_upvr_3.OnCharacterRemoving(arg1, arg2) -- Line 560
	arg1.humanoid = nil
	arg1:UpdateMovementMode()
end
function module_upvr_3.UpdateTouchGuiVisibility(arg1) -- Line 566
	--[[ Upvalues[2]:
		[1]: GuiService_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
	]]
	local var100
	if var100 then
		var100 = GuiService_upvr.TouchControlsEnabled
		if var100 then
			if UserInputService_upvr.PreferredInput ~= Enum.PreferredInput.Touch then
				var100 = false
			else
				var100 = true
			end
		end
	end
	if var100 and not arg1.touchGui then
		arg1:CreateTouchGuiContainer()
	end
	if arg1.touchGui then
		arg1.touchGui.Enabled = not not var100
	end
end
function module_upvr_3.SwitchToController(arg1, arg2) -- Line 585
	--[[ Upvalues[1]:
		[1]: Value_upvr (readonly)
	]]
	if not arg2 then
		if arg1.activeController then
			arg1.activeController:Enable(false)
		end
		arg1.activeController = nil
		arg1.activeControlModule = nil
	else
		if not arg1.controllers[arg2] then
			arg1.controllers[arg2] = arg2.new(Value_upvr)
		end
		if arg1.activeController ~= arg1.controllers[arg2] then
			if arg1.activeController then
				arg1.activeController:Enable(false)
			end
			arg1.activeController = arg1.controllers[arg2]
			arg1.activeControlModule = arg2
			arg1:UpdateActiveControlModuleEnabled()
		end
	end
end
function module_upvr_3.UpdateMovementMode(arg1) -- Line 624
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	arg1:UpdateTouchGuiVisibility()
	local PreferredInput = UserInputService_upvr.PreferredInput
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 12. Error Block 4 start (CF ANALYSIS FAILED)
	arg1:SwitchToController(PreferredInput)
	do
		return
	end
	-- KONSTANTERROR: [17] 12. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 16. Error Block 5 start (CF ANALYSIS FAILED)
	arg1:SwitchToController(arg1:SelectComputerMovementModule())
	-- KONSTANTERROR: [22] 16. Error Block 5 end (CF ANALYSIS FAILED)
end
local var102_upvw = pcall_result1 and pcall_result2
function module_upvr_3.CreateTouchGuiContainer(arg1) -- Line 640
	--[[ Upvalues[1]:
		[1]: var102_upvw (read and write)
	]]
	if not arg1.playerGui then
	else
		if arg1.touchGui then
			arg1.touchGui:Destroy()
		end
		arg1.touchGui = Instance.new("ScreenGui")
		arg1.touchGui.Name = "TouchGui"
		arg1.touchGui.ResetOnSpawn = false
		arg1.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		if var102_upvw then
			arg1.touchGui.ClipToDeviceSafeArea = false
		end
		arg1.touchControlFrame = Instance.new("Frame")
		arg1.touchControlFrame.Name = "TouchControlFrame"
		arg1.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
		arg1.touchControlFrame.BackgroundTransparency = 1
		arg1.touchControlFrame.Parent = arg1.touchGui
		arg1.touchGui.Parent = arg1.playerGui
	end
end
function module_upvr_3.GetClickToMoveController(arg1) -- Line 666
	--[[ Upvalues[2]:
		[1]: module_upvr_5 (readonly)
		[2]: Value_upvr (readonly)
	]]
	if not arg1.controllers[module_upvr_5] then
		arg1.controllers[module_upvr_5] = module_upvr_5.new(Value_upvr)
	end
	return arg1.controllers[module_upvr_5]
end
return module_upvr_3.new()
--------------------
📂 [SERVICE: VehicleCamera]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraCore
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:02
-- Luau version 6, Types version 3
-- Time taken: 0.010653 seconds

local CameraUtils = require(script.Parent.Parent.CameraUtils)
local VehicleCameraConfig_upvr = require(script.Parent.VehicleCameraConfig)
local sanitizeAngle_upvr = CameraUtils.sanitizeAngle
local function _(arg1) -- Line 10, Named "getYaw"
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	local _, any_toEulerAnglesYXZ_result2 = arg1:toEulerAnglesYXZ()
	return sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2)
end
local function _(arg1) -- Line 16, Named "getPitch"
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	return sanitizeAngle_upvr(arg1:toEulerAnglesYXZ())
end
local function _(arg1, arg2, arg3, arg4, arg5) -- Line 22, Named "stepSpringAxis"
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	local sanitizeAngle_upvr_result1 = sanitizeAngle_upvr(arg4 - arg3)
	local exponentiated = math.exp(-arg2 * arg1)
	return sanitizeAngle_upvr((sanitizeAngle_upvr_result1 * (1 + arg2 * arg1) + arg5 * arg1) * exponentiated + arg3), (arg5 * (1 - arg2 * arg1) - (sanitizeAngle_upvr_result1) * (arg2 * arg2 * arg1)) * exponentiated
end
local tbl_upvr_2 = {}
tbl_upvr_2.__index = tbl_upvr_2
local function new(arg1, arg2, arg3) -- Line 36
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local module = {}
	module.fRising = arg1
	module.fFalling = arg2
	module.g = arg3
	module.p = arg3
	module.v = arg3 * 0
	return setmetatable(module, tbl_upvr_2)
end
tbl_upvr_2.new = new
local function step(arg1, arg2) -- Line 46
	local g = arg1.g
	local v = arg1.v
	local var12
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var12 = arg1.fRising
		return var12
	end
	if 0 >= v or not INLINED() then
		var12 = arg1.fFalling
	end
	local var13 = (-math.pi*2) * var12
	local var14 = arg1.p - g
	var12 = math.exp(-var13 * arg2)
	local var15 = (var14 * (1 + var13 * arg2) + v * arg2) * var12 + g
	arg1.p = var15
	arg1.v = (v * (1 - var13 * arg2) - (var14) * (var13 * var13 * arg2)) * var12
	return var15
end
tbl_upvr_2.step = step
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local function new(arg1) -- Line 72
	--[[ Upvalues[4]:
		[1]: sanitizeAngle_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: VehicleCameraConfig_upvr (readonly)
		[4]: tbl_upvr (readonly)
	]]
	local var17
	if typeof(arg1) ~= "CFrame" then
		var17 = false
	else
		var17 = true
	end
	assert(var17)
	var17 = {}
	local any_toEulerAnglesYXZ_result1_2, any_toEulerAnglesYXZ_result2_2 = arg1:toEulerAnglesYXZ()
	var17.yawG = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2_2)
	local _, any_toEulerAnglesYXZ_result2_4 = arg1:toEulerAnglesYXZ()
	var17.yawP = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2_4)
	var17.yawV = 0
	var17.pitchG = sanitizeAngle_upvr(arg1:toEulerAnglesYXZ())
	var17.pitchP = sanitizeAngle_upvr(arg1:toEulerAnglesYXZ())
	var17.pitchV = 0
	var17.fSpringYaw = tbl_upvr_2.new(VehicleCameraConfig_upvr.yawReponseDampingRising, VehicleCameraConfig_upvr.yawResponseDampingFalling, 0)
	var17.fSpringPitch = tbl_upvr_2.new(VehicleCameraConfig_upvr.pitchReponseDampingRising, VehicleCameraConfig_upvr.pitchResponseDampingFalling, 0)
	return setmetatable(var17, tbl_upvr)
end
tbl_upvr.new = new
function tbl_upvr.setGoal(arg1, arg2) -- Line 99
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	local var22
	if typeof(arg2) ~= "CFrame" then
		var22 = false
	else
		var22 = true
	end
	assert(var22)
	var22 = arg2:toEulerAnglesYXZ()
	local any_toEulerAnglesYXZ_result1, any_toEulerAnglesYXZ_result2_3 = arg2:toEulerAnglesYXZ()
	arg1.yawG = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2_3)
	any_toEulerAnglesYXZ_result1 = arg2:toEulerAnglesYXZ()
	arg1.pitchG = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result1)
end
function tbl_upvr.getCFrame(arg1) -- Line 106
	return CFrame.fromEulerAnglesYXZ(arg1.pitchP, arg1.yawP, 0)
end
local mapClamp_upvr = CameraUtils.mapClamp
local map_upvr = CameraUtils.map
local function step(arg1, arg2, arg3, arg4, arg5) -- Line 110
	--[[ Upvalues[4]:
		[1]: mapClamp_upvr (readonly)
		[2]: map_upvr (readonly)
		[3]: VehicleCameraConfig_upvr (readonly)
		[4]: sanitizeAngle_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local var27
	if typeof(arg2) ~= "number" then
		var27 = false
	else
		var27 = true
	end
	assert(var27)
	if typeof(arg4) ~= "number" then
		var27 = false
		-- KONSTANTWARNING: GOTO [22] #18
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 17. Error Block 29 start (CF ANALYSIS FAILED)
	var27 = true
	assert(var27)
	if typeof(arg3) ~= "number" then
		var27 = false
		-- KONSTANTWARNING: GOTO [35] #28
	end
	-- KONSTANTERROR: [21] 17. Error Block 29 end (CF ANALYSIS FAILED)
end
tbl_upvr.step = step
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new(arg1) -- Line 167
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: module_2_upvr (readonly)
	]]
	return setmetatable({
		vrs = tbl_upvr.new(arg1);
	}, module_2_upvr)
end
function module_2_upvr.step(arg1, arg2, arg3, arg4, arg5) -- Line 173
	return arg1.vrs:step(arg2, arg3, arg4, arg5)
end
function module_2_upvr.setTransform(arg1, arg2) -- Line 177
	arg1.vrs:setGoal(arg2)
end
return module_2_upvr
--------------------

-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraConfig
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:20:02
-- Luau version 6, Types version 3
-- Time taken: 0.000902 seconds

return {
	pitchStiffness = 0.5;
	yawStiffness = 2.5;
	autocorrectDelay = 1;
	autocorrectMinCarSpeed = 16;
	autocorrectMaxCarSpeed = 32;
	autocorrectResponse = 0.5;
	cutoffMinAngularVelYaw = 60;
	cutoffMaxAngularVelYaw = 180;
	cutoffMinAngularVelPitch = 15;
	cutoffMaxAngularVelPitch = 60;
	pitchBaseAngle = 18;
	pitchDeadzoneAngle = 12;
	firstPersonResponseMul = 10;
	yawReponseDampingRising = 1;
	yawResponseDampingFalling = 3;
	pitchReponseDampingRising = 1;
	pitchResponseDampingFalling = 3;
	verticalCenterOffset = 0.33;
}
--------------------
📂 [SERVICE: RbxCharacterSounds]
========================================

-- Path: StarterPlayer.StarterPlayerScripts.RbxCharacterSounds.AtomicBinding
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-01-29 07:19:58
-- Luau version 6, Types version 3
-- Time taken: 0.014240 seconds

local function parsePath_upvr(arg1) -- Line 4, Named "parsePath"
	local string_split_result1 = string.split(arg1, '/')
	for i = #string_split_result1, 1, -1 do
		if string_split_result1[i] == "" then
			table.remove(string_split_result1, i)
		end
	end
	return string_split_result1
end
local function _(arg1, arg2) -- Line 14, Named "isManifestResolved"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 15 start (CF ANALYSIS FAILED)
	local var7 = 0
	for _ in pairs(arg1) do
		var7 += 1
	end
	if var7 > arg2 then
		-- KONSTANTWARNING: GOTO [13] #11
	end
	-- KONSTANTERROR: [0] 1. Error Block 15 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 10. Error Block 18 start (CF ANALYSIS FAILED)
	assert(true, var7)
	if var7 ~= arg2 then
	else
	end
	do
		return true
	end
	-- KONSTANTERROR: [12] 10. Error Block 18 end (CF ANALYSIS FAILED)
end
local function unbindNodeDescend_upvr(arg1, arg2) -- Line 24, Named "unbindNodeDescend"
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	if arg1.instance == nil then
	else
		arg1.instance = nil
		local connections = arg1.connections
		if connections then
			for _, v_7 in ipairs(connections) do
				v_7:Disconnect()
			end
			table.clear(connections)
		end
		if arg2 and arg1.alias then
			arg2[arg1.alias] = nil
		end
		local children = arg1.children
		if children then
			for _, v_8 in pairs(children) do
				unbindNodeDescend_upvr(v_8, arg2)
			end
		end
	end
end
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new(arg1, arg2) -- Line 54
	--[[ Upvalues[2]:
		[1]: parsePath_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local tbl = {}
	local var29 = 1
	for i_3, v in pairs(arg1) do
		tbl[i_3] = parsePath_upvr(v)
		var29 += 1
	end
	local module = {}
	module._boundFn = arg2
	module._parsedManifest = tbl
	module._manifestSizeTarget = var29
	module._dtorMap = {}
	module._connections = {}
	module._rootInstToRootNode = {}
	module._rootInstToManifest = {}
	return setmetatable(module, module_upvr)
end
function module_upvr._startBoundFn(arg1, arg2, arg3) -- Line 80
	local _dtorMap = arg1._dtorMap
	local var35 = _dtorMap[arg2]
	if var35 then
		var35()
		_dtorMap[arg2] = nil
	end
	local any__boundFn_result1 = arg1._boundFn(arg3)
	if any__boundFn_result1 then
		_dtorMap[arg2] = any__boundFn_result1
	end
end
function module_upvr._stopBoundFn(arg1, arg2) -- Line 96
	local _dtorMap_2 = arg1._dtorMap
	local var38 = _dtorMap_2[arg2]
	if var38 then
		var38()
		_dtorMap_2[arg2] = nil
	end
end
function module_upvr.bindRoot(arg1, arg2) -- Line 106
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("AtomicBinding:BindRoot")
	local _parsedManifest = arg1._parsedManifest
	local _rootInstToManifest_2 = arg1._rootInstToManifest
	local var57
	if _rootInstToManifest_2[arg2] ~= nil then
		var57 = false
	else
		var57 = true
	end
	assert(var57)
	local tbl_upvr = {}
	_rootInstToManifest_2[arg2] = tbl_upvr
	var57 = debug.profilebegin
	var57("BuildTree")
	var57 = {}
	var57.alias = "root"
	var57.instance = arg2
	if next(_parsedManifest) then
		var57.children = {}
		var57.connections = {}
	end
	arg1._rootInstToRootNode[arg2] = var57
	for i_4, v_2 in pairs(_parsedManifest) do
		local var62 = var57
		for i_5, v_3 in ipairs(v_2) do
			local var66
			if i_5 ~= #v_2 then
				var66 = false
			else
				var66 = true
			end
			if not var62.children[v_3] then
				local tbl_2 = {}
				local var68
			end
			if var66 then
				var68 = tbl_2.alias
				if var68 ~= nil then
					var68 = error
					var68("Multiple aliases assigned to one instance")
				end
				tbl_2.alias = i_4
			else
				var68 = tbl_2.children
				if not var68 then
					var68 = {}
				end
				tbl_2.children = var68
				var68 = tbl_2.connections
				if not var68 then
					var68 = {}
				end
				tbl_2.connections = var68
			end
			var62.children[v_3] = tbl_2
		end
	end
	debug.profileend()
	local _manifestSizeTarget_upvr = arg1._manifestSizeTarget
	local function processNode_upvr(arg1_2) -- Line 160, Named "processNode"
		--[[ Upvalues[6]:
			[1]: tbl_upvr (readonly)
			[2]: processNode_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: arg2 (readonly)
			[5]: unbindNodeDescend_upvr (copied, readonly)
			[6]: _manifestSizeTarget_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local alias = arg1_2.alias
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 9. Error Block 2 start (CF ANALYSIS FAILED)
		tbl_upvr[alias] = assert(arg1_2.instance)
		-- KONSTANTERROR: [12] 9. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 11. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 11. Error Block 3 end (CF ANALYSIS FAILED)
	end
	debug.profilebegin("ResolveTree")
	processNode_upvr(var57)
	debug.profileend()
	debug.profileend()
end
function module_upvr.unbindRoot(arg1, arg2) -- Line 236
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	local _rootInstToRootNode = arg1._rootInstToRootNode
	local _rootInstToManifest = arg1._rootInstToManifest
	arg1:_stopBoundFn(arg2)
	local var73 = _rootInstToRootNode[arg2]
	if var73 then
		unbindNodeDescend_upvr(var73, assert(_rootInstToManifest[arg2]))
		_rootInstToRootNode[arg2] = nil
	end
	_rootInstToManifest[arg2] = nil
end
function module_upvr.destroy(arg1) -- Line 252
	--[[ Upvalues[1]:
		[1]: unbindNodeDescend_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	debug.profilebegin("AtomicBinding:destroy")
	for _, v_4 in pairs(arg1._dtorMap) do
		v_4:destroy()
	end
	table.clear(arg1._dtorMap)
	for _, v_5 in ipairs(arg1._connections) do
		v_5:Disconnect()
	end
	table.clear(arg1._connections)
	for i_8, v_6 in pairs(arg1._rootInstToRootNode) do
		unbindNodeDescend_upvr(v_6, assert(arg1._rootInstToManifest[i_8]))
		local _
	end
	table.clear(arg1._rootInstToManifest)
	table.clear(arg1._rootInstToRootNode)
	debug.profileend()
end
return module_upvr
--------------------
