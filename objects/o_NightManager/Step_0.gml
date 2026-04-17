if (!global.is_dead) {
    
    // 1. Create a universal delta-time variable for the whole event
    var dt = delta_time / 1000000; 

    // ==========================================
    // POWER & USAGE
    // ==========================================
    var calculated_usage = 1; 
    
    // constant usage calculation
    if (global.left_door_closed) calculated_usage += 1;
    if (global.right_door_closed) calculated_usage += 1;
    if (global.left_light_on) calculated_usage += 1;
    if (global.right_light_on) calculated_usage += 1;
    if (global.camera_up) calculated_usage += 1;
    
    current_usage = calculated_usage;
    
    // power stuff
    if (global.power_raw > 0) {
        var passive_drain = 1 / 3; 
        
        // We can just use our clean 'dt' variable here now!
        global.power_raw -= (current_usage + passive_drain) * dt;
        
        if (global.power_raw < 0) global.power_raw = 0;
        
        global.power_display = floor(global.power_raw / 10);
        
        if (global.power_raw <= 0) {
            // power out sequence
        }
    }
    
    // ==========================================
    // TIME & CLOCK
    // ==========================================
    // match timer ends
    if (match_timeout_timer.tick()) {
        show_debug_message("Match timer ended.");
    }
    
    if (night_timer.tick()) {
        show_debug_message("6 AM");
    } else {
        var elapsed_time = night_timer.get_elapsed_time();
        var hours_passed = floor(elapsed_time / 90);
        
        // Format it so it reads "12" instead of "0"
        global.currentHour = (hours_passed == 0) ? 12 : hours_passed;
    }

    // ==========================================
    // THE AI DIRECTORS
    // ==========================================
    // Look how incredibly clean this is now! 
    // They handle their own internal timers, so we just feed them the delta-time.
    if (global.currentHour != 6) { 
        bonnie.update(dt);
        chica.update(dt);
        // foxy.update(dt);
        // freddy.update(dt);
    }

    // ==========================================
    // MULTIPLAYER STUFF
    // ==========================================
    if (heartbeat_timer.tick()) {
        
        // ONLY send network data if we are actually playing online!
        if (!global.offline_debug) {
            
            var payload = {
                command: "match_update",
                power: global.power_display,
                timeAM: global.currentHour,
                dead: global.is_dead
            };
            
            var json_string = json_stringify(payload);
            var buff = buffer_create(string_byte_length(json_string), buffer_fixed, 1);
            buffer_write(buff, buffer_text, json_string);
            
            // Double check the socket exists just to be extra safe
            if (o_GameManager.client_socket != -1) {
                network_send_raw(o_GameManager.client_socket, buff, buffer_tell(buff));
            }
            
            buffer_delete(buff);
        }
    }
}