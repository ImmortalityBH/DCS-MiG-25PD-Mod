
-- local start_custom_command = 10000
-- local __count_custom = start_custom_command - 1
-- local function __custom_counter()
	-- __count_custom = __count_custom + 1
	-- return __count_custom
-- end

Keys =
{
	PlanePickleOn	                = 350,
	PlanePickleOff	                = 351,
	SwitchMasterArm					= 283,
    PlaneChgTargetNext              = 102,    -- iCommandPlaneChangeTarget
    PlaneModeNAV                    = 105,
    PlaneModeBVR                    = 106,
    PlaneModeVS                     = 107,
    PlaneModeBore                   = 108,
    PlaneModeGround                 = 111,

	PlaneFonar						= 71,
	
	PlaneAirBrake                   = 73,
	PlaneAirBrakeOn                 = 147,
	PlaneAirBrakeOff                = 148,	
	
	PlaneParachute = 76,					-- Парашют
	
	PlaneFlaps                      = 72,
	PlaneFlapsOn                    = 145, -- Fully down
	PlaneFlapsOff                   = 146, -- Fully up
    	
	PlaneGear                       = 68,						-- Шасси
	PlaneGearUp	                    = 430,
	PlaneGearDown                   = 431,
		
	LeftEngineStart = 311,			-- Запуск левого двигателя
	RightEngineStart = 312,			-- Запуск правого двигателя
	LeftEngineStop = 313,				-- Выключение левого двигателя
	RightEngineStop = 314,			-- Выключение правого двигателя
	EnginesStart = 309,				-- Запуск двигателей
	EnginesStop = 310,			-- Выключение двигателей

	PowerOnOff = 315,					-- Включение/выключение электропитания
	
	PlaneWheelBrakesOn = 74,				-- Включение тормоза колес
	PlaneWheelBrakesOff = 75,				-- Выключение тормоза колес
    --[[   -- Do not use the built-in altimeter adjustments, they have internal SSM affects on the altimeter that we cannot limit
     AltimeterPressureIncrease = 316,  
     AltimeterPressureDecrease = 317,
     AltimeterPressureStop = 318, ]]--

    PlaneLightsOnOff                = 175,
    PlaneHeadlightOnOff             = 328,

    PowerGeneratorLeft              = 711,
    PowerGeneratorRight             = 712,

    BatteryPower                    = 1073,   -- iCommandBatteryPower

    PlaneChgTargetPrev              = 1315,   -- iCommandPlaneUFC_STEER_DOWN
	--]]
	-- custom commands start here
	PlaneSalvoOnOff							= 81,
	PlaneChangeWeapon						= 101,
	PlaneChangeWaypoint						= 102,
	PlaneZoomIn								= 103,
	PlaneZoomOut							= 104,
	PlaneBrightnessILS						= 156,
	PlaneLightsOnOff						= 175,
	PlaneDropSnarOnce						= 176,
	
		
	--[[ WARNING SYSTEM ]]--
	PlaneMasterCautionOff					= 379,
	
	
	PlaneDropSnarOnceOff					= 536,
	
	--[[ WARNING SYSTEM ]]--
	PlaneMasterCaution						= 252,
	
	PlaneScalesReject						= 253,
	PlaneBettyRepeat						= 254,
	ChangeGunRateOfFire						= 280,
	ChangeRippleQuantity					= 281,
	ChangeRippleInterval					= 282,
	SwitchMasterArm							= 283,
	ChangeReleaseMode						= 284,
	ChangeRippleIntervalDown				= 308,
	PlaneLaunchPermissionOverride			= 349,


	--[[ WARNING SYSTEM ]]--
	PlaneMasterCautionOff					= 379,
	
	PlaneLaserRangerOnOff					= 392,
	PlaneGearUp								= 430,
	PlaneGearDown							= 431,
	PlaneNightVisionGogglesOnOff			= 438,

	--from iCommand.h
	PlaneSAUAutomatic = 58,				-- Стабилизация углов
	PlaneSAUHBarometric = 59,			-- Стабилизация абсолютной высоты
	PlaneSAUHRadio = 60,			-- Полет с огибанием рельефа
	PlaneSAUHorizon = 61,				-- Приведение к горизонту
	PlaneAutopilot = 62,					-- Автопилот
	PlaneAUTOnOff = 63,					-- Переключение режима АУТ
	PlaneAUTIncrease = 64,				-- Увеличить заданную скорость
	PlaneAUTDecrease = 65,				-- Уменьшить заданную скорость
	PlaneGear = 68,						-- Шасси
	PlaneHook = 69,						-- Гак
	PlanePackWing = 70,				-- Складывание крыльев
	PlaneFuelOn = 79,					-- Включение слива топлива или заправки
	PlaneFuelOff = 80,				-- Выключение слива топлива или заправки
	PlaneSalvoOnOff = 81,				-- Залповый режим вкл/выкл
	PlaneJettisonWeapons = 82,			-- Сброс оружия парами
	PlaneEject = 83,						-- Катапультирование
	PlaneFire = 84,						-- Гашетка
	PlaneFireOff = 85,					-- Гашетку отпустили
	PlaneRadarOnOff = 86,				-- Включение / выключение радара
	PlaneEOSOnOff = 87,					-- Включение / выключение ОЛС
	PlaneRadarLeft = 88,					-- Поворот антенны РЛС влево
	PlaneRadarRight = 89,				-- Поворот антенны РЛС вправо
	PlaneRadarUp = 90,				-- Поворот антенны РЛС вверх
	PlaneRadarDown = 91,					-- Поворот антенны РЛС вниз
	PlaneRadarCenter = 92,				-- Возврат антенны РЛС в центр
	PlaneTrimLeft = 93,					-- Триммер влево
	PlaneTrimRight = 94,					-- Триммер вправо
	PlaneTrimUp = 95,					-- Триммер вверх
	PlaneTrimDown = 96,					-- Триммер вниз
	PlaneTrimCancel = 97,				-- Сброс триммера
	PlaneTrimLeftRudder = 98,			-- Триммер левой педали
	PlaneTrimRightRudder = 99,			-- Триммер правой педали
	PlaneChangeLock = 100,			-- Переключение подрежимов / захват
	PlaneChangeWeapon = 101,				-- Переключение подрежимов / перебор оружия
	PlaneChangeTarget = 102,				-- Перебор целей
	PlaneZoomIn = 103,					-- Изменение масштаба МФД +
	PlaneZoomOut = 104,					-- Изменение масштаба МФД -
	PlaneModeNAV = 105,					-- Переход в режим навигации
	PlaneModeBVR = 106,					-- Переход в режим дальнего воздушного боя
	PlaneModeVS = 107,					-- Переход в режим ближнего воздушного боя (полоса)
	PlaneModeBore = 108,					-- Переход в режим ближнего воздушного боя (кольцо)
	PlaneModeHelmet = 109,				-- Переход в режим ближнего воздушного боя (шлем)
	PlaneModeFI0 = 110,				-- Переход в режим FI0
	PlaneModeGround = 111,				-- Переход в режим атаки наземных целей
	PlaneModeGrid = 112,					-- Переход в режим "сетка"
	PlaneModeCannon = 113,				-- Включение/выключение пушки
	PlaneDoAndHome = 114,					-- Выполни задание и вернись на базу
	PlaneDoAndBack = 115,					-- Выполни задание и вернись ко мне
	PlaneFormation = 116,					-- Идти рассеянным/плотным строем
	PlaneJoinUp    = 117,					-- Собраться
	PlaneAttackMyTarget = 118,			-- Атакуй мою цель
	PlaneCoverMySix = 119,				-- Прикрой меня сзади
	PlaneShipTakeOff = 120,			-- Хочу взлететь с авианосца

	LandDetailsIncrease = 137,			-- Отладочное увеличение детализации (Non-simulation Action)
	LandDetailsDecrease = 138,			-- Отладочное уменьшение детализации (Non-simulation Action)
	SelecterLeft = 139,				    -- движение маркера захвата целей на HUD влево
	SelecterRight = 140,			-- вправо
	SelecterUp  =141,					    -- вверх
	SelecterDown = 142,					-- вниз
	PlaneResetMasterWarning = 144,

	BrightnessILS = 156,				-- Яркость ILS
	PlaneAUTIncreaseLeft = 161,
	PlaneAUTDecreaseLeft = 162,
	PlaneAUTIncreaseRight = 163,
	PlaneAUTDecreaseRight = 164,
	PlaneLightsOnOff = 175,			-- Вкл/выкл огни на своем самолете
	PlaneDropSnarOnce = 176,			-- Однократный сброс ловушек
	PlaneJettisonFuelTanks = 178,		-- Сброс топливных баков
	PlaneWingmenCommand = 179,		-- Вызов панели команд ведомым
	PlaneDown = 186,					-- Тонкое управление автопилотом по высоте
	PlaneUp = 187,
	PlaneLeft = 188,
	PlaneRight = 189,
    PlaneUpStart = 193,
    PlaneUpStop = 194,
    PlaneDownStart = 195,
    PlaneDownStop = 196,
    PlaneLeftStart = 197,
    PlaneLeftStop = 198,
    PlaneRightStart = 199,
    PlaneRightStop = 200,
    PlaneLeftRudderStart = 201,
    PlaneLeftRudderStop = 202,
    PlaneRightRudderStart = 203,
    PlaneRightRudderStop = 204,
    PlaneTrimStop = 215,
    SelecterUpRight = 226,
    SelecterDownRight = 227,
    SelecterDownLeft = 228,
    SelecterUpLeft = 229,
    SelecterStop = 230,
    PlaneRadarUpRight = 231,
    PlaneRadarDownRight = 232,
    PlaneRadarDownLeft = 233,
    PlaneRadarUpLeft = 234,
    PlaneRadarStop = 235,
	PlaneMasterCaution = 252,				-- Аналог "Экран вызов" (МиГ-29), кнопка-лампа ЦСО (Ка-50)
	AllMissilePadlock = 259,
	DecreaseRadarScanArea = 262,
    IncreaseRadarScanArea = 263,

    EasyRadarOnOff = 271,

	SwitchMasterArm = 283,
	ChangeReleaseMode = 284,
    PlaneRadarChangeMode = 285,
	ChangeRWRMode = 286,
	FlightClockReset = 288,
	PlaneCockpitIllumination = 300,
	ChangeRippleIntervalDown = 308,		-- Изменение интервала сброса бомб в залпе для А10 в обратном направлении

	AltimeterPressureIncrease = 316,	-- Увеличение давления на ВД
	AltimeterPressureDecrease = 317,	-- Уменьшение давления на ВД
	AltimeterPressureStop = 318,
	
	PlaneLockPadlock = 329,				-- Следить за ближайшим объектом
	PlaneUnlockPadlock = 330,		-- Бросить следить за объектом

	PlaneLaunchPermissionOverride = 349,	-- Снятие блокировки с оружия
	
	PlaneCancelWeaponsDelivery = 378,		-- сброс режима работы авионики (Ка - 50)
	PlaneMasterCautionOff = 379,
	PlaneStabTangBank = 386,			-- Стабилизация тангажа и крена
	PlaneStabHbarBank = 387,			-- Стабилизация Hbar и крена
	PlaneStabHorizon = 388,			-- Стабилизация тангажа и крена
	PlaneStabHbar = 389,				-- Стабилизация Hbar
	PlaneStabHrad = 390,				-- Стабилизация Hrad

	PlaneLaserRangerOnOff = 392, 		-- Вкл/Выкл лазерный дальномер
	PlaneNightTVOnOff = 393,         -- Вкл/Выкл ночной канал телевизионной системы (IR or LLTV) 
	PlaneChangeRadarPRF = 394,       -- Изменить частоту повторения импульсов радара
	PlaneStabCancel = 408,			-- Сброс всех режимов стабилизации и автопилота
	PlaneThreatWarnSoundVolumeDown = 409,	-- Уменьшение громкости звуковых сигналов СПО
	PlaneThreatWarnSoundVolumeUp = 410,	-- Увеличение громкости звуковых сигналов СПО
	PlaneIncreaseBase_Distance = 412,     -- Увеличение базы цели
	PlaneDecreaseBase_Distance = 413,     -- Уменьшение базы цели
	PlaneStopBase_Distance = 414,
	PlaneAutopilotOverrideOn =427,
	PlaneAutopilotOverrideOff = 428,
	PlaneRouteAutopilot = 429,
	PlaneGearUp = 430,
	PlaneGearDown = 431,
	ViewNightVisionGogglesOn = 438,
	PlaneDesignate_CageOn = 439,
	PlaneDesignate_CageOff = 440,
	PlaneDesignate_CageOn_vertical = 441,
	PlaneDesignate_CageOn_horizontal = 442,

	--Data Link Panel PRTs (Пульт Режимов Целеуказания ПРЦ)
	PlaneDLK_Target1 = 443,
	PlaneDLK_Target2 = 444,
	PlaneDLK_Target3 = 445,
	PlaneDLK_RefPoint = 446,
	PlaneDLK_Wingman1 = 447,
	PlaneDLK_Wingman2 = 448,
	PlaneDLK_Wingman3 = 449,
	PlaneDLK_Wingman4 = 450,
	PlaneDLK_All = 451,
	PlaneDLK_Erase = 452,
	PlaneDLK_Ingress = 453,
	PlaneDLK_SendMemory = 454,

	-- NAV panel controls (Ка-50 - щиток ПВИ)
	PlaneNavChangePanelModeRight = 455,
	PlaneNavChangePanelModeLeft = 456,
	PlaneNavSetFixtakingMode = 457,
	PlaneNav_DLK_OnOff = 458,
	PlaneNav_PB1 = 459,
	PlaneNav_PB2 = 460,
	PlaneNav_PB3 = 461,
	PlaneNav_PB4 = 462,
	PlaneNav_PB5 = 463,
	PlaneNav_PB6 = 464,
	PlaneNav_PB7 = 465,
	PlaneNav_PB8 = 466,
	PlaneNav_PB9 = 467,
	PlaneNav_PB0 = 468,
	PlaneNav_Steerpoints = 469,
	PlaneNav_INU_realign = 470,
	PlaneNav_POS_corrMode = 471,
	PlaneNav_INU_precise_align = 472,
	PlaneNav_Airfields =473,
	PlaneNav_INU_normal_align  = 474,
	PlaneNav_Targets = 475,
	PlaneNav_Enter = 476,
	PlaneNav_Cancel = 477,
	PlaneNav_POS_init = 478,
	PlaneNav_SelfCoord = 479,
	PlaneNav_CourseTimeRange = 480,
	PlaneNav_Wind = 481,
	PlaneNav_THeadingTimeRangeF = 482,
	PlaneNav_BearingRangeT = 483,

	PlaneCockpitIlluminationPanels = 493,
	PlaneCockpitIlluminationGauges = 494,

	Plane_RouteMode = 506,
	Plane_DescentMode = 507,
	Plane_DescentModeOff = 508,
	AutopilotEmergOFF = 538,
--end

-- analog commands
	PlaneRadarHorizontal 	   = 2025,
	PlaneRadarVertical 		   = 2026,
	PlaneRadarHorizontalAbs    = 2027,
	PlaneRadarVerticalAbs 	   = 2028,
	PlaneMFDZoom 		       = 2029,
	PlaneMFDZoomAbs			   = 2030,
	PlaneSelecterHorizontal    = 2031,
	PlaneSelecterVertical 	   = 2032,
	PlaneSelecterHorizontalAbs = 2033,
	PlaneSelecterVerticalAbs   = 2034,
	PlaneBase_Distance 		   = 2040,
	PlaneBase_DistanceAbs 	   = 2041,

}

start_command = 3000
-- local __count = start_command-1
-- local function __counter()
	-- __count = __count + 1
	-- return __count
-- end

device_commands =
{
	Button_1  = start_command + 1;
	Button_2  = start_command + 2;
	Button_3  = start_command + 3;
	Button_4  = start_command + 4;
	Button_5  = start_command + 5;
	Button_6  = start_command + 6;
	Button_7  = start_command + 7;
	Button_8  = start_command + 8;
	Button_9  = start_command + 9;
	Button_10 = start_command + 10;
	Button_11 = start_command + 11;
	Button_12 = start_command + 12;
	Button_13 = start_command + 13;
	Button_14 = start_command + 14;
	Button_15 = start_command + 15;
	Button_16 = start_command + 16;
	Button_17 = start_command + 17;
	Button_18 = start_command + 18;
	Button_19 = start_command + 19;
	Button_20 = start_command + 20;
	Button_21 = start_command + 21;
	Button_22 = start_command + 22;
	Button_23 = start_command + 23;
	Button_24 = start_command + 24;
	Button_25 = start_command + 25;
	Button_26 = start_command + 26;
	Button_27 = start_command + 27;
	Button_28 = start_command + 28;
	Button_29 = start_command + 29;
	Button_30 = start_command + 30;
	Button_31 = start_command + 31;
	Button_32 = start_command + 32;
	Button_33 = start_command + 33;
	Button_34 = start_command + 34;
	Button_35 = start_command + 35;
	Button_36 = start_command + 36;
	Button_37 = start_command + 37;
	Button_38 = start_command + 38;
	Button_39 = start_command + 39;
	Button_40 = start_command + 40;
	Button_41 = start_command + 41;
	Button_42 = start_command + 42;
	Button_43 = start_command + 43;
	Button_44 = start_command + 44;
	Button_45 = start_command + 45;
	Button_46 = start_command + 46;
	Button_47 = start_command + 47;
	Button_48 = start_command + 48;
	Button_49 = start_command + 49;
	Button_50 = start_command + 50;
	Button_51 = start_command + 51;
	Button_52 = start_command + 52;
	Button_53 = start_command + 53;
	Button_54 = start_command + 54;
	Button_55 = start_command + 55;
	Button_56 = start_command + 56;
	Button_57 = start_command + 57;
	Button_58 = start_command + 58;
	Button_59 = start_command + 59;
	Button_60 = start_command + 60;
	Button_61 = start_command + 61;
	Button_62 = start_command + 62;
	Button_63 = start_command + 63;
	Button_64 = start_command + 64;
	Button_65 = start_command + 65;
	Button_66 = start_command + 66;
	Button_67 = start_command + 67;
	Button_68 = start_command + 68;
	Button_69 = start_command + 69;
	Button_70 = start_command + 70;
	Button_81 = start_command + 81;
	Button_82 = start_command + 82;
	Button_83 = start_command + 83;
	Button_84 = start_command + 84;
	Button_85 = start_command + 85;
	Button_86 = start_command + 86;
	Button_87 = start_command + 87;
	Button_88 = start_command + 88;
	Button_89 = start_command + 89;
	Button_90 = start_command + 90;
	Button_91 = start_command + 91;
	Button_92 = start_command + 92;
	Button_93 = start_command + 93;
	Button_94 = start_command + 94;
	Button_95 = start_command + 95;
	Button_96 = start_command + 96;
	Button_97 = start_command + 97;
	Button_98 = start_command + 98;
	Button_99 = start_command + 99;
	Button_100 = start_command + 100;
}
