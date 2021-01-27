dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local n_debug = false

local update_time_step = 0.02 -- 50 times per second
make_default_activity(update_time_step)


local sensor_data = get_base_data()

function post_initialize()
	local birth = LockOn_Options.init_conditions.birth_place
	-- "GROUND_COLD", "GROUND_HOT", "AIR_HOT"
	if birth == "GROUND_HOT" or birth == "AIR_HOT" then -- set conditions for hot
	
	elseif birth == "GROUND_COLD" then -- set conditions for cold
	
	end
end

function update()

end