dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local update_time_step = 0.01
make_default_activity(update_time_step)
local sensor_data = get_base_data()

local CHUTE_STATE = 0 -- 0 = closed, 1 = exteneded
local CHUTE_COMMAND = 0 -- 0 = closed, 1 = exteneded

local CHUTE_TIME_IN = update_time_step / 0.25
local CHUTE_TIME_OUT = update_time_step / 0.09

dev:listen_command(Keys.PlaneParachute)

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" or birth == "AIR_HOT" then
		
	elseif birth=="GROUND_COLD" then
		
    end
end

function SetCommand(command, value)
	if command == Keys.PlaneParachute then
		if CHUTE_COMMAND == 0 then
			CHUTE_COMMAND = 1
		elseif CHUTE_COMMAND == 1 then
			CHUTE_COMMAND = 0
		end
	end
end

function update_chute()

	if CHUTE_COMMAND == 0 and CHUTE_STATE > 0 then
		CHUTE_STATE = CHUTE_STATE - CHUTE_TIME_IN
	elseif CHUTE_COMMAND == 1 and CHUTE_STATE < 1 then
		CHUTE_STATE = CHUTE_STATE + CHUTE_TIME_OUT
	end
	
	if CHUTE_STATE > 1 then
		CHUTE_STATE = 1
	elseif CHUTE_STATE < 0 then
		CHUTE_STATE = 0
	end

end

--function update_cockpit()

--end

function update()
	
	update_chute()
	--update_cockpit()
	
	set_aircraft_draw_argument_value(35, CHUTE_STATE) -- parachute arg
	
end

need_to_be_closed = false -- close lua state after initialization