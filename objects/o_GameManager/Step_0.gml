var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var mouse_clicked = mouse_check_button_pressed(mb_left);

switch (current_state) {
    case GAME_STATE.MENU:
        if (!audio_is_playing(mus_mainRemastered)) {
            audio_play_sound(mus_mainRemastered, 0, true, 0.5);
        }
		
		if (keyboard_check_pressed(vk_f1)) {
            show_debug_message("DEVELOPER MODE: Launching Offline Office...");
            
            // 1. Tell the game we are playing offline
            global.offline_debug = true;
            
            // 2. Fake the server data!
            global.shared_seed = irandom(65535); 
            
            // 3. Jump straight to the game
            current_state = GAME_STATE.PLAYING;
            room_goto(rm_Office);
        }
        break;
    case GAME_STATE.HOST_LOBBY:
        // Any specific host lobby step logic (if needed later)
        break;
        
    case GAME_STATE.BROWSER:
        var num_rooms = array_length(global.active_server_list);
        
        for (var i = 0; i < num_rooms; i++) {
            var room_data = global.active_server_list[i];
            var yy = 250 + (i * 80);
            
            var x1 = display_get_gui_width() / 2 - 300;
            var y1 = yy - 30;
            var x2 = display_get_gui_width() / 2 + 300;
            var y2 = yy + 30;
            
            var is_hovered = point_in_rectangle(mx, my, x1, y1, x2, y2);
            
            if (is_hovered) {
                room_data.target_scale = 1.15;
                
                if (!room_data.was_hovered) {
                    audio_play_sound(snd_blip, 0, 0, 0.2);
                }
            } else {
                room_data.target_scale = 1.0;
            }
            
            room_data.was_hovered = is_hovered;
            room_data.current_scale = lerp(room_data.current_scale, room_data.target_scale, 0.2);
            
            if (is_hovered && mouse_clicked) {
                audio_play_sound(snd_click, 0, 0, 0.35);
                
                var target_room_id = room_data.roomId;
                var payload = { command: "join_match", roomId: target_room_id };
                
                var json_string = json_stringify(payload);
                var buff = buffer_create(string_byte_length(json_string), buffer_fixed, 1);
                buffer_write(buff, buffer_text, json_string);
                network_send_raw(client_socket, buff, buffer_tell(buff));
                buffer_delete(buff);
            }
        }
        break;
        
    case GAME_STATE.CONNECTING:
        break;
        
    case GAME_STATE.NIGHT_COUNTDOWN:
        break;
        
    case GAME_STATE.PLAYING:
        break;
        
    case GAME_STATE.WIN_SCREEN:
        break;
}

staticFrame += 1;