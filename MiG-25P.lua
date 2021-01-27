 -----------------------------------------------------------------------------------------------
-- Made by Immortality 10/5/20
-----------------------------------------------------------------------------------------------
--[[WOLALIGHT_STROBES 		   = 1--must be collection
WOLALIGHT_SPOTS  		   = 2--must be collection
WOLALIGHT_NAVLIGHTS 	   = 3--must be collection
WOLALIGHT_FORMATION_LIGHTS = 4--must be collection
WOLALIGHT_TIPS_LIGHTS      = 5--must be collection--]]
--Functions

dofile(current_mod_path..'/Views.lua')

local function get_inboard_pylon_table()
	local tbl = { {CLSID = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}"}, -- R40-R
		{CLSID = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}"},--[[ {CLSID = "{R40R}"}, {CLSID = "R40T"}, R-40T --]] }
	return tbl
end
local function get_outboard_pylon_table() 
	local tbl = { {CLSID = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}"}, -- R40-R
		{CLSID = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}"},--[[ {CLSID = "{R40R}"}, {CLSID = "R40T"}, R-40T --]] }
	return tbl
end

MiG_25P =  {
	Name 					=   'MiG-25P',
	DisplayName				= _('MiG-25P'),
	ViewSettings 			= ViewSettings, -- V
	SnapViews 				= SnapViews,
	WorldID					= WSTYPE_PLACEHOLDER, 
	HumanCockpit 			= false,
	HumanCockpitPath		= current_mod_path..'/Cockpit/',
	Picture 				= "MiG-25P.png", -- pylon image
	Rate 					= 40, -- RewardPoint in Multiplayer
	Shape 					= "MiG25P", -- controls main aircraft shape
	-- enabled for east block and middle eastern countries
	Countries = {"Russia","USSR","Syria","Libya","Algeria",
	"Armenia","Bulgaria","Belarus","India","Iraq","Georgia", 
	"Kazakhstan","Turkmenistan","Ukraine"},
	-- Aircraft shape details
	shape_table_data 		=  {
		{
			file  	 		= 'MiG25P'; -- 'MiG-25P'
			life  	 		= 20; -- lifebar
			vis   	 		= 3; -- visibility gain.
			desrt    		= 'NCPC-7_destr'; -- Name of destroyed object file name
			fire  	 		= { 300, 8}; -- Fire on the ground after destoyed: 300sec 30m
			username 		= 'MiG-25P'; -- f2 bar name?
			index    		=  WSTYPE_PLACEHOLDER;
			classname 		= "lLandPlane";
			positioning 	= "BYNORMAL";
			drawonmap 		= true;
		},
		{
			name 			= "NCPC-7_destr";
			file 			= "NCPC-7_destr";
			fire  			= { 240, 2};
		},
	},
	mapclasskey 			= "P0091000025",
	attribute  				= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, MiG_25P, "Interceptor"},
	Categories 				= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},       
	
	Tasks = {
		aircraft_task(Reconnaissance),   
		aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
    },	
	DefaultTask = aircraft_task(Intercept),
	--Animations shared with network for MP transmission
	-- 32 arg limit
	net_animation = {
		0, -- front gear
		2, -- nose wheel steering
		3, -- left gear
		5, -- right gear
		9, -- right flap
		10, -- left flap
		11, -- right aileron
		12, -- left aileron
		15, -- right elevator
		16, -- left elevator
		17, -- rudder
		21, -- chute
		28, -- left burner
		29, -- right burner
		33, -- weapons pylons visibility
		38, -- canopy
		39, -- pilot angle head
		49, -- navigation lights
		40, -- ejection seat visibility
		51, -- landing lights
		65, -- canopy destruction
	},
	--Weight in kilograms(liters for fuel)
	M_empty 					= 20000, -- kg  --mig	
	M_nominal 					= 30000, -- kg  --mig
	M_max 						= 36720, -- kg  --mig
	M_fuel_max 					= 14200, -- L   --mig
	H_max 					 	= 20700, -- m 67,900ft --mig
	--The fuel system has 6 fuselage as well as 4 wing tanks. 
	--The main fuel is the T-6, and the backup - T-7P. The
	--capacity on interceptor models is 14,570 kilograms,

	-- Min/Max fuel + movement speeds
	average_fuel_consumption 	= 0.0816, -- L/s(liters per second) mig
	CAS_min 				    = 60,   -- if this is not OVERAL FLIGHT TIME, but jus LOITER TIME, than it sholud be 10-15 minutes.....CAS capability in minute (for AI) 30 hours 
	V_opt 						= 125.17,  -- Cruise speed (for AI) 285mph  --mig
	V_take_off 					= 62.5,   -- Take off speed in m/s (for AI) 145mph  --mig
	V_land 						= 62.5,   -- Land speed in m/s (for AI) 155mph  --mig
	V_max_sea_level 			= 510.44,  -- Max speed at sea level in m/s (for AI) 600mph  --mig
	V_max_h 					= 952.81,  -- Max speed at max altitude in m/s (for AI) 350mph  --mig
	Vy_max 						= 25,   -- Max climb speed in m/s (for AI) 72ft per sec  --mig
	
	-- Conditions
	has_afteburner 				= true, -- AFB yes/no      --mig
	has_speedbrake 				= true, -- Speedbrake yes/no -- to be determined --mig
	has_differential_stabilizer	= true, -- differential stabilizers --mig the mig has tailerons
	
	-- Landing gears  x,y,z   x = forw, y = up,  z = dx
	tand_gear_max 				= 0.577, -- +/- 25 degress
	main_gear_pos               = {0.272,-2.39, 0},--{-0.652,-1.770,1.250},--{-0.652,-2.056,1.250},    -- {-0.64,-1.390,1.367},
	nose_gear_pos               = {5.259, -2.45, 0.0},--{3.675,-2.204,0.001},--{3.675,-2.056,0.001},     -- {3.659,-1.365,0.0},   
	main_gear_wheel_diameter    = 1.25168,                 --  in m --mig	  
    nose_gear_wheel_diameter    = 0.672531,                --  in m --mig
    --main_gear_amortizer_direct_stroke	        = 0.258,                    -- 0.190,            --  down from main_gear_pos !!!
	--main_gear_amortizer_reversal_stroke         = -0.06,                    -- -0.072,           --  up 
	--main_gear_amortizer_normal_weight_stroke    = -0.02,                    -- 0.0,                
	--nose_gear_amortizer_direct_stroke           = 0.198,                    -- 0.100,            --  down from nose_gear_pos !!!
    --nose_gear_amortizer_reversal_stroke         = -0.01,                    -- -0.069,           --  up 
	--nose_gear_amortizer_normal_weight_stroke    = 0.02,  
	
	-- AI + aircraft details
	radar_can_see_ground        = true, -- this should be examined (what is this exactly?)
	AOA_take_off 			    = 0.18, -- AoA in take off (for AI)  --mig
	stores_number				= 4, --mig
	bank_angle_max 				= 60,   -- Max bank angle (for AI)  --mig
	Ny_max 						= 5,  -- Max G (for AI)  --mig
	Ny_max_e 					= 5,  -- Max G (for AI) 
	Ny_min 						= -2,   -- Min G (for AI)  --mig
	tanker_type 				= 0,    -- Tanker type if the plane is airrefuel capable      0 null 1 boom 2 tanker --mig      
	wing_span 					= 14.01, -- wing spain in m  --mig
	wing_area 					= 61.52, -- wing area in m2  --mig
	wing_tip_pos 				= {-5.108,	0.035,	6.52}, -- wingtip coords for visual effects
	wing_type 					= 0, -- FIXED_WING --mig
	thrust_sum_max 				= 14989.82, -- thrust in kg (73.5)  --mig 7500kgf each
	thrust_sum_ab 				= 20414.72, -- thrust inkg (100.1kN)  --mig 10210kgf each
	height 						= 6.10, -- height in m  	 --mig
	length 						= 19.75, -- full lenght in m   --mig
	flaps_maneuver 				= 1,  -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI) --mig
	Mach_max                    = 2.8,  -- Max speed in Mach (for AI)  620mph --mig
	range 						= 1250, -- Max range in km (for AI)  --mig
   	engines_count				= 2,    -- Engines count     --mig
	brakeshute_name 			= 3,    -- Landing - brake chute visual shape after separation --mig
	is_tanker 					= false, -- Tanker yes/no 
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords --not used  will be simulated --mig
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	-- Radar/RCS details
	RCS 						= 10,  -- Radar Cross Section m^2     --mig
	IR_emission_coeff 			= 1.25,  -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.  this should be about right--mig
	IR_emission_coeff_ab 		= 2.95,    -- With afterburner    --mig
	detection_range_max	        = 100, -- max range a large target can be seen on radar in km
	radar_can_see_ground 	    = true, -- this should be examined (what is this exactly?)
	-- ECM none available
	SingleChargeTotal	 		= 0,  --mig
	CMDS_Incrementation         = 0,  --mig
	ChaffDefault 				= 0,  --mig
	ChaffChargeSize 		    = 0,  --mig
	FlareDefault 				= 0,  --mig
	FlareChargeSize 	    	= 0,  --mig
	CMDS_Edit 				    = false, -- when values are changed in editor 2 flare = 1 chaff
	chaff_flare_dispenser = { -- KDS only on right wing
		[1] =  {
			dir =  {0, -1, -1},
			pos =  {-3, -1, 2},
		}, -- end of [1]  not yet changed
	}, -- end of chaff_flare_dispenser  not yet changed 
	-- Sensors
	Sensors = {
		RADAR = "N-005",
		IRST = "26Sh-1",
		RWR = "Abstract RWR"
	},
--------------------------------------------------------------------------------------------------------------------
	crew_size	 = 1,  --mig
	crew_members = {
		[1] = {
			drop_canopy_name	 = "MiG25P_canopy", -- model needed
			ejection_seat_name	 = 26,
			--pilot_name		     = "MiG-25P_pilot1",
			pos 				 = {4.331, 0.850, 0.0},
			can_be_playable 	 = true,
			canopy_arg           = 38, 
			ejection_order 		 = 1,
			canopy_pos			 = {2.916,0.798,0},
			ejection_added_speed = {-5,15,0},
			role 				 = "pilot",
			role_display_name    = _("Pilot"),
			drop_parachute_name	= "pilot_f15_parachute",
			g_suit 			    =  4,
		},  -- end of [1]
	}, -- end of crew_members    
--------------------------------------------------------------------------------------------------------------------    
	engines_nozzles = { --from left to right 1,2,3,4,5,6,7,8  nothing has been changed yet
		[1] = { -- x = for, y = up, z = right
			pos 		        = {-6.27,	0.0,	-.88}, -- nozzle coords
			elevation           = 0,                -- AFB cone elevation
			diameter	        = 1.50,                -- AFB cone diameter --mig thicc
			exhaust_length_ab   = 13.497,                -- lenght in m --mig
			exhaust_length_ab_K = 0.76,             -- AB animation
			smokiness_level     = 	0.3, --mig
		},  -- end of [1]
		[2] = {
			pos 		        = {-6.27,	0.0,	.88}, -- nozzle coords
			elevation           = 0,                -- AFB cone elevation
			diameter	        = 1.50,                -- AFB cone diameter --mig
			exhaust_length_ab   = 13.497,                -- lenght in m --mig
			exhaust_length_ab_K = 0.76,             -- AB animation
			smokiness_level     = 	0.3,  --mig
		},  -- end of [1]
	},      -- end of engines_nozzles
	fires_pos = {
		[1]  = 	{-2.117,	-0.9,	0},
		[2]  = 	{-1.584,	0.176,	2.693},
		[3]  = 	{-1.645,	0.213,	-2.182},
		[4]  = 	{-0.82,	    0.265,	2.774},
		[5]  = 	{-0.82,	    0.265,	-2.774},
		[6]  = 	{-0.82,	    0.255,	4.274},
		[7]  = 	{-0.82,	    0.255,	-4.274},
		[8]  = 	{-6.548,	-0.248,	0},
		[9]  = 	{-6.548,	-0.248,	0},
		[10] = 	{0.304,	    -0.748,	0.442},
		[11] = 	{0.304,	    -0.748,	-0.442},
	}, -- end of fires_pos
	HumanRadio = {
			frequency = 124.0,
			editable = true,
			minFrequency = 118,
			maxFrequency = 143.975,
			modulation = MODULATION_AM
	},
	panelRadio = {
		[1] = {
			name = _("Radio"),
			range = {{min = 30, max = 300}},
			channels = {
				[1] = { name = _("Channel 0"), default = 124.0,modulation = _("AM")},
				[2] = { name = _("Channel 1"), default = 150.0,modulation = _("AM")},
				[3] = { name = _("Channel 2"), default = 121.0,modulation = _("AM")},
				[4] = { name = _("Channel 3"),default = 131.0,modulation = _("AM")},
				[5] = { name = _("Channel 4"),default = 141.0,modulation = _("AM")},
				[6] = { name = _("Channel 5"),default = 126.0,modulation = _("AM")},
				[7] = { name = _("Channel 6"),default = 130.0,modulation = _("AM")},
				[8] = { name = _("Channel 7"),default = 133.0,modulation = _("AM")},
				[9] = { name = _("Channel 8"),default = 122.0,modulation = _("AM")},
				[10] = { name = _("Channel 9"),default = 124.0,modulation = _("AM")},
				[11] = { name = _("Channel 10"),default = 134.0,modulation = _("AM")},
				[12] = { name = _("Channel 11"),default = 125.0,modulation = _("AM")},
				[13] = { name = _("Channel 12"),default = 135.0,modulation = _("AM")},
				[14] = { name = _("Channel 13"),default = 137.0,modulation = _("AM")},
				[15] = { name = _("Channel 14"),default = 136.0,modulation = _("AM")},
				[16] = { name = _("Channel 15"),default = 123.0,modulation = _("AM")},
				[17] = { name = _("Channel 16"),default = 132.0,modulation = _("AM")},
				[18] = { name = _("Channel 17"),default = 127.0,modulation = _("AM")},
				[19] = { name = _("Channel 18"),default = 129.0,modulation = _("AM")},
				[20] = { name = _("Channel 19"),default = 138.0,modulation = _("AM")},
			},
		},
	},
-----------------------------------------------------------------------------------------------------------
	-- 4 pylons (2 outboard, 2 inboard)
	-- possible loads:
	-- pos 1-4 = R40-R or R-40T, pos 2-3 = R-40R or R-40T
	-- station numbers are 1-2-3-4 left to right
	-- pylon(position, ext wing/pylion=0|ext fuselage=1|internal bay=2, posy,
	--posz, posx, connector_pos, possible load array)
	-- See http://forums.eagle.ru/showpost.php?p=1833726&postcount=5
	-- See Scripts/Database/db_weapons_data.lua
	Pylons =     {			-- 3DS: x,z,y  x=Forward -x=Back z=Up -z=Down y=Sx -yDx
        pylon(1, 0, -0.900000, 0.030000, -4.615000,
            {
				use_full_connector_position=true,
				connector 		= "Point_Pilon_1",
				DisplayName 	= "1",
				arg				= 308,
				--arg_value		= 0,
				--droppable_shape = "MiG-25P_PYLON",
            },
            get_outboard_pylon_table()
        ),
        pylon(2, 0, 0.100000, 0.031000, -3.470000,
            {
				use_full_connector_position=true,
				connector 		= "Point_Pilon_2",
				DisplayName 	= "2",
				arg				= 309,
				--arg_value		= 0,
				--droppable_shape = "MiG-25P_PYLON",
            },
			get_inboard_pylon_table()
        ),
        pylon(3, 0, 0.100000, 0.031000, 3.470000,
            {
				use_full_connector_position=true,
				connector 		= "Point_Pilon_3",
				DisplayName 	= "3",
				arg				= 310,
				--arg_value		= 0,
				--droppable_shape = "MiG-25P_PYLON",
            },
			get_inboard_pylon_table()
        ),
        pylon(4, 0, -0.900000, 0.030000, 4.615000,
            {
				use_full_connector_position=true,
				connector 		= "Point_Pilon_4",
				DisplayName 	= "4",
				arg				= 311,
				--arg_value		= 0, -- 1 = 0 not drawn 0 = fully drawn
				--droppable_shape = "MiG-25P_PYLON",
            },
			get_outboard_pylon_table()
        ),
    },
---------------------------------------------------------------------------------------------------------
	SFM_Data = {
	aerodynamics =  {
			Cy0	=	0, -- zero AoA lift coefficient
			Mzalfa	=	4.355, -- 4.355,-- tail pitch coefficient M0.9
			Mzalfadt	=	0.8, -- 0.8,-- wing pitch coefficient M0.9
			kjx	=	2.75, -- roll acceleration rate in rad/sec
			kjz	=	0.00125,  -- 0.0011, -- elevator or stab control power coefficient / pitch damping coefficient
			Czbe	=	-0.016,  -- directional stability coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear	=	0.016, -- coefficient, drag, gear
			cx_flap	=	0.025, -- coefficient, drag, full flaps
			cy_flap	=	0.2, -- coefficient, normal force, lift, flaps
			cx_brk	=	0.025, -- coefficient, drag, breaks
			table_data = 
			{ --         M   Cx0     Cya     B2     B4    Omxmax  Aldop  Cymax
				[1] = 	{0,	0.025,	0.07,	0.155,	0.13,	0.5,	30,	1.2},
				[2] = 	{0.2,	0.025,	0.07,	0.155,	0.13,	1.5,	30,	1.2},
				[3] = 	{0.4,	0.025,	0.07,	0.155,	0.13,	2.5,	30,	1.2},
				[4] = 	{0.6,	0.025,	0.073,	0.155,	0.13,	3.5,	30,	1.2},
				[5] = 	{0.7,	0.025,	0.076,	0.155,	0.13,	3.5,	28.666666666667,	1.18},
				[6] = 	{0.8,	0.025,	0.079,	0.155,	0.13,	3.5,	27.333333333333,	1.16},
				[7] = 	{0.9,	0.0275,	0.083,	0.172,	0.13,	3.5,	26,	1.14},
				[8] = 	{1,	0.035,	0.085,	0.183,	0.15,	3.5,	24.666666666667,	1.12},
				[9] = 	{1.05,	0.0375,	0.0855,	0.199,	0.15,	3.5,	24,	1.11},
				[10] = 	{1.1,	0.04,	0.086,	0.215,	0.15,	3.15,	18,	1.1},
				[11] = 	{1.2,	0.041,	0.083,	0.2325,	0.25,	2.45,	17,	1.05},
				[12] = 	{1.3,	0.04,	0.077,	0.25,	0.35,	1.75,	16,	1},
				[13] = 	{1.5,	0.038,	0.062,	0.29,	0.35,	1.5,	13,	0.9},
				[14] = 	{1.7,	0.036066666666667,	0.051333333333333,	0.342,	0.210004,	0.9,	12,	0.7},
				[15] = 	{1.8,	0.0351,	0.046,	0.368,	0.140006,	0.86,	11.4,	0.64},
				[16] = 	{2,	0.033,	0.039,	0.42,	1.0000000000066e-005,	0.78,	10.2,	0.52},
				[17] = 	{2.2,	0.032,	0.034,	0.458,	1e-005,	0.7,	9,	0.4},
				[18] = 	{2.5,	0.028,	0.033,	0.515,	1e-005,	0.7,	9,	0.4},
				[19] = 	{3,	0.025,	0.033,	0.61,	1e-005,	0.7,	9,	0.4},
				[20] = 	{3.9,	0.025,	0.033,	0.61,	1e-005,	0.7,	9,	0.4},
			}, -- end of table_data
						-- M   - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
			-- B2 - Polar quad power coeff
			-- B4 - Polar 4th power coeff
			-- Omxmax - roll rate, rad/s
			-- Aldop - Alfadop Max AOA at current M - departure threshold
			-- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
		}, -- end of aerodynamics
		engine = {
			Nmg	=	67.5, -- RPM at idle
			MinRUD	=	0, -- Min state of the throttle
			MaxRUD	=	1, -- Max state of the throttle
			MaksRUD	=	0.85, -- Military power state of the throttle
			ForsRUD	=	0.91, -- Afterburner state of the throttle
			typeng	=	1, -- E_TURBOJET_AB
			hMaxEng	=	37.5, -- maximum operating altitude in km
			dcx_eng	=	0.0144, -- Engine drag coeficient
			cemax	=	1.24,-- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	6500, --  altitude coefficient for max thrust
			dpdh_f	=	18500, --  altitude coefficient for AB thrust
			table_data = {
			          -- M       Pmax    Pfor
				[1] = 	{0,		240000,	303800},
				[2] = 	{0.2,	213000,	305000},
				[3] = 	{0.4,	190000,	300000},
				[4] = 	{0.6,	170000,	302000},
				[5] = 	{0.7,	160000,	310000},
				[6] = 	{0.8,	147000,	317000},
				[7] = 	{0.9,	135000,	325000},
				[8] = 	{1,		124000,	337000},
				[9] = 	{1.1,	115000,	343000},
				[10] = 	{1.2,	112000,	350000},
				[11] = 	{1.3,	107000,	357000},
				[12] = 	{1.5,	92000,	374000},
				[13] = 	{1.8,	78000,	406000},
				[14] = 	{2,		56000,	432000},
				[15] = 	{2.2,	52000,	450000},
				[16] = 	{2.515,	43000,	440000},
			--  [17]  =  {2.8, 00000, 00000},
				[17] = 	{3,	25000,	432000},
			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	}, --end of sfm data
----------------------------------------------------------------------------------------------------------------
	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
	-- deps_cells = {"RUDDER_L"}
		["WING_R_OUT"] = {critical_damage = 10,args = {68}, droppable = true},
		["WING_L_OUT"] = {critical_damage = 10,args = {67}, droppable = true},
		["FRONT"] = {critical_damage = 10,args = {82}, droppable = true}, --nose
		["RUDDER_R"] = {critical_damage = 10,args = {58}, droppable = true},
		["RUDDER_L"] = {critical_damage = 10,args = {57}, droppable = true},
		["TAIL_LEFT_SIDE"] = {critical_damage = 10,args = {62}, droppable = true},
		["TAIL_RIGHT_SIDE"] = {critical_damage = 10,args = {61}, droppable = true},
		["STABILIZER_L_IN"] = {critical_damage = 10,args = {62}, droppable = true},
		["STABILIZER_R_IN"] = {critical_damage = 10,args = {61}, droppable = true},
		["ELEVATOR_R_IN"] = {critical_damage = 10,args = {60}, droppable = false},
		["ELEVATOR_L_IN"] = {critical_damage = 10,args = {59}, droppable = false},
		["ELERON_R"] = {critical_damage = 10,args = {54}, droppable = false},
		["ELERON_L"] = {critical_damage = 10,args = {53}, droppable = false},
		["FLAP_R_IN"] = {critical_damage = 10,args = {56}, droppable = false},
		["FLAP_L_IN"] = {critical_damage = 10,args = {55}, droppable = false},
		[""] = {critical_damage = 10,args = {59}, droppable = false},
		[""] = {critical_damage = 10,args = {59}, droppable = false},
		["COCKPIT"] = {critical_damage = 10,args = {65}, droppable = false},
		--[[["FIN_L_TOP"] 			 = {critical_damage = 10, args = {244},deps_cells = {"RUDDER_L"}},
		["RUDDER_L"] 			 = {critical_damage = 5 , args = {248}},
		["FIN_R_TOP"] 			 = {critical_damage = 10, args = {241},deps_cells = {"RUDDER_R"}},
		["RUDDER_R"] 			 = {critical_damage = 5 , args = {247}},
		["ELEVATOR_R_IN"]		 = {critical_damage = 5 , args = {237}},
		["ELEVATOR_L_IN"]		 = {critical_damage = 5 , args = {239}},

		["ENGINE_L"]			 = {critical_damage = 10 , args = {167},droppable = false},
		["ENGINE_R"]			 = {critical_damage = 10 , args = {169},droppable = false},
		["FUSELAGE_LEFT_SIDE"]   = {critical_damage = 5 , args = {154,299},droppable = false},
		["FUSELAGE_RIGHT_SIDE"]  = {critical_damage = 5 , args = {153,303},droppable = false},
		["FUSELAGE_BOTTOM"]  	 = {critical_damage = 5 , args = {152}	   ,droppable = false},

		["NOSE_CENTER"]  	 	 = {critical_damage = 5 , args = {146},droppable = false},
		["NOSE_BOTTOM"]  	 	 = {critical_damage = 5 , args = {148},droppable = false},
		["CABIN_LEFT_SIDE"]  	 = {critical_damage = 5 , args = {150 , 298},droppable = false},
		["CABIN_RIGHT_SIDE"]  	 = {critical_damage = 5 , args = {149 , 301 , 302},droppable = false},
		["COCKPIT"]  	 		 = {critical_damage = 5 , args = {65},droppable = false},

		["WING_R_CENTER"]  	= {critical_damage = 10, args = {214},deps_cells = {"ELERON_R"}},
		["WING_R_IN"]  	 	= {critical_damage = 10, args = {215},deps_cells = {"FLAP_R_IN"},droppable = false},
		["ELERON_R"]  	 	= {critical_damage = 5 , args = {216},droppable = false},
		["FLAP_R_IN"]  	 	= {critical_damage = 5 , args = {217},droppable = false},
		["WING_L_CENTER"]  	= {critical_damage = 10, args = {224},deps_cells = {"ELERON_L"}},
		["WING_L_IN"]  	 	= {critical_damage = 10, args = {225},deps_cells = {"FLAP_L_IN"},droppable = false},
		["ELERON_L"]  	 	= {critical_damage = 5 , args = {226},droppable = false},
		["FLAP_L_IN"]  	 	= {critical_damage = 5 , args = {227},droppable = false},--]]
	},
	DamageParts = {  --oblomok = fragment
		[1] = "MiG-25P-OBLOMOK-WING-R", -- wing R
		[2] = "MiG-25P-OBLOMOK-WING-L", -- wing L
		[3] = "MiG-25P-OBLOMOK-NOSE", -- nose
		[4] = "MiG-25P-OBLOMOK-TAIL-R", -- tail R
		[5] = "MiG-25P-OBLOMOK-TAIL-L", -- tail L
		[6] = "MiG-25P-OBLOMOK-ELEVATOR-R", -- elevator R
		[7] = "MiG-25P-OBLOMOK-ELEVATOR-L", -- elevator L
	},
	lights_data = {
		typename = "collection",
		lights = {
			[WOLALIGHT_LANDING_LIGHTS] = { typename = "collection", -- Landing light
				lights = {
					{
						typename = "spotlight",
						argument = 208,
						connector = "landing_light_empty", 
						dir_correction = {elevation = math.rad(0)}
					}, -- left starboard light
				},
			},
			[WOLALIGHT_NAVLIGHTS] = {	typename = "collection",
			lights = {-- Left Position Light (Red)
			            {typename = "omnilight",
						connector = "BANO_1",
						color = {0.99, 0.11, 0.3},
						pos_correction  = {0, 0, 0},
						{typename  = "argumentlight", argument = 190},
						},
					  -- Right Position Light (Green)
						{typename = "omnilight",
						connector = "BANO_2",
						color = {0, 0.894, 0.6},
						pos_correction = {0, 0, 0},
						},
						{typename  = "argumentlight", argument = 191}, 
					  -- Tail Position Light (White)
						{typename = "omnilight",
						connector = "BANO_0_BACK",
						color = {1, 1, 1},
						pos_correction  = {0, 0, 0},
						},
						{typename  = "argumentlight", argument = 203},
					 }
		  },
		},
	}, -- end lights_data	
}
add_aircraft(MiG_25P)
