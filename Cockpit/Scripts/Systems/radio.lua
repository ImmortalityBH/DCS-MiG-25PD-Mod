dofile(LockOn_Options.common_script_path.."Radio.lua")
dofile(LockOn_Options.common_script_path.."mission_prepare.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local gettext = require("i_18n")
_ = gettext.translate

dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local dev = GetSelf()

--[[GUI = {
	range = {}, 
	displayName = _(""),
	AM = true,
	FM = false,
} --]]

local update_time_step = 1 -- update 1 time every second
device_timer_dt = update_time_step

function post_initialize()
	--dev:set_frequency(256E6) -- Sochi
	--dev:set_modulation(MODULATION_AM)
	--local intercom = GetDevice(devices.INTERCOM)
	--intercom:set_communicator(devices.RADIO)
end

function SetCommand(command, value)
	
end


need_to_be_closed = false -- close lua state after initialization