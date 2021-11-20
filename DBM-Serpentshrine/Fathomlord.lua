local mod	= DBM:NewMod("Fathomlord", "DBM-Serpentshrine")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20201004021400")

mod:SetCreatureID(21214)
mod:RegisterCombat("yell", L.YellPull)
mod:SetUsedIcons(4, 5, 6, 7, 8)

mod:RegisterEvents(
	"CHAT_MSG_MONSTER_EMOTE",
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_APPLIED_DOSE",
	"UNIT_HEALTH",
	"SWING_MISSED",
	"SWING_DAMAGE"
)

local timerNovaCD        = mod:NewCDTimer(26, 38445)  -- звезда
local timerSpitfireCD    = mod:NewCDTimer(60, 38236)  -- тотем

local berserkTimer       = mod:NewBerserkTimer(600)

------------------------ХМ-------------------------

local warnTrapCast		    = mod:NewTargetAnnounce(309253, 4) -- Стрела катаклизма

local specWarnTrap		    = mod:NewSpecialWarningYou(309253)
local specWarnTrapNear	    = mod:NewSpecialWarning("|cff71d5ff|Hspell:309253|hСтрела Катаклизма|h|r Пролетит Через Вас!")

local timerPhaseCast        = mod:NewCastTimer(65, 309292) -- Скользящий натиск
local timerStrelaCast		= mod:NewCastTimer(6, 309253) -- Стрела катаклизма
local timerStrelaCD			= mod:NewCDTimer(43, 309253) -- Стрела катаклизма

-----------Карибдис-----------
local warnZalp              = mod:NewSpellAnnounce(309305, 2) -- Залп стрел
local warnGnevSoon          = mod:NewSoonAnnounce(309281, 2) -- Гнев прилива
local warnKop	            = mod:NewSpellAnnounce(309286, 3) -- Водяное копье
-----------Волнис-----------
local warnOko               = mod:NewSpellAnnounce(309258, 2) -- Око шторма
local warnByr               = mod:NewSpellAnnounce(309270, 3) -- Неистовство бури
local warnStorm             = mod:NewSpellAnnounce(309272, 2) -- Порыв шторма
-----------Шарккис-----------
local warnSvaz              = mod:NewTargetAnnounce(309262, 3) -- Пламенная связь
local warnPust		        = mod:NewStackAnnounce(309277, 3) -- Опустошающее пламя

-----------Волнис-----------
local specWarnOko           = mod:NewSpecialWarning("Око шторма - Не выходите за границу круга!") -- Око шторма
-----------Шарккис-----------
local specWarnSvaz          = mod:NewSpecialWarningRun(309262) -- Пламенная свзяь

-----------Карибдис-----------
local timerVisCD			= mod:NewCDTimer(29, 309256) -- Исцеление
local timerVisCast			= mod:NewCastTimer(1, 309256) -- Исцеление
local timerZalpCD			= mod:NewCDTimer(12, 309305) -- Залп стрел
local timerGnevCD			= mod:NewCDTimer(19, 309281) -- Гнев прилива
local timerGnevCast			= mod:NewCastTimer(2, 309281) -- Гнев прилива
local timerKopCD			= mod:NewCDTimer(3, 309286) -- Водяное копье
-----------Волнис-----------
local timerOkoCD			= mod:NewCDTimer(24, 309258) -- Око шторма
local timerOkoCast			= mod:NewCastTimer(8, 309258) -- Око шторма
local timerByrCast			= mod:NewCastTimer(10, 309270) -- Неистовство бури
local timerStormCD			= mod:NewCDTimer(9, 309272) -- Порыв шторма
-----------Шарккис-----------
local timerSvazCD			= mod:NewCDTimer(25, 309262) -- Пламенная связь
local timerPustCD			= mod:NewCDTimer(5, 309277) -- Опустошающее пламя
local timerPust	        	= mod:NewTargetTimer(60, 309277) -- Опустошающее пламя
local timerEarthquakeCD	    = mod:NewCDTimer(150, 309289) -- Землетрясение


mod:AddBoolOption("SetIconOnSvazTargets", true)
mod:AddBoolOption("AnnounceSvaz", true)
mod:AddBoolOption("TrapIcon")
mod:AddBoolOption("YellOnTrap", true, "announce")
mod:AddBoolOption("TrapArrow")
mod:AddBoolOption("LKBugWorkaround", true)


local SvazTargets = {}
local CastKop = 1
local SvazIcons = 7
local LKTank



function mod:OnCombatStart()
	DBM:FireCustomEvent("DBM_EncounterStart", 21214, "Fathom-Lord Karathress")
		self.vb.phase = 1
		if mod:IsDifficulty("heroic25") then
		timerVisCD:Start(30)
		timerStrelaCD:Start(31)
		LKTank = nil
		else
		berserkTimer:Start()
		timerNovaCD:Start()
		timerSpitfireCD:Start()
	end
end


function mod:OnCombatEnd(wipe)
	DBM:FireCustomEvent("DBM_EncounterEnd", 21214, "Fathom-Lord Karathress", wipe)	
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(38445) then
		timerNovaCD:Start()
	elseif args:IsSpellID(309289) then
        	timerOkoCD:Cancel()
       		timerSvazCD:Cancel()
        	timerEarthquakeCD:Start()
        	timerPhaseCast:Start()		
	elseif args:IsSpellID(309253) then -- Стрела катаклизма
		timerStrelaCD:Start()
		timerStrelaCast:Start()
		if self.Options.LKBugWorkaround then
			self:ScheduleMethod(0.01, "OldTrapTarget")
			self:ScheduleMethod(0.02, "OldTrapTarget")
			self:ScheduleMethod(0.03, "OldTrapTarget")
			self:ScheduleMethod(0.04, "OldTrapTarget")
			self:ScheduleMethod(0.05, "OldTrapTarget")
			self:ScheduleMethod(0.06, "OldTrapTarget")
			self:ScheduleMethod(0.07, "OldTrapTarget")
			self:ScheduleMethod(0.08, "OldTrapTarget")
			self:ScheduleMethod(0.09, "OldTrapTarget")
			self:ScheduleMethod(0.1, "OldTrapTarget")
		else
			self:ScheduleMethod(0.01, "TrapTarget")
			self:ScheduleMethod(0.02, "TrapTarget")
			self:ScheduleMethod(0.03, "TrapTarget")
			self:ScheduleMethod(0.04, "TrapTarget")
			self:ScheduleMethod(0.05, "TrapTarget")
			self:ScheduleMethod(0.06, "TrapTarget")
			self:ScheduleMethod(0.07, "TrapTarget")
			self:ScheduleMethod(0.08, "TrapTarget")
			self:ScheduleMethod(0.09, "TrapTarget")
			self:ScheduleMethod(0.1, "TrapTarget")
		end
-----------Карибдис-----------
	elseif args:IsSpellID(309256) then -- Исцеление
		timerVisCD:Start()
		timerVisCast:Start()
	elseif args:IsSpellID(309281) then -- Гнев прилива
		warnGnevSoon:Show()
		timerGnevCD:Start()
		timerGnevCast:Start()
	elseif args:IsSpellID(309286) then -- Водяное копье
		if CastKop < 3 then
			warnKop:Show()
			timerKopCD:Start()
			CastKop = CastKop + 1
		else
			warnKop:Show()
			timerKopCD:Start(6)
			CastKop = 1
		end
-----------Волнис-----------
	end
end

function mod:SPELL_CAST_SUCCESS(args)-----
	if args:IsSpellID(38236) then
		timerSpitfireCD:Start()
	elseif args:IsSpellID(309305) then -- Залп стрел
		warnZalp:Show()
		timerZalpCD:Start()
-----------Волнис-----------
	elseif args:IsSpellID(309258) then -- Око шторма
		warnOko:Show()
		timerOkoCD:Start()
	elseif args:IsSpellID(309270) then -- Неистовство бури
		warnByr:Show()
		timerByrCast:Start()
	elseif args:IsSpellID(309272) then -- Порыв шторма
		warnStorm:Show()
		timerStormCD:Start()
-----------Шарккис-----------
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(309287) then -----------Сила Карибдис-----------
        timerVisCD:Cancel()
		timerEarthquakeCD:Start(95)
-----------Волнис-----------
	elseif args:IsSpellID(309258) then -- Око шторма
		if args:IsPlayer() then
			specWarnOko:Show()
			timerOkoCast:Start()
		end
-----------Шарккис-----------
	elseif args:IsSpellID(309262) then -- Пламенная связь
		SvazTargets[#SvazTargets + 1] = args.destName
		timerSvazCD:Start()
		if args:IsPlayer() then
			specWarnSvaz:Show()
	    if self.Options.AnnounceSvaz then
	    SendChatMessage(format("{череп}|cff71d5ff|Hspell:309262|h[Пламенная связь]|h|r{череп}НА МНЕ{череп}"), "SAY")
		end
		end
		if self.Options.SetIconOnSvazTargets then
			self:SetIcon(args.destName, SvazIcons)
			SvazIcons = SvazIcons - 1
		end
		if #SvazTargets >= 3 then
            warnSvaz:Show(table.concat(SvazTargets, "<, >"))
            table.wipe(SvazTargets)
            SvazIcons = 7
		end	   
	elseif args:IsSpellID(309277) then -- Опустошающее пламя
		timerPustCD:Start()
		warnPust:Show(args.destName, args.amount or 1)
		timerPust:Start(args.destName)
	end
end


function mod:TankTrap()
	if mod:LatencyCheck() then
		self:SendSync("TrapOn", LKTank)
	end
end

function mod:TrapTarget()
	local targetname = self:GetBossTarget(21214)
	if not targetname then return end
	if targetname ~= LKTank then
		self:UnscheduleMethod("TrapTarget")
		self:UnscheduleMethod("TankTrap")
		if mod:LatencyCheck() then
			self:SendSync("TrapOn", targetname)
		end
	else
		self:UnscheduleMethod("TankTrap")
		self:ScheduleMethod(1, "TankTrap")
	end
end


function mod:OldTankTrap()
	warnTrapCast:Show(LKTank)
	if self.Options.TrapIcon then
		self:SetIcon(LKTank, 8, 6)
	end
	if LKTank == UnitName("player") then
		specWarnTrap:Show()
		if self.Options.YellOnTrap then
			SendChatMessage(L.YellTrap, "SAY")
		end
	end
	local uId = DBM:GetRaidUnitId(LKTank)
	if uId ~= "none" then
		local inRange = CheckInteractDistance(uId, 2)
		local x, y = GetPlayerMapPosition(uId)
		if x == 0 and y == 0 then
			SetMapToCurrentZone()
			x, y = GetPlayerMapPosition(uId)
		end
		if inRange then
			specWarnTrapNear:Show()
			if self.Options.TrapArrow then
				DBM.Arrow:ShowRunAway(x, y, 10, 5)
			end
		end
	end
end

function mod:OldTrapTarget()
	local targetname = self:GetBossTarget(21214)
	if not targetname then return end
	if targetname ~= LKTank then
		self:UnscheduleMethod("OldTrapTarget")
		self:UnscheduleMethod("OldTankTrap")
		warnTrapCast:Show(targetname)
		if self.Options.TrapIcon then
			self:SetIcon(targetname, 8, 6)
		end
		if targetname == UnitName("player") then
			specWarnTrap:Show()
			if self.Options.YellOnTrap then
				SendChatMessage(L.YellTrap, "SAY")
			end
		end
		local uId = DBM:GetRaidUnitId(targetname)
		if uId then
			local inRange = CheckInteractDistance(uId, 2)
			local x, y = GetPlayerMapPosition(uId)
			if x == 0 and y == 0 then
				SetMapToCurrentZone()
				x, y = GetPlayerMapPosition(uId)
			end
			if inRange then
				specWarnTrapNear:Show()
				if self.Options.TrapArrow then
					DBM.Arrow:ShowRunAway(x, y, 10, 5)
				end
			end
		end
	else
		self:UnscheduleMethod("OldTankTrap")
		self:ScheduleMethod(1, "OldTankTrap") 
	end
end

		
function mod:SWING_MISSED(args)
	if args:GetSrcCreatureID() == 21214 then
		LKTank = args.destName
	end
end

function mod:SWING_DAMAGE(args)
	if args:GetSrcCreatureID() == 21214 then
		LKTank = args.destName
	end
end



function mod:OnSync(msg, target)
if msg == "TrapOn" then
		if not self.Options.LKBugWorkaround then
			warnTrapCast:Show(target)
			if self.Options.TrapIcon then
				self:SetIcon("player", 8, 6)
			end
			if target == UnitName("player") then
				specWarnTrap:Show()
				if self.Options.YellOnTrap then
					SendChatMessage(L.YellTrap, "SAY")
				end
			end
			local uId = DBM:GetRaidUnitId(target)
			if uId ~= "none" then
				local inRange = CheckInteractDistance(uId, 2)
				local x, y = GetPlayerMapPosition(uId)
				if x == 0 and y == 0 then
					SetMapToCurrentZone()
					x, y = GetPlayerMapPosition(uId)
				end
				if inRange then
					specWarnTrapNear:Show()
					if self.Options.TrapArrow then
						DBM.Arrow:ShowRunAway(x, y, 10, 5)
					end
				end
			end
		end
end
end


mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED