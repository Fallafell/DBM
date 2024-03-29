local mod	= DBM:NewMod("Trash", "DBM-TheEye", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20201012213000")

mod:SetCreatureID(20045)
mod:RegisterCombat("combat")
mod:RegisterCombat("yell", L.YellPull)

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_REMOVED",
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START",
	"SPELL_DAMAGE"
)

local warnKontr		= mod:NewTargetAnnounce(37135, 4)
local specWarnSwirl	= mod:NewSpecialWarningMove(15589)

local KontrTargets = {}


function mod:Kontr()
	warnKontr:Show(table.concat(KontrTargets, "<, >"))
	table.wipe(KontrTargets)
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(37135) then
		KontrTargets[#KontrTargets + 1] = args.destName
		self:UnscheduleMethod("Kontr")
		self:ScheduleMethod(0.1, "Kontr")
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(36132, 37268) then --37270, 15589
		specWarnSwirl:Show()
	end
end