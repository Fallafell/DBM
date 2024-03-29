﻿if GetLocale() ~= "ruRU" then return end

local L

-----------------------
--  Flame Leviathan  --
-----------------------
L = DBM:GetModLocalization("FlameLeviathan")

L:SetGeneralLocalization{
	name = "Огненный Левиафан"
}

L:SetTimerLocalization{
}

L:SetMiscLocalization{
	YellPull	= "Обнаружены противники. Запуск протокола оценки угрозы. Главная цель выявлена. Повторный анализ через 30 секунд.",
	Emote		= "%%s наводится на (%S+)%."
}

L:SetWarningLocalization{
	PursueWarn				= "Преследуется >%s<",
	warnNextPursueSoon		= "Смена цели через 5 секунд",
	SpecialPursueWarnYou	= "Преследует вас - бегите",
	warnWardofLife			= "Призыв Защитника жизни"
}

L:SetOptionLocalization{
	SpecialPursueWarnYou	= "Спец-предупреждение, когда на вас $spell:62374",
	PursueWarn				= "Объявлять цели заклинания $spell:62374",
	warnNextPursueSoon		= "Предупреждать заранее о следующем $spell:62374",
	warnWardofLife			= "Спец-предупреждение для призыва Защитника жизни"
}

--------------------------------
--  Ignis the Furnace Master  --
--------------------------------
L = DBM:GetModLocalization("Ignis")

L:SetGeneralLocalization{
	name = "Повелитель Горнов Игнис"
}
L:SetMiscLocalization{
	YellPull	= "Мерзкие глупцы! Ваша кровь закалит оружие которым был завоеван этот мир!"
}
L:SetTimerLocalization{
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	SlagPotIcon			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(63477)
}

------------------
--  Razorscale  --
------------------
L = DBM:GetModLocalization("Razorscale")

L:SetGeneralLocalization{
	name = "Острокрылая"
}

L:SetWarningLocalization{
	warnTurretsReadySoon		= "Гарпунные пушки будут собраны через 20 секунд",
	warnTurretsReady			= "Гарпунные пушки собраны",
	SpecWarnDevouringFlameCast	= "Лавовая бомба на вас",
	WarnDevouringFlameCast		= "Лавовая бомба на |3-5(>%s<)"
}

L:SetTimerLocalization{
	timerTurret1	= "Гарпунная пушка 1",
	timerTurret2	= "Гарпунная пушка 2",
	timerTurret3	= "Гарпунная пушка 3",
	timerTurret4	= "Гарпунная пушка 4",
	timerGrounded	= "на земле"
}

L:SetOptionLocalization{
	PlaySoundOnDevouringFlame	= "Звуковой сигнал, когда на вас $spell:64733",
	warnTurretsReadySoon		= "Пред-предупреждение для пушек",
	warnTurretsReady			= "Предупреждение для пушек",
	SpecWarnDevouringFlameCast	= "Спец-предупреждение, когда $spell:64733 применяется на вас",
	timerTurret1				= "Отсчет времени до пушки 1",
	timerTurret2				= "Отсчет времени до пушки 2",
	timerTurret3				= "Отсчет времени до пушки 3 (25 чел.)",
	timerTurret4				= "Отсчет времени до пушки 4 (25 чел.)",
	OptionDevouringFlame		= "Объявлять цели заклинания $spell:64733 (неточно)",
	timerGrounded			    = "Отсчет времени для наземной фазы"
}

L:SetMiscLocalization{
	YellAir				= "Дайте время подготовить пушки.",
	YellAir2			= "Огонь прекратился! Надо починить пушки!",
	YellGround			= "Быстрее! Сейчас она снова взлетит!",
	EmotePhase2			= "%%s обессилела и больше не может летать!",
	FlamecastUnknown	= DBM_CORE_UNKNOWN
}

----------------------------
--  XT-002 Deconstructor  --
----------------------------
L = DBM:GetModLocalization("XT002")

L:SetGeneralLocalization{
	name = "Разрушитель XT-002"
}

L:SetMiscLocalization{
	YellPull	= "Новые игрушки ? Для меня ? Обещаю, в этот раз я их не поломаю!"
}

L:SetTimerLocalization{
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	SetIconOnLightBombTarget	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(312941),
	SetIconOnGravityBombTarget	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(312943),
	YellOnLightBomb					= "Кричать, когда на вас $spell:312941",
	YellOnGravityBomb				= "Кричать, когда на вас $spell:312943",
}

--------------------
--  Iron Council  --
--------------------
L = DBM:GetModLocalization("IronCouncil")

L:SetGeneralLocalization{
	name = "Железное Собрание"
}

L:SetWarningLocalization{
}

L:SetTimerLocalization{
}

L:SetOptionLocalization{
	PlaySoundLightningTendrils	= "Звуковой сигнал при $spell:312786",
	SetIconOnOverwhelmingPower	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(312772),
	SetIconOnStaticDisruption	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(312770),
	AlwaysWarnOnOverload		= "Всегда предупреждать при $spell:312782\n(иначе, только когда босс в цели)",
	PlaySoundOnOverload			= "Звуковой сигнал при $spell:312782",
	PlaySoundDeathRune			= "Звуковой сигнал при $spell:312777"
}

L:SetMiscLocalization{
	Steelbreaker		= "Сталелом",
	RunemasterMolgeim	= "Мастер рун Молгейм",
	StormcallerBrundir 	= "Буревестник Брундир"
}

----------------------------
--  Algalon the Observer  --
----------------------------
L = DBM:GetModLocalization("Algalon")

L:SetGeneralLocalization{
	name = "Алгалон Наблюдатель"
}

L:SetTimerLocalization{
	NextCollapsingStar		= "Вспыхивающая звезда",
	PossibleNextCosmicSmash	= "Кара небесная",
	TimerCombatStart		= "Битва начнется через"
}

L:SetWarningLocalization{
	WarningPhasePunch		= "Фазовый удар на |3-5(>%s<) - cтак %d",
	WarningCosmicSmash 		= "Кара небесная - взрыв через 4 секунды",
	WarnPhase2Soon			= "Скоро фаза 2",
	warnStarLow				= "У Вспыхивающей звезды мало здоровья"
}

L:SetOptionLocalization{
	WarningPhasePunch		= "Объявлять цели заклинания Фазовый удар",
	NextCollapsingStar		= "Отсчет времени до появления Вспыхивающей звезды",
	WarningCosmicSmash 		= "Предупреждение для Кары небесной",
	PossibleNextCosmicSmash	= "Отсчет времени до следующей Кары небесной",
	TimerCombatStart		= "Отсчет времени до начала боя",
	WarnPhase2Soon			= "Предупреждать заранее о фазе 2 (на ~23%)",
	warnStarLow				= "Спец-предупреждение, когда у Вспыхивающей звезды мало здоровья (на ~25%)"
}

L:SetMiscLocalization{
	YellPull				= "Ваши действия нелогичны. Все возможные исходы этой схватки просчитаны. Пантеон получит сообщение от Наблюдателя в любом случае.",
	YellKill				= "Я видел миры, охваченные пламенем Творцов. Их жители гибли, не успев издать ни звука. Я был свидетелем того, как галактики рождались и умирали в мгновение ока. И все время я оставался холодным... и безразличным. Я. Не чувствовал. Ничего. Триллионы загубленных судеб. Неужели все они были подобны вам? Неужели все они так же любили жизнь?",
	Emote_CollapsingStar	= "%s призывает вспыхивающие звезды!",
	Phase2					= "Узрите чудо созидания!",
	PullCheck				= "Алгалон подаст сигнал бедствия через (%d+) мин."
}

----------------
--  Kologarn  --
----------------
L = DBM:GetModLocalization("Kologarn")

L:SetGeneralLocalization{
	name = "Кологарн"
}

L:SetWarningLocalization{
}

L:SetTimerLocalization{
	timerLeftArm		= "Возрождение левой руки",
	timerRightArm		= "Возрождение правой руки",
	achievementDisarmed	= "Обезоружен"
}

L:SetOptionLocalization{
	timerLeftArm			= "Отсчет времени до Возрождения левой руки",
	timerRightArm			= "Отсчет времени до Возрождения правой руки",
	achievementDisarmed		= "Отсчет времени для достижения Обезоружен",
	SetIconOnGripTarget		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(312757),
	SetIconOnEyebeamTarget	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(312765),
	PlaySoundOnEyebeam		= "Звуковой сигнал при $spell:312765",
	YellOnBeam				= "Кричать, когда на вас $spell:312765",
	YellOnGrip	            = "Кричать, когда на вас $spell:312757"
}

L:SetMiscLocalization{
	Yell_Trigger_arm_left	= "Царапина...",
	Yell_Trigger_arm_right	= "Всего лишь плоть!",
	YellPull 				= "Вы не должен пройти!",
	Health_Body				= "Кологарн",
	Health_Right_Arm		= "Правая рука",
	Health_Left_Arm			= "Левая рука",
	FocusedEyebeam			= "%s устремляет на вас свой взгляд!",
	YellBeam				= "Сосредоточенный взгляд на мне!"
}

---------------
--  Auriaya  --
---------------
L = DBM:GetModLocalization("Auriaya")

L:SetGeneralLocalization{
	name = "Ауриайа"
}

L:SetMiscLocalization{
	Defender = "Дикий эащитник (%d)",
	YellPull = "Вы зря сюда заявились!"
}

L:SetTimerLocalization{
	timerDefender	= "Возрождение Дикого защитника"
}

L:SetWarningLocalization{
	SpecWarnBlast	= "Удар часового - прерывание",
	WarnCatDied		= "Дикий эащитник погибает (осталось %d жизней)",
	WarnCatDiedOne	= "Дикий эащитник погибает (осталась 1 жизнь)",
}

L:SetOptionLocalization{
	SpecWarnBlast	= "Спец-предупреждение об Ударе часового (для прерывания)",
	WarnCatDied		= "Предупреждение, когда Дикий защитник погибает",
	WarnCatDiedOne	= "Предупреждение, когда у Дикого защитника остается 1 жизнь",
	timerDefender	= "Отсчет времени до возрождения Дикого защитника"
}

-------------
--  Hodir  --
-------------
L = DBM:GetModLocalization("Hodir")

L:SetGeneralLocalization{
	name = "Ходир"
}

L:SetWarningLocalization{
}

L:SetTimerLocalization{
}

L:SetOptionLocalization{
	PlaySoundOnFlashFreeze	= "Звуковой сигнал при применении $spell:61968",
	YellOnStormCloud		= "Кричать, когда на вас $spell:65133",
	SetIconOnStormCloud		= "Устанавливать метки на цели заклинания $spell:65133",
}

L:SetMiscLocalization{
	YellKill	= "Наконец-то я... свободен от его оков…",
	YellPull    = "Вы будете наказаны за это вторжение!",
	YellCloud	= "На мне Грозовая Туча!"
}

--------------
--  Thorim  --
--------------
L = DBM:GetModLocalization("Thorim")

L:SetGeneralLocalization{
	name = "Торим"
}

L:SetWarningLocalization{
}

L:SetTimerLocalization{
	TimerHardmode	= "Сложный режим"
}

L:SetOptionLocalization{
	YellOnUnbalancingStrike 	= "Дисбалансирующий удар на мне!",
	TimerHardmode				= "Отсчет времени для сложного режима",
	RangeFrame					= "Показывать окно проверки дистанции",
	AnnounceFails				= "Объявлять игроков, попавших под $spell:312897, в рейд-чат\n(требуются права лидера или помощника)",
}

L:SetMiscLocalization{
	YellPhase1	= "Незваные гости! Вы заплатите за то, что посмели вмешаться... Погодите, вы...",
	YellPhase2	= "Бесстыжие выскочки, вы решили бросить вызов мне лично? Я сокрушу вас всех!",
	YellKill	= "Придержите мечи! Я сдаюсь.",
	ChargeOn	= "Разряд молнии: %s",
	Charge		= "Попали под Разряд молнии (в этом бою): %s"
}

-------------
--  Freya  --
-------------
L = DBM:GetModLocalization("Freya")

L:SetGeneralLocalization{
	name = "Фрейя"
}

L:SetMiscLocalization{
	SpawnYell          = "Помогите мне, дети мои!",
	WaterSpirit        = "Древний дух воды",
	Snaplasher         = "Хватоплет",
	StormLasher        = "Грозовой плеточник",
	YellKill           = "Он больше не властен надо мной. Мой взор снова ясен. Благодарю вас, герои.",
	YellPull		   = "Деревья, дайте мне силы!",
	YellAdds1          = "Эонар, твоей прислужнице нужна помощь!",
	YellAdds2          = "Вас захлестнет сила стихий!",
	EmoteLGift         = "начинает расти!",
	TrashRespawnTimer  = "Возрождение монстров",
}

L:SetWarningLocalization{
	WarnSimulKill	= "Первый помощник погиб - воскрешение через ~12 сек.",
	WarnLifebinderSoon = "Скоро появится Дар Эонар!",
	EonarsGift = "Смена цели - переключитесь на Дар Эонара"
}

L:SetTimerLocalization{
	TimerSimulKill	= "Воскрешение"
}

L:SetOptionLocalization{
	YellOnRoots     = "Кричать, когда на вас $spell:312860",
	WarnSimulKill	= "Объявлять, когда первый монстр погибает",
	PlaySoundOnFury = "Звуковой сигнал, когда на вас $spell:312881",
	WarnLifebinderSoon = "Таймер появление Дара Эонара",
	TimerSimulKill	= "Отсчет времени до воскрешения монстров"
}

----------------------
--  Freya's Elders  --
----------------------
L = DBM:GetModLocalization("Freya_Elders")

L:SetGeneralLocalization{
	name = "Деревья Фрейи"
}

L:SetMiscLocalization{
	TrashRespawnTimer	= "Возрождение монстров"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	PlaySoundOnFistOfStone	= "Звуковой сигнал при Каменных кулаках",
	TrashRespawnTimer		= "Отсчет времени до возрождения монстров"
}

---------------
--  Mimiron  --
---------------
L = DBM:GetModLocalization("Mimiron")

L:SetGeneralLocalization{
	name = "Мимирон"
}

L:SetWarningLocalization{
	MagneticCore		= "Магнитное ядро у |3-1(>%s<)",
	WarningShockBlast	= "Шоковый удар - бегите",
	WarningSpinUp       = "Обстрел - бегите",
	WarnBombSpawn		= "Бомбот"
}

L:SetTimerLocalization{
	TimerHardmode	= "Сложный режим - Самоуничтожение",
	TimeToPhase2	= "Фаза 2",
	TimeToPhase3	= "Фаза 3",
	TimeToPhase4	= "Фаза 4"
}

L:SetOptionLocalization{
	YellOnblastWarn         = "Кричать, когда на вас $spell:312790",
    YellOnshellWarn         = "Кричать, когда на вас $spell:312435",
	TimeToPhase2			= "Отсчет времени для фазы 2",
	TimeToPhase3			= "Отсчет времени для фазы 3",
	TimeToPhase4			= "Отсчет времени для фазы 4",
	MagneticCore			= "Объявлять подобравших Магнитное ядро",
	HealthFramePhase4		= "Отображать индикатор здоровья в фазе 4",
	TimerMine				="Отображение таймера появления мин",
	AutoChangeLootToFFA		= "Смена режима добычи на Каждый за себя в фазе 3",
	WarnBombSpawn			= "Предупреждение о Бомботах",
	TimerHardmode			= "Отсчет времени для сложного режима",
	PlaySoundOnShockBlast	= "Звуковой сигнал при $spell:312792",
	PlaySoundOnDarkGlare	= "Звуковой сигнал при $spell:312794",
	ShockBlastWarningInP1	= "Спец-предупреждение для $spell:312792 в фазе 1",
	ShockBlastWarningInP4	= "Спец-предупреждение для $spell:312792 в фазе 4",
	RangeFrame				= "Показывать окно проверки дистанции в фазе 1 (6 м)"
}

L:SetMiscLocalization{
	MobPhase1		= "Левиафан II",
	MobPhase2		= "VX-001",
	MobPhase3		= "Воздушное судно",
	YellPull		= "У нас мало времени, друзья! Вы поможете испытать новейшее и величайшее из моих изобретений. И учтите: после того, что вы натворили с XT-002, отказываться просто некрасиво.",
	YellHardPull	= "Так, зачем вы это сделали? Разве вы не видели надпись \"НЕ НАЖИМАЙТЕ ЭТУ КНОПКУ!\"? Ну как мы сумеем завершить испытания при включенном механизме самоликвидации, а?",
	YellPhase2		= "ПРЕВОСХОДНО! Просто восхитительный результат! Целостность обшивки – 98,9 процента! Почти что ни царапинки! Продолжаем!",
	YellPhase3		= "Спасибо, друзья! Благодаря вам я получил ценнейшие сведения! Так, а куда же я дел... – ах, вот куда.",
	YellPhase4		= "Фаза предварительной проверки завершена. Пора начать главный тест!",
	YellKilled		= "Очевидно, я совершил небольшую ошибку в расчетах. Пленный злодей затуманил мой разум и заставил меня отклониться от инструкций. Сейчас все системы в норме. Конец связи.",
	LootMsg			= "([^%s]+).*Hitem:(%d+)"
}

---------------------
--  General Vezax  --
---------------------
L = DBM:GetModLocalization("GeneralVezax")

L:SetGeneralLocalization{
	name = "Генерал Везакс"
}

L:SetTimerLocalization{
	hardmodeSpawn = "Саронитовый враг"
}

L:SetWarningLocalization{
	SpecialWarningShadowCrash		= "Темное сокрушение на вас - отбегите",
	SpecialWarningShadowCrashNear	= "Темное сокрушение около вас - остерегайтесь",
	SpecialWarningLLNear			= "Вытягивание жизни на |3-5(%s) около вас"
}

L:SetOptionLocalization{
	SetIconOnShadowCrash			= "Устанавливать метки на цели заклинания $spell:312978",
	SetIconOnLifeLeach				= "Устанавливать метки на цели заклинания $spell:312974",
	SpecialWarningShadowCrash		= "Спец-предупреждение для $spell:312978\n(должен быть в цели или фокусе хотя бы у одного члена рейда)",
	SpecialWarningShadowCrashNear	= "Спец-предупреждение о $spell:312978 около вас",
	SpecialWarningLLNear			= "Спец-предупреждение о $spell:312974 около вас",
	YellOnShadowCrash				= "Кричать, когда на вас $spell:312978",
	hardmodeSpawn					= "Отсчет времени до появления Саронитового врага (сложный режим)",
	CrashArrow						= "Показывать стрелку, когда $spell:312978 около вас",
	BypassLatencyCheck				= "Отключить синхр-цию для $spell:312978\n(используйте только в случае возникновения проблем)"
}

L:SetMiscLocalization{
	EmoteSaroniteVapors	= "Облако саронитовых паров образовывается поблизости!",
	YellPull            = "Ваша смерть возвестит новую эру страданий!",
	YellLeech			= "Вытягивание жизни на мне!",
	YellCrash			= "Темное сокрушение на мне!"
}

------------------
--  Yogg-Saron  --
------------------
L = DBM:GetModLocalization("YoggSaron")

L:SetGeneralLocalization{
	name = "Йогг-Сарон"
}

L:SetMiscLocalization{
	YellPull 			= "Скоро мы сразимся с главарем этих извергов! Обратите гнев и ненависть против его прислужников!",
	YellPhase2	 		= "Я – это сон наяву.",
	Sara 				= "Сара",
	Mozg				= "Мозг Йог-Сарона",
	HevTentacle				= "Тяжёлое щупальце",
	WarningYellSqueeze	= "Выдавливание на мне! Помогите!"
}

L:SetWarningLocalization{
	WarningGuardianSpawned 			= "Страж %d",
	WarningCrusherTentacleSpawned	= "Тяжёлое щупальце",
	WarningSanity 					= "Осталось %d Здравомыслия",
	SpecWarnSanity 					= "Осталось %d Здравомыслия",
	SpecWarnGuardianLow				= "Прекратите атаковать этого Стража",
	SpecWarnMadnessOutNow			= "Доведение до помешательства заканчивается - выбегайте",
	WarnBrainPortalSoon				= "Провал Безумия через 3 секунды",
	SpecWarnFervor					= "Рвение Сары на вас",
	SpecWarnFervorCast				= "Рвение Сары накладывается на вас",
	specWarnBrainPortalSoon			= "Скоро Провал Безумия"
}

L:SetTimerLocalization{
	NextPortal	= "Провал Безумия",
	NextPortal2 = "Перезарядка Портала"
}

L:SetOptionLocalization{
	WarningGuardianSpawned			= "Предупреждение о появлении Стража",
	WarningCrusherTentacleSpawned	= "Предупреждение о появлении Тяжелого щупальца",
	WarningSanity					= "Предупреждение, когда у вас мало $spell:63050",
	SpecWarnSanity					= "Спец-предупреждение, когда у вас очень мало $spell:63050",
	SpecWarnGuardianLow				= "Спец-предупреждение, когда у Стража (в фазе 1) мало здоровья (для бойцов)",
	WarnBrainPortalSoon				= "Предупреждать заранее о Провале Безумия",
	SpecWarnMadnessOutNow			= "Спец-предупреждение незадолго до окончания $spell:313003",
	SpecWarnFervorCast				= "Спец-предупреждение, когда на вас накладывается $spell:312989\n(должна быть в цели или фокусе хотя бы у одного члена рейда)",
	specWarnBrainPortalSoon			= "Спец-предупреждение о следующем Провале Безумия",
	ShowSaraHealth					= "Показывает Здоровье Сары на 1 + Мозга на 2 (Сара на 1 фазе должна быть в фокусе хоть у 1 члена группы)",
	NextPortal						= "Отсчёт времени до следующего Провала Безумия",
	MaladyArrow						= "Показывать стрелку, когда $spell:313029 около вас",
}

