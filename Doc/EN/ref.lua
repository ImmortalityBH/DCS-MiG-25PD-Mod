-- DCS LUA SCRIPTING REFERENCE --

GetDevice(devices.DEVICE):

dev = GetSelf()

dev:listen_command(Keys.PlaneKey)
dev:listen_event("")

update_time_step = 0.02
make_default_activity(update_time_step)

function post_initilize()
	local birth = LockOn_Options.init_conditions.birth_place
	if birth == "GROUND_HOT" or birth == "AIR_HOT" then
	elseif birth == "GROUND_COLD" then
	end
end

function update()
end
-- local update_time_step = 0.1
-- make_default_activity(update_time_step)
-- This would update 10 times a second (1/0.1=10)

function SetCommand(command, value)
end

function CockpitEvent(event, value)
	if event == "WeaponRearmComplete" then
	end
	--"GroundPowerOn"
	--"GroundPowerOff"
	--"WeaponRearmFirstStep"
	--"WeaponRearmSingleStepComplete"
	--"WheelChocksOn"
	--"WheelChocksOff"
end

local sensor_data = get_base_data()
-- getAngleOfAttack
-- getAngleOfSlide
-- getBarometricAltitude
-- getCanopyPos
-- getCanopyState
-- getEngineLeftFuelConsumption
-- getEngineLeftRPM
-- getEngineLeftTemperatureBeforeTurbine
-- getEngineRightFuelConsumption
-- getEngineRightRPM
-- getEngineRightTemperatureBeforeTurbine
-- getFlapsPos
-- getFlapsRetracted
-- getHeading
-- getHorizontalAcceleration
-- getIndicatedAirSpeed
-- getLandingGearHandlePos
-- getLateralAcceleration
-- getLeftMainLandingGearDown
-- getLeftMainLandingGearUp
-- getMachNumber
-- getMagneticHeading
-- getNoseLandingGearDown
-- getNoseLandingGearUp
-- getPitch
-- getRadarAltitude
-- getRateOfPitch
-- getRateOfRoll
-- getRateOfYaw
-- getRightMainLandingGearDown
-- getRightMainLandingGearUp
-- getRoll
-- getRudderPosition
-- getSpeedBrakePos
-- getSelfAirspeed
-- getSelfCoordinates
-- getSelfVelocity
-- getStickPitchPosition
-- getStickRollPosition
-- getThrottleLeftPosition
-- getThrottleRightPosition
-- getTotalFuelWeight
-- getTrueAirSpeed
-- getVerticalAcceleration
-- getVerticalVelocity
-- getWOW_LeftMainLandingGear
-- getWOW_NoseLandingGear
-- getWOW_RightMainLandingGear
set_aircraft_draw_argument_value(arg #, value)
--Directly control external animation arg.
get_aircraft_draw_argument_value(arg)
--Reads animation value of external arg.
set_cockpit_draw_argument_value(arg)
--Directly control interal animation arg.
get_cockpit_draw_argument_value(arg)
--Reads animation value of cockpit arg.

device:performClickableAction(command, value, true or false)
--This is used to ‘click’ a switch without using your mouse. This is used a lot for when a key is
--pressed and you want that key to move a switch.

dispatch_action(unknown, command, value)
-- Triggers command with value. Similar to device:performClickableAction() but doesn’t move the
-- switch. If you are not using an EFM you’ll need to use this to start and stop the engines:
dispatch_action(nil, iCommandEnginesStart)
get_param_handle(name)
-- This is used to set a param handle, best described as a global variable. It is useful for setting
-- animations in mainpanel.lua, getting information into indicators, and getting information between
-- an EFM and lua if you have an EFM. You use :set(value) and :get() to set and read it. Usage
-- would look like:
throttle_position = get_param_handle("THROTTLE_POSITION")
throttle_position:set(0.5)
throttle_position:get()