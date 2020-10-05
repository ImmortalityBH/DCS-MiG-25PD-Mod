-- set true to use EFM dll
local EFMenabled = false

local bin = {}

if EFMenabled == true then
	bin = {'MiG-25PD'}
end

local self_ID = "MiG-25PD"

declare_plugin(self_ID,  --  Ver. Release 1.0 DCS 2.5.2 13/05/2019   -- Special Thanks to ImmortalityBH - Shmoo42 - Goose - NOCO -.   special thanks to the B-52 Mod Discord community. 
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName = _("MiG-25PD"),

fileMenuName = _("MiG-25PD"),
version		 = "v1.0 for 2.5.4",		 
state		 = "installed",
info		 = _("The MiG-25 is a Soviet, supersonic interceptor that was among the fastest military aircraft to enter service. The MiG-25PD, that entered service in 1979, contains a new powerful radar with pylons for up to 4 air-to-air missiles."),
encyclopedia_path = current_mod_path..'/Encyclopedia',
binaries = bin,

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
--[[Options = 
	{
		{
			name 	   = _("MiG-25PD"),
			nameId     = "MiG-25PD",
			dir        = "Options",
			CLSID      = "{MiG-25PD options}",
		},
	},--]]
})
---------------------------------------------------------------------------------------
mount_vfs_texture_path	(current_mod_path .."/Skins/1/ME")	--for menu screen aircraft button
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shape/")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures/")

--mount_vfs_texture_path  (current_mod_path.."/Textures/339PAN.zip")
--mount_vfs_texture_path  (current_mod_path.."/Textures/339A.zip")
--mount_vfs_texture_path  (current_mod_path.."/Textures/Avionics/")
--mount_vfs_model_path    (current_mod_path.."/Cockpit/Resources/Model/Shape/MiG-25PD_cockpit")
local support_cockpit = current_mod_path..'/Cockpit/Scripts/'
if EFMenabled == true then 
	local FM = {self_ID, 'MiG-25PD_FM'}
	make_flyable('MiG-25PD', current_mod_path..'/Cockpit/Scripts/', nil, current_mod_path..'/comm.lua')
else
	make_flyable('MiG-25PD', current_mod_path..'/Cockpit/Scripts/', nil, current_mod_path..'/comm.lua')
end

dofile(current_mod_path..'/MiG-25PD.lua')
dofile(current_mod_path..'/Views.lua')
make_view_settings('MiG-25PD', ViewSettings, SnapViews)
---------------------------------------------------------------------------------------
--dofile(current_mod_path.."/Weapons/Weapons.lua") -- Smoke + Tank + POD GUN
--dofile(current_mod_path.."/Weapons/Weapons_Rocket.lua") -- RAZZIERA LR-25 + RAZZI SNIA-BPD ARF/8M3 HEI/API + LAU-10
--dofile(current_mod_path.."/Weapons/Weapons_BRD.lua") -- DISPENSER BDR + MK76
---------------------------------------------------------------------------------------
plugin_done()-- finish declaration , clear temporal data