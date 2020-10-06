
local sensor_data = get_base_data()

local update_time_step = 0.01
make_default_activity(update_time_step)

function update()
	local fuel_state = sensor_data.getTotalFuelWeight()
	print_message_to_user('Fuel state '..fuel_state)
end