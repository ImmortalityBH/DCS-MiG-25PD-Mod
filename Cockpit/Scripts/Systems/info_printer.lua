dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local update_time_step = 1.25

make_default_activity(update_time_step)

local sensor_data = get_base_data()

function post_initialize()

end

local function round(number, decimals)
	local power = 10 ^ decimals
	return math.floor(number * power) / power
end

function SetCommand(command, value)
	if command == Keys.PlaneFonar then
		print_message_to_user("Canopy key value: "..value)
	end
end

function update()
	local fuel = sensor_data.getTotalFuelWeight()
	local mach = sensor_data.getMachNumber()
	local liter_per_upadate = 0.0408
	print_message_to_user("Fuel(KG): "..round(fuel, 0))
	print_message_to_user("Mach: "..round(mach, 1))
	print_message_to_user("Roll rate: "..round(sensor_data.getRateOfRoll(), 2))
end

need_to_be_closed = false -- close lua state after initialization