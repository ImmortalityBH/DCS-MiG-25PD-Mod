--aru control arm position script
local sensor_data = get_base_data()
local arustate = 0.0 
local mach 
local update_time_step = 0.01
make_default_activity(update_time_step)
--arupos indicator arg# = 2000
function update()

local mach = sensor_data:getMachNumber()

if mach > .75 and mach < 1.0 then
arustate = .2
else
if mach > 1.0 and mach < 1.4 then
arustate = .4
else
if mach > 1.4 and mach < 1.8 then
arustate = .6
else
if mach > 1.8 and mach < 2.2 then
arustate = .8
else
if mach > 2.2 and mach < 2.8 then
arustate = 1.0
else
set_aircraft_draw_argumet_value(2000, arustate)
end