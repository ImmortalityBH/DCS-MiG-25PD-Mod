-- Functions to get state of electric system variables

function get_elec_main_on()
    return elec_main_on:get() == 1 and true or false
end

function debug_print_electrics()
    print_message_to_user("Electric_main: "..tostring())
end

elec_main_on = get_param_handle("ELEC_ON")
