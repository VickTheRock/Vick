--<<beta version. V:0.1.>>
require("libs.Utils")
require("libs.ScriptConfig")


config = ScriptConfig.new()
config:SetParameter("Treants", "D", config.TYPE_HOTKEY)
config:Load()

local play, target, castQueue, castsleep, sleep = false, nil, {}, 0, 0
local me = entityList:GetMyHero()


top1 = {Vector(-6400, -793, 256)}
top2 = {Vector(-6356, 1141, 256)}
top3 = {Vector(-6320, 3762, 256)}
top4 = {Vector(-5300, 5714, 256)}
top511 = {Vector(-3104, 5929, 256)}
top5 = {Vector(-826, 5942, 256)}
top6 = {Vector(1445, 5807, 256)}
top7 = {Vector(3473, 5949, 256)}
mid00 = {Vector(4873, 4274, 256)}
mid0 = {Vector(-5589, -5098, 261)}
mid1 = {Vector(-4027, -3532, 137)}
mid2 = {Vector(-2470, -1960, 127)}
mid3 = {Vector(-891, -425, 55)}
mid4 = {Vector(1002, 703, 127)}
mid5 = {Vector(2627, 2193, 127)}
mid6 = {Vector(4382, 3601, 2562)}
bot1 = {Vector(-4077, -6160, 268)}
bot2 = {Vector(-1875, -6125, 127)}
bot3 = {Vector(325, -6217, 256)}
bot4 = {Vector(2532, -6215, 256)}
bot5 = {Vector(4736, -6064, 256)}
bot6 = {Vector(6090, -4318, 256)}
bot7 = {Vector(6180, -2117, 256)}
bot8 = {Vector(6242, 84, 256)}
bot9 = {Vector(6307, 2286, 141)}
bot10 = {Vector(6254, 3680, 256)}

local KeyUp    = config.Treants
local Treants      = false
local play    = false

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

local x,y = 220,15
local monitor = client.screenSize.x/1600
local font = drawMgr:CreateFont("font","Verdana",12,300)
local statusText = drawMgr:CreateText(x*monitor,y*monitor,0x66FF33FF,"(" .. string.char(KeyUp) .. ")It is time for pushing.",font) statusText.visible = false

local me = entityList:GetMyHero() 

function Key(msg, code)

    if client.chat or client.console or client.loading then return end 


    if IsKeyDown(KeyUp) then 
        Treants = not Treants

        if Treants  then
            statusText.text = "(" ..string.char(KeyUp) .. ") Push Treants Active"
            Treants = true
        else
            statusText.text = "(" ..string.char(KeyUp) .. ") Push Treants UnActive"
            Treants = false
        end

    end
end


function Main(tick)
	if Treants then
    if  not SleepCheck() then return end
	local me = entityList:GetMyHero()
	local treants = entityList:GetEntities({controllable=true, classId=CDOTA_BaseNPC_Creep,alive = true, visible = true})
	local ID = me.classId if ID ~= myhero then return end
	if me.team == LuaEntity.TEAM_RADIANT and SleepCheck("go") then
			for i,v in ipairs(treants) do
	if GetDistance2D(me,v) > 580 then
	local distancetop1 = GetDistance2D(v,top1[1])
	local distancetop2 = GetDistance2D(v,top2[1])
	local distancetop3 = GetDistance2D(v,top3[1])
	local distancetop4 = GetDistance2D(v,top4[1])
	local distancetop5 = GetDistance2D(v,top5[1])
	local distancetop511 = GetDistance2D(v,top511[1])
	local distancetop6 = GetDistance2D(v,top6[1])
	local distancetop7 = GetDistance2D(v,top7[1])
	local distancetop8 = GetDistance2D(v,mid00[1])
	local distancemid0 = GetDistance2D(v,mid0[1])
	local distancemid1 = GetDistance2D(v,mid1[1])
	local distancemid2 = GetDistance2D(v,mid2[1])
	local distancemid3 = GetDistance2D(v,mid3[1])
	local distancemid4 = GetDistance2D(v,mid4[1])
	local distancemid5 = GetDistance2D(v,mid5[1])
	local distancemid6 = GetDistance2D(v,mid6[1])
	local distancemid00 = GetDistance2D(v,mid00[1])
	local distancebot1 = GetDistance2D(v,bot1[1])
	local distancebot2 = GetDistance2D(v,bot2[1])
	local distancebot3 = GetDistance2D(v,bot3[1])
	local distancebot4 = GetDistance2D(v,bot4[1])
	local distancebot5 = GetDistance2D(v,bot5[1])
	local distancebot6 = GetDistance2D(v,bot6[1])
	local distancebot7 = GetDistance2D(v,bot7[1])
	local distancebot8 = GetDistance2D(v,bot8[1])
	local distancebot9 = GetDistance2D(v,bot9[1])
	local distancebot10 = GetDistance2D(v,bot10[1])
	 if distancetop1 < 3660 and distancetop2 > 2190 then
				v:AttackMove(top1[1])
				Sleep(1500,"go")
			end
		if distancetop2 < 2400 and distancetop3 > 2490 then
				v:AttackMove(top2[1])
				Sleep(1500,"go")
		end
		if distancetop3 < 2640 and distancetop4 > 2420 then
				v:AttackMove(top3[1])
				Sleep(1500,"go")
		end
		if distancetop4 < 2340 and distancetop511 > 2280 then
				v:AttackMove(top4[1])
				Sleep(1500,"go")
		end
		if distancetop511 < 2380 and distancetop5 > 2380 then
				v:AttackMove(top5[1])
				Sleep(1500,"go")
		end
		if distancetop5 < 2380 and distancetop6 > 2380 then
				v:AttackMove(top6[1])
				Sleep(1500,"go")
		end
		if distancetop6 < 2680 and distancetop7 > 2380 then
				v:AttackMove(top7[1])
				Sleep(1500,"go")
		end
		if distancetop7 < 2630 and distancetop8 > 2080 then
				v:AttackMove(mid00[1])
				Sleep(1500,"go")
		end
		if distancemid1 < 3160 and distancemid2 > 2190 then
				v:AttackMove(mid1[1])
				Sleep(1500,"go")
			end
		if distancemid2 < 2400 and distancemid3 > 2490 then
				v:AttackMove(mid2[1])
				Sleep(1500,"go")
		end
		if distancemid3 < 2640 and distancemid4 > 2420 then
				v:AttackMove(mid3[1])
				Sleep(1500,"go")
		end
		if distancemid4 < 2340 and distancemid5 > 2280 then
				v:AttackMove(mid4[1])
				Sleep(1500,"go")
		end
		if distancemid5 < 2380 and distancemid6 > 2380 then
				v:AttackMove(mid5[1])
				Sleep(1500,"go")
		end
		if distancemid6 < 2380 and distancemid00 > 2380 then
				v:AttackMove(mid6[1])
				Sleep(1500,"go")
		end
		if distancemid00 < 2630 then
				v:AttackMove(mid00[1])
				Sleep(1500,"go")
		end
		if distancebot1 < 2400 and distancebot2 > 2490 then
				v:AttackMove(bot1[1])
				Sleep(1500,"go")
		end
		if distancebot2 < 2640 and distancebot3 > 2420 then
				v:AttackMove(bot2[1])
				Sleep(1500,"go")
		end
		if distancebot3 < 2340 and distancebot4 > 2280 then
				v:AttackMove(bot3[1])
				Sleep(1500,"go")
		end
		if distancebot4 < 2380 and distancebot5 > 2380 then
				v:AttackMove(bot4[1])
				Sleep(1500,"go")
		end
		if distancebot5 < 2380 and distancebot6 > 2380 then
				v:AttackMove(bot5[1])
				Sleep(1500,"go")
		end
		if distancebot6 < 2400 and distancebot7 > 2490 then
				v:AttackMove(bot6[1])
				Sleep(1500,"go")
		end
		if distancebot7 < 2640 and distancebot8 > 2420 then
				v:AttackMove(bot7[1])
				Sleep(1500,"go")
		end
		if distancebot8 < 2340 and distancebot9 > 2280 then
				v:AttackMove(bot8[1])
				Sleep(1500,"go")
		end
		if distancebot9 < 2380 and distancebot10 > 2380 then
				v:AttackMove(bot9[1])
				Sleep(1500,"go")
		end
		if distancebot10 < 2380 and distancemid00 > 2380 then
				v:AttackMove(bot10[1])
				Sleep(1500,"go")
			end
		end
	end
end
if me.team == LuaEntity.TEAM_DIRE and SleepCheck("go") then
			for i,v in ipairs(treants) do
	if GetDistance2D(me,v) > 580 then
	local distancetop1 = GetDistance2D(v,top1[1])
	local distancetop2 = GetDistance2D(v,top2[1])
	local distancetop3 = GetDistance2D(v,top3[1])
	local distancetop4 = GetDistance2D(v,top4[1])
	local distancetop5 = GetDistance2D(v,top5[1])
	local distancetop511 = GetDistance2D(v,top511[1])
	local distancetop6 = GetDistance2D(v,top6[1])
	local distancetop7 = GetDistance2D(v,top7[1])
	local distancetop8 = GetDistance2D(v,mid00[1])
	local distancemid0 = GetDistance2D(v,mid0[1])
	local distancemid1 = GetDistance2D(v,mid1[1])
	local distancemid2 = GetDistance2D(v,mid2[1])
	local distancemid3 = GetDistance2D(v,mid3[1])
	local distancemid4 = GetDistance2D(v,mid4[1])
	local distancemid5 = GetDistance2D(v,mid5[1])
	local distancemid6 = GetDistance2D(v,mid6[1])
	local distancemid00 = GetDistance2D(v,mid00[1])
	local distancebot1 = GetDistance2D(v,bot1[1])
	local distancebot2 = GetDistance2D(v,bot2[1])
	local distancebot3 = GetDistance2D(v,bot3[1])
	local distancebot4 = GetDistance2D(v,bot4[1])
	local distancebot5 = GetDistance2D(v,bot5[1])
	local distancebot6 = GetDistance2D(v,bot6[1])
	local distancebot7 = GetDistance2D(v,bot7[1])
	local distancebot8 = GetDistance2D(v,bot8[1])
	local distancebot9 = GetDistance2D(v,bot9[1])
	local distancebot10 = GetDistance2D(v,bot10[1])
		if distancetop7 < 3660 and distancetop6 > 2190 then
				v:AttackMove(top7[1])
				Sleep(1500,"go")
			end
		if distancetop6 < 2400 and distancetop5 > 2490 then
				v:AttackMove(top6[1])
				Sleep(1500,"go")
		end
		if distancetop5 < 2640 and distancetop511 > 2420 then
				v:AttackMove(top5[1])
				Sleep(1500,"go")
		end
		if distancetop511 < 2340 and distancetop4 > 2280 then
				v:AttackMove(top4[1])
				Sleep(1500,"go")
		end
		if distancetop4 < 2380 and distancetop3 > 2380 then
				v:AttackMove(top3[1])
				Sleep(1500,"go")
		end
		if distancetop3 < 2380 and distancetop2 > 2380 then
				v:AttackMove(top2[1])
				Sleep(1500,"go")
		end
		if distancetop2 < 2680 and distancetop1 > 2380 then
				v:AttackMove(top1[1])
				Sleep(1500,"go")
		end
		if distancetop1 < 2630 and distancemid0 > 2080 then
				v:AttackMove(mid0[1])
				Sleep(1500,"go")
		end
		if distancemid00 < 3660 and distancemid6 > 2190 then
				v:AttackMove(mid6[1])
				Sleep(1500,"go")
		end
		if distancemid6 < 2400 and distancemid5 > 2490 then
				v:AttackMove(mid5[1])
				Sleep(1500,"go")
		end
		if distancemid5 < 2640 and distancemid4 > 2420 then
				v:AttackMove(mid4[1])
				Sleep(1500,"go")
		end
		if distancemid4 < 2340 and distancemid3 > 2280 then
				v:AttackMove(mid3[1])
				Sleep(1500,"go")
		end
		if distancemid3 < 2380 and distancemid2 > 2380 then
				v:AttackMove(mid2[1])
				Sleep(1500,"go")
		end
		if distancemid2 < 2380 and distancemid1 > 2380 then
				v:AttackMove(mid1[1])
				Sleep(1500,"go")
		end
		if distancemid1 < 2380 and distancemid0 > 2380 then
				v:AttackMove(mid0[1])
				Sleep(1500,"go")
		end
		if distancebot10 < 2400 and distancebot9 > 2490 then
				v:AttackMove(bot10[1])
				Sleep(1500,"go")
		end
		if distancebot9 < 2640 and distancebot8 > 2420 then
				v:AttackMove(bot9[1])
				Sleep(1500,"go")
		end
		if distancebot8 < 2340 and distancebot7 > 2280 then
				v:AttackMove(bot8[1])
				Sleep(1500,"go")
		end
		if distancebot7 < 2380 and distancebot6 > 2380 then
				v:AttackMove(bot7[1])
				Sleep(1500,"go")
		end
		if distancebot6 < 2380 and distancebot5 > 2380 then
				v:AttackMove(bot6[1])
				Sleep(1500,"go")
		end
		if distancebot5 < 2400 and distancebot4 > 2490 then
				v:AttackMove(bot5[1])
				Sleep(1500,"go")
		end
		if distancebot4 < 2640 and distancebot3 > 2420 then
				v:AttackMove(bot4[1])
				Sleep(1500,"go")
		end
		if distancebot3 < 2340 and distancebot2 > 2280 then
				v:AttackMove(bot3[1])
				Sleep(1500,"go")
		end
		if distancebot2 < 2380 and distancebot1 > 2380 then
				v:AttackMove(bot2[1])
				Sleep(1500,"go")
		end
		if distancebot1 < 2380 and distancemid0 > 2380 then
				v:AttackMove(mid0[1])
				Sleep(1500,"go")
				end
			end
		end
	end
end
end



function Load()
	if PlayingGame() then
		local me = entityList:GetMyHero()
			statusText.visible = true
		if not me or me.classId ~= CDOTA_Unit_Hero_Furion or not client.connected or client.loading or client.console  then 
			script:Disable()
		else
			play, target, myhero = true, nil, me.classId
			script:RegisterEvent(EVENT_KEY, Key)
			script:RegisterEvent(EVENT_TICK, Main)
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
		script:RegisterEvent(EVENT_TICK,Load)
		play = false
	end
end

script:RegisterEvent(EVENT_CLOSE, Close) 
script:RegisterEvent(EVENT_TICK, Load)
