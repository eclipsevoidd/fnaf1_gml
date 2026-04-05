var net_event_type = async_load[? "type"];

// ======================================================================
// 1. CONNECTION LISTENER
// Wait for the socket to successfully open BEFORE sending our settings
// ======================================================================
if (net_event_type == network_type_non_blocking_connect) {
    var succeeded = async_load[? "succeeded"];
    
    if (succeeded) {
        show_debug_message("Socket fully connected! Sending match rules...");
        
        // Now that the door is open, send our rules to the server
        var payload = {
            command: "host_match",
            settings: global.match_settings 
        };
        
        var json_string = json_stringify(payload);
        var buff = buffer_create(string_byte_length(json_string), buffer_fixed, 1);
		buffer_write(buff, buffer_text, json_string);
		network_send_raw(client_socket, buff, buffer_tell(buff));
		buffer_delete(buff);
    }
}

// ======================================================================
// 2. DATA LISTENER
// This is your existing code that catches the MATCH_FOUND packet
// ======================================================================
if (net_event_type == network_type_data) {
    
    var packet_buffer = async_load[? "buffer"];
    buffer_seek(packet_buffer, buffer_seek_start, 0);
    var json_string = buffer_read(packet_buffer, buffer_string);
    var packet = json_parse(json_string);
    
    if (packet.command == "match_found") {
        global.shared_seed = packet.seed;
        
        // SAFETY NET: Only overwrite local settings if the server actually sent them!
		// We use is_undefined() and check against pointer_null (GameMaker's version of null)
		if (!is_undefined(packet.settings) && packet.settings != pointer_null) {
    
		    global.match_settings = packet.settings;
    
		} else {
		    show_debug_message("WARNING: Server sent empty settings. Using local defaults.");
		}
        
        current_state = GAME_STATE.NIGHT_COUNTDOWN;
        countdown_timer = 5;
        
        audio_play_sound(snd_blip, 0, 0, 0.5);
        
        show_debug_message("Match Found! Length: " + string(global.match_settings.matchLength) + " mins");
        show_debug_message("Shared Seed is: " + string(global.shared_seed));
        
        // The Muffel Countdown
        execute after 2 seconds
            execute every 1 second
                o_GameManager.countdown_timer -= 1;
                audio_play_sound(snd_blip, 0, 0, 0.5);
                
                if (o_GameManager.countdown_timer <= 0) {
                    o_GameManager.current_state = GAME_STATE.PLAYING;
                    room_goto(rm_Office);
                    disable 
                }
            done
        done
    }
}