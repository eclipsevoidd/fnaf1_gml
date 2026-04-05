audio_play_sound(snd_blip, 0, 0, 0.5);

// checks type of network event
var net_event_type = async_load[? "type"];

// only check if the server sent us raw data
if (net_event_type == network_type_data) {
    
	// this extracts the raw info from the server dictionary
    var packet_buffer = async_load[? "buffer"];

	// read and write data from the server data
    buffer_seek(packet_buffer, buffer_seek_start, 0);
    var json_string = buffer_read(packet_buffer, buffer_string);
    
	// parses the json string data
    var packet = json_parse(json_string);
    
    if (packet.command == "match_found") {
        
        global.shared_seed = packet.seed;
        
        current_state = GAME_STATE.NIGHT_COUNTDOWN;
        countdown_timer = 5;
        
		audio_play_sound(snd_blip, 0, 0, 0.5);
        show_debug_message("Match Found! Shared Seed is: " + string(global.shared_seed));
        
        execute after 2 seconds // 2 second cooldown before starting to load in
			execute every 1 second
	            o_GameManager.countdown_timer -= 1;
	            audio_play_sound(snd_blip, 0, 0, 0.5);
			
	            if (o_GameManager.countdown_timer <= 0) {
                
	                // Prefetch textures later
                
	                // Change the state and room
	                o_GameManager.current_state = GAME_STATE.PLAYING;
	                room_goto(rm_Office);
                
	                // FIXED: Removed the semicolon to make Feather happy
	                disable 
	            }
	        done
		done
        
    }
}