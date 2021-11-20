local mod	= DBM:NewMod("Mimiron", "DBM-Ulduar")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4338 $"):sub(12, -3))
mod:SetCreatureID(33432)
mod:SetUsedIcons(1, 2, 3, 4, 5, 6, 7, 8)

mod:RegisterCombat("yell", L.YellPull)
mod:RegisterCombat("yell", L.YellHardPull)

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_REMOVED",
	"UNIT_SPELLCAST_CHANNEL_STOP",
	"CHAT_MSG_LOOT",
	"SPELL_SUMMON"
)

local blastWarn					= mod:NewTargetAnnounce(312790, 4)
local shellWarn					= mod:NewTargetAnnounce(312788, 2)
local lootannounce				= mod:NewAnnounce("MagneticCore", 1)
local warnBombSpawn				= mod:NewAnnounce("WarnBombSpawn", 3)
local warnFrostBomb				= mod:NewSpellAnnounce(64623, 3)

local warnShockBlast			= mod:NewSpecialWarning("WarningShockBlast", nil, false)
mod:AddBoolOption("ShockBlastWarningInP1", "announce")
mod:AddBoolOption("ShockBlastWarningInP4", "announce")
local warnDarkGlare				= mod:NewSpecialWarningSpell(63293)

local enrage 					= mod:NewBerserkTimer(900)
local timerHardmode				= mod:NewTimer(600, "TimerHardmode", 64582)
local timerP1toP2				= mod:NewTimer(47.4, "TimeToPhase2")
local timerP2toP3				= mod:NewTimer(27, "TimeToPhase3")
local timerP3toP4				= mod:NewTimer(31, "TimeToPhase4")
local timerP1toP2H				= mod:NewTimer(49, "TimeToPhase2H")
local timerProximityMines		= mod:NewNextTimer(35, 312789)
local timerProximityMines1		= mod:NewNextTimer(35, 312789)
local timerShockBlast			= mod:NewCastTimer(312792)
local timerSpinUp				= mod:NewCastTimer(4, 312794)
local timerDarkGlareCast		= mod:NewCastTimer(10, 63274)
local timerNextDarkGlare		= mod:NewNextTimer(39, 63274, "След. Лазерный обстрел")
local timerNextShockblast		= mod:NewNextTimer(35, 312792)
local timerPlasmaBlastCD		= mod:NewCDTimer(30, 312790)
local timerShell				= mod:NewBuffActiveTimer(6, 312788)
local timerFlameSuppressant		= mod:NewCastTimer(60, 312787)
local timerNextFlameSuppressant	= mod:NewNextTimer(10, 312793)
local timerNextFlames			= mod:NewNextTimer(28, 312803)
local timerNextFrostBomb        = mod:NewNextTimer(59, 64623)
local timerBombExplosion		= mod:NewCastTimer(14, 65333) 
local timerVolleyCD		        = mod:NewCDTimer(20, 63041)
local timerVolleyCDH	        = mod:NewCDTimer(20, 63041)


mod:AddBoolOption("PlaySoundOnShockBlast", true)
mod:AddBoolOption("PlaySoundOnDarkGlare", true)
mod:AddBoolOption("HealthFramePhase4", true)
mod:AddBoolOption("AutoChangeLootToFFA", true)
mod:AddBoolOption("SetIconOnNapalm", true)
mod:AddBoolOption("SetIconOnPlasmaBlast", true)
mod:AddBoolOption("RangeFrame")

local hardmode = false
local phase						= 0 
local lootmethod, masterlooterRaidID
local spinningUp				= GetSpellInfo(312794)
local lastSpinUp				= 0
local is_spinningUp				= false
local napalmShellTargets = {}
local napalmShellIcon 	= 7

local function warnNapalmShellTargets()
	shellWarn:Show(table.concat(napalmShellTargets, "<, >"))
	table.wipe(napalmShellTargets)
	napalmShellIcon = 7
end

function mod:OnCombatStart(delay)
    hardmode = false
	enrage:Start(-delay)
	phase = 0
	is_spinningUp = false
	napalmShellIcon = 7
	table.wipe(napalmShellTargets)
	self:NextPhase()
	timerProximityMines1:Start(15-delay)
	timerPlasmaBlastCD:Start(24-delay)
	timerNextShockblast:Start(28-delay)
	self:ScheduleMethod(15, "Mines1")
	if DBM:GetRaidRank() == 2 then
		lootmethod, _, masterlooterRaidID = GetLootMethod()
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(6)
	end
end

function mod:OnCombatEnd()
	DBM.BossHealth:Hide()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.AutoChangeLootToFFA and DBM:GetRaidRank() == 2 then
		if masterlooterRaidID then
			SetLootMethod(lootmethod, "raid"..masterlooterRaidID)
		else
			SetLootMethod(lootmethod)
		end
	end
end

function mod:Flames()
	if phase == 4 then
		timerNextFlames:Start()
		self:ScheduleMethod(28, "Flames")
	else
		timerNextFlames:Start()
		self:ScheduleMethod(28, "Flames")
	end
end

function mod:Mines()
	if phase == 4 then
		timerProximityMines:Start()
		self:ScheduleMethod(35, "Mines")
	else
		timerProximityMines:Start()
		self:ScheduleMethod(35, "Mines")
	end
end

function mod:Mines1()
	timerProximityMines1:Start()
	self:ScheduleMethod(35, "Mines1")
	
end


function mod:SPELL_SUMMON(args)
	if args:IsSpellID(33836, 63811, 63801, 312807, 312808, 312455, 312454) then -- Bomb Bot
		warnBombSpawn:Show()
	elseif args:IsSpellID(63027, 63667, 63016, 65347, 63016) then				-- mines
		timerProximityMines:Start()
	end
end


function mod:UNIT_SPELLCAST_CHANNEL_STOP(unit, spell)
	if spell == spinningUp and GetTime() - lastSpinUp < 3.9 then
		is_spinningUp = false
		self:SendSync("SpinUpFail")	
	end
end

function mod:CHAT_MSG_LOOT(msg)
	-- DBM:AddMsg(msg) --> Meridium receives loot: [Magnetic Core]
	local player, itemID = msg:match(L.LootMsg)
	if player and itemID and tonumber(itemID) == 46029 then
		lootannounce:Show(player)
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(63631, 312439, 312792) then
		if phase == 1 and self.Options.ShockBlastWarningInP1 or phase == 4 and self.Options.ShockBlastWarningInP4 then
			warnShockBlast:Show()
		end
		timerShockBlast:Start()
		timerNextShockblast:Start()
		if self.Options.PlaySoundOnShockBlast then
			PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
		end
	end
	if args:IsSpellID(64529, 62997, 312437, 312790) then -- plasma blast
		timerPlasmaBlastCD:Start()
	end
	if args:IsSpellID(64570, 312434, 312787) then
		timerFlameSuppressant:Start()
	end
	if args:IsSpellID(64623) then
		warnFrostBomb:Show()
		timerBombExplosion:Start()
		timerNextFrostBomb:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(63666, 65026, 312347, 312435, 312700, 312788) and args:IsDestTypePlayer() then -- Napalm Shell
		napalmShellTargets[#napalmShellTargets + 1] = args.destName
		timerShell:Start()
		if self.Options.SetIconOnNapalm then
			self:SetIcon(args.destName, napalmShellIcon, 6)
			napalmShellIcon = napalmShellIcon - 1
		end
		self:Unschedule(warnNapalmShellTargets)
		self:Schedule(0.3, warnNapalmShellTargets)
	elseif args:IsSpellID(64529, 62997, 312437, 312790) then -- Plasma Blast
		blastWarn:Show(args.destName)
		if self.Options.SetIconOnPlasmaBlast then
			self:SetIcon(args.destName, 8, 6)
		end
	end
end

local function show_warning_for_spinup()
	if is_spinningUp then
		warnDarkGlare:Show()
		if mod.Options.PlaySoundOnDarkGlare then
			PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(63027, 63667, 63016, 312789) then				-- mines
		timerProximityMines:Start()
	elseif args:IsSpellID(63414, 312441, 312794) then			-- Spinning UP (before Dark Glare)
		is_spinningUp = true
		timerSpinUp:Start()
		timerDarkGlareCast:Schedule(4)
		timerNextDarkGlare:Schedule(19)			-- 4 (cast spinup) + 15 sec (cast dark glare)
		DBM:Schedule(0.15, show_warning_for_spinup)	-- wait 0.15 and then announce it, otherwise it will sometimes fail
		lastSpinUp = GetTime()
	
	elseif args:IsSpellID(65192, 312440, 312793) then
		timerNextFlameSuppressant:Start()
	end
end

function mod:NextPhase()
	phase = phase + 1
	if phase == 1 then
		if self.Options.HealthFrame then
			DBM.BossHealth:Clear()
			DBM.BossHealth:AddBoss(33432, L.MobPhase1)
		end
	elseif phase == 2 then
		timerNextShockblast:Stop()
		timerProximityMines:Stop()
		timerProximityMines1:Stop()
		timerPlasmaBlastCD:Stop()
	    self:UnscheduleMethod("Mines")
		self:UnscheduleMethod("Mines1")
		timerFlameSuppressant:Stop()
		timerP1toP2:Start()
        timerVolleyCD:Schedule(48)
        timerVolleyCD:Schedule(85)
        timerVolleyCD:Schedule(105)
        timerVolleyCD:Schedule(142)
        timerVolleyCD:Schedule(162)
        timerVolleyCD:Schedule(199)		
		timerNextDarkGlare:Schedule(41)
		if self.Options.HealthFrame then
			DBM.BossHealth:Clear()
			DBM.BossHealth:AddBoss(33651, L.MobPhase2)
		end
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		if hardmode then
            timerP1toP2:Stop()
			timerP1toP2H:Start()
			timerNextFrostBomb:Start(50)
			timerVolleyCD:Cancel()
			timerVolleyCDH:Schedule(49)
			timerVolleyCDH:Schedule(84)
			timerVolleyCDH:Schedule(106)
			timerVolleyCDH:Schedule(146)		
        end
	elseif phase == 3 then
		if self.Options.AutoChangeLootToFFA and DBM:GetRaidRank() == 2 then
			SetLootMethod("freeforall")
		end
		timerDarkGlareCast:Cancel()
		timerNextDarkGlare:Cancel()
		timerNextFrostBomb:Cancel()
		timerVolleyCD:Cancel()
		timerVolleyCDH:Cancel()
		timerP2toP3:Start()
		if self.Options.HealthFrame then
			DBM.BossHealth:Clear()
			DBM.BossHealth:AddBoss(33670, L.MobPhase3)
		end
	elseif phase == 4 then
		if self.Options.AutoChangeLootToFFA and DBM:GetRaidRank() == 2 then
			if masterlooterRaidID then
				SetLootMethod(lootmethod, "raid"..masterlooterRaidID)
			else
				SetLootMethod(lootmethod)
			end
		end
		timerP3toP4:Start()
		self:ScheduleMethod(46, "Mines1")
        timerProximityMines1:Start(46)			
		timerDarkGlareCast:Schedule(44)
		timerVolleyCD:Schedule(31)
        timerVolleyCD:Schedule(68)
        timerVolleyCD:Schedule(105)
		timerVolleyCD:Schedule(125)
		timerVolleyCD:Schedule(162)
		if self.Options.HealthFramePhase4 or self.Options.HealthFrame then
			DBM.BossHealth:Show(L.name)
			DBM.BossHealth:AddBoss(33670, L.MobPhase3)
			DBM.BossHealth:AddBoss(33651, L.MobPhase2)
			DBM.BossHealth:AddBoss(33432, L.MobPhase1)
		end
		if hardmode then
		    self:UnscheduleMethod("Mines1")
		    timerProximityMines1:Stop()
		    self:ScheduleMethod(44, "Mines")
            timerProximityMines:Start(44)			
            timerNextFrostBomb:Start(33)
			timerVolleyCD:Cancel()
			timerVolleyCDH:Schedule(32)
			timerVolleyCDH:Schedule(69)
			timerVolleyCDH:Schedule(89)
			timerVolleyCDH:Schedule(126)
			timerVolleyCDH:Schedule(146)			
        end
	end
end

do 
	local count = 0
	local last = 0
	local lastPhaseChange = 0
	function mod:SPELL_AURA_REMOVED(args)
		local cid = self:GetCIDFromGUID(args.destGUID)
		if GetTime() - lastPhaseChange > 30 and (cid == 33432 or cid == 33651 or cid == 33670) then
			if args.timestamp == last then	-- all events in the same tick to detect the phases earlier (than the yell) and localization-independent
				count = count + 1
				if (mod:IsDifficulty("heroic10") and count > 4) or (mod:IsDifficulty("heroic25") and count > 9) then
					lastPhaseChange = GetTime()
					self:NextPhase()
				end
			else
				count = 1
			end
			last = args.timestamp
		elseif args:IsSpellID(63666, 65026, 312347, 312435, 312700, 312788) then -- Napalm Shell
			if self.Options.SetIconOnNapalm then
				self:SetIcon(args.destName, 0)
			end
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.YellPhase2 or msg:find(L.YellPhase2) then
		--DBM:AddMsg("ALPHA: yell detect phase2, syncing to clients")
		self:SendSync("Phase2")	-- untested alpha! (this will result in a wrong timer)
	elseif msg == L.YellPhase3 or msg:find(L.YellPhase3) then
		--DBM:AddMsg("ALPHA: yell detect phase3, syncing to clients")
		self:SendSync("Phase3")	-- untested alpha! (this will result in a wrong timer)
	elseif msg == L.YellPhase4 or msg:find(L.YellPhase4) then
		--DBM:AddMsg("ALPHA: yell detect phase3, syncing to clients")
		self:SendSync("Phase4") -- SPELL_AURA_REMOVED detection might fail in phase 3...there are simply not enough debuffs on him
	elseif msg == L.YellHardPull or msg:find(L.YellHardPull) then
		timerHardmode:Start()
		timerFlameSuppressant:Start(69)
		enrage:Stop()
		hardmode = true
		timerNextFlames:Start(2)
		self:ScheduleMethod(2, "Flames")
		timerProximityMines:Start(13)
		self:ScheduleMethod(13, "Mines")
		self:UnscheduleMethod("Mines1")
		timerProximityMines1:Stop()
	end
end


function mod:OnSync(event, args)
	if event == "SpinUpFail" then
		is_spinningUp = false
		timerSpinUp:Cancel()
		timerDarkGlareCast:Cancel()
		timerNextDarkGlare:Cancel()
		warnDarkGlare:Cancel()
	elseif event == "Phase2" and phase == 1 then -- alternate localized-dependent detection
		self:NextPhase()
	elseif event == "Phase3" and phase == 2 then
		self:NextPhase()
	elseif event == "Phase4" and phase == 3 then
		self:NextPhase()
	end
end