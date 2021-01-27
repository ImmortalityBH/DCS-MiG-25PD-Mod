shape_name = "CPT_MiG-25P"
is_EDM = true
new_model_format = true
ambient_light    = {255,255,255}
ambient_color_day_texture    = {72, 100, 160}
ambient_color_night_texture  = {40, 60 ,150}
ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}

dusk_border = 0.4
draw_pilot = false

external_model_canopy_arg = 38

use_external_views = false

day_texture_set_value = 0.0
night_texture_set_value = 0.1

local controllers = LoRegisterPanelControls()

--[[mirrors_data = 
{

}--]]

--mirrors_draw = CreateGauge()
--mirror_draw.arg_number = 16
--mirrors_draw.input = {0,1}
--mirrors_draw.output = {1,0}
--mirrors_draw.controller = controllers.mirrors_draw

--Follow SU-25T for reference animation arg numbers

Canopy = CreateGauge()
Canopy.arg_number = 26
Canopy.input = {0,1}
Canopy.output = {0,0.9}
Canopy.controller = controllers.base_gauge_CanopyPos
--Canopy.controller = controllers.CockpitCanopy

CanopyLever    						= CreateGauge()
CanopyLever.arg_number 				= 129
CanopyLever.input   				= {0, 0.1, 0.9}
CanopyLever.output  				= {1, 0.4, 0.0}
CanopyLever.controller 				= controllers.base_gauge_CanopyPos

StickPitch							= CreateGauge()
StickPitch.arg_number				= 3
StickPitch.input					= {-100, 100}
StickPitch.output					= {-1, 1}
StickPitch.controller				= controllers.base_gauge_StickPitchPosition

StickBank							= CreateGauge()
StickBank.arg_number				= 2
StickBank.input						= {-100, 100}
StickBank.output					= {-1, 1}
StickBank.controller				= controllers.base_gauge_StickRollPosition

RudderPedals						= CreateGauge()
RudderPedals.arg_number				= 4
RudderPedals.input					= {-100,100}
RudderPedals.output					= {-1,1}
RudderPedals.controller				= controllers.base_gauge_RudderPosition

LeftBrakePedal						= CreateGauge("parameter")
LeftBrakePedal.arg_number			= 5
LeftBrakePedal.input				= {-1,1}
LeftBrakePedal.output				= {0,1}
LeftBrakePedal.parameter_name		= "LEFT_BRAKE_PEDAL"

RightBrakePedal						= CreateGauge("parameter")
RightBrakePedal.arg_number			= 6
RightBrakePedal.input				= {-1,1}
RightBrakePedal.output				= {0,1}
RightBrakePedal.parameter_name		= "RIGHT_BRAKE_PEDAL"

ThrottleLeft							= CreateGauge("parameter")
ThrottleLeft.arg_number					= 80
ThrottleLeft.input						= {-1, 1}
ThrottleLeft.output						= {-1, 1}
--Throttle.controller					= controllers.base_gauge_ThrottleLeftPosition
ThrottleLeft.parameter_name				= "THROTTLE_POSITION"

ThrottleRight = CreateGauge("parameters")
ThrottleRight.arg_number					= 80
ThrottleRight.input						= {-1, 1}
ThrottleRight.output						= {-1, 1}
--Throttle.controller					= controllers.base_gauge_ThrottleLeftPosition
ThrottleRight.parameter_name				= "THROTTLE_POSITION"



need_to_be_closed = true -- close lua state after initialization

Z_test = 
{
	near = 0.05,
	far  = 4.0,
}

livery = "default"