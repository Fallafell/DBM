local mod	= DBM:NewMod("Tidewalker", "DBM-Serpentshrine")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 163 $"):sub(12, -3))

mod:SetCreatureID(21213)
mod:RegisterCombat("yell", L.YellPull)

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_DAMAGE",
	"SPELL_CAST_START",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS"
)

local timerMurlocks     = mod:NewTimer(50, "TimerMurlocks", "Interface\\Icons\\INV_Misc_MonsterHead_02")

local berserkTimerN     = mod:NewBerserkTimer(600)

------------------ХМ----------------

local warnGripOfGiant			= mod:NewTargetAnnounce(310144, 1)

local specWarnRoarOfAppeal           = mod:NewSpecialWarningCast(310151, not mod:IsTank())

local timerGripOfGiantCD             = mod:NewCDTimer(33, 310144)
local timerMonumentalBlowCD          = mod:NewCDTimer(21, 310137)
local timerRoarOfAppealCD            = mod:NewCDTimer(45, 310151)
local timerRoarOfAppealCast          = mod:NewCastTimer(3, 310151, "Каст Призывный рев")

local berserkTimer			= mod:NewBerserkTimer(360)

mod:AddBoolOption("RangeFrame")

function mod:OnCombatStart()
	DBM:FireCustomEvent("DBM_EncounterStart", 21213, "Morogrim Tidewalker")
    if mod:IsDifficulty("heroic25") then
        berserkTimer:Start()
	else
	berserkTimerN:Start()
	timerMurlocks:Start(42)
    end
end

function mod:OnCombatEnd(wipe)
	DBM:FireCustomEvent("DBM_EncounterEnd", 21213, "Morogrim Tidewalker", wipe)
    if self.Options.RangeFrame then
	   DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_DAMAGE(args)
	if args:IsSpellID(310137) then  
       timerMonumentalBlowCD:Start()
    end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(310144) then          
       timerGripOfGiantCD:Start()
	   warnGripOfGiant:Show(args.destName)
	   self:SetIcon(args.destName, 8)
	   if args:IsPlayer() then
	   if self.Options.SoundMem then
	   self:PlaySound("voda")
	   end
	   end
    elseif args:IsSpellID(310139) then          
       berserkTimer:Start()
	elseif args:IsSpellID(310150) then
       if self.Options.SoundMem then
	   self:PlaySound("hardbass")
    	end
    end
end


function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(310139) then
	   berserkTimer:Start(420)
	   timerGripOfGiantCD:Cancel()
	   if self.Options.RangeFrame then
	   DBM.RangeCheck:Show(6)
	   end
    elseif args:IsSpellID(310144) then
       self:SetIcon(args.destName, 0)
    end
end


function mod:SPELL_CAST_START(args)
	if args:IsSpellID(310151) then
	   timerRoarOfAppealCast:Start(3)
	   timerRoarOfAppealCD:Start()
	   if not self:IsTank() then
	   specWarnRoarOfAppeal:Schedule(2.5)
	end
    end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(310151) then
		timerMurlocks:Start(50)
	end
end
