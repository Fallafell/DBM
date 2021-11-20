local mod	= DBM:NewMod("Gore'lats", "DBM-Serpentshrine")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 163 $"):sub(12, -3))

mod:SetCreatureID(121217)
mod:RegisterCombat("combat", 121217)

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED"
)

local warnClaw                             = mod:NewTargetAnnounce(310548, 4)

local specWarnBloodStack                   = mod:NewSpecialWarningStack(310547, nil, 15)

local timerMightyblowandclawCD             = mod:NewCDTimer(25, 310548)
local timerSlowParalysisCD                 = mod:NewCDTimer(20, 310555)
local timerToxicVomitCD                    = mod:NewCDTimer(25, 310549)
local timerPuddleOfSlimeCD                 = mod:NewCDTimer(32, 310550)
local timerSummoningTheGuardsCD            = mod:NewCDTimer(48, 310557)

local berserkTimer				           = mod:NewBerserkTimer(720)

function mod:OnCombatStart()
	DBM:FireCustomEvent("DBM_EncounterStart", 121217, "Gore'lats")
		berserkTimer:Start()
end

function mod:OnCombatEnd(wipe)
	DBM:FireCustomEvent("DBM_EncounterEnd", 121217, "Gore'lats", wipe)
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(310542) then
		timerMightyblowandclawCD:Start(12)
		timerSlowParalysisCD:Start(19)
		timerToxicVomitCD:Start(24)
		timerPuddleOfSlimeCD:Start(31)
		timerSummoningTheGuardsCD:Start()
	elseif args:IsSpellID(310555) then
		timerSlowParalysisCD:Start()
	elseif args:IsSpellID(310548) then
		warnClaw:Show(args.destName)
	elseif args:IsSpellID(310547) then
		if args:IsPlayer() then
		if (args.amount or 1) >= 15 then
		specWarnBloodStack:Show(args.amount)
		if self.Options.SoundMem then
		self:PlaySound("dpsslowly")
		end
		end
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(310548) then 
	   timerMightyblowandclawCD:Start()
	elseif args:IsSpellID(310550) then 
	   timerPuddleOfSlimeCD:Start()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(310549) then 
	   timerToxicVomitCD:Start()
	elseif args:IsSpellID(310557) then 
	   timerSummoningTheGuardsCD:Start()
	   if self.Options.SoundMem then
	   self:PlaySound("enemy_spot")
	end 
	end
end

mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED