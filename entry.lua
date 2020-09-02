declare_plugin("MiG-25PD by the Growling Sidewinder Community Mod Team",  --  Ver. Release 1.0 DCS 2.5.2 13/05/2019   -- B-52D By ImmortalityBH - Shmoo42 - Goose - NOCO -.   special thanks to the B-52 Mod Discord community. 
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
fileMenuName = _("MiG-25PD"),
version		 = "v1.0 for 2.5.4",		 
state		 = "installed",
info		 = _("The MiG-25 is a Soviet, supersonic interceptor that was among the fastest military aircraft to enter service. The MiG-25PD, that entered service in 1979, contains a new powerful radar with pylons for up to 4 A2A missiles."),
encyclopedia_path = current_mod_path..'/Encyclopedia',
linkBuy =
    {
        ED      = "https://www.digitalcombatsimulator.com/en/userfiles",
    },
Skins	= 
	{
		{
			name	    = "MiG-25PD",
			dir		    = "Theme"
		},
	},
Missions =
	{				--wow I can comment this is so cool
		{
			name		= _("MiG-25PD"),
			dir			= "Missions",
			--CLSID		= "{CLSID5456456346CLSID}",	
		},
	},	
LogBook =
	{
		{
			name		= _("MiG-25PD"),
			type		= "MiG-25PD",
		},
	},	
InputProfiles =
	{
		["MiG-25PD"]   = current_mod_path .. '/Input',
	},
})
---------------------------------------------------------------------------------------
mount_vfs_model_path    (current_mod_path .."/Cockpit/Resources/Model/Shape")
mount_vfs_texture_path	(current_mod_path .."/Skins/1/ME" )					--for simulator loading window
make_flyable('MiG-25PD', current_mod_path..'/Cockpit/',nil, current_mod_path..'/comm.lua')
local support_cockpit = current_mod_path..'/Cockpit/Scripts/'
dofile(current_mod_path..'/MiG-25PD.lua')
--dofile(current_mod_path..'/comm.lua')
---------------------------------------------------------------------------------------
--dofile(current_mod_path.."/Weapons/Weapons.lua") -- Smoke + Tank + POD GUN
--dofile(current_mod_path.."/Weapons/Weapons_Rocket.lua") -- RAZZIERA LR-25 + RAZZI SNIA-BPD ARF/8M3 HEI/API + LAU-10
--dofile(current_mod_path.."/Weapons/Weapons_BRD.lua") -- DISPENSER BDR + MK76
---------------------------------------------------------------------------------------
plugin_done()-- finish declaration , clear temporal data