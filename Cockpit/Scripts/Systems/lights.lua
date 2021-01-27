dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local update_time_step = 0.05 -- 20 times per second
make_default_activity(update_time_step)

local n_debug = false

local sensor_data = get_base_data()

local LANDING_STATE = 0 -- 0 = off, 1 = low, 2 = high
local LANDING_COMMAND = 0
local NAV_STATE = 0 -- 0 - off, 1 = on, 2 = flash
local NAV_COMMAND = 0
local NAV_TIME = update_time_step / 0.5

local landing_light_arg = 208 -- 208
local navigation_light_red_arg = 190 -- 190
local navigation_light_green_arg = 191 -- 191
local navigation_light_white_arg = 192 -- 192

dev:listen_command(Keys.PlaneLightsOnOff)
dev:listen_command(Keys.PlaneHeadLightOnOff)
--dev:listen_command()

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" then--"GROUND_COLD","GROUND_HOT","AIR_HOT"
		LANDING_COMMAND = 0
		NAV_COMMAND = 0
	elseif birth == "AIR_HOT" then --"GROUND_COLD","GROUND_HOT","AIR_HOT"
		LANDING_COMMAND = 0
		NAV_COMMAND = 0
	elseif birth == "GROUND_COLD" then
		LANDING_COMMAND = 0
		NAV_COMMAND = 0
    end
end

function SetCommand(command, value)
	if command == Keys.PlaneLightsOnOff then
		if NAV_COMMAND < 2 then
			NAV_COMMAND = NAV_COMMAND + 1
		elseif NAV_COMMAND == 2 then
			NAV_COMMAND = 0
		end
	elseif command == Keys.PlaneHeadLightOnOff then
		if LANDING_COMMAND < 2 then
			LANDING_COMMAND = LANDING_COMMAND + 1
		elseif LANDING_COMMAND == 2 then
			LANDING_COMMAND = 0
		end
	end
end

function update()
	-- warp with power check
	if NAV_COMMAND == 1 then
		NAV_STATE = 1
	elseif NAV_COMMAND == 2 then
		if NAV_STATE > 0 then
			NAV_STATE = NAV_STATE - NAV_TIME
		elseif NAV_STATE < 1 then
			NAV_STATE = NAV_STATE + NAV_TIME
		end
		
		if NAV_STATE > 1 then
			NAV_STATE = 1
		elseif NAV_STATE < 0 then
			NAV_STATE = 0
		end
	elseif NAV_COMMAND == 0 then
		NAV_STATE = 0
	end
	--LANDING LIGHT NEEDS TO BE PROPERLY ANIMATED
	if LANDING_COMMAND == 1 then
		LANDING_STATE = 0.5
	elseif LANDING_COMMAND == 2 then
		LANDING_STATE = 1
	elseif LANDING_COMMAND == 0 then
		LANDING_STATE = 0
	end
	
	set_aircraft_draw_argument_value(navigation_light_green_arg, NAV_STATE)
	set_aircraft_draw_argument_value(navigation_light_red_arg, NAV_STATE)
	set_aircraft_draw_argument_value(navigation_light_white_arg, NAV_STATE)
	set_aircraft_draw_argument_value(landing_light_arg, LANDING_STATE)
end

need_to_be_closed = false -- close lua state after initialization
