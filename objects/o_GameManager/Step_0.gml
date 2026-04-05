staticFrame += 1;
switch (current_state){
	case GAME_STATE.MENU:
	
		if (keyboard_check_pressed(vk_space)) {
			
			// websocket
            client_socket = network_create_socket(network_socket_ws);
            
            // here we call the server asynchronously, so hte game doesnt freeze
			// 8080 is the port the server will be listening through
            network_connect_raw_async(client_socket, "127.0.0.1", 8080);
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