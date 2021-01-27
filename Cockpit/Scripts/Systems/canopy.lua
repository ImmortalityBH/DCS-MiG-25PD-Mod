dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local dev = GetSelf()

local n_debug = false

local update_time_step = 0.02 -- 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()

local canopy_external_arg = 38
local canopy_cpt_lever_arg = 129

--Creating local variables
local initial_canopy = get_aircraft_draw_argument_value(canopy_ext_anim_arg)
local CANOPY_STATE = 0   -- 0 closing, 1 opening, 2 jettisoned
if (initial_canopy > 0) then
    CANOPY_STATE = 1
end

dev:listen_command(Keys.PlaneFonar)
--dev:listen_command()

function SetCommand(command, value)
    if command == Keys.PlaneFonar then
        if CANOPY_STATE >= 1 then
          CANOPY_STATE = 1 - CANOPY_STATE
        end
    end
end

--local prev_canopy_pos = -1
function update()
  local curr_canopy_pos = get_aircraft_draw_argument_value(canopy_external_arg)
  if curr_canopy_pos > 0.95 then
    CANOPY_STATE = 2 -- canopy jettisoned
  end
  if CANOPY_STATE == 0 and curr_canopy_pos > 0 then
	-- lower canopy
	curr_canopy_pos = curr_canopy_pos - 0.01
	set_aircraft_draw_argument_value(canopy_ext_anim_arg, curr_canopy_pos)
  elseif CANOPY_STATE == 1 and curr_canopy_pos <= 0.89 then
	-- raise canopy
	curr_canopy_pos = curr_canopy_pos + 0.01
	set_aircraft_draw_argument_value(canopy_ext_anim_arg, curr_canopy_pos)
  end
  --local lever_pos = get_aircraft_draw_argument_value(canopy_external_arg)
  
  --if prev_canopy_pos ~= lever_pos then
        --local canopy_lever_clickable_ref = get_clickable_element_reference("PNT_129")
      --  canopy_lever_clickable_ref:update() -- ensure the connector moves too
    --    prev_canopy_val = cockpit_lever
  --end
end

function CockpitEvent(event, val)
  if event == "repair" then
    CANOPY_STATE = 1
  end
end

need_to_be_closed = false -- close lua state after initialization
