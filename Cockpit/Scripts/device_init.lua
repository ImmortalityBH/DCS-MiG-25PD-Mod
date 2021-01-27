dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")
--[[attributes = {"support_for_cws",}--]] -- support for FC3 avionics

--layoutGeometry = {}
--MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua", {}, 
--}

creators = {}
creators[devices.WEAPON_SYSTEM] = {"avSimpleWeaponSystem", LockOn_Options.script_path.."Systems/weapon_system.lua"}
creators[devices.ELECTRIC_SYSTEM] = {"avSimpleElectricSystem", LockOn_Options.script_path.."Systems/electric_system.lua"}
--creators[devices.RADAR] = {"avSimpleRadar", LockOn_Options.script_path.."Systems/radar_init.lua"}
--creators[devices.CLOCK] = {"avAChS_1", LockOn_Options.script_path.."clock.lua"}
creators[devices.INFO_PRINTER] = {"avLuaDevice", LockOn_Options.script_path.."Systems/info_printer.lua"}
creators[devices.CTRL_SURFACES] = {"avLuaDevice", LockOn_Options.script_path.."Systems/ctrl_surfaces.lua"}
creators[devices.INTERCOM] = {"avIntercom", LockOn_Options.script_path.."Systems/intercom.lua", {devices.RADIO} }
creators[devices.RADIO] = {"avBaseRadio", LockOn_Options.script_path.."Systems/radio.lua", {devices.INTERCOM, devices.ELECTRIC_SYSTEM} }
creators[devices.GEAR] = {"avLuaDevice", LockOn_Options.script_path.."Systems/gear.lua"}
creators[devices.FLAPS] = {"avLuaDevice", LockOn_Options.script_path.."Systems/flaps.lua"}
--creators[devices.AIRBRAKES] = {"avLuaDevice", LockOn_Options.script_path.."Systems/airbrakes.lua"}
creators[devices.PARACHUTE] = {"avLuaDevice", LockOn_Options.script_path.."Systems/parachute.lua"}
creators[devices.LIGHTS] = {"avLuaDevice", LockOn_Options.script_path.."Systems/lights.lua"}
creators[devices.CANOPY] = {"avLuaDevice", LockOn_Options.script_path.."Systems/canopy.lua"}
--creators[deivces.GUNSIGHT] = {"avLuaDevice", LockOn_Options.script_path. ."Systems/gunsight.lua"}

indicators = {}
--indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HUD/Indicator/init.lua", nil, {{"PNT_HUD_CENTER","PNT_HUD_DOWN","PNT_HUD_RIGHT"}}}
--indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."RADAR/Indicator/init.lua",nil,{{},{sz_l = -0.35, sx_l = -0.50, sy_l =  -0.07},1}}
indicators[#indicators + 1] = {"ccControlsIndicatorBase", LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua", nil}
--indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."RADAR/Indicator/init.lua", nil, {{"PNT_RADAR_CENTER","PNT_RADAR_DOWN","PNT_RADAR_RIGHT"}}}

disable_kneeboard_render_target = false
is_left = true
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
--dofile(LockOn_Options.common_script_path.."PADLOCK/PADLOCK_declare.lua")
--creators[devices.KNEEBOARD] = {"avKneeboard", LockOn_Options.common_script_path.."KNEEBOARD/device/init.lua"}
