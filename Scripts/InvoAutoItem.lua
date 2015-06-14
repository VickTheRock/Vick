require("libs.Utils")
require("libs.TargetFind")
require("libs.ScriptConfig")
require("libs.Skillshot")

local config = ScriptConfig.new()
config:SetParameter("ComboKey", "Z", config.TYPE_HOTKEY)
config:SetParameter("ComboKey1", "C", config.TYPE_HOTKEY)
config:SetParameter("ComboKey2", "B", config.TYPE_HOTKEY)
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

	if IsKeyDown(config.ComboKey) and not client.chat then
		target = targetFind:GetClosestToMouse(200)
		if tick > sleep[1] then
			if target and target.alive and target.visible and GetDistance2D(target,me) <= 2000 and not target:DoesHaveModifier("modifier_item_blade_mail_reflect") and not target:DoesHaveModifier("modifier_item_lotus_orb_active") and not target:IsMagicImmune() and target:CanDie() then
				local distance = GetDistance2D(target,me)
				local attackRange = me.attackRange	
				local dagon = me:FindDagon()
				local halberd = me:FindItem("item_heavens_halberd")
				local abyssal = me:FindItem("item_abyssal_blade")
				local shiva = me:FindItem("item_shivas_guard")
				local sheep = me:FindItem("item_sheepstick")
				local ethereal = me:FindItem("item_ethereal_blade")
				local veil = me:FindItem("item_veil_of_discord")
				local atos = me:FindItem("item_rod_of_atos")
				local mom = me:FindItem("item_mask_of_madness")
				local satanic = me:FindItem("item_satanic")
				local sheep = me:FindItem("item_sheepstick")
				local orchid = me:FindItem("item_orchid")
				local soulring = me:FindItem("item_soul_ring")
				local slow = target:DoesHaveModifier("modifier_item_ethereal_blade_slow")
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_item_ethereal_blade_slow") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
				end
				if halberd and halberd:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{1000+math.ceil(halberd:FindCastPoint()*1000),halberd,target})
				end
				if shiva and shiva:CanBeCasted() and distance <= 600  and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{100,shiva})
				end
				if abyssal and abyssal:CanBeCasted() and me:CanCast()  and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(abyssal:FindCastPoint()*1000),abyssal,target})
				end
				if mom and mom:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(mom:FindCastPoint()*1000),mom})        
				end
				if satanic and satanic:CanBeCasted() and me.health/me.maxHealth <= 0.4 and distance <= attackRange then
					table.insert(castQueue,{100,satanic})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
				table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
				end
				if orchid and orchid:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(orchid:FindCastPoint()*1000),orchid,target})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
				end
				if ethereal and ethereal:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(ethereal:FindCastPoint()*1000),ethereal,target})
				end
				if atos and atos:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(atos:FindCastPoint()*1000),atos,target})
				end
				if veil and veil:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(veil:FindCastPoint()*1000),veil,target.position})        
				end
				if me.mana < me.maxMana*0.5 and soulring and soulring:CanBeCasted() then
					table.insert(castQueue,{100,soulring})
				end
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
				end
				if not slow then
					me:Attack(target)
				elseif slow then
					me:Follow(me)
				end
				sleep[1] = tick + 200
			end
		end
	end
	if IsKeyDown(config.ComboKey1) and not client.chat then
		target = targetFind:GetClosestToMouse(200)
		if tick > sleep[1] then
			if target and target.alive and target.visible and GetDistance2D(target,me) <= 2000 and not target:DoesHaveModifier("modifier_item_blade_mail_reflect") and not target:DoesHaveModifier("modifier_item_lotus_orb_active") and not target:IsMagicImmune() and target:CanDie() then
				local distance = GetDistance2D(target,me)
				local dagon = me:FindDagon()
				local halberd = me:FindItem("item_heavens_halberd")
				local abyssal = me:FindItem("item_abyssal_blade")
				local shiva = me:FindItem("item_shivas_guard")
				local sheep = me:FindItem("item_sheepstick")
				local ethereal = me:FindItem("item_ethereal_blade")
				local veil = me:FindItem("item_veil_of_discord")
				local atos = me:FindItem("item_rod_of_atos")
				local mom = me:FindItem("item_mask_of_madness")
				local satanic = me:FindItem("item_satanic")
				local sheep = me:FindItem("item_sheepstick")
				local orchid = me:FindItem("item_orchid")
				local soulring = me:FindItem("item_soul_ring")
				local slow = target:DoesHaveModifier("modifier_item_ethereal_blade_slow")
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_item_ethereal_blade_slow") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
				end
				if halberd and halberd:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{1000+math.ceil(halberd:FindCastPoint()*1000),halberd,target})
				end
				if shiva and shiva:CanBeCasted() and distance <= 600  and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{100,shiva})
				end
				if abyssal and abyssal:CanBeCasted() and me:CanCast()  and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(abyssal:FindCastPoint()*1000),abyssal,target})
				end
				if mom and mom:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(mom:FindCastPoint()*1000),mom})        
				end
				if satanic and satanic:CanBeCasted() and me.health/me.maxHealth <= 0.4 and distance <= attackRange then
					table.insert(castQueue,{100,satanic})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
				table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
				end
				if orchid and orchid:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(orchid:FindCastPoint()*1000),orchid,target})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
				end
				if ethereal and ethereal:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(ethereal:FindCastPoint()*1000),ethereal,target})
				end
				if atos and atos:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(atos:FindCastPoint()*1000),atos,target})
				end
				if veil and veil:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(veil:FindCastPoint()*1000),veil,target.position})        
				end
				if me.mana < me.maxMana*0.5 and soulring and soulring:CanBeCasted() then
					table.insert(castQueue,{100,soulring})
				end
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
				end
				if not slow then
					me:Attack(target)
				elseif slow then
					me:Follow(me)
				end
				sleep[1] = tick + 200
			end
		end
	end
	if IsKeyDown(config.ComboKey2) and not client.chat then
		target = targetFind:GetClosestToMouse(200)
		if tick > sleep[1] then
			if target and target.alive and target.visible and GetDistance2D(target,me) <= 2000 and not target:DoesHaveModifier("modifier_item_blade_mail_reflect") and not target:DoesHaveModifier("modifier_item_lotus_orb_active") and not target:IsMagicImmune() and target:CanDie() then
				local distance = GetDistance2D(target,me)
				local dagon = me:FindDagon()
				local halberd = me:FindItem("item_heavens_halberd")
				local abyssal = me:FindItem("item_abyssal_blade")
				local shiva = me:FindItem("item_shivas_guard")
				local sheep = me:FindItem("item_sheepstick")
				local ethereal = me:FindItem("item_ethereal_blade")
				local veil = me:FindItem("item_veil_of_discord")
				local atos = me:FindItem("item_rod_of_atos")
				local mom = me:FindItem("item_mask_of_madness")
				local satanic = me:FindItem("item_satanic")
				local sheep = me:FindItem("item_sheepstick")
				local orchid = me:FindItem("item_orchid")
				local soulring = me:FindItem("item_soul_ring")
				local slow = target:DoesHaveModifier("modifier_item_ethereal_blade_slow")
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_item_ethereal_blade_slow") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
				end
				if halberd and halberd:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{1000+math.ceil(halberd:FindCastPoint()*1000),halberd,target})
				end
				if shiva and shiva:CanBeCasted() and distance <= 600  and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{100,shiva})
				end
				if abyssal and abyssal:CanBeCasted() and me:CanCast()  and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(abyssal:FindCastPoint()*1000),abyssal,target})
				end
				if mom and mom:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(mom:FindCastPoint()*1000),mom})        
				end
				if satanic and satanic:CanBeCasted() and me.health/me.maxHealth <= 0.4 and distance <= attackRange then
					table.insert(castQueue,{100,satanic})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
				table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
				end
				if orchid and orchid:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(orchid:FindCastPoint()*1000),orchid,target})
				end
				if sheep and sheep:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(sheep:FindCastPoint()*800),sheep,target})
				end
				if ethereal and ethereal:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{math.ceil(ethereal:FindCastPoint()*1000),ethereal,target})
				end
				if atos and atos:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{math.ceil(atos:FindCastPoint()*1000),atos,target})
				end
				if veil and veil:CanBeCasted() and me:CanCast() then
					table.insert(castQueue,{1000+math.ceil(veil:FindCastPoint()*1000),veil,target.position})        
				end
				if me.mana < me.maxMana*0.5 and soulring and soulring:CanBeCasted() then
					table.insert(castQueue,{100,soulring})
				end
				if dagon and dagon:CanBeCasted() and me:CanCast() and target:DoesHaveModifier("modifier_invoker_tornado") then
					table.insert(castQueue,{1000+math.ceil(dagon:FindCastPoint()*1000),dagon,target})
				end
				if not slow then
					me:Attack(target)
				elseif slow then
					me:Follow(me)
				end
				sleep[1] = tick + 200
			end
		end
	end
end

function Load()
	if PlayingGame() then
		local me = entityList:GetMyHero()
		if me and me.name ~= "npc_dota_hero_invoker"  then
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
