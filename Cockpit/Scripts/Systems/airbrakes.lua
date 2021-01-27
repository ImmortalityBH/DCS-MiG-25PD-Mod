dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")
--maximum deflection angle of 45 degrees

local dev = GetSelf()

local n_debug = false -- for debug message

local update_time_step = 0.02 -- 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()

-- AXIS AND STATE VALUES
local AIRBRAKE_STATE = 0 -- 0 = closed, 1 = open
local AIRBRAKE_COMMAND = 0 -- 0 = closed, 1 = open
local AIRBRAKE_TIME = update_time_step / 3

dev.listen_command(Keys.PlaneAirbrake)
dev.listen_command(Keys.PlaneAirbrakeOn)
dev.listen_command(Keys.PlaneAirbrakeOff)
--dev:listen_command(device_commands.wheelbrake_AXIS)
--local airbrake_indication = get_param_handle("AIRBRAKE_CAUTION")

function post_initialize()
	local birth = LockOn_Options.init_conditions.birth_place
	-- "GROUND_COLD", "GROUND_HOT", "AIR_HOT"
	if birth == "GROUND_HOT" or birth == "AIR_HOT" then -- set conditions for hot
	
	elseif birth == "GROUND_COLD" then -- set conditions for cold
	
	end
end

function SetCommand(command, value)
	if command == Keys.PlaneAirbrake then
		if AIRBRAKE_COMMAND == 0 then
			AIRBRAKE_COMMAND = 1
		elseif AIRBRAKE_COMMAND == 1 then
			AIRBRAKE_COMMAND = 0
		end
	elseif command == Keys.PlaneAirbrakeOn then
		AIRBRAKE_COMMAND = 1
	elseif command == Keys.PlaneAirbrakeOff then
		AIRBRAKE_COMMAND = 0
	end
	-- elseif command == device_commands.airbrake then
	
	-- end
end

function update_airbrake()
	if AIRBRAKE_COMMAND == 0 and AIRBRAKE_STATE > 0 then
		AIRBRAKE_STATE = AIRBRAKE_STATE - AIRBRAKE_TIME
	elseif AIRBRAKE_COMMAND == 1 and AIRBRAKE_STATE < 1 then
		AIRBRAKE_STATE = AIRBRAKE_STATE + AIRBRAKE_TIME
	end
	
	AIRBRAKE_STATE = clamp(AIRBRAKE_STATE, 0, 1)
end

--function update_cockpit()

--end

function update()
	
	update_airbrake()
	--update_cockpit()
	
	set_aircraft_draw_argument_value(182, AIRBRAKE_STATE) --top
	--set_aircraft_draw_argument_value(184, AIRBRAKE_STATE) --bottom
end

need_to_be_closed = false -- close lua state after initialization