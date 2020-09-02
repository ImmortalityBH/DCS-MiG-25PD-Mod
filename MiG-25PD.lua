mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures")
--mount_vfs_texture_path  (current_mod_path.."/Textures/339PAN.zip")
--mount_vfs_texture_path  (current_mod_path.."/Textures/339A.zip")
--mount_vfs_texture_path  (current_mod_path.."/Textures/Avionics/")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures/")
mount_vfs_model_path    (current_mod_path.."/Cockpit/Resources/Model/Shape/MiG-25PD_cockpit")

-----------------------------------------------------------------------------------------------
WOLALIGHT_STROBES 		   = 1--must be collection
WOLALIGHT_SPOTS  		   = 2--must be collection
WOLALIGHT_NAVLIGHTS 	   = 3--must be collection
WOLALIGHT_FORMATION_LIGHTS = 4--must be collection
WOLALIGHT_TIPS_LIGHTS      = 5--must be collection

--dofile(current_mod_path.."/SFM/Config_sfm.lua")
-----------------------------------------------------------------------------------------------
--[[
CLSID = {
			R-40R = {CLSID = "4EDBA993-2E34-444C-95FB-549300BF7CAF}"},
			R-40T = 
			R-60M = {CLSID = "{682A481F-0CB5-4693-A382-D00DD4A156D7}"}, 
		}
--]]
-----------------------------------------------------------------------------------------------

MiG_25PD =  {
        
	Name 					=   'MiG-25PD',
	DisplayName				= _('MiG-25PD'),
-----------------------------this stuff is done for the most part------------------------------
	--HumanCockpit 			= false,
	--HumanCockpitPath		= current_mod_path..'/Cockpit/',
	ViewSettings 			= ViewSettings,
	Picture 				= "MiG-25PD.png", --"B-52D.png"
	Rate 					= 40, -- RewardPoint in Multiplayer
	Shape 					= "MiG-25PD",
	   -- enabled for east block
	Countries = {"Russia", "USSR", "Syria", "Libya"},
-----------------------------------------------------------------------------------------------	
	shape_table_data 		= 
	{
		{
			file  	 		= 'MiG-25PD';
			life  	 		= 18; -- lifebar
			vis   	 		= 3; -- visibility gain.
			desrt    		= 'NCPC-7_destr'; -- Name of destroyed object file name
			fire  	 		= { 300, 8}; -- Fire on the ground after destoyed: 300sec 30m
			username 		= 'MiG-25PD';
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
	attribute  				= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER,"Battleplanes",},
	Categories 				= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
--	WorldID					=    WSTYPE_PLACEHOLDER,        

----------------- SUSPENSION CODE   ------------------------------------------------------

--  convenzione x,y,z   x = forw, y = up,  z = dx
    
	--tand_gear_max 								= 1.0,

	main_gear_pos                               = {-0.652,-1.336,1.250},    -- {-0.64,-1.390,1.367},
    main_gear_wheel_diameter                    = 1.25168,                    --  in m --mig
    
    --main_gear_amortizer_direct_stroke	        = 0.258,                    -- 0.190,            --  down from main_gear_pos !!!
	--main_gear_amortizer_reversal_stroke         = -0.06,                    -- -0.072,           --  up 

	--main_gear_amortizer_normal_weight_stroke    = -0.02,                    -- 0.0,                

	nose_gear_pos                               = {3.675,-1.298,0.001},     -- {3.659,-1.365,0.0},    
    nose_gear_wheel_diameter                    = 0.672531,                    --  in m --mig
    
	--nose_gear_amortizer_direct_stroke           = 0.198,                    -- 0.100,            --  down from nose_gear_pos !!!
    --nose_gear_amortizer_reversal_stroke         = -0.01,                    -- -0.069,           --  up 
    
	--nose_gear_amortizer_normal_weight_stroke    = 0.02,                     -- 0.0,              --  -0.00311633945,	

----------------- SUSPENSION CODE    -------------------------------------------------------
-- I ain't changed this bruv
	AOA_take_off 			    = 0.18, -- AoA in take off (for AI) --$$$ --mig
	CAS_min 				    = 1800,   -- if this is not OVERAL FLIGHT TIME, but jus LOITER TIME, than it sholud be 10-15 minutes.....CAS capability in minute (for AI) 30 hours --$$$
	CanopyGeometry = {          
		azimuth                 = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation               = {-50.0, 90.0} -- pilot view vertical (AI)
	},

	radar_can_see_ground        = true, -- this should be examined (what is this exactly?)
	range 						= 1730, -- Max range in km (for AI) --$$$ --mig
    tand_gear_max 	            = 0.577,    
	tanker_type 				= 0,    -- Tanker type if the plane is airrefuel capable      0 null 1 boom 2 tanker --mig      
	thrust_sum_max 				= 14989.82, -- thrust in kg (73.5) --$$$ --mig
	thrust_sum_ab 				= 20414.72, -- thrust inkg (100.1kN) --$$$ --mig
	wing_span 					= 14.01, -- wing spain in m --$$$ --mig
	wing_area 					= 61.52, -- wing area in m2 --$$$ --mig
	wing_tip_pos 				= {-5.108,	0.035,	6.52}, -- wingtip coords for visual effects
	wing_type 					= 0,
	stores_number				= 4,
	IR_emission_coeff 			= 1.25,  -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference. --$$$ this should be about right--mig
	IR_emission_coeff_ab 		= 2.95,    -- With afterburner    --mig
	M_empty 					= 20000, -- kg --$$$ --mig
	M_fuel_max 					= 14920, --1154, -- kg --$$$ --mig
	M_max 						= 36720, -- kg --$$$ --mig
	M_nominal 					= 30000, -- kg --$$$ --mig
	Mach_max                    = 2.8,  -- Max speed in Mach (for AI) --$$$ 620mph --mig
    MaxFuelWeight               = 14920, -- in kg(liters are the same) --$$$ --mig
    MaxHeight                   = 20700, -- in meters --$$$ --mig
    MaxSpeed                    = 3000, --mig
    MaxTakeOffWeight            = 36720, -- in kg I assume --$$$ b--mig
	Ny_max 						= 5,  -- Max G (for AI) --$$$ --mig
	Ny_max_e 					= 5,  -- Max G (for AI) --$$$
	Ny_min 						= -2,   -- Min G (for AI) --$$$ --mig
	RCS 						= 10,  -- Radar Cross Section m2    --$$$ --mig

	H_max 					 	= 20700, -- m 50,000ft -$$$ --mig
	V_land 						= 62.5,   -- Land speed in m/s (for AI) 155mph --$$$ --mig
	V_max_h 					= 952.81,  -- Max speed at max altitude in m/s (for AI) 350mph --$$$ --mig
	V_max_sea_level 			= 510.44,  -- Max speed at sea level in m/s (for AI) 600mph --$$$ --mig
	V_opt 						= 125.17,  -- Cruise speed (for AI) 285mph --$$$ --mig
	V_take_off 					= 62.5,   -- Take off speed in m/s (for AI) 145mph --$$$ --mig
	Vy_max 						= 25,   -- Max climb speed in m/s (for AI) 72ft per sec --$$$ --mig

	average_fuel_consumption 	= 0.0816, -- mig
	bank_angle_max 				= 60,   -- Max bank angle (for AI) --$$$ --mig

	brakeshute_name 			= 4,    -- Landing - brake chute visual shape after separation --mig
	detection_range_max	        = 180,
	engines_count				= 2,    -- Engines count    --$$$ --mig
	flaps_maneuver 				= 0,  -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI) --mig
    has_afteburner 				= true, -- AFB yes/no     --$$$ --mig
	has_differential_stabilizer	= true, -- differential stabilizers --$$$ rudder moves with aeilrons automatically?? --mig
	has_speedbrake 				= true, -- Speedbrake yes/no -- to be determined --mig
	height 						= 6.10, -- height in m  	--$$$ --mig
	is_tanker 					= false, -- Tanker yes/no --$$$
	length 						= 19.75, -- full lenght in m  --$$$ --mig
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords --not used --$$$ will be simulated --mig
--------------------------------------------------------------------------------------------------------------------
	--crew defined 1 = pilot
	crew_size	 = 1, --$$$ what to do about this exactly? changed 
	crew_members = 
	{
		[1] = 
		{
			drop_canopy_name	 = "MiG-25PD_canopy",
			ejection_seat_name	 = 9
			--pilot_name		     = "MiG-25PD_pilot1",
			pos 				 = {4.331, 0.850, 0.0},
			can_be_playable 	 = true,
			canopy_arg           = 38, 
			ejection_order 		 = 1,
			canopy_pos			 = {2.916,0.798,0},
			ejection_added_speed = {-5,15,0},
			role 				 = "pilot",
			role_display_name    = _("Pilot"),
			g_suit 			    =  4
			drop_parachute_name	= "pilot_f15_parachute",
		},  -- end of [1]
	}, -- end of crew_members    
--------------------------------------------------------------------------------------------------------------------    
	net_animation               =  {--99,     --	Pilot                           		-- 1	--arg declarations? --$$$
									1, --nose gear 0 retracted 1 extended
									2,-- strut nose gear not implemented
									3, --NWS -1 clockwise max 0 counterclock wise max
									4, --strut right gear not implemented
									5, --left gear 0 retracted 1 extended
									6, --strut left gear not implemented
									7, --wing sweep ( ͡° ͜ʖ ͡°)
									9, --right flap 0 retracted 1 extended
									10, --left flap 0 retracted 1 extended
									11, --right spoileron -1 down max 1 up max
									12, --left spoileron -1 down max 1 up max
									15, --right elevator -1 tail edge down 1 tail edge up
									16,-- left elevator -1 tail edge down 1 tail edge up
									17,-- right rudder -1 counterclockwise 1 clockwise
									18, --left rudder -1 counterclockwise 1 clockwise
									19,--
									20,--
									21,--
									22,--
									23,--
									26, --bomb bay doors 0 closed 1 open
									28, --ab right
									29, --ab left 0 off 1 on
									35, --parachute 0 off o.5 medium stage 1 on ---need this 
									38, --canopy 0 closed .9 elevated 1 no draw
									51, --landing lights
									69,-- night cockpit lighting 0 off 1 on
									76,-- nosewheel rotation
									77, --main wheel rotation
									115, --right trim -1 tail edge down 1 tail edge up
									116 --right trim -1 tail edge down 1 tail edge up
									117,--pitch trim -1 tail edge down 1 tail edge up
									119,-- rudder trim -1 right 1 left
									--------------  Strumenti Backseat  --------        
									500,	--	Gmeter						            -- 16
									501,	--	Altimetro 100D                  		-- 17
									502,	--	Altimetro 1K                            -- 18
									503,	--	Altimetro 1KD                           -- 19
									505,	--	RPM Int                                 -- 20
									506,	--	RPM Ext                                 -- 21
									509,	--	cockpit lights                           -- 22
									510,	--	AoA                                     -- 23
									516,	--	ADI Pitch                               -- 24
									517,	--	ADI Bank                                -- 25
									518,	--	Airspeed                                -- 26 
									521,	--	Trim                                    -- 27  
									524,	--	Manetta                                 -- 28     
									530,	--	Leva Carrello					        -- 29     
									529,	--	Luci Spie Carrello				        -- 30     
									522,	--	vertical speed							-- 31    
									523,	--	HSI Heading								-- 32 <---------------
									524,	--  ARU control arm indicator
									525,	--  cockpit inlet ramp indicator
									},                                                                                                     
--------------------------------------------------------------------------------------------------------------------                                    
	
    ViewSettings = {
	Cockpit = {
	[1] = {-- player slot 1
		CockpitLocalPoint       = {2.35,0.300,0.0},
		CameraViewAngleLimits   = {20.000000,120.000000},
		CameraAngleRestriction  = {true,60.000000,0.400000},
		CameraAngleLimits       = {170.000000,-125.000000,90.000000},
		EyePoint                = {0.000000,0.000000,0.000000},
		limits_6DOF             = {x = {-0.050000,0.450000},y ={-0.200000,0.200000},z = {-0.220000,0.220000},roll = 90.000000},
		Allow360rotation		= false,
	},
	}, -- Cockpit 
	Chase = {
		LocalPoint              = {0.950,0.600,0.0},   	--{-4.259000,3.819000,0.000000}, 
		AnglesDefault           = {0.000000,0.000000},  --{180.000000,-8.000000},
	}, -- Chase 
	Arcade = {
		LocalPoint              = {-12.041000,6.419000,0.000000},
		AnglesDefault           = {0.000000,-8.000000},
	}, -- Arcade 
    },	

---------------------------------------------------------------------------------------------------------------------------------------------

	engines_nozzles = { --from left to right 1,2,3,4,5,6,7,8 --$$$ nothing has been changed yet
		[1] = 
		{
			pos 		        = {-7,	0.23,	0}, -- nozzle coords
			elevation           = 0,                -- AFB cone elevation
			diameter	        = 1.242,                -- AFB cone diameter --mig
			exhaust_length_ab   = 13.497,,                -- lenght in m --mig
			exhaust_length_ab_K = 0.76,             -- AB animation
			smokiness_level     = 	0.3, --mig
		},  -- end of [1]
		[2] = 
		{
			pos 		        = {-7,	0.23,	0}, -- nozzle coords
			elevation           = 0,                -- AFB cone elevation
			diameter	        = 1.242,                -- AFB cone diameter --mig
			exhaust_length_ab   = 13.497,,                -- lenght in m --mig
			exhaust_length_ab_K = 0.76,             -- AB animation
			smokiness_level     = 	0.3,  --mig
		},  -- end of [1]
	},      -- end of engines_nozzles


	fires_pos = 
		{
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
	
	
	--[[-- Countermeasures
	SingleChargeTotal	 		    = 0, --$$$ --mig
	CMDS_Incrementation         	= 0, --$$$ --mig
	ChaffDefault 					= 0, --$$$ --mig
	ChaffChargeSize 		    	= 0, --$$$ --mig
	FlareDefault 					= 0, --$$$ --mig
	FlareChargeSize 	    		= 0, --$$$ --mig
	CMDS_Edit 				    	= true,
	chaff_flare_dispenser 	= {
		[1] = 
		{
			--dir =  {0, -1, -1},
			--pos =  {-3, -1, 2},
		}, -- end of [1] --$$$ not yet changed
		[2] = 
		{
			--dir =  {0, -1, 1},
			--pos =  {-3, -1, -2},
		}, -- end of [2]
	}, -- end of chaff_flare_dispenser --$$$ not yet changed ]]--

	--sensors
	detection_range_max		 = 150,
	radar_can_see_ground 	 = true, -- this should be examined (what is this exactly?)
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	
	Sensors = {
		RADAR = "BRLS-8B",
		IRST = "8TP",
		RWR = "Abstract RWR"
	},
	HumanRadio = {
		frequency       = 127.5,  -- Radio Freq
		editable        = true,
		minFrequency    = 100.000,
		maxFrequency    = 156.000,
		modulation      = MODULATION_AM
	},
	
-----------------------------------------------------------------------------------------------------------
	--Guns = {gun_mount("M_2_L1", { count = 0 },{muzzle_pos = {0, 0, 0}})},
---------------------------------------------------------------------------------------------------------

	Pylons =     {			-- 3DS: x,z,y  x=Forward -x=Back z=Up -z=Down y=Sx -yDx
        pylon(1, 0, 0, 0, 0,			
            {
				use_full_connector_position=true,
				connector 		= "TIP_SX",
				DisplayName 	= "TT", 
            },
            {
			   {CLSID = "4EDBA993-2E34-444C-95FB-549300BF7CAF}"},
			   {CLSID = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}"),
			   {CLSID = "{682A481F-0CB5-4693-A382-D00DD4A156D7}"}, 			   
            }                                                                          
        ),
		pylon(2, 0, 0, 0, 0,
            {
				use_full_connector_position=true,
				connector 		= "Pylon1",				
				DisplayName 	= "1",
				arg				= 314,
				arg_value		= 1,				
            },
            {
				{CLSID = "4EDBA993-2E34-444C-95FB-549300BF7CAF}"},
				{CLSID = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}"),
				{CLSID = "{682A481F-0CB5-4693-A382-D00DD4A156D7}"}, 
			}
        ),
		pylon(3, 0, -0.474, -0.557, 3.542,  
            {
				use_full_connector_position=true,
				connector 		= "Pylon2",
				DisplayName 	= "2",
				arg				= 309,
				arg_value		= 1,
				droppable_shape = "MB339A_OUTBOARD_PYLON_VOID",
            },
            {
                {CLSID = "4EDBA993-2E34-444C-95FB-549300BF7CAF}"},
				{CLSID = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}"),
				{CLSID = "{682A481F-0CB5-4693-A382-D00DD4A156D7}"}, 
            }
        ),
		pylon(4, 0, -0.423, -0.606, 2.799,
            {
				use_full_connector_position=true,
				connector 		= "Pylon3",
				DisplayName 	= "3",
				arg				= 310,
				arg_value		= 1,
				droppable_shape = "MB339A_INBOARD_PYLON_FULL",
            },
            {
                {CLSID = "4EDBA993-2E34-444C-95FB-549300BF7CAF}"},
				{CLSID = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}"),
				{CLSID = "{682A481F-0CB5-4693-A382-D00DD4A156D7}"}, 				
            }
		),
		
    },
---------------------------------------------------
---------------------------------------------------------------------------------------------------------
--Cylinder135 = 309 ( Visibility Node ) [ Pylon2 ] Pylon Ext Sx
--Cylinder023 = 310 ( Visibility Node ) [ Pylon3 ] Pylon Int Sx
--Cylinder134 = 312 ( Visibility Node ) [ Pylon5 ] Pylon Int Dx
--Cylinder022 = 313 ( Visibility Node ) [ Pylon6 ] Pylon Ext Dx
----------------------------------------------------------------------------------------------------------	

	Tasks = {
        --aircraft_task(GroundAttack),
        --aircraft_task(RunwayAttack),
		--aircraft_task(Strike),
		--aircraft_task(StrategicBombing),
		--aircraft_task(CAS),
		--aircraft_task(AntishipStrike),
		aircraft_task(Reconnaissance),   
        --aircraft_task(PinpointStrike),
        --aircraft_task(AFAC),
		aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
										
    },	
	DefaultTask = aircraft_task(Intercept),
	
	SFM_Data = {
	aerodynamics = 
		{
			Cy0	=	0,
			Mzalfa	=	4.355,
			Mzalfadt	=	0.8,
			kjx	=	2.75,
			kjz	=	0.00125,
			Czbe	=	-0.016,
			cx_gear	=	0.016,
			cx_flap	=	0.025,
			cy_flap	=	0.2,
			cx_brk	=	0.025,
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
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			typeng	=	1,
			hMaxEng	=	19,
			dcx_eng	=	0.0144,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	6500,
			dpdh_f	=	18500,
			table_data = 
			{
				[1] = 	{0,	240000,	303800},
				[2] = 	{0.2,	213000,	305000},
				[3] = 	{0.4,	190000,	300000},
				[4] = 	{0.6,	170000,	302000},
				[5] = 	{0.7,	160000,	310000},
				[6] = 	{0.8,	147000,	317000},
				[7] = 	{0.9,	135000,	325000},
				[8] = 	{1,	124000,	337000},
				[9] = 	{1.1,	115000,	343000},
				[10] = 	{1.2,	112000,	350000},
				[11] = 	{1.3,	107000,	357000},
				[12] = 	{1.5,	92000,	374000},
				[13] = 	{1.8,	78000,	406000},
				[14] = 	{2,	56000,	432000},
				[15] = 	{2.2,	52000,	450000},
				[16] = 	{2.515,	43000,	440000},
				[17] = 	{3,	25000,	432000},
			}, -- end of table_data
				table_data = 
			--[[
			--   M			Pmax + inc         Pmax + 5%     Pmax
				{0.0,       PotenzaMax0},   --18813.3},   --17917.4},
				{0.1,		PotenzaMax1},   --18714.5},   --17823.3},
				{0.2,		PotenzaMax2},   --18562.2},   --17678.3},
				{0.3,		PotenzaMax3},   --17908.6},   --17055.8},
				{0.4,		PotenzaMax4},   --17159.4},   --16342.3},
				{0.5,		PotenzaMax5},   --16487.3},   --15702.2},
				{0.6,		PotenzaMax6},   --16622.8},   --15831.2},
				{0.7,		PotenzaMax7},   --16926.3},   --16120.3},
				{0.8,		PotenzaMax8},   --17075.8},   --16262.7},
				{0.9,	    PotenzaMax9},   --17201.9},   --16382.8},
			}, -- end of table_data--]]
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	}, --end of sfm data

            --[[extended =
                {
                
                    thrust_max = -- thrust interpolation table by altitude and mach number, 2d table
                        { -- Minimum thrust 2000 kN, maximum thrust 16700 kN
                            M 		 = {0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9},
                            H		 = {0,3048,6096,9144,10500,12192},
                            thrust	 = {-- M 0         0.1      0.2      0.3      0.4     0.5     0.6     0.7      0.8      0.9
                                        {    17793,   17126,   16458,   16192,   16425,  16469,  16514,  16869,   16925,  17259 },--H = 0 (sea level)
                                        {    14323,   13567,   12811,   12677,   12544,  12633,  12722,  12855,   12989,  13656 },--H = 3048 (10kft)
                                        {    11210,   10409,   9608,    9530,    9452,   9619,   9786,   10053,   10320,  10765 },--H = 6096 (20kft)
                                        {    8429,    7684,    6939,    6928,    6917,   7050,   7184,   7440,    7695,   8062 	},--H = 9144 (30kft)
                                        {    6939,    6294,    5649,    5638,    5627,   5749,   5872,   6094,    6316,   6628 	},--H = 10500 (34kft)
										{    3327,    2782,    2237,    2248,    2260,   2349,   2438,   2627,    2816,   3071 	},--H = 12192 (40kft)
                                        
                            },
                        },
                }, -- end of extended data--]]
----------------------------------------------------------------------------------------------------------------
	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
Damage = { --wing L and wing R should be damagable
				["FIN_L_TOP"] 			 = {critical_damage = 10, args = {244},deps_cells = {"RUDDER_L"}},
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
				["FLAP_L_IN"]  	 	= {critical_damage = 5 , args = {227},droppable = false},
		 }
	DamageParts = 
	{  
		[1] = "MIG-31-OBLOMOK-WING-R", -- wing R
		[2] = "MIG-31-OBLOMOK-WING-L",
		--[3] = "MiG-31-oblomok-noise", -- nose
		--[4] = "MiG-31-oblomok-tail-r", -- tail
		--[5] = "MiG-31-oblomok-tail-l", -- tail
	},
	
	lights_data = {
	
		typename = "collection",
		lights = 
		{
			[1] = 	{ typename = "collection",
						lights = {
									{typename = "natostrobelight",
									connector = "WHITE_TOP",
									argument_1 = 192,
									period = 5.0,
									color = {0.99, 0.11, 0.3},
									phase_shift = 0.0
									}						
								}
					},
			[2] = 	{ typename = "collection",
						lights = {-- Landing light
									--{typename = "spotlight",
									--  connector = "MAIN_SPOT_PTR_02",
									--  argument = 208,
									--	position  = {3.889, 0.006, -0.875},
									--  dir_correction = {elevation = math.rad(2)}
									-- 	} --,
										{-- Landing/Taxi light
										typename = "spotlight",
										connector = "MAIN_SPOT_PTR_01",
										argument = 190,	
										dir_correction = {elevation = math.rad(3)}
										}
								}
					},
			[3]	= {	typename = "collection",
						lights = {-- Left Position Light (red)
									{typename = "omnilight",
									connector = "BANO_1",
									color = {0.99, 0.11, 0.3},
									pos_correction  = {0, 0, -0.2},
									argument  = 190
									},
									-- Right Position Light (green)
									{typename = "omnilight",
									connector = "BANO_2",
									color = {0, 0.894, 0.6},
									pos_correction = {0, 0, 0.2},
									argument  = 190
									},
									-- Tail Position Light (white)
									{typename = "omnilight",
									connector = "BANO_0_BACK",
									color = {1, 1, 1},
									--pos_correction  = {-0.826, -0.799, 0},
									argument  = 190
									}		
								}
				},
			[4] = { typename = "collection", 
						lights = {
									-- Top Formation Light (white) "Gobba"
									{typename = "omnilight",
									connector = "BANO_0_TOP",
									color = {1, 1, 1},
									--pos_correction  = {-0.826, -0.799, 0},
									argument  = 190
									},
									-- Bottom Formation Light Pancia
									{typename = "omnilight",
									connector = "BANO_0_BOTTOM",
									color = {1, 1, 1},
									--pos_correction  = {-0.826, -0.799, 0},
									argument  = 190
									}													
								}
				},
			[5] = {	typename = "collection",
						lights = {
									-- red recognotion light 
									{typename = "omnilight",
									 connector = "FORM_LIGHTS_1",
									 color = {0.99, 0.11, 0.3},
									 pos_correction  = {0, 0, 0},
									 argument  = 190
									},
								--	 -- amber recognotion light 
									{typename = "omnilight",
									connector = "FORM_LIGHTS_2",
									color = {1.0, 0.5, 0.0},
									pos_correction = {0, 0, 0},
									argument  = 190
									},
								--	-- green recognotion light 
									{typename = "omnilight",
									connector = "FORM_LIGHTS_3",
									color = {0, 0.894, 0.6},
									pos_correction  = {0, 0, 0},
									argument  = 190
									}
								}
				},
					
		}
	},		
--=======================================================================================================
    
}

add_aircraft(MiG_25PD)