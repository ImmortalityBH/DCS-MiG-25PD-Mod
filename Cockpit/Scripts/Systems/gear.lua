dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local n_debug = false

local update_time_step = 0.01
make_default_activity(update_time_step)
local sensor_data = get_base_data()

--local GearHandle = device_commands.Gear

local GEAR_STATE = 0 -- 0 = up, 1 = down
local GEAR_COMMAND = 0 -- 0 = up, 1 = down
local GEAR_WOW = 0 -- weight on all wheels in KG

local GEAR_TIME_IN = update_time_step / 5
local GEAR_TIME_OUT = update_time_step / 3

local BRAKE_COMMAND = 0 -- 0 = off, 1 = on

dev:listen_command(Keys.PlaneGear)
dev:listen_command(Keys.PlaneGearUp)
dev:listen_command(Keys.PlaneGearDown)
dev:listen_command(Keys.PlaneWheelBrakesOn)
dev:listen_command(Keys.PlaneWheelBrakesOff)

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" then
		GEAR_STATE = 1
		GEAR_COMMAND = 1 
	elseif birth == "AIR_HOT" then
		GEAR_STATE = 0
		GEAR_COMMAND = 0
	elseif birth == "GROUND_COLD" then
		GEAR_STATE = 1
		GEAR_COMMAND = 1
    end
	set_aircraft_draw_argument_value(0, GEAR_STATE)
	set_aircraft_draw_argument_value(3, GEAR_STATE)
	set_aircraft_draw_argument_value(5, GEAR_STATE)
end

function SetCommand(command, value)
	if command == Keys.PlaneGear then
		GEAR_COMMAND = swap_command(GEAR_COMMAND)
		debug_print("Gear command = "..tostring(GEAR_COMMAND), n_debug)
	elseif command == Keys.PlaneGearUp then
		GEAR_COMMAND = 0
		debug_print("Gear command = "..tostring(GEAR_COMMAND), n_debug)
	elseif command == Keys.PlaneGearDown then
		GEAR_COMMAND = 1
		debug_print("Gear command = "..tostring(GEAR_COMMAND), n_debug)
	elseif command == Keys.PlaneHook then
		HOOK_COMMAND = swap_command(HOOK_COMMAND)
	end
	
	if command == Keys.PlaneWheelBrakesOn then
		BRAKE_COMMAND = 1
	elseif command == Keys.PlaneWheelBrakesOff then
		BRAKE_COMMAND = 0
	end
	-- elseif command == device_commands.wheelbrake_AXIS then
	
	-- elseif command == device_commands.left_wheelbrake_AXIS then
	
	-- elseif command == device_commands.right_wheelbrake_AXIS then
	
	-- end
end

function update_gear()
	if GEAR_WOW == 0 then
		if GEAR_COMMAND == 0 and GEAR_STATE > 0 then
			GEAR_STATE = GEAR_STATE - GEAR_TIME_IN
		elseif GEAR_COMMAND == 1 and GEAR_STATE < 1 then
			GEAR_STATE = GEAR_STATE + GEAR_TIME_OUT
		end
		
		GEAR_STATE = clamp(GEAR_STATE, 0 , 1)
	end
end

function update_cockpit()

end

function update()
	GEAR_WOW = sensor_data.getWOW_NoseLandingGear() + sensor_data.getWOW_LeftMainLandingGear() + sensor_data.getWOW_RightMainLandingGear()
	
	update_gear()
	--update_cockpit()
	set_aircraft_draw_argument_value(0, GEAR_STATE)
	set_aircraft_draw_argument_value(3, GEAR_STATE)
	set_aircraft_draw_argument_value(5, GEAR_STATE)

	local rudder = sensor_data.getRudderPosition() / 100
	if GEAR_WOW > 0 then
		set_aircraft_draw_argument_value(2, -rudder) -- main wheel rot
	end	
end

need_to_be_closed = false -- close lua state after initialization