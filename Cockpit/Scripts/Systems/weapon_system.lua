dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utility.lua")

local weapon_system = GetSelf()
local n_debug = true

local update_time_step = 0.02 -- 20 times per second
make_default_activity(update_time_step)

local num_of_stations = 4
local selected_station = 1
local ext_pylons_num = {1,2,3,4}
local ext_pylons_args = {308,309,310,311}

local pickle_on = false
local launch_once = false
local seeker_locked = false
local seeker_lock_param = get_param_handle("WS_IR_MISSILE_LOCK")
--real mig-25 weapons release took a few seconds add a timer
--local seeker = nil
weapon_system:listen_command(Keys.PlaneJettisonWeapons)
weapon_system:listen_command(Keys.PlanePickleOn)
weapon_system:listen_command(Keys.PlanePickleOff)
weapon_system:listen_command(Keys.PlaneChangeWeapon)

function pylon_visibility_check()
	for i = 1, num_of_stations do
		local station_info = weapon_system:get_station_info(i - 1)
		if station_info.count == 0 then
			set_aircraft_draw_argument_value(ext_pylons_args[i], 1)
		else
			set_aircraft_draw_argument_value(ext_pylons_args[i], 0)
		end
	end
end

function check_seeker()
	local station_info = weapon_system:get_station_info(selected_station)
	if station_info.CLSID == "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}" then
		if seeker_lock_param:get() == 1 then
			seeker_locked = true
			--seeker:stop()
			--seeker:play_continue()
			print_message_to_user("LOCKED ON")
		elseif seeker_lock_param:get() == 0 then
			seeker_locked = false
			--seeker:stop()
		end
	end
end

function post_initialize()

	--sndhost = create_sound_host("COCKPIT_ARMS", "HEADPHONES", 0, 0, 0)
	--seeker:create_sound("Aircrafts/MiG-25P/Cockpit/missile_seeker")
	
	local birth = LockOn_Options.init_conditions.birth_place
	if birth == "GROUND_HOT" or birth == "AIR_HOT" then
	
	elseif birth == "GROUND_COLD" then
	
	end
	pylon_visibility_check()
	weapon_system:select_station(1)
end

function SetCommand(command, value)
	if command == Keys.PlaneJettisonWeapons then
	
	elseif command == Keys.PlanePickleOn then
		pickle_on = true
	elseif command == Keys.PlanePickleOff then
		pickle_on = false
	elseif command == Keys.PlaneChangeWeapon then
		if selected_station < 4 then
			selected_station = selected_station + 1
		elseif selected_station == 4 then
			selected_station = 1
		end
		print_message_to_user("SELECTED WEAPON = "..selected_station)
	end
end

function CockpitEvent(event, value)
	if event == "WeaponRearmComplete" then
		pylon_visibility_check()
	end
end

--function CockpitEvent(command, value)
--end

function update()
	local gear_state = get_aircraft_draw_argument_value(0)
	if gear_state > 0 then
	
	end
	
	--weapon_system:select_station(selected_station)
	
	check_seeker()
	
	for i = 1, num_of_stations do
		local station_info = weapon_system:get_station_info(i - 1)
		if pickle_on == true and station_info.count > 0 and launch_once == false then
			weapon_system:launch_station(i - 1)
			launch_once = true
		elseif pickle_on == false and launch_once == true then
			launch_once = false
		end
	end
	
	--debug_print("Chaff count remaing"..tostring(weapon_system:get_chaff_count()).." Flare count remaining"..tostring(weapon_system:get_flare_count()), n_debug)
end

need_to_be_closed = false -- close lua state after initialization
--[[
available functions for avSimpleWeaponSystem:
["get_station_info"].CLSID, .count, .weapon.level2, .weapon.level3 
["set_ECM_status"] 
["get_ECM_status"]  
["launch_station"] 
["select_station"] 
["emergency_jettison"]  
["emergency_jettison_rack"] 
["set_target_range"]  
["set_target_span"]  
["get_target_range"]  
["get_target_span"]  
["get_flare_count"]  
["drop_flare"] 
["get_chaff_count"] 
["drop_chaff"] 

["listen_event"]  
["performClickableAction"] 
["SetDamage"] 
["listen_command"] 
["SetCommand"] 

sndhost:play_continue()
sndhost:stop()
--]]