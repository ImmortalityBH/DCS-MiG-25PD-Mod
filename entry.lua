--[[------------------------------------------------------------------------------
--	MiG-25P Mod by Immortality and Shmoo42
--	
--------------------------------------------------------------------------------]]
-- set true to use EFM dll
local EFMenabled = false
local bin = {}

if EFMenabled == true then
	bin = {'MiG-25P'}
end

local self_ID = "MiG-25P"
declare_plugin(self_ID, { --  Ver. Release 1.0 DCS 2.5.6 10/30/20, special thanks to the MiG-25P Mod Discord community. 
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName = _("MiG-25P"),
developerName = "Immortality and Shmoo42",
fileMenuName = _("MiG-25P"),
version		 = "v1.0", -- __DCS_VERSION__ alternatively	 
state		 = "installed",
info		 = _("The MiG-25 is a Soviet, supersonic interceptor that was among the fastest military aircraft to enter service. The MiG-25P, that entered service in 1979, contains a powerful radar with pylons for up to 4 air-to-air missiles."),
encyclopedia_path = current_mod_path..'/Encyclopedia',
binaries = bin,

	linkBuy = {
        ED      = "https://www.digitalcombatsimulator.com/en/userfiles",
    },
	Skins = {
		{
			name	    = "MiG-25P",
			dir		    = "Theme",
		},
	},
	Missions = { --wow I can comment this is so cool
		{
			name		= _("MiG-25P"),
			dir			= "Missions",
			--CLSID		= "{CLSID5456456346CLSID}",	
		},
	},	
	LogBook = {
		{
			name		= _("MiG-25P"),
			type		= "MiG-25P",
		}, 
	},
	InputProfiles = {
		["MiG-25P"]   = current_mod_path..'/Input/MiG-25P/',
	},
	Options = {
		{
			name 	   = _("MiG-25P"),
			nameId     = "MiG-25P",
			dir        = current_mod_path..'/Options/',
			CLSID      = "{MiG-25P options}",
		},
	},
})
local support_cockpit = current_mod_path..'/Cockpit/Scripts/' -- path for devices all that crap
--MOUNTING

mount_vfs_texture_path	(current_mod_path .."/Theme/ME/") --for menu screen aircraft button
mount_vfs_model_path	(current_mod_path.."/Shapes/") -- mount main model paths
mount_vfs_texture_path  (current_mod_path.."/Textures/")
--mount_vfs_texture_path  (current_mod_path.."/Textures/MiG-25P.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/AAF/") -- textures appear in livery directory
mount_vfs_texture_path  (current_mod_path.."/Textures/IAF/")
mount_vfs_texture_path  (current_mod_path.."/Textures/LAF/")
mount_vfs_texture_path  (current_mod_path.."/Textures/SAF/")
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shapes/") -- mount cockpit model path and textures
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures/")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
--dofile(current_mod_path..'/Weapons/Weapons.lua')
dofile(current_mod_path..'/MiG-25P.lua')
dofile(current_mod_path..'/UnitPayloads/MiG-25P.lua')
--make_view_settings('MiG-25P', ViewSettings, SnapViews)

if EFMenabled == true then 
	local FM = {self_ID, 'MiG-25P_FM'}
	make_flyable('MiG-25P', support_cockpit, FM, current_mod_path..'/comm.lua')
else
	--make_flyable('MiG-25P', support_cockpit, nil, current_mod_path..'/comm.lua')
	--make_flyable('MiG-25P', support_cockpit, {'MiG-25P', nil, old = 54}, current_mod_path..'/comm.lua')
	make_flyable('MiG-25P', support_cockpit, nil, current_mod_path..'/comm.lua')
end

plugin_done()-- finish declaration , clear temporal data