if GetLocale() ~= "ruRU" then return end

local L

--Hydross
L = DBM:GetModLocalization("Hydross")

L:SetGeneralLocalization{
	name = "Гидросс Нестабильный"
}

L:SetTimerLocalization{
	TimerMarkOfHydross = "Знак Гидроса %s%%",
	TimerMarkOfCorruption = "Знак порчи %s%%"
}

L:SetWarningLocalization{
	WarnMarkOfHydross       = "Знак Гидроса %s%%",
	WarnMarkOfCorruption    = "Знак порчи %s%%",
	SpecWarnThreatReset     = "Сброс угрозы!",
	Yad                     = "Грязная фаза",
	Chis                    = "Чистая фаза"
}

L:SetOptionLocalization{
	TimerMarkOfHydross      = DBM_CORE_AUTO_TIMER_OPTIONS.next:format(38215, GetSpellInfo(38215) or "unknown"),
	TimerMarkOfCorruption   = DBM_CORE_AUTO_TIMER_OPTIONS.next:format(38219, GetSpellInfo(38219) or "unknown"),
	WarnMarkOfHydross       = DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(38215, GetSpellInfo(38215) or "unknown"),
	WarnMarkOfCorruption    = DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(38219, GetSpellInfo(38219) or "unknown"),
	SpecWarnThreatReset     = "Спец. предупреждение о сбрасывании угрозы",
	SetIconOnSklepTargets   = "Устанавливать иконки на цели $spell:309046",
	SetIconOnKorTargets     = "Устанавливать иконки на цели $spell:309065",
	Yad                     = "Объявлять перефазу ",
	Chis                    = "Объявлять перефазу  ",
	AnnounceSklep	     	= "Объявлять игроков, на кого установлен $spell:309046, в рейд чат",
	AnnounceKor  		= "Объявлять игроков, на кого установлена $spell:309065, в рейд чат "
}

L:SetMiscLocalization{
	YellPull   = "Я не позволю вам вмешиваться!",
	YellPoison = "Агрррхх, яд.",
	YellWater  = "Так лучше, намного лучше.",
	SklepIcon	= "Знак вод {rt%d} %s",
	KorIcon		= "Коррозия {rt%d} %s"
}


--Tidewalker
L = DBM:GetModLocalization("Tidewalker")

L:SetGeneralLocalization{
	name = "Морогрим Волноступ"
}

L:SetTimerLocalization{
	TimerMurlocks   = "Мурлоки"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	TimerMurlocks   = "Отсчет времени до вызова мурлоков",
	RangeFrame	= "Показывать игроков  в окне проверки дистанции (6)"
}

L:SetMiscLocalization{
	YellPull        = "Да поглотит вас пучина вод!"
}

--Leotheras
L = DBM:GetModLocalization("Leotheras")

L:SetGeneralLocalization{
	name = "Леотерас Слепец"
}

L:SetTimerLocalization{
	TimerDemon = "Форма демона",
	TimerNormal = "Обычная форма",
	TimerInnerDemons = "Контроль над разумом"
}

L:SetWarningLocalization{
	WarnPhase2Soon			= "Скоро переход в фазу 2",
}

L:SetOptionLocalization{
	TimerDemon = "Отсчет времени до превращения в демона",
	TimerNormal = "Отсчет времени до конца формы демона",
	TimerInnerDemons = DBM_CORE_AUTO_TIMER_OPTIONS.active:format(37676, GetSpellInfo(37676) or "unknown"),
	KleiIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(310496),
	SetIconOnDemonTargets = "Устанавливать иконки на цели демонов",
	SetIconOnPepelTargets = "Устанавливать иконки на цели испепеления",
	WarnPhase2Soon			= "Предупреждать заранее о переходе в фазу 2 (на ~37%)",
	AnnounceKlei			= "Объявлять игроков, на кого установлено $spell:310496, в рейд чат",
	AnnouncePepel			= "Объявлять игроков, на кого установлено $spell:310514, в рейд чат "
}

L:SetMiscLocalization{
	YellPull        = "Наконец-то мое заточение окончено!",
	YellDemon       = "Прочь, жалкий эльф. Настало мое время!",
	YellShadow      = "Нет... нет! Что вы наделали? Я – главный! Слышишь меня? Я... Ааааах! Мне его... не удержать.",
	PepelIcon	= "Испепеление {rt%d} установлено на %s",
	Klei		= "Клеймо {rt%d} установлено на %s"
}

--LurkerBelow
L = DBM:GetModLocalization("LurkerBelow")

L:SetGeneralLocalization{
	name           = "Скрытень из глубин"
}

L:SetTimerLocalization{
	Submerge     = "Погружение",
	Emerge       = "Появление"

}

L:SetWarningLocalization{
	WarnSubmerge = "Скоро погружение",
	WarnEmerge   = "Скоро появление"
}

L:SetOptionLocalization{
	WarnSubmerge = "Объявлять погружение",
	WarnEmerge   = "Объявлять появление",
	Submerge     = "Отсчет времени до погружения",
	Emerge       = "Отсчет времени до появления"
}

L:SetMiscLocalization{
	EmoteSpout = "%s делает глубокий вдох."
}

--Fathomlord
L = DBM:GetModLocalization("Fathomlord")

L:SetGeneralLocalization{
	name           = "Повелитель глубин Каратресс"
}

L:SetTimerLocalization{
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	SetIconOnSvazTargets       = "Устанавливать метки на $spell:309261",
	AnnounceSvaz			   = "Объявлять игроков, на кого установлено $spell:309261, в рейд чат ",
	SpecWarnTrapNear	       = "Спец-предупреждение, когда $spell:309253 около вас",
    YellOnTrap			       = "Кричать, когда $spell:309253 на вас",
	TrapIcon			       = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(309253),
	TrapArrow				   = "Показывать стрелку, когда $spell:309253 около вас",
	LKBugWorkaround			   = "Отключить синхр-цию для $spell:309253"
}

L:SetMiscLocalization{
	YellTrap		= "{череп}|cff71d5ff|Hspell:309253|h[Стрела Катаклизма]|h|rЦЕЛЬ Я{череп}"
}

--Vashj
L = DBM:GetModLocalization("Vashj")

L:SetGeneralLocalization{
	name       = "Леди Вайш"
}

L:SetTimerLocalization{
	Strider              = "Странник",
	TaintedElemental     = "Нечистый элементаль",
	Naga                 = "Гвардеец"
}

L:SetWarningLocalization{
	WarnCore             = "%s получил порченую магму",
	WarnPhase            = "Фаза %d",
	WarnElemental        = "Нечистый элементаль на подходе",
	SpecWarnStaticAngerNear	= "Статический заряд рядом - отойдите."
}

L:SetOptionLocalization{
	WarnCore              = "Объявить наличие порченой магмы",
	WarnPhase             = "Обьявлять о смене фазы",
	Strider               = "Отсчет времени до следующего Странника",
	TaintedElemental      = "Отсчет времени до следующего Нечистого элементаля",
	Naga                  = "Отсчет времени до следующего Гвардейца",
	WarnElemental         = "Объявлять о прибытии Нечистый элементаль",
	Elem				= "Показывать стрелку на Нечистого элементаля",
	AnnounceStatic			= "Объявлять игроков, на кого установлено $spell:310636, в рейд чат ",
	SpecWarnStaticAngerNear		= "Спец-предупреждение, когда $spell:310636 около вас"
}

L:SetMiscLocalization{
	YellPhase2              = "Время пришло! Не щадите никого!",
	YellPhase3              = "Вам не пора прятаться?",
	TaintedElemental        = "Нечистый элементаль",
	StaticIcons		= "Статический заряд {rt%d} %s"
}

--Gorelac
L = DBM:GetModLocalization("Gore'lats")

L:SetGeneralLocalization{
	name           = "Горе'лац"
}

--TrashMobs
L = DBM:GetModLocalization("TrashMobs")

L:SetGeneralLocalization{
	name           = "Трэш мобы"
}
