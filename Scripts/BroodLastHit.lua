--<<Spider LastHit: Beta version. V.0.3.1 >>
require("libs.Utils")
require("libs.ScriptConfig")
 
 
config = ScriptConfig.new()
config:SetParameter("Spider", "D", config.TYPE_HOTKEY)
config:SetParameter("DenyWithSpider", true)
config:SetParameter("LastHitWithSpider", true)
config:SetParameter("UseQlasthit", true)
config:Load()
 
local play, target, castQueue, castsleep, sleep = false, nil, {}, 0, 0

 
local spidersLastHit = config.LastHitWithSpider
local spidersDeny = config.DenyWithSpider
local spidersQ = config.UseQlasthit
local damage = 78
local damageSp = 38

 
 
local KeyUp = config.Spider
local Spider = false
local play = false
 
local x,y = 220,15
local monitor = client.screenSize.x/1600
local font = drawMgr:CreateFont("font","Verdana",12,300)
local statusText = drawMgr:CreateText(x*monitor,y*monitor,0x66FF33FF,"(" .. string.char(KeyUp) .. ")It is time to LastHit.",font) statusText.visible = false
 
local me = entityList:GetMyHero()
 
function Key(msg, code)

    if client.chat or client.console or client.loading then return end 


    if IsKeyDown(KeyUp) then 
        Spider = not Spider

        if Spider  then
            statusText.text = "(" ..string.char(KeyUp) .. ") LastHit Spider Active"
            Spider = true
        else
            statusText.text = "(" ..string.char(KeyUp) .. ") LastHit Spider UnActive"
            Spider = false
        end
		
    end
end
 
 

function Main(tick)
if Spider and tick > sleep then
    if client.pause or client.shopOpen or not SleepCheck() then return end
	
		local me = entityList:GetMyHero()
				local creeps = entityList:GetEntities(function (v) return ((v.courier and v.team == me:GetEnemyTeam()) or (v.creep and v.spawned) or (v.classId == CDOTA_BaseNPC_Creep_Neutral and v.spawned) or v.classId == CDOTA_BaseNPC_Tower or v.classId == CDOTA_BaseNPC_Venomancer_PlagueWard or v.classId == CDOTA_BaseNPC_Warlock_Golem or (v.classId == CDOTA_BaseNPC_Creep_Lane and v.spawned) or (v.classId == CDOTA_BaseNPC_Creep_Siege and v.spawned) or v.classId == CDOTA_Unit_VisageFamiliar and v.team == me:GetEnemyTeam()) or v.classId == CDOTA_Unit_Undying_Zombie or v.classId == CDOTA_Unit_SpiritBear or (v.classId == CDOTA_Unit_Hero_Beastmaster_Boar or v.classId == CDOTA_BaseNPC_Invoker_Forged_Spirit or v.classId == CDOTA_BaseNPC_Creep) and v.alive and v.health > 0  end)
		local creep = entityList:GetEntities(function (v) return ( v.classId == CDOTA_BaseNPC_Warlock_Golem or v.classId == CDOTA_BaseNPC_Creep_Lane   or v.classId == CDOTA_Unit_SpiritBear or v.classId == CDOTA_Unit_Hero_Beastmaster_Boar or v.classId == CDOTA_BaseNPC_Invoker_Forged_Spirit or v.classId == CDOTA_BaseNPC_Creep) and v.team == me:GetEnemyTeam() or v.classId == CDOTA_BaseNPC_Creep_Neutral  and v.alive and v.health > 20  end)
		local Spiderlings = entityList:GetEntities({classId=CDOTA_Unit_Broodmother_Spiderling, controllable=true, alive=true})
		
		local Q = me:GetAbility(1)
		local Soul = me:FindItem("item_soul_ring")
		local Qlvl = {74,149,224,299}
		local SoulLvl = {120,190,270,360}
		local enemy = entityList:GetEntities(function (v) return v.type==LuaEntity.TYPE_HERO and v.alive and not v.illusion and not v.visible and v.team==5-me.team end)
		if spidersQ--[[ and GetDistance2D(me,enemy[1]) > 600]] and me.alive then
			for i,v in ipairs(creep) do
		
                local offset = v.healthbarOffset
                if offset == -1 then return end
                if v.visible and v.alive  then
					if Q and Q:CanBeCasted() and Q.level > 0 and v.health < Qlvl[Q.level]  and me:GetDistance2D(v) <= 600 then
					local me = entityList:GetMyHero()
						for l,tr in ipairs(creep) do
							if  me:GetDistance2D(v) <= 600 and SleepCheck("tr.handle") then
								me:CastAbility(me:GetAbility(1),v)
								Sleep(client.latency+300,"tr.handle")
							end
						end
					end	
					if Q and Soul and Q.level > 0 and Q:CanBeCasted() and Soul:CanBeCasted() and v.health < SoulLvl[Q.level] and me:GetDistance2D(v) <= 600 then
					local me = entityList:GetMyHero()
						for l,tr in ipairs(creep) do
							if  me:GetDistance2D(v) <= 600 and SleepCheck("tr.handle") then
								me:SafeCastItem(Soul.name)
								Sleep(client.latency+300,"tr.handle")
							end
						end
					end	
				end
			end
		end
        for i,v in ipairs(creeps) do
        local offset = v.healthbarOffset
        if offset == -1 then return end
           if v.visible and v.alive  then
               if spidersLastHit  and v.health < (damage+10*(1-v.dmgResist))+68 then
                     for l,tr in ipairs(Spiderlings) do
                       if  v:GetDistance2D(tr) <= 700 then
							tr:Attack(v)
                       end
                    end
               end
           end
        end
        for i,v in ipairs(Spiderlings) do
        local offset = v.healthbarOffset
        if offset == -1 then return end
            if v.visible and v.alive  then
                if spidersDeny  and v.health < (damageSp+10*(1-v.dmgResist))+38 then
                    for l,tr in ipairs(Spiderlings) do
                        if v:GetDistance2D(tr) <= 700 then
							tr:Attack(v)
						end
					end
				end
			end
        end
	sleep = tick + 240
	end
end


function Load()
    if PlayingGame() then
                local me = entityList:GetMyHero()
                if not me or me.classId ~= CDOTA_Unit_Hero_Broodmother or not client.connected or client.loading or client.console then
				script:Disable()
        else
			statusText.visible = true
			play, target, myhero = true, nil, me.classId
			script:RegisterEvent(EVENT_TICK, Main)
			script:RegisterEvent(EVENT_KEY, Key)
			script:UnregisterEvent(Load)
        end
    end
end
 
 
 
function Close()
target, myhero = nil, nil
        collectgarbage("collect")
        if play then
script:UnregisterEvent(Main)
script:UnregisterEvent(Key)
statusText.visible = false
script:RegisterEvent(EVENT_TICK,Load)
play = false
        end
end
 
script:RegisterEvent(EVENT_CLOSE, Close)
script:RegisterEvent(EVENT_TICK, Load)
