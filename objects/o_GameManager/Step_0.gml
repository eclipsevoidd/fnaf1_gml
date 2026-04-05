var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var mouse_clicked = mouse_check_button_pressed(mb_left);

switch (current_state){
	case GAME_STATE.MENU:
	
		if (!audio_is_playing(mus_mainRemastered)) {
			audio_play_sound(mus_mainRemastered, 0, true, 0.5);
		}
	
		if (keyboard_check_pressed(vk_space)) {
			client_socket = network_create_socket(network_socket_ws);
			network_connect_raw_async(client_socket, "127.0.0.1", 8080);
			audio_play_sound(snd_blip, 0, false);
			current_state = GAME_STATE.CONNECTING;
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