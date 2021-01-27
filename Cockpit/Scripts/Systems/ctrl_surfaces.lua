dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local update_time_step = 0.02 -- 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()

function post_initialize()

end

function update()
	local pitch = sensor_data.getStickPitchPosition() / 100
	local roll = sensor_data.getStickRollPosition() / 100
	local rudder = sensor_data.getRudderPosition() / 100
	
	set_aircraft_draw_argument_value(11, pitch) -- right aileron
	set_aircraft_draw_argument_value(12, -pitch) -- left aileron
	
	set_aircraft_draw_argument_value(15, roll) -- right elevator
	set_aircraft_draw_argument_value(16, roll) -- left elevator
	
	set_aircraft_draw_argument_value(17, -rudder) -- right rudder
	set_aircraft_draw_argument_value(18, -rudder) -- left rudder

end

need_to_be_closed = false -- close lua state after initialization