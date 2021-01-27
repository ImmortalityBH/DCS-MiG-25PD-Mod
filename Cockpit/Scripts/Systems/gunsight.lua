dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local update_time_step = 0.05 -- 20 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()

local is_on = false -- STATE of gunsight switch rather than electrics

local gunsight_switch = get_param_handle("")
local gunsight_visible = get_param_handle("")

function post_initialize()
	local dev = GetSelf()
	local birth = LockOn_Options.init_conditions.birth_place
	
	
	-- "GROUND_COLD", "GROUND_HOT", "AIR_HOT"
	if birth == "GROUND_HOT" or birth == "AIR_HOT" then -- set conditions for hot
		is_on = true
		gunsight_visible:set(1)
	end
end

function SetCommand(command, value)
	if command = Keys.GUNSIGHT_SWITCH then
		if is_on == true then
			is_on = false
		elseif is_on == false then
			is_on = true	
		end
	end
end

function update() 
	if get_elec_primary_ac_ok() then --check is power is available
		if is_on == true then
			gunsight_visible:set(1)
		else
			gunsight_visible:set(0)	
		end
	else
		gunsight_visible:set(0)
	end
end

need_to_be_closed = false -- close lua state after initialization
