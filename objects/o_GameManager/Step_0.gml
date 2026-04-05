switch (current_state){
	case GAME_STATE.MENU:
	
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