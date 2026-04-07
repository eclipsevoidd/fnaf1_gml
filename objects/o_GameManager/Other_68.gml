var net_event_type = async_load[? "type"];

// ======================================================================
// 1. CONNECTION LISTENER
// ======================================================================
if (net_event_type == network_type_non_blocking_connect) {
    if (async_load[? "succeeded"]) {
        
        var payload = {}; // Create an empty struct
        
        // Check WHY we connected, and build the correct packet!
        if (connection_intent == "host") {
            payload = {
                command: "host_match",
                settings: global.match_settings 
            };
        } else if (connection_intent == "browse") {
            payload = {
                command: "get_rooms"
            };
        }
        
        // Send it
        var json_string = json_stringify(payload);
        var buff = buffer_create(string_byte_length(json_string), buffer_fixed, 1);
        buffer_write(buff, buffer_text, json_string);
        network_send_raw(client_socket, buff, buffer_tell(buff));
        buffer_delete(buff);
    }
}

// ======================================================================
// 2. DATA LISTENER
// ======================================================================
if (net_event_type == network_type_data) {
    var packet_buffer = async_load[? "buffer"];
    buffer_seek(packet_buffer, buffer_seek_start, 0);
    var json_string = buffer_read(packet_buffer, buffer_string);
    var packet = json_parse(json_string);
    
    // SERVER SAYS: You successfully hosted a room!
    if (packet.command == "room_created") {
        current_state = GAME_STATE.HOST_WAITING;
        
        // NEW: Save the Room ID!
        global.my_room_id = packet.roomId; 
        
        show_debug_message("Sitting in room: " + packet.roomId + " waiting for players...");
    }
    
    // SERVER SAYS: Here is the list of active rooms!
    if (packet.command == "room_list") {
        global.active_server_list = packet.rooms;
		
		for (var i = 0; i < array_length(global.active_server_list); i++) {
            global.active_server_list[i].current_scale = 1.0;
            global.active_server_list[i].target_scale = 1.0;
            global.active_server_list[i].was_hovered = false;
        }
		
        current_state = GAME_STATE.BROWSER;
        show_debug_message("Received " + string(array_length(global.active_server_list)) + " rooms from server.");
    }
    
    // SERVER SAYS: The match is starting! (Both players receive this)
    if (packet.command == "match_found") {
        global.shared_seed = packet.seed;
        
        if (!is_undefined(packet.settings) && packet.settings != pointer_null) {
            global.match_settings = packet.settings;
        }
        
        current_state = GAME_STATE.NIGHT_COUNTDOWN;
        countdown_timer = 5;
        audio_play_sound(snd_blip, 0, 0, 0.5);
        
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
	
	// SERVER SAYS: Here are your opponent's live stats!
    if (packet.command == "match_update") {
        global.opponent_power = packet.power;
        global.opponent_timeAM = packet.timeAM;
        global.opponent_dead = packet.dead;
    }
    
    // SERVER SAYS: Your opponent rage-quit or lost connection!
    if (packet.command == "opponent_disconnected") {
        show_debug_message("Opponent disconnected! You win by default!");
        // win screen here
    }
}