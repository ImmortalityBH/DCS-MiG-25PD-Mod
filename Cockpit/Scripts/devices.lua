local count = 0
local function counter()
	count = count + 1
	return count
end
------DEVICE ID------
devices = {}
devices["KNEEBOARD"] = 			counter()--01
devices["CTRL_SURFACES"] = 		counter()--02
devices["WEAPON_SYSTEM"] = 		counter()--04
devices["ELECTRIC_SYSTEM"] = 	counter()--02
devices["FUEL_SYSTEM"] = 		counter()--02
devices["FLAPS"] = 				counter()--03
devices["GEAR"] = 				counter()--04
devices["AIRBRAKES"] = 			counter()--05
devices["PARACHUTE"] = 			counter()--02 
devices["CANOPY"] = 			counter()--05
devices["ARU"] = 				counter()--06
devices["SAU"] = 				counter()--07
devices["SRZO"] = 				counter()--04
devices["INTLET_RAMPS"] = 		counter()--07
devices["WARNING_LIGHTS"] = 	counter()--05
devices["LIGHTS"] = 			counter()--02
devices["RADAR"] = 				counter()--08
devices["GUNSIGHT"] = 			counter()--04
devices["ARK"] = 				counter()--04
devices["NAVCOMPUTER"] = 		counter()--06
devices["KPP"] = 				counter()--09
devices["NPP"] = 				counter()--10
devices["CLOCK"] =				counter()--10
devices["TRIM"] = 				counter()--11
devices["RADIO"] =				counter()--12
devices["INTERCOM"] = 			counter()--12
devices["OXYGEN"] = 			counter()--13
devices["CPT_GUAGES"] = 		counter()--14
devices["INFO_PRINTER"] = 		counter()--15
--devices["FUEL_PUMPS"] = counter() --03