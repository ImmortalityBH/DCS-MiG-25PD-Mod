local device_count = 0

local increment_count( )
	device_count = device_count + 1
	return device_count
end

-- DEVICE ID's
devices = {}
devices["ELECTRIC_SYSTEM"] = increment_count()