local mod	= DBM:NewMod("TrashMobs", "DBM-Serpentshrine")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20201025140000")

mod:SetCreatureID(21251)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"UNIT_DIED"
)

local specWarnRange		= mod:NewSpecialWarningMoveAway(39042)
local specWarnPoisonousLake	= mod:NewSpecialWarningMove(38718)

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(39042) then
		DBM.RangeCheck:Show(8)
		specWarnRange:Show()
	elseif args:IsSpellID(38718) and args:IsPlayer() then
		specWarnPoisonousLake:Show()
	end
end

function mod:UNIT_DIED(args)
	if self:GetCIDFromGUID(args.destGUID) == 21251 then
		DBM.RangeCheck:Hide()
	end
end
