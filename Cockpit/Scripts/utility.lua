-- random stuff that might be useful

-- decimals should be the decimal places desired
function round(number, decimals)
	local power = 10 ^ decimals
	return math.floor(number * power) / power
end

function normalize(value, min_val, max_val)
	average = (min_val + max_val) / 2
	range = (max_val - min_val) / 2
	return (value - average) / range
end

function clamp(value, min_val, max_val)
	if value < min_val then
		value = min_val
	elseif value > max_val then
		value = max_val
	end
	return value
end

function swap_command(command_value)
	if command_value == 0 then
		command_value = 1
	elseif command_value == 1 then
		command_value = 0
	end
	return command_value
end

function kg_to_pound(value)
	return value * 2.205
end

function pound_to_kg(value)
	return value / 2.205
end

function m_to_ft(value)
	return value * 3.281
end

function ft_to_m(value)
	return value / 3.281
end

function invert_bool(bool)
	if bool == true then
		bool = false
	elseif bool == false then
		bool = true
	end
	return bool
end

function start_print(...)
	print(...) -- print uses dcs log file
end

function debug_print(str, flag) -- flag is true/false
	if flag == true then
		print_message_to_user(str)
	end
end