-----------------------------------------
-- DECLARING CENTERLINE FUEL TANK TYPE --
-----------------------------------------
-- alternatively:
-- declare_loadout( {} )

local R_40R = {
	category = CAT_AIR_TO_AIR,
	name = "R-40R",
	user_name = _("R-40R"),
	wsTypeOfWeapon = {},
	Escort = 1,
	Head_Type = 6, -- semi-active-radar semi-active radar (SAR) - radio light
	sigma = {5.6, 5, 5.6}, -- max target deviation in m
	M = 475.0, --mass maybe in kg
	H_max = 28000.0, --max height in m?
	H_min = 20.0, -- min height in m?
	Diam = 355.0, --diameter in mm?
	Cx_pil = 4,
	Dx_max = 15000.0, -- Maximum launch range at low altitude in m
	D_min = 700.0, -- minimum launch range at low altitude
	Head_Form = 1, -- false - hemispherical head shape,
	Life_Time = 75.0, -- lifetime in seconds
	Nr_max = 12, -- Maximum overload during u
	v_min = 140.0, -- minimum speed
	v_mid = 600.0, -- average speed knots
	Mach_max = 3.8, -- max mach 
	t_b = 0.0, -- engine start time
	t_acc = 8.0,
	t_marsh = 0.0,
	Range_max = 40000.0, -- max range
	H_min_t = 20.0,
	Fi_start = 0.3,
	Fi_rak = 3.14152,
	Fi_excort = 0.87,
	Fi_search = 0.1,
	OmViz_max = 0.35,
			warhead = enhanced_a2a_warhead(60.0),
			exhaust = { 1 ,1 , 1, 1 },
-- X = front, Y = up, Z = right
	X_back = -2.276,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.081,
	KillDistance = 7.0, -- in meters
	cmm_k0 = 0.1,
	shape_table_data = {
		{
			name = "R-40R",
			file = "R40R",
			life = 1,
			fire = {0, 1},
			username = "R-40R",
			index = WSTYPE_PLACEHOLDER,
		},
	},
	ModelData = { 
		58, -- model params count
		1.1, -- characteristic square
		
		-- parameters of the dependence CX
		0.12, -- Cx_k0 plank Cx0 at subsonic ( M << 1)
		0.14, -- Cx_k1 height of the peak of the wave crisis
		0.02, -- Cx_k2 steepness of the front on the approach to the wave crisis
		0.012, -- Cx_k3 plank Cx0 at supersonic ( M >> 1)
		2.0, -- Cx_k4 steepness of the decline behind the wave crisis
		1.4, -- polar dropoff coefficient (proportional to sqrt (M^2-1))
		
		-- dependence parameters Cy
		0.9, -- Cy_k0 plank Su0 at subsonic ( M << 1)
		0.8, -- Cy_k1 plank Cy0 at supersonic ( M >> 1)
		1.38, -- Cy_k2 slope of the decline (front) behind the wave crisis
		
		0.23, -- 7 Alfa_max maximum balancing angle, radians
		0.0, --angular velocity created by the moment of gas rudders
		
		-- Engine data. Time, fuel flow, thrust.
		-- t_statr t_b t_accel t_march t_inertial t_break t_end -- Stage
		-1.0, -1.0, 6.0, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
		0.0, 0.0, 25.0, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(second mass flow of fuel kg/h)
		0.0, 0.0, 50000.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
		
		1. 0e9, -- self-destruct timer, sec
		120.0, -- power system operation time, sec
		0, -- absolute self-destruct height, m
		1.0, -- control activation delay time (departure maneuver, safety), sec
		1e9, -- range to the target at the time of launch, when exceeding which the missile performs the "hill" maneuver, m
		1e9, -- range to the target at which the "hill" maneuver ends and the missile switches to pure proportional navigation (must be greater than or equal to the previous parameter), m
		0.0, -- sine of the elevation angle of the slide set trajectory
		30.0, -- longitudinal acceleration arming
		0.0, -- module speed soobshenii ejection device, expelling charge, etc.
		1.19--harakteristika system ACS-ROCKET cal filter of the second order K0
		1.0, -- charakteristika system ACS-ROCKET cal filter of the second order K1
		2.0--harakteristika system ACS-ROCKET, the bandwidth of the control loop
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		-- DLZ. Data for calculation of ranges of start-up (indication on the sight)
		1.0,
		1.0,
		1.0,
		0.2,
		0.6,
		1.4,
		-3.0,
		0.5,
	},
} 
declare_weapon(R_40R)
declare_loadout({
	category = CAT_AIR_TO_AIR,
	CLSID = "{R40R}",
	Picture = "R40R.png",
	wsTypeOfWeapon = R_40R.wsTypeOfWeapon,
	displayName = _("R-40R"),
	attribute = {4, 4, 32, WS_PLACEHOLDER},
	Count = 1,
	Weight = 475.0,
	Elements = {
		{
			ShapeName = "R40R",
			Position = {0, 0, 0},
		}, 
	}, -- end of elements
})

local R_40T = {
	category = CAT_AIR_TO_AIR,
	name = "R-40T",
	user_name = _("R-40T"),
	wsTypeOfWeapon = {},
	Escort = 0,
	Head_Type = 1, -- thermal IR (infrared finder)
	sigma = {5, 5, 5}, -- max target deviation in m
	M = 475.0, --mass maybe in kg
	H_max = 28000.0, --max height in m?
	H_min = 20.0, -- min height in m?
	Diam = 355.0, --diameter in mm?
	Cx_pil = 4,
	Dx_max = 7000.0, -- Maximum launch range at low altitude in m
	D_min = 700.0, -- minimum launch range at low altitude
	Head_Form = 0, -- false - hemispherical head shape,
	Life_Time = 65.0, -- life time in seconds
	Nr_max = 12, -- Maximum overload during u
	v_min = 140.0, -- minimum speed
	v_mid = 600.0, -- average speed knots
	Mach_max = 3.8, -- max mach
	t_b = 0.0, -- engine start time
	t_acc = 8.0,
	t_marsh = 0.0,
	Range_max = 32000.0, -- max range in meters
	H_min_t = 20.0,
	Fi_start = 0.3,
	Fi_rak = 3.14152,
	Fi_excort = 0.87,
	Fi_search = 0.09,
	OmViz_max = 0.35,
	warhead = enhanced_a2a_warhead(60.0), -- warhead weight in kg?
	exhaust = { 1 ,1 , 1, 1 },
-- X = front, Y = up, Z = right
	X_back = -2.276,
	Y_back = 0,
	Z_back = 0.0,
	Reflection = 0.081,
	KillDistance = 7.0, -- distance in meters
	cmm_k0 = 0.1,
	SeekerSensitivityDistance = 15000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.
	shape_table_data = {
		{
			name = "R-40T",
			file = "R40T",
			life = 1,
			fire = {0, 1},
			username = "R-40T",
			index = WSTYPE_PLACEHOLDER,
		},
	},
	ModelData = { 
		58, -- model params count
		1.1, -- characteristic square
		
		-- parameters of the dependence CX
		0.15, -- Cx_k0 plank Cx0 at subsonic ( M << 1)
		0.14, -- Cx_k1 height of the peak of the wave crisis
		0.02, -- Cx_k2 steepness of the front on the approach to the wave crisis
		0.017, -- Cx_k3 plank Cx0 at supersonic ( M >> 1)
		2.0, -- Cx_k4 slope of the decline behind the wave crisis
		1.4, -- coefficient of the polar drop (proportional to sqrt (M^2-1))
		
		-- parameters of the dependence Cy
		0.9, -- Cy_k0 plank Su0 at subsonic ( M << 1)
		0.8, -- Cy_k1 plank Cy0 at supersonic ( M >> 1)
		1.38, -- Cy_k2 slope of the decline (front) behind the wave crisis
		
		0.23, -- 7 Alfa_max maximum balancing angle, radians
		0.0, --angular velocity created by the moment of gas rudders
		
		-- Engine data. Time, fuel flow, thrust.
		-- t_statr t_b t_accel t_march t_inertial t_break t_end -- Stage
		-1.0, -1.0, 6.0, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
		0.0, 0.0, 25.0, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(second mass flow of fuel kg/h)
		0.0, 0.0, 50000.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
		
		1. 0e9, -- self-destruct timer, sec
		120.0, -- power system operation time, sec
		0, -- absolute self-destruct height, m
		1.0, -- control activation delay time (departure maneuver, safety), sec
		1e9, -- range to the target at the time of launch, when exceeding which the missile performs the "hill" maneuver, m
		1e9, -- range to the target at which the "hill" maneuver ends and the missile switches to pure proportional navigation (must be greater than or equal to the previous parameter), m
		0.0, -- sine of the elevation angle of the slide set trajectory
		30.0, -- longitudinal acceleration arming
		0.0, -- module speed soobshenii ejection device, expelling charge, etc.
		1.19--harakteristika system ACS-ROCKET cal filter of the second order K0
		1.0, -- charakteristika system ACS-ROCKET cal filter of the second order K1
		2.0--harakteristika system ACS-ROCKET, the bandwidth of the control loop
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		-- DLZ. Data for calculation of ranges of start-up (indication on the sight)
		1.0,
		1.0,
		1.0,
		0.2,
		0.6,
		1.4,
		-3.0,
		0.5,
	},
} 
declare_weapon(R_40T)
declare_loadout({
	category = CAT_AIR_TO_AIR,
	CLSID = "{R40T}",
	Picture = "R40R.png",
	wsTypeOfWeapon = R_40T.wsTypeOfWeapon,
	displayName = _("R-40T"),
	attribute = {4, 4, 32, WS_PLACEHOLDER},
	Count = 1,
	Weight = 475.0,
	Elements = {
		{
			ShapeName = "R40T",
			Position = {0, 0, 0},
		}, 
	}, -- end of elements
})
-- //type of GOS homing head:
-- const int InfraredSeeker = 1; / / thermal IR (infrared finder)
-- const int ActiveRadar = 2; / / active-radar (active radar (AR) (+ins))
-- const int AntiRadar = 3; / / antiradar (passive radar +ins)
-- const int Laserhooming = 4; / / laser illumination (+ins)
-- const int Autopilot = 5; / / Autonomous (ins + map, GPS, TV, IIR...)
-- constant int SemiActiveRadar = 6; / / semi-active-radar semi-active radar (SAR) - radio light
-- const int SemiAutoAT = 7; / / semi-automatic control from the platform for ATGM, fly to wopoint, wopoint coordinates are changed by the platform.

-- struct WEAPONS_API Rocket_Const // Rocket constants and settings for control laws.
-- // Characteristics of the missile
-- unsigned char Name_; // name of the rocket
-- int Escort_; / / escort: 0-No, 1-La launch, 2-other La, 3-C ground
-- int Head_Type_; / / type of homing head (GOS) (CM above)
-- Sigma = {x, y, z}, maximum aiming error in meters, in target coordinates. X-longitudinal axis of the target, y-axis virtualna purpose, Z - axis, transverse target
-- float M_; / / gross weight in kg
-- float H_max_; / / maximum flight altitude.
-- float H_min_; / / minimum flight height.
-- float Diam_; / / case Diameter in mm
-- int Cx_pil; / / Cx as suspension
-- float D_max_; / / maximum launch range at low altitude
-- float D_min_; / / minimum launch range
-- bool Head_Form_;/ / false - hemispherical head shape,
-- //True-animate (~conic)
-- float Life_time;// lifetime (self-destruct timer), sec
-- double Nr_max_; / / Maximum overload during u
--turns -- float v_min_; / / Minimum speed.
-- float v_mid_; / / Average speed
-- float Mach_max_; / / Maximum Mach number.
-- float t_b_; / / engine start time
-- t_acc_ float; // time of operation of the accelerator
-- float t_marsh_; / / operating time in marching mode
-- float Range_max_;/ / maximum launch range at maximum altitude
-- float H_min_t_; / / minimum height of the target above the terrain, m.
-- float Fi_start_; / / angle of tracking and sighting at launch
-- float Fi_rak_; / / acceptable angle of view of the target (rad)
-- float Fi_excort_; / / angle of tracking (sight) of the target by the missile.
-- float Fi_search_;// limit angle of free search
-- float OmViz_max_;// maximum line-of-sight speed
-- float Damage_;/ / damage caused by a direct hit
-- / * int Engine_Type_; / / engine type: 1-solid fuel;
-- // 2 - Liquid Rocket engine(RD) (LRE);
-- // 3 - Ramjet air RD ;
-- // 4 - accelerator-1 + LRE.
-- // 5 - turbojet
-- // 6 - turbojet + accelerator
-- int Stage_; / / number of steps.* /
-- float X_back_; / / coordinates of the nozzle center in the rocket axes
-- y_back float_;
-- z_back float_;
-- float X_back_acc_; / / coordinates of the accelerator nozzle center in the rocket axes
-- float Y_back_acc_;
-- float Z_back_acc_;
-- float reflection; / / effective radio reflection surface, square meters

-- //Kill distances - this distance is used to start the fuse
-- double the distance of murder;

-- // These are warheads used to simulate explosions
-- // Due to the blocksim architecture, we have to use two schemes -
-- //one for the server object (which actually does damage), and the other for
-- //client object (which does not cause any damage)

-- Instantaneous angle of view of missiles:
-- IR GOS + - 1 degree

--[[local centerline_ft =  {
	category        = CAT_FUEL_TANKS,
	CLSID           = "{Centerline_FT_5300L}",
	attribute       =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPEPLACEHOLDER},
	Picture         = "fueltank.png",
	displayName     = _("Centerline Fuel Tank"),
	Weight_Empty    = 50, --kg
	Weight          = 5300, --kg
	Cx_pil          = 0.00141476,
	shape_table_data = {
		{
			name     = "Central_Fuel_Tank",
			file    = "Central_Fuel_Tank",
			life    = 1,
			fire    = {0, 1},
			username    = "Central_Fuel_Tank",
			index    = WSTYPE_PLACEHOLDER,
		},
	},
	Elements = {
		{
			ShapeName    = "scooty",
		},
	},
}--]]
----------------------------------
-- DECLARING OUR CUSTOM LOADOUT --
----------------------------------
--declare_loadout(centerline_ft)
--[[sample_missile_translation.lua


ModelData = {  58 ,  -- model params count
		1.1 ,   -- characteristic square (характеристическая площадь)
		
		-- Cx dependency parameters
		0.07 , -- Cx_k0 Сx0 bar on dialing (M << 1)
		0.08 , -- Cx_k1 peak height of the wave crisis
		0.02 , -- Cx_k2 the steepness of the front on the approach to the wave crisis
		0.012, -- Cx_k3 Cx0 supersonic strip (M >> 1)
		2.5 , -- Cx_k4 the steepness of the decline for the wave crisis
		1.2 , -- Polar blade ratio (proportional to sqrt (M ^ 2-1))
		
		-- Cy dependency parameters
		0.6 , -- Cx_k0 Сx0 bar on dialing (M << 1)
		0.3	 , -- Cy_k1 Cy0 supersonic strip (M >> 1)
		1.2  , -- Cy_k2 declivity (front) behind a wave crisis
		
		0.2 , --  Alfa_max maximum balance angle, radians
		0.0, -- angular velocity created by the moment of gas rudders
		ngine data. Time, fuel flow, thrust.	
		t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,	   -1.0,	6.0,  		60.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		 0.0,		0.0,	30.0,		3.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		 0.0,		0.0,	25000.0,	12000.0,	0.0,			0.0,		0.0,           -- thrust, newtons
		
		 1.0e9, -- self-destruction timer, sec
		 120.0, -- power system operation time, sec
		 0, -- absolute height of self-destruction, m
		 2.5, -- time delay control on (maneuver departure, security), s
		 80000.0, -- range to the target at the time of launch, above which the rocket is executed "hill" maneuver, m
		 80000.0, -- distance to the target at which the slide is completed and the rocket switches to pure proportional navigation (must be greater than or equal to the previous parameter), m
		 0.15,  -- the sine of the elevation angle of the slide trajectory
		 30.0, -- longitudinal acceleration of fuse charging
		 0.0, -- speed module by the ejection device, expelling charge, etc.
		 1.19, -- Characteristic of SAU-ROCKET system, second order filter coefficient K0
		 1.0, -- characteristics of the SAU-ROCKET system, second order filter coefficient K1
		 2.0, -- characteristic of SAU-ROCKET system, control loop bandwidth
		 0.0,
		 0.0,
		 0.0,
		 0.0,
		 0.0,
		  
		  
		  -- Dlz. Data for the calculation of launch ranges (indication on the sight)
		 280000.0, -- range angle 180 (towards) hail, H = 10,000 m, V = 900 km / h, m
		 115000.0, -- range angle 0 (in the catch) hail, H = 10,000 m, V = 900 km / h
		 100000.0, -- range angle 180 (towards) hail, H = 1000m, V = 900km / h
		 1.0,
		 1.0,
		 1.0,
		 0.2, 
		 0.6,
		 1.4,
		-3.0,
		 0.5,
	}-]]
