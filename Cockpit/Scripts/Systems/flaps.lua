dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local n_debug = true

local update_time_step = 0.01
make_default_activity(update_time_step)
local sensor_data = get_base_data()

local FLAP_STATE = 0 -- 0 = up, 0.5 = takeoff, 1.0 = landing
local FLAP_COMMAND = 0 -- 0 = up, 1 = takeoff, 2 = landing

local FLAP_TIME = update_time_step / 6.5

dev:listen_command(Keys.PlaneFlaps)
dev:listen_command(Keys.PlaneFlapsUp)
dev:listen_command(Keys.PlaneFlapsDown)

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" or birth == "AIR_HOT" then
		--FLAP_STATE = 0
		--set_aircraft_draw_argument_value(9, FLAP_STATE) -- right flap
		--set_aircraft_draw_argument_value(10, FLAP_STATE) -- left flap
	elseif birth == "GROUND_COLD" then
		--FLAP_STATE = 0.5
		--set_aircraft_draw_argument_value(9, FLAP_STATE) -- right flap
		--set_aircraft_draw_argument_value(10, FLAP_STATE) -- left flap
    end
end

function SetCommand(command, value)
	if command == Keys.PlaneFlaps then
		if FLAP_COMMAND < 2 then
		    FLAP_COMMAND = FLAP_COMMAND + 1
		elseif FLAP_COMMAND == 2 then
		    FLAP_COMMAND = 0
		end
		debug_print("FLAP_COMMAND = "..tostring(FLAP_COMMAND), n_debug)
	elseif command == Keys.PlaneFlapsOn then
		if FLAP_COMMAND > 0 then
			FLAP_COMMAND = FLAP_COMMAND - 1
		end
		debug_print("FLAP_COMMAND = "..tostring(FLAP_COMMAND), n_debug)
	elseif command == Keys.PlaneFlapsOff then
		if FLAP_COMMAND < 2 then
			FLAP_COMMAND = FLAP_COMMAND + 1
		end
		debug_print("FLAP_COMMAND = "..tostring(FLAP_COMMAND), n_debug)
	end
end

function update_flaps()
	if FLAP_COMMAND == 0 and FLAP_STATE > 0 then
		FLAP_STATE = FLAP_STATE - FLAP_TIME
	elseif FLAP_COMMAND == 1 and FLAP_STATE < 1 then
		FLAP_STATE = FLAP_STATE + FLAP_TIME
	end
	
	FLAP_STATE = clamp(FLAP_STATE, 0, 1)
end

--function update_cockpit()

--end

function update()
	
	update_flaps()
	--update_cockpit()
	
	set_aircraft_draw_argument_value(9, FLAP_STATE) -- right flap
	set_aircraft_draw_argument_value(10, FLAP_STATE) -- left flap
end

need_to_be_closed = false -- close lua state after initialization
