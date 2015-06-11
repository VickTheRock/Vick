require("libs.Utils")
require("libs.TargetFind")
require("libs.ScriptConfig")
require("libs.Skillshot")

local config = ScriptConfig.new()
config:SetParameter("HotKey", "D", config.TYPE_HOTKEY)
config:Load()

local play = false local target = nil local castQueue = {} local sleep = {0,0,0}

function Main(tick)
    if not PlayingGame() then return end
	local me = entityList:GetMyHero()
	local ID = me.classId if ID ~= myhero then return end

	for i=1,#castQueue,1 do
		local v = castQueue[1]
		table.remove(castQueue,1)
		local ability = v[2]
		if type(ability) == "string" then
			ability = me:FindItem(ability)
		end
		if ability and ((me:SafeCastAbility(ability,v[3],false)) or (v[4] and ability:CanBeCasted())) then
			if v[4] and ability:CanBeCasted() then
				me:CastAbility(ability,v[3],false)
			end
			sleep[2] = tick + v[1] + client.latency
			return
		end
	end

	if IsKeyDown(config.HotKey) and not client.chat then
		target = targetFind:GetClosestToMouse(100)
		if tick > sleep[1] then
			if target and target.alive and target.visible and GetDistance2D(target,me) <= 2000 and not target:DoesHaveModifier("modifier_item_blade_mail_reflect") and not target:DoesHaveModifier("modifier_item_lotus_orb_active") and not target:IsMagicImmune() and target:CanDie() then
				local Q = me:GetAbility(1)
				local W = me:GetAbility(2)
				local E = me:GetAbility(3)
				local R = me:GetAbility(4)
				local distance = GetDistance2D(target,me)
				local dagon = me:FindDagon()
				local ethereal = me:FindItem("item_ethereal_blade")
				local veil = me:FindItem("item_veil_of_discord")
				local atos = me:FindItem("item_rod_of_atos")
				local shiva = me:FindItem("item_shivas_guard")
				local orchid = me:FindItem("item_orchid")
				local sheep = me:FindItem("item_sheepstick")
				local soulring = me:FindItem("item_soul_ring")
				local slow = target:DoesHaveModifier("modifier_item_ethereal_blade_slow")
				if E and E:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(E:FindCastPoint()*1000),E,target})
				end
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_item_ethereal_blade_slow") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
					Sleep(me:GetTurnTime(target)*1000, "casting")
				end
				if shiva and shiva:CanBeCasted() and distance <= 600 then
					table.insert(castQueue,{100,shiva})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
					Sleep(me:GetTurnTime(target)*800, "casting")
				end
				if orchid and orchid:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(orchid:FindCastPoint()*1000),orchid,target})
					Sleep(me:GetTurnTime(target)*1000, "casting")
				end
				if Q and Q:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(Q:FindCastPoint()*1000),Q,target})
				end
				if ethereal and ethereal:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(ethereal:FindCastPoint()*1000),ethereal,target})
				end
				if atos and atos:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(atos:FindCastPoint()*1000),atos,target})
					Sleep(me:GetTurnTime(target)*1000, "casting")
				end
				if distance <= 1590 and W and W:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(W:FindCastPoint()*1000),W})        
				end
				if veil and veil:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(veil:FindCastPoint()*1000),veil,target.position})        
				end
				if me.mana < me.maxMana*0.5 and soulring and soulring:CanBeCasted() then
					table.insert(castQueue,{100,soulring})
				end
				if R and R:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_skywrath_mage_concussive_shot_slow") then
					table.insert(castQueue,{1000+math.ceil(R:FindCastPoint()*1000),R,target.position})
					Sleep(me:GetTurnTime(target)*1000, "casting")
				end
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_skywrath_mage_ancient_seal") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
					Sleep(me:GetTurnTime(target)*1000, "casting")
				end
				if not slow then
					me:Attack(target)
				elseif slow then
					me:Follow(me)
				end
				sleep[1] = tick + 100
			end
		end
	end
end

function Load()
	if PlayingGame() then
		local me = entityList:GetMyHero()
		if not me or me.classId ~= CDOTA_Unit_Hero_Skywrath_Mage then 
			script:Disable()
		else
			play = true
			target = nil
			myhero = me.classId
			script:RegisterEvent(EVENT_FRAME, Main)
			script:UnregisterEvent(Load)
		end
	end
end

function Close()
	target = nil 
	myhero = nil
	collectgarbage("collect")
	if play then
		script:UnregisterEvent(Main)
		script:RegisterEvent(EVENT_TICK,Load)
		play = false
	end
end

script:RegisterEvent(EVENT_CLOSE, Close) 
script:RegisterEvent(EVENT_TICK, Load)
